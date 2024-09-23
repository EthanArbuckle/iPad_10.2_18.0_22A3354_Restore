@implementation UIKBRenderFactoryiPad

- (int64_t)assetIdiom
{
  return 1;
}

- (void)setAllowsPaddles:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIKBRenderFactoryiPad;
  -[UIKBRenderFactory setAllowsPaddles:](&v3, sel_setAllowsPaddles_, 1);
}

- (double)keyCornerRadius
{
  return 5.0;
}

- (CGRect)shiftKeySymbolFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = 0.0;
  v3 = 0.0;
  v4 = 20.0;
  v5 = 18.0;
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)dismissKeySymbolFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = 62.0;
  v3 = 60.0;
  v4 = 0.0;
  v5 = 0.0;
  result.size.height = v3;
  result.size.width = v2;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (double)symbolFrameInset
{
  return 12.0;
}

- (double)returnKeySymbolFrameInset
{
  return 6.0;
}

- (double)keyInsetBottom
{
  return 4.0;
}

- (CGPoint)internationalKeyOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = 0.0;
  v3 = -1.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)dictationKeyOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = 0.0;
  v3 = -1.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)deleteKeyOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = 0.0;
  v3 = -1.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)shiftKeyOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = 0.0;
  v3 = -2.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)returnKeyOffset
{
  double v2;
  BOOL v3;
  double v4;
  double v5;
  CGPoint result;

  -[UIKBRenderFactory scale](self, "scale");
  v3 = v2 == 2.0;
  v4 = 0.0;
  if (!v3)
    v4 = *MEMORY[0x1E0C9D538];
  v5 = -0.5;
  if (!v3)
    v5 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  result.y = v5;
  result.x = v4;
  return result;
}

- (CGPoint)symbolImageControlKeyOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = 0.0;
  v3 = -1.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)ZWNJKeyOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = 0.0;
  v3 = -1.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (id)multitapCompleteKeyImageName
{
  double v2;
  __CFString *v3;

  -[UIKBRenderFactory RivenFactor:](self, "RivenFactor:", 1.0);
  if (v2 <= 1.0)
    v3 = CFSTR("kana_multitap_complete_arrow.png");
  else
    v3 = CFSTR("kana_multitap_complete_arrow-163r.png");
  return v3;
}

- (id)muttitapReverseKeyImageName
{
  double v2;
  __CFString *v3;

  -[UIKBRenderFactory RivenFactor:](self, "RivenFactor:", 1.0);
  if (v2 <= 1.0)
    v3 = CFSTR("kana_multitap_reverse_arrow.png");
  else
    v3 = CFSTR("kana_multitap_reverse_arrow-163r.png");
  return v3;
}

- (id)messagesWriteboardKeyImageName
{
  return CFSTR("messages_writeboard_portrait.png");
}

- (id)ZWNJKeyImageName
{
  return CFSTR("ZWNJ_portrait.png");
}

- (id)capslockKeyImageName
{
  return CFSTR("capslock");
}

- (id)tabKeyImageName
{
  return CFSTR("arrow.right.to.line");
}

- (id)returnKeyImageName
{
  return CFSTR("return");
}

- (double)skinnyKeyThreshold
{
  return -1.0;
}

- (double)predictiveKeyCornerRadius
{
  return 4.0;
}

- (BOOL)iPadFudgeLayout
{
  return 0;
}

- (BOOL)iPadSansHomeButtonLayout
{
  return 0;
}

- (UIEdgeInsets)wideShadowPaddleInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 15.0;
  v3 = 5.0;
  v4 = 0.0;
  v5 = 2.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (UIEdgeInsets)variantPaddedFrameInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 0.0;
  v3 = 0.0;
  v4 = 0.0;
  v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (UIEdgeInsets)variantDisplayFrameInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = -40.0;
  v3 = -40.0;
  v4 = -40.0;
  v5 = -40.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (UIEdgeInsets)variantSymbolFrameInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 0.0;
  v3 = 0.0;
  v4 = 0.0;
  v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (CGPoint)variantAnnotationTextOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = 6.0;
  v3 = 6.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (BOOL)_onLeftSide:(id)a3 onKeyplane:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  BOOL v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double MidX;
  CGRect v19;
  CGRect v20;

  v5 = a4;
  v6 = a3;
  if (objc_msgSend(v6, "dynamicLayout"))
  {
    v7 = objc_msgSend(v6, "dynamicDisplayCorner");

    v8 = v7 != 8;
  }
  else
  {
    objc_msgSend(v6, "frame");
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;

    v19.origin.x = v10;
    v19.origin.y = v12;
    v19.size.width = v14;
    v19.size.height = v16;
    MidX = CGRectGetMidX(v19);
    objc_msgSend(v5, "frame");
    v8 = MidX < CGRectGetMidX(v20);
  }

  return v8;
}

- (BOOL)supportsInputTraits:(id)a3 forKeyplane:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  BOOL v11;

  v5 = a4;
  if (objc_msgSend(a3, "keyboardType") != 12)
  {
    +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "preferencesActions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "BOOLForPreferenceKey:", CFSTR("GesturesEnabled"));

    if (!v8)
      goto LABEL_5;
  }
  objc_msgSend(v5, "firstCachedKeyWithName:", CFSTR("International-Key"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "displayRowHint");

  if (v10 == 5)
    v11 = 0;
  else
LABEL_5:
    v11 = 1;

  return v11;
}

- (double)cornerRadiusForKey:(id)a3
{
  id v4;
  int v5;
  double v6;
  void *v7;
  double v8;
  double v9;

  v4 = a3;
  v5 = objc_msgSend(v4, "displayType");
  if (v5 == 48)
  {
    objc_msgSend(v4, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0.0;
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("SelectionBackground")))
    {
      -[UIKBRenderFactoryiPad predictiveKeyCornerRadius](self, "predictiveKeyCornerRadius");
      v8 = v9;
    }

  }
  else
  {
    if (v5 == 47)
      -[UIKBRenderFactoryiPad predictiveKeyCornerRadius](self, "predictiveKeyCornerRadius");
    else
      -[UIKBRenderFactoryiPad keyCornerRadius](self, "keyCornerRadius");
    v8 = v6;
  }

  return v8;
}

- (CGRect)insetFrame:(CGRect)a3 forKey:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (objc_msgSend(a4, "displayType") != 48)
  {
    -[UIKBRenderFactoryiPad keyInsetBottom](self, "keyInsetBottom");
    x = x + 3.0;
    width = width + -6.0;
    y = y + 1.0;
    height = height - (v9 + 1.0);
  }
  v10 = x;
  v11 = y;
  v12 = width;
  v13 = height;
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (id)displayContentsForKey:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  uint64_t v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  void *v22;
  void *v23;
  _BOOL8 v24;
  void *v25;
  void *v26;
  objc_super v27;

  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)UIKBRenderFactoryiPad;
  -[UIKBRenderFactory displayContentsForKey:](&v27, sel_displayContentsForKey_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "interactionType") == 17)
  {
    objc_msgSend(v5, "setStringKeycapOverImage:", 1);
    -[UIKBRenderFactory undoKeyImageName](self, "undoKeyImageName");
    v6 = objc_claimAutoreleasedReturnValue();
LABEL_19:
    v19 = (void *)v6;
    objc_msgSend(v5, "setDisplayStringImage:", v6);

LABEL_20:
    objc_msgSend(v5, "setFlipImageHorizontally:", -[UIKBRenderFactory keyIsRightToLeftSensitive:](self, "keyIsRightToLeftSensitive:", v4));
    goto LABEL_21;
  }
  if (objc_msgSend(v4, "interactionType") == 12)
  {
    objc_msgSend(v5, "setStringKeycapOverImage:", 1);
    -[UIKBRenderFactory redoKeyImageName](self, "redoKeyImageName");
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
  if (objc_msgSend(v4, "interactionType") == 37)
  {
    objc_msgSend(v4, "overrideDisplayString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v5, "setDisplayString:", v7);
    }
    else
    {
      objc_msgSend(v4, "displayString");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setDisplayString:", v18);

    }
    -[UIKBRenderFactoryiPad tabKeyImageName](self, "tabKeyImageName");
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
  if (objc_msgSend(v4, "interactionType") == 13)
  {
    objc_msgSend(v4, "overrideDisplayString");
    v8 = objc_claimAutoreleasedReturnValue();
    if (!v8)
      goto LABEL_11;
    v9 = (void *)v8;
    objc_msgSend(v4, "overrideDisplayString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "displayString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqualToString:", v11);

    if ((v12 & 1) == 0)
    {
      objc_msgSend(v5, "setDisplayStringImage:", 0);
    }
    else
    {
LABEL_11:
      objc_msgSend(v5, "displayString");
      v13 = objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        v14 = (void *)v13;
        v15 = objc_msgSend(v5, "forceImageKeycap");

        if ((v15 & 1) == 0)
        {
          -[UIKBRenderFactoryiPad returnKeyImageName](self, "returnKeyImageName");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setDisplayStringImage:", v16);

        }
      }
    }
    if (!objc_msgSend(v5, "forceImageKeycap")
      || (objc_msgSend(v5, "displayStringImage"),
          v21 = (void *)objc_claimAutoreleasedReturnValue(),
          v21,
          !v21))
    {
      objc_msgSend(v4, "overrideDisplayString");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v22)
      {
        objc_msgSend(v5, "setDisplayString:", v22);
      }
      else
      {
        objc_msgSend(v4, "displayString");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setDisplayString:", v23);

      }
    }
    v24 = (objc_msgSend(v5, "forceImageKeycap") & 1) == 0
       && -[UIKBRenderFactory preferStringKeycapOverImage](self, "preferStringKeycapOverImage");
    objc_msgSend(v5, "setStringKeycapOverImage:", v24);
    goto LABEL_20;
  }
  if (objc_msgSend(v4, "interactionType") == 38)
  {
    objc_msgSend(v4, "overrideDisplayString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(v5, "setDisplayString:", v17);
    }
    else
    {
      objc_msgSend(v4, "displayString");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setDisplayString:", v25);

    }
    if (objc_msgSend(v4, "state") < 3)
      -[UIKBRenderFactoryiPad capslockKeyImageName](self, "capslockKeyImageName");
    else
      -[UIKBRenderFactory shiftLockImageName](self, "shiftLockImageName");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDisplayStringImage:", v26);

  }
LABEL_21:

  return v5;
}

- (void)_customizeGeometry:(id)a3 forKey:(id)a4 contents:(id)a5
{
  id v7;
  double v8;
  double v9;
  int v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  uint64_t v22;
  double v24;
  double v25;
  CGFloat v26;
  CGFloat v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  id v43;

  v43 = a3;
  v7 = a4;
  -[UIKBRenderFactoryiPad cornerRadiusForKey:](self, "cornerRadiusForKey:", v7);
  objc_msgSend(v43, "setRoundRectRadius:");
  objc_msgSend(v43, "paddedFrame");
  -[UIKBRenderFactoryiPad insetFrame:forKey:](self, "insetFrame:forKey:", v7);
  objc_msgSend(v43, "setPaddedFrame:");
  -[UIKBRenderFactoryiPad symbolFrameInset](self, "symbolFrameInset");
  v9 = v8;
  v10 = objc_msgSend(v7, "displayType");

  if (v10 <= 13)
  {
    if (v10 == 3)
    {
LABEL_10:
      objc_msgSend(v43, "symbolFrame");
      v26 = 0.0;
      v27 = v9;
LABEL_16:
      *(CGRect *)&v18 = CGRectInset(*(CGRect *)&v22, v27, v26);
      v13 = v41;
      v15 = v42;
    }
    else
    {
      if (v10 != 5)
        goto LABEL_18;
      -[UIKBRenderFactoryiPad dismissKeySymbolFrame](self, "dismissKeySymbolFrame");
      v13 = v12;
      v15 = v14;
      objc_msgSend(v43, "symbolFrame");
      v18 = round(v17 + (v16 - v13) * 0.5);
      v21 = round(v20 + (v19 - v15) * 0.5);
    }
    objc_msgSend(v43, "setSymbolFrame:", v18, v21, v13, v15);
    goto LABEL_18;
  }
  switch(v10)
  {
    case 14:
      goto LABEL_10;
    case 15:
    case 16:
    case 17:
    case 19:
    case 20:
    case 22:
      break;
    case 18:
      -[UIKBRenderFactory rivenSizeFactor](self, "rivenSizeFactor");
      if (v11 > 1.0)
        v9 = 4.0;
      goto LABEL_10;
    case 21:
      -[UIKBRenderFactoryiPad returnKeySymbolFrameInset](self, "returnKeySymbolFrameInset");
      v29 = v28;
      objc_msgSend(v43, "symbolFrame");
      if (v24 - v29 > v25)
        v27 = v29;
      else
        v27 = v29 * 0.5;
      v26 = 0.0;
      goto LABEL_16;
    case 23:
      -[UIKBRenderFactoryiPad shiftKeySymbolFrame](self, "shiftKeySymbolFrame");
      v31 = v30;
      -[UIKBRenderFactory RivenFactor:](self, "RivenFactor:", v32);
      v34 = v33;
      -[UIKBRenderFactory RivenFactor:](self, "RivenFactor:", v31);
      v36 = v35;
      objc_msgSend(v43, "symbolFrame");
      objc_msgSend(v43, "setSymbolFrame:", round(v38 + (v37 - v34) * 0.5), round(v40 + (v39 - v36) * 0.5), v34, v36);
      objc_msgSend(v43, "symbolFrame");
      v27 = -5.0;
      v26 = -5.0;
      goto LABEL_16;
    default:
      if (v10 == 54)
        goto LABEL_10;
      break;
  }
LABEL_18:

}

- (double)stringKeyFontSize
{
  return 22.0;
}

- (CGPoint)stringKeyOffset
{
  double v2;
  BOOL v3;
  double v4;
  double v5;
  CGPoint result;

  -[UIKBRenderFactory scale](self, "scale");
  v3 = v2 == 2.0;
  v4 = 0.0;
  if (!v3)
    v4 = *MEMORY[0x1E0C9D538];
  v5 = 0.5;
  if (!v3)
    v5 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  result.y = v5;
  result.x = v4;
  return result;
}

- (double)dualStringKeyFontSizeAdjustment
{
  return -2.0;
}

- (double)bottomRowDefaultFontSize
{
  return 19.0;
}

- (double)fontSizeAdjustmentForNonAlphanumericKeycaps
{
  return 4.0;
}

- (double)defaultPathWeight
{
  return 1.5;
}

- (double)shiftKeyFontSize
{
  return 18.0;
}

- (double)deleteKeyFontSize
{
  return 17.0;
}

- (double)moreKeyFontSize
{
  return 16.0;
}

- (double)internationalKeyFontSize
{
  return 30.0;
}

- (double)dictationKeyFontSize
{
  return 19.0;
}

- (double)spaceKeyFontSize
{
  return 18.0;
}

- (double)dismissKeyFontSize
{
  return 37.0;
}

- (double)smallKanaKeyFontSize
{
  return 15.0;
}

- (double)emailDotKeyFontSize
{
  return 12.0;
}

- (double)facemarkKeyFontSize
{
  return 22.0;
}

- (double)zhuyinFirstToneKeyFontSize
{
  return 18.0;
}

- (double)symbolImageControlKeyFontSize
{
  return 24.0;
}

- (double)fallbackFontSize
{
  return 22.0;
}

- (double)messagesTypeKeyplanSwitchKeyFontSize
{
  return 16.0;
}

- (double)tinyPunctuationGlyphFontSize
{
  return 40.0;
}

- (CGPoint)tinyPunctuationGlyphOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = 0.0;
  v3 = -2.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)dualStringKeyOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = *MEMORY[0x1E0C9D538];
  v3 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)dismissKeyOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = 0.0;
  v3 = -1.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (id)lowQualityLayeredBackgroundColorName
{
  void *v2;
  int v3;
  __CFString **v4;
  __CFString *v5;

  -[UIKBRenderFactory renderConfig](self, "renderConfig");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "lightKeyboard");
  v4 = UIKBColorGray_Percent55;
  if (!v3)
    v4 = UIKBColorBlack;
  v5 = *v4;

  return v5;
}

- (void)_customizeSymbolStyle:(id)a3 forKey:(id)a4 contents:(id)a5
{
  id v8;
  id v9;
  int v10;
  void *v11;
  int v12;
  BOOL v13;
  int v15;
  int v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  uint64_t v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  BOOL v30;
  double v31;
  double v32;
  void *v33;
  uint64_t v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  int v43;
  void *v44;
  void *v45;
  int v46;
  void *v47;
  void *v48;
  int v49;
  void *v50;
  int v51;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  void *v56;
  int v57;
  int v58;
  void *v59;
  int v60;
  void *v61;
  double v62;
  BOOL v63;
  double v64;
  double v65;
  void *v66;
  double v67;
  double v68;
  BOOL v69;
  double v70;
  double v71;
  void *v72;
  double v73;
  double v74;
  void *v75;
  void *v76;
  int v77;
  void *v78;
  void *v79;
  uint64_t v80;
  void *v81;
  int v82;
  double v83;
  BOOL v84;
  void *v85;
  id v86;

  v86 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_msgSend(v8, "displayType");
  v11 = (void *)objc_msgSend(v8, "interactionType");
  v12 = objc_msgSend(v8, "displayTypeHint");
  v13 = (v10 & 0xFFFFFFF7) == 0 || v10 == 27;
  v15 = v13 || v10 == 7;
  if (v15 == 1 && (_DWORD)v11 != 9 && v12 != 10)
  {
    -[UIKBRenderFactoryiPad stringKeyFontSize](self, "stringKeyFontSize");
    objc_msgSend(v86, "setFontSize:");
    -[UIKBRenderFactory scale](self, "scale");
    v28 = *MEMORY[0x1E0C9D538];
    v29 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    v30 = v27 == 2.0;
    v31 = 0.0;
    if (!v30)
      v31 = *MEMORY[0x1E0C9D538];
    v32 = 0.5;
    if (!v30)
      v32 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    objc_msgSend(v86, "setTextOffset:", v31, v32);
    objc_msgSend(v8, "displayString");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "length");

    if (v34 != 1 && v10 != 7)
      goto LABEL_37;
    objc_msgSend(v8, "displayString");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "characterAtIndex:", 0);

    if ((TICharIsAlphaNumeric() & 1) == 0 && (TICharIsDevanagariPUA() & 1) == 0)
    {
      objc_msgSend(v86, "fontSize");
      v37 = v36;
      -[UIKBRenderFactoryiPad fontSizeAdjustmentForNonAlphanumericKeycaps](self, "fontSizeAdjustmentForNonAlphanumericKeycaps");
      objc_msgSend(v86, "setFontSize:", v37 + v38);
    }
    if (v10 == 7)
    {
      objc_msgSend(v86, "fontSize");
      v40 = v39;
      -[UIKBRenderFactoryiPad dualStringKeyFontSizeAdjustment](self, "dualStringKeyFontSizeAdjustment");
      objc_msgSend(v86, "setFontSize:", v40 + v41);
    }
    else
    {
LABEL_37:
      if (v10 == 27)
        goto LABEL_39;
    }
    objc_msgSend(v8, "name");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v42, "_containsSubstring:", CFSTR("Email-Dot-"));

    if (!v43)
    {
LABEL_40:
      objc_msgSend(v8, "displayString");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = objc_msgSend(v45, "isEqualToString:", CFSTR("匹配"));

      if (v46)
      {
        -[UIKBRenderFactoryiPad bottomRowDefaultFontSize](self, "bottomRowDefaultFontSize");
LABEL_48:
        objc_msgSend(v86, "setFontSize:");
        goto LABEL_63;
      }
      objc_msgSend(v8, "name");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = objc_msgSend(v48, "isEqualToString:", CFSTR("Zhuyin-Letter-FIRST_TONE"));

      if (v49)
      {
        -[UIKBRenderFactoryiPad zhuyinFirstToneKeyFontSize](self, "zhuyinFirstToneKeyFontSize");
        goto LABEL_48;
      }
      objc_msgSend(v8, "name");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = objc_msgSend(v50, "isEqualToString:", CFSTR("Arabic-Thousands-Separator"));

      if (v51)
      {
        -[UIKBRenderFactoryiPad tinyPunctuationGlyphFontSize](self, "tinyPunctuationGlyphFontSize");
        objc_msgSend(v86, "setFontSize:");
        -[UIKBRenderFactoryiPad tinyPunctuationGlyphOffset](self, "tinyPunctuationGlyphOffset");
      }
      else
      {
        objc_msgSend(v8, "representedString");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = objc_msgSend(v56, "isEqualToString:", CFSTR("‌"));

        if (!v57)
          goto LABEL_63;
        -[UIKBRenderFactoryiPad ZWNJKeyOffset](self, "ZWNJKeyOffset");
      }
LABEL_62:
      objc_msgSend(v86, "setTextOffset:", v25, v26);
      goto LABEL_63;
    }
LABEL_39:
    -[UIKBRenderFactoryiPad bottomRowDefaultFontSize](self, "bottomRowDefaultFontSize");
    objc_msgSend(v86, "setFontSize:");
    objc_msgSend(v86, "setTextOffset:", v28, v29);
    -[UIKBRenderFactory lightTextFontName](self, "lightTextFontName");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "setFontName:", v44);

    goto LABEL_40;
  }
  v18 = v12;
  if (v12 != 10)
    v15 = 0;
  if (v15 != 1)
  {
    if (v10 == 3)
    {
      -[UIKBRenderFactory lightTextFontName](self, "lightTextFontName");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v86, "setFontName:", v52);

      objc_msgSend(v86, "setUsesSymbolImage:", 1);
      objc_msgSend(v86, "setFontWeightForSymbolImage:", *(double *)off_1E167DC60);
      -[UIKBRenderFactoryiPad symbolImageControlKeyFontSize](self, "symbolImageControlKeyFontSize");
      objc_msgSend(v86, "setFontSizeForSymbolImage:");
      -[UIKBRenderFactoryiPad deleteKeyFontSize](self, "deleteKeyFontSize");
      -[UIKBRenderFactory RivenFactor:](self, "RivenFactor:");
      objc_msgSend(v86, "setFontSize:");
      -[UIKBRenderFactoryiPad deleteKeyOffset](self, "deleteKeyOffset");
      goto LABEL_62;
    }
    if (v10 == 23)
    {
      -[UIKBRenderFactory lightTextFontName](self, "lightTextFontName");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v86, "setFontName:", v47);

      -[UIKBRenderFactoryiPad shiftKeyFontSize](self, "shiftKeyFontSize");
      -[UIKBRenderFactory RivenFactor:](self, "RivenFactor:");
      objc_msgSend(v86, "setFontSize:");
      objc_msgSend(v86, "setUsesSymbolImage:", 1);
      objc_msgSend(v86, "setFontWeightForSymbolImage:", *(double *)off_1E167DC60);
      -[UIKBRenderFactoryiPad symbolImageControlKeyFontSize](self, "symbolImageControlKeyFontSize");
      objc_msgSend(v86, "setFontSizeForSymbolImage:");
      if (!objc_msgSend(v8, "displayTypeHint"))
      {
        -[UIKBRenderFactoryiPad shiftKeyOffset](self, "shiftKeyOffset");
        goto LABEL_62;
      }
      goto LABEL_63;
    }
    if ((_DWORD)v11 != 9)
    {
      v58 = 1;
      switch(v10)
      {
        case 2:
        case 18:
          -[UIKBRenderFactory lightTextFontName](self, "lightTextFontName");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v86, "setFontName:", v66);

          -[UIKBRenderFactoryiPad moreKeyFontSize](self, "moreKeyFontSize");
          -[UIKBRenderFactory RivenFactor:](self, "RivenFactor:");
          objc_msgSend(v86, "setFontSize:");
          -[UIKBRenderFactory scale](self, "scale");
          v67 = *(double *)(MEMORY[0x1E0C9D538] + 8);
          v69 = v68 == 2.0;
          if (v68 == 2.0)
            v67 = -0.5;
          v70 = 0.0;
          if (!v69)
            v70 = *MEMORY[0x1E0C9D538];
          objc_msgSend(v86, "setTextOffset:", v70, v67, *MEMORY[0x1E0C9D538]);
          if (v10 == 18)
          {
            -[UIKBRenderFactory rivenSizeFactor](self, "rivenSizeFactor");
            if (v71 <= 1.0)
            {
              objc_msgSend(v86, "setIgnoreTextMarginOnKey:", 1);
            }
            else
            {
              objc_msgSend(v9, "displayString");
              v72 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v86, "setIgnoreTextMarginOnKey:", objc_msgSend(v72, "_containsCJScripts") ^ 1);

            }
          }
          goto LABEL_98;
        case 3:
        case 6:
        case 7:
        case 8:
        case 9:
        case 10:
        case 12:
        case 13:
        case 15:
        case 16:
        case 17:
        case 19:
        case 20:
        case 22:
        case 23:
          goto LABEL_89;
        case 4:
          -[UIKBRenderFactoryiPad dictationKeyOffset](self, "dictationKeyOffset");
          objc_msgSend(v86, "setTextOffset:");
          v55 = v86;
          goto LABEL_58;
        case 5:
LABEL_98:
          objc_msgSend(v86, "setUsesSymbolImage:", 1);
          goto LABEL_59;
        case 11:
        case 21:
        case 25:
          objc_msgSend(v9, "displayStringImage");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v11, "containsString:", CFSTR("grinning")) & 1) == 0)
          {
            objc_msgSend(v9, "displayStringImage");
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            v58 = objc_msgSend(v59, "containsString:", CFSTR("return"));

          }
          goto LABEL_81;
        case 14:
          -[UIKBRenderFactory lightTextFontName](self, "lightTextFontName");
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v86, "setFontName:", v78);

          -[UIKBRenderFactory renderingContext](self, "renderingContext");
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          v80 = objc_msgSend(v79, "keyboardType");

          objc_msgSend(v86, "setIgnoreTextMarginOnKey:", v80 == 126);
          if (v80 == 126)
            -[UIKBRenderFactoryiPad messagesTypeKeyplanSwitchKeyFontSize](self, "messagesTypeKeyplanSwitchKeyFontSize");
          else
            -[UIKBRenderFactoryiPad spaceKeyFontSize](self, "spaceKeyFontSize");
          -[UIKBRenderFactory RivenFactor:](self, "RivenFactor:");
          objc_msgSend(v86, "setFontSize:");
          -[UIKBRenderFactory scale](self, "scale");
          v26 = *(double *)(MEMORY[0x1E0C9D538] + 8);
          v84 = v83 == 2.0;
          if (v83 == 2.0)
            v26 = -0.5;
          v25 = 0.0;
          if (!v84)
            v25 = *MEMORY[0x1E0C9D538];
          goto LABEL_62;
        case 24:
          -[UIKBRenderFactoryiPad smallKanaKeyFontSize](self, "smallKanaKeyFontSize");
          goto LABEL_48;
        case 26:
          goto LABEL_81;
        default:
          if (v10 == 51)
          {
LABEL_81:
            if (v10 != 26 && v10 != 51)

            if (v58)
            {
              objc_msgSend(v86, "setUsesSymbolImage:", 1);
              -[UIKBRenderFactoryiPad symbolImageControlKeyFontSize](self, "symbolImageControlKeyFontSize");
              objc_msgSend(v86, "setFontSizeForSymbolImage:");
              objc_msgSend(v86, "setFontWeightForSymbolImage:", *(double *)off_1E167DC60);
              -[UIKBRenderFactoryiPad symbolImageControlKeyOffset](self, "symbolImageControlKeyOffset");
            }
            else
            {
              -[UIKBRenderFactory scale](self, "scale");
              v13 = v74 == 2.0;
              v73 = 0.0;
              if (!v13)
                v73 = *MEMORY[0x1E0C9D538];
            }
            objc_msgSend(v86, "setTextOffset:", v73);
            -[UIKBRenderFactory lightTextFontName](self, "lightTextFontName");
            v75 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v86, "setFontName:", v75);

            -[UIKBRenderFactoryiPad spaceKeyFontSize](self, "spaceKeyFontSize");
          }
          else
          {
LABEL_89:
            objc_msgSend(v8, "name");
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            v77 = objc_msgSend(v76, "_containsSubstring:", CFSTR("Email-Dot-"));

            if (v77)
            {
              -[UIKBRenderFactoryiPad emailDotKeyFontSize](self, "emailDotKeyFontSize");
            }
            else
            {
              objc_msgSend(v8, "name");
              v81 = (void *)objc_claimAutoreleasedReturnValue();
              v82 = objc_msgSend(v81, "hasSuffix:", CFSTR("Chinese-Facemark"));

              if (v82)
              {
                -[UIKBRenderFactoryiPad facemarkKeyFontSize](self, "facemarkKeyFontSize");
              }
              else if (objc_msgSend(v8, "displayRowHint") != 4 || v18 == 10)
              {
                -[UIKBRenderFactoryiPad fallbackFontSize](self, "fallbackFontSize");
              }
              else
              {
                -[UIKBRenderFactory lightTextFontName](self, "lightTextFontName");
                v85 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v86, "setFontName:", v85);

              }
            }
          }
          break;
      }
      goto LABEL_48;
    }
    -[UIKBRenderFactoryiPad internationalKeyOffset](self, "internationalKeyOffset");
    objc_msgSend(v86, "setTextOffset:");
    if (-[UIKBRenderFactoryiPad iPadFudgeLayout](self, "iPadFudgeLayout")
      || -[UIKBRenderFactoryiPad iPadSansHomeButtonLayout](self, "iPadSansHomeButtonLayout"))
    {
      -[UIKBRenderFactory lightTextFontName](self, "lightTextFontName");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v86, "setFontName:", v53);

      -[UIKBRenderFactoryiPad spaceKeyFontSize](self, "spaceKeyFontSize");
      -[UIKBRenderFactory RivenFactor:](self, "RivenFactor:");
      objc_msgSend(v86, "setFontSize:");
    }
    else
    {
      v60 = objc_msgSend(v8, "displayType");
      v54 = v86;
      if (v60)
        goto LABEL_57;
      -[UIKBRenderFactory lightTextFontName](self, "lightTextFontName");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v86, "setFontName:", v61);

      -[UIKBRenderFactoryiPad moreKeyFontSize](self, "moreKeyFontSize");
      -[UIKBRenderFactory RivenFactor:](self, "RivenFactor:");
      objc_msgSend(v86, "setFontSize:");
      -[UIKBRenderFactory scale](self, "scale");
      v63 = v62 == 2.0;
      v64 = 0.0;
      if (!v63)
        v64 = *MEMORY[0x1E0C9D538];
      v65 = -0.5;
      if (!v63)
        v65 = *(double *)(MEMORY[0x1E0C9D538] + 8);
      objc_msgSend(v86, "setTextOffset:", v64, v65, *(double *)(MEMORY[0x1E0C9D538] + 8));
    }
    v54 = v86;
LABEL_57:
    v55 = v54;
LABEL_58:
    objc_msgSend(v55, "setUsesSymbolImage:", 1);
    objc_msgSend(v86, "setFontWeightForSymbolImage:", *(double *)off_1E167DC60);
LABEL_59:
    -[UIKBRenderFactoryiPad symbolImageControlKeyFontSize](self, "symbolImageControlKeyFontSize");
    objc_msgSend(v86, "setFontSizeForSymbolImage:");
    goto LABEL_63;
  }
  -[UIKBRenderFactoryiPad stringKeyFontSize](self, "stringKeyFontSize");
  objc_msgSend(v86, "setFontSize:");
  if (v10 == 7)
  {
    objc_msgSend(v86, "fontSize");
    v20 = v19;
    -[UIKBRenderFactoryiPad dualStringKeyFontSizeAdjustment](self, "dualStringKeyFontSizeAdjustment");
    objc_msgSend(v86, "setFontSize:", v20 + v21);
  }
  objc_msgSend(v8, "representedString");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "length");

  if (v23)
  {
    objc_msgSend(v8, "representedString");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "characterAtIndex:", 0);

    if (uscript_hasScript())
    {
      v25 = 0.0;
      v26 = -2.0;
      goto LABEL_62;
    }
  }
LABEL_63:

}

- (BOOL)shouldClearBaseDisplayStringForVariants:(id)a3
{
  return 0;
}

- (void)_customizePopupTraits:(id)a3 forKey:(id)a4 onKeyplane:(id)a5
{
  id v7;
  id v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  __CFString **v32;
  __CFString *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t i;
  void *v41;
  uint64_t v42;
  void *v43;
  const __CFString *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  double v50;
  double v51;
  double v52;
  double v53;
  __CFString *v54;
  void *v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  void *v60;
  void *v61;
  _BYTE v62[128];
  uint64_t v63;
  CGRect v64;
  CGRect v65;

  v63 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = objc_msgSend(v8, "state");
  objc_msgSend(v7, "geometry");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9 == 16)
  {
    objc_msgSend(v10, "setDetachedVariants:", 1);

    -[UIKBRenderFactory renderConfig](self, "renderConfig");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v12, "lightKeyboard") & 1) != 0)
    {
      -[UIKBRenderFactory renderConfig](self, "renderConfig");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setBlurBlending:", objc_msgSend(v13, "animatedBackground"));

    }
    else
    {
      objc_msgSend(v7, "setBlurBlending:", 1);
    }

  }
  else
  {
    objc_msgSend(v10, "setPopupBias:", 0);

    objc_msgSend(v7, "setBlurBlending:", 1);
    objc_msgSend(v7, "setRenderFlagsForAboveEffects:", 2);
  }
  -[UIKBRenderFactory suppressLayoutSegments](self, "suppressLayoutSegments");
  if (!-[UIKBRenderFactory lightweightFactory](self, "lightweightFactory"))
  {
    -[UIKBRenderFactory defaultKeyBackgroundColorName](self, "defaultKeyBackgroundColorName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIKBGradient gradientWithFlatColor:](UIKBGradient, "gradientWithFlatColor:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBackgroundGradient:", v15);

    -[UIKBRenderFactory renderConfig](self, "renderConfig");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v14) = objc_msgSend(v16, "lightKeyboard");

    if ((_DWORD)v14 && (objc_msgSend(v8, "state") & 0x10) != 0)
    {
      +[UIKBEdgeEffect effectWithColor:edges:inset:weight:](UIKBEdgeEffect, "effectWithColor:edges:inset:weight:", CFSTR("UIKBColorBlack_Alpha12"), 15, -0.25, 0.5);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addRenderEffect:", v17);

    }
    -[UIKBRenderFactoryiPad wideShadowPaddleInsets](self, "wideShadowPaddleInsets");
    +[UIKBShadowEffect effectWithColor:offset:insets:weight:](UIKBShadowEffect, "effectWithColor:offset:insets:weight:", CFSTR("UIKBColorBlack_Alpha35"), 0.0, 2.0, v18, v19, v20, v21, 4.5);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addRenderEffect:", v22);

    if ((objc_msgSend(v8, "state") & 0x10) != 0)
    {
      -[UIKBRenderFactoryiPad lightKeycapsFontName](self, "lightKeycapsFontName");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIKBTextStyle styleWithFontName:withFontSize:](UIKBTextStyle, "styleWithFontName:withFontSize:", v23, 22.0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v8, "displayType") == 27 || objc_msgSend(v8, "variantType") == 4)
      {
        -[UIKBRenderFactory lightTextFontName](self, "lightTextFontName");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setFontName:", v25);

        objc_msgSend(v24, "setFontSize:", 16.0);
      }
      objc_msgSend(v24, "setTextOffset:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
      objc_msgSend(v7, "symbolStyle");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "textColor");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setTextColor:", v27);

      +[UIKBRenderTraits traitsWithSymbolStyle:](UIKBRenderTraits, "traitsWithSymbolStyle:", v24);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setVariantTraits:", v28);

      +[UIKBRenderTraits traitsWithSymbolStyle:](UIKBRenderTraits, "traitsWithSymbolStyle:", 0);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKBRenderFactory renderConfig](self, "renderConfig");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "lightKeyboard");
      v32 = UIKBColorKeyBlueKeyBackground;
      if (!v31)
        v32 = UIKBColorBlack_Alpha30;
      v33 = *v32;

      +[UIKBGradient gradientWithFlatColor:](UIKBGradient, "gradientWithFlatColor:", v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setLayeredForegroundGradient:", v34);

      +[UIKBTextStyle styleWithTextColor:](UIKBTextStyle, "styleWithTextColor:", CFSTR("UIKBColorWhite"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setSymbolStyle:", v35);

      objc_msgSend(v7, "setHighlightedVariantTraits:", v29);
      v58 = 0u;
      v59 = 0u;
      v56 = 0u;
      v57 = 0u;
      objc_msgSend(v8, "subtrees");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v56, v62, 16);
      if (v37)
      {
        v38 = v37;
        v54 = v33;
        v55 = v24;
        v39 = *(_QWORD *)v57;
        while (2)
        {
          for (i = 0; i != v38; ++i)
          {
            if (*(_QWORD *)v57 != v39)
              objc_enumerationMutation(v36);
            objc_msgSend(*(id *)(*((_QWORD *)&v56 + 1) + 8 * i), "secondaryDisplayStrings");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            v42 = objc_msgSend(v41, "count");

            if (v42)
            {

              v24 = v55;
              v36 = (void *)objc_msgSend(v55, "copy");
              -[UIKBRenderFactoryiPhone variantAnnotationTextFontSize](self, "variantAnnotationTextFontSize");
              objc_msgSend(v36, "setFontSize:");
              -[UIKBRenderFactory renderConfig](self, "renderConfig");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v43, "lightKeyboard"))
                v44 = CFSTR("UIKBColorBlack_Alpha40");
              else
                v44 = CFSTR("UIKBColorWhite");
              objc_msgSend(v36, "setTextColor:", v44);

              objc_msgSend(v36, "setAnchorCorner:", 2);
              -[UIKBRenderFactoryiPad variantAnnotationTextOffset](self, "variantAnnotationTextOffset");
              objc_msgSend(v36, "setTextOffset:");
              v61 = v36;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v61, 1);
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "variantTraits");
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v46, "setSecondarySymbolStyles:", v45);

              +[UIKBTextStyle styleWithTextColor:](UIKBTextStyle, "styleWithTextColor:", CFSTR("UIKBColorWhite"));
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              v60 = v47;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v60, 1);
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "setSecondarySymbolStyles:", v48);

              goto LABEL_30;
            }
          }
          v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v56, v62, 16);
          if (v38)
            continue;
          break;
        }
        v24 = v55;
LABEL_30:
        v33 = v54;
      }

    }
    objc_msgSend(v7, "geometry");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "displayTypeHint") == 10 && objc_msgSend(v8, "state") == 4)
    {
      objc_msgSend(v49, "displayFrame");
      v51 = v50;
      v53 = v52;
      objc_msgSend(v49, "displayFrame");
      v65 = CGRectInset(v64, v51 * -0.5, v53 * -0.5);
      objc_msgSend(v49, "setDisplayFrame:", v65.origin.x, v65.origin.y, v65.size.width, v65.size.height);
    }

  }
}

- (CGSize)defaultVariantGeometrySize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 62.0;
  v3 = 66.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (int64_t)rowLimitForKey:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  int64_t v7;

  v3 = a3;
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("EmojiPopupKey"));

  if (v5)
  {
    objc_msgSend(v3, "subtrees");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

  }
  else
  {
    v7 = 5;
  }

  return v7;
}

- (id)variantGeometriesForGeometry:(id)a3 variantCount:(unint64_t)a4 rowLimit:(int64_t)a5 annotationIndex:(unint64_t)a6
{
  id v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
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
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  double v41;
  double v42;
  double v43;
  double v44;

  v9 = a3;
  objc_msgSend(v9, "paddedFrame");
  v11 = v10;
  -[UIKBRenderFactoryiPad defaultVariantSizeThreshold](self, "defaultVariantSizeThreshold");
  v12 = v9;
  if (v11 > v13)
  {
    v12 = (void *)objc_msgSend(v9, "copy");

    objc_msgSend(v12, "paddedInsets");
    v43 = v15;
    v44 = v14;
    v41 = v17;
    v42 = v16;
    objc_msgSend(v12, "paddedFrame");
    v19 = v18;
    v21 = v20;
    -[UIKBRenderFactoryiPad defaultVariantGeometrySize](self, "defaultVariantGeometrySize");
    v23 = v22;
    v25 = v24;
    objc_msgSend(v12, "paddedFrame");
    v27 = v26;
    v29 = v28;
    v31 = v30;
    v33 = v32;
    -[UIKBRenderFactory scale](self, "scale");
    UIRectCenteredXInRectScale(v19, v21, v23, v25, v27, v29, v31, v33, v34);
    objc_msgSend(v12, "setPaddedFrame:");
    objc_msgSend(v12, "paddedFrame");
    objc_msgSend(v12, "setSymbolFrame:");
    objc_msgSend(v12, "frame");
    objc_msgSend(v12, "setFrame:", v35 - v42, v37 - v44, v36 - (-v42 - v43), v38 - (-v41 - v44));
  }
  objc_msgSend(v12, "iPadVariantGeometries:rowLimit:", a4, a5);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  return v39;
}

- (id)_traitsForKey:(id)a3 onKeyplane:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  int v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  void *v38;
  void *v39;
  int v40;
  double v41;
  double v42;
  void *v43;
  double v44;
  void *v45;
  double v46;
  double v47;
  double v48;
  double v49;
  void *v50;
  void *v51;
  unint64_t v52;
  void *v53;
  objc_super v55;

  v6 = a3;
  v7 = a4;
  v55.receiver = self;
  v55.super_class = (Class)UIKBRenderFactoryiPad;
  -[UIKBRenderFactoryiPhone _traitsForKey:onKeyplane:](&v55, sel__traitsForKey_onKeyplane_, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "displayType");
  if (-[UIKBRenderFactoryiPhone _popupMenuStyleForKey:](self, "_popupMenuStyleForKey:", v6))
  {
    -[UIKBRenderFactory renderingContext](self, "renderingContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBRenderFactoryiPad lightKeycapsFontName](self, "lightKeycapsFontName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBRenderFactoryiPad _customizeTraits:forPopupForKey:withRenderingContext:keycapsFontName:](self, "_customizeTraits:forPopupForKey:withRenderingContext:keycapsFontName:", v8, v6, v10, v11);

LABEL_3:
    goto LABEL_30;
  }
  if (-[UIKBRenderFactoryiPhone _shouldConfigureSecondarySymbolStyleForSpaceKey:](self, "_shouldConfigureSecondarySymbolStyleForSpaceKey:", v6))
  {
    objc_msgSend(v8, "secondarySymbolStyles");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "setFontSize:", 15.0);
    objc_msgSend(v13, "setTextOffset:", 8.0, 8.0);

  }
  if ((objc_msgSend(v6, "interactionType") == 1 || objc_msgSend(v6, "interactionType") == 2)
    && objc_msgSend(v6, "state") == 4)
  {
    -[UIKBRenderFactoryiPhone controlKeyTraits](self, "controlKeyTraits");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "overlayWithTraits:", v14);

  }
  if (v9 <= 7)
  {
    if (v9)
    {
      if (v9 != 7)
        goto LABEL_30;
      -[UIKBRenderFactoryiPad dualStringKeyOffset](self, "dualStringKeyOffset");
      v16 = v15;
      v18 = v17;
      objc_msgSend(v8, "symbolStyle");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "textOffset");
      v21 = v20;
      v23 = v22;

      objc_msgSend(v8, "symbolStyle");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setTextOffset:", v16 + v21, v18 + v23);

      objc_msgSend(v8, "secondarySymbolStyles");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "firstObject");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v26, "textOffset");
      objc_msgSend(v26, "setTextOffset:", v16 + v27, v18 + v28);

    }
LABEL_18:
    objc_msgSend(v7, "firstCachedKeyWithName:", CFSTR("International-Key"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "displayRowHint");

    if (objc_msgSend(v6, "displayRowHint") == v30
      && objc_msgSend(v6, "interactionType") != 9)
    {
      -[UIKBRenderFactory suppressLayoutSegments](self, "suppressLayoutSegments");
    }
    objc_msgSend(v6, "displayString");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "isEqualToString:", CFSTR("kr"));

    if (v32)
    {
      -[UIKBRenderFactory lightTextFontName](self, "lightTextFontName");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "symbolStyle");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setFontName:", v33);
    }
    else
    {
      objc_msgSend(v6, "secondaryDisplayStrings");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "firstObject");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v36, "isEqualToString:", CFSTR("kr"));

      if (!v37)
        goto LABEL_30;
      -[UIKBRenderFactory lightTextFontName](self, "lightTextFontName");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "secondarySymbolStyles");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "firstObject");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "setFontName:", v33);

    }
    goto LABEL_30;
  }
  if (v9 == 8)
    goto LABEL_18;
  if (v9 != 21)
  {
    if (v9 != 25)
      goto LABEL_30;
    goto LABEL_18;
  }
  objc_msgSend(v8, "symbolStyle");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v39, "usesSymbolImage");

  if (v40)
  {
    -[UIKBRenderFactoryiPad symbolImageControlKeyFontSize](self, "symbolImageControlKeyFontSize");
    v42 = v41;
    objc_msgSend(v8, "symbolStyle");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setFontSizeForSymbolImage:", v42);

    v44 = *(double *)off_1E167DC60;
    objc_msgSend(v8, "symbolStyle");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setFontWeightForSymbolImage:", v44);

    -[UIKBRenderFactoryiPad symbolImageControlKeyOffset](self, "symbolImageControlKeyOffset");
    v47 = v46;
    v49 = v48;
    objc_msgSend(v8, "symbolStyle");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "setTextOffset:", v47, v49);

    objc_msgSend(v7, "cachedKeysByKeyName:", CFSTR("Return-Key"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v51, "count");

    if (v52 >= 2)
    {
      objc_msgSend(v8, "symbolStyle");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "setAnchorCorner:", 8);

      objc_msgSend(v8, "symbolStyle");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setTextOffset:", 3.0, 10.0);
      goto LABEL_3;
    }
  }
LABEL_30:

  return v8;
}

- (double)_row4ControlSegmentWidthLeft
{
  return 0.24;
}

- (double)_row4ControlSegmentWidthRight
{
  void *v3;
  double v4;
  double v5;

  -[UIKBRenderFactory renderingContext](self, "renderingContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "keyboardType") == 126)
  {
    v4 = 0.35;
  }
  else
  {
    -[UIKBRenderFactoryiPad _row4ControlSegmentWidthLeft](self, "_row4ControlSegmentWidthLeft");
    v4 = v5;
  }

  return v4;
}

- (void)setupLayoutSegments
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  -[UIKBRenderFactoryiPad _row4ControlSegmentWidthLeft](self, "_row4ControlSegmentWidthLeft");
  v4 = v3;
  -[UIKBRenderFactoryiPad _row4ControlSegmentWidthRight](self, "_row4ControlSegmentWidthRight");
  v6 = 1.0 - v5;
  -[UIKBRenderFactoryiPad _row4ControlSegmentWidthRight](self, "_row4ControlSegmentWidthRight");
  v8 = v7;
  -[UIKBRenderFactoryiPhone controlKeyTraits](self, "controlKeyTraits");
  v23 = (id)objc_claimAutoreleasedReturnValue();
  +[UIKBRenderFactoryLayoutSegment segmentWithTraits:](UIKBRenderFactoryLayoutSegment, "segmentWithTraits:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setKeyStates:", 3);
  objc_msgSend(v9, "addRelativeLayoutRectFromEdge:ofCachedKey:", 10, CFSTR("Shift-Key"));
  objc_msgSend(v9, "addRelativeLayoutRectFromEdge:ofCachedKey:", 2, CFSTR("Delete-Key"));
  objc_msgSend(v9, "addRelativeLayoutRectFromEdge:ofCachedKey:", 2, CFSTR("Return-Key"));
  v10 = 8;
  objc_msgSend(v9, "addRelativeLayoutRectFromEdge:ofCachedKey:", 8, CFSTR("Tab-Key"));
  objc_msgSend(v9, "addRelativeLayoutRectFromEdge:ofCachedKey:", 8, CFSTR("Caps-Lock-Key"));
  objc_msgSend(v9, "addRelativeLayoutRectFromEdge:ofCachedKey:", 8, CFSTR("Roman-to-Non-Roman-Switch-Key"));
  objc_msgSend(v9, "addRelativeLayoutRectFromEdge:ofCachedKey:", 8, CFSTR("Non-Roman-to-Roman-Switch-Key"));
  if (!-[UIKBRenderFactoryiPad iPadFudgeLayout](self, "iPadFudgeLayout"))
  {
    if (-[UIKBRenderFactoryiPad iPadSansHomeButtonLayout](self, "iPadSansHomeButtonLayout"))
      v10 = 8;
    else
      v10 = 2;
  }
  objc_msgSend(v9, "addRelativeLayoutRectFromEdge:ofCachedKey:", v10, CFSTR("Undo-Key"));
  objc_msgSend(v9, "addRelativeLayoutRectFromEdge:ofCachedKey:", v10, CFSTR("Redo-Key"));
  objc_msgSend(v9, "addLayoutRect:asTriangle:", 0, 0.0, 0.8, v4, 0.2);
  objc_msgSend(v9, "addLayoutRect:asTriangle:", 0, v6, 0.8, v8, 0.2);
  -[UIKBRenderFactory addLayoutSegment:](self, "addLayoutSegment:", v9);
  -[UIKBRenderFactoryiPhone shiftDeleteGlyphTraits](self, "shiftDeleteGlyphTraits");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKBRenderFactoryLayoutSegment segmentWithTraits:](UIKBRenderFactoryLayoutSegment, "segmentWithTraits:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setKeyStates:", 3);
  objc_msgSend(v12, "addRelativeLayoutRectFromEdge:ofCachedKey:", 10, CFSTR("Shift-Key"));
  objc_msgSend(v12, "addRelativeLayoutRectFromEdge:ofCachedKey:", 2, CFSTR("Delete-Key"));
  -[UIKBRenderFactory addLayoutSegment:](self, "addLayoutSegment:", v12);
  +[UIKBRenderFactoryLayoutSegment segmentWithTraits:](UIKBRenderFactoryLayoutSegment, "segmentWithTraits:", v23);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setKeyStates:", 4);
  objc_msgSend(v13, "addLayoutRect:asTriangle:", 0, 0.0, 0.75, 1.0, 0.25);
  -[UIKBRenderFactory addLayoutSegment:](self, "addLayoutSegment:", v13);
  -[UIKBRenderFactoryiPhone shiftedControlKeyTraits](self, "shiftedControlKeyTraits");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKBRenderFactoryLayoutSegment segmentWithTraits:](UIKBRenderFactoryLayoutSegment, "segmentWithTraits:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "setKeyStates:", 100);
  objc_msgSend(v15, "addRelativeLayoutRectFromEdge:ofCachedKey:", 10, CFSTR("Shift-Key"));
  -[UIKBRenderFactory addLayoutSegment:](self, "addLayoutSegment:", v15);
  -[UIKBRenderFactoryiPhone shiftLockControlKeyTraits](self, "shiftLockControlKeyTraits");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKBRenderFactoryLayoutSegment segmentWithTraits:](UIKBRenderFactoryLayoutSegment, "segmentWithTraits:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = 8;
  objc_msgSend(v17, "setKeyStates:", 8);
  objc_msgSend(v17, "addRelativeLayoutRectFromEdge:ofCachedKey:", 10, CFSTR("Shift-Key"));
  -[UIKBRenderFactory addLayoutSegment:](self, "addLayoutSegment:", v17);
  -[UIKBRenderFactoryiPhone shiftLockControlKeyTraits](self, "shiftLockControlKeyTraits");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKBRenderFactoryLayoutSegment segmentWithTraits:](UIKBRenderFactoryLayoutSegment, "segmentWithTraits:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "setKeyStates:", 8);
  objc_msgSend(v20, "addRelativeLayoutRectFromEdge:ofCachedKey:", 10, CFSTR("Caps-Lock-Key"));
  -[UIKBRenderFactory addLayoutSegment:](self, "addLayoutSegment:", v20);
  -[UIKBRenderFactoryiPhone activeControlKeyTraits](self, "activeControlKeyTraits");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKBRenderFactoryLayoutSegment segmentWithTraits:](UIKBRenderFactoryLayoutSegment, "segmentWithTraits:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setKeyStates:", 4);
  objc_msgSend(v22, "addRelativeLayoutRectFromEdge:ofCachedKey:", 2, CFSTR("Delete-Key"));
  objc_msgSend(v22, "addRelativeLayoutRectFromEdge:ofCachedKey:", 2, CFSTR("Return-Key"));
  objc_msgSend(v22, "addRelativeLayoutRectFromEdge:ofCachedKey:", 8, CFSTR("Tab-Key"));
  objc_msgSend(v22, "addRelativeLayoutRectFromEdge:ofCachedKey:", 8, CFSTR("Caps-Lock-Key"));
  objc_msgSend(v22, "addRelativeLayoutRectFromEdge:ofCachedKey:", 8, CFSTR("Roman-to-Non-Roman-Switch-Key"));
  objc_msgSend(v22, "addRelativeLayoutRectFromEdge:ofCachedKey:", 8, CFSTR("Non-Roman-to-Roman-Switch-Key"));
  if (!-[UIKBRenderFactoryiPad iPadFudgeLayout](self, "iPadFudgeLayout"))
  {
    if (-[UIKBRenderFactoryiPad iPadSansHomeButtonLayout](self, "iPadSansHomeButtonLayout"))
      v18 = 8;
    else
      v18 = 2;
  }
  objc_msgSend(v22, "addRelativeLayoutRectFromEdge:ofCachedKey:", v18, CFSTR("Undo-Key"));
  objc_msgSend(v22, "addRelativeLayoutRectFromEdge:ofCachedKey:", v18, CFSTR("Redo-Key"));
  objc_msgSend(v22, "addLayoutRect:asTriangle:", 0, 0.0, 0.8, v4, 0.2);
  objc_msgSend(v22, "addLayoutRect:asTriangle:", 0, v6, 0.8, v8, 0.2);
  -[UIKBRenderFactory addLayoutSegment:](self, "addLayoutSegment:", v22);

}

- (void)_customizeTraits:(id)a3 forPopupForKey:(id)a4 withRenderingContext:(id)a5 keycapsFontName:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  int v15;
  __CFString **v16;
  __CFString *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  int v43;
  void *v44;
  void *v45;
  void *v46;
  __objc2_class **v47;
  void *v48;
  double v49;
  double v50;
  void *v51;
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
  double v62;
  CGFloat v63;
  double v64;
  CGFloat v65;
  double v66;
  CGFloat v67;
  double v68;
  CGFloat v69;
  double v70;
  CGFloat v71;
  double v72;
  CGFloat v73;
  double x;
  double y;
  double width;
  double height;
  void *v78;
  double v79;
  double v80;
  double v81;
  double v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  double v87;
  double v88;
  void *v89;
  _QWORD v90[2];
  CGRect v91;
  CGRect v92;
  CGRect v93;
  CGRect v94;
  CGRect v95;

  v90[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  +[UIKBTextStyle styleWithFontName:withFontSize:](UIKBTextStyle, "styleWithFontName:withFontSize:", a6, 22.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setSymbolStyle:", v13);

  objc_msgSend(v12, "renderConfig");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "lightKeyboard");
  v16 = UIKBColorBlack;
  if (!v15)
    v16 = UIKBColorWhite;
  v17 = *v16;
  objc_msgSend(v10, "symbolStyle");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setTextColor:", v17);

  objc_msgSend(v10, "removeAllRenderEffects");
  if (objc_msgSend(v11, "displayType") == 13)
  {
    objc_msgSend(v10, "symbolStyle");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setUsesSymbolImage:", 1);

    -[UIKBRenderFactoryiPad symbolImageControlKeyFontSize](self, "symbolImageControlKeyFontSize");
    v21 = v20;
    objc_msgSend(v10, "symbolStyle");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setFontSizeForSymbolImage:", v21);

    objc_msgSend(v10, "symbolStyle");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    v25 = 0.0;
    v26 = -1.0;
LABEL_13:
    objc_msgSend(v23, "setTextOffset:", v25, v26);
LABEL_14:

    goto LABEL_15;
  }
  if (objc_msgSend(v11, "displayType") == 5)
  {
    objc_msgSend(v10, "symbolStyle");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setUsesSymbolImage:", 1);

    -[UIKBRenderFactoryiPad symbolImageControlKeyFontSize](self, "symbolImageControlKeyFontSize");
    v29 = v28;
    objc_msgSend(v10, "symbolStyle");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setFontSizeForSymbolImage:", v29);

    -[UIKBRenderFactory scale](self, "scale");
    if (v31 == 2.0)
      v32 = *MEMORY[0x1E0C9D538];
    else
      v32 = 0.0;
    if (v31 == 2.0)
      v33 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    else
      v33 = -1.0;
    objc_msgSend(v10, "symbolStyle");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    v25 = v32;
    v26 = v33;
    goto LABEL_13;
  }
  if (objc_msgSend(v11, "displayType") == 4)
  {
    objc_msgSend(v10, "symbolStyle");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setUsesSymbolImage:", 1);

    -[UIKBRenderFactoryiPad symbolImageControlKeyFontSize](self, "symbolImageControlKeyFontSize");
    v50 = v49;
    objc_msgSend(v10, "symbolStyle");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setFontSizeForSymbolImage:", v50);
    goto LABEL_14;
  }
LABEL_15:
  objc_msgSend(v10, "geometry");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setDetachedVariants:", 1);

  +[UIKBRenderTraits traitsWithSymbolStyle:](UIKBRenderTraits, "traitsWithSymbolStyle:", 0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setVariantTraits:", v35);

  -[UIKBRenderFactory defaultKeyBackgroundColorName](self, "defaultKeyBackgroundColorName");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKBGradient gradientWithFlatColor:](UIKBGradient, "gradientWithFlatColor:", v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "variantTraits");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setBackgroundGradient:", v37);

  objc_msgSend(v12, "renderConfig");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v36) = objc_msgSend(v39, "lightKeyboard");

  if ((_DWORD)v36)
  {
    objc_msgSend(v10, "variantTraits");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIKBEdgeEffect effectWithColor:edges:inset:weight:](UIKBEdgeEffect, "effectWithColor:edges:inset:weight:", CFSTR("UIKBColorBlack_Alpha12"), 15, -0.25, 0.5);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "addRenderEffect:", v41);

  }
  objc_msgSend(v12, "renderConfig");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend(v42, "lightKeyboard");

  if (v43)
  {
    +[UIKBShadowEffect effectWithColor:offset:insets:weight:](UIKBShadowEffect, "effectWithColor:offset:insets:weight:", CFSTR("UIKBColorBlack_Alpha35"), 0.0, 2.0, 1.0, 1.0, 0.0, 1.0, 4.5);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addRenderEffect:", v44);

  }
  -[UIKBRenderFactory renderConfig](self, "renderConfig");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v45, "lightKeyboard") & 1) != 0)
  {
    -[UIKBRenderFactory renderConfig](self, "renderConfig");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setBlurBlending:", objc_msgSend(v46, "animatedBackground"));

  }
  else
  {
    objc_msgSend(v10, "setBlurBlending:", 1);
  }

  if (objc_msgSend(v11, "displayType") == 13 || objc_msgSend(v11, "displayType") == 4)
    v47 = off_1E167A978;
  else
    v47 = off_1E167AF28;
  -[__objc2_class sharedInstance](*v47, "sharedInstance");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "popupRect");
  v53 = v52;
  v55 = v54;
  v57 = v56;
  v59 = v58;
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "_layout");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "convertRect:fromView:", v51, v53, v55, v57, v59);
  v63 = v62;
  v65 = v64;
  v67 = v66;
  v69 = v68;

  -[UIKBRenderFactoryiPad keyCornerRadius](self, "keyCornerRadius");
  v71 = v70;
  -[UIKBRenderFactoryiPad keyCornerRadius](self, "keyCornerRadius");
  v73 = v72;
  v91.origin.x = v63;
  v91.origin.y = v65;
  v91.size.width = v67;
  v91.size.height = v69;
  v92 = CGRectInset(v91, v71, v73);
  x = v92.origin.x;
  y = v92.origin.y;
  width = v92.size.width;
  height = v92.size.height;
  objc_msgSend(v10, "geometry");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "displayFrame");
  v95.origin.x = x;
  v95.origin.y = y;
  v95.size.width = width;
  v95.size.height = height;
  v94 = CGRectUnion(v93, v95);
  v79 = v94.origin.x;
  v80 = v94.origin.y;
  v81 = v94.size.width;
  v82 = v94.size.height;

  objc_msgSend(v10, "geometry");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "setDisplayFrame:", v79, v80, v81, v82);

  +[UIKBRenderGeometry geometryWithFrame:paddedFrame:](UIKBRenderGeometry, "geometryWithFrame:paddedFrame:", x, y, width, height, x, y, width, height);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v90[0] = v84;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v90, 1);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setVariantGeometries:", v85);

  objc_msgSend(v10, "geometry");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "setPopupBias:", 40);

  -[UIKBRenderFactoryiPad keyCornerRadius](self, "keyCornerRadius");
  v88 = v87;
  objc_msgSend(v10, "geometry");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "setRoundRectRadius:", v88);

}

@end
