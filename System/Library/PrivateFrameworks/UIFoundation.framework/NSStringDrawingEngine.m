@implementation NSStringDrawingEngine

Class ____NSStringDrawingEngine_block_invoke()
{
  uint64_t v0;
  void *v1;
  Class result;

  v0 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "objectForKey:", CFSTR("NSStringDrawingDefaultRenderers"));
  if (v0)
  {
    v1 = (void *)v0;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      __NSStringDrawingDefaultRendererConfiguration = objc_msgSend(v1, "integerValue");
  }
  result = NSClassFromString((NSString *)CFSTR("NSProFont"));
  if (result)
    __NSStringDrawingDefaultRendererConfiguration &= 0xFFFFFFFFFFFFFFFCLL;
  return result;
}

uint64_t ____NSStringDrawingEngine_block_invoke_2()
{
  uint64_t result;
  void *v1;
  uint64_t v2;

  result = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "objectForKey:", CFSTR("NSDefaultTighteningFactor"));
  if (result)
  {
    v1 = (void *)result;
    result = objc_opt_respondsToSelector();
    if ((result & 1) != 0)
    {
      result = objc_msgSend(v1, "doubleValue");
      __NSStringDrawingEngine__factor = v2;
    }
  }
  return result;
}

uint64_t ____NSStringDrawingEngine_block_invoke_362(uint64_t a1, void *a2)
{
  uint64_t v4;
  _NSCachedAttributedString *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  CGContext *v9;
  int v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  double v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  double height;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  char *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  void *v41;
  uint64_t v42;
  _QWORD v43[5];
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  char v47;
  __int128 v48;
  CGRect v49;

  v4 = *(_QWORD *)(a1 + 32);
  if (v4 == *(_QWORD *)(a1 + 80))
  {
    v5 = [_NSCachedAttributedString alloc];
    if (*(_BYTE *)(a1 + 192) && *(_QWORD *)(a1 + 88) != *(_QWORD *)(a1 + 96))
      v6 = objc_msgSend(*(id *)(a1 + 32), "substringToIndex:");
    else
      v6 = *(_QWORD *)(a1 + 32);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) = -[_NSCachedAttributedString initWithString:attributes:](v5, "initWithString:attributes:", v6, *(_QWORD *)(a1 + 40));
    v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  }
  else if (*(_BYTE *)(a1 + 192) && *(_QWORD *)(a1 + 88) != *(_QWORD *)(a1 + 96))
  {
    v4 = objc_msgSend(*(id *)(a1 + 32), "attributedSubstringFromRange:", 0);
  }
  v7 = (void *)objc_msgSend(a2, "textContainerForAttributedString:containerSize:lineFragmentPadding:", v4, *(double *)(a1 + 104), *(double *)(a1 + 112), 0.0);
  objc_msgSend(v7, "setMaximumNumberOfLines:", objc_msgSend(*(id *)(a1 + 48), "maximumNumberOfLines"));
  objc_msgSend(v7, "setLineBreakMode:", 4 * *(unsigned __int8 *)(a1 + 193));
  objc_msgSend(a2, "_setBaselineMode:", *(unsigned __int8 *)(a1 + 192));
  if (*(_BYTE *)(a1 + 193))
    v8 = objc_msgSend(*(id *)(a1 + 48), "wrapsForTruncationMode");
  else
    v8 = 0;
  objc_msgSend(a2, "_setForceWordWrapping:", v8);
  objc_msgSend(a2, "_setBaselineDelta:", 0.0);
  objc_msgSend(a2, "_setWrappedByCluster:", 0);
  objc_msgSend(a2, "setDefaultTighteningFactor:", *(double *)(a1 + 120));
  objc_msgSend((id)objc_msgSend(a2, "layoutManager"), "_setDrawsUnderlinesLikeWebKit:", 0);
  objc_msgSend((id)objc_msgSend(a2, "layoutManager"), "_setDrawsDebugBaselines:", *(unsigned __int8 *)(a1 + 194));
  objc_msgSend((id)objc_msgSend(a2, "layoutManager"), "setSynchronizesAlignmentToDirection:", *(unsigned __int8 *)(a1 + 195));
  objc_msgSend((id)objc_msgSend(a2, "layoutManager"), "_setMirrorsTextAlignment:", *(unsigned __int8 *)(a1 + 196));
  objc_msgSend((id)objc_msgSend(a2, "layoutManager"), "_setForcesTrackingFloor:", *(unsigned __int8 *)(a1 + 197));
  objc_msgSend((id)objc_msgSend(a2, "layoutManager"), "setUsesFontLeading:", *(unsigned __int8 *)(a1 + 198));
  objc_msgSend((id)objc_msgSend(a2, "layoutManager"), "setDelegate:", *(_QWORD *)(a1 + 48));
  objc_msgSend(a2, "_setUsesSimpleTextEffects:", objc_msgSend(*(id *)(a1 + 48), "usesSimpleTextEffects"));
  objc_msgSend((id)objc_msgSend(a2, "layoutManager"), "setStyleEffectConfiguration:", objc_msgSend(*(id *)(a1 + 48), "cuiStyleEffects"));
  objc_msgSend(a2, "setCuiCatalog:", objc_msgSend(*(id *)(a1 + 48), "cuiCatalog"));
  objc_msgSend(a2, "_setApplicationFrameworkContext:", *(_QWORD *)(a1 + 128));
  objc_msgSend((id)objc_msgSend(a2, "layoutManager"), "setApplicationFrameworkContext:", *(_QWORD *)(a1 + 128));
  v9 = (CGContext *)objc_msgSend(*(id *)(a1 + 56), "CGContext");
  if (v9)
  {
    if (*(_BYTE *)(a1 + 199))
    {
LABEL_15:
      v10 = 0;
      goto LABEL_27;
    }
    v11 = objc_msgSend(a2, "length");
    v12 = *(void **)(a1 + 40);
    if (v12)
    {
      v13 = (void *)objc_msgSend(v12, "objectForKey:", CFSTR("NSShadow"));
      if (!v13
        || (int)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "objectForKey:", CFSTR("NSUnderline")), "intValue") <= 0)
      {
        goto LABEL_15;
      }
    }
    else
    {
      v48 = xmmword_18D6CBB80;
      v13 = (void *)objc_msgSend(a2, "attribute:atIndex:longestEffectiveRange:inRange:", CFSTR("NSShadow"), 0, &v48, 0, v11);
      v14 = 0;
      v44 = 0;
      v45 = &v44;
      v46 = 0x2020000000;
      v47 = 0;
      if (v48 == __PAIR128__(v11, 0))
      {
        v43[0] = MEMORY[0x1E0C809B0];
        v43[1] = 3221225472;
        v43[2] = ____NSStringDrawingEngine_block_invoke_2_363;
        v43[3] = &unk_1E2604428;
        v43[4] = &v44;
        objc_msgSend(a2, "enumerateAttribute:inRange:options:usingBlock:", CFSTR("NSUnderline"), 0, v11, 0, v43);
        v14 = *((unsigned __int8 *)v45 + 24);
      }
      _Block_object_dispose(&v44, 8);
      if (!v14)
        goto LABEL_15;
    }
    objc_msgSend(a2, "removeAttribute:range:", CFSTR("NSShadow"), 0, v11);
    objc_msgSend(v13, "applyToGraphicsContext:", *(_QWORD *)(a1 + 56));
    CGContextBeginTransparencyLayer(v9, 0);
    v10 = 1;
LABEL_27:
    objc_msgSend(a2, "drawTextContainer:range:withRect:graphicsContext:baselineMode:scrollable:padding:", v7, *(_QWORD *)(a1 + 136), *(_QWORD *)(a1 + 96) - *(_QWORD *)(a1 + 136), v9, *(unsigned __int8 *)(a1 + 192), *(unsigned __int8 *)(a1 + 200), *(double *)(a1 + 144), *(double *)(a1 + 152), *(double *)(a1 + 160), *(double *)(a1 + 168), *(double *)(a1 + 176));
    if (!*(_QWORD *)(a1 + 48))
      goto LABEL_47;
    goto LABEL_28;
  }
  v10 = 0;
LABEL_28:
  if (*(_BYTE *)(a1 + 192))
  {
    objc_msgSend(a2, "_baselineDelta");
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v17 = v16 - *(double *)(v15 + 56);
  }
  else
  {
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v17 = 0.0;
  }
  *(_QWORD *)(v15 + 32) = 0;
  *(double *)(v15 + 40) = v17;
  objc_msgSend(a2, "usedRectForTextContainer:", v7);
  v18 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  *(_QWORD *)(v18 + 48) = v19;
  *(_QWORD *)(v18 + 56) = v20;
  if ((dyld_program_sdk_at_least() & 1) == 0)
  {
    objc_msgSend((id)objc_msgSend(a2, "layoutManager"), "extraLineFragmentRect");
    height = v49.size.height;
    if (!CGRectIsEmpty(v49))
      *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 56) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8)
                                                                              + 56)
                                                                  - height;
  }
  v22 = *(void **)(a1 + 48);
  if (v22)
  {
    if (objc_msgSend(v22, "wantsNumberOfLineFragments"))
    {
      v23 = (void *)objc_msgSend(a2, "layoutManager");
      v24 = objc_msgSend(v23, "glyphRangeForTextContainer:", v7);
      v25 = 0;
      v27 = v24 + v26;
      if (v24 + v26)
      {
        v28 = 0;
        do
        {
          v44 = 0;
          v45 = 0;
          objc_msgSend(v23, "lineFragmentRectForGlyphAtIndex:effectiveRange:", v28, &v44);
          ++v25;
          v28 = (char *)v45 + v44;
        }
        while ((unint64_t)v45 + v44 < v27);
      }
      objc_msgSend(*(id *)(a1 + 48), "setNumberOfLineFragments:", v25);
    }
    if (objc_msgSend(*(id *)(a1 + 48), "wantsBaselineOffset"))
    {
      v29 = (void *)objc_msgSend(a2, "layoutManager");
      v30 = objc_msgSend(v29, "glyphRangeForTextContainer:", v7);
      v32 = v30 + v31;
      v33 = v30 + v31 - 1;
      objc_msgSend(v29, "lineFragmentRectForGlyphAtIndex:effectiveRange:", v33, 0);
      v35 = v34;
      objc_msgSend(v29, "baselineOffsetForGlyphAtIndex:", v33);
      *(double *)&v48 = v36;
      objc_msgSend(*(id *)(a1 + 48), "setBaselineOffset:", v35 + v36);
      v44 = 0;
      v45 = 0;
      objc_msgSend(v29, "lineFragmentRectForGlyphAtIndex:effectiveRange:", v30, &v44);
      v38 = v37;
      if (v32 <= (unint64_t)v45 + v44 || *(_QWORD *)(a1 + 88))
      {
        objc_msgSend(v29, "baselineOffsetForGlyphAtIndex:", v30);
        *(double *)&v48 = v39;
      }
      else
      {
        v41 = (void *)objc_msgSend(a2, "attributesAtIndex:effectiveRange:", 0, 0);
        v42 = objc_msgSend(v41, "objectForKeyedSubscript:", CFSTR("NSParagraphStyle"));
        +[NSCoreTypesetter _lineMetricsForAttributes:typesetterBehavior:usesFontLeading:applySpacings:usesSystemFontLeading:usesNegativeFontLeading:layoutOrientation:lineHeight:baselineOffset:spacing:](NSCoreTypesetter, "_lineMetricsForAttributes:typesetterBehavior:usesFontLeading:applySpacings:usesSystemFontLeading:usesNegativeFontLeading:layoutOrientation:lineHeight:baselineOffset:spacing:", v41, objc_msgSend(MEMORY[0x1E0CB3940], "typesetterBehavior"), *(unsigned __int8 *)(a1 + 198), v42 != 0, 0, 0, objc_msgSend(v7, "layoutOrientation"), 0, &v48, 0);
        v39 = *(double *)&v48;
      }
      objc_msgSend(*(id *)(a1 + 48), "setFirstBaselineOffset:", v38 + v39);
    }
    objc_msgSend(*(id *)(a1 + 48), "setTotalBounds:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 32), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 48), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 56));
    if (*(_QWORD *)(a1 + 184))
      **(_BYTE **)(a1 + 184) = objc_msgSend(a2, "_wrappedByCluster");
  }
LABEL_47:
  objc_msgSend(v7, "setLineBreakMode:", 0);
  objc_msgSend(a2, "setDefaultTighteningFactor:", 0.0);
  objc_msgSend((id)objc_msgSend(a2, "layoutManager"), "setSynchronizesAlignmentToDirection:", 0);
  objc_msgSend((id)objc_msgSend(a2, "layoutManager"), "_setMirrorsTextAlignment:", 0);
  objc_msgSend((id)objc_msgSend(a2, "layoutManager"), "setDelegate:", 0);
  if (v10)
    CGContextEndTransparencyLayer(v9);
  return 0;
}

uint64_t ____NSStringDrawingEngine_block_invoke_2_363(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  uint64_t result;

  result = objc_msgSend(a2, "intValue");
  if ((int)result >= 1)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a5 = 1;
  }
  return result;
}

@end
