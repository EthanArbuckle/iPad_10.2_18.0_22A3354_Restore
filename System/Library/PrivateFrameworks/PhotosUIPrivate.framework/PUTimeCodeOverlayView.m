@implementation PUTimeCodeOverlayView

- (void)didMoveToSuperview
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  UIView *v7;
  UIView *timecodeBackgroundView;
  void *v9;
  void *v10;
  objc_class *v11;
  id v12;
  UILabel *v13;
  UILabel *timecodeLabelView;
  void *v15;
  void *v16;
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
  void *v27;
  void *v28;
  UIView *v29;
  UIView *verticalLineView;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  NSArray *v54;
  NSArray *overlayConstraints;
  objc_super v56;

  +[PUInterfaceManager currentTheme](PUInterfaceManager, "currentTheme");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v56.receiver = self;
  v56.super_class = (Class)PUTimeCodeOverlayView;
  -[PUTimeCodeOverlayView didMoveToSuperview](&v56, sel_didMoveToSuperview);
  -[PUTimeCodeOverlayView setTranslatesAutoresizingMaskIntoConstraints:](self, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v4 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F58]), "initWithEffect:", v5);
  objc_msgSend(v6, "setClipsToBounds:", 1);
  objc_msgSend(v6, "contentView");
  v7 = (UIView *)objc_claimAutoreleasedReturnValue();
  timecodeBackgroundView = self->_timecodeBackgroundView;
  self->_timecodeBackgroundView = v7;

  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v3, "photoEditingTrimControllerBackgroundColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v9);

  objc_msgSend(v6, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setCornerRadius:", 4.0);

  v11 = (objc_class *)MEMORY[0x1E0DC3990];
  v12 = v6;
  v13 = (UILabel *)objc_alloc_init(v11);
  timecodeLabelView = self->_timecodeLabelView;
  self->_timecodeLabelView = v13;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_timecodeLabelView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v3, "photoEditingTimecodeLabelColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_timecodeLabelView, "setTextColor:", v15);

  PXMonospacedNumberFontWithSize();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_timecodeLabelView, "setFont:", v16);

  -[UIView addSubview:](self->_timecodeBackgroundView, "addSubview:", self->_timecodeLabelView);
  -[UIView leftAnchor](self->_timecodeBackgroundView, "leftAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel leftAnchor](self->_timecodeLabelView, "leftAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:constant:", v18, -6.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v19);

  -[UIView rightAnchor](self->_timecodeBackgroundView, "rightAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel rightAnchor](self->_timecodeLabelView, "rightAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:constant:", v21, 6.0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v22);

  -[UIView topAnchor](self->_timecodeBackgroundView, "topAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel topAnchor](self->_timecodeLabelView, "topAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToAnchor:constant:", v24, -4.0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v25);

  -[UIView bottomAnchor](self->_timecodeBackgroundView, "bottomAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel bottomAnchor](self->_timecodeLabelView, "bottomAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToAnchor:constant:", v27, 4.0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v28);

  -[PUTimeCodeOverlayView addSubview:](self, "addSubview:", v12);
  v29 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
  verticalLineView = self->_verticalLineView;
  self->_verticalLineView = v29;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_verticalLineView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v3, "photoEditingTrimPlayheadLineColor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](self->_verticalLineView, "setBackgroundColor:", v31);

  -[PUTimeCodeOverlayView addSubview:](self, "addSubview:", self->_verticalLineView);
  -[UIView widthAnchor](self->_verticalLineView, "widthAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "constraintEqualToConstant:", 1.0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v33);

  -[UIView heightAnchor](self->_verticalLineView, "heightAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintEqualToConstant:", 18.0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v35);

  -[UIView topAnchor](self->_verticalLineView, "topAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bottomAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "constraintEqualToAnchor:constant:", v37, 11.0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v38);

  -[UIView centerXAnchor](self->_verticalLineView, "centerXAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "centerXAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "constraintEqualToAnchor:constant:", v40, 0.0);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v41);

  -[PUTimeCodeOverlayView topAnchor](self, "topAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "topAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "constraintEqualToAnchor:constant:", v43, 0.0);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v44);

  -[PUTimeCodeOverlayView leftAnchor](self, "leftAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "leftAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "constraintEqualToAnchor:constant:", v46, 0.0);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v47);

  -[PUTimeCodeOverlayView rightAnchor](self, "rightAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "rightAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v48, "constraintEqualToAnchor:constant:", v49, 0.0);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v50);

  -[PUTimeCodeOverlayView bottomAnchor](self, "bottomAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView bottomAnchor](self->_verticalLineView, "bottomAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "constraintEqualToAnchor:constant:", v52, 0.0);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v53);

  v54 = (NSArray *)objc_msgSend(v4, "copy");
  overlayConstraints = self->_overlayConstraints;
  self->_overlayConstraints = v54;

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", self->_overlayConstraints);
  -[PUTimeCodeOverlayView updateTimeDisplay](self, "updateTimeDisplay");

}

- (void)setDisplayedTimeInterval:(double)a3
{
  if (self->_displayedTimeInterval != a3)
  {
    self->_displayedTimeInterval = a3;
    -[PUTimeCodeOverlayView updateTimeDisplay](self, "updateTimeDisplay");
  }
}

- (void)updateTimeDisplay
{
  void *v3;
  int v4;
  id v5;

  +[PUPhotoEditProtoSettings sharedInstance](PUPhotoEditProtoSettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "showFrameNumberOnVideoScrubber");

  -[PUTimeCodeOverlayView displayedTimeInterval](self, "displayedTimeInterval");
  if (v4)
  {
    -[PUTimeCodeOverlayView frameRate](self, "frameRate");
    PXTrimTimeCodeStringWithFrames();
  }
  else
  {
    PXTrimTimeCodeStringFromMilliSeconds();
  }
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_timecodeLabelView, "setText:", v5);

}

- (double)displayedTimeInterval
{
  return self->_displayedTimeInterval;
}

- (double)frameRate
{
  return self->_frameRate;
}

- (void)setFrameRate:(double)a3
{
  self->_frameRate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overlayConstraints, 0);
  objc_storeStrong((id *)&self->_verticalLineView, 0);
  objc_storeStrong((id *)&self->_timecodeBackgroundView, 0);
  objc_storeStrong((id *)&self->_timecodeLabelView, 0);
}

@end
