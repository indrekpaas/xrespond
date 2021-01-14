React           = require 'react'
Xrespond        = require('../scripts/xrespond')
MessageBusMixin = require '../mixins/message_bus'

module.exports = XrespondSource = React.createClass
  mixins: [ MessageBusMixin ]
  getInitialState: ->
    url: Xrespond.local.attr('url')
  handleSubmit: (e) ->
    e.preventDefault()
    source_value = @refs.source.value.trim()
    @publish 'sourceSubmit', @assert_prefix(source_value)

  assert_prefix: (url) ->
    if url.match(/^http/) or url == '' then url else 'https://' + url

  render: ->
    <form className="source-url__wrap" onSubmit={@handleSubmit}>
      <input className="text-input text-input--medium source-url__text-input" defaultValue={@state.url} placeholder="Enter URL" ref="source" />
      <button className="button button--medium button--primary source-url__button">Load URL</button>
    </form>
