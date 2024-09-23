@implementation UIKBRenderFactory_MonolithLinearSlim

- (double)variantKeyPaddingH
{
  return 15.0;
}

- (double)variantKeyPaddingV
{
  return 19.0;
}

- (id)variantTextColor
{
  return CFSTR("UIKBColorWhite");
}

- (id)variantPillBackgroundColor
{
  return CFSTR("UIKBColorBlack_Alpha60");
}

- (id)highlightedVariantPillBackgroundColor
{
  return CFSTR("UIKBColorBlack");
}

- (id)highlightedVariantLayeredBackgroundColor
{
  return CFSTR("UIKBColorWhite_Alpha90");
}

- (CGPoint)_textOffsetForKey:(id)a3
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  int v8;
  double v9;
  double v10;
  objc_super v11;
  CGPoint result;

  v11.receiver = self;
  v11.super_class = (Class)UIKBRenderFactory_MonolithLinearSlim;
  v3 = a3;
  -[UIKBRenderFactory_Monolith _textOffsetForKey:](&v11, sel__textOffsetForKey_, v3);
  v5 = v4;
  v7 = v6;
  v8 = objc_msgSend(v3, "interactionType", v11.receiver, v11.super_class);

  v9 = 0.0;
  if (v8 == 4)
    v10 = 0.0;
  else
    v10 = v5;
  if (v8 != 4)
    v9 = v7;
  result.y = v9;
  result.x = v10;
  return result;
}

- (void)configureCornersOnGeometry:(id)a3 forKey:(id)a4
{
  objc_msgSend(a3, "setRoundRectCorners:", -1, a4);
}

- (void)configureGeometry:(id)a3 forControlKey:(id)a4
{
  id v6;
  id v7;
  int v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  objc_super v15;

  v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)UIKBRenderFactory_MonolithLinearSlim;
  v7 = a4;
  -[UIKBRenderFactory_MonolithLinear configureGeometry:forControlKey:](&v15, sel_configureGeometry_forControlKey_, v6, v7);
  v8 = objc_msgSend(v7, "interactionType", v15.receiver, v15.super_class);

  if (v8 == 10)
  {
    objc_msgSend(v6, "displayFrame");
    v10 = v9;
    -[UIKBRenderFactory_MonolithLinear pillControlKeyHeight](self, "pillControlKeyHeight");
    v12 = (v10 - v11) * 0.5;
    objc_msgSend(v6, "displayFrame");
    objc_msgSend(v6, "setDisplayFrame:", v13 + 0.0, v14 + v12);
  }

}

- (void)configureSymbolStyle:(id)a3 forControlKey:(id)a4
{
  id v6;
  id v7;
  int v8;
  objc_super v9;

  v6 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UIKBRenderFactory_MonolithLinearSlim;
  v7 = a4;
  -[UIKBRenderFactory_MonolithLinear configureSymbolStyle:forControlKey:](&v9, sel_configureSymbolStyle_forControlKey_, v6, v7);
  v8 = objc_msgSend(v7, "interactionType", v9.receiver, v9.super_class);

  if (v8 == 10)
  {
    -[UIKBRenderFactory_MonolithLinear pillControlKeyFontSize](self, "pillControlKeyFontSize");
    objc_msgSend(v6, "setFontSize:");
  }

}

- (id)_enabledTraitsForControlKey:(id)a3
{
  id v4;
  void *v5;
  int v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)UIKBRenderFactory_MonolithLinearSlim;
  v4 = a3;
  -[UIKBRenderFactory_MonolithLinear _enabledTraitsForControlKey:](&v14, sel__enabledTraitsForControlKey_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "interactionType", v14.receiver, v14.super_class);

  if (v6 == 10)
  {
    -[UIKBRenderFactory_Monolith controlKeyRectCornerRadius](self, "controlKeyRectCornerRadius");
    v8 = v7;
    objc_msgSend(v5, "geometry");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setRoundRectRadius:", v8);

    -[UIKBRenderFactory_MonolithLinear pillControlKeyPillBackgroundColor](self, "pillControlKeyPillBackgroundColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIKBGradient gradientWithFlatColor:](UIKBGradient, "gradientWithFlatColor:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBackgroundGradient:", v11);

    objc_msgSend(v5, "setRenderFlags:", &unk_1E1A93B60);
    objc_msgSend(v5, "symbolStyle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTextColor:", CFSTR("UIKBColorBlack"));

    objc_msgSend(v5, "setBlendForm:", 4);
  }
  else if (v6 == 9)
  {
    objc_msgSend(v5, "setRenderFlags:", &unk_1E1A93B48);
  }
  return v5;
}

- (id)_highlightedTraitsForControlKey:(id)a3
{
  id v4;
  void *v5;
  int v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)UIKBRenderFactory_MonolithLinearSlim;
  v4 = a3;
  -[UIKBRenderFactory_MonolithLinear _highlightedTraitsForControlKey:](&v14, sel__highlightedTraitsForControlKey_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "interactionType", v14.receiver, v14.super_class);

  if (v6 == 10)
  {
    -[UIKBRenderFactory_Monolith controlKeyRectCornerRadius](self, "controlKeyRectCornerRadius");
    v8 = v7;
    objc_msgSend(v5, "geometry");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setRoundRectRadius:", v8);

    -[UIKBRenderFactory_MonolithLinearSlim highlightedVariantPillBackgroundColor](self, "highlightedVariantPillBackgroundColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIKBGradient gradientWithFlatColor:](UIKBGradient, "gradientWithFlatColor:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBackgroundGradient:", v11);

    objc_msgSend(v5, "setRenderFlags:", &unk_1E1A93B78);
    objc_msgSend(v5, "symbolStyle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTextColor:", CFSTR("UIKBColorBlack"));

    objc_msgSend(v5, "setBlendForm:", 4);
    -[UIKBRenderFactory_MonolithLinear pillControlKeyFocusIncreaseSize](self, "pillControlKeyFocusIncreaseSize");
    objc_msgSend(v5, "setFloatingContentViewFocusedIncreaseSize:");
  }
  return v5;
}

- (id)_variantTraitsForControlKey:(id)a3 onKeyplane:(id)a4
{
  id v6;
  id v7;
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
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  void *v45;
  void *v46;
  void *v47;
  double v48;
  double v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
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
  void *v67;
  void *v68;
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
  double v80;
  double v81;
  double v82;
  id v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  _BYTE v88[128];
  uint64_t v89;

  v89 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "interactionType") == 10)
  {
    v83 = v7;
    -[UIKBRenderFactory_MonolithLinearSlim variantKeyPaddingH](self, "variantKeyPaddingH");
    v9 = v8;
    v10 = -v8;
    -[UIKBRenderFactory_MonolithLinearSlim variantKeyPaddingV](self, "variantKeyPaddingV");
    v12 = v11;
    v13 = -v11;
    objc_msgSend(v6, "paddedFrame");
    v15 = v14 - v9;
    v17 = v16 - (v10 - v9);
    v19 = v18 - v12;
    v21 = v20 - (v13 - v12);
    objc_msgSend(v6, "paddedFrame");
    v23 = v22;
    v25 = v24;
    v27 = v26;
    v29 = v28;
    +[UIKBRenderGeometry geometryWithFrame:paddedFrame:](UIKBRenderGeometry, "geometryWithFrame:paddedFrame:", v15, v19, v17, v21, v15, v19, v17, v21);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBRenderFactory_Monolith keyRectCornerRadius](self, "keyRectCornerRadius");
    objc_msgSend(v30, "setRoundRectRadius:");
    objc_msgSend(v30, "setRoundRectCorners:", -1);
    objc_msgSend(v30, "paddedFrame");
    v74 = v31;
    v76 = v32;
    v78 = v33;
    v80 = v34;
    objc_msgSend(v6, "subtrees");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setPaddedFrame:", v74 + 0.0, v78 + 0.0, v76 - (0.0 - v17 * (double)(unint64_t)(objc_msgSend(v35, "count") - 1)), v80);

    objc_msgSend(v30, "paddedFrame");
    v75 = v37;
    v77 = v36;
    v79 = v39;
    v81 = v38;
    -[UIKBRenderFactory_Monolith shadowRadius](self, "shadowRadius");
    v73 = v40;
    -[UIKBRenderFactory_Monolith shadowRadius](self, "shadowRadius");
    v72 = v41;
    -[UIKBRenderFactory_Monolith shadowRadius](self, "shadowRadius");
    v70 = v42;
    -[UIKBRenderFactory_Monolith shadowVerticalOffset](self, "shadowVerticalOffset");
    v71 = -(v70 + v43);
    -[UIKBRenderFactory_Monolith shadowRadius](self, "shadowRadius");
    objc_msgSend(v30, "setDisplayFrame:", v77 - v44, v81 - v73, v75 - (-v44 - v72), v79 - (v71 - v73));
    +[UIKBRenderTraits traitsWithGeometry:](UIKBRenderTraits, "traitsWithGeometry:", v30);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBRenderFactory_Monolith variantPlatterBackgroundColor](self, "variantPlatterBackgroundColor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIKBGradient gradientWithFlatColor:](UIKBGradient, "gradientWithFlatColor:", v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setBackgroundGradient:", v47);

    -[UIKBRenderFactory_Monolith shadowVerticalOffset](self, "shadowVerticalOffset");
    v82 = v48;
    -[UIKBRenderFactory_Monolith shadowRadius](self, "shadowRadius");
    +[UIKBShadowEffect effectWithColor:offset:insets:weight:](UIKBShadowEffect, "effectWithColor:offset:insets:weight:", CFSTR("UIKBColorBlack_Alpha25"), 0.0, v82, 0.0, 0.0, 0.0, 0.0, v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "addRenderEffect:", v50);

    objc_msgSend(v45, "setBlurBlending:", 1);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v84 = 0u;
    v85 = 0u;
    v86 = 0u;
    v87 = 0u;
    objc_msgSend(v6, "subtrees");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v84, v88, 16);
    if (v53)
    {
      v54 = v53;
      v55 = *(_QWORD *)v85;
      while (1)
      {
        if (*(_QWORD *)v85 != v55)
          objc_enumerationMutation(v52);
        +[UIKBRenderGeometry geometryWithFrame:paddedFrame:](UIKBRenderGeometry, "geometryWithFrame:paddedFrame:", v15, v19, v17, v21, v23, v25, v27, v29);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "frame");
        objc_msgSend(v56, "setDisplayFrame:");
        objc_msgSend(v56, "frame");
        objc_msgSend(v56, "setPaddedFrame:");
        objc_msgSend(v56, "setRoundRectCorners:", -1);
        -[UIKBRenderFactory_Monolith keyRectCornerRadius](self, "keyRectCornerRadius");
        objc_msgSend(v56, "setRoundRectRadius:");
        objc_msgSend(v56, "setLayeredForegroundPaddedFrame:", v23, v25, v27, v29);
        -[UIKBRenderFactory_Monolith controlKeyRectCornerRadius](self, "controlKeyRectCornerRadius");
        objc_msgSend(v56, "setLayeredForegroundRoundRectRadius:");
        objc_msgSend(v51, "addObject:", v56);
        v15 = v17 + v15;
        v23 = v17 + v23;

        if (!--v54)
        {
          v54 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v84, v88, 16);
          if (!v54)
            break;
        }
      }
    }

    objc_msgSend(v45, "setVariantGeometries:", v51);
    -[UIKBRenderFactory_MonolithLinearSlim _enabledTraitsForControlKey:](self, "_enabledTraitsForControlKey:", v6);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "setBackgroundGradient:", 0);
    -[UIKBRenderFactory_MonolithLinearSlim variantPillBackgroundColor](self, "variantPillBackgroundColor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIKBGradient gradientWithFlatColor:](UIKBGradient, "gradientWithFlatColor:", v58);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "setLayeredForegroundGradient:", v59);

    -[UIKBRenderFactory_MonolithLinearSlim variantTextColor](self, "variantTextColor");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "symbolStyle");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "setTextColor:", v60);

    objc_msgSend(v45, "setVariantTraits:", v57);
    -[UIKBRenderFactory_MonolithLinearSlim _highlightedTraitsForControlKey:](self, "_highlightedTraitsForControlKey:", v6);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBRenderFactory_MonolithLinearSlim highlightedVariantLayeredBackgroundColor](self, "highlightedVariantLayeredBackgroundColor");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIKBGradient gradientWithFlatColor:](UIKBGradient, "gradientWithFlatColor:", v63);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "setBackgroundGradient:", v64);

    -[UIKBRenderFactory_MonolithLinearSlim highlightedVariantPillBackgroundColor](self, "highlightedVariantPillBackgroundColor");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIKBGradient gradientWithFlatColor:](UIKBGradient, "gradientWithFlatColor:", v65);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "setLayeredForegroundGradient:", v66);

    -[UIKBRenderFactory_MonolithLinearSlim variantTextColor](self, "variantTextColor");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "symbolStyle");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "setTextColor:", v67);

    objc_msgSend(v45, "setHighlightedVariantTraits:", v62);
    v7 = v83;
  }
  else
  {
    -[UIKBRenderFactory_Monolith _variantTraitsForLetterKey:onKeyplane:](self, "_variantTraitsForLetterKey:onKeyplane:", v6, v7);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v45;
}

@end
