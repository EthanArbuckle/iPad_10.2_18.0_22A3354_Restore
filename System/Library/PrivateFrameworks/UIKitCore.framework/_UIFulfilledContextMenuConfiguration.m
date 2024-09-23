@implementation _UIFulfilledContextMenuConfiguration

- (BOOL)isPresentable
{
  void *v3;
  unint64_t v4;
  void *v5;

  -[_UIFulfilledContextMenuConfiguration previewViewController](self, "previewViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    LOBYTE(v4) = 1;
  }
  else
  {
    -[_UIFulfilledContextMenuConfiguration menu](self, "menu");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = ((unint64_t)objc_msgSend(v5, "metadata") >> 24) & 1;

  }
  return v4;
}

- (void)setPrimaryInternalIdentifier:(id)a3 secondaryIdentifiers:(id)a4
{
  id v6;
  void *v7;
  NSSet *v8;
  NSSet *internalIdentifiers;
  id v10;

  v10 = a3;
  v6 = a4;
  v7 = v6;
  if (!v10)
  {
    if (!objc_msgSend(v6, "count"))
    {
      v8 = 0;
      goto LABEL_8;
    }
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithObject:");
  v8 = (NSSet *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    if (v8)
    {
      -[NSSet unionSet:](v8, "unionSet:", v7);
      goto LABEL_8;
    }
LABEL_6:
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", v7);
    v8 = (NSSet *)objc_claimAutoreleasedReturnValue();
  }
LABEL_8:
  internalIdentifiers = self->_internalIdentifiers;
  self->_internalIdentifiers = v8;

}

- (BOOL)isMultiItemMenu
{
  return -[_UIFulfilledContextMenuConfiguration representedItemCount](self, "representedItemCount") > 1;
}

- (void)setMenu:(id)a3
{
  UIMenu *v4;
  UIMenu *menu;

  objc_msgSend(a3, "_immutableCopy");
  v4 = (UIMenu *)objc_claimAutoreleasedReturnValue();
  menu = self->_menu;
  self->_menu = v4;

}

- (NSCopying)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSSet)internalIdentifiers
{
  return self->_internalIdentifiers;
}

- (UITargetedPreview)sourcePreview
{
  return self->_sourcePreview;
}

- (void)setSourcePreview:(id)a3
{
  objc_storeStrong((id *)&self->_sourcePreview, a3);
}

- (NSArray)secondarySourcePreviews
{
  return self->_secondarySourcePreviews;
}

- (void)setSecondarySourcePreviews:(id)a3
{
  objc_storeStrong((id *)&self->_secondarySourcePreviews, a3);
}

- (UIViewController)previewViewController
{
  return self->_previewViewController;
}

- (void)setPreviewViewController:(id)a3
{
  objc_storeStrong((id *)&self->_previewViewController, a3);
}

- (NSArray)accessoryViews
{
  return self->_accessoryViews;
}

- (void)setAccessoryViews:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryViews, a3);
}

- (UIMenu)menu
{
  return self->_menu;
}

- (UIAction)previewAction
{
  return self->_previewAction;
}

- (void)setPreviewAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (unint64_t)representedItemCount
{
  return self->_representedItemCount;
}

- (void)setRepresentedItemCount:(unint64_t)a3
{
  self->_representedItemCount = a3;
}

- (unint64_t)badgeCount
{
  return self->_badgeCount;
}

- (void)setBadgeCount:(unint64_t)a3
{
  self->_badgeCount = a3;
}

- (UIResponder)firstResponderTarget
{
  return (UIResponder *)objc_loadWeakRetained((id *)&self->_firstResponderTarget);
}

- (void)setFirstResponderTarget:(id)a3
{
  objc_storeWeak((id *)&self->_firstResponderTarget, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_firstResponderTarget);
  objc_storeStrong((id *)&self->_previewAction, 0);
  objc_storeStrong((id *)&self->_menu, 0);
  objc_storeStrong((id *)&self->_accessoryViews, 0);
  objc_storeStrong((id *)&self->_previewViewController, 0);
  objc_storeStrong((id *)&self->_secondarySourcePreviews, 0);
  objc_storeStrong((id *)&self->_sourcePreview, 0);
  objc_storeStrong((id *)&self->_internalIdentifiers, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
