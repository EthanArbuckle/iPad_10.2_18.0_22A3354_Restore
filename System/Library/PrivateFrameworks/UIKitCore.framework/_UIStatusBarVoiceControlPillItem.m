@implementation _UIStatusBarVoiceControlPillItem

- (id)createDisplayItemForIdentifier:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  objc_super v23;
  _QWORD v24[5];

  v24[4] = *MEMORY[0x1E0C80C00];
  v23.receiver = self;
  v23.super_class = (Class)_UIStatusBarVoiceControlPillItem;
  -[_UIStatusBarItem createDisplayItemForIdentifier:](&v23, sel_createDisplayItemForIdentifier_, a3);
  v19 = (id)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBarVoiceControlPillItem pillSize](self, "pillSize");
  v5 = v4;
  v7 = v6;
  -[_UIStatusBarVoiceControlPillItem pillView](self, "pillView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[_UIStatusBarIndicatorItem imageView](self, "imageView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v9, "setFontStyle:", 0);
  objc_msgSend(v8, "addSubview:", v9);
  objc_msgSend(v8, "setSubviewForBaselineAlignment:", v9);
  objc_msgSend(v9, "centerXAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "centerXAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToAnchor:", v21);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v20;
  objc_msgSend(v9, "centerYAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "centerYAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToAnchor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v12;
  objc_msgSend(v8, "widthAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToConstant:", v5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v14;
  objc_msgSend(v8, "heightAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToConstant:", v7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v24[3] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D156E0], "activateConstraints:", v17);
  return v19;
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
  v15.super_class = (Class)_UIStatusBarVoiceControlPillItem;
  -[_UIStatusBarVoiceControlItem applyUpdate:toDisplayItem:](&v15, sel_applyUpdate_toDisplayItem_, v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "data");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "voiceControlEntry");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v6, "dataChanged") & 1) != 0 || objc_msgSend(v6, "styleAttributesChanged"))
  {
    v10 = objc_msgSend(v9, "type");
    -[_UIStatusBarVoiceControlPillItem pillView](self, "pillView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "styleAttributes");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIStatusBarVoiceControlPillItem _backgroundColorForVoiceControlType:styleAttributes:](self, "_backgroundColorForVoiceControlType:styleAttributes:", v10, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setPillColor:", v13);

    objc_msgSend(v11, "setPulsing:", -[_UIStatusBarVoiceControlPillItem _pulsingForVoiceControlType:](self, "_pulsingForVoiceControlType:", v10));
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
  v4.super_class = (Class)_UIStatusBarVoiceControlPillItem;
  -[_UIStatusBarVoiceControlItem imageOpacityForVoiceControlType:](&v4, sel_imageOpacityForVoiceControlType_);
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
      +[UIColor systemRedColor](UIColor, "systemRedColor");
      v9 = objc_claimAutoreleasedReturnValue();
LABEL_7:
      v4 = (void *)v9;
      break;
    case 1:
      +[UIColor systemBlueColor](UIColor, "systemBlueColor");
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

- (_UIStatusBarPillView)pillView
{
  _UIStatusBarPillView *pillView;

  pillView = self->_pillView;
  if (!pillView)
  {
    -[_UIStatusBarVoiceControlPillItem _create_pillView](self, "_create_pillView");
    pillView = self->_pillView;
  }
  return pillView;
}

- (void)_create_pillView
{
  _UIStatusBarPillView *v3;
  _UIStatusBarPillView *v4;
  _UIStatusBarPillView *pillView;

  v3 = [_UIStatusBarPillView alloc];
  v4 = -[_UIStatusBarPillView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  pillView = self->_pillView;
  self->_pillView = v4;

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

- (void)setPillSize:(CGSize)a3
{
  self->_pillSize = a3;
}

- (void)setPillView:(id)a3
{
  objc_storeStrong((id *)&self->_pillView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pillView, 0);
}

@end
