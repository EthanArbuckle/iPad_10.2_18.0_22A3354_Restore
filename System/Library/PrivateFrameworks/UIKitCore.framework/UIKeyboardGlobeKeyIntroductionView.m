@implementation UIKeyboardGlobeKeyIntroductionView

- (UIKeyboardGlobeKeyIntroductionView)initWithFrame:(CGRect)a3 completion:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  UIKeyboardGlobeKeyIntroductionView *v10;
  UIKeyboardGlobeKeyIntroductionView *v11;
  void *v12;
  _UIBackdropView *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  UILabel *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  UILabel *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  UITextView *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  UIButton *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  objc_super v46;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  v46.receiver = self;
  v46.super_class = (Class)UIKeyboardGlobeKeyIntroductionView;
  v10 = -[UIView initWithFrame:](&v46, sel_initWithFrame_, x, y, width, height);
  v11 = v10;
  if (v10)
  {
    -[UIKeyboardGlobeKeyIntroductionView setCompletionBlock:](v10, "setCompletionBlock:", v9);
    -[UIView setUserInteractionEnabled:](v11, "setUserInteractionEnabled:", 1);
    -[UIView setAutoresizingMask:](v11, "setAutoresizingMask:", 18);
    -[UIView _inheritedRenderConfig](v11, "_inheritedRenderConfig");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[_UIBackdropView initWithStyle:]([_UIBackdropView alloc], "initWithStyle:", objc_msgSend(v12, "backdropStyle"));
    -[UIKeyboardGlobeKeyIntroductionView setBackdropView:](v11, "setBackdropView:", v13);

    -[UIKeyboardGlobeKeyIntroductionView backdropView](v11, "backdropView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addSubview:](v11, "addSubview:", v14);

    _UILocalizedStringInSystemLanguage(CFSTR("Quickly Change Keyboards"), CFSTR("Quickly Change Keyboards"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    _UILocalizedStringInSystemLanguage(CFSTR("Continue"), CFSTR("Continue"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v12, "lightKeyboard") & 1) != 0)
      +[UIColor blackColor](UIColor, "blackColor");
    else
      +[UIColor whiteColor](UIColor, "whiteColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = [UILabel alloc];
    v19 = *MEMORY[0x1E0C9D648];
    v20 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v21 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v22 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v23 = -[UILabel initWithFrame:](v18, "initWithFrame:", *MEMORY[0x1E0C9D648], v20, v21, v22);
    -[UIKeyboardGlobeKeyIntroductionView setTitleLabel:](v11, "setTitleLabel:", v23);

    -[UIKeyboardGlobeKeyIntroductionView titleLabel](v11, "titleLabel");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setTextColor:", v17);

    -[UIKeyboardGlobeKeyIntroductionView titleLabel](v11, "titleLabel");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setTextAlignment:", 1);

    -[UIKeyboardGlobeKeyIntroductionView titleLabel](v11, "titleLabel");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setText:", v15);

    -[UIKeyboardGlobeKeyIntroductionView titleLabel](v11, "titleLabel");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addSubview:](v11, "addSubview:", v27);

    v28 = -[UITextView initWithFrame:]([UITextView alloc], "initWithFrame:", v19, v20, v21, v22);
    -[UIKeyboardGlobeKeyIntroductionView setDescriptionLabel:](v11, "setDescriptionLabel:", v28);

    -[UIKeyboardGlobeKeyIntroductionView descriptionLabel](v11, "descriptionLabel");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setTextColor:", v17);

    +[UIColor clearColor](UIColor, "clearColor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardGlobeKeyIntroductionView descriptionLabel](v11, "descriptionLabel");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setBackgroundColor:", v30);

    -[UIKeyboardGlobeKeyIntroductionView descriptionLabel](v11, "descriptionLabel");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setEditable:", 0);

    -[UIKeyboardGlobeKeyIntroductionView descriptionLabel](v11, "descriptionLabel");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setTextAlignment:", 1);

    -[UIKeyboardGlobeKeyIntroductionView descriptionLabel](v11, "descriptionLabel");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setUserInteractionEnabled:", 0);

    -[UIKeyboardGlobeKeyIntroductionView descriptionLabel](v11, "descriptionLabel");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addSubview:](v11, "addSubview:", v35);

    v36 = -[UIButton initWithFrame:]([UIButton alloc], "initWithFrame:", v19, v20, v21, v22);
    -[UIKeyboardGlobeKeyIntroductionView setContinueButton:](v11, "setContinueButton:", v36);

    -[UIKeyboardGlobeKeyIntroductionView continueButton](v11, "continueButton");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setTitle:forState:", v16, 0);

    -[UIKeyboardGlobeKeyIntroductionView continueButton](v11, "continueButton");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIColor linkColor](UIColor, "linkColor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setTitleColor:forState:", v39, 0);

    -[UIKeyboardGlobeKeyIntroductionView continueButton](v11, "continueButton");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIColor linkColor](UIColor, "linkColor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setTitleColor:forState:", v41, 0);

    -[UIKeyboardGlobeKeyIntroductionView continueButton](v11, "continueButton");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "addTarget:action:forControlEvents:", v11, sel_continueButtonTapped, 64);

    -[UIKeyboardGlobeKeyIntroductionView continueButton](v11, "continueButton");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addSubview:](v11, "addSubview:", v43);

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardGlobeKeyIntroductionView setStartDate:](v11, "setStartDate:", v44);

  }
  return v11;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  _BOOL4 v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  unint64_t v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  void *v51;
  void *v52;
  double v53;
  double v54;
  double MinX;
  double MinY;
  double v57;
  double v58;
  double Width;
  void *v60;
  double v61;
  CGFloat v62;
  double v63;
  void *v64;
  double v65;
  void *v66;
  CGFloat v67;
  double v68;
  void *v69;
  double v70;
  void *v71;
  double v72;
  void *v73;
  void *v74;
  double v75;
  double v76;
  void *v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  void *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  _BOOL4 v93;
  uint64_t v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  objc_super v103;
  uint64_t v104;
  void *v105;
  _QWORD v106[3];
  _QWORD v107[5];
  CGRect v108;
  CGRect v109;
  CGRect v110;
  CGRect v111;
  CGRect v112;
  CGRect v113;
  CGRect v114;
  CGRect v115;
  CGRect v116;
  CGRect v117;
  CGRect v118;

  v107[3] = *MEMORY[0x1E0C80C00];
  v103.receiver = self;
  v103.super_class = (Class)UIKeyboardGlobeKeyIntroductionView;
  -[UIView layoutSubviews](&v103, sel_layoutSubviews);
  v107[0] = CFSTR("UICTFontTextStyleBody");
  v107[1] = CFSTR("UICTFontTextStyleSubhead");
  v107[2] = CFSTR("UICTFontTextStyleSubhead");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v107, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v106[0] = CFSTR("UICTFontTextStyleBody");
  v106[1] = CFSTR("UICTFontTextStyleSubhead");
  v106[2] = CFSTR("UICTFontTextStyleFootnote");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v106, 3);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView _inheritedRenderConfig](self, "_inheritedRenderConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "lightKeyboard") & 1) != 0)
    +[UIColor blackColor](UIColor, "blackColor");
  else
    +[UIColor whiteColor](UIColor, "whiteColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  _UILocalizedStringInSystemLanguage(CFSTR("Tap %@ to switch keyboards.\n\nTouch and hold to select from a list."), CFSTR("Tap %@ to switch keyboards.\n\nTouch and hold to select from a list."));
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v99, "rangeOfString:", CFSTR("%@"));
  v8 = v7;
  v9 = (void *)objc_msgSend(objc_alloc((Class)off_1E1679D28), "initWithData:ofType:", 0, 0);
  +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("globe"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "imageWithTintColor:renderingMode:", v5, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v98 = v9;
  objc_msgSend(v9, "setImage:", v11);

  objc_msgSend(off_1E1679C48, "defaultParagraphStyle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "mutableCopy");

  v97 = v13;
  objc_msgSend(v13, "setAlignment:", 1);
  v14 = 0;
  v94 = *(_QWORD *)off_1E1678D90;
  v89 = v8;
  v90 = v6;
  v16 = v6 != 0x7FFFFFFFFFFFFFFFLL && v8 != 0;
  v93 = v16;
  v91 = *(_QWORD *)off_1E1678F98;
  v92 = *(_QWORD *)off_1E1678D98;
  v95 = v5;
  v96 = v3;
  while (v14 < objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "objectAtIndexedSubscript:", v14);
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(off_1E167A830, "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(off_1E167A828, "fontWithDescriptor:size:", 0.0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardGlobeKeyIntroductionView titleLabel](self, "titleLabel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setFont:", v17);

    objc_msgSend(v100, "objectAtIndexedSubscript:", v14);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(off_1E167A828, "preferredFontForTextStyle:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v98);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_alloc(MEMORY[0x1E0CB3778]);
    v104 = v94;
    v105 = v20;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v105, &v104, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v22, "initWithString:attributes:", v99, v23);

    if (v93)
      objc_msgSend(v24, "replaceCharactersInRange:withAttributedString:", v90, v89, v21);
    objc_msgSend(v24, "addAttribute:value:range:", v92, v5, 0, objc_msgSend(v24, "length"));
    objc_msgSend(v24, "addAttribute:value:range:", v91, v97, 0, objc_msgSend(v24, "length"));
    -[UIKeyboardGlobeKeyIntroductionView descriptionLabel](self, "descriptionLabel");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setAttributedText:", v24);

    -[UIView bounds](self, "bounds");
    v27 = v26;
    v29 = v28;
    v31 = v30;
    v33 = v32;
    -[UIView window](self, "window");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "safeAreaInsets");
    v36 = v35;
    v38 = v37;
    v40 = v39;

    v41 = 0.12;
    if (!v14)
    {
      if (v33 < 335.0
        || (v41 = 0.2, v38 == 0.0) && (v42 = UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL, v41 = 0.2, v42 != 1))
      {
        v41 = 0.16;
      }
    }
    v43 = 19.0;
    if (v38 != 0.0)
      v43 = v38;
    if (v36 == 0.0)
    {
      v44 = 24.0;
      if (v14)
        v45 = v40;
      else
        v45 = 24.0;
      if (v14)
        v44 = v36;
      if (v31 < 414.0)
        v40 = v45;
      else
        v40 = 44.0;
      if (v31 < 414.0)
        v36 = v44;
      else
        v36 = 44.0;
    }
    v46 = round(v33 * v41);
    v47 = v27 + v36;
    v48 = v29 + v46;
    v49 = v31 - (v40 + v36);
    v50 = v33 - (v43 + v46);
    -[UIKeyboardGlobeKeyIntroductionView titleLabel](self, "titleLabel");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "font");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "lineHeight");
    v54 = ceil(v53);

    v108.origin.x = v47;
    v108.origin.y = v48;
    v108.size.width = v49;
    v108.size.height = v50;
    MinX = CGRectGetMinX(v108);
    v109.origin.x = v47;
    v109.origin.y = v48;
    v109.size.width = v49;
    v109.size.height = v50;
    MinY = CGRectGetMinY(v109);
    v57 = 15.0;
    if (v14 > 1)
      v57 = 8.0;
    v58 = v57 + MinY;
    v110.origin.x = v47;
    v110.origin.y = v48;
    v110.size.width = v49;
    v110.size.height = v50;
    Width = CGRectGetWidth(v110);
    -[UIKeyboardGlobeKeyIntroductionView titleLabel](self, "titleLabel");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "setFrame:", MinX, v58, Width, v54);

    v111.origin.x = v47;
    v111.origin.y = v48;
    v111.size.width = v49;
    v111.size.height = v50;
    v61 = CGRectGetMinX(v111);
    v112.origin.x = v47;
    v112.origin.y = v48;
    v112.size.width = v49;
    v112.size.height = v50;
    v62 = CGRectGetMaxY(v112) - v54;
    v113.origin.x = v47;
    v113.origin.y = v48;
    v113.size.width = v49;
    v113.size.height = v50;
    v63 = CGRectGetWidth(v113);
    -[UIKeyboardGlobeKeyIntroductionView continueButton](self, "continueButton");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "setFrame:", v61, v62, v63, v54);

    v114.origin.x = v47;
    v114.origin.y = v48;
    v114.size.width = v49;
    v114.size.height = v50;
    v65 = CGRectGetMinX(v114);
    -[UIKeyboardGlobeKeyIntroductionView titleLabel](self, "titleLabel");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "frame");
    v67 = CGRectGetMaxY(v115) + 18.0;
    v116.origin.x = v47;
    v116.origin.y = v48;
    v116.size.width = v49;
    v116.size.height = v50;
    v68 = CGRectGetWidth(v116);
    -[UIKeyboardGlobeKeyIntroductionView continueButton](self, "continueButton");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "frame");
    v70 = CGRectGetMinY(v117);
    -[UIKeyboardGlobeKeyIntroductionView titleLabel](self, "titleLabel");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "frame");
    v72 = v70 - CGRectGetMaxY(v118) + -18.0;
    -[UIKeyboardGlobeKeyIntroductionView descriptionLabel](self, "descriptionLabel");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "setFrame:", v65, v67, v68, v72);

    -[UIKeyboardGlobeKeyIntroductionView descriptionLabel](self, "descriptionLabel");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "contentSize");
    v76 = v75;
    -[UIKeyboardGlobeKeyIntroductionView descriptionLabel](self, "descriptionLabel");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "frame");
    v79 = v78;

    if (v76 <= v79)
    {

      v5 = v95;
      v3 = v96;
      break;
    }
    -[UIView bounds](self, "bounds");
    v81 = v80;
    v83 = v82;
    v85 = v84;
    v87 = v86;
    -[UIKeyboardGlobeKeyIntroductionView backdropView](self, "backdropView");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "setFrame:", v81, v83, v85, v87);

    ++v14;
    v5 = v95;
    v3 = v96;
    if (v14 == 3)
      break;
  }

}

- (int64_t)backdropStyleForRenderConfig:(id)a3
{
  return objc_msgSend(a3, "backdropStyle");
}

- (void)continueButtonTapped
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void (**v8)(void);

  -[UIKeyboardGlobeKeyIntroductionView completionBlock](self, "completionBlock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardGlobeKeyIntroductionView startDate](self, "startDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeIntervalSinceDate:", v5);
    v7 = v6;

    +[UIKBAnalyticsDispatcher globeKeyEducationShown:](UIKBAnalyticsDispatcher, "globeKeyEducationShown:", v7);
    -[UIKeyboardGlobeKeyIntroductionView completionBlock](self, "completionBlock");
    v8 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v8[2]();

  }
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 416);
}

- (_UIBackdropView)backdropView
{
  return self->_backdropView;
}

- (void)setBackdropView:(id)a3
{
  objc_storeStrong((id *)&self->_backdropView, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UITextView)descriptionLabel
{
  return self->_descriptionLabel;
}

- (void)setDescriptionLabel:(id)a3
{
  objc_storeStrong((id *)&self->_descriptionLabel, a3);
}

- (UIButton)continueButton
{
  return self->_continueButton;
}

- (void)setContinueButton:(id)a3
{
  objc_storeStrong((id *)&self->_continueButton, a3);
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_startDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_continueButton, 0);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_backdropView, 0);
  objc_storeStrong(&self->_completionBlock, 0);
}

@end
