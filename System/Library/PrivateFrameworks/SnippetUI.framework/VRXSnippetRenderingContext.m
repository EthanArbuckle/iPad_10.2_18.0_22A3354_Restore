@implementation VRXSnippetRenderingContext

- (VRXSnippetRenderingContext)initWithRenderingEvent:(int64_t)a3
{
  VRXSnippetRenderingContext *v4;
  _TtC9SnippetUI25RFSnippetRenderingContext *v5;
  _TtC9SnippetUI25RFSnippetRenderingContext *snippetRenderingContext;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VRXSnippetRenderingContext;
  v4 = -[VRXSnippetRenderingContext init](&v8, sel_init);
  if (v4)
  {
    v5 = -[RFSnippetRenderingContext initWithEvent:]([_TtC9SnippetUI25RFSnippetRenderingContext alloc], "initWithEvent:", a3);
    snippetRenderingContext = v4->_snippetRenderingContext;
    v4->_snippetRenderingContext = v5;

  }
  return v4;
}

- (void)emitWithTurnIdentifier:(id)a3
{
  -[RFSnippetRenderingContext emitWithTurnIdentifier:](self->_snippetRenderingContext, "emitWithTurnIdentifier:", a3);
}

- (void)emitWithTurnIdentifier:(id)a3 aceViewId:(id)a4
{
  -[RFSnippetRenderingContext emitWithTurnIdentifier:aceViewId:](self->_snippetRenderingContext, "emitWithTurnIdentifier:aceViewId:", a3, a4);
}

- (_TtC9SnippetUI25RFSnippetRenderingContext)snippetRenderingContext
{
  return (_TtC9SnippetUI25RFSnippetRenderingContext *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snippetRenderingContext, 0);
}

@end
