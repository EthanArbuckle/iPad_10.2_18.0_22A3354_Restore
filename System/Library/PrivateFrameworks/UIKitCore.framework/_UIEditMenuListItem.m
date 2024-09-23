@implementation _UIEditMenuListItem

+ (id)itemWithMenuElement:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  char v6;
  char v7;
  void *v8;
  unint64_t v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  _QWORD v30[5];
  _QWORD v31[5];
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;

  v3 = a3;
  v4 = objc_opt_new();
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__146;
  v36 = __Block_byref_object_dispose__146;
  v37 = 0;
  if (objc_msgSend(v3, "_isLeaf"))
  {
    v5 = v3;
    v6 = objc_msgSend(v5, "attributes");
    v7 = objc_msgSend(v5, "attributes");
    if (objc_msgSend(v5, "state") == 1)
    {
      objc_msgSend(v5, "selectedImage");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }
    v9 = v7 & 2 | (unint64_t)(v6 & 1);

  }
  else
  {
    v8 = 0;
    v9 = 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = v3;
    objc_msgSend(v10, "contentView");
    v11 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __43___UIEditMenuListItem_itemWithMenuElement___block_invoke;
  v31[3] = &unk_1E16D9BA8;
  v31[4] = &v32;
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __43___UIEditMenuListItem_itemWithMenuElement___block_invoke_2;
  v30[3] = &unk_1E16D9BD0;
  v30[4] = &v32;
  objc_msgSend(v3, "_acceptMenuVisit:commandVisit:actionVisit:deferredElementVisit:", 0, v31, v30, 0);
  objc_msgSend((id)v33[5], "localizedStringForLocalization:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    v14 = v12;
  }
  else
  {
    objc_msgSend(v3, "title");
    v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  v15 = v14;

  objc_msgSend(v3, "image");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v17 = (void *)v33[5];
  if (v17)
  {
    objc_msgSend(v17, "glyph");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", v18);
    v19 = objc_claimAutoreleasedReturnValue();

    v16 = (id)v19;
  }
  else
  {
    if (!v8)
      goto LABEL_18;
    v18 = v16;
    v16 = v8;
  }

LABEL_18:
  v20 = objc_msgSend(v3, "_preferredDisplayMode");
  if (v20 == 1)
    v21 = 2;
  else
    v21 = v20 == 3;
  v22 = *(void **)(v4 + 16);
  *(_QWORD *)(v4 + 16) = v3;
  v23 = v3;

  objc_storeStrong((id *)(v4 + 40), (id)v33[5]);
  v24 = *(void **)(v4 + 24);
  *(_QWORD *)(v4 + 24) = v15;
  v25 = v15;

  v26 = *(void **)(v4 + 32);
  *(_QWORD *)(v4 + 32) = v16;
  v27 = v16;

  *(_QWORD *)(v4 + 72) = v21;
  v28 = *(void **)(v4 + 56);
  *(_QWORD *)(v4 + 48) = v9;
  *(_QWORD *)(v4 + 56) = v11;

  _Block_object_dispose(&v32, 8);
  return (id)v4;
}

+ (id)itemWithTitle:(id)a3
{
  id v3;
  _QWORD *v4;
  void *v5;

  v3 = a3;
  v4 = (_QWORD *)objc_opt_new();
  v5 = (void *)v4[3];
  v4[3] = v3;

  v4[9] = 0;
  return v4;
}

- (BOOL)hidesTitleForTraitCollection:(id)a3
{
  NSString *v4;
  BOOL IsAccessibilityCategory;

  objc_msgSend(a3, "preferredContentSizeCategory");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v4);

  if (!-[NSString length](self->_title, "length"))
    return 1;
  if (!self->_image)
    return 0;
  if (self->_displayMode == 1)
    return !IsAccessibilityCategory;
  return 0;
}

- (BOOL)hidesImageForTraitCollection:(id)a3
{
  NSString *v4;
  _BOOL4 IsAccessibilityCategory;
  UIImage *image;
  NSUInteger v7;
  BOOL v8;

  objc_msgSend(a3, "preferredContentSizeCategory");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v4);

  image = self->_image;
  v7 = -[NSString length](self->_title, "length");
  if (IsAccessibilityCategory)
  {
    v8 = v7 != 0;
  }
  else if (v7)
  {
    v8 = self->_displayMode == 0;
  }
  else
  {
    v8 = 0;
  }
  return !image || v8;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  unint64_t v20;
  const __CFString *v21;
  const __CFString *v22;
  id v23;
  double v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  void *v31;

  +[UIDescriptionBuilder descriptionBuilderWithObject:](UIDescriptionBuilder, "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIEditMenuListItem title](self, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_UIEditMenuListItem title](self, "title");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("title"), v5);

  }
  -[_UIEditMenuListItem image](self, "image");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[_UIEditMenuListItem image](self, "image");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)objc_msgSend(v3, "appendName:object:usingLightweightDescription:", CFSTR("image"), v8, 1);

  }
  -[_UIEditMenuListItem pasteVariant](self, "pasteVariant");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[_UIEditMenuListItem pasteVariant](self, "pasteVariant");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("pasteVariant"), v11);

  }
  if (-[_UIEditMenuListItem options](self, "options"))
  {
    v13 = -[_UIEditMenuListItem options](self, "options");
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if ((v13 & 1) != 0)
      objc_msgSend(v14, "addObject:", CFSTR(".disabled"));
    if ((v13 & 2) != 0)
      objc_msgSend(v15, "addObject:", CFSTR(".destructive"));
    v16 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v15, "componentsJoinedByString:", CFSTR("|"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringWithFormat:", CFSTR("(%@)"), v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("options"), v18);
  }
  v20 = -[_UIEditMenuListItem displayMode](self, "displayMode");
  v21 = CFSTR(".titleOnly");
  if (v20 == 1)
    v21 = CFSTR(".imageOnly");
  if (v20 == 2)
    v22 = CFSTR(".imageAndTitle");
  else
    v22 = v21;
  v23 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("displayMode"), v22);
  -[_UIEditMenuListItem overrideMinimumWidth](self, "overrideMinimumWidth");
  if (v24 > 0.0)
  {
    -[_UIEditMenuListItem overrideMinimumWidth](self, "overrideMinimumWidth");
    v25 = (id)objc_msgSend(v3, "appendName:doubleValue:", CFSTR("overrideMinimumWidth"));
  }
  -[_UIEditMenuListItem customView](self, "customView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    -[_UIEditMenuListItem customView](self, "customView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (id)objc_msgSend(v3, "appendName:object:usingLightweightDescription:", CFSTR("customView"), v27, 1);

  }
  -[_UIEditMenuListItem menuElement](self, "menuElement");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (id)objc_msgSend(v3, "appendName:object:usingLightweightDescription:", CFSTR("menuElement"), v29, 1);

  objc_msgSend(v3, "string");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  return v31;
}

- (UIMenuElement)menuElement
{
  return self->_menuElement;
}

- (NSString)title
{
  return self->_title;
}

- (UIImage)image
{
  return self->_image;
}

- (UISPasteVariant)pasteVariant
{
  return self->_pasteVariant;
}

- (int64_t)options
{
  return self->_options;
}

- (UIView)customView
{
  return self->_customView;
}

- (double)overrideMinimumWidth
{
  return self->_overrideMinimumWidth;
}

- (void)setOverrideMinimumWidth:(double)a3
{
  self->_overrideMinimumWidth = a3;
}

- (unint64_t)displayMode
{
  return self->_displayMode;
}

- (void)setDisplayMode:(unint64_t)a3
{
  self->_displayMode = a3;
}

- (BOOL)wantsPasteSlotView
{
  return self->_wantsPasteSlotView;
}

- (void)setWantsPasteSlotView:(BOOL)a3
{
  self->_wantsPasteSlotView = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customView, 0);
  objc_storeStrong((id *)&self->_pasteVariant, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_menuElement, 0);
}

@end
