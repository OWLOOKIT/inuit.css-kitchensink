# The DocPad Configuration File
# It is simply a CoffeeScript Object which is parsed by CSON
docpadConfig = {

	# Change the port DocPad uses from the default 9778 to 8081
	port: 9778

	# =================================
	# Template Data
	# These are variables that will be accessible via our templates
	# To access one of these within our templates, refer to the FAQ: https://github.com/bevry/docpad/wiki/FAQ

	templateData:

		# Specify some site properties
		site:
			# The production url of our website
			url: "http://terabyte.co.nz"

			# Here are some old site urls that you would like to redirect from
			oldUrls: [
				'www.website.com',
				'website.herokuapp.com'
			]

			# The default title of our website
			title: "inuit.css Kitchen Sink"

			# The website description (for SEO)
			description: """
				Full itinerary of components from the inuit.css framework.
				"""

			# The website keywords (for SEO) separated by commas
			keywords: """
				inuit.css, css, framework, kitchen sink, ui, pattern library
				"""

			# The website author's name
			author: "Pat O'Callaghan"

			# The website author's email
			email: "pat@terabyte.co.nz"



		# -----------------------------
		# Helper Functions

		# Get the prepared site/document title
		# Often we would like to specify particular formatting to our page's title
		# we can apply that formatting here
		getPreparedTitle: ->
			# if we have a document title, then we should use that and suffix the site's title onto it
			if @document.title
				"#{@document.title} | #{@site.title}"
			# if our document does not have it's own title, then we should just use the site's title
			else
				@site.title

		# Get the prepared site/document description
		getPreparedDescription: ->
			# if we have a document description, then we should use that, otherwise use the site's description
			@document.description or @site.description

		# Get the prepared site/document keywords
		getPreparedKeywords: ->
			# Merge the document keywords with the site keywords
			@site.keywords.concat(@document.keywords or []).join(', ')


	# =================================
	# Collections
	# These are special collections that our website makes available to us

	collections:

		objects: ->
			@getCollection('html').findAllLive(isObject:true, partial:true)

		generics: ->
			@getCollection('html').findAllLive(isGeneric:true, partial:true)

		 bases: ->
			@getCollection('html').findAllLive(isBase:true, partial:true)

	# =================================
	# DocPad Events

	# Here we can define handlers for events that DocPad fires
	# You can find a full listing of events on the DocPad Wiki
	events:

		# Server Extend
		# Used to add our own custom routes to the server before the docpad routes are added
		serverExtend: (opts) ->
			# Extract the server from the options
			{server} = opts
			docpad = @docpad

			# As we are now running in an event,
			# ensure we are using the latest copy of the docpad configuraiton
			# and fetch our urls from it
			latestConfig = docpad.getConfig()
			oldUrls = latestConfig.templateData.site.oldUrls or []
			newUrl = latestConfig.templateData.site.url

			# Redirect any requests accessing one of our sites oldUrls to the new site url
			server.use (req,res,next) ->
				if req.headers.host in oldUrls
					res.redirect(newUrl+req.url, 301)
				else
					next()

	# =================================
	# DocPad Plugins
	plugins:
		marked:
			markedOptions:
				# Turn off sanitisation so we can embed HTML inside our markdown files
				sanitize: false

		# sass:
		   # sassPath: 'c:/Ruby193/bin/sass.bat'
		   # scssPath: 'c:/Ruby193/bin/scss.bat'
		   # compass: true
}


# Export our DocPad Configuration
module.exports = docpadConfig
