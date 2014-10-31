#|
 This file is a part of Plump
 (c) 2014 Shirakumo http://tymoon.eu (shinmera@tymoon.eu)
 Author: Nicolas Hafner <shinmera@tymoon.eu>
|#

(defpackage #:plump-dom
  (:nicknames #:org.tymoonnext.plump.dom)
  ;; dom.lisp
  (:export
   #:node
   #:nesting-node
   #:children
   #:child-node
   #:parent
   #:root
   #:text-node
   #:text
   #:comment
   #:text
   #:element
   #:tag-name
   #:attributes
   #:doctype
   #:doctype
   #:fulltext-element
   #:xml-header
   #:processing-instruction
   #:cdata
   #:make-child-array
   #:make-attribute-map
   #:make-root
   #:make-element
   #:make-text-node
   #:make-comment
   #:make-doctype
   #:make-fulltext-element
   #:make-xml-header
   #:make-cdata
   #:make-processing-instruction
   #:clear
   #:siblings
   #:family
   #:child-position
   #:append-child
   #:prepend-child
   #:remove-child
   #:replace-child
   #:insert-before
   #:insert-after
   #:clone-children
   #:clone-attributes
   #:clone-node
   #:first-child
   #:last-child
   #:previous-sibling
   #:next-sibling
   #:element-position
   #:child-elements
   #:sibling-elements
   #:family-elements
   #:first-element
   #:last-element
   #:previous-element
   #:next-element
   #:has-child-nodes
   #:attribute
   #:get-attribute
   #:set-attribute
   #:remove-attribute
   #:has-attribute
   #:ge-elements-by-tag-name
   #:get-element-by-id
   #:node-p
   #:element-p
   #:text-node-p
   #:comment-p
   #:root-p
   #:nesting-node-p
   #:fulltext-element-p
   #:*stream*
   #:serialize
   #:serialize-object))

(defpackage #:plump-parser
  (:nicknames #:org.tymoonnext.plump.parser)
  ;; entities.lisp
  (:export
   #:*entity-map*
   #:translate-entity
   #:decode-entities)
  ;; lexer.lisp
  (:export
   #:*string*
   #:*length*
   #:*index*
   #:with-lexer-environment
   #:consume
   #:advance
   #:unread
   #:peek
   #:advance-n
   #:unread-n
   #:consume-until
   #:matcher-character
   #:matcher-string
   #:matcher-range
   #:matcher-find
   #:matcher-or
   #:matcher-and
   #:matcher-not
   #:matcher-next
   #:matcher-prev
   #:matcher-any
   #:make-matcher
   #:define-matcher)
  ;; parser.lisp
  (:export
   #:*root*
   #:read-name
   #:read-text
   #:read-tag-contents
   #:read-children
   #:read-attribute-value
   #:read-attribute-name
   #:read-attribute
   #:read-attributes
   #:read-standard-tag
   #:read-tag
   #:read-root
   #:parse)
  ;; processing.lisp
  (:export
   #:processing-parser
   #:remove-processing-parser
   #:define-processing-parser)
  ;; special-tags.lisp
  (:export
   #:define-self-closing-element
   #:define-fulltext-element)
  ;; tag-dispatcher.lisp
  (:export
   #:*tag-dispatchers*
   #:*xml-tags*
   #:*html-tags*
   #:tag-dispatcher
   #:set-tag-dispatcher
   #:define-tag-dispatcher
   #:remove-tag-dispatcher
   #:do-tag-dispatchers))

(defpackage #:plump
  (:nicknames #:org.tymoonnext.plump)
  (:use #:cl #:plump-dom #:plump-parser))

(in-package #:plump)
(let ((plump (find-package "PLUMP")))
  (do-external-symbols (symb (find-package "PLUMP-PARSER"))
    (export symb plump))
  (do-external-symbols (symb (find-package "PLUMP-DOM"))
    (export symb plump)))
