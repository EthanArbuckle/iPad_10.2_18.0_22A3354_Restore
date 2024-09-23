@implementation PVInstructionGraphSourceCompositeNode

- (PVInstructionGraphSourceCompositeNode)init
{
  PVInstructionGraphSourceCompositeNode *v2;
  PVInstructionGraphSourceCompositeNode *v3;
  PVInstructionGraphSourceCompositeNode *v4;
  PVColorSpace *colorSpace;
  NSURL *imageURL;
  NSDictionary *inputMap;
  NSString *imageKey;
  PVImageBuffer *imageBuffer;
  PVImageSeqDelegate *imageSeqDelegate;
  PVRenderManager *v11;
  CGFloat ty;
  CGFloat v13;
  PVCompositeDelegate *renderDelegate;
  NSObject *metadata;
  void *v16;
  uint64_t v17;
  id userContext;
  void *v19;
  double v21;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)PVInstructionGraphSourceCompositeNode;
  v2 = -[PVInstructionGraphSourceNode init](&v22, sel_init);
  v3 = v2;
  v4 = v2;
  if (v2)
  {
    HIDWORD(v2->_renderManager.m_Obj) = 0;
    *(_DWORD *)&v2->_canPreprocess = 0;
    colorSpace = v2->_colorSpace;
    v2->_colorSpace = 0;

    imageURL = v4->_imageURL;
    v4->_imageURL = 0;

    inputMap = v4->_inputMap;
    v4->_inputMap = 0;

    imageKey = v4->_imageKey;
    v4->_imageKey = 0;

    imageBuffer = v4->_imageBuffer;
    v4->_imageBuffer = 0;

    v3->_delegateEffect = 0;
    v3->_outputSize.width = 0.0;
    v4->_nodeType = 1380401729;
    imageSeqDelegate = v4->_imageSeqDelegate;
    v4->_imageSeqDelegate = 0;

    PVRenderManager::INSTANCE(v11, &v21);
    ty = v4->super._transform.ty;
    v13 = v21;
    if (*(_QWORD *)&ty == *(_QWORD *)&v21)
    {
      if (ty != 0.0)
        (*(void (**)(CGFloat))(**(_QWORD **)&ty + 24))(COERCE_CGFLOAT(*(_QWORD *)&ty));
    }
    else
    {
      if (ty != 0.0)
      {
        (*(void (**)(CGFloat))(**(_QWORD **)&ty + 24))(COERCE_CGFLOAT(*(_QWORD *)&ty));
        v13 = v21;
      }
      v4->super._transform.ty = v13;
    }
    renderDelegate = v4->_renderDelegate;
    v4->_renderDelegate = 0;

    metadata = v4->_metadata;
    v4->_metadata = 0;

    LOBYTE(v4->_renderManager.m_Obj) = 0;
    BYTE1(v4->_renderManager.m_Obj) = 0;
    +[PVContentRegistry sharedInstance](PVContentRegistry, "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "createContentInstance:", CFSTR("F3D8E4D0-686B-44C6-8966-E50856A94959"));
    v17 = objc_claimAutoreleasedReturnValue();
    userContext = v4->_userContext;
    v4->_userContext = (id)v17;

    v19 = *(void **)&v4->_trackID;
    *(_QWORD *)&v4->_trackID = 0;

  }
  return v4;
}

+ (id)newSourceCompositeNodeWithURL:(id)a3 key:(id)a4 imageDelegate:(id)a5
{
  id v7;
  id v8;
  id v9;
  PVInstructionGraphSourceCompositeNode *v10;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_alloc_init(PVInstructionGraphSourceCompositeNode);
  -[PVInstructionGraphSourceCompositeNode setNodeType:](v10, "setNodeType:", 1);
  -[PVInstructionGraphSourceCompositeNode setImageURL:](v10, "setImageURL:", v7);
  -[PVInstructionGraphSourceCompositeNode setImageKey:](v10, "setImageKey:", v8);
  -[PVInstructionGraphSourceCompositeNode setImageSeqDelegate:](v10, "setImageSeqDelegate:", v9);
  objc_msgSend(v9, "imageSizeForURL:", v7);
  -[PVInstructionGraphSourceCompositeNode setOutputSize:](v10, "setOutputSize:");

  return v10;
}

+ (id)newSourceCompositeNodeWithPVImageBuffer:(id)a3
{
  id v3;
  PVInstructionGraphSourceCompositeNode *v4;

  v3 = a3;
  v4 = objc_alloc_init(PVInstructionGraphSourceCompositeNode);
  -[PVInstructionGraphSourceCompositeNode setNodeType:](v4, "setNodeType:", 2);
  -[PVInstructionGraphSourceCompositeNode setImageBuffer:](v4, "setImageBuffer:", v3);
  objc_msgSend(v3, "size");
  -[PVInstructionGraphSourceCompositeNode setOutputSize:](v4, "setOutputSize:");

  return v4;
}

+ (id)newSourceCompositeNodeWithTrack:(int)a3 outputSize:(CGSize)a4
{
  double height;
  double width;
  uint64_t v6;
  PVInstructionGraphSourceCompositeNode *v7;

  height = a4.height;
  width = a4.width;
  v6 = *(_QWORD *)&a3;
  v7 = objc_alloc_init(PVInstructionGraphSourceCompositeNode);
  -[PVInstructionGraphSourceCompositeNode setNodeType:](v7, "setNodeType:", 3);
  -[PVInstructionGraphSourceCompositeNode setTrackID:](v7, "setTrackID:", v6);
  -[PVInstructionGraphSourceCompositeNode setOutputSize:](v7, "setOutputSize:", width, height);
  return v7;
}

+ (id)newSourceCompositeNodeWithGraphNode:(id)a3 outputSize:(CGSize)a4 outputFormat:(unsigned int)a5
{
  uint64_t v5;
  double height;
  double width;
  id v8;
  PVInstructionGraphSourceCompositeNode *v9;

  v5 = *(_QWORD *)&a5;
  height = a4.height;
  width = a4.width;
  v8 = a3;
  v9 = objc_alloc_init(PVInstructionGraphSourceCompositeNode);
  -[PVInstructionGraphSourceCompositeNode setNodeType:](v9, "setNodeType:", 4);
  -[PVInstructionGraphSourceCompositeNode setGraphNode:](v9, "setGraphNode:", v8);
  -[PVInstructionGraphSourceCompositeNode setOutputSize:](v9, "setOutputSize:", width, height);
  -[PVInstructionGraphSourceCompositeNode setOutputFormat:](v9, "setOutputFormat:", v5);

  return v9;
}

+ (id)newSourceCompositeNodeWithDelegate:(id)a3 inputs:(id)a4 metadata:(id)a5 outputSize:(CGSize)a6 outputFormat:(unsigned int)a7
{
  uint64_t v7;
  double height;
  double width;
  id v12;
  id v13;
  id v14;
  PVInstructionGraphSourceCompositeNode *v15;

  v7 = *(_QWORD *)&a7;
  height = a6.height;
  width = a6.width;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = objc_alloc_init(PVInstructionGraphSourceCompositeNode);
  -[PVInstructionGraphSourceCompositeNode setNodeType:](v15, "setNodeType:", 5);
  -[PVInstructionGraphSourceCompositeNode setMetadata:](v15, "setMetadata:", v14);
  -[PVInstructionGraphSourceCompositeNode setInputMap:](v15, "setInputMap:", v13);
  -[PVInstructionGraphSourceCompositeNode setOutputSize:](v15, "setOutputSize:", width, height);
  -[PVInstructionGraphSourceCompositeNode setOutputFormat:](v15, "setOutputFormat:", v7);
  if (v12)
  {
    -[PVInstructionGraphSourceCompositeNode setRenderDelegate:](v15, "setRenderDelegate:", v12);
    -[PVInstructionGraphSourceCompositeNode setCanPreprocess:](v15, "setCanPreprocess:", 0);
    -[PVInstructionGraphSourceCompositeNode setCanRender:](v15, "setCanRender:", objc_opt_respondsToSelector() & 1);
  }

  return v15;
}

+ (id)newSourceCompositeNodeWithDelegate:(id)a3 inputs:(id)a4 userContext:(id)a5 outputSize:(CGSize)a6 outputFormat:(unsigned int)a7
{
  uint64_t v7;
  double height;
  double width;
  id v12;
  id v13;
  id v14;
  PVInstructionGraphSourceCompositeNode *v15;
  void *v16;
  void *v17;

  v7 = *(_QWORD *)&a7;
  height = a6.height;
  width = a6.width;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = objc_alloc_init(PVInstructionGraphSourceCompositeNode);
  -[PVInstructionGraphSourceCompositeNode setNodeType:](v15, "setNodeType:", 5);
  -[PVInstructionGraphSourceCompositeNode setUserContext:](v15, "setUserContext:", v14);
  -[PVInstructionGraphSourceCompositeNode setInputMap:](v15, "setInputMap:", v13);
  -[PVInstructionGraphSourceCompositeNode setOutputSize:](v15, "setOutputSize:", width, height);
  -[PVInstructionGraphSourceCompositeNode setOutputFormat:](v15, "setOutputFormat:", v7);
  if (v12)
  {
    -[PVInstructionGraphSourceCompositeNode setRenderDelegate:](v15, "setRenderDelegate:", v12);
    -[PVInstructionGraphSourceCompositeNode setCanPreprocess:](v15, "setCanPreprocess:", objc_opt_respondsToSelector() & 1);
    -[PVInstructionGraphSourceCompositeNode setCanRender:](v15, "setCanRender:", objc_opt_respondsToSelector() & 1);
    -[PVInstructionGraphSourceCompositeNode delegateEffect](v15, "delegateEffect");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setRenderDelegate:", v12);

    -[PVInstructionGraphSourceCompositeNode delegateEffect](v15, "delegateEffect");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setUserContext:", v14);

  }
  return v15;
}

- (void)loadIGNode:(HGRef<PVInstructionGraphContext>)a3 returnLoadedEffects:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (-[PVInstructionGraphSourceCompositeNode nodeType](self, "nodeType") == 4)
  {
    -[PVInstructionGraphSourceCompositeNode graphNode](self, "graphNode");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)a3.m_Obj;
    v24 = v8;
    if (v8)
      (*(void (**)(uint64_t))(*(_QWORD *)v8 + 16))(v8);
    objc_msgSend(v7, "loadIGNode:returnLoadedEffects:", &v24, v6);
    if (v24)
      (*(void (**)(uint64_t))(*(_QWORD *)v24 + 24))(v24);

  }
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[PVInstructionGraphSourceCompositeNode inputMap](self, "inputMap");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v9);
        v13 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        -[PVInstructionGraphSourceCompositeNode inputMap](self, "inputMap");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKeyedSubscript:", v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        v16 = *(_QWORD *)a3.m_Obj;
        v19 = v16;
        if (v16)
          (*(void (**)(uint64_t))(*(_QWORD *)v16 + 16))(v16);
        objc_msgSend(v15, "loadIGNode:returnLoadedEffects:", &v19, v6);
        if (v19)
          (*(void (**)(uint64_t))(*(_QWORD *)v19 + 24))(v19);

      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v10);
  }

  -[PVInstructionGraphSourceCompositeNode delegateEffect](self, "delegateEffect");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "loadEffect");

  if (v6)
  {
    -[PVInstructionGraphSourceCompositeNode delegateEffect](self, "delegateEffect");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v18);

  }
}

- (void)unloadIGNode
{
  void *v3;
  void *v4;
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
  if (-[PVInstructionGraphSourceCompositeNode nodeType](self, "nodeType") == 4)
  {
    -[PVInstructionGraphSourceCompositeNode graphNode](self, "graphNode");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "unloadIGNode");

  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[PVInstructionGraphSourceCompositeNode inputMap](self, "inputMap", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v13;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v4);
        v8 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v7);
        -[PVInstructionGraphSourceCompositeNode inputMap](self, "inputMap");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "unloadIGNode");
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

  -[PVInstructionGraphSourceCompositeNode delegateEffect](self, "delegateEffect");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "releaseEffect");

}

- (HGRef<HGNode>)conformNode:(HGRef<HGNode>)a3 toSize:(HGRect)a4
{
  HGHWBlendFlipped **v4;
  uint64_t v5;
  uint64_t v6;
  HGHWBlendFlipped **v9;
  HGSolidColor *v10;
  HGHWBlendFlipped *v11;
  HGCV *v12;
  HGCV *v13;
  int v14;
  HGColorConform *v15;
  char *v16;
  char *v17;
  uint64_t v18;
  HGCrop *v19;
  HGRect v22;

  v5 = *(_QWORD *)&a4.var2;
  v6 = *(_QWORD *)&a4.var0;
  v9 = v4;
  *v4 = 0;
  v10 = (HGSolidColor *)HGObject::operator new(0x1A0uLL);
  *(_QWORD *)&v22.var0 = v6;
  *(_QWORD *)&v22.var2 = v5;
  HGSolidColor::HGSolidColor(v10, v22);
  (*(void (**)(HGSolidColor *, _QWORD, float, float, float, float))(*(_QWORD *)v10 + 96))(v10, 0, 0.0, 0.0, 0.0, 0.0);
  v11 = (HGHWBlendFlipped *)HGObject::operator new(0x220uLL);
  HGHWBlendFlipped::HGHWBlendFlipped(v11);
  (*(void (**)(HGHWBlendFlipped *, _QWORD, float, float, float, float))(*(_QWORD *)v11 + 96))(v11, 0, 9.0, 0.0, 0.0, 0.0);
  (*(void (**)(HGHWBlendFlipped *, _QWORD, HGSolidColor *))(*(_QWORD *)v11 + 120))(v11, 0, v10);
  (*(void (**)(HGHWBlendFlipped *, uint64_t, _QWORD))(*(_QWORD *)v11 + 120))(v11, 1, *(_QWORD *)a3.var0);
  *v9 = v11;
  (*(void (**)(HGHWBlendFlipped *))(*(_QWORD *)v11 + 16))(v11);
  v12 = (HGCV *)-[PVInstructionGraphSourceCompositeNode outputFormat](self, "outputFormat");
  v13 = v12;
  if ((int)v12 <= 1380401728)
  {
    if ((_DWORD)v12 != 32)
    {
      v14 = 1111970369;
LABEL_7:
      if ((_DWORD)v12 != v14)
        goto LABEL_11;
    }
  }
  else if ((_DWORD)v12 != 1380401729 && (_DWORD)v12 != 1380411457)
  {
    v14 = 1380410945;
    goto LABEL_7;
  }
  v15 = (HGColorConform *)HGObject::operator new(0x320uLL);
  HGColorConform::HGColorConform(v15);
  HGColorConform::SetInputPixelFormat((uint64_t)v15, 0, v16);
  (*(void (**)(HGColorConform *, _QWORD, HGHWBlendFlipped *))(*(_QWORD *)v15 + 120))(v15, 0, v11);
  v18 = HGCV::HGFormatForCVPixelFormat(v13, 0, v17);
  HGColorConform::SetOutputPixelFormat((uint64_t)v15, v18, 0);
  v19 = (HGCrop *)HGObject::operator new(0x1A0uLL);
  HGCrop::HGCrop(v19);
  (*(void (**)(HGCrop *, _QWORD, float, float, float, float))(*(_QWORD *)v19 + 96))(v19, 0, (float)(int)v6, (float)SHIDWORD(v6), (float)(int)v5, (float)SHIDWORD(v5));
  (*(void (**)(HGCrop *, _QWORD, HGColorConform *))(*(_QWORD *)v19 + 120))(v19, 0, v15);
  if (v11 != v19)
  {
    (*(void (**)(HGHWBlendFlipped *))(*(_QWORD *)v11 + 24))(v11);
    *v9 = v19;
    (*(void (**)(HGCrop *))(*(_QWORD *)v19 + 16))(v19);
  }
  (*(void (**)(HGCrop *))(*(_QWORD *)v19 + 24))(v19);
  (*(void (**)(HGColorConform *))(*(_QWORD *)v15 + 24))(v15);
LABEL_11:
  (*(void (**)(HGHWBlendFlipped *))(*(_QWORD *)v11 + 24))(v11);
  return (HGRef<HGNode>)(*(uint64_t (**)(HGSolidColor *))(*(_QWORD *)v10 + 24))(v10);
}

- (HGRef<HGNode>)conformInputImage:(id)a3 colorSpace:(id)a4 renderer:(const void *)a5 currentTime:(id *)a6 igContext:(HGRef<PVInstructionGraphContext>)a7
{
  HGNode **v7;
  HGNode **v12;
  id v13;
  id v14;
  HGNode *v15;
  __CVBuffer *v16;
  PVInstructionGraphContext *v17;
  void (*v18)(HGNode *);
  HGRef<HGNode> v19;
  HGNode *v20;
  PVInstructionGraphContext *v21;
  __int128 v22;
  int64_t var3;
  HGNode *v24;

  v12 = v7;
  v13 = a3;
  v14 = a4;
  v15 = (HGNode *)HGObject::operator new(0x1A0uLL);
  HGNode::HGNode(v15);
  *v12 = v15;
  if (objc_msgSend(v13, "canCreateCVPixelBuffer"))
  {
    v16 = (__CVBuffer *)objc_msgSend(v13, "cvPixelBufferWithColorSpace:", v14);
    if (v16)
    {
      v22 = *(_OWORD *)&a6->var0;
      var3 = a6->var3;
      v17 = *(PVInstructionGraphContext **)a7.m_Obj;
      v21 = v17;
      if (v17)
        (*(void (**)(PVInstructionGraphContext *))(*(_QWORD *)v17 + 16))(v17);
      PVCreateInputGraphForPixelBuffer(v16, &v21, &v24);
      if (v15 == v24)
      {
        if (v15)
          (*(void (**)(HGNode *))(*(_QWORD *)v15 + 24))(v15);
      }
      else
      {
        if (v15)
          (*(void (**)(HGNode *))(*(_QWORD *)v15 + 24))(v15);
        v15 = v24;
        *v12 = v24;
        v24 = 0;
      }
      if (v21)
        (*(void (**)(PVInstructionGraphContext *))(*(_QWORD *)v21 + 24))(v21);
    }
  }
  if (v15)
  {
    v20 = v15;
    (*(void (**)(HGNode *))(*(_QWORD *)v15 + 16))(v15);
    -[PVInstructionGraphSourceNode applyWrapModeToInput:](self, "applyWrapModeToInput:", &v20);
    v18 = *(void (**)(HGNode *))(*(_QWORD *)v15 + 24);
    if (v15 == v24)
    {
      v18(v15);
    }
    else
    {
      v18(v15);
      *v12 = v24;
      v24 = 0;
    }
    if (v20)
      (*(void (**)(HGNode *))(*(_QWORD *)v20 + 24))(v20);
  }

  return v19;
}

- (HGRef<HGNode>)internalHGNodeForTime:(id *)a3 trackInputs:(const void *)a4 renderer:(const void *)a5 igContext:(HGRef<PVInstructionGraphContext>)a6
{
  CGFloat *v6;
  double v8;
  double v9;
  double v10;
  float v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  unint64_t v15;
  BOOL v16;
  _QWORD *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  int v30;
  _QWORD *v31;
  _QWORD **v32;
  _QWORD *v33;
  _QWORD **v34;
  int v35;
  uint64_t v36;
  void *v37;
  _BOOL4 v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  double v43;
  double v44;
  double v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  _BOOL4 v50;
  void *v51;
  void *v52;
  objc_object *v53;
  __int128 v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t i;
  void *v58;
  void *v59;
  void *v60;
  PVImageBuffer *v61;
  void *v62;
  PVInstructionGraphContext *v63;
  double v64;
  double v65;
  PVVideoCompositingContext *v66;
  double v67;
  CGFloat v68;
  double v69;
  CGFloat v70;
  char v71;
  PVRendererInstructionGraphContext *v72;
  int v73;
  PVInstructionGraphContext *v74;
  double v75;
  double v76;
  PVVideoCompositingContext *v77;
  double v78;
  CGFloat v79;
  double v80;
  CGFloat v81;
  char v82;
  PVRendererInstructionGraphContext *v83;
  CGFloat a;
  void *v85;
  int v86;
  void (*v87)(_QWORD);
  HGBitmap *value;
  HGBitmapLoader *v89;
  int v90;
  double v91;
  double v92;
  double v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  unsigned int v97;
  void *v98;
  double v99;
  double v100;
  double v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  CGFloat v105;
  void *v106;
  void *v107;
  BOOL v108;
  uint64_t v109;
  int v110;
  CGFloat v111;
  unsigned int v112;
  CGFloat v113;
  HGInternalCompNode *v114;
  HGInternalCompNode *v115;
  void *v116;
  char v117;
  void *v118;
  int v119;
  void *v120;
  _BOOL4 v121;
  int v122;
  HGRef<HGNode> v123;
  void *v124;
  CGFloat *v125;
  PVCompositeDelegateContext *v126;
  HGNode *v129;
  id obj;
  HGInternalCompNode *v131;
  void *v132;
  PVInstructionGraphContext **m_Obj;
  uint64_t v134;
  id v136;
  CGAffineTransform v138;
  CGFloat v139;
  CGAffineTransform v140;
  CGAffineTransform v141;
  CGAffineTransform v142;
  PVTransformAnimationInfo v143;
  CGAffineTransform v144;
  __int128 v145;
  int64_t v146;
  PVTransformAnimationInfo lpsrc;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v150;
  CGFloat v151;
  CGFloat v152;
  HGNode *v153;
  int64_t v154;
  PVInstructionGraphContext *v155;
  __int128 v156;
  int64_t v157;
  HGColorClamp *v158;
  CGFloat v159;
  PVInstructionGraphContext *v160;
  __int128 v161;
  int64_t v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  int64_t v168;
  __int128 v169;
  int64_t var3;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  uint64_t *v175;
  _QWORD *v176[2];
  uint64_t v177;
  _BYTE v178[128];
  _BYTE v179[128];
  uint64_t v180;
  HGRect v182;
  HGRect v183;
  CGSize v184;
  CGSize v185;
  CGPoint v186;

  v125 = v6;
  v180 = *MEMORY[0x1E0C80C00];
  v8 = (*(double (**)(_QWORD, SEL))(**(_QWORD **)a6.m_Obj + 40))(*(_QWORD *)a6.m_Obj, a2);
  v10 = v9;
  v11 = (*(float (**)(_QWORD))(**(_QWORD **)a6.m_Obj + 48))(*(_QWORD *)a6.m_Obj);
  m_Obj = (PVInstructionGraphContext **)a6.m_Obj;
  v12 = *(_QWORD *)a6.m_Obj;
  v177 = v12;
  if (v12)
    (*(void (**)(uint64_t))(*(_QWORD *)v12 + 16))(v12);
  -[PVInstructionGraphSourceCompositeNode addDotTreeLinks:](self, "addDotTreeLinks:", &v177);
  if (v177)
    (*(void (**)(uint64_t))(*(_QWORD *)v177 + 24))(v177);
  v176[1] = 0;
  v176[0] = 0;
  v175 = (uint64_t *)v176;
  v13 = (_QWORD *)*((_QWORD *)a4 + 1);
  if (!v13)
    goto LABEL_16;
  v14 = (char *)a4 + 8;
  do
  {
    v15 = v13[4];
    v16 = v15 >= (unint64_t)self;
    if (v15 >= (unint64_t)self)
      v17 = v13;
    else
      v17 = v13 + 1;
    if (v16)
      v14 = v13;
    v13 = (_QWORD *)*v17;
  }
  while (*v17);
  if (v14 != (_QWORD *)((char *)a4 + 8) && v14[4] <= (unint64_t)self)
  {
    PVInputHGNodeMap<PVInstructionGraphSourceNode * {__strong}>::GetNode((uint64_t)a4, self, (HGSolidColor **)&lpsrc);
    if (lpsrc.time.value)
    {
      v115 = v114;
      if (v114)
        (*(void (**)(HGInternalCompNode *))(*(_QWORD *)v114 + 16))(v114);
    }
    else
    {
      v115 = 0;
    }
    v131 = v115;
    if (&v175 != (uint64_t **)((char *)v115 + 408))
      std::__tree<std::__value_type<int,__CVBuffer *>,std::__map_value_compare<int,std::__value_type<int,__CVBuffer *>,std::less<int>,true>,std::allocator<std::__value_type<int,__CVBuffer *>>>::__assign_multi<std::__tree_const_iterator<std::__value_type<int,__CVBuffer *>,std::__tree_node<std::__value_type<int,__CVBuffer *>,void *> *,long>>(&v175, *((_QWORD **)v115 + 51), (_QWORD *)v115 + 52);
    if (lpsrc.time.value)
      (*(void (**)(int64_t))(*(_QWORD *)lpsrc.time.value + 24))(lpsrc.time.value);
  }
  else
  {
LABEL_16:
    *(double *)&v131 = COERCE_DOUBLE(HGObject::operator new(0x260uLL));
    HGInternalCompNode::HGInternalCompNode(v131);
  }
  v126 = -[PVCompositeDelegateContext initWithNode:]([PVCompositeDelegateContext alloc], "initWithNode:", self);
  -[PVInstructionGraphSourceCompositeNode colorSpace](self, "colorSpace");
  v18 = objc_claimAutoreleasedReturnValue();
  if (!v18)
  {
    PVInstructionGraphContext::WorkingColorSpace(*m_Obj);
    v18 = objc_claimAutoreleasedReturnValue();
  }
  v132 = (void *)v18;
  -[PVCompositeDelegateContext setRenderColorSpace:](v126, "setRenderColorSpace:");
  v136 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v173 = 0u;
  v174 = 0u;
  v171 = 0u;
  v172 = 0u;
  -[PVInstructionGraphSourceCompositeNode inputMap](self, "inputMap");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v171, v179, 16);
  if (v20)
  {
    v21 = *(_QWORD *)v172;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v172 != v21)
          objc_enumerationMutation(v19);
        v23 = *(_QWORD *)(*((_QWORD *)&v171 + 1) + 8 * v22);
        -[PVInstructionGraphSourceCompositeNode inputMap](self, "inputMap");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "objectForKeyedSubscript:", v23);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v25, "nodeType") == 1)
        {
          objc_msgSend(v25, "imageSeqDelegate");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "imageURL");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v169 = *(_OWORD *)&a3->var0;
          var3 = a3->var3;
          v28 = objc_msgSend(v26, "imageForURL:time:", v27, &v169);

          +[PVImageBuffer imageWithCGImage:](PVImageBuffer, "imageWithCGImage:", v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v136, "setObject:forKey:", v29, v23);
LABEL_28:

          goto LABEL_29;
        }
        if (objc_msgSend(v25, "nodeType") == 2)
        {
          objc_msgSend(v25, "imageBuffer");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v136, "setObject:forKey:", v29, v23);
          goto LABEL_28;
        }
        if (objc_msgSend(v25, "nodeType") == 3)
        {
          if (objc_msgSend(v25, "trackID"))
          {
            v30 = objc_msgSend(v25, "trackID");
            v31 = v176[0];
            if (v176[0])
            {
              v32 = v176;
              do
              {
                v33 = v31;
                v34 = v32;
                v35 = *((_DWORD *)v31 + 8);
                if (v35 >= v30)
                  v32 = (_QWORD **)v31;
                else
                  ++v31;
                v31 = (_QWORD *)*v31;
              }
              while (v31);
              if (v32 != v176)
              {
                if (v35 < v30)
                  v33 = v34;
                if (v30 >= *((_DWORD *)v33 + 8))
                {
                  +[PVImageBuffer imageWithCVPixelBuffer:](PVImageBuffer, "imageWithCVPixelBuffer:", v32[5]);
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v136, "setObject:forKey:", v29, v23);
                  goto LABEL_28;
                }
              }
            }
          }
        }
LABEL_29:

        ++v22;
      }
      while (v22 != v20);
      v36 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v171, v179, 16);
      v20 = v36;
    }
    while (v36);
  }

  -[PVInstructionGraphSourceCompositeNode renderDelegate](self, "renderDelegate");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if (v37
    && (v38 = -[PVInstructionGraphSourceCompositeNode canPreprocess](self, "canPreprocess"), v37, v38))
  {
    -[PVInstructionGraphSourceCompositeNode renderDelegate](self, "renderDelegate");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v167 = *(_OWORD *)&a3->var0;
    v168 = a3->var3;
    -[PVInstructionGraphSourceCompositeNode userContext](self, "userContext");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "preprocessWithInputs:time:userContext:compositeContext:", v136, &v167, v40, v126);
    v41 = objc_claimAutoreleasedReturnValue();

    v42 = (void *)v41;
    -[PVCompositeDelegateContext setPreprocessData:](v126, "setPreprocessData:", v41);
  }
  else
  {
    v42 = 0;
  }
  v124 = v42;
  -[PVInstructionGraphSourceCompositeNode outputSize](self, "outputSize");
  v44 = v43;
  -[PVInstructionGraphSourceCompositeNode outputSize](self, "outputSize");
  v46 = HGRectMake4i(0, 0, (int)v44, (int)v45);
  v48 = v47;
  -[PVInstructionGraphSourceCompositeNode renderDelegate](self, "renderDelegate");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v49 || (v50 = -[PVInstructionGraphSourceCompositeNode canRender](self, "canRender"), v49, !v50))
  {
    v113 = COERCE_DOUBLE(HGObject::operator new(0x1A0uLL));
    HGNode::HGNode(*(HGNode **)&v113);
    goto LABEL_210;
  }
  -[PVInstructionGraphSourceCompositeNode renderDelegate](self, "renderDelegate");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)v131 + 72, v51);
  *((_QWORD *)v131 + 54) = v46;
  *((_QWORD *)v131 + 55) = v48;

  -[PVInstructionGraphSourceCompositeNode metadata](self, "metadata");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)v131 + 74, v52);

  -[PVInstructionGraphSourceCompositeNode userContext](self, "userContext");
  v53 = (objc_object *)objc_claimAutoreleasedReturnValue();
  HGInternalCompNode::SetContexts(v131, v53, v126);

  v54 = *(_OWORD *)&a3->var0;
  *((_QWORD *)v131 + 58) = a3->var3;
  *((_OWORD *)v131 + 28) = v54;
  v163 = 0u;
  v164 = 0u;
  v165 = 0u;
  v166 = 0u;
  -[PVInstructionGraphSourceCompositeNode inputMap](self, "inputMap");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v55 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v163, v178, 16);
  if (!v55)
  {

LABEL_171:
    v113 = *(double *)&v131;
    (*(void (**)(HGInternalCompNode *))(*(_QWORD *)v131 + 16))(v131);
    goto LABEL_172;
  }
  v129 = 0;
  v134 = *(_QWORD *)v164;
  do
  {
    v56 = v55;
    for (i = 0; i != v56; ++i)
    {
      if (*(_QWORD *)v164 != v134)
        objc_enumerationMutation(obj);
      v58 = *(void **)(*((_QWORD *)&v163 + 1) + 8 * i);
      -[PVInstructionGraphSourceCompositeNode inputMap](self, "inputMap");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "objectForKeyedSubscript:", v58);
      v60 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v60, "nodeType") == 1
        || objc_msgSend(v60, "nodeType") == 2
        || objc_msgSend(v60, "nodeType") == 3)
      {
        objc_msgSend(v136, "objectForKeyedSubscript:", v58);
        v61 = (PVImageBuffer *)objc_claimAutoreleasedReturnValue();
        if (v61)
        {
          objc_msgSend(v60, "colorSpace");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v62)
          {
            PVInstructionGraphContext::WorkingColorSpace(*m_Obj);
            v62 = (void *)objc_claimAutoreleasedReturnValue();
          }
          if ((objc_msgSend(v62, "isEqual:", v132) & 1) != 0)
            goto LABEL_116;
          v63 = *m_Obj;
          if (*m_Obj)
            (*(void (**)(PVInstructionGraphContext *))(*(_QWORD *)v63 + 16))(*m_Obj);
          objc_msgSend(v60, "outputSize");
          if (v65 != v8 || v64 != v10)
          {
            PVRenderJob::GetDelegate((PVRenderJob *)*m_Obj);
            v66 = (PVVideoCompositingContext *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v60, "outputSize");
            v68 = v67;
            v70 = v69;
            v71 = (*(uint64_t (**)(PVInstructionGraphContext *))(*(_QWORD *)*m_Obj + 64))(*m_Obj);
            (*(void (**)(CGAffineTransform *__return_ptr))(*(_QWORD *)*m_Obj + 72))(&v150);
            v72 = (PVRendererInstructionGraphContext *)HGObject::operator new(0xA8uLL);
            *(_OWORD *)&lpsrc.time.value = *(_OWORD *)&v150.a;
            lpsrc.time.epoch = *(_QWORD *)&v150.c;
            v184.width = v68;
            v184.height = v70;
            PVRendererInstructionGraphContext::PVRendererInstructionGraphContext(v72, v66, v184, v71, (CMTime *)&lpsrc);
            if (v63 == (PVInstructionGraphContext *)v72)
            {
              if (v63)
                (*(void (**)(PVInstructionGraphContext *))(*(_QWORD *)v63 + 24))(v63);
            }
            else
            {
              if (v63)
                (*(void (**)(PVInstructionGraphContext *))(*(_QWORD *)v63 + 24))(v63);
              v63 = (PVInstructionGraphContext *)v72;
            }

          }
          if (-[PVImageBuffer canCreateCVPixelBuffer](v61, "canCreateCVPixelBuffer"))
          {
            v161 = *(_OWORD *)&a3->var0;
            v162 = a3->var3;
            v160 = v63;
            if (v63)
              (*(void (**)(PVInstructionGraphContext *))(*(_QWORD *)v63 + 16))(v63);
            -[PVInstructionGraphSourceCompositeNode conformInputImage:colorSpace:renderer:currentTime:igContext:](self, "conformInputImage:colorSpace:renderer:currentTime:igContext:", v61, v62, a5, &v161, &v160);
            a = *(double *)&lpsrc.time.value;
            if (lpsrc.time.value)
              lpsrc.time.value = 0;
            if (v160)
              (*(void (**)(PVInstructionGraphContext *))(*(_QWORD *)v160 + 24))(v160);
            if (a != 0.0)
            {
              v159 = a;
              (*(void (**)(CGFloat))(**(_QWORD **)&a + 16))(COERCE_CGFLOAT(*(_QWORD *)&a));
              PVInstructionGraphContext::WorkingColorSpace(v63);
              v85 = (void *)objc_claimAutoreleasedReturnValue();
              v86 = PVInstructionGraphContext::WorkingColorSpaceConformIntent(v63);
              ColorConformInput((HGColorClamp **)&v159, v85, v132, v86, 0, (HGColorConform **)&lpsrc);
              v87 = *(void (**)(_QWORD))(**(_QWORD **)&a + 24);
              if (*(_QWORD *)&a == lpsrc.time.value)
              {
                v87(*(_QWORD *)&a);
              }
              else
              {
                v87(*(_QWORD *)&a);
                a = *(double *)&lpsrc.time.value;
                lpsrc.time.value = 0;
              }

              if (v159 != 0.0)
                (*(void (**)(CGFloat))(**(_QWORD **)&v159 + 24))(COERCE_CGFLOAT(*(_QWORD *)&v159));
            }
          }
          else if (-[PVImageBuffer canCreateHGBitmap](v61, "canCreateHGBitmap")
                 && (-[PVImageBuffer hgBitmapWithColorSpace:](v61, "hgBitmapWithColorSpace:", v62),
                     (value = (HGBitmap *)lpsrc.time.value) != 0))
          {
            v89 = (HGBitmapLoader *)HGObject::operator new(0x1F0uLL);
            HGBitmapLoader::HGBitmapLoader(v89, value);
            v158 = v89;
            if (v89)
              (*(void (**)(HGBitmapLoader *))(*(_QWORD *)v89 + 16))(v89);
            v90 = PVInstructionGraphContext::WorkingColorSpaceConformIntent(v63);
            ColorConformInput(&v158, v62, v132, v90, 0, (HGColorConform **)&v150);
            a = v150.a;
            if (*(_QWORD *)&v150.a)
              v150.a = 0.0;
            if (v158)
              (*(void (**)(HGColorClamp *))(*(_QWORD *)v158 + 24))(v158);
            if (v89)
              (*(void (**)(HGBitmapLoader *))(*(_QWORD *)v89 + 24))(v89);
            if (lpsrc.time.value)
              (*(void (**)(int64_t))(*(_QWORD *)lpsrc.time.value + 24))(lpsrc.time.value);
          }
          else
          {
            a = 0.0;
          }
          if (v63)
            (*(void (**)(PVInstructionGraphContext *))(*(_QWORD *)v63 + 24))(v63);
          if (a == 0.0)
          {
LABEL_116:
            HGInternalCompNode::SetImageInput((uint64_t **)v131, objc_msgSend(v58, "intValue"), v61);
          }
          else
          {
            -[PVImageBuffer size](v61, "size");
            v92 = v91;
            -[PVImageBuffer size](v61, "size");
            v94 = HGRectMake4i(0, 0, (int)v92, (int)v93);
            v96 = v95;
            v97 = objc_msgSend(v58, "intValue");
            *(_QWORD *)&v182.var0 = v94;
            *(_QWORD *)&v182.var2 = v96;
            HGInternalCompNode::SetGraphInput(v131, v97, *(HGNode **)&a, v182);
            (*(void (**)(CGFloat))(**(_QWORD **)&a + 24))(COERCE_CGFLOAT(*(_QWORD *)&a));
          }

        }
        else if (objc_msgSend(v60, "nodeType") == 3)
        {
          v73 = objc_msgSend(v58, "intValue");
          LODWORD(v150.a) = objc_msgSend(v60, "trackID");
          lpsrc.time.value = (int64_t)&v150;
          *((_DWORD *)std::__tree<std::__value_type<int,unsigned int>,std::__map_value_compare<int,std::__value_type<int,unsigned int>,std::less<int>,true>,std::allocator<std::__value_type<int,unsigned int>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>((uint64_t **)v131 + 66, (int *)&v150, (uint64_t)&std::piecewise_construct, (unsigned int **)&lpsrc)+ 8) = v73;
        }

      }
      else if (objc_msgSend(v60, "nodeType") == 4 || objc_msgSend(v60, "nodeType") == 5)
      {
        v74 = *m_Obj;
        if (*m_Obj)
          (*(void (**)(PVInstructionGraphContext *))(*(_QWORD *)v74 + 16))(*m_Obj);
        objc_msgSend(v60, "outputSize");
        if (v76 != v8 || v75 != v10)
        {
          PVRenderJob::GetDelegate((PVRenderJob *)*m_Obj);
          v77 = (PVVideoCompositingContext *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "outputSize");
          v79 = v78;
          v81 = v80;
          v82 = (*(uint64_t (**)(PVInstructionGraphContext *))(*(_QWORD *)*m_Obj + 64))(*m_Obj);
          (*(void (**)(CGAffineTransform *__return_ptr))(*(_QWORD *)*m_Obj + 72))(&v150);
          v83 = (PVRendererInstructionGraphContext *)HGObject::operator new(0xA8uLL);
          *(_OWORD *)&lpsrc.time.value = *(_OWORD *)&v150.a;
          lpsrc.time.epoch = *(_QWORD *)&v150.c;
          v185.width = v79;
          v185.height = v81;
          PVRendererInstructionGraphContext::PVRendererInstructionGraphContext(v83, v77, v185, v82, (CMTime *)&lpsrc);
          if (v74 == (PVInstructionGraphContext *)v83)
          {
            if (v74)
              (*(void (**)(PVInstructionGraphContext *))(*(_QWORD *)v74 + 24))(v74);
          }
          else
          {
            if (v74)
              (*(void (**)(PVInstructionGraphContext *))(*(_QWORD *)v74 + 24))(v74);
            v74 = (PVInstructionGraphContext *)v83;
          }

        }
        objc_msgSend(v60, "graphNode");
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        v156 = *(_OWORD *)&a3->var0;
        v157 = a3->var3;
        v155 = v74;
        if (v74)
          (*(void (**)(PVInstructionGraphContext *))(*(_QWORD *)v74 + 16))(v74);
        if (v98)
          objc_msgSend(v98, "hgNodeForTime:trackInputs:renderer:igContext:", &v156, a4, a5, &v155);
        else
          lpsrc.time.value = 0;
        if (v155)
          (*(void (**)(PVInstructionGraphContext *))(*(_QWORD *)v155 + 24))(v155);

        objc_msgSend(v60, "outputSize");
        v100 = v99;
        objc_msgSend(v60, "outputSize");
        v102 = HGRectMake4i(0, 0, (int)v100, (int)v101);
        v104 = v103;
        v154 = lpsrc.time.value;
        if (lpsrc.time.value)
          (*(void (**)(int64_t))(*(_QWORD *)lpsrc.time.value + 16))(lpsrc.time.value);
        -[PVInstructionGraphSourceCompositeNode conformNode:toSize:](self, "conformNode:toSize:", &v154, v102, v104);
        v105 = v150.a;
        if (v129 == *(HGNode **)&v150.a)
        {
          if (v129)
            (*(void (**)(void))(*(_QWORD *)v129 + 24))();
          else
            v129 = 0;
        }
        else
        {
          if (v129)
          {
            (*(void (**)(void))(*(_QWORD *)v129 + 24))();
            v105 = v150.a;
          }
          v129 = *(HGNode **)&v105;
          v150.a = 0.0;
        }
        if (v154)
          (*(void (**)(int64_t))(*(_QWORD *)v154 + 24))(v154);
        PVInstructionGraphContext::WorkingColorSpace(v74);
        v106 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "colorSpace");
        v107 = (void *)objc_claimAutoreleasedReturnValue();
        v108 = v107 == 0;

        if (!v108)
        {
          objc_msgSend(v60, "colorSpace");
          v109 = objc_claimAutoreleasedReturnValue();

          v106 = (void *)v109;
        }
        if ((objc_msgSend(v106, "isEqual:", v132) & 1) == 0)
        {
          v153 = v129;
          if (v129)
            (*(void (**)(HGNode *))(*(_QWORD *)v129 + 16))(v129);
          v110 = PVInstructionGraphContext::WorkingColorSpaceConformIntent(v74);
          ColorConformInput((HGColorClamp **)&v153, v106, v132, v110, 0, (HGColorConform **)&v150);
          v111 = v150.a;
          if (v129 == *(HGNode **)&v150.a)
          {
            if (v129)
              (*(void (**)(void))(*(_QWORD *)v129 + 24))();
            else
              v129 = 0;
          }
          else
          {
            if (v129)
            {
              (*(void (**)(void))(*(_QWORD *)v129 + 24))();
              v111 = v150.a;
            }
            v129 = *(HGNode **)&v111;
            v150.a = 0.0;
          }
          if (v153)
            (*(void (**)(HGNode *))(*(_QWORD *)v153 + 24))(v153);
        }
        v112 = objc_msgSend(v58, "intValue");
        *(_QWORD *)&v183.var0 = v102;
        *(_QWORD *)&v183.var2 = v104;
        HGInternalCompNode::SetGraphInput(v131, v112, v129, v183);

        if (lpsrc.time.value)
          (*(void (**)(int64_t))(*(_QWORD *)lpsrc.time.value + 24))(lpsrc.time.value);
        if (v74)
          (*(void (**)(PVInstructionGraphContext *))(*(_QWORD *)v74 + 24))(v74);
      }

    }
    v55 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v163, v178, 16);
  }
  while (v55);

  v113 = *(double *)&v131;
  if (v129 == (HGNode *)v131)
    goto LABEL_172;
  if (v129)
    (*(void (**)(HGNode *))(*(_QWORD *)v129 + 24))(v129);
  if (*(double *)&v131 != 0.0)
    goto LABEL_171;
  v113 = 0.0;
LABEL_172:
  PVInstructionGraphContext::WorkingColorSpace(*m_Obj);
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  v117 = objc_msgSend(v132, "isEqual:", v116);

  if ((v117 & 1) == 0)
  {
    v152 = v113;
    if (v113 != 0.0)
      (*(void (**)(CGFloat))(**(_QWORD **)&v113 + 16))(COERCE_CGFLOAT(*(_QWORD *)&v113));
    PVInstructionGraphContext::WorkingColorSpace(*m_Obj);
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    v119 = PVInstructionGraphContext::WorkingColorSpaceConformIntent(*m_Obj);
    ColorConformInput((HGColorClamp **)&v152, v132, v118, v119, 0, (HGColorConform **)&lpsrc);
    if (*(_QWORD *)&v113 == lpsrc.time.value)
    {
      if (v113 != 0.0)
        (*(void (**)(CGFloat))(**(_QWORD **)&v113 + 24))(COERCE_CGFLOAT(*(_QWORD *)&v113));
    }
    else
    {
      if (v113 != 0.0)
        (*(void (**)(CGFloat))(**(_QWORD **)&v113 + 24))(COERCE_CGFLOAT(*(_QWORD *)&v113));
      v113 = *(double *)&lpsrc.time.value;
      lpsrc.time.value = 0;
    }

    if (v152 != 0.0)
      (*(void (**)(CGFloat))(**(_QWORD **)&v152 + 24))(COERCE_CGFLOAT(*(_QWORD *)&v152));
  }
  v151 = v113;
  if (v113 != 0.0)
    (*(void (**)(CGFloat))(**(_QWORD **)&v113 + 16))(COERCE_CGFLOAT(*(_QWORD *)&v113));
  -[PVInstructionGraphSourceNode applyWrapModeToInput:](self, "applyWrapModeToInput:", &v151);
  if (*(_QWORD *)&v113 == lpsrc.time.value)
  {
    if (v113 != 0.0)
      (*(void (**)(CGFloat))(**(_QWORD **)&v113 + 24))(COERCE_CGFLOAT(*(_QWORD *)&v113));
  }
  else
  {
    if (v113 != 0.0)
      (*(void (**)(CGFloat))(**(_QWORD **)&v113 + 24))(COERCE_CGFLOAT(*(_QWORD *)&v113));
    v113 = *(double *)&lpsrc.time.value;
    lpsrc.time.value = 0;
  }
  if (v151 != 0.0)
    (*(void (**)(CGFloat))(**(_QWORD **)&v151 + 24))(COERCE_CGFLOAT(*(_QWORD *)&v151));
  memset(&v150, 0, sizeof(v150));
  CGAffineTransformMakeScale(&t1, v11, v11);
  -[PVInstructionGraphSourceNode transform](self, "transform");
  CGAffineTransformConcat(&v150, &t1, &t2);
  -[PVInstructionGraphSourceNode transformAnimation](self, "transformAnimation");
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  v145 = *(_OWORD *)&a3->var0;
  v146 = a3->var3;
  v121 = +[PVTransformAnimation getTransformInfoFromAnimation:atTime:renderSize:contentMode:invertY:outInfo:](PVTransformAnimation, "getTransformInfoFromAnimation:atTime:renderSize:contentMode:invertY:outInfo:", v120, &v145, -[PVInstructionGraphSourceNode transformAnimationContentMode](self, "transformAnimationContentMode"), 0, &lpsrc, v8, v10);

  if (v121)
  {
    v186.x = v8 * 0.5;
    v186.y = v10 * 0.5;
    memset(&v144, 0, sizeof(v144));
    v143 = lpsrc;
    CGAffineTransformFromPointWithPVAnimInfo(&v143, v186, (uint64_t)&v144);
    v141 = v150;
    v140 = v144;
    CGAffineTransformConcat(&v142, &v141, &v140);
    v150 = v142;
  }
  v139 = v113;
  if (v113 != 0.0)
    (*(void (**)(CGFloat))(**(_QWORD **)&v113 + 16))(COERCE_CGFLOAT(*(_QWORD *)&v113));
  v138 = v150;
  v122 = (*(uint64_t (**)(PVInstructionGraphContext *))(*(_QWORD *)*m_Obj + 64))(*m_Obj);
  HGXFormForCGAffineTransform((HGXForm **)&v139, &v138, v122, (HGXForm **)&v144);
  if (*(_QWORD *)&v113 == *(_QWORD *)&v144.a)
  {
    if (v113 != 0.0)
      (*(void (**)(CGFloat))(**(_QWORD **)&v113 + 24))(COERCE_CGFLOAT(*(_QWORD *)&v113));
  }
  else
  {
    if (v113 != 0.0)
      (*(void (**)(CGFloat))(**(_QWORD **)&v113 + 24))(COERCE_CGFLOAT(*(_QWORD *)&v113));
    v113 = v144.a;
    v144.a = 0.0;
  }
  if (v139 != 0.0)
    (*(void (**)(CGFloat))(**(_QWORD **)&v139 + 24))(COERCE_CGFLOAT(*(_QWORD *)&v139));
LABEL_210:
  *v125 = v113;

  std::__tree<std::__value_type<int,__CVBuffer *>,std::__map_value_compare<int,std::__value_type<int,__CVBuffer *>,std::less<int>,true>,std::allocator<std::__value_type<int,__CVBuffer *>>>::destroy((uint64_t)&v175, v176[0]);
  v123.var0 = (HGNode *)v131;
  if (*(double *)&v131 != 0.0)
    return (HGRef<HGNode>)(*(uint64_t (**)(HGInternalCompNode *))(*(_QWORD *)v131 + 24))(v131);
  return v123;
}

- (PCRect<double>)inputSizeForPVEffect:(id)a3 igContext:(HGRef<PVInstructionGraphContext>)a4
{
  uint64_t v4;
  uint64_t v6;
  id v7;
  double v13;
  double v14;
  void *v15;
  void *v16;
  char v17;
  float64x2_t v18;
  double v19;
  float64x2_t v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  float64x2_t v30;
  float64x2_t v31;
  float64x2_t v32;
  PCRect<double> result;

  v6 = v4;
  v7 = a3;
  *(_QWORD *)v6 = 0;
  *(_QWORD *)(v6 + 8) = 0;
  __asm { FMOV            V0.2D, #-1.0 }
  *(_OWORD *)(v6 + 16) = _Q0;
  -[PVInstructionGraphSourceCompositeNode outputSize](self, "outputSize");
  v28 = v14;
  v29 = v13;
  -[PVInstructionGraphSourceCompositeNode imageBuffer](self, "imageBuffer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "canCreateCVPixelBuffer"))
  {

  }
  else
  {
    -[PVInstructionGraphSourceCompositeNode imageBuffer](self, "imageBuffer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "canCreateHGBitmap");

    if ((v17 & 1) == 0)
      goto LABEL_10;
  }
  if (v29 > 0.0 && v28 > 0.0)
  {
    -[PVInstructionGraphSourceNode transform](self, "transform", v28);
    v18 = vaddq_f64(vmulq_n_f64(v31, v29), vmulq_n_f64(v32, v28));
    v19 = v18.f64[1];
    v30 = v18;
    if (v18.f64[1] >= v18.f64[0])
    {
      objc_msgSend(v7, "outputSize");
      v22 = v19 / v23;
      v20 = v30;
    }
    else
    {
      objc_msgSend(v7, "outputSize");
      v20 = v30;
      v22 = v30.f64[0] / v21;
    }
    *(float64x2_t *)(v6 + 16) = vdivq_f64(v20, (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v22, 0));
  }
LABEL_10:

  result.var3 = v27;
  result.var2 = v26;
  result.var1 = v25;
  result.var0 = v24;
  return result;
}

- (PCMatrix44Tmpl<double>)pixelTransformForPVEffect:(SEL)a3 igContext:(id)a4
{
  double v7;
  double v8;
  double v9;
  double v10;
  int v11;
  int v12;
  double v13;
  double v14;
  double v15;
  float v16;
  float64x2_t v17;
  PCMatrix44Tmpl<double> *result;
  id v19;

  v19 = a4;
  -[PVInstructionGraphSourceCompositeNode outputSize](self, "outputSize");
  v8 = v7;
  v10 = v9;
  v11 = objc_msgSend(v19, "conformToInputAspect");
  if (v10 >= v8)
    v12 = v11;
  else
    v12 = 0;
  if (v12 == 1)
  {
    objc_msgSend(v19, "outputSize");
    v14 = v10 / v13;
  }
  else
  {
    objc_msgSend(v19, "outputSize");
    v14 = v8 / v15;
  }
  retstr->var0[3][3] = 1.0;
  retstr->var0[2][2] = 1.0;
  retstr->var0[1][1] = 1.0;
  retstr->var0[0][0] = 1.0;
  *(_OWORD *)&retstr->var0[0][1] = 0u;
  *(_OWORD *)&retstr->var0[0][3] = 0u;
  *(_OWORD *)&retstr->var0[1][2] = 0u;
  *(_OWORD *)&retstr->var0[2][0] = 0u;
  *(_OWORD *)&retstr->var0[2][3] = 0u;
  *(_OWORD *)&retstr->var0[3][1] = 0u;
  v16 = v14;
  v17 = PCMatrix44Tmpl<double>::leftScale((float64x2_t *)retstr, v16, (float)-v16, 1.0);
  v17.f64[0] = v8 * 0.5;
  PCMatrix44Tmpl<double>::leftTranslate((float64x2_t *)retstr, v17, v10 * 0.5, 0.0);

  return result;
}

- (id)getAllSourceNodes
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  if (-[PVInstructionGraphSourceCompositeNode nodeType](self, "nodeType") == 5)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    -[PVInstructionGraphSourceCompositeNode inputMap](self, "inputMap", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v18;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v18 != v6)
            objc_enumerationMutation(v4);
          v8 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v7);
          -[PVInstructionGraphSourceCompositeNode inputMap](self, "inputMap");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectForKeyedSubscript:", v8);
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v10, "getAllSourceNodes");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "allObjects");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObjectsFromArray:", v12);

          ++v7;
        }
        while (v5 != v7);
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v5);
    }

    objc_msgSend(v3, "addObject:", self);
  }
  else if (-[PVInstructionGraphSourceCompositeNode nodeType](self, "nodeType") == 4)
  {
    -[PVInstructionGraphSourceCompositeNode graphNode](self, "graphNode");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "getAllSourceNodes");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "allObjects");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v15);

  }
  return v3;
}

- (id)requiredSourceTrackIDs
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[PVInstructionGraphSourceCompositeNode inputMap](self, "inputMap", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v16;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(v4);
        v8 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v7);
        -[PVInstructionGraphSourceCompositeNode inputMap](self, "inputMap");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "requiredSourceTrackIDs");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "allObjects");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObjectsFromArray:", v12);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v5);
  }

  if (-[PVInstructionGraphSourceCompositeNode trackID](self, "trackID"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[PVInstructionGraphSourceCompositeNode trackID](self, "trackID"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v13);

  }
  return v3;
}

- (HGRef<HGNode>)nodeForCompositeTrackMap:(const void *)a3
{
  uint64_t ***v3;
  uint64_t ***v5;
  uint64_t **v6;
  uint64_t **v7;

  v5 = v3;
  v6 = (uint64_t **)HGObject::operator new(0x260uLL);
  HGInternalCompNode::HGInternalCompNode((HGInternalCompNode *)v6);
  v7 = v6 + 51;
  if (v6 + 51 != a3)
    v7 = std::__tree<std::__value_type<int,__CVBuffer *>,std::__map_value_compare<int,std::__value_type<int,__CVBuffer *>,std::less<int>,true>,std::allocator<std::__value_type<int,__CVBuffer *>>>::__assign_multi<std::__tree_const_iterator<std::__value_type<int,__CVBuffer *>,std::__tree_node<std::__value_type<int,__CVBuffer *>,void *> *,long>>(v7, *(_QWORD **)a3, (_QWORD *)a3 + 1);
  *v5 = v6;
  return (HGRef<HGNode>)v7;
}

- (id)instructionGraphNodeDescription
{
  void *v2;
  objc_class *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  objc_super v31;
  void *v32;
  void *v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v31.receiver = self;
  v31.super_class = (Class)PVInstructionGraphSourceCompositeNode;
  -[PVInstructionGraphSourceNode instructionGraphNodeDescription](&v31, sel_instructionGraphNodeDescription);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (id)objc_msgSend(v2, "mutableCopy");

  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setObject:forKeyedSubscript:", v4, CFSTR("class"));

  objc_msgSend(v25, "setObject:forKeyedSubscript:", PVCompositeNodeTypeLabel(PVCompositeNodeType)::sNodeTypeLabels[-[PVInstructionGraphSourceCompositeNode nodeType](self, "nodeType")], CFSTR("type"));
  switch(-[PVInstructionGraphSourceCompositeNode nodeType](self, "nodeType"))
  {
    case 1:
      -[PVInstructionGraphSourceCompositeNode imageURL](self, "imageURL");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "absoluteString");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setObject:forKeyedSubscript:", v6, CFSTR("imageURL"));
      goto LABEL_7;
    case 2:
      v7 = (void *)MEMORY[0x1E0CB3940];
      -[PVInstructionGraphSourceCompositeNode imageBuffer](self, "imageBuffer");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "size");
      v9 = v8;
      -[PVInstructionGraphSourceCompositeNode imageBuffer](self, "imageBuffer");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "size");
      objc_msgSend(v7, "stringWithFormat:", CFSTR("[%f x %f]"), v9, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setObject:forKeyedSubscript:", v11, CFSTR("imageBufferSize"));

      goto LABEL_7;
    case 3:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[PVInstructionGraphSourceCompositeNode trackID](self, "trackID"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setObject:forKeyedSubscript:", v5, CFSTR("trackID"));
      goto LABEL_8;
    case 4:
      -[PVInstructionGraphSourceCompositeNode graphNode](self, "graphNode");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "instructionGraphNodeDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setObject:forKeyedSubscript:", v6, CFSTR("graphNode"));
      goto LABEL_7;
    case 5:
      v12 = (void *)MEMORY[0x1E0CB3940];
      -[PVInstructionGraphSourceCompositeNode renderDelegate](self, "renderDelegate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", CFSTR("%@"), v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setObject:forKeyedSubscript:", v6, CFSTR("delegate"));
LABEL_7:

LABEL_8:
      break;
    default:
      break;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  -[PVInstructionGraphSourceCompositeNode inputMap](self, "inputMap");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v34, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v28;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v28 != v16)
          objc_enumerationMutation(v14);
        v18 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v17);
        -[PVInstructionGraphSourceCompositeNode inputMap](self, "inputMap");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "objectForKeyedSubscript:", v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v18, "stringValue");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = v21;
        objc_msgSend(v20, "instructionGraphNodeDescription");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = v22;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v13, "addObject:", v23);
        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v34, 16);
    }
    while (v15);
  }

  if (objc_msgSend(v13, "count"))
    objc_msgSend(v25, "setObject:forKeyedSubscript:", v13, CFSTR("inputs"));

  return v25;
}

- (id)dotTreeLabel:(HGRef<PVInstructionGraphContext>)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v19;
  uint64_t v20;

  v4 = *(_QWORD *)a3.m_Obj;
  v20 = v4;
  if (v4)
    (*(void (**)(uint64_t, SEL))(*(_QWORD *)v4 + 16))(v4, a2);
  v19.receiver = self;
  v19.super_class = (Class)PVInstructionGraphSourceCompositeNode;
  -[PVInstructionGraphNode dotTreeLabel:](&v19, sel_dotTreeLabel_, &v20);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
    (*(void (**)(uint64_t))(*(_QWORD *)v20 + 24))(v20);
  objc_msgSend(v5, "stringByAppendingFormat:", CFSTR(" [%@]"), PVCompositeNodeTypeLabel(PVCompositeNodeType)::sNodeTypeLabels[-[PVInstructionGraphSourceCompositeNode nodeType](self, "nodeType")]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "stringByAppendingFormat:", CFSTR(" [CS: %@]"), *(_QWORD *)&self->_trackID);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  switch(-[PVInstructionGraphSourceCompositeNode nodeType](self, "nodeType"))
  {
    case 1:
      -[PVInstructionGraphSourceCompositeNode imageURL](self, "imageURL");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "absoluteString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringByAppendingFormat:", CFSTR(" [%@]"), v9);
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 2:
      -[PVInstructionGraphSourceCompositeNode imageBuffer](self, "imageBuffer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "size");
      v12 = v11;
      -[PVInstructionGraphSourceCompositeNode imageBuffer](self, "imageBuffer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "size");
      objc_msgSend(v7, "stringByAppendingFormat:", CFSTR(" [%f x %f]"), v12, v13);
      v10 = objc_claimAutoreleasedReturnValue();
LABEL_8:
      v14 = v10;

      v7 = v9;
      goto LABEL_11;
    case 3:
      objc_msgSend(v7, "stringByAppendingFormat:", CFSTR(" [track: %d]"), -[PVInstructionGraphSourceCompositeNode trackID](self, "trackID"));
      v14 = objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    case 5:
      v15 = (void *)MEMORY[0x1E0CB3940];
      -[PVInstructionGraphSourceCompositeNode renderDelegate](self, "renderDelegate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stringWithFormat:", CFSTR("\n[%@]"), v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v17, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\"), CFSTR("\\\"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "stringByAppendingString:", v8);
      v14 = objc_claimAutoreleasedReturnValue();
LABEL_11:

      v7 = v8;
LABEL_12:

      v7 = (void *)v14;
      break;
    default:
      return v7;
  }
  return v7;
}

- (void)addDotTreeLinks:(HGRef<PVInstructionGraphContext>)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void **v12;
  void **v13;
  id obj;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  void *__p[2];
  char v20;
  _QWORD v21[13];
  char v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v18 = (uint64_t *)PVInstructionGraphContext::DotGraph(*(PVInstructionGraphContext **)a3.m_Obj);
  if (HGDotGraph::on((HGDotGraph *)v18))
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    -[PVInstructionGraphSourceCompositeNode inputMap](self, "inputMap");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v4)
    {
      v17 = *(_QWORD *)v25;
      v5 = *MEMORY[0x1E0DE4F50];
      v15 = *(_QWORD *)(MEMORY[0x1E0DE4F50] + 72);
      v16 = *(_QWORD *)(MEMORY[0x1E0DE4F50] + 64);
      v6 = MEMORY[0x1E0DE4FB8] + 16;
      do
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v25 != v17)
            objc_enumerationMutation(obj);
          v8 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          -[PVInstructionGraphSourceCompositeNode inputMap](self, "inputMap");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectForKeyedSubscript:", v8);
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)v21);
          objc_msgSend(v8, "intValue");
          std::ostream::operator<<();
          if (objc_msgSend(v10, "nodeType") == 4)
          {
            objc_msgSend(v10, "graphNode");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            std::stringbuf::str();
            if (v20 >= 0)
              v12 = __p;
            else
              v12 = (void **)__p[0];
            HGDotGraph::link(v18, (unint64_t)v11, (unint64_t)self, (const char *)v12, 0);
            if (v20 < 0)
              operator delete(__p[0]);

          }
          else
          {
            std::stringbuf::str();
            if (v20 >= 0)
              v13 = __p;
            else
              v13 = (void **)__p[0];
            HGDotGraph::link(v18, (unint64_t)v10, (unint64_t)self, (const char *)v13, 0);
            if (v20 < 0)
              operator delete(__p[0]);
          }
          v21[0] = v5;
          *(_QWORD *)((char *)v21 + *(_QWORD *)(v5 - 24)) = v16;
          v21[2] = v15;
          v21[3] = v6;
          if (v22 < 0)
            operator delete((void *)v21[11]);
          std::streambuf::~streambuf();
          std::iostream::~basic_iostream();
          MEMORY[0x1B5E290BC](&v23);

        }
        v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v4);
    }

  }
}

- (PVColorSpace)colorSpace
{
  return *(PVColorSpace **)&self->_trackID;
}

- (void)setColorSpace:(id)a3
{
  objc_storeStrong((id *)&self->_trackID, a3);
}

- (int)nodeType
{
  return HIDWORD(self->_renderManager.m_Obj);
}

- (void)setNodeType:(int)a3
{
  HIDWORD(self->_renderManager.m_Obj) = a3;
}

- (int)trackID
{
  return *(_DWORD *)&self->_canPreprocess;
}

- (void)setTrackID:(int)a3
{
  *(_DWORD *)&self->_canPreprocess = a3;
}

- (NSURL)imageURL
{
  return (NSURL *)self->_colorSpace;
}

- (void)setImageURL:(id)a3
{
  objc_storeStrong((id *)&self->_colorSpace, a3);
}

- (NSString)imageKey
{
  return (NSString *)&self->_imageURL->super.isa;
}

- (void)setImageKey:(id)a3
{
  objc_storeStrong((id *)&self->_imageURL, a3);
}

- (PVImageBuffer)imageBuffer
{
  return (PVImageBuffer *)self->_imageKey;
}

- (void)setImageBuffer:(id)a3
{
  objc_storeStrong((id *)&self->_imageKey, a3);
}

- (CGSize)outputSize
{
  PVCompositeDelegateEffect *delegateEffect;
  double width;
  CGSize result;

  delegateEffect = self->_delegateEffect;
  width = self->_outputSize.width;
  result.height = width;
  result.width = *(double *)&delegateEffect;
  return result;
}

- (void)setOutputSize:(CGSize)a3
{
  *(CGSize *)&self->_delegateEffect = a3;
}

- (unsigned)outputFormat
{
  return self->_nodeType;
}

- (void)setOutputFormat:(unsigned int)a3
{
  self->_nodeType = a3;
}

- (PVInstructionGraphNode)graphNode
{
  return (PVInstructionGraphNode *)self->_imageBuffer;
}

- (void)setGraphNode:(id)a3
{
  objc_storeStrong((id *)&self->_imageBuffer, a3);
}

- (NSDictionary)inputMap
{
  return (NSDictionary *)self->_graphNode;
}

- (void)setInputMap:(id)a3
{
  objc_storeStrong((id *)&self->_graphNode, a3);
}

- (PVImageSeqDelegate)imageSeqDelegate
{
  return (PVImageSeqDelegate *)self->_inputMap;
}

- (void)setImageSeqDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_inputMap, a3);
}

- (PVCompositeDelegate)renderDelegate
{
  return self->_imageSeqDelegate;
}

- (void)setRenderDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_imageSeqDelegate, a3);
}

- (NSObject)metadata
{
  return self->_renderDelegate;
}

- (void)setMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_renderDelegate, a3);
}

- (id)userContext
{
  return self->_metadata;
}

- (void)setUserContext:(id)a3
{
  objc_storeStrong((id *)&self->_metadata, a3);
}

- (BOOL)canPreprocess
{
  return (BOOL)self->_renderManager.m_Obj;
}

- (void)setCanPreprocess:(BOOL)a3
{
  LOBYTE(self->_renderManager.m_Obj) = a3;
}

- (BOOL)canRender
{
  return BYTE1(self->_renderManager.m_Obj);
}

- (void)setCanRender:(BOOL)a3
{
  BYTE1(self->_renderManager.m_Obj) = a3;
}

- (PVCompositeDelegateEffect)delegateEffect
{
  return (PVCompositeDelegateEffect *)self->_userContext;
}

- (void)setDelegateEffect:(id)a3
{
  objc_storeStrong(&self->_userContext, a3);
}

- (void).cxx_destruct
{
  CGFloat ty;

  objc_storeStrong(&self->_userContext, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_renderDelegate, 0);
  objc_storeStrong((id *)&self->_imageSeqDelegate, 0);
  objc_storeStrong((id *)&self->_inputMap, 0);
  objc_storeStrong((id *)&self->_graphNode, 0);
  objc_storeStrong((id *)&self->_imageBuffer, 0);
  objc_storeStrong((id *)&self->_imageKey, 0);
  objc_storeStrong((id *)&self->_imageURL, 0);
  objc_storeStrong((id *)&self->_colorSpace, 0);
  objc_storeStrong((id *)&self->_trackID, 0);
  ty = self->super._transform.ty;
  if (ty != 0.0)
    (*(void (**)(CGFloat))(**(_QWORD **)&ty + 24))(COERCE_CGFLOAT(*(_QWORD *)&ty));
}

- (id).cxx_construct
{
  *((_QWORD *)self + 12) = 0;
  return self;
}

@end
