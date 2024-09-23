@implementation _TUIHoverVisibleRenderModel

- (_TUIHoverVisibleRenderModel)initWithIdentifier:(id)a3 submodel:(id)a4 hoverIdentifier:(id)a5
{
  id v9;
  _TUIHoverVisibleRenderModel *v10;
  _TUIHoverVisibleRenderModel *v11;
  objc_super v13;

  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)_TUIHoverVisibleRenderModel;
  v10 = -[TUIRenderModelView initWithReuseIdentifier:identifier:submodel:](&v13, "initWithReuseIdentifier:identifier:submodel:", CFSTR("TUIReuseIdentifierHoverVisibleView"), a3, a4);
  v11 = v10;
  if (v10)
    objc_storeStrong((id *)&v10->_hoverIdentifier, a5);

  return v11;
}

- (TUIHoverIdentifier)hoverIdentifier
{
  return self->_hoverIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hoverIdentifier, 0);
}

@end
