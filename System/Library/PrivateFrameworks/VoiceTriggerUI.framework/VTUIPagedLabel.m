@implementation VTUIPagedLabel

- (VTUIPagedLabel)initWithFrame:(CGRect)a3 isProximity:(BOOL)a4 forEnrollmentStyle:(int64_t)a5
{
  return -[VTUIPagedLabel initWithFrame:isProximity:forEnrollmentStyle:withIntelligentLight:](self, "initWithFrame:isProximity:forEnrollmentStyle:withIntelligentLight:", a4, a5, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (VTUIPagedLabel)initWithFrame:(CGRect)a3 isProximity:(BOOL)a4 forEnrollmentStyle:(int64_t)a5 withIntelligentLight:(BOOL)a6
{
  VTUIPagedLabel *v9;
  VTUIPagedLabel *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)VTUIPagedLabel;
  v9 = -[VTUIPagedLabel initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v10 = v9;
  if (v9)
  {
    v9->_isProximity = a4;
    v9->_enrollmentStyle = a5;
    v9->_hasIntelligentLight = a6;
    -[VTUIPagedLabel setupViews](v9, "setupViews");
  }
  return v10;
}

- (void)setupViews
{
  UIScrollView *v3;
  UIScrollView *scrollView;
  id v5;
  UIView *v6;
  UIView *instructionContainerLeft;
  id v8;
  UIView *v9;
  UIView *instructionContainerRight;
  UILabel *v11;
  UILabel *instructionLabelLeft;
  UILabel *v13;
  UILabel *instructionLabelRight;
  UILabel *v15;
  void *v16;
  UILabel *v17;
  void *v18;
  UILabel *v19;
  void *v20;
  UILabel *v21;
  void *v22;
  UILabel *v23;
  void *v24;
  UILabel *v25;
  UILabel *v26;
  void *v27;
  UILabel *v28;
  void *v29;
  void *v30;
  UILabel *v31;
  void *v32;
  UILabel *v33;
  void *v34;
  void *v35;
  UILabel *v36;
  UIView *v37;
  double v38;
  void *v39;
  void *v40;
  UILabel *v41;
  UIView *v42;
  double v43;
  void *v44;
  void *v45;
  void *v46;
  double v47;
  void *v48;
  void *v49;
  UILabel *v50;
  UIView *v51;
  double v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  UIScrollView *v61;
  void *v62;
  UIScrollView *v63;
  void *v64;
  UIScrollView *v65;
  void *v66;
  UIScrollView *v67;
  void *v68;
  UIScrollView *v69;
  void *v70;
  void *v71;
  void *v72;
  UIView *v73;
  void *v74;
  void *v75;
  void *v76;
  UIView *v77;
  void *v78;
  void *v79;
  void *v80;
  UIView *v81;
  void *v82;
  void *v83;
  void *v84;
  UIView *v85;
  void *v86;
  void *v87;
  void *v88;
  id v89;

  +[VTUIStyle sharedStyle](VTUIStyle, "sharedStyle");
  v89 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (UIScrollView *)objc_alloc_init(MEMORY[0x24BEBD918]);
  scrollView = self->_scrollView;
  self->_scrollView = v3;

  -[UIScrollView setTranslatesAutoresizingMaskIntoConstraints:](self->_scrollView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIScrollView setAutoresizesSubviews:](self->_scrollView, "setAutoresizesSubviews:", 0);
  -[UIScrollView setScrollEnabled:](self->_scrollView, "setScrollEnabled:", 0);
  -[UIScrollView setClipsToBounds:](self->_scrollView, "setClipsToBounds:", 0);
  -[VTUIPagedLabel addSubview:](self, "addSubview:", self->_scrollView);
  v5 = objc_alloc(MEMORY[0x24BEBDB00]);
  -[UIScrollView bounds](self->_scrollView, "bounds");
  v6 = (UIView *)objc_msgSend(v5, "initWithFrame:");
  instructionContainerLeft = self->_instructionContainerLeft;
  self->_instructionContainerLeft = v6;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_instructionContainerLeft, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView setAutoresizesSubviews:](self->_instructionContainerLeft, "setAutoresizesSubviews:", 0);
  -[UIScrollView addSubview:](self->_scrollView, "addSubview:", self->_instructionContainerLeft);
  v8 = objc_alloc(MEMORY[0x24BEBDB00]);
  -[UIScrollView bounds](self->_scrollView, "bounds");
  v9 = (UIView *)objc_msgSend(v8, "initWithFrame:");
  instructionContainerRight = self->_instructionContainerRight;
  self->_instructionContainerRight = v9;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_instructionContainerRight, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView setAutoresizesSubviews:](self->_instructionContainerRight, "setAutoresizesSubviews:", 0);
  -[UIScrollView addSubview:](self->_scrollView, "addSubview:", self->_instructionContainerRight);
  v11 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
  instructionLabelLeft = self->_instructionLabelLeft;
  self->_instructionLabelLeft = v11;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_instructionLabelLeft, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setNumberOfLines:](self->_instructionLabelLeft, "setNumberOfLines:", 0);
  -[UILabel setLineBreakMode:](self->_instructionLabelLeft, "setLineBreakMode:", 0);
  v13 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
  instructionLabelRight = self->_instructionLabelRight;
  self->_instructionLabelRight = v13;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_instructionLabelRight, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setNumberOfLines:](self->_instructionLabelRight, "setNumberOfLines:", 0);
  -[UILabel setLineBreakMode:](self->_instructionLabelRight, "setLineBreakMode:", 0);
  if (self->_hasIntelligentLight)
  {
    v15 = self->_instructionLabelLeft;
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemWhiteColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v15, "setTextColor:", v16);

    v17 = self->_instructionLabelRight;
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemWhiteColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v17, "setTextColor:", v18);

  }
  if (self->_isProximity)
  {
    v19 = self->_instructionLabelLeft;
    if (self->_enrollmentStyle == 1)
    {
      objc_msgSend(v89, "PRXheaderFont");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setFont:](v19, "setFont:", v20);

      v21 = self->_instructionLabelLeft;
      objc_msgSend(v89, "PRXheaderColor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](v21, "setTextColor:", v22);

      v23 = self->_instructionLabelRight;
      objc_msgSend(v89, "PRXheaderFont");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setFont:](v23, "setFont:", v24);

      v25 = self->_instructionLabelRight;
      objc_msgSend(v89, "PRXheaderColor");
    }
    else
    {
      objc_msgSend(v89, "proxInstructionFont");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setFont:](v19, "setFont:", v30);

      v31 = self->_instructionLabelLeft;
      objc_msgSend(v89, "proxInstructionColor");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](v31, "setTextColor:", v32);

      v33 = self->_instructionLabelRight;
      objc_msgSend(v89, "proxInstructionFont");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setFont:](v33, "setFont:", v34);

      v25 = self->_instructionLabelRight;
      objc_msgSend(v89, "proxInstructionColor");
    }
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v25, "setTextColor:", v29);
  }
  else
  {
    v26 = self->_instructionLabelLeft;
    objc_msgSend(v89, "instructionLabelFont");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v26, "setFont:", v27);

    v28 = self->_instructionLabelRight;
    objc_msgSend(v89, "instructionLabelFont");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v28, "setFont:", v29);
  }

  -[UIView addSubview:](self->_instructionContainerLeft, "addSubview:", self->_instructionLabelLeft);
  -[UIView addSubview:](self->_instructionContainerRight, "addSubview:", self->_instructionLabelRight);
  v35 = (void *)MEMORY[0x24BDD1628];
  v36 = self->_instructionLabelLeft;
  v37 = self->_instructionContainerLeft;
  if (self->_isProximity)
  {
    objc_msgSend(v89, "proxPaddingFromTop");
    objc_msgSend(v35, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v36, 3, 0, v37, 3, 1.0, v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[VTUIPagedLabel addConstraint:](self, "addConstraint:", v39);

    v40 = (void *)MEMORY[0x24BDD1628];
    v41 = self->_instructionLabelRight;
    v42 = self->_instructionContainerRight;
    objc_msgSend(v89, "proxPaddingFromTop");
    objc_msgSend(v40, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v41, 3, 0, v42, 3, 1.0, v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[VTUIPagedLabel addConstraint:](self, "addConstraint:", v44);

    objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_scrollView, 7, 0, self, 7, 1.0, 0.0);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[VTUIPagedLabel addConstraint:](self, "addConstraint:", v45);

    objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_scrollView, 9, 0, self, 9, 1.0, 0.0);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[VTUIPagedLabel addConstraint:](self, "addConstraint:", v46);
  }
  else
  {
    objc_msgSend(v89, "titleBaselineOffsetFromTop");
    objc_msgSend(v35, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v36, 12, 0, v37, 3, 1.0, v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[VTUIPagedLabel addConstraint:](self, "addConstraint:", v48);

    v49 = (void *)MEMORY[0x24BDD1628];
    v50 = self->_instructionLabelRight;
    v51 = self->_instructionContainerRight;
    objc_msgSend(v89, "titleBaselineOffsetFromTop");
    objc_msgSend(v49, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v50, 12, 0, v51, 3, 1.0, v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[VTUIPagedLabel addConstraint:](self, "addConstraint:", v53);

    v54 = (void *)MEMORY[0x24BDD1628];
    _NSDictionaryOfVariableBindings(CFSTR("_scrollView"), self->_scrollView, 0);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-[_scrollView]-|"), 0, 0, v46);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[VTUIPagedLabel addConstraints:](self, "addConstraints:", v55);

  }
  v56 = (void *)MEMORY[0x24BDD1628];
  _NSDictionaryOfVariableBindings(CFSTR("_scrollView"), self->_scrollView, 0);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[_scrollView]|"), 0, 0, v57);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIPagedLabel addConstraints:](self, "addConstraints:", v58);

  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_instructionContainerLeft, 7, 0, self->_scrollView, 7, 1.0, 0.0);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIPagedLabel addConstraint:](self, "addConstraint:", v59);

  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_instructionContainerRight, 7, 0, self->_scrollView, 7, 1.0, 0.0);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIPagedLabel addConstraint:](self, "addConstraint:", v60);

  v61 = self->_scrollView;
  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_instructionContainerLeft, 8, 0, v61, 8, 1.0, 0.0);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIScrollView addConstraint:](v61, "addConstraint:", v62);

  v63 = self->_scrollView;
  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_instructionContainerRight, 8, 0, v63, 8, 1.0, 0.0);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIScrollView addConstraint:](v63, "addConstraint:", v64);

  v65 = self->_scrollView;
  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_instructionContainerLeft, 3, 0, v65, 3, 1.0, 0.0);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIScrollView addConstraint:](v65, "addConstraint:", v66);

  v67 = self->_scrollView;
  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_instructionContainerRight, 3, 0, v67, 3, 1.0, 0.0);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIScrollView addConstraint:](v67, "addConstraint:", v68);

  v69 = self->_scrollView;
  v70 = (void *)MEMORY[0x24BDD1628];
  _NSDictionaryOfVariableBindings(CFSTR("_instructionContainerLeft, _instructionContainerRight"), self->_instructionContainerLeft, self->_instructionContainerRight, 0);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[_instructionContainerLeft][_instructionContainerRight]|"), 0, 0, v71);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIScrollView addConstraints:](v69, "addConstraints:", v72);

  v73 = self->_instructionContainerLeft;
  v74 = (void *)MEMORY[0x24BDD1628];
  _NSDictionaryOfVariableBindings(CFSTR("_instructionLabelLeft"), self->_instructionLabelLeft, 0);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[_instructionLabelLeft]|"), 0, 0, v75);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView addConstraints:](v73, "addConstraints:", v76);

  v77 = self->_instructionContainerLeft;
  v78 = (void *)MEMORY[0x24BDD1628];
  _NSDictionaryOfVariableBindings(CFSTR("_instructionLabelLeft"), self->_instructionLabelLeft, 0);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-(>=0)-[_instructionLabelLeft]-(>=0)-|"), 0, 0, v79);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView addConstraints:](v77, "addConstraints:", v80);

  v81 = self->_instructionContainerRight;
  v82 = (void *)MEMORY[0x24BDD1628];
  _NSDictionaryOfVariableBindings(CFSTR("_instructionLabelRight"), self->_instructionLabelRight, 0);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[_instructionLabelRight]|"), 0, 0, v83);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView addConstraints:](v81, "addConstraints:", v84);

  v85 = self->_instructionContainerRight;
  v86 = (void *)MEMORY[0x24BDD1628];
  _NSDictionaryOfVariableBindings(CFSTR("_instructionLabelRight"), self->_instructionLabelRight, 0);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-(>=0)-[_instructionLabelRight]-(>=0)-|"), 0, 0, v87);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView addConstraints:](v85, "addConstraints:", v88);

}

- (void)slideInText:(id)a3 afterDelay:(double)a4 completion:(id)a5
{
  id v8;
  id v9;
  int v10;
  double v11;
  double v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  id v25;
  _QWORD v26[5];
  id v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD v31[7];
  uint64_t v32;
  _QWORD v33[3];

  v33[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  v10 = -[VTUIPagedLabel _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  if (v10)
  {
    -[UIView frame](self->_instructionContainerLeft, "frame");
  }
  else
  {
    v11 = *MEMORY[0x24BDBEFB0];
    v12 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  }
  -[UIScrollView setContentOffset:](self->_scrollView, "setContentOffset:", v11, v12);
  -[UIScrollView setHidden:](self->_scrollView, "setHidden:", 0);
  -[UIView setAlpha:](self->_instructionContainerRight, "setAlpha:", 0.0);
  +[VTUIStyle sharedStyle](VTUIStyle, "sharedStyle");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_alloc_init(MEMORY[0x24BEBB490]);
  objc_msgSend(v14, "setAlignment:", 1);
  objc_msgSend(v13, "headerTitleLinespacing");
  objc_msgSend(v14, "setLineSpacing:");
  v32 = *MEMORY[0x24BEBB3A8];
  v33[0] = v14;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v33, &v32, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:attributes:", v8, v15);
  else
    v16 = 0;
  -[UILabel setAttributedText:](self->_instructionLabelRight, "setAttributedText:", v16);
  -[UILabel setAlpha:](self->_instructionLabelLeft, "setAlpha:", 1.0);
  -[UIScrollView setNeedsLayout](self->_scrollView, "setNeedsLayout");
  -[UIScrollView layoutIfNeeded](self->_scrollView, "layoutIfNeeded");
  if (v10)
  {
    v17 = *MEMORY[0x24BDBEFB0];
    v18 = *(_QWORD *)(MEMORY[0x24BDBEFB0] + 8);
    -[UIView frame](self->_instructionContainerLeft, "frame");
  }
  else
  {
    -[UIView frame](self->_instructionContainerRight, "frame");
    v17 = v21;
    v18 = v22;
    v19 = *MEMORY[0x24BDBEFB0];
    v20 = *(_QWORD *)(MEMORY[0x24BDBEFB0] + 8);
  }
  v23 = (void *)MEMORY[0x24BEBDB00];
  v31[0] = MEMORY[0x24BDAC760];
  v31[1] = 3221225472;
  v31[2] = __52__VTUIPagedLabel_slideInText_afterDelay_completion___block_invoke;
  v31[3] = &unk_24F33E098;
  v31[4] = self;
  v31[5] = v17;
  v31[6] = v18;
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __52__VTUIPagedLabel_slideInText_afterDelay_completion___block_invoke_2;
  v26[3] = &unk_24F33E0C0;
  v26[4] = self;
  v27 = v16;
  v29 = v19;
  v30 = v20;
  v28 = v9;
  v24 = v9;
  v25 = v16;
  objc_msgSend(v23, "animateWithDuration:delay:options:animations:completion:", 0, v31, v26, 0.3, a4);

}

uint64_t __52__VTUIPagedLabel_slideInText_afterDelay_completion___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "setContentOffset:", *(double *)(a1 + 40), *(double *)(a1 + 48));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "setAlpha:", 0.0);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "setAlpha:", 1.0);
}

uint64_t __52__VTUIPagedLabel_slideInText_afterDelay_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "setAttributedText:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "setAlpha:", 1.0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "setAlpha:", 0.0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "setContentOffset:", *(double *)(a1 + 56), *(double *)(a1 + 64));
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)setText:(id)a3
{
  -[UILabel setText:](self->_instructionLabelLeft, "setText:", a3);
}

- (void)clear
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;

  if (-[VTUIPagedLabel _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))
  {
    -[UIView frame](self->_instructionContainerLeft, "frame");
    v4 = v3;
    v6 = v5;
  }
  else
  {
    v4 = *MEMORY[0x24BDBEFB0];
    v6 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  }
  -[UIScrollView setHidden:](self->_scrollView, "setHidden:", 1);
  -[UIScrollView layer](self->_scrollView, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeAllAnimations");

  -[UIScrollView setContentOffset:](self->_scrollView, "setContentOffset:", v4, v6);
  -[UIView setAlpha:](self->_instructionContainerLeft, "setAlpha:", 1.0);
  -[UIView setAlpha:](self->_instructionContainerRight, "setAlpha:", 0.0);
  -[UILabel setAttributedText:](self->_instructionLabelLeft, "setAttributedText:", 0);
  -[UILabel setAttributedText:](self->_instructionLabelRight, "setAttributedText:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instructionLabelRight, 0);
  objc_storeStrong((id *)&self->_instructionLabelLeft, 0);
  objc_storeStrong((id *)&self->_instructionContainerRight, 0);
  objc_storeStrong((id *)&self->_instructionContainerLeft, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
}

@end
