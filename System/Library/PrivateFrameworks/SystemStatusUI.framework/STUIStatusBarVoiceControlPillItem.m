@implementation STUIStatusBarVoiceControlPillItem

- (void)setPillSize:(CGSize)a3
{
  self->_pillSize = a3;
}

- (id)createDisplayItemForIdentifier:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  objc_super v29;
  _QWORD v30[8];

  v30[6] = *MEMORY[0x1E0C80C00];
  v29.receiver = self;
  v29.super_class = (Class)STUIStatusBarVoiceControlPillItem;
  -[STUIStatusBarItem createDisplayItemForIdentifier:](&v29, sel_createDisplayItemForIdentifier_, a3);
  v21 = (id)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarVoiceControlPillItem pillSize](self, "pillSize");
  v5 = v4;
  v7 = v6;
  -[STUIStatusBarVoiceControlPillItem pillView](self, "pillView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[STUIStatusBarIndicatorItem imageView](self, "imageView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v9, "setFontStyle:", 0);
  objc_msgSend(v8, "addSubview:", v9);
  objc_msgSend(v8, "setSubviewForBaselineAlignment:", v9);
  objc_msgSend(v9, "centerXAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "centerXAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToAnchor:", v27);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v26;
  objc_msgSend(v9, "centerYAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "centerYAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintEqualToAnchor:", v24);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = v23;
  objc_msgSend(v9, "widthAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarVoiceControlPillItem pillPadding](self, "pillPadding");
  objc_msgSend(v22, "constraintEqualToConstant:", v5 - v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v30[2] = v11;
  objc_msgSend(v9, "heightAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarVoiceControlPillItem pillPadding](self, "pillPadding");
  objc_msgSend(v12, "constraintEqualToConstant:", v7 - v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v30[3] = v14;
  objc_msgSend(v8, "widthAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToConstant:", v5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v30[4] = v16;
  objc_msgSend(v8, "heightAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToConstant:", v7);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v30[5] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 6);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v19);
  return v21;
}

- (STUIStatusBarPillView)pillView
{
  STUIStatusBarPillView *pillView;

  pillView = self->_pillView;
  if (!pillView)
  {
    -[STUIStatusBarVoiceControlPillItem _create_pillView](self, "_create_pillView");
    pillView = self->_pillView;
  }
  return pillView;
}

- (CGSize)pillSize
{
  double width;
  double height;
  CGSize result;

  width = self->_pillSize.width;
  height = self->_pillSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)_create_pillView
{
  STUIStatusBarPillView *v3;
  STUIStatusBarPillView *v4;
  STUIStatusBarPillView *pillView;

  v3 = [STUIStatusBarPillView alloc];
  v4 = -[STUIStatusBarPillView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  pillView = self->_pillView;
  self->_pillView = v4;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pillView, 0);
}

- (id)applyUpdate:(id)a3 toDisplayItem:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)STUIStatusBarVoiceControlPillItem;
  -[STUIStatusBarVoiceControlItem applyUpdate:toDisplayItem:](&v15, sel_applyUpdate_toDisplayItem_, v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "data");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "voiceControlEntry");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v6, "dataChanged") & 1) != 0 || objc_msgSend(v6, "styleAttributesChanged"))
  {
    v10 = objc_msgSend(v9, "type");
    -[STUIStatusBarVoiceControlPillItem pillView](self, "pillView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "styleAttributes");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[STUIStatusBarVoiceControlPillItem _backgroundColorForVoiceControlType:styleAttributes:](self, "_backgroundColorForVoiceControlType:styleAttributes:", v10, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setPillColor:", v13);

    objc_msgSend(v11, "setPulsing:", -[STUIStatusBarVoiceControlPillItem _pulsingForVoiceControlType:](self, "_pulsingForVoiceControlType:", v10));
  }

  return v7;
}

- (double)imageOpacityForVoiceControlType:(int64_t)a3
{
  double result;
  objc_super v4;

  if (!a3)
    return 0.75;
  v4.receiver = self;
  v4.super_class = (Class)STUIStatusBarVoiceControlPillItem;
  -[STUIStatusBarVoiceControlItem imageOpacityForVoiceControlType:](&v4, sel_imageOpacityForVoiceControlType_);
  return result;
}

- (id)_backgroundColorForVoiceControlType:(int64_t)a3 styleAttributes:(id)a4
{
  void *v4;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v6 = a4;
  v7 = v6;
  switch(a3)
  {
    case 2:
      objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
      v9 = objc_claimAutoreleasedReturnValue();
LABEL_7:
      v4 = (void *)v9;
      break;
    case 1:
      objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 0:
      objc_msgSend(v6, "imageTintColor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "colorWithAlphaComponent:", 0.12);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      break;
  }

  return v4;
}

- (BOOL)_pulsingForVoiceControlType:(int64_t)a3
{
  return a3 == 2;
}

- (BOOL)canBecomeFocused
{
  return 0;
}

- (double)pillPadding
{
  return self->_pillPadding;
}

- (void)setPillPadding:(double)a3
{
  self->_pillPadding = a3;
}

- (void)setPillView:(id)a3
{
  objc_storeStrong((id *)&self->_pillView, a3);
}

@end
