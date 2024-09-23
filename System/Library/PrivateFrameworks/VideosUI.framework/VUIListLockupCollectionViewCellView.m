@implementation VUIListLockupCollectionViewCellView

- (VUIListLockupCollectionViewCellView)initWithFrame:(CGRect)a3
{
  VUIListLockupCollectionViewCellView *v3;
  VUISeparatorView *v4;
  uint64_t v5;
  VUISeparatorView *separatorView;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VUIListLockupCollectionViewCellView;
  v3 = -[VUIListLockupCollectionViewCellView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [VUISeparatorView alloc];
    v5 = -[VUISeparatorView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    separatorView = v3->_separatorView;
    v3->_separatorView = (VUISeparatorView *)v5;

    -[VUIListLockupCollectionViewCellView addSubview:](v3, "addSubview:", v3->_separatorView);
  }
  return v3;
}

- (void)setTitleLabel:(id)a3
{
  VUILabel *v5;
  VUILabel *v6;

  v5 = (VUILabel *)a3;
  if (self->_titleLabel != v5)
  {
    v6 = v5;
    -[VUIListLockupCollectionViewCellView vui_addSubview:oldView:](self, "vui_addSubview:oldView:", v5);
    objc_storeStrong((id *)&self->_titleLabel, a3);
    -[VUIListLockupCollectionViewCellView vui_setNeedsLayout](self, "vui_setNeedsLayout");
    v5 = v6;
  }

}

- (void)setSubTitleLabel:(id)a3
{
  VUILabel *v5;
  VUILabel *v6;

  v5 = (VUILabel *)a3;
  if (self->_subTitleLabel != v5)
  {
    v6 = v5;
    -[VUIListLockupCollectionViewCellView vui_addSubview:oldView:](self, "vui_addSubview:oldView:", v5);
    objc_storeStrong((id *)&self->_subTitleLabel, a3);
    -[VUIListLockupCollectionViewCellView vui_setNeedsLayout](self, "vui_setNeedsLayout");
    v5 = v6;
  }

}

- (void)setDescriptionTextView:(id)a3
{
  FocusableTextView *v5;
  FocusableTextView *v6;

  v5 = (FocusableTextView *)a3;
  if (self->_descriptionTextView != v5)
  {
    v6 = v5;
    -[VUIListLockupCollectionViewCellView vui_addSubview:oldView:](self, "vui_addSubview:oldView:", v5);
    objc_storeStrong((id *)&self->_descriptionTextView, a3);
    -[VUIListLockupCollectionViewCellView vui_setNeedsLayout](self, "vui_setNeedsLayout");
    v5 = v6;
  }

}

- (void)setPrimaryButton:(id)a3
{
  VUIButton *v5;
  VUIButton *v6;

  v5 = (VUIButton *)a3;
  if (self->_primaryButton != v5)
  {
    v6 = v5;
    -[VUIListLockupCollectionViewCellView vui_addSubview:oldView:](self, "vui_addSubview:oldView:", v5);
    objc_storeStrong((id *)&self->_primaryButton, a3);
    -[VUIListLockupCollectionViewCellView vui_setNeedsLayout](self, "vui_setNeedsLayout");
    v5 = v6;
  }

}

- (void)setSecondaryButton:(id)a3
{
  VUIButton *v5;
  VUIButton *v6;

  v5 = (VUIButton *)a3;
  if (self->_secondaryButton != v5)
  {
    v6 = v5;
    -[VUIListLockupCollectionViewCellView vui_addSubview:oldView:](self, "vui_addSubview:oldView:", v5);
    objc_storeStrong((id *)&self->_secondaryButton, a3);
    -[VUIListLockupCollectionViewCellView vui_setNeedsLayout](self, "vui_setNeedsLayout");
    v5 = v6;
  }

}

- (void)setImageView:(id)a3
{
  UIView *v5;
  UIView *v6;

  v5 = (UIView *)a3;
  if (self->_imageView != v5)
  {
    v6 = v5;
    -[VUIListLockupCollectionViewCellView vui_addSubview:oldView:](self, "vui_addSubview:oldView:", v5);
    objc_storeStrong((id *)&self->_imageView, a3);
    -[VUIListLockupCollectionViewCellView vui_setNeedsLayout](self, "vui_setNeedsLayout");
    v5 = v6;
  }

}

- (void)setSemanticContentAttribute:(int64_t)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VUIListLockupCollectionViewCellView;
  -[VUIListLockupCollectionViewCellView setSemanticContentAttribute:](&v5, sel_setSemanticContentAttribute_);
  -[VUILabel setSemanticContentAttribute:](self->_subTitleLabel, "setSemanticContentAttribute:", a3);
  -[VUILabel setSemanticContentAttribute:](self->_titleLabel, "setSemanticContentAttribute:", a3);
  -[FocusableTextView setSemanticContentAttribute:](self->_descriptionTextView, "setSemanticContentAttribute:", a3);
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)VUIListLockupCollectionViewCellView;
  -[VUIListLockupCollectionViewCellView setHighlighted:](&v5, sel_setHighlighted_);
  -[VUIListLockupCollectionViewCellView vui_setHighlighted:](self, "vui_setHighlighted:", v3);
}

- (void)vui_setHighlighted:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[VUILabel setHighlighted:](self->_titleLabel, "setHighlighted:");
  -[VUILabel setHighlighted:](self->_subTitleLabel, "setHighlighted:", v3);
  -[FocusableTextView setHighlighted:](self->_descriptionTextView, "setHighlighted:", v3);
}

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  double height;
  double width;
  int64_t imagePosition;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  int v15;
  double v16;
  CGFloat v17;
  CGFloat v18;
  UIView *imageView;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  double v25;
  CGFloat v26;
  CGFloat v27;
  double v28;
  double v29;
  _BOOL4 v30;
  double v31;
  double v32;
  CGFloat v33;
  VUILabel *v34;
  CGFloat v35;
  double v36;
  VUILabel *v37;
  VUILabel *v38;
  double v39;
  CGFloat v40;
  double v41;
  CGFloat v42;
  VUILabel *v43;
  double v44;
  FocusableTextView *v45;
  double v46;
  CGFloat v47;
  double v48;
  CGFloat v49;
  uint64_t v50;
  VUIButton *v51;
  double v52;
  CGFloat v53;
  double v54;
  CGFloat v55;
  double v56;
  CGFloat v57;
  CGFloat v58;
  VUIButton *v59;
  CGFloat v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  VUIButton *primaryButton;
  double v67;
  CGFloat v68;
  double v69;
  CGFloat v70;
  double v71;
  double v72;
  double v73;
  VUILabel *titleLabel;
  double v75;
  CGFloat v76;
  double v77;
  double v78;
  double v79;
  VUILabel *subTitleLabel;
  CGFloat v81;
  double v82;
  double v83;
  CGFloat v84;
  VUILabel *v85;
  FocusableTextView *descriptionTextView;
  CGFloat v87;
  CGFloat v88;
  int64_t v89;
  double v90;
  double v91;
  uint64_t v92;
  VUIButton *secondaryButton;
  CGFloat v94;
  double v95;
  CGFloat v96;
  double v97;
  double v98;
  double v99;
  VUILabel *v100;
  double v101;
  double v102;
  CGFloat v103;
  double v104;
  double v105;
  double v106;
  VUILabel *v107;
  double v108;
  double v109;
  CGFloat v110;
  double v111;
  double v112;
  FocusableTextView *v113;
  double v114;
  double v115;
  double v116;
  CGFloat v117;
  double v118;
  double v119;
  double v120;
  VUIButton *v121;
  double v122;
  double v123;
  double v124;
  double v125;
  double v126;
  double v127;
  double v128;
  double v129;
  double v130;
  double v131;
  double v132;
  double v133;
  double v134;
  double v135;
  double v136;
  double v137;
  double v138;
  double v139;
  double v140;
  double v141;
  double v142;
  double v143;
  double v144;
  double v145;
  double v146;
  double v147;
  double v148;
  double v149;
  double v150;
  int v151;
  double v152;
  double v153;
  double v154;
  double v155;
  double v156;
  double v157;
  double v158;
  double v159;
  double v160;
  double v161;
  CGFloat v162;
  CGFloat v163;
  CGFloat v164;
  double v165;
  double v166;
  double v167;
  double v168;
  double v169;
  double v170;
  double v171;
  double v172;
  BOOL v173;
  double v174;
  double v175;
  CGFloat rect;
  double rect_8;
  double rect_16;
  double rect_24;
  double rect_24a;
  double v181;
  double v182;
  double v183;
  double v184;
  double v185;
  double v186;
  double v187;
  double v188;
  CGFloat v189;
  double v190;
  double v191;
  CGFloat y;
  double v193;
  double v194;
  double v195;
  double v196;
  CGSize result;
  CGRect v198;
  CGRect v199;
  CGRect v200;
  CGRect v201;
  CGRect v202;
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
  CGRect v216;
  CGRect v217;
  CGRect v218;
  CGRect v219;
  CGRect v220;
  CGRect v221;
  CGRect v222;
  CGRect v223;

  height = a3.height;
  width = a3.width;
  if (a3.width == *MEMORY[0x1E0C9D820] && a3.height == *(double *)(MEMORY[0x1E0C9D820] + 8))
    goto LABEL_97;
  imagePosition = self->_imagePosition;
  v10 = 16.0;
  if (imagePosition == 2)
    v10 = 20.0;
  rect_24 = v10;
  v11 = 10.0;
  if (imagePosition == 2)
    v11 = 12.0;
  v165 = v11;
  -[VUISeparatorView lineHeight](self->_separatorView, "lineHeight");
  v13 = v12;
  -[VUIListLockupCollectionViewCellView vuiTraitCollection](self, "vuiTraitCollection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isAXEnabled");

  v16 = *MEMORY[0x1E0C9D648];
  v196 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v18 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v17 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  imageView = self->_imageView;
  rect = *MEMORY[0x1E0C9D648];
  v186 = v18;
  v166 = v13;
  v173 = a4;
  if (!v15)
  {
    v26 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v27 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    if (imageView)
    {
      -[UIView vui_sizeThatFits:](imageView, "vui_sizeThatFits:", width, height);
      v27 = v28;
      v26 = v29;
    }
    v199.origin.x = v16;
    v199.origin.y = v196;
    v199.size.width = v27;
    v199.size.height = v26;
    v223.origin.x = v16;
    v223.origin.y = v196;
    v223.size.width = v18;
    v223.size.height = v17;
    v30 = CGRectEqualToRect(v199, v223);
    v31 = 8.0;
    if (v30)
      v31 = v196;
    v189 = v27;
    y = v31;
    if (v30)
      v32 = v16;
    else
      v32 = 0.0;
    v194 = v26;
    if (v30)
    {
      v195 = width;
    }
    else
    {
      v195 = width;
      if (imagePosition != 2)
      {
        -[VUIListLockupCollectionViewCellView bounds](self, "bounds");
        CGRectGetHeight(v200);
        v32 = 0.0;
        v201.origin.x = 0.0;
        v201.origin.y = v196;
        v201.size.width = v27;
        v201.size.height = v26;
        CGRectGetHeight(v201);
        VUIRoundValue();
        v202.origin.y = v33;
        v202.origin.x = 0.0;
        y = v202.origin.y;
        v202.size.width = v27;
        v202.size.height = v26;
        v195 = width - (v165 + CGRectGetWidth(v202));
      }
    }
    primaryButton = self->_primaryButton;
    v188 = v32;
    if (primaryButton)
    {
      -[UIView vui_sizeThatFits:](primaryButton, "vui_sizeThatFits:", width, 1.79769313e308);
      v68 = v67;
      v70 = v69;
      v208.origin.x = v16;
      v208.origin.y = v196;
      v208.size.width = v68;
      v208.size.height = v70;
      v71 = CGRectGetWidth(v208);
      v72 = width - v71;
      v164 = v70;
      v159 = width - v71;
      if (imagePosition == 2)
      {
        v185 = 0.0;
        v174 = 8.0;
        v18 = v186;
LABEL_47:
        titleLabel = self->_titleLabel;
        v171 = v68;
        if (titleLabel)
        {
          -[UIView vui_sizeThatFits:](titleLabel, "vui_sizeThatFits:", v195, 1.79769313e308);
          v76 = v75;
          v161 = 0.0;
          if (imagePosition == 2)
          {
            -[VUILabel topMarginWithBaselineMargin:](self->_titleLabel, "topMarginWithBaselineMargin:", 28.0);
            v161 = v77;
          }
          v213.origin.x = v185;
          v213.origin.y = v196;
          v213.size.width = v195;
          rect_8 = v76;
          v213.size.height = v76;
          v78 = CGRectGetHeight(v213) + 0.0;
          v37 = self->_titleLabel;
          v79 = v195;
          v58 = v185;
          rect_16 = v185;
          v16 = rect;
          v18 = v186;
        }
        else
        {
          v37 = 0;
          v161 = 0.0;
          v78 = 0.0;
          rect_8 = v17;
          rect_16 = v16;
          v79 = v18;
          v58 = v185;
        }
        subTitleLabel = self->_subTitleLabel;
        v162 = v17;
        v160 = width;
        if (subTitleLabel)
        {
          -[UIView vui_sizeThatFits:](subTitleLabel, "vui_sizeThatFits:", v195, 1.79769313e308);
          v214.size.height = v81;
          v214.origin.x = v58;
          v214.origin.y = v196;
          v214.size.width = v195;
          v183 = v214.size.height;
          v78 = v78 + CGRectGetHeight(v214);
          if (v37)
          {
            -[VUILabel topMarginToLabel:withBaselineMargin:](self->_subTitleLabel, "topMarginToLabel:withBaselineMargin:", v37, rect_24);
            v78 = v78 + v82;
          }
          v85 = self->_subTitleLabel;

          v37 = v85;
          v83 = v195;
          v84 = v58;
        }
        else
        {
          v183 = v17;
          v83 = v18;
          v84 = v16;
        }
        v64 = v174;
        descriptionTextView = self->_descriptionTextView;
        if (descriptionTextView)
        {
          -[UIView vui_sizeThatFits:](descriptionTextView, "vui_sizeThatFits:", v195, 1.79769313e308);
          v215.size.height = v87;
          v215.origin.x = v58;
          v215.origin.y = v196;
          v215.size.width = v195;
          v88 = v215.size.height;
          v78 = v78 + CGRectGetHeight(v215);
          v181 = v88;
          v89 = imagePosition;
          if (v37)
          {
            -[FocusableTextView topMarginToLabel:withBaselineMargin:](self->_descriptionTextView, "topMarginToLabel:withBaselineMargin:", v37, rect_24);
            v78 = v78 + v90;
          }
          v58 = v185;
          v18 = v186;
          v64 = v174;
          -[FocusableTextView computationLabel](self->_descriptionTextView, "computationLabel", *(_QWORD *)&v159);
          v92 = objc_claimAutoreleasedReturnValue();

          v37 = (VUILabel *)v92;
          v91 = v185;
        }
        else
        {
          v89 = imagePosition;
          v181 = v162;
          v195 = v18;
          v91 = rect;
        }
        secondaryButton = self->_secondaryButton;
        v182 = v84;
        v184 = v83;
        rect_24a = v91;
        if (secondaryButton)
        {
          width = v160;
          -[UIView vui_sizeThatFits:](secondaryButton, "vui_sizeThatFits:", v160, 1.79769313e308);
          v216.size.width = v94;
          v96 = v95;
          v216.origin.x = v58;
          v216.origin.y = v196;
          v170 = v216.size.width;
          v216.size.height = v96;
          v78 = v78 + CGRectGetHeight(v216);
          v163 = v96;
          if (v37)
          {
            -[VUIButton topMarginToLabel:withBaselineMargin:](self->_secondaryButton, "topMarginToLabel:withBaselineMargin:", v37, 18.0);
            v78 = v78 + v97;
          }
          v98 = v162;
        }
        else
        {
          v98 = v162;
          v163 = v162;
          v170 = v18;
          v58 = rect;
          width = v160;
        }
        if (v89 == 2)
        {
          v217.origin.x = v188;
          v217.size.width = v189;
          v217.origin.y = y;
          v217.size.height = v194;
          CGRectGetMaxY(v217);
        }
        else
        {
          VUIRoundValue();
        }
        if (self->_titleLabel)
        {
          VUIRoundValue();
          v187 = v99;
          v100 = self->_titleLabel;
          v98 = rect_8;
          v101 = rect_16;
          v18 = v79;
        }
        else
        {
          v100 = 0;
          v101 = rect;
          v187 = v196;
        }
        v172 = v79;
        if (self->_subTitleLabel)
        {
          v102 = v187;
          v103 = v18;
          v104 = v98;
          CGRectGetMaxY(*(CGRect *)&v101);
          VUIRoundValue();
          v106 = v105;
          v107 = self->_subTitleLabel;

          v100 = v107;
          v101 = v182;
          v98 = v183;
          v18 = v184;
          v108 = v106;
        }
        else
        {
          v106 = v187;
          v108 = v196;
        }
        v169 = v108;
        if (self->_descriptionTextView)
        {
          v109 = v106;
          v110 = v18;
          v111 = v98;
          CGRectGetMaxY(*(CGRect *)&v101);
          VUIRoundValue();
          v106 = v112;
          v113 = self->_descriptionTextView;

          v100 = (VUILabel *)v113;
          v101 = rect_24a;
          v98 = v181;
          v18 = v195;
          v114 = v196;
          v115 = v106;
        }
        else
        {
          v114 = v196;
          v115 = v196;
        }
        v168 = v115;
        if (self->_secondaryButton)
        {
          v116 = v106;
          v117 = v18;
          v118 = v98;
          CGRectGetMaxY(*(CGRect *)&v101);
          VUIRoundValue();
          v120 = v119;
          v121 = self->_secondaryButton;

          v100 = (VUILabel *)v121;
        }
        else
        {
          v120 = v114;
        }
        imagePosition = v89;
        v65 = y;
        v63 = v159;
        v167 = v120;
        if (v89 == 2)
        {
          v218.origin.x = v188;
          v218.size.width = v189;
          v218.origin.y = y;
          v218.size.height = v194;
          v122 = v161 + v78 + CGRectGetHeight(v218) + 8.0;
          -[VUILabel bottomMarginWithBaselineMargin:](v100, "bottomMarginWithBaselineMargin:", 10.0);
          height = v123 + v122;
        }
        else
        {
          height = fmax(v78, 80.0);
        }
        v62 = v164;

        goto LABEL_86;
      }
      v209.origin.x = width - v71;
      v209.origin.y = v196;
      v209.size.width = v68;
      v209.size.height = v70;
      v195 = v195 - (CGRectGetWidth(v209) + 10.0);
      -[VUIListLockupCollectionViewCellView bounds](self, "bounds");
      CGRectGetHeight(v210);
      v211.size.height = v70;
      v211.origin.x = v72;
      v211.origin.y = v196;
      v211.size.width = v68;
      CGRectGetHeight(v211);
      v27 = v189;
      VUIRoundValue();
      v174 = v73;
      v18 = v186;
    }
    else
    {
      v159 = v16;
      v185 = 0.0;
      v174 = v196;
      v68 = v18;
      v164 = v17;
      if (imagePosition == 2)
        goto LABEL_47;
    }
    v212.origin.x = v32;
    v212.origin.y = y;
    v212.size.height = v194;
    v212.size.width = v27;
    v185 = CGRectGetMaxX(v212) + 10.0;
    goto LABEL_47;
  }
  if (imageView)
  {
    -[UIView vui_sizeThatFits:](imageView, "vui_sizeThatFits:", width, height);
    v21 = v20;
    v23 = v22;
    v24 = 0.0;
    v198.origin.x = 0.0;
    v198.origin.y = 8.0;
    v198.size.width = v21;
    v198.size.height = v23;
    v191 = 8.0;
    height = CGRectGetMaxY(v198) + 8.0;
    v25 = v196;
  }
  else
  {
    height = 0.0;
    v23 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v21 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v25 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v191 = v25;
    v24 = *MEMORY[0x1E0C9D648];
  }
  v34 = self->_titleLabel;
  v189 = v21;
  if (v34)
  {
    -[UIView vui_sizeThatFits:](v34, "vui_sizeThatFits:", width, 1.79769313e308);
    v203.size.height = v35;
    v36 = 0.0;
    v203.origin.x = 0.0;
    v203.origin.y = height;
    v203.size.width = width;
    rect_8 = v203.size.height;
    v187 = height;
    height = height + CGRectGetHeight(v203);
    v37 = self->_titleLabel;
    v172 = width;
  }
  else
  {
    v37 = 0;
    rect_8 = v17;
    v172 = v18;
    v187 = v25;
    v36 = v16;
  }
  v38 = self->_subTitleLabel;
  if (v38)
  {
    -[UIView vui_sizeThatFits:](v38, "vui_sizeThatFits:", width, 1.79769313e308);
    v40 = v39;
    -[VUILabel topMarginToLabel:withBaselineMargin:](self->_subTitleLabel, "topMarginToLabel:withBaselineMargin:", v37, rect_24);
    v42 = height + v41;
    v204.origin.x = 0.0;
    v182 = 0.0;
    v204.origin.y = v42;
    v204.size.width = width;
    v204.size.height = v40;
    v169 = v42;
    height = v42 + CGRectGetHeight(v204);
    v43 = self->_subTitleLabel;

    v37 = v43;
    v44 = width;
  }
  else
  {
    v44 = v18;
    v40 = v17;
    v169 = v196;
    v182 = v16;
  }
  v45 = self->_descriptionTextView;
  v194 = v23;
  v184 = v44;
  v188 = v24;
  rect_16 = v36;
  if (v45)
  {
    -[UIView vui_sizeThatFits:](v45, "vui_sizeThatFits:", width, 1.79769313e308);
    v47 = v46;
    -[FocusableTextView topMarginToLabel:withBaselineMargin:](self->_descriptionTextView, "topMarginToLabel:withBaselineMargin:", v37, rect_24);
    v49 = height + v48;
    v205.origin.x = 0.0;
    rect_24a = 0.0;
    v205.origin.y = v49;
    v205.size.width = width;
    v205.size.height = v47;
    v168 = v49;
    height = v49 + CGRectGetHeight(v205);
    -[FocusableTextView computationLabel](self->_descriptionTextView, "computationLabel");
    v50 = objc_claimAutoreleasedReturnValue();

    v37 = (VUILabel *)v50;
    v195 = width;
  }
  else
  {
    v47 = v17;
    v195 = v186;
    v168 = v196;
    rect_24a = v16;
  }
  v51 = self->_secondaryButton;
  v181 = v47;
  if (v51)
  {
    -[UIView vui_sizeThatFits:](v51, "vui_sizeThatFits:", width, 1.79769313e308);
    v53 = v52;
    v55 = v54;
    -[VUIButton topMarginToLabel:withBaselineMargin:](self->_secondaryButton, "topMarginToLabel:withBaselineMargin:", v37, 18.0);
    v57 = height + v56;
    v58 = 0.0;
    v206.origin.x = 0.0;
    v206.origin.y = v57;
    v206.size.width = v53;
    v163 = v55;
    v206.size.height = v55;
    v167 = v57;
    height = v57 + CGRectGetHeight(v206);
  }
  else
  {
    v163 = v17;
    v58 = v16;
    v53 = v186;
    v167 = v196;
  }
  v59 = self->_primaryButton;
  v183 = v40;
  v170 = v53;
  if (v59)
  {
    -[UIView vui_sizeThatFits:](v59, "vui_sizeThatFits:", width, 1.79769313e308);
    v207.size.width = v60;
    v62 = v61;
    v63 = 0.0;
    v207.origin.x = 0.0;
    v207.origin.y = height;
    v171 = v207.size.width;
    v207.size.height = v62;
    v64 = height;
    height = height + CGRectGetHeight(v207) + 8.0;
  }
  else
  {
    v62 = v17;
    v171 = v186;
    v64 = v196;
    v63 = rect;
  }
  v65 = v191;
LABEL_86:

  if (!v173)
  {
    if (-[VUIListLockupCollectionViewCellView vuiIsRTL](self, "vuiIsRTL"))
    {
      -[VUIListLockupCollectionViewCellView bounds](self, "bounds");
      VUIRectWithFlippedOriginRelativeToBoundingRect();
      v188 = v124;
      v190 = v125;
      v193 = v126;
      v194 = v127;
      VUIRectWithFlippedOriginRelativeToBoundingRect();
      rect_16 = v128;
      v187 = v129;
      v172 = v130;
      rect_8 = v131;
      VUIRectWithFlippedOriginRelativeToBoundingRect();
      v182 = v132;
      v183 = v133;
      v169 = v134;
      v184 = v135;
      VUIRectWithFlippedOriginRelativeToBoundingRect();
      rect_24a = v136;
      v168 = v137;
      v195 = v138;
      v181 = v139;
      VUIRectWithFlippedOriginRelativeToBoundingRect();
      v175 = v140;
      v171 = v141;
      v142 = v190;
      v65 = v193;
      v63 = v143;
      v62 = v144;
      VUIRectWithFlippedOriginRelativeToBoundingRect();
      v146 = v145;
      v167 = v147;
      v170 = v148;
      v150 = v149;
    }
    else
    {
      v146 = v58;
      v175 = v64;
      v150 = v163;
      v142 = v189;
    }
    -[UIView setFrame:](self->_imageView, "setFrame:", v188, v65, v142, v194, *(_QWORD *)&v159);
    -[VUILabel setFrame:](self->_titleLabel, "setFrame:", rect_16, v187, v172, rect_8);
    -[VUILabel setFrame:](self->_subTitleLabel, "setFrame:", v182, v169, v184, v183);
    -[FocusableTextView setFrame:](self->_descriptionTextView, "setFrame:", rect_24a, v168, v195, v181);
    -[VUIButton setFrame:](self->_primaryButton, "setFrame:", v63, v175, v171, v62);
    -[VUIButton setFrame:](self->_secondaryButton, "setFrame:", v146, v167, v170, v150);
    if (imagePosition == 2)
      v151 = 1;
    else
      v151 = v15;
    if (v151 == 1)
    {
      -[VUIListLockupCollectionViewCellView bounds](self, "bounds");
      v152 = v166;
      v153 = CGRectGetHeight(v219) - v166;
      v154 = 0.0;
      v155 = width;
    }
    else
    {
      v220.origin.x = v188;
      v220.origin.y = v65;
      v220.size.width = v142;
      v220.size.height = v194;
      v152 = v166;
      v155 = width - CGRectGetWidth(v220) - v165;
      v221.origin.x = rect;
      v221.origin.y = v196;
      v221.size.width = v155;
      v221.size.height = v166;
      v154 = width - CGRectGetWidth(v221);
      -[VUIListLockupCollectionViewCellView bounds](self, "bounds");
      CGRectGetHeight(v222);
      VUIRoundValue();
      v153 = v156;
    }
    -[VUISeparatorView setFrame:](self->_separatorView, "setFrame:", v154, v153, v155, v152);
  }
LABEL_97:
  v157 = width;
  v158 = height;
  result.height = v158;
  result.width = v157;
  return result;
}

- (void)vui_prepareForReuse
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[UIView setImage:](self->_imageView, "setImage:", 0);
  -[VUILabel setVuiText:](self->_titleLabel, "setVuiText:", 0);
  -[VUILabel setVuiText:](self->_subTitleLabel, "setVuiText:", 0);
  -[FocusableTextView setDescriptionText:](self->_descriptionTextView, "setDescriptionText:", 0);
  -[VUIButton vui_prepareForReuse](self->_primaryButton, "vui_prepareForReuse");
  -[VUIButton vui_prepareForReuse](self->_secondaryButton, "vui_prepareForReuse");
}

- (UIView)imageView
{
  return self->_imageView;
}

- (VUILabel)titleLabel
{
  return self->_titleLabel;
}

- (VUILabel)subTitleLabel
{
  return self->_subTitleLabel;
}

- (FocusableTextView)descriptionTextView
{
  return self->_descriptionTextView;
}

- (VUIButton)primaryButton
{
  return self->_primaryButton;
}

- (VUIButton)secondaryButton
{
  return self->_secondaryButton;
}

- (int64_t)imagePosition
{
  return self->_imagePosition;
}

- (void)setImagePosition:(int64_t)a3
{
  self->_imagePosition = a3;
}

- (VUISeparatorView)separatorView
{
  return self->_separatorView;
}

- (void)setSeparatorView:(id)a3
{
  objc_storeStrong((id *)&self->_separatorView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->_secondaryButton, 0);
  objc_storeStrong((id *)&self->_primaryButton, 0);
  objc_storeStrong((id *)&self->_descriptionTextView, 0);
  objc_storeStrong((id *)&self->_subTitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
