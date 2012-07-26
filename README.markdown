SurfWithFriends
=
Put the following code into your favorites bar and have a friend do the same thing. Then, both of you
go to the same site (preferrably non-HTTPS since that causes security problems that I haven't 
solved yet) and click the icon. You should now be able to see each other's mouse and chat with each other
through the provided textareas. To turn it off, just refresh the page

```js
javascript:(function(){
	var idg=document.createElement("script");
	idg.type="text/javascript";
	idg.async=true;
	idg.src="http://crunchymall.com/surfwithfriends.js"
	;var s=document.getElementsByTagName('body')[0];
	s.appendChild(idg, s);
})();
```
