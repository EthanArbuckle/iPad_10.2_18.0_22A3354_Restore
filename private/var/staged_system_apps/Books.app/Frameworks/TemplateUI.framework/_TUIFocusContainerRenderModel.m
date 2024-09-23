@implementation _TUIFocusContainerRenderModel

- (_TUIFocusContainerRenderModel)initWithIdentifier:(id)a3 submodel:(id)a4 focusStyle:(id)a5 actionHandler:(id)a6 linkEntities:(id)a7
{
  id v13;
  id v14;
  id v15;
  _TUIFocusContainerRenderModel *v16;
  _TUIFocusContainerRenderModel *v17;
  objc_super v19;

  v13 = a5;
  v14 = a6;
  v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)_TUIFocusContainerRenderModel;
  v16 = -[TUIRenderModelView initWithReuseIdentifier:identifier:submodel:](&v19, "initWithReuseIdentifier:identifier:submodel:", CFSTR("TUIReuseIdentifierFocusContainerView"), a3, a4);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_focusStyle, a5);
    objc_storeStrong((id *)&v17->_actionHandler, a6);
    objc_storeStrong((id *)&v17->_linkEntities, a7);
  }

  return v17;
}

- (TUIFocusStyle)focusStyle
{
  return self->_focusStyle;
}

- (TUIElementActionTriggerHandler)actionHandler
{
  return self->_actionHandler;
}

- (NSArray)linkEntities
{
  return self->_linkEntities;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkEntities, 0);
  objc_storeStrong((id *)&self->_actionHandler, 0);
  objc_storeStrong((id *)&self->_focusStyle, 0);
}

@end
