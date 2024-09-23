@implementation UIKeyboardEmojiCollectionInputView

+ (BOOL)wantsScreenTraits
{
  return 1;
}

- (UIKeyboardEmojiCollectionInputView)initWithFrame:(CGRect)a3 keyplane:(id)a4 key:(id)a5 screenTraits:(id)a6
{
  double height;
  double width;
  double y;
  double x;
  id v13;
  id v14;
  _BYTE *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  unint64_t v20;
  BOOL v21;
  double v22;
  double v23;
  double v24;
  CGFloat v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  UIKeyboardEmojiCollectionInputView *v34;
  UIKeyboardEmojiCollectionInputView *v35;
  uint64_t v36;
  UIKeyboardEmojiGraphicsTraits *emojiGraphicsTraits;
  void *v38;
  UIKeyboardEmojiLayout *v39;
  UICollectionViewFlowLayout *flowLayout;
  UIKeyboardEmojiCollectionView *v41;
  uint64_t v42;
  UIKeyboardEmojiCollectionView *collectionView;
  UIKeyboardEmojiCollectionView *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  NSObject *v49;
  void *v50;
  void *v51;
  void *v52;
  uint8_t v54[16];
  objc_super v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = objc_msgSend(v15, "orientation");
  if (v15)
  {
    v17 = v16;
  }
  else
  {
    +[UIKeyboard activeKeyboard](UIKeyboard, "activeKeyboard");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v18, "interfaceOrientation");

    +[UIKeyboardImpl keyboardScreen](UIKeyboardImpl, "keyboardScreen");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIKBScreenTraits traitsWithScreen:orientation:](UIKBScreenTraits, "traitsWithScreen:orientation:", v19, v17);
    v15 = (_BYTE *)objc_claimAutoreleasedReturnValue();

  }
  v20 = v17 - 3;
  v21 = (unint64_t)(v17 - 3) <= 1 && objc_msgSend(v15, "idiom") != 1;
  self->_useWideAnimojiCell = v21;
  objc_msgSend(v13, "frame");
  v22 = 0.0;
  if (width != v23 && (!v15 || !v15[35]))
  {
    objc_msgSend(v13, "frame");
    v25 = (width - v24) * 0.5;
    v56.origin.x = x;
    v56.origin.y = y;
    v56.size.width = width;
    v56.size.height = height;
    v57 = CGRectInset(v56, v25, 0.0);
    x = v57.origin.x;
    y = v57.origin.y;
    width = v57.size.width;
    height = v57.size.height;
    objc_msgSend(v15, "bounds");
    if (v26 >= 812.0)
    {
      +[UIScreen mainScreen](UIScreen, "mainScreen");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "bounds");
      v29 = v28;
      v31 = v30;

      if (v29 <= v31)
        v32 = v31;
      else
        v32 = v29;
      if (v29 >= v31)
        v33 = v31;
      else
        v33 = v29;
      if (v20 >= 2)
        v32 = v33;
      v22 = (width - v32) * 0.5;
      v58.origin.x = x;
      v58.origin.y = y;
      v58.size.width = width;
      v58.size.height = height;
      v59 = CGRectInset(v58, v22, 0.0);
      x = v59.origin.x;
      y = v59.origin.y;
      width = v59.size.width;
      height = v59.size.height;
    }
  }
  v55.receiver = self;
  v55.super_class = (Class)UIKeyboardEmojiCollectionInputView;
  v34 = -[UIView initWithFrame:](&v55, sel_initWithFrame_, x, y, width, height);
  v35 = v34;
  if (v34)
  {
    v34->_frameInset = v22;
    +[UIKeyboardEmojiGraphicsTraits emojiGraphicsTraitsWithScreenTraits:](UIKeyboardEmojiGraphicsTraits, "emojiGraphicsTraitsWithScreenTraits:", v15);
    v36 = objc_claimAutoreleasedReturnValue();
    emojiGraphicsTraits = v35->_emojiGraphicsTraits;
    v35->_emojiGraphicsTraits = (UIKeyboardEmojiGraphicsTraits *)v36;

    +[UIColor clearColor](UIColor, "clearColor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v35, "setBackgroundColor:", v38);

    -[UIView setOpaque:](v35, "setOpaque:", 0);
    -[UIKBKeyView updateForKeyplane:key:](v35, "updateForKeyplane:key:", v13, v14);
    v35->_isDraggingInputView = 0;
    v39 = objc_alloc_init(UIKeyboardEmojiLayout);
    flowLayout = v35->_flowLayout;
    v35->_flowLayout = &v39->super;

    -[UICollectionViewFlowLayout setMinimumInteritemSpacing:](v35->_flowLayout, "setMinimumInteritemSpacing:", 0.0);
    -[UICollectionViewFlowLayout setMinimumLineSpacing:](v35->_flowLayout, "setMinimumLineSpacing:", 0.0);
    -[UICollectionViewFlowLayout setScrollDirection:](v35->_flowLayout, "setScrollDirection:", objc_msgSend(v15, "isEmojiScrollingDirectionVertical") ^ 1);
    v41 = [UIKeyboardEmojiCollectionView alloc];
    -[UIView bounds](v35, "bounds");
    v42 = -[UIKeyboardEmojiCollectionView initWithFrame:collectionViewLayout:emojiGraphicsTraits:](v41, "initWithFrame:collectionViewLayout:emojiGraphicsTraits:", v35->_flowLayout, v35->_emojiGraphicsTraits);
    collectionView = v35->_collectionView;
    v35->_collectionView = (UIKeyboardEmojiCollectionView *)v42;

    -[UICollectionView setPrefetchingEnabled:](v35->_collectionView, "setPrefetchingEnabled:", 1);
    v44 = v35->_collectionView;
    +[UIColor clearColor](UIColor, "clearColor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionView setBackgroundColor:](v44, "setBackgroundColor:", v45);

    -[UIView setAutoresizingMask:](v35->_collectionView, "setAutoresizingMask:", 18);
    -[UIView contentScaleFactor](v35, "contentScaleFactor");
    -[UIView setContentScaleFactor:](v35->_collectionView, "setContentScaleFactor:");
    -[UICollectionView setDelegate:](v35->_collectionView, "setDelegate:", v35);
    -[UICollectionView setDataSource:](v35->_collectionView, "setDataSource:", v35);
    -[UIScrollView setShowsHorizontalScrollIndicator:](v35->_collectionView, "setShowsHorizontalScrollIndicator:", 0);
    -[UIScrollView setShowsVerticalScrollIndicator:](v35->_collectionView, "setShowsVerticalScrollIndicator:", 0);
    -[UIScrollView panGestureRecognizer](v35->_collectionView, "panGestureRecognizer");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setMaximumNumberOfTouches:", 1);

    -[UIScrollView panGestureRecognizer](v35->_collectionView, "panGestureRecognizer");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setMinimumNumberOfTouches:", 1);

    -[UIScrollView panGestureRecognizer](v35->_collectionView, "panGestureRecognizer");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setFailsPastMaxTouches:", 1);

    -[UICollectionView registerClass:forSupplementaryViewOfKind:withReuseIdentifier:](v35->_collectionView, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", objc_opt_class(), CFSTR("UICollectionElementKindSectionHeader"), CFSTR("kEmojiCategoryTitleIdentifier"));
    -[UICollectionView registerClass:forCellWithReuseIdentifier:](v35->_collectionView, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("kEmojiCellIdentifier"));
    -[UICollectionView registerClass:forCellWithReuseIdentifier:](v35->_collectionView, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("kMediaCellIdentifier"));
    kdebug_trace();
    perfLog();
    v49 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v49))
    {
      *(_WORD *)v54 = 0;
      _os_signpost_emit_with_name_impl(&dword_185066000, v49, OS_SIGNPOST_INTERVAL_BEGIN, 0x33uLL, "recents-bringup", "enableTelemetry=YES", v54, 2u);
    }

    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v35->_inputDelegateCanSupportAnimoji = objc_msgSend(v50, "canPasteImage");

    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "valueForKey:", CFSTR("com.apple.Animoji.StickerRecents.SplashVersion"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v35->_hasShownAnimojiFirstTimeExperience = v52 != 0;

    v35->_shouldRetryFetchingAnimojiRecents = 1;
    -[UIView addSubview:](v35, "addSubview:", v35->_collectionView);
  }

  return v35;
}

- (UIKeyboardEmojiCollectionInputView)initWithFrame:(CGRect)a3 keyplane:(id)a4 key:(id)a5
{
  return -[UIKeyboardEmojiCollectionInputView initWithFrame:keyplane:key:screenTraits:](self, "initWithFrame:keyplane:key:screenTraits:", a4, a5, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  +[UIKeyboardMediaController sharedKeyboardMediaController](UIKeyboardMediaController, "sharedKeyboardMediaController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDelegate:", 0);

  -[UICollectionView setDataSource:](self->_collectionView, "setDataSource:", 0);
  -[UICollectionView setDelegate:](self->_collectionView, "setDelegate:", 0);
  self->_isDraggingInputView = 0;
  self->_showingVariants = 0;
  +[UIKeyboardEmojiPreferences sharedInstance](UIKeyboardEmojiPreferences, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clearEmojiKeyboardPreferenceClient");

  v5.receiver = self;
  v5.super_class = (Class)UIKeyboardEmojiCollectionInputView;
  -[UIKBKeyView dealloc](&v5, sel_dealloc);
}

- (void)setContentScaleFactor:(double)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIKeyboardEmojiCollectionInputView;
  -[UIView setContentScaleFactor:](&v5, sel_setContentScaleFactor_);
  -[UIView setContentScaleFactor:](self->_collectionView, "setContentScaleFactor:", a3);
}

- (void)dimKeys:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)UIKeyboardEmojiCollectionInputView;
  -[UIKBKeyView dimKeys:](&v7, sel_dimKeys_, v4);
  -[UIView subviews](self, "subviews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __46__UIKeyboardEmojiCollectionInputView_dimKeys___block_invoke;
    v6[3] = &unk_1E16BE348;
    v6[4] = self;
    objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v6);
  }

}

void __46__UIKeyboardEmojiCollectionInputView_dimKeys___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;

  v7 = a3;
  if ((objc_msgSend(a2, "integerValue") & 4) != 0)
  {
    objc_msgSend(v7, "doubleValue");
    objc_msgSend(*(id *)(a1 + 32), "setAlpha:");
    *a4 = 1;
  }

}

- (void)setHitTestResponder:(id)a3
{
  UIKBEmojiHitTestResponder **p_hitTestResponder;
  id v5;

  p_hitTestResponder = &self->_hitTestResponder;
  v5 = a3;
  objc_storeWeak((id *)p_hitTestResponder, v5);
  -[UIKeyboardEmojiCollectionView setHitTestResponder:](self->_collectionView, "setHitTestResponder:", v5);

}

- (BOOL)_userHasSelectedSkinToneEmoji
{
  void *v3;
  char v4;
  void *v5;
  BOOL isFirstPartyStickers;
  UIKeyboardEmojiGraphicsTraits *emojiGraphicsTraits;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEmojiPopoverPresented");

  +[UIKeyboardEmojiPreferences sharedInstance](UIKeyboardEmojiPreferences, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  isFirstPartyStickers = 1;
  if ((objc_msgSend(v5, "hasDisplayedSkinToneHelp") & 1) == 0 && (v4 & 1) == 0)
  {
    emojiGraphicsTraits = self->_emojiGraphicsTraits;
    if (emojiGraphicsTraits)
      isFirstPartyStickers = emojiGraphicsTraits->_isFirstPartyStickers;
    else
      isFirstPartyStickers = 0;
  }

  return isFirstPartyStickers;
}

- (void)_setUserHasSelectedSkinToneEmoji:(BOOL)a3
{
  id v3;

  if (a3)
  {
    +[UIKeyboardEmojiPreferences sharedInstance](UIKeyboardEmojiPreferences, "sharedInstance");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "didDisplaySkinToneHelp");

  }
}

- (id)emojiBaseFirstCharacterString:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "_stringWithUnichar:", objc_msgSend(a3, "_firstLongCharacter"));
}

- (id)emojiBaseString:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend(getEMFStringUtilitiesClass(), "_baseStringForEmojiString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)skinToneWasUsedForEmoji:(id)a3
{
  id v4;
  void *v5;
  int v6;
  UIKeyboardEmojiGraphicsTraits *emojiGraphicsTraits;
  BOOL v8;

  v4 = a3;
  -[UIKeyboardEmojiKeyView emojiKeyManager](self, "emojiKeyManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasLastUsedVariantForEmojiString:", v4);

  if (v6)
  {
    emojiGraphicsTraits = self->_emojiGraphicsTraits;
    if (emojiGraphicsTraits)
      v8 = !emojiGraphicsTraits->_isFirstPartyStickers;
    else
      v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)baseStringIsCoupleEmoji:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend(getEMFStringUtilitiesClass(), "_baseStringForEmojiString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v3) = objc_msgSend(getEMFEmojiCategoryClass_0(), "_isCoupleMultiSkinToneEmoji:", v4);
  return (char)v3;
}

- (id)subTreeHitTest:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  UIKeyboardEmojiCollectionView *collectionView;
  void *v8;

  y = a3.y;
  x = a3.x;
  v6 = 0;
  if (-[UIView pointInside:forEvent:](self, "pointInside:forEvent:", 0))
  {
    collectionView = self->_collectionView;
    -[UIView convertPoint:fromView:](collectionView, "convertPoint:fromView:", self, x, y);
    -[UIKeyboardEmojiCollectionView closestCellForPoint:](collectionView, "closestCellForPoint:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(v8, "emoji");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        -[UIKeyboardEmojiCollectionInputView treeForCell:](self, "treeForCell:", v8);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v6 = 0;
    }

  }
  return v6;
}

- (id)treeForCell:(id)a3
{
  UIKeyboardEmojiCollectionView *collectionView;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double MidX;
  double v31;
  double MidY;
  double v33;
  _BOOL4 v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  double MaxY;
  void *v40;
  double v41;
  UIKeyboardEmojiCollectionView *v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  void *v48;
  double v49;
  id *p_emojiGraphicsTraits;
  double v51;
  double v52;
  void *v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  void *v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double MaxX;
  void *v65;
  double v66;
  UIKeyboardEmojiCollectionView *v67;
  double v68;
  double v69;
  double v70;
  void *v71;
  double v72;
  id *v73;
  double v74;
  double v75;
  double v76;
  void *v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  void *v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double MinY;
  void *v90;
  double v91;
  UIKeyboardEmojiCollectionView *v92;
  double v93;
  double v94;
  void *v95;
  double v96;
  void *v97;
  double v98;
  BOOL v99;
  double v100;
  double v101;
  double v102;
  id *v103;
  double v104;
  double v105;
  void *v106;
  double v107;
  double v108;
  double v109;
  double v110;
  void *v111;
  double v112;
  double v113;
  double v114;
  double v115;
  double MinX;
  void *v117;
  double v118;
  UIKeyboardEmojiCollectionInputView *v119;
  UIKeyboardEmojiCollectionView *v120;
  double v121;
  double v122;
  double v123;
  void *v124;
  double v125;
  double v126;
  double v127;
  id *v128;
  double v129;
  double v130;
  double v131;
  void *v132;
  double v133;
  double v134;
  double v135;
  double v136;
  double v137;
  void *v138;
  double v139;
  double v140;
  double v141;
  double v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  id v149;
  void *v150;
  void *v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t i;
  uint64_t v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  _BOOL4 v168;
  void *v169;
  id EMFStringUtilitiesClass;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  _BOOL4 v179;
  uint64_t v180;
  __CFString **v181;
  void *v182;
  _BOOL4 v183;
  void *v184;
  UIKeyboardEmojiGraphicsTraits *v185;
  BOOL v186;
  uint64_t v187;
  uint64_t v188;
  void *v190;
  UIKeyboardEmojiGraphicsTraits *emojiGraphicsTraits;
  BOOL v192;
  void *v193;
  int v194;
  void *v195;
  void *v196;
  UIKeyboardEmojiCollectionView *v197;
  void *v198;
  double v199;
  double v200;
  double v201;
  double v202;
  double v203;
  double v204;
  double v205;
  double v206;
  double v207;
  double v208;
  double v209;
  double v210;
  double v211;
  double v212;
  double v213;
  double v214;
  double v215;
  double v216;
  double v217;
  double v218;
  UIKeyboardEmojiGraphicsTraits *v219;
  id *p_collectionView;
  double v221;
  double v222;
  double v223;
  double v224;
  double v225;
  id v226;
  double v227;
  double v228;
  UIKBShape *v229;
  void *v230;
  id *location;
  void *v232;
  void *v233;
  double v234;
  double v235;
  void *v236;
  double v237;
  id v238;
  UIKeyboardEmojiCollectionInputView *v239;
  void *v240;
  id obj;
  id obja;
  _QWORD v243[4];
  id v244;
  uint64_t *v245;
  __int128 v246;
  __int128 v247;
  __int128 v248;
  __int128 v249;
  uint64_t v250;
  uint64_t v251;
  uint64_t v252;
  uint64_t v253;
  uint64_t *v254;
  uint64_t v255;
  uint64_t *v256;
  uint64_t v257;
  uint64_t v258;
  _BYTE v259[128];
  uint64_t v260;
  CGRect v261;
  CGRect v262;
  CGRect v263;
  CGRect v264;
  CGRect v265;
  CGRect v266;
  CGRect v267;
  CGRect v268;
  CGRect v269;
  CGRect v270;
  CGRect v271;
  CGRect v272;
  CGRect v273;
  CGRect v274;
  CGRect v275;
  CGRect v276;
  CGRect v277;
  CGRect v278;
  CGRect v279;
  CGRect v280;
  CGRect v281;
  CGRect v282;
  CGRect v283;
  CGRect v284;
  CGRect v285;
  CGRect v286;
  CGRect v287;
  CGRect v288;
  CGRect v289;
  CGRect v290;
  CGRect v291;
  CGRect v292;
  CGRect v293;
  CGRect v294;
  CGRect v295;
  CGRect v296;
  CGRect v297;
  CGRect v298;
  CGRect v299;
  CGRect v300;

  v260 = *MEMORY[0x1E0C80C00];
  v238 = a3;
  collectionView = self->_collectionView;
  objc_msgSend(v238, "frame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v239 = self;
  -[UIView superview](self, "superview");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView convertRect:toView:](collectionView, "convertRect:toView:", v13, v6, v8, v10, v12);
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;

  v22 = v238;
  objc_msgSend(v238, "frame");
  v24 = v23;
  v237 = v25;
  v27 = v26;
  v29 = v28;
  v261.origin.x = v15;
  v261.origin.y = v17;
  v261.size.width = v19;
  v261.size.height = v21;
  MidX = CGRectGetMidX(v261);
  -[UIView frame](v239, "frame");
  if (MidX < CGRectGetMinX(v262))
    goto LABEL_75;
  v263.origin.x = v15;
  v263.origin.y = v17;
  v263.size.width = v19;
  v263.size.height = v21;
  v31 = CGRectGetMidX(v263);
  -[UIView frame](v239, "frame");
  if (v31 > CGRectGetMaxX(v264))
    goto LABEL_75;
  v265.origin.x = v15;
  v265.origin.y = v17;
  v265.size.width = v19;
  v265.size.height = v21;
  MidY = CGRectGetMidY(v265);
  -[UIView frame](v239, "frame");
  if (MidY < CGRectGetMinY(v266))
    goto LABEL_75;
  v267.origin.x = v15;
  v267.origin.y = v17;
  v267.size.width = v19;
  v267.size.height = v21;
  v33 = CGRectGetMidY(v267);
  -[UIView frame](v239, "frame");
  if (v33 > CGRectGetMaxY(v268))
    goto LABEL_75;
  v234 = v29;
  v235 = v27;
  v34 = +[UIKeyboardImpl isSplit](UIKeyboardImpl, "isSplit");
  v35 = v15;
  v36 = v17;
  v37 = v19;
  v38 = v21;
  if (v34)
  {
    MaxY = CGRectGetMaxY(*(CGRect *)&v35);
    -[UIView superview](v239, "superview");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "frame");
    v41 = CGRectGetMaxY(v269);

    if (MaxY > v41)
    {
      v42 = v239->_collectionView;
      -[UIScrollView contentOffset](v42, "contentOffset");
      v44 = v43;
      -[UIScrollView contentOffset](v239->_collectionView, "contentOffset");
      v46 = v45;
      v270.origin.x = v15;
      v270.origin.y = v17;
      v270.size.width = v19;
      v270.size.height = v21;
      v47 = CGRectGetMaxY(v270);
      -[UIView superview](v239, "superview");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "frame");
      v49 = v47 - CGRectGetMaxY(v271);

      if (v49 < 0.0)
        v49 = -v49;
      p_emojiGraphicsTraits = (id *)&v239->_emojiGraphicsTraits;
      -[UIKeyboardEmojiGraphicsTraits minimumLineSpacing](v239->_emojiGraphicsTraits, "minimumLineSpacing");
      -[UICollectionView setContentOffset:animated:](v42, "setContentOffset:animated:", 1, v44, v46 + v49 + v51);
      v272.origin.x = v15;
      v272.origin.y = v17;
      v272.size.width = v19;
      v272.size.height = v21;
      v52 = CGRectGetMaxY(v272);
      -[UIView superview](v239, "superview");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "frame");
      v54 = v52 - CGRectGetMaxY(v273);

      if (v54 >= 0.0)
        v55 = v54;
      else
        v55 = -v54;
      objc_msgSend(*p_emojiGraphicsTraits, "minimumLineSpacing");
      v57 = v56;
      v274.origin.x = v15;
      v274.origin.y = v17;
      v274.size.width = v19;
      v274.size.height = v21;
      v58 = CGRectGetMaxY(v274);
      -[UIView superview](v239, "superview");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = v55 + v57;
      objc_msgSend(v59, "frame");
      v61 = v58 - CGRectGetMaxY(v275);

      if (v61 < 0.0)
        v61 = -v61;
      objc_msgSend(*p_emojiGraphicsTraits, "minimumLineSpacing");
      v24 = v24 + 0.0;
      v237 = v237 - v60;
      v63 = v61 + v62 - v60;
LABEL_33:
      v234 = v234 - v63;
      goto LABEL_44;
    }
    v283.origin.x = v15;
    v283.origin.y = v17;
    v283.size.width = v19;
    v283.size.height = v21;
    MinY = CGRectGetMinY(v283);
    -[UIView superview](v239, "superview");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "frame");
    v91 = CGRectGetMinY(v284);

    if (MinY < v91)
    {
      v92 = v239->_collectionView;
      -[UIScrollView contentOffset](v92, "contentOffset");
      v94 = v93;
      -[UIScrollView contentOffset](v239->_collectionView, "contentOffset");
      obj = v95;
      v285.origin.x = v15;
      v285.origin.y = v17;
      v285.size.width = v19;
      v285.size.height = v21;
      v96 = CGRectGetMinY(v285);
      -[UIView superview](v239, "superview");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v97, "frame");
      v98 = CGRectGetMinY(v286);

      v99 = v96 < v98;
      v100 = 0.0;
      v101 = 1.0;
      if (!v99)
        v101 = 0.0;
      v102 = *(double *)&obj - v101;
      v103 = (id *)&v239->_emojiGraphicsTraits;
      -[UIKeyboardEmojiGraphicsTraits minimumLineSpacing](v239->_emojiGraphicsTraits, "minimumLineSpacing");
      -[UICollectionView setContentOffset:animated:](v92, "setContentOffset:animated:", 1, v94, v102 - v104);
      v287.origin.x = v15;
      v287.origin.y = v17;
      v287.size.width = v19;
      v287.size.height = v21;
      v105 = CGRectGetMinY(v287);
      -[UIView superview](v239, "superview");
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v106, "frame");
      v107 = CGRectGetMinY(v288);

      if (v105 < v107)
        v100 = 1.0;
      objc_msgSend(*v103, "minimumLineSpacing");
      v109 = v108;
      v289.origin.x = v15;
      v289.origin.y = v17;
      v289.size.width = v19;
      v289.size.height = v21;
      v110 = CGRectGetMinY(v289);
      -[UIView superview](v239, "superview");
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      v112 = v109 + v100;
      objc_msgSend(v111, "frame");
      v113 = CGRectGetMinY(v290);

      if (v110 >= v113)
        v114 = 0.0;
      else
        v114 = -1.0;
      objc_msgSend(*v103, "minimumLineSpacing");
      v24 = v24 + 0.0;
      v237 = v237 + v112;
      v63 = v112 + v114 - v115;
      goto LABEL_33;
    }
  }
  else
  {
    MaxX = CGRectGetMaxX(*(CGRect *)&v35);
    -[UIView superview](v239, "superview");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "frame");
    v66 = CGRectGetMaxX(v276);

    if (MaxX <= v66)
    {
      v291.origin.x = v15;
      v291.origin.y = v17;
      v291.size.width = v19;
      v291.size.height = v21;
      MinX = CGRectGetMinX(v291);
      -[UIView superview](v239, "superview");
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v117, "frame");
      v118 = CGRectGetMinX(v292);

      v119 = v239;
      if (MinX >= v118)
        goto LABEL_45;
      v120 = v239->_collectionView;
      -[UIScrollView contentOffset](v120, "contentOffset");
      v122 = v121;
      v293.origin.x = v15;
      v293.origin.y = v17;
      v293.size.width = v19;
      v293.size.height = v21;
      v123 = CGRectGetMinX(v293);
      -[UIView superview](v239, "superview");
      v124 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v124, "frame");
      v125 = v123 - CGRectGetMinX(v294);

      v126 = -v125;
      if (v125 >= 0.0)
        v126 = v125;
      v127 = v122 - v126;
      v128 = (id *)&v239->_emojiGraphicsTraits;
      -[UIKeyboardEmojiGraphicsTraits minimumLineSpacing](v239->_emojiGraphicsTraits, "minimumLineSpacing");
      v130 = v127 - v129;
      -[UIScrollView contentOffset](v239->_collectionView, "contentOffset");
      -[UICollectionView setContentOffset:animated:](v120, "setContentOffset:animated:", 1, v130);
      v295.origin.x = v15;
      v295.origin.y = v17;
      v295.size.width = v19;
      v295.size.height = v21;
      v131 = CGRectGetMinX(v295);
      -[UIView superview](v239, "superview");
      v132 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v132, "frame");
      v133 = v131 - CGRectGetMinX(v296);

      if (v133 >= 0.0)
        v134 = -v133;
      else
        v134 = v133;
      objc_msgSend(*v128, "minimumLineSpacing");
      v136 = v135;
      v297.origin.x = v15;
      v297.origin.y = v17;
      v297.size.width = v19;
      v297.size.height = v21;
      v137 = CGRectGetMinX(v297);
      -[UIView superview](v239, "superview");
      v138 = (void *)objc_claimAutoreleasedReturnValue();
      v139 = v134 - v136;
      objc_msgSend(v138, "frame");
      v140 = v137 + CGRectGetMinX(v298);

      if (v140 < 0.0)
        v140 = -v140;
      objc_msgSend(*v128, "minimumLineSpacing");
      v142 = v140 + v141;
      v24 = v24 + v142;
      v88 = v139 + v142;
    }
    else
    {
      v67 = v239->_collectionView;
      -[UIScrollView contentOffset](v67, "contentOffset");
      v69 = v68;
      v277.origin.x = v15;
      v277.origin.y = v17;
      v277.size.width = v19;
      v277.size.height = v21;
      v70 = CGRectGetMaxX(v277);
      -[UIView superview](v239, "superview");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "frame");
      v72 = v70 - CGRectGetMaxX(v278);

      if (v72 < 0.0)
        v72 = -v72;
      v73 = (id *)&v239->_emojiGraphicsTraits;
      -[UIKeyboardEmojiGraphicsTraits minimumLineSpacing](v239->_emojiGraphicsTraits, "minimumLineSpacing");
      v75 = v69 + v72 + v74;
      -[UIScrollView contentOffset](v239->_collectionView, "contentOffset");
      -[UICollectionView setContentOffset:animated:](v67, "setContentOffset:animated:", 1, v75);
      v279.origin.x = v15;
      v279.origin.y = v17;
      v279.size.width = v19;
      v279.size.height = v21;
      v76 = CGRectGetMaxX(v279);
      -[UIView superview](v239, "superview");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "frame");
      v78 = v76 - CGRectGetMaxX(v280);

      if (v78 >= 0.0)
        v79 = v78;
      else
        v79 = -v78;
      objc_msgSend(*v73, "minimumLineSpacing");
      v81 = v80;
      v281.origin.x = v15;
      v281.origin.y = v17;
      v281.size.width = v19;
      v281.size.height = v21;
      v82 = CGRectGetMaxX(v281);
      -[UIView superview](v239, "superview");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      v84 = v79 + v81;
      objc_msgSend(v83, "frame");
      v85 = v82 - CGRectGetMaxX(v282);

      if (v85 < 0.0)
        v85 = -v85;
      objc_msgSend(*v73, "minimumLineSpacing");
      v87 = v85 + v86;
      v24 = v24 - v87;
      v88 = v84 - v87;
    }
    v235 = v235 - v88;
    v237 = v237 + 0.0;
  }
LABEL_44:
  v119 = v239;
LABEL_45:
  -[UICollectionView indexPathForCell:](v119->_collectionView, "indexPathForCell:", v238);
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardEmojiCollectionInputView setTappedSkinToneEmoji:](v239, "setTappedSkinToneEmoji:", v143);

  v22 = v238;
  if (!v238)
  {
LABEL_75:
    v144 = 0;
    goto LABEL_76;
  }
  objc_msgSend(v238, "emoji");
  v236 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKBTree treeOfType:](UIKBTree, "treeOfType:", 8);
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v144, "setState:", 2);
  objc_msgSend(v144, "setName:", CFSTR("EmojiPopupKey"));
  objc_msgSend(v236, "emojiString");
  v232 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v144, "setDisplayString:", v232);
  objc_msgSend(v144, "setRepresentedString:", v232);
  objc_msgSend(v144, "setDisplayType:", 0);
  objc_msgSend(v144, "setInteractionType:", 2);
  location = (id *)&v239->_selectedPopupKey;
  if (v239->_selectedPopupKey)
    -[UIKeyboardEmojiCollectionInputView resetSelectionIfNeeded](v239, "resetSelectionIfNeeded");
  if (+[UIDictationController isRunning](UIDictationController, "isRunning"))
  {
    +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
    v145 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v145, "dictationTipController");
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v236, "emojiString");
    v147 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v146, "signalDictationInsertionTip:", v147);

  }
  v255 = 0;
  v256 = &v255;
  v257 = 0x2050000000;
  v148 = (void *)getEMFEmojiTokenClass_softClass;
  v258 = getEMFEmojiTokenClass_softClass;
  if (!getEMFEmojiTokenClass_softClass)
  {
    v250 = MEMORY[0x1E0C809B0];
    v251 = 3221225472;
    v252 = (uint64_t)__getEMFEmojiTokenClass_block_invoke_1;
    v253 = (uint64_t)&unk_1E16B14C0;
    v254 = &v255;
    __getEMFEmojiTokenClass_block_invoke_1((uint64_t)&v250);
    v148 = (void *)v256[3];
  }
  v149 = objc_retainAutorelease(v148);
  _Block_object_dispose(&v255, 8);
  objc_msgSend(v236, "emojiString");
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v149, "emojiTokenWithString:localeData:", v150, 0);
  v233 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v233, "supportsSkinToneVariants"))
    goto LABEL_90;
  objc_msgSend(v233, "_skinToneVariantStrings");
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v151, "count") + 1);
  v240 = (void *)objc_claimAutoreleasedReturnValue();
  v248 = 0u;
  v249 = 0u;
  v246 = 0u;
  v247 = 0u;
  obja = v151;
  v152 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v246, v259, 16);
  if (v152)
  {
    v153 = *(_QWORD *)v247;
    do
    {
      for (i = 0; i != v152; ++i)
      {
        if (*(_QWORD *)v247 != v153)
          objc_enumerationMutation(obja);
        v155 = *(_QWORD *)(*((_QWORD *)&v246 + 1) + 8 * i);
        v156 = (void *)objc_msgSend(v144, "copy");
        objc_msgSend(v156, "setRepresentedString:", v155);
        objc_msgSend(v156, "representedString");
        v157 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v156, "setDisplayString:", v157);

        objc_msgSend(v156, "setDisplayType:", 0);
        v158 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v144, "name");
        v159 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v156, "representedString");
        v160 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v158, "stringWithFormat:", CFSTR("%@/%@"), v159, v160, location);
        v161 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v156, "setName:", v161);

        objc_msgSend(v156, "setOverrideDisplayString:", 0);
        objc_msgSend(v240, "addObject:", v156);
        objc_msgSend(obja, "firstObject");
        v162 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v160) = objc_msgSend(v162, "isEqualToString:", v155);

        if ((_DWORD)v160)
        {
          +[UIKBTree treeOfType:](UIKBTree, "treeOfType:", 8);
          v163 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v163, "setDisplayType:", 50);
          objc_msgSend(v163, "setInteractionType:", 0);
          v164 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v144, "name");
          v165 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v164, "stringWithFormat:", CFSTR("%@/Divider"), v165);
          v166 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v163, "setName:", v166);

          objc_msgSend(v163, "setState:", 1);
          objc_msgSend(v240, "addObject:", v163);

        }
      }
      v152 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v246, v259, 16);
    }
    while (v152);
  }

  objc_msgSend(v236, "emojiString");
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  v168 = -[UIKeyboardEmojiCollectionInputView baseStringIsCoupleEmoji:](v239, "baseStringIsCoupleEmoji:", v167);

  if (v168)
  {
    v169 = (void *)objc_msgSend(v144, "copy");
    EMFStringUtilitiesClass = getEMFStringUtilitiesClass();
    objc_msgSend(v236, "emojiString");
    v171 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(EMFStringUtilitiesClass, "_baseStringForEmojiString:", v171);
    v172 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v169, "setRepresentedString:", v172);

    objc_msgSend(v169, "representedString");
    v173 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v169, "setDisplayString:", v173);

    objc_msgSend(v169, "setDisplayType:", 0);
    v174 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v144, "name");
    v175 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v169, "representedString");
    v176 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v174, "stringWithFormat:", CFSTR("%@/%@"), v175, v176, location);
    v177 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v169, "setName:", v177);

    objc_msgSend(v169, "setOverrideDisplayString:", 0);
    objc_msgSend(v240, "insertObject:atIndex:", v169, 0);

  }
  objc_msgSend(v236, "emojiString");
  v178 = (void *)objc_claimAutoreleasedReturnValue();
  v179 = -[UIKeyboardEmojiCollectionInputView skinToneWasUsedForEmoji:](v239, "skinToneWasUsedForEmoji:", v178);

  if (v179)
  {
    v250 = 0;
    v251 = (uint64_t)&v250;
    v252 = 0x2020000000;
    v253 = 0x7FFFFFFFFFFFFFFFLL;
    v243[0] = MEMORY[0x1E0C809B0];
    v243[1] = 3221225472;
    v243[2] = __50__UIKeyboardEmojiCollectionInputView_treeForCell___block_invoke;
    v243[3] = &unk_1E16CEFB0;
    v244 = v236;
    v245 = &v250;
    objc_msgSend(v240, "enumerateObjectsUsingBlock:", v243);
    objc_msgSend(v144, "setSelectedVariantIndex:", *(_QWORD *)(v251 + 24));

    _Block_object_dispose(&v250, 8);
  }
  v180 = -[UIView effectiveUserInterfaceLayoutDirection](v239, "effectiveUserInterfaceLayoutDirection");
  v181 = UIKBAttributeValueFixedLeftStr;
  if (v180 != 1)
    v181 = UIKBAttributeValueFixedRightStr;
  objc_msgSend(v144, "setVariantPopupBias:", *v181);
  objc_msgSend(v144, "setSubtrees:", v240);
  objc_msgSend(v236, "emojiString");
  v182 = (void *)objc_claimAutoreleasedReturnValue();
  v183 = -[UIKeyboardEmojiCollectionInputView baseStringIsCoupleEmoji:](v239, "baseStringIsCoupleEmoji:", v182);

  objc_msgSend(v236, "emojiString");
  v184 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[UIKeyboardEmojiCollectionInputView skinToneWasUsedForEmoji:](v239, "skinToneWasUsedForEmoji:", v184))
  {
    -[UIKeyboardEmojiCollectionInputView tappedSkinToneEmoji](v239, "tappedSkinToneEmoji");
    v190 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v190, "section")
      || !-[UIKeyboardEmojiCollectionInputView _userHasSelectedSkinToneEmoji](v239, "_userHasSelectedSkinToneEmoji"))
    {

      goto LABEL_83;
    }
    emojiGraphicsTraits = v239->_emojiGraphicsTraits;
    if (emojiGraphicsTraits)
    {
      v192 = !emojiGraphicsTraits->_isFirstPartyStickers;

      if (v192)
        goto LABEL_71;
LABEL_83:
      if (v183)
        v187 = 12;
      else
        v187 = 10;
      v188 = 16;
      goto LABEL_87;
    }

LABEL_103:
    goto LABEL_71;
  }
  v185 = v239->_emojiGraphicsTraits;
  if (!v185)
    goto LABEL_103;
  v186 = !v185->_isFirstPartyStickers;

  if (!v186)
    goto LABEL_83;
LABEL_71:
  if (v183)
    v187 = 13;
  else
    v187 = 11;
  v188 = 4;
LABEL_87:
  objc_msgSend(v144, "setVariantType:", v187);
  objc_msgSend(v144, "setState:", v188);
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v193 = (void *)objc_claimAutoreleasedReturnValue();
  v194 = objc_msgSend(v193, "isEmojiPopoverPresented");

  if (v194)
  {
    objc_storeStrong(location, v144);
    v239->_showingVariants = 1;
    v239->_currentVariantRow = 0;
    -[UIKeyboardEmojiCollectionInputView tappedSkinToneEmoji](v239, "tappedSkinToneEmoji");
    v195 = (void *)objc_claimAutoreleasedReturnValue();
    v196 = (void *)objc_msgSend(v195, "copy");
    -[UIKeyboardEmojiCollectionInputView setSelectedIndexPath:](v239, "setSelectedIndexPath:", v196);

  }
LABEL_90:
  v197 = v239->_collectionView;
  -[UIView superview](v239, "superview");
  v198 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView convertRect:toView:](v197, "convertRect:toView:", v198, v24 + 0.0, v237 + 1.0, v235, v234);
  v200 = v199;
  v202 = v201;
  v204 = v203;
  v206 = v205;

  if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) != 1
    || +[UIKeyboardImpl isFloating](UIKeyboardImpl, "isFloating"))
  {
    -[UIKeyboardEmojiGraphicsTraits fakeEmojiKeySize](v239->_emojiGraphicsTraits, "fakeEmojiKeySize");
    v216 = v202 - (v215 - v206) * 0.5;
    v212 = v200 - (v214 - v204) * 0.5 + 0.0;
    v208 = v214 + 1.0;
    v213 = v216 + -2.0;
    v210 = v215 + 3.0;
    v299.origin.x = v212;
    v299.origin.y = v216 + -2.0;
    v299.size.width = v208;
    v299.size.height = v210;
    v217 = CGRectGetMaxX(v299);
    -[UIView bounds](v239->_collectionView, "bounds");
    if (v217 > v218)
    {
      if (objc_msgSend(v236, "supportsSkinToneVariants"))
      {
        v219 = v239->_emojiGraphicsTraits;
        if (!v219 || !v219->_isFirstPartyStickers)
        {
          p_collectionView = (id *)&v239->_collectionView;
          -[UIView bounds](v239->_collectionView, "bounds");
          v222 = v221;
          v300.origin.x = v212;
          v300.origin.y = v213;
          v300.size.width = v208;
          v300.size.height = v210;
          v223 = CGRectGetMaxX(v300);
          -[UIView bounds](v239->_collectionView, "bounds");
          if (v223 - v224 >= 0.0)
            v225 = v223 - v224;
          else
            v225 = -(v223 - v224);
          v226 = *p_collectionView;
          objc_msgSend(*p_collectionView, "contentOffset");
          v228 = v227;
          objc_msgSend(*p_collectionView, "contentOffset");
          objc_msgSend(v226, "setContentOffset:animated:", 1, v228 + v225);
          v212 = v222 - v208;
        }
      }
    }
  }
  else
  {
    -[UIKeyboardEmojiGraphicsTraits fakeEmojiKeySize](v239->_emojiGraphicsTraits, "fakeEmojiKeySize");
    v208 = v207;
    v210 = v209;
    v211 = (v209 - v206) * 0.5;
    v212 = v200 - (v207 - v204) * 0.5;
    v213 = v202 - v211;
  }
  v229 = -[UIKBShape initWithGeometry:frame:paddedFrame:]([UIKBShape alloc], "initWithGeometry:frame:paddedFrame:", 0, v212, v213, v208, v210, v212, v213, v208, v210);
  objc_msgSend(v144, "setShape:", v229);

  -[UIKBKeyView key](v239, "key");
  v230 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v144, "setParentKey:", v230);

  objc_msgSend(v144, "setObject:forProperty:", v236, CFSTR("UIKBAssociatedEmoji"));
  v22 = v238;
LABEL_76:

  return v144;
}

void __50__UIKeyboardEmojiCollectionInputView_treeForCell___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  int v9;

  objc_msgSend(a2, "representedString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "emojiString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

  if (v9)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
    *a4 = 1;
  }
}

- (BOOL)genderEmojiBaseStringNeedVariantSelector:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("⛹")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("🏋")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("🕵"));
  }

  return v4;
}

- (id)selectedChildSkinToneEmoji:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  if (objc_msgSend(v3, "selectedVariantIndex") == 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_4;
  objc_msgSend(v3, "subtrees");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndex:", objc_msgSend(v3, "selectedVariantIndex"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "displayString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
LABEL_4:
    objc_msgSend(v3, "objectForProperty:", CFSTR("UIKBAssociatedEmoji"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v3, "objectForProperty:", CFSTR("UIKBAssociatedEmoji"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIKeyboardEmoji emojiWithString:withVariantMask:](UIKeyboardEmoji, "emojiWithString:withVariantMask:", v6, objc_msgSend(v7, "variantMask"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (int64_t)didInputSubTree:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  UIKeyboardEmojiCollectionView *collectionView;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  __CFString *v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  __CFString **v37;
  void *v38;
  void *v40;
  void *v41;
  int64_t v42;
  objc_super v43;

  v4 = a3;
  v43.receiver = self;
  v43.super_class = (Class)UIKeyboardEmojiCollectionInputView;
  v5 = -[UIKBKeyView didInputSubTree:](&v43, sel_didInputSubTree_, v4);
  objc_msgSend(v4, "objectForProperty:", CFSTR("UIKBAssociatedEmoji"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = v6;
    if (objc_msgSend(v6, "supportsSkinToneVariants"))
    {
      if (objc_msgSend(v4, "state") == 16)
      {
        v8 = objc_msgSend(v4, "selectedVariantIndex");
        objc_msgSend(v4, "subtrees");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v8 < objc_msgSend(v9, "count");

      }
      else
      {
        v10 = 0;
      }
      if (!-[UIKeyboardEmojiCollectionInputView _userHasSelectedSkinToneEmoji](self, "_userHasSelectedSkinToneEmoji"))
        v5 = 1;
      v42 = v5;
      -[UIKeyboardEmojiCollectionInputView selectedChildSkinToneEmoji:](self, "selectedChildSkinToneEmoji:", v4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        objc_msgSend(v4, "subtrees");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectAtIndex:", 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "representedString");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        -[UIKeyboardEmojiKeyView emojiKeyManager](self, "emojiKeyManager");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "emojiString");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "updateSkinToneBaseKey:variantUsed:", v14, v16);

      }
      collectionView = self->_collectionView;
      -[UIKeyboardEmojiCollectionInputView tappedSkinToneEmoji](self, "tappedSkinToneEmoji");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[UICollectionView cellForItemAtIndexPath:](collectionView, "cellForItemAtIndexPath:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v19, "emoji");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "emojiString");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKeyboardEmojiCollectionInputView emojiBaseString:](self, "emojiBaseString:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "emojiString");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKeyboardEmojiCollectionInputView emojiBaseString:](self, "emojiBaseString:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v22, "isEqualToString:", v24);

      if (v25)
      {
        objc_msgSend(v19, "setEmoji:", v11);
        if (os_variant_has_internal_diagnostics())
        {
          v40 = (void *)objc_opt_class();
          objc_msgSend(v11, "emojiString");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setUnreleasedHighlight:", objc_msgSend(v40, "shouldHighlightEmoji:", v41));

        }
      }

      v5 = v42;
    }
    else
    {
      v11 = v7;
    }
    +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "lastUsedInputModeForCurrentContext");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "primaryLanguage");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), CFSTR("_"));
    v29 = objc_claimAutoreleasedReturnValue();

    if (v29)
      v30 = (__CFString *)v29;
    else
      v30 = CFSTR("en_US");
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "isEmojiPopoverVisibleOrDismissing");

    if (!v32)
      goto LABEL_25;
    -[UIKeyboardEmojiCollectionInputView emojiSearchField](self, "emojiSearchField");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "text");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v34, "length"))
    {
      -[UIKeyboardEmojiCollectionInputView tappedSkinToneEmoji](self, "tappedSkinToneEmoji");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v35, "section");

      if (!v36)
      {
        v37 = UIKBAnalyticsEmojiInputTypePopoverSearch;
LABEL_24:
        +[UIKBAnalyticsDispatcher emojiInsertedByMethod:inputType:](UIKBAnalyticsDispatcher, "emojiInsertedByMethod:inputType:", CFSTR("Touch"), *v37);
LABEL_25:
        -[UIKeyboardEmojiKeyView emojiKeyManager](self, "emojiKeyManager");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "emojiUsed:language:", v11, v30);

        goto LABEL_26;
      }
    }
    else
    {

    }
    v37 = UIKBAnalyticsEmojiInputTypePopover;
    goto LABEL_24;
  }
LABEL_26:
  objc_msgSend(v4, "setObject:forProperty:", 0, CFSTR("UIKBAssociatedEmoji"));

  return v5;
}

- (void)shouldDismissModalDisplayView:(id)a3
{
  void (**v4)(void);
  void (**v5)(void);

  -[UIKeyboardEmojiCollectionInputView _setUserHasSelectedSkinToneEmoji:](self, "_setUserHasSelectedSkinToneEmoji:", 1);
  -[UIKeyboardEmojiCollectionInputView completionBlock](self, "completionBlock");
  v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    v4[2]();
    -[UIKeyboardEmojiCollectionInputView setCompletionBlock:](self, "setCompletionBlock:", 0);
    v4 = v5;
  }

}

- (void)willDisplayModalActionView:(id)a3 withSubTreeKeyView:(id)a4 completion:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  uint64_t v13;
  _BOOL4 v14;
  void *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  UIView *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  UILabel *v31;
  uint64_t v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  double v40;
  void *v41;
  UIView *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  UIKBEmojiSnapshotSizingView *v53;
  double v54;
  double v55;
  void *v56;
  void *v57;
  UILayoutGuide *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  UIView *v67;
  void *v68;
  uint64_t v69;
  void *v70;
  UIKeyboardEmojiCollectionInputView *v71;
  void *v72;
  void *v73;
  _BOOL4 v74;
  int v75;
  void *v76;
  id v77;
  void *v78;
  _QWORD v79[2];
  _QWORD v80[2];
  _QWORD v81[2];
  _QWORD v82[4];

  v82[2] = *MEMORY[0x1E0C80C00];
  v77 = a4;
  v8 = a3;
  -[UIKeyboardEmojiCollectionInputView setCompletionBlock:](self, "setCompletionBlock:", a5);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBKeyView renderConfig](self, "renderConfig");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "whiteText");

  if (v11)
  {
    +[UIColor whiteColor](UIColor, "whiteColor");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v13 = (uint64_t)v12;
  }
  else
  {
    +[UIColor colorWithCGColor:](UIColor, "colorWithCGColor:", UIKBGetNamedColor(CFSTR("UIKBEmojiLightControlSymbolColor")));
    v13 = objc_claimAutoreleasedReturnValue();
    +[UIColor systemBlueColor](UIColor, "systemBlueColor");
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  v78 = v12;
  v14 = +[UIKeyboardImpl isSplit](UIKeyboardImpl, "isSplit");
  if (+[UIKeyboardImpl isFloating](UIKeyboardImpl, "isFloating"))
  {
    v75 = 0;
  }
  else
  {
    -[UIKBKeyView renderConfig](self, "renderConfig");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = objc_msgSend(v15, "isFloating") ^ 1;

  }
  v74 = (UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1;
  v71 = self;
  v16 = -[UIView _keyboardOrientation](self, "_keyboardOrientation") - 3;
  +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "preferencesActions");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "rivenSizeFactor:", 1.0);
  v20 = v19;

  v21 = 1.67;
  if (v16 < 2)
    v21 = 1.75;
  if (v14)
    v22 = 0.423;
  else
    v22 = 0.366;
  if (v14)
    v23 = 50.0;
  else
    v23 = 0.0;
  if (!v14)
    v21 = 1.0;
  v24 = 0.96;
  if (v20 <= 1.0)
    v24 = 1.0;
  v25 = v21 * v24;
  v26 = objc_alloc_init(UIView);
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v26, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v8, "addSubview:", v26);
  objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v26, 3, 0, v8, 3, 1.0, 0.0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v27);

  objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v26, 1, 0, v8, 1, 1.0, 0.0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v28);

  objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v26, 2, 0, v8, 2, 1.0, 0.0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v29);

  objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v26, 8, 0, v8, 8, v22, 0.0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v30);

  v31 = objc_alloc_init(UILabel);
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v31, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setUserInteractionEnabled:](v31, "setUserInteractionEnabled:", 0);
  v76 = (void *)v13;
  v32 = *(_QWORD *)off_1E1678D90;
  v81[0] = *(_QWORD *)off_1E1678D98;
  v69 = v81[0];
  v81[1] = v32;
  v82[0] = v13;
  objc_msgSend(off_1E167A828, "systemFontOfSize:", 13.0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v82[1] = v33;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v82, v81, 2);
  v73 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = objc_alloc(MEMORY[0x1E0CB3498]);
  objc_msgSend(getEMFEmojiCategoryClass_0(), "localizedSkinToneEmojiDescription");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = (void *)objc_msgSend(v34, "initWithString:attributes:", v35, v73);

  -[UILabel setNumberOfLines:](v31, "setNumberOfLines:", 0);
  -[UILabel setTextAlignment:](v31, "setTextAlignment:", 1);
  -[UILabel setAttributedText:](v31, "setAttributedText:", v72);
  -[UIView addSubview:](v26, "addSubview:", v31);
  objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v31, 9, 0, v26, 9, v25, 0.0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v36);

  objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v31, 3, 0, v26, 3, 1.0, 0.0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v37);

  objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v31, 4, 0, v26, 4, 1.0, 0.0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v38);

  v39 = (void *)MEMORY[0x1E0D156E0];
  -[UIKeyboardEmojiGraphicsTraits alertTextWidth](v71->_emojiGraphicsTraits, "alertTextWidth");
  objc_msgSend(v39, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v31, 7, 0, 0, 0, 0.0, v40 - v23);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v41);

  v42 = objc_alloc_init(UIView);
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v42, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v8, "addSubview:", v42);
  objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v42, 4, 0, v8, 4, 1.0, 0.0);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v43);

  v67 = v42;
  objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v42, 8, 0, v8, 8, 0.086, 0.0);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v44);

  +[UIButton buttonWithType:](UIButton, "buttonWithType:", 1);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v79[1] = v32;
  v80[0] = v78;
  v79[0] = v69;
  objc_msgSend(off_1E167A828, "systemFontOfSize:", 16.0);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v80[1] = v46;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v80, v79, 2);
  v70 = (void *)objc_claimAutoreleasedReturnValue();

  v47 = objc_alloc(MEMORY[0x1E0CB3498]);
  _UILocalizedStringInSystemLanguage(CFSTR("OK"), CFSTR("OK"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = (void *)objc_msgSend(v47, "initWithString:attributes:", v48, v70);

  objc_msgSend(v45, "setAttributedTitle:forState:", v68, 0);
  objc_msgSend(v45, "addTarget:action:forControlEvents:", v71, sel_shouldDismissModalDisplayView_, 64);
  objc_msgSend(v8, "addSubview:", v45);
  objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v45, 9, 0, v8, 9, v25, 0.0);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v49);

  objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v45, 4, 0, v42, 3, 1.0, 6.0);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v50);

  objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v45, 7, 0, v31, 7, 1.0, 0.0);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v51);

  objc_msgSend(v77, "snapshotViewAfterScreenUpdates:", 1);
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v52, "setUserInteractionEnabled:", 0);
  v53 = -[UIKBEmojiSnapshotSizingView initWithSnapshotView:]([UIKBEmojiSnapshotSizingView alloc], "initWithSnapshotView:", v52);
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v53, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  if ((v74 & v75) != 0)
    v54 = -25.0;
  else
    v54 = 0.0;
  objc_msgSend(v8, "addSubview:", v53);
  LODWORD(v55) = 1148829696;
  -[UIView setContentHuggingPriority:forAxis:](v53, "setContentHuggingPriority:forAxis:", 1, v55);
  objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v53, 9, 0, v8, 9, v25, 0.0);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v56);

  objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v53, 3, 0, v31, 4, 1.0, v54);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v57);

  v58 = objc_alloc_init(UILayoutGuide);
  objc_msgSend(v8, "addLayoutGuide:", v58);

  -[UILayoutGuide topAnchor](v58, "topAnchor");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView bottomAnchor](v53, "bottomAnchor");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "constraintEqualToAnchor:", v60);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v61);

  -[UILayoutGuide bottomAnchor](v58, "bottomAnchor");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "topAnchor");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "constraintEqualToAnchor:", v63);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v64);

  -[UILayoutGuide heightAnchor](v58, "heightAnchor");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "constraintGreaterThanOrEqualToConstant:", 6.0);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v66);

  objc_msgSend(MEMORY[0x1E0D156E0], "activateConstraints:", v9);
}

- (BOOL)_shouldShowRecentlyUsedMedia
{
  void *v3;
  void *v4;
  BOOL v5;

  if (-[UIKeyboardEmojiCollectionInputView isSearching](self, "isSearching")
    || !-[UIKeyboardEmojiCollectionInputView showingRecents](self, "showingRecents"))
  {
    return 0;
  }
  +[UIKeyboardEmojiPreferences sharedInstance](UIKeyboardEmojiPreferences, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "deviceSupportsMemoji"))
  {
    +[UIKeyboardEmojiPreferences sharedInstance](UIKeyboardEmojiPreferences, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "memojiSettingEnabled")
      && self->_inputDelegateCanSupportAnimoji
      && self->_shouldRetryFetchingAnimojiRecents;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)didTearDownRecentsViewForKeyboardMediaController:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __87__UIKeyboardEmojiCollectionInputView_didTearDownRecentsViewForKeyboardMediaController___block_invoke;
  v6[3] = &unk_1E16B1B50;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __87__UIKeyboardEmojiCollectionInputView_didTearDownRecentsViewForKeyboardMediaController___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 40), "shouldRetryFetchingRecents");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 650) = result;
  return result;
}

- (void)didInsertMediaForKeyboardMediaController:(id)a3
{
  id v3;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissEmojiPopoverIfNecessaryWithCompletion:", 0);

}

- (void)didPresentCardForKeyboardMediaController:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  id v7;

  -[UIKeyboardEmojiCollectionInputView emojiSearchField](self, "emojiSearchField", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isActive");

  if (v5)
  {
    -[UIKeyboardEmojiCollectionInputView emojiSearchField](self, "emojiSearchField");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "resignFirstResponder");

  }
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "didPresentMemojiCard");

}

- (void)didDismissCardForKeyboardMediaController:(id)a3
{
  id v3;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "didDismissMemojiCard");

}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  void *v4;
  int64_t v5;

  +[UIKeyboardEmojiCategory enabledCategoryIndexes](UIKeyboardEmojiCategory, "enabledCategoryIndexes", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (!-[UIKeyboardEmojiCollectionInputView showingRecents](self, "showingRecents"))
    v5 += -[UIKeyboardEmojiCollectionInputView isSearching](self, "isSearching");
  return v5;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v11;
  uint64_t v12;
  void *v13;
  unint64_t v14;
  int64_t v15;

  v6 = a3;
  if (a4)
  {
LABEL_2:
    +[UIKeyboardEmojiCategory categoryForType:](UIKeyboardEmojiCategory, "categoryForType:", -[UIKeyboardEmojiCollectionInputView emojiCategoryTypeForSection:](self, "emojiCategoryTypeForSection:", a4));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "emoji");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

LABEL_3:
    goto LABEL_4;
  }
  if (!-[UIKeyboardEmojiCollectionInputView isSearching](self, "isSearching"))
  {
    if (-[UIKeyboardEmojiCollectionInputView showingRecents](self, "showingRecents"))
    {
      v15 = -[UIKeyboardEmojiGraphicsTraits prepolulatedRecentCount](self->_emojiGraphicsTraits, "prepolulatedRecentCount");
      v9 = v15
         + -[UIKeyboardEmojiCollectionInputView _shouldShowRecentlyUsedMedia](self, "_shouldShowRecentlyUsedMedia");
      goto LABEL_4;
    }
    goto LABEL_2;
  }
  -[UIKeyboardEmojiCollectionInputView searchResults](self, "searchResults");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (!v12)
  {
    v9 = 1;
    goto LABEL_4;
  }
  v9 = -[UIKeyboardEmojiGraphicsTraits prepolulatedRecentCount](self->_emojiGraphicsTraits, "prepolulatedRecentCount");
  -[UIKeyboardEmojiCollectionInputView searchResults](self, "searchResults");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  if (v14 > v9)
  {
    -[UIKeyboardEmojiCollectionInputView searchResults](self, "searchResults");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "count");
    goto LABEL_3;
  }
LABEL_4:

  return v9;
}

+ (BOOL)shouldHighlightEmoji:(id)a3
{
  return +[UIKeyboardEmoji shouldHighlightEmoji:](UIKeyboardEmoji, "shouldHighlightEmoji:", a3);
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v5;
  uint64_t v6;
  unint64_t v7;
  _BOOL4 v8;
  UIKeyboardEmojiCollectionView *collectionView;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  unint64_t v23;
  void *v24;
  unint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  unint64_t v31;
  void *v32;
  double v33;
  void *v35;
  void *v36;
  uint64_t v37;

  v5 = a4;
  v6 = objc_msgSend(v5, "section");
  v7 = objc_msgSend(v5, "item");
  v8 = -[UIKeyboardEmojiCollectionInputView _shouldShowRecentlyUsedMedia](self, "_shouldShowRecentlyUsedMedia");
  collectionView = self->_collectionView;
  if (!v8 || v6 || v7)
  {
    -[UICollectionView dequeueReusableCellWithReuseIdentifier:forIndexPath:](collectionView, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("kEmojiCellIdentifier"), v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      if (-[UIKeyboardEmojiCollectionInputView isSearching](self, "isSearching"))
      {
        -[UIKeyboardEmojiCollectionInputView searchResults](self, "searchResults");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (v19)
        {
          -[UIKeyboardEmojiCollectionInputView searchResults](self, "searchResults");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "count");

          if (v21)
          {
            -[UIKeyboardEmojiCollectionInputView searchResults](self, "searchResults");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = objc_msgSend(v22, "count");

            if (v7 < v23)
            {
              -[UIKeyboardEmojiCollectionInputView searchResults](self, "searchResults");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "objectAtIndex:", v7);
              v14 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v14, "string");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              if (v16)
              {
                +[UIKeyboardEmoji emojiWithString:withVariantMask:](UIKeyboardEmoji, "emojiWithString:withVariantMask:", v16, +[UIKeyboardEmojiCategory hasVariantsForEmoji:](UIKeyboardEmojiCategory, "hasVariantsForEmoji:", v16));
                v15 = (void *)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v15 = 0;
              }
              goto LABEL_9;
            }
            objc_msgSend(v10, "setEmoji:", 0);
          }
          else
          {
            objc_msgSend(v10, "setEmoji:", 0);
            objc_msgSend(v10, "setNoResultsCell:", 1);
          }
          v15 = 0;
LABEL_31:

          return v10;
        }
      }
      if (-[UIKeyboardEmojiCollectionInputView showingRecents](self, "showingRecents"))
      {
        v25 = v7 - v8;
        v37 = 0;
        -[UIKeyboardEmojiKeyView emojiKeyManager](self, "emojiKeyManager");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "recentEmojiAtIndex:size:", v25, &v37);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          +[UIKeyboardEmoji emojiWithString:withVariantMask:](UIKeyboardEmoji, "emojiWithString:withVariantMask:", v14, +[UIKeyboardEmojiCategory hasVariantsForEmoji:](UIKeyboardEmojiCategory, "hasVariantsForEmoji:", v14));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          +[UIKeyboardEmojiCategory categoryForType:](UIKeyboardEmojiCategory, "categoryForType:", 9);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "emoji");
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          -[UIKeyboardEmojiKeyView emojiKeyManager](self, "emojiKeyManager");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "emojiWithoutDuplicateRecents:", v28);
          v30 = (void *)objc_claimAutoreleasedReturnValue();

          v31 = v25 - v37;
          if (v31 >= objc_msgSend(v30, "count"))
          {
            v15 = 0;
          }
          else
          {
            objc_msgSend(v30, "objectAtIndex:", v31);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
          }

        }
        objc_msgSend(v15, "setIsFromRecentsCategory:", 1);
        goto LABEL_28;
      }
    }
    +[UIKeyboardEmojiCategory categoryForType:](UIKeyboardEmojiCategory, "categoryForType:", -[UIKeyboardEmojiCollectionInputView emojiCategoryTypeForSection:](self, "emojiCategoryTypeForSection:", v6));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "emoji");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      v15 = 0;
      goto LABEL_28;
    }
    objc_msgSend(v14, "objectAtIndex:", v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
LABEL_28:

      if (v15)
      {
        objc_msgSend(v10, "setEmoji:", v15);
        -[UIKeyboardEmojiCollectionView emojiGraphicsTraits](self->_collectionView, "emojiGraphicsTraits");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "emojiKeyWidth");
        objc_msgSend(v10, "setEmojiFontSize:", (uint64_t)v33);

        if (os_variant_has_internal_diagnostics())
        {
          v35 = (void *)objc_opt_class();
          objc_msgSend(v15, "emojiString");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setUnreleasedHighlight:", objc_msgSend(v35, "shouldHighlightEmoji:", v36));

        }
      }
      goto LABEL_31;
    }
    -[UIKeyboardEmojiKeyView emojiKeyManager](self, "emojiKeyManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "emojiString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "lastUsedVariantEmojiForEmojiString:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setEmojiString:", v18);

LABEL_9:
    goto LABEL_28;
  }
  -[UICollectionView dequeueReusableCellWithReuseIdentifier:forIndexPath:](collectionView, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("kMediaCellIdentifier"), v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[UIKeyboardMediaController sharedKeyboardMediaController](UIKeyboardMediaController, "sharedKeyboardMediaController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "contentView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "showRecentlyUsedMediaInView:", v12);

  return v10;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  UIKeyboardEmojiGraphicsTraits *emojiGraphicsTraits;
  void *v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  int64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  char v25;
  double v26;
  double v27;
  double v28;
  uint64_t v29;
  void *v30;
  void *v31;
  int v32;
  double v33;
  void *v34;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  emojiGraphicsTraits = self->_emojiGraphicsTraits;
  if (emojiGraphicsTraits && emojiGraphicsTraits->_isFirstPartyStickers && !objc_msgSend(v10, "section"))
  {
    v13 = 0;
    goto LABEL_21;
  }
  objc_msgSend(v8, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v9, CFSTR("kEmojiCategoryTitleIdentifier"), v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[UICollectionViewFlowLayout scrollDirection](self->_flowLayout, "scrollDirection") == UICollectionViewScrollDirectionVertical)
  {
    -[UIKeyboardEmojiGraphicsTraits inputViewLeftMostPadding](self->_emojiGraphicsTraits, "inputViewLeftMostPadding");
    v15 = v14;
    -[UIKeyboardEmojiGraphicsTraits inputViewRightMostPadding](self->_emojiGraphicsTraits, "inputViewRightMostPadding");
    objc_msgSend(v13, "setInsets:", 0.0, v15, 0.0, v16);
  }
  v17 = objc_msgSend(v11, "section");
  v18 = -[UIKeyboardEmojiCollectionInputView emojiCategoryTypeForSection:](self, "emojiCategoryTypeForSection:", v17);
  if (v17 || !-[UIKeyboardEmojiCollectionInputView isSearching](self, "isSearching"))
  {
    +[UIKeyboardEmojiCategory displayName:](UIKeyboardEmojiCategory, "displayName:", v18);
    v19 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    _UILocalizedStringInSystemLanguage(CFSTR("Results"), CFSTR("Results"));
    v19 = objc_claimAutoreleasedReturnValue();
  }
  v20 = (void *)v19;
  objc_msgSend(v13, "setHeaderName:", v19);
  -[UIKeyboardEmojiCollectionView emojiGraphicsTraits](self->_collectionView, "emojiGraphicsTraits");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "categoryHeaderFontSize");
  objc_msgSend(v13, "setHeaderFontSize:");

  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "_keyboardGraphicsQuality");

  -[UIKBKeyView renderConfig](self, "renderConfig");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "whiteText");
  if (v23 == 10)
  {
    if ((v25 & 1) == 0)
    {
      v26 = 0.51372549;
      v27 = 0.517647059;
      v28 = 0.529411765;
LABEL_17:
      +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", v26, v27, v28, 1.0);
      v29 = objc_claimAutoreleasedReturnValue();
      goto LABEL_18;
    }
  }
  else if ((v25 & 1) == 0)
  {
    v26 = 0.647;
    v27 = 0.651;
    v28 = 0.663;
    goto LABEL_17;
  }
  +[UIColor whiteColor](UIColor, "whiteColor");
  v29 = objc_claimAutoreleasedReturnValue();
LABEL_18:
  v30 = (void *)v29;
  objc_msgSend(v13, "setHeaderTextColor:", v29);

  -[UIKBKeyView renderConfig](self, "renderConfig");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "whiteText");
  v33 = 0.4;
  if (!v32)
    v33 = 1.0;
  objc_msgSend(v13, "setHeaderOpacity:", v33);

  -[UIKBKeyView renderConfig](self, "renderConfig");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setUseVibrantBlend:", objc_msgSend(v34, "whiteText"));

LABEL_21:
  return v13;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  id v8;
  id v9;
  double v10;
  double v11;
  UIKeyboardEmojiGraphicsTraits *emojiGraphicsTraits;
  double v13;
  double v14;
  double v15;
  double v16;
  CGSize result;

  v8 = a3;
  v9 = a4;
  objc_opt_class();
  v10 = 0.0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = 0.0;
    if (!objc_msgSend(v9, "scrollDirection"))
    {
      emojiGraphicsTraits = self->_emojiGraphicsTraits;
      if (emojiGraphicsTraits && !a5 && emojiGraphicsTraits->_isFirstPartyStickers)
      {
        v10 = *MEMORY[0x1E0C9D820];
        v11 = *(double *)(MEMORY[0x1E0C9D820] + 8);
      }
      else
      {
        objc_msgSend(v8, "bounds");
        v10 = v15;
        -[UIKeyboardEmojiGraphicsTraits categoryHeaderHeight](self->_emojiGraphicsTraits, "categoryHeaderHeight");
        v11 = v16;
      }
    }
  }
  else
  {
    v11 = 0.0;
  }

  v13 = v10;
  v14 = v11;
  result.height = v14;
  result.width = v13;
  return result;
}

- (BOOL)showingRecents
{
  void *v2;
  char v3;

  +[UIKeyboardEmojiPreferences sharedInstance](UIKeyboardEmojiPreferences, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldShowRecents");

  return v3;
}

- (int64_t)emojiCategoryTypeForSection:(int64_t)a3
{
  _BOOL4 v5;
  uint64_t v6;

  if (!-[UIKeyboardEmojiCollectionInputView showingRecents](self, "showingRecents"))
  {
    v5 = -[UIKeyboardEmojiCollectionInputView isSearching](self, "isSearching");
    v6 = a3 > 0 && v5;
    a3 -= v6;
  }
  return +[UIKeyboardEmojiCategory categoryTypeForCategoryIndex:](UIKeyboardEmojiCategory, "categoryTypeForCategoryIndex:", a3);
}

- (BOOL)handleKeyEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  UIKBTree *selectedPopupKey;

  v4 = a3;
  if (objc_msgSend(v4, "keyCode"))
  {
    -[UIKeyboardEmojiCollectionInputView emojiSearchField](self, "emojiSearchField");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "markedTextRange");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      if ((objc_msgSend(v4, "keyCode") == 44 || objc_msgSend(v4, "keyCode") == 40)
        && -[UIKeyboardEmojiCollectionInputView handleSelectionEvent:](self, "handleSelectionEvent:", v4))
      {
        goto LABEL_13;
      }
      if (self->_showingVariants)
      {
        selectedPopupKey = self->_selectedPopupKey;
        if (selectedPopupKey)
        {
          if (-[UIKBTree variantType](selectedPopupKey, "variantType") == 12
            || -[UIKBTree variantType](self->_selectedPopupKey, "variantType") == 13)
          {
            if (-[UIKeyboardEmojiCollectionInputView handleKeyInputForFamilySelector:](self, "handleKeyInputForFamilySelector:", v4))
            {
LABEL_13:
              v7 = 1;
              goto LABEL_4;
            }
          }
          else if (-[UIKeyboardEmojiCollectionInputView handleKeyInputForVariantSelector:](self, "handleKeyInputForVariantSelector:", v4))
          {
            goto LABEL_13;
          }
        }
      }
      v7 = -[UIKeyboardEmojiCollectionInputView handleKeyInputForCollectionViewNavigation:](self, "handleKeyInputForCollectionViewNavigation:", v4);
      goto LABEL_4;
    }
  }
  v7 = 0;
LABEL_4:

  return v7;
}

- (BOOL)handleKeyInputForVariantSelector:(id)a3
{
  id v4;
  unint64_t selectedVariant;
  void *v6;
  unint64_t v7;
  int64_t v8;
  void *v9;
  BOOL v10;
  void *v11;
  UIKBTree *v12;
  int64_t v13;
  void *v14;
  void *v15;
  int v16;
  int64_t v17;
  int64_t v18;
  BOOL v19;
  int64_t v20;
  void *v21;
  UIKBTree *selectedPopupKey;
  void *v23;
  void *v24;
  void *v25;
  int v26;

  v4 = a3;
  if (objc_msgSend(v4, "modifiersEqual:", 0))
  {
    switch(-[UIKeyboardEmojiCollectionInputView keyCodeForCurrentEnvironmentFromKeyCode:](self, "keyCodeForCurrentEnvironmentFromKeyCode:", objc_msgSend(v4, "keyCode")))
    {
      case 'O':
        if (-[UIKBTree selectedVariantIndex](self->_selectedPopupKey, "selectedVariantIndex") == 0x7FFFFFFFFFFFFFFFLL
          || (selectedVariant = self->_selectedVariant,
              -[UIKBTree subtrees](self->_selectedPopupKey, "subtrees"),
              v6 = (void *)objc_claimAutoreleasedReturnValue(),
              v7 = objc_msgSend(v6, "count") - 1,
              v6,
              selectedVariant >= v7))
        {
          v8 = 0;
        }
        else
        {
          v8 = self->_selectedVariant + 1;
        }
        self->_selectedVariant = v8;
        -[UIKBTree subtrees](self->_selectedPopupKey, "subtrees");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectAtIndex:", self->_selectedVariant);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "interactionType");

        v17 = self->_selectedVariant;
        if (v16)
          goto LABEL_25;
        ++v17;
        goto LABEL_24;
      case 'P':
        if (-[UIKBTree selectedVariantIndex](self->_selectedPopupKey, "selectedVariantIndex") == 0x7FFFFFFFFFFFFFFFLL)
        {
          self->_selectedVariant = 0;
        }
        else
        {
          v18 = self->_selectedVariant;
          v19 = v18 < 1;
          v20 = v18 - 1;
          if (v19)
          {
            -[UIKBTree subtrees](self->_selectedPopupKey, "subtrees");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            self->_selectedVariant = objc_msgSend(v23, "count") - 1;

          }
          else
          {
            self->_selectedVariant = v20;
          }
        }
        -[UIKBTree subtrees](self->_selectedPopupKey, "subtrees");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "objectAtIndex:", self->_selectedVariant);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "interactionType");

        v17 = self->_selectedVariant;
        if (!v26)
        {
          --v17;
LABEL_24:
          self->_selectedVariant = v17;
        }
LABEL_25:
        -[UIKBTree setSelectedVariantIndex:](self->_selectedPopupKey, "setSelectedVariantIndex:", v17);
        -[UIKeyboardEmojiCollectionInputView hitTestResponder](self, "hitTestResponder");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v21;
        selectedPopupKey = self->_selectedPopupKey;
        goto LABEL_26;
      case 'Q':
        -[UIKeyboardEmojiCollectionInputView hitTestResponder](self, "hitTestResponder");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "updateState:forKey:", 2, self->_selectedPopupKey);

        self->_showingVariants = 0;
        v12 = self->_selectedPopupKey;
        self->_selectedPopupKey = 0;

        -[UIKeyboardEmojiCollectionInputView selectedIndexPath](self, "selectedIndexPath");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIKeyboardEmojiCollectionInputView updateHighlightForIndexPath:scrollIfNeeded:animateScroll:](self, "updateHighlightForIndexPath:scrollIfNeeded:animateScroll:", v9, 0, 0);
        goto LABEL_27;
      case 'R':
        if (-[UIKBTree selectedVariantIndex](self->_selectedPopupKey, "selectedVariantIndex") == 0x7FFFFFFFFFFFFFFFLL)
          v13 = 0;
        else
          v13 = -[UIKBTree selectedVariantIndex](self->_selectedPopupKey, "selectedVariantIndex");
        self->_selectedVariant = v13;
        -[UIKBTree setSelectedVariantIndex:](self->_selectedPopupKey, "setSelectedVariantIndex:");
        -[UIKeyboardEmojiCollectionInputView hitTestResponder](self, "hitTestResponder");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v21;
        selectedPopupKey = self->_selectedPopupKey;
LABEL_26:
        objc_msgSend(v21, "updateState:forKey:", 16, selectedPopupKey);
LABEL_27:
        v10 = 1;
        break;
      default:
        if (!self->_selectedPopupKey)
          goto LABEL_8;
        -[UIKeyboardEmojiCollectionInputView hitTestResponder](self, "hitTestResponder");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "updateState:forKey:", 2, self->_selectedPopupKey);
        v10 = 0;
        break;
    }

  }
  else
  {
LABEL_8:
    v10 = 0;
  }

  return v10;
}

- (BOOL)handleKeyInputForCollectionViewNavigation:(id)a3
{
  id v4;
  BOOL v5;
  int v7;
  int v8;
  int v9;
  int v10;
  UICollectionViewScrollDirection v11;
  UIUserInterfaceLayoutDirection v12;
  int v13;
  int v14;
  int v15;
  int v16;
  char v17;
  void *v18;
  char v19;
  void *v20;
  UIKeyboardEmojiCollectionInputView *v21;
  char v22;
  uint64_t v23;
  void *v24;
  unint64_t v25;
  UIKeyboardEmojiCollectionInputView *v26;
  id *p_collectionView;
  UIKeyboardEmojiCollectionView *collectionView;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  UIKeyboardEmojiCollectionView **v41;
  uint64_t v42;
  _BOOL4 v43;
  unint64_t v44;
  uint64_t v45;
  char v46;
  uint64_t v47;
  unint64_t v48;
  int v49;
  int v50;
  int v51;
  uint64_t v52;
  uint64_t v53;
  _BOOL4 v54;
  _BOOL4 v55;
  uint64_t v56;
  unint64_t v57;
  int v58;
  int v59;
  char v60;
  int v61;
  unint64_t v62;
  unint64_t v63;
  unint64_t v64;
  unint64_t v65;
  uint64_t v66;
  id *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  _BOOL4 v71;
  _BOOL4 v72;
  uint64_t v73;
  _BOOL4 v74;
  BOOL v75;
  uint64_t v76;
  unint64_t v77;
  unint64_t v78;
  unint64_t v79;
  uint64_t v80;
  unint64_t v81;
  unint64_t v82;
  unint64_t v83;
  unint64_t v84;
  int64_t v85;
  void *v86;
  void *v87;
  uint64_t v88;
  void *v89;
  int v90;
  void *v91;
  uint64_t v92;
  void *v93;
  void *v94;
  int v95;
  void *v96;
  id *v97;
  unint64_t v98;
  int v99;
  int v100;
  unint64_t v101;
  unint64_t v102;

  v4 = a3;
  if ((objc_msgSend(v4, "unmodifiedKeyCodeEquals:", 44) & 1) != 0
    || (objc_msgSend(v4, "unmodifiedKeyCodeEquals:", 158) & 1) != 0)
  {
    goto LABEL_3;
  }
  if ((objc_msgSend(v4, "unmodifiedKeyCodeEquals:", 79) & 1) != 0)
    v7 = 1;
  else
    v7 = objc_msgSend(v4, "equalsKeyCode:modifiers:", 79, 0x100000);
  if ((objc_msgSend(v4, "unmodifiedKeyCodeEquals:", 80) & 1) != 0)
    v8 = 1;
  else
    v8 = objc_msgSend(v4, "equalsKeyCode:modifiers:", 80, 0x100000);
  if ((objc_msgSend(v4, "unmodifiedKeyCodeEquals:", 82) & 1) != 0)
    v9 = 1;
  else
    v9 = objc_msgSend(v4, "equalsKeyCode:modifiers:", 82, 0x100000);
  if ((objc_msgSend(v4, "unmodifiedKeyCodeEquals:", 81) & 1) != 0)
    v10 = 1;
  else
    v10 = objc_msgSend(v4, "equalsKeyCode:modifiers:", 81, 0x100000);
  v11 = -[UICollectionViewFlowLayout scrollDirection](self->_flowLayout, "scrollDirection");
  v12 = -[UIView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
  if (v12 == UIUserInterfaceLayoutDirectionRightToLeft)
    v13 = v7;
  else
    v13 = v8;
  if (v12 == UIUserInterfaceLayoutDirectionRightToLeft)
    v7 = v8;
  if (v11)
    v14 = v13;
  else
    v14 = v9;
  if (v11)
    v15 = v7;
  else
    v15 = v10;
  v100 = v15;
  if (v11)
    v16 = v9;
  else
    v16 = v13;
  if (v11)
    v17 = v10;
  else
    v17 = v7;
  -[UIKeyboardEmojiCollectionInputView selectedIndexPath](self, "selectedIndexPath");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    v96 = v18;
    v19 = v16;
    -[UIKeyboardEmojiCollectionInputView selectedIndexPath](self, "selectedIndexPath");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = self;
    v22 = v17;
    v23 = objc_msgSend(v20, "section");

    -[UIKeyboardEmojiCollectionInputView selectedIndexPath](v21, "selectedIndexPath");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "item");

    v26 = v21;
    p_collectionView = (id *)&v21->_collectionView;
    collectionView = v21->_collectionView;
    v29 = v23;
    v30 = -[UICollectionView numberOfItemsInSection:](collectionView, "numberOfItemsInSection:", v23);
    if ((v22 & 1) != 0)
    {
      v31 = v25;
      v99 = v14;
      if (v25 >= v30 - 1)
      {
        v32 = 0;
        if (v23 < objc_msgSend(*p_collectionView, "numberOfSections") - 1)
        {
          v31 = 0;
          v29 = v23 + 1;
        }
      }
      else
      {
        v32 = 0;
        v31 = v25 + 1;
      }
      v46 = 1;
      v45 = 1;
      self = v26;
      goto LABEL_142;
    }
    v98 = v25;
    if (v11)
      v42 = 5;
    else
      v42 = 8;
    if ((v19 & 1) != 0)
    {
      self = v26;
      v43 = -[UIKeyboardEmojiCollectionInputView _shouldShowRecentlyUsedMedia](v26, "_shouldShowRecentlyUsedMedia");
      v44 = v29 < 2 && v43;
      v31 = v25;
      if (v25 > v44)
      {
        v32 = 0;
        v31 = v25 - 1;
        v99 = 1;
        v45 = 1;
        v46 = v100;
LABEL_142:
        if (!-[UIKeyboardEmojiCollectionInputView isSearching](self, "isSearching") || v29)
          goto LABEL_152;
        -[UIKeyboardEmojiCollectionInputView searchResults](self, "searchResults");
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        v90 = v31 < (unint64_t)objc_msgSend(v89, "count");

        if ((v90 & 1) == 0)
          v31 = 0;
        v29 = ~v90 & 1;
        if (((v90 | v46) & 1) != 0 || ((v99 ^ 1) & 1) != 0)
          goto LABEL_152;
        -[UIKeyboardEmojiCollectionInputView searchResults](self, "searchResults");
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        v92 = objc_msgSend(v91, "count");

        if (v92)
        {
          -[UIKeyboardEmojiCollectionInputView searchResults](self, "searchResults");
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = objc_msgSend(v93, "count") - 1;

          v29 = 0;
LABEL_152:
          objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v31, v29);
          v94 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIKeyboardEmojiCollectionInputView updateHighlightForIndexPath:scrollIfNeeded:animateScroll:](self, "updateHighlightForIndexPath:scrollIfNeeded:animateScroll:", v94, v45, v45 & v32);

          v5 = 1;
          goto LABEL_4;
        }
        v31 = 0;
LABEL_151:
        v29 = 1;
        goto LABEL_152;
      }
      v56 = v29 - 1;
      v46 = v100;
      if (v29 >= 1)
      {
        v32 = 0;
        v31 = objc_msgSend(*p_collectionView, "numberOfItemsInSection:", v29 - 1) - 1;
        v99 = 1;
        v45 = 1;
LABEL_80:
        v29 = v56;
        goto LABEL_142;
      }
      v32 = 0;
      goto LABEL_94;
    }
    v47 = v42;
    v18 = v96;
    self = v26;
    v41 = (UIKeyboardEmojiCollectionView **)p_collectionView;
    if (v100)
      goto LABEL_61;
  }
  else
  {
    if (-[UIKeyboardEmojiCollectionInputView isSearching](self, "isSearching") && ((v7 | v13) & 1) != 0)
      goto LABEL_3;
    v95 = v16;
    v99 = v14;
    -[UICollectionView indexPathsForVisibleItems](self->_collectionView, "indexPathsForVisibleItems");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "sortedArrayUsingSelector:", sel_compare_);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v34, "firstObject");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v35, "section");
    v36 = objc_msgSend(v35, "item");
    if (!(v29 | v36))
      v36 = -[UIKeyboardEmojiCollectionInputView _shouldShowRecentlyUsedMedia](self, "_shouldShowRecentlyUsedMedia");
    v98 = v36;
    if (-[UIKeyboardEmojiCollectionInputView isSearching](self, "isSearching"))
    {
      -[UIKeyboardEmojiCollectionInputView searchResults](self, "searchResults");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = v34;
      v39 = objc_msgSend(v37, "count");

      v75 = v39 == 0;
      v34 = v38;
      v36 = v98;
      if (v75)
        v29 = 1;
    }
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v36, v29);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardEmojiCollectionInputView setSelectedIndexPath:](self, "setSelectedIndexPath:", v40);

    v41 = &self->_collectionView;
    v30 = -[UICollectionView numberOfItemsInSection:](self->_collectionView, "numberOfItemsInSection:", v29);
    if ((v17 & 1) != 0)
    {
      v32 = 0;
LABEL_71:
      v46 = 1;
LABEL_72:
      v45 = 1;
LABEL_77:
      v31 = v98;
      goto LABEL_142;
    }
    v47 = 8;
    if (v11)
      v47 = 5;
    if (v95)
    {
      -[UIKeyboardEmojiCollectionInputView _shouldShowRecentlyUsedMedia](self, "_shouldShowRecentlyUsedMedia");
      v32 = 0;
      v99 = 1;
      v45 = 1;
      v46 = v100;
      goto LABEL_77;
    }
    v42 = 0;
    v14 = v99;
    if (v100)
    {
LABEL_61:
      v48 = v30;
      v101 = v47;
      v99 = v14;
      v97 = (id *)v41;
      v49 = !-[UIScrollView isScrollAnimating](*v41, "isScrollAnimating");
      v50 = objc_msgSend(v4, "modifiersEqual:", 0x100000);
      v51 = v50;
      v52 = 40;
      if (v11 == UICollectionViewScrollDirectionVertical)
        v52 = 56;
      v32 = v50 | v49;
      if (v50)
        v53 = v52;
      else
        v53 = v42;
      v54 = -[UIKeyboardEmojiCollectionInputView _shouldShowRecentlyUsedMedia](self, "_shouldShowRecentlyUsedMedia");
      if (v29)
        v55 = 0;
      else
        v55 = v54;
      if (v18 || v51)
      {
        v57 = v53 + v98 - v48;
        if (v53 + v98 < v48)
        {
          v46 = 1;
          v45 = 1;
          v31 = v53 + v98;
          goto LABEL_142;
        }
        v56 = v29 + 1;
        if (v29 + 1 < objc_msgSend(*v97, "numberOfSections"))
        {
          v62 = v101;
          v63 = v48 % v101;
          if (v55)
            v62 = 0;
          v64 = v63 - v62;
          if (v63)
            v65 = v64;
          else
            v65 = 0;
          v66 = v65 + v57;
          if ((uint64_t)(v65 + v57) >= objc_msgSend(*v97, "numberOfItemsInSection:", v56) || v66 < 0)
            v66 = v98 % v101;
          if (v55)
          {
            if (v66)
              v31 = v66 - 1;
            else
              v31 = v98 % v101;
            -[UIKeyboardEmojiCollectionInputView isSearching](self, "isSearching");
            v45 = 1;
            goto LABEL_151;
          }
          v46 = 1;
          v45 = 1;
          v31 = v66;
          goto LABEL_80;
        }
        v31 = v48 - 1;
        v46 = 1;
LABEL_141:
        v45 = 1;
        goto LABEL_142;
      }
      goto LABEL_71;
    }
  }
  if (v14)
  {
    v102 = v47;
    v58 = !-[UIScrollView isScrollAnimating](*v41, "isScrollAnimating");
    v59 = objc_msgSend(v4, "modifiersEqual:", 0x100000);
    v32 = v59 | v58;
    if (v18 || v59)
    {
      v67 = (id *)v41;
      v68 = 40;
      if (v11 == UICollectionViewScrollDirectionVertical)
        v68 = 56;
      if (v59)
        v69 = v68;
      else
        v69 = v102;
      v70 = v98 - v69;
      v71 = -[UIKeyboardEmojiCollectionInputView _shouldShowRecentlyUsedMedia](self, "_shouldShowRecentlyUsedMedia");
      if (v29)
        v31 = 0;
      else
        v31 = v71;
      if (v70 >= v31)
      {
        v46 = 0;
        v99 = 1;
        v45 = 1;
        v31 = v70;
        goto LABEL_142;
      }
      if (v29 >= 1)
      {
        v72 = v71;
        v73 = objc_msgSend(*v67, "numberOfItemsInSection:", v29 - 1);
        v74 = v29 == 1;
        v75 = !v74 || !v72;
        if (v74 && v72)
          v76 = 1;
        else
          v76 = v31;
        v77 = v102 + v73 / v102 * v102 - v73;
        if (!v75)
          v77 = 0;
        v78 = v77 + v73;
        if ((uint64_t)(v78 + v70) >= v73)
          v79 = v102;
        else
          v79 = 0;
        v80 = v78 + v70 - v79;
        v81 = v78 + v98;
        v82 = v79 + v69;
        v46 = 0;
        if (v76 <= v80)
          v76 = v80;
        v83 = v76 + v82;
        v75 = v83 == v81;
        v84 = (v83 - v81 - (v83 != v81)) / v102;
        if (!v75)
          ++v84;
        v31 = v81 - v82 + v84 * v102;
        v99 = 1;
        v45 = 1;
        --v29;
        goto LABEL_142;
      }
      v46 = 0;
LABEL_94:
      v99 = 1;
      goto LABEL_141;
    }
    v46 = 0;
    v99 = 1;
    goto LABEL_72;
  }
  v60 = objc_msgSend(v4, "unmodifiedKeyCodeEquals:", 43);
  v61 = objc_msgSend(v4, "equalsKeyCode:modifiers:", 43, 0x20000);
  if ((v60 & 1) != 0 || v61)
  {
    if (v61)
    {
      if (v29 <= 0)
      {
        v46 = 0;
        v99 = 0;
        v32 = 0;
        v29 = 0;
        v31 = -[UIKeyboardEmojiCollectionInputView _shouldShowRecentlyUsedMedia](self, "_shouldShowRecentlyUsedMedia");
        goto LABEL_141;
      }
      --v29;
    }
    else
    {
      if (v29 >= -[UICollectionView numberOfSections](*v41, "numberOfSections") - 1)
      {
        v29 = -[UICollectionView numberOfSections](*v41, "numberOfSections") - 1;
        v88 = -[UICollectionView numberOfItemsInSection:](*v41, "numberOfItemsInSection:", v29);
        v46 = 0;
        v99 = 0;
        v32 = 0;
        v31 = v88 - 1;
        goto LABEL_141;
      }
      ++v29;
    }
    v85 = -[UIKeyboardEmojiCollectionInputView emojiCategoryTypeForSection:](self, "emojiCategoryTypeForSection:", v29);
    -[UIKeyboardEmojiKeyView emojiKeyManager](self, "emojiKeyManager");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "reloadForCategory:withSender:", v85, self);

    -[UIKeyboardEmojiCollectionInputView updateToCategory:](self, "updateToCategory:", v85);
    -[UIKeyboardEmojiCollectionInputView category](self, "category");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v87, "lastVisibleFirstEmojiIndex");

    v46 = 0;
    v99 = 0;
    v45 = 0;
    v32 = 0;
    if (!(v31 | v29))
    {
      v29 = 0;
      v31 = -[UIKeyboardEmojiCollectionInputView _shouldShowRecentlyUsedMedia](self, "_shouldShowRecentlyUsedMedia");
    }
    goto LABEL_142;
  }
LABEL_3:
  v5 = 0;
LABEL_4:

  return v5;
}

- (BOOL)handleKeyInputForFamilySelector:(id)a3
{
  id v4;
  int v5;
  void *v6;
  void *v7;
  unint64_t currentVariantRow;
  int64_t v9;
  void *v10;
  int64_t selectedVariant;
  int64_t v12;
  int64_t v13;
  int64_t v14;
  unint64_t v15;
  int64_t v16;
  int64_t v17;
  int64_t v18;
  int64_t v19;
  void *v20;
  UIKBTree *selectedPopupKey;
  void *v22;
  int64_t v23;
  void *v24;
  void *v25;
  BOOL v27;
  int64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  void *v33;
  int64_t v34;
  void *v35;
  void *v36;
  unint64_t v37;
  void *v38;
  unint64_t v39;
  void *v40;
  int64_t v41;
  id obj;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "modifiersEqual:", 0);
  if (v5)
  {
    -[UIKBTree selectedVariantIndices](self->_selectedPopupKey, "selectedVariantIndices");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "mutableCopy");

    if (!v7)
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:", &unk_1E1A94118);
    currentVariantRow = self->_currentVariantRow;
    if (currentVariantRow <= objc_msgSend(v7, "count") - 1)
    {
      v9 = self->_currentVariantRow;
    }
    else
    {
      v9 = 0;
      self->_currentVariantRow = 0;
    }
    objc_msgSend(v7, "objectAtIndex:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    self->_selectedVariant = objc_msgSend(v10, "integerValue");

    switch(-[UIKeyboardEmojiCollectionInputView keyCodeForCurrentEnvironmentFromKeyCode:](self, "keyCodeForCurrentEnvironmentFromKeyCode:", objc_msgSend(v4, "keyCode")))
    {
      case 'O':
        selectedVariant = self->_selectedVariant;
        if (selectedVariant == 0x7FFFFFFFFFFFFFFFLL)
          v12 = 0;
        else
          v12 = selectedVariant + 1;
        goto LABEL_25;
      case 'P':
        v13 = self->_selectedVariant;
        if (v13 == 0x7FFFFFFFFFFFFFFFLL)
        {
          v12 = 0;
        }
        else
        {
          if (v13 < 1)
            goto LABEL_26;
          v12 = v13 - 1;
        }
LABEL_25:
        self->_selectedVariant = v12;
LABEL_26:
        v23 = self->_currentVariantRow;
        v24 = (void *)MEMORY[0x1E0CB37E8];
        goto LABEL_27;
      case 'Q':
        v14 = -[UIKBTree popupDirection](self->_selectedPopupKey, "popupDirection");
        v15 = self->_currentVariantRow;
        if (v15 < objc_msgSend(v7, "count")
          && (self->_selectedVariant != 0x7FFFFFFFFFFFFFFFLL
           || -[UIKBTree popupDirection](self->_selectedPopupKey, "popupDirection") == 2))
        {
          v16 = -[UIKBTree popupDirection](self->_selectedPopupKey, "popupDirection");
          v17 = self->_currentVariantRow;
          if (v16 == 2 && !v17)
          {
            if (self->_selectedVariant == 0x7FFFFFFFFFFFFFFFLL)
            {
              v17 = -1;
              self->_currentVariantRow = -1;
            }
            else
            {
              v17 = 0;
            }
          }
          if (v17 == objc_msgSend(v7, "count") - 1)
            objc_msgSend(v7, "addObject:", &unk_1E1A98C88);
          ++self->_currentVariantRow;
          objc_msgSend(v7, "objectAtIndex:");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          self->_selectedVariant = objc_msgSend(v33, "integerValue");

          if (self->_selectedVariant == 0x7FFFFFFFFFFFFFFFLL)
          {
            self->_selectedVariant = 0;
            v34 = self->_currentVariantRow;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 0);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "replaceObjectAtIndex:withObject:", v34, v35);

          }
          -[UIKBTree setSelectedVariantIndices:](self->_selectedPopupKey, "setSelectedVariantIndices:", v7);
          -[UIKeyboardEmojiCollectionInputView hitTestResponder](self, "hitTestResponder");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "updateState:forKey:", 16, self->_selectedPopupKey);

          if (v14 != 1)
            goto LABEL_30;
          v37 = objc_msgSend(v7, "count");
          -[UIKBTree selectedVariantIndices](self->_selectedPopupKey, "selectedVariantIndices");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = objc_msgSend(v38, "count");

          if (v37 <= v39)
            goto LABEL_30;
        }
        goto LABEL_22;
      case 'R':
        v18 = -[UIKBTree popupDirection](self->_selectedPopupKey, "popupDirection");
        v19 = self->_currentVariantRow;
        if (v18 == 2 && !v19)
        {
LABEL_22:
          -[UIKeyboardEmojiCollectionInputView hitTestResponder](self, "hitTestResponder");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "updateState:forKey:", 2, self->_selectedPopupKey);

          self->_showingVariants = 0;
          selectedPopupKey = self->_selectedPopupKey;
          self->_selectedPopupKey = 0;

          -[UIKeyboardEmojiCollectionInputView selectedIndexPath](self, "selectedIndexPath");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIKeyboardEmojiCollectionInputView updateHighlightForIndexPath:scrollIfNeeded:animateScroll:](self, "updateHighlightForIndexPath:scrollIfNeeded:animateScroll:", v22, 0, 0);
          goto LABEL_29;
        }
        v27 = v19 < 1;
        v28 = v19 - 1;
        if (!v27)
        {
          self->_currentVariantRow = v28;
          goto LABEL_55;
        }
        if (-[UIKBTree popupDirection](self->_selectedPopupKey, "popupDirection") != 1)
          goto LABEL_55;
        v41 = -[UIKBTree selectedVariantIndex](self->_selectedPopupKey, "selectedVariantIndex");
        v43 = 0u;
        v44 = 0u;
        v45 = 0u;
        v46 = 0u;
        -[UIKBTree selectedVariantIndices](self->_selectedPopupKey, "selectedVariantIndices");
        obj = (id)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
        if (!v29)
          goto LABEL_43;
        v30 = v29;
        v31 = *(_QWORD *)v44;
        break;
      default:
        goto LABEL_28;
    }
    while (2)
    {
      for (i = 0; i != v30; ++i)
      {
        if (*(_QWORD *)v44 != v31)
          objc_enumerationMutation(obj);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * i), "integerValue") == 0x7FFFFFFFFFFFFFFFLL)
        {

          goto LABEL_54;
        }
      }
      v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
      if (v30)
        continue;
      break;
    }
LABEL_43:

    if (v41)
    {
      self->_currentVariantRow = objc_msgSend(v7, "count");
      objc_msgSend(v7, "addObject:", &unk_1E1A98C88);
      goto LABEL_55;
    }
LABEL_54:
    self->_currentVariantRow = 0;
LABEL_55:
    objc_msgSend(v7, "objectAtIndex:", self->_currentVariantRow);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    self->_selectedVariant = objc_msgSend(v40, "integerValue");

    if (self->_selectedVariant == 0x7FFFFFFFFFFFFFFFLL)
    {
      self->_selectedVariant = 0;
      v23 = self->_currentVariantRow;
      v24 = (void *)MEMORY[0x1E0CB37E8];
LABEL_27:
      objc_msgSend(v24, "numberWithInteger:");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "replaceObjectAtIndex:withObject:", v23, v25);

    }
LABEL_28:
    -[UIKBTree setSelectedVariantIndices:](self->_selectedPopupKey, "setSelectedVariantIndices:", v7);
    -[UIKeyboardEmojiCollectionInputView hitTestResponder](self, "hitTestResponder");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "updateState:forKey:", 16, self->_selectedPopupKey);
LABEL_29:

LABEL_30:
  }

  return v5;
}

- (BOOL)_handleInitialSelectionEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  BOOL v14;

  v4 = a3;
  -[UIKeyboardEmojiCollectionInputView emojiSearchField](self, "emojiSearchField");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "unmodifiedKeyCodeEquals:", 44) && !objc_msgSend(v6, "length")
    || objc_msgSend(v4, "unmodifiedKeyCodeEquals:", 40)
    && objc_msgSend(v6, "length")
    && (-[UIKeyboardEmojiCollectionInputView searchResults](self, "searchResults"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "count"),
        v7,
        v8))
  {
    -[UICollectionView indexPathsForVisibleItems](self->_collectionView, "indexPathsForVisibleItems");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sortedArrayUsingSelector:", sel_compare_);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "firstObject");
    v11 = objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      v14 = 0;
      goto LABEL_15;
    }
    v12 = (void *)v11;
    if (-[UIKeyboardEmojiCollectionInputView _shouldShowRecentlyUsedMedia](self, "_shouldShowRecentlyUsedMedia")
      && !objc_msgSend(v12, "section")
      && !objc_msgSend(v12, "item"))
    {
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 1, 0);
      v13 = objc_claimAutoreleasedReturnValue();

      v12 = (void *)v13;
    }
    -[UIKeyboardEmojiCollectionInputView updateHighlightForIndexPath:scrollIfNeeded:animateScroll:](self, "updateHighlightForIndexPath:scrollIfNeeded:animateScroll:", v12, 0, 0);

  }
  else
  {
    if (!objc_msgSend(v4, "unmodifiedKeyCodeEquals:", 40))
    {
      v14 = 0;
      goto LABEL_17;
    }
    -[UIKeyboardEmojiCollectionInputView setIsSearching:](self, "setIsSearching:", 0);
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dismissEmojiPopoverIfNecessaryWithCompletion:", &__block_literal_global_340);
  }
  v14 = 1;
LABEL_15:

LABEL_17:
  return v14;
}

void __67__UIKeyboardEmojiCollectionInputView__handleInitialSelectionEvent___block_invoke()
{
  id v0;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "clearForwardingInputDelegateAndResign:", 0);

}

- (BOOL)_handleVariantSelectionEvent:(id)a3
{
  id v4;
  int v5;
  int v6;
  char v7;
  UIKeyboardEmojiCollectionView *collectionView;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;

  v4 = a3;
  v5 = objc_msgSend(v4, "unmodifiedKeyCodeEquals:", 44);
  v6 = objc_msgSend(v4, "unmodifiedKeyCodeEquals:", 40);

  v7 = v5 | v6;
  if ((v5 | v6) == 1)
  {
    collectionView = self->_collectionView;
    -[UIKeyboardEmojiCollectionInputView selectedIndexPath](self, "selectedIndexPath");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionView cellForItemAtIndexPath:](collectionView, "cellForItemAtIndexPath:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIKeyboardEmojiCollectionInputView selectedChildSkinToneEmoji:](self, "selectedChildSkinToneEmoji:", self->_selectedPopupKey);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBTree selectedVariantIndices](self->_selectedPopupKey, "selectedVariantIndices");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");

    if (v13)
    {
      -[UIKBTree selectedVariantIndices](self->_selectedPopupKey, "selectedVariantIndices");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "lastObject");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "integerValue");

      if (!v16)
      {
        -[UIKBTree setSelectedVariantIndex:](self->_selectedPopupKey, "setSelectedVariantIndex:", 0);
        -[UIKeyboardEmojiCollectionInputView selectedChildSkinToneEmoji:](self, "selectedChildSkinToneEmoji:", self->_selectedPopupKey);
        v17 = objc_claimAutoreleasedReturnValue();

        v11 = (void *)v17;
      }
    }
    -[UIKBTree setObject:forProperty:](self->_selectedPopupKey, "setObject:forProperty:", v11, CFSTR("UIKBAssociatedEmoji"));
    objc_msgSend(v10, "setEmoji:", v11);
    -[UIKeyboardEmojiCollectionInputView hitTestResponder](self, "hitTestResponder");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "updateState:forKey:", 2, self->_selectedPopupKey);

    -[UIKeyboardEmojiCollectionInputView didInputSubTree:](self, "didInputSubTree:", self->_selectedPopupKey);
    if (v5)
    {
      -[UIKeyboardEmojiCollectionInputView selectedIndexPath](self, "selectedIndexPath");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKeyboardEmojiCollectionInputView updateHighlightForIndexPath:scrollIfNeeded:animateScroll:](self, "updateHighlightForIndexPath:scrollIfNeeded:animateScroll:", v19, 0, 0);

    }
    else if (!v6)
    {
LABEL_9:

      return v7;
    }
    -[UIKeyboardEmojiCollectionInputView insertSelectedEmoji:shouldDismissPopover:](self, "insertSelectedEmoji:shouldDismissPopover:", v11, v5 ^ 1u);
    goto LABEL_9;
  }
  return v7;
}

- (BOOL)_handleBaseKeySelectionEvent:(id)a3
{
  id v4;
  UIKeyboardEmojiCollectionView *collectionView;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  int v11;
  int v12;
  int v13;
  void *v14;
  void *v15;
  unint64_t v16;
  NSObject *v17;
  BOOL v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  int64_t v23;
  void *v24;
  uint64_t v25;
  int v26;
  void *v27;
  void *v28;
  NSObject *v30;
  char v31;
  uint8_t buf[16];
  uint8_t v33[16];

  v4 = a3;
  collectionView = self->_collectionView;
  -[UIKeyboardEmojiCollectionInputView selectedIndexPath](self, "selectedIndexPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionView cellForItemAtIndexPath:](collectionView, "cellForItemAtIndexPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v7, "emoji");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardEmojiCollectionInputView treeForCell:](self, "treeForCell:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v4, "unmodifiedKeyCodeEquals:", 44);
    v11 = objc_msgSend(v4, "equalsKeyCode:modifiers:", 44, 0x80000);
    v12 = objc_msgSend(v4, "unmodifiedKeyCodeEquals:", 40);
    v13 = objc_msgSend(v4, "equalsKeyCode:modifiers:", 40, 0x80000);
    if (-[UIKeyboardEmojiCollectionInputView keySupportsVariants:](self, "keySupportsVariants:", v9))
    {
      v14 = v8;
      -[UIKBKeyView factory](self, "factory");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v15, "popupKeyUsesCustomKeyContentView:", v9))
      {
        if (objc_msgSend(v9, "selectedVariantIndex") == 0x7FFFFFFFFFFFFFFFLL)
        {

LABEL_14:
          self->_currentVariantRow = 0;
          objc_msgSend(v9, "selectedVariantIndices");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = v19;
          v8 = v14;
          if (v19)
          {
            objc_msgSend(v19, "firstObject");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_msgSend(v21, "integerValue");

            if (v22 == 0x7FFFFFFFFFFFFFFFLL)
              v23 = 0;
            else
              v23 = v22;
            self->_selectedVariant = v23;
          }
          objc_msgSend(v7, "setSelected:", 0);
          objc_storeStrong((id *)&self->_selectedPopupKey, v9);
          v18 = 1;
          self->_showingVariants = 1;
          -[UIKeyboardEmojiCollectionInputView hitTestResponder](self, "hitTestResponder");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "updateState:forKey:", 16, v9);

          goto LABEL_31;
        }
        v31 = objc_msgSend(v4, "modifiersEqual:", 0x80000);

        if ((v31 & 1) != 0)
          goto LABEL_14;
      }
      else
      {

      }
      v25 = objc_msgSend(v9, "selectedVariantIndex");
      v26 = v10 | v12;
      if (v25 != 0x7FFFFFFFFFFFFFFFLL)
        v26 = 0;
      v8 = v14;
      if ((v26 | v11 | v13) == 1)
      {
        objc_msgSend(v7, "setSelected:", 0);
        if (objc_msgSend(v9, "selectedVariantIndex") != 0x7FFFFFFFFFFFFFFFLL)
          self->_selectedVariant = objc_msgSend(v9, "selectedVariantIndex");
        objc_storeStrong((id *)&self->_selectedPopupKey, v9);
        v18 = 1;
        self->_showingVariants = 1;
        -[UIKeyboardEmojiCollectionInputView hitTestResponder](self, "hitTestResponder");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "updateState:forKey:", 16, v9);

        goto LABEL_31;
      }
    }
    if (v10)
    {
      -[UIKeyboardEmojiCollectionInputView selectedIndexPath](self, "selectedIndexPath");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKeyboardEmojiCollectionInputView updateHighlightForIndexPath:scrollIfNeeded:animateScroll:](self, "updateHighlightForIndexPath:scrollIfNeeded:animateScroll:", v28, 0, 0);

      -[UIKeyboardEmojiCollectionInputView insertSelectedEmoji:shouldDismissPopover:](self, "insertSelectedEmoji:shouldDismissPopover:", v8, 0);
      v18 = 1;
    }
    else if (v12)
    {
      v18 = 1;
      -[UIKeyboardEmojiCollectionInputView insertSelectedEmoji:shouldDismissPopover:](self, "insertSelectedEmoji:shouldDismissPopover:", v8, 1);
    }
    else
    {
      v18 = 0;
    }
LABEL_31:

    goto LABEL_32;
  }
  if (os_variant_has_internal_diagnostics())
  {
    __UIFaultDebugAssertLog();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v33 = 0;
      _os_log_fault_impl(&dword_185066000, v30, OS_LOG_TYPE_FAULT, "Memoji cell is selected. Unsupported.", v33, 2u);
    }

  }
  else
  {
    v16 = _handleBaseKeySelectionEvent____s_category;
    if (!_handleBaseKeySelectionEvent____s_category)
    {
      v16 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v16, (unint64_t *)&_handleBaseKeySelectionEvent____s_category);
    }
    v17 = *(NSObject **)(v16 + 8);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_185066000, v17, OS_LOG_TYPE_ERROR, "Memoji cell is selected. Unsupported.", buf, 2u);
    }
  }
  v18 = 1;
LABEL_32:

  return v18;
}

- (BOOL)handleSelectionEvent:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  BOOL v7;

  v4 = a3;
  if (objc_msgSend(v4, "modifierFlags") && !objc_msgSend(v4, "modifiersEqual:", 0x80000))
  {
    v7 = 0;
  }
  else
  {
    -[UIKeyboardEmojiCollectionInputView selectedIndexPath](self, "selectedIndexPath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      if (self->_showingVariants)
        v6 = -[UIKeyboardEmojiCollectionInputView _handleVariantSelectionEvent:](self, "_handleVariantSelectionEvent:", v4);
      else
        v6 = -[UIKeyboardEmojiCollectionInputView _handleBaseKeySelectionEvent:](self, "_handleBaseKeySelectionEvent:", v4);
    }
    else
    {
      v6 = -[UIKeyboardEmojiCollectionInputView _handleInitialSelectionEvent:](self, "_handleInitialSelectionEvent:", v4);
    }
    v7 = v6;
  }

  return v7;
}

- (void)updateHighlightForIndexPath:(id)a3 scrollIfNeeded:(BOOL)a4 animateScroll:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL4 v6;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  int64_t v11;
  void *v12;
  void *v13;
  UIKeyboardEmojiCollectionView *collectionView;
  void *v15;
  UIKeyboardEmojiCollectionView *v16;
  void *v17;
  uint64_t v18;
  id v19;

  v5 = a5;
  v6 = a4;
  v19 = a3;
  -[UIKeyboardEmojiCollectionInputView selectedIndexPath](self, "selectedIndexPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "section");
  v10 = objc_msgSend(v19, "section");

  if (v9 != v10)
  {
    v11 = -[UIKeyboardEmojiCollectionInputView emojiCategoryTypeForSection:](self, "emojiCategoryTypeForSection:", objc_msgSend(v19, "section"));
    -[UIKeyboardEmojiKeyView emojiKeyManager](self, "emojiKeyManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "reloadForCategory:withSender:", v11, self);

    +[UIKeyboardEmojiCategory categoryForType:](UIKeyboardEmojiCategory, "categoryForType:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardEmojiCollectionInputView setCategory:](self, "setCategory:", v13);

  }
  -[UIKeyboardEmojiCollectionInputView setSelectedIndexPath:](self, "setSelectedIndexPath:", v19);
  collectionView = self->_collectionView;
  -[UIKeyboardEmojiCollectionInputView selectedIndexPath](self, "selectedIndexPath");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionView selectItemAtIndexPath:animated:scrollPosition:](collectionView, "selectItemAtIndexPath:animated:scrollPosition:", v15, 0, 0);

  if (-[UIKeyboardEmojiCollectionInputView cellShouldScrollWhenSelectedAtIndexPath:](self, "cellShouldScrollWhenSelectedAtIndexPath:", v19)&& v6)
  {
    v16 = self->_collectionView;
    -[UIKeyboardEmojiCollectionInputView selectedIndexPath](self, "selectedIndexPath");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[UICollectionViewFlowLayout scrollDirection](self->_flowLayout, "scrollDirection"))
      v18 = 16;
    else
      v18 = 2;
    -[UICollectionView scrollToItemAtIndexPath:atScrollPosition:animated:](v16, "scrollToItemAtIndexPath:atScrollPosition:animated:", v17, v18, v5);

  }
  -[UIKeyboardEmojiCollectionInputView updateLastSeenItemForIndexPath:](self, "updateLastSeenItemForIndexPath:", v19);

}

- (void)insertSelectedEmoji:(id)a3 shouldDismissPopover:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __CFString **v15;
  void *v16;
  __CFString **v17;
  void *v18;
  UIKBTree *selectedPopupKey;
  id v20;

  v4 = a4;
  v20 = a3;
  -[UIKeyboardEmojiCollectionInputView updatePreferencesForSelectedEmoji:](self, "updatePreferencesForSelectedEmoji:", v20);
  -[UIKeyboardEmojiCollectionInputView emojiSearchInputViewController](self, "emojiSearchInputViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "textDocumentProxy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "emojiString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "insertText:", v8);

  -[UIKeyboardEmojiCollectionInputView emojiSearchField](self, "emojiSearchField");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "text");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "length")
    && (-[UIKeyboardEmojiCollectionInputView selectedIndexPath](self, "selectedIndexPath"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v11, "section"),
        v11,
        !v12))
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "emojiString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = UIKBAnalyticsEmojiSelectionMethodReturnKey;
    if (!v4)
      v17 = UIKBAnalyticsEmojiSelectionMethodSpaceBar;
    objc_msgSend(v14, "emojiSearchWillInsertEmoji:forSearchQuery:selectionMethod:inputType:", v16, v10, *v17, CFSTR("PopoverSearch"));

  }
  else
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    v15 = UIKBAnalyticsEmojiSelectionMethodReturnKey;
    if (!v4)
      v15 = UIKBAnalyticsEmojiSelectionMethodSpaceBar;
    objc_msgSend(v13, "insertedEmojiFromPopover:selectionMethod:", v20, *v15);
  }

  if (v4)
  {
    -[UIKeyboardEmojiCollectionInputView resetSelectionIfNeeded](self, "resetSelectionIfNeeded");
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "dismissEmojiPopoverIfNecessaryWithCompletion:", &__block_literal_global_133_0);

  }
  selectedPopupKey = self->_selectedPopupKey;
  self->_selectedPopupKey = 0;

  self->_showingVariants = 0;
}

void __79__UIKeyboardEmojiCollectionInputView_insertSelectedEmoji_shouldDismissPopover___block_invoke()
{
  id v0;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "clearForwardingInputDelegateAndResign:", 0);

}

- (int64_t)keyCodeForCurrentEnvironmentFromKeyCode:(int64_t)a3
{
  UIUserInterfaceLayoutDirection v4;
  int64_t v5;
  int64_t v6;

  v4 = -[UIView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
  v5 = 80;
  v6 = 79;
  if (a3 != 80)
    v6 = a3;
  if (a3 != 79)
    v5 = v6;
  if (v4 == UIUserInterfaceLayoutDirectionRightToLeft)
    return v5;
  else
    return a3;
}

- (void)updatePreferencesForSelectedEmoji:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  __CFString *v13;

  v4 = a3;
  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastUsedInputModeForCurrentContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "primaryLanguage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), CFSTR("_"));
  v8 = objc_claimAutoreleasedReturnValue();

  if (v8)
    v9 = (const __CFString *)v8;
  else
    v9 = CFSTR("en_US");
  v13 = (__CFString *)v9;
  -[UIKeyboardEmojiKeyView emojiKeyManager](self, "emojiKeyManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "emojiUsed:language:", v4, v13);

  -[UIKeyboardEmojiCollectionInputView selectedIndexPath](self, "selectedIndexPath");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[UIKeyboardEmojiCollectionInputView selectedIndexPath](self, "selectedIndexPath");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardEmojiCollectionInputView updateLastSeenItemForIndexPath:](self, "updateLastSeenItemForIndexPath:", v12);

  }
}

- (void)updateLastSeenItemForIndexPath:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  +[UIKeyboardEmojiCategory categoryForType:](UIKeyboardEmojiCategory, "categoryForType:", -[UIKeyboardEmojiCollectionInputView emojiCategoryTypeForSection:](self, "emojiCategoryTypeForSection:", objc_msgSend(v4, "section")));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardEmojiCollectionInputView setCategory:](self, "setCategory:", v5);

  v6 = objc_msgSend(v4, "item");
  -[UIKeyboardEmojiCollectionInputView category](self, "category");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLastVisibleFirstEmojiIndex:", v6);

  -[UIKeyboardEmojiCollectionInputView category](self, "category");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardEmojiKeyView emojiKeyManager](self, "emojiKeyManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setLastViewedCategory:", v9);

}

- (void)resetSelectionIfNeeded
{
  void *v3;
  UIKeyboardEmojiCollectionView *collectionView;
  void *v5;
  NSIndexPath *selectedIndexPath;
  UIKBTree *selectedPopupKey;

  -[UIKeyboardEmojiCollectionInputView selectedIndexPath](self, "selectedIndexPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    collectionView = self->_collectionView;
    -[UIKeyboardEmojiCollectionInputView selectedIndexPath](self, "selectedIndexPath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionView deselectItemAtIndexPath:animated:](collectionView, "deselectItemAtIndexPath:animated:", v5, 0);

    selectedIndexPath = self->_selectedIndexPath;
    self->_selectedIndexPath = 0;

    selectedPopupKey = self->_selectedPopupKey;
    self->_selectedPopupKey = 0;

    self->_showingVariants = 0;
  }
}

- (BOOL)keySupportsVariants:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  v4 = objc_msgSend(v3, "variantType") == 10
    || objc_msgSend(v3, "variantType") == 12
    || objc_msgSend(v3, "variantType") == 11
    || objc_msgSend(v3, "variantType") == 13;

  return v4;
}

- (BOOL)cellShouldScrollWhenSelectedAtIndexPath:(id)a3
{
  UIKeyboardEmojiCollectionView *collectionView;
  id v5;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v10;
  UIKeyboardEmojiCollectionView *v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;

  collectionView = self->_collectionView;
  v5 = a3;
  -[UIView bounds](collectionView, "bounds");
  v22 = CGRectInset(v21, 10.0, 0.0);
  x = v22.origin.x;
  y = v22.origin.y;
  width = v22.size.width;
  height = v22.size.height;
  -[UICollectionView cellForItemAtIndexPath:](self->_collectionView, "cellForItemAtIndexPath:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = self->_collectionView;
  objc_msgSend(v10, "bounds");
  -[UIView convertRect:fromView:](v11, "convertRect:fromView:", v10);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v23.origin.x = x;
  v23.origin.y = y;
  v23.size.width = width;
  v23.size.height = height;
  v25.origin.x = v13;
  v25.origin.y = v15;
  v25.size.width = v17;
  v25.size.height = v19;
  v26 = CGRectIntersection(v23, v25);
  v24.origin.x = v13;
  v24.origin.y = v15;
  v24.size.width = v17;
  v24.size.height = v19;
  LOBYTE(v11) = !CGRectEqualToRect(v24, v26);

  return (char)v11;
}

- (void)emojiSearchTextFieldWillBecomeActive:(id)a3
{
  void *v4;
  void *v5;

  -[UIKeyboardEmojiCollectionInputView emojiSearchField](self, "emojiSearchField", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBKeyView renderConfig](self, "renderConfig");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setRenderConfig:", v5);

  -[UIKeyboardEmojiCollectionView setIsInSearchPopover:](self->_collectionView, "setIsInSearchPopover:", 1);
}

- (void)emojiSearchTextFieldDidBecomeActive:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "changePreferredEmojiSearchInputModeForInputDelegate:", v3);

}

- (void)emojiSearchTextFieldWillBecomeInactive:(id)a3
{
  id v4;

  -[UIKeyboardEmojiCollectionInputView setIsSearching:](self, "setIsSearching:", 0);
  -[UIKeyboardEmojiCollectionView setIsInSearchPopover:](self->_collectionView, "setIsInSearchPopover:", 0);
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clearForwardingInputDelegateAndResign:", 0);

}

- (void)emojiSearchTextFieldDidBecomeInactive:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateAssistantView");

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("UIKeyboardSwitchedAwayFromEmoji"), 0);

  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hardwareInputMode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCurrentInputMode:", v6);

}

- (void)emojiSearchTextFieldWillClear:(id)a3
{
  -[UIKeyboardEmojiCollectionInputView setIsSearching:](self, "setIsSearching:", 0);
  -[UIKeyboardEmojiCollectionInputView setSearchResults:](self, "setSearchResults:", MEMORY[0x1E0C9AA60]);
  -[UIKeyboardEmojiCollectionInputView resetSelectionIfNeeded](self, "resetSelectionIfNeeded");
}

- (void)emojiSearchTextFieldDidReset:(id)a3
{
  _BOOL4 v4;
  UIKeyboardEmojiCollectionView *collectionView;
  _QWORD v6[5];
  _QWORD v7[5];

  v4 = -[UIKeyboardEmojiCollectionInputView isSearching](self, "isSearching", a3);
  -[UIKeyboardEmojiCollectionInputView setIsSearching:](self, "setIsSearching:", 0);
  -[UIKeyboardEmojiCollectionInputView resetSelectionIfNeeded](self, "resetSelectionIfNeeded");
  if (v4)
  {
    -[UIKeyboardEmojiCollectionInputView setSearchResults:](self, "setSearchResults:", MEMORY[0x1E0C9AA60]);
    if (!-[UIKeyboardEmojiCollectionInputView showingRecents](self, "showingRecents"))
    {
      collectionView = self->_collectionView;
      v6[4] = self;
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __67__UIKeyboardEmojiCollectionInputView_emojiSearchTextFieldDidReset___block_invoke;
      v7[3] = &unk_1E16B1B28;
      v7[4] = self;
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __67__UIKeyboardEmojiCollectionInputView_emojiSearchTextFieldDidReset___block_invoke_2;
      v6[3] = &unk_1E16B3FD8;
      -[UICollectionView performBatchUpdates:completion:](collectionView, "performBatchUpdates:completion:", v7, v6);
    }
  }
}

void __67__UIKeyboardEmojiCollectionInputView_emojiSearchTextFieldDidReset___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 608);
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "deleteSections:", v2);

}

uint64_t __67__UIKeyboardEmojiCollectionInputView_emojiSearchTextFieldDidReset___block_invoke_2(uint64_t a1)
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __67__UIKeyboardEmojiCollectionInputView_emojiSearchTextFieldDidReset___block_invoke_3;
  v2[3] = &unk_1E16B1B28;
  v2[4] = *(_QWORD *)(a1 + 32);
  return +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v2);
}

uint64_t __67__UIKeyboardEmojiCollectionInputView_emojiSearchTextFieldDidReset___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 608), "reloadData");
}

- (void)emojiSearchDidReceiveResults:(id)a3 forExactQuery:(id)a4 autocorrectedQuery:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  int v11;
  void *v12;
  UIKeyboardEmojiCollectionView *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  uint64_t v23;
  void *v24;
  UIKeyboardEmojiCollectionView *collectionView;
  void *v26;
  UIKeyboardEmojiCollectionView *v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  id v31;
  _QWORD v32[5];
  id v33;
  _QWORD aBlock[5];

  v7 = a3;
  if (objc_msgSend(a4, "length"))
  {
    -[UIKeyboardEmojiCollectionInputView emojiSearchField](self, "emojiSearchField");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "text");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "length");

    if (v10)
    {
      if (-[UIKeyboardEmojiCollectionInputView isSearching](self, "isSearching"))
      {
        v11 = 0;
      }
      else
      {
        v11 = !-[UIKeyboardEmojiCollectionInputView showingRecents](self, "showingRecents");
        -[UIKeyboardEmojiCollectionInputView setIsSearching:](self, "setIsSearching:", 1);
        -[UIKeyboardEmojiCollectionInputView updateOffsetForSearchResults](self, "updateOffsetForSearchResults");
      }
      -[UIKeyboardEmojiCollectionInputView resetSelectionIfNeeded](self, "resetSelectionIfNeeded");
      -[UIKeyboardEmojiCollectionInputView searchResults](self, "searchResults");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "count");
      v17 = objc_msgSend(v7, "count");

      if (v16 == v17)
      {
        if (objc_msgSend(v7, "count"))
        {
          objc_msgSend(v7, "firstObject");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIKeyboardEmojiCollectionInputView searchResults](self, "searchResults");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "firstObject");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v18, "isEqual:", v20) ^ 1;

        }
        else
        {
          v21 = 0;
        }
      }
      else
      {
        v21 = 1;
      }
      v22 = (void *)objc_msgSend(v7, "copy");
      -[UIKeyboardEmojiCollectionInputView setSearchResults:](self, "setSearchResults:", v22);

      v23 = MEMORY[0x1E0C809B0];
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __100__UIKeyboardEmojiCollectionInputView_emojiSearchDidReceiveResults_forExactQuery_autocorrectedQuery___block_invoke;
      aBlock[3] = &unk_1E16B1B28;
      aBlock[4] = self;
      v24 = _Block_copy(aBlock);
      v14 = v24;
      if (v11)
      {
        collectionView = self->_collectionView;
        v32[0] = v23;
        v32[1] = 3221225472;
        v32[2] = __100__UIKeyboardEmojiCollectionInputView_emojiSearchDidReceiveResults_forExactQuery_autocorrectedQuery___block_invoke_2;
        v32[3] = &unk_1E16B1D18;
        v32[4] = self;
        v33 = v24;
        -[UICollectionView performBatchUpdates:completion:](collectionView, "performBatchUpdates:completion:", v32, 0);
        v26 = v33;
      }
      else if (v21 && -[UICollectionViewFlowLayout scrollDirection](self->_flowLayout, "scrollDirection"))
      {
        v27 = self->_collectionView;
        v30[0] = v23;
        v30[1] = 3221225472;
        v30[2] = __100__UIKeyboardEmojiCollectionInputView_emojiSearchDidReceiveResults_forExactQuery_autocorrectedQuery___block_invoke_3;
        v30[3] = &unk_1E16B1BF8;
        v31 = v14;
        -[UICollectionView performBatchUpdates:completion:](v27, "performBatchUpdates:completion:", v30, 0);
        v26 = v31;
      }
      else
      {
        v28[0] = v23;
        v28[1] = 3221225472;
        v28[2] = __100__UIKeyboardEmojiCollectionInputView_emojiSearchDidReceiveResults_forExactQuery_autocorrectedQuery___block_invoke_4;
        v28[3] = &unk_1E16B1BF8;
        v29 = v14;
        +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v28);
        v26 = v29;
      }

      goto LABEL_20;
    }
  }
  -[UIKeyboardEmojiCollectionInputView setIsSearching:](self, "setIsSearching:", 0);
  -[UIKeyboardEmojiCollectionInputView resetSelectionIfNeeded](self, "resetSelectionIfNeeded");
  -[UIKeyboardEmojiCollectionInputView setSearchResults:](self, "setSearchResults:", MEMORY[0x1E0C9AA60]);
  if (-[UIKeyboardEmojiCollectionInputView showingRecents](self, "showingRecents"))
  {
    -[UIKeyboardEmojiKeyView emojiKeyManager](self, "emojiKeyManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "reloadForCategory:withSender:", -[UIKeyboardEmojiCollectionInputView emojiCategoryTypeForSection:](self, "emojiCategoryTypeForSection:", 0), self);

    v13 = self->_collectionView;
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionView reloadSections:](v13, "reloadSections:", v14);
LABEL_20:

  }
}

void __100__UIKeyboardEmojiCollectionInputView_emojiSearchDidReceiveResults_forExactQuery_autocorrectedQuery___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "updateOffsetForSearchResults");
  objc_msgSend(*(id *)(a1 + 32), "emojiKeyManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reloadForCategory:withSender:", 0, *(_QWORD *)(a1 + 32));

  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 608);
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reloadSections:", v4);

}

uint64_t __100__UIKeyboardEmojiCollectionInputView_emojiSearchDidReceiveResults_forExactQuery_autocorrectedQuery___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 608);
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "insertSections:", v3);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __100__UIKeyboardEmojiCollectionInputView_emojiSearchDidReceiveResults_forExactQuery_autocorrectedQuery___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __100__UIKeyboardEmojiCollectionInputView_emojiSearchDidReceiveResults_forExactQuery_autocorrectedQuery___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
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
  double Height;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double Width;
  double v32;
  double v33;
  double v34;
  CGSize result;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;

  v7 = a3;
  v8 = a5;
  if (-[UIKeyboardEmojiCollectionInputView isSearching](self, "isSearching"))
  {
    -[UIKeyboardEmojiCollectionInputView searchResults](self, "searchResults");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "count"))
    {

    }
    else
    {
      v10 = objc_msgSend(v8, "section");

      if (!v10)
      {
        -[UIKeyboardEmojiGraphicsTraits emojiKeyWidth](self->_emojiGraphicsTraits, "emojiKeyWidth");
        v18 = v17;
        -[UIKeyboardEmojiGraphicsTraits minimumInteritemSpacing](self->_emojiGraphicsTraits, "minimumInteritemSpacing");
        v20 = (v18 + v19 + 1.0) * 6.0;
        -[UIKeyboardEmojiGraphicsTraits minimumLineSpacing](self->_emojiGraphicsTraits, "minimumLineSpacing");
        v12 = v20 + v21 + v21;
        objc_msgSend(v7, "bounds");
        Height = CGRectGetHeight(v36);
        -[UIKeyboardEmojiGraphicsTraits categoryHeaderHeight](self->_emojiGraphicsTraits, "categoryHeaderHeight");
        v24 = Height - v23;
        -[UIKeyboardEmojiGraphicsTraits bottomPadding](self->_emojiGraphicsTraits, "bottomPadding");
        v14 = v24 - v25;
        goto LABEL_9;
      }
    }
  }
  if (!-[UIKeyboardEmojiCollectionInputView _shouldShowRecentlyUsedMedia](self, "_shouldShowRecentlyUsedMedia")
    || objc_msgSend(v8, "section")
    || objc_msgSend(v8, "item"))
  {
    -[UIKeyboardEmojiGraphicsTraits emojiKeyWidth](self->_emojiGraphicsTraits, "emojiKeyWidth");
    v12 = v11;
    -[UIKeyboardEmojiGraphicsTraits emojiKeyWidth](self->_emojiGraphicsTraits, "emojiKeyWidth");
    v14 = v13;
  }
  else
  {
    objc_msgSend(v7, "bounds");
    v26 = CGRectGetHeight(v37);
    -[UIKeyboardEmojiGraphicsTraits categoryHeaderHeight](self->_emojiGraphicsTraits, "categoryHeaderHeight");
    v28 = v27;
    -[UIKeyboardEmojiGraphicsTraits bottomPadding](self->_emojiGraphicsTraits, "bottomPadding");
    v30 = v29;
    if (-[UICollectionViewFlowLayout scrollDirection](self->_flowLayout, "scrollDirection"))
    {
      v14 = v26 - v28 - v30;
      if (self->_useWideAnimojiCell)
        v12 = v14 + v14;
      else
        v12 = v14;
    }
    else
    {
      objc_msgSend(v7, "bounds");
      Width = CGRectGetWidth(v38);
      -[UIKeyboardEmojiGraphicsTraits inputViewLeftMostPadding](self->_emojiGraphicsTraits, "inputViewLeftMostPadding");
      v33 = Width - v32;
      -[UIKeyboardEmojiGraphicsTraits inputViewRightMostPadding](self->_emojiGraphicsTraits, "inputViewRightMostPadding");
      v12 = v33 - v34;
      objc_msgSend(v7, "bounds");
      v14 = CGRectGetWidth(v39) * 0.166666667;
    }
  }
LABEL_9:

  v15 = v12;
  v16 = v14;
  result.height = v16;
  result.width = v15;
  return result;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  NSInteger v7;
  double v8;
  double v9;
  double v10;
  double v11;
  UICollectionViewScrollDirection v12;
  BOOL v13;
  char v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  NSInteger v24;
  double v25;
  double v26;
  double v27;
  NSInteger v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  UIEdgeInsets result;

  v7 = -[UICollectionView numberOfItemsInSection:](self->_collectionView, "numberOfItemsInSection:", 0, a4);
  -[UIKeyboardEmojiGraphicsTraits sectionOffset](self->_emojiGraphicsTraits, "sectionOffset");
  v9 = v8;
  -[UIKeyboardEmojiGraphicsTraits bottomPadding](self->_emojiGraphicsTraits, "bottomPadding");
  v11 = v10;
  v12 = -[UICollectionViewFlowLayout scrollDirection](self->_flowLayout, "scrollDirection");
  if (a5)
    v13 = 1;
  else
    v13 = v7 <= 0;
  v14 = !v13;
  if (v12 == UICollectionViewScrollDirectionVertical)
  {
    if ((v14 & 1) != 0 || a5 == 1 && !v7)
    {
      -[UIKeyboardEmojiGraphicsTraits topPadding](self->_emojiGraphicsTraits, "topPadding");
      v18 = v21;
      -[UIKeyboardEmojiGraphicsTraits inputViewLeftMostPadding](self->_emojiGraphicsTraits, "inputViewLeftMostPadding");
      v20 = v22;
      -[UIKeyboardEmojiGraphicsTraits inputViewRightMostPadding](self->_emojiGraphicsTraits, "inputViewRightMostPadding");
      v11 = v9;
    }
    else
    {
      v28 = -[UICollectionView numberOfSections](self->_collectionView, "numberOfSections") - 1;
      -[UIKeyboardEmojiGraphicsTraits topPadding](self->_emojiGraphicsTraits, "topPadding");
      v18 = v29;
      -[UIKeyboardEmojiGraphicsTraits inputViewLeftMostPadding](self->_emojiGraphicsTraits, "inputViewLeftMostPadding");
      v20 = v30;
      -[UIKeyboardEmojiGraphicsTraits inputViewRightMostPadding](self->_emojiGraphicsTraits, "inputViewRightMostPadding");
      if (v28 != a5)
        v11 = v9;
    }
    goto LABEL_20;
  }
  if ((v14 & 1) == 0 && (a5 != 1 || v7))
  {
    v24 = -[UICollectionView numberOfSections](self->_collectionView, "numberOfSections") - 1;
    -[UIKeyboardEmojiGraphicsTraits topPadding](self->_emojiGraphicsTraits, "topPadding");
    v26 = v25;
    -[UIKeyboardEmojiGraphicsTraits categoryHeaderHeight](self->_emojiGraphicsTraits, "categoryHeaderHeight");
    v18 = v26 + v27;
    v20 = 0.0;
    if (v24 != a5)
      goto LABEL_21;
    -[UIKeyboardEmojiGraphicsTraits inputViewRightMostPadding](self->_emojiGraphicsTraits, "inputViewRightMostPadding");
LABEL_20:
    v9 = v23;
    goto LABEL_21;
  }
  -[UIKeyboardEmojiGraphicsTraits topPadding](self->_emojiGraphicsTraits, "topPadding");
  v16 = v15;
  -[UIKeyboardEmojiGraphicsTraits categoryHeaderHeight](self->_emojiGraphicsTraits, "categoryHeaderHeight");
  v18 = v16 + v17;
  -[UIKeyboardEmojiGraphicsTraits inputViewLeftMostPadding](self->_emojiGraphicsTraits, "inputViewLeftMostPadding");
  v20 = v19;
LABEL_21:
  v31 = v18;
  v32 = v20;
  v33 = v11;
  v34 = v9;
  result.right = v34;
  result.bottom = v33;
  result.left = v32;
  result.top = v31;
  return result;
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumLineSpacingForSectionAtIndex:(int64_t)a5
{
  id v8;
  id v9;
  double v10;
  double v11;

  v8 = a3;
  v9 = a4;
  if (a5 || !-[UIKeyboardEmojiCollectionInputView _shouldShowRecentlyUsedMedia](self, "_shouldShowRecentlyUsedMedia"))
    -[UIKeyboardEmojiGraphicsTraits minimumLineSpacing](self->_emojiGraphicsTraits, "minimumLineSpacing");
  else
    -[UIKeyboardEmojiGraphicsTraits minimumInteritemSpacing](self->_emojiGraphicsTraits, "minimumInteritemSpacing");
  v11 = v10;

  return v11;
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumInteritemSpacingForSectionAtIndex:(int64_t)a5
{
  id v8;
  id v9;
  double v10;
  double v11;

  v8 = a3;
  v9 = a4;
  if (a5 || !-[UIKeyboardEmojiCollectionInputView _shouldShowRecentlyUsedMedia](self, "_shouldShowRecentlyUsedMedia"))
    -[UIKeyboardEmojiGraphicsTraits minimumInteritemSpacing](self->_emojiGraphicsTraits, "minimumInteritemSpacing");
  else
    -[UIKeyboardEmojiGraphicsTraits minimumLineSpacing](self->_emojiGraphicsTraits, "minimumLineSpacing");
  v11 = v10;

  return v11;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v6;
  _BOOL4 v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v6 = a5;
  if (!self->_hasShownAnimojiCell)
  {
    v10 = v6;
    v7 = -[UIKeyboardEmojiCollectionInputView _shouldShowRecentlyUsedMedia](self, "_shouldShowRecentlyUsedMedia");
    v6 = v10;
    if (v7)
    {
      v8 = objc_msgSend(v10, "item");
      v6 = v10;
      if (!v8)
      {
        v9 = objc_msgSend(v10, "section");
        v6 = v10;
        if (!v9)
        {
          self->_hasShownAnimojiCell = 1;
          ADClientAddValueForScalarKey();
          v6 = v10;
        }
      }
    }
  }

}

- (void)scrollViewWillBeginDragging:(id)a3
{
  self->_isDraggingInputView = 1;
  -[UIKeyboardEmojiCollectionInputView resetSelectionIfNeeded](self, "resetSelectionIfNeeded", a3);
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  const __CFString *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (_UIApplicationIsFirstPartyStickers())
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = CFSTR("contentOffsetY");
    v6 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v4, "contentOffset");
    objc_msgSend(v6, "numberWithDouble:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "postNotificationName:object:userInfo:", CFSTR("UIKeyboardEmojiCollectionInputViewDidScroll"), 0, v9);

  }
  -[UIKeyboardEmojiCollectionInputView hitTestResponder](self, "hitTestResponder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "deactivateActiveKey");

  -[UIKeyboardEmojiCollectionInputView firstFullyVisibleHeader](self, "firstFullyVisibleHeader");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "section");
  if (self->_currentSection != v12)
  {
    v13 = v12;
    self->_currentSection = v12;
    if (self->_isDraggingInputView)
    {
      -[UIKeyboardEmojiKeyView emojiKeyManager](self, "emojiKeyManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "reloadForCategory:withSender:", -[UIKeyboardEmojiCollectionInputView emojiCategoryTypeForSection:](self, "emojiCategoryTypeForSection:", v13), self);

    }
  }

}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  CGFloat v6;

  self->_isDraggingInputView = 1;
  -[UIKeyboardEmojiCollectionInputView snappedXOffsetForOffset:scrubbing:](self, "snappedXOffsetForOffset:scrubbing:", 0, a5->x, a4.y);
  a5->x = v6;
}

- (id)itemInRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v7;
  void *v8;
  id v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__127;
  v16 = __Block_byref_object_dispose__127;
  v17 = 0;
  -[UICollectionView collectionViewLayout](self->_collectionView, "collectionViewLayout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layoutAttributesForElementsInRect:", x, y, width, height);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __49__UIKeyboardEmojiCollectionInputView_itemInRect___block_invoke;
  v11[3] = &unk_1E16D59F8;
  v11[4] = &v12;
  objc_msgSend(v8, "enumerateObjectsWithOptions:usingBlock:", 2, v11);

  v9 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v9;
}

void __49__UIKeyboardEmojiCollectionInputView_itemInRect___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  if (!objc_msgSend(v9, "representedElementCategory"))
  {
    objc_msgSend(v9, "indexPath");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    *a4 = 1;
  }

}

- (id)firstFullyVisibleHeader
{
  void *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__127;
  v11 = __Block_byref_object_dispose__127;
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathWithIndex:", self->_currentSection);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[UICollectionView indexPathsForVisibleSupplementaryElementsOfKind:](self->_collectionView, "indexPathsForVisibleSupplementaryElementsOfKind:", CFSTR("UICollectionElementKindSectionHeader"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __61__UIKeyboardEmojiCollectionInputView_firstFullyVisibleHeader__block_invoke;
  v6[3] = &unk_1E16D5A20;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __61__UIKeyboardEmojiCollectionInputView_firstFullyVisibleHeader__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  id v16;

  v16 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 608), "supplementaryViewForElementKind:atIndexPath:", CFSTR("UICollectionElementKindSectionHeader"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 616), "scrollDirection");
  objc_msgSend(v7, "origin");
  v10 = v9;
  v12 = v11;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 608), "contentOffset");
  if (v8)
    v15 = v10;
  else
    v15 = v12;
  if (!v8)
    v13 = v14;
  if (v15 > v13)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *);
  void *v11;
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  self->_isDraggingInputView = 0;
  -[UIKeyboardEmojiCollectionInputView firstFullyVisibleHeader](self, "firstFullyVisibleHeader");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__127;
  v18 = __Block_byref_object_dispose__127;
  v19 = 0;
  -[UICollectionView indexPathsForVisibleItems](self->_collectionView, "indexPathsForVisibleItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __67__UIKeyboardEmojiCollectionInputView_scrollViewDidEndDecelerating___block_invoke;
  v11 = &unk_1E16D5A20;
  v7 = v5;
  v12 = v7;
  v13 = &v14;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", &v8);

  -[UIKeyboardEmojiCollectionInputView updateLastSeenItemForIndexPath:](self, "updateLastSeenItemForIndexPath:", v15[5], v8, v9, v10, v11);
  _Block_object_dispose(&v14, 8);

}

void __67__UIKeyboardEmojiCollectionInputView_scrollViewDidEndDecelerating___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  BOOL v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  id v10;

  v10 = a2;
  v4 = objc_msgSend(v10, "section");
  v5 = v4 == objc_msgSend(*(id *)(a1 + 32), "section");
  v6 = v10;
  if (v5)
  {
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (*(_QWORD *)(v7 + 40))
    {
      v8 = objc_msgSend(v10, "item");
      v9 = v8 < objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "item");
      v6 = v10;
      if (!v9)
        goto LABEL_8;
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    }
    objc_storeStrong((id *)(v7 + 40), a2);
    v6 = v10;
  }
LABEL_8:

}

- (double)_recentlyUsedMediaRoundedOffset:(double)a3 recentlyUsedMediaCellWidth:(double)a4
{
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  unint64_t v12;
  double v13;
  unint64_t i;
  double result;

  -[UIKeyboardEmojiCollectionView emojiGraphicsTraits](self->_collectionView, "emojiGraphicsTraits");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "inputViewLeftMostPadding");
  v9 = v8;
  -[UIKeyboardEmojiGraphicsTraits columnOffset](self->_emojiGraphicsTraits, "columnOffset");
  v11 = v10;

  v12 = 3;
  if (self->_useWideAnimojiCell)
    v12 = 4;
  v13 = a4 / (double)v12;
  if (v13 > a3)
    return a4 / (double)v12;
  for (i = 2; i != v12; ++i)
  {
    result = v13 * (double)i;
    if (result > a3)
      break;
  }
  if (i >= v12)
    return v11 - v9 + a4;
  return result;
}

- (double)snappedXOffsetForOffset:(double)a3 scrubbing:(BOOL)a4
{
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
  double v22;
  double v23;
  double Height;
  double v25;
  double v26;
  double v27;
  double result;
  double v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  void *v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  CGRect v53;

  -[UIScrollView contentSize](self->_collectionView, "contentSize");
  -[UIKeyboardEmojiCollectionInputView distanceInScrollingDirection:](self, "distanceInScrollingDirection:");
  v8 = v7;
  -[UIView bounds](self->_collectionView, "bounds");
  -[UIKeyboardEmojiCollectionInputView distanceInScrollingDirection:](self, "distanceInScrollingDirection:", v9, v10);
  v12 = v8 - v11;
  -[UIKeyboardEmojiCollectionInputView scrollingEndPoint](self, "scrollingEndPoint");
  if (v12 - v13 >= a3)
  {
    -[UIKeyboardEmojiCollectionInputView scrollingStartPoint](self, "scrollingStartPoint");
    if (v22 <= a3)
    {
      -[UIView bounds](self->_collectionView, "bounds");
      Height = CGRectGetHeight(v53);
      -[UIKeyboardEmojiGraphicsTraits categoryHeaderHeight](self->_emojiGraphicsTraits, "categoryHeaderHeight");
      v26 = Height - v25;
      if (self->_useWideAnimojiCell)
        v27 = v26 + v26;
      else
        v27 = v26;
      if (-[UIKeyboardEmojiCollectionInputView _shouldShowRecentlyUsedMedia](self, "_shouldShowRecentlyUsedMedia")
        && v27 > a3
        && !a4)
      {
        -[UIKeyboardEmojiCollectionInputView _recentlyUsedMediaRoundedOffset:recentlyUsedMediaCellWidth:](self, "_recentlyUsedMediaRoundedOffset:recentlyUsedMediaCellWidth:", a3, v27);
        return result;
      }
      if (-[UICollectionViewFlowLayout scrollDirection](self->_flowLayout, "scrollDirection"))
      {
        -[UIKeyboardEmojiGraphicsTraits categoryHeaderHeight](self->_emojiGraphicsTraits, "categoryHeaderHeight");
        v30 = v29;
        -[UIKeyboardEmojiCollectionView emojiGraphicsTraits](self->_collectionView, "emojiGraphicsTraits");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "emojiKeyWidth");
        v33 = v32;
        -[UIKeyboardEmojiCollectionView emojiGraphicsTraits](self->_collectionView, "emojiGraphicsTraits");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "columnOffset");
        v36 = v33 + v35;
        -[UIView bounds](self->_collectionView, "bounds");
        v38 = v37;
        -[UIKeyboardEmojiGraphicsTraits categoryHeaderHeight](self->_emojiGraphicsTraits, "categoryHeaderHeight");
        v40 = v38 - v39;
        v41 = a3;
        a3 = v30;
      }
      else
      {
        -[UIView bounds](self->_collectionView, "bounds");
        v36 = v42;
        -[UIKeyboardEmojiCollectionView emojiGraphicsTraits](self->_collectionView, "emojiGraphicsTraits");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "emojiKeyWidth");
        v44 = v43;
        -[UIKeyboardEmojiCollectionView emojiGraphicsTraits](self->_collectionView, "emojiGraphicsTraits");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "columnOffset");
        v40 = v44 + v45;
        v41 = 0.0;
      }

      -[UIKeyboardEmojiCollectionInputView itemInRect:](self, "itemInRect:", v41, a3, v36, v40);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      -[UICollectionView layoutAttributesForItemAtIndexPath:](self->_collectionView, "layoutAttributesForItemAtIndexPath:", v46);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "frame");
      -[UIKeyboardEmojiCollectionInputView pointInScrollingDirection:](self, "pointInScrollingDirection:");
      v49 = v48;
      -[UIKeyboardEmojiGraphicsTraits columnOffset](self->_emojiGraphicsTraits, "columnOffset");
      v51 = v49 - v50;
      -[UIKeyboardEmojiGraphicsTraits scrollSnapOffset](self->_emojiGraphicsTraits, "scrollSnapOffset");
      v21 = v51 + v52;

    }
    else
    {
      -[UIKeyboardEmojiCollectionInputView scrollingStartPoint](self, "scrollingStartPoint");
      return -v23;
    }
  }
  else
  {
    -[UIScrollView contentSize](self->_collectionView, "contentSize");
    -[UIKeyboardEmojiCollectionInputView distanceInScrollingDirection:](self, "distanceInScrollingDirection:");
    v15 = v14;
    -[UIView bounds](self->_collectionView, "bounds");
    -[UIKeyboardEmojiCollectionInputView distanceInScrollingDirection:](self, "distanceInScrollingDirection:", v16, v17);
    v19 = v15 - v18;
    -[UIKeyboardEmojiCollectionInputView scrollingEndPoint](self, "scrollingEndPoint");
    return v19 + v20;
  }
  return v21;
}

- (int64_t)indexForPrettyCategoryDisplay:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  int64_t v8;

  v4 = a3;
  if (self->_collectionView
    && (-[UIKeyboardEmojiCollectionInputView category](self, "category"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "categoryType"),
        v5,
        v7 = -[UICollectionView numberOfItemsInSection:](self->_collectionView, "numberOfItemsInSection:", +[UIKeyboardEmojiCategory categoryIndexForCategoryType:](UIKeyboardEmojiCategory, "categoryIndexForCategoryType:", v6)), objc_msgSend(v4, "lastVisibleFirstEmojiIndex") >= v7))
  {
    v8 = v7 - 1;
  }
  else
  {
    v8 = objc_msgSend(v4, "lastVisibleFirstEmojiIndex");
  }

  return v8;
}

- (void)didMoveToWindow
{
  UIKeyboardEmojiCollectionInputView *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id WeakRetained;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double MinX;
  void *v31;
  double v32;
  double v33;
  uint64_t v34;
  void *v35;
  void *v36;
  _QWORD v37[6];
  objc_super v38;
  CGRect v39;

  v2 = self;
  v38.receiver = self;
  v38.super_class = (Class)UIKeyboardEmojiCollectionInputView;
  -[UIView didMoveToWindow](&v38, sel_didMoveToWindow);
  -[UIView layoutIfNeeded](v2->_collectionView, "layoutIfNeeded");
  -[UIKeyboardEmojiKeyView emojiKeyManager](v2, "emojiKeyManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastViewedCategory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeWeak((id *)&v2->_category, v4);

  +[UIKeyboardEmojiCategory enabledCategoryIndexes](UIKeyboardEmojiCategory, "enabledCategoryIndexes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB37E8];
  WeakRetained = objc_loadWeakRetained((id *)&v2->_category);
  objc_msgSend(v6, "numberWithInteger:", objc_msgSend(WeakRetained, "categoryType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v5, "containsObject:", v8);

  if ((v9 & 1) == 0)
  {
    +[UIKeyboardEmojiCategory enabledCategoryIndexes](UIKeyboardEmojiCategory, "enabledCategoryIndexes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "integerValue");

    +[UIKeyboardEmojiCategory categoryForType:](UIKeyboardEmojiCategory, "categoryForType:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v2->_category, v13);

  }
  v14 = objc_loadWeakRetained((id *)&v2->_category);
  v2->_currentSection = +[UIKeyboardEmojiCategory categoryIndexForCategoryType:](UIKeyboardEmojiCategory, "categoryIndexForCategoryType:", objc_msgSend(v14, "categoryType"));

  -[UIView window](v2, "window");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    if (v2->_inputDelegateCanSupportAnimoji
      && !v2->_hasShownAnimojiFirstTimeExperience
      && -[UIKeyboardEmojiCollectionInputView _shouldShowRecentlyUsedMedia](v2, "_shouldShowRecentlyUsedMedia"))
    {
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[UIKeyboardEmojiCollectionInputView category](v2, "category");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = +[UIKeyboardEmojiCategory categoryIndexForCategoryType:](UIKeyboardEmojiCategory, "categoryIndexForCategoryType:", objc_msgSend(v17, "categoryType"));

      v19 = (void *)MEMORY[0x1E0CB36B0];
      -[UIKeyboardEmojiCollectionInputView category](v2, "category");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "indexPathForItem:inSection:", -[UIKeyboardEmojiCollectionInputView indexForPrettyCategoryDisplay:](v2, "indexForPrettyCategoryDisplay:", v20), v18);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

    }
    -[UICollectionView layoutAttributesForItemAtIndexPath:](v2->_collectionView, "layoutAttributesForItemAtIndexPath:", v16);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "frame");
    v23 = v22;
    v25 = v24;
    v27 = v26;
    v29 = v28;

    v39.origin.x = v23;
    v39.origin.y = v25;
    v39.size.width = v27;
    v39.size.height = v29;
    MinX = CGRectGetMinX(v39);
    -[UIKeyboardEmojiCollectionView emojiGraphicsTraits](v2->_collectionView, "emojiGraphicsTraits");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "inputViewLeftMostPadding");
    v33 = MinX - v32;

    -[UIKeyboardEmojiCollectionInputView snappedXOffsetForOffset:scrubbing:](v2, "snappedXOffsetForOffset:scrubbing:", 0, v33);
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __53__UIKeyboardEmojiCollectionInputView_didMoveToWindow__block_invoke;
    v37[3] = &unk_1E16B1888;
    v37[4] = v2;
    v37[5] = v34;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v37);

  }
  -[UIView window](v2, "window");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v35)
    v2 = 0;
  +[UIKeyboardMediaController sharedKeyboardMediaController](UIKeyboardMediaController, "sharedKeyboardMediaController");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setDelegate:", v2);

}

uint64_t __53__UIKeyboardEmojiCollectionInputView_didMoveToWindow__block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 608);
  v3 = *(double *)(a1 + 40);
  objc_msgSend(v2, "contentOffset");
  v5 = v4;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 608), "bounds");
  v7 = v6;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 608), "bounds");
  return objc_msgSend(v2, "scrollRectToVisible:animated:", 0, v3, v5, v7);
}

- (void)updateToCategory:(int64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int64_t isDraggingInputView;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  UIKeyboardEmojiCollectionView *collectionView;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  UICollectionViewScrollDirection v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  double MinX;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double MinY;
  void *v40;
  double v41;
  double v42;
  void *v43;
  double v44;
  double v45;
  double v46;
  double v47;
  void *v48;
  void *v49;
  id v50;
  id v51;

  -[UIKeyboardEmojiCollectionInputView hitTestResponder](self, "hitTestResponder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deactivateActiveKey");

  -[UIKeyboardEmojiCollectionInputView resetSelectionIfNeeded](self, "resetSelectionIfNeeded");
  -[UIKeyboardEmojiCollectionInputView category](self, "category");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "categoryType");

  if (v7 == a3)
  {
    if (!a3)
    {
      -[UIKeyboardEmojiCollectionInputView category](self, "category");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "lastVisibleFirstEmojiIndex") == 1)
      {
        isDraggingInputView = self->_isDraggingInputView;

LABEL_11:
        -[UIKeyboardEmojiCollectionInputView category](self, "category");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setLastVisibleFirstEmojiIndex:", isDraggingInputView);

        -[UIKeyboardEmojiCollectionInputView category](self, "category");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_12;
      }

    }
    isDraggingInputView = 1;
    goto LABEL_11;
  }
  +[UIKeyboardEmojiCategory categoryForType:](UIKeyboardEmojiCategory, "categoryForType:", a3);
  v50 = (id)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardEmojiKeyView emojiKeyManager](self, "emojiKeyManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setLastVisibleFirstEmojiIndex:", objc_msgSend(v10, "lastVisibleFirstEmojiIndexforCategory:", v50));

  if (!a3 && !objc_msgSend(v50, "lastVisibleFirstEmojiIndex"))
    objc_msgSend(v50, "setLastVisibleFirstEmojiIndex:", 1);
  -[UIKeyboardEmojiCollectionInputView setCategory:](self, "setCategory:", v50);
  -[UIKeyboardEmojiCollectionInputView category](self, "category");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  isDraggingInputView = -[UIKeyboardEmojiCollectionInputView indexForPrettyCategoryDisplay:](self, "indexForPrettyCategoryDisplay:", v11);

  v12 = v50;
LABEL_12:
  v51 = v12;
  v14 = +[UIKeyboardEmojiCategory categoryIndexForCategoryType:](UIKeyboardEmojiCategory, "categoryIndexForCategoryType:", objc_msgSend(v12, "categoryType"));
  collectionView = self->_collectionView;
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", isDraggingInputView, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionView layoutAttributesForItemAtIndexPath:](collectionView, "layoutAttributesForItemAtIndexPath:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "frame");
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;

  v26 = -[UICollectionViewFlowLayout scrollDirection](self->_flowLayout, "scrollDirection");
  v27 = v19;
  v28 = v21;
  v29 = v23;
  v30 = v25;
  if (v26)
  {
    MinX = CGRectGetMinX(*(CGRect *)&v27);
    -[UIKeyboardEmojiCollectionView emojiGraphicsTraits](self->_collectionView, "emojiGraphicsTraits");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "inputViewLeftMostPadding");
    v34 = MinX - v33;

    -[UIKeyboardEmojiCollectionInputView snappedXOffsetForOffset:scrubbing:](self, "snappedXOffsetForOffset:scrubbing:", 0, v34);
    v36 = v35;
    -[UIScrollView contentOffset](self->_collectionView, "contentOffset");
    v38 = v37;
  }
  else
  {
    MinY = CGRectGetMinY(*(CGRect *)&v27);
    -[UIKeyboardEmojiCollectionView emojiGraphicsTraits](self->_collectionView, "emojiGraphicsTraits");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "categoryHeaderHeight");
    v42 = MinY - v41;
    -[UIKeyboardEmojiCollectionView emojiGraphicsTraits](self->_collectionView, "emojiGraphicsTraits");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "sectionOffset");
    v38 = v42 - v44;

    -[UIScrollView contentOffset](self->_collectionView, "contentOffset");
    v36 = v45;
  }
  -[UIView bounds](self->_collectionView, "bounds");
  v47 = v46;
  -[UIView bounds](self->_collectionView, "bounds");
  -[UIScrollView scrollRectToVisible:animated:](self->_collectionView, "scrollRectToVisible:animated:", 0, v36, v38, v47);
  -[UIKeyboardEmojiCollectionInputView category](self, "category");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardEmojiKeyView emojiKeyManager](self, "emojiKeyManager");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "setLastViewedCategory:", v48);

}

- (void)updateOffsetForSearchResults
{
  void *v3;
  UIKeyboardEmojiCollectionView *collectionView;
  void *v5;
  void *v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double MinX;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  UIKeyboardEmojiCollectionView *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  id v28;
  CGRect v29;

  -[UIKeyboardEmojiCollectionInputView hitTestResponder](self, "hitTestResponder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deactivateActiveKey");

  -[UIKeyboardEmojiCollectionInputView resetSelectionIfNeeded](self, "resetSelectionIfNeeded");
  +[UIKeyboardEmojiCategory categoryForType:](UIKeyboardEmojiCategory, "categoryForType:", -[UIKeyboardEmojiCollectionInputView emojiCategoryTypeForSection:](self, "emojiCategoryTypeForSection:", 0));
  v28 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setLastVisibleFirstEmojiIndex:", 1);
  -[UIKeyboardEmojiCollectionInputView setCategory:](self, "setCategory:", v28);
  collectionView = self->_collectionView;
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 1, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionView layoutAttributesForItemAtIndexPath:](collectionView, "layoutAttributesForItemAtIndexPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frame");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  v29.origin.x = v8;
  v29.origin.y = v10;
  v29.size.width = v12;
  v29.size.height = v14;
  MinX = CGRectGetMinX(v29);
  -[UIKeyboardEmojiCollectionView emojiGraphicsTraits](self->_collectionView, "emojiGraphicsTraits");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "inputViewLeftMostPadding");
  v18 = MinX - v17;

  -[UIKeyboardEmojiCollectionInputView snappedXOffsetForOffset:scrubbing:](self, "snappedXOffsetForOffset:scrubbing:", 0, v18);
  v20 = v19;
  v21 = self->_collectionView;
  -[UIScrollView contentOffset](v21, "contentOffset");
  v23 = v22;
  -[UIView bounds](self->_collectionView, "bounds");
  v25 = v24;
  -[UIView bounds](self->_collectionView, "bounds");
  -[UIScrollView scrollRectToVisible:animated:](v21, "scrollRectToVisible:animated:", 0, v20, v23, v25);
  -[UIKeyboardEmojiCollectionInputView category](self, "category");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardEmojiKeyView emojiKeyManager](self, "emojiKeyManager");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setLastViewedCategory:", v26);

}

- (double)pointInScrollingDirection:(CGPoint)a3
{
  double y;
  double x;

  y = a3.y;
  x = a3.x;
  if (-[UICollectionViewFlowLayout scrollDirection](self->_flowLayout, "scrollDirection"))
    return x;
  else
    return y;
}

- (double)distanceInScrollingDirection:(CGSize)a3
{
  double height;
  double width;

  height = a3.height;
  width = a3.width;
  if (-[UICollectionViewFlowLayout scrollDirection](self->_flowLayout, "scrollDirection"))
    return width;
  else
    return height;
}

- (double)scrollingStartPoint
{
  double result;

  if (-[UICollectionViewFlowLayout scrollDirection](self->_flowLayout, "scrollDirection") == UICollectionViewScrollDirectionVertical)
    return 0.0;
  -[UIKeyboardEmojiGraphicsTraits inputViewLeftMostPadding](self->_emojiGraphicsTraits, "inputViewLeftMostPadding");
  return result;
}

- (double)scrollingEndPoint
{
  UICollectionViewScrollDirection v3;
  UIKeyboardEmojiGraphicsTraits *emojiGraphicsTraits;
  double result;

  v3 = -[UICollectionViewFlowLayout scrollDirection](self->_flowLayout, "scrollDirection");
  emojiGraphicsTraits = self->_emojiGraphicsTraits;
  if (v3)
    -[UIKeyboardEmojiGraphicsTraits inputViewRightMostPadding](emojiGraphicsTraits, "inputViewRightMostPadding");
  else
    -[UIKeyboardEmojiGraphicsTraits bottomPadding](emojiGraphicsTraits, "bottomPadding");
  return result;
}

- (int64_t)updateToCategoryWithOffsetPercentage:(double)a3
{
  UICollectionViewScrollDirection v5;
  double Height;
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
  double v22;
  double v23;
  double v24;
  double v25;
  UIKeyboardEmojiCollectionView *collectionView;
  double v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  int64_t v32;
  CGRect v34;

  v5 = -[UICollectionViewFlowLayout scrollDirection](self->_flowLayout, "scrollDirection");
  -[UIView bounds](self->_collectionView, "bounds");
  Height = CGRectGetHeight(v34);
  -[UIKeyboardEmojiGraphicsTraits categoryHeaderHeight](self->_emojiGraphicsTraits, "categoryHeaderHeight");
  v8 = v7;
  v9 = 0.0;
  v10 = 0.0;
  if (-[UIKeyboardEmojiCollectionInputView _shouldShowRecentlyUsedMedia](self, "_shouldShowRecentlyUsedMedia"))
  {
    if (self->_useWideAnimojiCell)
      v10 = Height - v8 + Height - v8;
    else
      v10 = Height - v8;
  }
  if (-[UIKeyboardEmojiCollectionInputView _shouldShowRecentlyUsedMedia](self, "_shouldShowRecentlyUsedMedia"))
  {
    -[UIKeyboardEmojiGraphicsTraits sectionOffset](self->_emojiGraphicsTraits, "sectionOffset");
    v9 = v10 + v11 - self->_frameInset;
  }
  -[UIScrollView contentSize](self->_collectionView, "contentSize");
  -[UIKeyboardEmojiCollectionInputView distanceInScrollingDirection:](self, "distanceInScrollingDirection:");
  v13 = v12 - v9;
  -[UIView bounds](self->_collectionView, "bounds");
  -[UIKeyboardEmojiCollectionInputView distanceInScrollingDirection:](self, "distanceInScrollingDirection:", v14, v15);
  v17 = v16 * 0.5 * round(ceil(v13 / (v16 * 0.5)) * a3);
  -[UIKeyboardEmojiGraphicsTraits emojiKeyWidth](self->_emojiGraphicsTraits, "emojiKeyWidth");
  v19 = v18;
  -[UIKeyboardEmojiGraphicsTraits columnOffset](self->_emojiGraphicsTraits, "columnOffset");
  -[UIKeyboardEmojiCollectionInputView snappedXOffsetForOffset:scrubbing:](self, "snappedXOffsetForOffset:scrubbing:", 1, (v19 + v20 + v20) * round(v17 / (v19 + v20 + v20)));
  v22 = v9 + v21;
  -[UIScrollView contentOffset](self->_collectionView, "contentOffset");
  if (v5)
    v25 = v22;
  else
    v25 = v23;
  if (v5)
    v22 = v24;
  collectionView = self->_collectionView;
  -[UIView bounds](collectionView, "bounds");
  v28 = v27;
  -[UIView bounds](self->_collectionView, "bounds");
  -[UIScrollView scrollRectToVisible:animated:](collectionView, "scrollRectToVisible:animated:", 0, v25, v22, v28);
  -[UICollectionView indexPathsForVisibleItems](self->_collectionView, "indexPathsForVisibleItems");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "sortedArrayUsingSelector:", sel_compare_);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v30, "count"))
  {
    objc_msgSend(v30, "objectAtIndex:", 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = -[UIKeyboardEmojiCollectionInputView emojiCategoryTypeForSection:](self, "emojiCategoryTypeForSection:", objc_msgSend(v31, "section"));

  }
  else
  {
    v32 = 0;
  }

  return v32;
}

- (UIKeyboardEmojiCategory)category
{
  return (UIKeyboardEmojiCategory *)objc_loadWeakRetained((id *)&self->_category);
}

- (void)setCategory:(id)a3
{
  objc_storeWeak((id *)&self->_category, a3);
}

- (BOOL)isDraggingInputView
{
  return self->_isDraggingInputView;
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 712);
}

- (UIKBEmojiHitTestResponder)hitTestResponder
{
  return (UIKBEmojiHitTestResponder *)objc_loadWeakRetained((id *)&self->_hitTestResponder);
}

- (NSIndexPath)tappedSkinToneEmoji
{
  return (NSIndexPath *)objc_loadWeakRetained((id *)&self->_tappedSkinToneEmoji);
}

- (void)setTappedSkinToneEmoji:(id)a3
{
  objc_storeWeak((id *)&self->_tappedSkinToneEmoji, a3);
}

- (TUIEmojiSearchInputViewController)emojiSearchInputViewController
{
  return self->_emojiSearchInputViewController;
}

- (void)setEmojiSearchInputViewController:(id)a3
{
  objc_storeStrong((id *)&self->_emojiSearchInputViewController, a3);
}

- (TUIEmojiSearchTextField)emojiSearchField
{
  return self->_emojiSearchField;
}

- (void)setEmojiSearchField:(id)a3
{
  objc_storeStrong((id *)&self->_emojiSearchField, a3);
}

- (NSIndexPath)selectedIndexPath
{
  return self->_selectedIndexPath;
}

- (void)setSelectedIndexPath:(id)a3
{
  objc_storeStrong((id *)&self->_selectedIndexPath, a3);
}

- (BOOL)isSearching
{
  return self->_isSearching;
}

- (void)setIsSearching:(BOOL)a3
{
  self->_isSearching = a3;
}

- (NSArray)searchResults
{
  return self->_searchResults;
}

- (void)setSearchResults:(id)a3
{
  objc_storeStrong((id *)&self->_searchResults, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchResults, 0);
  objc_storeStrong((id *)&self->_selectedIndexPath, 0);
  objc_storeStrong((id *)&self->_emojiSearchField, 0);
  objc_storeStrong((id *)&self->_emojiSearchInputViewController, 0);
  objc_destroyWeak((id *)&self->_tappedSkinToneEmoji);
  objc_destroyWeak((id *)&self->_hitTestResponder);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_destroyWeak((id *)&self->_category);
  objc_storeStrong((id *)&self->_selectedPopupKey, 0);
  objc_storeStrong((id *)&self->_emojiGraphicsTraits, 0);
  objc_storeStrong((id *)&self->_flowLayout, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
}

@end
