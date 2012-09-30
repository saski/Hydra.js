
<aside id="toc">
<nav>
	<div id="toc_title">
		Table of Contents
	</div>
	<ul>
		<li>
			<a href="#quickstart">
				Quickstart
			</a>
		</li>
		<li>
			<a href="#whatshydra">
				What's Hydra.js?
			</a>
		</li>
		<li>
			<a href="#meaningmodulararquitecture">
				That we mean when we talk about modular architecture?
			</a>
		</li>
		<li>
			<a href="#howtoinstall">
				How to install Hydra.js.
			</a>
		</li>
		<li>
			<a href="#installadapter">
				How to install an adapter extension for your base framework.
			</a>
		</li>
		<li>
			<a href="#createadapter">
				I can't find an adapter for my base framework.
			</a>
		</li>
		<li>
			<a href="#changebaseframework">
				How to change of base framework without change my code.
			</a>
		</li>
		<li>
			<a href="#modules">
				Modules.
			</a>
		</li>
		<li>
			<a href="#createmodule">
				How to create a module.
			</a>
		</li>
		<li>
			<a href="#registermodule">
				Register a module.
			</a>
		</li>
		<li>
			<a href="#communicatemodules">
				How to use events to communicate between modules.
			</a>
		</li>
		<li>
			<a href="#startmodule">
				Start a module.
			</a>
		</li>
		<li>
			<a href="#stopmodule">
				Stop a module.
			</a>
		</li>
	</ul>
</nav>
</aside>
<div id="doc_content">
<div>
<h2 id="quickstart">
	Quickstart
</h2>
<div>
	<h3 id="whatshydra">
		What's Hydra.js?
	</h3>
	<p>
		Hydra.js is a module oriented and event driven architecture.
	</p>
	<p>
	<h4>Motivations</h4>
	<ul id="motivations">
		<li>
			Avoid rewriting my Javascript code each time I changed the base framework.
		</li>
		<li>
			Avoid to broke my apps by the most little error.
		</li>
		<li>
			Wait to start working on some feature because dependencies with other fellow work.
		</li>
	</ul>
	<h4>Solved</h4>
	<ul id="solutions">
		<li>
			Decouple the base framework from my code using an adapter where I'll use the same code independently of what base framework I'm using.
		</li>
		<li>
			When deploying my apps to production environment all the errors are catched to avoid broke anything.
		</li>
		<li>
			All the logic of my apps is inside modules that can communicate with other modules through events.
		</li>
	</ul>
</div>
<p>
	Hydra.js is based in one presentation from Nicholas Zakas <a href="http://www.slideshare.net/nzakas/scalable-javascript-application-architecture"><strong>'Scalable Javascript Application Architecture'</strong></a> where he explains how to create an architecture to make your application more robust and less prone to fail.
</p>
<p>
	Hydra.js architecture can be divided in two different parts.
</p>
<ul id="arch_parts">
	<li>
		<strong>Manager:</strong><span>Manage the modules that are registered in your application.</span>
	</li>
	<li>
		<strong>Mediator:</strong><span>Manage the communication between modules when events are launched.</span>
	</li>
</ul>
<p>
	Hydra.js architecture is framework agnostic, this means that is not relevant what type of base framework you're using in your application.
</p>
<p class="center_content">
	<a href="images/basic_architecture.png" target="_blank">
		<img src="images/basic_architecture_small.png" width="500" height="400"/>
	</a>
</p>
</div>
<div>
<h3 id="meaningmodulararquitecture">That we mean when we talk about modular architecture?</h3>
<p>
	A modular architecture is an architecture where all the code is written in modules and this have some big improvements when developing any app.
</p>
<h4>What is a module?</h4>
<p>
	A module is a reusable part of code that has a single responsibility and that doesn't need to know about the existence of other modules.
</p>
<h4>Improvements</h4>
<ul id="improvements">
	<li>
		Improve productivity because you can work in parallel with other fellows even if you are not working in the same office.
	</li>
	<li>
		The communication between modules is transparent for you and any module can be added to the system without having to change code.
	</li>
</ul>
<div class="tip">
	Tip: To get the most of Hydra.js remember to use an abstraction adapter for your base framework.
</div>
</div>
<div>
<h3 id="howtoinstall">How to install Hydra.js?</h3>
<p>
	To install Hydra.js in your app you must download the version you need or use our hosted <a href="https://raw.github.com/tcorral/Hydra.js/master/src/Hydra.js">version</a> and import it using this code snippet...
</p>
<div>
	<pre><code class="language-javascript">&lt;script type=&quot;text/javascript&quot; src=&quot;path/to/Hydra.js&quot;&gt;&lt;/script&gt;</code></pre>
</div>
</div>
<div>
<h3 id="installadapter">How to install an adapter extension for your base framework?</h3>
<p>
	If you want to get the most of Hydra.js you must add an adapter for your base framework. An adapter is and must be divided in:
</p>
<ul>
	<li>
		DOM
	</li>
	<li>
		Ajax
	</li>
	<li>
		Events
	</li>
</ul>
<div class="tip">
	Tip: Hydra.js has adapters for jQuery and Prototype.js. See <a href="#extensions">extensions section</a>.
</div>
<p>
	This is the public API that you could use with adapters:
</p>
<ul>
	<li>
		Hydra.<strong>dom</strong>
		<ul>
			<li>
				<strong>byId</strong> - Return a Node element by id.
			</li>
			<li>
				<strong>byClassName</strong> - Return a NodeList by a class name.
			</li>
			<li>
				<strong>byTagName</strong> - Return a NodeList by a tag name.
			</li>
			<li>
				<strong>byCssSelector</strong> - Return a Nodelist that matches the CSS selector.
			</li>
		</ul>
	</li>
</ul>
<ul>
	<li>
		Hydra.<strong>events</strong><br>
		<ul>
			<li>
				<strong>bind</strong> - Binds an event to one element.
			</li>
			<li>
				<strong>trigger</strong> - Triggers an event
			</li>
			<li>
				<strong>unbind</strong> - Unbinds an event from one element
			</li>
		</ul>
	</li>
</ul>
<ul>
	<li>
		Hydra.<strong>ajax</strong>
		<ul>
			<li>
				<strong>call</strong> - Makes an ajax call totally configurable.
			</li>
			<li>
				<strong>getJSON</strong> - Makes an ajax call that expects to retrieve a JSON object.
			</li>
			<li>
				<strong>getScript</strong> - Makes a call to get a script and to evaluate it in the page.
			</li>
			<li>
				<strong>jsonP</strong> - Makes a JSONP call to a different domain server.
			</li>
		</ul>
	</li>
</ul>
<div>
	Example of using all the adapters for jQuery:
</div>
<div>
	<pre><code class="language-javascript">&lt;script type=&quot;text/javascript&quot; src=&quot;path/to/jQuery/src/DOM.js&quot;&gt;&lt;/script&gt;
&lt;script type=&quot;text/javascript&quot; src=&quot;path/to/jQuery/src/Events.js&quot;&gt;&lt;/script&gt;
&lt;script type=&quot;text/javascript&quot; src=&quot;path/to/jQuery/src/Ajax.js&quot;&gt;&lt;/script&gt;</code></pre>
</div>
</div>
<div>
<h3 id="createadapter">I can't find an adapter for my base framework.</h3>
<p>
	If you don't found an adapter for your base framework in <a href="#extensions">extensions section</a> feel free to write your own and make a pull request, to add it to the extensions repository, to be used for the community. <a href="https://github.com/tcorral/Hydra_Extensions/tree/master/jQuery/src">Example</a>
</p>
<p>
	This is the public API that any developer will expect from your adapter...
</p>
<ul>
	<li>
		Hydra.<strong>dom</strong>
		<ul>
			<li>
				<strong>byId</strong> - Must return a Node element by id.
			</li>
			<li>
				<strong>byClassName</strong> - Must return a NodeList by class name.
			</li>
			<li>
				<strong>byTagName</strong> - Must return a NodeList by a tag name.
			</li>
			<li>
				<strong>byCssSelector</strong> - Must return a NodeList that matches the CSS selector.
			</li>
		</ul>
	</li>
</ul>
<ul>
	<li>
		Hydra.<strong>events</strong><br>
		<ul>
			<li>
				<strong>bind</strong> - Must bind an event to one element.
			</li>
			<li>
				<strong>trigger</strong> - Must trigger an event.
			</li>
			<li>
				<strong>unbind</strong> - Must unbind an event from one element
			</li>
		</ul>
	</li>
</ul>
<ul>
	<li>
		Hydra.<strong>ajax</strong>
		<ul>
			<li>
				<strong>call</strong> - Must make an ajax call totally configurable.
			</li>
			<li>
				<strong>getJSON</strong> - Must make an ajax call that expects to retrieve a JSON object.
			</li>
			<li>
				<strong>getScript</strong> - Must make a call to get a script and to evaluate it in the page.
			</li>
			<li>
				<strong>jsonP</strong> - Must make a JSONP call to a different domain server.
			</li>
		</ul>
	</li>
</ul>
</div>
<div>
<h3 id="changebaseframework">How to change of base framework without change my code.</h3>
<p>
	If you need to change your base framework during your development process to could change it without pain if you read the last sections where you can see how base frameworks Hydra.js adapters could help you and what modules you can use in your modules code.
</p>
</div>
<div>
<h3 id="modules">Modules</h3>
<p>Hydra.js is a module oriented and event driven architecture. This section talks about the modules and how them works.</p>
<p>
	A module could be of two different types:
</p>
<ul>
	<li>
		Logic: Used to manage flow controls or that doesn't needs to be tied to the Browser
	</li>
	<li>
		Visual: Used in web applications and that hijack some parts of the web page.
	</li>
</ul>
</div>
<div>
<h4 id="createmodule">How to create a module.</h4>
<p class="h4">Hydra.js modules use the <a href="http://blog.alexanderdickson.com/javascript-revealing-module-pattern">module revealing</a> pattern.</p>
<p class="h4">
	Sample of module with the minimum required:
</p>
<div>
	<pre><code class="language-javascript">function(action){
	return {
		init: function(){
			// Code that will be executed when this module is started.
		}
	};
}</code></pre>
</div>
</div>
<div>
<h4 id="registermodule">Register a module.</h4>
<p class="h4">
	To add a module to the manager in Hydra.js you need to register it.
</p>
<p class="h4">
	Sample of register a module:
</p>
<div>
	<pre><code class="language-javascript">Hydra.module.register('my-fist-module', function(action){
	return {
		init: function(){
			// Code that will be executed when this module is started.
		}
	};
});</code></pre>
</div>
</div>
<div>
<h4 id="communicatemodules">How to use events to communicate between modules.</h4>
<p class="h4">
	All the modules know about it's existence but not about the existence of other modules. This section explains how to use events to allow communication between modules using events that will be managed by Hydra.js Mediator.
</p>
<h5>Start listening events:</h5>
<p class="h5">
	To start listening events the only thing you will need is to add an oEventsCallbacks object, the keys of this object must match with the name of the event we want to listen, the values must be the callbacks to be executed when the event is triggered.
</p>
<div class="tip">
	Tip: The context object <em>(this)</em> of events callback will be the module itself.
</div>
<div>
	<pre><code class="language-javascript">Hydra.module.register('my-first-module', function(action){
	return {
		oEventsCallbacks: {
			'user-clicks-button': function (oNotify) {
				this._logClick(oNotify.sButtonType);
			}
		},
		_logClick: function(sButtonType) {
			console.log("User clicked a ' + sButtonType + ' button");
		},
		init: function() {
			// Code that will be executed when this module is started.
		}
	};
});</code></pre>
</div>
<h5>Triggering an event:</h5>
<p class="h5">
	When a module needs to communicate with other modules, it must use events to trigger actions in other modules that are listening these actions.
</p>
<p class="h5">
	To trigger an event you will need to use the 'action' object (is passed as argument of the closure) that is an instance of the Mediator object that manage the communication between modules.
</p>
<div>
	<pre><code class="language-javascript">Hydra.module.register('my-second-module', function(action){
	return {
		setButtonBehaviour: function()
		{
			// When the button is clicked it triggers the 'user-clicks-button' event that will
			// execute the callbacks defined for this event in other modules if some of them is
			// listening the event.
			Hydra.events.bind(document.getElementById("button"), function() {
				action.notify({
					type: 'user-clicks-button',
					sButtonType: this.getAttribute("data-button")
				});
			});
		},
		init: function(){
			this.setButtonBehaviour();
		},
	};
});</code></pre>
</div>
</div>
<div>
<h3 id="startmodule">Start a module.</h3>
<p>
	Now that you know how to create and register a module to the system, now you will learn how to start it. <br>
	Hydra.js is a multi-instance module system this is the reason because you will need to add a single identifier for the instance of the module to be started.
</p>
<div>
	When a module is started it follows the next process:
</div>
<ol>
	<li>
		Checks all the events to be listened in the module and starts listening them.
	</li>
	<li>
		If debug mode is not active all the methods in module are wrapped to avoid it make fail all the application because a little error.
	</li>
	<li>
		Creates an instance of the module.
	</li>
	<li>
		Executes the init method inside of module.
	</li>
</ol>
<div>
	<strong>Sample of simple start module:</strong>
</div>
<div>
	<pre><code class="language-javascript">Hydra.module.start('my-first-module', 'my-instance');</code></pre>
</div>
<div class="tip">
	Tip: Start method accept params if you pass anything as third parameter, this will be passed arguments in the init method
</div>
<div>
	<strong>Sample of simple start module with params:</strong>
</div>
<div>
	Sample of Module with init that needs params.
</div>
<div>
	<pre><code class="language-javascript">Hydra.module.register('my-first-module', function(action) {
	return {
		init: function(data) {
			alert(data.hello);
		}
	};
});

Hydra.module.start('my-first-module', 'my-instance', { hello: 'hello world!' });</code></pre>
</div>
</div>
<div>
<h3 id="stopmodule">Stop a module.</h3>
<p>
	When a module has no sense in any view (normally in single page applications) you can stop it to avoid continue listening events.
</p>
<div class="tip">
	Tip: If you something more that just remove listeners you can use the 'onDestroy' method where you could remove some expensive resource as web workers or drivers to access NoSQL databases.
</div>
<div>
	<pre><code class="language-javascript">Hydra.module.stop('my-first-module', 'my-instance'); </code></pre>
</div>
</div>
</div>