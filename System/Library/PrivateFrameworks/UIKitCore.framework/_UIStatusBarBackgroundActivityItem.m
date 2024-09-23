@implementation _UIStatusBarBackgroundActivityItem

+ (_UIStatusBarIdentifier)backgroundDisplayIdentifier
{
  return (_UIStatusBarIdentifier *)objc_msgSend(a1, "displayItemIdentifierFromString:", CFSTR("backgroundDisplayIdentifier"));
}

+ (_UIStatusBarIdentifier)secondaryIconDisplayIdentifier
{
  return (_UIStatusBarIdentifier *)objc_msgSend(a1, "displayItemIdentifierFromString:", CFSTR("secondaryIconDisplayIdentifier"));
}

- (_UIStatusBarBackgroundActivityItem)initWithIdentifier:(id)a3 statusBar:(id)a4
{
  _UIStatusBarBackgroundActivityItem *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIStatusBarBackgroundActivityItem;
  result = -[_UIStatusBarItem initWithIdentifier:statusBar:](&v5, sel_initWithIdentifier_statusBar_, a3, a4);
  if (result)
    result->_previousType = -1;
  return result;
}

- (id)indicatorEntryKey
{
  return CFSTR("backgroundActivityEntry");
}

- (id)createDisplayItemForIdentifier:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIStatusBarBackgroundActivityItem;
  -[_UIStatusBarItem createDisplayItemForIdentifier:](&v7, sel_createDisplayItemForIdentifier_, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "backgroundDisplayIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 == v5)
    objc_msgSend(v3, "setBackground:", 1);
  return v3;
}

- (id)_backgroundActivityViewForIdentifier:(id)a3
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "backgroundDisplayIdentifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    -[_UIStatusBarBackgroundActivityItem backgroundView](self, "backgroundView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

+ (BOOL)_identifierContainsItemImage:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(a1, "defaultDisplayIdentifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  return v5 == v4;
}

+ (BOOL)_identifierContainsSecondaryItemImage:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(a1, "secondaryIconDisplayIdentifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  return v5 == v4;
}

- (BOOL)canEnableDisplayItem:(id)a3 fromData:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  BOOL v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "secondaryIconDisplayIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 == v9)
  {
    v10 = 0;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)_UIStatusBarBackgroundActivityItem;
    v10 = -[_UIStatusBarItem canEnableDisplayItem:fromData:](&v12, sel_canEnableDisplayItem_fromData_, v6, v7);
  }

  return v10;
}

- (id)applyUpdate:(id)a3 toDisplayItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  void *v40;
  void *v41;
  void *v43;
  void *v44;
  objc_super v45;
  _QWORD v46[4];
  id v47;
  id v48;
  objc_super v49;
  uint8_t buf[4];
  uint64_t v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v49.receiver = self;
  v49.super_class = (Class)_UIStatusBarBackgroundActivityItem;
  -[_UIStatusBarIndicatorItem applyUpdate:toDisplayItem:](&v49, sel_applyUpdate_toDisplayItem_, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "data");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "backgroundActivityEntry");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "type");
  if (objc_msgSend(v6, "dataChanged"))
  {
    _UIStatusBar_Log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v51 = v11;
      _os_log_impl(&dword_185066000, v12, OS_LOG_TYPE_DEFAULT, "Updating background activity item to type: %li", buf, 0xCu);
    }

    objc_msgSend(v7, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIStatusBarBackgroundActivityItem _backgroundActivityViewForIdentifier:](self, "_backgroundActivityViewForIdentifier:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v43 = v10;
      -[_UIStatusBarBackgroundActivityItem _backgroundColorForActivityType:](self, "_backgroundColorForActivityType:", v11);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[_UIStatusBarBackgroundActivityItem crossfadeForUpdate:](self, "crossfadeForUpdate:", v6))
      {
        v46[0] = MEMORY[0x1E0C809B0];
        v46[1] = 3221225472;
        v46[2] = __64___UIStatusBarBackgroundActivityItem_applyUpdate_toDisplayItem___block_invoke;
        v46[3] = &unk_1E16E0278;
        v47 = v14;
        v48 = v15;
        +[_UIStatusBarAnimation animationWithBlock:](_UIStatusBarAnimation, "animationWithBlock:", v46);
        v16 = objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v16 = (uint64_t)v8;
        objc_msgSend(v14, "setPillColor:", v15);
      }
      objc_msgSend(v6, "styleAttributes");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "traitCollection");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIStatusBarBackgroundActivityItem _visualEffectForActivityType:traitCollection:](self, "_visualEffectForActivityType:traitCollection:", v11, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setVisualEffect:", v19);

      objc_msgSend(v6, "styleAttributes");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "traitCollection");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setPulsing:", -[_UIStatusBarBackgroundActivityItem _shouldPulseForActivityType:traitCollection:](self, "_shouldPulseForActivityType:traitCollection:", v11, v21));

      v8 = (void *)v16;
      v10 = v43;
    }
    -[_UIStatusBarBackgroundActivityItem iconView](self, "iconView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "styleAttributes");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "traitCollection");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setRinging:forUpdate:", -[_UIStatusBarBackgroundActivityItem _shouldRingForActivityType:traitCollection:](self, "_shouldRingForActivityType:traitCollection:", v11, v24), v6);

  }
  v25 = (void *)objc_opt_class();
  objc_msgSend(v7, "identifier");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v25, "_identifierContainsItemImage:", v26)
    || !objc_msgSend(v7, "isEnabled"))
  {
    goto LABEL_18;
  }
  if ((objc_msgSend(v6, "styleAttributesChanged") & 1) != 0)
  {

LABEL_15:
    objc_msgSend(v6, "styleAttributes");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(v28, "copy");

    objc_msgSend((id)objc_opt_class(), "_fontSizeAdjustmentForActivityType:", v11);
    if (v29 != 0.0)
    {
      v30 = v29;
      objc_msgSend(v26, "font");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "fontDescriptor");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "font");
      v44 = v10;
      v33 = v8;
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "pointSize");
      objc_msgSend(off_1E167A828, "fontWithDescriptor:size:", v32, v30 + v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setFont:", v36);

      v8 = v33;
      v10 = v44;

    }
    objc_msgSend((id)objc_opt_class(), "_verticalOffsetForActivityType:", v11);
    objc_msgSend(v7, "setCenterOffset:");
    v45.receiver = self;
    v45.super_class = (Class)_UIStatusBarBackgroundActivityItem;
    -[_UIStatusBarItem applyStyleAttributes:toDisplayItem:](&v45, sel_applyStyleAttributes_toDisplayItem_, v26, v7);
LABEL_18:

    goto LABEL_19;
  }
  v27 = objc_msgSend(v6, "dataChanged");

  if ((v27 & 1) != 0)
    goto LABEL_15;
LABEL_19:
  v37 = (void *)objc_opt_class();
  objc_msgSend(v7, "identifier");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v37, "_identifierContainsSecondaryItemImage:", v38)
    || !objc_msgSend(v7, "isEnabled"))
  {
    goto LABEL_23;
  }
  v39 = objc_msgSend(v6, "dataChanged");

  if (v39)
  {
    -[_UIStatusBarBackgroundActivityItem secondaryImageForUpdate:](self, "secondaryImageForUpdate:", v6);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIStatusBarBackgroundActivityItem secondaryIconView](self, "secondaryIconView");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setEnabled:", v38 != 0);

    -[_UIStatusBarBackgroundActivityItem secondaryIconView](self, "secondaryIconView");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setImage:", v38);

LABEL_23:
  }

  return v8;
}

- (void)updatedDisplayItemsWithData:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIStatusBarBackgroundActivityItem;
  v4 = a3;
  -[_UIStatusBarItem updatedDisplayItemsWithData:](&v6, sel_updatedDisplayItemsWithData_, v4);
  objc_msgSend(v4, "backgroundActivityEntry", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    self->_previousType = objc_msgSend(v5, "type");

}

- (void)applyStyleAttributes:(id)a3 toDisplayItem:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  objc_super v10;

  v6 = a3;
  v7 = a4;
  v8 = objc_opt_class();
  objc_msgSend(v7, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v8) = objc_msgSend((id)v8, "_identifierContainsItemImage:", v9);

  if ((v8 & 1) == 0)
  {
    v10.receiver = self;
    v10.super_class = (Class)_UIStatusBarBackgroundActivityItem;
    -[_UIStatusBarItem applyStyleAttributes:toDisplayItem:](&v10, sel_applyStyleAttributes_toDisplayItem_, v6, v7);
  }

}

- (id)systemImageNameForUpdate:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "backgroundActivityEntry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBarBackgroundActivityItem _systemImageNameForActivityType:](self, "_systemImageNameForActivityType:", objc_msgSend(v5, "type"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)imageNameForUpdate:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "backgroundActivityEntry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBarBackgroundActivityItem _imageNameForActivityType:](self, "_imageNameForActivityType:", objc_msgSend(v5, "type"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_systemImageNameForActivityType:(int64_t)a3
{
  if ((unint64_t)(a3 - 2) > 0x23)
    return 0;
  else
    return off_1E16E0298[a3 - 2];
}

- (id)_imageNameForActivityType:(int64_t)a3
{
  const __CFString *v4;

  if (a3 <= 19)
  {
    v4 = CFSTR("BackgroundTask_satellite-disconnected");
    if (a3 != 1)
      v4 = 0;
    if (a3)
      return (id)v4;
    else
      return CFSTR("BackgroundTask_satellite");
  }
  else
  {
    switch(a3)
    {
      case 20:
        return CFSTR("BackgroundTask_screen-sharing");
      case 23:
        return CFSTR("BackgroundTask_dongle");
      case 25:
        return CFSTR("BackgroundTask_screen-sharing");
      default:
        return 0;
    }
  }
}

- (id)_textLabelForActivityType:(int64_t)a3
{
  if (a3 == 36)
    return CFSTR("SOS");
  else
    return 0;
}

- (id)imageForUpdate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  UIGraphicsImageRenderer *v15;
  UIGraphicsImageRenderer *v16;
  id v17;
  void *v18;
  objc_super v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[2];
  _QWORD v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "backgroundActivityEntry");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "type");

  -[_UIStatusBarBackgroundActivityItem _textLabelForActivityType:](self, "_textLabelForActivityType:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = objc_alloc(MEMORY[0x1E0CB3498]);
    v23[0] = *(_QWORD *)off_1E1678D90;
    objc_msgSend(v4, "styleAttributes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "smallFont");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v11;
    v23[1] = *(_QWORD *)off_1E1678D98;
    +[UIColor whiteColor](UIColor, "whiteColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v24[1] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v9, "initWithString:attributes:", v8, v13);

    v15 = [UIGraphicsImageRenderer alloc];
    objc_msgSend(v14, "size");
    v16 = -[UIGraphicsImageRenderer initWithSize:](v15, "initWithSize:");
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __53___UIStatusBarBackgroundActivityItem_imageForUpdate___block_invoke;
    v21[3] = &unk_1E16B5018;
    v22 = v14;
    v17 = v14;
    -[UIGraphicsImageRenderer imageWithActions:](v16, "imageWithActions:", v21);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)_UIStatusBarBackgroundActivityItem;
    -[_UIStatusBarIndicatorItem imageForUpdate:](&v20, sel_imageForUpdate_, v4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v18;
}

- (id)_secondarySystemImageNameForActivityType:(int64_t)a3
{
  return 0;
}

- (id)secondaryImageForUpdate:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a3, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "backgroundActivityEntry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBarBackgroundActivityItem _secondarySystemImageNameForActivityType:](self, "_secondarySystemImageNameForActivityType:", objc_msgSend(v5, "type"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    +[UIImage _systemImageNamed:](UIImage, "_systemImageNamed:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (double)_verticalOffsetForActivityType:(int64_t)a3
{
  double v3;
  void *v4;
  double v5;

  v3 = 0.0;
  if (a3 == 6)
  {
    +[UIScreen mainScreen](UIScreen, "mainScreen");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "scale");
    v3 = 1.0 / v5;

  }
  return v3;
}

+ (double)_fontSizeAdjustmentForActivityType:(int64_t)a3
{
  BOOL v3;
  double result;

  v3 = a3 == 37 || a3 == 3;
  result = 0.0;
  if (v3)
    return -1.0;
  return result;
}

- (id)_backgroundColorForActivityType:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  switch(a3)
  {
    case 0:
    case 6:
    case 7:
    case 19:
    case 34:
      +[UIColor systemGreenColor](UIColor, "systemGreenColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 1:
    case 21:
      +[UIColor systemGray4Color](UIColor, "systemGray4Color", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 2:
    case 3:
    case 4:
    case 5:
      +[UIColor clearColor](UIColor, "clearColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 8:
    case 9:
    case 14:
    case 15:
    case 16:
    case 23:
    case 24:
    case 27:
    case 28:
    case 29:
    case 30:
    case 31:
    case 32:
    case 35:
      +[UIColor systemBlueColor](UIColor, "systemBlueColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 10:
    case 12:
    case 26:
    case 36:
      +[UIColor systemRedColor](UIColor, "systemRedColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 11:
    case 13:
    case 17:
    case 18:
      +[UIColor systemOrangeColor](UIColor, "systemOrangeColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 20:
    case 25:
      +[UIColor systemIndigoColor](UIColor, "systemIndigoColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 22:
      +[UIColor _swiftColor](UIColor, "_swiftColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 33:
      +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.28627451, 0.0901960784, 0.439215686, 1.0, v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 37:
      +[UIColor systemGrayColor](UIColor, "systemGrayColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v5 = 0;
      break;
  }
  return v5;
}

- (BOOL)_shouldRingForActivityType:(int64_t)a3 traitCollection:(id)a4
{
  uint64_t v5;

  v5 = objc_msgSend(a4, "userInterfaceIdiom");
  return (a3 & 0xFFFFFFFFFFFFFFFELL) == 2 && v5 != 3;
}

- (BOOL)_shouldPulseForActivityType:(int64_t)a3 traitCollection:(id)a4
{
  uint64_t v5;
  unsigned int v6;

  v5 = objc_msgSend(a4, "userInterfaceIdiom");
  if ((unint64_t)a3 <= 0x1B)
    v6 = (0x7FFFDF0u >> a3) & 1;
  else
    LOBYTE(v6) = 1;
  if (v5 == 3)
    return 0;
  else
    return v6;
}

- (id)_visualEffectForActivityType:(int64_t)a3 traitCollection:(id)a4
{
  uint64_t v5;
  void *v6;

  v5 = objc_msgSend(a4, "userInterfaceIdiom");
  v6 = 0;
  if ((unint64_t)(a3 - 2) <= 3 && v5 != 3)
  {
    +[UIBlurEffect effectWithStyle:](UIBlurEffect, "effectWithStyle:", 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (_UIStatusBarPillView)backgroundView
{
  _UIStatusBarPillView *backgroundView;

  backgroundView = self->_backgroundView;
  if (!backgroundView)
  {
    -[_UIStatusBarBackgroundActivityItem _create_backgroundView](self, "_create_backgroundView");
    backgroundView = self->_backgroundView;
  }
  return backgroundView;
}

- (void)_create_backgroundView
{
  _UIStatusBarPillView *v3;
  _UIStatusBarPillView *v4;
  _UIStatusBarPillView *backgroundView;

  v3 = [_UIStatusBarPillView alloc];
  v4 = -[_UIStatusBarPillView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  backgroundView = self->_backgroundView;
  self->_backgroundView = v4;

}

- (_UIStatusBarActivityIconView)iconView
{
  _UIStatusBarActivityIconView *iconView;

  iconView = self->_iconView;
  if (!iconView)
  {
    -[_UIStatusBarBackgroundActivityItem _create_iconView](self, "_create_iconView");
    iconView = self->_iconView;
  }
  return iconView;
}

- (void)_create_iconView
{
  _UIStatusBarActivityIconView *v3;
  _UIStatusBarActivityIconView *v4;
  _UIStatusBarActivityIconView *iconView;

  v3 = [_UIStatusBarActivityIconView alloc];
  v4 = -[_UIStatusBarImageView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  iconView = self->_iconView;
  self->_iconView = v4;

}

- (_UIStatusBarImageView)secondaryIconView
{
  _UIStatusBarImageView *secondaryIconView;

  secondaryIconView = self->_secondaryIconView;
  if (!secondaryIconView)
  {
    -[_UIStatusBarBackgroundActivityItem _create_secondaryIconView](self, "_create_secondaryIconView");
    secondaryIconView = self->_secondaryIconView;
  }
  return secondaryIconView;
}

- (void)_create_secondaryIconView
{
  _UIStatusBarImageView *v3;
  _UIStatusBarImageView *v4;
  _UIStatusBarImageView *secondaryIconView;

  v3 = [_UIStatusBarImageView alloc];
  v4 = -[_UIStatusBarImageView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  secondaryIconView = self->_secondaryIconView;
  self->_secondaryIconView = v4;

}

- (id)viewForIdentifier:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "backgroundDisplayIdentifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    -[_UIStatusBarBackgroundActivityItem backgroundView](self, "backgroundView");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "secondaryIconDisplayIdentifier");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    if (v6 == v4)
    {
      -[_UIStatusBarBackgroundActivityItem secondaryIconView](self, "secondaryIconView");
      v7 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10.receiver = self;
      v10.super_class = (Class)_UIStatusBarBackgroundActivityItem;
      -[_UIStatusBarIndicatorItem viewForIdentifier:](&v10, sel_viewForIdentifier_, v4);
      v7 = objc_claimAutoreleasedReturnValue();
    }
  }
  v8 = (void *)v7;

  return v8;
}

- (id)additionAnimationForDisplayItemWithIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  objc_super v8;
  uint8_t buf[16];

  v4 = a3;
  _UIStatusBar_Log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_185066000, v5, OS_LOG_TYPE_DEFAULT, "Adding default background activity item view", buf, 2u);
  }

  v8.receiver = self;
  v8.super_class = (Class)_UIStatusBarBackgroundActivityItem;
  -[_UIStatusBarItem additionAnimationForDisplayItemWithIdentifier:](&v8, sel_additionAnimationForDisplayItemWithIdentifier_, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)removalAnimationForDisplayItemWithIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  objc_super v8;
  uint8_t buf[16];

  v4 = a3;
  _UIStatusBar_Log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_185066000, v5, OS_LOG_TYPE_DEFAULT, "Removing default background activity item view", buf, 2u);
  }

  v8.receiver = self;
  v8.super_class = (Class)_UIStatusBarBackgroundActivityItem;
  -[_UIStatusBarItem removalAnimationForDisplayItemWithIdentifier:](&v8, sel_removalAnimationForDisplayItemWithIdentifier_, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)crossfadeForUpdate:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  int64_t previousType;
  BOOL v10;
  BOOL v13;

  objc_msgSend(a3, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "backgroundActivityEntry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "type");

  previousType = self->_previousType;
  if (previousType == 21 && v6 == 19)
  {
    v10 = 1;
  }
  else
  {
    v10 = previousType == 19 && v6 == 21;
    if (previousType == 1 && v6 == 0)
      return 1;
  }
  if (previousType)
    v13 = 0;
  else
    v13 = v6 == 1;
  return v13 || v10;
}

- (void)setBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundView, a3);
}

- (void)setIconView:(id)a3
{
  objc_storeStrong((id *)&self->_iconView, a3);
}

- (void)setSecondaryIconView:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryIconView, a3);
}

- (int64_t)previousType
{
  return self->_previousType;
}

- (void)setPreviousType:(int64_t)a3
{
  self->_previousType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryIconView, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end
