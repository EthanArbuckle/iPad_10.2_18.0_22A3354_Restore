@implementation ICTodoButton

+ (CGSize)defaultSize
{
  int IsTextKit2Enabled;
  double v3;
  double v4;
  CGSize result;

  IsTextKit2Enabled = ICInternalSettingsIsTextKit2Enabled();
  v3 = 60.0;
  v4 = 25.0;
  if (IsTextKit2Enabled)
    v3 = 25.0;
  else
    v4 = 34.0;
  result.height = v4;
  result.width = v3;
  return result;
}

+ (CGSize)defaultImageSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 22.0;
  v3 = 22.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (ICTodoButton)init
{
  int IsTextKit2Enabled;
  double v4;
  double v5;

  IsTextKit2Enabled = ICInternalSettingsIsTextKit2Enabled();
  if (IsTextKit2Enabled)
    v4 = 25.0;
  else
    v4 = 60.0;
  if (IsTextKit2Enabled)
    v5 = 25.0;
  else
    v5 = 34.0;
  return -[ICTodoButton initWithFrame:](self, "initWithFrame:", 0.0, 0.0, v4, v5);
}

- (void)setDone:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_done != a3)
  {
    self->_done = a3;
    -[ICTodoButton updateImagesAnimated:](self, "updateImagesAnimated:", a4);
  }
}

- (void)setDone:(BOOL)a3
{
  -[ICTodoButton setDone:animated:](self, "setDone:animated:", a3, 1);
}

- (void)setTrackedParagraph:(id)a3
{
  ICTrackedParagraph **p_trackedParagraph;
  id v5;
  void *v6;

  p_trackedParagraph = &self->_trackedParagraph;
  v5 = a3;
  objc_storeWeak((id *)p_trackedParagraph, v5);
  objc_msgSend(v5, "paragraph");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  self->_trackedParagraphIsRTL = objc_msgSend(v6, "isRTL");
  -[ICTodoButton trackedParagraphDidChange](self, "trackedParagraphDidChange");
}

- (void)setTrackedParagraphIsRTL:(BOOL)a3
{
  if (self->_trackedParagraphIsRTL != a3)
  {
    self->_trackedParagraphIsRTL = a3;
    -[ICTodoButton trackedParagraphDidChange](self, "trackedParagraphDidChange");
  }
}

- (void)setHighlightColor:(id)a3
{
  objc_storeStrong((id *)&self->_highlightColor, a3);
  -[ICTodoButton updateTintColor](self, "updateTintColor");
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)ICTodoButton;
  -[ICTodoButton description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTodoButton accessibilityLabel](self, "accessibilityLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ - %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  void *v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;

  v6 = (void *)MEMORY[0x1E0DC3B28];
  v7 = a5;
  -[ICTodoButton imageView](self, "imageView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "frame");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  objc_msgSend(v7, "identifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "regionWithRect:identifier:", v17, v10, v12, v14, v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  void *v23;
  double v24;
  CGFloat v25;
  void *v26;
  double v27;
  CGFloat v28;
  double x;
  double y;
  double width;
  double height;
  void *v33;
  _BOOL4 v34;
  id *v35;
  void *v36;
  void *v37;
  CGRect v39;
  CGRect v40;

  v5 = objc_alloc(MEMORY[0x1E0DC3D90]);
  -[ICTodoButton imageView](self, "imageView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithView:", v6);

  -[ICTodoButton imageView](self, "imageView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "frame");
  v10 = v9;

  -[ICTodoButton imageView](self, "imageView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "frame");
  v13 = v12;

  if (v10 < v13)
    v10 = v13;
  -[ICTodoButton imageView](self, "imageView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "frame");
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;
  -[ICTodoButton imageView](self, "imageView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "frame");
  v25 = v24 - v10;
  -[ICTodoButton imageView](self, "imageView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "frame");
  v28 = v27 - v10;
  v39.origin.x = v16;
  v39.origin.y = v18;
  v39.size.width = v20;
  v39.size.height = v22;
  v40 = CGRectInset(v39, v25, v28);
  x = v40.origin.x;
  y = v40.origin.y;
  width = v40.size.width;
  height = v40.size.height;

  objc_msgSend(MEMORY[0x1E0DC3B30], "shapeWithRoundedRect:cornerRadius:", x, y, width, height, v10);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = -[ICTodoButton isDone](self, "isDone");
  v35 = (id *)0x1E0DC3B20;
  if (!v34)
    v35 = (id *)0x1E0DC3B00;
  objc_msgSend(*v35, "effectWithPreview:", v7);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3B38], "styleWithEffect:shape:", v36, v33);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  return v37;
}

- (BOOL)isDone
{
  return self->_done;
}

- (ICTrackedParagraph)trackedParagraph
{
  return (ICTrackedParagraph *)objc_loadWeakRetained((id *)&self->_trackedParagraph);
}

- (UIColor)highlightColor
{
  return self->_highlightColor;
}

- (UIColor)overrideTintColor
{
  return self->_overrideTintColor;
}

- (void)setOverrideTintColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 776);
}

- (CGSize)defaultImageSize
{
  double width;
  double height;
  CGSize result;

  width = self->_defaultImageSize.width;
  height = self->_defaultImageSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setDefaultImageSize:(CGSize)a3
{
  self->_defaultImageSize = a3;
}

- (BOOL)trackedParagraphIsRTL
{
  return self->_trackedParagraphIsRTL;
}

- (BOOL)useConstraintBasedRendering
{
  return self->_useConstraintBasedRendering;
}

- (void)setUseConstraintBasedRendering:(BOOL)a3
{
  self->_useConstraintBasedRendering = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideTintColor, 0);
  objc_storeStrong((id *)&self->_highlightColor, 0);
  objc_destroyWeak((id *)&self->_trackedParagraph);
}

- (ICTodoButton)initWithFrame:(CGRect)a3
{
  ICTodoButton *v3;
  ICTodoButton *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)ICTodoButton;
  v3 = -[ICTodoButton initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[ICTodoButton setContentMode:](v3, "setContentMode:", 1);
    if (ICInternalSettingsIsTextKit2Enabled())
    {
      objc_msgSend(MEMORY[0x1E0DC3520], "borderlessButtonConfiguration");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC34D8], "clearConfiguration");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setBackgroundColor:", v7);

      objc_msgSend(v5, "setBackground:", v6);
      objc_msgSend(v5, "setContentInsets:", *MEMORY[0x1E0DC3298], *(double *)(MEMORY[0x1E0DC3298] + 8), *(double *)(MEMORY[0x1E0DC3298] + 16), *(double *)(MEMORY[0x1E0DC3298] + 24));
      objc_msgSend(v5, "setImagePlacement:", 8);
      -[ICTodoButton setConfiguration:](v4, "setConfiguration:", v5);

    }
    else
    {
      -[ICTodoButton setContentVerticalAlignment:](v4, "setContentVerticalAlignment:", 0);
      -[ICTodoButton setContentHorizontalAlignment:](v4, "setContentHorizontalAlignment:", 5);
      -[ICTodoButton setImageEdgeInsets:](v4, "setImageEdgeInsets:", 0.0, 4.0, 1.0, 4.0);
      -[ICTodoButton setLargeContentImageInsets:](v4, "setLargeContentImageInsets:", 0.0, 4.0, 1.0, 4.0);
    }
    -[ICTodoButton updateImagesAnimated:](v4, "updateImagesAnimated:", 0);
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3B18]), "initWithDelegate:", v4);
    -[ICTodoButton addInteraction:](v4, "addInteraction:", v8);

  }
  return v4;
}

- (ICTodoButton)initWithDragDelegate:(id)a3
{
  id v4;
  ICTodoButton *v5;
  void *v6;

  v4 = a3;
  v5 = -[ICTodoButton init](self, "init");
  if (v5)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3750]), "initWithDelegate:", v4);
    -[ICTodoButton addInteraction:](v5, "addInteraction:", v6);

  }
  return v5;
}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ICTodoButton;
  -[ICTodoButton didMoveToWindow](&v3, sel_didMoveToWindow);
  -[ICTodoButton updateTintColor](self, "updateTintColor");
}

- (void)trackedParagraphDidChange
{
  _BOOL4 v3;
  int IsTextKit2Enabled;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;

  v3 = -[UIView ic_isRTL](self, "ic_isRTL");
  IsTextKit2Enabled = ICInternalSettingsIsTextKit2Enabled();
  if (!v3)
  {
    if (IsTextKit2Enabled)
    {
      -[ICTodoButton configuration](self, "configuration");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICTodoButton trackedParagraph](self, "trackedParagraph");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "paragraph");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isRTL") == 0;
      v9 = 8;
      v10 = 2;
      goto LABEL_6;
    }
    -[ICTodoButton trackedParagraph](self, "trackedParagraph");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "paragraph");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "isRTL"))
      v13 = 4;
    else
      v13 = 5;
LABEL_16:
    -[ICTodoButton setContentHorizontalAlignment:](self, "setContentHorizontalAlignment:", v13);

    goto LABEL_17;
  }
  if (!IsTextKit2Enabled)
  {
    -[ICTodoButton trackedParagraph](self, "trackedParagraph");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "paragraph");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "isRTL"))
      v13 = 5;
    else
      v13 = 4;
    goto LABEL_16;
  }
  -[ICTodoButton configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTodoButton trackedParagraph](self, "trackedParagraph");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "paragraph");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isRTL") == 0;
  v9 = 2;
  v10 = 8;
LABEL_6:
  if (v8)
    v11 = v9;
  else
    v11 = v10;
  objc_msgSend(v5, "setImagePlacement:", v11);

  -[ICTodoButton setConfiguration:](self, "setConfiguration:", v5);
LABEL_17:

  -[ICTodoButton setNeedsLayout](self, "setNeedsLayout");
  -[ICTodoButton layoutIfNeeded](self, "layoutIfNeeded");
}

- (CGRect)imageRectForContentRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  int v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  objc_super v26;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (!ICInternalSettingsIsTextKit2Enabled())
  {
    v26.receiver = self;
    v26.super_class = (Class)ICTodoButton;
    -[ICTodoButton imageRectForContentRect:](&v26, sel_imageRectForContentRect_, x, y, width, height);
    v9 = v8;
    y = v10;
    width = v11;
    height = v12;
    -[ICTodoButton imageForChecked:withHighlight:](self, "imageForChecked:withHighlight:", 1, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "size");
    v15 = v14;
    v17 = v16;

    if (vabdd_f64(v15 / v17, width / height) <= 0.01)
    {
      if (vabdd_f64(width, v15) > 1.0)
        v9 = v9 + (width - v15) * 0.5;
    }
    else
    {
      v9 = v9 + width - height;
      width = width - (width - height);
    }
    -[ICTodoButton trackedParagraph](self, "trackedParagraph");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "paragraph");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "isRTL");

    if (v20)
    {
      -[ICTodoButton imageEdgeInsets](self, "imageEdgeInsets");
      x = v21;
    }
    else
    {
      x = v9 + -3.0;
    }
  }
  v22 = x;
  v23 = y;
  v24 = width;
  v25 = height;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (void)setHighlighted:(BOOL)a3
{
  const __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ICTodoButton;
  -[ICTodoButton setHighlighted:](&v9, sel_setHighlighted_, a3);
  if (-[ICTodoButton isDone](self, "isDone"))
    v4 = CFSTR("completed: %@");
  else
    v4 = CFSTR("incomplete: %@");
  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", v4, v4, 0, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB3940];
  -[ICTodoButton icaxCorrespondingParagraphText](self, "icaxCorrespondingParagraphText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringWithFormat:", v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  ICAccessibilityPostHighPriorityAnnouncementNotification(0, v8);
}

- (void)wasPressed
{
  id v2;

  v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3898]), "initWithStyle:", 0);
  objc_msgSend(v2, "prepare");
  objc_msgSend(v2, "impactOccurred");

}

- (id)imageForChecked:(BOOL)a3 withHighlight:(BOOL)a4
{
  _BOOL4 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v4 = a3;
  v5 = (void *)sICTodoCheckedImage;
  if (!sICTodoCheckedImage)
  {
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:weight:scale:", 5, 3, 17.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:weight:scale:", 4, 3, 17.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("checkmark.circle.fill"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "imageWithConfiguration:", v6);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)sICTodoCheckedImage;
    sICTodoCheckedImage = v9;

    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("circle"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "imageWithConfiguration:", v7);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)sICTodoUncheckedImage;
    sICTodoUncheckedImage = v12;

    v5 = (void *)sICTodoCheckedImage;
  }
  if (!v4)
    v5 = (void *)sICTodoUncheckedImage;
  return v5;
}

- (void)updateImagesAnimated:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  _BOOL8 v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD aBlock[5];
  id v13;
  BOOL v14;

  v3 = a3;
  -[ICTodoButton window](self, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {

  }
  else
  {
    -[ICTodoButton overrideTintColor](self, "overrideTintColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
      return;
  }
  v7 = -[ICTodoButton isDone](self, "isDone");
  -[ICTodoButton imageForChecked:withHighlight:](self, "imageForChecked:withHighlight:", v7, -[ICTodoButton isHighlighted](self, "isHighlighted"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __69__ICTodoButton_PlatformSpecificResponsibility__updateImagesAnimated___block_invoke;
  aBlock[3] = &unk_1E5C20DC0;
  aBlock[4] = self;
  v9 = v8;
  v13 = v9;
  v14 = v7;
  v10 = _Block_copy(aBlock);
  v11 = v10;
  if (v3)
    objc_msgSend(MEMORY[0x1E0DC3F10], "transitionWithView:duration:options:animations:completion:", self, 5242880, v10, 0, 0.25);
  else
    (*((void (**)(void *))v10 + 2))(v10);

}

void __69__ICTodoButton_PlatformSpecificResponsibility__updateImagesAnimated___block_invoke(uint64_t a1)
{
  int IsTextKit2Enabled;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  IsTextKit2Enabled = ICInternalSettingsIsTextKit2Enabled();
  v3 = *(void **)(a1 + 32);
  if (IsTextKit2Enabled)
  {
    objc_msgSend(v3, "configuration");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setImage:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "overrideTintColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      v6 = v4;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "tintColor");
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    v7 = v6;

    if (*(_BYTE *)(a1 + 48))
    {
      v8 = v7;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "ICGrayTodoButtonColor");
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    v9 = v8;
    objc_msgSend(*(id *)(a1 + 32), "highlightColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "ic_colorBlendedWithColor:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setBaseForegroundColor:", v11);

    objc_msgSend(*(id *)(a1 + 32), "setConfiguration:", v12);
  }
  else
  {
    objc_msgSend(v3, "setImage:forState:", *(_QWORD *)(a1 + 40), 0);
    if (*(_BYTE *)(a1 + 48))
      objc_msgSend(MEMORY[0x1E0DC3658], "ICControlAccentColor");
    else
      objc_msgSend(MEMORY[0x1E0DC3658], "ICGrayTodoButtonColor");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "highlightColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "ic_colorBlendedWithColor:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setTintColor:", v9);
  }

}

- (void)updateTintColor
{
  -[ICTodoButton updateImagesAnimated:](self, "updateImagesAnimated:", 0);
}

- (CGRect)imageFrame
{
  char IsTextKit2Enabled;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGRect result;

  IsTextKit2Enabled = ICInternalSettingsIsTextKit2Enabled();
  -[ICTodoButton imageView](self, "imageView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  if ((IsTextKit2Enabled & 1) == 0)
  {
    -[ICTodoButton superview](self, "superview");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTodoButton convertRect:toView:](self, "convertRect:toView:", v13, v6, v8, v10, v12);
    v6 = v14;
    v8 = v15;
    v10 = v16;
    v12 = v17;

  }
  v18 = v6;
  v19 = v8;
  v20 = v10;
  v21 = v12;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (void)setFrame:(CGRect)a3 leftToRight:(BOOL)a4
{
  void *v5;
  id v6;

  -[ICTodoButton setFrame:](self, "setFrame:", a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[ICTodoButton trackedParagraph](self, "trackedParagraph");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "paragraph");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTodoButton setTrackedParagraphIsRTL:](self, "setTrackedParagraphIsRTL:", objc_msgSend(v5, "isRTL"));

}

- (id)icaxCorrespondingParagraphText
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;

  -[ICTodoButton _icaxParentUITextView](self, "_icaxParentUITextView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textStorage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTodoButton trackedParagraph](self, "trackedParagraph");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "characterRange");
  objc_msgSend(v3, "textStorage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ic_range");
  v8 = TSUClampRange();
  objc_msgSend(v5, "ic_substringWithRange:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringByTrimmingCharactersInSet:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)_icaxParentUITextView
{
  void *v2;
  void *v3;

  -[ICTodoButton superview](self, "superview");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  while ((objc_opt_isKindOfClass() & 1) == 0 && v2)
  {
    v3 = v2;
    objc_msgSend(v2, "superview");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
  }
  return v2;
}

@end
