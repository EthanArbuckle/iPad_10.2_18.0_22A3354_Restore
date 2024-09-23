@implementation PXAnimatedCounter

- (void)commonInit
{
  UIFont *v3;
  UIFont *font;
  UILabel *v5;
  UILabel *backingLabel;
  UILabel *v7;
  void *v8;
  UILabel *v9;
  void *v10;
  NSMutableArray *v11;
  NSMutableArray *digitLabels;
  NSMutableArray *v13;
  void *v14;

  self->_number = 0;
  self->_previousSize = (CGSize)*MEMORY[0x1E0C9D820];
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
  v3 = (UIFont *)objc_claimAutoreleasedReturnValue();
  font = self->_font;
  self->_font = v3;

  v5 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
  backingLabel = self->_backingLabel;
  self->_backingLabel = v5;

  v7 = self->_backingLabel;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](v7, "setText:", v8);

  -[UILabel setTextAlignment:](self->_backingLabel, "setTextAlignment:", 2);
  -[UILabel setFont:](self->_backingLabel, "setFont:", self->_font);
  v9 = self->_backingLabel;
  objc_msgSend(MEMORY[0x1E0DC3658], "magentaColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v9, "setTextColor:", v10);

  v11 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 5);
  digitLabels = self->_digitLabels;
  self->_digitLabels = v11;

  v13 = self->_digitLabels;
  -[PXAnimatedCounter _labelForDigit:](self, "_labelForDigit:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](v13, "addObject:", v14);

  -[PXAnimatedCounter _calculateLargestDigitSize](self, "_calculateLargestDigitSize");
}

- (PXAnimatedCounter)initWithNumber:(unint64_t)a3
{
  PXAnimatedCounter *v4;
  PXAnimatedCounter *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PXAnimatedCounter;
  v4 = -[PXAnimatedCounter init](&v7, sel_init);
  v5 = v4;
  if (v4)
    -[PXAnimatedCounter _setCounterToNumber:](v4, "_setCounterToNumber:", a3);
  return v5;
}

- (PXAnimatedCounter)initWithFrame:(CGRect)a3
{
  PXAnimatedCounter *v3;
  PXAnimatedCounter *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXAnimatedCounter;
  v3 = -[PXAnimatedCounter initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[PXAnimatedCounter commonInit](v3, "commonInit");
  return v4;
}

- (PXAnimatedCounter)initWithCoder:(id)a3
{
  PXAnimatedCounter *v3;
  PXAnimatedCounter *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXAnimatedCounter;
  v3 = -[PXAnimatedCounter initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[PXAnimatedCounter commonInit](v3, "commonInit");
  return v4;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXAnimatedCounter;
  -[PXAnimatedCounter layoutSubviews](&v3, sel_layoutSubviews);
  -[PXAnimatedCounter _updateSizeIfNeeded](self, "_updateSizeIfNeeded");
}

- (void)setFrame:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXAnimatedCounter;
  -[PXAnimatedCounter setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[PXAnimatedCounter _updateSizeIfNeeded](self, "_updateSizeIfNeeded");
}

- (void)setNumber:(unint64_t)a3
{
  -[PXAnimatedCounter setNumber:animated:](self, "setNumber:animated:", a3, 0);
}

- (void)setNumber:(unint64_t)a3 animated:(BOOL)a4
{
  -[PXAnimatedCounter setNumber:animated:completionBlock:](self, "setNumber:animated:completionBlock:", a3, a4, 0);
}

- (void)setNumber:(unint64_t)a3 animated:(BOOL)a4 completionBlock:(id)a5
{
  _BOOL4 v5;
  int64_t v8;
  id v9;

  v5 = a4;
  v9 = a5;
  if (v5)
    v8 = -[PXAnimatedCounter preferredAnimationStyleForNumber:](self, "preferredAnimationStyleForNumber:", a3);
  else
    v8 = 0;
  -[PXAnimatedCounter setNumber:withAnimationStyle:completionBlock:](self, "setNumber:withAnimationStyle:completionBlock:", a3, v8, v9);

}

- (void)setNumber:(unint64_t)a3 withAnimationStyle:(int64_t)a4 completionBlock:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  double v11;
  unint64_t v12;
  double v13;
  unint64_t v14;
  unint64_t v15;
  void *v16;
  unint64_t v17;
  void *v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  void *v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  double v42;
  CGFloat v43;
  double v44;
  CGFloat v45;
  double v46;
  CGFloat v47;
  double v48;
  CGFloat v49;
  double v50;
  double v51;
  double v52;
  CGFloat v53;
  double v54;
  CGFloat v55;
  CGFloat MinY;
  double Height;
  double v58;
  double v59;
  void *v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double Width;
  double v68;
  CGFloat v69;
  PXLabelAnimationContext *v70;
  PXAnimatedCounter *v71;
  __objc2_class **v72;
  uint64_t v73;
  unint64_t v74;
  unint64_t v75;
  PXAnimatedCounter *v76;
  void *v77;
  double v78;
  double v79;
  double v80;
  float v81;
  double v82;
  unint64_t v83;
  __objc2_class **v84;
  void *v85;
  void *v86;
  unint64_t v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  unint64_t v92;
  uint64_t v93;
  void *v94;
  void *v95;
  void *v96;
  double v97;
  void *v98;
  void *v99;
  unint64_t v100;
  unint64_t v101;
  CGFloat v102;
  CGFloat v103;
  CGFloat v104;
  CGFloat v105;
  unint64_t number;
  unint64_t v107;
  uint64_t v108;
  void *v109;
  void *v110;
  void *v111;
  int64_t v112;
  void *v113;
  PXAnimatedCounter *v114;
  void *v115;
  double MinX;
  void *v117;
  void *v118;
  unint64_t v119;
  double v120;
  double v121;
  double v122;
  double v123;
  uint64_t v124;
  double v125;
  double v126;
  CGFloat v127;
  CGFloat v128;
  double v129;
  double v130;
  _QWORD v131[5];
  id v132;
  id v133;
  id v134;
  _QWORD v135[4];
  id v136;
  CGRect v137;
  CGRect v138;
  CGRect v139;
  CGRect v140;
  CGRect v141;
  CGRect v142;
  CGRect v143;
  CGRect v144;
  CGRect v145;

  v8 = a5;
  v112 = a4;
  if (a4)
  {
    number = self->_number;
    -[PXAnimatedCounter _numberStringForNumber:](self, "_numberStringForNumber:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    self->_number = a3;
    -[PXAnimatedCounter _numberStringForNumber:](self, "_numberStringForNumber:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (double)(unint64_t)objc_msgSend(v9, "length");
    v12 = objc_msgSend(v10, "length");
    if ((double)v12 >= v11)
      v13 = 0.0;
    else
      v13 = v11 - (double)v12;
    v14 = objc_msgSend(v9, "length");
    v107 = a3;
    v99 = v8;
    v15 = 0;
    if (v14 < objc_msgSend(v10, "length"))
    {
      v16 = v9;
      do
      {
        objc_msgSend(CFSTR("0"), "stringByAppendingString:", v16);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        ++v15;
        v17 = objc_msgSend(v9, "length");
        v16 = v9;
      }
      while (v17 < objc_msgSend(v10, "length"));
    }
    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", v10, v10);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "length");
    if (v19 < objc_msgSend(v9, "length"))
    {
      do
      {
        objc_msgSend(v18, "insertString:atIndex:", CFSTR("0"), 0);
        v20 = objc_msgSend(v18, "length");
      }
      while (v20 < objc_msgSend(v9, "length"));
    }
    v21 = (unint64_t)v13;
    v22 = objc_msgSend(v18, "length");
    -[PXAnimatedCounter backingLabel](self, "backingLabel");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v110 = v18;
    objc_msgSend(v23, "setText:", v18);
    -[PXAnimatedCounter digitLabels](self, "digitLabels");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXAnimatedCounter bounds](self, "bounds");
    v104 = v25;
    v105 = v24;
    v102 = v27;
    v103 = v26;
    v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v24, v25, v26, v27);
    objc_msgSend(v28, "setText:", v9);
    objc_msgSend(v28, "setTextAlignment:", 2);
    -[PXAnimatedCounter font](self, "font");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setFont:", v29);

    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v109 = v28;
    objc_msgSend(v28, "setTextColor:", v30);

    v113 = v23;
    v114 = self;
    -[PXAnimatedCounter _xOffsetForBackingLabel:](self, "_xOffsetForBackingLabel:", v23);
    v121 = v31;
    v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v22);
    v111 = v9;
    v115 = v32;
    v108 = v22;
    if (v22)
    {
      v33 = 0;
      v34 = v112;
      if (v112 != 1)
        v34 = -1;
      v35 = -1;
      if (v112 != 1)
        v35 = 1;
      v122 = (double)v34;
      v100 = (unint64_t)v13;
      v101 = v15;
      v120 = (double)v35;
      do
      {
        v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 11);
        objc_msgSend(v110, "substringWithRange:", v33, 1);
        v118 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = objc_msgSend(v118, "integerValue");
        objc_msgSend(v9, "substringWithRange:", v33, 1);
        v117 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = objc_msgSend(v117, "integerValue");
        if (v33 < v15)
          v39 = -1;
        else
          v39 = v38;
        v40 = v37 - v39;
        if (v112 != 1)
          v40 = v39 - v37;
        if (v40 >= 0)
          v41 = v40;
        else
          v41 = v40 + 10;
        objc_msgSend(v109, "boundingRectForCharacterRange:", v33, 1);
        v43 = v42;
        v45 = v44;
        v47 = v46;
        v49 = v48;
        objc_msgSend(v113, "boundingRectForCharacterRange:", v33, 1);
        v127 = v51;
        v128 = v50;
        v53 = v52;
        v55 = v54;
        v137.origin.x = v43;
        v137.origin.y = v45;
        v137.size.width = v47;
        v137.size.height = v49;
        MinX = CGRectGetMinX(v137);
        v138.origin.x = v43;
        v138.origin.y = v45;
        v138.size.width = v47;
        v138.size.height = v49;
        MinY = CGRectGetMinY(v138);
        v139.origin.y = v104;
        v139.origin.x = v105;
        v139.size.height = v102;
        v139.size.width = v103;
        Height = CGRectGetHeight(v139);
        v58 = -0.0;
        if (v33 < v21)
          v58 = Height;
        v125 = MinY;
        v126 = (double)v41;
        v59 = v58 + Height * (double)v41;
        v119 = v33;
        if (v33 >= v15)
        {
          objc_msgSend(v98, "objectAtIndex:", v33 - v15);
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "frame");
          v129 = v63;
          v123 = v64;
          if (v59 == 0.0)
          {
            v97 = v62;
            objc_msgSend(v60, "bounds");
            Width = CGRectGetWidth(v140);
            v141.origin.x = v128;
            v141.origin.y = v127;
            v141.size.width = v53;
            v141.size.height = v55;
            v68 = (Width - CGRectGetWidth(v141)) * -0.5;
            v142.origin.x = v128;
            v142.origin.y = v127;
            v142.size.width = v53;
            v142.size.height = v55;
            v69 = CGRectGetMinX(v142);
            v62 = v97;
            v65 = v59;
            *(float *)&v69 = v121 + v69 + v68;
            v66 = roundf(*(float *)&v69);
          }
          else
          {
            v65 = v59;
            v66 = v61;
          }
          v70 = -[PXLabelAnimationContext initWithLabel:andDestinationRect:]([PXLabelAnimationContext alloc], "initWithLabel:andDestinationRect:", v60, v66, v62 + v65 * v122, v123, v129);
          objc_msgSend(v36, "addObject:", v70);

        }
        v71 = self;
        v72 = off_1E50B3000;
        if (v41)
        {
          v124 = v39 + 10;
          v73 = -1;
          v74 = 1;
          do
          {
            if (number >= v107)
              v75 = v73;
            else
              v75 = v74;
            v76 = v71;
            -[PXAnimatedCounter _labelForDigit:](v71, "_labelForDigit:", (uint64_t)(v124 + v75) % 10);
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v77, "sizeToFit");
            objc_msgSend(v77, "bounds");
            v78 = CGRectGetWidth(v143);
            v144.origin.x = v128;
            v144.origin.y = v127;
            v144.size.width = v53;
            v144.size.height = v55;
            v130 = (v78 - CGRectGetWidth(v144)) * -0.5;
            objc_msgSend(v77, "bounds");
            v80 = v79;
            v145.origin.x = v128;
            v145.origin.y = v127;
            v145.size.width = v53;
            v145.size.height = v55;
            v81 = v121 + MinX + (CGRectGetMinX(v145) - MinX) / v126 * (double)v74 + v130;
            v82 = roundf(v81);
            objc_msgSend(v77, "setFrame:", v82, v125 + Height * (double)v74 * v120, v80, Height);
            v83 = v41;
            v84 = v72;
            v85 = (void *)objc_msgSend(objc_alloc(v72[62]), "initWithLabel:andDestinationRect:", v77, v82, v125 + Height * (double)v74 * v120 + v59 * v122, v80, Height);
            objc_msgSend(v36, "addObject:", v85);

            v72 = v84;
            v41 = v83;

            v71 = v76;
            ++v74;
            --v73;
          }
          while (v74 <= v83);
        }
        v32 = v115;
        objc_msgSend(v115, "addObject:", v36);

        v33 = v119 + 1;
        v9 = v111;
        v21 = v100;
        v15 = v101;
      }
      while (v119 + 1 != v108);
    }
    objc_msgSend(v113, "setText:", v96);
    v86 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v108);
    if (objc_msgSend(v32, "count"))
    {
      v87 = 0;
      do
      {
        if (v87 >= v21)
        {
          objc_msgSend(v32, "objectAtIndex:", v87);
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v88, "lastObject");
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v89, "label");
          v90 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v86, "addObject:", v90);
        }
        ++v87;
      }
      while (v87 < objc_msgSend(v32, "count"));
    }
    objc_msgSend(v98, "removeAllObjects");
    v91 = v115;
    objc_msgSend(v98, "addObjectsFromArray:", v86);
    objc_msgSend(MEMORY[0x1E0CD28B0], "flush");
    if (objc_msgSend(v115, "count"))
    {
      v92 = 0;
      v93 = MEMORY[0x1E0C809B0];
      do
      {
        objc_msgSend(v91, "objectAtIndex:", v92);
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v94, "count"))
        {
          -[PXAnimatedCounter setAnimationsInProgress:](v114, "setAnimationsInProgress:", -[PXAnimatedCounter animationsInProgress](v114, "animationsInProgress") + 1);
          v95 = (void *)MEMORY[0x1E0DC3F10];
          v135[0] = v93;
          v135[1] = 3221225472;
          v135[2] = __66__PXAnimatedCounter_setNumber_withAnimationStyle_completionBlock___block_invoke;
          v135[3] = &unk_1E5149198;
          v136 = v94;
          v131[0] = v93;
          v131[1] = 3221225472;
          v131[2] = __66__PXAnimatedCounter_setNumber_withAnimationStyle_completionBlock___block_invoke_2;
          v131[3] = &unk_1E513E408;
          v131[4] = v114;
          v91 = v115;
          v132 = v136;
          v133 = v86;
          v134 = v99;
          objc_msgSend(v95, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0x10000, v135, v131, 0.660000026, (double)v92 * 0.1, 0.83, 0.0);

        }
        ++v92;
      }
      while (v92 < objc_msgSend(v91, "count"));
    }

    v8 = v99;
  }
  else
  {
    -[PXAnimatedCounter _setCounterToNumber:](self, "_setCounterToNumber:", a3);
    if (v8)
      (*((void (**)(id, uint64_t))v8 + 2))(v8, 1);
  }

}

- (int64_t)preferredAnimationStyleForNumber:(unint64_t)a3
{
  unint64_t number;
  BOOL v4;
  int64_t v5;

  number = self->_number;
  v4 = number >= a3;
  v5 = 2 * (number > a3);
  if (v4)
    return v5;
  else
    return 1;
}

- (CGSize)requiredSizeForNumber:(unint64_t)a3
{
  double v5;
  double v6;
  double v7;
  float v8;
  double v9;
  float v10;
  double v11;
  CGSize result;

  -[PXAnimatedCounter maxDigitSize](self, "maxDigitSize");
  v6 = v5;
  v8 = v7 * (double)-[PXAnimatedCounter _numDigitsForNumber:](self, "_numDigitsForNumber:", a3);
  v9 = ceilf(v8);
  v10 = v6;
  v11 = ceilf(v10);
  result.height = v11;
  result.width = v9;
  return result;
}

- (void)setFont:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_storeStrong((id *)&self->_font, a3);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[PXAnimatedCounter digitLabels](self, "digitLabels", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v10++), "setFont:", v5);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

  -[PXAnimatedCounter backingLabel](self, "backingLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFont:", v5);

  -[PXAnimatedCounter _calculateLargestDigitSize](self, "_calculateLargestDigitSize");
}

- (double)_xOffsetForBackingLabel:(id)a3
{
  id v4;
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

  v4 = a3;
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[PXAnimatedCounter bounds](self, "bounds");
  v14 = 0.0;
  if (v10 > v13)
  {
    v14 = v13 - v10;
    objc_msgSend(v4, "setFrame:", v6, v8, v10 + v13 - v10, v12);
  }

  return v14;
}

- (unint64_t)_numDigitsForNumber:(int64_t)a3
{
  void *v3;
  unint64_t v4;

  -[PXAnimatedCounter _numberStringForNumber:](self, "_numberStringForNumber:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  return v4;
}

- (id)_numberStringForNumber:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB37F0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringFromNumber:numberStyle:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_setCounterToNumber:(unint64_t)a3
{
  unint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  self->_number = a3;
  -[PXAnimatedCounter _numberStringForNumber:](self, "_numberStringForNumber:");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v11, "length");
  -[PXAnimatedCounter digitLabels](self, "digitLabels");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count") >= v4)
  {
    if (!v4)
      goto LABEL_7;
  }
  else
  {
    do
    {
      -[PXAnimatedCounter _labelForDigit:](self, "_labelForDigit:", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v6);

    }
    while (objc_msgSend(v5, "count") < v4);
  }
  v7 = 0;
  do
  {
    objc_msgSend(v11, "substringWithRange:", v7, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndex:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setText:", v8);

    ++v7;
  }
  while (v4 != v7);
LABEL_7:
  -[PXAnimatedCounter backingLabel](self, "backingLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setText:", v11);

  -[PXAnimatedCounter _updateFramesForShownDigits](self, "_updateFramesForShownDigits");
}

- (void)_calculateLargestDigitSize
{
  uint64_t v3;
  uint64_t v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  _QWORD v15[2];

  v3 = 0;
  v15[1] = *MEMORY[0x1E0C80C00];
  v4 = *MEMORY[0x1E0DC1138];
  v5 = 0.0;
  v6 = 0.0;
  do
  {
    -[PXAnimatedCounter _numberStringForNumber:](self, "_numberStringForNumber:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v4;
    -[PXAnimatedCounter font](self, "font");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sizeWithAttributes:", v9);
    v11 = v10;
    v13 = v12;

    if (v11 > v5)
    {
      v6 = v13;
      v5 = v11;
    }

    ++v3;
  }
  while (v3 != 10);
  -[PXAnimatedCounter setMaxDigitSize:](self, "setMaxDigitSize:", v5, v6);
}

- (void)_updateFramesForShownDigits
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGFloat v22;
  double v23;
  double v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double Width;
  double v30;
  double Height;
  float v32;
  double v33;
  CGFloat v34;
  id v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;

  -[PXAnimatedCounter digitLabels](self, "digitLabels");
  v35 = (id)objc_claimAutoreleasedReturnValue();
  -[PXAnimatedCounter bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[PXAnimatedCounter backingLabel](self, "backingLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXAnimatedCounter _xOffsetForBackingLabel:](self, "_xOffsetForBackingLabel:", v11);
  v13 = v12;
  v14 = objc_msgSend(v35, "count");
  if (v14)
  {
    v15 = v14;
    v16 = 0;
    v33 = v13;
    v34 = v10;
    do
    {
      objc_msgSend(v35, "objectAtIndex:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "boundingRectForCharacterRange:", v16, 1);
      v19 = v18;
      v21 = v20;
      v22 = v8;
      v23 = v6;
      v24 = v4;
      v26 = v25;
      v28 = v27;
      objc_msgSend(v17, "bounds");
      Width = CGRectGetWidth(v36);
      v37.origin.x = v19;
      v37.origin.y = v21;
      v37.size.width = v26;
      v4 = v24;
      v6 = v23;
      v8 = v22;
      v37.size.height = v28;
      v30 = (Width - CGRectGetWidth(v37)) * -0.5;
      v38.origin.x = v4;
      v38.origin.y = v6;
      v38.size.width = v22;
      v38.size.height = v34;
      Height = CGRectGetHeight(v38);
      v32 = v33 + v19 + v30;
      objc_msgSend(v17, "setFrame:", roundf(v32), v21, Width, Height);

      ++v16;
    }
    while (v15 != v16);
  }

}

- (void)_updateSizeIfNeeded
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v14;

  -[PXAnimatedCounter bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[PXAnimatedCounter previousSize](self, "previousSize");
  if (v8 != v12 || v10 != v11)
  {
    -[PXAnimatedCounter backingLabel](self, "backingLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setFrame:", v4, v6, v8, v10);

    -[PXAnimatedCounter _updateFramesForShownDigits](self, "_updateFramesForShownDigits");
    -[PXAnimatedCounter setPreviousSize:](self, "setPreviousSize:", v8, v10);
  }
}

- (id)_labelForDigit:(unint64_t)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  -[PXAnimatedCounter _numberStringForNumber:](self, "_numberStringForNumber:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x1E0DC3990]);
  objc_msgSend(v5, "setText:", v4);
  -[PXAnimatedCounter font](self, "font");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v5, "setFont:", v6);
  objc_msgSend(v5, "sizeToFit");
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTextColor:", v7);

  -[PXAnimatedCounter addSubview:](self, "addSubview:", v5);
  return v5;
}

- (UIFont)font
{
  return self->_font;
}

- (unint64_t)number
{
  return self->_number;
}

- (NSMutableArray)digitLabels
{
  return (NSMutableArray *)objc_getProperty(self, a2, 432, 1);
}

- (UILabel)backingLabel
{
  return (UILabel *)objc_getProperty(self, a2, 440, 1);
}

- (CGSize)maxDigitSize
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGSize result;

  objc_copyStruct(v4, &self->_maxDigitSize, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setMaxDigitSize:(CGSize)a3
{
  CGSize v3;

  v3 = a3;
  objc_copyStruct(&self->_maxDigitSize, &v3, 16, 1, 0);
}

- (unint64_t)animationsInProgress
{
  return self->_animationsInProgress;
}

- (void)setAnimationsInProgress:(unint64_t)a3
{
  self->_animationsInProgress = a3;
}

- (CGSize)previousSize
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGSize result;

  objc_copyStruct(v4, &self->_previousSize, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setPreviousSize:(CGSize)a3
{
  CGSize v3;

  v3 = a3;
  objc_copyStruct(&self->_previousSize, &v3, 16, 1, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backingLabel, 0);
  objc_storeStrong((id *)&self->_digitLabels, 0);
  objc_storeStrong((id *)&self->_font, 0);
}

void __66__PXAnimatedCounter_setNumber_withAnimationStyle_completionBlock___block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v1 = *(id *)(a1 + 32);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v1);
        v6 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * i);
        objc_msgSend(v6, "label", (_QWORD)v8);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "destinationRect");
        objc_msgSend(v7, "setFrame:");

      }
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v3);
  }

}

void __66__PXAnimatedCounter_setNumber_withAnimationStyle_completionBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id v5;

  v2 = objc_msgSend(*(id *)(a1 + 32), "animationsInProgress");
  objc_msgSend(*(id *)(a1 + 40), "valueForKeyPath:", CFSTR("label"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v5, "removeObjectsInArray:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v5, "makeObjectsPerformSelector:", sel_removeFromSuperview);
  objc_msgSend(*(id *)(a1 + 32), "setAnimationsInProgress:", --v2);
  if (!v2)
  {
    v4 = *(_QWORD *)(a1 + 56);
    if (v4)
      (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, 1);
  }

}

@end
