@implementation PXCuratedLibraryOverlayButtonConfiguration

- (void)setActionPerformer:(id)a3
{
  objc_storeStrong((id *)&self->_actionPerformer, a3);
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

+ (PXCuratedLibraryOverlayButtonConfiguration)configurationWithButtonType:(int64_t)a3 spec:(id)a4
{
  id v5;
  PXCuratedLibraryOverlayButtonConfiguration *v6;

  v5 = a4;
  v6 = -[PXCuratedLibraryOverlayButtonConfiguration initWithSystemImageName:title:spec:buttonType:]([PXCuratedLibraryOverlayButtonConfiguration alloc], "initWithSystemImageName:title:spec:buttonType:", 0, 0, v5, a3);

  return v6;
}

+ (PXCuratedLibraryOverlayButtonConfiguration)configurationWithTitle:(id)a3 spec:(id)a4
{
  id v5;
  id v6;
  PXCuratedLibraryOverlayButtonConfiguration *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[PXCuratedLibraryOverlayButtonConfiguration initWithSystemImageName:title:spec:buttonType:]([PXCuratedLibraryOverlayButtonConfiguration alloc], "initWithSystemImageName:title:spec:buttonType:", 0, v6, v5, 0);

  return v7;
}

- (PXCuratedLibraryOverlayButtonConfiguration)initWithSystemImageName:(id)a3 title:(id)a4 spec:(id)a5 buttonType:(int64_t)a6
{
  id v10;
  id v11;
  id v12;
  PXCuratedLibraryOverlayButtonConfiguration *v13;
  PXCuratedLibraryOverlayButtonConfiguration *v14;
  uint64_t v15;
  NSString *title;
  uint64_t v17;
  UIColor *tintColor;
  int64_t v19;
  uint64_t v20;
  NSString *accessibilityTitle;
  id v22;
  void *v23;
  const __CFString *v24;
  uint64_t v25;
  NSString *systemImageName;
  uint64_t v27;
  __CFString *v28;
  objc_super v30;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v30.receiver = self;
  v30.super_class = (Class)PXCuratedLibraryOverlayButtonConfiguration;
  v13 = -[PXCuratedLibraryOverlayButtonConfiguration init](&v30, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_spec, a5);
    v15 = objc_msgSend(v11, "copy");
    title = v14->_title;
    v14->_title = (NSString *)v15;

    *(_OWORD *)&v14->_hitTestOutsets.top = PXDefaultButtonHitTestOutsets;
    *(_OWORD *)&v14->_hitTestOutsets.bottom = unk_1A7C0A010;
    +[PXCuratedLibraryOverlayButton defaultTitleColor](PXCuratedLibraryOverlayButton, "defaultTitleColor");
    v17 = objc_claimAutoreleasedReturnValue();
    tintColor = v14->_tintColor;
    v14->_tintColor = (UIColor *)v17;

    v14->_buttonType = a6;
    v19 = a6 - 1;
    if ((unint64_t)(a6 - 1) <= 7 && ((0xF1u >> v19) & 1) != 0)
    {
      PXLocalizedStringFromTable(off_1E5130DB8[v19], CFSTR("PhotosUICore"));
      v20 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v20 = 0;
    }
    accessibilityTitle = v14->_accessibilityTitle;
    v14->_accessibilityTitle = (NSString *)v20;

    if (a6)
    {
      v22 = v12;
      v23 = v22;
      switch(v19)
      {
        case 0:
          if (objc_msgSend(v22, "ellipsisButtonSpecialTreatment")
            && objc_msgSend(v23, "isFloating"))
          {
            v27 = objc_msgSend(v23, "variant");
            v28 = CFSTR("ellipsis");
            if (v27 == 2)
              v28 = CFSTR("person.fill");
            if (v27 == 3)
              v28 = CFSTR("person.2.fill");
            v24 = v28;
          }
          else
          {
            v24 = CFSTR("ellipsis");
          }
          break;
        case 1:
          v24 = CFSTR("square.and.arrow.up");
          break;
        case 2:
          v24 = CFSTR("trash");
          break;
        case 3:
          v24 = CFSTR("chevron.down");
          break;
        case 4:
        case 5:
          v24 = CFSTR("line.horizontal.3.decrease");
          break;
        case 6:
          v24 = CFSTR("rectangle.arrowtriangle.2.inward");
          break;
        case 7:
          v24 = CFSTR("rectangle.arrowtriangle.2.outward");
          break;
        default:
          v24 = 0;
          break;
      }

      systemImageName = v14->_systemImageName;
      v14->_systemImageName = &v24->isa;
    }
    else
    {
      v25 = objc_msgSend(v10, "copy");
      systemImageName = v14->_systemImageName;
      v14->_systemImageName = (NSString *)v25;
    }

  }
  return v14;
}

- (void)setForcePointerInteractionEnabled:(BOOL)a3
{
  self->_forcePointerInteractionEnabled = a3;
}

- (void)setTintColor:(id)a3
{
  UIColor *v4;
  UIColor *v5;
  UIColor *tintColor;
  UIColor *v7;

  v4 = (UIColor *)a3;
  if (self->_tintColor != v4)
  {
    v7 = v4;
    if (v4)
    {
      v5 = v4;
    }
    else
    {
      +[PXCuratedLibraryOverlayButton defaultTitleColor](PXCuratedLibraryOverlayButton, "defaultTitleColor");
      v5 = (UIColor *)objc_claimAutoreleasedReturnValue();
    }
    tintColor = self->_tintColor;
    self->_tintColor = v5;

    v4 = v7;
  }

}

- (void)prepareForRender
{
  -[PXCuratedLibraryOverlayButtonConfiguration contentColor](self, "contentColor");

  -[PXCuratedLibraryOverlayButtonConfiguration highlightedContentColor](self, "highlightedContentColor");
  -[PXCuratedLibraryOverlayButtonConfiguration iconImage](self, "iconImage");

  -[PXCuratedLibraryOverlayButtonConfiguration iconImageWithoutConfiguration](self, "iconImageWithoutConfiguration");
  -[PXCuratedLibraryOverlayButtonConfiguration tintedIconImage](self, "tintedIconImage");

  -[PXCuratedLibraryOverlayButtonConfiguration highlightedIconImage](self, "highlightedIconImage");
}

- (UIColor)highlightedContentColor
{
  UIColor *highlightedContentColor;
  UIColor *v4;
  UIColor *v5;

  highlightedContentColor = self->_highlightedContentColor;
  if (!highlightedContentColor)
  {
    -[PXCuratedLibraryOverlayButtonConfiguration _contentColorWhenHighlighted:](self, "_contentColorWhenHighlighted:", 1);
    v4 = (UIColor *)objc_claimAutoreleasedReturnValue();
    v5 = self->_highlightedContentColor;
    self->_highlightedContentColor = v4;

    highlightedContentColor = self->_highlightedContentColor;
  }
  return highlightedContentColor;
}

- (UIImage)tintedIconImage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  UIImage *v7;
  UIImage *tintedIconImage;

  if (!self->_tintedIconImage)
  {
    -[PXCuratedLibraryOverlayButtonConfiguration iconImage](self, "iconImage");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      -[PXCuratedLibraryOverlayButtonConfiguration iconImage](self, "iconImage");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXCuratedLibraryOverlayButtonConfiguration systemImageName](self, "systemImageName");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXCuratedLibraryOverlayButtonConfiguration contentColor](self, "contentColor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXCuratedLibraryOverlayButtonConfiguration _tintedImage:name:withColor:](self, "_tintedImage:name:withColor:", v4, v5, v6);
      v7 = (UIImage *)objc_claimAutoreleasedReturnValue();
      tintedIconImage = self->_tintedIconImage;
      self->_tintedIconImage = v7;

    }
  }
  return self->_tintedIconImage;
}

- (UIImage)highlightedIconImage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  UIImage *v7;
  UIImage *highlightedIconImage;

  if (!self->_highlightedIconImage)
  {
    -[PXCuratedLibraryOverlayButtonConfiguration iconImage](self, "iconImage");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      -[PXCuratedLibraryOverlayButtonConfiguration iconImage](self, "iconImage");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXCuratedLibraryOverlayButtonConfiguration systemImageName](self, "systemImageName");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXCuratedLibraryOverlayButtonConfiguration highlightedContentColor](self, "highlightedContentColor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXCuratedLibraryOverlayButtonConfiguration _tintedImage:name:withColor:](self, "_tintedImage:name:withColor:", v4, v5, v6);
      v7 = (UIImage *)objc_claimAutoreleasedReturnValue();
      highlightedIconImage = self->_highlightedIconImage;
      self->_highlightedIconImage = v7;

    }
  }
  return self->_highlightedIconImage;
}

- (id)_tintedImage:(id)a3 name:(id)a4 withColor:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v23[5];

  v23[4] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = a4;
  objc_msgSend((id)objc_opt_class(), "tintedImageCache");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_alloc((Class)off_1E50B5CD8);
  v23[0] = v10;
  v23[1] = v9;
  v13 = (void *)MEMORY[0x1E0CB37E8];
  -[PXCuratedLibraryOverlayButtonConfiguration spec](self, "spec");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "numberWithInteger:", objc_msgSend(v14, "userInterfaceStyle"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v15;
  v16 = (void *)MEMORY[0x1E0CB37E8];
  -[PXCuratedLibraryOverlayButtonConfiguration spec](self, "spec");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "numberWithInteger:", objc_msgSend(v17, "userInterfaceLevel"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v23[3] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = (void *)objc_msgSend(v12, "initWithObjects:", v19);
  objc_msgSend(v11, "objectForKey:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v21)
  {
    objc_msgSend(v8, "px_tintedImageWithColor:", v9);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v21, v20);
  }

  return v21;
}

+ (NSCache)tintedImageCache
{
  if (tintedImageCache_onceToken != -1)
    dispatch_once(&tintedImageCache_onceToken, &__block_literal_global_166143);
  return (NSCache *)(id)tintedImageCache_cache;
}

- (BOOL)isEqual:(id)a3
{
  PXCuratedLibraryOverlayButtonConfiguration *v4;
  PXCuratedLibraryOverlayButtonConfiguration *v5;
  uint64_t v6;
  int64_t v7;
  id v8;
  id v9;
  void *v10;
  char v11;
  char v12;
  id v13;
  id v14;
  void *v15;
  char v16;
  id v17;
  id v18;
  void *v19;
  char v20;
  id v21;
  id v22;
  void *v23;
  char v24;
  id v25;
  id v26;
  void *v27;
  char v28;
  void *v29;
  void *v30;
  id v32;
  id v33;
  void *v34;
  char v35;
  _BOOL4 v36;
  id v37;
  id v38;
  void *v39;
  char v40;
  void *v41;
  void *v42;

  v4 = (PXCuratedLibraryOverlayButtonConfiguration *)a3;
  if (self == v4)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[PXCuratedLibraryOverlayButtonConfiguration style](v5, "style");
      if (v6 != -[PXCuratedLibraryOverlayButtonConfiguration style](self, "style"))
        goto LABEL_29;
      v7 = -[PXCuratedLibraryOverlayButtonConfiguration segment](self, "segment");
      if (v7 != -[PXCuratedLibraryOverlayButtonConfiguration segment](v5, "segment"))
        goto LABEL_29;
      -[PXCuratedLibraryOverlayButtonConfiguration imageEdgeInsets](self, "imageEdgeInsets");
      -[PXCuratedLibraryOverlayButtonConfiguration imageEdgeInsets](v5, "imageEdgeInsets");
      if (!PXEdgeInsetsEqualToEdgeInsets())
        goto LABEL_29;
      -[PXCuratedLibraryOverlayButtonConfiguration systemImageName](self, "systemImageName");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      -[PXCuratedLibraryOverlayButtonConfiguration systemImageName](v5, "systemImageName");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      if (v8 == v9)
      {

      }
      else
      {
        v10 = v9;
        v11 = objc_msgSend(v8, "isEqualToString:", v9);

        if ((v11 & 1) == 0)
          goto LABEL_29;
      }
      -[PXCuratedLibraryOverlayButtonConfiguration title](self, "title");
      v13 = (id)objc_claimAutoreleasedReturnValue();
      -[PXCuratedLibraryOverlayButtonConfiguration title](v5, "title");
      v14 = (id)objc_claimAutoreleasedReturnValue();
      if (v13 == v14)
      {

      }
      else
      {
        v15 = v14;
        v16 = objc_msgSend(v13, "isEqualToString:", v14);

        if ((v16 & 1) == 0)
          goto LABEL_29;
      }
      -[PXCuratedLibraryOverlayButtonConfiguration possibleTitles](self, "possibleTitles");
      v17 = (id)objc_claimAutoreleasedReturnValue();
      -[PXCuratedLibraryOverlayButtonConfiguration possibleTitles](v5, "possibleTitles");
      v18 = (id)objc_claimAutoreleasedReturnValue();
      if (v17 == v18)
      {

      }
      else
      {
        v19 = v18;
        v20 = objc_msgSend(v17, "isEqual:", v18);

        if ((v20 & 1) == 0)
          goto LABEL_29;
      }
      -[PXCuratedLibraryOverlayButtonConfiguration caption](self, "caption");
      v21 = (id)objc_claimAutoreleasedReturnValue();
      -[PXCuratedLibraryOverlayButtonConfiguration caption](v5, "caption");
      v22 = (id)objc_claimAutoreleasedReturnValue();
      if (v21 == v22)
      {

      }
      else
      {
        v23 = v22;
        v24 = objc_msgSend(v21, "isEqualToString:", v22);

        if ((v24 & 1) == 0)
          goto LABEL_29;
      }
      -[PXCuratedLibraryOverlayButtonConfiguration actionPerformer](self, "actionPerformer");
      v25 = (id)objc_claimAutoreleasedReturnValue();
      -[PXCuratedLibraryOverlayButtonConfiguration actionPerformer](v5, "actionPerformer");
      v26 = (id)objc_claimAutoreleasedReturnValue();
      if (v25 == v26)
      {

      }
      else
      {
        v27 = v26;
        v28 = objc_msgSend(v25, "isEqual:", v26);

        if ((v28 & 1) == 0)
          goto LABEL_29;
      }
      -[PXCuratedLibraryOverlayButtonConfiguration actionHandler](self, "actionHandler");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXCuratedLibraryOverlayButtonConfiguration actionHandler](v5, "actionHandler");
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      if (v29 == v30)
      {
        -[PXCuratedLibraryOverlayButtonConfiguration spec](self, "spec");
        v32 = (id)objc_claimAutoreleasedReturnValue();
        -[PXCuratedLibraryOverlayButtonConfiguration spec](v5, "spec");
        v33 = (id)objc_claimAutoreleasedReturnValue();
        if (v32 == v33)
        {

        }
        else
        {
          v34 = v33;
          v35 = objc_msgSend(v32, "isEqual:", v33);

          if ((v35 & 1) == 0)
            goto LABEL_29;
        }
        v36 = -[PXCuratedLibraryOverlayButtonConfiguration forcePointerInteractionEnabled](self, "forcePointerInteractionEnabled");
        if (v36 == -[PXCuratedLibraryOverlayButtonConfiguration forcePointerInteractionEnabled](v5, "forcePointerInteractionEnabled"))
        {
          -[PXCuratedLibraryOverlayButtonConfiguration tintColor](self, "tintColor");
          v37 = (id)objc_claimAutoreleasedReturnValue();
          -[PXCuratedLibraryOverlayButtonConfiguration tintColor](v5, "tintColor");
          v38 = (id)objc_claimAutoreleasedReturnValue();
          if (v37 == v38)
          {

          }
          else
          {
            v39 = v38;
            v40 = objc_msgSend(v37, "isEqual:", v38);

            if ((v40 & 1) == 0)
              goto LABEL_29;
          }
          -[PXCuratedLibraryOverlayButtonConfiguration backgroundColor](self, "backgroundColor");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          -[PXCuratedLibraryOverlayButtonConfiguration backgroundColor](v5, "backgroundColor");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          if (v41 == v42)
            v12 = 1;
          else
            v12 = objc_msgSend(v41, "isEqual:", v42);

          goto LABEL_30;
        }
      }
LABEL_29:
      v12 = 0;
LABEL_30:

      goto LABEL_31;
    }
    v12 = 0;
  }
LABEL_31:

  return v12;
}

- (unint64_t)hash
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  int64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  int64_t v28;
  void *v29;
  void *v30;
  void *v31;

  -[PXCuratedLibraryOverlayButtonConfiguration imageEdgeInsets](self, "imageEdgeInsets");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = -[PXCuratedLibraryOverlayButtonConfiguration style](self, "style");
  v28 = -[PXCuratedLibraryOverlayButtonConfiguration segment](self, "segment") ^ v11;
  -[PXCuratedLibraryOverlayButtonConfiguration systemImageName](self, "systemImageName");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v31, "hash");
  -[PXCuratedLibraryOverlayButtonConfiguration title](self, "title");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v30, "hash");
  -[PXCuratedLibraryOverlayButtonConfiguration possibleTitles](self, "possibleTitles");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v29, "hash");
  -[PXCuratedLibraryOverlayButtonConfiguration caption](self, "caption");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v26, "hash");
  -[PXCuratedLibraryOverlayButtonConfiguration actionPerformer](self, "actionPerformer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "hash");
  -[PXCuratedLibraryOverlayButtonConfiguration actionHandler](self, "actionHandler");
  v14 = objc_claimAutoreleasedReturnValue();
  -[PXCuratedLibraryOverlayButtonConfiguration spec](self, "spec");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "hash");
  -[PXCuratedLibraryOverlayButtonConfiguration tintColor](self, "tintColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "hash");
  -[PXCuratedLibraryOverlayButtonConfiguration backgroundColor](self, "backgroundColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "hash");
  v21 = v28 ^ (unint64_t)(v4 * 100.0) ^ (unint64_t)(v6 * 100.0) ^ (unint64_t)(v8 * 100.0) ^ (unint64_t)(v10 * 100.0) ^ v27 ^ v25 ^ v24 ^ v23 ^ v13 ^ v14 ^ v16 ^ v18 ^ v20 ^ -[PXCuratedLibraryOverlayButtonConfiguration forcePointerInteractionEnabled](self, "forcePointerInteractionEnabled");

  return v21;
}

- (PXCuratedLibrarySectionHeaderLayoutSpec)spec
{
  return self->_spec;
}

- (NSString)title
{
  return self->_title;
}

- (PXCuratedLibraryActionPerformer)actionPerformer
{
  return self->_actionPerformer;
}

- (int64_t)segment
{
  return self->_segment;
}

- (NSString)caption
{
  return self->_caption;
}

- (UIEdgeInsets)imageEdgeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_imageEdgeInsets.top;
  left = self->_imageEdgeInsets.left;
  bottom = self->_imageEdgeInsets.bottom;
  right = self->_imageEdgeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (NSSet)possibleTitles
{
  return self->_possibleTitles;
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (BOOL)forcePointerInteractionEnabled
{
  return self->_forcePointerInteractionEnabled;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (UIImage)iconImage
{
  UIImage *iconImage;
  void *v4;
  PXCuratedLibraryOverlayButtonConfiguration *v5;
  void *v6;
  NSString *v7;
  _BOOL4 IsAccessibilityCategory;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  __objc2_meth_list **p_inst_meths;
  void *v20;
  id *v21;
  id v22;
  void *v23;
  char v24;
  id *v25;
  id v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  _QWORD *v34;
  UIImage *v35;
  UIImage *v36;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  iconImage = self->_iconImage;
  if (!iconImage)
  {
    -[PXCuratedLibraryOverlayButtonConfiguration iconImageWithoutConfiguration](self, "iconImageWithoutConfiguration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = self;
    if (_PXIconImageSymbolConfiguration_onceToken != -1)
      dispatch_once(&_PXIconImageSymbolConfiguration_onceToken, &__block_literal_global_609);
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "preferredContentSizeCategory");
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v7);

    -[PXCuratedLibraryOverlayButtonConfiguration systemImageName](v5, "systemImageName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_alloc((Class)off_1E50B5CD8);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[PXCuratedLibraryOverlayButtonConfiguration style](v5, "style"));
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "preferredContentSizeCategory");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = v14;
      v40 = v9;
      v15 = (void *)MEMORY[0x1E0C99D20];
      v16 = 3;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "preferredContentSizeCategory");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = v14;
      v15 = (void *)MEMORY[0x1E0C99D20];
      v16 = 2;
    }
    objc_msgSend(v15, "arrayWithObjects:count:", &v38, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v10, "initWithObjects:", v17);

    p_inst_meths = &OBJC_PROTOCOL___PXStoryResourcesPreloadingCoordinatable.inst_meths;
    objc_msgSend((id)_PXIconImageSymbolConfiguration_configsCache, "objectForKey:", v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v20)
    {
      switch(-[PXCuratedLibraryOverlayButtonConfiguration style](v5, "style"))
      {
        case 0:
        case 1:
        case 6:
        case 7:
        case 8:
        case 9:
        case 10:
        case 11:
        case 13:
        case 14:
        case 15:
          v21 = (id *)MEMORY[0x1E0DC48F0];
          if (!IsAccessibilityCategory)
            v21 = (id *)MEMORY[0x1E0DC4918];
          v22 = *v21;
          -[PXCuratedLibraryOverlayButtonConfiguration spec](v5, "spec");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v23, "options");

          v25 = (id *)MEMORY[0x1E0DC4A88];
          if ((v24 & 4) == 0)
            v25 = (id *)MEMORY[0x1E0DC4B08];
          v26 = *v25;
          objc_msgSend(MEMORY[0x1E0DC1350], "px_preferredFontForTextStyle:maxContentSizeCategory:withSymbolicTraits:", v26, v22, 32770);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          if ((v24 & 4) != 0
            || (objc_msgSend(v9, "isEqualToString:", CFSTR("person.fill")) & 1) != 0
            || objc_msgSend(v9, "isEqualToString:", CFSTR("person.2.fill")))
          {
            v28 = 1;
          }
          else
          {
            v28 = 2;
          }
          v29 = (void *)MEMORY[0x1E0DC3888];
          objc_msgSend(v27, "pointSize");
          objc_msgSend(v29, "configurationWithPointSize:weight:scale:", 6, v28);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          p_inst_meths = (__objc2_meth_list **)(&OBJC_PROTOCOL___PXStoryResourcesPreloadingCoordinatable + 24);
          goto LABEL_27;
        case 2:
        case 3:
          objc_msgSend(MEMORY[0x1E0DC1350], "px_preferredFontForTextStyle:maxContentSizeCategory:withSymbolicTraits:", *MEMORY[0x1E0DC4A88], *MEMORY[0x1E0DC48F8], 4096);
          v22 = (id)objc_claimAutoreleasedReturnValue();
          v30 = (void *)MEMORY[0x1E0DC3888];
          objc_msgSend(v22, "pointSize");
          v31 = v30;
          v32 = 4;
          goto LABEL_26;
        case 4:
        case 5:
          objc_msgSend(MEMORY[0x1E0DC1350], "px_preferredFontForTextStyle:maxContentSizeCategory:withSymbolicTraits:", *MEMORY[0x1E0DC4A88], *MEMORY[0x1E0DC48F8], 4096);
          v22 = (id)objc_claimAutoreleasedReturnValue();
          v33 = (void *)MEMORY[0x1E0DC3888];
          objc_msgSend(v22, "pointSize");
          goto LABEL_25;
        case 12:
          v34 = (_QWORD *)MEMORY[0x1E0DC48F0];
          if (!IsAccessibilityCategory)
            v34 = (_QWORD *)MEMORY[0x1E0DC4918];
          objc_msgSend(MEMORY[0x1E0DC1350], "px_preferredFontForTextStyle:maxContentSizeCategory:withSymbolicTraits:", *MEMORY[0x1E0DC4B08], *v34, 32770);
          v22 = (id)objc_claimAutoreleasedReturnValue();
          v33 = (void *)MEMORY[0x1E0DC3888];
          objc_msgSend(v22, "pointSize");
LABEL_25:
          v31 = v33;
          v32 = 6;
LABEL_26:
          objc_msgSend(v31, "configurationWithPointSize:weight:scale:", v32, 3);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_27:

          break;
        default:
          v20 = 0;
          break;
      }
      -[__objc2_meth_list setObject:forKey:](p_inst_meths[301], "setObject:forKey:", v20, v18);
    }

    objc_msgSend(v4, "imageWithSymbolConfiguration:", v20);
    v35 = (UIImage *)objc_claimAutoreleasedReturnValue();
    v36 = self->_iconImage;
    self->_iconImage = v35;

    iconImage = self->_iconImage;
  }
  return iconImage;
}

- (UIImage)iconImageWithoutConfiguration
{
  UIImage *iconImageWithoutConfiguration;
  void *v4;
  UIImage *v5;
  UIImage *v6;

  iconImageWithoutConfiguration = self->_iconImageWithoutConfiguration;
  if (!iconImageWithoutConfiguration)
  {
    -[PXCuratedLibraryOverlayButtonConfiguration systemImageName](self, "systemImageName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0DC3870], "px_systemImageNamed:", v4);
      v5 = (UIImage *)objc_claimAutoreleasedReturnValue();
      v6 = self->_iconImageWithoutConfiguration;
      self->_iconImageWithoutConfiguration = v5;

    }
    iconImageWithoutConfiguration = self->_iconImageWithoutConfiguration;
  }
  return iconImageWithoutConfiguration;
}

- (NSString)systemImageName
{
  return self->_systemImageName;
}

- (UIColor)contentColor
{
  UIColor *contentColor;
  UIColor *v4;
  UIColor *v5;

  contentColor = self->_contentColor;
  if (!contentColor)
  {
    -[PXCuratedLibraryOverlayButtonConfiguration _contentColorWhenHighlighted:](self, "_contentColorWhenHighlighted:", 0);
    v4 = (UIColor *)objc_claimAutoreleasedReturnValue();
    v5 = self->_contentColor;
    self->_contentColor = v4;

    contentColor = self->_contentColor;
  }
  return contentColor;
}

- (NSString)accessibilityTitle
{
  return self->_accessibilityTitle;
}

- (id)_contentColorWhenHighlighted:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v11;
  void *v12;

  v3 = a3;
  -[PXCuratedLibraryOverlayButtonConfiguration actionPerformer](self, "actionPerformer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5
    || (-[PXCuratedLibraryOverlayButtonConfiguration actionHandler](self, "actionHandler"),
        (v5 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {

  }
  else
  {
    -[PXCuratedLibraryOverlayButtonConfiguration menuActionHandler](self, "menuActionHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "colorWithAlphaComponent:", 0.3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      return v7;
    }
  }
  if (-[PXCuratedLibraryOverlayButtonConfiguration style](self, "style") == 8)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (!v3)
    {
      objc_msgSend(v6, "colorWithAlphaComponent:", 0.5);
      v8 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v8;
    }
  }
  else
  {
    if (-[PXCuratedLibraryOverlayButtonConfiguration style](self, "style") == 10 || !v3)
    {
      -[PXCuratedLibraryOverlayButtonConfiguration tintColor](self, "tintColor");
      v9 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "_vibrantLightFillBurnColor");
      v9 = objc_claimAutoreleasedReturnValue();
    }
    v7 = (void *)v9;
  }
  return v7;
}

- (int64_t)style
{
  return self->_style;
}

- (UIEdgeInsets)hitTestOutsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_hitTestOutsets.top;
  left = self->_hitTestOutsets.left;
  bottom = self->_hitTestOutsets.bottom;
  right = self->_hitTestOutsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (id)menuActionHandler
{
  return self->_menuActionHandler;
}

- (int64_t)buttonType
{
  return self->_buttonType;
}

- (id)actionHandler
{
  return self->_actionHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessibilityTitle, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_caption, 0);
  objc_storeStrong((id *)&self->_possibleTitles, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_systemImageName, 0);
  objc_storeStrong(&self->_willDismissMenuActionHandler, 0);
  objc_storeStrong(&self->_willDisplayMenuActionHandler, 0);
  objc_storeStrong(&self->_menuActionHandler, 0);
  objc_storeStrong(&self->_actionHandler, 0);
  objc_storeStrong((id *)&self->_actionPerformer, 0);
  objc_storeStrong((id *)&self->_spec, 0);
  objc_storeStrong((id *)&self->_highlightedIconImage, 0);
  objc_storeStrong((id *)&self->_tintedIconImage, 0);
  objc_storeStrong((id *)&self->_iconImageWithoutConfiguration, 0);
  objc_storeStrong((id *)&self->_iconImage, 0);
  objc_storeStrong((id *)&self->_highlightedContentColor, 0);
  objc_storeStrong((id *)&self->_contentColor, 0);
}

void __62__PXCuratedLibraryOverlayButtonConfiguration_tintedImageCache__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99D38]);
  v1 = (void *)tintedImageCache_cache;
  tintedImageCache_cache = (uint64_t)v0;

}

- (PXCuratedLibraryOverlayButtonConfiguration)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryOverlayButton.m"), 380, CFSTR("%s is not available as initializer"), "-[PXCuratedLibraryOverlayButtonConfiguration init]");

  abort();
}

- (void)setActionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void)setMenuActionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (id)willDisplayMenuActionHandler
{
  return self->_willDisplayMenuActionHandler;
}

- (void)setWillDisplayMenuActionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (id)willDismissMenuActionHandler
{
  return self->_willDismissMenuActionHandler;
}

- (void)setWillDismissMenuActionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void)setSegment:(int64_t)a3
{
  self->_segment = a3;
}

- (void)setImageEdgeInsets:(UIEdgeInsets)a3
{
  self->_imageEdgeInsets = a3;
}

- (void)setHitTestOutsets:(UIEdgeInsets)a3
{
  self->_hitTestOutsets = a3;
}

- (void)setPossibleTitles:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (void)setCaption:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (void)setBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundColor, a3);
}

+ (PXCuratedLibraryOverlayButtonConfiguration)configurationWithSystemImageName:(id)a3 spec:(id)a4
{
  id v5;
  id v6;
  PXCuratedLibraryOverlayButtonConfiguration *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[PXCuratedLibraryOverlayButtonConfiguration initWithSystemImageName:title:spec:buttonType:]([PXCuratedLibraryOverlayButtonConfiguration alloc], "initWithSystemImageName:title:spec:buttonType:", v6, 0, v5, 0);

  return v7;
}

+ (PXCuratedLibraryOverlayButtonConfiguration)configurationWithSystemImageName:(id)a3 title:(id)a4 spec:(id)a5
{
  id v7;
  id v8;
  id v9;
  PXCuratedLibraryOverlayButtonConfiguration *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[PXCuratedLibraryOverlayButtonConfiguration initWithSystemImageName:title:spec:buttonType:]([PXCuratedLibraryOverlayButtonConfiguration alloc], "initWithSystemImageName:title:spec:buttonType:", v9, v8, v7, 0);

  return v10;
}

+ (PXCuratedLibraryOverlayButtonConfiguration)configurationWithButtonType:(int64_t)a3 title:(id)a4 spec:(id)a5
{
  id v7;
  id v8;
  PXCuratedLibraryOverlayButtonConfiguration *v9;

  v7 = a5;
  v8 = a4;
  v9 = -[PXCuratedLibraryOverlayButtonConfiguration initWithSystemImageName:title:spec:buttonType:]([PXCuratedLibraryOverlayButtonConfiguration alloc], "initWithSystemImageName:title:spec:buttonType:", 0, v8, v7, a3);

  return v9;
}

@end
