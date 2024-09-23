@implementation VLFScanningInstructionLabel

- (id)initForSizing:(BOOL)a3
{
  double y;
  double width;
  double height;
  VLFScanningInstructionLabel *v7;
  VLFScanningInstructionLabel *v8;
  VLFLabelFontObserver *v9;
  VLFLabelFontObserver *fontObservers;
  double v11;
  UILabel *v12;
  UILabel *label;
  double v14;
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
  uint64_t v26;
  NSLayoutConstraint *heightConstraint;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  objc_super v34;
  _QWORD v35[4];

  v34.receiver = self;
  v34.super_class = (Class)VLFScanningInstructionLabel;
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v7 = -[VLFScanningInstructionLabel initWithFrame:](&v34, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  v8 = v7;
  if (v7)
  {
    v7->_currentLayout = 2;
    v7->_forSizing = a3;
    v9 = (VLFLabelFontObserver *)objc_msgSend(objc_alloc((Class)GEOObserverHashTable), "initWithProtocol:queue:", &OBJC_PROTOCOL___VLFLabelFontObserver, &_dispatch_main_q);
    fontObservers = v8->_fontObservers;
    v8->_fontObservers = v9;

    LODWORD(v11) = 1148846080;
    -[VLFScanningInstructionLabel setContentCompressionResistancePriority:forAxis:](v8, "setContentCompressionResistancePriority:forAxis:", 1, v11);
    v12 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    label = v8->_label;
    v8->_label = v12;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v8->_label, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v14) = 1148846080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v8->_label, "setContentCompressionResistancePriority:forAxis:", 1, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    -[UILabel setTextColor:](v8->_label, "setTextColor:", v15);

    -[UILabel setLineBreakStrategy:](v8->_label, "setLineBreakStrategy:", 0);
    -[UILabel setLineBreakMode:](v8->_label, "setLineBreakMode:", 2);
    -[UILabel setNumberOfLines:](v8->_label, "setNumberOfLines:", 0);
    -[UILabel _setDrawsDebugBaselines:](v8->_label, "_setDrawsDebugBaselines:", v8->_forSizing);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[VLFScanningInstructionLabel _defaultFont](v8, "_defaultFont"));
    -[UILabel setFont:](v8->_label, "setFont:", v16);

    -[VLFScanningInstructionLabel addSubview:](v8, "addSubview:", v8->_label);
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v8->_label, "leadingAnchor"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[VLFScanningInstructionLabel leadingAnchor](v8, "leadingAnchor"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "constraintEqualToAnchor:", v32));
    v35[0] = v31;
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](v8->_label, "trailingAnchor"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[VLFScanningInstructionLabel trailingAnchor](v8, "trailingAnchor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToAnchor:", v29));
    v35[1] = v17;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](v8->_label, "topAnchor"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[VLFScanningInstructionLabel topAnchor](v8, "topAnchor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:", v19));
    v35[2] = v20;
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](v8->_label, "bottomAnchor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[VLFScanningInstructionLabel bottomAnchor](v8, "bottomAnchor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:", v22));
    v35[3] = v23;
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v35, 4));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v24);

    if (v8->_forSizing)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel heightAnchor](v8->_label, "heightAnchor"));
      v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintEqualToConstant:", 0.0));
      heightConstraint = v8->_heightConstraint;
      v8->_heightConstraint = (NSLayoutConstraint *)v26;

      -[NSLayoutConstraint setActive:](v8->_heightConstraint, "setActive:", 1);
    }
  }
  return v8;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VLFScanningInstructionLabel;
  -[VLFScanningInstructionLabel layoutSubviews](&v6, "layoutSubviews");
  -[VLFScanningInstructionLabel bounds](self, "bounds");
  v4 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VLFScanningInstructionLabel label](self, "label"));
  objc_msgSend(v5, "setPreferredMaxLayoutWidth:", v4);

  -[VLFScanningInstructionLabel _updateContentHeight](self, "_updateContentHeight");
}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VLFScanningInstructionLabel;
  -[VLFScanningInstructionLabel traitCollectionDidChange:](&v4, "traitCollectionDidChange:", a3);
  -[VLFScanningInstructionLabel _updateContentHeight](self, "_updateContentHeight");
}

- (double)contentHeight
{
  void *v3;
  double v4;
  double v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VLFScanningInstructionLabel label](self, "label"));
  -[VLFScanningInstructionLabel bounds](self, "bounds");
  objc_msgSend(v3, "textRectForBounds:limitedToNumberOfLines:", 0, 0.0, 0.0);
  v5 = v4;

  return v5;
}

- (NSString)text
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[VLFScanningInstructionLabel label](self, "label"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "text"));

  return (NSString *)v3;
}

- (void)setText:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VLFScanningInstructionLabel label](self, "label"));
  objc_msgSend(v5, "setText:", v4);

  -[VLFScanningInstructionLabel _updateContentHeight](self, "_updateContentHeight");
}

- (void)setCurrentLayout:(unint64_t)a3
{
  if (self->_currentLayout != a3)
  {
    self->_currentLayout = a3;
    -[VLFScanningInstructionLabel _updateContentHeight](self, "_updateContentHeight");
  }
}

- (UIFont)font
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[VLFScanningInstructionLabel label](self, "label"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "font"));

  return (UIFont *)v3;
}

- (UIColor)textColor
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[VLFScanningInstructionLabel label](self, "label"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "textColor"));

  return (UIColor *)v3;
}

- (void)setTextColor:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[VLFScanningInstructionLabel label](self, "label"));
  objc_msgSend(v5, "setTextColor:", v4);

}

- (void)updateFont:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  char *v11;
  int v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  const char *v19;

  v4 = a3;
  if (-[VLFScanningInstructionLabel isForSizing](self, "isForSizing"))
  {
    v7 = sub_1004318FC();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v12 = 136315906;
      v13 = "-[VLFScanningInstructionLabel updateFont:]";
      v14 = 2080;
      v15 = "VLFScanningInstructionLabel.m";
      v16 = 1024;
      v17 = 153;
      v18 = 2080;
      v19 = "!self.isForSizing";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v12, 0x26u);
    }

    if (sub_100A70734())
    {
      v9 = sub_1004318FC();
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        v12 = 138412290;
        v13 = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v12, 0xCu);

      }
    }
  }
  if (-[VLFScanningInstructionLabel isForSizing](self, "isForSizing"))
  {
    v5 = sub_100943090();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v12) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Only non-sizing labels can be font providers", (uint8_t *)&v12, 2u);
    }
  }
  else
  {
    v6 = objc_claimAutoreleasedReturnValue(-[VLFScanningInstructionLabel label](self, "label"));
    -[NSObject setFont:](v6, "setFont:", v4);
  }

}

- (void)addFontObserver:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  char *v10;
  int v11;
  const char *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  const char *v18;

  v4 = a3;
  if (!v4)
  {
    v6 = sub_1004318FC();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v11 = 136315906;
      v12 = "-[VLFScanningInstructionLabel addFontObserver:]";
      v13 = 2080;
      v14 = "VLFScanningInstructionLabel.m";
      v15 = 1024;
      v16 = 166;
      v17 = 2080;
      v18 = "fontObserver != nil";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", (uint8_t *)&v11, 0x26u);
    }

    if (sub_100A70734())
    {
      v8 = sub_1004318FC();
      v9 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v10 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        v11 = 138412290;
        v12 = v10;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v11, 0xCu);

      }
    }
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VLFScanningInstructionLabel fontObservers](self, "fontObservers"));
  objc_msgSend(v5, "registerObserver:", v4);

}

- (void)removeFontObserver:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  char *v10;
  int v11;
  const char *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  const char *v18;

  v4 = a3;
  if (!v4)
  {
    v6 = sub_1004318FC();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v11 = 136315906;
      v12 = "-[VLFScanningInstructionLabel removeFontObserver:]";
      v13 = 2080;
      v14 = "VLFScanningInstructionLabel.m";
      v15 = 1024;
      v16 = 172;
      v17 = 2080;
      v18 = "fontObserver != nil";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", (uint8_t *)&v11, 0x26u);
    }

    if (sub_100A70734())
    {
      v8 = sub_1004318FC();
      v9 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v10 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        v11 = 138412290;
        v12 = v10;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v11, 0xCu);

      }
    }
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VLFScanningInstructionLabel fontObservers](self, "fontObservers"));
  objc_msgSend(v5, "unregisterObserver:", v4);

}

- (double)_minimumLinesOverridePointSizeThreshold
{
  unint64_t v2;
  double result;

  v2 = -[VLFScanningInstructionLabel currentLayout](self, "currentLayout");
  result = 20.0;
  if (v2 == 2)
    return 25.0;
  return result;
}

- (unint64_t)_maximumNumberOfLinesWithMinimumOverride:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  unsigned int v12;
  unint64_t v13;

  v3 = a3;
  if ((id)-[VLFScanningInstructionLabel currentLayout](self, "currentLayout") == (id)2)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[VLFScanningInstructionLabel traitCollection](self, "traitCollection"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "preferredContentSizeCategory"));
    v7 = sub_1002A8950(v6, UIContentSizeCategoryLarge);

    if (v7 == 1)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[VLFScanningInstructionLabel traitCollection](self, "traitCollection"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "preferredContentSizeCategory"));
      v10 = sub_1002A8950(v9, UIContentSizeCategoryExtraExtraExtraLarge);

      if (v10 == 1)
        return 5;
      else
        return 4;
    }
    else if (v3)
    {
      return 4;
    }
    else
    {
      return 3;
    }
  }
  else
  {
    v12 = -[VLFScanningInstructionLabel isRunningOnBigPhone](self, "isRunningOnBigPhone");
    v13 = 3;
    if (v3)
      v13 = 4;
    if (v12)
      return v13;
    else
      return 4;
  }
}

- (id)_defaultFont
{
  void *v3;
  unint64_t v4;
  const UIContentSizeCategory *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  UIFontDescriptorTraitKey v14;
  void *v15;
  UIFontDescriptorAttributeName v16;
  void *v17;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VLFScanningInstructionLabel traitCollection](self, "traitCollection"));
  v4 = -[VLFScanningInstructionLabel currentLayout](self, "currentLayout");
  v5 = &UIContentSizeCategoryAccessibilityMedium;
  if (v4 != 2)
    v5 = &UIContentSizeCategoryLarge;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_maps_traitCollectionWithMaximumContentSizeCategory:", *v5));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontDescriptor preferredFontDescriptorWithTextStyle:compatibleWithTraitCollection:](UIFontDescriptor, "preferredFontDescriptorWithTextStyle:compatibleWithTraitCollection:", UIFontTextStyleTitle1, v6));
  v16 = UIFontDescriptorTraitsAttribute;
  v14 = UIFontWeightTrait;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", UIFontWeightBold));
  v15 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1));
  v17 = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "fontDescriptorByAddingAttributes:", v10));

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v11, 0.0));
  return v12;
}

- (void)_updateFont
{
  -[VLFScanningInstructionLabel _updateFontWithMinimumOverride:](self, "_updateFontWithMinimumOverride:", 0);
}

- (void)_updateFontWithMinimumOverride:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  unint64_t v22;
  const __CFString *v23;
  id v24;
  NSObject *v25;
  double v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _BOOL8 v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  void *v38;
  void *v39;
  double v40;
  double v41;
  void *v42;
  void *v43;
  double v44;
  double v45;
  id v46;
  NSObject *v47;
  NSObject *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  double v55;
  void *v56;
  void *v57;
  double v58;
  double v59;
  void *v60;
  void *v61;
  double v62;
  double v63;
  void *v64;
  void *v65;
  double v66;
  double v67;
  id v68;
  NSObject *v69;
  double v70;
  void *v71;
  double v72;
  unint64_t v73;
  void *v74;
  void *v75;
  __CFString *v76;
  void *v77;
  __CFString *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  uint8_t buf[4];
  double v85;
  __int16 v86;
  unint64_t v87;
  __int16 v88;
  uint64_t v89;
  __int16 v90;
  uint64_t v91;
  __int16 v92;
  uint64_t v93;
  __int16 v94;
  unint64_t v95;
  __int16 v96;
  double v97;
  __int16 v98;
  unint64_t v99;
  __int16 v100;
  __CFString *v101;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VLFScanningInstructionLabel _defaultFont](self, "_defaultFont"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[VLFScanningInstructionLabel label](self, "label"));
  objc_msgSend(v6, "setFont:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[VLFScanningInstructionLabel label](self, "label"));
  -[VLFScanningInstructionLabel bounds](self, "bounds");
  objc_msgSend(v7, "textRectForBounds:limitedToNumberOfLines:", 0, 0.0, 0.0);
  v9 = v8;

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[VLFScanningInstructionLabel label](self, "label"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "font"));
  objc_msgSend(v11, "leading");
  v13 = v9 + v12;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[VLFScanningInstructionLabel label](self, "label"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "font"));
  objc_msgSend(v15, "lineHeight");
  v17 = v16;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[VLFScanningInstructionLabel label](self, "label"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "font"));
  objc_msgSend(v19, "leading");
  v21 = v13 / (v17 + v20);

  v22 = (unint64_t)v21;
  if (-[VLFScanningInstructionLabel _maximumNumberOfLinesWithMinimumOverride:](self, "_maximumNumberOfLinesWithMinimumOverride:", v3) < (unint64_t)v21)
  {
    v23 = CFSTR("NO");
    if (v3)
      v23 = CFSTR("YES");
    v76 = (__CFString *)v23;
    while (1)
    {
      v24 = sub_100943090();
      v25 = objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        v83 = (void *)objc_claimAutoreleasedReturnValue(-[VLFScanningInstructionLabel label](self, "label"));
        v26 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "text")));
        v82 = (void *)objc_claimAutoreleasedReturnValue(-[VLFScanningInstructionLabel label](self, "label"));
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "font"));
        v81 = (void *)objc_claimAutoreleasedReturnValue(-[VLFScanningInstructionLabel label](self, "label"));
        v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "font"));
        objc_msgSend(v80, "pointSize");
        v29 = v28;
        v79 = (void *)objc_claimAutoreleasedReturnValue(-[VLFScanningInstructionLabel label](self, "label"));
        v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "font"));
        objc_msgSend(v77, "lineHeight");
        v31 = v30;
        v32 = v3;
        v33 = (void *)objc_claimAutoreleasedReturnValue(-[VLFScanningInstructionLabel label](self, "label"));
        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "font"));
        objc_msgSend(v34, "leading");
        v36 = v35;
        v37 = -[VLFScanningInstructionLabel _maximumNumberOfLinesWithMinimumOverride:](self, "_maximumNumberOfLinesWithMinimumOverride:", v32);
        v78 = v76;
        *(_DWORD *)buf = 138414338;
        v85 = v26;
        v86 = 2112;
        v87 = (unint64_t)v27;
        v88 = 2048;
        v89 = v29;
        v90 = 2048;
        v91 = v31;
        v92 = 2048;
        v93 = v36;
        v94 = 2048;
        v95 = v22;
        v96 = 2048;
        v97 = v9;
        v98 = 2048;
        v99 = v37;
        v100 = 2112;
        v101 = v76;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEBUG, "Text: (%@) with font: (%@), pointSize: (%f), line height: (%f), and leading: (%f) renders as: (%lu) lines in: (%f) height which is higher than the limit: (%lu) with minimumOverride: %@", buf, 0x5Cu);

        v3 = v32;
      }

      v38 = (void *)objc_claimAutoreleasedReturnValue(-[VLFScanningInstructionLabel label](self, "label"));
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "font"));
      objc_msgSend(v39, "pointSize");
      v41 = 0.0;
      if (v40 + -1.0 > 0.0)
      {
        v42 = (void *)objc_claimAutoreleasedReturnValue(-[VLFScanningInstructionLabel label](self, "label"));
        v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "font"));
        objc_msgSend(v43, "pointSize");
        v41 = v44 + -1.0;

      }
      -[VLFScanningInstructionLabel _minimumLinesOverridePointSizeThreshold](self, "_minimumLinesOverridePointSizeThreshold");
      if (v41 < v45 && !v3)
        break;
      v46 = sub_100943090();
      v47 = objc_claimAutoreleasedReturnValue(v46);
      v48 = v47;
      if (fabs(v41) <= 2.22044605e-16)
      {
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
        {
          v71 = (void *)objc_claimAutoreleasedReturnValue(-[VLFScanningInstructionLabel label](self, "label"));
          v72 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "text")));
          v73 = -[VLFScanningInstructionLabel _maximumNumberOfLinesWithMinimumOverride:](self, "_maximumNumberOfLinesWithMinimumOverride:", v3);
          *(_DWORD *)buf = 138412546;
          v85 = v72;
          v86 = 2048;
          v87 = v73;
          _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "Text (%@) was too large to shrink to fit on (%lu) lines; using default font",
            buf,
            0x16u);

        }
        v74 = (void *)objc_claimAutoreleasedReturnValue(-[VLFScanningInstructionLabel _defaultFont](self, "_defaultFont"));
        v75 = (void *)objc_claimAutoreleasedReturnValue(-[VLFScanningInstructionLabel label](self, "label"));
        objc_msgSend(v75, "setFont:", v74);

        return;
      }
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134217984;
        v85 = v41;
        _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEBUG, "Trying again with pointSize: %f", buf, 0xCu);
      }

      v49 = (void *)objc_claimAutoreleasedReturnValue(-[VLFScanningInstructionLabel label](self, "label"));
      v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "font"));
      v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "fontDescriptor"));
      v52 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v51, v41));
      v53 = (void *)objc_claimAutoreleasedReturnValue(-[VLFScanningInstructionLabel label](self, "label"));
      objc_msgSend(v53, "setFont:", v52);

      v54 = (void *)objc_claimAutoreleasedReturnValue(-[VLFScanningInstructionLabel label](self, "label"));
      -[VLFScanningInstructionLabel bounds](self, "bounds");
      objc_msgSend(v54, "textRectForBounds:limitedToNumberOfLines:", 0, 0.0, 0.0);
      v9 = v55;

      v56 = (void *)objc_claimAutoreleasedReturnValue(-[VLFScanningInstructionLabel label](self, "label"));
      v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "font"));
      objc_msgSend(v57, "leading");
      v59 = v9 + v58;
      v60 = (void *)objc_claimAutoreleasedReturnValue(-[VLFScanningInstructionLabel label](self, "label"));
      v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "font"));
      objc_msgSend(v61, "lineHeight");
      v63 = v62;
      v64 = (void *)objc_claimAutoreleasedReturnValue(-[VLFScanningInstructionLabel label](self, "label"));
      v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "font"));
      objc_msgSend(v65, "leading");
      v67 = v59 / (v63 + v66);

      v22 = (unint64_t)v67;
      if (-[VLFScanningInstructionLabel _maximumNumberOfLinesWithMinimumOverride:](self, "_maximumNumberOfLinesWithMinimumOverride:", v3) >= (unint64_t)v67)return;
    }
    v68 = sub_100943090();
    v69 = objc_claimAutoreleasedReturnValue(v68);
    if (os_log_type_enabled(v69, OS_LOG_TYPE_DEBUG))
    {
      -[VLFScanningInstructionLabel _minimumLinesOverridePointSizeThreshold](self, "_minimumLinesOverridePointSizeThreshold");
      *(_DWORD *)buf = 134217984;
      v85 = v70;
      _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_DEBUG, "Detected pointSize going below the threshold %f. Trying again with number of lines override.", buf, 0xCu);
    }

    -[VLFScanningInstructionLabel _updateFontWithMinimumOverride:](self, "_updateFontWithMinimumOverride:", 1);
  }
}

- (void)_updateContentHeight
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if (-[VLFScanningInstructionLabel isForSizing](self, "isForSizing"))
  {
    -[VLFScanningInstructionLabel _updateFont](self, "_updateFont");
    -[VLFScanningInstructionLabel contentHeight](self, "contentHeight");
    v4 = v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[VLFScanningInstructionLabel heightConstraint](self, "heightConstraint"));
    objc_msgSend(v5, "setConstant:", v4);

    v8 = (id)objc_claimAutoreleasedReturnValue(-[VLFScanningInstructionLabel fontObservers](self, "fontObservers"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[VLFScanningInstructionLabel label](self, "label"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "font"));
    objc_msgSend(v8, "updateFont:", v7);

  }
}

- (unint64_t)currentLayout
{
  return self->_currentLayout;
}

- (BOOL)isRunningOnBigPhone
{
  return self->_runningOnBigPhone;
}

- (void)setRunningOnBigPhone:(BOOL)a3
{
  self->_runningOnBigPhone = a3;
}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (NSLayoutConstraint)heightConstraint
{
  return self->_heightConstraint;
}

- (void)setHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_heightConstraint, a3);
}

- (BOOL)isForSizing
{
  return self->_forSizing;
}

- (void)setForSizing:(BOOL)a3
{
  self->_forSizing = a3;
}

- (VLFLabelFontObserver)fontObservers
{
  return self->_fontObservers;
}

- (void)setFontObservers:(id)a3
{
  objc_storeStrong((id *)&self->_fontObservers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fontObservers, 0);
  objc_storeStrong((id *)&self->_heightConstraint, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end
