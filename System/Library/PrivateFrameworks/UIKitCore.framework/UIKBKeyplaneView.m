@implementation UIKBKeyplaneView

- (void)layoutSubviews
{
  UIView *keyplaneMaskView;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  objc_super v16;
  CGRect v17;
  CGRect v18;

  v16.receiver = self;
  v16.super_class = (Class)UIKBKeyplaneView;
  -[UIView layoutSubviews](&v16, sel_layoutSubviews);
  keyplaneMaskView = self->_keyplaneMaskView;
  if (keyplaneMaskView)
  {
    -[UIView frame](keyplaneMaskView, "frame");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
    -[UIView bounds](self, "bounds");
    v18.origin.x = v12;
    v18.origin.y = v13;
    v18.size.width = v14;
    v18.size.height = v15;
    v17.origin.x = v5;
    v17.origin.y = v7;
    v17.size.width = v9;
    v17.size.height = v11;
    if (!CGRectEqualToRect(v17, v18))
    {
      -[UIView bounds](self, "bounds");
      -[UIView setFrame:](self->_keyplaneMaskView, "setFrame:");
      -[UIKBKeyplaneView _updateKeyplaneMaskView](self, "_updateKeyplaneMaskView");
    }
  }
}

- (BOOL)_shouldInheritScreenScaleAsContentScaleFactor
{
  return 1;
}

- (void)willMoveToWindow:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)UIKBKeyplaneView;
  -[UIView willMoveToWindow:](&v6, sel_willMoveToWindow_, v4);
  if (v4)
  {
    objc_msgSend(v4, "screen");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "scale");
    -[UIKBRenderFactory setScale:](self->_factory, "setScale:");

    -[UIKBScreenTraits stretchFactor](self->_overrideScreenTraits, "stretchFactor");
    -[UIKBRenderFactory setStretchFactor:](self->_factory, "setStretchFactor:");
  }

}

- (void)setContentScaleFactor:(double)a3
{
  UIKBRenderFactory *factory;
  double v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UIKBKeyplaneView;
  -[UIView setContentScaleFactor:](&v7, sel_setContentScaleFactor_);
  factory = self->_factory;
  if (factory)
  {
    -[UIKBRenderFactory scale](factory, "scale");
    if (v6 != a3)
    {
      -[UIKBRenderFactory setScale:](self->_factory, "setScale:", a3);
      -[UIView setNeedsDisplay](self, "setNeedsDisplay");
    }
  }
}

- (id)containingViewForKey:(id)a3 withState:(int)a4 wantsActiveOut:(BOOL *)a5
{
  id v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  unsigned int v15;
  BOOL v16;
  unint64_t v17;
  BOOL v18;
  UIKBKeyView *candidateGapView;
  int v20;
  int v21;
  int v22;
  _BOOL4 v23;
  UIKBScreenTraits *overrideScreenTraits;
  UIKBKeyplaneView *v25;
  void *v26;
  void *v27;
  void *v28;
  UIKBScreenTraits *v29;
  UIKBKeyplaneView *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  char v34;
  void *v35;
  void *v36;
  int v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v42;
  char v43;
  int v44;
  int v45;
  BOOL v46;

  v8 = a3;
  if (objc_msgSend(v8, "displayType"))
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(v8, "parentKey");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v10 != 0;

  }
  if (objc_msgSend(v8, "displayType") == 57)
  {
    objc_msgSend(v8, "parentKey");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    HIDWORD(v42) = v11 != 0;

  }
  else
  {
    HIDWORD(v42) = 0;
  }
  -[UIKBKeyplaneView defaultKeyplane](self, "defaultKeyplane");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v8, "renderKeyInKeyplane:", v12) | v9;

  objc_msgSend(v8, "displayString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v42) = +[UIKBRenderFactory couldUseGlyphSelectorForDisplayString:](UIKBRenderFactory, "couldUseGlyphSelectorForDisplayString:", v14);

  v15 = objc_msgSend(v8, "displayType");
  v16 = v15 == 20 && (a4 & 0x10) == 0;
  v46 = v16;
  v45 = objc_msgSend(v8, "interactionType", v42);
  v17 = -[UIKBKeyplaneView cornerMaskForKey:recursive:](self, "cornerMaskForKey:recursive:", v8, 0);
  v18 = 0;
  candidateGapView = self->_candidateGapView;
  if (a4 == 8)
    v20 = v13;
  else
    v20 = 0;
  v21 = v20 | ((a4 & 0x10) >> 4);
  if (v20 == 1)
    v18 = objc_msgSend(v8, "rendering") == 1
       || objc_msgSend(v8, "rendering") == 33
       || objc_msgSend(v8, "rendering") == 34
       || objc_msgSend(v8, "rendering") == 11;
  v22 = (a4 == 4) | v21;
  if (a5)
    *a5 = v22;
  if (a4 == 4)
  {
    v23 = 0;
    if (v15 <= 0x29 && ((1 << v15) & 0x38000000010) != 0)
      goto LABEL_31;
  }
  else
  {
    v23 = a4 == 16;
    if (a4 == 16 && v15 == 37)
    {
      overrideScreenTraits = self->_overrideScreenTraits;
      if (overrideScreenTraits && overrideScreenTraits->_isFirstPartyStickers)
        goto LABEL_31;
      v23 = 1;
    }
  }
  if (!((v22 ^ 1) & 1 | (v46 || v45 == 10) | (v17 != 0) & ~v22 | v18 | (candidateGapView != 0)))
  {
    -[UIView window](self, "window");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "rootViewController");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "view");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    v29 = self->_overrideScreenTraits;
    if (v29 && v29->_isFirstPartyStickers)
    {
      -[UIView window](self, "window");
      v30 = (UIKBKeyplaneView *)objc_claimAutoreleasedReturnValue();
LABEL_49:
      v25 = v30;
LABEL_50:

      goto LABEL_51;
    }
    if ((objc_msgSend(v26, "_isTextEffectsWindow") & 1) != 0)
    {
      if (!objc_msgSend(v28, "containsView:", self))
      {
        -[UIKBKeyplaneView delegate](self, "delegate");
        v31 = objc_claimAutoreleasedReturnValue();
        if (v31)
        {
          v32 = (void *)v31;
          -[UIKBKeyplaneView delegate](self, "delegate");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = objc_opt_respondsToSelector();

          if ((v34 & 1) != 0)
          {
            -[UIKBKeyplaneView delegate](self, "delegate");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "keyplaneView:containingViewForActiveKey:", self, v8);
            v25 = (UIKBKeyplaneView *)objc_claimAutoreleasedReturnValue();

            if (v25)
              goto LABEL_50;
          }
        }
        goto LABEL_48;
      }
    }
    else
    {
      if (!v23
        || (-[UIKBKeyplaneView factory](self, "factory"),
            v36 = (void *)objc_claimAutoreleasedReturnValue(),
            v37 = objc_msgSend(v36, "popupKeyUsesCustomKeyContentView:", v8),
            v36,
            !v37))
      {
LABEL_48:
        v30 = self;
        goto LABEL_49;
      }
      objc_msgSend(v26, "rootViewController");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "presentedViewController");
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      if (v39)
      {
        objc_msgSend(v28, "window");
        v40 = objc_claimAutoreleasedReturnValue();

        v28 = (void *)v40;
      }
    }
    v30 = v28;
    v28 = v30;
    goto LABEL_49;
  }
  if (!((v17 != 0 || ((v13 | v44) & 1) == 0) | v43 & 1 | v18 | (candidateGapView != 0)))
  {
    v25 = 0;
    goto LABEL_51;
  }
LABEL_31:
  v25 = self;
LABEL_51:

  return v25;
}

- (unint64_t)cornerMaskForKey:(id)a3 recursive:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  unint64_t v7;
  void *v8;
  int v9;
  unint64_t v10;
  unint64_t v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double MaxX;
  double v32;
  BOOL v33;
  uint64_t v34;
  double MinX;
  double v36;
  unint64_t v37;
  double MaxY;
  double v39;
  void *v40;
  void *v41;
  double v42;
  double v43;
  double MinY;
  double v45;
  void *v46;
  void *v47;
  double v48;
  double v49;
  unint64_t v50;
  uint64_t v51;
  CGFloat v53;
  CGFloat v54;
  CGFloat v55;
  CGFloat v56;
  CGFloat v57;
  CGFloat v58;
  CGFloat v59;
  CGFloat v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;

  v4 = a4;
  v6 = a3;
  if (-[UIKBTree isSplit](self->_keyplane, "isSplit")
    && (objc_msgSend(v6, "displayType") == 36 || objc_msgSend(v6, "displayType") == 37))
  {
    if (v4)
      v7 = -[UIView _clipCornersOfView:](self, "_clipCornersOfView:", self);
    else
      v7 = -1;
    v11 = objc_msgSend(v6, "clipCorners") & v7;
    goto LABEL_40;
  }
  if (objc_msgSend(v6, "interactionType") != 16
    && objc_msgSend(v6, "displayType") != 35
    && objc_msgSend(v6, "displayType") != 31
    && objc_msgSend(v6, "displayType") != 32
    && objc_msgSend(v6, "displayType") != 1
    && objc_msgSend(v6, "displayType") != 25
    && (objc_msgSend(v6, "name"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("Chinese-Facemark")),
        v8,
        !v9)
    || -[UIKBScreenTraits idiom](self->_overrideScreenTraits, "idiom") != 1
    && -[UIKBScreenTraits idiom](self->_overrideScreenTraits, "idiom") != 24
    && -[UIKBScreenTraits idiom](self->_overrideScreenTraits, "idiom") != 25
    && -[UIKBScreenTraits idiom](self->_overrideScreenTraits, "idiom") != 26
    && -[UIKBScreenTraits idiom](self->_overrideScreenTraits, "idiom") != 23
    || !-[UIKBTree isSplit](self->_keyplane, "isSplit"))
  {
LABEL_21:
    v11 = 0;
    goto LABEL_40;
  }
  if (v4)
  {
    v10 = -[UIView _clipCornersOfView:](self, "_clipCornersOfView:", self);
    if (!v10)
      goto LABEL_21;
  }
  else
  {
    v10 = -1;
  }
  objc_msgSend(v6, "paddedFrame");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v53 = v18;
  -[UIKBTree frameForKeylayoutName:](self->_keyplane, "frameForKeylayoutName:", CFSTR("split-left"));
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v54 = v26;
  -[UIKBTree frameForKeylayoutName:](self->_keyplane, "frameForKeylayoutName:", CFSTR("split-right"));
  v58 = v28;
  v59 = v27;
  v56 = v30;
  v57 = v29;
  v61.origin.x = v13;
  v55 = v13;
  v61.origin.y = v15;
  v61.size.width = v17;
  v61.size.height = v19;
  MaxX = CGRectGetMaxX(v61);
  v62.origin.x = v21;
  v60 = v21;
  v62.origin.y = v23;
  v62.size.width = v25;
  v62.size.height = v54;
  v32 = CGRectGetMaxX(v62);
  v33 = MaxX == v32;
  if (MaxX != v32)
    v10 &= 5u;
  v34 = 16 * (MaxX == v32);
  v63.origin.x = v13;
  v63.origin.y = v15;
  v63.size.width = v17;
  v63.size.height = v53;
  MinX = CGRectGetMinX(v63);
  v64.origin.y = v58;
  v64.origin.x = v59;
  v64.size.height = v56;
  v64.size.width = v57;
  v36 = CGRectGetMinX(v64);
  if (MinX == v36)
    v37 = v10;
  else
    v37 = v10 & 0xA;
  if (MinX == v36)
    v34 = (16 * v33) | 0x20;
  v65.origin.x = v21;
  v65.origin.y = v23;
  v65.size.width = v25;
  v65.size.height = v54;
  MaxY = CGRectGetMaxY(v65);
  v66.origin.x = v55;
  v66.origin.y = v15;
  v66.size.width = v17;
  v66.size.height = v53;
  v39 = MaxY - CGRectGetMaxY(v66);
  +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "preferencesActions");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "rivenSizeFactor:", 1.0);
  v43 = v42;

  if (v39 > v43)
    v37 &= 3u;
  v67.origin.x = v55;
  v67.origin.y = v15;
  v67.size.width = v17;
  v67.size.height = v53;
  MinY = CGRectGetMinY(v67);
  v68.origin.x = v60;
  v68.origin.y = v23;
  v68.size.width = v25;
  v68.size.height = v54;
  v45 = MinY - CGRectGetMinY(v68);
  +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "preferencesActions");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "rivenSizeFactor:", 1.0);
  v49 = v48;

  v50 = v37 & 0xC;
  if (v45 <= v49)
    v50 = v37;
  if (v4)
    v51 = 0;
  else
    v51 = v34;
  v11 = v50 | v51;
LABEL_40:

  return v11;
}

- (void)setState:(int)a3 forKey:(id)a4
{
  -[UIKBKeyplaneView setState:forKey:withReason:force:](self, "setState:forKey:withReason:force:", *(_QWORD *)&a3, a4, 0, 0);
}

- (UIKBTree)defaultKeyplane
{
  return self->_defaultKeyplane;
}

- (void)setState:(int)a3 forKey:(id)a4 withReason:(id)a5 force:(BOOL)a6
{
  id v10;
  id v11;
  _BOOL4 v12;
  unsigned int v13;
  int v14;
  _BOOL4 v15;
  void *v16;
  int v17;
  uint64_t v18;
  void *v19;
  UIKBScreenTraits *overrideScreenTraits;
  id v21;
  _BOOL4 v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  int v27;
  id v28;
  uint64_t v29;
  BOOL v30;
  UIKBKeyplaneView *v31;
  uint64_t v32;
  id v33;
  UIKBViewBackedKeyView *v34;
  void *v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  UIKBViewBackedKeyView *v54;
  uint64_t v55;
  NSMutableDictionary *v56;
  double v57;
  CGFloat v58;
  double v59;
  CGFloat v60;
  double v61;
  CGFloat v62;
  double v63;
  CGFloat v64;
  CGFloat v65;
  CGFloat v66;
  CGFloat v67;
  CGFloat v68;
  void *v69;
  NSMutableDictionary *v70;
  void *v71;
  void *v72;
  void *v73;
  UIKBViewBackedKeyView *v74;
  void *v75;
  uint64_t v76;
  UIKBViewBackedKeyView *v77;
  uint64_t v78;
  void *v79;
  void *v80;
  uint64_t v81;
  void *v82;
  _BOOL4 v83;
  int v84;
  UIKBScreenTraits *v85;
  void *v86;
  NSMutableDictionary *v87;
  void *v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  double v111;
  double v112;
  UIKBScreenTraits *v113;
  void *v114;
  NSMutableDictionary *v115;
  void *v116;
  double v117;
  double v118;
  double v119;
  double v120;
  double v121;
  double v122;
  double v123;
  double v124;
  int v125;
  UIKBKeyView *candidateGapView;
  UIKBKeyplaneView *v127;
  UIKBViewBackedKeyView *v128;
  UIKBViewBackedKeyView *v129;
  UIKBScreenTraits *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  int v135;
  void *v136;
  objc_class *v137;
  id v138;
  UIKBViewBackedKeyView *v139;
  UIKBTree *keyplane;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  objc_class *v146;
  uint64_t v147;
  void *v148;
  int v149;
  id v150;
  UIKBTree *v151;
  void *v152;
  void *v153;
  int v154;
  void *v155;
  _BOOL4 v156;
  UILabel *v157;
  double v158;
  double v159;
  UILabel *v160;
  void *v161;
  _BOOL4 v162;
  double v163;
  int v164;
  void *v165;
  double v166;
  void *v167;
  uint64_t v168;
  uint64_t v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  _QWORD *v174;
  double v175;
  void *v176;
  uint64_t v177;
  uint64_t v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  UIKBViewBackedKeyView *v185;
  void *v186;
  UIKBKeyplaneView *v187;
  NSMutableDictionary *v188;
  NSMutableDictionary *v189;
  NSMutableDictionary *v190;
  UIKBKeyView *p_super;
  double v192;
  void *v193;
  int v194;
  id v195;
  unsigned int v196;
  id v197;
  void *v198;
  char v199;
  _QWORD v200[2];
  _QWORD v201[4];
  CGRect v202;
  CGRect v203;

  v201[2] = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  if (!-[UIKBKeyplaneView _shouldAllowKey:](self, "_shouldAllowKey:", v10))
    goto LABEL_111;
  if (a3 <= 0x14 && ((1 << a3) & 0x110010) != 0)
  {
    if (a6)
    {
LABEL_5:
      v12 = 1;
      v13 = a3;
      goto LABEL_12;
    }
  }
  else
  {
    -[UIKBKeyplaneView removeKeyFromDelayedDeactivationSet:](self, "removeKeyFromDelayedDeactivationSet:", v10);
    if (a6)
      goto LABEL_5;
  }
  if (objc_msgSend(v10, "state") == 16)
  {
    v14 = objc_msgSend(v10, "displayType");
    v12 = v14 != 37;
    if (v14 == 37)
      a3 = 16;
  }
  else
  {
    v12 = 1;
  }
  v13 = 4;
LABEL_12:
  v15 = +[UIKeyboard isRemoteEmojiCollectionViewEnabled](UIKeyboard, "isRemoteEmojiCollectionViewEnabled");
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isEmojiPopoverPresented");

  if ((v15 & v17 & (objc_msgSend(v10, "displayType") == 36)) != 0)
    v18 = v13;
  else
    v18 = a3;
  v19 = (void *)objc_msgSend(v10, "state");
  objc_msgSend(v10, "setState:", v18);
  if ((objc_msgSend(v10, "ghost") & 1) != 0)
    goto LABEL_111;
  overrideScreenTraits = self->_overrideScreenTraits;
  if (!overrideScreenTraits || (_DWORD)v18 != 4 || !overrideScreenTraits->_isFirstPartyStickers)
  {
    v21 = 0;
    v22 = v18 == 16;
    if ((_DWORD)v19 == 16 && (_DWORD)v18 == 16)
    {
      -[UIKBKeyplaneView factory](self, "factory");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "popupKeyUsesCustomKeyContentView:", v10);

      -[UIKBKeyplaneView existingVariantsKeyViewForKey:](self, "existingVariantsKeyViewForKey:", v10);
      v21 = (id)objc_claimAutoreleasedReturnValue();
      if (v24)
      {
        if (objc_msgSend(v10, "variantType") != 12
          && objc_msgSend(v10, "variantType") != 13)
        {
          goto LABEL_29;
        }
        objc_msgSend(v10, "selectedVariantIndices");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v25, "count"))
        {

          goto LABEL_36;
        }
        objc_msgSend(v10, "selectedVariantIndices");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "firstObject");
        v27 = (int)v19;
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = v21;
        v29 = objc_msgSend(v19, "integerValue");

        LODWORD(v19) = v27;
        v30 = v29 == 0x7FFFFFFFFFFFFFFFLL;
        v21 = v28;
        if (!v30)
LABEL_29:
          objc_msgSend(v21, "updateForKeyplane:key:", self->_keyplane, v10);
LABEL_36:
        v21 = v21;

        v22 = 1;
        goto LABEL_37;
      }
      if (objc_msgSend(v10, "displayType") != 37)
      {
        v22 = 1;
        if (objc_msgSend(v10, "selectedVariantIndex") == 0x7FFFFFFFFFFFFFFFLL)
        {
LABEL_37:
          v199 = 0;
          -[UIKBKeyplaneView containingViewForKey:withState:wantsActiveOut:](self, "containingViewForKey:withState:wantsActiveOut:", v10, v18, &v199);
          v31 = (UIKBKeyplaneView *)objc_claimAutoreleasedReturnValue();
          if (!v31)
          {
            self->_shouldDrawRect = 1;
LABEL_110:

            goto LABEL_111;
          }
          -[UIKBKeyplaneView cacheIdentifierForKey:withState:](self, "cacheIdentifierForKey:withState:", v10, v18);
          v32 = objc_claimAutoreleasedReturnValue();
          v197 = v21;
          v198 = (void *)v32;
          v196 = v19;
          if (v21)
          {
            v33 = v21;
LABEL_42:
            v34 = (UIKBViewBackedKeyView *)v33;
            -[UIKBKeyplaneView factory](self, "factory");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "traitsForKey:onKeyplane:", v10, self->_keyplane);
            v36 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v36, "geometry");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "displayFrame");
            v39 = v38;
            v41 = v40;
            v43 = v42;
            v45 = v44;

            v46 = v45;
            v47 = v43;
            v48 = v41;
            v49 = v39;
            if (v31 != self)
            {
              -[UIView convertRect:toView:](self, "convertRect:toView:", v31, v39, v41, v43, v45);
              v49 = v50;
              v48 = v51;
              v47 = v52;
              v46 = v53;
            }
            if (!UIRectIsDiscrete(v49, v48, v47, v46))
            {
              v54 = v34;
LABEL_109:

              v21 = v197;
              goto LABEL_110;
            }
            -[UIView setFrame:](v34, "setFrame:", v49, v48, v47, v46);
            -[UIKBViewBackedKeyView setDrawFrame:](v34, "setDrawFrame:", v39, v41, v43, v45);
            v54 = v34;
LABEL_46:
            v55 = 3;
            if (v31 == self)
              v55 = 2;
            v56 = (NSMutableDictionary *)objc_retain(*(id *)((char *)&self->super.super.super.super.isa
                                                           + OBJC_IVAR___UIKBKeyplaneView__shouldDrawRect[v55]));
            if (v31 == self)
            {
              -[UIView bounds](self, "bounds");
              v58 = v57;
              v60 = v59;
              v62 = v61;
              v64 = v63;
              -[UIView frame](v54, "frame");
              v203.origin.x = v65;
              v203.origin.y = v66;
              v203.size.width = v67;
              v203.size.height = v68;
              v202.origin.x = v58;
              v202.origin.y = v60;
              v202.size.width = v62;
              v202.size.height = v64;
              if (!CGRectContainsRect(v202, v203))
              {
                -[UIKBKeyplaneView emojiKeyManager](self, "emojiKeyManager");
                v69 = (void *)objc_claimAutoreleasedReturnValue();

                if (v69)
                {
                  v70 = self->_activeViewIndex;

                  v56 = v70;
                }
              }
            }
            if (!v54)
              goto LABEL_108;
            if (-[UIKBKeyplaneView shouldAnimateInKeyView:](self, "shouldAnimateInKeyView:", v54))
            {
              -[UIKBKeyplaneView keyViewAnimator](self, "keyViewAnimator");
              v195 = (id)objc_claimAutoreleasedReturnValue();

            }
            else
            {
              v195 = 0;
            }
            -[UIKBKeyplaneView emojiKeyManager](self, "emojiKeyManager");
            v71 = (void *)objc_claimAutoreleasedReturnValue();

            if (v71)
            {
              -[UIKBKeyplaneView emojiKeyManager](self, "emojiKeyManager");
              v72 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v72, "updateEmojiKeyManagerWithKey:withKeyView:", v10, v54);

            }
            v194 = objc_msgSend(v195, "shouldTransitionKeyView:fromState:toState:", v54, v196, objc_msgSend(v10, "state"));
            objc_msgSend(v10, "name");
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary objectForKey:](v56, "objectForKey:", v73);
            v74 = (UIKBViewBackedKeyView *)objc_claimAutoreleasedReturnValue();

            p_super = &v74->super;
            if (v74 != v54)
            {
              if ((v194 & 1) == 0)
                -[UIKBKeyView removeFromSuperview](v74, "removeFromSuperview");
              objc_msgSend(v10, "name");
              v75 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSMutableDictionary setObject:forKey:](v56, "setObject:forKey:", v54, v75);

            }
            v187 = v31;
            -[UIView setAlpha:](v54, "setAlpha:", 1.0);
            v76 = v196;
            if (os_variant_has_internal_diagnostics())
            {
              objc_msgSend(v10, "name");
              v153 = (void *)objc_claimAutoreleasedReturnValue();
              v154 = objc_msgSend(v153, "isEqualToString:", CFSTR("EmojiPopupKey"));

              v76 = v196;
              if (v154)
              {
                objc_msgSend(v10, "displayString");
                v155 = (void *)objc_claimAutoreleasedReturnValue();
                v156 = +[UIKeyboardEmojiCollectionInputView shouldHighlightEmoji:](UIKeyboardEmojiCollectionInputView, "shouldHighlightEmoji:", v155);

                v76 = v196;
                if (v156)
                {
                  v185 = v34;
                  v190 = v56;
                  v157 = [UILabel alloc];
                  objc_msgSend(v10, "paddedFrame");
                  v159 = v158;
                  objc_msgSend(v10, "paddedFrame");
                  v160 = -[UILabel initWithFrame:](v157, "initWithFrame:", 0.0, 0.0, v159);
                  -[UILabel setText:](v160, "setText:", CFSTR("PRERELEASE"));
                  +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 1.0, 0.0, 0.0, 1.0);
                  v161 = (void *)objc_claimAutoreleasedReturnValue();
                  -[UILabel setTextColor:](v160, "setTextColor:", v161);

                  v162 = -[UIKBTree isSplit](self->_keyplane, "isSplit");
                  v163 = 8.0;
                  if (v162)
                  {
                    v164 = objc_msgSend(v10, "variantType", 8.0);
                    v163 = 5.0;
                    if (v164 == 10)
                      v163 = 8.0;
                  }
                  objc_msgSend(off_1E167A828, "systemFontOfSize:weight:", v163, *(double *)off_1E167DC50);
                  v165 = (void *)objc_claimAutoreleasedReturnValue();
                  -[UILabel setFont:](v160, "setFont:", v165);

                  -[UILabel setAdjustsFontSizeToFitWidth:](v160, "setAdjustsFontSizeToFitWidth:", 1);
                  -[UILabel setMinimumScaleFactor:](v160, "setMinimumScaleFactor:", 0.5);
                  -[UIView addSubview:](v54, "addSubview:", v160);
                  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v160, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
                  if (objc_msgSend(v10, "variantType") == 10)
                  {
                    v166 = -15.0;
                    if (!-[UIKBTree isSplit](self->_keyplane, "isSplit"))
                    {
                      if (-[UIKBScreenTraits idiom](self->_overrideScreenTraits, "idiom") == 1
                        || -[UIKBScreenTraits idiom](self->_overrideScreenTraits, "idiom") == 24
                        || -[UIKBScreenTraits idiom](self->_overrideScreenTraits, "idiom") == 25
                        || -[UIKBScreenTraits idiom](self->_overrideScreenTraits, "idiom") == 26
                        || (v166 = 8.0, -[UIKBScreenTraits idiom](self->_overrideScreenTraits, "idiom") == 23))
                      {
                        v166 = -2.0;
                      }
                    }
                    -[UIView centerXAnchor](v54, "centerXAnchor", MEMORY[0x1E0D156E0]);
                    v167 = (void *)objc_claimAutoreleasedReturnValue();
                    -[UIView centerXAnchor](v160, "centerXAnchor");
                    v186 = v167;
                    v184 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v167, "constraintEqualToAnchor:");
                    v183 = (void *)objc_claimAutoreleasedReturnValue();
                    v201[0] = v183;
                    -[UIView centerYAnchor](v54, "centerYAnchor");
                    v168 = objc_claimAutoreleasedReturnValue();
                    -[UIView centerYAnchor](v160, "centerYAnchor");
                    v169 = objc_claimAutoreleasedReturnValue();
                    v182 = (void *)v168;
                    v170 = (void *)v168;
                    v171 = (void *)v169;
                    objc_msgSend(v170, "constraintEqualToAnchor:constant:", v166);
                    v172 = (void *)objc_claimAutoreleasedReturnValue();
                    v201[1] = v172;
                    v173 = (void *)MEMORY[0x1E0C99D20];
                    v174 = v201;
                  }
                  else
                  {
                    if (objc_msgSend(v10, "variantType") == 10)
                      v175 = -3.0;
                    else
                      v175 = -5.0;
                    -[UIView centerXAnchor](v54, "centerXAnchor", MEMORY[0x1E0D156E0]);
                    v176 = (void *)objc_claimAutoreleasedReturnValue();
                    -[UIView centerXAnchor](v160, "centerXAnchor");
                    v186 = v176;
                    v184 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v176, "constraintEqualToAnchor:");
                    v183 = (void *)objc_claimAutoreleasedReturnValue();
                    v200[0] = v183;
                    -[UIView topAnchor](v54, "topAnchor");
                    v177 = objc_claimAutoreleasedReturnValue();
                    -[UIView topAnchor](v160, "topAnchor");
                    v178 = objc_claimAutoreleasedReturnValue();
                    v182 = (void *)v177;
                    v179 = (void *)v177;
                    v171 = (void *)v178;
                    objc_msgSend(v179, "constraintEqualToAnchor:constant:", v175);
                    v172 = (void *)objc_claimAutoreleasedReturnValue();
                    v200[1] = v172;
                    v173 = (void *)MEMORY[0x1E0C99D20];
                    v174 = v200;
                  }
                  objc_msgSend(v173, "arrayWithObjects:count:", v174, 2);
                  v180 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v181, "activateConstraints:");

                  v76 = v196;
                  v56 = v190;
                  v34 = v185;
                }
              }
            }
            if (v199)
            {
              +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
              v77 = v34;
              v78 = v76;
              v79 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v79, "textInputTraits");
              v188 = v56;
              v80 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v80, "isSecureTextEntry"))
                v81 = 18;
              else
                v81 = 0;

              v76 = v78;
              v34 = v77;
              -[UIView layer](v54, "layer");
              v82 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v82, "setDisableUpdateMask:", v81);

              v56 = v188;
            }
            v83 = -[UIKBKeyplaneView _shouldUseUnifiedKeyView:forState:](self, "_shouldUseUnifiedKeyView:forState:", v10, v18);
            if (v54 == v34)
            {
              v84 = 0;
              v31 = v187;
            }
            else
            {
              v31 = v187;
              v84 = !-[UIView containsView:](v187, "containsView:", v54);
            }
            if (v83 && !v84)
              goto LABEL_98;
            if (v31 == self && (candidateGapView = self->_candidateGapView) != 0)
            {
              v127 = self;
              v128 = v54;
            }
            else
            {
              if (p_super)
                v125 = v194;
              else
                v125 = 0;
              if (v125 != 1 || (objc_msgSend(v195, "shouldAssertCurrentKeyState:", v10) & 1) != 0)
              {
                -[UIView addSubview:](v31, "addSubview:", v54);
LABEL_98:
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v129 = v54;
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0
                    || (-[UIKBKeyplaneView _isTextEffectsWindow](v31, "_isTextEffectsWindow") & 1) != 0
                    || (v130 = self->_overrideScreenTraits) != 0 && v130->_isFirstPartyStickers)
                  {
                    -[UIKBViewBackedKeyView setTouchForwardingView:](v129, "setTouchForwardingView:", 0);
                  }
                  else
                  {
                    -[UIView superview](self, "superview");
                    v133 = (void *)objc_claimAutoreleasedReturnValue();
                    -[UIKBViewBackedKeyView setTouchForwardingView:](v129, "setTouchForwardingView:", v133);

                  }
                }
                -[UIKBKeyplaneView factory](self, "factory");
                v131 = (void *)objc_claimAutoreleasedReturnValue();
                -[UIKBKeyView setFactory:](v54, "setFactory:", v131);

                -[UIKBKeyplaneView renderConfig](self, "renderConfig");
                v132 = (void *)objc_claimAutoreleasedReturnValue();
                -[UIKBViewBackedKeyView setRenderConfig:](v54, "setRenderConfig:", v132);

                -[UIView setNeedsDisplay](v54, "setNeedsDisplay");
                -[UIKBKeyView prepareForDisplay](v54, "prepareForDisplay");
                -[UIKBKeyView updateKeycapLayerOrientation](v54, "updateKeycapLayerOrientation");
                if (v194)
                  objc_msgSend(v195, "transitionKeyView:fromState:toState:completion:", v54, v76, objc_msgSend(v10, "state"), 0);

                goto LABEL_108;
              }
              v127 = v31;
              v128 = v54;
              candidateGapView = p_super;
            }
            -[UIView insertSubview:belowSubview:](v127, "insertSubview:belowSubview:", v128, candidateGapView);
            goto LABEL_98;
          }
          -[NSMutableDictionary objectForKey:](self->_renderedKeyViews, "objectForKey:", v32);
          v33 = (id)objc_claimAutoreleasedReturnValue();

          if (v33)
            goto LABEL_42;
          v85 = self->_overrideScreenTraits;
          if (v85
            && v85->_isFirstPartyStickers
            && (objc_msgSend(v10, "variantType") == 12
             || objc_msgSend(v10, "variantType") == 13))
          {
            objc_msgSend(v10, "setPopupDirection:", 3);
          }
          -[UIKBKeyplaneView factory](self, "factory");
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v86, "traitsForKey:onKeyplane:", v10, self->_keyplane);
          v87 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();

          v189 = v87;
          -[NSMutableDictionary geometry](v87, "geometry");
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v88, "displayFrame");
          v90 = v89;
          v92 = v91;
          v94 = v93;
          v96 = v95;

          if (v31 == self)
          {
            v104 = v96;
            v102 = v94;
            v100 = v92;
            v98 = v90;
          }
          else
          {
            -[UIView convertRect:toView:](self, "convertRect:toView:", v31, v90, v92, v94, v96);
            v98 = v97;
            v100 = v99;
            v102 = v101;
            v104 = v103;
            if (objc_msgSend(v10, "popupDirection") == 1)
            {
              -[UIView window](v31, "window");
              v105 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v105, "screen");
              v106 = (void *)objc_claimAutoreleasedReturnValue();

              if (v106)
              {
                v192 = v90;
                -[UIView coordinateSpace](v31, "coordinateSpace");
                v107 = (void *)objc_claimAutoreleasedReturnValue();
                -[UIView window](v31, "window");
                v108 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v108, "screen");
                v109 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v109, "coordinateSpace");
                v110 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v107, "convertRect:toCoordinateSpace:", v110, v98, v100, v102, v104);
                v112 = v111;

                if (v112 >= 0.0)
                {
                  v90 = v192;
                }
                else
                {
                  v113 = self->_overrideScreenTraits;
                  v90 = v192;
                  if (!v113 || !v113->_isFirstPartyStickers)
                  {
                    objc_msgSend(v10, "setPopupDirection:", 2);
                    -[UIKBKeyplaneView factory](self, "factory");
                    v114 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v114, "traitsForKey:onKeyplane:", v10, self->_keyplane);
                    v115 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();

                    -[NSMutableDictionary geometry](v115, "geometry");
                    v116 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v116, "displayFrame");
                    v90 = v117;
                    v92 = v118;
                    v94 = v119;
                    v96 = v120;

                    -[UIView convertRect:toView:](self, "convertRect:toView:", v31, v90, v92, v94, v96);
                    v98 = v121;
                    v100 = v122;
                    v102 = v123;
                    v104 = v124;
                    v189 = v115;
                  }
                }
              }
            }
          }
          if (!UIRectIsDiscrete(v98, v100, v102, v104))
          {
            v34 = 0;
            v54 = 0;
            v56 = v189;
LABEL_108:

            goto LABEL_109;
          }
          if (v22
            && (-[UIKBKeyplaneView factory](self, "factory"),
                v134 = (void *)objc_claimAutoreleasedReturnValue(),
                v135 = objc_msgSend(v134, "popupKeyUsesCustomKeyContentView:", v10),
                v134,
                v135))
          {
            -[UIKBKeyplaneView factory](self, "factory");
            v136 = (void *)objc_claimAutoreleasedReturnValue();
            v137 = (objc_class *)objc_msgSend(v136, "contentViewClassForPopupKey:", v10);

            v138 = [v137 alloc];
            v193 = (void *)objc_msgSend(v138, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
            v139 = [UIKBViewBackedKeyView alloc];
            keyplane = self->_keyplane;
            -[UIKBKeyplaneView overrideScreenTraits](self, "overrideScreenTraits");
            v141 = (void *)objc_claimAutoreleasedReturnValue();
            v54 = -[UIKBKeyView initWithFrame:keyplane:key:screenTraits:](v139, "initWithFrame:keyplane:key:screenTraits:", keyplane, v10, v141, v98, v100, v102, v104);

            -[UIView superview](self, "superview");
            v142 = (void *)objc_claimAutoreleasedReturnValue();
            v143 = v193;
            objc_msgSend(v193, "setTouchForwardingView:", v142);

            -[UIKBViewBackedKeyView setContentView:](v54, "setContentView:", v193);
          }
          else
          {
            -[UIKBKeyplaneView keyViewAnimator](self, "keyViewAnimator");
            v144 = (void *)objc_claimAutoreleasedReturnValue();
            -[UIKBKeyplaneView overrideScreenTraits](self, "overrideScreenTraits");
            v145 = (void *)objc_claimAutoreleasedReturnValue();
            v146 = (objc_class *)objc_msgSend(v144, "keyViewClassForKey:renderTraits:screenTraits:", v10, v189, v145);

            -[UIKBKeyplaneView overrideScreenTraits](self, "overrideScreenTraits");
            v147 = objc_claimAutoreleasedReturnValue();
            if (!v147
              || (v148 = (void *)v147,
                  v149 = -[objc_class wantsScreenTraits](v146, "wantsScreenTraits"),
                  v148,
                  !v149))
            {
              v54 = (UIKBViewBackedKeyView *)objc_msgSend([v146 alloc], "initWithFrame:keyplane:key:", self->_keyplane, v10, v98, v100, v102, v104);
LABEL_124:
              -[UIKBViewBackedKeyView setDrawFrame:](v54, "setDrawFrame:", v90, v92, v94, v96);
              objc_msgSend(v10, "setClipCorners:", -[UIKBKeyplaneView cornerMaskForKey:recursive:](self, "cornerMaskForKey:recursive:", v10, 1));
              -[UIKBViewBackedKeyView updateForKeyplane:key:](v54, "updateForKeyplane:key:", self->_keyplane, v10);
              if (!v22)
              {
                objc_msgSend(v10, "parentKey");
                v152 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v152)
                  -[NSMutableDictionary setObject:forKey:](self->_renderedKeyViews, "setObject:forKey:", v54, v198);
              }

              v34 = 0;
              goto LABEL_46;
            }
            v150 = [v146 alloc];
            v151 = self->_keyplane;
            -[UIKBKeyplaneView overrideScreenTraits](self, "overrideScreenTraits");
            v143 = (void *)objc_claimAutoreleasedReturnValue();
            v54 = (UIKBViewBackedKeyView *)objc_msgSend(v150, "initWithFrame:keyplane:key:screenTraits:", v151, v10, v143, v98, v100, v102, v104);
          }

          goto LABEL_124;
        }
LABEL_32:
        -[UIKBKeyplaneView deactivateKey:previousState:](self, "deactivateKey:previousState:", v10, v19);
        goto LABEL_37;
      }
    }
    if (!v12)
      goto LABEL_37;
    goto LABEL_32;
  }
  if (objc_msgSend(v10, "variantType"))
  {
    v21 = 0;
    v22 = 0;
    if (!v12)
      goto LABEL_37;
    goto LABEL_32;
  }
LABEL_111:

}

- (BOOL)_shouldAllowKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "visible"))
    goto LABEL_6;
  -[UIKBTree keys](self->_keyplane, "keys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "containsObject:", v4))
  {
    objc_msgSend(v4, "parentKey");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
      goto LABEL_5;
LABEL_6:
    v7 = 0;
    goto LABEL_7;
  }

LABEL_5:
  v7 = 1;
LABEL_7:

  return v7;
}

- (void)removeKeyFromDelayedDeactivationSet:(id)a3
{
  id v4;
  uint64_t v5;
  NSMutableDictionary *delayedDeactivationKeys;
  void *v7;
  void *v8;

  v4 = a3;
  if (v4)
  {
    v8 = v4;
    v5 = -[NSMutableDictionary count](self->_delayedDeactivationKeys, "count");
    v4 = v8;
    if (v5)
    {
      delayedDeactivationKeys = self->_delayedDeactivationKeys;
      objc_msgSend(v8, "name");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary removeObjectForKey:](delayedDeactivationKeys, "removeObjectForKey:", v7);

      v4 = v8;
    }
  }

}

- (void)deactivateKey:(id)a3 previousState:(int)a4
{
  uint64_t v4;
  id v6;
  id v7;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  -[UIKBKeyplaneView viewForKey:](self, "viewForKey:", v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[UIKBKeyplaneView deactivateKey:previousState:keyView:](self, "deactivateKey:previousState:keyView:", v6, v4, v7);

}

- (id)viewForKey:(id)a3
{
  id v4;
  NSMutableDictionary *activeViewIndex;
  void *v6;
  void *v7;
  id v8;
  NSMutableDictionary *subviewIndex;
  void *v10;

  v4 = a3;
  activeViewIndex = self->_activeViewIndex;
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](activeViewIndex, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = v7;
  }
  else
  {
    subviewIndex = self->_subviewIndex;
    objc_msgSend(v4, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](subviewIndex, "objectForKey:", v10);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (void)deactivateKey:(id)a3 previousState:(int)a4 keyView:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  NSMutableDictionary *activeViewIndex;
  void *v14;
  NSMutableDictionary *subviewIndex;
  void *v16;
  _QWORD v17[4];
  id v18;
  UIKBKeyplaneView *v19;
  id v20;
  id v21;

  v6 = *(_QWORD *)&a4;
  v8 = a3;
  v9 = a5;
  if (!-[UIKBKeyplaneView shouldAnimateOutKeyView:](self, "shouldAnimateOutKeyView:", v9))
  {
    v11 = 0;
LABEL_7:
    objc_msgSend(v9, "removeFromSuperview");
    activeViewIndex = self->_activeViewIndex;
    objc_msgSend(v8, "name");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](activeViewIndex, "removeObjectForKey:", v14);

    subviewIndex = self->_subviewIndex;
    objc_msgSend(v8, "name");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](subviewIndex, "removeObjectForKey:", v16);

    goto LABEL_8;
  }
  -[UIKBKeyplaneView keyViewAnimator](self, "keyViewAnimator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10 || (objc_msgSend(v10, "disabled") & 1) != 0)
    goto LABEL_7;
  if (objc_msgSend(v11, "shouldTransitionKeyView:fromState:toState:", v9, v6, objc_msgSend(v8, "state")))
  {
    v12 = objc_msgSend(v8, "state");
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __56__UIKBKeyplaneView_deactivateKey_previousState_keyView___block_invoke;
    v17[3] = &unk_1E16B2B68;
    v18 = v9;
    v19 = self;
    v20 = v8;
    v11 = v11;
    v21 = v11;
    objc_msgSend(v11, "transitionOutKeyView:fromState:toState:completion:", v18, v6, v12, v17);

  }
LABEL_8:

}

- (BOOL)shouldAnimateOutKeyView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  if (v4)
  {
    -[UIView window](self, "window");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      if (objc_msgSend((id)UIApp, "applicationState") == 2)
      {
        objc_msgSend(v4, "window");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "_isHostedInAnotherProcess");

      }
      else
      {
        v7 = 1;
      }
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (UIKBRenderFactory)factory
{
  -[UIKBKeyplaneView _generateFactoryIfNeeded](self, "_generateFactoryIfNeeded");
  return self->_factory;
}

- (void)_generateFactoryIfNeeded
{
  uint64_t v3;
  void *v4;
  UIKBRenderFactory *v5;
  UIKBRenderFactory *factory;

  if (!self->_factory)
  {
    -[UIKBKeyplaneView _generateRenderingContextIfNeeded](self, "_generateRenderingContextIfNeeded");
    v3 = (uint64_t)-[UIKBTree visualStyling](self->_keyplane, "visualStyling");
    -[UIKBKeyplaneView renderingContext](self, "renderingContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIKBRenderFactory factoryForVisualStyle:renderingContext:](UIKBRenderFactory, "factoryForVisualStyle:renderingContext:", v3, v4);
    v5 = (UIKBRenderFactory *)objc_claimAutoreleasedReturnValue();
    factory = self->_factory;
    self->_factory = v5;

    -[UIView contentScaleFactor](self, "contentScaleFactor");
    -[UIKBRenderFactory setScale:](self->_factory, "setScale:");
    -[UIKBScreenTraits stretchFactor](self->_overrideScreenTraits, "stretchFactor");
    -[UIKBRenderFactory setStretchFactor:](self->_factory, "setStretchFactor:");
  }
}

- (UIKBKeyViewAnimator)keyViewAnimator
{
  return self->_keyViewAnimator;
}

- (UIKBScreenTraits)overrideScreenTraits
{
  return self->_overrideScreenTraits;
}

- (UIKBRenderConfig)renderConfig
{
  return self->_renderConfig;
}

- (UIKeyboardEmojiKeyDisplayController)emojiKeyManager
{
  return self->_emojiKeyManager;
}

- (UIKBRenderingContext)renderingContext
{
  return self->_renderingContext;
}

- (void)_generateRenderingContextIfNeeded
{
  void *v3;
  UIKBRenderingContext *v4;
  UIKBRenderingContext *renderingContext;
  void *v6;
  void *v7;

  if (!self->_renderingContext)
  {
    -[UIKBKeyplaneView renderConfig](self, "renderConfig");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIKBRenderingContext renderingContextForRenderConfig:](UIKBRenderingContext, "renderingContextForRenderConfig:", v3);
    v4 = (UIKBRenderingContext *)objc_claimAutoreleasedReturnValue();
    renderingContext = self->_renderingContext;
    self->_renderingContext = v4;

    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "textInputTraits");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBRenderingContext setKeyboardType:](self->_renderingContext, "setKeyboardType:", objc_msgSend(v7, "keyboardType"));

    -[UIKBRenderingContext setIsFloating:](self->_renderingContext, "setIsFloating:", -[UIKBTree isFloating](self->_keyplane, "isFloating"));
  }
}

- (id)cacheKeysForRenderFlags:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  _BOOL8 v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v22;
  id obj;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[UIKBKeyplaneView cacheKey](self, "cacheKey");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v22 = v4;
    obj = v4;
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v5)
    {
      v6 = v5;
      v7 = 0;
      v8 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v27 != v8)
            objc_enumerationMutation(obj);
          v10 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          v11 = objc_msgSend(v10, "integerValue", v22);
          v12 = v25;
          if (-[UIKBKeyplaneView useDefaultKeyplaneCacheTokenForRenderFlags:](self, "useDefaultKeyplaneCacheTokenForRenderFlags:", v11))
          {
            if (v7)
              goto LABEL_10;
            -[UIKBKeyplaneView defaultKeyplaneCacheToken](self, "defaultKeyplaneCacheToken");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = -[UIKBTree isSplit](self->_keyplane, "isSplit");
            +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "stringForSplitState:handBias:", v14, objc_msgSend(v15, "currentHandBias"));
            v7 = (id)objc_claimAutoreleasedReturnValue();

            if (v7)
            {
LABEL_10:
              v7 = v7;

              v12 = v7;
            }
          }
          -[UIKBKeyplaneView renderConfig](self, "renderConfig");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          +[UIKBRenderingContext renderingContextForRenderConfig:](UIKBRenderingContext, "renderingContextForRenderConfig:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          +[UIKBRenderFactory cacheKeyForString:withRenderFlags:renderingContext:](UIKBRenderFactory, "cacheKeyForString:withRenderFlags:renderingContext:", v12, v11, v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "setObject:forKey:", v18, v10);

        }
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v6);
    }
    else
    {
      v7 = 0;
    }

    if (-[UIKBKeyplaneView isPasscodeStyle](self, "isPasscodeStyle"))
      v20 = 0;
    else
      v20 = v24;
    v19 = v20;

    v4 = v22;
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (BOOL)useDefaultKeyplaneCacheTokenForRenderFlags:(int64_t)a3
{
  void *v5;
  void *v6;

  -[UIKBKeyplaneView defaultKeyplaneCacheToken](self, "defaultKeyplaneCacheToken");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBKeyplaneView cacheToken](self, "cacheToken");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v5, "isUsableForCacheToken:withRenderFlags:", v6, a3);

  return a3;
}

- (UIKBCacheToken)cacheToken
{
  return self->_cacheToken;
}

- (UIKBCacheToken)defaultKeyplaneCacheToken
{
  return self->_defaultKeyplaneCacheToken;
}

- (BOOL)isPasscodeStyle
{
  return (-[UIKBTree visualStyling](self->_keyplane, "visualStyling") & 0xFF00) == 32512;
}

- (NSString)cacheKey
{
  void *v3;
  _BOOL8 v4;
  void *v5;
  void *v6;

  -[UIKBKeyplaneView cacheToken](self, "cacheToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[UIKBTree isSplit](self->_keyplane, "isSplit");
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringForSplitState:handBias:", v4, objc_msgSend(v5, "currentHandBias"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

void __37__UIKBKeyplaneView_prepareForDisplay__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  CGImage *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(a1 + 40), "objectForKey:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v6), (_QWORD)v10);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        +[UIKeyboardCache sharedInstance](UIKeyboardCache, "sharedInstance");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = (CGImage *)objc_msgSend(v8, "cachedImageForKey:fromLayout:traitCollection:", v7, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

        CGImageRelease(v9);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }

}

- (BOOL)keepNonPersistent
{
  return 0;
}

- (BOOL)_canDrawContent
{
  return !-[UIKBKeyplaneView suppressDrawing](self, "suppressDrawing");
}

- (BOOL)suppressDrawing
{
  return self->_suppressDrawing;
}

- (id)cacheIdentifierForKey:(id)a3 withState:(int)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  objc_msgSend(v6, "overrideDisplayString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v6, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "overrideDisplayString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByAppendingFormat:", CFSTR("_%@_%d"), v9, v4);
    v10 = objc_claimAutoreleasedReturnValue();

LABEL_5:
    v8 = (void *)v10;
    goto LABEL_6;
  }
  v11 = -[UIKBKeyplaneView _shouldUseUnifiedKeyView:forState:](self, "_shouldUseUnifiedKeyView:forState:", v6, v4);
  objc_msgSend(v6, "name");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v12;
  if ((v11 & 1) == 0)
  {
    objc_msgSend(v12, "stringByAppendingFormat:", CFSTR("_%d"), v4);
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
LABEL_6:
  if (objc_msgSend(v6, "displayType") == 7)
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isShiftLocked");

    if (v14)
    {
      objc_msgSend(v8, "stringByAppendingString:", CFSTR("_caps"));
      v15 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v15;
    }
  }

  return v8;
}

- (BOOL)_shouldUseUnifiedKeyView:(id)a3 forState:(int)a4
{
  return 0;
}

- (void)displayLayer:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  UIKBSplitImageView *keyBackgrounds;
  void *v30;
  UIKBSplitImageView *keyBorders;
  void *v32;
  id v33;

  v33 = a3;
  if (self->_shouldDrawRect)
  {
    -[UIView superview](self, "superview");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      if (self->_keyCaps || self->_keyBackgrounds)
      {

      }
      else
      {
        keyBorders = self->_keyBorders;

        if (!keyBorders)
          goto LABEL_37;
      }
      -[UIView layer](self, "layer");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setContents:", 0);

      -[UIKBKeyplaneView factory](self, "factory");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "backgroundTraitsForKeyplane:", self->_keyplane);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (self->_keyplaneMaskView || -[UIKBKeyplaneView isPasscodeStyle](self, "isPasscodeStyle"))
      {
        v8 = &unk_1E1A93A70;
      }
      else
      {
        v8 = &unk_1E1A93A70;
        if (objc_msgSend(v7, "blendForm") != 2 && objc_msgSend(v7, "blendForm") != 8)
          v8 = &unk_1E1A93A88;
      }
      +[UIKeyboardCache sharedInstance](UIKeyboardCache, "sharedInstance");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKBTree layoutName](self->_keyplane, "layoutName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "displayImagesForView:fromLayout:imageFlags:", self, v10, v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      -[UIKBKeyplaneView cachedWidth](self, "cachedWidth");
      v13 = v12;
      objc_msgSend(v11, "objectForKey:", &unk_1E1A983B8);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (v14)
      {
        v16 = v14;
      }
      else
      {
        objc_msgSend(v11, "objectForKey:", &unk_1E1A983D0);
        v16 = (id)objc_claimAutoreleasedReturnValue();
      }
      v17 = v16;

      -[UIKBSplitImageView setImage:cachedWidth:keyplane:](self->_keyCaps, "setImage:cachedWidth:keyplane:", v17, self->_keyplane, v13);
      objc_msgSend(v11, "objectForKey:", &unk_1E1A983A0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKBSplitImageView setImage:cachedWidth:keyplane:](self->_keyBackgrounds, "setImage:cachedWidth:keyplane:", v18, self->_keyplane, v13);
      objc_msgSend(v11, "objectForKey:", &unk_1E1A98388);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKBSplitImageView setImage:cachedWidth:keyplane:](self->_keyBorders, "setImage:cachedWidth:keyplane:", v19, self->_keyplane, v13);
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "isTrackpadMode");

      if ((v21 & 1) == 0)
      {
        -[UIView setAlpha:](self->_keyCaps, "setAlpha:", 1.0);
        -[UIView setAlpha:](self->_keyBackgrounds, "setAlpha:", 1.0);
        -[UIView setAlpha:](self->_keyBorders, "setAlpha:", 1.0);
      }
      -[UIView setHidden:](self->_keyBackgrounds, "setHidden:", v18 == 0);
      -[UIView setHidden:](self->_keyBorders, "setHidden:", v19 == 0);
      -[UIKBKeyplaneView renderConfig](self, "renderConfig");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "lightKeyboard");

      if (v23)
      {
        if (objc_msgSend(v7, "blendForm") == 1
          || objc_msgSend(v7, "blendForm") == 2
          || objc_msgSend(v7, "blendForm") == 7)
        {
          -[UIKBKeyplaneView renderConfig](self, "renderConfig");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "lightKeycapOpacity");
        }
        else
        {
          -[UIKBKeyplaneView renderConfig](self, "renderConfig");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "keycapOpacity");
        }
        -[UIView setAlpha:](self->_keyBackgrounds, "setAlpha:");

      }
      if (objc_msgSend(v7, "blendForm") == 8)
      {
        -[UIKBKeyplaneView renderConfig](self, "renderConfig");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "keycapOpacity");
        -[UIView setAlpha:](self->_keyBackgrounds, "setAlpha:");

      }
      if (objc_msgSend(v7, "blendForm") == 3)
      {
        v26 = (id)*MEMORY[0x1E0CD2EA0];
        v27 = (id)*MEMORY[0x1E0CD2BD0];
      }
      else
      {
        if (objc_msgSend(v7, "blendForm") == 2)
        {
          v27 = (id)*MEMORY[0x1E0CD2BC0];
        }
        else
        {
          if (objc_msgSend(v7, "blendForm") != 8)
          {
            v26 = 0;
            v27 = 0;
            goto LABEL_36;
          }
          v27 = (id)*MEMORY[0x1E0CD2E98];
          -[UIKBKeyplaneView renderConfig](self, "renderConfig");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setUsesDarkAppearance:", objc_msgSend(v28, "lightKeyboard") ^ 1);

          objc_msgSend(v7, "setControlOpacities:", 0);
          keyBackgrounds = self->_keyBackgrounds;
          objc_msgSend(v7, "extraFiltersForType:", *MEMORY[0x1E0CD2F08]);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIKBSplitImageView addExtraFilters:](keyBackgrounds, "addExtraFilters:", v30);

        }
        v26 = 0;
      }
LABEL_36:
      -[UIKBSplitImageView setFilterType:](self->_keyBackgrounds, "setFilterType:", v26);
      -[UIKBSplitImageView setFilterType:](self->_keyBorders, "setFilterType:", v27);

    }
  }
LABEL_37:
  +[UIKeyboardCache sharedInstance](UIKeyboardCache, "sharedInstance");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "decrementExpectedRender:", self);

}

- (double)cachedWidth
{
  double v3;
  double v4;
  double v5;
  double result;

  if (+[UIKeyboardCache enabled](UIKeyboardCache, "enabled")
    && -[UIKBTree isSplit](self->_keyplane, "isSplit"))
  {
    -[UIKBTree frameForKeylayoutName:](self->_keyplane, "frameForKeylayoutName:", CFSTR("split-left"));
    v4 = v3;
    -[UIKBTree frameForKeylayoutName:](self->_keyplane, "frameForKeylayoutName:", CFSTR("split-right"));
    return v4 + v5 + 3.0;
  }
  else
  {
    -[UIView size](self, "size");
  }
  return result;
}

- (void)prepareForDisplay
{
  UIKBSplitImageView *v3;
  UIKBSplitImageView *v4;
  UIKBSplitImageView *keyCaps;
  UIKBSplitImageView *v6;
  UIKBSplitImageView *v7;
  UIKBSplitImageView *keyBackgrounds;
  UIKBSplitImageView *v9;
  UIKBSplitImageView *v10;
  UIKBSplitImageView *keyBorders;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  id v25;

  -[UIKBKeyplaneView _generateFactoryIfNeeded](self, "_generateFactoryIfNeeded");
  if (self->_keyCaps)
  {
    -[UIView bounds](self, "bounds");
    -[UIView setFrame:](self->_keyCaps, "setFrame:");
  }
  else
  {
    v3 = [UIKBSplitImageView alloc];
    -[UIView bounds](self, "bounds");
    v4 = -[UIKBSplitImageView initWithFrame:canStretchAsFullWidth:](v3, "initWithFrame:canStretchAsFullWidth:", 0);
    keyCaps = self->_keyCaps;
    self->_keyCaps = v4;

    -[UIKBSplitImageView prepareForDisplay:](self->_keyCaps, "prepareForDisplay:", ((unint64_t)-[UIKBTree visualStyling](self->_keyplane, "visualStyling") >> 7) & 1);
    -[UIKBSplitImageView insertSubviewAtBottom:](self, "insertSubviewAtBottom:", self->_keyCaps);
  }
  if (self->_keyBackgrounds)
  {
    -[UIView bounds](self, "bounds");
    -[UIView setFrame:](self->_keyBackgrounds, "setFrame:");
  }
  else
  {
    v6 = [UIKBSplitImageView alloc];
    -[UIView bounds](self, "bounds");
    v7 = -[UIKBSplitImageView initWithFrame:canStretchAsFullWidth:](v6, "initWithFrame:canStretchAsFullWidth:", 0);
    keyBackgrounds = self->_keyBackgrounds;
    self->_keyBackgrounds = v7;

    -[UIKBSplitImageView prepareForDisplay:](self->_keyBackgrounds, "prepareForDisplay:", ((unint64_t)-[UIKBTree visualStyling](self->_keyplane, "visualStyling") >> 7) & 1);
    -[UIKBSplitImageView insertSubviewAtBottom:](self, "insertSubviewAtBottom:", self->_keyBackgrounds);
  }
  if (self->_keyBorders)
  {
    -[UIView bounds](self, "bounds");
    -[UIView setFrame:](self->_keyBorders, "setFrame:");
  }
  else
  {
    v9 = [UIKBSplitImageView alloc];
    -[UIView bounds](self, "bounds");
    v10 = -[UIKBSplitImageView initWithFrame:canStretchAsFullWidth:](v9, "initWithFrame:canStretchAsFullWidth:", 0);
    keyBorders = self->_keyBorders;
    self->_keyBorders = v10;

    -[UIKBSplitImageView prepareForDisplay:](self->_keyBorders, "prepareForDisplay:", ((unint64_t)-[UIKBTree visualStyling](self->_keyplane, "visualStyling") >> 7) & 1);
    -[UIKBSplitImageView insertSubviewAtBottom:](self, "insertSubviewAtBottom:", self->_keyBorders);
  }
  +[UIKeyboardCache sharedInstance](UIKeyboardCache, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "incrementExpectedRender:", self);

  -[UIKBKeyplaneView cacheKeysForRenderFlags:](self, "cacheKeysForRenderFlags:", &unk_1E1A93A58);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBTree layoutName](self->_keyplane, "layoutName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKeyboard activeKeyboard](UIKeyboard, "activeKeyboard");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "traitCollection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  dispatch_get_global_queue(25, 0);
  v17 = objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __37__UIKBKeyplaneView_prepareForDisplay__block_invoke;
  v21[3] = &unk_1E16B51E8;
  v22 = &unk_1E1A93A58;
  v23 = v13;
  v24 = v14;
  v25 = v16;
  v18 = v16;
  v19 = v14;
  v20 = v13;
  dispatch_async(v17, v21);

}

- (void)dimKeys:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _QWORD v14[5];
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __28__UIKBKeyplaneView_dimKeys___block_invoke;
  v14[3] = &unk_1E16BE348;
  v14[4] = self;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v14);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[NSMutableDictionary allValues](self->_renderedKeyViews, "allValues", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "dimKeys:", v4);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    }
    while (v7);
  }

}

- (void)deactivateKeys
{
  -[UIKBKeyplaneView deactivateKeysWithReason:force:](self, "deactivateKeysWithReason:force:", 0, 0);
}

- (void)deactivateKeysWithReason:(id)a3 force:(BOOL)a4
{
  void *v4;
  _BOOL8 v5;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t k;
  void *v22;
  void *v23;
  int v24;
  int v26;
  void *v28;
  id obj;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v5 = a4;
  v45 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "clearLongPressTimer");

  -[UIKBKeyplaneView cancelDelayedDeactivation](self, "cancelDelayedDeactivation");
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  -[NSMutableDictionary allValues](self->_delayedDeactivationKeys, "allValues");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
  if (v10)
  {
    v11 = v10;
    v4 = *(void **)v39;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(void **)v39 != v4)
          objc_enumerationMutation(v9);
        -[UIKBKeyplaneView setState:forKey:withReason:force:](self, "setState:forKey:withReason:force:", 2, *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i), v7, v5);
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
    }
    while (v11);
  }

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  -[NSMutableDictionary allValues](self->_activeViewIndex, "allValues");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v35;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v35 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * j), "key");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIKBKeyplaneView setState:forKey:withReason:force:](self, "setState:forKey:withReason:force:", 2, v4, v7, v5);

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
    }
    while (v15);
  }

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  -[UIView subviews](self, "subviews");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v31;
    do
    {
      for (k = 0; k != v19; ++k)
      {
        if (*(_QWORD *)v31 != v20)
          objc_enumerationMutation(obj);
        v22 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * k);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v22, "key");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v23, "state");

          if (v24 == 16 || v24 == 4)
          {
            objc_msgSend(v22, "key");
            v4 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = objc_msgSend(v4, "avoidAutoDeactivation") ^ 1;
          }
          else
          {
            v26 = 0;
          }
          if (v24 == 16 || v24 == 4)

          if (v26)
          {
            objc_msgSend(v22, "key");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            -[UIKBKeyplaneView setState:forKey:withReason:force:](self, "setState:forKey:withReason:force:", 2, v28, v7, v5);

          }
        }
      }
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
    }
    while (v19);
  }

}

- (BOOL)shouldAnimateInKeyView:(id)a3
{
  void *v4;
  BOOL v5;

  objc_msgSend(a3, "key");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_msgSend(v4, "state") != 2 || objc_msgSend(v4, "interactionType") != 9)
    && a3 != 0;

  return v5;
}

- (void)cancelDelayedDeactivation
{
  -[NSMutableDictionary removeAllObjects](self->_delayedDeactivationKeys, "removeAllObjects");
}

- (void)setRenderConfig:(id)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  int v10;
  BOOL v11;
  UIKBRenderConfig **p_renderConfig;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[UIKBKeyplaneView renderConfig](self, "renderConfig");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6
    && (v7 = (void *)v6,
        -[UIKBKeyplaneView renderConfig](self, "renderConfig"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "lightKeyboard"),
        v10 = objc_msgSend(v5, "lightKeyboard"),
        v8,
        v7,
        v9 == v10))
  {
    if (-[UIKBKeyplaneView isPasscodeStyle](self, "isPasscodeStyle"))
    {
      -[UIKBKeyplaneView renderConfig](self, "renderConfig");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "keycapOpacity");
      v26 = v25;
      objc_msgSend(v5, "keycapOpacity");
      v11 = v26 == v27;

    }
    else
    {
      v11 = 1;
    }
  }
  else
  {
    v11 = 0;
  }
  p_renderConfig = &self->_renderConfig;
  objc_storeStrong((id *)&self->_renderConfig, a3);
  -[UIKBRenderFactory renderingContext](self->_factory, "renderingContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIKBKeyplaneView renderConfig](self, "renderConfig");
  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBRenderFactory renderingContext](self->_factory, "renderingContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setRenderConfig:", v14);

  }
  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIKBRenderingContext renderingContextForRenderConfig:](UIKBRenderingContext, "renderingContextForRenderConfig:", v16);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "setIsFloating:", -[UIKBTree isFloating](self->_keyplane, "isFloating"));
    -[UIKBRenderFactory setRenderingContext:](self->_factory, "setRenderingContext:", v14);
  }

  if (v5)
    v17 = v11;
  else
    v17 = 1;
  if ((v17 & 1) == 0)
    -[UIView setNeedsDisplay](self, "setNeedsDisplay");
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  -[UIView subviews](self, "subviews", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v29 != v21)
          objc_enumerationMutation(v18);
        v23 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v23, "setRenderConfig:", *p_renderConfig);
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v20);
  }

}

- (int)stateForKey:(id)a3
{
  return objc_msgSend(a3, "state");
}

- (void)setRenderingContext:(id)a3
{
  uint64_t v5;
  int64_t v6;
  id v7;

  v7 = a3;
  v5 = objc_msgSend(v7, "handBias");
  v6 = -[UIKBRenderingContext handBias](self->_renderingContext, "handBias");
  objc_storeStrong((id *)&self->_renderingContext, a3);
  if (v5 == v6)
  {
    -[UIKBRenderFactory setRenderingContext:](self->_factory, "setRenderingContext:", v7);
  }
  else
  {
    -[UIKBKeyplaneView purgeFactory](self, "purgeFactory");
    -[UIKBKeyplaneView _generateFactoryIfNeeded](self, "_generateFactoryIfNeeded");
  }

}

- (void)setOverrideScreenTraits:(id)a3
{
  objc_storeStrong((id *)&self->_overrideScreenTraits, a3);
}

- (void)setKeyViewAnimator:(id)a3
{
  objc_storeStrong((id *)&self->_keyViewAnimator, a3);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setDefaultKeyplaneCacheToken:(id)a3
{
  objc_storeStrong((id *)&self->_defaultKeyplaneCacheToken, a3);
}

- (void)setDefaultKeyplane:(id)a3
{
  objc_storeStrong((id *)&self->_defaultKeyplane, a3);
}

- (void)setCacheToken:(id)a3
{
  objc_storeStrong((id *)&self->_cacheToken, a3);
}

- (UIKBKeyplaneView)initWithFrame:(CGRect)a3 keyplane:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  UIKBKeyplaneView *v11;
  uint64_t v12;
  NSMutableDictionary *subviewIndex;
  uint64_t v14;
  NSMutableDictionary *activeViewIndex;
  uint64_t v16;
  NSMutableDictionary *renderedKeyViews;
  uint64_t v18;
  NSMutableDictionary *delayedDeactivationKeys;
  UIKBKeyplaneView *v20;
  objc_super v22;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = a4;
  v22.receiver = self;
  v22.super_class = (Class)UIKBKeyplaneView;
  v11 = -[UIKBSplitImageView initWithFrame:canStretchAsFullWidth:](&v22, sel_initWithFrame_canStretchAsFullWidth_, 0, x, y, width, height);
  if (v11)
  {
    UIKeyboardGetSafeDeviceIdiom();
    v11->_shouldDrawRect = 1;
    objc_storeStrong((id *)&v11->_keyplane, a4);
    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 0);
    subviewIndex = v11->_subviewIndex;
    v11->_subviewIndex = (NSMutableDictionary *)v12;

    v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 0);
    activeViewIndex = v11->_activeViewIndex;
    v11->_activeViewIndex = (NSMutableDictionary *)v14;

    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 0);
    renderedKeyViews = v11->_renderedKeyViews;
    v11->_renderedKeyViews = (NSMutableDictionary *)v16;

    v18 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 0);
    delayedDeactivationKeys = v11->_delayedDeactivationKeys;
    v11->_delayedDeactivationKeys = (NSMutableDictionary *)v18;

    -[UIView setOpaque:](v11, "setOpaque:", 0);
    -[UIView setUserInteractionEnabled:](v11, "setUserInteractionEnabled:", 1);
    v20 = v11;
  }

  return v11;
}

void __28__UIKBKeyplaneView_dimKeys___block_invoke(uint64_t a1, void *a2, void *a3)
{
  char v5;
  char v6;
  id v7;

  v7 = a3;
  v5 = objc_msgSend(a2, "integerValue");
  v6 = v5;
  if ((v5 & 1) == 0)
  {
    if ((v5 & 4) == 0)
      goto LABEL_3;
LABEL_7:
    objc_msgSend(v7, "doubleValue");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 616), "setAlpha:");
    if ((v6 & 2) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  objc_msgSend(v7, "doubleValue");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 608), "setAlpha:");
  if ((v6 & 4) != 0)
    goto LABEL_7;
LABEL_3:
  if ((v6 & 2) != 0)
  {
LABEL_4:
    objc_msgSend(v7, "doubleValue");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 600), "setAlpha:");
  }
LABEL_5:

}

- (void)removeFromSuperview
{
  void *v3;
  objc_super v4;

  +[UIKeyboardCache sharedInstance](UIKeyboardCache, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decrementExpectedRender:", self);

  -[UIKBKeyplaneView purgeKeyViews](self, "purgeKeyViews");
  v4.receiver = self;
  v4.super_class = (Class)UIKBKeyplaneView;
  -[UIView removeFromSuperview](&v4, sel_removeFromSuperview);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  +[UIKeyboardCache sharedInstance](UIKeyboardCache, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decrementExpectedRender:", self);

  v4.receiver = self;
  v4.super_class = (Class)UIKBKeyplaneView;
  -[UIView dealloc](&v4, sel_dealloc);
}

- (BOOL)validForKeyplane:(id)a3 withVisualStyle:(int)a4
{
  _BOOL4 v6;

  v6 = -[UIKBTree looksLike:](self->_keyplane, "looksLike:", a3);
  if (v6)
    LOBYTE(v6) = -[UIKBTree visualStyle](self->_keyplane, "visualStyle") == a4;
  return v6;
}

- (BOOL)cacheDeferable
{
  return !-[UIKBKeyplaneView isPasscodeStyle](self, "isPasscodeStyle");
}

- (int64_t)cacheDeferPriority
{
  if (-[UIKBKeyplaneView isPasscodeStyle](self, "isPasscodeStyle"))
    return 0;
  else
    return 2;
}

- (BOOL)displaysColorImage
{
  return 0;
}

- (int64_t)assetIdiom
{
  void *v2;
  int64_t v3;

  -[UIView traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  return v3;
}

- (void)drawContentsOfRenderers:(id)a3
{
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _UNKNOWN **v13;
  uint64_t v14;
  void *v15;
  void *v16;
  BOOL IsEmpty;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  UIKBKeyplaneView *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  double v32;
  double v33;
  double v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;
  CGRect v52;

  v51 = *MEMORY[0x1E0C80C00];
  v38 = a3;
  v4 = 480;
  v5 = 0.0;
  if (+[UIKeyboardCache enabled](UIKeyboardCache, "enabled")
    && -[UIKBTree isSplit](self->_keyplane, "isSplit"))
  {
    -[UIKBTree frameForKeylayoutName:](self->_keyplane, "frameForKeylayoutName:", CFSTR("split-right"));
    v7 = v6;
    -[UIKBTree frameForKeylayoutName:](self->_keyplane, "frameForKeylayoutName:", CFSTR("split-left"));
    v5 = v7 - v8 + -3.0;
  }
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  -[UIKBTree keys](self->_keyplane, "keys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v46;
    v13 = &off_1E167A000;
    v36 = *(_QWORD *)v46;
    v37 = v9;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v46 != v12)
          objc_enumerationMutation(v9);
        v15 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v14);
        if (objc_msgSend(v15, "visible"))
        {
          -[UIKBKeyplaneView defaultKeyplane](self, "defaultKeyplane");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v15, "renderKeyInKeyplane:", v16)
            || -[UIKBKeyplaneView cornerMaskForKey:recursive:](self, "cornerMaskForKey:recursive:", v15, 0))
          {
            goto LABEL_12;
          }
          objc_msgSend(v15, "frame");
          IsEmpty = CGRectIsEmpty(v52);

          if (!IsEmpty)
          {
            v18 = v13[357];
            objc_msgSend(v15, "displayString");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            LOBYTE(v18) = objc_msgSend(v18, "couldUseGlyphSelectorForDisplayString:", v19);

            if ((v18 & 1) == 0)
            {
              v39 = v14;
              v40 = v11;
              v20 = objc_msgSend(v15, "state");
              objc_msgSend(v15, "setState:", 2);
              -[UIKBKeyplaneView factory](self, "factory");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v22 = v4;
              objc_msgSend(v21, "traitsForKey:onKeyplane:", v15, *(Class *)((char *)&self->super.super.super.super.isa + v4));
              v16 = (void *)objc_claimAutoreleasedReturnValue();

              v23 = self;
              -[UIKBKeyplaneView factory](self, "factory");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "displayContentsForKey:", v15);
              v25 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v15, "setState:", v20);
              v43 = 0u;
              v44 = 0u;
              v41 = 0u;
              v42 = 0u;
              v26 = v38;
              v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
              if (v27)
              {
                v28 = v27;
                v29 = *(_QWORD *)v42;
                do
                {
                  for (i = 0; i != v28; ++i)
                  {
                    if (*(_QWORD *)v42 != v29)
                      objc_enumerationMutation(v26);
                    v31 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
                    if (objc_msgSend(v31, "context"))
                    {
                      CGContextSaveGState((CGContextRef)objc_msgSend(v31, "context"));
                      if (v5 != 0.0)
                      {
                        objc_msgSend(v15, "frame");
                        v33 = v32;
                        objc_msgSend(*(id *)((char *)&v23->super.super.super.super.isa + v22), "frame");
                        if (v33 > v34 * 0.5)
                          CGContextTranslateCTM((CGContextRef)objc_msgSend(v31, "context"), -v5, 0.0);
                      }
                    }
                    objc_msgSend(v31, "renderKeyContents:withTraits:", v25, v16);
                    if (objc_msgSend(v31, "context"))
                      CGContextRestoreGState((CGContextRef)objc_msgSend(v31, "context"));
                  }
                  v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
                }
                while (v28);
              }

              v4 = v22;
              self = v23;
              v12 = v36;
              v9 = v37;
              v13 = &off_1E167A000;
              v14 = v39;
              v11 = v40;
LABEL_12:

            }
          }
        }
        ++v14;
      }
      while (v14 != v11);
      v35 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
      v11 = v35;
    }
    while (v35);
  }

}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  UIKBKeyplaneView *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UIKBKeyplaneView;
  -[UIView hitTest:withEvent:](&v7, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (UIKBKeyplaneView *)objc_claimAutoreleasedReturnValue();
  if (v5 == self)
  {

    v5 = 0;
  }
  return v5;
}

- (void)addKeyToDelayedDeactivationSet:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  int64_t v9;
  NSMutableDictionary *delayedDeactivationKeys;
  void *v11;
  dispatch_time_t v12;
  _QWORD v13[5];
  id v14;

  v4 = a3;
  if (v4)
  {
    -[UIKBKeyplaneView keyViewAnimator](self, "keyViewAnimator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[UIKBKeyplaneView keyViewAnimator](self, "keyViewAnimator");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKBKeyplaneView viewForKey:](self, "viewForKey:", v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "delayedDeactivationTimeForKeyView:", v7);
      v9 = (uint64_t)(v8 * 1000000000.0);

    }
    else
    {
      v9 = 59000000;
    }

    delayedDeactivationKeys = self->_delayedDeactivationKeys;
    objc_msgSend(v4, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](delayedDeactivationKeys, "setObject:forKey:", v4, v11);

    v12 = dispatch_time(0, v9);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __51__UIKBKeyplaneView_addKeyToDelayedDeactivationSet___block_invoke;
    v13[3] = &unk_1E16B1B50;
    v13[4] = self;
    v14 = v4;
    dispatch_after(v12, MEMORY[0x1E0C80D38], v13);

  }
}

void __51__UIKBKeyplaneView_addKeyToDelayedDeactivationSet___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 560);
  objc_msgSend(*(id *)(a1 + 40), "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v4 = v5;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "setState:forKey:", 2, v5);
    v4 = v5;
  }

}

- (id)cacheIdentifierForKey:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;

  v3 = a3;
  objc_msgSend(v3, "variantDisplayString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "paddedFrame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v13 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v3, "name");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v3, "displayType");
  v16 = objc_msgSend(v3, "displayTypeHint");
  objc_msgSend(v3, "overrideDisplayString");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "stringWithFormat:", CFSTR("%@%@%d%d%@%.0f%.0f%.0f%.0f"), v14, v4, v15, v16, v17, v6, v8, v10, v12);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (CGRect)_safeFrameForKeyViewFrame:(CGRect)a3 inContainer:(id)a4 forKey:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double MaxX;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  BOOL v31;
  double v32;
  void *v33;
  void *v34;
  long double v35;
  long double v36;
  void *v37;
  double v38;
  double v39;
  void *v40;
  double v41;
  long double v42;
  long double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  CGFloat rect;
  double v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = a4;
  v11 = a5;
  objc_msgSend(v10, "coordinateSpace");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "window");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "screen");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "coordinateSpace");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "convertRect:toCoordinateSpace:", v15, x, y, width, height);
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;

  if ((objc_msgSend(v10, "_shouldReverseLayoutDirection") & 1) != 0)
  {
    v50.origin.x = v17;
    rect = v19;
    v50.origin.y = v19;
    v50.size.width = v21;
    v50.size.height = v23;
    v49 = x;
    MaxX = CGRectGetMaxX(v50);
    objc_msgSend(v10, "window");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "safeAreaLayoutGuide");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "layoutFrame");
    v27 = y;
    v28 = width;
    v29 = height;
    v30 = CGRectGetMaxX(v51);

    v31 = MaxX <= v30;
    x = v49;
    height = v29;
    width = v28;
    y = v27;
    if (!v31)
    {
      v52.origin.x = v17;
      v52.origin.y = rect;
      v52.size.width = v21;
      v52.size.height = v23;
      v32 = CGRectGetMaxX(v52);
      objc_msgSend(v10, "window");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "safeAreaLayoutGuide");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "layoutFrame");
      v35 = v32 - CGRectGetMaxX(v53);

      objc_msgSend(v11, "frame");
      x = v49 - (v35 - fmod(v35, v36));
    }
  }
  else
  {
    objc_msgSend(v10, "window");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "safeAreaInsets");
    v39 = v38;

    if (v17 < v39)
    {
      objc_msgSend(v10, "window");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "safeAreaInsets");
      v42 = v41 - v17;

      objc_msgSend(v11, "frame");
      x = x + v42 - fmod(v42, v43);
    }
  }

  v44 = x;
  v45 = y;
  v46 = width;
  v47 = height;
  result.size.height = v47;
  result.size.width = v46;
  result.origin.y = v45;
  result.origin.x = v44;
  return result;
}

- (id)activeKeyViews
{
  return (id)-[NSMutableDictionary allValues](self->_activeViewIndex, "allValues");
}

- (void)updateFrameForKey:(id)a3
{
  void *v4;
  UIKBKeyplaneView *v5;
  void *v6;
  void *v7;
  void *v8;
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
  id v25;

  v25 = a3;
  -[UIKBKeyplaneView viewForKey:](self, "viewForKey:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[UIKBKeyplaneView containingViewForKey:withState:wantsActiveOut:](self, "containingViewForKey:withState:wantsActiveOut:", v25, objc_msgSend(v25, "state"), 0);
    v5 = (UIKBKeyplaneView *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[UIKBKeyplaneView factory](self, "factory");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "traitsForKey:onKeyplane:", v25, self->_keyplane);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "geometry");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "displayFrame");
      v10 = v9;
      v12 = v11;
      v14 = v13;
      v16 = v15;

      v17 = v16;
      v18 = v14;
      v19 = v12;
      v20 = v10;
      if (v5 != self)
      {
        -[UIView convertRect:toView:](self, "convertRect:toView:", v5, v10, v12, v14, v16);
        v20 = v21;
        v19 = v22;
        v18 = v23;
        v17 = v24;
      }
      if (UIRectIsDiscrete(v20, v19, v18, v17))
      {
        objc_msgSend(v4, "setFrame:", v20, v19, v18, v17);
        objc_msgSend(v4, "setDrawFrame:", v10, v12, v14, v16);
      }

    }
  }

}

- (id)viewForKey:(id)a3 state:(int)a4
{
  NSMutableDictionary *renderedKeyViews;
  void *v5;
  void *v6;

  renderedKeyViews = self->_renderedKeyViews;
  -[UIKBKeyplaneView cacheIdentifierForKey:withState:](self, "cacheIdentifierForKey:withState:", a3, *(_QWORD *)&a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](renderedKeyViews, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)deactivateAdaptiveKey:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "setState:", 2);
  -[UIKBKeyplaneView removeKeyFromDelayedDeactivationSet:](self, "removeKeyFromDelayedDeactivationSet:", v4);
  -[UIKBKeyplaneView deactivateKey:previousState:](self, "deactivateKey:previousState:", v4, objc_msgSend(v4, "state"));

}

- (void)hideKeyCaps:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v3 = a3;
  v15 = *MEMORY[0x1E0C80C00];
  -[UIView setHidden:](self->_keyCaps, "setHidden:");
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[NSMutableDictionary allValues](self->_renderedKeyViews, "allValues", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "hideKeyCap:", v3);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)hideKeyCaps:(BOOL)a3 andControlKeysWithInteractionTypes:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v4 = a3;
  v21 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[UIView setHidden:](self->_keyCaps, "setHidden:", v4);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[NSMutableDictionary allValues](self->_renderedKeyViews, "allValues", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        v13 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v12, "key");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "numberWithUnsignedInt:", objc_msgSend(v14, "interactionType"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v6, "containsObject:", v15))
          objc_msgSend(v12, "hideKeyCap:", v4);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

}

- (void)orientKeyCapForKey:(id)a3 orientation:(int64_t)a4
{
  NSMutableDictionary *activeViewIndex;
  id v7;
  void *v8;
  void *v9;
  NSMutableDictionary *subviewIndex;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  activeViewIndex = self->_activeViewIndex;
  v7 = a3;
  objc_msgSend(v7, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](activeViewIndex, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "orientKeyCap:", a4);

  subviewIndex = self->_subviewIndex;
  objc_msgSend(v7, "name");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](subviewIndex, "objectForKey:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "orientKeyCap:", a4);

  -[UIKBKeyplaneView cacheIdentifierForKey:withState:](self, "cacheIdentifierForKey:withState:", v7, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_renderedKeyViews, "objectForKey:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "orientKeyCap:", a4);
  -[UIKBKeyplaneView cacheIdentifierForKey:withState:](self, "cacheIdentifierForKey:withState:", v7, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary objectForKey:](self->_renderedKeyViews, "objectForKey:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "orientKeyCap:", a4);
  -[UIKBKeyplaneView cacheIdentifierForKey:withState:](self, "cacheIdentifierForKey:withState:", v7, 8);
  v18 = (id)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary objectForKey:](self->_renderedKeyViews, "objectForKey:", v18);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "orientKeyCap:", a4);
}

- (id)existingVariantsKeyViewForKey:(id)a3
{
  id v4;
  NSMutableDictionary *activeViewIndex;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSMutableDictionary *subviewIndex;
  void *v11;

  v4 = a3;
  activeViewIndex = self->_activeViewIndex;
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](activeViewIndex, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    subviewIndex = self->_subviewIndex;
    objc_msgSend(v4, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](subviewIndex, "objectForKey:", v11);
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (BOOL)retestSelectedVariantIndexForKey:(id)a3 atPoint:(CGPoint)a4 phase:(int64_t)a5
{
  double y;
  double x;
  id v9;
  void *v10;
  char v11;

  y = a4.y;
  x = a4.x;
  v9 = a3;
  if (-[UIKBRenderFactory popupKeyUsesCustomKeyContentView:](self->_factory, "popupKeyUsesCustomKeyContentView:", v9))
  {
    -[UIKBKeyplaneView existingVariantsKeyViewForKey:](self, "existingVariantsKeyViewForKey:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[UIView convertPoint:toView:](self, "convertPoint:toView:", v10, x, y);
      v11 = objc_msgSend(v10, "retestSelectedVariantIndexForKey:atPoint:phase:", v9, a5);
    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

uint64_t __56__UIKBKeyplaneView_deactivateKey_previousState_keyView___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t result;

  objc_msgSend(a1[4], "removeFromSuperview");
  v2 = (void *)*((_QWORD *)a1[5] + 68);
  objc_msgSend(a1[6], "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = a1[4];

  if (v4 == v5)
  {
    v6 = (void *)*((_QWORD *)a1[5] + 68);
    objc_msgSend(a1[6], "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObjectForKey:", v7);

  }
  v8 = (void *)*((_QWORD *)a1[5] + 67);
  objc_msgSend(a1[6], "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v9);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v11 = a1[4];

  if (v10 == v11)
  {
    v12 = (void *)*((_QWORD *)a1[5] + 67);
    objc_msgSend(a1[6], "name");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeObjectForKey:", v13);

  }
  result = objc_msgSend(a1[7], "disabled");
  if ((result & 1) == 0)
  {
    result = objc_msgSend(a1[7], "shouldAssertCurrentKeyState:", a1[6]);
    if ((_DWORD)result)
      return objc_msgSend(a1[5], "setState:forKey:", objc_msgSend(a1[6], "state"), a1[6]);
  }
  return result;
}

- (void)activateKeys
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[NSMutableDictionary allValues](self->_activeViewIndex, "allValues", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v7);
        -[UIView window](self, "window");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "rootViewController");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "view");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "addSubview:", v8);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

}

- (void)purgeActiveKeyViews
{
  void *v3;
  NSMutableDictionary *renderedKeyViews;
  id v5;
  _QWORD v6[4];
  id v7;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  renderedKeyViews = self->_renderedKeyViews;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __39__UIKBKeyplaneView_purgeActiveKeyViews__block_invoke;
  v6[3] = &unk_1E16D3AA0;
  v7 = v3;
  v5 = v3;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](renderedKeyViews, "enumerateKeysAndObjectsUsingBlock:", v6);
  -[NSMutableDictionary removeObjectsForKeys:](self->_renderedKeyViews, "removeObjectsForKeys:", v5);

}

void __39__UIKBKeyplaneView_purgeActiveKeyViews__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  int v7;
  id v8;

  v8 = a2;
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("_%d"), 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v8, "hasSuffix:", v6);

  if (v7)
  {
    objc_msgSend(v5, "removeFromSuperview");
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v8);
  }

}

- (void)purgeKeyViews
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  UIKBKeyplaneView *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  int v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t k;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t m;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  _BYTE v54[128];
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  -[NSMutableDictionary allValues](self->_activeViewIndex, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v49, v56, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v50;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v50 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
        objc_msgSend(v8, "key");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "interactionType") == 2)
        {

        }
        else
        {
          objc_msgSend(v8, "key");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "interactionType");

          if (v11 != 15)
            continue;
        }
        objc_msgSend(v8, "removeFromSuperview");
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v49, v56, 16);
    }
    while (v5);
  }

  -[UIKBKeyplaneView deactivateKeysWithReason:force:](self, "deactivateKeysWithReason:force:", CFSTR("purgeKeyViews"), 1);
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v12 = self;
  -[NSMutableDictionary allValues](self->_subviewIndex, "allValues");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v45, v55, 16);
  if (!v14)
    goto LABEL_23;
  v15 = v14;
  v16 = *(_QWORD *)v46;
  do
  {
    for (j = 0; j != v15; ++j)
    {
      if (*(_QWORD *)v46 != v16)
        objc_enumerationMutation(v13);
      v18 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * j);
      objc_msgSend(v18, "key");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v19, "isHashed"))
      {

      }
      else
      {
        -[UIKBTree keys](v12->_keyplane, "keys");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "key");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v20, "containsObject:", v21);

        if ((v22 & 1) != 0)
          continue;
      }
      objc_msgSend(v18, "removeFromSuperview");
    }
    v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v45, v55, 16);
  }
  while (v15);
LABEL_23:

  -[UIKBKeyplaneView keyViewAnimator](v12, "keyViewAnimator");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "shouldPurgeKeyViews");

  if (v24)
  {
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    -[UIView subviews](v12, "subviews");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v41, v54, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v42;
      do
      {
        for (k = 0; k != v27; ++k)
        {
          if (*(_QWORD *)v42 != v28)
            objc_enumerationMutation(v25);
          v30 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * k);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v30, "removeFromSuperview");
        }
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v41, v54, 16);
      }
      while (v27);
    }

  }
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  -[NSMutableDictionary allValues](v12->_renderedKeyViews, "allValues", 0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v37, v53, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v38;
    do
    {
      for (m = 0; m != v33; ++m)
      {
        if (*(_QWORD *)v38 != v34)
          objc_enumerationMutation(v31);
        v36 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * m);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v36, "removeFromSuperview");
      }
      v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v37, v53, 16);
    }
    while (v33);
  }

  -[NSMutableDictionary removeAllObjects](v12->_renderedKeyViews, "removeAllObjects");
}

- (void)purgeSubviews
{
  void *v3;

  -[NSMutableDictionary allValues](self->_subviewIndex, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "makeObjectsPerformSelector:", sel_removeFromSuperview);

  -[NSMutableDictionary removeAllObjects](self->_subviewIndex, "removeAllObjects");
}

- (void)purgeLayerContents
{
  -[UIKBSplitImageView clearImages](self->_keyCaps, "clearImages");
  -[UIKBSplitImageView clearImages](self->_keyBackgrounds, "clearImages");
  -[UIKBSplitImageView clearImages](self->_keyBorders, "clearImages");
}

- (void)purgeFactory
{
  UIKBRenderFactory *factory;

  factory = self->_factory;
  self->_factory = 0;

}

- (void)_updateKeyplaneMaskView
{
  void *v3;
  void *v4;
  void *v5;
  UIImageView *v6;
  id v7;

  +[UIKeyboardCache sharedInstance](UIKeyboardCache, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBTree layoutName](self->_keyplane, "layoutName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayImagesForView:fromLayout:imageFlags:", self, v4, &unk_1E1A93AA0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKey:", &unk_1E1A983A0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[UIImageView initWithImage:]([UIImageView alloc], "initWithImage:", v5);
  -[UIView setMaskView:](self->_keyplaneMaskView, "setMaskView:", v6);

}

- (UIView)keyplaneMaskView
{
  UIView *keyplaneMaskView;
  UIImageView *v4;
  UIView *v5;
  UIView *v6;

  keyplaneMaskView = self->_keyplaneMaskView;
  if (!keyplaneMaskView)
  {
    v4 = [UIImageView alloc];
    -[UIView bounds](self, "bounds");
    v5 = -[UIImageView initWithFrame:](v4, "initWithFrame:");
    v6 = self->_keyplaneMaskView;
    self->_keyplaneMaskView = v5;

    -[UIView setUserInteractionEnabled:](self->_keyplaneMaskView, "setUserInteractionEnabled:", 0);
    -[UIView setClipsToBounds:](self->_keyplaneMaskView, "setClipsToBounds:", 1);
    -[UIView insertSubview:above:](self, "insertSubview:above:", self->_keyplaneMaskView, self->_keyBackgrounds);
    -[UIKBKeyplaneView _updateKeyplaneMaskView](self, "_updateKeyplaneMaskView");
    keyplaneMaskView = self->_keyplaneMaskView;
  }
  return keyplaneMaskView;
}

- (UIKBTree)keyplane
{
  return self->_keyplane;
}

- (void)setKeyplane:(id)a3
{
  objc_storeStrong((id *)&self->_keyplane, a3);
}

- (void)setFactory:(id)a3
{
  objc_storeStrong((id *)&self->_factory, a3);
}

- (void)setEmojiKeyManager:(id)a3
{
  objc_storeStrong((id *)&self->_emojiKeyManager, a3);
}

- (UIKBKeyplaneViewDelegate)delegate
{
  return (UIKBKeyplaneViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setSuppressDrawing:(BOOL)a3
{
  self->_suppressDrawing = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_overrideScreenTraits, 0);
  objc_storeStrong((id *)&self->_keyplaneMaskView, 0);
  objc_storeStrong((id *)&self->_keyCaps, 0);
  objc_storeStrong((id *)&self->_keyBackgrounds, 0);
  objc_storeStrong((id *)&self->_keyBorders, 0);
  objc_storeStrong((id *)&self->_factory, 0);
  objc_storeStrong((id *)&self->_renderingContext, 0);
  objc_storeStrong((id *)&self->_renderConfig, 0);
  objc_storeStrong((id *)&self->_delayedDeactivationKeys, 0);
  objc_storeStrong((id *)&self->_renderedKeyViews, 0);
  objc_storeStrong((id *)&self->_activeViewIndex, 0);
  objc_storeStrong((id *)&self->_subviewIndex, 0);
  objc_storeStrong((id *)&self->_candidateGapView, 0);
  objc_storeStrong((id *)&self->_emojiKeyManager, 0);
  objc_storeStrong((id *)&self->_keyViewAnimator, 0);
  objc_storeStrong((id *)&self->_defaultKeyplaneCacheToken, 0);
  objc_storeStrong((id *)&self->_cacheToken, 0);
  objc_storeStrong((id *)&self->_defaultKeyplane, 0);
  objc_storeStrong((id *)&self->_keyplane, 0);
}

@end
