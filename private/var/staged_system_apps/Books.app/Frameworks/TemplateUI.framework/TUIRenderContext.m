@implementation TUIRenderContext

- (TUIRenderContext)init
{
  return -[TUIRenderContext initWithIdentifierMap:embeddedIdentifierMaps:embeddedUpdateControllerMap:embeddedUUIDMap:environment:uid:UUID:entry:layoutQueue:renderMode:](self, "initWithIdentifierMap:embeddedIdentifierMaps:embeddedUpdateControllerMap:embeddedUUIDMap:environment:uid:UUID:entry:layoutQueue:renderMode:", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
}

- (TUIRenderContext)initWithIdentifierMap:(id)a3 embeddedIdentifierMaps:(id)a4 embeddedUpdateControllerMap:(id)a5 embeddedUUIDMap:(id)a6 environment:(id)a7 uid:(id)a8 UUID:(id)a9 entry:(id)a10 layoutQueue:(id)a11 renderMode:(unint64_t)a12
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  TUIRenderContext *v24;
  TUIRenderContext *v25;
  NSDictionary *v26;
  NSDictionary *previousEmbeddedIdentifierMaps;
  NSDictionary *v28;
  NSDictionary *previousEmbeddedUpdateControllerMap;
  NSDictionary *v30;
  NSDictionary *previousEmbeddedUUIDMap;
  TUIEnvironment *environment;
  TUIEnvironment *v33;
  double v34;
  TUIEnvironment *v35;
  double v36;
  unint64_t v37;
  TUILiveTransform *currentLiveTransform;
  NSString *v39;
  NSString *uid;
  NSUUID *v41;
  NSUUID *UUID;
  void *v43;
  id v45;
  id v46;
  id v47;
  id v48;
  objc_super v49;

  v48 = a3;
  v19 = a4;
  v20 = a5;
  v21 = a6;
  v47 = a7;
  v22 = a8;
  v23 = a9;
  v46 = a10;
  v45 = a11;
  v49.receiver = self;
  v49.super_class = (Class)TUIRenderContext;
  v24 = -[TUIRenderContext init](&v49, "init");
  v25 = v24;
  if (v24)
  {
    objc_storeStrong((id *)&v24->_identifierMap, a3);
    v26 = (NSDictionary *)objc_msgSend(v19, "copy");
    previousEmbeddedIdentifierMaps = v25->_previousEmbeddedIdentifierMaps;
    v25->_previousEmbeddedIdentifierMaps = v26;

    v28 = (NSDictionary *)objc_msgSend(v20, "copy");
    previousEmbeddedUpdateControllerMap = v25->_previousEmbeddedUpdateControllerMap;
    v25->_previousEmbeddedUpdateControllerMap = v28;

    v30 = (NSDictionary *)objc_msgSend(v21, "copy");
    previousEmbeddedUUIDMap = v25->_previousEmbeddedUUIDMap;
    v25->_previousEmbeddedUUIDMap = v30;

    objc_storeStrong((id *)&v25->_layoutQueue, a11);
    objc_storeStrong((id *)&v25->_environment, a7);
    environment = v25->_environment;
    if (environment)
    {
      -[TUIEnvironment contentsScale](environment, "contentsScale");
      v33 = v25->_environment;
      v25->_contentsScale = v34;
      if (v33)
      {
        -[TUIEnvironment viewSize](v33, "viewSize");
        v35 = v25->_environment;
        v25->_width = v36;
        if (v35)
        {
          v37 = -[TUIEnvironment layoutDirection](v35, "layoutDirection");
LABEL_9:
          v25->_layoutDirection = v37;
          currentLiveTransform = v25->_currentLiveTransform;
          v25->_currentLiveTransform = 0;

          v39 = (NSString *)objc_msgSend(v22, "copy");
          uid = v25->_uid;
          v25->_uid = v39;

          v41 = (NSUUID *)objc_msgSend(v23, "copy");
          UUID = v25->_UUID;
          v25->_UUID = v41;

          objc_storeStrong((id *)&v25->_entry, a10);
          v25->_renderMode = a12;
          v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
          v25->_debugVisualLayout = objc_msgSend(v43, "BOOLForKey:", CFSTR("TUIDebugVisualLayout"));

          goto LABEL_10;
        }
LABEL_8:
        v37 = 1;
        goto LABEL_9;
      }
    }
    else
    {
      v25->_contentsScale = 2.0;
    }
    v25->_width = 0.0;
    goto LABEL_8;
  }
LABEL_10:

  return v25;
}

- (unint64_t)_renderModelChildKind:(unint64_t)a3
{
  unint64_t v3;

  v3 = a3 - 2;
  if (a3 - 2 < 8 && ((0xB1u >> v3) & 1) != 0)
    return qword_22FC98[v3];
  if (a3 == 5)
    return 6;
  return a3;
}

- (id)renderModelForLayout:(id)a3 kind:(unint64_t)a4
{
  id v6;
  unint64_t v7;
  NSMutableArray *v8;
  double v9;
  double v10;
  void *v11;
  CGAffineTransform v13;
  CGAffineTransform v14;

  v6 = a3;
  v7 = -[TUIRenderContext _renderModelChildKind:](self, "_renderModelChildKind:", a4);
  v8 = objc_opt_new(NSMutableArray);
  objc_msgSend(v6, "computedNaturalSize");
  memset(&v14, 0, sizeof(v14));
  CGAffineTransformMakeTranslation(&v14, v9 * 0.5, v10 * 0.5);
  v13 = v14;
  objc_msgSend(v6, "appendRenderModelCompatibleWithKind:context:transform:toModels:", v7, self, &v13, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderContext renderModelForLayout:submodels:kind:](self, "renderModelForLayout:submodels:kind:", v6, v8, a4));

  return v11;
}

- (id)renderModelForContainerLayout:(id)a3 kind:(unint64_t)a4
{
  id v6;
  unint64_t v7;
  NSMutableArray *v8;
  double v9;
  double v10;
  void *v11;
  CGAffineTransform v13;
  CGAffineTransform v14;

  v6 = a3;
  v7 = -[TUIRenderContext _renderModelChildKind:](self, "_renderModelChildKind:", a4);
  v8 = objc_opt_new(NSMutableArray);
  objc_msgSend(v6, "computedNaturalSize");
  memset(&v14, 0, sizeof(v14));
  CGAffineTransformMakeTranslation(&v14, v9 * 0.5, v10 * 0.5);
  v13 = v14;
  objc_msgSend(v6, "appendChildRenderModelCompatibleWithKind:context:transform:toModels:", v7, self, &v13, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderContext renderModelForLayout:submodels:kind:](self, "renderModelForLayout:submodels:kind:", v6, v8, a4));

  return v11;
}

- (id)renderModelConvertModels:(id)a3 toKind:(unint64_t)a4
{
  id v6;
  NSMutableArray *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v6 = a3;
  v7 = objc_opt_new(NSMutableArray);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderContext _convertModel:toKind:](self, "_convertModel:toKind:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v12), a4, (_QWORD)v15));
        -[NSMutableArray addObject:](v7, "addObject:", v13);

        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  return v7;
}

- (id)renderModelForLayout:(id)a3 submodels:(id)a4 kind:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  TUIRenderModelLayer *v11;
  __objc2_class *v12;
  TUIContainerLayerConfig *v13;
  TUIRenderModelAuxiliary *v14;
  void *v15;
  void *v16;
  NSMutableDictionary *v17;
  BOOL v18;
  double width;
  id v20;
  TUIRenderModelSection *v21;
  TUIFeedEntry *entry;
  TUIRenderModelIdentifierMap *identifierMap;
  OS_dispatch_queue *layoutQueue;
  double v25;
  double v26;
  void *v27;
  void *v28;
  _BYTE v30[8];
  double v31;
  id v32;

  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderContext renderModelConvertModels:toKind:](self, "renderModelConvertModels:toKind:", v9, -[TUIRenderContext _renderModelChildKind:](self, "_renderModelChildKind:", a5)));

  v11 = 0;
  switch(a5)
  {
    case 2uLL:
      v12 = TUIRenderModelImage;
      goto LABEL_6;
    case 3uLL:
      v13 = -[TUIContainerLayerConfig initWithSize:]([TUIContainerLayerConfig alloc], "initWithSize:", CGSizeZero.width, CGSizeZero.height);
      v11 = -[TUIRenderModelLayer initWithSubmodels:config:erasableInsets:]([TUIRenderModelLayer alloc], "initWithSubmodels:config:erasableInsets:", v10, v13, UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
      goto LABEL_8;
    case 5uLL:
      v14 = (TUIRenderModelAuxiliary *)objc_msgSend(v8, "newRenderModelCompatibleWithKind:context:", 5, self);
      goto LABEL_10;
    case 6uLL:
      v12 = TUIRenderModelSubviews;
LABEL_6:
      v14 = (TUIRenderModelAuxiliary *)objc_msgSend([v12 alloc], "initWithSubmodels:", v10);
      goto LABEL_10;
    case 7uLL:
      v13 = objc_alloc_init(TUILayoutRenderModelCollector);
      -[TUIContainerLayerConfig collectWithRoot:options:entryUUID:](v13, "collectWithRoot:options:entryUUID:", v8, 6, self->_UUID);
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[TUIContainerLayerConfig finalizeImpressions](v13, "finalizeImpressions"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[TUIContainerLayerConfig finalizeLinkEntities](v13, "finalizeLinkEntities"));
      v17 = objc_opt_new(NSMutableDictionary);
      objc_msgSend(v8, "appendHoverRegions:relativeToLayout:", v17, v8);
      memset(&v30[1], 0, 7);
      v18 = self->_layoutDirection == 2;
      width = self->_width;
      v20 = objc_msgSend(v8, "computeZIndexWithDefault:", 0);
      v21 = [TUIRenderModelSection alloc];
      entry = self->_entry;
      identifierMap = self->_identifierMap;
      layoutQueue = self->_layoutQueue;
      v30[0] = v18;
      v31 = width;
      v32 = v20;
      v11 = -[TUIRenderModelSection initWithEntry:submodels:config:impressions:linkEntities:hoverRegions:identifierMap:layoutQueue:](v21, "initWithEntry:submodels:config:impressions:linkEntities:hoverRegions:identifierMap:layoutQueue:", entry, v10, v30, v15, v16, v17, identifierMap, layoutQueue);

LABEL_8:
      break;
    case 9uLL:
      v14 = -[TUIRenderModelAuxiliary initWithNavigationItems:]([TUIRenderModelAuxiliary alloc], "initWithNavigationItems:", v10);
LABEL_10:
      v11 = (TUIRenderModelLayer *)v14;
      break;
    default:
      break;
  }
  objc_msgSend(v8, "computedTransformedSize");
  -[TUIRenderModelLayer setSize:](v11, "setSize:", TUISizeRoundedForScale(v25, v26, self->_contentsScale));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "box"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "identifier"));
  -[TUIRenderModelLayer setIdentifier:](v11, "setIdentifier:", v28);

  return v11;
}

- (id)_convertDrawModel:(id)a3 toKind:(unint64_t)a4
{
  TUIRenderModelImage *v6;
  TUIRenderModelImage *v7;
  TUIRenderModelImage *v8;
  _TUIDrawLayerConfig *v9;
  TUIRenderModelImage *v10;
  TUIRenderModelImage *v11;
  _TUIDrawLayerConfig *v12;
  void *v13;
  TUIRenderModelLayer *v14;
  TUIRenderModelImage *v15;
  void *v16;
  TUIRenderModelImage *v18;

  v6 = (TUIRenderModelImage *)a3;
  v7 = v6;
  if (a4 == 2)
  {
    v8 = [TUIRenderModelImage alloc];
    v18 = v7;
    v9 = (_TUIDrawLayerConfig *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v18, 1));
    v10 = -[TUIRenderModelImage initWithSubmodels:](v8, "initWithSubmodels:", v9);
  }
  else
  {
    v11 = v6;
    if (a4 < 3)
      goto LABEL_7;
    v12 = [_TUIDrawLayerConfig alloc];
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelImage draw](v7, "draw"));
    v9 = -[_TUIDrawLayerConfig initWithDraw:contentsScale:renderMode:](v12, "initWithDraw:contentsScale:renderMode:", v13, self->_renderMode, self->_contentsScale);

    v14 = [TUIRenderModelLayer alloc];
    -[TUIRenderModelImage eraseableInsets](v7, "eraseableInsets");
    v10 = -[TUIRenderModelLayer initWithSubmodels:config:erasableInsets:](v14, "initWithSubmodels:config:erasableInsets:", 0, v9);
  }
  v15 = v10;

  v11 = v7;
  if (v15 != v7)
  {
    -[TUIRenderModelImage size](v7, "size");
    -[TUIRenderModelImage setSize:](v15, "setSize:");
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelImage identifier](v7, "identifier"));
    -[TUIRenderModelImage setIdentifier:](v15, "setIdentifier:", v16);

    v11 = v15;
  }
LABEL_7:

  return v11;
}

- (id)_convertLayerModel:(id)a3 toKind:(unint64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a3;
  v6 = v5;
  v7 = v5;
  if (a4 >= 4)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[TUILayerContainerView renderModelWithLayerModel:identifier:](TUILayerContainerView, "renderModelWithLayerModel:identifier:", v6, v8));

    v7 = v6;
    if (v9 != v6)
    {
      objc_msgSend(v6, "size");
      objc_msgSend(v9, "setSize:");
      v7 = v9;
    }
  }

  return v7;
}

- (id)_convertModel:(id)a3 toKind:(unint64_t)a4
{
  id v6;
  void *v7;
  uint64_t v8;

  v6 = a3;
  v7 = v6;
  if ((unint64_t)objc_msgSend(v6, "kind") < a4)
  {
    v7 = v6;
    if (objc_msgSend(v6, "kind") == (char *)&dword_0 + 1)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderContext _convertDrawModel:toKind:](self, "_convertDrawModel:toKind:", v6, a4));

    }
  }
  if ((unint64_t)objc_msgSend(v7, "kind") < a4 && objc_msgSend(v7, "kind") == (char *)&dword_0 + 3)
  {
    v8 = objc_claimAutoreleasedReturnValue(-[TUIRenderContext _convertLayerModel:toKind:](self, "_convertLayerModel:toKind:", v7, a4));

    v7 = (void *)v8;
  }

  return v7;
}

- (void)evaluateWithIdentifierMap:(id)a3 block:(id)a4
{
  id v7;
  TUIRenderModelIdentifierMap **p_identifierMap;
  TUIRenderModelIdentifierMap *identifierMap;
  TUIRenderModelIdentifierMap *v10;
  void (**v11)(void);
  TUIRenderModelIdentifierMap *v12;
  id v13;

  v7 = a3;
  if (v7 && a4)
  {
    identifierMap = self->_identifierMap;
    p_identifierMap = &self->_identifierMap;
    v13 = v7;
    v10 = identifierMap;
    objc_storeStrong((id *)p_identifierMap, a3);
    v11 = (void (**)(void))a4;
    v11[2]();

    v12 = *p_identifierMap;
    *p_identifierMap = v10;

    v7 = v13;
  }

}

- (void)evaluateWithWidth:(double)a3 layoutDirection:(unint64_t)a4 block:(id)a5
{
  double width;
  unint64_t layoutDirection;

  if (a5)
  {
    width = self->_width;
    layoutDirection = self->_layoutDirection;
    self->_width = a3;
    self->_layoutDirection = a4;
    (*((void (**)(id, SEL))a5 + 2))(a5, a2);
    self->_width = width;
    self->_layoutDirection = layoutDirection;
  }
}

- (void)evaluateWithLiveTransform:(id)a3 block:(id)a4
{
  id v7;
  TUILiveTransform **p_currentLiveTransform;
  TUILiveTransform *currentLiveTransform;
  TUILiveTransform *v10;
  void (**v11)(void);
  TUILiveTransform *v12;
  id v13;

  v7 = a3;
  if (v7 && a4)
  {
    currentLiveTransform = self->_currentLiveTransform;
    p_currentLiveTransform = &self->_currentLiveTransform;
    v13 = v7;
    v10 = currentLiveTransform;
    objc_storeStrong((id *)p_currentLiveTransform, a3);
    v11 = (void (**)(void))a4;
    v11[2]();

    v12 = *p_currentLiveTransform;
    *p_currentLiveTransform = v10;

    v7 = v13;
  }

}

- (void)evaluateWithPointer:(id)a3 block:(id)a4
{
  id v7;
  TUIPointer **p_currentPointer;
  TUIPointer *currentPointer;
  TUIPointer *v10;
  void (**v11)(void);
  TUIPointer *v12;
  id v13;

  v7 = a3;
  if (a4)
  {
    currentPointer = self->_currentPointer;
    p_currentPointer = &self->_currentPointer;
    v13 = v7;
    v10 = currentPointer;
    objc_storeStrong((id *)p_currentPointer, a3);
    v11 = (void (**)(void))a4;
    v11[2]();

    v12 = *p_currentPointer;
    *p_currentPointer = v10;

    v7 = v13;
  }

}

- (id)embeddedIdentifierMapForIdentifier:(id)a3
{
  id v4;
  TUIRenderModelIdentifierMap *v5;

  v4 = a3;
  if (!v4
    || (v5 = (TUIRenderModelIdentifierMap *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_previousEmbeddedIdentifierMaps, "objectForKeyedSubscript:", v4))) == 0)
  {
    v5 = objc_alloc_init(TUIRenderModelIdentifierMap);
  }

  return v5;
}

- (id)embeddedUUIDForIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (!v4
    || (v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_previousEmbeddedUUIDMap, "objectForKeyedSubscript:", v4))) == 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  }

  return v5;
}

- (id)embeddedUpdateControllerForIdentifier:(id)a3 renderModel:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  TUIRenderUpdateCollectionController *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  if (v6
    && (v8 = objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_previousEmbeddedUpdateControllerMap, "objectForKeyedSubscript:", v6))) != 0)
  {
    v9 = (TUIRenderUpdateCollectionController *)v8;
    if (v7)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderContext transactionGroup](self, "transactionGroup"));
      -[TUIRenderUpdateCollectionController updateWithRenderModel:viewState:flags:transactionGroup:](v9, "updateWithRenderModel:viewState:flags:transactionGroup:", v7, 0, 0, v10);

    }
  }
  else
  {
    v9 = -[TUIRenderUpdateCollectionController initWithLayoutQueue:renderModel:]([TUIRenderUpdateCollectionController alloc], "initWithLayoutQueue:renderModel:", self->_layoutQueue, v7);
  }

  return v9;
}

- (TUIEnvironment)environment
{
  return self->_environment;
}

- (double)contentsScale
{
  return self->_contentsScale;
}

- (double)width
{
  return self->_width;
}

- (unint64_t)layoutDirection
{
  return self->_layoutDirection;
}

- (TUIManager)manager
{
  return self->_manager;
}

- (void)setManager:(id)a3
{
  objc_storeStrong((id *)&self->_manager, a3);
}

- (TUIRenderModelIdentifierMap)identifierMap
{
  return self->_identifierMap;
}

- (OS_dispatch_queue)layoutQueue
{
  return self->_layoutQueue;
}

- (TUITransactionGroup)transactionGroup
{
  return self->_transactionGroup;
}

- (void)setTransactionGroup:(id)a3
{
  objc_storeStrong((id *)&self->_transactionGroup, a3);
}

- (TUILiveTransform)currentLiveTransform
{
  return self->_currentLiveTransform;
}

- (void)setCurrentLiveTransform:(id)a3
{
  objc_storeStrong((id *)&self->_currentLiveTransform, a3);
}

- (TUIPointer)currentPointer
{
  return self->_currentPointer;
}

- (TUIFeedEntry)entry
{
  return self->_entry;
}

- (void)setEntry:(id)a3
{
  objc_storeStrong((id *)&self->_entry, a3);
}

- (NSString)uid
{
  return self->_uid;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (BOOL)debugVisualLayout
{
  return self->_debugVisualLayout;
}

- (NSDictionary)previousEmbeddedIdentifierMaps
{
  return self->_previousEmbeddedIdentifierMaps;
}

- (NSDictionary)previousEmbeddedUpdateControllerMap
{
  return self->_previousEmbeddedUpdateControllerMap;
}

- (NSDictionary)previousEmbeddedUUIDMap
{
  return self->_previousEmbeddedUUIDMap;
}

- (unint64_t)renderMode
{
  return self->_renderMode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousEmbeddedUUIDMap, 0);
  objc_storeStrong((id *)&self->_previousEmbeddedUpdateControllerMap, 0);
  objc_storeStrong((id *)&self->_previousEmbeddedIdentifierMaps, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_uid, 0);
  objc_storeStrong((id *)&self->_entry, 0);
  objc_storeStrong((id *)&self->_currentPointer, 0);
  objc_storeStrong((id *)&self->_currentLiveTransform, 0);
  objc_storeStrong((id *)&self->_transactionGroup, 0);
  objc_storeStrong((id *)&self->_layoutQueue, 0);
  objc_storeStrong((id *)&self->_identifierMap, 0);
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong((id *)&self->_environment, 0);
}

@end
