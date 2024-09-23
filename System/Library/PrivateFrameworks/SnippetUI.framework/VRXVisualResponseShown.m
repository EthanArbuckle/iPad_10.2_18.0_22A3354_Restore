@implementation VRXVisualResponseShown

- (VRXVisualResponseShown)initWithCardData:(id)a3 responseViewId:(id)a4
{
  id v6;
  id v7;
  VRXVisualResponseShown *v8;
  _TtC9SnippetUI21RFVisualResponseShown *v9;
  _TtC9SnippetUI21RFVisualResponseShown *visualResponseShown;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)VRXVisualResponseShown;
  v8 = -[VRXVisualResponseShown init](&v12, sel_init);
  if (v8)
  {
    v9 = -[RFVisualResponseShown initWithCardData:responseViewId:]([_TtC9SnippetUI21RFVisualResponseShown alloc], "initWithCardData:responseViewId:", v6, v7);
    visualResponseShown = v8->_visualResponseShown;
    v8->_visualResponseShown = v9;

  }
  return v8;
}

- (void)emitWithTurnIdentifier:(id)a3
{
  -[RFVisualResponseShown emitWithTurnIdentifier:](self->_visualResponseShown, "emitWithTurnIdentifier:", a3);
}

- (void)emitWithTurnIdentifier:(id)a3 aceViewId:(id)a4
{
  -[RFVisualResponseShown emitWithTurnIdentifier:aceViewId:](self->_visualResponseShown, "emitWithTurnIdentifier:aceViewId:", a3, a4);
}

- (_TtC9SnippetUI21RFVisualResponseShown)visualResponseShown
{
  return (_TtC9SnippetUI21RFVisualResponseShown *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visualResponseShown, 0);
}

@end
