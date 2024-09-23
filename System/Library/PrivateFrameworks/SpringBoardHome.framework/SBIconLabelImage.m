@implementation SBIconLabelImage

- (BOOL)hasBaseline
{
  return 1;
}

- (double)baselineOffsetFromBottom
{
  return self->_baselineOffsetFromBottom;
}

- (UIEdgeInsets)alignmentRectInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_alignmentRectInsets.top;
  left = self->_alignmentRectInsets.left;
  bottom = self->_alignmentRectInsets.bottom;
  right = self->_alignmentRectInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);
}

id __45__SBIconLabelImage_imageWithParameters_pool___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, double a4)
{
  return (id)objc_msgSend(objc_alloc(*(Class *)(a1 + 40)), "_initWithCGImage:scale:orientation:parameters:alignmentRectInsets:baselineOffsetFromBottom:", a2, a3, *(_QWORD *)(a1 + 32), a4, *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
}

- (id)_initWithCGImage:(CGImage *)a3 scale:(double)a4 orientation:(int64_t)a5 parameters:(id)a6 alignmentRectInsets:(UIEdgeInsets)a7 baselineOffsetFromBottom:(double)a8
{
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  CGFloat top;
  id v17;
  SBIconLabelImage *v18;
  uint64_t v19;
  SBIconLabelImageParameters *parameters;
  objc_super v22;

  right = a7.right;
  bottom = a7.bottom;
  left = a7.left;
  top = a7.top;
  v17 = a6;
  v22.receiver = self;
  v22.super_class = (Class)SBIconLabelImage;
  v18 = -[SBIconLabelImage initWithCGImage:scale:orientation:](&v22, sel_initWithCGImage_scale_orientation_, a3, a5, a4);
  if (v18)
  {
    v19 = objc_msgSend(v17, "copy");
    parameters = v18->_parameters;
    v18->_parameters = (SBIconLabelImageParameters *)v19;

    v18->_alignmentRectInsets.top = top;
    v18->_alignmentRectInsets.left = left;
    v18->_alignmentRectInsets.bottom = bottom;
    v18->_alignmentRectInsets.right = right;
    v18->_baselineOffsetFromBottom = a8;
  }

  return v18;
}

+ (double)legibilityStrengthForLegibilityStyle:(int64_t)a3
{
  double result;

  result = 0.3;
  if (a3 != 1)
    return 0.0;
  return result;
}

+ (id)imageWithParameters:(id)a3 pool:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  NSString *v10;
  NSComparisonResult v11;
  uint64_t v12;
  int v13;
  int v14;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  uint64_t v20;
  double v21;
  double v22;
  double v23;
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
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  void *v39;
  double Width;
  void *v41;
  unint64_t v42;
  uint64_t v43;
  double v44;
  CGFloat v45;
  CGFloat v46;
  CGFloat v47;
  CGFloat v48;
  double v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  CGFloat v56;
  CGFloat height;
  double v58;
  CGFloat v59;
  CGFloat v60;
  CGFloat v61;
  CGFloat v62;
  double v63;
  double v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  CGFloat v69;
  CGFloat v70;
  double v71;
  uint64_t v72;
  void *v73;
  double v74;
  CGFloat v75;
  double v76;
  CGFloat v77;
  CGFloat v78;
  CGFloat v79;
  double MaxY;
  double v81;
  double v82;
  void *v83;
  uint64_t v84;
  void *v85;
  uint64_t v86;
  id v87;
  id v88;
  id v89;
  id v90;
  id v91;
  void *v92;
  void *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  double v99;
  void *v100;
  void *v101;
  void *v102;
  NSString *v103;
  void *v104;
  void *v105;
  void *v106;
  uint64_t v108;
  double v109;
  uint64_t v110;
  double v111;
  double v112;
  double v113;
  _QWORD v114[4];
  id v115;
  id v116;
  double v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  double v121;
  _QWORD v122[4];
  id v123;
  id v124;
  id v125;
  id v126;
  CGFloat v127;
  CGFloat v128;
  CGFloat v129;
  CGFloat v130;
  double v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  double v137;
  double v138;
  CGRect v139;
  CGRect v140;
  CGRect v141;
  CGRect v142;
  CGRect v143;
  CGRect v144;
  CGRect v145;
  CGRect v146;
  CGRect v147;
  CGRect v148;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "overrideTraitCollection");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0DC3E88], "currentTraitCollection");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3E88], "setCurrentTraitCollection:", v7);
  }
  else
  {
    v94 = 0;
  }
  objc_msgSend(v5, "text");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if ((unint64_t)objc_msgSend(v8, "length") >= 0x65)
  {
    objc_msgSend(v8, "substringToIndex:", objc_msgSend(v8, "rangeOfComposedCharacterSequenceAtIndex:", 100));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v5, "contentSizeCategory");
  v10 = (NSString *)objc_claimAutoreleasedReturnValue();
  v105 = (void *)v7;
  v106 = v6;
  v103 = v10;
  v104 = v8;
  if (v10)
  {
    v11 = UIContentSizeCategoryCompareToCategory(v10, (UIContentSizeCategory)*MEMORY[0x1E0DC4918]);
    objc_msgSend(v5, "font");
    v12 = objc_claimAutoreleasedReturnValue();
    if (v11 == NSOrderedDescending)
    {
      v13 = 1;
      goto LABEL_11;
    }
  }
  else
  {
    objc_msgSend(v5, "font");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v13 = objc_msgSend(v5, "canTruncate");
  LODWORD(v11) = 0;
LABEL_11:
  v14 = objc_msgSend(v5, "canTighten");
  v15 = objc_alloc_init(MEMORY[0x1E0DC1288]);
  v16 = v15;
  if (v13)
    v17 = 4;
  else
    v17 = 2;
  objc_msgSend(v15, "setLineBreakMode:", v17);
  objc_msgSend(v16, "setAlignment:", 0);
  v18 = objc_alloc(MEMORY[0x1E0C99E08]);
  v19 = (void *)objc_msgSend(v18, "initWithObjectsAndKeys:", v12, *MEMORY[0x1E0DC1138], v16, *MEMORY[0x1E0DC1178], 0);
  objc_msgSend(v5, "textColor");
  v20 = objc_claimAutoreleasedReturnValue();
  if (v20)
    objc_msgSend(v19, "setObject:forKey:", v20, *MEMORY[0x1E0DC1140]);
  v100 = (void *)v20;
  objc_msgSend(v5, "textInsets");
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v28 = v27;
  objc_msgSend(v5, "maxSize");
  v109 = v29;
  v111 = v30;
  v31 = v29 - (v24 + v28);
  v32 = v30 - (v22 + v26);
  objc_msgSend(v5, "scale");
  v113 = v33;
  v140.origin.x = v24 + 0.0;
  v140.origin.y = v22 + 0.0;
  v140.size.width = v31;
  v140.size.height = v32;
  v34 = CGRectGetWidth(v140) + 50.0;
  v141.origin.x = v24 + 0.0;
  v141.origin.y = v22 + 0.0;
  v141.size.width = v31;
  v141.size.height = v32;
  objc_msgSend(v9, "boundingRectWithSize:options:attributes:context:", 0, v19, 0, v34, CGRectGetHeight(v141));
  v39 = 0;
  v139.origin.x = v35;
  v139.origin.y = v36;
  v139.size.width = v37;
  v139.size.height = v38;
  if ((v13 | v14) == 1)
  {
    Width = CGRectGetWidth(*(CGRect *)&v35);
    v142.origin.x = v24 + 0.0;
    v142.origin.y = v22 + 0.0;
    v142.size.width = v31;
    v142.size.height = v32;
    if (Width <= CGRectGetWidth(v142))
    {
      v39 = 0;
    }
    else
    {
      v41 = v9;
      v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:attributes:", v9, v19);
      v42 = 0;
      if (v11 | v13 ^ 1)
        v43 = 15;
      else
        v43 = 10;
      if ((_DWORD)v11)
        v44 = 1.5;
      else
        v44 = 3.0;
      while (v43 != v42)
      {
        ++v42;
        objc_msgSend(a1, "applyKerning:whitespaceKerning:toAttributedString:", v39, (double)v42 * -0.1, v44 * ((double)v42 * -0.1));
        if ((objc_msgSend(a1, "attributedText:fitsInRect:textRect:", v39, &v139, v24 + 0.0, v22 + 0.0, v31, v32) & 1) != 0)
          goto LABEL_30;
      }
      if (v13)
      {
        objc_msgSend(v39, "boundingRectWithSize:options:context:", 0, 0, v31, v32);
        v139.origin.x = v45;
        v139.origin.y = v46;
        v139.size.width = v47;
        v139.size.height = v48;
      }
LABEL_30:
      v9 = v41;
    }
  }
  v49 = SBHEdgeInsetsInvert(v22);
  v51 = v50;
  v53 = v52;
  v55 = v54;
  objc_msgSend(v5, "fontLanguageInsets");
  v98 = v51;
  v99 = v49;
  v96 = v55;
  v97 = v53;
  UIEdgeInsetsAdd();
  UIRectIntegralWithScale();
  v56 = v143.size.width;
  height = v143.size.height;
  v143.origin.x = 0.0;
  v143.origin.y = 0.0;
  if (CGRectGetHeight(v143) <= v111
    && (v144.origin.x = 0.0,
        v144.origin.y = 0.0,
        v144.size.width = v56,
        v144.size.height = height,
        CGRectGetWidth(v144) <= v109))
  {
    v58 = v109;
  }
  else
  {
    UIRectGetCenter();
    v58 = v109;
    UIRectCenteredAboutPoint();
    SBHEdgeInsetsForTransformingRectIntoRect(0.0, 0.0, v56, height, v59, v60, v61, v62);
  }
  UIEdgeInsetsAdd();
  v64 = SBHEdgeInsetsInvert(v63);
  v66 = v65;
  v108 = v68;
  v110 = v67;
  UIRectIntegralWithScale();
  v69 = v145.size.width;
  v70 = v145.size.height;
  v145.origin.x = 0.0;
  v145.origin.y = 0.0;
  v71 = v111;
  v101 = v16;
  v102 = (void *)v12;
  if (CGRectGetWidth(v145) <= v58
    && (v146.origin.x = 0.0,
        v146.origin.y = 0.0,
        v146.size.width = v69,
        v146.size.height = v70,
        CGRectGetHeight(v146) <= v111))
  {
    v72 = v66;
    v73 = v9;
    v58 = v69;
    v71 = v70;
  }
  else
  {
    v72 = v66;
    v73 = v9;
  }
  v95 = v72;
  UIRectIntegralWithScale();
  v75 = v74;
  v77 = v76;
  v112 = v64;
  v78 = v139.size.width;
  v79 = v139.size.height;
  v147.origin.x = 0.0;
  v147.origin.y = 0.0;
  v147.size.width = v58;
  v147.size.height = v71;
  MaxY = CGRectGetMaxY(v147);
  v148.origin.x = v75;
  v148.origin.y = v77;
  v148.size.width = v78;
  v148.size.height = v79;
  v81 = CGRectGetMaxY(v148);
  v82 = MaxY - (v81 + CGRectGetMinY(v139));
  objc_msgSend(v5, "focusHighlightColor");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isColorspaceGrayscale"))
    v84 = 4;
  else
    v84 = 0;
  v85 = (void *)MEMORY[0x1E0DC3870];
  v86 = MEMORY[0x1E0C809B0];
  v122[0] = MEMORY[0x1E0C809B0];
  v122[1] = 3221225472;
  v122[2] = __45__SBIconLabelImage_imageWithParameters_pool___block_invoke;
  v122[3] = &unk_1E8D88728;
  v87 = v83;
  v123 = v87;
  v127 = v75;
  v128 = v77;
  v129 = v78;
  v130 = v79;
  v131 = v99;
  v132 = v98;
  v133 = v97;
  v134 = v96;
  v135 = 0;
  v136 = 0;
  v137 = v58;
  v138 = v71;
  v88 = v39;
  v124 = v88;
  v89 = v73;
  v125 = v89;
  v90 = v19;
  v126 = v90;
  v114[0] = v86;
  v114[1] = 3221225472;
  v114[2] = __45__SBIconLabelImage_imageWithParameters_pool___block_invoke_2;
  v114[3] = &unk_1E8D88750;
  v116 = a1;
  v91 = v5;
  v115 = v91;
  v117 = v112;
  v118 = v95;
  v119 = v110;
  v120 = v108;
  v121 = v82;
  objc_msgSend(v85, "sbf_imageFromContextWithSize:scale:type:pool:drawing:encapsulation:", v84, v106, v122, v114, v58, v71, v113);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  if (v94)
    objc_msgSend(MEMORY[0x1E0DC3E88], "setCurrentTraitCollection:", v94);

  return v92;
}

+ (id)imageWithParameters:(id)a3
{
  return (id)objc_msgSend(a1, "imageWithParameters:pool:", a3, 0);
}

uint64_t __45__SBIconLabelImage_imageWithParameters_pool___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  void *v4;
  void *v5;
  CGRect v7;
  CGRect v8;

  if (*(_QWORD *)(a1 + 32))
  {
    v2 = *(double *)(a1 + 96);
    v3 = *(double *)(a1 + 104);
    v7.origin.x = *(double *)(a1 + 64) + v3;
    v7.origin.y = *(double *)(a1 + 72) + v2;
    v7.size.width = *(double *)(a1 + 80) - (v3 + *(double *)(a1 + 120));
    v7.size.height = *(double *)(a1 + 88) - (v2 + *(double *)(a1 + 112));
    v8 = CGRectIntersection(v7, *(CGRect *)(a1 + 128));
    objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRoundedRect:cornerRadius:", v8.origin.x, v8.origin.y, v8.size.width, v8.size.height, 4.0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setFill");
    objc_msgSend(v4, "fill");

  }
  v5 = *(void **)(a1 + 40);
  if (v5)
    return objc_msgSend(v5, "drawWithRect:options:context:", 1, 0, *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88));
  else
    return objc_msgSend(*(id *)(a1 + 48), "drawWithRect:options:attributes:context:", 1, *(_QWORD *)(a1 + 56), 0, *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88));
}

+ (CGSize)_maxLegibilityImageSizeForLabelSize:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  SBUILegibilityImageSizeForContentSizeAndStyle();
  result.height = v4;
  result.width = v3;
  return result;
}

+ (BOOL)needsLegibilityImageForParameters:(id)a3
{
  objc_msgSend(a1, "legibilityStrengthForLegibilityStyle:", objc_msgSend(a3, "legibilityStyle"));
  return BSFloatIsZero() ^ 1;
}

+ (BOOL)attributedText:(id)a3 fitsInRect:(CGRect)a4 textRect:(CGRect *)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGRect v16;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  objc_msgSend(a3, "boundingRectWithSize:options:context:", 0, 0, 1.79769313e308, 1.79769313e308);
  if (a5)
  {
    a5->origin.x = v10;
    a5->origin.y = v11;
    a5->size.width = v12;
    a5->size.height = v13;
  }
  v14 = round(CGRectGetWidth(*(CGRect *)&v10));
  v16.origin.x = x;
  v16.origin.y = y;
  v16.size.width = width;
  v16.size.height = height;
  return v14 <= CGRectGetWidth(v16);
}

+ (void)applyKerning:(double)a3 whitespaceKerning:(double)a4 toAttributedString:(id)a5
{
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;

  v20 = a5;
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "string");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v20, "length");
  v10 = objc_msgSend(v8, "rangeOfCharacterFromSet:", v7);
  v12 = v11;
  v13 = 0;
  v14 = *MEMORY[0x1E0DC1150];
  while (1)
  {
    v15 = v10 == 0x7FFFFFFFFFFFFFFFLL ? v9 : v10;
    v16 = v15 - v13;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addAttribute:value:range:", v14, v17, v13, v16);
    if (v10 == 0x7FFFFFFFFFFFFFFFLL)
      break;
    objc_msgSend(v20, "addAttribute:value:range:", v14, v18, v10, v12);
    v13 = v10 + v12;
    v10 = objc_msgSend(v8, "rangeOfCharacterFromSet:options:range:", v7, 0, v10 + v12, v9 - (v10 + v12));
    v12 = v19;

  }
}

- (id)description
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconLabelImage size](self, "size");
  v4 = (id)objc_msgSend(v3, "appendSize:withName:", CFSTR("size"));
  -[SBIconLabelImage scale](self, "scale");
  v5 = (id)objc_msgSend(v3, "appendFloat:withName:", CFSTR("scale"));
  NSStringFromUIEdgeInsets(self->_alignmentRectInsets);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendObject:withName:", v6, CFSTR("alignmentRectInsets"));

  v8 = (id)objc_msgSend(v3, "appendObject:withName:", self->_parameters, CFSTR("parameters"));
  v9 = (id)objc_msgSend(v3, "appendFloat:withName:", CFSTR("baselineOffsetFromBottom"), self->_baselineOffsetFromBottom);
  objc_msgSend(v3, "build");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (SBIconLabelImageParameters)parameters
{
  return self->_parameters;
}

@end
