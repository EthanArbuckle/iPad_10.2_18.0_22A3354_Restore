@implementation PLCropOverlayPreviewBottomBar

- (void)_commonPLCropOverlayEditPhotoBottomBarInitialization
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  UIButton *v6;
  UIButton *v7;
  void *v8;
  UIButton *v9;
  UIButton *v10;

  self->_backgroundStyle = 0;
  v3 = objc_msgSend((id)-[PLCropOverlayPreviewBottomBar traitCollection](self, "traitCollection"), "userInterfaceIdiom");
  v4 = objc_msgSend(MEMORY[0x1E0CEA5E8], "fontWithDescriptor:size:", objc_msgSend(MEMORY[0x1E0CEA5F0], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x1E0CEB538]), 18.0);
  if (v3 == 6)
    v5 = (void *)objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithConfiguration:primaryAction:", objc_msgSend(MEMORY[0x1E0CEA3A8], "borderlessButtonConfiguration"), 0);
  else
    v5 = (void *)objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 0);
  v6 = v5;
  self->_cancelButton = v6;
  -[UIButton setTitleColor:forState:](v6, "setTitleColor:forState:", objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor"), 0);
  -[UIButton setExclusiveTouch:](self->_cancelButton, "setExclusiveTouch:", 1);
  -[UILabel setFont:](-[UIButton titleLabel](self->_cancelButton, "titleLabel"), "setFont:", v4);
  -[UIButton setAccessibilityIdentifier:](self->_cancelButton, "setAccessibilityIdentifier:", CFSTR("Cancel"));
  -[PLCropOverlayPreviewBottomBar addSubview:](self, "addSubview:", self->_cancelButton);
  v7 = (UIButton *)(id)objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 0);
  self->_playbackButton = v7;
  -[UIButton setExclusiveTouch:](v7, "setExclusiveTouch:", 1);
  -[UIButton setAccessibilityIdentifier:](self->_playbackButton, "setAccessibilityIdentifier:", CFSTR("Playback"));
  -[PLCropOverlayPreviewBottomBar addSubview:](self, "addSubview:", self->_playbackButton);
  if (v3 == 6)
    v8 = (void *)objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithConfiguration:primaryAction:", objc_msgSend(MEMORY[0x1E0CEA3A8], "borderlessButtonConfiguration"), 0);
  else
    v8 = (void *)objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 0);
  v9 = v8;
  self->_doneButton = v9;
  -[UIButton setExclusiveTouch:](v9, "setExclusiveTouch:", 1);
  -[UIButton setTitleColor:forState:](self->_doneButton, "setTitleColor:forState:", objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor"), 0);
  -[UILabel setFont:](-[UIButton titleLabel](self->_doneButton, "titleLabel"), "setFont:", v4);
  -[UIButton setAccessibilityIdentifier:](self->_doneButton, "setAccessibilityIdentifier:", CFSTR("Done"));
  -[PLCropOverlayPreviewBottomBar addSubview:](self, "addSubview:", self->_doneButton);
  v10 = (UIButton *)(id)objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 1);
  self->_fileResizingButton = v10;
  -[UIButton setExclusiveTouch:](v10, "setExclusiveTouch:", 1);
  -[UIButton setTitleColor:forState:](self->_fileResizingButton, "setTitleColor:forState:", objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor"), 0);
  -[UILabel setFont:](-[UIButton titleLabel](self->_fileResizingButton, "titleLabel"), "setFont:", v4);
  -[UILabel setAdjustsFontSizeToFitWidth:](-[UIButton titleLabel](self->_fileResizingButton, "titleLabel"), "setAdjustsFontSizeToFitWidth:", 1);
  -[UIButton setHidden:](self->_fileResizingButton, "setHidden:", 1);
  -[UIButton setAccessibilityIdentifier:](self->_fileResizingButton, "setAccessibilityIdentifier:", CFSTR("FileSize"));
  -[PLCropOverlayPreviewBottomBar addSubview:](self, "addSubview:", self->_fileResizingButton);
  -[PLCropOverlayPreviewBottomBar _updateBackgroundStyle](self, "_updateBackgroundStyle");
}

- (PLCropOverlayPreviewBottomBar)initWithFrame:(CGRect)a3
{
  PLCropOverlayPreviewBottomBar *v3;
  PLCropOverlayPreviewBottomBar *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PLCropOverlayPreviewBottomBar;
  v3 = -[PLCropOverlayPreviewBottomBar initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[PLCropOverlayPreviewBottomBar _commonPLCropOverlayEditPhotoBottomBarInitialization](v3, "_commonPLCropOverlayEditPhotoBottomBarInitialization");
  return v4;
}

- (PLCropOverlayPreviewBottomBar)initWithCoder:(id)a3
{
  PLCropOverlayPreviewBottomBar *v3;
  PLCropOverlayPreviewBottomBar *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PLCropOverlayPreviewBottomBar;
  v3 = -[PLCropOverlayPreviewBottomBar initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[PLCropOverlayPreviewBottomBar _commonPLCropOverlayEditPhotoBottomBarInitialization](v3, "_commonPLCropOverlayEditPhotoBottomBarInitialization");
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PLCropOverlayPreviewBottomBar;
  -[PLCropOverlayPreviewBottomBar dealloc](&v3, sel_dealloc);
}

- (void)layoutSubviews
{
  uint64_t v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGFloat v25;
  double v26;
  double v27;
  double v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double MaxX;
  double v41;
  CGFloat v42;
  CGFloat v43;
  CGFloat v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  CGFloat v56;
  double v57;
  double v58;
  CGFloat v59;
  double v60;
  CGFloat v61;
  double v62;
  CGFloat v63;
  double v64;
  CGFloat v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  CGFloat v71;
  CGFloat v72;
  double v73;
  CGFloat v74;
  CGFloat v75;
  CGFloat v76;
  double v77;
  double v78;
  CGFloat v79;
  CGFloat v80;
  CGFloat v81;
  CGFloat v82;
  CGFloat v83;
  double v84;
  CGFloat v85;
  double v86;
  double v87;
  double v88;
  CGFloat rect;
  double recta;
  double v91;
  double v92;
  double v93;
  double v94;
  objc_super v95;
  CGRect v96;
  CGRect v97;
  CGRect v98;
  CGRect v99;
  CGRect v100;
  CGRect v101;
  CGRect v102;
  CGRect v103;
  CGRect v104;

  v95.receiver = self;
  v95.super_class = (Class)PLCropOverlayPreviewBottomBar;
  -[PLCropOverlayPreviewBottomBar layoutSubviews](&v95, sel_layoutSubviews);
  v3 = objc_msgSend(MEMORY[0x1E0CEABB0], "userInterfaceLayoutDirectionForSemanticContentAttribute:", -[PLCropOverlayPreviewBottomBar semanticContentAttribute](self, "semanticContentAttribute"));
  -[PLCropOverlayPreviewBottomBar bounds](self, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[PLCropOverlayPreviewBottomBar safeAreaInsets](self, "safeAreaInsets");
  v93 = v7 + v12;
  v94 = v5 + v13;
  v91 = v11 - (v12 + v15);
  v92 = v9 - (v13 + v14);
  -[UIButton sizeToFit](self->_cancelButton, "sizeToFit");
  -[UIButton bounds](self->_cancelButton, "bounds");
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;
  -[UILabel frame](-[UIButton titleLabel](self->_cancelButton, "titleLabel"), "frame");
  v25 = v24;
  rect = v26;
  v80 = v28;
  v82 = v27;
  -[UILabel textRectForBounds:limitedToNumberOfLines:](-[UIButton titleLabel](self->_cancelButton, "titleLabel"), "textRectForBounds:limitedToNumberOfLines:", 1, v17, v19, v21, v23);
  v30 = v29;
  v32 = v31;
  v34 = v33;
  v85 = v35;
  v87 = v23;
  v88 = v21;
  v37 = v93;
  v36 = v94;
  v39 = v91;
  v38 = v92;
  if (v3)
  {
    MaxX = CGRectGetMaxX(*(CGRect *)&v36);
    v96.origin.x = v17;
    v96.origin.y = v19;
    v96.size.width = v21;
    v96.size.height = v23;
    v41 = MaxX - CGRectGetWidth(v96) + -13.0;
  }
  else
  {
    v42 = CGRectGetMinX(*(CGRect *)&v36) + 13.0;
    v97.origin.x = v25;
    v97.origin.y = rect;
    v97.size.height = v80;
    v97.size.width = v82;
    v43 = v42 - CGRectGetMinX(v97);
    v98.origin.x = v30;
    v98.origin.y = v32;
    v98.size.width = v34;
    v98.size.height = v85;
    v41 = v43 - CGRectGetMinX(v98);
  }
  recta = v41;
  v99.origin.x = v94;
  v99.origin.y = v93;
  v99.size.width = v92;
  v99.size.height = v91;
  v44 = CGRectGetMaxY(v99) + -32.0;
  v100.origin.x = v30;
  v100.origin.y = v32;
  v100.size.width = v34;
  v100.size.height = v85;
  v86 = v44 - CGRectGetHeight(v100);
  -[UIButton setFrame:](self->_cancelButton, "setFrame:", recta);
  -[UIButton sizeToFit](self->_playbackButton, "sizeToFit");
  -[UIButton bounds](self->_playbackButton, "bounds");
  UIRectCenteredIntegralRectScale();
  -[UIButton setFrame:](self->_playbackButton, "setFrame:", 0);
  -[UIButton sizeToFit](self->_doneButton, "sizeToFit");
  -[UIButton bounds](self->_doneButton, "bounds");
  v46 = v45;
  v48 = v47;
  v50 = v49;
  v52 = v51;
  -[UILabel frame](-[UIButton titleLabel](self->_doneButton, "titleLabel"), "frame");
  v81 = v54;
  v83 = v53;
  v56 = v55;
  v79 = v57;
  -[UILabel textRectForBounds:limitedToNumberOfLines:](-[UIButton titleLabel](self->_doneButton, "titleLabel"), "textRectForBounds:limitedToNumberOfLines:", 1, v46, v48, v50, v52);
  v59 = v58;
  v61 = v60;
  v63 = v62;
  v65 = v64;
  v67 = v93;
  v66 = v94;
  v69 = v91;
  v68 = v92;
  if (v3)
  {
    v70 = CGRectGetMinX(*(CGRect *)&v66) + 13.0;
    v84 = recta;
    v87 = v52;
    v88 = v50;
    recta = v70;
  }
  else
  {
    v71 = CGRectGetMaxX(*(CGRect *)&v66) + -13.0;
    v101.size.width = v81;
    v101.origin.x = v83;
    v101.origin.y = v56;
    v101.size.height = v79;
    v72 = v71 - CGRectGetMinX(v101);
    v102.origin.x = v59;
    v102.origin.y = v61;
    v102.size.width = v63;
    v102.size.height = v65;
    v70 = v72 - CGRectGetMaxX(v102);
    v84 = v70;
  }
  v73 = v52;
  v74 = v65;
  v75 = v63;
  v103.origin.y = v93;
  v103.origin.x = v94;
  v103.size.height = v91;
  v103.size.width = v92;
  v76 = CGRectGetMaxY(v103) + -32.0;
  v104.origin.x = v59;
  v104.origin.y = v61;
  v104.size.width = v75;
  v104.size.height = v74;
  v77 = v76 - CGRectGetHeight(v104);
  -[UIButton setFrame:](self->_doneButton, "setFrame:", v70, v77, v50, v73);
  if (v3)
    v78 = v77;
  else
    v78 = v86;
  -[UIButton setFrame:](self->_fileResizingButton, "setFrame:", v88 + recta + 13.0, v78, v84 + -13.0 - (v88 + recta + 13.0), v87);
}

- (void)setBackgroundStyle:(int64_t)a3
{
  -[PLCropOverlayPreviewBottomBar setBackgroundStyle:animated:](self, "setBackgroundStyle:animated:", a3, 0);
}

- (void)setBackgroundStyle:(int64_t)a3 animated:(BOOL)a4
{
  _QWORD v4[5];

  if (self->_backgroundStyle != a3)
  {
    self->_backgroundStyle = a3;
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __61__PLCropOverlayPreviewBottomBar_setBackgroundStyle_animated___block_invoke;
    v4[3] = &unk_1E70B6370;
    v4[4] = self;
    if (a4)
      objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:", v4, 0.3);
    else
      -[PLCropOverlayPreviewBottomBar _updateBackgroundStyle](self, "_updateBackgroundStyle");
  }
}

- (void)_updateBackgroundStyle
{
  uint64_t v3;

  if (self->_backgroundStyle == 1)
    v3 = objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  else
    v3 = objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 0.101960786, 0.75);
  -[PLCropOverlayPreviewBottomBar setBackgroundColor:](self, "setBackgroundColor:", v3);
}

- (int64_t)backgroundStyle
{
  return self->_backgroundStyle;
}

- (UIButton)cancelButton
{
  return self->_cancelButton;
}

- (UIButton)doneButton
{
  return self->_doneButton;
}

- (UIButton)playbackButton
{
  return self->_playbackButton;
}

- (UIButton)fileResizingButton
{
  return self->_fileResizingButton;
}

uint64_t __61__PLCropOverlayPreviewBottomBar_setBackgroundStyle_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateBackgroundStyle");
}

@end
