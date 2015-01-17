package flash.events;

extern class Event {
	var bubbles(default,null) : Bool;
	var cancelable(default,null) : Bool;
	var currentTarget(default,null) : Dynamic;
	var eventPhase(default,null) : EventPhase;
	var target(default,null) : Dynamic;
	var type(default,null) : String;
	function new(type : String, bubbles : Bool = false, cancelable : Bool = false) : Void;
	function clone() : Event;
	function formatToString(className : String, ?p1 : Dynamic, ?p2 : Dynamic, ?p3 : Dynamic, ?p4 : Dynamic, ?p5 : Dynamic) : String;
	function isDefaultPrevented() : Bool;
	function preventDefault() : Void;
	function stopImmediatePropagation() : Void;
	function stopPropagation() : Void;
	function toString() : String;
	static var ACTIVATE : String;
	static var ADDED : String;
	static var ADDED_TO_STAGE : String;
	static var CANCEL : String;
	static var CHANGE : String;
	static var CHANNEL_MESSAGE : String;
	static var CHANNEL_STATE : String;
	@:require(flash10) static var CLEAR : String;
	static var CLOSE : String;
	static var COMPLETE : String;
	static var CONNECT : String;
	@:require(flash10) static var COPY : String;
	@:require(flash10) static var CUT : String;
	static var DEACTIVATE : String;
	static var ENTER_FRAME : String;
	@:require(flash10) static var EXIT_FRAME : String;
	@:require(flash10) static var FRAME_CONSTRUCTED : String;
	static var FULLSCREEN : String;
	static var ID3 : String;
	static var INIT : String;
	static var MOUSE_LEAVE : String;
	static var OPEN : String;
	@:require(flash10) static var PASTE : String;
	static var REMOVED : String;
	static var REMOVED_FROM_STAGE : String;
	static var RENDER : String;
	static var RESIZE : String;
	static var SCROLL : String;
	static var SELECT : String;
	@:require(flash10) static var SELECT_ALL : String;
	static var SOUND_COMPLETE : String;
	static var TAB_CHILDREN_CHANGE : String;
	static var TAB_ENABLED_CHANGE : String;
	static var TAB_INDEX_CHANGE : String;
	static var UNLOAD : String;
	static var VIDEO_FRAME : String;
	static var WORKER_STATE : String;
}
