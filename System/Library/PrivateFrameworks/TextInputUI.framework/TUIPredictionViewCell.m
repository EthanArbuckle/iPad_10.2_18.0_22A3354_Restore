@implementation TUIPredictionViewCell

- (void)layoutSubviews
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
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  BOOL v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  _BOOL4 v42;
  void *v43;
  double Width;
  double v45;
  void *v46;
  _BOOL4 v47;
  void *v48;
  double v49;
  _BOOL8 v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  _BOOL4 v55;
  double v56;
  double v57;
  void *v58;
  _BOOL4 v59;
  void *v60;
  void *v61;
  _BOOL4 v62;
  void *v63;
  _BOOL4 v64;
  void *v65;
  double v66;
  double v67;
  void *v68;
  double v69;
  double v70;
  void *v71;
  double v72;
  void *v73;
  double v74;
  void *v75;
  double v76;
  double v77;
  double v78;
  double MaxX;
  double v80;
  double v81;
  double v82;
  void *v83;
  double v84;
  double v85;
  void *v86;
  double v87;
  double v88;
  double v89;
  double v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  void *v103;
  double v104;
  double v105;
  double v106;
  double v107;
  double v108;
  double v109;
  double v110;
  double v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  double v116;
  double v117;
  double v118;
  double v119;
  double v120;
  double v121;
  double v122;
  double v123;
  void *v124;
  void *v125;
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
  void *v136;
  void *v137;
  double v138;
  double v139;
  void *v140;
  uint64_t v141;
  void *v142;
  void *v143;
  double v144;
  double v145;
  double v146;
  double v147;
  double x;
  double y;
  double v150;
  double height;
  void *v152;
  void *v153;
  void *v154;
  double v155;
  double v156;
  double v157;
  double v158;
  void *v159;
  double v160;
  double v161;
  double v162;
  double v163;
  char v164;
  void *v165;
  void *v166;
  double v167;
  double v168;
  BOOL v169;
  double v170;
  double v171;
  double v172;
  double v173;
  double v174;
  void *v175;
  double v176;
  char v177;
  void *v178;
  void *v179;
  double v180;
  double v181;
  double v182;
  BOOL v183;
  double v184;
  double v185;
  double v186;
  double v187;
  double v188;
  void *v189;
  double v190;
  int64_t v191;
  uint64_t v192;
  void *v193;
  void *v194;
  double v195;
  double v196;
  double v197;
  uint64_t v198;
  objc_super v199;
  CGRect v200;
  CGRect v201;
  CGRect v202;
  CGRect v203;

  v199.receiver = self;
  v199.super_class = (Class)TUIPredictionViewCell;
  -[TUIPredictionViewCell layoutSubviews](&v199, sel_layoutSubviews);
  -[TUIPredictionViewCell bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[TUIPredictionViewCell _usePadStyle](self, "_usePadStyle");
  -[TUIPredictionViewCell highlightMargin](self, "highlightMargin");
  v195 = v6;
  v196 = v4;
  UIRectInsetEdges();
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  -[TUIPredictionViewCell currentBackgroundView](self, "currentBackgroundView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setFrame:", v12, v14, v16, v18);

  -[TUIPredictionViewCell candidate](self, "candidate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[TUIPredictionViewCell _usesMorphingLabelForCandidate:](self, "_usesMorphingLabelForCandidate:", v20);

  if (!v21)
  {
    -[TUIPredictionViewCell bounds](self, "bounds");
    if (-[TUIPredictionViewCell candidateRequiresTruncationForBoundingWidth:](self, "candidateRequiresTruncationForBoundingWidth:", v22)|| -[TUIPredictionViewCell isLabelTruncated](self, "isLabelTruncated"))
    {
      -[TUIPredictionViewCell candidate](self, "candidate");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[TUIPredictionViewCell attributedStringRepresentationOfCandidate:](self, "attributedStringRepresentationOfCandidate:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[TUIPredictionViewCell normalLabel](self, "normalLabel");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setAttributedText:", v24);

    }
  }
  -[TUIPredictionViewCell image](self, "image");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    -[TUIPredictionViewCell maskingScrollView](self, "maskingScrollView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "contentInset");
    v29 = v28;

    v30 = 6.0;
    if (v29 != 6.0)
    {
      -[TUIPredictionViewCell maskingScrollView](self, "maskingScrollView");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setContentInset:", 0.0, 6.0, 0.0, 6.0);

    }
  }
  else
  {
    v30 = 3.0;
  }
  -[TUIPredictionViewCell candidate](self, "candidate");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUIPredictionViewCell labelTextSizeForCandidate:](self, "labelTextSizeForCandidate:", v32);
  v34 = v33;

  v35 = 0.0;
  if (v8 + v30 * -2.0 >= 0.0)
    v36 = v8 + v30 * -2.0;
  else
    v36 = 0.0;
  -[TUIPredictionViewCell candidate](self, "candidate");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUIPredictionViewCell labelViewForCandidate:](self, "labelViewForCandidate:", v37);
  v38 = objc_claimAutoreleasedReturnValue();

  -[TUIPredictionViewCell imageView](self, "imageView");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "sizeToFit");

  -[TUIPredictionViewCell candidate](self, "candidate");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v40, "customInfoType");

  v198 = v41;
  v42 = v41 != 0x8000
     && -[TUIPredictionViewCell effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection") == 1;
  -[TUIPredictionViewCell imageView](self, "imageView");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "frame");
  Width = CGRectGetWidth(v200);
  v45 = 6.0;
  if (v34 <= 0.00000011920929)
    v45 = 0.0;
  if (v26)
    v35 = v45;

  -[TUIPredictionViewCell image](self, "image");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  if (v46)
  {
    v47 = 1;
  }
  else
  {
    -[TUIPredictionViewCell candidate](self, "candidate");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = -[TUIPredictionViewCell _isEmojiCandidate:](self, "_isEmojiCandidate:", v48);

  }
  v49 = Width + v35;

  v50 = 0;
  v51 = (void *)v38;
  if (v34 > 0.00000011920929 && v36 > 0.0)
  {
    if (v34 + v49 + 2.0 <= v36)
    {
      v50 = 0;
    }
    else
    {
      -[TUIPredictionViewCell currentTextSuggestion](self, "currentTextSuggestion");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      if (v52)
      {
        -[TUIPredictionViewCell image](self, "image");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = v53 != 0;

      }
      else
      {
        v50 = 1;
      }

    }
  }
  -[TUIPredictionViewCell candidate](self, "candidate");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = -[TUIPredictionViewCell _isSecureCandidate:](self, "_isSecureCandidate:", v54);

  if (v55)
    v56 = v36;
  else
    v56 = v34;
  if (v47 || v50)
    v57 = v56;
  else
    v57 = v36;
  -[TUIPredictionViewCell candidate](self, "candidate");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = -[TUIPredictionViewCell _isStickerCandidate:](self, "_isStickerCandidate:", v58);

  -[TUIPredictionViewCell candidate](self, "candidate");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUIPredictionViewCell _isTextEffectsCandidate:](self, "_isTextEffectsCandidate:", v60);

  -[TUIPredictionViewCell candidate](self, "candidate");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = -[TUIPredictionViewCell _isWritingToolsCandidate:](self, "_isWritingToolsCandidate:", v61);

  -[TUIPredictionViewCell candidate](self, "candidate");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = -[TUIPredictionViewCell _isTextEffectsCandidate:](self, "_isTextEffectsCandidate:", v63);

  if (v64)
  {
    -[TUIPredictionViewCell animationsLabelView](self, "animationsLabelView");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
    v67 = v66;

    -[TUIPredictionViewCell currentBackgroundView](self, "currentBackgroundView");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "bounds");
    v70 = v67 - v69;

    -[TUIPredictionViewCell currentBackgroundView](self, "currentBackgroundView");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "frame");
    v73 = v51;
    objc_msgSend(v51, "setFrame:", 0.0, v72 - fmax(v70, 0.0) + -3.0, v57, v67);

  }
  else
  {
    v74 = 0.0;
    if (!-[TUIPredictionViewCell _usePadStyle](self, "_usePadStyle") && (!v55 || v59) && !v62)
    {
      -[TUIPredictionViewCell currentBackgroundView](self, "currentBackgroundView");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "frame");
      v74 = v76 * 0.5;

    }
    v73 = v51;
    objc_msgSend(v51, "setFrame:", 0.0, v74, v57, v10);
  }
  v77 = -0.0;
  if (v50 && v26 != 0)
    v77 = 6.0;
  v197 = v49;
  v78 = v49 + v77;
  objc_msgSend(v73, "frame");
  MaxX = CGRectGetMaxX(v201);
  v80 = 0.0;
  if (v42)
    v81 = 0.0;
  else
    v81 = v78;
  if (v50)
    v82 = v8 - v78;
  else
    v82 = MaxX;
  -[TUIPredictionViewCell lightEffectsContainer](self, "lightEffectsContainer");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "setFrame:", v81, 0.0, v82, v10);

  v84 = *MEMORY[0x1E0C9D538];
  v85 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  -[TUIPredictionViewCell lightEffectsContainer](self, "lightEffectsContainer");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "frame");
  v88 = v87;
  v90 = v89;
  -[TUIPredictionViewCell maskingScrollView](self, "maskingScrollView");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "setFrame:", v84, v85, v88, v90);

  -[TUIPredictionViewCell maskingScrollView](self, "maskingScrollView");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "setContentSize:", MaxX, v10);

  -[TUIPredictionViewCell maskingScrollView](self, "maskingScrollView");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "setScrollEnabled:", v50);

  if (v50)
  {
    -[TUIPredictionViewCell maskingScrollView](self, "maskingScrollView");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "frame");
    v96 = v95;
    v98 = v97;
    v100 = v99;
    v102 = v101;
    -[TUIPredictionViewCell maskingScrollView](self, "maskingScrollView");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v103, "contentInset");
    v105 = v104;
    v107 = v98 + v106;
    v109 = v100 - (v104 + v108);
    v111 = v102 - (v106 + v110);

    if (!v42)
    {
      v202.origin.x = v96 + v105;
      v202.origin.y = v107;
      v202.size.width = v109;
      v202.size.height = v111;
      v80 = ceil(MaxX - CGRectGetWidth(v202));
    }
    -[TUIPredictionViewCell morphingLabel](self, "morphingLabel");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v112, "setVisibleRect:", v80, v107, v109, v111);

    -[TUIPredictionViewCell maskingScrollView](self, "maskingScrollView");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v113, "scrollRectToVisible:animated:", 0, v80, v107, v109, v111);
    goto LABEL_60;
  }
  -[TUIPredictionViewCell morphingLabel](self, "morphingLabel");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v114, "setVisibleRect:", v196, v195, v8, v10);

  -[TUIPredictionViewCell lightEffectsContainer](self, "lightEffectsContainer");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v115, "frame");
  UIRectCenteredXInRect();
  v117 = v116;
  v119 = v118;
  v121 = v120;
  v123 = v122;
  -[TUIPredictionViewCell lightEffectsContainer](self, "lightEffectsContainer");
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v124, "setFrame:", v117, v119, v121, v123);

  if (v26)
  {
    -[TUIPredictionViewCell lightEffectsContainer](self, "lightEffectsContainer");
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v125, "frame");
    v127 = v126;
    v129 = v128;
    v131 = v130;
    v133 = v132;

    v134 = 0.5;
    if (v42)
      v134 = -0.5;
    v135 = v134 * v197 + v127;
    -[TUIPredictionViewCell lightEffectsContainer](self, "lightEffectsContainer");
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v136, "setFrame:", v135, v129, v131, v133);

  }
  -[TUIPredictionViewCell maskingScrollView](self, "maskingScrollView");
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v137, "contentOffset");
  v139 = v138;

  if (v139 != 0.0)
  {
    -[TUIPredictionViewCell maskingScrollView](self, "maskingScrollView");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v113, "setContentOffset:animated:", 0, 0.0, 0.0);
LABEL_60:

  }
  -[TUIPredictionViewCell imageView](self, "imageView");
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v140, "frame");

  if (v42)
  {
    if (v50)
    {
      -[TUIPredictionViewCell bounds](self, "bounds");
    }
    else
    {
      -[TUIPredictionViewCell maskingScrollView](self, "maskingScrollView");
      v143 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v143, "frame");

    }
    v141 = v198;
  }
  else
  {
    v141 = v198;
    if (!v50)
    {
      -[TUIPredictionViewCell lightEffectsContainer](self, "lightEffectsContainer");
      v142 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v142, "frame");

    }
  }
  -[TUIPredictionViewCell bounds](self, "bounds");
  UIRectCenteredYInRect();
  x = v144;
  y = v145;
  v150 = v146;
  height = v147;
  if (v141 == 0x8000)
  {
    v203 = CGRectOffset(*(CGRect *)&v144, 0.0, 3.0);
    x = v203.origin.x;
    y = v203.origin.y;
    v150 = v203.size.width;
    height = v203.size.height;
  }
  -[TUIPredictionViewCell imageView](self, "imageView");
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v152, "setFrame:", x, y, v150, height);

  objc_msgSend(MEMORY[0x1E0DC3A00], "preferredFontWithSize:", 17.0);
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUIPredictionViewCell animationsLabelView](self, "animationsLabelView");
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v154, "bounds");
  v156 = v155;
  objc_msgSend(v153, "lineHeight");
  v158 = (v156 - v157) * 0.5;
  -[TUIPredictionViewCell animationsLabelView](self, "animationsLabelView");
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v159, "setTextContainerInset:", v158, 0.0, 0.0, 0.0);

  if (objc_msgSend((id)objc_opt_class(), "_useSeparatorViews"))
  {
    -[TUIPredictionViewCell bounds](self, "bounds");
    v161 = v160;
    v163 = v162;
    v164 = -[TUIPredictionViewCell visibleSeparatorEdges](self, "visibleSeparatorEdges");
    -[TUIPredictionViewCell leftSeparatorView](self, "leftSeparatorView");
    v165 = (void *)objc_claimAutoreleasedReturnValue();
    v166 = v165;
    if ((v164 & 2) != 0)
    {
      objc_msgSend(v165, "setHidden:", 0);

      -[TUIPredictionViewCell separatorMargin](self, "separatorMargin");
      v168 = v167;
      v169 = -[TUIPredictionViewCell _usePadStyle](self, "_usePadStyle");
      v170 = 0.0;
      if (!v169)
      {
        -[TUIPredictionViewCell highlightMargin](self, "highlightMargin", 0.0);
        v170 = v171 * 0.5;
      }
      v172 = v168 + v170;
      -[TUIPredictionViewCell separatorMargin](self, "separatorMargin");
      v174 = v163 + v173 * -2.0;
      -[TUIPredictionViewCell leftSeparatorView](self, "leftSeparatorView");
      v175 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v175, "setFrame:", 0.0, v172, 1.0, v174);

      v176 = *(double *)&kTUISeparatorCornerRadius;
      -[TUIPredictionViewCell leftSeparatorView](self, "leftSeparatorView");
      v166 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v166, "_setCornerRadius:", v176);
    }
    else
    {
      objc_msgSend(v165, "setHidden:", 1);
    }

    v177 = -[TUIPredictionViewCell visibleSeparatorEdges](self, "visibleSeparatorEdges");
    -[TUIPredictionViewCell rightSeparatorView](self, "rightSeparatorView");
    v178 = (void *)objc_claimAutoreleasedReturnValue();
    v179 = v178;
    if ((v177 & 8) != 0)
    {
      objc_msgSend(v178, "setHidden:", 0);

      v180 = v161 + -1.0;
      -[TUIPredictionViewCell separatorMargin](self, "separatorMargin");
      v182 = v181;
      v183 = -[TUIPredictionViewCell _usePadStyle](self, "_usePadStyle");
      v184 = 0.0;
      if (!v183)
      {
        -[TUIPredictionViewCell highlightMargin](self, "highlightMargin", 0.0);
        v184 = v185 * 0.5;
      }
      v186 = v182 + v184;
      -[TUIPredictionViewCell separatorMargin](self, "separatorMargin");
      v188 = v163 + v187 * -2.0;
      -[TUIPredictionViewCell rightSeparatorView](self, "rightSeparatorView");
      v189 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v189, "setFrame:", v180, v186, 1.0, v188);

      v190 = *(double *)&kTUISeparatorCornerRadius;
      -[TUIPredictionViewCell rightSeparatorView](self, "rightSeparatorView");
      v179 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v179, "_setCornerRadius:", v190);
    }
    else
    {
      objc_msgSend(v178, "setHidden:", 1);
    }

    v191 = ((int64_t)(-[TUIPredictionViewCell roundedHighlightEdges](self, "roundedHighlightEdges") << 62) >> 63) & 5;
    if ((-[TUIPredictionViewCell roundedHighlightEdges](self, "roundedHighlightEdges") & 8) != 0)
      v192 = v191 | 0xA;
    else
      v192 = v191;
    -[TUIPredictionViewCell currentBackgroundView](self, "currentBackgroundView");
    v193 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v193, "layer");
    v194 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v194, "setMaskedCorners:", v192);

  }
  -[TUIPredictionViewCell updateTextLabelVibrancyIfNeeded](self, "updateTextLabelVibrancyIfNeeded");

}

- (UIScrollView)maskingScrollView
{
  return self->_maskingScrollView;
}

- (TIKeyboardCandidate)candidate
{
  return self->_candidate;
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (UIImage)image
{
  void *v2;
  void *v3;

  -[TUIPredictionViewCell imageView](self, "imageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v3;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (UIView)rightSeparatorView
{
  return self->_rightSeparatorView;
}

- (BOOL)_usePadStyle
{
  void *v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  if ((v3 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    return objc_msgSend(MEMORY[0x1E0DC3958], "isFloating") ^ 1;
  else
    return 0;
}

- (unint64_t)visibleSeparatorEdges
{
  return self->_visibleSeparatorEdges;
}

- (unint64_t)roundedHighlightEdges
{
  return self->_roundedHighlightEdges;
}

- (UIView)leftSeparatorView
{
  return self->_leftSeparatorView;
}

+ (BOOL)_useSeparatorViews
{
  return 1;
}

- (double)highlightMargin
{
  return self->_highlightMargin;
}

- (double)separatorMargin
{
  return self->_separatorMargin;
}

- (id)labelViewForCandidate:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  -[TUIPredictionViewCell normalLabel](self, "normalLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[TUIPredictionViewCell _isSecureCandidate:](self, "_isSecureCandidate:", v4))
  {
    -[TUIPredictionViewCell secureCandidateLabel](self, "secureCandidateLabel");
    v6 = objc_claimAutoreleasedReturnValue();
LABEL_7:
    v7 = (void *)v6;

    v5 = v7;
    goto LABEL_8;
  }
  if (-[TUIPredictionViewCell _isTextEffectsCandidate:](self, "_isTextEffectsCandidate:", v4))
  {
    -[TUIPredictionViewCell animationsLabelView](self, "animationsLabelView");
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if (-[TUIPredictionViewCell _usesMorphingLabelForCandidate:](self, "_usesMorphingLabelForCandidate:", v4))
  {
    -[TUIPredictionViewCell morphingLabel](self, "morphingLabel");
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
LABEL_8:

  return v5;
}

- (CGSize)labelTextSizeForCandidate:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  _QWORD v20[2];
  CGSize result;

  v20[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[TUIPredictionViewCell _isSecureCandidate:](self, "_isSecureCandidate:", v4))
  {
    v5 = *MEMORY[0x1E0DC55F0];
    v6 = *MEMORY[0x1E0DC55F0];
  }
  else
  {
    if (-[TUIPredictionViewCell _usesMorphingLabelForCandidate:](self, "_usesMorphingLabelForCandidate:", v4))
    {
      -[TUIPredictionViewCell morphingLabel](self, "morphingLabel");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "text");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = *MEMORY[0x1E0DC32A0];
      -[TUIPredictionViewCell morphingLabel](self, "morphingLabel");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "font");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = v10;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "sizeWithAttributes:", v11);
      v5 = v12;
      v6 = v13;

    }
    else
    {
      if (-[TUIPredictionViewCell _isTextEffectsCandidate:](self, "_isTextEffectsCandidate:", v4))
        -[TUIPredictionViewCell animationsLabelView](self, "animationsLabelView");
      else
        -[TUIPredictionViewCell normalLabel](self, "normalLabel");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "attributedText");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "size");
      v5 = v15;
      v6 = v16;

    }
  }

  v17 = v5;
  v18 = v6;
  result.height = v18;
  result.width = v17;
  return result;
}

- (UIMorphingLabel)morphingLabel
{
  return self->_morphingLabel;
}

- (BOOL)_usesMorphingLabelForCandidate:(id)a3
{
  id v4;
  BOOL v5;
  BOOL v6;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) == 0
    || objc_msgSend(v4, "customInfoType") == 32
    || objc_msgSend(v4, "customInfoType") == 0x8000
    || objc_msgSend(v4, "candidateProperty") == 8;
  v6 = v5 & ~-[TUIPredictionViewCell _isTextEffectsCandidate:](self, "_isTextEffectsCandidate:", v4);

  return v6;
}

- (BOOL)_isSecureCandidate:(id)a3
{
  return objc_msgSend(a3, "slotID") != 0;
}

- (BOOL)_isStickerCandidate:(id)a3
{
  return objc_msgSend(a3, "customInfoType") == 4096;
}

- (BOOL)_isEmojiCandidate:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "label");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_containsEmojiOnly");

  return v4;
}

- (int64_t)layoutType
{
  void *v3;
  void *v4;
  void *v5;
  int64_t v6;
  void *v7;

  -[TUIPredictionViewCell candidate](self, "candidate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUIPredictionViewCell _displayLabelForCandidate:](self, "_displayLabelForCandidate:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {

  }
  else
  {
    -[TUIPredictionViewCell image](self, "image");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      return 1;
  }
  -[TUIPredictionViewCell customView](self, "customView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5 != 0;

  return v6;
}

- (id)_displayLabelForCandidate:(id)a3
{
  id v4;
  float v5;
  void *v6;
  uint64_t v7;
  __CFString *v8;

  v4 = a3;
  -[TUIPredictionViewCell contentHuggingPriorityForAxis:](self, "contentHuggingPriorityForAxis:", 0);
  if (v5 == 1000.0 || objc_msgSend(v4, "customInfoType") != 32)
  {
    objc_msgSend(v4, "label");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v6, "length"))
    {
      v8 = &stru_1E24FC6C0;
      goto LABEL_8;
    }
    objc_msgSend(v4, "label");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringInDeviceLanguageForKey:", CFSTR("Passwords"));
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (__CFString *)v7;
LABEL_8:

  return v8;
}

- (void)setCandidate:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v4 = a4;
  v15 = a3;
  -[TIKeyboardCandidate candidate](self->_candidate, "candidate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "candidate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqual:", v8);

  objc_storeStrong((id *)&self->_candidate, a3);
  -[TUIPredictionViewCell morphingLabel](self, "morphingLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setHidden:", 1);

  -[TUIPredictionViewCell normalLabel](self, "normalLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setHidden:", 1);

  -[TUIPredictionViewCell secureCandidateLabel](self, "secureCandidateLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setHidden:", 1);

  -[TUIPredictionViewCell animationsLabelView](self, "animationsLabelView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setHidden:", 1);

  -[TUIPredictionViewCell endAnimations](self, "endAnimations");
  -[TUIPredictionViewCell animationsLabelView](self, "animationsLabelView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setText:", 0);

  -[TUIPredictionViewCell setLabelTruncated:](self, "setLabelTruncated:", 0);
  -[TUIPredictionViewCell setLightingEffectEnabled:](self, "setLightingEffectEnabled:", 0);
  -[TUIPredictionViewCell setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", 0);
  if (-[TUIPredictionViewCell _isSecureCandidate:](self, "_isSecureCandidate:", v15))
  {
    -[TUIPredictionViewCell _setSecureCandidate:animated:](self, "_setSecureCandidate:animated:", v15, v4);
  }
  else if (-[TUIPredictionViewCell _isTextEffectsCandidate:](self, "_isTextEffectsCandidate:", v15))
  {
    -[TUIPredictionViewCell _setTextEffectsCandidate:animated:](self, "_setTextEffectsCandidate:animated:", v15, v4);
  }
  else if (-[TUIPredictionViewCell _isSmartReplyCandidate:](self, "_isSmartReplyCandidate:", v15))
  {
    -[TUIPredictionViewCell _setSmartReplyCandidate:animated:](self, "_setSmartReplyCandidate:animated:", v15, (v9 ^ 1) & v4);
  }
  else if (-[TUIPredictionViewCell _usesMorphingLabelForCandidate:](self, "_usesMorphingLabelForCandidate:", v15))
  {
    -[TUIPredictionViewCell _setMorphingLabelWithCandidate:animated:](self, "_setMorphingLabelWithCandidate:animated:", v15, v4);
  }
  else
  {
    -[TUIPredictionViewCell _setNormalLabelWithCandidate:animated:](self, "_setNormalLabelWithCandidate:animated:", v15, v4);
  }
  -[TUIPredictionViewCell invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  -[TUIPredictionViewCell setNeedsLayout](self, "setNeedsLayout");

}

- (void)setVisibleSeparatorEdges:(unint64_t)a3
{
  self->_visibleSeparatorEdges = a3;
  -[TUIPredictionViewCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)setRoundedHighlightEdges:(unint64_t)a3
{
  self->_roundedHighlightEdges = a3;
}

- (void)setLabelTruncated:(BOOL)a3
{
  self->_labelTruncated = a3;
}

- (TUIPredictionViewCell)initWithFrame:(CGRect)a3
{
  TUIPredictionViewCell *v3;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
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
  void *v29;
  void *v30;
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
  double v42;
  double v43;
  void *v44;
  void *v45;
  void *v46;
  double v47;
  double v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
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
  objc_super v68;

  v68.receiver = self;
  v68.super_class = (Class)TUIPredictionViewCell;
  v3 = -[TUIPredictionViewCell initWithFrame:](&v68, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC3F10]);
    v5 = *MEMORY[0x1E0C9D648];
    v6 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v7 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v9 = (void *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], v6, v7, v8);
    -[TUIPredictionViewCell setBackgroundView:](v3, "setBackgroundView:", v9);

    -[TUIPredictionViewCell backgroundView](v3, "backgroundView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setCornerRadius:", 5.0);

    -[TUIPredictionViewCell backgroundView](v3, "backgroundView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setMasksToBounds:", 1);

    -[TUIPredictionViewCell backgroundView](v3, "backgroundView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIPredictionViewCell addSubview:](v3, "addSubview:", v14);

    if (objc_msgSend((id)objc_opt_class(), "_useSeparatorViews"))
    {
      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v5, v6, v7, v8);
      -[TUIPredictionViewCell setLeftSeparatorView:](v3, "setLeftSeparatorView:", v15);

      -[TUIPredictionViewCell leftSeparatorView](v3, "leftSeparatorView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[TUIPredictionViewCell addSubview:](v3, "addSubview:", v16);

      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v5, v6, v7, v8);
      -[TUIPredictionViewCell setRightSeparatorView:](v3, "setRightSeparatorView:", v17);

      -[TUIPredictionViewCell rightSeparatorView](v3, "rightSeparatorView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[TUIPredictionViewCell addSubview:](v3, "addSubview:", v18);

    }
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3C28]), "initWithFrame:", v5, v6, v7, v8);
    -[TUIPredictionViewCell setMaskingScrollView:](v3, "setMaskingScrollView:", v19);

    -[TUIPredictionViewCell maskingScrollView](v3, "maskingScrollView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setDelegate:", v3);

    -[TUIPredictionViewCell maskingScrollView](v3, "maskingScrollView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setShowsHorizontalScrollIndicator:", 0);

    -[TUIPredictionViewCell maskingScrollView](v3, "maskingScrollView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setShowsVerticalScrollIndicator:", 0);

    -[TUIPredictionViewCell maskingScrollView](v3, "maskingScrollView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setContentInset:", 0.0, 3.0, 0.0, 3.0);

    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F58]), "initWithFrame:", v5, v6, v7, v8);
    -[TUIPredictionViewCell setLightEffectsContainer:](v3, "setLightEffectsContainer:", v24);

    -[TUIPredictionViewCell lightEffectsContainer](v3, "lightEffectsContainer");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIPredictionViewCell addSubview:](v3, "addSubview:", v25);

    -[TUIPredictionViewCell lightEffectsContainer](v3, "lightEffectsContainer");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "contentView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIPredictionViewCell maskingScrollView](v3, "maskingScrollView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addSubview:", v28);

    v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A00]), "initWithFrame:", v5, v6, v7, v8);
    -[TUIPredictionViewCell setMorphingLabel:](v3, "setMorphingLabel:", v29);

    -[TUIPredictionViewCell morphingLabel](v3, "morphingLabel");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setOpaque:", 0);

    -[TUIPredictionViewCell morphingLabel](v3, "morphingLabel");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setTextAlignment:", 1);

    -[TUIPredictionViewCell maskingScrollView](v3, "maskingScrollView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIPredictionViewCell morphingLabel](v3, "morphingLabel");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "addSubview:", v33);

    v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v5, v6, v7, v8);
    -[TUIPredictionViewCell setNormalLabel:](v3, "setNormalLabel:", v34);

    -[TUIPredictionViewCell normalLabel](v3, "normalLabel");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setOpaque:", 0);

    -[TUIPredictionViewCell normalLabel](v3, "normalLabel");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setNumberOfLines:", 0);

    -[TUIPredictionViewCell normalLabel](v3, "normalLabel");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setTextAlignment:", 1);

    -[TUIPredictionViewCell maskingScrollView](v3, "maskingScrollView");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIPredictionViewCell normalLabel](v3, "normalLabel");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "addSubview:", v39);

    v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v5, v6, v7, v8);
    -[TUIPredictionViewCell setSecureCandidateLabel:](v3, "setSecureCandidateLabel:", v40);

    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "scale");
    v43 = v42;
    -[TUIPredictionViewCell secureCandidateLabel](v3, "secureCandidateLabel");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "layer");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setContentsScale:", v43);

    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "scale");
    v48 = v47;
    -[TUIPredictionViewCell secureCandidateLabel](v3, "secureCandidateLabel");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "layer");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "setRasterizationScale:", v48);

    v51 = *MEMORY[0x1E0CD2F78];
    -[TUIPredictionViewCell secureCandidateLabel](v3, "secureCandidateLabel");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "layer");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "setContentsGravity:", v51);

    -[TUIPredictionViewCell maskingScrollView](v3, "maskingScrollView");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIPredictionViewCell secureCandidateLabel](v3, "secureCandidateLabel");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "addSubview:", v55);

    v56 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3E50]), "initReadonlyAndUnselectableWithFrame:textContainer:textLayoutManagerEnabled:", 0, 1, v5, v6, v7, v8);
    -[TUIPredictionViewCell setAnimationsLabelView:](v3, "setAnimationsLabelView:", v56);

    -[TUIPredictionViewCell animationsLabelView](v3, "animationsLabelView");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "setUserInteractionEnabled:", 0);

    -[TUIPredictionViewCell animationsLabelView](v3, "animationsLabelView");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "setAllowsTextAnimations:", 1);

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIPredictionViewCell animationsLabelView](v3, "animationsLabelView");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "setBackgroundColor:", v59);

    -[TUIPredictionViewCell animationsLabelView](v3, "animationsLabelView");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "setTextAlignment:", 1);

    -[TUIPredictionViewCell animationsLabelView](v3, "animationsLabelView");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "setScrollEnabled:", 0);

    -[TUIPredictionViewCell animationsLabelView](v3, "animationsLabelView");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "textLayoutManager");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "setRequiresCTLineRef:", 1);

    -[TUIPredictionViewCell maskingScrollView](v3, "maskingScrollView");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIPredictionViewCell animationsLabelView](v3, "animationsLabelView");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "addSubview:", v66);

    -[TUIPredictionViewCell _updateColorsForRenderConfig:highlighted:](v3, "_updateColorsForRenderConfig:highlighted:", 0, 0);
  }
  return v3;
}

- (UILabel)normalLabel
{
  return self->_normalLabel;
}

- (UIView)secureCandidateLabel
{
  return self->_secureCandidateLabel;
}

- (void)setSecureCandidateLabel:(id)a3
{
  objc_storeStrong((id *)&self->_secureCandidateLabel, a3);
}

- (void)setRightSeparatorView:(id)a3
{
  objc_storeStrong((id *)&self->_rightSeparatorView, a3);
}

- (void)setNormalLabel:(id)a3
{
  objc_storeStrong((id *)&self->_normalLabel, a3);
}

- (void)setMorphingLabel:(id)a3
{
  objc_storeStrong((id *)&self->_morphingLabel, a3);
}

- (void)setMaskingScrollView:(id)a3
{
  objc_storeStrong((id *)&self->_maskingScrollView, a3);
}

- (void)setLeftSeparatorView:(id)a3
{
  objc_storeStrong((id *)&self->_leftSeparatorView, a3);
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (void)setBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundView, a3);
}

- (void)setUseContinuousCornerInHighlight:(BOOL)a3
{
  if (self->_useContinuousCornerInHighlight != a3)
  {
    self->_useContinuousCornerInHighlight = a3;
    -[TUIPredictionViewCell _updateCornerRadius](self, "_updateCornerRadius");
  }
}

- (void)setSeparatorMargin:(double)a3
{
  id v4;

  if (self->_separatorMargin != a3)
  {
    self->_separatorMargin = a3;
    -[TUIPredictionViewCell renderConfig](self, "renderConfig");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[TUIPredictionViewCell _updateColorsForRenderConfig:highlighted:](self, "_updateColorsForRenderConfig:highlighted:", v4, -[TUIPredictionViewCell highlighted](self, "highlighted"));

  }
}

- (BOOL)highlighted
{
  return self->_highlighted;
}

- (void)setSeparatorColor:(id)a3
{
  UIColor *v5;
  void *v6;
  UIColor *v7;

  v5 = (UIColor *)a3;
  if (self->_separatorColor != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_separatorColor, a3);
    -[TUIPredictionViewCell renderConfig](self, "renderConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIPredictionViewCell _updateColorsForRenderConfig:highlighted:](self, "_updateColorsForRenderConfig:highlighted:", v6, -[TUIPredictionViewCell highlighted](self, "highlighted"));

    v5 = v7;
  }

}

- (void)setRenderConfig:(id)a3
{
  UIKBRenderConfig *v5;

  v5 = (UIKBRenderConfig *)a3;
  if (self->_renderConfig != v5)
  {
    objc_storeStrong((id *)&self->_renderConfig, a3);
    -[TUIPredictionViewCell _updateColorsForRenderConfig:highlighted:](self, "_updateColorsForRenderConfig:highlighted:", v5, self->_highlighted);
  }

}

- (void)setLabelFont:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  v11 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0DC3A00], "preferredFontWithSize:", 17.0);
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  -[TUIPredictionViewCell morphingLabel](self, "morphingLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v4);

  if (v11)
  {
    -[TUIPredictionViewCell normalLabel](self, "normalLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setFont:", v11);

    v7 = v11;
  }
  else
  {

    -[TUIPredictionViewCell normalLabel](self, "normalLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFont:", 0);

    objc_msgSend(MEMORY[0x1E0DC3A00], "preferredFontWithSize:", 17.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[TUIPredictionViewCell animationsLabelView](self, "animationsLabelView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFont:", v7);

  v10 = v11;
  if (!v11)
  {

    v10 = 0;
  }

}

- (void)setImage:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[TUIPredictionViewCell imageView](self, "imageView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {

    if (!v4)
    {
      v5 = objc_alloc(MEMORY[0x1E0DC3890]);
      v6 = (void *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      -[TUIPredictionViewCell setImageView:](self, "setImageView:", v6);

      -[TUIPredictionViewCell imageView](self, "imageView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[TUIPredictionViewCell addSubview:](self, "addSubview:", v7);

    }
  }
  else
  {
    objc_msgSend(v4, "removeFromSuperview");

    -[TUIPredictionViewCell setImageView:](self, "setImageView:", 0);
  }
  -[TUIPredictionViewCell imageView](self, "imageView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setImage:", v9);

  -[TUIPredictionViewCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  if (self->_highlighted != a3)
  {
    v3 = a3;
    self->_highlighted = a3;
    -[TUIPredictionViewCell renderConfig](self, "renderConfig");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[TUIPredictionViewCell _updateColorsForRenderConfig:highlighted:](self, "_updateColorsForRenderConfig:highlighted:", v5, v3);

  }
}

- (void)setHighlightMargin:(double)a3
{
  self->_highlightMargin = a3;
}

- (void)setHighlightCornerRadius:(double)a3
{
  if (self->_highlightCornerRadius != a3)
  {
    self->_highlightCornerRadius = a3;
    -[TUIPredictionViewCell _updateCornerRadius](self, "_updateCornerRadius");
  }
}

- (void)setHighlightColor:(id)a3
{
  objc_storeStrong((id *)&self->_highlightColor, a3);
}

- (void)_updateColorsForRenderConfig:(id)a3 highlighted:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  id v19;

  v4 = a4;
  v19 = a3;
  v6 = -[TUIPredictionViewCell _renderConfigUsesDarkStyle:](self, "_renderConfigUsesDarkStyle:", v19);
  -[TUIPredictionViewCell _preferredTextColorForRenderConfig:highlighted:](self, "_preferredTextColorForRenderConfig:highlighted:", v19, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUIPredictionViewCell setTextColor:](self, "setTextColor:", v7);
  -[TUIPredictionViewCell setImageTintColor:](self, "setImageTintColor:", v7);
  if (objc_msgSend((id)objc_opt_class(), "_useSeparatorViews"))
  {
    -[TUIPredictionViewCell separatorColor](self, "separatorColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      UIKeyboardGetLightCandidateSeparatorColor();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.1);
        v9 = objc_claimAutoreleasedReturnValue();

        v8 = (void *)v9;
      }
    }
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
      v10 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v10;
    }
    -[TUIPredictionViewCell leftSeparatorView](self, "leftSeparatorView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setBackgroundColor:", v8);

    -[TUIPredictionViewCell rightSeparatorView](self, "rightSeparatorView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setBackgroundColor:", v8);

  }
  -[TUIPredictionViewCell _preferredBackgroundColor](self, "_preferredBackgroundColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[TUIPredictionViewCell highlightColor](self, "highlightColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      v16 = v14;
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "cellHighlightColorForDarkStyle:", v6);
      v16 = (id)objc_claimAutoreleasedReturnValue();
    }
    v17 = v16;

    v13 = v17;
  }
  -[TUIPredictionViewCell _updateForAnimatedBackdropIfNeeded:highlighted:](self, "_updateForAnimatedBackdropIfNeeded:highlighted:", v19, v4);
  if ((objc_msgSend(v19, "animatedBackground") & 1) == 0)
  {
    -[TUIPredictionViewCell backgroundView](self, "backgroundView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setBackgroundColor:", v13);

  }
}

- (void)setTextColor:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_storeStrong((id *)&self->_textColor, a3);
  v5 = a3;
  -[TUIPredictionViewCell morphingLabel](self, "morphingLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTextColor:", v5);

  -[TUIPredictionViewCell normalLabel](self, "normalLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTextColor:", v5);

  -[TUIPredictionViewCell animationsLabelView](self, "animationsLabelView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTextColor:", v5);

  -[TUIPredictionViewCell imageView](self, "imageView");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTintColor:", v5);

}

- (void)setImageTintColor:(id)a3
{
  UIColor *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  UIColor *imageTintColor;
  UIColor *v10;
  id v11;

  v4 = (UIColor *)a3;
  -[TUIPredictionViewCell imageView](self, "imageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0DC3890]);
    v7 = (void *)objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[TUIPredictionViewCell setImageView:](self, "setImageView:", v7);

    -[TUIPredictionViewCell imageView](self, "imageView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIPredictionViewCell addSubview:](self, "addSubview:", v8);

  }
  imageTintColor = self->_imageTintColor;
  self->_imageTintColor = v4;
  v10 = v4;

  -[TUIPredictionViewCell imageView](self, "imageView");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTintColor:", v10);

}

- (UIColor)separatorColor
{
  return self->_separatorColor;
}

- (BOOL)_renderConfigUsesDarkStyle:(id)a3
{
  if (a3)
    return objc_msgSend(a3, "lightKeyboard") ^ 1;
  else
    return 0;
}

- (id)_preferredTextColorForHighlighted:(BOOL)a3 useDarkStyle:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  uint64_t v16;

  v4 = a4;
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
      goto LABEL_7;
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 0.9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
      goto LABEL_7;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 1.0, 1.0, 1.0, 0.9);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v8;

  v7 = v9;
LABEL_7:
  -[TUIPredictionViewCell preferredForegroundColor](self, "preferredForegroundColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[TUIPredictionViewCell preferredForegroundColor](self, "preferredForegroundColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "alphaComponent");
    v13 = v12;

    -[TUIPredictionViewCell preferredForegroundColor](self, "preferredForegroundColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (!a3)
    {
      objc_msgSend(v14, "colorWithAlphaComponent:", v13 * 0.9);
      v16 = objc_claimAutoreleasedReturnValue();

      v7 = v15;
      v15 = (void *)v16;
    }

    v7 = v15;
  }
  return v7;
}

- (id)_preferredBackgroundColor
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUIPredictionViewCell preferredBackgroundColor](self, "preferredBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[TUIPredictionViewCell preferredBackgroundColor](self, "preferredBackgroundColor");
    v5 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v5;
  }
  return v3;
}

- (UIKBRenderConfig)renderConfig
{
  return self->_renderConfig;
}

- (void)_updateCornerRadius
{
  _BOOL4 v3;
  double v4;
  double v5;
  void *v6;
  id v7;

  v3 = -[TUIPredictionViewCell useContinuousCornerInHighlight](self, "useContinuousCornerInHighlight");
  -[TUIPredictionViewCell highlightCornerRadius](self, "highlightCornerRadius");
  v5 = v4;
  -[TUIPredictionViewCell currentBackgroundView](self, "currentBackgroundView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v3)
    objc_msgSend(v6, "_setContinuousCornerRadius:", v5);
  else
    objc_msgSend(v6, "_setCornerRadius:", v5);

}

- (BOOL)useContinuousCornerInHighlight
{
  return self->_useContinuousCornerInHighlight;
}

- (double)highlightCornerRadius
{
  return self->_highlightCornerRadius;
}

- (BOOL)_useFloatingStyle
{
  return objc_msgSend(MEMORY[0x1E0DC3958], "isFloating");
}

- (id)_preferredTextColorForRenderConfig:(id)a3 highlighted:(BOOL)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  uint64_t v10;
  double v11;
  uint64_t v12;

  v6 = a3;
  if (-[TUIPredictionViewCell _renderConfigUsesDarkStyle:](self, "_renderConfigUsesDarkStyle:", v6))
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "animatedBackground");

  if ((v8 & 1) == 0)
  {
    -[TUIPredictionViewCell preferredForegroundColor](self, "preferredForegroundColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[TUIPredictionViewCell preferredForegroundColor](self, "preferredForegroundColor");
      v10 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v10;
    }
    objc_msgSend(v7, "alphaComponent");
    if (!a4)
    {
      objc_msgSend(v7, "colorWithAlphaComponent:", v11 * 0.9);
      v12 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v12;
    }
  }
  return v7;
}

- (BOOL)_isTextEffectsCandidate:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  objc_opt_class();
  v4 = (objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v3, "candidateProperty") == 4;

  return v4;
}

- (BOOL)_isSmartReplyCandidate:(id)a3
{
  id v3;
  int v4;
  void *v5;

  v3 = a3;
  if ((objc_msgSend(v3, "candidateProperty") & 2) != 0)
  {
    objc_msgSend(v3, "candidate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "_containsEmoji") ^ 1;

  }
  else
  {
    LOBYTE(v4) = 0;
  }

  return v4;
}

- (BOOL)_isWritingToolsCandidate:(id)a3
{
  return ((unint64_t)objc_msgSend(a3, "customInfoType") >> 16) & 1;
}

- (id)currentTextSuggestion
{
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;

  -[TUIPredictionViewCell candidate](self, "candidate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[TUIPredictionViewCell candidate](self, "candidate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "textSuggestion");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (BOOL)useAutofillStyle
{
  void *v3;
  uint64_t v4;
  BOOL v5;
  void *v6;
  void *v7;
  char v8;

  -[TUIPredictionViewCell candidate](self, "candidate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "customInfoType") & 0x18;
  v5 = v4 != 0;

  -[TUIPredictionViewCell currentTextSuggestion](self, "currentTextSuggestion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[TUIPredictionViewCell currentTextSuggestion](self, "currentTextSuggestion");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "displayStylePlain");
    if (v4)
      v5 = 1;
    else
      v5 = v8;

  }
  return v5;
}

- (BOOL)useWritingToolsStyle
{
  TUIPredictionViewCell *v2;
  void *v3;

  v2 = self;
  -[TUIPredictionViewCell candidate](self, "candidate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = -[TUIPredictionViewCell _isWritingToolsCandidate:](v2, "_isWritingToolsCandidate:", v3);

  return (char)v2;
}

- (id)displayTextAttributesForMultiline:(BOOL)a3 header:(BOOL)a4 shrink:(BOOL)a5
{
  double v8;
  BOOL v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v21[2];
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  if (!-[TUIPredictionViewCell useWritingToolsStyle](self, "useWritingToolsStyle", a3, a4, a5)
    || (v9 = -[TUIPredictionViewCell _usePadStyle](self, "_usePadStyle"), v8 = 17.0, !v9))
  {
    if (a3 || (v10 = -[TUIPredictionViewCell _usePadStyle](self, "_usePadStyle", v8), v8 = 16.0, v10))
      v8 = 14.0;
  }
  objc_msgSend(MEMORY[0x1E0DC37E8], "systemFontOfSize:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!a3 && !a4)
  {
    objc_msgSend(MEMORY[0x1E0DC37F8], "defaultMetrics");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "scaledFontForFont:", v11);
    v13 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v13;
  }
  v14 = (void *)MEMORY[0x1E0C99E08];
  v15 = *MEMORY[0x1E0DC32A0];
  v22[0] = v11;
  v16 = *MEMORY[0x1E0DC32A8];
  v21[0] = v15;
  v21[1] = v16;
  -[TUIPredictionViewCell textColor](self, "textColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "dictionaryWithDictionary:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)headerTextAttributes
{
  double v3;
  double v4;
  _BOOL4 v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v3 = 12.0;
  if (-[TUIPredictionViewCell _usePadStyle](self, "_usePadStyle"))
    v4 = 11.0;
  else
    v4 = 12.0;
  if (!-[TUIPredictionViewCell _usePadStyle](self, "_usePadStyle"))
    v3 = 14.0;
  v5 = -[TUIPredictionViewCell useAutofillStyle](self, "useAutofillStyle");
  v11[0] = *MEMORY[0x1E0DC32A0];
  if (v5)
    v6 = v3;
  else
    v6 = v4;
  objc_msgSend(MEMORY[0x1E0DC37E8], "systemFontOfSize:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  v11[1] = *MEMORY[0x1E0DC32A8];
  -[TUIPredictionViewCell textColor](self, "textColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)candidateRequiresTruncationForBoundingWidth:(double)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;

  -[TUIPredictionViewCell currentTextSuggestion](self, "currentTextSuggestion");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    -[TUIPredictionViewCell currentTextSuggestion](self, "currentTextSuggestion");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "headerText");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "length");

    if (v9)
    {
      -[TUIPredictionViewCell currentTextSuggestion](self, "currentTextSuggestion");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        -[TUIPredictionViewCell currentTextSuggestion](self, "currentTextSuggestion");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "headerText");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[TUIPredictionViewCell headerTextAttributes](self, "headerTextAttributes");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "sizeWithAttributes:", v13);
        v15 = v14;

      }
      else
      {
        v15 = *MEMORY[0x1E0C9D820];
      }
      -[TUIPredictionViewCell candidate](self, "candidate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "label");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "containsString:", CFSTR("\n"));

      -[TUIPredictionViewCell candidate](self, "candidate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "label");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[TUIPredictionViewCell displayTextAttributesForMultiline:header:shrink:](self, "displayTextAttributesForMultiline:header:shrink:", v18, 1, -[TUIPredictionViewCell candidateRequiresShrinkingForBoundingWidth:](self, "candidateRequiresShrinkingForBoundingWidth:", a3));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "sizeWithAttributes:", v21);
      v23 = v22;

      LOBYTE(v5) = v23 > a3 || v15 > a3;
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (BOOL)candidateRequiresShrinkingForBoundingWidth:(double)a3
{
  return 0;
}

- (id)centerTruncatedStringForString:(id)a3 withAttributes:(id)a4 fittingWidth:(double)a5
{
  id v8;
  id v9;

  v8 = a3;
  objc_msgSend(v8, "tui_centerTruncatedStringWithAttributes:fittingWidth:", a4, a5);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[TUIPredictionViewCell setLabelTruncated:](self, "setLabelTruncated:", v9 != v8);
  return v9;
}

- (id)attributedStringRepresentationOfCandidate:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  _BOOL8 v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;

  v4 = a3;
  -[TUIPredictionViewCell bounds](self, "bounds");
  v6 = v5 + -6.0;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:attributes:", &stru_1E24FC6C0, 0);
  -[TUIPredictionViewCell currentTextSuggestion](self, "currentTextSuggestion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "headerText");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "length");
  if (v10)
  {
    -[TUIPredictionViewCell headerTextAttributes](self, "headerTextAttributes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[TUIPredictionViewCell candidateRequiresTruncationForBoundingWidth:](self, "candidateRequiresTruncationForBoundingWidth:", v6))
    {
      -[TUIPredictionViewCell centerTruncatedStringForString:withAttributes:fittingWidth:](self, "centerTruncatedStringForString:withAttributes:fittingWidth:", v9, v11, v6);
      v12 = objc_claimAutoreleasedReturnValue();

      v9 = (void *)v12;
    }
    objc_msgSend(v9, "stringByAppendingString:", CFSTR("\n"));
    v13 = objc_claimAutoreleasedReturnValue();

    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v13, v11);
    objc_msgSend(v7, "appendAttributedString:", v14);

    v9 = (void *)v13;
  }
  v15 = v10 != 0;
  -[TUIPredictionViewCell _displayLabelForCandidate:](self, "_displayLabelForCandidate:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUIPredictionViewCell displayTextAttributesForMultiline:header:shrink:](self, "displayTextAttributesForMultiline:header:shrink:", objc_msgSend(v16, "containsString:", CFSTR("\n")), v15, -[TUIPredictionViewCell candidateRequiresShrinkingForBoundingWidth:](self, "candidateRequiresShrinkingForBoundingWidth:", v6));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[TUIPredictionViewCell candidateRequiresTruncationForBoundingWidth:](self, "candidateRequiresTruncationForBoundingWidth:", v6))
  {
    -[TUIPredictionViewCell centerTruncatedStringForString:withAttributes:fittingWidth:](self, "centerTruncatedStringForString:withAttributes:fittingWidth:", v16, v17, v6);
    v18 = objc_claimAutoreleasedReturnValue();

    v16 = (void *)v18;
  }
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v16, v17);
  objc_msgSend(v7, "appendAttributedString:", v19);

  return v7;
}

- (CGSize)intrinsicContentSize
{
  double v3;
  void *v4;
  uint64_t v5;
  double v6;
  void *v7;
  BOOL v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  CGSize result;

  v3 = *MEMORY[0x1E0DC55F0];
  -[TUIPredictionViewCell candidate](self, "candidate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "customInfoType");

  if (v5 != 0x8000)
  {
    -[TUIPredictionViewCell candidate](self, "candidate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "customInfoType") == 0x10000)
    {
      v8 = -[TUIPredictionViewCell _useFloatingStyle](self, "_useFloatingStyle");

      if (v8)
      {
        *(double *)&v9 = 48.0;
LABEL_17:
        v6 = *(double *)&v9;
        goto LABEL_18;
      }
    }
    else
    {

    }
    -[TUIPredictionViewCell candidate](self, "candidate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIPredictionViewCell _displayLabelForCandidate:](self, "_displayLabelForCandidate:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "length"))
    {

    }
    else
    {
      -[TUIPredictionViewCell image](self, "image");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        -[TUIPredictionViewCell image](self, "image");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "size");
        v6 = v16 + 40.0;
        goto LABEL_15;
      }
    }
    -[TUIPredictionViewCell customView](self, "customView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      *(double *)&v9 = 120.0;
      goto LABEL_17;
    }
    -[TUIPredictionViewCell customView](self, "customView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "intrinsicContentSize");
    v6 = v14;
LABEL_15:

    goto LABEL_18;
  }
  if (-[TUIPredictionViewCell _usePadStyle](self, "_usePadStyle"))
    v6 = 62.0;
  else
    v6 = 48.0;
LABEL_18:
  v17 = v6;
  v18 = v3;
  result.height = v18;
  result.width = v17;
  return result;
}

- (void)setPreferredForegroundColor:(id)a3
{
  UIColor *v5;
  UIColor *preferredForegroundColor;
  char v7;
  void *v8;
  _BOOL8 v9;
  void *v10;
  UIColor *v11;

  v5 = (UIColor *)a3;
  preferredForegroundColor = self->_preferredForegroundColor;
  if (preferredForegroundColor != v5)
  {
    v11 = v5;
    v7 = -[UIColor isEqual:](preferredForegroundColor, "isEqual:", v5);
    v5 = v11;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_preferredForegroundColor, a3);
      -[TUIPredictionViewCell renderConfig](self, "renderConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[TUIPredictionViewCell _renderConfigUsesDarkStyle:](self, "_renderConfigUsesDarkStyle:", v8);

      if (v11)
      {
        -[TUIPredictionViewCell setTextColor:](self, "setTextColor:", v11);
      }
      else
      {
        -[TUIPredictionViewCell _preferredTextColorForHighlighted:useDarkStyle:](self, "_preferredTextColorForHighlighted:useDarkStyle:", 0, v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[TUIPredictionViewCell setTextColor:](self, "setTextColor:", v10);

      }
      v5 = v11;
    }
  }

}

- (void)setPreferredBackgroundColor:(id)a3
{
  UIColor *v5;
  UIColor *preferredBackgroundColor;
  char v7;
  void *v8;
  void *v9;
  UIColor *v10;

  v5 = (UIColor *)a3;
  preferredBackgroundColor = self->_preferredBackgroundColor;
  if (preferredBackgroundColor != v5)
  {
    v10 = v5;
    v7 = -[UIColor isEqual:](preferredBackgroundColor, "isEqual:");
    v5 = v10;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_preferredBackgroundColor, a3);
      v8 = v10;
      if (!v10)
      {
        -[TUIPredictionViewCell _preferredBackgroundColor](self, "_preferredBackgroundColor");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
      }
      -[TUIPredictionViewCell currentBackgroundView](self, "currentBackgroundView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setBackgroundColor:", v8);

      v5 = v10;
      if (!v10)
      {

        v5 = 0;
      }
    }
  }

}

- (UIFont)labelFont
{
  void *v2;
  void *v3;

  -[TUIPredictionViewCell morphingLabel](self, "morphingLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "font");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIFont *)v3;
}

- (void)_setNormalLabelWithCandidate:(id)a3 animated:(BOOL)a4
{
  void *v5;
  void *v6;
  id v7;

  -[TUIPredictionViewCell attributedStringRepresentationOfCandidate:](self, "attributedStringRepresentationOfCandidate:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUIPredictionViewCell normalLabel](self, "normalLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAttributedText:", v5);

  -[TUIPredictionViewCell normalLabel](self, "normalLabel");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHidden:", 0);

}

- (void)_setMorphingLabelWithCandidate:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  TUIPredictionViewCell *v16;
  id v17;

  v4 = a4;
  v6 = a3;
  if (v4)
  {
    v7 = (void *)MEMORY[0x1E0DC3F10];
    if (PredictionViewAnimationFrameRateOptions_onceToken != -1)
      dispatch_once(&PredictionViewAnimationFrameRateOptions_onceToken, &__block_literal_global_427);
    v8 = PredictionViewAnimationFrameRateOptions_frameRateOptions;
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __65__TUIPredictionViewCell__setMorphingLabelWithCandidate_animated___block_invoke;
    v15 = &unk_1E24FC1F8;
    v16 = self;
    v17 = v6;
    objc_msgSend(v7, "animateWithDuration:delay:options:animations:completion:", v8, &v12, 0, 0.0, 0.0);

  }
  else
  {
    -[TUIPredictionViewCell _displayLabelForCandidate:](self, "_displayLabelForCandidate:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIPredictionViewCell morphingLabel](self, "morphingLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setText:", v9);

  }
  -[TUIPredictionViewCell morphingLabel](self, "morphingLabel", v12, v13, v14, v15, v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setHidden:", 0);

  if (objc_msgSend(v6, "customInfoType") == 0x8000)
    -[TUIPredictionViewCell setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", CFSTR("Text Effects Button"));

}

- (void)_setSecureCandidate:(id)a3 animated:(BOOL)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0CD2720], "objectForSlot:", objc_msgSend(a3, "slotID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUIPredictionViewCell secureCandidateLabel](self, "secureCandidateLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setContents:", v5);

  -[TUIPredictionViewCell secureCandidateLabel](self, "secureCandidateLabel");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setHidden:", 0);

}

- (id)_localizedTitleForAnimationName:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(&unk_1E25179D0, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "localizedStringInDeviceLanguageForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_setTextEffectsCandidate:(id)a3 animated:(BOOL)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD v37[2];
  _QWORD v38[3];

  v38[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[TUIPredictionViewCell animationsLabelView](self, "animationsLabelView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHidden:", 0);

  objc_msgSend(v5, "textEffectName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUIPredictionViewCell _localizedTitleForAnimationName:](self, "_localizedTitleForAnimationName:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v5, "candidate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("%@\n%@"), v10, v8);
  v11 = objc_claimAutoreleasedReturnValue();

  v34 = (void *)v11;
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v11);
  v13 = objc_msgSend(v12, "length");
  objc_msgSend(v5, "candidate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v14, "length") + 1;
  v35 = v8;
  v15 = objc_msgSend(v8, "length");

  objc_msgSend(MEMORY[0x1E0DC3A00], "preferredFontWithSize:", 17.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "fontDescriptor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_alloc_init(MEMORY[0x1E0DC33B0]);
  objc_msgSend(v17, "setAlignment:", 1);
  objc_msgSend(v12, "addAttribute:value:range:", *MEMORY[0x1E0DC32C0], v17, 0, v13);
  v18 = *MEMORY[0x1E0DC32A0];
  objc_msgSend(v12, "addAttribute:value:range:", *MEMORY[0x1E0DC32A0], v16, 0, v13);
  v19 = *MEMORY[0x1E0DC32A8];
  -[TUIPredictionViewCell textColor](self, "textColor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addAttribute:value:range:", v19, v20, 0, v13);

  objc_msgSend(MEMORY[0x1E0DC37E8], "systemFontOfSize:", 11.0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)MEMORY[0x1E0C99E08];
  v37[1] = v19;
  v38[0] = v21;
  v37[0] = v18;
  objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v38[1] = v23;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 2);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "dictionaryWithDictionary:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "addAttributes:range:", v25, v33, v15);
  v26 = (void *)MEMORY[0x1E0D1F280];
  objc_msgSend(v5, "textEffectName");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v26, "textEffectTypeForAnimationName:", v27);

  if ((unint64_t)(v28 - 1) >= 8)
  {
    if ((unint64_t)(v28 - 9) < 4)
      -[TUIPredictionViewCell _applyTextEffectStyleAttribute:attributedCandidateString:fontDescriptor:](self, "_applyTextEffectStyleAttribute:attributedCandidateString:fontDescriptor:", v5, v12, v36);
  }
  else
  {
    -[TUIPredictionViewCell _applyTextEffectAnimationAttribute:attributedCandidateString:](self, "_applyTextEffectAnimationAttribute:attributedCandidateString:", v5, v12);
  }
  v29 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v5, "candidate");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "textEffectName");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "stringWithFormat:", CFSTR("%@-TextEffect(%@)"), v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUIPredictionViewCell setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", v32);

}

- (void)_applyTextEffectStyleAttribute:(id)a3 attributedCandidateString:(id)a4 fontDescriptor:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  _QWORD *v22;
  void *v23;
  int v24;
  void *v25;
  id v26;

  v26 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v26, "candidate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "length");

  objc_msgSend(v26, "textEffectName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("bold"));

  if (v13)
  {
    v14 = v9;
    v15 = 2;
  }
  else
  {
    objc_msgSend(v26, "textEffectName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("italic"));

    if (!v17)
    {
      objc_msgSend(v26, "textEffectName");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "isEqualToString:", CFSTR("underline"));

      if (v21)
      {
        v22 = (_QWORD *)MEMORY[0x1E0DC3320];
      }
      else
      {
        objc_msgSend(v26, "textEffectName");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "isEqualToString:", CFSTR("strikeThrough"));

        if (!v24)
          goto LABEL_11;
        v22 = (_QWORD *)MEMORY[0x1E0DC32D0];
      }
      objc_msgSend(v8, "addAttribute:value:range:", *v22, &unk_1E2517398, 0, v11);
      goto LABEL_11;
    }
    v14 = v9;
    v15 = 1;
  }
  objc_msgSend(v14, "fontDescriptorWithSymbolicTraits:", v15);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC37E8], "fontWithDescriptor:size:", v18, 17.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addAttribute:value:range:", *MEMORY[0x1E0DC32A0], v19, 0, v11);

LABEL_11:
  -[TUIPredictionViewCell animationsLabelView](self, "animationsLabelView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setAttributedText:", v8);

}

- (void)_applyTextEffectAnimationAttribute:(id)a3 attributedCandidateString:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _NSTextAnimator **p_activeAnimator;
  id WeakRetained;
  id v17;
  id v18;

  v18 = a4;
  v6 = a3;
  objc_msgSend(v6, "candidate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");

  v9 = (void *)MEMORY[0x1E0DC4458];
  objc_msgSend(v6, "textEffectName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "animationWithName:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v18, "addAttribute:value:range:", *MEMORY[0x1E0DC3310], v11, 0, v8);
    -[TUIPredictionViewCell animationsLabelView](self, "animationsLabelView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAttributedText:", v18);

    -[TUIPredictionViewCell animationsLabelView](self, "animationsLabelView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_animatorForTextAnimation:notify:", v11, &__block_literal_global_6230);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    p_activeAnimator = &self->_activeAnimator;
    objc_storeWeak((id *)p_activeAnimator, v14);

    WeakRetained = objc_loadWeakRetained((id *)p_activeAnimator);
    if (WeakRetained)
    {
      v17 = objc_loadWeakRetained((id *)p_activeAnimator);
      objc_msgSend(v17, "start");

    }
  }

}

- (void)_setSmartReplyCandidate:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;

  v4 = a4;
  -[TUIPredictionViewCell _setMorphingLabelWithCandidate:animated:](self, "_setMorphingLabelWithCandidate:animated:", a3);
  -[TUIPredictionViewCell setLightingEffectEnabled:](self, "setLightingEffectEnabled:", v4);
  -[TUIPredictionViewCell setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", CFSTR("SmartReply"));
}

- (void)endAnimations
{
  _NSTextAnimator **p_activeAnimator;
  id WeakRetained;

  p_activeAnimator = &self->_activeAnimator;
  WeakRetained = objc_loadWeakRetained((id *)&self->_activeAnimator);
  objc_msgSend(WeakRetained, "invalidate");

  objc_storeWeak((id *)p_activeAnimator, 0);
}

- (void)setCandidate:(id)a3
{
  -[TUIPredictionViewCell setCandidate:animated:](self, "setCandidate:animated:", a3, 0);
}

- (void)setCustomView:(id)a3
{
  id v5;
  void *v6;
  UIView *v7;
  id v8;

  v8 = a3;
  -[TUIPredictionViewCell customView](self, "customView");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v6 = v8;
  if (v5 != v8)
  {
    v7 = self->_customView;
    objc_storeStrong((id *)&self->_customView, a3);
    -[UIView removeFromSuperview](v7, "removeFromSuperview");
    if (v8)
    {
      -[TUIPredictionViewCell addSubview:](self, "addSubview:", v8);
      -[TUIPredictionViewCell setNeedsLayout](self, "setNeedsLayout");
    }

    v6 = v8;
  }

}

- (id)labelView
{
  void *v3;
  void *v4;

  -[TUIPredictionViewCell candidate](self, "candidate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUIPredictionViewCell labelViewForCandidate:](self, "labelViewForCandidate:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_updateForAnimatedBackdropIfNeeded:(id)a3 highlighted:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL8 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  double v39;
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
  void *v54;
  void *v55;
  id v56;

  v4 = a4;
  v56 = a3;
  if (objc_msgSend(v56, "animatedBackground"))
  {
    v6 = -[TUIPredictionViewCell _renderConfigUsesDarkStyle:](self, "_renderConfigUsesDarkStyle:", v56);
    -[TUIPredictionViewCell layer](self, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAllowsGroupOpacity:", 0);

    -[TUIPredictionViewCell layer](self, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAllowsGroupBlending:", 0);

    -[TUIPredictionViewCell maskingScrollView](self, "maskingScrollView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAllowsGroupOpacity:", 0);

    -[TUIPredictionViewCell maskingScrollView](self, "maskingScrollView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAllowsGroupBlending:", 0);

    -[TUIPredictionViewCell labelView](self, "labelView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIPredictionViewCell _updateViewForAnimatedBackdrop:usingAlpha:darkConfiguration:](self, "_updateViewForAnimatedBackdrop:usingAlpha:darkConfiguration:", v13, v6, 0.6);

    -[TUIPredictionViewCell morphingLabel](self, "morphingLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setAllowsGroupOpacity:", 0);

    -[TUIPredictionViewCell morphingLabel](self, "morphingLabel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "layer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setAllowsGroupBlending:", 0);

    -[TUIPredictionViewCell rightSeparatorView](self, "rightSeparatorView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIPredictionViewCell _updateViewForAnimatedBackdrop:usingAlpha:darkConfiguration:](self, "_updateViewForAnimatedBackdrop:usingAlpha:darkConfiguration:", v18, v6, 1.0);

    -[TUIPredictionViewCell leftSeparatorView](self, "leftSeparatorView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIPredictionViewCell _updateViewForAnimatedBackdrop:usingAlpha:darkConfiguration:](self, "_updateViewForAnimatedBackdrop:usingAlpha:darkConfiguration:", v19, v6, 1.0);

    -[TUIPredictionViewCell vibrantBackgroundView](self, "vibrantBackgroundView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v20)
    {
      v21 = objc_alloc(MEMORY[0x1E0DC3928]);
      v22 = (void *)objc_msgSend(v21, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      -[TUIPredictionViewCell setVibrantBackgroundView:](self, "setVibrantBackgroundView:", v22);

      -[TUIPredictionViewCell vibrantBackgroundView](self, "vibrantBackgroundView");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "layer");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setCornerRadius:", 5.0);

      -[TUIPredictionViewCell vibrantBackgroundView](self, "vibrantBackgroundView");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "layer");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setMasksToBounds:", 1);

      -[TUIPredictionViewCell vibrantBackgroundView](self, "vibrantBackgroundView");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setHidden:", 1);

      -[TUIPredictionViewCell vibrantBackgroundView](self, "vibrantBackgroundView");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[TUIPredictionViewCell maskingScrollView](self, "maskingScrollView");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[TUIPredictionViewCell insertSubview:belowSubview:](self, "insertSubview:belowSubview:", v28, v29);

      -[TUIPredictionViewCell vibrantBackgroundView](self, "vibrantBackgroundView");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "transitionToStyle:", 3905);

    }
    -[TUIPredictionViewCell vibrantBackgroundView](self, "vibrantBackgroundView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v31;
    if (v4)
    {
      objc_msgSend(v31, "setHidden:", 0);

      objc_msgSend((id)objc_opt_class(), "cellHighlightColorForRenderConfig:", v56);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "colorWithAlphaComponent:", 0.75);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[TUIPredictionViewCell vibrantBackgroundView](self, "vibrantBackgroundView");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setBackgroundColor:", v34);

      objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2EA0]);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[TUIPredictionViewCell vibrantBackgroundView](self, "vibrantBackgroundView");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "layer");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "setCompositingFilter:", v36);

      if (v6)
        v39 = 1.0;
      else
        v39 = 0.15;
      -[TUIPredictionViewCell vibrantBackgroundView](self, "vibrantBackgroundView");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "setAlpha:", v39);

    }
    else
    {
      objc_msgSend(v31, "setHidden:", 1);

    }
  }
  else
  {
    -[TUIPredictionViewCell vibrantBackgroundView](self, "vibrantBackgroundView");
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    if (v41)
    {
      -[TUIPredictionViewCell layer](self, "layer");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "setAllowsGroupOpacity:", 1);

      -[TUIPredictionViewCell layer](self, "layer");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "setAllowsGroupBlending:", 1);

      -[TUIPredictionViewCell maskingScrollView](self, "maskingScrollView");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "layer");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "setAllowsGroupOpacity:", 1);

      -[TUIPredictionViewCell maskingScrollView](self, "maskingScrollView");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "layer");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "setAllowsGroupBlending:", 1);

      -[TUIPredictionViewCell morphingLabel](self, "morphingLabel");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      -[TUIPredictionViewCell _resetViewForUnanimatedBackdrop:](self, "_resetViewForUnanimatedBackdrop:", v48);

      -[TUIPredictionViewCell animationsLabelView](self, "animationsLabelView");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      -[TUIPredictionViewCell _resetViewForUnanimatedBackdrop:](self, "_resetViewForUnanimatedBackdrop:", v49);

      -[TUIPredictionViewCell normalLabel](self, "normalLabel");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      -[TUIPredictionViewCell _resetViewForUnanimatedBackdrop:](self, "_resetViewForUnanimatedBackdrop:", v50);

      -[TUIPredictionViewCell secureCandidateLabel](self, "secureCandidateLabel");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      -[TUIPredictionViewCell _resetViewForUnanimatedBackdrop:](self, "_resetViewForUnanimatedBackdrop:", v51);

      -[TUIPredictionViewCell rightSeparatorView](self, "rightSeparatorView");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      -[TUIPredictionViewCell _resetViewForUnanimatedBackdrop:](self, "_resetViewForUnanimatedBackdrop:", v52);

      -[TUIPredictionViewCell leftSeparatorView](self, "leftSeparatorView");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      -[TUIPredictionViewCell _resetViewForUnanimatedBackdrop:](self, "_resetViewForUnanimatedBackdrop:", v53);

      -[TUIPredictionViewCell vibrantBackgroundView](self, "vibrantBackgroundView");
      v54 = (void *)objc_claimAutoreleasedReturnValue();

      if (v54)
      {
        -[TUIPredictionViewCell vibrantBackgroundView](self, "vibrantBackgroundView");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "removeFromSuperview");

        -[TUIPredictionViewCell setVibrantBackgroundView:](self, "setVibrantBackgroundView:", 0);
      }
    }
  }

}

- (void)_updateViewForAnimatedBackdrop:(id)a3 usingAlpha:(double)a4 darkConfiguration:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  _QWORD *v8;
  void *v9;
  void *v10;
  id v11;

  v5 = a5;
  v7 = a3;
  objc_msgSend(v7, "setAlpha:", a4);
  v8 = (_QWORD *)MEMORY[0x1E0CD2E98];
  if (v5)
    v8 = (_QWORD *)MEMORY[0x1E0CD2EA0];
  objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setCompositingFilter:", v9);

  objc_msgSend(v7, "layer");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setAllowsEdgeAntialiasing:", 1);
}

- (void)_resetViewForUnanimatedBackdrop:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  objc_msgSend(v3, "setAlpha:", 1.0);
  objc_msgSend(v3, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCompositingFilter:", 0);

  objc_msgSend(v3, "layer");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setAllowsEdgeAntialiasing:", 0);
}

- (id)currentBackgroundView
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[TUIPredictionViewCell vibrantBackgroundView](self, "vibrantBackgroundView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[TUIPredictionViewCell backgroundView](self, "backgroundView");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (void)setLightingEffectEnabled:(BOOL)a3
{
  double v4;
  void *v5;
  int v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[5];

  if (a3)
  {
    v4 = (float)((float)-[TUIPredictionViewCell predictionPosition](self, "predictionPosition") * 0.625);
    -[TUIPredictionViewCell smartReplyLightEffects](self, "smartReplyLightEffects");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      v6 = objc_msgSend((id)objc_opt_class(), "instancesRespondToSelector:", sel_initWithColorPalette_);
      v7 = objc_alloc(MEMORY[0x1E0DC40F0]);
      if (v6)
      {
        objc_msgSend(MEMORY[0x1E0DC40A0], "intelligenceAmbientPalette");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v7, "initWithColorPalette:", v8);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0DC40F8], "replaceBuildIn");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v7, "initWithPalette:", v8);
      }
      v11 = (void *)v9;

      objc_msgSend(v11, "setDirection:", 3);
      objc_msgSend(v11, "setDuration:", 2.0);
      objc_msgSend(MEMORY[0x1E0DC4228], "directionalLightWithConfiguration:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC4210]), "initWithLightSource:", v12);
      -[TUIPredictionViewCell setSmartReplyLightEffects:](self, "setSmartReplyLightEffects:", v13);

    }
    -[TUIPredictionViewCell smartReplyLightEffects](self, "smartReplyLightEffects");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIPredictionViewCell lightEffectsContainer](self, "lightEffectsContainer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setEffect:", v14);

    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __50__TUIPredictionViewCell_setLightingEffectEnabled___block_invoke;
    v17[3] = &unk_1E24FC068;
    v17[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 0x10000, v17, 0, 0.5, v4 + 2.0);
  }
  else
  {
    -[TUIPredictionViewCell lightEffectsContainer](self, "lightEffectsContainer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_removeAllAnimations:", 1);

    -[TUIPredictionViewCell lightEffectsContainer](self, "lightEffectsContainer");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setEffect:", 0);

  }
}

- (void)scrollViewDidScroll:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  void *v27;
  id v28;

  v28 = a3;
  -[TUIPredictionViewCell bounds](self, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  if (objc_msgSend(v28, "isScrollEnabled"))
  {
    -[TUIPredictionViewCell maskingScrollView](self, "maskingScrollView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "frame");
    v14 = v13;
    v16 = v15;
    -[TUIPredictionViewCell maskingScrollView](self, "maskingScrollView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "contentInset");
    v9 = v14 - (v18 + v19);
    v11 = v16 - (v20 + v21);

    objc_msgSend(v28, "contentOffset");
    v23 = v22;
    v7 = v24;
    -[TUIPredictionViewCell maskingScrollView](self, "maskingScrollView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "contentInset");
    v5 = v23 + v26;

  }
  -[TUIPredictionViewCell morphingLabel](self, "morphingLabel");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setVisibleRect:", v5, v7, v9, v11);

}

- (UIView)customView
{
  return self->_customView;
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (UIColor)imageTintColor
{
  return self->_imageTintColor;
}

- (UIColor)highlightColor
{
  return self->_highlightColor;
}

- (UIColor)preferredForegroundColor
{
  return self->_preferredForegroundColor;
}

- (UIColor)preferredBackgroundColor
{
  return self->_preferredBackgroundColor;
}

- (BOOL)shouldShowScalingAnimation
{
  return self->_shouldShowScalingAnimation;
}

- (void)setShouldShowScalingAnimation:(BOOL)a3
{
  self->_shouldShowScalingAnimation = a3;
}

- (unint64_t)predictionPosition
{
  return self->_predictionPosition;
}

- (void)setPredictionPosition:(unint64_t)a3
{
  self->_predictionPosition = a3;
}

- (UIKBVisualEffectView)vibrantBackgroundView
{
  return self->_vibrantBackgroundView;
}

- (void)setVibrantBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_vibrantBackgroundView, a3);
}

- (UIColor)backgroundViewHighlightColor
{
  return self->_backgroundViewHighlightColor;
}

- (void)setBackgroundViewHighlightColor:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundViewHighlightColor, a3);
}

- (BOOL)isLabelTruncated
{
  return self->_labelTruncated;
}

- (UITextView)animationsLabelView
{
  return self->_animationsLabelView;
}

- (void)setAnimationsLabelView:(id)a3
{
  objc_storeStrong((id *)&self->_animationsLabelView, a3);
}

- (_NSTextAnimator)activeAnimator
{
  return (_NSTextAnimator *)objc_loadWeakRetained((id *)&self->_activeAnimator);
}

- (void)setActiveAnimator:(id)a3
{
  objc_storeWeak((id *)&self->_activeAnimator, a3);
}

- (UIVisualEffectView)lightEffectsContainer
{
  return self->_lightEffectsContainer;
}

- (void)setLightEffectsContainer:(id)a3
{
  objc_storeStrong((id *)&self->_lightEffectsContainer, a3);
}

- (_UIIntelligenceContentLightEffect)smartReplyLightEffects
{
  return self->_smartReplyLightEffects;
}

- (void)setSmartReplyLightEffects:(id)a3
{
  objc_storeStrong((id *)&self->_smartReplyLightEffects, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_smartReplyLightEffects, 0);
  objc_storeStrong((id *)&self->_lightEffectsContainer, 0);
  objc_destroyWeak((id *)&self->_activeAnimator);
  objc_storeStrong((id *)&self->_animationsLabelView, 0);
  objc_storeStrong((id *)&self->_secureCandidateLabel, 0);
  objc_storeStrong((id *)&self->_morphingLabel, 0);
  objc_storeStrong((id *)&self->_normalLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_rightSeparatorView, 0);
  objc_storeStrong((id *)&self->_leftSeparatorView, 0);
  objc_storeStrong((id *)&self->_backgroundViewHighlightColor, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_vibrantBackgroundView, 0);
  objc_storeStrong((id *)&self->_preferredBackgroundColor, 0);
  objc_storeStrong((id *)&self->_preferredForegroundColor, 0);
  objc_storeStrong((id *)&self->_highlightColor, 0);
  objc_storeStrong((id *)&self->_separatorColor, 0);
  objc_storeStrong((id *)&self->_imageTintColor, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_maskingScrollView, 0);
  objc_storeStrong((id *)&self->_renderConfig, 0);
  objc_storeStrong((id *)&self->_customView, 0);
  objc_storeStrong((id *)&self->_candidate, 0);
}

void __50__TUIPredictionViewCell_setLightingEffectEnabled___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "lightEffectsContainer");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setEffect:", 0);

}

void __86__TUIPredictionViewCell__applyTextEffectAnimationAttribute_attributedCandidateString___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (objc_msgSend(v2, "state") == 1)
    objc_msgSend(v2, "start");

}

void __65__TUIPredictionViewCell__setMorphingLabelWithCandidate_animated___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_displayLabelForCandidate:", *(_QWORD *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "morphingLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setText:", v3);

}

+ (id)cellHighlightColorForDarkStyle:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;

  v3 = a3;
  UIKeyboardGetLightCandidateHighlightColor();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "userInterfaceIdiom");

    if ((v6 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    {
      v7 = 0.337254902;
      v8 = 0.329411765;
      v9 = 0.333333333;
      v10 = 1.0;
    }
    else
    {
      v7 = 0.450980392;
      v10 = 1.0;
      v8 = 0.450980392;
      v9 = 0.450980392;
    }
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", v7, v8, v9, v10);
    v11 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v11;
  }
  return v4;
}

+ (id)cellHighlightColorForRenderConfig:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a3;
  if (objc_msgSend(v3, "animatedBackground"))
  {
    if ((objc_msgSend(v3, "lightKeyboard") & 1) != 0)
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    else
      objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "cellHighlightColorForDarkStyle:", objc_msgSend(v3, "lightKeyboard") ^ 1);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)v4;

  return v5;
}

@end
