@implementation PKPeerPayment3DTextView

+ (id)supportedCharacterSet
{
  return (id)objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("$.,0123456789 "));
}

- (PKPeerPayment3DTextView)initWithFrame:(CGRect)a3
{
  return -[PKPeerPayment3DTextView initWithFrame:renderStyle:usedForSnapshotting:](self, "initWithFrame:renderStyle:usedForSnapshotting:", 0, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (PKPeerPayment3DTextView)initWithFrame:(CGRect)a3 renderStyle:(unint64_t)a4 usedForSnapshotting:(BOOL)a5
{
  PKPeerPayment3DTextView *v7;
  PKPeerPayment3DTextView *v8;
  void *v9;
  id v10;
  uint64_t v11;
  SCNView *sceneView;
  SCNView *v13;
  void *v14;
  uint64_t v15;
  PKPeerPayment3DStore *_3DStore;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  PKPeerPayment3DStore *v21;
  PKPeerPayment3DTextView *v22;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, void *);
  void *v27;
  PKPeerPayment3DTextView *v28;
  objc_super v29;
  uint64_t v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x24BDAC8D0];
  v29.receiver = self;
  v29.super_class = (Class)PKPeerPayment3DTextView;
  v7 = -[PKPeerPayment3DTextView initWithFrame:](&v29, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v8 = v7;
  if (v7)
  {
    v7->_dynamicRollPitchMix = 0.0;
    v7->_usedForSnapshotting = a5;
    v30 = *MEMORY[0x24BDE82F0];
    v31[0] = &unk_24D0A9C80;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v31, &v30, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_alloc(MEMORY[0x24BDE8298]);
    -[PKPeerPayment3DTextView bounds](v8, "bounds");
    v11 = objc_msgSend(v10, "initWithFrame:options:", v9);
    sceneView = v8->_sceneView;
    v8->_sceneView = (SCNView *)v11;

    -[SCNView setAntialiasingMode:](v8->_sceneView, "setAntialiasingMode:", 2);
    v13 = v8->_sceneView;
    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCNView setBackgroundColor:](v13, "setBackgroundColor:", v14);

    -[SCNView setDelegate:](v8->_sceneView, "setDelegate:", v8);
    v8->_renderStyle = a4;
    +[PKPeerPayment3DStore sharedInstance](PKPeerPayment3DStore, "sharedInstance");
    v15 = objc_claimAutoreleasedReturnValue();
    _3DStore = v8->_3DStore;
    v8->_3DStore = (PKPeerPayment3DStore *)v15;

    -[SCNView setOpaque:](v8->_sceneView, "setOpaque:", 0);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObserver:selector:name:object:", v8, sel_willResignActive, *MEMORY[0x24BDF75D8], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObserver:selector:name:object:", v8, sel_didBecomeActive, *MEMORY[0x24BDF7510], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObserver:selector:name:object:", v8, sel_willResignActive, *MEMORY[0x24BDD0C28], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObserver:selector:name:object:", v8, sel_didBecomeActive, *MEMORY[0x24BDD0C10], 0);

    v21 = v8->_3DStore;
    v24 = MEMORY[0x24BDAC760];
    v25 = 3221225472;
    v26 = __73__PKPeerPayment3DTextView_initWithFrame_renderStyle_usedForSnapshotting___block_invoke;
    v27 = &unk_24D0A0B58;
    v22 = v8;
    v28 = v22;
    -[PKPeerPayment3DStore newSceneWithCompletion:synchronously:](v21, "newSceneWithCompletion:synchronously:", &v24, v8->_usedForSnapshotting);
    -[PKPeerPayment3DTextView addSubview:](v22, "addSubview:", v8->_sceneView, v24, v25, v26, v27);

  }
  return v8;
}

void __73__PKPeerPayment3DTextView_initWithFrame_renderStyle_usedForSnapshotting___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  void (**v6)(_QWORD);
  void *v7;
  _QWORD block[4];
  void (**v9)(_QWORD);
  _QWORD v10[4];
  id v11;
  id v12;

  v3 = a2;
  v4 = MEMORY[0x24BDAC760];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __73__PKPeerPayment3DTextView_initWithFrame_renderStyle_usedForSnapshotting___block_invoke_2;
  v10[3] = &unk_24D0A0B08;
  v11 = *(id *)(a1 + 32);
  v5 = v3;
  v12 = v5;
  v6 = (void (**)(_QWORD))MEMORY[0x2199BB0CC](v10);
  v7 = v6;
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 491))
  {
    v6[2](v6);
  }
  else
  {
    block[0] = v4;
    block[1] = 3221225472;
    block[2] = __73__PKPeerPayment3DTextView_initWithFrame_renderStyle_usedForSnapshotting___block_invoke_3;
    block[3] = &unk_24D0A0B30;
    v9 = v6;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
}

uint64_t __73__PKPeerPayment3DTextView_initWithFrame_renderStyle_usedForSnapshotting___block_invoke_2(uint64_t a1)
{
  uint64_t v2;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 424), *(id *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "setScene:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 424));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "setDelegate:");
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 488))
  {
    objc_msgSend(*(id *)(v2 + 416), "setPlaying:", 1);
    v2 = *(_QWORD *)(a1 + 32);
  }
  return objc_msgSend((id)v2, "updateSceneUnits");
}

uint64_t __73__PKPeerPayment3DTextView_initWithFrame_renderStyle_usedForSnapshotting___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)dealloc
{
  objc_super v3;

  if (self->_scene)
    -[PKPeerPayment3DStore relinquishScene:](self->_3DStore, "relinquishScene:");
  v3.receiver = self;
  v3.super_class = (Class)PKPeerPayment3DTextView;
  -[PKPeerPayment3DTextView dealloc](&v3, sel_dealloc);
}

- (void)updateSceneUnits
{
  double sceneWidthUnits;
  double v4;
  double v5;
  double v6;
  double v7;

  sceneWidthUnits = self->_sceneWidthUnits;
  -[SCNView bounds](self->_sceneView, "bounds");
  v5 = v4;
  -[SCNView bounds](self->_sceneView, "bounds");
  v7 = 8.0;
  if (v6 <= v5)
    v7 = v5 * 8.0 / v6;
  self->_sceneWidthUnits = v7;
  self->_sceneHeightUnits = v6 * v7 / v5;
  if (sceneWidthUnits != self->_sceneWidthUnits)
    -[PKPeerPayment3DTextView layoutText](self, "layoutText");
}

- (void)layoutSubviews
{
  SCNView *sceneView;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPeerPayment3DTextView;
  -[PKPeerPayment3DTextView layoutSubviews](&v4, sel_layoutSubviews);
  sceneView = self->_sceneView;
  -[PKPeerPayment3DTextView bounds](self, "bounds");
  -[SCNView setFrame:](sceneView, "setFrame:");
  -[PKPeerPayment3DTextView updateSceneUnits](self, "updateSceneUnits");
}

- (BOOL)setText:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSString *text;
  NSString *v9;
  NSString *v10;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "supportedCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invertedSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "rangeOfCharacterFromSet:", v6);

  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    text = self->_text;
    if (!text || !-[NSString isEqualToString:](text, "isEqualToString:", v4))
    {
      v9 = (NSString *)objc_msgSend(v4, "copy");
      v10 = self->_text;
      self->_text = v9;

      -[PKPeerPayment3DTextView setIsAccessibilityElement:](self, "setIsAccessibilityElement:", 1);
      -[PKPeerPayment3DTextView setAccessibilityLabel:](self, "setAccessibilityLabel:", self->_text);
      -[PKPeerPayment3DTextView loadCharactersAndLayout](self, "loadCharactersAndLayout");
    }
  }

  return v7 == 0x7FFFFFFFFFFFFFFFLL;
}

- (void)loadCharactersAndLayout
{
  PKPeerPayment3DStore *_3DStore;
  NSString *text;
  _QWORD v5[5];

  -[NSMutableArray removeAllObjects](self->_charactersToDraw, "removeAllObjects");
  _3DStore = self->_3DStore;
  text = self->_text;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __50__PKPeerPayment3DTextView_loadCharactersAndLayout__block_invoke;
  v5[3] = &unk_24D0A0B80;
  v5[4] = self;
  -[PKPeerPayment3DStore charactersForText:completion:synchronously:](_3DStore, "charactersForText:completion:synchronously:", text, v5, self->_usedForSnapshotting);
}

void __50__PKPeerPayment3DTextView_loadCharactersAndLayout__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  void (**v6)(_QWORD);
  void *v7;
  _QWORD block[4];
  void (**v9)(_QWORD);
  _QWORD v10[5];
  id v11;

  v3 = a2;
  v4 = MEMORY[0x24BDAC760];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __50__PKPeerPayment3DTextView_loadCharactersAndLayout__block_invoke_2;
  v10[3] = &unk_24D0A0B08;
  v10[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  v11 = v5;
  v6 = (void (**)(_QWORD))MEMORY[0x2199BB0CC](v10);
  v7 = v6;
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 491))
  {
    v6[2](v6);
  }
  else
  {
    block[0] = v4;
    block[1] = 3221225472;
    block[2] = __50__PKPeerPayment3DTextView_loadCharactersAndLayout__block_invoke_3;
    block[3] = &unk_24D0A0B30;
    v9 = v6;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
}

void __50__PKPeerPayment3DTextView_loadCharactersAndLayout__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "layoutText");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "resetScene");
  v2 = objc_msgSend(*(id *)(a1 + 40), "mutableCopy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 520);
  *(_QWORD *)(v3 + 520) = v2;

}

uint64_t __50__PKPeerPayment3DTextView_loadCharactersAndLayout__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)layoutText
{
  self->_layoutRequested = 1;
}

- (void)renderer:(id)a3 updateAtTime:(double)a4
{
  PKPeerPayment3DScene *scene;
  void *v6;
  void *v7;
  BOOL v8;
  int v9;
  const __CTFont *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  uint64_t i;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  UniChar v21;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
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
  double v41;
  double v42;
  double sceneHeightUnits;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  float v50;
  double v51;
  double v52;
  double v53;
  void *v54;
  uint64_t v55;
  double animationDuration;
  float32x2_t v57;
  float32x2_t v58;
  void *v59;
  double v60;
  double v61;
  float v62;
  float32x2_t v63;
  double v64;
  float32x4_t v65;
  float32x4_t v66;
  float32x4_t v67;
  float32x4_t v68;
  int v69;
  int v70;
  float32x2_t v71;
  void *v72;
  double v73;
  double v74;
  void *v75;
  void *v76;
  PKPeerPayment3DTextView *v77;
  double v78;
  uint64_t v79;
  void *v80;
  unint64_t framesFullyRendered;
  void *v82;
  void *v83;
  float32x4_t v84;
  _OWORD v85[4];
  uint64_t v86;
  int v87;
  CGGlyph glyphs;
  UniChar characters;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  void *v94;
  _BYTE v95[128];
  uint64_t v96;
  CGRect BoundingRectsForGlyphs;
  CGRect v98;

  v96 = *MEMORY[0x24BDAC8D0];
  scene = self->_scene;
  if (scene)
  {
    -[PKPeerPayment3DScene textContainerNode](scene, "textContainerNode", a3, a4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6A70], "pk_peerPaymentChiseledCashFontOfSize:", 8.92);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSMutableArray count](self->_charactersToDraw, "count"))
      v8 = v7 == 0;
    else
      v8 = 1;
    if (v8)
    {
      v9 = 0;
    }
    else
    {
      v83 = v6;
      v82 = v7;
      v10 = v7;
      v90 = 0u;
      v91 = 0u;
      v92 = 0u;
      v93 = 0u;
      v11 = (void *)-[NSMutableArray copy](self->_charactersToDraw, "copy");
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v90, v95, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v91;
        v15 = 0.0;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v91 != v14)
              objc_enumerationMutation(v11);
            v17 = *(void **)(*((_QWORD *)&v90 + 1) + 8 * i);
            objc_msgSend(v17, "character");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v18, "isEqualToString:", CFSTR(" "));

            if ((v19 & 1) == 0)
            {
              characters = 0;
              objc_msgSend(v17, "character");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v21 = objc_msgSend(v20, "characterAtIndex:", 0);

              characters = v21;
              glyphs = 0;
              CTFontGetGlyphsForCharacters(v10, &characters, &glyphs, 1);
              BoundingRectsForGlyphs = CTFontGetBoundingRectsForGlyphs(v10, kCTFontOrientationDefault, &glyphs, 0, 1);
              x = BoundingRectsForGlyphs.origin.x;
              y = BoundingRectsForGlyphs.origin.y;
              width = BoundingRectsForGlyphs.size.width;
              height = BoundingRectsForGlyphs.size.height;
              DWORD2(v85[0]) = 0;
              *(_QWORD *)&v85[0] = 0;
              v87 = 0;
              v86 = 0;
              objc_msgSend(v17, "node");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v83, "addChildNode:", v26);
              objc_msgSend(v26, "geometry");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              -[PKPeerPayment3DScene textMaterial](self->_scene, "textMaterial");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              v94 = v28;
              objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v94, 1);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "setMaterials:", v29);

              objc_msgSend(v26, "getBoundingBoxMin:max:", v85, &v86);
              v30 = (float)(*(float *)&v86 + *(float *)v85) * -0.5;
              v98.origin.x = x;
              v98.origin.y = y;
              v98.size.width = width;
              v98.size.height = height;
              v31 = v15 + CGRectGetMidX(v98) + v30;
              *(float *)&v31 = v31;
              LODWORD(v32) = 0;
              LODWORD(v33) = 0;
              objc_msgSend(v26, "setPosition:", v31, v32, v33);
              v15 = v15 + CTFontGetAdvancesForGlyphs(v10, kCTFontOrientationDefault, &glyphs, 0, 1);

            }
          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v90, v95, 16);
        }
        while (v13);
      }

      CFRelease(v10);
      -[NSMutableArray removeAllObjects](self->_charactersToDraw, "removeAllObjects");
      if (self->_framesFullyRendered)
      {
        v9 = 0;
        v6 = v83;
        v7 = v82;
      }
      else
      {
        v6 = v83;
        v7 = v82;
        if (!self->_snapshotRequested && !self->_usedForSnapshotting)
          goto LABEL_31;
        v9 = 1;
      }
    }
    if (self->_layoutRequested)
    {
      objc_msgSend(v6, "childNodes");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v34, "count");

      if (v35)
      {
        -[SCNView bounds](self->_sceneView, "bounds");
        v37 = v36;
        v39 = v38;
        DWORD2(v85[0]) = 0;
        *(_QWORD *)&v85[0] = 0;
        v87 = 0;
        v86 = 0;
        objc_msgSend(v6, "getBoundingBoxMin:max:", v85, &v86);
        v40 = (float)(*(float *)&v86 - *(float *)v85);
        v41 = *((float *)&v86 + 1);
        v42 = *((float *)&v86 + 1) + -6.87682009;
        sceneHeightUnits = self->_sceneHeightUnits;
        v44 = 49.0 / v39 * sceneHeightUnits;
        v45 = 0.0 / v39 * sceneHeightUnits;
        v46 = (v37 + -28.0) / v37 * self->_sceneWidthUnits / v40;
        v47 = v44 / v42;
        if (v46 >= v47)
          v46 = v47;
        v48 = -(*(float *)v85 + v40 * 0.5) * v46;
        *(float *)&v48 = v48;
        v49 = v45 + -(v41 - v42 * 0.5) * v46;
        *(float *)&v49 = v49;
        v50 = v46;
        LODWORD(v41) = 0;
        objc_msgSend(v6, "setPosition:", v48, v49, v41);
        *(float *)&v51 = v50;
        *(float *)&v52 = v50;
        *(float *)&v53 = v50;
        objc_msgSend(v6, "setScale:", v51, v52, v53);
        self->_layoutRequested = 0;
        if (!self->_framesFullyRendered)
        {
LABEL_31:
          if (!self->_snapshotRequested && !self->_usedForSnapshotting)
            goto LABEL_54;
        }
      }
      else if (v9)
      {
        goto LABEL_31;
      }
    }
    else if ((v9 & 1) != 0)
    {
      goto LABEL_31;
    }
    if (self->_scene)
    {
      objc_msgSend(v6, "childNodes");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = objc_msgSend(v54, "count");

      if (v55)
      {
        if (!self->_liveMotionEnabled && self->_animationDuration == 0.0
          || self->_snapshotRequested
          || self->_usedForSnapshotting
          || self->_liveMotionEnabled && self->_willAnimate)
        {
          v59 = v7;
          +[PKPeerPayment3DScene staticRollPitch](PKPeerPayment3DScene, "staticRollPitch");
          v58 = v71;
          +[PKPeerPayment3DScene rotationMatrixForRollPitch:](PKPeerPayment3DScene, "rotationMatrixForRollPitch:");
          v70 = 0;
          v85[0] = v65;
          v69 = 1;
        }
        else
        {
          animationDuration = self->_animationDuration;
          +[PKPeerPayment3DScene staticRollPitch](PKPeerPayment3DScene, "staticRollPitch");
          v58 = v57;
          v59 = v7;
          if (animationDuration > 0.0)
          {
            v60 = fmin(fmax(self->_dynamicRollPitchMix, 0.0), 1.0);
            v61 = v60 * v60 * (v60 * -2.0 + 3.0);
            -[PKPeerPayment3DScene currentRollPitch](self->_scene, "currentRollPitch");
            v62 = v61;
            v64 = COERCE_DOUBLE(vmla_n_f32(v58, vsub_f32(v63, v58), v62));
            +[PKPeerPayment3DScene rotationMatrixForRollPitch:](PKPeerPayment3DScene, "rotationMatrixForRollPitch:", v64);
            v69 = 0;
            v85[0] = v65;
            v70 = 1;
            goto LABEL_45;
          }
          -[PKPeerPayment3DScene currentRotationMatrix](self->_scene, "currentRotationMatrix");
          v69 = 0;
          v70 = 0;
          v85[0] = v65;
        }
        v64 = 0.0;
LABEL_45:
        v85[1] = v66;
        v85[2] = v67;
        v85[3] = v68;
        v84 = vaddq_f32(v68, vmlaq_f32(vmlaq_f32(vmulq_f32(v65, (float32x4_t)0), (float32x4_t)0, v66), (float32x4_t)vdupq_n_s32(0x428C0000u), v67));
        -[PKPeerPayment3DScene lightNode](self->_scene, "lightNode");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        *(float32x2_t *)&v73 = vneg_f32(*(float32x2_t *)v84.f32);
        LODWORD(v74) = v84.i32[2];
        objc_msgSend(v72, "setPosition:", v73, COERCE_DOUBLE(__PAIR64__(v84.u32[1], HIDWORD(v73))), v74);

        objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v85, 64);
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPeerPayment3DScene textMaterial](self->_scene, "textMaterial");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v76, "setValue:forKey:", v75, CFSTR("rotationMatrix"));
        if (v69)
        {
          v77 = self;
          v78 = *(double *)&v58;
        }
        else
        {
          if (!v70)
          {
            v77 = self;
            -[PKPeerPayment3DScene currentSkew](self->_scene, "currentSkew");
            goto LABEL_51;
          }
          v77 = self;
          v78 = v64;
        }
        +[PKPeerPayment3DScene skewForRollPitch:](PKPeerPayment3DScene, "skewForRollPitch:", v78);
LABEL_51:
        v86 = v79;
        objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &v86, 8);
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v76, "setValue:forKey:", v80, CFSTR("skew"));
        framesFullyRendered = v77->_framesFullyRendered;
        if (framesFullyRendered <= 2)
          v77->_framesFullyRendered = framesFullyRendered + 1;

        v7 = v59;
      }
    }
LABEL_54:

  }
}

- (id)generatedSnapshot
{
  id result;

  self->_snapshotRequested = 1;
  result = -[SCNView snapshot](self->_sceneView, "snapshot");
  self->_snapshotRequested = 0;
  return result;
}

- (void)setMotionEffectEnabled:(BOOL)a3 animated:(BOOL)a4
{
  _QWORD v4[5];

  if (self->_liveMotionEnabled != a3)
  {
    self->_liveMotionEnabled = a3;
    if (a4)
    {
      self->_willAnimate = 1;
      v4[0] = MEMORY[0x24BDAC760];
      v4[1] = 3221225472;
      v4[2] = __59__PKPeerPayment3DTextView_setMotionEffectEnabled_animated___block_invoke;
      v4[3] = &unk_24D0A0BA8;
      v4[4] = self;
      -[PKPeerPayment3DTextView performPostRender:](self, "performPostRender:", v4);
    }
  }
}

double __59__PKPeerPayment3DTextView_setMotionEffectEnabled_animated___block_invoke(uint64_t a1)
{
  uint64_t v1;
  double result;

  v1 = *(_QWORD *)(a1 + 32);
  result = *(double *)(v1 + 480);
  *(double *)(v1 + 464) = result;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 472) = 0x3FE0000000000000;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 489) = 0;
  return result;
}

- (void)willResignActive
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__PKPeerPayment3DTextView_willResignActive__block_invoke;
  block[3] = &unk_24D0A0BA8;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __43__PKPeerPayment3DTextView_willResignActive__block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(result + 32);
  if (*(_QWORD *)(v1 + 424))
  {
    v2 = result;
    objc_msgSend(*(id *)(v1 + 416), "setPlaying:", 0);
    return objc_msgSend(*(id *)(*(_QWORD *)(v2 + 32) + 504), "sceneDidBecomeInactive:", *(_QWORD *)(*(_QWORD *)(v2 + 32) + 424));
  }
  return result;
}

- (void)didBecomeActive
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__PKPeerPayment3DTextView_didBecomeActive__block_invoke;
  block[3] = &unk_24D0A0BA8;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __42__PKPeerPayment3DTextView_didBecomeActive__block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(result + 32);
  if (*(_QWORD *)(v1 + 424))
  {
    if (*(_BYTE *)(v1 + 488))
    {
      v2 = result;
      objc_msgSend(*(id *)(v1 + 416), "setPlaying:", 1);
      return objc_msgSend(*(id *)(*(_QWORD *)(v2 + 32) + 504), "sceneDidBecomeActive:", *(_QWORD *)(*(_QWORD *)(v2 + 32) + 424));
    }
  }
  return result;
}

- (void)didMoveToWindow
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPeerPayment3DTextView;
  -[PKPeerPayment3DTextView didMoveToWindow](&v4, sel_didMoveToWindow);
  -[PKPeerPayment3DTextView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if (self->_scene)
    {
      if (self->_liveMotionEnabled)
      {
        -[SCNView setPlaying:](self->_sceneView, "setPlaying:", 1);
        -[PKPeerPayment3DStore sceneDidBecomeActive:](self->_3DStore, "sceneDidBecomeActive:", self->_scene);
      }
    }
  }
  else
  {
    -[SCNView setPlaying:](self->_sceneView, "setPlaying:", 0);
    if (self->_scene)
      -[PKPeerPayment3DStore sceneDidBecomeInactive:](self->_3DStore, "sceneDidBecomeInactive:");
  }
}

- (float32x2_t)_fakeAnimationRollPitchWithElapsedTime:(uint64_t)a1
{
  float32_t v2;
  float v3;
  float32x2_t v4;
  float32x2_t v5;
  float32x2_t v11;
  float32x2_t v13;
  __float2 v14;
  float v15;
  float v16;
  float32x2_t v17;
  float32x2_t v18;
  float v20;
  float v21;

  v2 = a2;
  v3 = *(double *)(a1 + 472);
  v4.f32[0] = v2;
  v20 = v2;
  v4.f32[1] = (float)(v2 - (float)(v3 + -1.0)) / (float)(v3 - (float)(v3 + -1.0));
  v5 = vmaxnm_f32(v4, 0);
  __asm { FMOV            V1.2S, #1.0 }
  v11 = vminnm_f32(v5, _D1);
  __asm { FMOV            V3.2S, #3.0 }
  v13 = vmul_f32(vmul_f32(v11, v11), vmla_f32(_D3, (float32x2_t)0xC0000000C0000000, v11));
  _D1.f32[0] = vsub_f32(v13, (float32x2_t)vdup_lane_s32((int32x2_t)v13, 1)).f32[0];
  v13.f32[0] = ((float)(v2 / v3) + (float)(v2 / v3)) * 3.14159265;
  _D1.f32[0] = _D1.f32[0] * 0.628318531;
  v21 = _D1.f32[0];
  v14 = __sincosf_stret(v13.f32[0]);
  +[PKPeerPayment3DScene staticRollPitch](PKPeerPayment3DScene, "staticRollPitch");
  v15 = fminf(fmaxf((float)(v20 - (float)(v3 + -0.5)) / (float)(v3 - (float)(v3 + -0.5)), 0.0), 1.0);
  v16 = (float)(v15 * v15) * (float)((float)(v15 * -2.0) + 3.0);
  v17 = vmul_n_f32((float32x2_t)__PAIR64__(LODWORD(v14.__sinval), LODWORD(v14.__cosval)), v21);
  return vmla_n_f32(v17, vsub_f32(v18, v17), v16);
}

- (void)performPostRender:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __45__PKPeerPayment3DTextView_performPostRender___block_invoke;
    v6[3] = &unk_24D0A0BD0;
    v6[4] = self;
    v7 = v4;
    dispatch_async(MEMORY[0x24BDAC9B8], v6);

  }
}

void __45__PKPeerPayment3DTextView_performPostRender___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 448);
  if (!v2)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 448);
    *(_QWORD *)(v4 + 448) = v3;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 448);
  }
  v6 = (id)MEMORY[0x2199BB0CC](*(_QWORD *)(a1 + 40));
  objc_msgSend(v2, "addObject:", v6);

}

- (void)renderer:(id)a3 didRenderScene:(id)a4 atTime:(double)a5
{
  id v8;
  id v9;
  double animationDuration;
  double v11;
  double v12;
  double v13;
  _QWORD block[5];

  v8 = a3;
  v9 = a4;
  self->_lastRenderTime = a5;
  animationDuration = self->_animationDuration;
  if (animationDuration > 0.0)
  {
    v11 = (a5 - self->_startAnimationTime) / animationDuration;
    v12 = fmax(1.0 - v11, 0.0);
    v13 = fmin(v11, 1.0);
    if (!self->_liveMotionEnabled)
      v13 = v12;
    self->_dynamicRollPitchMix = v13;
    if (v13 == 1.0 || v13 == 0.0)
      self->_animationDuration = 0.0;
  }
  if (self->_performHandlers && self->_framesFullyRendered >= 3)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __58__PKPeerPayment3DTextView_renderer_didRenderScene_atTime___block_invoke;
    block[3] = &unk_24D0A0BA8;
    block[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }

}

void __58__PKPeerPayment3DTextView_renderer_didRenderScene_atTime___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 448);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v6) + 16))(*(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v6));
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 448);
  *(_QWORD *)(v7 + 448) = 0;

}

- (unint64_t)renderStyle
{
  return self->_renderStyle;
}

- (NSString)text
{
  return self->_text;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_charactersToDraw, 0);
  objc_storeStrong((id *)&self->_3DStore, 0);
  objc_storeStrong((id *)&self->_performHandlers, 0);
  objc_storeStrong((id *)&self->_scene, 0);
  objc_storeStrong((id *)&self->_sceneView, 0);
}

@end
