@implementation SearchUIContactsThumbnailView

+ (void)clearAvatarSettings
{
  void *v2;

  v2 = (void *)avatarViewControllerSettings;
  avatarViewControllerSettings = 0;

}

+ (id)avatarSettings
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v2 = (void *)avatarViewControllerSettings;
  if (!avatarViewControllerSettings)
  {
    v3 = (void *)MEMORY[0x1E0C97480];
    +[SearchUIContactCache sharedCache](SearchUIContactCache, "sharedCache");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contactStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "settingsWithContactStore:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)avatarViewControllerSettings;
    avatarViewControllerSettings = v6;

    v2 = (void *)avatarViewControllerSettings;
  }
  return v2;
}

- (SearchUIContactsThumbnailView)init
{
  SearchUIContactsThumbnailView *v2;
  void *v3;
  SearchUIContactsThumbnailView *v4;
  objc_super v6;
  _QWORD block[4];
  SearchUIContactsThumbnailView *v8;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__SearchUIContactsThumbnailView_init__block_invoke;
  block[3] = &unk_1EA1F62F0;
  v2 = self;
  v8 = v2;
  if (init_onceToken != -1)
    dispatch_once(&init_onceToken, block);
  objc_msgSend((id)objc_opt_class(), "avatarSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6.receiver = v2;
  v6.super_class = (Class)SearchUIContactsThumbnailView;
  v4 = -[CNAvatarView initWithSettings:](&v6, sel_initWithSettings_, v3);

  return v4;
}

void __37__SearchUIContactsThumbnailView_init__block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "addObserver:selector:name:object:", objc_opt_class(), sel_clearAvatarSettings, *MEMORY[0x1E0DC4778], 0);

}

- (void)_dynamicUserInterfaceTraitDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SearchUIContactsThumbnailView;
  -[SearchUIContactsThumbnailView _dynamicUserInterfaceTraitDidChange](&v3, sel__dynamicUserInterfaceTraitDidChange);
  -[SearchUIContactsThumbnailView tlk_updateWithCurrentAppearance](self, "tlk_updateWithCurrentAppearance");
}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SearchUIContactsThumbnailView;
  -[CNAvatarView didMoveToWindow](&v3, sel_didMoveToWindow);
  -[SearchUIContactsThumbnailView tlk_updateWithCurrentAppearance](self, "tlk_updateWithCurrentAppearance");
  -[SearchUIContactsThumbnailView updateForcePressView](self, "updateForcePressView");
}

- (void)tlk_updateForAppearance:(id)a3
{
  id v4;
  uint64_t v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SearchUIContactsThumbnailView;
  v4 = a3;
  -[SearchUIContactsThumbnailView tlk_updateForAppearance:](&v6, sel_tlk_updateForAppearance_, v4);
  v5 = objc_msgSend(v4, "style", v6.receiver, v6.super_class);

  if (v5 == 1)
    objc_msgSend(MEMORY[0x1E0DBDA50], "enableLightKeylineStroke:forView:", 1, self);
  else
    objc_msgSend(MEMORY[0x1E0DBDA50], "enableShadow:forView:", 1, self);
}

- (void)setContactImage:(id)a3 useCompactDisplay:(BOOL)a4
{
  objc_storeStrong((id *)&self->_contactImage, a3);
  self->_useCompactDisplay = a4;
  -[SearchUIContactsThumbnailView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

- (void)setUsesCompactWidth:(BOOL)a3
{
  if (self->_usesCompactWidth != a3)
  {
    self->_usesCompactWidth = a3;
    -[SearchUIContactsThumbnailView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    -[SearchUIContactsThumbnailView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v12;
  double v13;
  double v14;
  double v15;
  CGSize result;

  if (-[SearchUIContactsThumbnailView useCompactDisplay](self, "useCompactDisplay", a3.width, a3.height))
  {
    +[SearchUISuggestionImageUtilities maximumSize](SearchUISuggestionImageUtilities, "maximumSize");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DBD9B0], "maxThumbnailSizeIsCompactWidth:", -[SearchUIContactsThumbnailView usesCompactWidth](self, "usesCompactWidth"));
    v7 = v6;
    -[SearchUIContactsThumbnailView contactImage](self, "contactImage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "size");
    if (v10 == *MEMORY[0x1E0C9D820] && v9 == *(double *)(MEMORY[0x1E0C9D820] + 8))
    {
      v15 = v7;
    }
    else
    {
      -[SearchUIContactsThumbnailView contactImage](self, "contactImage");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "size");
      v7 = v13;
      v15 = v14;

    }
    v4 = v7;
    v5 = v15;
  }
  result.height = v5;
  result.width = v4;
  return result;
}

- (void)updateWithRowModel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  int v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  unsigned int v19;
  id v20;
  void *v21;
  void *v22;
  int v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  char v29;
  _QWORD *v30;
  void *v31;
  char v32;
  void *v33;
  int v34;
  void *v35;
  _BOOL8 v36;
  void *v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _QWORD v43[5];
  id v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SearchUIContactsThumbnailView setRowModel:](self, "setRowModel:", v4);
  objc_msgSend(v4, "leadingImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUIContactsThumbnailView contactImage](self, "contactImage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqual:", v6);

  v8 = objc_msgSend(v4, "useCompactVersionOfUI");
  v9 = -[SearchUIContactsThumbnailView useCompactDisplay](self, "useCompactDisplay");
  if (!v7 || v8 != v9)
  {
    -[SearchUIContactsThumbnailView setContactImage:useCompactDisplay:](self, "setContactImage:useCompactDisplay:", v5, objc_msgSend(v4, "useCompactVersionOfUI"));
    if ((v7 & 1) == 0)
    {
      -[CNAvatarView setContacts:](self, "setContacts:", MEMORY[0x1E0C9AA60]);
      +[SearchUIContactCache sharedCache](SearchUIContactCache, "sharedCache");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "contactIdentifiers");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v43[0] = MEMORY[0x1E0C809B0];
      v43[1] = 3221225472;
      v43[2] = __52__SearchUIContactsThumbnailView_updateWithRowModel___block_invoke;
      v43[3] = &unk_1EA1F65B0;
      v43[4] = self;
      v44 = v5;
      objc_msgSend(v10, "fetchContactsForIdentifiers:completionHandler:", v11, v43);

    }
  }
  v38 = v5;
  -[SearchUIContactsThumbnailView singleContactPreviewButtonItemOnRowModel](self, "singleContactPreviewButtonItemOnRowModel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUIContactsThumbnailView setForcePressViewIsEntireEnclosingCell:](self, "setForcePressViewIsEntireEnclosingCell:", v12 != 0);
  v13 = (void *)objc_opt_new();
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  objc_msgSend(v12, "actionTypesToShow");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v40 != v17)
          objc_enumerationMutation(v14);
        v19 = objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * i), "intValue") - 1;
        if (v19 <= 3)
        {
          v20 = **((id **)&unk_1EA1F6728 + (int)v19);
          if (v20)
          {
            v21 = v20;
            objc_msgSend(v13, "addObject:", v20);

          }
        }
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
    }
    while (v16);
  }

  -[SearchUIContactsThumbnailView contactImage](self, "contactImage");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "threeDTouchEnabled");
  if (v12 || v23)
    v24 = -[SearchUIContactsThumbnailView useCompactDisplay](self, "useCompactDisplay") ^ 1;
  else
    v24 = 0;
  -[CNAvatarView setThreeDTouchEnabled:](self, "setThreeDTouchEnabled:", v24);

  -[SearchUIContactsThumbnailView updateForcePressView](self, "updateForcePressView");
  if (!objc_msgSend(v13, "count"))
  {
    objc_msgSend(v38, "badgingImage");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v38, "badgingImage");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "bundleIdentifier");
      v27 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v27 = 0;
    }

    +[SearchUIUtilities bundleIdentifierForApp:](SearchUIUtilities, "bundleIdentifierForApp:", 10);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v27, "isEqualToString:", v28);

    if ((v29 & 1) != 0)
    {
      v30 = (_QWORD *)MEMORY[0x1E0C97420];
    }
    else
    {
      +[SearchUIUtilities bundleIdentifierForApp:](SearchUIUtilities, "bundleIdentifierForApp:", 8);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v27, "isEqualToString:", v31);

      if ((v32 & 1) != 0)
      {
        v30 = (_QWORD *)MEMORY[0x1E0C97428];
      }
      else
      {
        +[SearchUIUtilities bundleIdentifierForApp:](SearchUIUtilities, "bundleIdentifierForApp:", 26);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v27, "isEqualToString:", v33);

        v30 = (_QWORD *)MEMORY[0x1E0C97418];
        if (v34)
          v30 = (_QWORD *)MEMORY[0x1E0C97430];
      }
    }
    objc_msgSend(v13, "addObject:", *v30);

  }
  -[CNAvatarView setActionCategories:](self, "setActionCategories:", v13);
  objc_msgSend(v4, "contactIdentifiers");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = (unint64_t)objc_msgSend(v35, "count") < 2;
  -[SearchUIContactsThumbnailView layer](self, "layer");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setShadowPathIsBounds:", v36);

}

void __52__SearchUIContactsThumbnailView_updateWithRowModel___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__SearchUIContactsThumbnailView_updateWithRowModel___block_invoke_2;
  v6[3] = &unk_1EA1F6518;
  v4 = *(void **)(a1 + 40);
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v4;
  v8 = v3;
  v5 = v3;
  +[SearchUIUtilities dispatchMainIfNecessary:](SearchUIUtilities, "dispatchMainIfNecessary:", v6);

}

void __52__SearchUIContactsThumbnailView_updateWithRowModel___block_invoke_2(uint64_t a1)
{
  void *v2;
  int v3;

  objc_msgSend(*(id *)(a1 + 32), "contactImage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqual:", *(_QWORD *)(a1 + 40));

  if (v3)
    objc_msgSend(*(id *)(a1 + 32), "setContacts:", *(_QWORD *)(a1 + 48));
}

- (id)singleContactPreviewButtonItemOnRowModel
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[SearchUIContactsThumbnailView rowModel](self, "rowModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cardSection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "previewButtonItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "count") == 1)
  {
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v4, "firstObject");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)layoutSubviews
{
  CGFloat v3;
  void *v4;
  objc_super v5;
  CGRect v6;

  v5.receiver = self;
  v5.super_class = (Class)SearchUIContactsThumbnailView;
  -[CNAvatarView layoutSubviews](&v5, sel_layoutSubviews);
  -[SearchUIContactsThumbnailView bounds](self, "bounds");
  v3 = CGRectGetWidth(v6) * 0.5;
  -[SearchUIContactsThumbnailView layer](self, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCornerRadius:", v3);

}

- (void)updateForcePressView
{
  SearchUIContactsThumbnailView *v3;
  uint64_t v4;
  SearchUIContactsThumbnailView *v5;
  SearchUIContactsThumbnailView *v6;
  SearchUIContactsThumbnailView *v7;

  if (-[CNAvatarView isThreeDTouchEnabled](self, "isThreeDTouchEnabled"))
  {
    v6 = self;
    if (-[SearchUIContactsThumbnailView forcePressViewIsEntireEnclosingCell](v6, "forcePressViewIsEntireEnclosingCell"))
    {
      if (v6)
      {
        v3 = v6;
        while (1)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            break;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            break;
          -[SearchUIContactsThumbnailView superview](v3, "superview");
          v4 = objc_claimAutoreleasedReturnValue();

          v3 = (SearchUIContactsThumbnailView *)v4;
          if (!v4)
            goto LABEL_8;
        }
        v5 = v3;
      }
      else
      {
LABEL_8:
        v5 = v6;
      }
    }
    else
    {
      v5 = v6;
    }
  }
  else
  {
    v5 = 0;
  }
  v7 = v5;
  -[CNAvatarView setForcePressView:](self, "setForcePressView:", v5);

}

- (BOOL)usesCompactWidth
{
  return self->_usesCompactWidth;
}

- (SFContactImage)contactImage
{
  return self->_contactImage;
}

- (void)setContactImage:(id)a3
{
  objc_storeStrong((id *)&self->_contactImage, a3);
}

- (BOOL)useCompactDisplay
{
  return self->_useCompactDisplay;
}

- (void)setUseCompactDisplay:(BOOL)a3
{
  self->_useCompactDisplay = a3;
}

- (BOOL)forcePressViewIsEntireEnclosingCell
{
  return self->_forcePressViewIsEntireEnclosingCell;
}

- (void)setForcePressViewIsEntireEnclosingCell:(BOOL)a3
{
  self->_forcePressViewIsEntireEnclosingCell = a3;
}

- (SearchUIRowModel)rowModel
{
  return self->_rowModel;
}

- (void)setRowModel:(id)a3
{
  objc_storeStrong((id *)&self->_rowModel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rowModel, 0);
  objc_storeStrong((id *)&self->_contactImage, 0);
}

@end
