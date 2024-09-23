@implementation UIContextMenuConfiguration

- (BOOL)_isCollectionViewBackgroundMenu
{
  void *v3;
  char isKindOfClass;
  void *v5;
  char v6;

  -[UIContextMenuConfiguration _internalIdentifier](self, "_internalIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
    return 0;
  -[UIContextMenuConfiguration _internalIdentifier](self, "_internalIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.UIKit.UICollectionView.backgroundMenu"));

  return v6;
}

+ (UIContextMenuConfiguration)configurationWithIdentifier:(id)identifier previewProvider:(UIContextMenuContentPreviewProvider)previewProvider actionProvider:(UIContextMenuActionProvider)actionProvider
{
  UIContextMenuActionProvider v7;
  UIContextMenuContentPreviewProvider v8;
  id v9;
  void *v10;

  v7 = actionProvider;
  v8 = previewProvider;
  v9 = identifier;
  v10 = (void *)objc_opt_new();
  objc_msgSend(v10, "setIdentifier:", v9);

  objc_msgSend(v10, "setPreviewProvider:", v8);
  objc_msgSend(v10, "setActionProvider:", v7);

  return (UIContextMenuConfiguration *)v10;
}

- (UIContextMenuConfiguration)init
{
  UIContextMenuConfiguration *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIContextMenuConfiguration;
  result = -[UIContextMenuConfiguration init](&v3, sel_init);
  if (result)
    result->_badgeCount = 0x7FFFFFFFFFFFFFFFLL;
  return result;
}

- (id)identifier
{
  NSCopying *identifier;
  NSCopying *v4;
  NSCopying *v5;

  identifier = self->_identifier;
  if (!identifier)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v4 = (NSCopying *)objc_claimAutoreleasedReturnValue();
    v5 = self->_identifier;
    self->_identifier = v4;

    identifier = self->_identifier;
  }
  return identifier;
}

- (BOOL)_clientDidSetBadgeCount
{
  return -[UIContextMenuConfiguration badgeCount](self, "badgeCount") != 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)_isMultiItemMenu
{
  void *v2;
  BOOL v3;

  -[UIContextMenuConfiguration _effectiveSecondaryItemIdentifiers](self, "_effectiveSecondaryItemIdentifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (id)_effectiveInternalIdentifier
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[UIContextMenuConfiguration _internalIdentifier](self, "_internalIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[UIContextMenuConfiguration identifier](self, "identifier");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (NSSet)_effectiveSecondaryItemIdentifiers
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[UIContextMenuConfiguration _internalSecondaryItemIdentifiers](self, "_internalSecondaryItemIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[UIContextMenuConfiguration secondaryItemIdentifiers](self, "secondaryItemIdentifiers");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return (NSSet *)v6;
}

- (void)_prepareWithCompletion:(id)a3
{
  (*((void (**)(id, UIContextMenuConfiguration *))a3 + 2))(a3, self);
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSSet)secondaryItemIdentifiers
{
  return self->_secondaryItemIdentifiers;
}

- (void)setSecondaryItemIdentifiers:(NSSet *)secondaryItemIdentifiers
{
  objc_setProperty_nonatomic_copy(self, a2, secondaryItemIdentifiers, 24);
}

- (NSInteger)badgeCount
{
  return self->_badgeCount;
}

- (void)setBadgeCount:(NSInteger)badgeCount
{
  self->_badgeCount = badgeCount;
}

- (UIContextMenuConfigurationElementOrder)preferredMenuElementOrder
{
  return self->_preferredMenuElementOrder;
}

- (void)setPreferredMenuElementOrder:(UIContextMenuConfigurationElementOrder)preferredMenuElementOrder
{
  self->_preferredMenuElementOrder = preferredMenuElementOrder;
}

- (id)previewProvider
{
  return self->_previewProvider;
}

- (void)setPreviewProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (id)actionProvider
{
  return self->_actionProvider;
}

- (void)setActionProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (UIResponder)firstResponderTarget
{
  return (UIResponder *)objc_loadWeakRetained((id *)&self->_firstResponderTarget);
}

- (void)setFirstResponderTarget:(id)a3
{
  objc_storeWeak((id *)&self->_firstResponderTarget, a3);
}

- (UITargetedPreview)_primarySourcePreview
{
  return self->__primarySourcePreview;
}

- (void)set_primarySourcePreview:(id)a3
{
  objc_storeStrong((id *)&self->__primarySourcePreview, a3);
}

- (NSArray)_secondarySourcePreviews
{
  return self->__secondarySourcePreviews;
}

- (void)set_secondarySourcePreviews:(id)a3
{
  objc_storeStrong((id *)&self->__secondarySourcePreviews, a3);
}

- (id)_internalIdentifier
{
  return self->__internalIdentifier;
}

- (void)set_internalIdentifier:(id)a3
{
  objc_storeStrong(&self->__internalIdentifier, a3);
}

- (NSSet)_internalSecondaryItemIdentifiers
{
  return self->__internalSecondaryItemIdentifiers;
}

- (void)set_internalSecondaryItemIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->__internalSecondaryItemIdentifiers, a3);
}

- (BOOL)prefersHorizontalAttachment
{
  return self->_prefersHorizontalAttachment;
}

- (int64_t)preferredMenuAlignment
{
  return self->_preferredMenuAlignment;
}

- (void)setPreferredMenuAlignment:(int64_t)a3
{
  self->_preferredMenuAlignment = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__internalSecondaryItemIdentifiers, 0);
  objc_storeStrong(&self->__internalIdentifier, 0);
  objc_storeStrong((id *)&self->__secondarySourcePreviews, 0);
  objc_storeStrong((id *)&self->__primarySourcePreview, 0);
  objc_destroyWeak((id *)&self->_firstResponderTarget);
  objc_storeStrong(&self->_actionProvider, 0);
  objc_storeStrong(&self->_previewProvider, 0);
  objc_storeStrong((id *)&self->_secondaryItemIdentifiers, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (UITab)_tab
{
  return (UITab *)objc_getAssociatedObject(self, &_UITabContextMenuIdentifier);
}

- (void)_setTab:(id)a3
{
  objc_setAssociatedObject(self, &_UITabContextMenuIdentifier, a3, (void *)1);
}

@end
