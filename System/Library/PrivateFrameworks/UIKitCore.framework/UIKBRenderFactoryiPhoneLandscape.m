@implementation UIKBRenderFactoryiPhoneLandscape

- (UIEdgeInsets)wideShadowPaddleInsets
{
  double v3;
  double v4;
  double v5;
  double v6;
  objc_super v7;
  UIEdgeInsets result;

  if (-[UIKBRenderFactory dynamicFactory](self, "dynamicFactory"))
  {
    v7.receiver = self;
    v7.super_class = (Class)UIKBRenderFactoryiPhoneLandscape;
    -[UIKBRenderFactoryiPhone wideShadowPaddleInsets](&v7, sel_wideShadowPaddleInsets);
  }
  else
  {
    v4 = 6.0;
    v5 = 22.0;
    v3 = 18.0;
    v6 = 6.0;
  }
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (UIEdgeInsets)variantPaddedFrameInsets
{
  double v3;
  double v4;
  double v5;
  double v6;
  objc_super v7;
  UIEdgeInsets result;

  if (-[UIKBRenderFactory dynamicFactory](self, "dynamicFactory"))
  {
    v7.receiver = self;
    v7.super_class = (Class)UIKBRenderFactoryiPhoneLandscape;
    -[UIKBRenderFactoryiPhone variantPaddedFrameInsets](&v7, sel_variantPaddedFrameInsets);
  }
  else
  {
    v4 = 0.0;
    v3 = -3.0;
    v5 = 0.0;
    v6 = 0.0;
  }
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (UIEdgeInsets)variantDisplayFrameInsets
{
  double v3;
  double v4;
  double v5;
  double v6;
  objc_super v7;
  UIEdgeInsets result;

  if (-[UIKBRenderFactory dynamicFactory](self, "dynamicFactory"))
  {
    v7.receiver = self;
    v7.super_class = (Class)UIKBRenderFactoryiPhoneLandscape;
    -[UIKBRenderFactoryiPhone variantDisplayFrameInsets](&v7, sel_variantDisplayFrameInsets);
  }
  else
  {
    v4 = 0.0;
    v5 = 1.0;
    v3 = 7.0;
    v6 = 0.0;
  }
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (UIEdgeInsets)variantSymbolFrameInsets
{
  double v3;
  double v4;
  double v5;
  double v6;
  objc_super v7;
  UIEdgeInsets result;

  if (-[UIKBRenderFactory dynamicFactory](self, "dynamicFactory"))
  {
    v7.receiver = self;
    v7.super_class = (Class)UIKBRenderFactoryiPhoneLandscape;
    -[UIKBRenderFactoryiPhone variantSymbolFrameInsets](&v7, sel_variantSymbolFrameInsets);
  }
  else
  {
    v4 = 0.0;
    v5 = -4.5;
    v3 = 8.0;
    v6 = 0.0;
  }
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (CGPoint)variantSymbolTextOffset
{
  double v3;
  double v4;
  objc_super v5;
  CGPoint result;

  if (-[UIKBRenderFactory dynamicFactory](self, "dynamicFactory"))
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKBRenderFactoryiPhoneLandscape;
    -[UIKBRenderFactoryiPhone variantSymbolTextOffset](&v5, sel_variantSymbolTextOffset);
  }
  else
  {
    v4 = 1.0;
    v3 = 0.0;
  }
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGPoint)variantAnnotationTextOffset
{
  _BOOL4 v3;
  double v4;
  double v5;
  objc_super v6;
  CGPoint result;

  v3 = -[UIKBRenderFactory dynamicFactory](self, "dynamicFactory");
  v4 = 4.0;
  v5 = 4.0;
  if (v3)
  {
    v6.receiver = self;
    v6.super_class = (Class)UIKBRenderFactoryiPhoneLandscape;
    -[UIKBRenderFactoryiPhone variantAnnotationTextOffset](&v6, sel_variantAnnotationTextOffset, 4.0, 4.0);
  }
  result.y = v5;
  result.x = v4;
  return result;
}

- (CGPoint)popupSymbolTextOffset
{
  double v3;
  double v4;
  objc_super v5;
  CGPoint result;

  if (-[UIKBRenderFactory dynamicFactory](self, "dynamicFactory"))
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKBRenderFactoryiPhoneLandscape;
    -[UIKBRenderFactoryiPhone popupSymbolTextOffset](&v5, sel_popupSymbolTextOffset);
  }
  else
  {
    v4 = -2.5;
    v3 = 0.0;
  }
  result.y = v4;
  result.x = v3;
  return result;
}

- (double)popupFontSize
{
  double result;
  objc_super v4;

  if (!-[UIKBRenderFactory dynamicFactory](self, "dynamicFactory"))
    return 42.0;
  v4.receiver = self;
  v4.super_class = (Class)UIKBRenderFactoryiPhoneLandscape;
  -[UIKBRenderFactoryiPhone popupFontSize](&v4, sel_popupFontSize);
  return result;
}

- (BOOL)isTallPopup
{
  _BOOL4 v3;
  objc_super v5;

  v3 = -[UIKBRenderFactory dynamicFactory](self, "dynamicFactory");
  if (v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKBRenderFactoryiPhoneLandscape;
    LOBYTE(v3) = -[UIKBRenderFactoryiPhone isTallPopup](&v5, sel_isTallPopup);
  }
  return v3;
}

- (double)emojiPopupDividerKeyOffset
{
  double result;
  objc_super v4;

  if (!-[UIKBRenderFactory dynamicFactory](self, "dynamicFactory"))
    return 0.8;
  v4.receiver = self;
  v4.super_class = (Class)UIKBRenderFactoryiPhoneLandscape;
  -[UIKBRenderFactory emojiPopupDividerKeyOffset](&v4, sel_emojiPopupDividerKeyOffset);
  return result;
}

- (double)symbolImageControlKeyFontSize
{
  _BOOL4 v3;
  double result;
  objc_super v5;

  v3 = -[UIKBRenderFactory dynamicFactory](self, "dynamicFactory");
  result = 18.0;
  if (v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKBRenderFactoryiPhoneLandscape;
    -[UIKBRenderFactoryiPhone symbolImageControlKeyFontSize](&v5, sel_symbolImageControlKeyFontSize, 18.0);
  }
  return result;
}

- (UIEdgeInsets)dynamicInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  if (-[UIKBRenderFactory dynamicFactory](self, "dynamicFactory"))
    v2 = 12.0;
  else
    v2 = 4.0;
  v3 = 0.0;
  v4 = 0.0;
  v5 = 2.0;
  result.right = v5;
  result.bottom = v2;
  result.left = v4;
  result.top = v3;
  return result;
}

- (double)dynamicBottomRowMultiplier
{
  return 0.1;
}

- (UIEdgeInsets)dynamicInsetsForNumberOfRows:(unint64_t)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  _BOOL4 v8;
  double v9;
  UIEdgeInsets result;

  if (a3 > 4)
  {
    v8 = -[UIKBRenderFactory dynamicFactory](self, "dynamicFactory");
    v4 = 0.0;
    if (v8)
      v6 = 1.0;
    else
      v6 = 0.0;
    if (v8)
      v9 = 2.0;
    else
      v9 = 1.0;
    v3 = 0.0;
    if (a3 == 5)
    {
      v5 = v9;
    }
    else
    {
      v3 = 0.0;
      v5 = v6;
    }
    if (a3 == 5)
      v6 = v9;
  }
  else
  {
    -[UIKBRenderFactoryiPhoneLandscape dynamicInsets](self, "dynamicInsets");
  }
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (double)_row4ControlSegmentWidthLeft
{
  double v2;

  -[UIKBRenderFactory scale](self, "scale");
  return dbl_186680220[v2 > 2.0];
}

- (double)moreABCKeyFontSize
{
  _BOOL4 v3;
  double result;
  objc_super v5;

  v3 = -[UIKBRenderFactory dynamicFactory](self, "dynamicFactory");
  result = 15.0;
  if (v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKBRenderFactoryiPhoneLandscape;
    -[UIKBRenderFactoryiPhone moreABCKeyFontSize](&v5, sel_moreABCKeyFontSize, 15.0);
  }
  return result;
}

- (CGPoint)more123KeyOffset
{
  double v3;
  double v4;
  objc_super v5;
  CGPoint result;

  if (-[UIKBRenderFactory dynamicFactory](self, "dynamicFactory"))
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKBRenderFactoryiPhoneLandscape;
    -[UIKBRenderFactoryiPhone more123KeyOffset](&v5, sel_more123KeyOffset);
  }
  else
  {
    v4 = 0.5;
    v3 = 0.0;
  }
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGPoint)moreABCKeyOffset
{
  double v3;
  double v4;
  objc_super v5;
  CGPoint result;

  if (-[UIKBRenderFactory dynamicFactory](self, "dynamicFactory"))
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKBRenderFactoryiPhoneLandscape;
    -[UIKBRenderFactoryiPhone moreABCKeyOffset](&v5, sel_moreABCKeyOffset);
  }
  else
  {
    v4 = 0.5;
    v3 = 0.0;
  }
  result.y = v4;
  result.x = v3;
  return result;
}

- (id)multitapCompleteKeyImageName
{
  return CFSTR("kana_multitap_complete_arrow.png");
}

- (id)muttitapReverseKeyImageName
{
  return CFSTR("kana_multitap_reverse_arrow.png");
}

- (double)skinnyKeyThreshold
{
  double result;
  objc_super v4;

  if (!-[UIKBRenderFactory dynamicFactory](self, "dynamicFactory"))
    return 60.0;
  v4.receiver = self;
  v4.super_class = (Class)UIKBRenderFactoryiPhoneLandscape;
  -[UIKBRenderFactoryiPhone skinnyKeyThreshold](&v4, sel_skinnyKeyThreshold);
  return result;
}

- (id)variantGeometriesForGeometry:(id)a3 variantCount:(unint64_t)a4 rowLimit:(int64_t)a5 annotationIndex:(unint64_t)a6
{
  id v10;
  void *v11;
  void *v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  objc_super v18;

  v10 = a3;
  if (-[UIKBRenderFactory dynamicFactory](self, "dynamicFactory"))
  {
    v18.receiver = self;
    v18.super_class = (Class)UIKBRenderFactoryiPhoneLandscape;
    -[UIKBRenderFactoryiPhone variantGeometriesForGeometry:variantCount:rowLimit:annotationIndex:](&v18, sel_variantGeometriesForGeometry_variantCount_rowLimit_annotationIndex_, v10, a4, a5, a6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    return v11;
  }
  else
  {
    v13 = (void *)objc_msgSend(v10, "copy");

    objc_msgSend(v13, "paddedFrame");
    objc_msgSend(v13, "setPaddedFrame:", v14 + -0.5, v16 + 0.0, v15 + 1.0);
    objc_msgSend(v13, "iPhoneVariantGeometries:annotationIndex:", a4, a6);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    return v17;
  }
}

- (id)_traitsForKey:(id)a3 onKeyplane:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  char v22;
  id v23;
  void *v24;
  int v25;
  uint64_t v26;
  void *v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  objc_super v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v34.receiver = self;
  v34.super_class = (Class)UIKBRenderFactoryiPhoneLandscape;
  -[UIKBRenderFactoryiPhone _traitsForKey:onKeyplane:](&v34, sel__traitsForKey_onKeyplane_, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[UIKBRenderFactory dynamicFactory](self, "dynamicFactory"))
  {
    if (!-[UIKBRenderFactoryiPhone _popupStyleForKey:](self, "_popupStyleForKey:", v6)
      && !objc_msgSend(v6, "displayType"))
    {
      objc_msgSend(v6, "name");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "hasPrefix:", CFSTR("Burmese-"));

      if (v10)
      {
        objc_msgSend(v8, "symbolStyle");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "fontSize");
        v13 = round(v12 * 0.9);
        objc_msgSend(v8, "symbolStyle");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setFontSize:", v13);

      }
    }
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    objc_msgSend(v7, "subtrees");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    if (v16)
    {
      v17 = v16;
      v28 = v8;
      v29 = v7;
      v18 = *(_QWORD *)v31;
LABEL_8:
      v19 = 0;
      while (1)
      {
        if (*(_QWORD *)v31 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v19);
        objc_msgSend(v20, "name", v28, v29);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "_containsSubstring:", CFSTR("Assist"));

        if ((v22 & 1) != 0)
          break;
        if (v17 == ++v19)
        {
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
          if (v17)
            goto LABEL_8;
          v23 = 0;
          v8 = v28;
          v7 = v29;
          goto LABEL_24;
        }
      }
      v23 = v20;

      if (!v23)
      {
        v8 = v28;
        v7 = v29;
        goto LABEL_25;
      }
      objc_msgSend(v23, "keys");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "containsObject:", v6);

      v8 = v28;
      v7 = v29;
      if (!v25)
        goto LABEL_25;
      if ((objc_msgSend(v6, "state") & 3) != 0)
      {
        -[UIKBRenderFactoryiPhone controlKeyTraits](self, "controlKeyTraits");
        v26 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if ((objc_msgSend(v6, "state") & 4) == 0)
          goto LABEL_25;
        -[UIKBRenderFactoryiPhone activeControlKeyTraits](self, "activeControlKeyTraits");
        v26 = objc_claimAutoreleasedReturnValue();
      }
      v15 = (void *)v26;
      objc_msgSend(v28, "overlayWithTraits:", v26);
    }
    else
    {
      v23 = 0;
    }
LABEL_24:

LABEL_25:
  }

  return v8;
}

- (id)multiscriptKeyTraitsForKey:(id)a3 style:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
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
  void *v21;
  float v22;
  void *v23;
  void *v24;
  float v25;
  float v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  float v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  float v39;
  objc_super v41;

  v6 = a3;
  v41.receiver = self;
  v41.super_class = (Class)UIKBRenderFactoryiPhoneLandscape;
  -[UIKBRenderFactoryiPhone multiscriptKeyTraitsForKey:style:](&v41, sel_multiscriptKeyTraitsForKey_style_, v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "symbolStyle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "secondarySymbolStyles");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "fontSize");
  v12 = v11;
  objc_msgSend(v10, "fontSize");
  v14 = v13;
  if ((unint64_t)a4 >= 2)
  {
    v17 = 0.0;
    v16 = 0.0;
    v15 = 0.0;
    v18 = 0.0;
    if (a4 == 2)
    {
      objc_msgSend((id)objc_opt_class(), "_textOffsetHints");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("Configuration"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("primaryLandscapeFontSize"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "floatValue");
      v12 = v22;

      objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("Configuration"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("secondaryLandscapeFontSize"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "floatValue");
      v26 = v25;

      objc_msgSend(v6, "displayString");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "secondaryDisplayStrings");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "firstObject");
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (v27)
      {
        -[UIKBRenderFactoryiPhone customizedOffsetForString:isPrimary:isLandscape:](self, "customizedOffsetForString:isPrimary:isLandscape:", v27, 1, 1);
        v18 = v30;
        v15 = v31;
        objc_msgSend(v19, "objectForKeyedSubscript:", v27);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("deltaFontSize"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "floatValue");
        v12 = v12 + v34;

      }
      v14 = v26;
      if (v29)
      {
        -[UIKBRenderFactoryiPhone customizedOffsetForString:isPrimary:isLandscape:](self, "customizedOffsetForString:isPrimary:isLandscape:", v29, 0, 1);
        v16 = v35;
        v17 = v36;
        objc_msgSend(v19, "objectForKeyedSubscript:", v29);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("deltaFontSize"));
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "floatValue");
        v14 = v14 + v39;

      }
    }
  }
  else
  {
    v15 = 2.0;
    v16 = 20.0;
    v17 = -15.0;
    v18 = -15.0;
  }
  objc_msgSend(v8, "setTextOffset:", v18, v15);
  objc_msgSend(v8, "setFontSize:", v12);
  objc_msgSend(v10, "setTextOffset:", v16, v17);
  objc_msgSend(v10, "setFontSize:", v14);

  return v7;
}

@end
