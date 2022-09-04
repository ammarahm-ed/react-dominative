diff --git a/node_modules/react-dom/cjs/react-dom.development.js b/node_modules/react-dom/cjs/react-dom.development.js
index 1567c1f..f8616b1 100644
--- a/node_modules/react-dom/cjs/react-dom.development.js
+++ b/node_modules/react-dom/cjs/react-dom.development.js
@@ -5480,12 +5480,12 @@ var validateProperty$1 = function () {};
         return true;
       }
 
-      if (EVENT_NAME_REGEX.test(name)) {
-        error('Unknown event handler property `%s`. It will be ignored.', name);
+      // if (EVENT_NAME_REGEX.test(name)) {
+      //   error('Unknown event handler property `%s`. It will be ignored.', name);
 
-        warnedProperties$1[name] = true;
-        return true;
-      }
+      //   warnedProperties$1[name] = true;
+      //   return true;
+      // }
     } else if (EVENT_NAME_REGEX.test(name)) {
       // If no event plugins have been injected, we are in a server environment.
       // So we can't tell if the event name is correct for sure, but we can filter
@@ -5543,15 +5543,17 @@ var validateProperty$1 = function () {};
         warnedProperties$1[name] = true;
         return true;
       }
-    } else if (!isReserved && name !== lowerCasedName) {
-      // Unknown attributes should have lowercase casing since that's how they
-      // will be cased anyway with server rendering.
-      error('React does not recognize the `%s` prop on a DOM element. If you ' + 'intentionally want it to appear in the DOM as a custom ' + 'attribute, spell it as lowercase `%s` instead. ' + 'If you accidentally passed it from a parent component, remove ' + 'it from the DOM element.', name, lowerCasedName);
-
-      warnedProperties$1[name] = true;
-      return true;
     } 
     
+    // else if (!isReserved && name !== lowerCasedName) {
+    //   // Unknown attributes should have lowercase casing since that's how they
+    //   // will be cased anyway with server rendering.
+    //   error('React does not recognize the `%s` prop on a DOM element. If you ' + 'intentionally want it to appear in the DOM as a custom ' + 'attribute, spell it as lowercase `%s` instead. ' + 'If you accidentally passed it from a parent component, remove ' + 'it from the DOM element.', name, lowerCasedName);
+
+    //   warnedProperties$1[name] = true;
+    //   return true;
+    // }
+
     if (typeof value === 'boolean' && shouldRemoveAttributeWithWarning(name, value, propertyInfo, false)) {
       if (value) {
         error('Received `%s` for a non-boolean attribute `%s`.\n\n' + 'If you want to write it to the DOM, pass a string instead: ' + '%s="%s" or %s={value.toString()}.', value, name, name, value, name);
@@ -5612,6 +5614,7 @@ var warnUnknownProperties = function (type, props, canUseEventSystem) {
 };
 
 function validateProperties$2(type, props, canUseEventSystem) {
+  return;
   if (isCustomComponent(type, props)) {
     return;
   }
@@ -5855,7 +5858,7 @@ function createElement(type, props, rootContainerElement, parentNamespace) {
   var isCustomComponentTag; // We create tags in the namespace of their parent container, except HTML
   // tags get no namespace.
 
-  var ownerDocument = getOwnerDocumentFromRootContainer(rootContainerElement);
+  var ownerDocument = document;
   var domElement;
   var namespaceURI = parentNamespace;
 
@@ -6938,15 +6941,15 @@ function getActiveElementDeep() {
   var win = window;
   var element = getActiveElement();
 
-  while (element instanceof win.HTMLIFrameElement) {
-    if (isSameOriginFrame(element)) {
-      win = element.contentWindow;
-    } else {
-      return element;
-    }
+  // while (element instanceof win.HTMLIFrameElement) {
+  //   if (isSameOriginFrame(element)) {
+  //     win = element.contentWindow;
+  //   } else {
+  //     return element;
+  //   }
 
-    element = getActiveElement(win.document);
-  }
+  //   element = getActiveElement(win.document);
+  // }
 
   return element;
 }
