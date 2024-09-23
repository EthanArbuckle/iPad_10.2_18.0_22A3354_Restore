@implementation NSAttributedString(NSExtendedStringDrawing)

- (double)boundingRectWithSize:()NSExtendedStringDrawing options:context:
{
  uint64_t v11;
  double v12;
  uint64_t v13;
  unint64_t v14;
  double v15;
  id v16;
  void *v17;
  uint64_t v18;
  double v19;
  uint64_t v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  uint64_t v28;
  unint64_t v29;
  _BOOL4 v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  _BOOL4 v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  uint64_t v42;
  double v44;
  double v45;
  uint64_t v46;
  int v47;
  double v48;
  uint64_t v49;
  double v50;
  double v51;
  double v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  __CFString *v58;
  int v59;
  double v60;
  double v61;
  uint64_t v62;
  _BOOL4 v63;
  double v65;
  double v66;
  double v67;
  double v68;
  unsigned int v69;
  double v70;
  double v71;
  double v72;
  CGFloat v73;
  double v74;
  unsigned __int8 v75;
  uint64_t v76;
  uint64_t v77;

  v11 = CTFontSwapDefaultLineHeightAdjustment();
  v12 = MEMORY[0x18D790ECC](v11, 0.0);
  v13 = objc_msgSend((id)-[__CFString string](a1, "string"), "length");
  if (!a6)
    goto LABEL_19;
  v14 = v13;
  if (!v13)
    goto LABEL_19;
  objc_msgSend(a6, "minimumScaleFactor");
  if (v15 <= 0.0)
    goto LABEL_19;
  v76 = 0;
  v77 = 0;
  v16 = (id)objc_msgSend((id)-[__CFString attribute:atIndex:longestEffectiveRange:inRange:](a1, "attribute:atIndex:longestEffectiveRange:inRange:", CFSTR("NSParagraphStyle"), 0, &v76, 0, objc_msgSend((id)-[__CFString string](a1, "string"), "length")), "mutableCopy");
  if (v16)
  {
    if ((v17 = v16, objc_msgSend(v16, "lineBreakMode") <= 1) && objc_msgSend(a6, "maximumNumberOfLines") != 1
      || (v18 = v77, v18 != objc_msgSend((id)-[__CFString string](a1, "string"), "length"))
      || (objc_msgSend(v17, "firstLineHeadIndent"), v19 != 0.0))
    {
LABEL_19:
      v41 = __NSStringDrawingEngine(a1, 0, a5, 0, a6, 0, 0, 0.0, 0.0, a2, a3, 0.0);
      goto LABEL_20;
    }
  }
  objc_msgSend(a6, "setWantsBaselineOffset:", 1);
  v20 = objc_msgSend(a6, "maximumNumberOfLines");
  if (v20 == 1)
    v21 = 9000000.0;
  else
    v21 = a2;
  v73 = v21;
  v71 = __NSStringDrawingEngine(a1, 0, a5, 0, a6, 0, 0, 0.0, 0.0, v21, 9000000.0, 0.0);
  v23 = v22;
  v25 = v24;
  v27 = v26;
  v28 = objc_msgSend(a6, "maximumNumberOfLines");
  v29 = v28;
  v30 = 0;
  v75 = 0;
  v70 = v12;
  v31 = v27;
  v32 = v25;
  if (v20 != 1 && v28)
  {
    objc_msgSend(a6, "setMaximumNumberOfLines:", objc_msgSend(a6, "maximumNumberOfLines") + 1);
    v33 = __NSStringDrawingEngine(a1, 0, a5, 0, a6, 0, &v75, 0.0, 0.0, v73, 9000000.0, 0.0);
    v32 = v34;
    v31 = v35;
    v36 = objc_msgSend(a6, "numberOfLineFragments", v33) > v29;
    if (v14 >= 0x201)
      v30 = v36;
    else
      v30 = (v75 | v36) != 0;
  }
  objc_msgSend(a6, "minimumScaleFactor");
  v38 = v37;
  objc_msgSend(a6, "baselineOffset");
  v72 = v39;
  if (v20 == 1)
  {
    v40 = a2 / v32;
    if (v40 > 1.0)
    {
      if (boundingRectWithSize_options_context__onceToken != -1)
        dispatch_once(&boundingRectWithSize_options_context__onceToken, &__block_literal_global_328);
      if (boundingRectWithSize_options_context__scaleSingleLineWithHeight)
        v40 = a3 / v31;
    }
  }
  else
  {
    v40 = a3 / v31;
  }
  if (v40 <= 1.0)
    v44 = v40;
  else
    v44 = 1.0;
  if (v44 >= v38)
    v45 = v44;
  else
    v45 = v38;
  v46 = objc_msgSend(a6, "cachesLayout");
  objc_msgSend(a6, "setCachesLayout:", 0);
  v47 = v45 < 1.0 || v30;
  v48 = v72;
  if (v47 != 1)
    goto LABEL_39;
  v49 = -[__CFString length](a1, "length");
  v50 = fmax(v38, 0.0);
  v45 = 1.0;
  if (vabdd_f64(1.0, v50) < 0.00000011920929)
    goto LABEL_39;
  if (v50 <= 1.0)
  {
    v53 = v49;
    v76 = 0;
    v77 = 0;
    v54 = (void *)-[__CFString attributesAtIndex:effectiveRange:](a1, "attributesAtIndex:effectiveRange:", 0, &v76);
    if (v76 || v77 != v53)
    {
      if (v50 <= 0.01)
      {
        v56 = 0;
        v57 = 0;
        goto LABEL_57;
      }
      v58 = (__CFString *)-[NSAttributedString _ui_scaledStringWithAttributes:font:scale:](a1, 0, 0, v50);
      v57 = 0;
    }
    else
    {
      v55 = v54;
      v56 = (void *)objc_msgSend(v54, "mutableCopy");
      v57 = (void *)objc_msgSend(v55, "objectForKeyedSubscript:", CFSTR("NSFont"));
      if (v50 <= 0.01)
        goto LABEL_57;
      v58 = (__CFString *)-[NSAttributedString _ui_scaledStringWithAttributes:font:scale:](a1, v56, v57, v50);
      if (v56)
      {
        if ((objc_msgSend((id)objc_msgSend(v56, "objectForKeyedSubscript:", CFSTR("NSFont")), "isEqual:", v57) & 1) != 0)
        {
LABEL_57:
          v69 = v46;
          v59 = 0;
          v60 = 1.0;
          v61 = 1.0 - v50;
          v62 = -20;
          do
          {
            v45 = v60 + v61 * -0.5;
            v58 = (__CFString *)-[NSAttributedString _ui_scaledStringWithAttributes:font:scale:](a1, v56, v57, v45);
            v63 = __NSScaledTextOversized(v58, v14, v56, a5, a6, v29, a2, a3, 0.0, 0.0, v73, 9000000.0);
            if (!v63)
              v50 = v45;
            if (__CFADD__(v62++, 1))
              break;
            if (v63)
              v60 = v45;
            v59 |= !v63;
            v61 = v60 - v50;
          }
          while ((v59 & 1) == 0 || v61 >= 0.01);
          v48 = v72;
          v46 = v69;
          if (v45 == v50)
            goto LABEL_68;
          v58 = (__CFString *)-[NSAttributedString _ui_scaledStringWithAttributes:font:scale:](a1, v56, v57, v50);
LABEL_67:
          v45 = v50;
LABEL_68:
          objc_msgSend(a6, "setMaximumNumberOfLines:", v29);
          v74 = v48;
          v51 = v27;
          if (v58 != a1)
          {
            v71 = __NSStringDrawingEngine(v58, v56, a5, 0, a6, 0, 0, 0.0, 0.0, a2, a3, 0.0);
            v23 = v65;
            v25 = v66;
            v51 = v67;
            objc_msgSend(a6, "baselineOffset");
            v74 = v68;
          }
          if (v56)

          v41 = v71;
          v52 = v74;
          goto LABEL_40;
        }
LABEL_54:
        if (__NSScaledTextOversized(v58, v14, v56, a5, a6, v29, a2, a3, 0.0, 0.0, v73, 9000000.0))
          goto LABEL_67;
        goto LABEL_57;
      }
    }
    v56 = 0;
    if ((-[__CFString isEqual:](v58, "isEqual:", a1) & 1) != 0)
      goto LABEL_57;
    goto LABEL_54;
  }
  v45 = v50;
LABEL_39:
  objc_msgSend(a6, "setMaximumNumberOfLines:", v29);
  v51 = v27;
  v52 = v72;
  v41 = v71;
LABEL_40:
  objc_msgSend(a6, "setCachesLayout:", v46);
  objc_msgSend(a6, "setActualScaleFactor:", v45);
  if (objc_msgSend(a6, "wantsScaledLineHeight"))
    objc_msgSend(a6, "setScaledLineHeight:", v51);
  objc_msgSend(a6, "setTotalBounds:", v41, v23, v25, v27);
  if (objc_msgSend(a6, "wantsScaledBaselineOffset"))
    objc_msgSend(a6, "setScaledBaselineOffset:", v52);
  objc_msgSend(a6, "setBaselineOffset:", v48);
  v12 = v70;
LABEL_20:
  v42 = CTFontSwapDefaultLineHeightAdjustment();
  MEMORY[0x18D790ECC](v42, v12);
  return v41;
}

- (uint64_t)hasColorGlyphsInRange:()NSExtendedStringDrawing
{
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;

  v7 = (void *)objc_msgSend(objc_allocWithZone((Class)_NSCachedAttributedString), "initWithAttributedString:", a1);
  v8 = objc_msgSend(v7, "copyCachedInstance");
  if (v8)
  {
    v9 = (void *)v8;

    v7 = v9;
  }
  else
  {
    objc_msgSend(v7, "fixAttributesInRange:", a3, a4);
    if (a4 == objc_msgSend(a1, "length"))
      objc_msgSend(v7, "cache");
  }
  v10 = objc_msgSend(v7, "hasColorGlyphsInRange:", a3, a4);

  return v10;
}

- (void)drawWithRect:()NSExtendedStringDrawing options:context:
{
  uint64_t v15;
  double v16;
  uint64_t v17;
  uint64_t v18;

  v15 = CTFontSwapDefaultLineHeightAdjustment();
  v16 = MEMORY[0x18D790ECC](v15, 0.0);
  _NSStringDrawingCore(a1, 0, a7, 0, a2, a3, a4, a5, 0.0, v17, a8);
  v18 = CTFontSwapDefaultLineHeightAdjustment();
  MEMORY[0x18D790ECC](v18, v16);

}

- (id)_ui_attributedSubstringFromRange:()NSExtendedStringDrawing scaledByScaleFactor:
{
  return -[NSAttributedString _ui_attributedStringScaledByScaleFactor:]((id)objc_msgSend(a1, "attributedSubstringFromRange:"), a2);
}

- (id)_ui_attributedSubstringFromRange:()NSExtendedStringDrawing withTrackingAdjustment:
{
  id v4;
  uint64_t v5;
  _QWORD v7[6];

  v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithAttributedString:", a1);
  v5 = objc_msgSend(a1, "length");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __103__NSAttributedString_NSExtendedStringDrawing___ui_attributedSubstringFromRange_withTrackingAdjustment___block_invoke;
  v7[3] = &unk_1E2605340;
  *(double *)&v7[5] = a2;
  v7[4] = v4;
  objc_msgSend(v4, "enumerateAttribute:inRange:options:usingBlock:", CFSTR("NSKern"), 0, v5, 0, v7);
  return v4;
}

- (uint64_t)drawWithRect:()NSExtendedStringDrawing options:
{
  return objc_msgSend(a1, "drawWithRect:options:context:", a3, 0);
}

- (uint64_t)boundingRectWithSize:()NSExtendedStringDrawing options:
{
  return objc_msgSend(a1, "boundingRectWithSize:options:context:", a3, 0);
}

@end
