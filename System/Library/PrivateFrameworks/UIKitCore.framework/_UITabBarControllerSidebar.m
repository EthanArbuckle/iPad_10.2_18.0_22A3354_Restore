@implementation _UITabBarControllerSidebar

- (void)_scrollToHeaderAnimated:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UITabBarControllerSidebar;
  -[UITabBarControllerSidebar _scrollToHeaderAnimated:](&v3, sel__scrollToHeaderAnimated_, a3);
}

- (void)_scrollToTab:(id)a3 atPosition:(unint64_t)a4 animated:(BOOL)a5
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UITabBarControllerSidebar;
  -[UITabBarControllerSidebar _scrollToTab:atPosition:animated:](&v5, sel__scrollToTab_atPosition_animated_, a3, a4, a5);
}

- (BOOL)_isVisible
{
  return self->__visible;
}

- (void)_setVisible:(BOOL)a3
{
  self->__visible = a3;
}

- (BOOL)_isEditable
{
  return self->__editable;
}

- (void)_setEditable:(BOOL)a3
{
  self->__editable = a3;
}

- (BOOL)_isEditing
{
  return self->__editing;
}

- (void)_setEditing:(BOOL)a3
{
  self->__editing = a3;
}

- (NSString)_customizationIdentifier
{
  return self->__customizationIdentifier;
}

- (void)_setCustomizationIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__customizationIdentifier, 0);
}

@end
