@implementation VUICollectionHeaderView

- (VUILabel)titleTextView
{
  return self->_titleTextView;
}

- (void)tintColorDidChange
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VUICollectionHeaderView;
  -[VUICollectionHeaderView tintColorDidChange](&v4, sel_tintColorDidChange);
  if (self->_headerButton)
  {
    if (-[VUICollectionHeaderView tintAdjustmentMode](self, "tintAdjustmentMode") == 2)
      objc_msgSend(MEMORY[0x1E0DC3658], "systemMidGrayColor");
    else
      objc_msgSend(MEMORY[0x1E0DC3658], "vui_keyColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitleColor:forState:](self->_headerButton, "setTitleColor:forState:", v3, 0);

  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[VUICollectionHeaderView _layoutWithSize:metricsOnly:](self, "_layoutWithSize:metricsOnly:", 1, a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)setTitleTextView:(id)a3
{
  VUILabel *v5;
  VUILabel *titleTextView;
  VUILabel *v7;

  v5 = (VUILabel *)a3;
  titleTextView = self->_titleTextView;
  if (titleTextView != v5)
  {
    v7 = v5;
    -[VUILabel removeFromSuperview](titleTextView, "removeFromSuperview");
    if (v7 && (-[VUILabel isDescendantOfView:](v7, "isDescendantOfView:", self) & 1) == 0)
      -[VUICollectionHeaderView addSubview:](self, "addSubview:", v7);
    objc_storeStrong((id *)&self->_titleTextView, a3);
    -[VUICollectionHeaderView setNeedsLayout](self, "setNeedsLayout");
    v5 = v7;
  }

}

- (void)setSubtitleTextView:(id)a3
{
  VUILabel *v5;
  VUILabel *subtitleTextView;
  VUILabel *v7;

  v5 = (VUILabel *)a3;
  subtitleTextView = self->_subtitleTextView;
  if (subtitleTextView != v5)
  {
    v7 = v5;
    -[VUILabel removeFromSuperview](subtitleTextView, "removeFromSuperview");
    if (v7 && (-[VUILabel isDescendantOfView:](v7, "isDescendantOfView:", self) & 1) == 0)
      -[VUICollectionHeaderView addSubview:](self, "addSubview:", v7);
    objc_storeStrong((id *)&self->_subtitleTextView, a3);
    -[VUICollectionHeaderView setNeedsLayout](self, "setNeedsLayout");
    v5 = v7;
  }

}

- (void)setLayout:(id)a3
{
  objc_storeStrong((id *)&self->_layout, a3);
}

- (void)setHeaderButton:(id)a3
{
  UIButton *v5;
  UIButton *headerButton;
  UIButton *v7;

  v5 = (UIButton *)a3;
  headerButton = self->_headerButton;
  if (headerButton != v5)
  {
    v7 = v5;
    -[UIButton removeTarget:action:forControlEvents:](headerButton, "removeTarget:action:forControlEvents:", 0, 0, 0xFFFFFFFFLL);
    -[UIButton removeFromSuperview](self->_headerButton, "removeFromSuperview");
    if (v7 && (-[UIButton isDescendantOfView:](v7, "isDescendantOfView:", self) & 1) == 0)
    {
      -[VUICollectionHeaderView addSubview:](self, "addSubview:", v7);
      -[UIButton addTarget:action:forControlEvents:](v7, "addTarget:action:forControlEvents:", self, sel__selectButtonAction_, 64);
    }
    objc_storeStrong((id *)&self->_headerButton, a3);
    -[VUICollectionHeaderView setNeedsLayout](self, "setNeedsLayout");
    v5 = v7;
  }

}

- (VUICollectionHeaderViewLayout)layout
{
  return self->_layout;
}

- (void)layoutSubviews
{
  double v3;
  double v4;

  -[VUICollectionHeaderView bounds](self, "bounds");
  -[VUICollectionHeaderView _layoutWithSize:metricsOnly:](self, "_layoutWithSize:metricsOnly:", 0, v3, v4);
}

- (UIButton)headerButton
{
  return self->_headerButton;
}

- (CGSize)_layoutWithSize:(CGSize)a3 metricsOnly:(BOOL)a4
{
  double height;
  double width;
  double v6;
  UIEdgeInsets *p_padding;
  double v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGFloat left;
  _TVImageView *imageView;
  CGFloat v22;
  double v23;
  double MaxY;
  double v25;
  CGFloat v26;
  double v27;
  double v28;
  CGFloat v29;
  void *v30;
  double v31;
  UIButton *v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  VUILabel *titleTextView;
  double v43;
  CGFloat v44;
  CGFloat v45;
  VUILabel *subtitleTextView;
  double v47;
  double v48;
  CGFloat v49;
  double v50;
  CGFloat v51;
  VUILabel *v52;
  double v53;
  VUILabel *v54;
  double v55;
  double v56;
  UIButton *v57;
  double v58;
  double v59;
  double v60;
  void *v61;
  double v62;
  double v63;
  void *v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  void *v71;
  void *v72;
  double v73;
  double v74;
  double v75;
  double v76;
  CGFloat v77;
  CGFloat v78;
  CGFloat v79;
  CGFloat v80;
  double v81;
  double v82;
  VUILabel *v83;
  double v84;
  CGFloat v85;
  CGFloat v86;
  double v87;
  double v88;
  double v89;
  double v90;
  UIButton *headerButton;
  double v92;
  CGFloat v93;
  CGFloat v94;
  CGFloat v95;
  double v96;
  VUILabel *v97;
  double v98;
  double v99;
  CGFloat v100;
  double v101;
  CGFloat v102;
  double v103;
  double v104;
  double v105;
  double v106;
  double v107;
  double v108;
  double v109;
  double v110;
  double v111;
  double v112;
  double v113;
  double v114;
  double v115;
  double v116;
  double v117;
  double v118;
  double v119;
  double v120;
  double v121;
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
  VUILabel *v141;
  double v142;
  double v143;
  CGFloat v144;
  CGFloat v145;
  double v146;
  double v147;
  double v148;
  VUILabel *v149;
  double v150;
  double v151;
  CGFloat v152;
  CGFloat v153;
  double v154;
  double v155;
  CGFloat v156;
  CGFloat v157;
  double v158;
  double v159;
  double v160;
  CGFloat v161;
  double v162;
  CGFloat v163;
  double v164;
  double v165;
  CGFloat v166;
  CGFloat v167;
  double v168;
  double v169;
  double v170;
  double v171;
  double v172;
  double v173;
  double v174;
  CGFloat x;
  double v176;
  double v177;
  double v178;
  CGFloat rect;
  double recta;
  double rectb;
  CGSize result;
  CGRect v183;
  CGRect v184;
  CGRect v185;
  CGRect v186;
  CGRect v187;
  CGRect v188;
  CGRect v189;

  height = a3.height;
  width = a3.width;
  v6 = *MEMORY[0x1E0C9D820];
  if (a3.width != *MEMORY[0x1E0C9D820] || a3.height != *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    p_padding = &self->_padding;
    v11 = a3.width - self->_padding.left - self->_padding.right;
    -[VUICollectionHeaderView traitCollection](self, "traitCollection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isAXEnabled");

    -[VUICollectionHeaderView traitCollection](self, "traitCollection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[VUICollectionHeaderViewLayout maxImageContentSizeCategory](VUICollectionHeaderViewLayout, "maxImageContentSizeCategory");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[VUIUtilities scaleContentSizeValue:forTraitCollection:maximumContentSizeCategory:](VUIUtilities, "scaleContentSizeValue:forTraitCollection:maximumContentSizeCategory:", v14, v15, 40.0);
    v17 = v16;

    v18 = *MEMORY[0x1E0C9D648];
    v19 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v177 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v178 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v173 = v19;
    v174 = width;
    if (v13)
    {
      left = p_padding->left;
      imageView = self->_imageView;
      if (imageView)
      {
        -[_TVImageView sizeThatFits:](imageView, "sizeThatFits:", v11, 1.79769313e308);
        v183.size.width = v22;
        v183.size.height = v23;
        v183.origin.y = v17 - v23;
        v183.origin.x = left;
        rect = v183.origin.y;
        v166 = v183.size.width;
        v157 = v183.size.height;
        MaxY = CGRectGetMaxY(v183) + 16.0;
        v161 = v177;
        v163 = v178;
        v25 = v18;
        v26 = v19;
        v27 = v25;
        v153 = v25;
        v28 = left;
      }
      else
      {
        v27 = *MEMORY[0x1E0C9D648];
        titleTextView = self->_titleTextView;
        if (titleTextView)
        {
          -[VUILabel topMarginToLabel:withBaselineMargin:](titleTextView, "topMarginToLabel:withBaselineMargin:", 0, 40.0);
          v26 = v43;
          -[VUILabel sizeThatFits:](self->_titleTextView, "sizeThatFits:", v11, 1.79769313e308);
          v184.size.width = v44;
          v184.size.height = v45;
          v29 = left;
          v184.origin.x = left;
          v184.origin.y = v26;
          v161 = v184.size.height;
          v163 = v184.size.width;
          MaxY = CGRectGetMaxY(v184);
          v153 = left;
          v157 = v177;
          v166 = v178;
          rect = v173;
          v28 = v27;
LABEL_15:
          subtitleTextView = self->_subtitleTextView;
          v152 = v26;
          x = v28;
          if (subtitleTextView)
          {
            v47 = v11;
            -[VUILabel sizeThatFits:](subtitleTextView, "sizeThatFits:", v11, 1.79769313e308);
            v49 = v48;
            v51 = v50;
            v52 = self->_subtitleTextView;
            if (self->_imageView)
            {
              -[VUILabel topMarginWithBaselineMargin:](v52, "topMarginWithBaselineMargin:", 23.0);
            }
            else
            {
              v90 = 40.0;
              if (self->_titleTextView)
                v90 = 23.0;
              -[VUILabel topMarginToLabel:withBaselineMargin:](v52, "topMarginToLabel:withBaselineMargin:", v90);
            }
            v76 = MaxY + v53;
            v187.origin.x = v29;
            v187.origin.y = v76;
            v187.size.width = v49;
            v187.size.height = v51;
            MaxY = CGRectGetMaxY(v187);
            v77 = v29;
          }
          else
          {
            v47 = v11;
            if (self->_imageView)
            {
              -[VUICollectionHeaderView traitCollection](self, "traitCollection");
              v71 = (void *)objc_claimAutoreleasedReturnValue();
              +[VUICollectionHeaderViewLayout maxImageContentSizeCategory](VUICollectionHeaderViewLayout, "maxImageContentSizeCategory");
              v72 = (void *)objc_claimAutoreleasedReturnValue();
              +[VUIUtilities scaleContentSizeValue:forTraitCollection:maximumContentSizeCategory:](VUIUtilities, "scaleContentSizeValue:forTraitCollection:maximumContentSizeCategory:", v71, v72, 16.0);
              v73 = v29;
              v75 = v74;

              MaxY = MaxY + v75;
              v29 = v73;
            }
            v51 = v177;
            v49 = v178;
            v76 = v173;
            v77 = v27;
          }
          headerButton = self->_headerButton;
          v170 = v51;
          v171 = v49;
          v168 = v76;
          v169 = v77;
          if (headerButton)
          {
            -[UIButton sizeThatFits:](headerButton, "sizeThatFits:", v47, 0.0);
            v93 = v92;
            v188.size.height = v94;
            v188.origin.x = v29;
            v188.origin.y = MaxY;
            v188.size.width = v93;
            v172 = v188.size.height;
            v165 = MaxY;
            MaxY = MaxY + CGRectGetHeight(v188);
            v95 = rect;
            v96 = v153;
LABEL_48:
            v81 = v157;
            v80 = v166;
            goto LABEL_49;
          }
          v97 = self->_subtitleTextView;
          if (self->_titleTextView)
          {
            if (!v97)
              v97 = self->_titleTextView;
            v96 = v153;
          }
          else
          {
            v96 = v153;
            if (!v97)
            {
LABEL_47:
              v93 = v178;
              v172 = v177;
              v165 = v173;
              v29 = v27;
              v95 = rect;
              goto LABEL_48;
            }
          }
          -[VUILabel bottomMarginWithBaselineMargin:](v97, "bottomMarginWithBaselineMargin:", 16.0);
          MaxY = MaxY + v101;
          goto LABEL_47;
        }
        MaxY = 0.0;
        v161 = *(double *)(MEMORY[0x1E0C9D648] + 24);
        v163 = *(double *)(MEMORY[0x1E0C9D648] + 16);
        v26 = *(double *)(MEMORY[0x1E0C9D648] + 8);
        v28 = *MEMORY[0x1E0C9D648];
        v153 = *MEMORY[0x1E0C9D648];
        v157 = v161;
        v166 = v163;
        rect = v26;
      }
      v29 = left;
      goto LABEL_15;
    }
    if (self->_imageView)
    {
      -[VUICollectionHeaderViewLayout imageViewLayout](self->_layout, "imageViewLayout");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "decoratorSize");
      recta = v17 - v31;

      v32 = self->_headerButton;
      if (v32)
      {
        -[UIButton titleLabel](v32, "titleLabel");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "sizeThatFits:", v11, 0.0);
        v35 = v34;
        v172 = v36;

        -[UIButton titleLabel](self->_headerButton, "titleLabel");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "vui_heightToBaseline");
        v39 = v38;

        v154 = width - v35 - p_padding->right;
        v158 = v35;
        v165 = v17 - v39;
        v40 = v11 - v35 + -10.0;
        v41 = v40;
        if (self->_headerButton)
        {
LABEL_27:
          -[_TVImageView sizeThatFits:](self->_imageView, "sizeThatFits:", v41, 1.79769313e308);
          v185.size.width = v78;
          v185.size.height = v79;
          v185.origin.x = p_padding->left;
          x = v185.origin.x;
          v185.origin.y = recta;
          v80 = v185.size.width;
          v81 = v185.size.height;
          v82 = CGRectGetMaxY(v185);
          v83 = self->_subtitleTextView;
          if (v83)
          {
            if (!self->_headerButton)
              v40 = v11;
            -[VUILabel sizeThatFits:](v83, "sizeThatFits:", v40, 1.79769313e308);
            v85 = v84;
            v86 = p_padding->left;
            -[VUILabel topMarginWithBaselineMargin:](self->_subtitleTextView, "topMarginWithBaselineMargin:", 23.0);
            v186.origin.y = v82 + v87;
            v168 = v82 + v87;
            v169 = v86;
            v186.origin.x = v86;
            v170 = v85;
            v171 = v40;
            v186.size.width = v40;
            v186.size.height = v85;
            v88 = CGRectGetMaxY(v186);
            -[VUILabel bottomMarginWithBaselineMargin:](self->_subtitleTextView, "bottomMarginWithBaselineMargin:", 16.0);
            MaxY = v88 + v89;
            v161 = v177;
            v163 = v178;
            v152 = v173;
          }
          else
          {
            -[_TVImageView bottomMarginWithBaselineMargin:](self->_imageView, "bottomMarginWithBaselineMargin:", 16.0);
            MaxY = v82 + v98;
            v170 = v177;
            v171 = v178;
            v168 = v173;
            v169 = v18;
            v161 = v177;
            v163 = v178;
            v152 = v173;
          }
          v96 = v18;
          v29 = v154;
          v93 = v158;
          v95 = recta;
LABEL_49:
          v102 = x;
          if (!a4)
          {
LABEL_50:
            v176 = v102;
            v167 = v80;
            if (-[VUICollectionHeaderView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection") == 1)
            {
              -[VUICollectionHeaderView bounds](self, "bounds");
              VUIRectWithFlippedOriginRelativeToBoundingRect();
              v104 = v103;
              v106 = v105;
              v162 = v108;
              v164 = v107;
              -[VUICollectionHeaderView bounds](self, "bounds");
              VUIRectWithFlippedOriginRelativeToBoundingRect();
              v168 = v110;
              v169 = v109;
              v170 = v112;
              v171 = v111;
              -[VUICollectionHeaderView bounds](self, "bounds");
              VUIRectWithFlippedOriginRelativeToBoundingRect();
              v155 = v113;
              v160 = v114;
              v165 = v115;
              v172 = v116;
              -[VUICollectionHeaderView bounds](self, "bounds");
              VUIRectWithFlippedOriginRelativeToBoundingRect();
              v118 = v117;
              rectb = v119;
              v121 = v120;
              v81 = v122;
              -[VUICollectionHeaderView bounds](self, "bounds");
              VUIRectWithFlippedOriginRelativeToBoundingRect();
              v124 = v123;
              v125 = v104;
              v127 = v126;
              v128 = v106;
              v130 = v129;
              v132 = v131;
              v134 = v162;
              v133 = v164;
            }
            else
            {
              v125 = v96;
              v132 = 1.0;
              rectb = v95;
              v127 = height + -1.0;
              v124 = 0.0;
              v155 = v29;
              v160 = v93;
              v130 = v174;
              v118 = v176;
              v128 = v152;
              v134 = v161;
              v133 = v163;
              v121 = v167;
            }
            -[VUILabel setFrame:](self->_titleTextView, "setFrame:", v125, v128, v133, v134);
            -[VUILabel setFrame:](self->_subtitleTextView, "setFrame:", v169, v168, v171, v170);
            -[UIButton setFrame:](self->_headerButton, "setFrame:", v155, v165, v160, v172);
            -[_TVImageView setFrame:](self->_imageView, "setFrame:", v118, rectb, v121, v81);
            -[VUISeparatorView setFrame:](self->_separatorView, "setFrame:", v124, v127, v130, v132);
          }
LABEL_54:
          height = ceil(MaxY);
          width = v174;
          goto LABEL_55;
        }
      }
      else
      {
        v40 = v11 - v6 + -10.0;
        v165 = v19;
        v154 = v18;
        v158 = v178;
        v172 = v177;
      }
      v41 = v11;
      goto LABEL_27;
    }
    v54 = self->_titleTextView;
    v151 = *MEMORY[0x1E0C9D648];
    if (!v54)
    {
      v70 = *(double *)(MEMORY[0x1E0C9D648] + 16);
      v172 = *(double *)(MEMORY[0x1E0C9D648] + 24);
      v159 = v70;
      v165 = *(double *)(MEMORY[0x1E0C9D648] + 8);
      v29 = *MEMORY[0x1E0C9D648];
      v99 = v172;
      v100 = *MEMORY[0x1E0C9D648];
      v56 = v165;
      goto LABEL_59;
    }
    -[VUILabel topMarginToLabel:withBaselineMargin:](v54, "topMarginToLabel:withBaselineMargin:", 0, 40.0);
    v29 = v18;
    v56 = v55;
    v57 = self->_headerButton;
    v58 = v19;
    v60 = v177;
    v59 = v178;
    if (v57)
    {
      -[UIButton titleLabel](v57, "titleLabel", v178, v177, v19);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "sizeThatFits:", v11, 0.0);
      v6 = v62;
      v172 = v63;

      -[UIButton titleLabel](self->_headerButton, "titleLabel");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "vui_heightToBaseline");
      v66 = v65;

      v67 = width - v6 - p_padding->right;
      -[UILabel vui_heightToBaseline](self->_titleTextView, "vui_heightToBaseline");
      v69 = v56 + v68;
      v58 = v69 - v66;
      if (self->_headerButton)
      {
        v165 = v69 - v66;
        v159 = v6;
        v29 = v67;
        v70 = v11 - v6 + -10.0;
LABEL_58:
        -[VUILabel sizeThatFits:](self->_titleTextView, "sizeThatFits:", v70, 1.79769313e308, v58);
        v99 = v137;
        v100 = p_padding->left;
LABEL_59:
        v152 = v56;
        v156 = v100;
        v138 = v56;
        v163 = v70;
        v139 = v70;
        v140 = v99;
        MaxY = CGRectGetMaxY(*(CGRect *)&v100);
        v141 = self->_subtitleTextView;
        if (v141)
        {
          if (self->_headerButton)
            v142 = v11 - v6 + -10.0;
          else
            v142 = v11;
          -[VUILabel sizeThatFits:](v141, "sizeThatFits:", v142, 1.79769313e308);
          v144 = v143;
          v145 = p_padding->left;
          v146 = 40.0;
          if (self->_titleTextView)
            v146 = 23.0;
          -[VUILabel topMarginToLabel:withBaselineMargin:](self->_subtitleTextView, "topMarginToLabel:withBaselineMargin:", v146);
          v189.origin.y = MaxY + v147;
          v168 = MaxY + v147;
          v169 = v145;
          v189.origin.x = v145;
          v171 = v142;
          v189.size.width = v142;
          v189.size.height = v144;
          MaxY = CGRectGetMaxY(v189);
          v148 = v151;
        }
        else
        {
          v144 = v177;
          v171 = v178;
          v148 = v151;
          v168 = v173;
          v169 = v151;
        }
        v93 = v159;
        v149 = self->_subtitleTextView;
        v161 = v99;
        v170 = v144;
        if (self->_titleTextView)
        {
          if (!v149)
            v149 = self->_titleTextView;
        }
        else if (!v149)
        {
          goto LABEL_73;
        }
        -[VUILabel bottomMarginWithBaselineMargin:](v149, "bottomMarginWithBaselineMargin:", 16.0);
        MaxY = MaxY + v150;
LABEL_73:
        v81 = v177;
        v80 = v178;
        v95 = v173;
        v102 = v148;
        v96 = v156;
        if (!a4)
          goto LABEL_50;
        goto LABEL_54;
      }
      v59 = v6;
      v29 = v67;
      v60 = v172;
    }
    v165 = v58;
    v172 = v60;
    v159 = v59;
    v70 = v11;
    goto LABEL_58;
  }
LABEL_55:
  v135 = width;
  v136 = height;
  result.height = v136;
  result.width = v135;
  return result;
}

- (id)_buttonWithString:(id)a3 existingButton:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "length"))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = v6;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 1);
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    v8 = v7;
    objc_msgSend(MEMORY[0x1E0DC3658], "vui_keyColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTitleColor:forState:", v9, 0);

    objc_msgSend(v8, "titleLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC1350], "vui_fontFromTextStyle:fontWeight:fontSize:symbolicTraits:", 13, 0, 0, 0.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setFont:", v11);

    objc_msgSend(v8, "titleLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setNumberOfLines:", 1);

    objc_msgSend(v8, "titleLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setAdjustsFontForContentSizeCategory:", 1);

    objc_msgSend(v8, "setTitle:forState:", v5, 0);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)configureCollectionHeaderViewWithTitle:(id)a3 subtitle:(id)a4 buttonString:(id)a5 existingView:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  VUICollectionHeaderView *v13;
  VUICollectionHeaderView *v14;
  VUICollectionHeaderView *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;

  v9 = a3;
  v10 = a4;
  v11 = a6;
  v12 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = (VUICollectionHeaderView *)v11;
  }
  else
  {
    v14 = [VUICollectionHeaderView alloc];
    v13 = -[VUICollectionHeaderView initWithFrame:](v14, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  }
  v15 = v13;
  -[VUICollectionHeaderView layout](v13, "layout");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16)
    v18 = v16;
  else
    v18 = (id)objc_opt_new();
  v19 = v18;

  -[VUICollectionHeaderView setLayout:](v15, "setLayout:", v19);
  if (!v9)
  {
    v22 = 0;
    if (v10)
      goto LABEL_9;
LABEL_11:
    v25 = 0;
    goto LABEL_12;
  }
  objc_msgSend(v19, "titleTextLayout");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUICollectionHeaderView titleTextView](v15, "titleTextView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUILabel labelWithAttributedString:textLayout:existingLabel:](VUILabel, "labelWithAttributedString:textLayout:existingLabel:", v9, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
    goto LABEL_11;
LABEL_9:
  objc_msgSend(v19, "subtitleTextLayout");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUICollectionHeaderView subtitleTextView](v15, "subtitleTextView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUILabel labelWithString:textLayout:existingLabel:](VUILabel, "labelWithString:textLayout:existingLabel:", v10, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_12:
  -[VUICollectionHeaderView headerButton](v15, "headerButton");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUICollectionHeaderView _buttonWithString:existingButton:](v15, "_buttonWithString:existingButton:", v12, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  -[VUICollectionHeaderView setTitleTextView:](v15, "setTitleTextView:", v22);
  -[VUICollectionHeaderView setSubtitleTextView:](v15, "setSubtitleTextView:", v25);
  -[VUICollectionHeaderView setHeaderButton:](v15, "setHeaderButton:", v27);

  return v15;
}

- (void)setSeparatorView:(id)a3
{
  VUISeparatorView *v5;
  VUISeparatorView *separatorView;
  VUISeparatorView *v7;

  v5 = (VUISeparatorView *)a3;
  separatorView = self->_separatorView;
  if (separatorView != v5)
  {
    v7 = v5;
    -[VUISeparatorView removeFromSuperview](separatorView, "removeFromSuperview");
    if (v7 && (-[VUISeparatorView isDescendantOfView:](v7, "isDescendantOfView:", self) & 1) == 0)
      -[VUICollectionHeaderView addSubview:](self, "addSubview:", v7);
    objc_storeStrong((id *)&self->_separatorView, a3);
    -[VUICollectionHeaderView setNeedsLayout](self, "setNeedsLayout");
    v5 = v7;
  }

}

- (void)setImageView:(id)a3
{
  _TVImageView *v5;
  _TVImageView *imageView;
  _TVImageView *v7;

  v5 = (_TVImageView *)a3;
  imageView = self->_imageView;
  if (imageView != v5)
  {
    v7 = v5;
    -[_TVImageView removeFromSuperview](imageView, "removeFromSuperview");
    if (v7 && (-[_TVImageView isDescendantOfView:](v7, "isDescendantOfView:", self) & 1) == 0)
      -[VUICollectionHeaderView addSubview:](self, "addSubview:", v7);
    objc_storeStrong((id *)&self->_imageView, a3);
    -[VUICollectionHeaderView setNeedsLayout](self, "setNeedsLayout");
    v5 = v7;
  }

}

- (void)_selectButtonAction:(id)a3
{
  void (**selectionHandler)(id, id);

  selectionHandler = (void (**)(id, id))self->_selectionHandler;
  if (selectionHandler)
    selectionHandler[2](selectionHandler, a3);
}

- (UIEdgeInsets)padding
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_padding.top;
  left = self->_padding.left;
  bottom = self->_padding.bottom;
  right = self->_padding.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setPadding:(UIEdgeInsets)a3
{
  self->_padding = a3;
}

- (id)selectionHandler
{
  return self->_selectionHandler;
}

- (void)setSelectionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 496);
}

- (VUILabel)subtitleTextView
{
  return self->_subtitleTextView;
}

- (_TVImageView)imageView
{
  return self->_imageView;
}

- (VUISeparatorView)separatorView
{
  return self->_separatorView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->_headerButton, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_subtitleTextView, 0);
  objc_storeStrong((id *)&self->_titleTextView, 0);
  objc_storeStrong((id *)&self->_layout, 0);
  objc_storeStrong(&self->_selectionHandler, 0);
}

@end
