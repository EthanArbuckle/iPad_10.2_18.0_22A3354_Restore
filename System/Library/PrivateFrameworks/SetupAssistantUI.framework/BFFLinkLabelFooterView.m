@implementation BFFLinkLabelFooterView

+ (void)initialize
{
  _BOOL4 v2;
  double v3;
  double v4;
  double v5;

  v2 = BFFIsiPad();
  v3 = 1.0;
  if (v2)
    v3 = 11.0;
  v4 = 12.0;
  if (v2)
    v4 = 17.0;
  MinimumVerticalMarginBeforeTopLink = *(_QWORD *)&v3;
  MinimumVerticalMarginBeforeSoloLink = *(_QWORD *)&v3;
  if (v2)
    v5 = 0.0;
  else
    v5 = 10.0;
  MinimumVerticalMarginAfterTopLink = *(_QWORD *)&v4;
  MinimumHorizontalMargin = *(_QWORD *)&v5;
  MinimumVerticalMarginAfterLabel = 0x4018000000000000;
  MinimumVerticalMarginAfterBottomLink = 0x4018000000000000;
}

- (BFFLinkLabelFooterView)initWithFrame:(CGRect)a3
{
  BFFLinkLabelFooterView *v3;
  _BOOL4 v4;
  id *v5;
  objc_class *v6;
  id v7;
  UILabel *v8;
  UILabel *label;
  UILabel *v10;
  void *v11;
  void *v12;
  UILabel *v13;
  UILabel *subtitleLabel;
  UILabel *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSMutableArray *linkHandlers;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)BFFLinkLabelFooterView;
  v3 = -[BFFLinkLabelFooterView initWithFrame:](&v21, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = BFFIsiPad();
    v5 = (id *)MEMORY[0x24BEBE250];
    if (!v4)
      v5 = (id *)MEMORY[0x24BEBE1D0];
    v6 = (objc_class *)MEMORY[0x24BEBD708];
    v7 = *v5;
    v8 = (UILabel *)objc_alloc_init(v6);
    label = v3->_label;
    v3->_label = v8;

    -[UILabel setNumberOfLines:](v3->_label, "setNumberOfLines:", 0);
    v10 = v3->_label;
    objc_msgSend(MEMORY[0x24BEBD5E0], "preferredFontForTextStyle:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v10, "setFont:", v11);

    +[BFFStyle sharedStyle](BFFStyle, "sharedStyle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "applyThemeToLabel:", v3->_label);

    -[UILabel setTextAlignment:](v3->_label, "setTextAlignment:", 1);
    v13 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    subtitleLabel = v3->_subtitleLabel;
    v3->_subtitleLabel = v13;

    -[UILabel setNumberOfLines:](v3->_subtitleLabel, "setNumberOfLines:", 0);
    v15 = v3->_subtitleLabel;
    objc_msgSend(MEMORY[0x24BEBD5E0], "preferredFontForTextStyle:", v7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    -[UILabel setFont:](v15, "setFont:", v16);
    +[BFFStyle sharedStyle](BFFStyle, "sharedStyle");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "applyThemeToLabel:", v3->_subtitleLabel);

    -[UILabel setTextAlignment:](v3->_subtitleLabel, "setTextAlignment:", 1);
    v18 = objc_opt_new();
    linkHandlers = v3->_linkHandlers;
    v3->_linkHandlers = (NSMutableArray *)v18;

  }
  return v3;
}

- (NSString)labelText
{
  return -[UILabel text](self->_label, "text");
}

- (void)setLabelText:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[BFFLinkLabelFooterView labelText](self, "labelText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v7, "isEqualToString:", v4);

  v6 = v7;
  if ((v5 & 1) == 0)
  {
    -[UILabel setText:](self->_label, "setText:", v7);
    -[UILabel removeFromSuperview](self->_label, "removeFromSuperview");
    if (objc_msgSend(v7, "length"))
      -[BFFLinkLabelFooterView addSubview:](self, "addSubview:", self->_label);
    -[BFFLinkLabelFooterView setNeedsLayout](self, "setNeedsLayout");
    v6 = v7;
  }

}

- (void)setAttributedSubtitleText:(id)a3
{
  id v5;

  v5 = a3;
  if ((objc_msgSend(v5, "isEqualToAttributedString:", self->_attributedSubtitleText) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_attributedSubtitleText, a3);
    -[UILabel setAttributedText:](self->_subtitleLabel, "setAttributedText:", v5);
    -[UILabel removeFromSuperview](self->_subtitleLabel, "removeFromSuperview");
    if (objc_msgSend(v5, "length"))
      -[BFFLinkLabelFooterView addSubview:](self, "addSubview:", self->_subtitleLabel);
    -[BFFLinkLabelFooterView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)addLinkWithTitle:(id)a3 textStyle:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v8 = a4;
  v9 = a5;
  if (-[BFFLinkLabelFooterView numberOfLinks](self, "numberOfLinks") <= 1)
  {
    v10 = (void *)objc_opt_new();
    objc_msgSend(v10, "setHandler:", v9);
    objc_msgSend(v10, "button");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTitle:forState:", v16, 0);

    objc_msgSend(v10, "button");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "titleLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD5E0], "preferredFontForTextStyle:", v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setFont:", v14);

    -[NSMutableArray addObject:](self->_linkHandlers, "addObject:", v10);
    if (objc_msgSend(v16, "length"))
    {
      objc_msgSend(v10, "button");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[BFFLinkLabelFooterView addSubview:](self, "addSubview:", v15);

    }
  }

}

- (void)addLinkWithTitle:(id)a3 handler:(id)a4
{
  id v6;
  _BOOL4 v7;
  _QWORD *v8;
  id v9;

  v6 = a4;
  v9 = a3;
  v7 = BFFIsiPad();
  v8 = (_QWORD *)MEMORY[0x24BEBE250];
  if (!v7)
    v8 = (_QWORD *)MEMORY[0x24BEBE1D0];
  -[BFFLinkLabelFooterView addLinkWithTitle:textStyle:handler:](self, "addLinkWithTitle:textStyle:handler:", v9, *v8, v6);

}

- (void)removeLinkAtIndex:(unint64_t)a3
{
  void *v5;
  id v6;

  -[NSMutableArray objectAtIndexedSubscript:](self->_linkHandlers, "objectAtIndexedSubscript:");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "button");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeFromSuperview");

  -[NSMutableArray removeObjectAtIndex:](self->_linkHandlers, "removeObjectAtIndex:", a3);
}

- (void)removeAllLinks
{
  NSMutableArray *i;

  for (i = self->_linkHandlers; -[NSMutableArray count](i, "count"); i = self->_linkHandlers)
    -[BFFLinkLabelFooterView removeLinkAtIndex:](self, "removeLinkAtIndex:", 0);
}

- (unint64_t)numberOfLinks
{
  return -[NSMutableArray count](self->_linkHandlers, "count");
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v3 = a3;
  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = self->_linkHandlers;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8), "button", (_QWORD)v10);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setEnabled:", v3);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (UIColor)topLineColor
{
  return -[UIView backgroundColor](self->_topLine, "backgroundColor");
}

- (void)setTopLineColor:(id)a3
{
  id v4;
  void *v5;
  UIView *topLine;
  id v7;
  UIView *v8;
  UIView *v9;
  id v10;

  v10 = a3;
  -[UIView backgroundColor](self->_topLine, "backgroundColor");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v10;
  if (v4 != v10)
  {
    -[UIView removeFromSuperview](self->_topLine, "removeFromSuperview");
    if (v10)
    {
      topLine = self->_topLine;
      if (!topLine)
      {
        v7 = objc_alloc(MEMORY[0x24BEBDB00]);
        v8 = (UIView *)objc_msgSend(v7, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
        v9 = self->_topLine;
        self->_topLine = v8;

        topLine = self->_topLine;
      }
      -[BFFLinkLabelFooterView addSubview:](self, "addSubview:", topLine);
    }
    -[UIView setBackgroundColor:](self->_topLine, "setBackgroundColor:", v10);
    -[BFFLinkLabelFooterView setNeedsLayout](self, "setNeedsLayout");
    v5 = v10;
  }

}

- (CGSize)sizeThatFits:(CGSize)a3 shouldSetSize:(BOOL)a4
{
  _BOOL8 v4;
  double width;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  void *v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  void *v70;
  uint64_t v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
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
  double v88;
  double v89;
  double v90;
  uint64_t v91;
  uint64_t v92;
  double v93;
  uint64_t v94;
  void *v95;
  void *v96;
  void *v97;
  double v98;
  double v99;
  void *v100;
  void *v101;
  double v102;
  double v103;
  double v104;
  double v105;
  double v106;
  double v107;
  double v108;
  double v109;
  double v110;
  void *v111;
  void *v112;
  double v113;
  double v114;
  _BOOL8 v115;
  void *v116;
  uint64_t v117;
  double MaxY;
  double v119;
  double v120;
  double v121;
  double v122;
  double v123;
  uint64_t v124;
  uint64_t *v125;
  double v126;
  double v127;
  uint64_t v128;
  void *v129;
  double v130;
  double v131;
  double v132;
  NSMutableArray *obj;
  double v134;
  uint64_t v135;
  double v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  _BYTE v141[128];
  uint64_t v142;
  CGSize result;
  CGRect v144;
  CGRect v145;

  v4 = a4;
  width = a3.width;
  v142 = *MEMORY[0x24BDAC8D0];
  -[BFFLinkLabelFooterView margins](self, "margins", a3.width, a3.height);
  v8 = v7;
  -[BFFLinkLabelFooterView margins](self, "margins");
  if (v8 >= *(double *)&MinimumHorizontalMargin)
    v10 = v8;
  else
    v10 = *(double *)&MinimumHorizontalMargin;
  if (v9 >= *(double *)&MinimumHorizontalMargin)
    v11 = v9;
  else
    v11 = *(double *)&MinimumHorizontalMargin;
  v136 = v10;
  v12 = width - v10 - v11;
  if (-[BFFLinkLabelFooterView wantsSideBySideLayout](self, "wantsSideBySideLayout")
    && -[BFFLinkLabelFooterView numberOfLinks](self, "numberOfLinks") == 2)
  {
    v13 = width;
    v14 = *MEMORY[0x24BDBF090];
    v15 = *(double *)(MEMORY[0x24BDBF090] + 8);
    -[NSMutableArray objectAtIndexedSubscript:](self->_linkHandlers, "objectAtIndexedSubscript:", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray objectAtIndexedSubscript:](self->_linkHandlers, "objectAtIndexedSubscript:", 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "button");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "titleLabel");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "textRectForBounds:limitedToNumberOfLines:", 0, v14, v15, v12, 1.79769313e308);
    v21 = v20;

    objc_msgSend(v17, "button");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "titleLabel");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "textRectForBounds:limitedToNumberOfLines:", 0, v14, v15, v12, 1.79769313e308);
    v25 = v24;

    if (v21 > 0.0 && v25 > 0.0 && v21 + v25 + *(double *)&MinimumHorizontalMargin < v12)
    {
      v26 = *(double *)&MinimumVerticalMarginBeforeSoloLink;
      -[BFFLinkLabelFooterView margins](self, "margins");
      v28 = BFFRoundRectToPixel(v136, v26 + v27);
      v32 = v31;
      if (v4)
      {
        v33 = v28;
        v34 = v29;
        v35 = v30;
        objc_msgSend(v16, "button");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "setFrame:", v33, v34, v35, v32);

      }
      width = v13;
      v37 = *(double *)&MinimumVerticalMarginBeforeSoloLink;
      -[BFFLinkLabelFooterView margins](self, "margins");
      v39 = BFFRoundRectToPixel(v13 - v11 - v25, v37 + v38);
      if (v4)
      {
        v43 = v39;
        v44 = v40;
        v45 = v41;
        v46 = v42;
        objc_msgSend(v17, "button");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "setFrame:", v43, v44, v45, v46);

      }
      v48 = v32 + *(double *)&MinimumVerticalMarginAfterBottomLink;
      -[BFFLinkLabelFooterView margins](self, "margins");
      v50 = v48 + v49;
      -[BFFLinkLabelFooterView margins](self, "margins");
      v52 = v50 + v51 + 0.0;

      goto LABEL_61;
    }

  }
  -[UILabel text](self->_label, "text");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = objc_msgSend(v53, "length");

  if (v54)
  {
    -[UILabel text](self->_label, "text");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel font](self->_label, "font");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "_legacy_sizeWithFont:constrainedToSize:lineBreakMode:", v56, -[UILabel lineBreakMode](self->_label, "lineBreakMode"), v12, 1.79769313e308);

    v57 = *(double *)&MinimumVerticalMarginAfterLabel;
    -[BFFLinkLabelFooterView margins](self, "margins");
    v59 = BFFRoundRectToPixel(v136, v57 + v58);
    v61 = v60;
    v63 = v62;
    if (v4)
      -[UILabel setFrame:](self->_label, "setFrame:", v59, v60);
    v64 = v61 + v63 + *(double *)&MinimumVerticalMarginAfterLabel;
    -[BFFLinkLabelFooterView flexibleHeight](self, "flexibleHeight");
    v66 = v64 + v65;
    -[BFFLinkLabelFooterView margins](self, "margins");
    v68 = v66 + v67;
    -[BFFLinkLabelFooterView margins](self, "margins");
    v52 = v68 + v69;
  }
  else
  {
    v52 = 0.0;
  }
  -[UILabel attributedText](self->_subtitleLabel, "attributedText");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = objc_msgSend(v70, "length");

  if (v71)
  {
    -[UILabel sizeThatFits:](self->_subtitleLabel, "sizeThatFits:", v12, 1.79769313e308);
    v73 = v72;
    v74 = v136 + (v12 - v72) * 0.5;
    if (v73 >= v12)
      v75 = v136;
    else
      v75 = v74;
    v76 = *(double *)&MinimumVerticalMarginAfterLabel;
    -[BFFLinkLabelFooterView margins](self, "margins");
    v78 = v76 + v77;
    -[UILabel _lastLineBaseline](self->_label, "_lastLineBaseline");
    v80 = BFFRoundRectToPixel(v75, v78 + v79);
    v82 = v81;
    v84 = v83;
    if (v4)
      -[UILabel setFrame:](self->_subtitleLabel, "setFrame:", v80, v81);
    v85 = v82 + v84 + *(double *)&MinimumVerticalMarginAfterLabel;
    -[BFFLinkLabelFooterView flexibleHeight](self, "flexibleHeight");
    v87 = v85 + v86;
    -[BFFLinkLabelFooterView margins](self, "margins");
    v89 = v87 + v88;
    -[BFFLinkLabelFooterView margins](self, "margins");
    v52 = v89 + v90;
  }
  if (-[NSMutableArray count](self->_linkHandlers, "count"))
  {
    v132 = width;
    v139 = 0u;
    v140 = 0u;
    v137 = 0u;
    v138 = 0u;
    obj = self->_linkHandlers;
    v91 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v137, v141, 16);
    if (!v91)
      goto LABEL_60;
    v92 = v91;
    v135 = *(_QWORD *)v138;
    v93 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v134 = *MEMORY[0x24BDBF090];
    while (1)
    {
      v94 = 0;
      do
      {
        if (*(_QWORD *)v138 != v135)
          objc_enumerationMutation(obj);
        v95 = *(void **)(*((_QWORD *)&v137 + 1) + 8 * v94);
        objc_msgSend(v95, "button");
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v96, "titleLabel");
        v97 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v97, "textRectForBounds:limitedToNumberOfLines:", 0, v134, v93, v12, 1.79769313e308);
        if (v98 >= v12)
          v99 = v136;
        else
          v99 = v136 + (v12 - v98) * 0.5;
        -[NSMutableArray firstObject](self->_linkHandlers, "firstObject");
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        if (v95 != v100)
        {

LABEL_43:
          v102 = v52;
          goto LABEL_44;
        }
        -[UILabel text](self->_label, "text");
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v101, "length"))
        {

          goto LABEL_43;
        }
        -[UILabel attributedText](self->_subtitleLabel, "attributedText");
        v115 = v4;
        v116 = (void *)objc_claimAutoreleasedReturnValue();
        v117 = objc_msgSend(v116, "length");

        v4 = v115;
        v102 = v52;
        if (!v117)
        {
          if (-[BFFLinkLabelFooterView wantsFromBottomLayout](self, "wantsFromBottomLayout"))
          {
            -[BFFLinkLabelFooterView bounds](self, "bounds");
            MaxY = CGRectGetMaxY(v145);
            -[BFFLinkLabelFooterView margins](self, "margins");
            v120 = MaxY - v119;
            objc_msgSend(v97, "_lastLineBaseline");
            v122 = v120 - v121;
            objc_msgSend(v97, "bounds");
            v102 = v122 - v123;
          }
          else
          {
            v124 = -[NSMutableArray count](self->_linkHandlers, "count");
            v125 = &MinimumVerticalMarginBeforeSoloLink;
            if (v124 != 1)
              v125 = &MinimumVerticalMarginBeforeTopLink;
            v126 = *(double *)v125;
            -[BFFLinkLabelFooterView margins](self, "margins");
            v102 = v126 + v127;
          }
        }
LABEL_44:
        v103 = BFFRoundRectToPixel(v99, v102);
        v106 = v105;
        v108 = v107;
        if (v4)
        {
          v109 = v103;
          v110 = v104;
          objc_msgSend(v95, "button");
          v111 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v111, "setFrame:", v109, v106, v110, v108);

        }
        -[NSMutableArray firstObject](self->_linkHandlers, "firstObject", v103);
        v112 = (void *)objc_claimAutoreleasedReturnValue();

        if (v95 == v112)
        {
          if (-[BFFLinkLabelFooterView wantsFromBottomLayout](self, "wantsFromBottomLayout"))
          {
            -[BFFLinkLabelFooterView bounds](self, "bounds");
            v52 = CGRectGetMaxY(v144) - v106;
          }
          else
          {
            v113 = v106 + v108 + *(double *)&MinimumVerticalMarginAfterTopLink;
            -[BFFLinkLabelFooterView flexibleHeight](self, "flexibleHeight");
            v52 = v113 + v114;
          }
        }
        else
        {
          v52 = v52 + v108 + *(double *)&MinimumVerticalMarginAfterBottomLink;
        }

        ++v94;
      }
      while (v92 != v94);
      v128 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v137, v141, 16);
      v92 = v128;
      if (!v128)
      {
LABEL_60:

        width = v132;
        break;
      }
    }
  }
LABEL_61:
  if (v4)
  {
    -[BFFLinkLabelFooterView topLineColor](self, "topLineColor");
    v129 = (void *)objc_claimAutoreleasedReturnValue();

    if (v129)
    {
      UICeilToViewScale();
      -[BFFLinkLabelFooterView bounds](self, "bounds");
      -[UIView setFrame:](self->_topLine, "setFrame:", 0.0, 0.0);
    }
  }
  v130 = width;
  v131 = v52;
  result.height = v131;
  result.width = v130;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[BFFLinkLabelFooterView sizeThatFits:shouldSetSize:](self, "sizeThatFits:shouldSetSize:", 0, a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BFFLinkLabelFooterView;
  -[BFFLinkLabelFooterView layoutSubviews](&v5, sel_layoutSubviews);
  -[BFFLinkLabelFooterView bounds](self, "bounds");
  -[BFFLinkLabelFooterView sizeThatFits:shouldSetSize:](self, "sizeThatFits:shouldSetSize:", 1, v3, v4);
}

- (double)flexibleHeight
{
  return self->_flexibleHeight;
}

- (void)setFlexibleHeight:(double)a3
{
  self->_flexibleHeight = a3;
}

- (UIEdgeInsets)margins
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_margins.top;
  left = self->_margins.left;
  bottom = self->_margins.bottom;
  right = self->_margins.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setMargins:(UIEdgeInsets)a3
{
  self->_margins = a3;
}

- (NSAttributedString)attributedSubtitleText
{
  return self->_attributedSubtitleText;
}

- (BOOL)wantsSideBySideLayout
{
  return self->_wantsSideBySideLayout;
}

- (void)setWantsSideBySideLayout:(BOOL)a3
{
  self->_wantsSideBySideLayout = a3;
}

- (BOOL)wantsFromBottomLayout
{
  return self->_wantsFromBottomLayout;
}

- (void)setWantsFromBottomLayout:(BOOL)a3
{
  self->_wantsFromBottomLayout = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributedSubtitleText, 0);
  objc_storeStrong((id *)&self->_topLine, 0);
  objc_storeStrong((id *)&self->_linkHandlers, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end
