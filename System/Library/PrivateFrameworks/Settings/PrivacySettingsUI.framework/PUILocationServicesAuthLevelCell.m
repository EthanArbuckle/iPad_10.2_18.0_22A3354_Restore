@implementation PUILocationServicesAuthLevelCell

- (PUILocationServicesAuthLevelCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  PUILocationServicesAuthLevelCell *v5;
  PUILocationUsageMixin *v6;
  PUILocationUsageMixin *location;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PUILocationServicesAuthLevelCell;
  v5 = -[PSTableCell initWithStyle:reuseIdentifier:specifier:](&v14, sel_initWithStyle_reuseIdentifier_specifier_, a3, a4, a5);
  if (v5)
  {
    v6 = objc_alloc_init(PUILocationUsageMixin);
    location = v5->_location;
    v5->_location = v6;

    -[PUILocationServicesAuthLevelCell detailTextLabel](v5, "detailTextLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "lightGrayColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTextColor:", v9);

    -[PUILocationUsageMixin authLevelString](v5->_location, "authLevelString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setText:", v10);

    -[PUILocationServicesAuthLevelCell contentView](v5, "contentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUILocationUsageMixin usageIndicator](v5->_location, "usageIndicator");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addSubview:", v12);

  }
  return v5;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  NSString *v11;
  _BOOL4 IsAccessibilityCategory;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  char v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double Height;
  double v26;
  double Width;
  double v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  char v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  CGFloat v44;
  double MaxX;
  double MinX;
  double v47;
  double v48;
  void *v49;
  uint64_t v50;
  double v51;
  void *v52;
  CGFloat v53;
  CGFloat v54;
  double v55;
  double v56;
  void *v57;
  uint64_t v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  void *v65;
  double v66;
  double v67;
  double v68;
  double v69;
  objc_super v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;
  CGRect v80;
  CGRect v81;
  CGRect v82;
  CGRect v83;
  CGRect v84;
  CGRect v85;
  CGRect v86;
  CGRect v87;
  CGRect v88;

  v70.receiver = self;
  v70.super_class = (Class)PUILocationServicesAuthLevelCell;
  -[PSTableCell layoutSubviews](&v70, sel_layoutSubviews);
  -[PUILocationServicesAuthLevelCell detailTextLabel](self, "detailTextLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUILocationUsageMixin authLevelString](self->_location, "authLevelString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v3, "setText:", v4);
  -[PUILocationUsageMixin usageIndicator](self->_location, "usageIndicator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isHidden") & 1) == 0)
  {
    objc_msgSend(v3, "frame");
    v7 = v6;
    v9 = v8;
    -[PUILocationServicesAuthLevelCell traitCollection](self, "traitCollection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "preferredContentSizeCategory");
    v11 = (NSString *)objc_claimAutoreleasedReturnValue();
    IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v11);

    if (IsAccessibilityCategory)
    {
      objc_msgSend(v3, "frame");
      v14 = v13;
      v68 = v15;
      v17 = v16;
      v19 = v18;
      v20 = -[PUILocationServicesAuthLevelCell _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
      objc_msgSend(v5, "frame");
      v22 = v21;
      v24 = v23;
      objc_msgSend(v3, "frame");
      Height = CGRectGetHeight(v71);
      objc_msgSend(v5, "frame");
      v26 = v9 + (Height - CGRectGetHeight(v72)) * 0.5;
      if ((v20 & 1) != 0)
      {
        objc_msgSend(v3, "frame");
        Width = CGRectGetWidth(v73);
        objc_msgSend(v5, "frame");
        objc_msgSend(v5, "setFrame:", v7 + Width - CGRectGetWidth(v74), v26, v22, v24);
        objc_msgSend(v5, "frame");
        v28 = v14 - (CGRectGetWidth(v75) + 6.0);
      }
      else
      {
        objc_msgSend(v5, "setFrame:", v7, v26, v22, v24);
        objc_msgSend(v5, "frame");
        v28 = v14 + CGRectGetWidth(v81) + 6.0;
      }
      objc_msgSend(v3, "setFrame:", v28, v68, v17, v19);
      objc_msgSend(v3, "text");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = objc_msgSend(v49, "length");

      if (!v50)
      {
        v51 = 6.0;
        if ((-[PUILocationServicesAuthLevelCell _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection") & 1) == 0)
        {
          -[PUILocationServicesAuthLevelCell contentView](self, "contentView");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "bounds");
          v53 = CGRectGetWidth(v82) + -6.0;
          objc_msgSend(v5, "frame");
          v51 = v53 - CGRectGetWidth(v83);

        }
        objc_msgSend(v5, "setFrame:", v51, v26, v22, v24);
      }
      goto LABEL_19;
    }
    -[PUILocationServicesAuthLevelCell textLabel](self, "textLabel");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "frame");
    v69 = v30;
    v32 = v31;
    v34 = v33;
    v36 = v35;
    v37 = -[PUILocationServicesAuthLevelCell _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
    objc_msgSend(v5, "frame");
    v39 = v38;
    v41 = v40;
    objc_msgSend(v3, "frame");
    v42 = CGRectGetHeight(v76);
    objc_msgSend(v5, "frame");
    v43 = v9 + (v42 - CGRectGetHeight(v77)) * 0.5;
    if ((v37 & 1) != 0)
    {
      objc_msgSend(v3, "frame");
      v44 = v7 + CGRectGetWidth(v78) + 6.0;
      objc_msgSend(v5, "setFrame:", v44, v43, v39, v41);
      v79.origin.x = v44;
      v79.origin.y = v43;
      v79.size.width = v39;
      v79.size.height = v41;
      MaxX = CGRectGetMaxX(v79);
      v80.origin.x = v69;
      v80.origin.y = v32;
      v80.size.width = v34;
      v80.size.height = v36;
      MinX = CGRectGetMinX(v80);
      if (MinX + -6.0 < MaxX)
      {
        v47 = MaxX - MinX + 6.0;
        v48 = v69 + v47;
LABEL_17:
        objc_msgSend(v29, "setFrame:", v48, v32, v34 - v47, v36);
      }
    }
    else
    {
      objc_msgSend(v5, "frame");
      v54 = v7 - (CGRectGetWidth(v84) + 6.0);
      objc_msgSend(v5, "setFrame:", v54, v43, v39, v41);
      v85.origin.x = v54;
      v85.origin.y = v43;
      v85.size.width = v39;
      v85.size.height = v41;
      v55 = CGRectGetMinX(v85);
      v48 = v69;
      v86.origin.x = v69;
      v86.origin.y = v32;
      v86.size.width = v34;
      v86.size.height = v36;
      v56 = CGRectGetMaxX(v86);
      if (v56 + 6.0 > v55)
      {
        v47 = v56 - v55 + 6.0;
        goto LABEL_17;
      }
    }

LABEL_19:
    objc_msgSend(v3, "text");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = objc_msgSend(v57, "length");

    if (!v58)
    {
      objc_msgSend(v5, "frame");
      v60 = v59;
      v62 = v61;
      v64 = v63;
      -[PUILocationServicesAuthLevelCell contentView](self, "contentView");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "bounds");
      v66 = CGRectGetHeight(v87);
      objc_msgSend(v5, "bounds");
      v67 = (v66 - CGRectGetHeight(v88)) * 0.5;

      objc_msgSend(v5, "setFrame:", v60, v67, v62, v64);
    }
  }

}

- (BOOL)canReload
{
  return 1;
}

- (id)getLazyIconID
{
  uint64_t v3;
  void *v4;
  void *v5;
  _BOOL4 isWebApp;
  void *v7;
  objc_super v9;

  v3 = (int)*MEMORY[0x1E0D805F8];
  if (*(Class *)((char *)&self->super.super.super.super.super.isa + v3))
  {
    if (!self->_isWebApp)
      goto LABEL_6;
  }
  else
  {
    -[PSTableCell specifier](self, "specifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D80880]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      isWebApp = self->_isWebApp;

      if (!isWebApp)
      {
LABEL_6:
        v9.receiver = self;
        v9.super_class = (Class)PUILocationServicesAuthLevelCell;
        -[PSTableCell getLazyIconID](&v9, sel_getLazyIconID);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        return v7;
      }
    }
    else
    {

    }
  }
  if (self->_isWebApp)
    objc_msgSend(MEMORY[0x1E0DC3F68], "webClipIdentifierFromBundleIdentifier:", *(Class *)((char *)&self->super.super.super.super.super.isa + v3));
  else
    -[NSURL absoluteString](self->_bundleURL, "absoluteString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  return v7;
}

- (id)getLazyIcon
{
  uint64_t v3;
  void *v4;
  void *v5;
  _BOOL4 isWebApp;
  void *v8;
  void *v9;
  void *v10;
  __CFBundle *v11;
  __CFBundle *v12;
  CFStringRef Identifier;
  void *v14;
  uint64_t v15;
  const void *v16;
  void *v17;
  double v18;
  objc_super v19;
  objc_super v20;

  v3 = (int)*MEMORY[0x1E0D805F8];
  if (*(Class *)((char *)&self->super.super.super.super.super.isa + v3))
  {
    if (!self->_isWebApp)
      goto LABEL_6;
  }
  else
  {
    -[PSTableCell specifier](self, "specifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D80880]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      isWebApp = self->_isWebApp;

      if (!isWebApp)
      {
LABEL_6:
        v20.receiver = self;
        v20.super_class = (Class)PUILocationServicesAuthLevelCell;
        -[PSTableCell getLazyIcon](&v20, sel_getLazyIcon);
        return (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {

    }
  }
  if (getLazyIcon_onceToken != -1)
    dispatch_once(&getLazyIcon_onceToken, &__block_literal_global_168);
  if (self->_isWebApp)
  {
    objc_msgSend(MEMORY[0x1E0DC3F68], "webClipIdentifierFromBundleIdentifier:", *(Class *)((char *)&self->super.super.super.super.super.isa + v3));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3F68], "webClipWithIdentifier:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "generateIconImageForFormat:scale:", 0, *(double *)&getLazyIcon_screenScale);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      v19.receiver = self;
      v19.super_class = (Class)PUILocationServicesAuthLevelCell;
      -[PSTableCell getLazyIcon](&v19, sel_getLazyIcon);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v11 = CFBundleCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (CFURLRef)self->_bundleURL);
    if (!v11)
      return 0;
    v12 = v11;
    v18 = *(double *)&getLazyIcon_screenScale;
    Identifier = CFBundleGetIdentifier(v11);
    if (CFEqual(Identifier, CFSTR("com.apple.weather-framework")))
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", CFSTR("/System/Library/PrivateFrameworks/Weather.framework"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3870], "imageNamed:inBundle:", CFSTR("IconMasked-table"), v14);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3870], "_iconVariantForUIApplicationIconFormat:scale:", 0, &v18);
      v15 = LICreateIconForBundle();
      if (v15)
      {
        v16 = (const void *)v15;
        CFBundleGetIdentifier(v12);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v17, "isEqualToString:", CFSTR("com.apple.AssistantServices")))
          PSSiriImage();
        else
          objc_msgSend(MEMORY[0x1E0DC3870], "imageWithCGImage:scale:orientation:", v16, 0, v18);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        CFRelease(v16);

      }
      else
      {
        v10 = 0;
      }
    }
    CFRelease(v12);
  }
  return v10;
}

void __47__PUILocationServicesAuthLevelCell_getLazyIcon__block_invoke()
{
  uint64_t v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "scale");
  getLazyIcon_screenScale = v0;

}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v4;
  NSURL *v5;
  NSURL *bundleURL;
  objc_super v7;

  v4 = a3;
  objc_msgSend(v4, "propertyForKey:", CFSTR("_BundleUrl_"));
  v5 = (NSURL *)objc_claimAutoreleasedReturnValue();
  bundleURL = self->_bundleURL;
  self->_bundleURL = v5;

  v7.receiver = self;
  v7.super_class = (Class)PUILocationServicesAuthLevelCell;
  -[PSTableCell refreshCellContentsWithSpecifier:](&v7, sel_refreshCellContentsWithSpecifier_, v4);

}

- (PUILocationUsageMixin)location
{
  return self->_location;
}

- (unint64_t)authLevel
{
  return self->_authLevel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_bundleURL, 0);
}

@end
