@implementation PXSharedLibraryInvitationContentView

- (PXSharedLibraryInvitationContentView)initWithFrame:(CGRect)a3
{
  PXSharedLibraryInvitationContentView *v3;
  _BOOL8 v4;
  UIImageView *v5;
  UIImageView *imageView;
  UIImageView *v7;
  UIImageView *badgeView;
  void *v9;
  UILabel *v10;
  UILabel *titleLabel;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  UILabel *v18;
  UILabel *textLabel;
  void *v20;
  double v21;
  double v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  double v38;
  void *v39;
  void *v40;
  void *v41;
  double v42;
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
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  objc_super v95;
  _QWORD v96[19];
  _QWORD v97[4];

  v97[2] = *MEMORY[0x1E0C80C00];
  v95.receiver = self;
  v95.super_class = (Class)PXSharedLibraryInvitationContentView;
  v3 = -[PXSharedLibraryInvitationContentView initWithFrame:](&v95, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    PXSharedLibraryPlaceholderParticipantImageWithPointSize();
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = -[PXSharedLibraryInvitationContentView effectiveUserInterfaceLayoutDirection](v3, "effectiveUserInterfaceLayoutDirection") == 1;
    -[PXSharedLibraryInvitationContentView px_screenScale](v3, "px_screenScale");
    -[PXSharedLibraryInvitationContentView _createCombinedImage:displayScale:isRTL:](v3, "_createCombinedImage:displayScale:isRTL:", v94, v4);
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    imageView = v3->_imageView;
    v3->_imageView = v5;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v3->_imageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIImageView setContentMode:](v3->_imageView, "setContentMode:", 2);
    -[UIImageView setImage:](v3->_imageView, "setImage:", v93);
    -[PXSharedLibraryInvitationContentView addSubview:](v3, "addSubview:", v3->_imageView);
    v7 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    badgeView = v3->_badgeView;
    v3->_badgeView = v7;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v3->_badgeView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0DC3870], "px_imageNamed:", CFSTR("SharedLibrary-20-Rounded"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](v3->_badgeView, "setImage:", v9);

    -[UIImageView setContentMode:](v3->_badgeView, "setContentMode:", 4);
    -[UIImageView _setCornerRadius:](v3->_badgeView, "_setCornerRadius:", 6.0);
    -[PXSharedLibraryInvitationContentView addSubview:](v3, "addSubview:", v3->_badgeView);
    v10 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = v10;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AA0]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v3->_titleLabel, "setFont:", v12);

    PXLocalizedSharedLibraryString(CFSTR("PXSharedLibrary_InvitationTitle"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedUppercaseString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v3->_titleLabel, "setText:", v14);

    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v3->_titleLabel, "setTextColor:", v15);

    -[UILabel setLineBreakMode:](v3->_titleLabel, "setLineBreakMode:", 0);
    -[UILabel setNumberOfLines:](v3->_titleLabel, "setNumberOfLines:", 0);
    LODWORD(v16) = 1144750080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v3->_titleLabel, "setContentCompressionResistancePriority:forAxis:", 1, v16);
    LODWORD(v17) = 1148846080;
    -[UILabel setContentHuggingPriority:forAxis:](v3->_titleLabel, "setContentHuggingPriority:forAxis:", 1, v17);
    v18 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    textLabel = v3->_textLabel;
    v3->_textLabel = v18;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_textLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AD0]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v3->_textLabel, "setFont:", v20);

    -[UILabel setLineBreakMode:](v3->_textLabel, "setLineBreakMode:", 0);
    -[UILabel setNumberOfLines:](v3->_textLabel, "setNumberOfLines:", 0);
    LODWORD(v21) = 1144750080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v3->_textLabel, "setContentCompressionResistancePriority:forAxis:", 1, v21);
    LODWORD(v22) = 1148846080;
    -[UILabel setContentHuggingPriority:forAxis:](v3->_textLabel, "setContentHuggingPriority:forAxis:", 1, v22);
    v23 = objc_alloc(MEMORY[0x1E0DC3CA8]);
    v97[0] = v3->_titleLabel;
    v97[1] = v3->_textLabel;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v97, 2);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v23, "initWithArrangedSubviews:", v24);

    objc_msgSend(v25, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v25, "setAxis:", 1);
    v26 = v25;
    -[PXSharedLibraryInvitationContentView addSubview:](v3, "addSubview:", v25);
    -[UIImageView topAnchor](v3->_imageView, "topAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSharedLibraryInvitationContentView topAnchor](v3, "topAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToAnchor:constant:", v28, 20.0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    v88 = v29;
    LODWORD(v30) = 1132068864;
    objc_msgSend(v29, "setPriority:", v30);
    -[PXSharedLibraryInvitationContentView bottomAnchor](v3, "bottomAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView bottomAnchor](v3->_imageView, "bottomAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintEqualToAnchor:constant:", v32, 20.0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    v83 = v33;
    LODWORD(v34) = 1132068864;
    objc_msgSend(v33, "setPriority:", v34);
    -[UIImageView topAnchor](v3->_imageView, "topAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSharedLibraryInvitationContentView topAnchor](v3, "topAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "constraintEqualToAnchor:constant:", v36, 5.0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    v70 = v37;
    LODWORD(v38) = 1132068864;
    objc_msgSend(v37, "setPriority:", v38);
    -[PXSharedLibraryInvitationContentView bottomAnchor](v3, "bottomAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView bottomAnchor](v3->_imageView, "bottomAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "constraintEqualToAnchor:constant:", v40, 5.0);
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    v64 = v41;
    LODWORD(v42) = 1132068864;
    objc_msgSend(v41, "setPriority:", v42);
    v74 = (void *)MEMORY[0x1E0CB3718];
    -[UIImageView widthAnchor](v3->_imageView, "widthAnchor");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "constraintEqualToConstant:", 60.0);
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    v96[0] = v91;
    -[UIImageView heightAnchor](v3->_imageView, "heightAnchor");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "constraintEqualToConstant:", 60.0);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    v96[1] = v89;
    -[UIImageView leadingAnchor](v3->_imageView, "leadingAnchor");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSharedLibraryInvitationContentView leadingAnchor](v3, "leadingAnchor");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "constraintEqualToAnchor:constant:", v86, 20.0);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    v96[2] = v85;
    -[UIImageView topAnchor](v3->_imageView, "topAnchor");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSharedLibraryInvitationContentView topAnchor](v3, "topAnchor");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "constraintGreaterThanOrEqualToAnchor:constant:", v82, 20.0);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v96[3] = v81;
    v96[4] = v29;
    -[PXSharedLibraryInvitationContentView centerYAnchor](v3, "centerYAnchor");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView centerYAnchor](v3->_imageView, "centerYAnchor");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "constraintEqualToAnchor:", v79);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v96[5] = v78;
    -[PXSharedLibraryInvitationContentView bottomAnchor](v3, "bottomAnchor");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView bottomAnchor](v3->_imageView, "bottomAnchor");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "constraintGreaterThanOrEqualToAnchor:constant:", v76, 20.0);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v96[6] = v75;
    v96[7] = v33;
    -[UIImageView widthAnchor](v3->_badgeView, "widthAnchor");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "constraintEqualToConstant:", 24.0);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v96[8] = v72;
    -[UIImageView heightAnchor](v3->_badgeView, "heightAnchor");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "constraintEqualToConstant:", 24.0);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v96[9] = v69;
    -[UIImageView trailingAnchor](v3->_badgeView, "trailingAnchor");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView trailingAnchor](v3->_imageView, "trailingAnchor");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "constraintEqualToAnchor:constant:", v67, 4.0);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v96[10] = v65;
    -[UIImageView bottomAnchor](v3->_badgeView, "bottomAnchor");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView bottomAnchor](v3->_imageView, "bottomAnchor");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "constraintEqualToAnchor:constant:", v62, 4.0);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v96[11] = v61;
    objc_msgSend(v26, "leadingAnchor");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView trailingAnchor](v3->_imageView, "trailingAnchor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "constraintEqualToAnchor:constant:", v59, 12.0);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v96[12] = v58;
    objc_msgSend(v26, "topAnchor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSharedLibraryInvitationContentView topAnchor](v3, "topAnchor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "constraintGreaterThanOrEqualToAnchor:constant:", v56, 5.0);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v96[13] = v55;
    v96[14] = v37;
    -[PXSharedLibraryInvitationContentView centerYAnchor](v3, "centerYAnchor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = v26;
    objc_msgSend(v26, "centerYAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "constraintEqualToAnchor:", v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v96[15] = v45;
    -[PXSharedLibraryInvitationContentView bottomAnchor](v3, "bottomAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = v43;
    objc_msgSend(v43, "bottomAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "constraintGreaterThanOrEqualToAnchor:constant:", v47, 5.0);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v96[16] = v48;
    v96[17] = v41;
    -[PXSharedLibraryInvitationContentView trailingAnchor](v3, "trailingAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "trailingAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "constraintGreaterThanOrEqualToAnchor:", v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v96[18] = v51;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v96, 19);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "activateConstraints:", v52);

  }
  return v3;
}

- (void)_updateImageViewWithImage:(id)a3 owner:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  if (v9)
  {
    -[PXSharedLibraryInvitationContentView owner](self, "owner");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    if (v7 == v6)
    {
      -[PXSharedLibraryInvitationContentView imageView](self, "imageView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setImage:", v9);

      -[PXSharedLibraryInvitationContentView setNeedsLayout](self, "setNeedsLayout");
    }
  }

}

- (void)_updateTitleLabel
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0DC1350], "px_preferredFontForTextStyle:withSymbolicTraits:options:", *MEMORY[0x1E0DC4AA0], 2, 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PXSharedLibraryInvitationContentView titleLabel](self, "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFont:", v4);

}

- (void)_updateTextLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  -[PXSharedLibraryInvitationContentView owner](self, "owner");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PXSharedLibraryFullNameForParticipant(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x1E0DC1138];
  v10[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  PXSharedLibraryInvitationTitleForParticipantName(v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSharedLibraryInvitationContentView textLabel](self, "textLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAttributedText:", v7);

}

- (id)_createCombinedImage:(id)a3 displayScale:(double)a4 isRTL:(BOOL)a5
{
  _BOOL4 v5;
  CGFloat v7;
  double v8;
  double v9;
  id v10;
  CGColorSpace *DeviceRGB;
  CGContext *v12;
  id v13;
  CGImage *v14;
  id v15;
  double v16;
  const CGPath *v17;
  CGImage *Image;
  void *v19;
  CGRect v21;
  CGRect v22;

  v5 = a5;
  v7 = a4 * 60.0;
  v8 = a4 * 22.0;
  v9 = a4 * 6.0;
  v10 = a3;
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v12 = CGBitmapContextCreate(0, (unint64_t)v7, (unint64_t)v7, 8uLL, 0, DeviceRGB, 1u);
  CGColorSpaceRelease(DeviceRGB);
  v13 = objc_retainAutorelease(v10);
  v14 = (CGImage *)objc_msgSend(v13, "CGImage");

  v21.origin.x = 0.0;
  v21.origin.y = 0.0;
  v21.size.width = v7;
  v21.size.height = v7;
  CGContextDrawImage(v12, v21, v14);
  CGContextResetClip(v12);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CGContextSetFillColorWithColor(v12, (CGColorRef)objc_msgSend(v15, "CGColor"));

  CGContextSetBlendMode(v12, kCGBlendModeDestinationIn);
  v16 = 40.0;
  if (v5)
    v16 = -2.0;
  v22.origin.x = v16 * a4;
  v22.origin.y = a4 * -2.0;
  v22.size.width = v8;
  v22.size.height = v8;
  v17 = CGPathCreateWithRoundedRect(v22, v9, v9, 0);
  CGContextAddPath(v12, v17);
  CGContextFillPath(v12);
  CGContextBeginPath(v12);
  CGPathRelease(v17);
  Image = CGBitmapContextCreateImage(v12);
  CGContextRelease(v12);
  objc_msgSend(MEMORY[0x1E0DC3870], "imageWithCGImage:scale:orientation:", Image, 0, a4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  CGImageRelease(Image);
  return v19;
}

- (void)setOwner:(id)a3
{
  PXSharedLibraryParticipant *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[4];
  PXSharedLibraryParticipant *v15;
  id v16[2];
  BOOL v17;
  id location;

  v5 = (PXSharedLibraryParticipant *)a3;
  if (self->_owner != v5)
  {
    objc_storeStrong((id *)&self->_owner, a3);
    -[PXSharedLibraryInvitationContentView _updateTextLabel](self, "_updateTextLabel");
    objc_initWeak(&location, self);
    PXSizeMakeSquare();
    v7 = v6;
    v9 = v8;
    -[PXSharedLibraryInvitationContentView px_screenScale](self, "px_screenScale");
    v11 = v10;
    v12 = -[PXSharedLibraryInvitationContentView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
    -[PXSharedLibraryParticipant imageProvider](v5, "imageProvider");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __49__PXSharedLibraryInvitationContentView_setOwner___block_invoke;
    v14[3] = &unk_1E5133A00;
    objc_copyWeak(v16, &location);
    v16[1] = v11;
    v17 = v12 == 1;
    v15 = v5;
    objc_msgSend(v13, "requestImageWithTargetSize:displayScale:isRTL:completionHandler:", v12 == 1, v14, v7, v9, *(double *)&v11);

    objc_destroyWeak(v16);
    objc_destroyWeak(&location);
  }

}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXSharedLibraryInvitationContentView;
  -[PXSharedLibraryInvitationContentView traitCollectionDidChange:](&v4, sel_traitCollectionDidChange_, a3);
  -[PXSharedLibraryInvitationContentView _updateTitleLabel](self, "_updateTitleLabel");
  -[PXSharedLibraryInvitationContentView _updateTextLabel](self, "_updateTextLabel");
}

- (PXSharedLibraryParticipant)owner
{
  return self->_owner;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (UILabel)textLabel
{
  return self->_textLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_owner, 0);
  objc_storeStrong((id *)&self->_badgeView, 0);
}

void __49__PXSharedLibraryInvitationContentView_setOwner___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;
  id v6;
  id v7;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "_createCombinedImage:displayScale:isRTL:", v4, *(unsigned __int8 *)(a1 + 56), *(double *)(a1 + 48));
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v6 = objc_loadWeakRetained(v3);
  objc_msgSend(v6, "_updateImageViewWithImage:owner:", v7, *(_QWORD *)(a1 + 32));

}

@end
