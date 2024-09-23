@implementation UIKBRenderFactory

+ (BOOL)couldUseGlyphSelectorForDisplayString:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  BOOL v7;

  if (!a3)
    return 0;
  v4 = a3;
  objc_msgSend(a1, "_characterSetForGlyphSelectors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "rangeOfCharacterFromSet:", v5);

  v7 = v6 != 0x7FFFFFFFFFFFFFFFLL;
  return v7;
}

+ (id)_characterSetForGlyphSelectors
{
  if (qword_1ECD7EC90 != -1)
    dispatch_once(&qword_1ECD7EC90, &__block_literal_global_262_0);
  return (id)_MergedGlobals_1115;
}

+ (id)factoryForVisualStyle:(id)a3 renderingContext:(id)a4
{
  return +[UIKBRenderFactory factoryForVisualStyle:renderingContext:skipLayoutSegments:](UIKBRenderFactory, "factoryForVisualStyle:renderingContext:skipLayoutSegments:", *(_QWORD *)&a3, a4, 0);
}

- (id)traitsForKey:(id)a3 onKeyplane:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  double v20;
  uint64_t v21;
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
  void *v34;
  uint64_t v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t i;
  void *v46;
  int v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  double v57;
  double v58;
  CGFloat v59;
  CGFloat v60;
  CGFloat v61;
  CGFloat v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  void *v68;
  double v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _BYTE v74[128];
  uint64_t v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;
  CGRect v80;

  v75 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[UIKBRenderFactory _traitsForKey:onKeyplane:](self, "_traitsForKey:onKeyplane:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (double *)MEMORY[0x1E0C9D648];
  if (self->_suppressSegmentTraits)
  {
    v10 = 0;
  }
  else
  {
    -[UIKBRenderFactory segmentTraits](self, "segmentTraits");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12 = *v9;
  v11 = v9[1];
  v14 = v9[2];
  v13 = v9[3];
  if (objc_msgSend(v10, "count"))
  {
    if (!objc_msgSend(v7, "isSplit")
      || (objc_msgSend(v7, "isGenerated") & 1) != 0
      || (-[UIKBRenderFactory RivenFactor:](self, "RivenFactor:", 1.0), v15 <= 1.0))
    {
      objc_msgSend(v7, "frame");
      v12 = v24;
      v11 = v25;
      v14 = v26;
      v13 = v27;
      objc_msgSend(v6, "frame");
      v30 = v29 + v28 * 0.5;
      v33 = v32 + v31 * 0.5;
    }
    else
    {
      objc_msgSend(v7, "originalFrame");
      v79.origin.x = v16;
      v79.origin.y = v17;
      v79.size.width = v18;
      v79.size.height = v19;
      v76.origin.x = v12;
      v76.origin.y = v11;
      v76.size.width = v14;
      v76.size.height = v13;
      if (CGRectEqualToRect(v76, v79))
        objc_msgSend(v7, "frame");
      else
        objc_msgSend(v7, "originalFrame");
      v69 = v20;
      v57 = v22;
      v58 = v23;
      objc_msgSend(v6, "originalFrame", v21);
      v80.origin.x = v59;
      v80.origin.y = v60;
      v80.size.width = v61;
      v80.size.height = v62;
      v78.origin.x = v12;
      v78.origin.y = v11;
      v78.size.width = v14;
      v78.size.height = v13;
      if (CGRectEqualToRect(v78, v80))
        objc_msgSend(v6, "frame");
      else
        objc_msgSend(v6, "originalFrame");
      v30 = v63 + v65 * 0.5;
      v33 = v64 + v66 * 0.5;
      v13 = v58;
      v14 = v57;
      v11 = v67;
      v12 = v69;
    }
  }
  else
  {
    v30 = *MEMORY[0x1E0C9D538];
    v33 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  }
  objc_msgSend(v6, "frame");
  if (!CGRectIsEmpty(v77) || objc_msgSend(v6, "dynamicLayout"))
  {
    -[UIKBRenderFactory renderingContext](self, "renderingContext");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "handBias");

    if (v35)
    {
      objc_msgSend(v7, "primaryKeylayoutOffset");
      v12 = v36;
      objc_msgSend(v7, "primaryKeylayoutWidthRatio");
      v14 = v14 * v37;
    }
    objc_msgSend(v7, "resizingOffset");
    if (v38 > 0.0)
    {
      objc_msgSend(v7, "resizingOffset");
      v11 = v39;
      objc_msgSend(v7, "resizingOffset");
      v13 = v13 - v40;
    }
    v72 = 0u;
    v73 = 0u;
    v70 = 0u;
    v71 = 0u;
    v68 = v10;
    v41 = v10;
    v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v70, v74, 16);
    if (v42)
    {
      v43 = v42;
      v44 = *(_QWORD *)v71;
      do
      {
        for (i = 0; i != v43; ++i)
        {
          if (*(_QWORD *)v71 != v44)
            objc_enumerationMutation(v41);
          v46 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * i);
          if (objc_msgSend(v46, "keyStates"))
          {
            v47 = objc_msgSend(v46, "keyStates");
            if ((objc_msgSend(v6, "state") & v47) == 0)
              continue;
          }
          if ((objc_msgSend(v46, "shouldOverlayTraitsForKey:", v6) & 1) != 0
            || (objc_msgSend(v6, "dynamicLayout") & 1) == 0
            && objc_msgSend(v46, "containsPoint:inRect:withKeyplane:", v7, v30, v33, v12, v11, v14, v13))
          {
            objc_msgSend(v46, "traits");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "overlayWithTraits:", v48);

          }
        }
        v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v70, v74, 16);
      }
      while (v43);
    }

    v10 = v68;
  }
  objc_msgSend(v6, "name");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v49, "hasSuffix:", CFSTR("LanguageIndicator")))
  {
    v50 = objc_msgSend(v8, "blendForm");

    if (v50 != 3)
      -[UIKBRenderFactory customizeLanguageIndicatorTraitsForTraits:](self, "customizeLanguageIndicatorTraitsForTraits:", v8);
  }
  else
  {

  }
  if (objc_msgSend(v6, "interactionType") == 5)
  {
    -[UIKBRenderFactory renderConfig](self, "renderConfig");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBRenderFactory customizeMicOnTraitsForTraits:lightKeyboard:keyState:](self, "customizeMicOnTraitsForTraits:lightKeyboard:keyState:", v8, objc_msgSend(v51, "lightKeyboard"), objc_msgSend(v6, "state"));

  }
  if (+[UIKBRenderFactory _graphicsQuality](UIKBRenderFactory, "_graphicsQuality") == 10)
    -[UIKBRenderFactory lowQualityTraits:](self, "lowQualityTraits:", v8);
  if (!-[UIKBRenderFactory lightweightFactory](self, "lightweightFactory")
    && objc_msgSend(v6, "displayTypeHint") != 12)
  {
    objc_msgSend(v8, "geometry");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "symbolStyle");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = v10;
    -[UIKBRenderFactory traitsHashStringForKey:withGeometry:withSymbolStyle:controlOpacities:blurBlending:](self, "traitsHashStringForKey:withGeometry:withSymbolStyle:controlOpacities:blurBlending:", v6, v52, v53, objc_msgSend(v8, "controlOpacities"), objc_msgSend(v8, "blurBlending"));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setHashString:", v55);

    v10 = v54;
  }
  self->_suppressSegmentTraits = 0;

  return v8;
}

+ (int64_t)_graphicsQuality
{
  int v2;

  if (_graphicsQuality_onceToken != -1)
    dispatch_once(&_graphicsQuality_onceToken, &__block_literal_global_322);
  v2 = _AXSEnhanceBackgroundContrastEnabled();
  if (_graphicsQuality___quality != 100 || v2 == 0)
    return _graphicsQuality___quality;
  else
    return 10;
}

- (UIKBRenderConfig)renderConfig
{
  void *v2;
  void *v3;

  -[UIKBRenderFactory renderingContext](self, "renderingContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "renderConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIKBRenderConfig *)v3;
}

- (UIKBRenderingContext)renderingContext
{
  return self->_renderingContext;
}

- (id)defaultKeyShadowColorName
{
  void *v3;
  int v4;
  __CFString *v5;
  void *v6;
  int v7;
  __CFString **v8;

  -[UIKBRenderFactory renderConfig](self, "renderConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "animatedBackground");

  if (v4)
  {
    v5 = CFSTR("UIKBColorBlack_Alpha10");
  }
  else
  {
    -[UIKBRenderFactory renderConfig](self, "renderConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "lightKeyboard");
    v8 = UIKBColorBlack_Alpha35;
    if (!v7)
      v8 = UIKBColorBlack_Alpha40;
    v5 = *v8;

  }
  return v5;
}

- (id)defaultKeyBackgroundColorName
{
  void *v3;
  int v4;
  void *v5;
  int v6;
  const __CFString *v7;
  const __CFString *v8;
  __CFString *v9;
  __CFString *v10;

  -[UIKBRenderFactory renderConfig](self, "renderConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "animatedBackground");

  -[UIKBRenderFactory renderConfig](self, "renderConfig");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "lightKeyboard");
  v7 = CFSTR("UIKBColorWhite");
  v8 = CFSTR("UIKBColorWhite_Alpha30");
  if (v6)
    v8 = CFSTR("UIKBColorWhite");
  else
    v7 = CFSTR("UIKBColorWhite_Alpha65");
  if (v4)
    v9 = (__CFString *)v7;
  else
    v9 = (__CFString *)v8;
  v10 = v9;

  return v10;
}

- (int64_t)enabledBlendForm
{
  void *v3;
  char v4;
  void *v6;
  char v7;
  void *v8;
  int v9;

  -[UIKBRenderFactory renderConfig](self, "renderConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "animatedBackground");

  if ((v4 & 1) != 0)
    return 8;
  -[UIKBRenderFactory renderConfig](self, "renderConfig");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "emptyBackground");

  if ((v7 & 1) != 0)
    return 7;
  -[UIKBRenderFactory renderConfig](self, "renderConfig");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "lightKeyboard");

  if (v9 && +[UIKBRenderFactory _graphicsQuality](UIKBRenderFactory, "_graphicsQuality") == 100)
    return -[UIKBRenderFactory lightHighQualityEnabledBlendForm](self, "lightHighQualityEnabledBlendForm");
  else
    return 0;
}

- (NSArray)segmentTraits
{
  return &self->_segmentTraits->super;
}

- (double)scale
{
  return self->_scale;
}

- (BOOL)lightweightFactory
{
  return self->_lightweightFactory;
}

- (int64_t)glyphSelectorForDisplayString:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  int64_t v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD block[5];

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__UIKBRenderFactory_glyphSelectorForDisplayString___block_invoke;
  block[3] = &unk_1E16B1B28;
  block[4] = self;
  if (qword_1ECD7ECA0 != -1)
    dispatch_once(&qword_1ECD7ECA0, block);
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v6 = (void *)qword_1ECD7EC98;
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __51__UIKBRenderFactory_glyphSelectorForDisplayString___block_invoke_272;
  v10[3] = &unk_1E16D3B88;
  v7 = v4;
  v11 = v7;
  v12 = &v13;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v10);
  v8 = v14[3];

  _Block_object_dispose(&v13, 8);
  return v8;
}

- (BOOL)drawsOneHandedAffordance
{
  return self->_drawsOneHandedAffordance;
}

- (BOOL)boldTextEnabled
{
  return self->_boldTextEnabled;
}

- (BOOL)allowsPaddleForKey:(id)a3
{
  id v4;
  int v5;

  v4 = a3;
  if (-[UIKBRenderFactory allowsPaddles](self, "allowsPaddles"))
    v5 = objc_msgSend(v4, "preventPaddle") ^ 1;
  else
    LOBYTE(v5) = 0;

  return v5;
}

- (BOOL)allowsPaddles
{
  return self->_allowsPaddles;
}

- (id)_traitsForKey:(id)a3 onKeyplane:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  +[UIKBRenderTraits emptyTraits](UIKBRenderTraits, "emptyTraits");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "shape");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[UIKBRenderGeometry geometryWithShape:](UIKBRenderGeometry, "geometryWithShape:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setGeometry:", v7);

  return v5;
}

- (id)displayContentsForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  unsigned int v8;
  unsigned int v9;
  void *v10;
  int v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t i;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  int v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  int v50;
  void *v51;
  void *v52;
  void *v53;
  id v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  int v60;
  void *v61;
  uint64_t v62;
  void *v63;
  int v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  id v69;
  void *v70;
  void *v71;
  id v72;
  void *v73;
  uint64_t v74;
  void *v75;
  int v76;
  void *v77;
  int v78;
  void *v79;
  void *v80;
  int v81;
  void *v82;
  uint64_t v83;
  void *v84;
  unint64_t v85;
  void *v86;
  void *v87;
  void **v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  id v93;
  void *v94;
  void *v95;
  void *v96;
  unsigned int v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  uint64_t v102;
  _BYTE v103[128];
  void *v104;
  void *v105;
  void *v106;
  _QWORD v107[3];

  v107[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[UIKBKeyDisplayContents displayContents](UIKBKeyDisplayContents, "displayContents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKBKeyDisplayContents displayContents](UIKBKeyDisplayContents, "displayContents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFallbackContents:", v6);

  v7 = objc_msgSend(v4, "displayType");
  v8 = objc_msgSend(v4, "interactionType");
  v9 = v8;
  if ((_DWORD)v7 == 3 || v8 == 4)
  {
    objc_msgSend(v5, "setDisplayPathType:", 2);
    -[UIKBRenderFactory keyImageNameWithSkinnyVariation:](self, "keyImageNameWithSkinnyVariation:", v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDisplayStringImage:", v13);

    objc_msgSend(v4, "displayString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDisplayString:", v14);
LABEL_11:

    objc_msgSend(v5, "setFlipImageHorizontally:", -[UIKBRenderFactory keyIsRightToLeftSensitive:](self, "keyIsRightToLeftSensitive:", v4));
    goto LABEL_39;
  }
  if ((int)v7 > 22)
  {
    if ((_DWORD)v7 == 53)
      goto LABEL_19;
    if ((_DWORD)v7 == 23)
    {
      UIKBShiftKeyStringForActiveInputMode(v4);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
        goto LABEL_17;
      objc_msgSend(v5, "setDisplayPathType:", 1);
      -[UIKBRenderFactory keyImageNameWithSkinnyVariation:](self, "keyImageNameWithSkinnyVariation:", v4);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setDisplayStringImage:", v16);

      objc_msgSend(v5, "displayStringImage");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "fallbackContents");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setDisplayStringImage:", v17);

LABEL_16:
      goto LABEL_17;
    }
  }
  else
  {
    if ((_DWORD)v7 == 5)
    {
      if (objc_msgSend(v4, "displayTypeHint") != 11)
      {
        -[UIKBRenderFactory dismissKeyImageName](self, "dismissKeyImageName");
        v20 = objc_claimAutoreleasedReturnValue();
        goto LABEL_36;
      }
      goto LABEL_19;
    }
    if ((_DWORD)v7 == 13)
    {
      objc_msgSend(v4, "representedString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("EmojiInternational"));

      if (!v11)
      {
        objc_msgSend(v4, "overrideDisplayString");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "isEqualToString:", CFSTR("emoji"));

        if (v25)
        {
LABEL_28:
          -[UIKBRenderFactory globalEmojiKeyImageName](self, "globalEmojiKeyImageName");
          v20 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          -[UIKBRenderFactory globalKeyImageName](self, "globalKeyImageName");
          v20 = objc_claimAutoreleasedReturnValue();
        }
        goto LABEL_36;
      }
      objc_msgSend(v4, "displayString");
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

      if (v12 != CFSTR(""))
      {
        if (objc_msgSend(v4, "displayTypeHint") != 11)
        {
          objc_msgSend(v5, "setStringKeycapOverImage:", 1);
LABEL_17:
          objc_msgSend(v4, "displayString");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setDisplayString:", v19);
LABEL_38:

          goto LABEL_39;
        }
        goto LABEL_19;
      }
LABEL_26:
      -[UIKBRenderFactory handwritingMoreKeyImageName](self, "handwritingMoreKeyImageName");
      v20 = objc_claimAutoreleasedReturnValue();
      goto LABEL_36;
    }
  }
  objc_msgSend(v4, "displayString");
  v21 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v21 == CFSTR(""))
    goto LABEL_26;
  if (objc_msgSend(v4, "interactionType") == 44)
  {
    -[UIKBRenderFactory renderConfig](self, "renderConfig");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "imageNameForType:", v7);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v19)
    {
      if (objc_msgSend(v4, "displayType") != 4)
        goto LABEL_38;
      objc_msgSend(v4, "setInteractionType:", 5);
      -[UIKBRenderFactory dictationKeyImageName](self, "dictationKeyImageName");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setDisplayStringImage:", v23);
LABEL_25:

      goto LABEL_38;
    }
LABEL_37:
    objc_msgSend(v5, "setDisplayStringImage:", v19);
    goto LABEL_38;
  }
  if ((_DWORD)v7 == 4 || objc_msgSend(v4, "interactionType") == 5)
  {
    -[UIKBRenderFactory renderConfig](self, "renderConfig");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "imageNameForType:", v7);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v19)
    {
      -[UIKBRenderFactory dictationKeyImageName](self, "dictationKeyImageName");
      v20 = objc_claimAutoreleasedReturnValue();
      goto LABEL_36;
    }
    objc_msgSend(v4, "setInteractionType:", 44);
    goto LABEL_37;
  }
  switch((int)v7)
  {
    case '*':
      -[UIKBRenderFactory cutKeyImageName](self, "cutKeyImageName");
      v55 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_99;
    case '+':
      v55 = -[UIKBRenderFactory copyKeyImageName](self, "copyKeyImageName");
      goto LABEL_99;
    case ',':
      -[UIKBRenderFactory pasteKeyImageName](self, "pasteKeyImageName");
      v55 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_99;
    case '-':
      -[UIKBRenderFactory leftArrowKeyImageName](self, "leftArrowKeyImageName");
      v20 = objc_claimAutoreleasedReturnValue();
      goto LABEL_36;
    case '.':
      -[UIKBRenderFactory rightArrowKeyImageName](self, "rightArrowKeyImageName");
      v20 = objc_claimAutoreleasedReturnValue();
      goto LABEL_36;
    default:
      if ((_DWORD)v7 == 9)
        goto LABEL_28;
      switch(v9)
      {
        case 0x1Cu:
          -[UIKBRenderFactory boldKeyImageName](self, "boldKeyImageName");
          v55 = (id)objc_claimAutoreleasedReturnValue();
LABEL_99:
          v17 = v55;
          objc_msgSend(v5, "setDisplayStringImage:", v55);
          goto LABEL_16;
        case 0x11u:
          if (objc_msgSend(v4, "displayTypeHint") != 11)
          {
            objc_msgSend(v4, "displayString");
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            v64 = objc_msgSend(v63, "isEqualToString:", CFSTR("undo"));

            if (v64)
            {
              objc_msgSend(v4, "displayString");
              v65 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "setDisplayString:", v65);

            }
            -[UIKBRenderFactory undoKeyImageName](self, "undoKeyImageName");
            v62 = objc_claimAutoreleasedReturnValue();
            goto LABEL_107;
          }
LABEL_19:
          -[UIKBRenderFactory messagesWriteboardKeyImageName](self, "messagesWriteboardKeyImageName");
          v20 = objc_claimAutoreleasedReturnValue();
LABEL_36:
          v19 = (void *)v20;
          goto LABEL_37;
        case 0xCu:
          objc_msgSend(v4, "displayString");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          v60 = objc_msgSend(v59, "isEqualToString:", CFSTR("redo"));

          if (v60)
          {
            objc_msgSend(v4, "displayString");
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "setDisplayString:", v61);

          }
          -[UIKBRenderFactory redoKeyImageName](self, "redoKeyImageName");
          v62 = objc_claimAutoreleasedReturnValue();
LABEL_107:
          v14 = (void *)v62;
          objc_msgSend(v5, "setDisplayStringImage:", v62);
          goto LABEL_11;
      }
      if ((int)v7 <= 48)
      {
        switch((int)v7)
        {
          case 31:
            objc_msgSend(v4, "overrideDisplayString");
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            if (v66)
            {

            }
            else
            {
              objc_msgSend(v4, "displayString");
              v80 = (void *)objc_claimAutoreleasedReturnValue();
              v81 = objc_msgSend(v80, "isEqualToString:", CFSTR("゛゜小"));

              if (!v81)
                goto LABEL_17;
            }
            objc_msgSend(v5, "setDisplayString:", CFSTR("小"));
            objc_msgSend(v5, "setSecondaryDisplayStrings:", &unk_1E1A93AB8);
            goto LABEL_39;
          case 32:
            -[UIKBRenderFactory multitapCompleteKeyImageName](self, "multitapCompleteKeyImageName");
            v20 = objc_claimAutoreleasedReturnValue();
            goto LABEL_36;
          case 33:
            -[UIKBRenderFactory muttitapReverseKeyImageName](self, "muttitapReverseKeyImageName");
            v20 = objc_claimAutoreleasedReturnValue();
            goto LABEL_36;
          case 34:
            objc_msgSend(v4, "overrideDisplayString");
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            v71 = v70;
            if (v70)
            {
              v72 = v70;
            }
            else
            {
              objc_msgSend(v4, "displayString");
              v72 = (id)objc_claimAutoreleasedReturnValue();
            }
            v19 = v72;

            objc_msgSend(v19, "_firstGrapheme");
            v89 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "setDisplayString:", v89);

            objc_msgSend(v19, "_lastGrapheme");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v104 = v23;
            v87 = (void *)MEMORY[0x1E0C99D20];
            v88 = &v104;
            goto LABEL_145;
          default:
            if ((_DWORD)v7 == 7)
            {
              objc_msgSend(v4, "secondaryDisplayStrings");
              v73 = (void *)objc_claimAutoreleasedReturnValue();
              v74 = objc_msgSend(v73, "count");

              if (v74)
                goto LABEL_127;
              objc_msgSend(v4, "overrideDisplayString");
              v91 = (void *)objc_claimAutoreleasedReturnValue();
              v92 = v91;
              if (v91)
              {
                v93 = v91;
              }
              else
              {
                objc_msgSend(v4, "displayString");
                v93 = (id)objc_claimAutoreleasedReturnValue();
              }
              v19 = v93;

              if (objc_msgSend(v19, "length") != 2)
              {
                objc_msgSend(v19, "_firstGrapheme");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v5, "setDisplayString:", v23);
                objc_msgSend(v19, "substringFromIndex:", objc_msgSend(v23, "length"));
                v90 = (void *)objc_claimAutoreleasedReturnValue();
                v105 = v90;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v105, 1);
                v96 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v5, "setSecondaryDisplayStrings:", v96);

                goto LABEL_146;
              }
              objc_msgSend(v19, "substringToIndex:", 1);
              v95 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "setDisplayString:", v95);

              objc_msgSend(v19, "substringFromIndex:", 1);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v106 = v23;
              v87 = (void *)MEMORY[0x1E0C99D20];
              v88 = &v106;
LABEL_145:
              objc_msgSend(v87, "arrayWithObjects:count:", v88, 1);
              v90 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "setSecondaryDisplayStrings:", v90);
LABEL_146:

              goto LABEL_25;
            }
            if ((_DWORD)v7 != 20)
              goto LABEL_127;
            objc_msgSend(v4, "overrideDisplayString");
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            v68 = v67;
            if (v67)
            {
              v69 = v67;
            }
            else
            {
              objc_msgSend(v4, "displayString");
              v69 = (id)objc_claimAutoreleasedReturnValue();
            }
            v19 = v69;

            objc_msgSend(v4, "displayString");
            v82 = (void *)objc_claimAutoreleasedReturnValue();
            v83 = objc_msgSend(v82, "rangeOfString:", CFSTR("/"));

            objc_msgSend(v4, "displayString");
            v84 = (void *)objc_claimAutoreleasedReturnValue();
            v85 = objc_msgSend(v84, "length");

            if (v83 == 0x7FFFFFFFFFFFFFFFLL || v85 < 2)
            {
              objc_msgSend(v5, "setDisplayString:", v19);
              if (v83 == 0x7FFFFFFFFFFFFFFFLL)
                goto LABEL_142;
            }
            else
            {
              objc_msgSend(v19, "substringToIndex:", v83);
              v86 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "setDisplayString:", v86);

            }
            if (v83 + 1 < v85)
            {
              objc_msgSend(v19, "substringFromIndex:");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v107[0] = v23;
              v87 = (void *)MEMORY[0x1E0C99D20];
              v88 = (void **)v107;
              goto LABEL_145;
            }
LABEL_142:
            objc_msgSend(v4, "secondaryDisplayStrings");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "setSecondaryDisplayStrings:", v23);
            goto LABEL_25;
        }
      }
      switch((_DWORD)v7)
      {
        case '9':
          objc_msgSend(v4, "displayImage");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setDisplayImage:", v19);
          goto LABEL_38;
        case '2':
          objc_msgSend(v5, "setDisplayPathType:", 4);
          break;
        case '1':
          -[UIKBRenderFactory biuKeyImageName](self, "biuKeyImageName");
          v55 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_99;
        default:
LABEL_127:
          objc_msgSend(v4, "representedString");
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          v76 = objc_msgSend(v75, "isEqualToString:", CFSTR("‌"));

          if (v76)
          {
            -[UIKBRenderFactory ZWNJKeyImageName](self, "ZWNJKeyImageName");
            v20 = objc_claimAutoreleasedReturnValue();
            goto LABEL_36;
          }
          objc_msgSend(v4, "displayString");
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          v78 = objc_msgSend(v77, "isEqualToString:", CFSTR("Search"));

          if (!v78)
          {
            objc_msgSend(v4, "overrideDisplayString");
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            if (v79)
            {
              objc_msgSend(v5, "setDisplayString:", v79);
            }
            else
            {
              objc_msgSend(v4, "displayString");
              v94 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "setDisplayString:", v94);

            }
            objc_msgSend(v4, "secondaryDisplayStrings");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "setSecondaryDisplayStrings:", v19);
            goto LABEL_38;
          }
          objc_msgSend(v5, "setDisplayStringImage:", CFSTR("magnifyingglass"));
          break;
      }
LABEL_39:
      if (objc_msgSend(v4, "state") == 16
        && (v9 > 0x10 || ((1 << v9) & 0x10260) == 0)
        && objc_msgSend(v4, "variantType") != 12
        && objc_msgSend(v4, "variantType") != 13
        && (!_os_feature_enabled_impl()
         || objc_msgSend(v4, "variantType") != 10 && objc_msgSend(v4, "variantType") != 11))
      {
        v97 = v9;
        v32 = (void *)MEMORY[0x1E0C99DE8];
        objc_msgSend(v4, "subtrees");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "arrayWithCapacity:", objc_msgSend(v33, "count"));
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        v100 = 0u;
        v101 = 0u;
        v98 = 0u;
        v99 = 0u;
        objc_msgSend(v4, "subtrees");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v98, v103, 16);
        if (v36)
        {
          v37 = v36;
          v38 = *(_QWORD *)v99;
          do
          {
            for (i = 0; i != v37; ++i)
            {
              if (*(_QWORD *)v99 != v38)
                objc_enumerationMutation(v35);
              -[UIKBRenderFactory displayContentsForKey:](self, "displayContentsForKey:", *(_QWORD *)(*((_QWORD *)&v98 + 1) + 8 * i));
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "addObject:", v40);

            }
            v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v98, v103, 16);
          }
          while (v37);
        }

        objc_msgSend(v5, "setVariantDisplayContents:", v34);
        objc_msgSend(v4, "highlightedVariantsList");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v4, "selectedVariantIndex") == 0x7FFFFFFFFFFFFFFFLL)
        {
          v9 = v97;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v4, "selectedVariantIndex"));
          v56 = objc_claimAutoreleasedReturnValue();
          v57 = (void *)v56;
          if (v41)
          {
            v58 = (void *)objc_msgSend(v41, "mutableCopy");
            if (objc_msgSend(v58, "containsObject:", v57))
              objc_msgSend(v58, "removeObject:", v57);
            else
              objc_msgSend(v58, "addObject:", v57);
            v9 = v97;

          }
          else
          {
            v102 = v56;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v102, 1);
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            v9 = v97;
          }

          v41 = v58;
        }
        objc_msgSend(v5, "setHighlightedVariantsList:", v41);
        if (-[UIKBRenderFactory shouldClearBaseDisplayStringForVariants:](self, "shouldClearBaseDisplayStringForVariants:", v4))
        {
          objc_msgSend(v5, "setDisplayString:", 0);
          objc_msgSend(v5, "setDisplayStringImage:", 0);
        }

      }
      objc_msgSend(v5, "displayString");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (v27)
      {
        objc_msgSend(v5, "displayString");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v28, "hasSuffix:", CFSTR(".png"));

      }
      else
      {
        v29 = 0;
      }

      if ((_DWORD)v7 == 25 || v9 == 15)
      {
        objc_msgSend(v5, "fallbackContents");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "setDisplayString:", CFSTR("␣"));

        goto LABEL_75;
      }
      if ((_DWORD)v7 == 21 || v9 == 13)
      {
        objc_msgSend(v5, "setStringKeycapOverImage:", v29 ^ 1u);
        objc_msgSend(v4, "overrideDisplayString");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if (v30)
        {
          objc_msgSend(v5, "setDisplayString:", v30);
        }
        else
        {
          objc_msgSend(v4, "displayString");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setDisplayString:", v42);

        }
        objc_msgSend(v5, "fallbackContents");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "setDisplayString:", CFSTR("⮐"));

        objc_msgSend(v5, "displayString");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = objc_msgSend(v44, "containsString:", CFSTR("Emoji"));

        if (v45)
        {
          objc_msgSend(v5, "setForceImageKeycap:", 1);
          -[UIKBRenderFactory globalEmojiKeyImageName](self, "globalEmojiKeyImageName");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setDisplayString:", v46);

          -[UIKBRenderFactory globalEmojiKeyImageName](self, "globalEmojiKeyImageName");
          v47 = objc_claimAutoreleasedReturnValue();
LABEL_74:
          v52 = (void *)v47;
          objc_msgSend(v5, "setDisplayStringImage:", v47);

          goto LABEL_75;
        }
        objc_msgSend(v5, "displayString");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v48, "isEqualToString:", CFSTR("⮐")))
        {

        }
        else
        {
          objc_msgSend(v5, "displayString");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = objc_msgSend(v49, "isEqualToString:", CFSTR("⮑"));

          if (!v50)
          {
            objc_msgSend(v5, "setStringKeycapOverImage:", 1);
            objc_msgSend(v5, "displayString");
            v47 = objc_claimAutoreleasedReturnValue();
            goto LABEL_74;
          }
        }
        objc_msgSend(v5, "setStringKeycapOverImage:", 0);
        -[UIKBRenderFactory returnKeyImageName](self, "returnKeyImageName");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setDisplayStringImage:", v51);

        objc_msgSend(v5, "setFlipImageHorizontally:", -[UIKBRenderFactory keyIsRightToLeftSensitive:](self, "keyIsRightToLeftSensitive:", v4));
      }
LABEL_75:
      if (v29)
      {
        objc_msgSend(v5, "displayString");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setDisplayStringImage:", v53);

      }
      -[UIKBRenderFactory applyBoldTextForContent:withKey:](self, "applyBoldTextForContent:withKey:", v5, v4);

      return v5;
  }
}

- (void)applyBoldTextForContent:(id)a3 withKey:(id)a4
{
  id v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  uint64_t v15;
  id v16;

  v16 = a3;
  v6 = a4;
  if (self->_boldTextEnabled)
  {
    objc_msgSend(v16, "displayStringImage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7 || (objc_msgSend(v16, "forceImageKeycap") & 1) != 0)
      goto LABEL_14;
    if (objc_msgSend(v6, "displayType") == 23)
    {
      if (objc_msgSend(v6, "displayType") != 23)
      {
LABEL_14:

        goto LABEL_15;
      }
      v8 = objc_msgSend(v6, "state");

      if (v8 > 3)
        goto LABEL_15;
    }
    else
    {

    }
    objc_msgSend(v16, "displayStringImage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "copy");
    objc_msgSend(v16, "fallbackContents");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setDisplayStringImage:", v10);

    objc_msgSend(v16, "displayStringImage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "displayString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "hasSuffix:", CFSTR(".png")))
    {
      objc_msgSend(v16, "displayStringImage");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "hasPrefix:", CFSTR("bold_"));

      if ((v14 & 1) != 0)
      {
LABEL_13:
        objc_msgSend(v16, "setDisplayStringImage:", v7);
        goto LABEL_14;
      }
      objc_msgSend(v16, "displayStringImage");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(CFSTR("bold_"), "stringByAppendingString:", v12);
      v15 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v15;
    }

    goto LABEL_13;
  }
LABEL_15:

}

- (id)keyImageNameWithSkinnyVariation:(id)a3
{
  id v4;
  int v5;
  int v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = a3;
  v5 = objc_msgSend(v4, "displayType");
  v6 = objc_msgSend(v4, "interactionType");
  if (v5 == 3 || v6 == 4)
  {
    if (objc_msgSend(v4, "state") < 4)
      -[UIKBRenderFactory deleteKeyImageName](self, "deleteKeyImageName");
    else
      -[UIKBRenderFactory deleteOnKeyImageName](self, "deleteOnKeyImageName");
    goto LABEL_8;
  }
  if (v5 == 23)
  {
    UIKBShiftKeyStringForActiveInputMode(v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      if (objc_msgSend(v4, "state") <= 3)
      {
        -[UIKBRenderFactory shiftKeyImageName](self, "shiftKeyImageName");
        v9 = objc_claimAutoreleasedReturnValue();
        goto LABEL_10;
      }
      if (objc_msgSend(v4, "state") == 8)
        -[UIKBRenderFactory shiftLockImageName](self, "shiftLockImageName");
      else
        -[UIKBRenderFactory shiftOnKeyImageName](self, "shiftOnKeyImageName");
LABEL_8:
      v9 = objc_claimAutoreleasedReturnValue();
LABEL_10:
      v8 = (void *)v9;
      goto LABEL_11;
    }
  }
  v8 = 0;
LABEL_11:

  return v8;
}

- (id)deleteKeyImageName
{
  return CFSTR("delete.left");
}

- (id)shiftKeyImageName
{
  return CFSTR("shift");
}

- (id)shiftOnKeyImageName
{
  return CFSTR("shift.fill");
}

- (id)lightTextFontName
{
  return CFSTR("UIKBRenderFactorySystemFontName");
}

- (BOOL)preferStringKeycapOverImage
{
  return self->_preferStringKeycapOverImage;
}

- (id)backgroundTraitsForKeyplane:(id)a3
{
  id v4;
  void *v5;
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
  double v19;
  double v20;
  double v21;
  void *v22;

  v4 = a3;
  +[UIKBRenderTraits emptyTraits](UIKBRenderTraits, "emptyTraits");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  objc_msgSend(v4, "frame");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;

  +[UIKBRenderGeometry geometryWithFrame:paddedFrame:](UIKBRenderGeometry, "geometryWithFrame:paddedFrame:", v7, v9, v11, v13, v15, v17, v19, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setGeometry:", v22);

  objc_msgSend(v5, "setBlendForm:", -[UIKBRenderFactory enabledBlendForm](self, "enabledBlendForm"));
  return v5;
}

- (void)setStretchFactor:(CGSize)a3
{
  self->_stretchFactor = a3;
}

- (id)_controlKeyBackgroundColorName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[UIKBRenderFactory renderConfig](self, "renderConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "controlKeyBackgroundName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[UIKBRenderFactory renderConfig](self, "renderConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "controlKeyBackgroundName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[UIKBRenderFactory _defaultControlKeyBackgroundColorName](self, "_defaultControlKeyBackgroundColorName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

+ (id)cacheKeyForString:(id)a3 withRenderFlags:(int64_t)a4 renderingContext:(id)a5
{
  id v7;
  id v8;
  UIKBCacheToken *v9;
  void *v10;
  UIKBCacheToken *v11;
  void *v12;
  void *v13;

  v7 = a5;
  v8 = a3;
  v9 = [UIKBCacheToken alloc];
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[UIKBCacheToken initWithComponents:name:](v9, "initWithComponents:name:", v10, 0);
  objc_msgSend(v7, "renderConfig");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIKBCacheToken stringForRenderFlags:lightKeyboard:](v11, "stringForRenderFlags:lightKeyboard:", a4, objc_msgSend(v12, "lightKeyboard"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)traitsHashStringForKey:(id)a3 withGeometry:(id)a4 withSymbolStyle:(id)a5 controlOpacities:(BOOL)a6 blurBlending:(BOOL)a7
{
  _BOOL8 v7;
  id v11;
  id v12;
  id v13;
  unsigned int v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  objc_class *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  _BOOL8 v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  UIKBCacheToken *v51;
  void *v52;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  _BOOL4 v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  _QWORD v70[5];

  v59 = a7;
  v7 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = objc_msgSend(v13, "displayType");
  if (v14 - 7 >= 2)
    v15 = v14;
  else
    v15 = 0;
  objc_msgSend(v12, "displayFrame");
  v17 = v16;
  v19 = v18;
  v20 = (objc_class *)objc_opt_class();
  NSStringFromClass(v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "stringByReplacingOccurrencesOfString:withString:", CFSTR("UIKBRenderFactory"), &stru_1E16EDF20);
  v69 = (void *)objc_claimAutoreleasedReturnValue();

  v61 = (void *)MEMORY[0x1E0C99DE8];
  -[UIKBRenderFactory hashStringElement](self, "hashStringElement");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v15);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[UIKBRenderFactory keyIsRightToLeftSensitive:](self, "keyIsRightToLeftSensitive:", v13));
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "numberForProperty:", CFSTR("KBinteractionType"));
  v22 = objc_claimAutoreleasedReturnValue();
  v64 = (void *)v22;
  if (v22)
    v23 = (void *)v22;
  else
    v23 = &unk_1E1A983E8;
  v58 = v23;
  objc_msgSend(v13, "numberForProperty:", CFSTR("rendering"));
  v24 = objc_claimAutoreleasedReturnValue();
  v63 = (void *)v24;
  if (v24)
    v25 = (void *)v24;
  else
    v25 = &unk_1E1A983E8;
  v57 = v25;
  objc_msgSend(v13, "numberForProperty:", CFSTR("state"));
  v26 = objc_claimAutoreleasedReturnValue();
  v60 = (void *)v26;
  if (v26)
    v27 = (void *)v26;
  else
    v27 = &unk_1E1A983E8;
  v56 = v27;
  v28 = (void *)MEMORY[0x1E0CB37E8];
  v29 = -[UIKBRenderFactory useBlueThemingForKey:](self, "useBlueThemingForKey:", v13);

  objc_msgSend(v28, "numberWithBool:", v29);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v12, "roundRectRadius");
  objc_msgSend(v30, "numberWithDouble:");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v12, "roundRectCorners"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v17);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v19);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (void *)MEMORY[0x1E0CB3B18];
  objc_msgSend(v12, "displayInsets");
  v36 = v35;
  v38 = v37;
  v40 = v39;
  v42 = v41;

  v70[0] = v36;
  v70[1] = v38;
  v70[2] = v40;
  v70[3] = v42;
  objc_msgSend(v34, "valueWithBytes:objCType:", v70, "{UIEdgeInsets=dddd}");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = (void *)MEMORY[0x1E0CB37E8];
  v45 = objc_msgSend(v11, "anchorCorner");

  objc_msgSend(v44, "numberWithUnsignedInteger:", v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v59);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = (void *)MEMORY[0x1E0CB37E8];
  -[UIKBRenderFactory controlKeyBackgroundColorName](self, "controlKeyBackgroundColorName");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "numberWithInt:", objc_msgSend(v49, "hash"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "arrayWithObjects:", v69, v68, v67, v66, v58, v57, v56, v65, v55, v54, v31, v32, v33, v43, v46, v47, v50,
    0);
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  v51 = -[UIKBCacheToken initWithComponents:name:]([UIKBCacheToken alloc], "initWithComponents:name:", v62, 0);
  -[UIKBCacheToken string](v51, "string");
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  return v52;
}

- (BOOL)useBlueThemingForKey:(id)a3
{
  id v3;
  unsigned int v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v3 = a3;
  if (objc_msgSend(v3, "displayType") == 21
    && ((v4 = objc_msgSend(v3, "displayTypeHint"), v4 <= 0xA) && ((1 << v4) & 0x7EE) != 0 || v4 == 124))
  {
    objc_msgSend(v3, "overrideDisplayString");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      objc_msgSend(v3, "overrideDisplayString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "displayString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "isEqualToString:", v8);

    }
    else
    {
      v9 = 1;
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)keyIsRightToLeftSensitive:(id)a3
{
  int v3;
  void *v4;
  void *v5;
  char v6;

  v3 = objc_msgSend(a3, "isRightToLeftSensitive");
  if (v3)
  {
    +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "currentLinguisticInputMode");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isDefaultRightToLeft");

    LOBYTE(v3) = v6;
  }
  return v3;
}

- (id)hashStringElement
{
  void *v2;
  __CFString *v3;
  __CFString *v4;

  -[UIKBRenderFactory renderConfig](self, "renderConfig");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "lightKeyboard"))
    v3 = CFSTR("Light");
  else
    v3 = CFSTR("Dark");
  v4 = v3;

  return v4;
}

void __37__UIKBRenderFactory__graphicsQuality__block_invoke()
{
  id v0;

  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  _graphicsQuality___quality = objc_msgSend(v0, "_keyboardGraphicsQuality");

}

void __51__UIKBRenderFactory__characterSetForGlyphSelectors__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("‘’“”\",;"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_1115;
  _MergedGlobals_1115 = v0;

}

- (void)setScale:(double)a3
{
  self->_scale = a3;
}

- (void)setPreferStringKeycapOverImage:(BOOL)a3
{
  self->_preferStringKeycapOverImage = a3;
}

- (void)setAllowsPaddles:(BOOL)a3
{
  self->_allowsPaddles = a3;
}

void __51__UIKBRenderFactory_glyphSelectorForDisplayString___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99DC8];
  _UIKitBundle();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "preferredLocalizations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "canonicalLanguageIdentifierFromString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DC8], "componentsFromLocaleIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0C997E8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = objc_msgSend(v6, "isEqualToString:", CFSTR("zh"));

  if ((_DWORD)v3)
  {
    objc_msgSend((id)objc_opt_class(), "_characterSetForGlyphSelectors");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v7;
    v11[0] = &unk_1E1A98400;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)qword_1ECD7EC98;
    qword_1ECD7EC98 = v8;

  }
}

+ (id)factoryForVisualStyle:(id)a3 renderingContext:(id)a4 skipLayoutSegments:(BOOL)a5
{
  _BOOL8 v5;
  uint64_t v6;
  id v8;
  void *v9;
  int v10;
  void *v11;
  objc_class *v12;
  uint64_t v13;
  void *v14;

  v5 = a5;
  v6 = *(_QWORD *)&a3;
  v8 = a4;
  objc_msgSend(v8, "renderConfig");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "lightKeyboard");

  if (v10 && (v6 & 0xFF00) == 0x7F00)
  {
    +[UIKBRenderConfig darkConfig](UIKBRenderConfig, "darkConfig");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setRenderConfig:", v11);

  }
  v12 = (objc_class *)objc_msgSend(a1, "factoryClassForVisualStyle:renderingContext:", v6, v8);
  if (objc_msgSend(v8, "handBias"))
  {
    if (v12 == (objc_class *)objc_opt_class() || v12 == (objc_class *)objc_opt_class())
      v13 = objc_opt_class();
    else
      v13 = objc_msgSend(a1, "factoryClassForVisualStyle:renderingContext:", v6 & 0xFFFFFFFFFFFFFFC0, v8);
    v12 = (objc_class *)v13;
  }
  v14 = (void *)objc_msgSend([v12 alloc], "initWithRenderingContext:skipLayoutSegments:", v8, v5);

  return v14;
}

- (UIKBRenderFactory)initWithRenderingContext:(id)a3 skipLayoutSegments:(BOOL)a4
{
  id v7;
  char *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  BOOL v19;
  objc_super v21;

  v7 = a3;
  v21.receiver = self;
  v21.super_class = (Class)UIKBRenderFactory;
  v8 = -[UIKBRenderFactory init](&v21, sel_init);
  if (v8)
  {
    +[UIScreen mainScreen](UIScreen, "mainScreen");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "scale");
    *((_QWORD *)v8 + 6) = v10;

    +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "preferencesActions");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "rivenSizeFactor:", 1.0);
    *((_QWORD *)v8 + 4) = v13;

    __asm { FMOV            V0.2D, #1.0 }
    *(_OWORD *)(v8 + 56) = _Q0;
    objc_storeStrong((id *)v8 + 1, a3);
    v8[75] = 0;
    if (!a4)
      objc_msgSend(v8, "setupLayoutSegments");
    v8[72] = _AXSEnhanceTextLegibilityEnabled() != 0;
    if (_AXSEnhanceBackgroundContrastEnabled())
      v19 = 1;
    else
      v19 = _AXDarkenSystemColors() != 0;
    v8[73] = v19;
  }

  return (UIKBRenderFactory *)v8;
}

- (void)addLayoutSegment:(id)a3
{
  id v4;
  NSMutableArray *segmentTraits;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  segmentTraits = self->_segmentTraits;
  v8 = v4;
  if (!segmentTraits)
  {
    v6 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
    v7 = self->_segmentTraits;
    self->_segmentTraits = v6;

    v4 = v8;
    segmentTraits = self->_segmentTraits;
  }
  -[NSMutableArray addObject:](segmentTraits, "addObject:", v4);

}

- (id)controlKeyForegroundColorName
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  int64_t v7;
  __CFString *v8;

  -[UIKBRenderFactory renderConfig](self, "renderConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "emptyBackground"))
  {

    goto LABEL_8;
  }
  -[UIKBRenderFactory renderConfig](self, "renderConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "animatedBackground");

  if ((v5 & 1) != 0)
    goto LABEL_8;
  -[UIKBRenderFactory renderConfig](self, "renderConfig");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "lightKeyboard"))
  {

    goto LABEL_8;
  }
  v7 = +[UIKBRenderFactory _graphicsQuality](UIKBRenderFactory, "_graphicsQuality");

  if (v7 != 100)
  {
LABEL_8:
    v8 = 0;
    return v8;
  }
  v8 = CFSTR("UIKBColorKeyGrayKeyLightForeground");
  return v8;
}

+ (Class)factoryClassForVisualStyle:(id)a3 renderingContext:(id)a4
{
  uint64_t v4;
  id v5;
  void *v6;
  int v7;
  uint64_t v8;
  _BOOL4 v13;
  int v14;
  _BOOL4 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v4 = *(_QWORD *)&a3;
  v5 = a4;
  v6 = (void *)objc_opt_class();
  v7 = (_DWORD)v4 << 26;
  v8 = v4 << 58;
  v13 = v4 << 58 == 0x400000000000000 || v7 == 1610612736 || v7 == 1677721600 || v7 == 1744830464 || v7 == 1543503872;
  v14 = objc_msgSend(v5, "isFloating");

  if (v14)
    goto LABEL_70;
  if (!v8 || v7 == 1409286144 || v7 == 1476395008)
  {
    if (((BYTE2(v4) < 0x23u) & (0x600000802uLL >> SBYTE2(v4))) != 0)
    {
      v15 = (v4 & 0x40) != 0
         && +[UIKBRenderFactory _graphicsQuality](UIKBRenderFactory, "_graphicsQuality") == 100;
      v6 = (void *)objc_opt_class();
      if ((v4 & 0x40) != 0 && v7 == 1409286144
        || (v4 & 0x40) != 0 && v7 == 1476395008
        || !v15 && v7 == 1409286144
        || !v15 && v7 == 1476395008)
      {
        goto LABEL_70;
      }
    }
    else
    {
      if (BYTE2(v4) == 38 || BYTE2(v4) == 27)
        goto LABEL_70;
      if (BYTE2(v4) == 9)
      {
        if ((v4 & 0x40) != 0)
          goto LABEL_70;
        v16 = objc_opt_class();
        if (v7 == 1409286144)
          goto LABEL_70;
        v6 = (void *)v16;
        if (v7 == 1476395008)
          goto LABEL_70;
      }
      else if ((v4 & 0xFF00) == 0x7F00)
      {
        v17 = objc_opt_class();
        if (v7 == 1409286144)
          goto LABEL_70;
        v6 = (void *)v17;
        if (v7 == 1476395008)
          goto LABEL_70;
      }
      else
      {
        v18 = objc_opt_class();
        if (v7 == 1476395008)
          goto LABEL_70;
        v6 = (void *)v18;
        if (v7 == 1409286144)
          goto LABEL_70;
      }
    }
  }
  else if (v13)
  {
    if ((v4 & 0x80) != 0)
      goto LABEL_70;
    if (BYTE2(v4) > 0x1Au)
    {
      if (BYTE2(v4) == 27 || BYTE2(v4) == 38)
        goto LABEL_70;
    }
    else if (BYTE2(v4) == 9 || BYTE2(v4) == 11)
    {
      goto LABEL_70;
    }
    if ((v4 & 0xFF00) == 0x7F00 || (v19 = objc_opt_class(), v7 == 1610612736) || (v6 = (void *)v19, v7 == 1543503872))
LABEL_70:
      v6 = (void *)objc_opt_class();
  }
  else if (v8 == 0x800000000000000 || v8 == 0xC00000000000000)
  {
    goto LABEL_70;
  }
  return (Class)v6;
}

+ (BOOL)_enabled
{
  return 1;
}

- (int64_t)assetIdiom
{
  return -1;
}

+ (id)lightweightFactoryForVisualStyle:(id)a3 renderingContext:(id)a4
{
  void *v4;

  +[UIKBRenderFactory factoryForVisualStyle:renderingContext:skipLayoutSegments:](UIKBRenderFactory, "factoryForVisualStyle:renderingContext:skipLayoutSegments:", *(_QWORD *)&a3, a4, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLightweightFactory:", 1);
  return v4;
}

- (double)keyCornerRadius
{
  return 5.0;
}

- (double)emojiPopupDividerKeyOffset
{
  double v2;

  -[UIKBRenderFactory scale](self, "scale");
  return 1.0 / v2;
}

- (CGPoint)dualStringKeyTopTextOffset:(id)a3 keyplane:(id)a4
{
  double v4;
  double v5;
  CGPoint result;

  v4 = *MEMORY[0x1E0C9D538];
  v5 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  result.y = v5;
  result.x = v4;
  return result;
}

- (CGPoint)dualStringKeyBottomTextOffset:(id)a3 keyplane:(id)a4
{
  double v4;
  double v5;
  CGPoint result;

  v4 = *MEMORY[0x1E0C9D538];
  v5 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  result.y = v5;
  result.x = v4;
  return result;
}

- (UIEdgeInsets)dynamicInsets
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

- (double)dynamicBottomRowMultiplier
{
  return 0.125;
}

- (void)modifyTraitsForDetachedInputSwitcher:(id)a3 withKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __objc2_class **v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
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
  void *v32;
  double x;
  double y;
  double width;
  double height;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  double v41;
  double v42;
  void *v43;
  _QWORD v44[2];
  CGRect v45;
  CGRect v46;
  CGRect v47;

  v44[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "geometry");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDetachedVariants:", 1);

  -[UIKBRenderFactory renderConfig](self, "renderConfig");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "lightKeyboard");

  if (v10)
  {
    objc_msgSend(v6, "setBlendForm:", 0);
    +[UIKBEdgeEffect effectWithColor:edges:inset:weight:](UIKBEdgeEffect, "effectWithColor:edges:inset:weight:", CFSTR("UIKBColorBlack_Alpha12"), 15, -0.25, 0.5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addRenderEffect:", v11);

  }
  objc_msgSend(v6, "setBlurBlending:", 1);
  if (objc_msgSend(v7, "displayType") == 13 || objc_msgSend(v7, "displayType") == 4)
    v12 = off_1E167A978;
  else
    v12 = off_1E167AF28;
  -[__objc2_class sharedInstance](*v12, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "popupRect");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "_layout");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "convertRect:fromView:", v13, v15, v17, v19, v21);
  v25 = v24;
  v27 = v26;
  v29 = v28;
  v31 = v30;

  objc_msgSend(v6, "geometry");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "displayFrame");
  v47.origin.x = v25;
  v47.origin.y = v27;
  v47.size.width = v29;
  v47.size.height = v31;
  v46 = CGRectUnion(v45, v47);
  x = v46.origin.x;
  y = v46.origin.y;
  width = v46.size.width;
  height = v46.size.height;

  objc_msgSend(v6, "geometry");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setDisplayFrame:", x, y, width, height);

  +[UIKBRenderGeometry geometryWithFrame:paddedFrame:](UIKBRenderGeometry, "geometryWithFrame:paddedFrame:", v25, v27, v29, v31, v25, v27, v29, v31);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v44[0] = v38;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 1);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setVariantGeometries:", v39);

  objc_msgSend(v6, "geometry");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setPopupBias:", 40);

  -[UIKBRenderFactory keyCornerRadius](self, "keyCornerRadius");
  v42 = v41;
  objc_msgSend(v6, "geometry");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setRoundRectRadius:", v42);

}

- (void)modifyTraitsForDividerVariant:(id)a3 withKey:(id)a4
{
  id v6;
  id v7;
  __CFString *v8;
  void *v9;
  void *v10;
  id v11;
  int v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  BOOL v18;
  id v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  double MinX;
  void *v36;
  double v37;
  double MaxX;
  void *v39;
  double v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  void *v50;
  _QWORD v51[4];
  id v52;
  uint64_t *v53;
  uint64_t v54;
  double v55;
  uint64_t v56;
  double v57;
  BOOL v58;
  _QWORD v59[4];
  id v60;
  UIKBRenderFactory *v61;
  uint64_t *v62;
  _QWORD *v63;
  uint64_t *v64;
  uint64_t *v65;
  BOOL v66;
  uint64_t v67;
  double *v68;
  uint64_t v69;
  uint64_t v70;
  _QWORD v71[4];
  __int128 v72;
  __int128 v73;
  uint64_t v74;
  uint64_t *v75;
  uint64_t v76;
  char v77;
  uint64_t v78;
  uint64_t *v79;
  uint64_t v80;
  uint64_t v81;
  CGRect v82;
  CGRect v83;
  CGRect v84;
  CGRect v85;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "variantPopupBias");
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

  v78 = 0;
  v79 = &v78;
  v80 = 0x2020000000;
  v81 = 0x7FFFFFFFFFFFFFFFLL;
  v74 = 0;
  v75 = &v74;
  v76 = 0x2020000000;
  v77 = 0;
  v71[0] = 0;
  v71[1] = v71;
  v71[2] = 0x4010000000;
  v71[3] = &unk_18685B0AF;
  v72 = 0u;
  v73 = 0u;
  v67 = 0;
  v68 = (double *)&v67;
  v69 = 0x2020000000;
  v70 = 0;
  v9 = v7;
  objc_msgSend(v7, "subtrees");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v59[0] = MEMORY[0x1E0C809B0];
  v59[1] = 3221225472;
  v59[2] = __59__UIKBRenderFactory_modifyTraitsForDividerVariant_withKey___block_invoke;
  v59[3] = &unk_1E16D3B38;
  v11 = v6;
  v60 = v11;
  v61 = self;
  v66 = v8 == CFSTR("fixed-left");
  v62 = &v67;
  v63 = v71;
  v64 = &v74;
  v65 = &v78;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v59);

  if (v79[3] != 0x7FFFFFFFFFFFFFFFLL)
  {
    v12 = *((unsigned __int8 *)v75 + 24);
    v13 = v68[3];
    v14 = -v13;
    if (*((_BYTE *)v75 + 24))
    {
      v15 = 0.0;
      v16 = -v13;
      v14 = v68[3];
    }
    else
    {
      v15 = v68[3];
      v13 = 0.0;
      v16 = v15;
    }
    objc_msgSend(v9, "subtrees", CFSTR("fixed-left"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v12 == 0;
    v51[0] = MEMORY[0x1E0C809B0];
    v51[1] = 3221225472;
    if (v8 != CFSTR("fixed-left"))
      v18 = v12 != 0;
    v51[2] = __59__UIKBRenderFactory_modifyTraitsForDividerVariant_withKey___block_invoke_2;
    v51[3] = &unk_1E16D3B60;
    v58 = v18;
    v53 = &v78;
    v19 = v11;
    v52 = v19;
    v54 = 0;
    v55 = v16;
    v56 = 0;
    v57 = v14;
    objc_msgSend(v17, "enumerateObjectsUsingBlock:", v51);

    objc_msgSend(v19, "geometry");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "displayFrame");
    v22 = v21;
    v24 = v23;
    v26 = v25;
    v28 = v27;
    objc_msgSend(v19, "geometry");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setDisplayFrame:", v15 + v22, v24 + 0.0, v26 - (v15 + v13), v28 - (0.0 + 0.0));

    objc_msgSend(v19, "geometry");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v29) = objc_msgSend(v30, "popupBias");

    if ((_DWORD)v29 == 2)
    {
      objc_msgSend(v19, "variantGeometries");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8 == CFSTR("fixed-left"))
      {
        objc_msgSend(v31, "lastObject");
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v19, "variantGeometries");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "firstObject");
      }
      else
      {
        objc_msgSend(v31, "firstObject");
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v19, "variantGeometries");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "lastObject");
      }
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v32, "frame");
      MinX = CGRectGetMinX(v82);
      objc_msgSend(v19, "geometry");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "displayFrame");
      v37 = CGRectGetMinX(v83);

      objc_msgSend(v34, "frame");
      MaxX = CGRectGetMaxX(v84);
      objc_msgSend(v19, "geometry");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "displayFrame");
      v40 = CGRectGetMaxX(v85);

      objc_msgSend(v19, "geometry");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "displayFrame");
      v43 = v42;
      v45 = v44;
      v47 = v46;
      v49 = v48;
      objc_msgSend(v19, "geometry");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "setDisplayFrame:", (MinX - v37 + MaxX - v40) * 0.5 + v43, v45 + 0.0, v47 - ((MinX - v37 + MaxX - v40) * 0.5 - (MinX - v37 + MaxX - v40) * 0.5), v49);

    }
  }

  _Block_object_dispose(&v67, 8);
  _Block_object_dispose(v71, 8);
  _Block_object_dispose(&v74, 8);
  _Block_object_dispose(&v78, 8);

}

void __59__UIKBRenderFactory_modifyTraitsForDividerVariant_withKey___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  double v12;
  double v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  double MidX;
  void *v19;
  BOOL v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  id v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;

  v7 = *(void **)(a1 + 32);
  v8 = a2;
  objc_msgSend(v7, "variantGeometries");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndex:", a3);
  v34 = (id)objc_claimAutoreleasedReturnValue();

  LODWORD(v9) = objc_msgSend(v8, "displayType");
  objc_msgSend(v34, "frame");
  v14 = v12;
  if ((_DWORD)v9 == 50)
  {
    objc_msgSend(*(id *)(a1 + 40), "emojiPopupDividerKeyOffset");
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v14 * v15;
    v16 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    if (*(_BYTE *)(a1 + 80))
    {
      *(_QWORD *)(v17 + 40) = v16;
      objc_msgSend(v34, "frame");
      MidX = CGRectGetMidX(v35);
      objc_msgSend(*(id *)(a1 + 32), "geometry");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "frame");
      v20 = MidX > CGRectGetMidX(v36);
    }
    else
    {
      *(_QWORD *)(v17 + 56) = v16;
      objc_msgSend(v34, "frame");
      v29 = CGRectGetMidX(v37);
      objc_msgSend(*(id *)(a1 + 32), "geometry");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "frame");
      v20 = v29 >= CGRectGetMidX(v38);
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v20;

    objc_msgSend(v34, "applyInsets:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 48), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 56));
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = a3;
    *a4 = 1;
  }
  else if (CGRectIsEmpty(*(CGRect *)&v10))
  {
    objc_msgSend(*(id *)(a1 + 32), "variantGeometries");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (a3)
    {
      objc_msgSend(v21, "objectAtIndex:", a3 - 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      v24 = (void *)objc_msgSend(v23, "copy");
      objc_msgSend(v23, "frame");
      v26 = v25;
      objc_msgSend(v23, "frame");
      v28 = -v27;
    }
    else
    {
      objc_msgSend(v21, "objectAtIndex:", 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      v24 = (void *)objc_msgSend(v23, "copy");
      objc_msgSend(v23, "frame");
      v26 = -v30;
      objc_msgSend(v23, "frame");
      v28 = v31;
    }
    objc_msgSend(v24, "applyInsets:", 0.0, v26, 0.0, v28);
    objc_msgSend(*(id *)(a1 + 32), "variantGeometries");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (void *)objc_msgSend(v32, "mutableCopy");

    objc_msgSend(v33, "replaceObjectAtIndex:withObject:", a3, v24);
    objc_msgSend(*(id *)(a1 + 32), "setVariantGeometries:", v33);

  }
}

void __59__UIKBRenderFactory_modifyTraitsForDividerVariant_withKey___block_invoke_2(uint64_t a1, void *a2, unint64_t a3)
{
  id v5;
  unint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a2;
  v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (!*(_BYTE *)(a1 + 80))
  {
    if (v6 < a3)
      goto LABEL_4;
    goto LABEL_3;
  }
  if (v6 < a3)
  {
LABEL_3:
    v9 = v5;
    objc_msgSend(*(id *)(a1 + 32), "variantGeometries");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndex:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "applyInsets:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
    v5 = v9;
  }
LABEL_4:

}

- (double)RivenFactor:(double)a3
{
  double v3;
  double rivenSizeFactor;

  v3 = round(self->_rivenSizeFactor * a3);
  if (a3 == 1.0)
    rivenSizeFactor = self->_rivenSizeFactor;
  else
    rivenSizeFactor = v3;
  return self->_stretchFactor.height * rivenSizeFactor;
}

- (CGPoint)RivenPointFactor:(CGPoint)a3
{
  double y;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGPoint result;

  y = a3.y;
  -[UIKBRenderFactory RivenFactor:](self, "RivenFactor:", a3.x);
  v6 = v5;
  -[UIKBRenderFactory RivenFactor:](self, "RivenFactor:", y);
  v8 = v7;
  v9 = v6;
  result.y = v8;
  result.x = v9;
  return result;
}

- (void)scaleTraits:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "geometry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "roundRectRadius");
  -[UIKBRenderFactory RivenFactor:](self, "RivenFactor:");
  v7 = v6;
  objc_msgSend(v4, "geometry");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setRoundRectRadius:", v7);

  objc_msgSend(v4, "symbolStyle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fontSize");
  -[UIKBRenderFactory RivenFactor:](self, "RivenFactor:");
  v11 = v10;
  objc_msgSend(v4, "symbolStyle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFontSize:", v11);

  objc_msgSend(v4, "symbolStyle");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "minFontSize");
  -[UIKBRenderFactory RivenFactor:](self, "RivenFactor:");
  v15 = v14;
  objc_msgSend(v4, "symbolStyle");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setMinFontSize:", v15);

  objc_msgSend(v4, "symbolStyle");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "kerning");
  -[UIKBRenderFactory RivenFactor:](self, "RivenFactor:");
  v19 = v18;
  objc_msgSend(v4, "symbolStyle");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setKerning:", v19);

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  objc_msgSend(v4, "secondarySymbolStyles", 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v30 != v24)
          objc_enumerationMutation(v21);
        v26 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(v26, "fontSize");
        -[UIKBRenderFactory RivenFactor:](self, "RivenFactor:");
        objc_msgSend(v26, "setFontSize:");
        objc_msgSend(v26, "kerning");
        -[UIKBRenderFactory RivenFactor:](self, "RivenFactor:");
        objc_msgSend(v26, "setKerning:");
        objc_msgSend(v26, "textOffset");
        -[UIKBRenderFactory RivenPointFactor:](self, "RivenPointFactor:");
        objc_msgSend(v26, "setTextOffset:");
      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v23);
  }

  objc_msgSend(v4, "variantTraits");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    objc_msgSend(v4, "variantTraits");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBRenderFactory scaleTraits:](self, "scaleTraits:", v28);

  }
}

- (double)translucentGapWidth
{
  double v2;

  -[UIKBRenderFactory scale](self, "scale");
  return 1.0 / v2;
}

- (void)lowQualityTraits:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (objc_msgSend(v8, "blurBlending"))
  {
    -[UIKBRenderFactory lowQualityLayeredBackgroundColorName](self, "lowQualityLayeredBackgroundColorName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIKBGradient gradientWithFlatColor:](UIKBGradient, "gradientWithFlatColor:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setLayeredBackgroundGradient:", v5);

  }
  objc_msgSend(v8, "variantTraits");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v8, "variantTraits");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBRenderFactory lowQualityTraits:](self, "lowQualityTraits:", v7);

  }
}

- (BOOL)supportsInputTraits:(id)a3 forKeyplane:(id)a4
{
  return objc_msgSend(a3, "keyboardType") != 12;
}

- (void)customizeLanguageIndicatorTraitsForTraits:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[UIKBRenderFactory defaultKeyBackgroundColorName](self, "defaultKeyBackgroundColorName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKBGradient gradientWithFlatColor:](UIKBGradient, "gradientWithFlatColor:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundGradient:", v5);

  objc_msgSend(v6, "setBlurBlending:", 1);
}

- (void)customizeMicOnTraitsForTraits:(id)a3 lightKeyboard:(BOOL)a4 keyState:(int)a5
{
  _BOOL4 v6;
  id v7;
  void *v8;
  __CFString **v9;
  void *v10;
  __CFString *v11;
  void *v12;
  id v13;

  v6 = a4;
  v7 = a3;
  if (a5 == 4)
  {
    v13 = v7;
    if (v6)
    {
      +[UIKBGradient gradientWithFlatColor:](UIKBGradient, "gradientWithFlatColor:", CFSTR("UIKBMicOnLightModeBackgroundColor"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setBackgroundGradient:", v8);

      v9 = UIKBMicOnLightModeGlyphColor;
    }
    else
    {
      +[UIKBGradient gradientWithFlatColor:](UIKBGradient, "gradientWithFlatColor:", CFSTR("UIKBMicOnDarkModeBackgroundColor"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setBackgroundGradient:", v10);

      v9 = UIKBMicOnDarkModeGlyphColor;
    }
    v11 = *v9;
    objc_msgSend(v13, "symbolStyle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTextColor:", v11);

    v7 = v13;
  }

}

- (id)globalKeyImageName
{
  return CFSTR("globe");
}

- (id)globalEmojiKeyImageName
{
  return CFSTR("emoji.face.grinning");
}

- (id)dictationKeyImageName
{
  return CFSTR("mic");
}

- (id)dismissKeyImageName
{
  return CFSTR("keyboard.chevron.compact.down");
}

- (id)multitapCompleteKeyImageName
{
  return CFSTR("kana_multitap_complete_arrow.png");
}

- (id)muttitapReverseKeyImageName
{
  return CFSTR("kana_multitap_reverse_arrow.png");
}

- (id)handwritingMoreKeyImageName
{
  return CFSTR("hand.draw");
}

- (id)deleteOnKeyImageName
{
  return CFSTR("delete.left.fill");
}

- (id)shiftLockImageName
{
  return CFSTR("capslock.fill");
}

- (id)returnKeyImageName
{
  return CFSTR("return");
}

- (id)leftArrowKeyImageName
{
  return CFSTR("chevron.left");
}

- (id)rightArrowKeyImageName
{
  return CFSTR("chevron.right");
}

- (id)cutKeyImageName
{
  return CFSTR("scissors");
}

- (id)copyKeyImageName
{
  return CFSTR("doc.on.doc");
}

- (id)pasteKeyImageName
{
  return CFSTR("doc.on.clipboard");
}

- (id)undoKeyImageName
{
  return CFSTR("arrow.uturn.backward");
}

- (id)redoKeyImageName
{
  return CFSTR("arrow.uturn.forward");
}

- (id)boldKeyImageName
{
  return CFSTR("bold");
}

- (id)biuKeyImageName
{
  return CFSTR("bold.italic.underline");
}

- (id)messagesWriteboardKeyImageName
{
  return CFSTR("messages_writeboard.png");
}

- (id)spaceKeyGrabberHandlesImageName
{
  return CFSTR("spacekey_grabber_handles.png");
}

- (id)ZWNJKeyImageName
{
  return CFSTR("ZWNJ_portrait.png");
}

- (double)skinnyKeyThreshold
{
  return 36.0;
}

- (BOOL)shouldClearBaseDisplayStringForVariants:(id)a3
{
  return 1;
}

- (void)suppressLayoutSegments
{
  self->_suppressSegmentTraits = 1;
}

- (int64_t)lightHighQualityEnabledBlendForm
{
  return 0;
}

- (id)_defaultControlKeyBackgroundColorName
{
  void *v2;
  int v3;
  int64_t v4;
  __CFString **v5;

  -[UIKBRenderFactory renderConfig](self, "renderConfig");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "lightKeyboard");

  if (v3)
  {
    v4 = +[UIKBRenderFactory _graphicsQuality](UIKBRenderFactory, "_graphicsQuality");
    v5 = UIKBColorKeyGrayKeyLightBackgroundMedium;
    if (v4 == 100)
      v5 = UIKBColorGray_Percent55;
  }
  else
  {
    v5 = UIKBColorKeyGrayKeyDarkBackground;
  }
  return *v5;
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
  v4 = UIKBColorWhite;
  if (!v3)
    v4 = UIKBColorBlack;
  v5 = *v4;

  return v5;
}

+ (id)segmentedControlColor:(BOOL)a3
{
  __CFString **v3;

  v3 = UIKBColorKeyGrayKeyLightBackground;
  if (!a3)
    v3 = UIKBColorKeyGrayKeyDarkBackground;
  return +[UIColor colorWithCGColor:](UIColor, "colorWithCGColor:", UIKBGetNamedColor(*v3));
}

- (id)lightKeycapsFontName
{
  if (self->_boldTextEnabled)
    return CFSTR(".PhoneKeyCaps");
  else
    return CFSTR(".Keycaps-Keys");
}

- (id)thinKeycapsFontName
{
  if (self->_boldTextEnabled)
    return CFSTR(".PhoneKeyCaps");
  else
    return CFSTR(".Keycaps-Popups");
}

- (id)lightPadKeycapsFontName
{
  if (self->_boldTextEnabled)
    return CFSTR(".PhoneKeyCaps");
  else
    return CFSTR(".KeycapsPad-Keys");
}

- (id)thinTextFontName
{
  return CFSTR("UIKBRenderFactorySystemFontName");
}

- (void)_customizeTraits:(id)a3 forPopupForKey:(id)a4 withRenderingContext:(id)a5 keycapsFontName:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  int v13;
  __CFString **v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  __objc2_class **v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  void *v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  double Height;
  double v42;
  double Width;
  double v44;
  void *v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  CGFloat v55;
  double v56;
  CGFloat v57;
  double v58;
  CGFloat v59;
  double v60;
  CGFloat v61;
  CGFloat v62;
  CGFloat v63;
  CGFloat v64;
  CGFloat v65;
  double x;
  double y;
  double v68;
  double v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  CGFloat rect;
  double rect_8;
  double rect_16;
  id rect_24;
  CGRect v78;
  CGRect v79;
  CGRect v80;
  CGRect v81;
  CGRect v82;
  CGRect v83;
  CGRect v84;
  CGRect v85;
  CGRect v86;
  CGRect v87;

  rect_24 = a3;
  v9 = a4;
  v10 = a6;
  v11 = a5;
  objc_msgSend(v11, "renderConfig");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "lightKeyboard");

  v14 = UIKBColorGray_Percent37;
  if (v13)
    v14 = UIKBColorWhite;
  +[UIKBGradient gradientWithFlatColor:](UIKBGradient, "gradientWithFlatColor:", *v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(rect_24, "setBackgroundGradient:", v15);

  objc_msgSend(rect_24, "removeAllRenderEffects");
  objc_msgSend(v11, "renderConfig");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_msgSend(v16, "lightKeyboard");
  if (v17)
  {
    +[UIKBShadowEffect effectWithColor:offset:insets:weight:](UIKBShadowEffect, "effectWithColor:offset:insets:weight:", CFSTR("UIKBColorBlack_Alpha8"), 0.0, 1.0, 1.0, 0.5, 0.0, 0.5, 4.5);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(rect_24, "addRenderEffect:", v18);

    +[UIKBShadowEffect effectWithColor:offset:insets:weight:](UIKBShadowEffect, "effectWithColor:offset:insets:weight:", CFSTR("UIKBColorBlack_Alpha29"), 0.0, -1.0, 1.0, 0.5, 0.0, 0.5, 4.5);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(rect_24, "addRenderEffect:", v19);

  }
  if (objc_msgSend(v9, "displayType") == 13 || objc_msgSend(v9, "displayType") == 4)
    v20 = off_1E167A978;
  else
    v20 = off_1E167AF28;
  -[__objc2_class sharedInstance](*v20, "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "_layout");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v23, "bounds");
  objc_msgSend(v23, "convertRect:toView:", 0);
  v25 = v24;
  v27 = v26;
  v29 = v28;
  v31 = v30;
  objc_msgSend(v23, "window");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "frame");
  v34 = v33;
  rect = v33;
  v36 = v35;
  v38 = v37;
  v40 = v39;

  v78.origin.x = v25;
  v78.origin.y = v27;
  v78.size.width = v29;
  v78.size.height = v31;
  rect_16 = CGRectGetMinY(v78);
  v79.origin.x = v25;
  v79.origin.y = v27;
  v79.size.width = v29;
  v79.size.height = v31;
  rect_8 = CGRectGetMinX(v79);
  v80.origin.x = v34;
  v80.origin.y = v36;
  v80.size.width = v38;
  v80.size.height = v40;
  Height = CGRectGetHeight(v80);
  v81.origin.x = v25;
  v81.origin.y = v27;
  v81.size.width = v29;
  v81.size.height = v31;
  v42 = Height - CGRectGetMaxY(v81);
  v82.origin.x = rect;
  v82.origin.y = v36;
  v82.size.width = v38;
  v82.size.height = v40;
  Width = CGRectGetWidth(v82);
  v83.origin.x = v25;
  v83.origin.y = v27;
  v83.size.width = v29;
  v83.size.height = v31;
  v44 = Width - CGRectGetMaxX(v83);
  objc_msgSend(rect_24, "geometry");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setLayoutMargins:", rect_16, rect_8, v42, v44);

  objc_msgSend(v21, "popupRect");
  v47 = v46;
  v49 = v48;
  v51 = v50;
  v53 = v52;
  objc_msgSend(v9, "paddedFrame");
  v55 = v54;
  v57 = v56;
  v59 = v58;
  v61 = v60;
  objc_msgSend(v23, "convertRect:fromView:", v21, v47, v49, v51, v53);
  v87.origin.x = v62;
  v87.origin.y = v63;
  v87.size.width = v64;
  v87.size.height = v65;
  v84.origin.x = v55;
  v84.origin.y = v57;
  v84.size.width = v59;
  v84.size.height = v61;
  v85 = CGRectUnion(v84, v87);
  v86 = CGRectInset(v85, -12.0, -6.0);
  x = v86.origin.x;
  y = v86.origin.y;
  v68 = v86.size.width;
  v69 = v86.size.height;
  objc_msgSend(rect_24, "geometry");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "setDisplayFrame:", x, y, v68, v69);

  objc_msgSend(rect_24, "setBlurBlending:", 1);
  objc_msgSend(rect_24, "geometry");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "setPopupBias:", 40);

  +[UIKBTextStyle styleWithFontName:withFontSize:](UIKBTextStyle, "styleWithFontName:withFontSize:", v10, 22.0);
  v72 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(rect_24, "setSymbolStyle:", v72);
  objc_msgSend(rect_24, "symbolStyle");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "setTextColor:", CFSTR("UIKBColorClear"));

  if (+[UIKBRenderFactory _graphicsQuality](UIKBRenderFactory, "_graphicsQuality") == 10)
    objc_msgSend(rect_24, "removeAllRenderEffects");

}

void __51__UIKBRenderFactory_glyphSelectorForDisplayString___block_invoke_272(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v7;

  v7 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "rangeOfCharacterFromSet:", a2) != 0x7FFFFFFFFFFFFFFFLL)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v7, "integerValue");
    *a4 = 1;
  }

}

- (BOOL)popupKeyUsesCustomKeyContentView:(id)a3
{
  return -[UIKBRenderFactory contentViewClassForPopupKey:](self, "contentViewClassForPopupKey:", a3) != 0;
}

- (Class)contentViewClassForPopupKey:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if (objc_msgSend(v3, "variantType") == 12
    || objc_msgSend(v3, "variantType") == 13
    || _os_feature_enabled_impl()
    && (objc_msgSend(v3, "variantType") == 10 || objc_msgSend(v3, "variantType") == 11))
  {
    objc_opt_class();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (Class)v4;
}

- (void)setRenderingContext:(id)a3
{
  objc_storeStrong((id *)&self->_renderingContext, a3);
}

- (double)rivenSizeFactor
{
  return self->_rivenSizeFactor;
}

- (void)setRivenSizeFactor:(double)a3
{
  self->_rivenSizeFactor = a3;
}

- (void)setLightweightFactory:(BOOL)a3
{
  self->_lightweightFactory = a3;
}

- (CGSize)stretchFactor
{
  double width;
  double height;
  CGSize result;

  width = self->_stretchFactor.width;
  height = self->_stretchFactor.height;
  result.height = height;
  result.width = width;
  return result;
}

- (BOOL)increasedContrastEnabled
{
  return self->_increasedContrastEnabled;
}

- (void)setIncreasedContrastEnabled:(BOOL)a3
{
  self->_increasedContrastEnabled = a3;
}

- (void)setDrawsOneHandedAffordance:(BOOL)a3
{
  self->_drawsOneHandedAffordance = a3;
}

- (BOOL)dynamicFactory
{
  return self->_dynamicFactory;
}

- (void)setDynamicFactory:(BOOL)a3
{
  self->_dynamicFactory = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_segmentTraits, 0);
  objc_storeStrong((id *)&self->_renderingContext, 0);
}

- (void)modifyKeyTraitsForPasscode:(id)a3 forKey:(id)a4 onKeyplane:(id)a5
{
  id v7;
  BOOL v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v7 = a4;
  if ((-[UIKBRenderFactory _popupStyleForKey:](self, "_popupStyleForKey:", v7) & 1) == 0
    && (-[UIKBRenderFactory _popupMenuStyleForKey:](self, "_popupMenuStyleForKey:", v7) & 1) == 0)
  {
    objc_msgSend(v11, "setBlendForm:", 3);
    v8 = -[UIKBRenderFactory useBlueThemingForKey:](self, "useBlueThemingForKey:", v7);
    objc_msgSend(v11, "removeAllRenderEffects");
    if (!v8)
    {
      objc_msgSend(v11, "setBackgroundGradient:", 0);
      objc_msgSend(v11, "setLayeredBackgroundGradient:", 0);
      objc_msgSend(v11, "setLayeredForegroundGradient:", 0);
      -[UIKBRenderFactory controlKeyTraits](self, "controlKeyTraits");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "overlayWithTraits:", v9);

      if (objc_msgSend(v7, "displayType") == 25)
      {
        -[UIKBRenderFactory suppressLayoutSegments](self, "suppressLayoutSegments");
        if ((objc_msgSend(v7, "state") & 4) != 0)
        {
          -[UIKBRenderFactory activeControlKeyTraits](self, "activeControlKeyTraits");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "overlayWithTraits:", v10);

        }
      }
    }
  }

}

- (id)passcodeBackgroundTraitsForKeyplane:(id)a3
{
  id v3;
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
  double v19;
  void *v20;
  void *v21;

  v3 = a3;
  objc_msgSend(v3, "frame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend(v3, "frame");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;

  +[UIKBRenderGeometry geometryWithFrame:paddedFrame:](UIKBRenderGeometry, "geometryWithFrame:paddedFrame:", v5, v7, v9, v11, v13, v15, v17, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKBRenderTraits traitsWithGeometry:](UIKBRenderTraits, "traitsWithGeometry:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "setControlOpacities:", 1);
  objc_msgSend(v21, "setBlendForm:", 3);
  return v21;
}

- (double)passcodeEdgeWeight
{
  return 1.0;
}

- (id)passcodeKeyEdgeColorName
{
  return CFSTR("UIKBColorGray_Percent40");
}

- (id)passcodeControlKeyTraits
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  +[UIKBRenderTraits traitsWithSymbolStyle:](UIKBRenderTraits, "traitsWithSymbolStyle:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBlendForm:", 3);
  objc_msgSend(v3, "setControlOpacities:", 1);
  -[UIKBRenderFactory passcodeEdgeWeight](self, "passcodeEdgeWeight");
  v5 = v4;
  -[UIKBRenderFactory passcodeKeyEdgeColorName](self, "passcodeKeyEdgeColorName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKBEdgeEffect effectWithColor:edges:inset:weight:](UIKBEdgeEffect, "effectWithColor:edges:inset:weight:", v6, 15, v5 * 0.5, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "addRenderEffect:", v7);
  +[UIKBEdgeEffect effectWithColor:edges:inset:weight:](UIKBEdgeEffect, "effectWithColor:edges:inset:weight:", CFSTR("UIKBColorWhite"), 15, v5 * 0.5, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBRenderFactory renderConfig](self, "renderConfig");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "keycapOpacity");
  objc_msgSend(v8, "setOpacity:");

  objc_msgSend(v3, "addForegroundRenderEffect:", v8);
  return v3;
}

- (id)passcodeActiveControlKeyTraits
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;

  +[UIKBRenderTraits traitsWithSymbolStyle:](UIKBRenderTraits, "traitsWithSymbolStyle:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBlendForm:", 3);
  objc_msgSend(v3, "setControlOpacities:", 1);
  -[UIKBRenderFactory passcodeKeyEdgeColorName](self, "passcodeKeyEdgeColorName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKBGradient gradientWithFlatColor:](UIKBGradient, "gradientWithFlatColor:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundGradient:", v5);

  +[UIKBGradient gradientWithFlatColor:](UIKBGradient, "gradientWithFlatColor:", CFSTR("UIKBColorWhite"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLayeredForegroundGradient:", v6);

  -[UIKBRenderFactory renderConfig](self, "renderConfig");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "keycapOpacity");
  v9 = v8;
  objc_msgSend(v3, "layeredForegroundGradient");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setOpacity:", v9);

  +[UIKBEdgeEffect effectWithColor:edges:inset:weight:](UIKBEdgeEffect, "effectWithColor:edges:inset:weight:", 0, 0, 0.0, 0.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addRenderEffect:", v11);

  +[UIKBEdgeEffect effectWithColor:edges:inset:weight:](UIKBEdgeEffect, "effectWithColor:edges:inset:weight:", 0, 0, 0.0, 0.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addForegroundRenderEffect:", v12);

  return v3;
}

- (id)passcodeShiftedControlKeyTraits
{
  void *v2;
  void *v3;

  -[UIKBRenderFactory passcodeActiveControlKeyTraits](self, "passcodeActiveControlKeyTraits");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKBTextStyle styleWithTextColor:](UIKBTextStyle, "styleWithTextColor:", CFSTR("UIKBColorWhite"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSymbolStyle:", v3);

  return v2;
}

- (id)extraPasscodePaddleTraits
{
  void *v2;
  void *v3;

  +[UIKBRenderTraits traitsWithSymbolStyle:](UIKBRenderTraits, "traitsWithSymbolStyle:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKBGradient gradientWithFlatColor:](UIKBGradient, "gradientWithFlatColor:", CFSTR("UIKBColorWhite_Alpha30"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBackgroundGradient:", v3);

  return v2;
}

void __48__UIKBRenderFactory_Monolith__textOffsetForKey___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3500], "lowercaseLetterCharacterSet");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_1116;
  _MergedGlobals_1116 = v0;

}

uint64_t __68__UIKBRenderFactory_Monolith__variantTraitsForLetterKey_onKeyplane___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsString:", CFSTR("Delete"));

  if ((_DWORD)v6)
    *a4 = 1;
  return v6;
}

@end
