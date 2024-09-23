@implementation TUIFocusItemBox

- (Class)layoutClass
{
  return (Class)objc_opt_class(TUIFocusItemLayout, a2);
}

- (TUIFocusStyle)focusStyle
{
  return self->_focusStyle;
}

- (void)setFocusStyle:(id)a3
{
  objc_storeStrong((id *)&self->_focusStyle, a3);
}

- (TUIElementActionTriggerHandler)actionHandler
{
  return self->_actionHandler;
}

- (void)setActionHandler:(id)a3
{
  objc_storeStrong((id *)&self->_actionHandler, a3);
}

- (NSArray)linkEntities
{
  return self->_linkEntities;
}

- (void)setLinkEntities:(id)a3
{
  objc_storeStrong((id *)&self->_linkEntities, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkEntities, 0);
  objc_storeStrong((id *)&self->_actionHandler, 0);
  objc_storeStrong((id *)&self->_focusStyle, 0);
}

@end
