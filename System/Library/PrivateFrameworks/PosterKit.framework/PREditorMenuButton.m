@implementation PREditorMenuButton

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  BSInvalidatable *menuPresentationAssertion;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PREditorMenuButton;
  -[PREditorMenuButton contextMenuInteraction:willEndForConfiguration:animator:](&v7, sel_contextMenuInteraction_willEndForConfiguration_animator_, a3, a4, a5);
  -[BSInvalidatable invalidate](self->_menuPresentationAssertion, "invalidate");
  menuPresentationAssertion = self->_menuPresentationAssertion;
  self->_menuPresentationAssertion = 0;

}

- (void)setMenuPresentationAssertion:(id)a3
{
  BSInvalidatable **p_menuPresentationAssertion;
  id v5;

  p_menuPresentationAssertion = &self->_menuPresentationAssertion;
  v5 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    -[BSInvalidatable invalidate](*p_menuPresentationAssertion, "invalidate");
    objc_storeStrong((id *)p_menuPresentationAssertion, a3);
  }

}

- (BSInvalidatable)menuPresentationAssertion
{
  return self->_menuPresentationAssertion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_menuPresentationAssertion, 0);
}

@end
