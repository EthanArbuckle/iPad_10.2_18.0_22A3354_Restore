@implementation NSString(UIStringDrawingLegacy)

- (double)_legacy_sizeWithFont:()UIStringDrawingLegacy forWidth:lineBreakMode:letterSpacing:
{
  id v11;
  double v12;
  id v13;
  double v14;
  double v15;
  double v16;

  v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (a6)
  {
    v13 = objc_alloc_init((Class)off_1E1679BC0);
    objc_msgSend(v13, "setLineBreakMode:", UILineBreakToNSLineBreakStyleSingleLineVariant[a6]);
    objc_msgSend(v11, "setObject:forKey:", v13, *(_QWORD *)off_1E1678F98);

  }
  if (a5)
    objc_msgSend(v11, "setObject:forKey:", a5, *(_QWORD *)off_1E1678D90);
  if (a3 != 0.0)
  {
    *(float *)&v12 = a3;
    objc_msgSend(v11, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v12), *(_QWORD *)off_1E1678E60);
  }
  objc_msgSend(a1, "boundingRectWithSize:options:attributes:context:", 0, v11, 0, a2, 3.40282347e38);
  v15 = v14;

  if (v15 - a2 >= 0.0001)
    v16 = a2;
  else
    v16 = v15;
  return ceil(v16);
}

- (uint64_t)_legacy_sizeWithFont:()UIStringDrawingLegacy forWidth:lineBreakMode:
{
  return objc_msgSend(a1, "_legacy_sizeWithFont:forWidth:lineBreakMode:letterSpacing:", a3, 0.0);
}

- (uint64_t)_legacy_drawAtPoint:()UIStringDrawingLegacy forWidth:withFont:lineBreakMode:letterSpacing:includeEmoji:
{
  const __CFString *v14;
  void *v15;
  id v16;
  id v17;
  _QWORD *ContextStack;
  double v19;
  UIColor *v20;
  id v21;
  const __CFString *v22;
  id v23;
  double v24;

  if (a4 >= 0.0 && a7)
  {
    v14 = (const __CFString *)result;
    v15 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v16 = objc_alloc_init((Class)off_1E1679CC0);
    objc_msgSend(v16, "setMaximumNumberOfLines:", 1);
    v17 = objc_alloc_init((Class)off_1E1679BC0);
    objc_msgSend(v17, "setLineBreakMode:", UILineBreakToNSLineBreakStyleSingleLineVariant[a8]);
    objc_msgSend(v17, "setAlignment:", 0);
    objc_msgSend(v15, "setObject:forKey:", v17, *(_QWORD *)off_1E1678F98);

    objc_msgSend(v15, "setObject:forKey:", a7, *(_QWORD *)off_1E1678D90);
    ContextStack = GetContextStack(0);
    if (*(int *)ContextStack >= 1)
    {
      if (ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1])
      {
        v20 = +[UIColor colorWithCGColor:](UIColor, "colorWithCGColor:", CGContextGetFillColorAsColor());
        if (v20)
          objc_msgSend(v15, "setObject:forKey:", v20, *(_QWORD *)off_1E1678D98);
      }
    }
    if (a5 != 0.0)
    {
      *(float *)&v19 = a5;
      objc_msgSend(v15, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v19), *(_QWORD *)off_1E1678E60);
    }
    v21 = objc_alloc(MEMORY[0x1E0CB3498]);
    if (v14)
      v22 = v14;
    else
      v22 = &stru_1E16EDF20;
    v23 = (id)objc_msgSend(v21, "initWithString:attributes:", v22, v15);
    objc_msgSend(a7, "ascender");
    objc_msgSend(v23, "drawWithRect:options:context:", 64, v16, a2, a3 + v24, a4, 0.0);
    return objc_msgSend(v16, "totalBounds");
  }
  return result;
}

- (double)_legacy_sizeWithFont:()UIStringDrawingLegacy
{
  double result;
  double v4;
  uint64_t v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  result = *MEMORY[0x1E0C9D820];
  if (*MEMORY[0x1E0C9D820] >= 0.0)
  {
    if (a3)
    {
      v5 = *(_QWORD *)off_1E1678D90;
      v6[0] = a3;
      objc_msgSend(a1, "sizeWithAttributes:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1, result));
      return ceil(v4);
    }
  }
  return result;
}

- (uint64_t)_legacy_sizeWithFont:()UIStringDrawingLegacy constrainedToSize:lineBreakMode:
{
  return objc_msgSend(a1, "_legacy_sizeWithFont:constrainedToSize:lineBreakMode:lineSpacing:", a3, a4, 0);
}

- (uint64_t)_legacy_sizeWithFont:()UIStringDrawingLegacy constrainedToSize:lineBreakMode:lineSpacing:
{
  const __CFString *v12;
  id v13;
  id v14;
  float v15;
  double v16;
  double v17;
  id v18;
  uint64_t v19;
  _QWORD v20[2];
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  if (a2 >= 0.0 && a5)
  {
    v12 = (const __CFString *)result;
    v13 = objc_alloc_init((Class)off_1E1679CC0);
    objc_msgSend(v13, "setWrapsForTruncationMode:", 1);
    objc_msgSend(v13, "setMaximumNumberOfLines:", 0);
    v14 = objc_alloc_init((Class)off_1E1679BC0);
    objc_msgSend(v14, "setLineBreakMode:", a6);
    if (a7)
    {
      objc_msgSend(v14, "setMinimumLineHeight:", (double)a7);
      objc_msgSend(v14, "setMaximumLineHeight:", (double)a7);
    }
    objc_msgSend(a5, "lineHeight");
    *(float *)&v16 = v16;
    v15 = a3;
    v17 = fmaxf(v15, *(float *)&v16);
    v18 = objc_alloc(MEMORY[0x1E0CB3498]);
    if (!v12)
      v12 = &stru_1E16EDF20;
    v19 = *(_QWORD *)off_1E1678D90;
    v20[0] = *(_QWORD *)off_1E1678F98;
    v20[1] = v19;
    v21[0] = v14;
    v21[1] = a5;
    return objc_msgSend((id)objc_msgSend(v18, "initWithString:attributes:", v12, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 2)), "boundingRectWithSize:options:context:", 65, v13, a2, v17);
  }
  return result;
}

- (uint64_t)_legacy_drawAtPoint:()UIStringDrawingLegacy withFont:
{
  return objc_msgSend(a1, "_legacy_drawAtPoint:forWidth:withFont:lineBreakMode:letterSpacing:includeEmoji:", a3, 0, 1, a4, a5, 3.40282347e38, 0.0);
}

- (uint64_t)_legacy_drawAtPoint:()UIStringDrawingLegacy forWidth:withFont:lineBreakMode:
{
  return objc_msgSend(a1, "_legacy_drawAtPoint:forWidth:withFont:lineBreakMode:letterSpacing:includeEmoji:", a3, a4, 1, a5, a6, a7, 0.0);
}

- (uint64_t)_legacy_drawAtPoint:()UIStringDrawingLegacy forWidth:withFont:lineBreakMode:letterSpacing:
{
  return objc_msgSend(a1, "_legacy_drawAtPoint:forWidth:withFont:lineBreakMode:letterSpacing:includeEmoji:", a3, a4, 1);
}

- (uint64_t)_legacy_sizeWithFont:()UIStringDrawingLegacy constrainedToSize:
{
  return objc_msgSend(a1, "_legacy_sizeWithFont:constrainedToSize:lineBreakMode:lineSpacing:", a3, 4, 0);
}

- (uint64_t)_legacy_drawInRect:()UIStringDrawingLegacy withFont:
{
  return objc_msgSend(a1, "_legacy_drawInRect:withFont:lineBreakMode:alignment:lineSpacing:includeEmoji:", a3, 0, 0, 0, 1);
}

- (uint64_t)_legacy_drawInRect:()UIStringDrawingLegacy withFont:lineBreakMode:
{
  return objc_msgSend(a1, "_legacy_drawInRect:withFont:lineBreakMode:alignment:lineSpacing:includeEmoji:", a3, a4, 0, 0, 1);
}

- (uint64_t)_legacy_drawInRect:()UIStringDrawingLegacy withFont:lineBreakMode:alignment:
{
  return objc_msgSend(a1, "_legacy_drawInRect:withFont:lineBreakMode:alignment:lineSpacing:includeEmoji:", a3, a4, a5, 0, 1);
}

- (uint64_t)_legacy_drawInRect:()UIStringDrawingLegacy withFont:lineBreakMode:alignment:lineSpacing:
{
  return objc_msgSend(a1, "_legacy_drawInRect:withFont:lineBreakMode:alignment:lineSpacing:includeEmoji:", a3, a4, a5, a6, 1);
}

- (uint64_t)_legacy_drawInRect:()UIStringDrawingLegacy withFont:lineBreakMode:alignment:lineSpacing:includeEmoji:
{
  return objc_msgSend(a1, "_legacy_drawInRect:withFont:lineBreakMode:alignment:lineSpacing:includeEmoji:truncationRect:", a3, a4, a5, a6, a7, 0);
}

- (double)_legacy_drawInRect:()UIStringDrawingLegacy withFont:lineBreakMode:alignment:lineSpacing:includeEmoji:truncationRect:
{
  id v19;
  id v20;
  id v21;
  _BOOL4 v22;
  uint64_t v23;
  _QWORD *ContextStack;
  UIColor *v25;
  float v26;
  double v27;
  double v28;
  id v29;
  const __CFString *v30;
  double v31;

  v19 = objc_alloc_init((Class)off_1E1679CC0);
  objc_msgSend(v19, "setWrapsForTruncationMode:", 1);
  objc_msgSend(v19, "setMaximumNumberOfLines:", 0);
  v20 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v21 = objc_alloc_init((Class)off_1E1679BC0);
  objc_msgSend(v21, "setLineBreakMode:", UILineBreakToNSLineBreakStyleSingleLineVariant[a8]);
  if (a10)
  {
    if (!v21)
      v21 = objc_alloc_init((Class)off_1E1679BC0);
    objc_msgSend(v21, "setMinimumLineHeight:", (double)a10);
    objc_msgSend(v21, "setMaximumLineHeight:", (double)a10);
  }
  v22 = +[UIView _enableRTL](UIView, "_enableRTL");
  v23 = 4;
  if (!v22)
    v23 = 0;
  if (v23 != a9)
  {
    if (!v21)
      v21 = objc_alloc_init((Class)off_1E1679BC0);
    objc_msgSend(v21, "setAlignment:", UITextAlignmentToNSTextAlignment[a9]);
  }
  objc_msgSend(v20, "setObject:forKey:", v21, *(_QWORD *)off_1E1678F98);
  if (a7)
    objc_msgSend(v20, "setObject:forKey:", a7, *(_QWORD *)off_1E1678D90);
  ContextStack = GetContextStack(0);
  if (*(int *)ContextStack >= 1)
  {
    if (ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1])
    {
      v25 = +[UIColor colorWithCGColor:](UIColor, "colorWithCGColor:", CGContextGetFillColorAsColor());
      if (v25)
        objc_msgSend(v20, "setObject:forKey:", v25, *(_QWORD *)off_1E1678D98);
    }
  }
  objc_msgSend(a7, "lineHeight");
  *(float *)&v27 = v27;
  v26 = a5;
  v28 = fmaxf(v26, *(float *)&v27);
  v29 = objc_alloc(MEMORY[0x1E0CB3498]);
  if (a1)
    v30 = a1;
  else
    v30 = &stru_1E16EDF20;
  objc_msgSend((id)objc_msgSend(v29, "initWithString:attributes:", v30, v20), "drawWithRect:options:context:", 65, v19, a2, a3, a4, v28);
  objc_msgSend(v19, "totalBounds");
  return v31;
}

- (uint64_t)_legacy_sizeWithFont:()UIStringDrawingLegacy minFontSize:actualFontSize:forWidth:lineBreakMode:
{
  void *v12;
  double v13;
  double v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double i;
  void *v21;
  double v22;
  double v23;
  BOOL v25;
  double j;
  double v27;
  id v29;
  uint64_t v30;

  if (a5)
  {
    v12 = (void *)result;
    objc_msgSend(a5, "pointSize");
    v14 = v13;
    v15 = *(_QWORD *)off_1E1678D90;
    result = objc_msgSend(v12, "sizeWithAttributes:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", a5, *(_QWORD *)off_1E1678D90));
    if (v16 <= 0.0)
    {
      if (a6)
        *a6 = 0.0;
    }
    else
    {
      v17 = round(v14 * (a3 / v16) + v14 * (a3 / v16)) * 0.5;
      v18 = a2;
      if (v17 >= a2)
      {
        v18 = v17;
        if (v17 > v14)
          v18 = v14;
      }
      v19 = a5;
      for (i = v18; ; i = v23)
      {
        v21 = (void *)objc_msgSend(v19, "fontWithSize:", i);
        result = objc_msgSend(v12, "sizeWithAttributes:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v21, v15));
        v23 = round(v18 + 0.5 + v18 + 0.5) * 0.5;
        if (v22 >= a3 || v23 > v14)
          break;
        v18 = v23;
        v19 = v21;
      }
      v25 = v22 <= a3;
      for (j = round(v18 + -0.5 + v18 + -0.5); ; j = round(v18 + -0.5 + v18 + -0.5))
      {
        v27 = j * 0.5;
        if (v25 || v27 < a2)
          break;
        v18 = v27;
        v21 = (void *)objc_msgSend(v21, "fontWithSize:", v27);
        result = objc_msgSend(v12, "sizeWithAttributes:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v21, v15));
        v25 = v22 <= a3;
      }
      if (a6)
        *a6 = v18;
      if (v22 > a3)
      {
        v29 = objc_alloc_init((Class)off_1E1679BC0);
        objc_msgSend(v29, "setLineBreakMode:", UILineBreakToNSLineBreakStyleSingleLineVariant[a7]);
        v30 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", v29, *(_QWORD *)off_1E1678F98, v21, v15, 0);

        return objc_msgSend(v12, "boundingRectWithSize:options:attributes:context:", 0, v30, 0, a3, 3.40282347e38);
      }
    }
  }
  return result;
}

- (uint64_t)_legacy_drawAtPoint:()UIStringDrawingLegacy forWidth:withFont:fontSize:lineBreakMode:baselineAdjustment:includeEmoji:
{
  void *v19;
  double v20;
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

  objc_msgSend(a7, "pointSize");
  v19 = a7;
  if (v20 != a5)
    v19 = (void *)objc_msgSend(a7, "fontWithSize:", a5);
  if (a9 == 1)
  {
    objc_msgSend(a7, "ascender");
    v26 = v25;
    objc_msgSend(v19, "ascender");
    v28 = v27;
    objc_msgSend(a7, "capHeight");
    v30 = v29;
    objc_msgSend(v19, "capHeight");
    v24 = round(v26 - v30 * 0.5 - (v28 - v31 * 0.5));
    goto LABEL_7;
  }
  if (!a9)
  {
    objc_msgSend(a7, "ascender");
    v22 = v21;
    objc_msgSend(v19, "ascender");
    v24 = v22 - v23;
LABEL_7:
    a3 = a3 + v24;
  }
  return objc_msgSend(a1, "_legacy_drawAtPoint:forWidth:withFont:lineBreakMode:letterSpacing:includeEmoji:", v19, a8, a10, a2, a3, a4, 0.0);
}

- (uint64_t)_legacy_drawAtPoint:()UIStringDrawingLegacy forWidth:withFont:fontSize:lineBreakMode:baselineAdjustment:
{
  return objc_msgSend(a1, "_legacy_drawAtPoint:forWidth:withFont:fontSize:lineBreakMode:baselineAdjustment:includeEmoji:", a3, a4, a5, 1);
}

- (uint64_t)_legacy_drawAtPoint:()UIStringDrawingLegacy forWidth:withFont:minFontSize:actualFontSize:lineBreakMode:baselineAdjustment:includeEmoji:
{
  uint64_t result;
  double v21;

  v21 = 0.0;
  objc_msgSend(a1, "_legacy_sizeWithFont:minFontSize:actualFontSize:forWidth:lineBreakMode:", a7, &v21, a5, a4);
  result = objc_msgSend(a1, "_legacy_drawAtPoint:forWidth:withFont:fontSize:lineBreakMode:baselineAdjustment:includeEmoji:", a7, a9, a10, a11, a2, a3, a4, v21);
  if (a8)
    *a8 = v21;
  return result;
}

- (uint64_t)_legacy_drawAtPoint:()UIStringDrawingLegacy forWidth:withFont:minFontSize:actualFontSize:lineBreakMode:baselineAdjustment:
{
  return objc_msgSend(a1, "_legacy_drawAtPoint:forWidth:withFont:minFontSize:actualFontSize:lineBreakMode:baselineAdjustment:includeEmoji:", a3, a4, a5, a6, 1);
}

@end
