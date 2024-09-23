@implementation TUINavigationBarItemBox

- (Class)layoutClass
{
  return (Class)objc_opt_class(TUINavigationBarItemLayout, a2);
}

- (unint64_t)role
{
  return 4;
}

- (void)setMenuContainer:(id)a3
{
  TUIMenuContainer *v5;
  TUIMenuContainer *menuContainer;
  TUIMenuContainer *v7;

  v5 = (TUIMenuContainer *)a3;
  menuContainer = self->_menuContainer;
  if (menuContainer != v5)
  {
    v7 = v5;
    -[TUIMenuContainer setParentModel:](menuContainer, "setParentModel:", 0);
    objc_storeStrong((id *)&self->_menuContainer, a3);
    -[TUIMenuContainer setParentModel:](self->_menuContainer, "setParentModel:", self);
    v5 = v7;
  }

}

- (NSDictionary)stateMap
{
  return self->_stateMap;
}

- (void)setStateMap:(id)a3
{
  objc_storeStrong((id *)&self->_stateMap, a3);
}

- (TUIElementActionTriggerHandler)actionHandler
{
  return self->_actionHandler;
}

- (void)setActionHandler:(id)a3
{
  objc_storeStrong((id *)&self->_actionHandler, a3);
}

- (unint64_t)observeTriggerValue
{
  return self->_observeTriggerValue;
}

- (void)setObserveTriggerValue:(unint64_t)a3
{
  self->_observeTriggerValue = a3;
}

- (unint64_t)itemType
{
  return self->_itemType;
}

- (void)setItemType:(unint64_t)a3
{
  self->_itemType = a3;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSAttributedString)attributedTitle
{
  return self->_attributedTitle;
}

- (void)setAttributedTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (unint64_t)buttonType
{
  return self->_buttonType;
}

- (void)setButtonType:(unint64_t)a3
{
  self->_buttonType = a3;
}

- (unint64_t)buttonRole
{
  return self->_buttonRole;
}

- (void)setButtonRole:(unint64_t)a3
{
  self->_buttonRole = a3;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (int64_t)searchTextMaxLength
{
  return self->_searchTextMaxLength;
}

- (void)setSearchTextMaxLength:(int64_t)a3
{
  self->_searchTextMaxLength = a3;
}

- (NSAttributedString)placeholderText
{
  return self->_placeholderText;
}

- (void)setPlaceholderText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSString)observeTrigger
{
  return self->_observeTrigger;
}

- (void)setObserveTrigger:(id)a3
{
  objc_storeStrong((id *)&self->_observeTrigger, a3);
}

- (BOOL)ignoreInsetsForOpacityTrigger
{
  return self->_ignoreInsetsForOpacityTrigger;
}

- (void)setIgnoreInsetsForOpacityTrigger:(BOOL)a3
{
  self->_ignoreInsetsForOpacityTrigger = a3;
}

- (double)navigationBarBackgroundOpacity
{
  return self->_navigationBarBackgroundOpacity;
}

- (void)setNavigationBarBackgroundOpacity:(double)a3
{
  self->_navigationBarBackgroundOpacity = a3;
}

- (TUIMenuContainer)menuContainer
{
  return self->_menuContainer;
}

- (BOOL)menuIsPrimary
{
  return self->_menuIsPrimary;
}

- (void)setMenuIsPrimary:(BOOL)a3
{
  self->_menuIsPrimary = a3;
}

- (NSArray)hostingIdentifiers
{
  return self->_hostingIdentifiers;
}

- (void)setHostingIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (NSArray)hostingProperties
{
  return self->_hostingProperties;
}

- (void)setHostingProperties:(id)a3
{
  objc_storeStrong((id *)&self->_hostingProperties, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostingProperties, 0);
  objc_storeStrong((id *)&self->_hostingIdentifiers, 0);
  objc_storeStrong((id *)&self->_menuContainer, 0);
  objc_storeStrong((id *)&self->_observeTrigger, 0);
  objc_storeStrong((id *)&self->_placeholderText, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_attributedTitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_actionHandler, 0);
  objc_storeStrong((id *)&self->_stateMap, 0);
}

@end
