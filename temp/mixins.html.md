---
title: Mixins
isGeneric: true
---

<h2 class="section-title" id="mixins">Mixins</h2>

### Typography

#### Font Size
Create a fully formed type style (sizing and vertical rhythm) by passing in a single value.
```css
@include font-size(10px);
@include font-size(10px, $line-height: false);
```

### Headings
Style any number of headings in one fell swoop
```
@include headings(1, 3){
	color:#BADA55;
}
```
<hr />

### CSS3

#### Vendor
Create vendor-prefixed CSS in one go
```
@include vendor(border-radius, 4px);
```

#### Keyframes
Create CSS keyframe animations for all vendors in one go
```
.foo{
	@include vendor(animation, shrink 3s);
}

@include keyframe(shrink){
	from{
		font-size:5em;
	}
}
```

#### Truncate
Force overly long spans of text to truncate
```
@include truncate(100%);
```

#### Retina
Media query for targetting retina devices
```
.foo{
	background-image:url(1x.png);
	@include retina(){
		background-image:url(2x.png);
	}
}
```

### CSS Arrows

This mixin creates a CSS arrow on a given element. We can have the arrow
appear in one of 12 locations, thus:

```
      01    02    03
   +------------------+
12 |                  | 04
   |                  |
11 |                  | 05
   |                  |
10 |                  | 06
   +------------------+
      09    08    07
```

You pass this position in along with a desired arrow color and optional
border color, for example:

`@include arrow(top, left, red)`

for just a single, red arrow, or:

`@include arrow(bottom, center, red, black)`

which will create a red triangle with a black border which sits at the bottom
center of the element. Call the mixin thus:

```
.foo{
   background-color:#BADA55;
   border:1px solid #ACE;
   @include arrow(top, left, #BADA55, #ACE);
}
```

#### Media Query Mixin

It’s not great practice to define solid breakpoints up-front, preferring to
modify your design when it needs it, rather than assuming you’ll want a
change at ‘mobile’. However, as inuit.css is required to take a hands off
approach to design decisions, this is the closest we can get to baked-in
responsiveness. It’s flexible enough to allow you to set your own breakpoints
but solid enough to be frameworkified.

We define some broad breakpoints in our vars file that are picked up here
for use in a simple media query mixin. Our options are:

* palm
* lap
* lap-and-up
* portable
* desk
* desk-wide

Not using a media query will, naturally, serve styles to all devices.

`@include media-query(palm){ [styles here] }`
