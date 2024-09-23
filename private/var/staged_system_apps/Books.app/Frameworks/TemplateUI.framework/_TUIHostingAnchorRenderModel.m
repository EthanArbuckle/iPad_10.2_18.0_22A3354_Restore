@implementation _TUIHostingAnchorRenderModel

- (_TUIHostingAnchorRenderModel)initWithIdentifier:(id)a3 submodel:(id)a4 hostingIdentifier:(id)a5 hostingProperties:(id)a6
{
  id v11;
  id v12;
  _TUIHostingAnchorRenderModel *v13;
  _TUIHostingAnchorRenderModel *v14;
  objc_super v16;

  v11 = a5;
  v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)_TUIHostingAnchorRenderModel;
  v13 = -[TUIRenderModelView initWithReuseIdentifier:identifier:submodel:](&v16, "initWithReuseIdentifier:identifier:submodel:", CFSTR("TUIReuseIdentifierHostingAnchorView"), a3, a4);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_hostingIdentifier, a5);
    objc_storeStrong((id *)&v14->_hostingProperties, a6);
  }

  return v14;
}

- (TUIHostingIdentifier)hostingIdentifier
{
  return self->_hostingIdentifier;
}

- (TUIHostingProperties)hostingProperties
{
  return self->_hostingProperties;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostingProperties, 0);
  objc_storeStrong((id *)&self->_hostingIdentifier, 0);
}

@end
