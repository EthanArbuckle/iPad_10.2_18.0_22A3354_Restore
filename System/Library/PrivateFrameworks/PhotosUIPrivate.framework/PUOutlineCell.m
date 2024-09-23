@implementation PUOutlineCell

- (void)setText:(id)a3
{
  NSString *v4;
  BOOL v5;
  NSString *v6;
  NSString *text;
  NSString *v8;

  v8 = (NSString *)a3;
  v4 = self->_text;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSString isEqualToString:](v4, "isEqualToString:", v8);

    if (!v5)
    {
      v6 = (NSString *)-[NSString copy](v8, "copy");
      text = self->_text;
      self->_text = v6;

      -[PUOutlineCell _setNeedsConfigurationStateUpdate](self, "_setNeedsConfigurationStateUpdate");
    }
  }

}

- (void)setImage:(id)a3
{
  UIImage *v5;
  UIImage *v6;
  char v7;
  UIImage *v8;

  v8 = (UIImage *)a3;
  v5 = self->_image;
  if (v5 == v8)
  {

  }
  else
  {
    v6 = v5;
    v7 = -[UIImage isEqual:](v5, "isEqual:", v8);

    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_image, a3);
      -[PUOutlineCell _setNeedsConfigurationStateUpdate](self, "_setNeedsConfigurationStateUpdate");
    }
  }

}

- (void)setStyle:(int64_t)a3
{
  if (self->_style != a3)
  {
    self->_style = a3;
    -[PUOutlineCell _setNeedsConfigurationStateUpdate](self, "_setNeedsConfigurationStateUpdate");
  }
}

- (void)_updateViewConfigurationsWithState:(unint64_t)a3
{
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSString *text;
  void *v33;
  void *v34;
  void *v35;
  NSString *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  double v40;
  double v41;
  id v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  double v52;
  double v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  _QWORD aBlock[4];
  id v59;
  objc_super v60;

  v60.receiver = self;
  v60.super_class = (Class)PUOutlineCell;
  -[PUOutlineCell _updateViewConfigurationsWithState:](&v60, sel__updateViewConfigurationsWithState_);
  -[PUOutlineCell item](self, "item");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isExpandable"))
  {
    v7 = objc_alloc_init(MEMORY[0x1E0DC3588]);
    objc_msgSend(v7, "setStyle:", 2);
    objc_msgSend(v6, "addObject:", v7);

  }
  if (objc_msgSend(v5, "isReorderable"))
  {
    v8 = objc_alloc_init(MEMORY[0x1E0DC3598]);
    objc_msgSend(v6, "addObject:", v8);

  }
  if (objc_msgSend(v5, "isDeletable"))
  {
    v9 = objc_alloc_init(MEMORY[0x1E0DC3558]);
    objc_msgSend(v6, "addObject:", v9);

  }
  objc_msgSend(v5, "badgeString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "length"))
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3578]), "initWithText:", v10);
    objc_msgSend(v6, "addObject:", v11);

  }
  objc_msgSend(v5, "accessoryGlyphImageName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "length"))
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "imageWithRenderingMode:", 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[PUOutlineCell accessoryImageView](self, "accessoryImageView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      -[PUOutlineCell accessoryImageView](self, "accessoryImageView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setImage:", v14);
    }
    else
    {
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v14);
      -[PUOutlineCell setAccessoryImageView:](self, "setAccessoryImageView:", v16);
    }

    -[PUOutlineCell accessoryImageView](self, "accessoryImageView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setTintAdjustmentMode:", 1);

    objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUOutlineCell accessoryImageView](self, "accessoryImageView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setTintColor:", v18);

    -[PUOutlineCell accessoryImageView](self, "accessoryImageView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "sizeToFit");

    v21 = objc_alloc(MEMORY[0x1E0DC3550]);
    -[PUOutlineCell accessoryImageView](self, "accessoryImageView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v21, "initWithCustomView:placement:", v22, 1);

    objc_msgSend(v23, "setMaintainsFixedSize:", 1);
    objc_msgSend(v6, "addObject:", v23);

  }
  v56 = v12;
  v57 = v10;
  v55 = v5;
  -[PUOutlineCell setAccessories:](self, "setAccessories:", v6);
  objc_msgSend(MEMORY[0x1E0DC39A8], "cellConfiguration");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUOutlineCell configurationState](self, "configurationState");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "updatedConfigurationForState:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v26, "textProperties");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "color");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v26, "imageProperties");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "tintColor");
  v54 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC4040], "defaultOutlineCellConfigurationForState:", a3);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUOutlineCell _editingConfigurationForState:](self, "_editingConfigurationForState:", a3);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "set_textLabelEditingConfiguration:", v31);

  text = self->_text;
  objc_msgSend(v30, "textLabel");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setText:", text);

  objc_msgSend(v30, "textLabel");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setTextColor:", v28);

  -[PUOutlineCell traitCollection](self, "traitCollection");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "preferredContentSizeCategory");
  v36 = (NSString *)objc_claimAutoreleasedReturnValue();
  if (UIContentSizeCategoryIsAccessibilityCategory(v36))
    v37 = 3;
  else
    v37 = 2;
  objc_msgSend(v30, "textLabel");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setNumberOfLines:", v37);

  objc_msgSend(v30, "textLabel");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setLineBreakMode:", 4);

  objc_msgSend(v30, "directionalLayoutMargins");
  v41 = v40;
  objc_msgSend(v30, "directionalLayoutMargins");
  objc_msgSend(v30, "setDirectionalLayoutMargins:", 8.0, v41, 8.0);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __52__PUOutlineCell__updateViewConfigurationsWithState___block_invoke;
  aBlock[3] = &unk_1E58AB498;
  v42 = v6;
  v59 = v42;
  v43 = _Block_copy(aBlock);
  v44 = v43;
  if ((a3 & 0x10) != 0 && ((*((uint64_t (**)(void *))v43 + 2))(v43) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "_monochromeCellImageTintColor");
    v45 = (id)objc_claimAutoreleasedReturnValue();

    v28 = (void *)v54;
    v46 = v55;
    v47 = v45;
    goto LABEL_23;
  }
  if (-[PUOutlineCell style](self, "style") == 1)
  {
    v45 = 0;
    v47 = (void *)v54;
    v46 = v55;
LABEL_23:

    v28 = v45;
    goto LABEL_24;
  }
  v47 = (void *)v54;
  v46 = v55;
LABEL_24:
  objc_msgSend(v30, "textLabel");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setTextColor:", v28);

  objc_msgSend(v30, "imageView");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUOutlineCell image](self, "image");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "setImage:", v50);

  objc_msgSend(MEMORY[0x1E0DC37F8], "defaultMetrics");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "scaledValueForValue:", 28.0);
  v53 = v52;

  objc_msgSend(v49, "setReservedLayoutSize:", v53, v53);
  objc_msgSend(v49, "reservedLayoutSize");
  objc_msgSend(v49, "setMaximumSize:");
  objc_msgSend(v49, "setCornerRadius:", v53 / 9.3);
  objc_msgSend(v49, "setTintColor:", v47);
  -[PUOutlineCell _setContentViewConfiguration:](self, "_setContentViewConfiguration:", v30);

}

- (BOOL)_hasEditSpecificAccessories
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[PUOutlineCell accessories](self, "accessories", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "displayedState") == 1)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)canBecomeFocused
{
  return 1;
}

- (void)prepareForReuse
{
  NSString *text;
  UIImage *image;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PUOutlineCell;
  -[PUOutlineCell prepareForReuse](&v5, sel_prepareForReuse);
  -[PUOutlineCell setItem:](self, "setItem:", 0);
  text = self->_text;
  self->_text = 0;

  image = self->_image;
  self->_image = 0;

}

- (id)_editingConfigurationForState:(unint64_t)a3
{
  char v3;
  void *v5;
  void *v6;
  int v7;
  id v8;
  _QWORD v10[4];
  id v11;
  id v12;
  id location;

  v3 = a3;
  -[PUOutlineCell item](self, "item");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v3 & 0x10) == 0)
    goto LABEL_5;
  -[PUOutlineCell delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = objc_msgSend(v5, "isRenamable");

    if (v7)
    {
      objc_initWeak(&location, self);
      v8 = objc_alloc(MEMORY[0x1E0DC40C0]);
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __47__PUOutlineCell__editingConfigurationForState___block_invoke;
      v10[3] = &unk_1E58A05D8;
      objc_copyWeak(&v12, &location);
      v11 = v5;
      v6 = (void *)objc_msgSend(v8, "initWithDidEndHandler:", v10);
      objc_msgSend(v6, "setUseTextInputAsLabel:", 1);
      objc_msgSend(v6, "setShouldEndHandler:", &__block_literal_global_147_38436);

      objc_destroyWeak(&v12);
      objc_destroyWeak(&location);
      goto LABEL_6;
    }
LABEL_5:
    v6 = 0;
  }
LABEL_6:

  return v6;
}

- (void)_renameItem:(id)a3 toTitle:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[PUOutlineCell delegate](self, "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "outlineCell:updatedTitle:forItem:", self, v6, v7);

}

- (UIImage)image
{
  return self->_image;
}

- (NSString)text
{
  return self->_text;
}

- (PXNavigationListItem)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
  objc_storeStrong((id *)&self->_item, a3);
}

- (PUOutlineCellDelegate)delegate
{
  return (PUOutlineCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)style
{
  return self->_style;
}

- (int64_t)mediaRequestID
{
  return self->_mediaRequestID;
}

- (void)setMediaRequestID:(int64_t)a3
{
  self->_mediaRequestID = a3;
}

- (UIImageView)accessoryImageView
{
  return self->_accessoryImageView;
}

- (void)setAccessoryImageView:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryImageView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryImageView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

void __47__PUOutlineCell__editingConfigurationForState___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  uint64_t v10;
  id WeakRetained;
  id v12;

  v12 = a2;
  v3 = objc_msgSend(v12, "proposedReplacementRange");
  v5 = v4;
  objc_msgSend(v12, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v12, "proposedReplacementText");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    if (v7)
      v9 = (const __CFString *)v7;
    else
      v9 = &stru_1E58AD278;
    objc_msgSend(v6, "stringByReplacingCharactersInRange:withString:", v3, v5, v9);
    v10 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v10;
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_renameItem:toTitle:", *(_QWORD *)(a1 + 32), v6);

}

BOOL __47__PUOutlineCell__editingConfigurationForState___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  _BOOL8 v5;

  objc_msgSend(a2, "text");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByTrimmingCharactersInSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length") != 0;

  return v5;
}

uint64_t __52__PUOutlineCell__updateViewConfigurationsWithState___block_invoke()
{
  return PXExists();
}

BOOL __52__PUOutlineCell__updateViewConfigurationsWithState___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "displayedState") == 1;
}

@end
