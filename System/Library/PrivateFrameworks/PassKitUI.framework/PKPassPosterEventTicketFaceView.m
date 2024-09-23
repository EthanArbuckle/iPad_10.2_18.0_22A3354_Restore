@implementation PKPassPosterEventTicketFaceView

- (id)_relevantBuckets
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];

  v9[4] = *MEMORY[0x1E0C80C00];
  -[PKPassFaceView pass](self, "pass");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKEventTicketFaceBucketsFactory headerFieldsForPass:](PKEventTicketFaceBucketsFactory, "headerFieldsForPass:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKEventTicketFaceBucketsFactory primaryFieldsForPass:](PKEventTicketFaceBucketsFactory, "primaryFieldsForPass:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKEventTicketFaceBucketsFactory secondaryFieldsForPass:](PKEventTicketFaceBucketsFactory, "secondaryFieldsForPass:", v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKEventTicketFaceBucketsFactory auxiliaryFieldsForPass:](PKEventTicketFaceBucketsFactory, "auxiliaryFieldsForPass:", v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  v9[1] = v4;
  v9[2] = v5;
  v9[3] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)templateForHeaderBucket
{
  return 0;
}

- (id)templateForLayoutMode:(int64_t)a3
{
  return 0;
}

- (void)createHeaderContentViews
{
  int64_t v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  id *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  uint64_t v20;
  UILabel *v21;
  UILabel *logoLabel;
  UILabel *v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  uint64_t v28;
  UILabel *v29;
  UILabel *v30;
  UILabel *v31;
  void *v32;
  UILabel *v33;
  void *v34;
  id v35;
  void *v36;
  int v37;
  void *v38;
  UILabel *v39;
  id v40;
  void *v41;
  UILabel *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  UILabel *v48;
  UILabel *dateLabel;
  id *v50;
  id v51;
  UILabel *v52;
  void *v53;
  id v54;
  void *v55;
  int v56;
  void *v57;
  UILabel *v58;
  id v59;
  void *v60;
  UILabel *v61;
  UILabel *v62;
  UILabel *timeLabel;
  UILabel *v64;
  void *v65;
  id v66;
  void *v67;
  int v68;
  void *v69;
  UILabel *v70;
  id v71;
  void *v72;
  UILabel *v73;
  int v74;
  void *v75;
  UILabel *v76;
  void *v77;
  void *v78;
  uint64_t v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  id v84;
  void *v85;
  void *v86;
  void *v87;
  id v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  void *v92;
  void *v93;
  id v94;
  void *v95;
  void *v96;
  id v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  CGPoint v102;
  CGSize v103;
  void *v104;
  id v105;
  void *v106;
  objc_super v107;
  _QWORD v108[3];
  _QWORD v109[3];
  _QWORD v110[2];
  _QWORD v111[4];
  CGRect v112;

  v111[2] = *MEMORY[0x1E0C80C00];
  v107.receiver = self;
  v107.super_class = (Class)PKPassPosterEventTicketFaceView;
  -[PKPassFrontFaceView createHeaderContentViews](&v107, sel_createHeaderContentViews);
  v3 = -[PKPassFaceView style](self, "style");
  -[PKPassFaceView pass](self, "pass");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPassFaceView colorProfile](self, "colorProfile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithPreferredContentSizeCategory:", *MEMORY[0x1E0DC4918]);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPassFaceView averageFaceColor](self, "averageFaceColor");
  v97 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v97, "CGColor");
  PKColorGetLightness();
  v7 = v6;
  v8 = (id *)MEMORY[0x1E0CD2E98];
  if (v6 <= 0.9)
    v8 = (id *)MEMORY[0x1E0CD2EA0];
  v105 = *v8;
  if (v7 <= 0.9)
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  v101 = v5;
  if ((objc_msgSend(v5, "supportsAutomaticForegroundVibrancy") & 1) != 0)
    v9 = 0;
  else
    v9 = objc_msgSend(v5, "supportsAutomaticLabelVibrancy") ^ 1;
  v10 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  objc_msgSend(v10, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAllowsGroupBlending:", v9);

  v104 = v10;
  -[PKPassFrontFaceView insertContentView:ofType:](self, "insertContentView:ofType:", v10, 0);
  self->_usingSportsLabel = 0;
  v102 = (CGPoint)*MEMORY[0x1E0C9D628];
  v103 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
  self->_cachedLogoLabelRect.origin = (CGPoint)*MEMORY[0x1E0C9D628];
  self->_cachedLogoLabelRect.size = v103;
  objc_msgSend(v4, "logoText");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  PKPassFaceLogoRect();
  v99 = v4;
  if (!CGRectIsEmpty(v112) && v3 == 9)
  {
    objc_msgSend(v4, "stringForSemanticKey:", *MEMORY[0x1E0D6A9F0]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = _PKEnumValueFromString();

    objc_msgSend(v4, "stringForSemanticKey:", *MEMORY[0x1E0D6AA08], 0, 1, 2, 3, 4, 5, 6, 7);
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringForSemanticKey:", *MEMORY[0x1E0D6A930]);
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14 != 3)
      goto LABEL_18;
    v15 = v96;
    if (!v15)
      goto LABEL_18;
    v16 = v15;
    v17 = objc_msgSend(v15, "length");

    if (v17
      && (v18 = v95) != 0
      && (v19 = v18, v20 = objc_msgSend(v18, "length"), v19, v20))
    {
      self->_usingSportsLabel = 1;
      v21 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
      logoLabel = self->_logoLabel;
      self->_logoLabel = v21;

      v23 = self->_logoLabel;
      objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setBackgroundColor:](v23, "setBackgroundColor:", v24);

      -[UILabel setLineBreakMode:](self->_logoLabel, "setLineBreakMode:", 4);
      -[UILabel setNumberOfLines:](self->_logoLabel, "setNumberOfLines:", 1);
      if (objc_msgSend(v101, "supportsAutomaticForegroundVibrancy"))
      {
        v25 = v100;
      }
      else
      {
        objc_msgSend(v101, "foregroundColor");
        v25 = (id)objc_claimAutoreleasedReturnValue();
      }
      v36 = v25;
      v74 = objc_msgSend(v101, "supportsAutomaticForegroundVibrancy");
      v75 = v105;
      if (!v74)
        v75 = 0;
      v76 = self->_logoLabel;
      v94 = v75;
      -[UILabel layer](v76, "layer");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "setCompositingFilter:", v94);

      v88 = objc_alloc_init(MEMORY[0x1E0CB3778]);
      PKFontForDefaultDesign(v106, (void *)*MEMORY[0x1E0DC4A88], 32770, 0, *MEMORY[0x1E0DC1420]);
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      v89 = *MEMORY[0x1E0DC1140];
      v79 = *MEMORY[0x1E0DC1140];
      v110[0] = *MEMORY[0x1E0DC1138];
      v90 = v110[0];
      v110[1] = v79;
      v111[0] = v78;
      v111[1] = v36;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v111, v110, 2);
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      v93 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v16, v92);
      objc_msgSend(v88, "appendAttributedString:", v93);
      PKFontForDefaultDesign(v106, (void *)*MEMORY[0x1E0DC4AA0], 32770, 0, *MEMORY[0x1E0DC1448]);
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      v108[0] = *MEMORY[0x1E0DC1108];
      v81 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v78, "capHeight");
      v91 = v80;
      objc_msgSend(v80, "xHeight");
      PKFloatRoundToPixel();
      objc_msgSend(v81, "numberWithDouble:");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      v109[0] = v82;
      v109[1] = v80;
      v108[1] = v90;
      v108[2] = v89;
      v109[2] = v36;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v109, v108, 3);
      v83 = (void *)objc_claimAutoreleasedReturnValue();

      v84 = objc_alloc(MEMORY[0x1E0CB3498]);
      PKLocalizedTicketingString(CFSTR("LABEL_LOGO_VERSUS"));
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      v86 = (void *)objc_msgSend(v84, "initWithString:attributes:", v85, v83);

      objc_msgSend(v88, "appendAttributedString:", v86);
      v87 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v19, v92);
      objc_msgSend(v88, "appendAttributedString:", v87);
      -[UILabel setAttributedText:](self->_logoLabel, "setAttributedText:", v88);
      objc_msgSend(v104, "addSubview:", self->_logoLabel);

    }
    else
    {
LABEL_18:
      v26 = v98;
      if (!v26)
        goto LABEL_27;
      v27 = v26;
      v28 = objc_msgSend(v26, "length");

      if (!v28)
        goto LABEL_27;
      v29 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
      v30 = self->_logoLabel;
      self->_logoLabel = v29;

      v31 = self->_logoLabel;
      objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setBackgroundColor:](v31, "setBackgroundColor:", v32);

      -[UILabel setLineBreakMode:](self->_logoLabel, "setLineBreakMode:", 4);
      -[UILabel setNumberOfLines:](self->_logoLabel, "setNumberOfLines:", 2);
      v33 = self->_logoLabel;
      PKFontForDefaultDesign(v106, (void *)*MEMORY[0x1E0DC4B10], 32770, 0, *MEMORY[0x1E0DC1420]);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setFont:](v33, "setFont:", v34);

      -[UILabel setText:](self->_logoLabel, "setText:", v27);
      if (objc_msgSend(v101, "supportsAutomaticForegroundVibrancy"))
      {
        v35 = v100;
      }
      else
      {
        objc_msgSend(v101, "foregroundColor");
        v35 = (id)objc_claimAutoreleasedReturnValue();
      }
      v36 = v35;
      v37 = objc_msgSend(v101, "supportsAutomaticForegroundVibrancy");
      v38 = v105;
      if (!v37)
        v38 = 0;
      v39 = self->_logoLabel;
      v40 = v38;
      -[UILabel setTextColor:](v39, "setTextColor:", v36);
      -[UILabel layer](self->_logoLabel, "layer");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "setCompositingFilter:", v40);

      v42 = self->_logoLabel;
      objc_msgSend(v104, "addSubview:", v42);
    }

    v4 = v99;
LABEL_27:

  }
  -[PKPassFaceView buckets](self, "buckets");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "firstObject");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "firstObject");
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v45)
    __break(1u);
  self->_cachedDateLabelFrame.origin = v102;
  self->_cachedDateLabelFrame.size = v103;
  objc_msgSend(v45, "label");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "value");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  if (v47)
  {
    v48 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    dateLabel = self->_dateLabel;
    self->_dateLabel = v48;

    -[UILabel setNumberOfLines:](self->_dateLabel, "setNumberOfLines:", 1);
    -[UILabel setLineBreakMode:](self->_dateLabel, "setLineBreakMode:", 4);
    -[UILabel setTextAlignment:](self->_dateLabel, "setTextAlignment:", 2);
    v50 = (id *)MEMORY[0x1E0DC4A88];
    if (v46)
      v50 = (id *)MEMORY[0x1E0DC4B10];
    v51 = *v50;
    v52 = self->_dateLabel;
    PKFontForDefaultDesign(v106, v51, 32770, 0, *MEMORY[0x1E0DC1420]);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v52, "setFont:", v53);

    -[UILabel setText:](self->_dateLabel, "setText:", v47);
    if (objc_msgSend(v101, "supportsAutomaticForegroundVibrancy"))
    {
      v54 = v100;
    }
    else
    {
      objc_msgSend(v101, "foregroundColor");
      v54 = (id)objc_claimAutoreleasedReturnValue();
    }
    v55 = v54;
    v56 = objc_msgSend(v101, "supportsAutomaticForegroundVibrancy");
    v57 = v105;
    if (!v56)
      v57 = 0;
    v58 = self->_dateLabel;
    v59 = v57;
    -[UILabel setTextColor:](v58, "setTextColor:", v55);
    -[UILabel layer](self->_dateLabel, "layer");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "setCompositingFilter:", v59);

    v61 = self->_dateLabel;
    objc_msgSend(v104, "addSubview:", v61);

    v4 = v99;
  }
  self->_cachedTimeLabelFrame.origin = v102;
  self->_cachedTimeLabelFrame.size = v103;
  if (v46)
  {
    v62 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    timeLabel = self->_timeLabel;
    self->_timeLabel = v62;

    -[UILabel setNumberOfLines:](self->_timeLabel, "setNumberOfLines:", 1);
    -[UILabel setLineBreakMode:](self->_timeLabel, "setLineBreakMode:", 4);
    -[UILabel setTextAlignment:](self->_timeLabel, "setTextAlignment:", 2);
    v64 = self->_timeLabel;
    v65 = (void *)_PKFontForDesign(v106, (void *)*MEMORY[0x1E0DC13A0], (void *)*MEMORY[0x1E0DC4B10], 0x8000, 32, 0);
    -[UILabel setFont:](v64, "setFont:", v65);

    -[UILabel setText:](self->_timeLabel, "setText:", v46);
    if (objc_msgSend(v101, "supportsAutomaticLabelVibrancy"))
    {
      v66 = v100;
    }
    else
    {
      objc_msgSend(v101, "labelColor");
      v66 = (id)objc_claimAutoreleasedReturnValue();
    }
    v67 = v66;
    v68 = objc_msgSend(v101, "supportsAutomaticLabelVibrancy");
    v69 = v105;
    if (!v68)
      v69 = 0;
    v70 = self->_timeLabel;
    v71 = v69;
    -[UILabel setTextColor:](v70, "setTextColor:", v67);
    -[UILabel layer](self->_timeLabel, "layer");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "setCompositingFilter:", v71);

    v73 = self->_timeLabel;
    objc_msgSend(v104, "addSubview:", v73);

    v4 = v99;
  }

}

- (void)createBodyContentViews
{
  void *v3;
  void *v4;
  void *v5;
  UIView *v6;
  UIView *sectionColorView;
  UIView *v8;
  UIView *sectionColorMaskView;
  UIView *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  CGFloat v19;
  CGFloat v20;
  id v21;
  void *v22;
  UIImageView *v23;
  UIImageView *secondaryLogoImageView;
  void *v25;
  void *v26;
  _BOOL4 v27;
  id v28;
  double v29;
  double v30;
  id *v31;
  int v32;
  id v33;
  void *v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  void *v39;
  unint64_t v40;
  void *v41;
  void *v42;
  CGSize v43;
  id *v44;
  id v45;
  void *v46;
  UILabel *v47;
  UILabel *primaryFieldLabel;
  id v49;
  id v50;
  void *v51;
  int v52;
  void *v53;
  id v54;
  void *v55;
  UILabel *v56;
  void *v57;
  id v58;
  void *v59;
  void *v60;
  double v61;
  double v62;
  PKDynamicPassBucketView *v63;
  PKDynamicPassBucketView *secondaryBucketView;
  id v65;
  void *v66;
  int v67;
  void *v68;
  id v69;
  id v70;
  void *v71;
  int v72;
  void *v73;
  PKDynamicPassBucketView *v74;
  id v75;
  void *v76;
  UILabel *v77;
  UILabel *secnamLabel;
  UILabel *v79;
  void *v80;
  id v81;
  void *v82;
  int v83;
  void *v84;
  UILabel *v85;
  id v86;
  void *v87;
  UILabel *v88;
  void *v89;
  UILabel *v90;
  UILabel *venueLabel;
  uint64_t v92;
  UILabel *v93;
  void *v94;
  id v95;
  void *v96;
  int v97;
  void *v98;
  UILabel *v99;
  id v100;
  void *v101;
  UILabel *v102;
  void *v103;
  void *v104;
  id v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  CGSize v119;
  CGPoint v120;
  id v121;
  objc_super v122;

  v122.receiver = self;
  v122.super_class = (Class)PKPassPosterEventTicketFaceView;
  -[PKPassFrontFaceView createBodyContentViews](&v122, sel_createBodyContentViews);
  -[PKPassFaceView pass](self, "pass");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "seatingInformation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v108 = v4;
  objc_msgSend(v4, "firstSeat");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v107, "sectionColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    sectionColorView = self->_sectionColorView;
    self->_sectionColorView = v6;

    -[UIView setClipsToBounds:](self->_sectionColorView, "setClipsToBounds:", 1);
    v8 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    sectionColorMaskView = self->_sectionColorMaskView;
    self->_sectionColorMaskView = v8;

    v10 = self->_sectionColorMaskView;
    objc_msgSend(MEMORY[0x1E0DC3658], "pkui_colorWithPKColor:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v10, "setBackgroundColor:", v11);

    -[UIView addSubview:](self->_sectionColorView, "addSubview:", self->_sectionColorMaskView);
    v12 = objc_alloc_init(MEMORY[0x1E0CD27A8]);
    -[UIView layer](self->_sectionColorMaskView, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setMask:", v12);

    -[UIView layer](self->_sectionColorMaskView, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setMasksToBounds:", 1);

    if (-[PKPassFrontFaceView isRelevancyActive](self, "isRelevancyActive"))
      -[PKPassFrontFaceView insertContentView:ofType:](self, "insertContentView:ofType:", self->_sectionColorView, 2);

  }
  -[PKPassFaceView pass](self, "pass");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "secondaryLogoImage");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(MEMORY[0x1E0D66E08], "constraintsWithMaxSize:", 135.0, 12.0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "scale");
    objc_msgSend(v17, "setOutputScale:");
    objc_msgSend(v16, "resizedImageWithConstraints:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "size");
    self->_secondaryLogoSize.width = v19;
    self->_secondaryLogoSize.height = v20;
    v21 = objc_alloc(MEMORY[0x1E0DC3890]);
    v106 = v18;
    objc_msgSend(MEMORY[0x1E0DC3870], "imageWithPKImage:", v18);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (UIImageView *)objc_msgSend(v21, "initWithImage:", v22);
    secondaryLogoImageView = self->_secondaryLogoImageView;
    self->_secondaryLogoImageView = v23;

    -[UIImageView setContentMode:](self->_secondaryLogoImageView, "setContentMode:", 1);
    -[PKPassFrontFaceView insertContentView:ofType:](self, "insertContentView:ofType:", self->_secondaryLogoImageView, 2);

  }
  else
  {
    v106 = 0;
  }
  objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithPreferredContentSizeCategory:", *MEMORY[0x1E0DC4918]);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v117 = (void *)*MEMORY[0x1E0DC13A0];
  v111 = (void *)*MEMORY[0x1E0DC4AB8];
  v113 = (void *)_PKFontForDesign(v25, (void *)*MEMORY[0x1E0DC13A0], (void *)*MEMORY[0x1E0DC4AB8], 0, 0, 0);
  -[PKPassFaceView colorProfile](self, "colorProfile");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = -[PKPassFrontFaceView isRelevancyActive](self, "isRelevancyActive");
  if (v5 && v27)
  {
    v28 = v5;
  }
  else
  {
    -[PKPassFaceView averageFaceColor](self, "averageFaceColor");
    v28 = (id)objc_claimAutoreleasedReturnValue();
  }
  v105 = objc_retainAutorelease(v28);
  objc_msgSend(v105, "CGColor");
  PKColorGetLightness();
  v30 = v29;
  v31 = (id *)MEMORY[0x1E0CD2E98];
  if (v29 <= 0.9)
    v31 = (id *)MEMORY[0x1E0CD2EA0];
  v121 = *v31;
  if (v30 <= 0.9)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "darkGrayColor");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "lightGrayColor");
  }
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v26, "supportsAutomaticForegroundVibrancy") & 1) != 0)
    v32 = 1;
  else
    v32 = objc_msgSend(v26, "supportsAutomaticLabelVibrancy");
  v33 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  objc_msgSend(v33, "layer");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setAllowsGroupBlending:", v32 ^ 1u);

  v118 = v33;
  -[PKPassFrontFaceView insertContentView:ofType:](self, "insertContentView:ofType:", v33, 2);
  -[PKPassFaceView style](self, "style");
  PKPassFrontFaceContentSize();
  PKEventTicketV2PassScaleFactor();
  v36 = v35;
  -[PKPassFaceView buckets](self, "buckets");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v37, "count") == 4)
  {
    objc_msgSend(v37, "objectAtIndex:", 1);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "firstObject");
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v37, "objectAtIndex:", 2);
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v112, "count");
    v104 = v37;
    objc_msgSend(v37, "objectAtIndex:", 3);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "firstObject");
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    v43 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
    v120 = (CGPoint)*MEMORY[0x1E0C9D628];
    self->_cachedPrimaryFieldFrame.origin = (CGPoint)*MEMORY[0x1E0C9D628];
    self->_cachedPrimaryFieldFrame.size = v43;
    v119 = v43;
    v44 = (id *)MEMORY[0x1E0DC4AE8];
    v109 = v25;
    v110 = v5;
    v116 = v42;
    if (v39)
    {
      v45 = (id)*MEMORY[0x1E0DC4AE8];
      PKFontForDefaultDesign(v25, v45, 2, 0, *MEMORY[0x1E0DC1420]);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
      primaryFieldLabel = self->_primaryFieldLabel;
      self->_primaryFieldLabel = v47;

      -[UILabel setNumberOfLines:](self->_primaryFieldLabel, "setNumberOfLines:", 2);
      -[UILabel setLineBreakMode:](self->_primaryFieldLabel, "setLineBreakMode:", 4);
      -[UILabel setFont:](self->_primaryFieldLabel, "setFont:", v46);
      -[UILabel setTextAlignment:](self->_primaryFieldLabel, "setTextAlignment:", 0);
      v103 = v45;
      if (v40)
      {
        if (objc_msgSend(v26, "supportsAutomaticLabelVibrancy"))
        {
          v49 = v115;
        }
        else
        {
          objc_msgSend(v26, "labelColor");
          v49 = (id)objc_claimAutoreleasedReturnValue();
        }
        v51 = v49;
        v52 = objc_msgSend(v26, "supportsAutomaticLabelVibrancy");
      }
      else
      {
        if (objc_msgSend(v26, "supportsAutomaticForegroundVibrancy"))
        {
          v50 = v114;
        }
        else
        {
          objc_msgSend(v26, "foregroundColor");
          v50 = (id)objc_claimAutoreleasedReturnValue();
        }
        v51 = v50;
        v52 = objc_msgSend(v26, "supportsAutomaticForegroundVibrancy");
      }
      v53 = v121;
      if (!v52)
        v53 = 0;
      v54 = v53;
      -[UILabel setTextColor:](self->_primaryFieldLabel, "setTextColor:", v51);
      -[UILabel layer](self->_primaryFieldLabel, "layer");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "setCompositingFilter:", v54);

      v56 = self->_primaryFieldLabel;
      objc_msgSend(v39, "value");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setText:](v56, "setText:", v57);

      objc_msgSend(v118, "addSubview:", self->_primaryFieldLabel);
      v25 = v109;
      v5 = v110;
      v42 = v116;
    }
    self->_cachedSecondaryBucketFrame.origin = v120;
    self->_cachedSecondaryBucketFrame.size = v119;
    if (v40)
    {
      v58 = *v44;
      v59 = (void *)_PKFontForDesign(v25, v117, v58, 0, 32, 0);
      objc_msgSend(v59, "fontWithSize:", round(v36 * 36.0));
      v60 = (void *)objc_claimAutoreleasedReturnValue();

      v61 = 26.0;
      if (v40 == 2)
      {
        PKFloatRoundToPixel();
        v61 = v62;
      }
      v63 = -[PKDynamicPassBucketView initWithBucket:]([PKDynamicPassBucketView alloc], "initWithBucket:", v112);
      secondaryBucketView = self->_secondaryBucketView;
      self->_secondaryBucketView = v63;

      -[PKDynamicPassBucketView setLayoutDirection:](self->_secondaryBucketView, "setLayoutDirection:", 1);
      -[PKDynamicPassBucketView setDistribution:](self->_secondaryBucketView, "setDistribution:", v40 > 2);
      -[PKDynamicPassBucketView setSizingRule:](self->_secondaryBucketView, "setSizingRule:", 0);
      -[PKDynamicPassBucketView setSpacing:](self->_secondaryBucketView, "setSpacing:", v61);
      -[PKDynamicPassBucketView setVerticalPadding:](self->_secondaryBucketView, "setVerticalPadding:", 0.0);
      -[PKDynamicPassBucketView setMinResizeScale:](self->_secondaryBucketView, "setMinResizeScale:", 0.6);
      if (objc_msgSend(v26, "supportsAutomaticLabelVibrancy"))
      {
        v65 = v115;
      }
      else
      {
        objc_msgSend(v26, "labelColor");
        v65 = (id)objc_claimAutoreleasedReturnValue();
      }
      v66 = v65;
      v67 = objc_msgSend(v26, "supportsAutomaticLabelVibrancy");
      v68 = v121;
      if (!v67)
        v68 = 0;
      v69 = v68;
      -[PKDynamicPassBucketView setLabelFont:](self->_secondaryBucketView, "setLabelFont:", v113);
      -[PKDynamicPassBucketView setLabelTextColor:](self->_secondaryBucketView, "setLabelTextColor:", v66);
      -[PKDynamicPassBucketView setLabelBlendMode:](self->_secondaryBucketView, "setLabelBlendMode:", v69);
      if (objc_msgSend(v26, "supportsAutomaticForegroundVibrancy"))
      {
        v70 = v114;
      }
      else
      {
        objc_msgSend(v26, "foregroundColor");
        v70 = (id)objc_claimAutoreleasedReturnValue();
      }
      v71 = v70;
      v72 = objc_msgSend(v26, "supportsAutomaticForegroundVibrancy");
      v73 = v121;
      if (!v72)
        v73 = 0;
      v74 = self->_secondaryBucketView;
      v75 = v73;
      -[PKDynamicPassBucketView setValueFont:](v74, "setValueFont:", v60);
      -[PKDynamicPassBucketView setValueTextColor:](self->_secondaryBucketView, "setValueTextColor:", v71);
      -[PKDynamicPassBucketView setValueBlendMode:](self->_secondaryBucketView, "setValueBlendMode:", v75);
      -[PKPassFrontFaceView insertContentView:ofType:](self, "insertContentView:ofType:", self->_secondaryBucketView, 2);

      v25 = v109;
      v5 = v110;
      v42 = v116;
    }
    self->_cachedSecnamLabelFrame.origin = v120;
    self->_cachedSecnamLabelFrame.size = v119;
    objc_msgSend(v42, "label");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    if (v76)
    {
      v77 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
      secnamLabel = self->_secnamLabel;
      self->_secnamLabel = v77;

      -[UILabel setNumberOfLines:](self->_secnamLabel, "setNumberOfLines:", 1);
      -[UILabel setLineBreakMode:](self->_secnamLabel, "setLineBreakMode:", 4);
      -[UILabel setTextAlignment:](self->_secnamLabel, "setTextAlignment:", 0);
      v79 = self->_secnamLabel;
      v80 = (void *)_PKFontForDesign(v25, v117, v111, 0x8000, 32, 0);
      -[UILabel setFont:](v79, "setFont:", v80);

      if (objc_msgSend(v26, "supportsAutomaticLabelVibrancy"))
      {
        v81 = v115;
      }
      else
      {
        objc_msgSend(v26, "labelColor");
        v81 = (id)objc_claimAutoreleasedReturnValue();
      }
      v82 = v81;
      v83 = objc_msgSend(v26, "supportsAutomaticLabelVibrancy");
      v84 = v121;
      if (!v83)
        v84 = 0;
      v85 = self->_secnamLabel;
      v86 = v84;
      -[UILabel setTextColor:](v85, "setTextColor:", v82);
      -[UILabel layer](self->_secnamLabel, "layer");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v87, "setCompositingFilter:", v86);

      -[UILabel setText:](self->_secnamLabel, "setText:", v76);
      v88 = self->_secnamLabel;

      objc_msgSend(v118, "addSubview:", v88);
    }
    self->_cachedVenueLabelFrame.origin = v120;
    self->_cachedVenueLabelFrame.size = v119;
    objc_msgSend(v42, "value");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    if (v89)
    {
      v90 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
      venueLabel = self->_venueLabel;
      self->_venueLabel = v90;

      if (v76)
        v92 = 1;
      else
        v92 = 2;
      -[UILabel setNumberOfLines:](self->_venueLabel, "setNumberOfLines:", v92);
      -[UILabel setLineBreakMode:](self->_venueLabel, "setLineBreakMode:", 4 * (v76 != 0));
      -[UILabel setTextAlignment:](self->_venueLabel, "setTextAlignment:", 0);
      v93 = self->_venueLabel;
      v94 = (void *)_PKFontForDesign(v25, v117, v111, 0, 32, 0);
      -[UILabel setFont:](v93, "setFont:", v94);

      if (objc_msgSend(v26, "supportsAutomaticForegroundVibrancy"))
      {
        v95 = v114;
      }
      else
      {
        objc_msgSend(v26, "foregroundColor");
        v95 = (id)objc_claimAutoreleasedReturnValue();
      }
      v96 = v95;
      v97 = objc_msgSend(v26, "supportsAutomaticForegroundVibrancy");
      v98 = v121;
      if (!v97)
        v98 = 0;
      v99 = self->_venueLabel;
      v100 = v98;
      -[UILabel setTextColor:](v99, "setTextColor:", v96);
      -[UILabel layer](self->_venueLabel, "layer");
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v101, "setCompositingFilter:", v100);

      -[UILabel setText:](self->_venueLabel, "setText:", v89);
      v102 = self->_venueLabel;

      objc_msgSend(v118, "addSubview:", v102);
      v42 = v116;
    }

  }
  else
  {
    __break(1u);
  }
}

- (void)_updateBodyLabelColorsForRelevancyActive:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  double v12;
  double v13;
  id *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  char v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  id v30;
  id v31;

  v3 = a3;
  -[PKPassFaceView colorProfile](self, "colorProfile");
  v31 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v31, "supportsAutomaticForegroundVibrancy") & 1) == 0
    && !objc_msgSend(v31, "supportsAutomaticLabelVibrancy"))
  {
    goto LABEL_29;
  }
  -[PKPassFaceView pass](self, "pass");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "seatingInformation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "firstSeat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sectionColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v3 && v8)
  {
    v10 = v8;
  }
  else
  {
    -[PKPassFaceView averageFaceColor](self, "averageFaceColor");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = objc_retainAutorelease(v10);
  objc_msgSend(v11, "CGColor");
  PKColorGetLightness();
  v13 = v12;
  v14 = (id *)MEMORY[0x1E0CD2E98];
  if (v12 <= 0.9)
    v14 = (id *)MEMORY[0x1E0CD2EA0];
  v15 = *v14;
  if (v13 > 0.9)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "lightGrayColor");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "darkGrayColor");
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_primaryFieldLabel)
  {
    v29 = v9;
    v30 = v11;
    v18 = v7;
    v19 = v6;
    -[PKPassFaceView buckets](self, "buckets");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectAtIndex:", 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "count");

    if (v22)
    {
      v23 = objc_msgSend(v31, "supportsAutomaticLabelVibrancy");
      v24 = v17;
      if ((v23 & 1) == 0)
      {
LABEL_16:

        v6 = v19;
        v7 = v18;
        v9 = v29;
        v11 = v30;
        goto LABEL_17;
      }
    }
    else
    {
      v28 = objc_msgSend(v31, "supportsAutomaticForegroundVibrancy");
      v24 = v16;
      if (!v28)
        goto LABEL_16;
    }
    -[UILabel setTextColor:](self->_primaryFieldLabel, "setTextColor:", v24);
    -[UILabel layer](self->_primaryFieldLabel, "layer");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setCompositingFilter:", v15);

    goto LABEL_16;
  }
LABEL_17:
  if (self->_secondaryBucketView)
  {
    if (objc_msgSend(v31, "supportsAutomaticLabelVibrancy"))
    {
      -[PKDynamicPassBucketView setLabelTextColor:](self->_secondaryBucketView, "setLabelTextColor:", v17);
      -[PKDynamicPassBucketView setLabelBlendMode:](self->_secondaryBucketView, "setLabelBlendMode:", v15);
    }
    if (objc_msgSend(v31, "supportsAutomaticForegroundVibrancy"))
    {
      -[PKDynamicPassBucketView setValueTextColor:](self->_secondaryBucketView, "setValueTextColor:", v16);
      -[PKDynamicPassBucketView setValueBlendMode:](self->_secondaryBucketView, "setValueBlendMode:", v15);
    }
  }
  if (self->_secnamLabel && objc_msgSend(v31, "supportsAutomaticLabelVibrancy"))
  {
    -[UILabel setTextColor:](self->_secnamLabel, "setTextColor:", v17);
    -[UILabel layer](self->_secnamLabel, "layer");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setCompositingFilter:", v15);

  }
  if (self->_venueLabel && objc_msgSend(v31, "supportsAutomaticForegroundVibrancy"))
  {
    -[UILabel setTextColor:](self->_venueLabel, "setTextColor:", v16);
    -[UILabel layer](self->_venueLabel, "layer");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setCompositingFilter:", v15);

  }
LABEL_29:

}

- (void)layoutSubviews
{
  int64_t v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  double v12;
  double v13;
  double v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGRect *p_cachedLogoLabelRect;
  void *v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  double v39;
  CGRect *p_cachedDateLabelFrame;
  double v41;
  double v42;
  double width;
  double v44;
  double height;
  double MinY;
  double v47;
  double x;
  CGRect *p_cachedTimeLabelFrame;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double MaxY;
  void *v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  id v70;
  UIImageView *secondaryLogoImageView;
  CGFloat v72;
  CGFloat y;
  CGFloat v74;
  CGFloat v75;
  double v76;
  double v77;
  CGFloat v78;
  double v79;
  CGFloat v80;
  double v81;
  double v82;
  double v83;
  double v84;
  CGRect *p_cachedVenueLabelFrame;
  void *v86;
  void *v87;
  void *v88;
  double v89;
  double v90;
  BOOL v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  void *v106;
  void *v107;
  uint64_t v108;
  uint64_t v109;
  double v110;
  double v111;
  double v112;
  double v113;
  double v114;
  double v115;
  double v116;
  UILabel *venueLabel;
  double v118;
  double v119;
  double v120;
  id v121;
  double v122;
  double v123;
  double v124;
  double v125;
  double v126;
  double v127;
  double v128;
  CGFloat v129;
  UILabel *secnamLabel;
  CGRect *p_cachedSecondaryBucketFrame;
  void *v132;
  unint64_t v133;
  double v134;
  double v135;
  double v136;
  double v137;
  double v138;
  CGFloat v139;
  void *v140;
  void *v141;
  void *v142;
  id v143;
  void *v144;
  CGFloat v145;
  CGRect *p_cachedPrimaryFieldFrame;
  void *v147;
  unint64_t v148;
  double v149;
  double v150;
  double v151;
  double v152;
  void *v153;
  UILabel *primaryFieldLabel;
  double v155;
  double v156;
  double v157;
  double v158;
  double v159;
  void *v160;
  double v161;
  id v162;
  UILabel *v163;
  double v164;
  double v165;
  double v166;
  double v167;
  double v168;
  void *v169;
  double v170;
  CGFloat v171;
  void *v172;
  id v173;
  double v174;
  double v175;
  PKDynamicPassBucketView *secondaryBucketView;
  void *v177;
  void *v178;
  id v179;
  double v180;
  double v181;
  void *v182;
  CGFloat v183;
  double v184;
  CGFloat v185;
  double v186;
  double v187;
  double v188;
  double v189;
  double rect;
  CGFloat recta;
  double v192;
  double v193;
  double v194;
  double v195;
  double v196;
  double v197;
  CGFloat v198;
  double v199;
  double v200;
  CGFloat v201;
  objc_super v202;
  CGRect v203;
  CGRect v204;
  CGRect v205;
  CGRect v206;
  CGRect v207;
  CGRect v208;
  CGRect v209;
  CGRect v210;
  CGRect v211;
  CGRect v212;
  CGRect v213;
  CGRect v214;
  CGRect v215;

  v202.receiver = self;
  v202.super_class = (Class)PKPassPosterEventTicketFaceView;
  -[PKPassFrontFaceView layoutSubviews](&v202, sel_layoutSubviews);
  v3 = -[PKPassFaceView style](self, "style");
  objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithPreferredContentSizeCategory:", *MEMORY[0x1E0DC4918]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PKPassFrontFaceContentSize();
  v6 = v5;
  v200 = v7;
  PKFloatRoundToPixel();
  v9 = v8;
  v193 = v6 + -28.0;
  PKFloatRoundToPixel();
  v195 = v10;
  PKPassFaceLogoRect();
  v15 = v11;
  v16 = v12;
  v17 = v13;
  v18 = v14;
  v199 = v6;
  if (self->_logoLabel && !CGRectIsNull(*(CGRect *)&v11))
  {
    p_cachedLogoLabelRect = &self->_cachedLogoLabelRect;
    if (CGRectIsNull(self->_cachedLogoLabelRect))
    {
      v197 = v9;
      if (self->_usingSportsLabel)
        v17 = v195;
      else
        v17 = v9;
      -[PKPassFaceView pass](self, "pass");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "logoRect");
      v22 = v21;
      v24 = v23;
      v26 = v25;
      v28 = v27;

      v203.origin.x = v22;
      v203.origin.y = v24;
      v203.size.width = v26;
      v203.size.height = v28;
      if (CGRectIsNull(v203))
      {
        v204.origin.x = v15;
        v204.origin.y = v16;
        v204.size.width = v17;
        v204.size.height = v18;
        CGRectGetMinX(v204);
      }
      else
      {
        v205.origin.x = v22;
        v205.origin.y = v24;
        v205.size.width = v26;
        v205.size.height = v28;
        CGRectGetMaxX(v205);
      }
      v206.origin.x = v15;
      v206.origin.y = v16;
      v206.size.width = v17;
      v206.size.height = v18;
      CGRectGetMaxX(v206);
      -[UILabel font](self->_logoLabel, "font");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "_bodyLeading");
      PKSizeCeilToPixel();
      v32 = v31;
      if (!self->_usingSportsLabel)
      {
        -[UILabel sizeThatFits:](self->_logoLabel, "sizeThatFits:", v30, 1.79769313e308);
        if (v33 <= v32)
        {
          PKFontForDefaultDesign(v4, (void *)*MEMORY[0x1E0DC4A88], 32770, 0, *MEMORY[0x1E0DC1420]);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          -[UILabel setFont:](self->_logoLabel, "setFont:", v34);
          -[UILabel sizeThatFits:](self->_logoLabel, "sizeThatFits:", 1.79769313e308, v32);

        }
      }
      UIRectCenteredYInRect();
      p_cachedLogoLabelRect->origin.x = v35;
      self->_cachedLogoLabelRect.origin.y = v36;
      self->_cachedLogoLabelRect.size.width = v37;
      self->_cachedLogoLabelRect.size.height = v38;

      v9 = v197;
      v6 = v199;
    }
    -[UILabel setFrame:](self->_logoLabel, "setFrame:", p_cachedLogoLabelRect->origin.x, self->_cachedLogoLabelRect.origin.y, self->_cachedLogoLabelRect.size.width, self->_cachedLogoLabelRect.size.height);
  }
  if (self->_dateLabel)
  {
    v39 = v6;
    p_cachedDateLabelFrame = &self->_cachedDateLabelFrame;
    if (CGRectIsNull(self->_cachedDateLabelFrame))
    {
      v41 = v9;
      -[UILabel sizeThatFits:](self->_dateLabel, "sizeThatFits:", v9, 1.79769313e308);
      width = v42;
      height = v44;
      v207.origin.x = v15;
      v207.origin.y = v16;
      v207.size.width = v17;
      v207.size.height = v18;
      MinY = CGRectGetMinY(v207);
      if (!self->_timeLabel)
      {
        PKFloatRoundToPixel();
        MinY = MinY + v47;
      }
      x = v39 + -14.0 - width;
      p_cachedDateLabelFrame->origin.x = x;
      self->_cachedDateLabelFrame.origin.y = MinY;
      self->_cachedDateLabelFrame.size.width = width;
      self->_cachedDateLabelFrame.size.height = height;
    }
    else
    {
      v41 = v9;
      x = p_cachedDateLabelFrame->origin.x;
      MinY = self->_cachedDateLabelFrame.origin.y;
      width = self->_cachedDateLabelFrame.size.width;
      height = self->_cachedDateLabelFrame.size.height;
    }
    -[UILabel setFrame:](self->_dateLabel, "setFrame:", x, MinY, width, height);
    v6 = v39;
    v9 = v41;
  }
  if (self->_timeLabel)
  {
    p_cachedTimeLabelFrame = &self->_cachedTimeLabelFrame;
    if (CGRectIsNull(self->_cachedTimeLabelFrame))
    {
      -[UILabel sizeThatFits:](self->_timeLabel, "sizeThatFits:", v9, 1.79769313e308);
      v51 = v50;
      v53 = v52;
      v54 = v6 + -14.0 - v50;
      MaxY = CGRectGetMaxY(self->_cachedDateLabelFrame);
      p_cachedTimeLabelFrame->origin.x = v54;
      self->_cachedTimeLabelFrame.origin.y = MaxY;
      self->_cachedTimeLabelFrame.size.width = v51;
      self->_cachedTimeLabelFrame.size.height = v53;
    }
    else
    {
      v54 = p_cachedTimeLabelFrame->origin.x;
      MaxY = self->_cachedTimeLabelFrame.origin.y;
      v51 = self->_cachedTimeLabelFrame.size.width;
      v53 = self->_cachedTimeLabelFrame.size.height;
    }
    -[UILabel setFrame:](self->_timeLabel, "setFrame:", v54, MaxY, v51, v53);
  }
  -[PKPassFaceView backgroundView](self, "backgroundView");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "bounds");
  v58 = v57;
  v60 = v59;
  v62 = v61;
  v64 = v63;

  if (self->_sectionColorView)
  {
    v208.origin.x = MEMORY[0x1A1AE47F4](v3);
    -[UIView setFrame:](self->_sectionColorView, "setFrame:", 0.0, v200 - CGRectGetHeight(v208), v6);
    -[PKPassFaceView contentView](self, "contentView");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "sendSubviewToBack:", self->_sectionColorView);

    -[PKPassPosterEventTicketFaceView convertRect:toView:](self, "convertRect:toView:", self->_sectionColorView, v58, v60, v62, v64);
    -[UIView setFrame:](self->_sectionColorMaskView, "setFrame:");
    -[UIView layer](self->_sectionColorMaskView, "layer");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "mask");
    v67 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v67, "setFrame:", v58, v60, v62, v64);
    -[PKPassFaceView backgroundView](self, "backgroundView");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "image");
    v69 = (void *)objc_claimAutoreleasedReturnValue();

    v70 = objc_retainAutorelease(v69);
    objc_msgSend(v67, "setContents:", objc_msgSend(v70, "CGImage"));

  }
  secondaryLogoImageView = self->_secondaryLogoImageView;
  if (secondaryLogoImageView)
    -[UIImageView setFrame:](secondaryLogoImageView, "setFrame:", v6 - self->_secondaryLogoSize.width + -14.0, v200 - self->_secondaryLogoSize.height + -14.0);
  v209.origin.x = MEMORY[0x1A1AE47F4](v3);
  v72 = v209.origin.x;
  y = v209.origin.y;
  v74 = v209.size.width;
  v75 = v209.size.height;
  CGRectGetMinY(v209);
  v210.origin.x = v72;
  v210.origin.y = y;
  v210.size.width = v74;
  v210.size.height = v75;
  v196 = CGRectGetHeight(v210);
  PKEventTicketV2PassScaleFactor();
  PKFloatRoundToPixel();
  v77 = v76;
  v78 = *MEMORY[0x1E0C9D628];
  v79 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v81 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v80 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  v82 = v80;
  v198 = v81;
  v83 = v79;
  v84 = *MEMORY[0x1E0C9D628];
  if (self->_venueLabel)
  {
    p_cachedVenueLabelFrame = &self->_cachedVenueLabelFrame;
    if (CGRectIsNull(self->_cachedVenueLabelFrame))
    {
      -[UILabel font](self->_secnamLabel, "font");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel font](self->_venueLabel, "font");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      v88 = v87;
      v89 = self->_secondaryLogoSize.width;
      v189 = v78;
      v192 = v77;
      if (self->_secnamLabel)
      {
        rect = v79;
        v90 = v89 + 14.0;
        v91 = v89 <= 0.0;
        v92 = 0.0;
        if (!v91)
          v92 = v90;
        v93 = v193 - v92;
        -[UILabel sizeThatFits:](self->_venueLabel, "sizeThatFits:", v193 - v92, 1.79769313e308);
        v95 = v94;
        v97 = v96;
        objc_msgSend(v86, "_bodyLeading");
        PKSizeCeilToPixel();
        v99 = v98;
        v101 = v100;
        -[UILabel sizeThatFits:](self->_secnamLabel, "sizeThatFits:", 1.79769313e308);
        v104 = v103;
        if (v102 > v99 || v196 < 120.0)
        {
          v106 = (void *)*MEMORY[0x1E0DC13A0];
          v107 = (void *)*MEMORY[0x1E0DC4AA0];
          v108 = _PKFontForDesign(v4, (void *)*MEMORY[0x1E0DC13A0], (void *)*MEMORY[0x1E0DC4AA0], 0x8000, 32, 0);

          v109 = _PKFontForDesign(v4, v106, v107, 0, 32, 0);
          -[UILabel setFont:](self->_secnamLabel, "setFont:", v108);
          -[UILabel setFont:](self->_venueLabel, "setFont:", v109);
          -[UILabel sizeThatFits:](self->_venueLabel, "sizeThatFits:", 1.79769313e308, v101);
          v95 = v110;
          v97 = v111;
          -[UILabel sizeThatFits:](self->_secnamLabel, "sizeThatFits:", 1.79769313e308, v101);
          v104 = v112;
          v88 = (void *)v109;
          v86 = (void *)v108;
        }
        if (v95 >= v93)
          v113 = v93;
        else
          v113 = v95;
        if (v102 >= v93)
          v114 = v93;
        else
          v114 = v102;
        v79 = rect;
      }
      else
      {
        v114 = *MEMORY[0x1E0C9D820];
        v104 = *(double *)(MEMORY[0x1E0C9D820] + 8);
        v115 = v193 - v89 + -14.0;
        if (v195 < v115)
          v115 = v195;
        if (v89 <= 0.0)
          v116 = v195;
        else
          v116 = v115;
        venueLabel = self->_venueLabel;
        objc_msgSend(v87, "_bodyLeading");
        PKFloatCeilToPixel();
        -[UILabel sizeThatFits:](venueLabel, "sizeThatFits:", 1.79769313e308, v118);
        if (v119 <= v116)
        {
          v113 = v119;
          v97 = v120;
        }
        else
        {
          v121 = (id)_PKFontForDesign(v4, (void *)*MEMORY[0x1E0DC13A0], (void *)*MEMORY[0x1E0DC4AA0], 0, 32, 0);

          -[UILabel setFont:](self->_venueLabel, "setFont:", v121);
          -[UILabel sizeThatFits:](self->_venueLabel, "sizeThatFits:", v116, 1.79769313e308);
          v113 = v122;
          v97 = v123;
          v88 = v121;
        }
      }
      objc_msgSend(v88, "descender");
      PKFloatCeilToPixel();
      v125 = v200 - v97 + -14.0 - v124;
      p_cachedVenueLabelFrame->origin.x = 14.0;
      self->_cachedVenueLabelFrame.origin.y = v125;
      self->_cachedVenueLabelFrame.size.width = v113;
      self->_cachedVenueLabelFrame.size.height = v97;
      if (self->_secnamLabel)
      {
        v126 = 14.0;
        v127 = v113;
        v128 = v97;
        v129 = CGRectGetMinY(*(CGRect *)(&v125 - 1));
        self->_cachedSecnamLabelFrame.origin.x = 14.0;
        self->_cachedSecnamLabelFrame.origin.y = v129 - v104 + -2.0;
        self->_cachedSecnamLabelFrame.size.width = v114;
        self->_cachedSecnamLabelFrame.size.height = v104;
      }

      v78 = v189;
      v77 = v192;
    }
    v84 = p_cachedVenueLabelFrame->origin.x;
    v83 = self->_cachedVenueLabelFrame.origin.y;
    v81 = self->_cachedVenueLabelFrame.size.width;
    v82 = self->_cachedVenueLabelFrame.size.height;
    -[UILabel setFrame:](self->_venueLabel, "setFrame:", p_cachedVenueLabelFrame->origin.x, v83, v81, v82);
    secnamLabel = self->_secnamLabel;
    if (secnamLabel)
    {
      v84 = self->_cachedSecnamLabelFrame.origin.x;
      v83 = self->_cachedSecnamLabelFrame.origin.y;
      v81 = self->_cachedSecnamLabelFrame.size.width;
      v82 = self->_cachedSecnamLabelFrame.size.height;
      -[UILabel setFrame:](secnamLabel, "setFrame:", v84, v83, v81, v82);
    }
  }
  v201 = v81;
  if (self->_secondaryBucketView)
  {
    p_cachedSecondaryBucketFrame = &self->_cachedSecondaryBucketFrame;
    if (CGRectIsNull(self->_cachedSecondaryBucketFrame))
    {
      if (self->_primaryFieldLabel)
      {
        -[PKDynamicPassBucketView bucket](self->_secondaryBucketView, "bucket");
        v132 = (void *)objc_claimAutoreleasedReturnValue();
        v133 = objc_msgSend(v132, "count");

        v134 = v77 + 24.0;
        if (v133 <= 1)
          v134 = v195;
        v135 = v193 - v134;
      }
      else
      {
        v135 = v193;
      }
      -[PKDynamicPassBucketView fittedSizeFor:](self->_secondaryBucketView, "fittedSizeFor:", v135, 1.79769313e308);
      v137 = v136;
      v139 = v138;
      -[PKDynamicPassBucketView labelFont](self->_secondaryBucketView, "labelFont");
      v140 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKDynamicPassBucketView resizedValueFont](self->_secondaryBucketView, "resizedValueFont");
      v141 = (void *)objc_claimAutoreleasedReturnValue();
      v142 = v141;
      if (v141)
      {
        v143 = v141;
      }
      else
      {
        -[PKDynamicPassBucketView valueFont](self->_secondaryBucketView, "valueFont");
        v143 = (id)objc_claimAutoreleasedReturnValue();
      }
      v144 = v143;

      v211.origin.x = v84;
      v211.origin.y = v83;
      v211.size.width = v81;
      v211.size.height = v82;
      if (!CGRectIsNull(v211))
      {
        v212.origin.x = v84;
        v212.origin.y = v83;
        v212.size.width = v81;
        v212.size.height = v82;
        CGRectGetMinY(v212);
      }
      objc_msgSend(v140, "ascender");
      objc_msgSend(v140, "capHeight");
      PKFloatFloorToPixel();
      objc_msgSend(v144, "descender");
      PKFloatFloorToPixel();
      PKFloatRoundToPixel();
      p_cachedSecondaryBucketFrame->origin.x = v199 + -14.0 - v137;
      self->_cachedSecondaryBucketFrame.origin.y = v145;
      self->_cachedSecondaryBucketFrame.size.width = v137;
      self->_cachedSecondaryBucketFrame.size.height = v139;

    }
    v78 = p_cachedSecondaryBucketFrame->origin.x;
    v79 = self->_cachedSecondaryBucketFrame.origin.y;
    v80 = self->_cachedSecondaryBucketFrame.size.height;
    v198 = self->_cachedSecondaryBucketFrame.size.width;
    -[PKDynamicPassBucketView setFrame:](self->_secondaryBucketView, "setFrame:", p_cachedSecondaryBucketFrame->origin.x, v79);
  }
  if (self->_primaryFieldLabel)
  {
    p_cachedPrimaryFieldFrame = &self->_cachedPrimaryFieldFrame;
    if (CGRectIsNull(self->_cachedPrimaryFieldFrame))
    {
      -[PKDynamicPassBucketView bucket](self->_secondaryBucketView, "bucket");
      v147 = (void *)objc_claimAutoreleasedReturnValue();
      v148 = objc_msgSend(v147, "count");

      recta = v79;
      v194 = v80;
      if (self->_secondaryBucketView)
      {
        if (v148 <= 1)
          v149 = v195;
        else
          v149 = v77;
      }
      else
      {
        PKFloatRoundToPixel();
        v149 = v150;
      }
      PKEventTicketV2PassScaleFactor();
      v152 = v151;
      -[UILabel font](self->_primaryFieldLabel, "font");
      v153 = (void *)objc_claimAutoreleasedReturnValue();
      primaryFieldLabel = self->_primaryFieldLabel;
      objc_msgSend(v153, "_bodyLeading");
      PKFloatCeilToPixel();
      -[UILabel sizeThatFits:](primaryFieldLabel, "sizeThatFits:", 1.79769313e308, v155);
      v157 = v156;
      v159 = v158;
      if (v156 <= v149)
        goto LABEL_90;
      if (self->_secondaryBucketView && v148 >= 2)
      {
        PKFontForDefaultDesign(v4, (void *)*MEMORY[0x1E0DC4AD0], 2, 0, *MEMORY[0x1E0DC1420]);
        v160 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v160, "pointSize");
        objc_msgSend(v160, "fontWithSize:", round(v152 * v161 + v152 * v161) * 0.5);
        v162 = (id)objc_claimAutoreleasedReturnValue();

        -[UILabel setFont:](self->_primaryFieldLabel, "setFont:", v162);
        v163 = self->_primaryFieldLabel;
        objc_msgSend(v162, "_bodyLeading");

        PKFloatCeilToPixel();
        -[UILabel sizeThatFits:](v163, "sizeThatFits:", 1.79769313e308, v164);
        v157 = v165;
        v159 = v166;

        v153 = v162;
      }
      if (v157 <= v149)
      {
LABEL_90:
        v171 = v194;
      }
      else
      {
        v167 = *MEMORY[0x1E0DC1420];
        v168 = v149;
        if (v148 < 2)
        {
          PKFontForDefaultDesign(v4, (void *)*MEMORY[0x1E0DC4B58], 2, 0, v167);
          v169 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v169, "pointSize");
        }
        else
        {
          PKFontForDefaultDesign(v4, (void *)*MEMORY[0x1E0DC4B10], 2, 0, v167);
          v169 = (void *)objc_claimAutoreleasedReturnValue();
          v170 = 13.5;
        }
        v171 = v194;
        objc_msgSend(v169, "fontWithSize:", round(v152 * v170 + v152 * v170) * 0.5);
        v172 = (void *)objc_claimAutoreleasedReturnValue();

        v173 = v172;
        -[UILabel setFont:](self->_primaryFieldLabel, "setFont:", v173);

        -[UILabel sizeThatFits:](self->_primaryFieldLabel, "sizeThatFits:", v168, 1.79769313e308);
        v157 = v174;
        v159 = v175;
        v153 = v173;
      }
      secondaryBucketView = self->_secondaryBucketView;
      if (secondaryBucketView && v148 >= 2)
      {
        -[PKDynamicPassBucketView resizedValueFont](secondaryBucketView, "resizedValueFont");
        v177 = (void *)objc_claimAutoreleasedReturnValue();
        v178 = v177;
        if (v177)
        {
          v179 = v177;
        }
        else
        {
          -[PKDynamicPassBucketView valueFont](self->_secondaryBucketView, "valueFont");
          v179 = (id)objc_claimAutoreleasedReturnValue();
        }
        v182 = v179;

        v215.origin.x = v78;
        v215.origin.y = recta;
        v215.size.width = v198;
        v215.size.height = v171;
        v183 = CGRectGetMaxY(v215) - v159;
        objc_msgSend(v182, "descender");
        PKFloatCeilToPixel();
        v185 = v183 + v184;
        objc_msgSend(v153, "descender");
        PKFloatCeilToPixel();
        v181 = v185 - v186;
        objc_msgSend(v153, "_bodyLeading");
        PKFloatCeilToPixel();
        if (v159 <= v187)
        {
          objc_msgSend(v182, "capHeight");
          objc_msgSend(v153, "capHeight");
          PKFloatRoundToPixel();
          v181 = v181 - v188;
        }

      }
      else
      {
        v213.origin.x = v84;
        v213.origin.y = v83;
        v213.size.width = v201;
        v213.size.height = v82;
        if (!CGRectIsNull(v213))
        {
          v214.origin.x = v84;
          v214.origin.y = v83;
          v214.size.width = v201;
          v214.size.height = v82;
          CGRectGetMinY(v214);
        }
        objc_msgSend(v153, "ascender");
        objc_msgSend(v153, "capHeight");
        PKFloatFloorToPixel();
        objc_msgSend(v153, "descender");
        PKFloatFloorToPixel();
        PKFloatRoundToPixel();
        v181 = v180;
      }
      p_cachedPrimaryFieldFrame->origin.x = 14.0;
      self->_cachedPrimaryFieldFrame.origin.y = v181;
      self->_cachedPrimaryFieldFrame.size.width = v157;
      self->_cachedPrimaryFieldFrame.size.height = v159;

    }
    -[UILabel setFrame:](self->_primaryFieldLabel, "setFrame:", p_cachedPrimaryFieldFrame->origin.x, self->_cachedPrimaryFieldFrame.origin.y, self->_cachedPrimaryFieldFrame.size.width, self->_cachedPrimaryFieldFrame.size.height);
  }

}

- (void)setRelevancyActive:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL4 v5;
  objc_super v6;

  v3 = a3;
  v5 = -[PKPassFrontFaceView isRelevancyActive](self, "isRelevancyActive");
  v6.receiver = self;
  v6.super_class = (Class)PKPassPosterEventTicketFaceView;
  -[PKPassFrontFaceView setRelevancyActive:](&v6, sel_setRelevancyActive_, v3);
  if (v5 != v3 && self->_sectionColorView)
  {
    if (v3)
      -[PKPassFrontFaceView insertContentView:ofType:](self, "insertContentView:ofType:");
    else
      -[PKPassFaceView removeContentView:ofType:](self, "removeContentView:ofType:");
    -[PKPassPosterEventTicketFaceView _updateBodyLabelColorsForRelevancyActive:](self, "_updateBodyLabelColorsForRelevancyActive:", v3);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_venueLabel, 0);
  objc_storeStrong((id *)&self->_secnamLabel, 0);
  objc_storeStrong((id *)&self->_secondaryBucketView, 0);
  objc_storeStrong((id *)&self->_primaryFieldLabel, 0);
  objc_storeStrong((id *)&self->_timeLabel, 0);
  objc_storeStrong((id *)&self->_dateLabel, 0);
  objc_storeStrong((id *)&self->_sectionColorMaskView, 0);
  objc_storeStrong((id *)&self->_sectionColorView, 0);
  objc_storeStrong((id *)&self->_secondaryLogoImageView, 0);
  objc_storeStrong((id *)&self->_logoLabel, 0);
}

@end
