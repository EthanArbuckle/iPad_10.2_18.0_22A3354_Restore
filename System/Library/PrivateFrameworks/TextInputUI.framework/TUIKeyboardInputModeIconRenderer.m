@implementation TUIKeyboardInputModeIconRenderer

- (id)attributedStringWithText:(id)a3 color:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v5 = (objc_class *)MEMORY[0x1E0CB3498];
  v6 = a4;
  v7 = a3;
  v8 = [v5 alloc];
  v12 = *MEMORY[0x1E0DC32A8];
  v13[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(v8, "initWithString:attributes:", v7, v9);
  return v10;
}

- (id)attributedStringForPrimaryLabel:(id)a3 secondaryLabel:(id)a4 withTintColor:(id)a5 detailTintColor:(id)a6 language:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  v17 = objc_alloc_init(MEMORY[0x1E0CB3778]);
  v18 = objc_msgSend(v13, "length");
  v19 = v12;
  if (v18)
  {
    -[TUIKeyboardInputModeIconRenderer attributedStringWithText:color:](self, "attributedStringWithText:color:", v12, v15);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "appendAttributedString:", v20);

    v21 = objc_msgSend(v13, "length");
    v19 = v13;
    if (v21 == 1)
    {
      -[TUIKeyboardInputModeIconRenderer attributedStringWithText:color:](self, "attributedStringWithText:color:", CFSTR(" "), v14);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "appendAttributedString:", v22);

      v19 = v13;
    }
  }
  -[TUIKeyboardInputModeIconRenderer attributedStringWithText:color:](self, "attributedStringWithText:color:", v19, v14);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "appendAttributedString:", v23);

  if (v16)
    objc_msgSend(v17, "addAttribute:value:range:", *MEMORY[0x1E0CB2CE0], v16, 0, objc_msgSend(v17, "length"));

  return v17;
}

- (void)drawPrimaryLabel:(id)a3 secondaryLabel:(id)a4 withConfiguration:(id)a5 inContext:(CGContext *)a6
{
  id v10;
  id v11;
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  id v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  void *v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v101;
  const __CTLine *v102;
  double v103;
  double v104;
  double v105;
  CGFloat v106;
  CGFloat v107;
  id v108;
  id v109;
  CGAffineTransform v110;
  CGAffineTransform v111;
  CGAffineTransform transform;
  CGAffineTransform v113;
  _QWORD v114[2];
  _QWORD v115[2];
  _QWORD v116[2];
  _QWORD v117[2];
  _QWORD v118[2];
  _QWORD v119[4];
  CGRect v120;
  CGRect v121;
  CGRect v122;
  CGRect v123;
  CGRect v124;
  CGRect v125;
  CGRect v126;
  CGRect v127;
  CGRect v128;
  CGRect v129;
  CGRect v130;
  CGRect v131;
  CGRect v132;
  CGRect v133;
  CGRect BoundsWithOptions;
  CGRect v135;

  v119[2] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v14 = *MEMORY[0x1E0C9D538];
  v13 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  objc_msgSend(v12, "size");
  v16 = v15;
  v18 = v17;
  v19 = objc_msgSend(v12, "style");
  if (v19 == 3)
  {
    v124.origin.x = v14;
    v124.origin.y = v13;
    v124.size.width = v16;
    v124.size.height = v18;
    v125 = CGRectInset(v124, v18 / 3.0, 2.5);
    x = v125.origin.x;
    y = v125.origin.y;
    width = v125.size.width;
    height = v125.size.height;
    UIGraphicsPushContext(a6);
    v32 = (void *)MEMORY[0x1E0DC3508];
    v126.origin.x = v14;
    v126.origin.y = v13;
    v126.size.width = v16;
    v126.size.height = v18;
    v127 = CGRectInset(v126, 0.75, 0.75);
    objc_msgSend(v32, "_bezierPathWithPillRect:cornerRadius:", v127.origin.x, v127.origin.y, v127.size.width, v127.size.height, v18 * 0.5);
    v33 = objc_claimAutoreleasedReturnValue();
LABEL_7:
    v30 = (void *)v33;
    objc_msgSend(v12, "backgroundColor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setFill");

    objc_msgSend(v30, "fill");
    goto LABEL_8;
  }
  if (v19 == 2)
  {
    v128.origin.x = v14;
    v128.origin.y = v13;
    v128.size.width = v16;
    v128.size.height = v18;
    v129 = CGRectInset(v128, 2.5, 2.5);
    x = v129.origin.x;
    y = v129.origin.y;
    width = v129.size.width;
    height = v129.size.height;
    UIGraphicsPushContext(a6);
    v34 = (void *)MEMORY[0x1E0DC3508];
    v130.origin.x = v14;
    v130.origin.y = v13;
    v130.size.width = v16;
    v130.size.height = v18;
    v131 = CGRectInset(v130, 0.75, 0.75);
    v35 = v131.origin.x;
    v36 = v131.origin.y;
    v37 = v131.size.width;
    v38 = v131.size.height;
    objc_msgSend(v12, "backgroundCornerRadius");
    objc_msgSend(v34, "_bezierPathWithArcRoundedRect:cornerRadius:", v35, v36, v37, v38, v39);
    v33 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if (v19 != 1)
    goto LABEL_9;
  v120.origin.x = v14;
  v120.origin.y = v13;
  v120.size.width = v16;
  v120.size.height = v18;
  v121 = CGRectInset(v120, 2.5, 2.5);
  x = v121.origin.x;
  y = v121.origin.y;
  width = v121.size.width;
  height = v121.size.height;
  UIGraphicsPushContext(a6);
  v24 = (void *)MEMORY[0x1E0DC3508];
  v122.origin.x = v14;
  v122.origin.y = v13;
  v122.size.width = v16;
  v122.size.height = v18;
  v123 = CGRectInset(v122, 0.75, 0.75);
  v25 = v123.origin.x;
  v26 = v123.origin.y;
  v27 = v123.size.width;
  v28 = v123.size.height;
  objc_msgSend(v12, "backgroundCornerRadius");
  objc_msgSend(v24, "_bezierPathWithPillRect:cornerRadius:", v25, v26, v27, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "backgroundColor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setStroke");

  objc_msgSend(v30, "setLineWidth:", 1.5);
  objc_msgSend(v30, "stroke");
LABEL_8:
  v14 = x;
  v13 = y;
  v16 = width;
  v18 = height;
  UIGraphicsPopContext();

LABEL_9:
  objc_msgSend(v12, "artwork");
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  if (v41)
  {
    v42 = (void *)MEMORY[0x1E0DC3870];
    objc_msgSend(v12, "artwork");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "imageNamed:inBundle:", v43, v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "tintColor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "imageWithTintColor:renderingMode:", v46, 2);
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v47, "size");
    v49 = v48;
    objc_msgSend(v47, "size");
    v52 = v51;
    if (v18 >= v49)
    {
      v66 = v50;
      objc_msgSend(v12, "baseFontSize");
      v68 = v67 / 17.0 * (v18 / v52);
      v69 = v66 * v68;
      v70 = v52 * v68;
      v71 = 0.5;
      v72 = v14 + (v16 - v69) * 0.5;
      v73 = v18 - v70;
    }
    else
    {
      v53 = v51 * 0.62;
      objc_msgSend(v47, "size");
      if (v18 >= v53)
      {
        v56 = v54;
        v57 = v55;
      }
      else
      {
        v56 = v16 / 0.62;
        v57 = v18 / 0.62;
      }
      v132.origin.x = v14;
      v132.origin.y = v13;
      v132.size.width = v16;
      v132.size.height = v18;
      v133 = CGRectInset(v132, (v56 - v16) * -0.5, (v57 - v18) * -0.5);
      v74 = v133.origin.x;
      v13 = v133.origin.y;
      v75 = v133.size.width;
      v76 = v133.size.height;
      objc_msgSend(v12, "baseFontSize");
      v78 = v77 / 17.0 * (v76 / v57);
      v69 = v56 * v78;
      v70 = v57 * v78;
      v71 = 0.5;
      v72 = v74 + (v75 - v69) * 0.5;
      v73 = v76 - v70;
    }
    v79 = v13 + v73 * v71;
    UIGraphicsPushContext(a6);
    objc_msgSend(v47, "drawInRect:", v72, v79, v69, v70);
    UIGraphicsPopContext();

  }
  else
  {
    objc_msgSend(v12, "baseFontSize");
    v59 = v58;
    objc_msgSend(v12, "tintColor");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "tintColor");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "detailLabelAlpha");
    objc_msgSend(v61, "colorWithAlphaComponent:");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "language");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIKeyboardInputModeIconRenderer attributedStringForPrimaryLabel:secondaryLabel:withTintColor:detailTintColor:language:](self, "attributedStringForPrimaryLabel:secondaryLabel:withTintColor:detailTintColor:language:", v10, v11, v60, v62, v63);
    v64 = (void *)objc_claimAutoreleasedReturnValue();

    if ((unint64_t)objc_msgSend(v64, "length") > 1)
      v59 = v59 + -1.0;
    v108 = v11;
    v109 = v10;
    if ((unint64_t)objc_msgSend(v64, "length") >= 2)
    {
      if (objc_msgSend(v64, "length") == 2)
      {
        v65 = 100.0;
      }
      else if (objc_msgSend(v64, "length") == 3)
      {
        v65 = 65.0;
      }
      else if ((unint64_t)objc_msgSend(v11, "length") >= 2)
      {
        v65 = 30.0;
      }
      else
      {
        v65 = 40.0;
      }
    }
    else
    {
      v65 = 110.0;
    }
    v80 = objc_alloc(MEMORY[0x1E0DC37F0]);
    v118[0] = *MEMORY[0x1E0CA8418];
    v81 = *MEMORY[0x1E0CA8450];
    v117[0] = *MEMORY[0x1E0CA8430];
    v82 = *MEMORY[0x1E0CA84E8];
    v116[0] = v81;
    v116[1] = v82;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *MEMORY[0x1E0CA84D8]);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    v117[1] = v83;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v117, v116, 2);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    v119[0] = v84;
    v118[1] = *MEMORY[0x1E0CA8470];
    v114[0] = &unk_1E2517278;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v65);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    v114[1] = &unk_1E2517290;
    v115[0] = v85;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v18);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v115[1] = v86;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v115, v114, 2);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    v119[1] = v87;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v119, v118, 2);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    v89 = (void *)objc_msgSend(v80, "initWithFontAttributes:", v88);

    objc_msgSend(v12, "fontFamily");
    v90 = (void *)objc_claimAutoreleasedReturnValue();

    if (v90)
    {
      objc_msgSend(v12, "fontFamily");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v89, "fontDescriptorWithFamily:", v91);
      v92 = objc_claimAutoreleasedReturnValue();

      v89 = (void *)v92;
    }
    v93 = *MEMORY[0x1E0DC32A0];
    v94 = 5;
    while (1)
    {
      objc_msgSend(MEMORY[0x1E0DC37E8], "fontWithDescriptor:size:", v89, v59, v108, v109);
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "addAttribute:value:range:", v93, v95, 0, objc_msgSend(v64, "length"));
      objc_msgSend(v64, "size");
      v97 = v96 / v16;
      v99 = v98 / v18;
      if (v97 <= 1.0 && v99 <= 1.0)
        break;
      if (v97 < v99)
        v97 = v99;
      v101 = v59 / v97;
      if (v59 + -0.5 >= v101)
        v59 = v101;
      else
        v59 = v59 + -0.5;

      if (!--v94)
        goto LABEL_42;
    }

LABEL_42:
    v102 = CTLineCreateWithAttributedString((CFAttributedStringRef)v64);
    BoundsWithOptions = CTLineGetBoundsWithOptions(v102, 0x80uLL);
    v103 = BoundsWithOptions.size.width;
    v135 = CTLineGetBoundsWithOptions(v102, 8uLL);
    v135.size = *(CGSize *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&v113.a = *MEMORY[0x1E0C9BAA8];
    *(CGSize *)&v113.c = v135.size;
    *(_OWORD *)&v113.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    v104 = v14 + (v16 - v103) * 0.5;
    v105 = v13 + v135.origin.y + (v18 + v135.size.height) * 0.5;
    *(_OWORD *)&transform.a = *(_OWORD *)&v113.a;
    *(CGSize *)&transform.c = v135.size;
    *(_OWORD *)&transform.tx = *(_OWORD *)&v113.tx;
    CGAffineTransformScale(&v113, &transform, 1.0, -1.0);
    v111 = v113;
    CGAffineTransformTranslate(&transform, &v111, 0.0, v18);
    v113 = transform;
    CGAffineTransformInvert(&v110, &transform);
    v106 = v110.tx + v105 * v110.c + v110.a * v104;
    v107 = v110.ty + v105 * v110.d + v110.b * v104;
    CGContextSaveGState(a6);
    transform = v113;
    CGContextConcatCTM(a6, &transform);
    CGContextSetTextPosition(a6, v106, v107);
    CTLineDraw(v102, a6);
    CGContextRestoreGState(a6);
    CFRelease(v102);

    v11 = v108;
    v10 = v109;
  }

}

- (id)imageForPrimaryLabel:(id)a3 secondaryLabel:(id)a4 withConfiguration:(id)a5
{
  id v8;
  id v9;
  id v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  CGSize v21;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v8, "size");
  v12 = v11;
  v14 = v13;
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "scale");
  v17 = v16;

  if (v17 >= 1.0)
    v18 = v17;
  else
    v18 = 1.0;
  v21.width = v12;
  v21.height = v14;
  UIGraphicsBeginImageContextWithOptions(v21, 0, v18);
  -[TUIKeyboardInputModeIconRenderer drawPrimaryLabel:secondaryLabel:withConfiguration:inContext:](self, "drawPrimaryLabel:secondaryLabel:withConfiguration:inContext:", v10, v9, v8, UIGraphicsGetCurrentContext());

  UIGraphicsGetImageFromCurrentImageContext();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  return v19;
}

@end
