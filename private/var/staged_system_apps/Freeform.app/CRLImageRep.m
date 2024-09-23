@implementation CRLImageRep

- (CRLImageRep)initWithLayout:(id)a3 canvas:(id)a4
{
  id v6;
  CRLImageRep *v7;
  CRLImageRep *v8;
  void *v9;
  NSUUID *v10;
  NSUUID *downloadObserverIdentifier;
  void *v12;
  CRLImageRep *v13;
  void *v14;
  NSMutableArray *v15;
  NSMutableArray *updateFromLayoutBlocks;
  dispatch_semaphore_t v17;
  OS_dispatch_semaphore *updateFromLayoutBlocksLock;
  CRLImageRepDrawingHelper *v19;
  CRLImageRepDrawingHelper *drawingHelper;
  CRLRemoveImageBackgroundData *v21;
  CRLRemoveImageBackgroundData *cachedRemoveImageBackgroundData;
  NSMutableDictionary *v23;
  NSMutableDictionary *hitTestCache;
  objc_super v26;

  v6 = a4;
  v26.receiver = self;
  v26.super_class = (Class)CRLImageRep;
  v7 = -[CRLCanvasRep initWithLayout:canvas:](&v26, "initWithLayout:canvas:", a3, v6);
  v8 = v7;
  if (v7)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageInfo](v7, "imageInfo"));

    if (v9)
    {
      v10 = (NSUUID *)objc_alloc_init((Class)NSUUID);
      downloadObserverIdentifier = v8->_downloadObserverIdentifier;
      v8->_downloadObserverIdentifier = v10;

      v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageInfo](v8, "imageInfo"));
      v13 = (CRLImageRep *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "imageAssetPayload"));

      if (v13)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[CRLImageProviderPool sharedPool](CRLImageProviderPool, "sharedPool"));
        objc_msgSend(v14, "addInterestInProviderForAsset:", v13);

      }
      v15 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
      updateFromLayoutBlocks = v8->_updateFromLayoutBlocks;
      v8->_updateFromLayoutBlocks = v15;

      v17 = dispatch_semaphore_create(1);
      updateFromLayoutBlocksLock = v8->_updateFromLayoutBlocksLock;
      v8->_updateFromLayoutBlocksLock = (OS_dispatch_semaphore *)v17;

      v19 = -[CRLImageRepDrawingHelper initWithRep:]([CRLImageRepDrawingHelper alloc], "initWithRep:", v8);
      drawingHelper = v8->_drawingHelper;
      v8->_drawingHelper = v19;

      v8->_imageForRemoveBackgroundAssetDataHash = 0x7FFFFFFFFFFFFFFFLL;
      v8->_autoBackgroundRemovalState = 0;
      v8->_userInitiatedBackgroundRemovalState = 0;
      v21 = objc_alloc_init(CRLRemoveImageBackgroundData);
      cachedRemoveImageBackgroundData = v8->_cachedRemoveImageBackgroundData;
      v8->_cachedRemoveImageBackgroundData = v21;

      v8->_backgroundRemovalLock._os_unfair_lock_opaque = 0;
      __dmb(0xBu);
      if (objc_msgSend(v6, "isCanvasInteractive"))
        -[CRLImageRep p_listenForAssetChangesIfAppropriate](v8, "p_listenForAssetChangesIfAppropriate");
      v23 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      hitTestCache = v8->_hitTestCache;
      v8->_hitTestCache = v23;

      if (objc_msgSend(v6, "isCanvasInteractive"))
        -[CRLImageRep p_updateDirectlyManagesLayerContentForRenderable:](v8, "p_updateDirectlyManagesLayerContentForRenderable:", 0);
    }
    else
    {
      v13 = v8;
      v8 = 0;
    }

  }
  return v8;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  CGImage *imageForRemoveBackground;
  objc_super v7;

  -[CRLCanvasRenderable setDelegate:](self->_strokeRenderable, "setDelegate:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageInfo](self, "imageInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "imageAssetPayload"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[CRLImageProviderPool sharedPool](CRLImageProviderPool, "sharedPool"));
    objc_msgSend(v5, "removeInterestInProviderForAsset:", v4);

  }
  imageForRemoveBackground = self->_imageForRemoveBackground;
  if (imageForRemoveBackground)
  {
    CFRelease(imageForRemoveBackground);
    self->_imageForRemoveBackground = 0;
  }

  v7.receiver = self;
  v7.super_class = (Class)CRLImageRep;
  -[CRLCanvasRep dealloc](&v7, "dealloc");
}

- (_TtC8Freeform12CRLImageItem)imageInfo
{
  double v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;

  *(_QWORD *)&v3 = objc_opt_class(_TtC8Freeform12CRLImageItem, a2).n128_u64[0];
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep info](self, "info", v3));
  v7 = sub_100221D0C(v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  return (_TtC8Freeform12CRLImageItem *)v8;
}

- (CRLImageLayout)imageLayout
{
  double v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;

  *(_QWORD *)&v3 = objc_opt_class(CRLImageLayout, a2).n128_u64[0];
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout", v3));
  v7 = sub_100221D0C(v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  return (CRLImageLayout *)v8;
}

- (CRLMaskInfo)maskInfo
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageInfo](self, "imageInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "maskInfo"));

  return (CRLMaskInfo *)v3;
}

- (CRLMaskLayout)maskLayout
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self, "imageLayout"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "maskLayout"));

  return (CRLMaskLayout *)v3;
}

- (void)willBeRemoved
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CRLImageRep;
  -[CRLCanvasRep willBeRemoved](&v11, "willBeRemoved");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self, "imageLayout"));
  v4 = objc_msgSend(v3, "isInMaskEditMode");

  if (v4)
    -[CRLImageRep p_endEditingMask](self, "p_endEditingMask");
  -[CRLImageRepDrawingHelper teardown](self->_drawingHelper, "teardown");
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_updateFromLayoutBlocksLock, 0xFFFFFFFFFFFFFFFFLL);
  -[NSMutableArray removeAllObjects](self->_updateFromLayoutBlocks, "removeAllObjects");
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_updateFromLayoutBlocksLock);
  if (!self->_downloadObserverIdentifier)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101250388);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E1E320();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012503A8);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageRep willBeRemoved]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageRep.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 237, 0, "invalid nil value for '%{public}s'", "_downloadObserverIdentifier");

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageInfo](self, "imageInfo"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "store"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "assetManager"));
  objc_msgSend(v10, "removeAllDownloadObserversWithIdentifier:", self->_downloadObserverIdentifier);

}

- (id)layoutsForChildReps
{
  NSArray *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  objc_super v12;
  void *v13;

  v12.receiver = self;
  v12.super_class = (Class)CRLImageRep;
  v3 = -[CRLCanvasRep layoutsForChildReps](&v12, "layoutsForChildReps");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self, "imageLayout"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "maskLayout"));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self, "imageLayout"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "maskLayout"));
    v13 = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v13, 1));
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "crl_arrayByRemovingObjectsIdenticalToObjectsInArray:", v9));

    v4 = (void *)v10;
  }
  return v4;
}

- (void)updateFromLayout
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  _BOOL4 v13;
  unsigned __int8 v14;
  unsigned int v15;
  CRLCanvasLayoutGeometry *v16;
  CRLCanvasLayoutGeometry *lastImageGeometryInRoot;
  CRLCanvasLayoutGeometry *v18;
  CRLCanvasLayoutGeometry *lastMaskGeometryInRoot;
  __int128 v20;
  void *v21;
  unsigned int v22;
  void *v23;
  void *v24;
  void *v25;
  NSMutableArray *v26;
  id v27;
  id v28;
  uint64_t v29;
  void *i;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v37;
  objc_super v38;
  _BYTE v39[128];

  v38.receiver = self;
  v38.super_class = (Class)CRLImageRep;
  -[CRLCanvasRep updateFromLayout](&v38, "updateFromLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self, "imageLayout"));
  if ((objc_msgSend(v3, "isInMaskEditMode") & 1) != 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageInfo](self, "imageInfo"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "maskInfo"));

    if (!v5)
      -[CRLImageRep p_endEditingMask](self, "p_endEditingMask");
  }
  else
  {

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
  if (!objc_msgSend(v6, "isCanvasInteractive"))
    goto LABEL_23;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  v8 = objc_msgSend(v7, "isInDynamicOperation");

  if ((v8 & 1) == 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self, "imageLayout"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "maskLayout"));
    memset(&v37, 0, sizeof(v37));
    if (v6)
      objc_msgSend(v6, "layoutToImageTransform");
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "imageGeometryInRoot"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "geometryInRoot"));
    t1 = v37;
    v12 = *(_OWORD *)&self->_lastLayoutToImageTransform.c;
    *(_OWORD *)&t2.a = *(_OWORD *)&self->_lastLayoutToImageTransform.a;
    *(_OWORD *)&t2.c = v12;
    *(_OWORD *)&t2.tx = *(_OWORD *)&self->_lastLayoutToImageTransform.tx;
    v13 = CGAffineTransformEqualToTransform(&t1, &t2);
    if (v9)
    {
      if ((objc_msgSend(v10, "isEqual:", self->_lastImageGeometryInRoot) & 1) != 0)
        v14 = 0;
      else
        v14 = objc_msgSend(v10, "differsInMoreThanTranslationFrom:", self->_lastImageGeometryInRoot);
      if ((objc_msgSend(v11, "isEqual:", self->_lastMaskGeometryInRoot) & 1) != 0)
        v15 = 0;
      else
        v15 = objc_msgSend(v11, "differsInMoreThanTranslationFrom:", self->_lastMaskGeometryInRoot);
      if (v13)
      {
LABEL_19:
        if ((v14 & 1) == 0 && !v15)
          goto LABEL_22;
      }
    }
    else
    {
      v14 = 0;
      v15 = 0;
      if (v13)
        goto LABEL_19;
    }
    -[CRLStyledRep setNeedsDisplay](self, "setNeedsDisplay");
    self->_frameInUnscaledCanvasIsValid = 0;
    -[CRLCanvasRep invalidateKnobPositions](self, "invalidateKnobPositions");
LABEL_22:
    v16 = (CRLCanvasLayoutGeometry *)objc_msgSend(v10, "copy");
    lastImageGeometryInRoot = self->_lastImageGeometryInRoot;
    self->_lastImageGeometryInRoot = v16;

    v18 = (CRLCanvasLayoutGeometry *)objc_msgSend(v11, "copy");
    lastMaskGeometryInRoot = self->_lastMaskGeometryInRoot;
    self->_lastMaskGeometryInRoot = v18;

    v20 = *(_OWORD *)&v37.c;
    *(_OWORD *)&self->_lastLayoutToImageTransform.a = *(_OWORD *)&v37.a;
    *(_OWORD *)&self->_lastLayoutToImageTransform.c = v20;
    *(_OWORD *)&self->_lastLayoutToImageTransform.tx = *(_OWORD *)&v37.tx;

LABEL_23:
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self, "imageLayout"));
  v22 = objc_msgSend(v21, "isInMaskEditMode");

  if (v22)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "layerHost"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "imageHUDController"));
    objc_msgSend(v25, "updateControlsForRep:", self);

    if (-[CRLCanvasRep isBeingDragged](self, "isBeingDragged"))
    {
      if (-[CRLCanvasRep showKnobsDuringManipulation](self, "showKnobsDuringManipulation"))
        -[CRLCanvasRep invalidateKnobPositions](self, "invalidateKnobPositions");
    }
  }
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_updateFromLayoutBlocksLock, 0xFFFFFFFFFFFFFFFFLL);
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v26 = self->_updateFromLayoutBlocks;
  v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v28; i = (char *)i + 1)
      {
        if (*(_QWORD *)v32 != v29)
          objc_enumerationMutation(v26);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)i) + 16))(*(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)i));
      }
      v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    }
    while (v28);
  }

  -[NSMutableArray removeAllObjects](self->_updateFromLayoutBlocks, "removeAllObjects", (_QWORD)v31);
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_updateFromLayoutBlocksLock);
}

- (BOOL)intersectsUnscaledRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  objc_super v15;
  _OWORD v16[3];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self, "imageLayout"));
  v9 = objc_msgSend(v8, "pathToStroke");

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPathWithCGPath:](CRLBezierPath, "bezierPathWithCGPath:", v9));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
    v12 = v11;
    if (v11)
      objc_msgSend(v11, "transformInRoot");
    else
      memset(v16, 0, sizeof(v16));
    objc_msgSend(v10, "transformUsingAffineTransform:", v16);

    v13 = objc_msgSend(v10, "intersectsRect:hasFill:", 1, x, y, width, height);
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)CRLImageRep;
    return -[CRLCanvasRep intersectsUnscaledRect:](&v15, "intersectsUnscaledRect:", x, y, width, height);
  }
  return v13;
}

- (BOOL)wantsToDistortWithImagerContext
{
  double v3;
  objc_super v5;

  if (+[UIDevice crl_phoneUI](UIDevice, "crl_phoneUI"))
  {
    +[UIScreen crl_screenScale](UIScreen, "crl_screenScale");
    if (v3 == 1.0)
      return 1;
  }
  v5.receiver = self;
  v5.super_class = (Class)CRLImageRep;
  return -[CRLCanvasRep wantsToDistortWithImagerContext](&v5, "wantsToDistortWithImagerContext");
}

- (CGRect)boundsForStandardKnobs
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
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
  objc_super v22;
  CGRect result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self, "imageLayout"));
  v4 = objc_msgSend(v3, "maskEditMode");

  if (v4 == (id)3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self, "imageLayout"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "imageGeometry"));
    objc_msgSend(v6, "size");
    v7 = sub_10005FDDC();
    v9 = v8;
    v11 = v10;
    v13 = v12;

  }
  else
  {
    v22.receiver = self;
    v22.super_class = (Class)CRLImageRep;
    -[CRLCanvasRep boundsForStandardKnobs](&v22, "boundsForStandardKnobs");
    v7 = v14;
    v9 = v15;
    v11 = v16;
    v13 = v17;
  }
  v18 = v7;
  v19 = v9;
  v20 = v11;
  v21 = v13;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (_TtC8Freeform8CRLAsset)imageDataForRendering
{
  return -[CRLImageRepDrawingHelper imageDataForDrawing](self->_drawingHelper, "imageDataForDrawing");
}

- (void)documentModeDidChange
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CRLImageRep;
  -[CRLMediaRep documentModeDidChange](&v10, "documentModeDidChange");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "layerHost"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "asiOSCVC"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "delegate"));

  if ((objc_opt_respondsToSelector(v6, "currentDocumentMode") & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "currentDocumentMode"));
    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self, "imageLayout"));
      v9 = objc_msgSend(v8, "isInMaskEditMode");

      if (v9)
      {
        if ((objc_msgSend(v7, "allowsEditMask") & 1) == 0)
          -[CRLImageRep endEditingMask](self, "endEditingMask");
      }
    }

  }
}

- (BOOL)allowsSupportedDynamicOperationsToBeRealTime
{
  void *v2;
  char v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self, "imageLayout"));
  v3 = objc_msgSend(v2, "isInMaskEditMode") ^ 1;

  return v3;
}

- (id)visuallySignificantDataSet
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageInfo](self, "imageInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "imageAssetPayload"));

  if (v3)
    v4 = objc_msgSend(objc_alloc((Class)NSSet), "initWithObjects:", v3, 0);
  else
    v4 = (id)objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));
  v5 = v4;

  return v5;
}

- (BOOL)shouldShowLoadingUI
{
  return -[CRLImageRepDrawingHelper shouldShowLoadingUI](self->_drawingHelper, "shouldShowLoadingUI");
}

- (id)downloadProgressPlaceholderImage
{
  return +[CRLImage imageNamed:](CRLImage, "imageNamed:", CFSTR("sf_streaming_large_Images"));
}

- (void)drawInLayerContext:(CGContext *)a3
{
  uint64_t v3;

  LOBYTE(v3) = 0;
  -[CRLImageRep p_drawInContext:withContent:strokeDrawOptions:withOpacity:withMask:forLayer:forShadow:forHitTest:](self, "p_drawInContext:withContent:strokeDrawOptions:withOpacity:withMask:forLayer:forShadow:forHitTest:", a3, 1, 7, 1, 1, 0, 1.0, v3);
}

- (void)drawInContextWithoutEffects:(CGContext *)a3 withContent:(BOOL)a4 strokeDrawOptions:(unint64_t)a5 withOpacity:(BOOL)a6 forAlphaOnly:(BOOL)a7 drawChildren:(BOOL)a8 keepingChildrenPassingTest:(id)a9
{
  _BOOL8 v9;
  _BOOL8 v11;
  double v14;

  v9 = a7;
  v11 = a4;
  v14 = 1.0;
  if (a6)
    -[CRLStyledRep opacity](self, "opacity", a3, a4, a5, a6, a7, a8, 1.0);
  -[CRLImageRep p_drawInContext:withContent:strokeDrawOptions:withOpacity:withMask:forLayer:forShadow:forHitTest:](self, "p_drawInContext:withContent:strokeDrawOptions:withOpacity:withMask:forLayer:forShadow:forHitTest:", a3, v11, a5, 1, 0, v9, v14);
}

- (id)imageOfStroke:(CGRect *)a3
{
  double x;
  double y;
  double width;
  double height;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGContext *v27;
  CGContext *v28;
  double v29;
  double v30;
  double v31;
  CGImage *Image;
  uint64_t v34;

  x = CGRectZero.origin.x;
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stroke"));

  if (v10 && objc_msgSend(v10, "shouldRender"))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self, "imageLayout"));
    if (objc_msgSend(v11, "pathToStroke"))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPathWithCGPath:](CRLBezierPath, "bezierPathWithCGPath:", objc_msgSend(v11, "pathToStroke")));
    }
    else
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "imageGeometry"));
      objc_msgSend(v14, "size");
      v15 = sub_10005FDDC();
      v17 = v16;
      v19 = v18;
      v21 = v20;

      v12 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPathWithRect:](CRLBezierPath, "bezierPathWithRect:", v15, v17, v19, v21));
    }
    v22 = v12;
    objc_msgSend(v12, "boundsIncludingCRLStroke:", v10);
    x = v23;
    y = v24;
    width = v25;
    height = v26;

    v27 = sub_10040FA64(11, width, height);
    v28 = v27;
    v29 = 0.0;
    if (x >= 0.0)
      v30 = x;
    else
      v30 = 0.0;
    v31 = -v30;
    if (y >= 0.0)
      v29 = y;
    CGContextTranslateCTM(v27, v31, -v29);
    LOBYTE(v34) = 0;
    -[CRLImageRep p_drawInContext:withContent:strokeDrawOptions:withOpacity:withMask:forLayer:forShadow:forHitTest:](self, "p_drawInContext:withContent:strokeDrawOptions:withOpacity:withMask:forLayer:forShadow:forHitTest:", v28, 0, 7, 0, 0, 0, 1.0, v34);
    Image = CGBitmapContextCreateImage(v28);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[CRLImage imageWithCGImage:](CRLImage, "imageWithCGImage:", Image));
    CGContextRelease(v28);
    CGImageRelease(Image);

  }
  else
  {
    v13 = 0;
  }
  a3->origin.x = x;
  a3->origin.y = y;
  a3->size.width = width;
  a3->size.height = height;

  return v13;
}

- (BOOL)canDrawInParallel
{
  return 1;
}

- (void)p_drawInContext:(CGContext *)a3 withContent:(BOOL)a4 strokeDrawOptions:(unint64_t)a5 withOpacity:(double)a6 withMask:(BOOL)a7 forLayer:(BOOL)a8 forShadow:(BOOL)a9 forHitTest:(BOOL)a10
{
  _BOOL4 v10;
  _BOOL8 v11;
  _BOOL4 v12;
  int v14;
  _BOOL4 v15;
  void *v18;
  unsigned __int8 v19;
  void *v20;
  unsigned int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _BOOL8 v26;
  void *v27;
  unsigned int v28;
  id v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  CRLStroke *v35;
  _BOOL4 v36;
  int v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  uint64_t v47;
  void *v48;
  double v49;
  double v50;
  void *v51;
  double v52;
  _BOOL8 v53;
  uint64_t v54;
  id v55;
  id v56;
  id v57;
  void *v58;
  id v59;
  id v60;
  id v61;
  uint64_t v62;
  unsigned int v63;
  unsigned int v64;
  id v65;
  int v66;
  CRLStroke *v67;
  char v68;
  CGAffineTransform v69;
  CGAffineTransform v70;
  CGAffineTransform transform;
  CGAffineTransform v72;
  CGAffineTransform v73;
  CGAffineTransform v74;

  v10 = a9;
  v11 = a8;
  v12 = a7;
  v14 = a5;
  v15 = a4;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CRLStyledRep styledLayout](self, "styledLayout"));
  v19 = objc_msgSend(v18, "isInvisible");

  if ((v19 & 1) != 0)
    return;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v21 = objc_msgSend(v20, "BOOLForKey:", CFSTR("TSDSuppressImageInterpolation"));

  if (v11 && v21)
    CGContextSetInterpolationQuality(a3, kCGInterpolationNone);
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
  if ((objc_msgSend(v22, "isDrawingIntoPDF") & 1) != 0)
  {
    v63 = 0;
  }
  else
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
    v63 = objc_msgSend(v23, "isPrinting") ^ 1;

  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "stroke"));

  if (v25)
  {
    if (!objc_msgSend(v25, "shouldRender"))
    {
      v35 = 0;
      goto LABEL_17;
    }
    v26 = v11;
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
    v28 = objc_msgSend(v27, "shouldSuppressBackgrounds");

    if (v28)
    {
      v29 = objc_msgSend(v25, "mutableCopy");

      v30 = (void *)objc_claimAutoreleasedReturnValue(+[CRLColor blackColor](CRLColor, "blackColor"));
      objc_msgSend(v29, "setColor:", v30);

      v25 = v29;
    }
    v11 = v26;
    if (v25 && a10 && (objc_msgSend(v25, "prefersToApplyToShapeRenderableDuringManipulation") & 1) == 0)
    {
      v67 = [CRLStroke alloc];
      v62 = objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "color"));
      objc_msgSend(v25, "width");
      v32 = v31;
      v65 = objc_msgSend(v25, "cap");
      v61 = objc_msgSend(v25, "join");
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "pattern"));
      objc_msgSend(v25, "miterLimit");
      v35 = -[CRLStroke initWithColor:width:cap:join:pattern:miterLimit:](v67, "initWithColor:width:cap:join:pattern:miterLimit:", v62, v65, v61, v33, v32, v34);

      v11 = v26;
      v25 = (void *)v62;
LABEL_17:

      v25 = v35;
    }
  }
  v36 = a6 < 1.0 && v15;
  v68 = v14;
  v37 = v14 & v36;
  if (v37 == 1 && (CGContextSaveGState(a3), CGContextSetAlpha(a3, a6), v25))
  {
    CGContextBeginTransparencyLayer(a3, 0);
    v66 = 1;
  }
  else
  {
    v66 = 0;
  }
  CGContextSaveGState(a3);
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self, "imageLayout"));
  -[CRLImageRepDrawingHelper imageRectInContext:](self->_drawingHelper, "imageRectInContext:", a3);
  v40 = v39;
  v42 = v41;
  v44 = v43;
  v46 = v45;
  if (v15)
  {
    v47 = v10 | a10;
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "maskLayout"));
    if (v48 && v12)
    {
      memset(&v74, 0, sizeof(v74));
      if (v38)
        objc_msgSend(v38, "layoutToMaskTransform");
      objc_msgSend(v48, "pathBounds");
      v72 = v74;
      CGAffineTransformTranslate(&v73, &v72, -v49, -v50);
      v74 = v73;
      v51 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPathWithCGPath:](CRLBezierPath, "bezierPathWithCGPath:", objc_msgSend(v48, "path")));
      v73 = v74;
      objc_msgSend(v51, "transformUsingAffineTransform:", &v73);
      if (v63)
      {
        LODWORD(v52) = 0;
        v64 = v47;
        v53 = v11;
        v54 = objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "aliasedPathInContext:effectiveStrokeWidth:", a3, v52));

        v51 = (void *)v54;
        v11 = v53;
        v47 = v64;
      }
      v55 = objc_retainAutorelease(v51);
      CGContextAddPath(a3, (CGPathRef)objc_msgSend(v55, "CGPath"));
      CGContextClip(a3);

    }
    if (v38)
      objc_msgSend(v38, "layoutToImageTransform");
    else
      memset(&transform, 0, sizeof(transform));
    CGContextConcatCTM(a3, &transform);
    CGContextSaveGState(a3);
    -[CRLImageRepDrawingHelper drawInContext:forLayer:forShadowOrHitTest:](self->_drawingHelper, "drawInContext:forLayer:forShadowOrHitTest:", a3, v11, v47);
    CGContextRestoreGState(a3);

  }
  CGContextRestoreGState(a3);
  if ((v68 & 1) == 0 || !v25 || v11 && -[CRLImageRep directlyManagesLayerContent](self, "directlyManagesLayerContent"))
    goto LABEL_54;
  CGContextSaveGState(a3);
  if (!objc_msgSend(v38, "pathToStroke"))
  {
    if (v38)
      objc_msgSend(v38, "layoutToImageTransform");
    else
      memset(&v69, 0, sizeof(v69));
    CGContextConcatCTM(a3, &v69);
    v60 = objc_msgSend(v38, "pathToStroke");
    if (!v60)
    {
      objc_msgSend(v25, "paintRect:inContext:", a3, v40, v42, v44, v46);
      goto LABEL_53;
    }
    v59 = v60;
    v58 = v25;
    goto LABEL_52;
  }
  v56 = objc_msgSend(v38, "pathToStroke");
  if (v56)
  {
    v57 = v56;
    if (v38)
      objc_msgSend(v38, "layoutToMaskTransform");
    else
      memset(&v70, 0, sizeof(v70));
    CGContextConcatCTM(a3, &v70);
    v58 = v25;
    v59 = v57;
LABEL_52:
    objc_msgSend(v58, "paintPath:inContext:", v59, a3);
  }
LABEL_53:
  CGContextRestoreGState(a3);
LABEL_54:
  if (v66)
    CGContextEndTransparencyLayer(a3);
  if (v37)
    CGContextRestoreGState(a3);

}

- (CGRect)frameInUnscaledCanvas
{
  double v3;
  double x;
  double v5;
  double y;
  double v7;
  CGFloat width;
  double v9;
  CGFloat height;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGAffineTransform v22;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v25;
  objc_super v26;
  CGRect v27;
  CGRect v28;
  CGRect result;

  v26.receiver = self;
  v26.super_class = (Class)CRLImageRep;
  -[CRLCanvasRep frameInUnscaledCanvas](&v26, "frameInUnscaledCanvas");
  x = v3;
  y = v5;
  width = v7;
  height = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self, "imageLayout"));
  v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "maskLayout"));
  if (v12)
  {
    v13 = (void *)v12;
    v14 = objc_msgSend(v11, "pathToStroke");

    if (v14)
    {
      if (!self->_frameInUnscaledCanvasIsValid)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "stroke"));

        memset(&v25, 0, sizeof(v25));
        if (v11)
        {
          objc_msgSend(v11, "layoutToMaskTransform");
          objc_msgSend(v11, "transformInRoot");
        }
        else
        {
          memset(&t1, 0, sizeof(t1));
          memset(&t2, 0, sizeof(t2));
        }
        CGAffineTransformConcat(&v25, &t1, &t2);
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPathWithCGPath:](CRLBezierPath, "bezierPathWithCGPath:", objc_msgSend(v11, "pathToStroke")));
        v22 = v25;
        objc_msgSend(v17, "transformUsingAffineTransform:", &v22);
        objc_msgSend(v17, "boundsIncludingCRLStroke:", v16);
        self->_frameInUnscaledCanvasRelativeToSuper = CGRectOffset(v27, -x, -y);
        self->_frameInUnscaledCanvasIsValid = 1;

      }
      v28 = CGRectOffset(self->_frameInUnscaledCanvasRelativeToSuper, x, y);
      x = v28.origin.x;
      y = v28.origin.y;
      width = v28.size.width;
      height = v28.size.height;
    }
  }

  v18 = x;
  v19 = y;
  v20 = width;
  v21 = height;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (CGRect)clipRect
{
  objc_super v2;
  CGRect v3;

  v2.receiver = self;
  v2.super_class = (Class)CRLImageRep;
  -[CRLStyledRep clipRect](&v2, "clipRect");
  return CGRectInset(v3, -1.0, -1.0);
}

- (id)imageDrawingHelperImageData:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageInfo](self, "imageInfo", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "imageAssetPayload"));

  return v4;
}

- (id)imageDrawingHelperThumbnailImageData:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageInfo](self, "imageInfo", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "thumbnailAssetPayload"));

  return v4;
}

- (CGRect)imageDrawingHelperImageRect:(id)a3
{
  void *v3;
  void *v4;
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
  CGRect result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self, "imageLayout", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "imageGeometry"));
  objc_msgSend(v4, "size");
  v5 = sub_10005FDDC();
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (CGAffineTransform)imageDrawingHelperImageTransformInRootForAntialiasingDefeat:(SEL)a3
{
  void *v5;
  void *v6;
  CGAffineTransform *result;
  id v8;

  v8 = (id)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self, "imageLayout", a4));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "imageGeometryInRoot"));
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "transform");
  }
  else
  {
    *(_OWORD *)&retstr->c = 0u;
    *(_OWORD *)&retstr->tx = 0u;
    *(_OWORD *)&retstr->a = 0u;
  }

  return result;
}

- (BOOL)imageDrawingHelperImageHasAlpha:(id)a3
{
  void *v3;
  unsigned __int8 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self, "imageLayout", a3));
  v4 = objc_msgSend(v3, "hasAlpha");

  return v4;
}

- (CGPath)imageDrawingHelper:(id)a3 newMaskPathForSizedImageWithSize:(CGSize)a4 orientation:(int64_t)a5
{
  double height;
  double width;
  void *v8;
  CGPath *v9;

  height = a4.height;
  width = a4.width;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self, "imageLayout", a3));
  v9 = +[CRLImageRep p_newPathToBakeIntoSizedImageForSize:withImageLayout:orientation:](CRLImageRep, "p_newPathToBakeIntoSizedImageForSize:withImageLayout:orientation:", v8, a5, width, height);

  return v9;
}

- (BOOL)imageDrawingHelperShouldGenerateSizedImageSynchronously:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageInfo](self, "imageInfo", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "shadow"));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageInfo](self, "imageInfo"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "shadow"));
    v8 = objc_msgSend(v7, "isEnabled") ^ 1;

  }
  else
  {
    LOBYTE(v8) = 1;
  }

  if (+[NSThread isMainThread](NSThread, "isMainThread"))
    return 0;
  else
    return -[CRLImageRep directlyManagesLayerContent](self, "directlyManagesLayerContent") & v8 ^ 1;
}

- (BOOL)imageDrawingHelperShouldRetryGeneratingSizedImageLater:(id)a3
{
  void *v3;
  unsigned __int8 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CRLApplicationCoordinator shared](_TtC8Freeform25CRLApplicationCoordinator, "shared", a3));
  v4 = objc_msgSend(v3, "isActivating");

  return v4;
}

- (void)imageDrawingHelper:(id)a3 didGenerateSizedImageSynchronously:(BOOL)a4
{
  _BOOL4 v4;
  unsigned int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a4;
  v6 = +[NSThread isMainThread](NSThread, "isMainThread", a3);
  if (v4)
  {
    if (v6)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_1012503C8);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E1E3AC();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_1012503E8);
      v7 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageRep imageDrawingHelper:didGenerateSizedImageSynchronously:]"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageRep.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 666, 0, "wrong thread");

    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
    objc_msgSend(v10, "canvasInvalidatedForRep:", self);

  }
  else
  {
    if ((v6 & 1) == 0)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101250408);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E1E42C();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101250428);
      v11 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageRep imageDrawingHelper:didGenerateSizedImageSynchronously:]"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageRep.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v13, 675, 0, "This operation must only be performed on the main thread.");

    }
    -[CRLImageRep p_injectSizedImageIntoLayerContentsIfReady](self, "p_injectSizedImageIntoLayerContentsIfReady");
  }
}

- (CGRect)imageDrawingHelperRectForCenteringDownloadProgressPlaceholderImage:(id)a3
{
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  void *v12;
  void *v13;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v18;
  double v19;
  double v20;
  double v21;
  CGAffineTransform v22;
  CGAffineTransform v23;
  CGRect v24;
  CGRect v25;
  CGRect result;

  -[CRLImageRep boundsForStandardKnobs](self, "boundsForStandardKnobs", a3);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self, "imageLayout"));
  v13 = v12;
  if (v12)
    objc_msgSend(v12, "layoutToImageTransform");
  else
    memset(&v22, 0, sizeof(v22));
  CGAffineTransformInvert(&v23, &v22);
  v24.origin.x = v5;
  v24.origin.y = v7;
  v24.size.width = v9;
  v24.size.height = v11;
  v25 = CGRectApplyAffineTransform(v24, &v23);
  x = v25.origin.x;
  y = v25.origin.y;
  width = v25.size.width;
  height = v25.size.height;

  v18 = x;
  v19 = y;
  v20 = width;
  v21 = height;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (id)p_validatedImageProvider
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CRLImageProviderPool sharedPool](CRLImageProviderPool, "sharedPool"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRepDrawingHelper imageDataForDrawing](self->_drawingHelper, "imageDataForDrawing"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "providerForAsset:shouldValidate:", v4, 1));

  return v5;
}

- (id)p_validatedBitmapImageProvider
{
  double v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;

  *(_QWORD *)&v3 = objc_opt_class(CRLBitmapImageProvider, a2).n128_u64[0];
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep p_validatedImageProvider](self, "p_validatedImageProvider", v3));
  v7 = sub_100221D0C(v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  return v8;
}

- (BOOL)p_drawsInOneStep
{
  void *v3;
  void *v4;
  unsigned __int8 v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  unsigned __int8 v9;
  BOOL v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageInfo](self, "imageInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stroke"));
  v5 = objc_msgSend(v4, "shouldRender");

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "maskInfo"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self, "imageLayout"));
  if (objc_msgSend(v7, "hasAlpha"))
    v8 = -[CRLImageRepDrawingHelper drawsBitmap](self->_drawingHelper, "drawsBitmap");
  else
    v8 = 1;

  if (v6)
    v9 = 0;
  else
    v9 = v8;
  if ((v5 & 1) != 0)
    v10 = 0;
  else
    v10 = v9;

  return v10;
}

- (BOOL)canDrawShadowInOneStepWithChildren:(BOOL)a3
{
  return -[CRLImageRep p_drawsInOneStep](self, "p_drawsInOneStep", a3);
}

- (BOOL)shouldShowShadow
{
  unsigned int v3;
  unsigned __int8 v4;
  void *v5;
  unsigned int v6;
  void *v7;
  unsigned __int8 v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CRLImageRep;
  v3 = -[CRLStyledRep shouldShowShadow](&v10, "shouldShowShadow");
  if (v3)
  {
    if (-[CRLCanvasRep isBeingDragged](self, "isBeingDragged"))
      v4 = 1;
    else
      v4 = -[CRLCanvasRep isBeingFreeTransformDragged](self, "isBeingFreeTransformDragged");
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self, "imageLayout"));
    v6 = objc_msgSend(v5, "isInMaskEditMode");

    if (v6 && (v4 & 1) != 0)
    {
      LOBYTE(v3) = 0;
    }
    else
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
      v8 = objc_msgSend(v7, "shouldSuppressBackgrounds");

      LOBYTE(v3) = v8 ^ 1;
    }
  }
  return v3;
}

- (void)highlightImage
{
  id v3;

  self->_showImageHighlight = 1;
  v3 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  objc_msgSend(v3, "canvasInvalidatedForRep:", self);

}

- (void)unhighlightImage
{
  id v3;

  self->_showImageHighlight = 0;
  v3 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  objc_msgSend(v3, "canvasInvalidatedForRep:", self);

}

- (void)maskWithHUD:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Edit Mask"), 0, CFSTR("UndoStrings")));
  -[CRLImageRep p_setDefaultMaskWithActionString:](self, "p_setDefaultMaskWithActionString:", v6);

  -[CRLImageRep editMaskWithHUD:](self, "editMaskWithHUD:", v3);
}

- (int64_t)maskEditMode
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self, "imageLayout"));
  v3 = objc_msgSend(v2, "maskEditMode");

  return (int64_t)v3;
}

- (BOOL)isMaskScaleFromLayout
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep maskLayout](self, "maskLayout"));
  v3 = v2 != 0;

  return v3;
}

- (double)maskScale
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  float v17;
  float v18;
  double v19;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageInfo](self, "imageInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep maskLayout](self, "maskLayout"));

  if (v4)
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep maskLayout](self, "maskLayout"));
  else
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "defaultMaskInfo"));
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "geometry"));
  objc_msgSend(v7, "size");
  v9 = v8;
  v11 = v10;

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "geometry"));
  objc_msgSend(v12, "size");
  v14 = v13;
  v16 = v15;

  v17 = v14 / v9;
  v18 = v16 / v11;
  v19 = fmaxf(v17, v18);

  return v19;
}

- (void)maskScaleLimitsReturningMin:(double *)a3 max:(double *)a4
{
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;

  -[CRLImageRep maskScale](self, "maskScale");
  v8 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep p_validatedImageProvider](self, "p_validatedImageProvider"));
  objc_msgSend(v9, "naturalSize");
  v12 = sub_1000603DC(v10, v11, 8.0);
  v14 = v13;

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageInfo](self, "imageInfo"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "geometry"));
  objc_msgSend(v16, "size");
  v18 = v17;
  v20 = v19;

  v21 = v8 * (v12 / v18);
  v22 = v8 * (v14 / v20);
  v23 = fminf(v21, v22);
  v24 = fminf(v23, 3.0);
  v25 = v8;
  v26 = fminf(v25, 1.0);
  if (v24 == v23)
    v26 = fminf(v24 / 3.0, v26);
  if (a3)
    *a3 = v26;
  if (a4)
    *a4 = v24;
}

- (NSArray)maskScaleDetents
{
  return (NSArray *)&__NSArray0__struct;
}

- (id)newMaskResizer
{
  CRLImageMaskResizer *v3;
  void *v4;
  CRLImageMaskResizer *v5;

  v3 = [CRLImageMaskResizer alloc];
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  v5 = -[CRLImageMaskResizer initWithInteractiveCanvasController:](v3, "initWithInteractiveCanvasController:", v4);

  return v5;
}

- (void)beginDynamicallyChangingMaskScale
{
  void *v3;
  unsigned __int8 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  objc_super v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self, "imageLayout"));
  v4 = objc_msgSend(v3, "isInMaskEditMode");

  if ((v4 & 1) == 0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101250448);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E1E4AC();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101250468);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageRep beginDynamicallyChangingMaskScale]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageRep.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 823, 0, "wrong mask mode");

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self, "imageLayout"));
  objc_msgSend(v8, "maskModeScaleDidBegin");

  -[CRLCanvasRep setShowKnobsDuringManipulation:](self, "setShowKnobsDuringManipulation:", 1);
  v10.receiver = self;
  v10.super_class = (Class)CRLImageRep;
  v9 = -[CRLCanvasRep dynamicResizeDidBegin](&v10, "dynamicResizeDidBegin");
}

- (void)dynamicallySetMaskScale:(double)a3
{
  void *v5;
  unsigned __int8 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self, "imageLayout"));
  v6 = objc_msgSend(v5, "isInMaskEditMode");

  if ((v6 & 1) == 0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101250488);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E1E52C();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012504A8);
    v7 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageRep dynamicallySetMaskScale:]"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageRep.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 833, 0, "wrong mask mode");

  }
  if (a3 > 0.0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self, "imageLayout"));
    v11 = objc_msgSend(v10, "maskEditMode");

    if (v11 == (id)3)
      -[CRLCanvasRep invalidateKnobPositions](self, "invalidateKnobPositions");
  }
}

- (void)endDynamicallyChangingMaskScale:(double)a3
{
  void *v4;
  unsigned __int8 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self, "imageLayout", a3));
  v5 = objc_msgSend(v4, "isInMaskEditMode");

  if ((v5 & 1) == 0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012504C8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E1E5AC();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012504E8);
    v6 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageRep endDynamicallyChangingMaskScale:]"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageRep.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 843, 0, "wrong mask mode");

  }
  v10.receiver = self;
  v10.super_class = (Class)CRLImageRep;
  -[CRLCanvasRep dynamicResizeDidEndWithTracker:](&v10, "dynamicResizeDidEndWithTracker:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self, "imageLayout"));
  objc_msgSend(v9, "maskModeScaleDidEnd");

  -[CRLCanvasRep setShowKnobsDuringManipulation:](self, "setShowKnobsDuringManipulation:", 0);
}

- (void)endEditingMask
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self, "imageLayout"));
  v4 = objc_msgSend(v3, "maskEditMode");

  if (!v4)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101250508);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E1E62C();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101250528);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageRep endEditingMask]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageRep.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 851, 0, "wrong mask mode");

  }
  -[CRLImageRep p_endEditingMask](self, "p_endEditingMask");
}

- (void)p_enterMaskModeIfNecessaryWithHUD:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  void *v8;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self, "imageLayout"));
  v6 = objc_msgSend(v5, "isInMaskEditMode");

  if ((v6 & 1) == 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageInfo](self, "imageInfo"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "maskInfo"));

    if (v8)
      -[CRLImageRep editMaskWithHUD:](self, "editMaskWithHUD:", v3);
    else
      -[CRLImageRep maskWithHUD:](self, "maskWithHUD:", v3);
  }
}

- (void)editMaskWithHUD:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
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
  void *v21;
  void *v22;
  void *v23;

  v3 = a3;
  if (-[CRLImageRepDrawingHelper drawsError](self->_drawingHelper, "drawsError"))
    return;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self, "imageLayout"));
  if (objc_msgSend(v5, "isInMaskEditMode"))
  {

LABEL_5:
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101250548);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E1E6AC();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101250568);
    v8 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageRep editMaskWithHUD:]"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageRep.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 875, 0, "attempting to edit an image already in mask edit mode, or without a mask");

    goto LABEL_14;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageInfo](self, "imageInfo"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "maskInfo"));

  if (!v7)
    goto LABEL_5;
LABEL_14:
  -[CRLImageRepDrawingHelper invalidateSizedImageIfItHasBakedMask](self->_drawingHelper, "invalidateSizedImageIfItHasBakedMask");
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "canvasEditor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageInfo](self, "imageInfo"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "selectionPathWithInfo:", v13));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "editorController"));
  objc_msgSend(v15, "setSelectionPath:", v14);

  +[CATransaction begin](CATransaction, "begin");
  +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self, "imageLayout"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "maskLayout"));

  if (!v17)
    objc_msgSend(v11, "layoutIfNeeded");
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self, "imageLayout"));
  objc_msgSend(v18, "beginEditingMaskInMaskEditMode:", 2);

  if (v3)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "layerHost"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "miniFormatterPresenter"));
    objc_msgSend(v21, "dismissMiniFormatter");

    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "layerHost"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "imageHUDController"));
    objc_msgSend(v23, "showHUDForRep:", self);

  }
  -[CRLImageRep p_setUpMaskModeUI](self, "p_setUpMaskModeUI");
  +[CATransaction commit](CATransaction, "commit");

}

- (void)p_selectionPathDidChange:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  char isKindOfClass;
  void *v9;
  unsigned int v10;
  id v11;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController", a3));
  v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "infosForCurrentSelectionPath"));

  if (objc_msgSend(v11, "count") != (id)1
    || (v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "anyObject")),
        objc_opt_class(_TtC8Freeform12CRLImageItem, v6),
        isKindOfClass = objc_opt_isKindOfClass(v5, v7),
        v5,
        (isKindOfClass & 1) == 0))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self, "imageLayout"));
    v10 = objc_msgSend(v9, "isInMaskEditMode");

    if (v10)
      -[CRLImageRep endEditingMask](self, "endEditingMask");
  }

}

- (void)becameSelected
{
  int64_t autoBackgroundRemovalState;
  CGImage *v4;
  void *v5;
  unsigned __int8 v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CRLImageRep;
  -[CRLCanvasRep becameSelected](&v7, "becameSelected");
  os_unfair_lock_lock(&self->_backgroundRemovalLock);
  autoBackgroundRemovalState = self->_autoBackgroundRemovalState;
  v4 = -[CRLRemoveImageBackgroundData image](self->_cachedRemoveImageBackgroundData, "image");
  os_unfair_lock_unlock(&self->_backgroundRemovalLock);
  if (autoBackgroundRemovalState != 2)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageInfo](self, "imageInfo"));
    v6 = objc_msgSend(v5, "isBackgroundRemoved");

    if ((v6 & 1) == 0 && !v4)
      -[CRLImageRep p_invalidateCachedRemoveBackgroundImage](self, "p_invalidateCachedRemoveBackgroundImage");
  }
}

- (void)becameNotSelected
{
  void *v3;
  unsigned int v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CRLImageRep;
  -[CRLCanvasRep becameNotSelected](&v5, "becameNotSelected");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self, "imageLayout"));
  v4 = objc_msgSend(v3, "isInMaskEditMode");

  if (v4)
    -[CRLImageRep p_endEditingMask](self, "p_endEditingMask");
}

- (void)p_invalidateCachedRemoveBackgroundImage
{
  -[CRLImageRep p_removeBackgroundFromImageInitiatedByUser:](self, "p_removeBackgroundFromImageInitiatedByUser:", 0);
}

- (BOOL)containsPoint:(CGPoint)a3 withPrecision:(BOOL)a4
{
  _BOOL4 v4;
  unsigned int v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  unsigned int v11;
  uint64_t v12;
  void *v13;
  double *v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  CGContext *v20;
  _BYTE *Data;
  void *v22;
  size_t Width;
  size_t Height;
  size_t BytesPerRow;
  size_t BitsPerPixel;
  unint64_t v27;
  unint64_t v28;
  size_t v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t v32;
  void *v33;
  void *v34;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  CKRecordID v46;
  Swift::String v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  size_t v51;
  size_t point;
  CGPoint pointa;
  double x;
  double y;
  CGAffineTransform v56;
  CGAffineTransform v57;
  char v58;
  objc_super v59;
  CGRect v60;
  CGRect v61;

  v4 = a4;
  x = a3.x;
  y = a3.y;
  v59.receiver = self;
  v59.super_class = (Class)CRLImageRep;
  v6 = -[CRLCanvasRep containsPoint:withPrecision:](&v59, "containsPoint:withPrecision:");
  v58 = 0;
  if (-[CRLImageRep p_hitCacheGetCachedValue:forPoint:](self, "p_hitCacheGetCachedValue:forPoint:", &v58, x, y))
  {
    LOBYTE(v7) = v58 != 0;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self, "imageLayout"));
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "maskLayout"));
    if (v9
      && (v10 = (void *)v9,
          v11 = objc_msgSend(v8, "maskIntersectsImage"),
          v10,
          (v6 & ~v11 & 1) != 0))
    {
      v7 = 1;
    }
    else
    {
      if ((v6 & 1) != 0)
        goto LABEL_45;
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self, "imageLayout"));
      v7 = (uint64_t)objc_msgSend(v33, "isInMaskEditMode");

      if ((_DWORD)v7)
      {
        if (v8)
          objc_msgSend(v8, "layoutToImageTransform");
        else
          memset(&v56, 0, sizeof(v56));
        CGAffineTransformInvert(&v57, &v56);
        pointa = (CGPoint)vaddq_f64(*(float64x2_t *)&v57.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v57.c, y), *(float64x2_t *)&v57.a, x));
        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "imageGeometry"));
        objc_msgSend(v34, "size");
        v61.origin.x = sub_10005FDDC();
        v7 = CGRectContainsPoint(v61, pointa);

        if ((_DWORD)v7)
        {
LABEL_45:
          if (qword_101415450 != -1)
            dispatch_once(&qword_101415450, &stru_101250588);
          CGContextSaveGState((CGContextRef)qword_101415448);
          v60.origin.x = 0.0;
          v60.origin.y = 0.0;
          v60.size.width = 1.0;
          v60.size.height = 1.0;
          CGContextClearRect((CGContextRef)qword_101415448, v60);
          CGContextTranslateCTM((CGContextRef)qword_101415448, -x, -y);
          v12 = qword_101415448;
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self, "imageLayout"));
          v7 = 1;
          LOBYTE(v48) = 1;
          -[CRLImageRep p_drawInContext:withContent:strokeDrawOptions:withOpacity:withMask:forLayer:forShadow:forHitTest:](self, "p_drawInContext:withContent:strokeDrawOptions:withOpacity:withMask:forLayer:forShadow:forHitTest:", v12, 1, 7, objc_msgSend(v13, "isInMaskEditMode") ^ 1, 0, 0, 1.0, v48);

          CGContextRestoreGState((CGContextRef)qword_101415448);
          if (!*(_BYTE *)qword_101415440)
          {
            v14 = (double *)&unk_100EF02F0;
            if (!v4)
              v14 = (double *)&unk_100EF02E8;
            v15 = *v14;
            v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
            objc_msgSend(v16, "viewScale");
            v18 = v15 / v17;

            v19 = ceil(v18 + v18);
            v20 = sub_10040FA64(19, v19, v19);
            Data = CGBitmapContextGetData(v20);
            CGContextSaveGState(v20);
            CGContextSetInterpolationQuality(v20, kCGInterpolationNone);
            CGContextTranslateCTM(v20, v18, v18);
            CGContextTranslateCTM(v20, -x, -y);
            v22 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self, "imageLayout"));
            LOBYTE(v49) = 1;
            -[CRLImageRep p_drawInContext:withContent:strokeDrawOptions:withOpacity:withMask:forLayer:forShadow:forHitTest:](self, "p_drawInContext:withContent:strokeDrawOptions:withOpacity:withMask:forLayer:forShadow:forHitTest:", v20, 1, 7, objc_msgSend(v22, "isInMaskEditMode") ^ 1, 0, 0, 1.0, v49);

            CGContextRestoreGState(v20);
            Width = CGBitmapContextGetWidth(v20);
            Height = CGBitmapContextGetHeight(v20);
            BytesPerRow = CGBitmapContextGetBytesPerRow(v20);
            BitsPerPixel = CGBitmapContextGetBitsPerPixel(v20);
            if (Height)
            {
              v50 = v8;
              v51 = BytesPerRow;
              v27 = 0;
              v28 = vcvtpd_u64_f64((double)BitsPerPixel * 0.125);
              v29 = BytesPerRow * Height;
              v30 = v28;
              point = Height;
              while (!Width)
              {
LABEL_20:
                ++v27;
                Data += v51;
                v30 += v51;
                if (v27 == point)
                {
                  v7 = 0;
                  goto LABEL_26;
                }
              }
              v31 = 0;
              v32 = 0;
              while (1)
              {
                if (sub_10006010C(v18, v18, (double)v32, (double)v27) < v18 * v18)
                {
                  if (v30 + v31 >= v29)
                  {
                    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
                    if (qword_10147E370 != -1)
                      dispatch_once(&qword_10147E370, &stru_1012505A8);
                    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
                      sub_100E1E72C();
                    if (qword_10147E370 != -1)
                      dispatch_once(&qword_10147E370, &stru_1012505C8);
                    v36 = off_1013D9070;
                    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
                      sub_100DE7468(v36);
                    sub_1001BC7E8((uint64_t)"Fatal Assertion failure: %{public}s %{public}s:%d Should not try to read outside the context's memory.", v37, v38, v39, v40, v41, v42, v43, (uint64_t)"-[CRLImageRep containsPoint:withPrecision:]");
                    v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageRep containsPoint:withPrecision:]"));
                    v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageRep.m"));
                    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v44, v45, 1042, 1, "Should not try to read outside the context's memory.");

                    SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:)(v46, v47);
                    abort();
                  }
                  if (Data[v31])
                    break;
                }
                ++v32;
                v31 += v28;
                if (Width == v32)
                  goto LABEL_20;
              }
              v7 = 1;
LABEL_26:
              v8 = v50;
            }
            else
            {
              v7 = 0;
            }
            CGContextRelease(v20);
          }
        }
      }
    }
    -[CRLImageRep p_hitCacheSetCachedValue:forPoint:](self, "p_hitCacheSetCachedValue:forPoint:", v7, x, y);

  }
  return v7;
}

- (BOOL)p_allowedToEditMask
{
  void *v4;
  unsigned __int8 v5;

  if (-[CRLImageRepDrawingHelper drawsError](self->_drawingHelper, "drawsError"))
    return 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  v5 = objc_msgSend(v4, "allowedToEditMask");

  return v5;
}

- (BOOL)handleDoubleTapAtPoint:(CGPoint)a3 inputType:(int64_t)a4
{
  void *v5;
  unsigned __int8 v6;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self, "imageLayout", a4, a3.x, a3.y));
  v6 = objc_msgSend(v5, "isInMaskEditMode");

  if ((v6 & 1) == 0)
    -[CRLImageRep enterPreviewMode](self, "enterPreviewMode");
  return v6 ^ 1;
}

- (void)p_handleImageMask
{
  void *v3;
  unsigned __int8 v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  unsigned int v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  v4 = objc_msgSend(v3, "documentIsSharedReadOnly");

  if ((v4 & 1) == 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self, "imageLayout"));
    v6 = objc_msgSend(v5, "isInMaskEditMode");

    if ((v6 & 1) != 0)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self, "imageLayout"));
      v8 = objc_msgSend(v7, "isInMaskEditMode");

      if (v8)
        -[CRLImageRep p_endEditingMask](self, "p_endEditingMask");
    }
    else if (-[CRLImageRep p_allowedToEditMask](self, "p_allowedToEditMask"))
    {
      -[CRLImageRep p_enterMaskModeIfNecessaryWithHUD:](self, "p_enterMaskModeIfNecessaryWithHUD:", 1);
    }
  }
}

- (BOOL)shouldShowSelectionHighlight
{
  void *v3;
  BOOL v4;
  objc_super v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self, "imageLayout"));
  if ((objc_msgSend(v3, "isInMaskEditMode") & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)CRLImageRep;
    v4 = -[CRLStyledRep shouldShowSelectionHighlight](&v6, "shouldShowSelectionHighlight");
  }

  return v4;
}

- (id)pathSourceForSelectionHighlightBehavior
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self, "imageLayout"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "maskLayout"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "pathSource"));

  return v4;
}

- (void)processChanges:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  -[CRLImageRep p_updateDirectlyManagesLayerContentForRenderable:](self, "p_updateDirectlyManagesLayerContentForRenderable:", 0);
  v5.receiver = self;
  v5.super_class = (Class)CRLImageRep;
  -[CRLCanvasRep processChanges:](&v5, "processChanges:", v4);

}

- (void)processChangedProperty:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  CRLImageRepDrawingHelper *drawingHelper;
  void *v12;
  void *v13;
  unsigned int v14;
  _QWORD v15[5];
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)CRLImageRep;
  -[CRLStyledRep processChangedProperty:](&v16, "processChangedProperty:");
  if ((uint64_t)a3 <= 14)
  {
    if (a3 == 7)
    {
LABEL_17:
      drawingHelper = self->_drawingHelper;
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_1003051B4;
      v15[3] = &unk_101250658;
      v15[4] = self;
      -[CRLImageRepDrawingHelper invalidateSizedImageIfNeededForBakedMaskPathFromBlock:](drawingHelper, "invalidateSizedImageIfNeededForBakedMaskPathFromBlock:", v15);
LABEL_18:
      -[CRLStyledRep setNeedsDisplay](self, "setNeedsDisplay");
      self->_frameInUnscaledCanvasIsValid = 0;
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
      objc_msgSend(v12, "canvasInvalidatedForRep:", self);

      goto LABEL_19;
    }
    if (a3 == 11)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self, "imageLayout"));
      v10 = objc_msgSend(v9, "isInMaskEditMode");

      if (v10)
        -[CRLImageRep p_endEditingMask](self, "p_endEditingMask");
    }
  }
  else
  {
    switch(a3)
    {
      case 0x24uLL:
        goto LABEL_5;
      case 0x12uLL:
        -[CRLImageRepDrawingHelper invalidateSizedImage](self->_drawingHelper, "invalidateSizedImage");
        -[CRLImageRep p_listenForAssetChangesIfAppropriate](self, "p_listenForAssetChangesIfAppropriate");
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self, "imageLayout"));
        if (objc_msgSend(v13, "isInMaskEditMode"))
        {
          v14 = -[CRLImageRepDrawingHelper drawsError](self->_drawingHelper, "drawsError");

          if (v14)
            -[CRLImageRep p_endEditingMask](self, "p_endEditingMask");
        }
        else
        {

        }
        goto LABEL_18;
      case 0xFuLL:
LABEL_5:
        -[CRLImageRep p_disposeStrokeLayer](self, "p_disposeStrokeLayer");
        -[CRLCanvasRep invalidateKnobs](self, "invalidateKnobs");
        if (a3 == 36)
        {
          v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self, "imageLayout"));
          objc_msgSend(v5, "invalidateAlignmentFrame");

        }
        v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self, "imageLayout"));
        if (!objc_msgSend(v6, "maskEditMode"))
        {
          v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageInfo](self, "imageInfo"));
          v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "maskInfo"));

          if (!v8)
            goto LABEL_11;
          v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self, "imageLayout"));
          objc_msgSend(v6, "maskWasApplied");
        }

LABEL_11:
        if (a3 != 36)
          goto LABEL_18;
        goto LABEL_17;
    }
  }
LABEL_19:
  -[CRLImageRep p_updateHUD](self, "p_updateHUD");
  -[CRLImageRep p_invalidateHitTestCache](self, "p_invalidateHitTestCache");
}

- (void)layoutInRootChangedFrom:(id)a3 to:(id)a4 translatedOnly:(BOOL)a5
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CRLImageRep;
  -[CRLCanvasRep layoutInRootChangedFrom:to:translatedOnly:](&v7, "layoutInRootChangedFrom:to:translatedOnly:", a3, a4);
  if (!a5)
    self->_frameInUnscaledCanvasIsValid = 0;
}

- (void)documentEditabilityDidChange
{
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CRLImageRep;
  -[CRLCanvasRep documentEditabilityDidChange](&v8, "documentEditabilityDidChange");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  if (objc_msgSend(v3, "editingDisabled"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self, "imageLayout"));
    v5 = objc_msgSend(v4, "isInMaskEditMode");

    if (!v5)
      return;
    -[CRLImageRep p_endEditingMask](self, "p_endEditingMask");
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "layerHost"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "imageHUDController"));
    objc_msgSend(v7, "closeHUDWithAnimation:", 0);

  }
}

- (id)overlayRenderables
{
  NSArray *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  CGColor *v8;
  void *v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  CGPath *v24;
  CGAffineTransform v26;
  CGAffineTransform t2;
  CGAffineTransform v28;
  CGAffineTransform v29;
  objc_super v30;

  v30.receiver = self;
  v30.super_class = (Class)CRLImageRep;
  v3 = -[CRLCanvasRep overlayRenderables](&v30, "overlayRenderables");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v4));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  if (self->_showImageHighlight)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[CRLCanvasShapeRenderable renderable](CRLCanvasShapeRenderable, "renderable"));
    v8 = sub_100011C1C(0.458, 0.697, 0.916, 0.53);
    objc_msgSend(v7, "setFillColor:", v8);
    CGColorRelease(v8);
    objc_msgSend(v7, "setLineWidth:", 1.0);
    objc_msgSend(v7, "setStrokeColor:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
    objc_msgSend(v9, "viewScale");
    v11 = v10;

    -[CRLImageRep boundsForStandardKnobs](self, "boundsForStandardKnobs");
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;
    memset(&v29, 0, sizeof(v29));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
    v21 = v20;
    if (v20)
      objc_msgSend(v20, "transformInRoot");
    else
      memset(&v29, 0, sizeof(v29));

    CGAffineTransformMakeScale(&t2, v11, v11);
    v26 = v29;
    CGAffineTransformConcat(&v28, &v26, &t2);
    v29 = v28;
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
    objc_msgSend(v22, "contentsScale");
    v24 = sub_1000C8504(&v29.a, v13, v15, v17, v19, 1.0, v23);

    objc_msgSend(v7, "setPath:", v24);
    CGPathRelease(v24);
    objc_msgSend(v7, "setDelegate:", v6);
    objc_msgSend(v5, "addObject:", v7);

  }
  return v5;
}

- (int64_t)tilingMode
{
  return 1;
}

- (BOOL)hitRepChrome:(CGPoint)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CRLImageRep;
  return -[CRLCanvasRep hitRepChrome:](&v4, "hitRepChrome:", a3.x, a3.y);
}

- (CGPoint)positionOfStandardKnob:(id)a3 forBounds:(CGRect)a4
{
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  float64x2_t v12;
  float64x2_t v13;
  float64x2_t v14;
  float64x2_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  float64x2_t v20;
  float64x2_t v21;
  float64x2_t v22;
  objc_super v23;
  CGPoint result;

  v23.receiver = self;
  v23.super_class = (Class)CRLImageRep;
  -[CRLCanvasRep positionOfStandardKnob:forBounds:](&v23, "positionOfStandardKnob:forBounds:", a3, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  v18 = v6;
  v19 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self, "imageLayout"));
  if (objc_msgSend(v7, "maskEditMode") == (id)3)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
    if (objc_msgSend(v8, "layoutState") == 4)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self, "imageLayout"));
      v10 = objc_msgSend(v9, "isInMaskScaleMode");

      if (!v10)
        goto LABEL_11;
    }
    else
    {

    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self, "imageLayout"));
    v7 = v11;
    if (v11)
    {
      objc_msgSend(v11, "layoutToImageTransform");
      v12 = v20;
      v13 = v21;
      v14 = v22;
    }
    else
    {
      v14 = 0uLL;
      v12 = 0uLL;
      v13 = 0uLL;
    }
    v15 = vaddq_f64(v14, vmlaq_n_f64(vmulq_n_f64(v13, v18), v12, v19));
    v18 = v15.f64[1];
    v19 = v15.f64[0];
  }

LABEL_11:
  v17 = v18;
  v16 = v19;
  result.y = v17;
  result.x = v16;
  return result;
}

- (CGRect)boundsForHighlightLayer
{
  void *v3;
  id v4;
  char **v5;
  CRLImageRep **v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CRLImageRep *v11;
  CRLImageRep *v12;
  CGRect result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self, "imageLayout"));
  v4 = objc_msgSend(v3, "maskEditMode");

  if (v4 == (id)3)
  {
    v12 = self;
    v5 = &selRef_boundsForStandardKnobs;
    v6 = &v12;
  }
  else
  {
    v11 = self;
    v5 = &selRef_boundsForHighlightLayer;
    v6 = &v11;
  }
  v6[1] = (CRLImageRep *)CRLImageRep;
  objc_msgSendSuper2((objc_super *)v6, *v5, v11);
  result.size.height = v10;
  result.size.width = v9;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

- (CGAffineTransform)transformForHighlightLayer
{
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  CGAffineTransform *result;
  void *v10;
  void *v11;
  objc_super v12;

  v5 = objc_claimAutoreleasedReturnValue(-[CRLCanvasRep currentKnobTracker](self, "currentKnobTracker"));
  if (v5
    && (v6 = (void *)v5,
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self, "imageLayout")),
        v8 = objc_msgSend(v7, "maskEditMode"),
        v7,
        v6,
        v8 != (id)3))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep currentKnobTracker](self, "currentKnobTracker"));
    if (v10)
    {
      v11 = v10;
      objc_msgSend(v10, "transformInRootForStandardKnobs");

    }
    else
    {
      *(_OWORD *)&retstr->c = 0u;
      *(_OWORD *)&retstr->tx = 0u;
      *(_OWORD *)&retstr->a = 0u;

    }
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)CRLImageRep;
    return (CGAffineTransform *)-[CGAffineTransform transformForHighlightLayer](&v12, "transformForHighlightLayer");
  }
  return result;
}

- (BOOL)shouldAllowReplacementFromPaste
{
  void *v3;
  BOOL v4;
  objc_super v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self, "imageLayout"));
  if ((objc_msgSend(v3, "isInMaskEditMode") & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)CRLImageRep;
    v4 = -[CRLMediaRep shouldAllowReplacementFromPaste](&v6, "shouldAllowReplacementFromPaste");
  }

  return v4;
}

- (BOOL)canPasteDataFromPhysicalKeyboard:(id)a3
{
  id v4;
  uint64_t v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  id v12;

  v4 = a3;
  *(_QWORD *)&v6 = objc_opt_class(_TtC8Freeform12CRLImageItem, v5).n128_u64[0];
  v8 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep info](self, "info", v6));
  v10 = sub_100221D0C(v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "imageAssetPayload"));
  return v12 != v4;
}

- (id)commandForAcceptingPasteWithImageInfo:(id)a3 outSelectionBehavior:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _TtC8Freeform17CRLCommandSetMask *v10;
  void *v11;
  _TtC8Freeform17CRLCommandSetMask *v12;
  _TtC8Freeform22CRLCommandReplaceImage *v13;
  void *v14;
  void *v15;
  _TtC8Freeform22CRLCommandReplaceImage *v16;
  _TtC8Freeform15CRLCommandGroup *v17;
  void *v18;
  void *v19;
  void *v20;
  CRLCanvasCommandSelectionBehavior *v21;
  void *v22;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageInfo](self, "imageInfo"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "maskInfo"));

  if (!v9)
  {
    v10 = [_TtC8Freeform17CRLCommandSetMask alloc];
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "defaultMaskInfo"));
    v12 = -[CRLCommandSetMask initWithImageItem:maskInfo:](v10, "initWithImageItem:maskInfo:", v7, v11);

    objc_msgSend(v8, "addObject:", v12);
  }
  v13 = [_TtC8Freeform22CRLCommandReplaceImage alloc];
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "imageAssetPayload"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "thumbnailAssetPayload"));

  v16 = -[CRLCommandReplaceImage initWithImageItem:imageData:thumbnailData:](v13, "initWithImageItem:imageData:thumbnailData:", v7, v14, v15);
  objc_msgSend(v8, "addObject:", v16);

  if (objc_msgSend(v8, "count"))
  {
    v17 = -[CRLCommandGroup initWithCommands:]([_TtC8Freeform15CRLCommandGroup alloc], "initWithCommands:", v8);
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "editorController"));

    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "mostSpecificEditorConformingToProtocol:", &OBJC_PROTOCOL___CRLCanvasEditor));
    if (a4)
    {
      v21 = [CRLCanvasCommandSelectionBehavior alloc];
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "selectionPath"));
      *a4 = -[CRLCanvasCommandSelectionBehavior initWithCanvasEditor:type:selectionPath:selectionFlags:](v21, "initWithCanvasEditor:type:selectionPath:selectionFlags:", v20, 2, v22, 4);

    }
  }
  else
  {
    v17 = 0;
    if (a4)
      *a4 = 0;
  }

  return v17;
}

- (BOOL)p_isResizingImageInMaskEditMode
{
  void *v3;
  void *v4;
  BOOL v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self, "imageLayout"));
  if (objc_msgSend(v3, "layoutState") == 4)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self, "imageLayout"));
    v5 = objc_msgSend(v4, "maskEditMode") == (id)3;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)p_isResizingMaskInMaskEditMode
{
  void *v3;
  void *v4;
  BOOL v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self, "imageLayout"));
  if (objc_msgSend(v3, "layoutState") == 4)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self, "imageLayout"));
    v5 = objc_msgSend(v4, "maskEditMode") == (id)2;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (CGRect)boundsForCollaboratorCursorRenderable
{
  double v3;
  CGFloat x;
  double v5;
  CGFloat y;
  double v7;
  CGFloat width;
  double v9;
  CGFloat height;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  unsigned int v16;
  void *v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  CGAffineTransform v32;
  objc_super v33;
  CGRect v34;
  CGRect v35;
  CGRect result;

  v33.receiver = self;
  v33.super_class = (Class)CRLImageRep;
  -[CRLCanvasRep boundsForCollaboratorCursorRenderable](&v33, "boundsForCollaboratorCursorRenderable");
  x = v3;
  y = v5;
  width = v7;
  height = v9;
  if (-[CRLImageRep p_isResizingMaskInMaskEditMode](self, "p_isResizingMaskInMaskEditMode"))
  {
    -[CRLCanvasRep trackingBoundsForStandardKnobs](self, "trackingBoundsForStandardKnobs");
    x = v11;
    y = v12;
    width = v13;
    height = v14;
  }
  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self, "imageLayout"));
    v16 = objc_msgSend(v15, "isInMaskEditMode");

    if (v16)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep maskLayout](self, "maskLayout"));
      objc_msgSend(v17, "boundsForStandardKnobs");
      v19 = v18;
      v21 = v20;
      v23 = v22;
      v25 = v24;
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self, "imageLayout"));
      v27 = v26;
      if (v26)
        objc_msgSend(v26, "layoutToMaskTransform");
      else
        memset(&v32, 0, sizeof(v32));
      v34.origin.x = v19;
      v34.origin.y = v21;
      v34.size.width = v23;
      v34.size.height = v25;
      v35 = CGRectApplyAffineTransform(v34, &v32);
      x = v35.origin.x;
      y = v35.origin.y;
      width = v35.size.width;
      height = v35.size.height;

    }
  }
  v28 = x;
  v29 = y;
  v30 = width;
  v31 = height;
  result.size.height = v31;
  result.size.width = v30;
  result.origin.y = v29;
  result.origin.x = v28;
  return result;
}

- (CGAffineTransform)transformForCollaboratorCursorRenderable
{
  CGAffineTransform *result;
  void *v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  objc_super v11;

  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  v11.receiver = self;
  v11.super_class = (Class)CRLImageRep;
  -[CGAffineTransform transformForCollaboratorCursorRenderable](&v11, "transformForCollaboratorCursorRenderable");
  result = (CGAffineTransform *)-[CRLImageRep p_isResizingImageInMaskEditMode](self, "p_isResizingImageInMaskEditMode");
  if ((_DWORD)result)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "transformInRoot");
    }
    else
    {
      v9 = 0u;
      v10 = 0u;
      v8 = 0u;
    }
    *(_OWORD *)&retstr->a = v8;
    *(_OWORD *)&retstr->c = v9;
    *(_OWORD *)&retstr->tx = v10;

  }
  return result;
}

- (BOOL)shouldShowDragHUD
{
  void *v2;
  char v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self, "imageLayout"));
  v3 = objc_msgSend(v2, "isInMaskEditMode") ^ 1;

  return v3;
}

- (void)dynamicDragDidBegin
{
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  objc_super v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self, "imageLayout"));
  objc_msgSend(v3, "validate");

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self, "imageLayout"));
  v5 = objc_msgSend(v4, "isInMaskEditMode");

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dynamicOperationController"));
    objc_msgSend(v7, "invalidateGuides");

  }
  v8.receiver = self;
  v8.super_class = (Class)CRLImageRep;
  -[CRLCanvasRep dynamicDragDidBegin](&v8, "dynamicDragDidBegin");
}

- (BOOL)providesGuidesWhileAligning
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  objc_super v10;
  _OWORD v11[3];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self, "imageLayout"));
  v4 = objc_msgSend(v3, "isInMaskEditMode");

  if (v4)
  {
    if (!-[CRLCanvasRep isBeingResized](self, "isBeingResized"))
      return -[CRLCanvasRep isBeingDragged](self, "isBeingDragged");
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self, "imageLayout"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "imageGeometryInRoot"));
    v7 = v6;
    if (v6)
      objc_msgSend(v6, "transform");
    else
      memset(v11, 0, sizeof(v11));
    LOBYTE(v8) = sub_100079384((double *)v11);

  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)CRLImageRep;
    return -[CRLCanvasRep providesGuidesWhileAligning](&v10, "providesGuidesWhileAligning");
  }
  return v8;
}

- (BOOL)exclusivelyProvidesGuidesWhileAligning
{
  void *v3;
  BOOL v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self, "imageLayout"));
  if (objc_msgSend(v3, "isInMaskEditMode"))
    v4 = -[CRLCanvasRep isInDynamicOperation](self, "isInDynamicOperation");
  else
    v4 = 0;

  return v4;
}

- (id)actionStringForDrag
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  NSString *v8;
  objc_super v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self, "imageLayout"));
  v4 = objc_msgSend(v3, "isInMaskEditMode");

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Edit Mask"), 0, CFSTR("UndoStrings")));

    return v6;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)CRLImageRep;
    v8 = -[CRLCanvasRep actionStringForDrag](&v9, "actionStringForDrag");
    return (id)objc_claimAutoreleasedReturnValue(v8);
  }
}

- (CGRect)snapRectForDynamicDragWithOffset:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  id v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  void *v28;
  void *v29;
  CGFloat v30;
  double v31;
  double v32;
  double v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat width;
  CGFloat height;
  void *v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  objc_super v44;
  CGAffineTransform v45;
  CGAffineTransform v46;
  CGAffineTransform v47;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect result;

  y = a3.y;
  x = a3.x;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self, "imageLayout"));
  v7 = objc_msgSend(v6, "maskEditModeForDragging");

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self, "imageLayout"));
  v9 = v8;
  if (v7 == (id)3)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "imageGeometry"));
    objc_msgSend(v10, "size");
    v11 = sub_10005FDDC();
    v13 = v12;
    v15 = v14;
    v17 = v16;

    memset(&v50, 0, sizeof(v50));
    if (v9)
    {
      objc_msgSend(v9, "layoutToImageTransform");
      objc_msgSend(v9, "transformInRoot");
    }
    else
    {
      memset(&t1, 0, sizeof(t1));
      memset(&t2, 0, sizeof(t2));
    }
    CGAffineTransformConcat(&v50, &t1, &t2);
    v47 = v50;
    v51.origin.x = v11;
    v51.origin.y = v13;
    v51.size.width = v15;
    v51.size.height = v17;
    v52 = CGRectApplyAffineTransform(v51, &v47);
    v53 = CGRectOffset(v52, x, y);
    v34 = v53.origin.x;
    v35 = v53.origin.y;
    width = v53.size.width;
    height = v53.size.height;

  }
  else
  {
    v18 = objc_msgSend(v8, "maskEditModeForDragging");

    if (v18 == (id)2)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep maskLayout](self, "maskLayout"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "geometry"));
      objc_msgSend(v20, "size");
      v21 = sub_10005FDDC();
      v23 = v22;
      v25 = v24;
      v27 = v26;

      memset(&v50, 0, sizeof(v50));
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self, "imageLayout"));
      v29 = v28;
      if (v28)
        objc_msgSend(v28, "layoutToMaskTransform");
      else
        memset(&v46, 0, sizeof(v46));
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self, "imageLayout"));
      v39 = v38;
      if (v38)
        objc_msgSend(v38, "transformInRoot");
      else
        memset(&v45, 0, sizeof(v45));
      CGAffineTransformConcat(&v50, &v46, &v45);

      v47 = v50;
      v54.origin.x = v21;
      v54.origin.y = v23;
      v54.size.width = v25;
      v54.size.height = v27;
      v55 = CGRectApplyAffineTransform(v54, &v47);
      *(CGRect *)&v30 = CGRectOffset(v55, x, y);
    }
    else
    {
      v44.receiver = self;
      v44.super_class = (Class)CRLImageRep;
      -[CRLCanvasRep snapRectForDynamicDragWithOffset:](&v44, "snapRectForDynamicDragWithOffset:", x, y);
    }
    v34 = v30;
    v35 = v31;
    width = v32;
    height = v33;
  }
  v40 = v34;
  v41 = v35;
  v42 = width;
  v43 = height;
  result.size.height = v43;
  result.size.width = v42;
  result.origin.y = v41;
  result.origin.x = v40;
  return result;
}

- (CGPoint)i_dragOffset
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  objc_super v19;
  CGPoint result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self, "imageLayout"));
  v4 = objc_msgSend(v3, "isInMaskEditMode");

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self, "imageLayout"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentInfoGeometry"));
    objc_msgSend(v6, "position");
    v8 = v7;
    v10 = v9;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep info](self, "info"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "geometry"));
    objc_msgSend(v12, "position");
    v14 = sub_1000603B8(v8, v10, v13);
    v16 = v15;

    v17 = v14;
    v18 = v16;
  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)CRLImageRep;
    -[CRLCanvasRep i_dragOffset](&v19, "i_dragOffset");
  }
  result.y = v18;
  result.x = v17;
  return result;
}

- (BOOL)p_currentEditOperationDidChangeTheImageGeometry
{
  void *v2;
  id v3;
  BOOL v4;
  void *v6;
  void *v7;
  void *v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self, "imageLayout"));
  if (objc_msgSend(v2, "isInMaskEditMode"))
  {
    if (objc_msgSend(v2, "isDraggingInMaskEditMode"))
    {
      v3 = objc_msgSend(v2, "maskEditModeForDragging");
LABEL_9:
      v4 = v3 == (id)3;
      goto LABEL_10;
    }
    if (objc_msgSend(v2, "isRotatingInMaskEditMode"))
    {
      v3 = objc_msgSend(v2, "maskEditModeForRotating");
      goto LABEL_9;
    }
    if (objc_msgSend(v2, "isResizingInMaskEditMode"))
    {
      v3 = objc_msgSend(v2, "maskEditModeForResizing");
      goto LABEL_9;
    }
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101250678);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E1E838();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101250698);
    v6 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageRep p_currentEditOperationDidChangeTheImageGeometry]"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageRep.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 1480, 0, "layout is in a not possible state, editing mask but not editing mask");

    v4 = 0;
  }
  else
  {
    v4 = 1;
  }
LABEL_10:

  return v4;
}

- (id)newCommandToApplyGeometry:(id)a3 toInfo:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  unsigned int v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unsigned int v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  _TtC8Freeform30CRLCommandSetImageItemGeometry *v28;
  void *v29;
  void *v30;
  void *v31;
  uint8_t buf[4];
  unsigned int v34;
  __int16 v35;
  const char *v36;
  __int16 v37;
  const char *v38;
  __int16 v39;
  int v40;
  __int16 v41;
  id v42;
  __int16 v43;
  CRLImageRep *v44;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[CRLImageRep imageInfo](self, "imageInfo"));
  if ((id)v8 == v7)
  {

  }
  else
  {
    v9 = (void *)v8;
    v10 = (id)objc_claimAutoreleasedReturnValue(-[CRLImageRep maskInfo](self, "maskInfo"));

    if (v10 != v7)
    {
      v11 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_1012506B8);
      v12 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67110402;
        v34 = v11;
        v35 = 2082;
        v36 = "-[CRLImageRep newCommandToApplyGeometry:toInfo:]";
        v37 = 2082;
        v38 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageRep.m";
        v39 = 1024;
        v40 = 1498;
        v41 = 2112;
        v42 = v7;
        v43 = 2112;
        v44 = self;
        _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d called newCommandToApplyGeometry on and info %@ that the rep %@ does not know about", buf, 0x36u);
      }
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_1012506D8);
      v13 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageRep newCommandToApplyGeometry:toInfo:]"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageRep.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v14, v15, 1498, 0, "called newCommandToApplyGeometry on and info %@ that the rep %@ does not know about", v7, self);

    }
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageInfo](self, "imageInfo"));
  if (!v16)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012506F8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E1E938();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101250718);
    v17 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageRep newCommandToApplyGeometry:toInfo:]"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageRep.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v18, v19, 1503, 0, "invalid nil value for '%{public}s'", "imageInfo");

  }
  v20 = -[CRLImageRep p_currentEditOperationDidChangeTheImageGeometry](self, "p_currentEditOperationDidChangeTheImageGeometry");
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep maskLayout](self, "maskLayout"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "infoGeometry"));
  v23 = objc_msgSend(v22, "mutableCopy");

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep maskLayout](self, "maskLayout"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "pathSource"));
  v26 = objc_msgSend(v25, "copy");

  if (v20)
  {
    v27 = v6;
    v28 = -[CRLCommandSetImageItemGeometry initWithImageItem:imageGeometry:maskGeometry:maskPathSource:]([_TtC8Freeform30CRLCommandSetImageItemGeometry alloc], "initWithImageItem:imageGeometry:maskGeometry:maskPathSource:", v16, v27, v23, v26);

  }
  else
  {
    if (!v23)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101250738);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E1E8B8();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101250758);
      v29 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageRep newCommandToApplyGeometry:toInfo:]"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageRep.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v30, v31, 1532, 0, "should have a new mask geometry if changing only the mask");

    }
    v28 = -[CRLCommandSetImageItemGeometry initWithImageItem:imageGeometry:maskGeometry:maskPathSource:]([_TtC8Freeform30CRLCommandSetImageItemGeometry alloc], "initWithImageItem:imageGeometry:maskGeometry:maskPathSource:", v16, 0, v23, v26);
  }

  return v28;
}

- (BOOL)maskGeometryDidChange
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep maskLayout](self, "maskLayout"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "infoGeometry"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep maskInfo](self, "maskInfo"));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep maskInfo](self, "maskInfo"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "geometry"));
    v8 = objc_msgSend(v7, "isEqual:", v4) ^ 1;

  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (BOOL)dragDidChangeGeometry
{
  BOOL v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CRLImageRep;
  if (-[CRLCanvasRep dragDidChangeGeometry](&v6, "dragDidChangeGeometry"))
    return 1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self, "imageLayout"));
  if (objc_msgSend(v4, "isInMaskEditMode"))
    v3 = -[CRLImageRep maskGeometryDidChange](self, "maskGeometryDidChange");
  else
    v3 = 0;

  return v3;
}

- (void)dynamicOperationDidEnd
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CRLImageRep;
  -[CRLCanvasRep dynamicOperationDidEnd](&v8, "dynamicOperationDidEnd");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self, "imageLayout"));
  v4 = objc_msgSend(v3, "isInMaskEditMode");

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "layerHost"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "imageHUDController"));
    objc_msgSend(v7, "showHUDForRep:", self);

  }
}

- (BOOL)demandsExclusiveSelection
{
  unsigned __int8 v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CRLImageRep;
  if (-[CRLCanvasRep demandsExclusiveSelection](&v6, "demandsExclusiveSelection"))
    return 1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self, "imageLayout"));
  v3 = objc_msgSend(v4, "isInMaskEditMode");

  return v3;
}

- (BOOL)allowDragAcrossPageBoundaries
{
  void *v3;
  unsigned int v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CRLImageRep;
  if (-[CRLCanvasRep allowDragAcrossPageBoundaries](&v6, "allowDragAcrossPageBoundaries"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self, "imageLayout"));
    v4 = objc_msgSend(v3, "isInMaskEditMode") ^ 1;

  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (id)dynamicResizeDidBegin
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  objc_super v17;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self, "imageLayout"));
  v4 = objc_msgSend(v3, "isInMaskEditMode");

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dynamicOperationController"));
    objc_msgSend(v6, "invalidateGuides");

  }
  v17.receiver = self;
  v17.super_class = (Class)CRLImageRep;
  v7 = -[CRLCanvasRep dynamicResizeDidBegin](&v17, "dynamicResizeDidBegin");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self, "imageLayout"));
  v9 = objc_msgSend(v8, "maskEditModeForResizing");

  if (v9 == (id)2)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep maskLayout](self, "maskLayout"));
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep maskLayout](self, "maskLayout"));
    v12 = v11;
    if (v11)
    {
      objc_msgSend(v11, "transform");
    }
    else
    {
      v15 = 0u;
      v16 = 0u;
      v14 = 0u;
    }
    *(_OWORD *)&self->_baseMaskLayoutTransform.a = v14;
    *(_OWORD *)&self->_baseMaskLayoutTransform.c = v15;
    *(_OWORD *)&self->_baseMaskLayoutTransform.tx = v16;

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
  }
  return v10;
}

- (id)infoForTransforming
{
  void *v3;
  id v4;
  void *v5;
  CRLCanvasElementInfo *v6;
  objc_super v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self, "imageLayout"));
  v4 = objc_msgSend(v3, "maskEditModeForResizing");

  if (v4 == (id)2)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep maskInfo](self, "maskInfo"));
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)CRLImageRep;
    v6 = -[CRLCanvasRep infoForTransforming](&v8, "infoForTransforming");
    v5 = (void *)objc_claimAutoreleasedReturnValue(v6);
  }
  return v5;
}

- (BOOL)wantsGuidesWhileResizing
{
  void *v3;
  unsigned int v4;
  objc_super v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self, "imageLayout"));
  v4 = objc_msgSend(v3, "isInMaskEditMode");

  if (v4)
    return -[CRLCanvasRep isBeingResized](self, "isBeingResized");
  v6.receiver = self;
  v6.super_class = (Class)CRLImageRep;
  return -[CRLCanvasRep wantsGuidesWhileResizing](&v6, "wantsGuidesWhileResizing");
}

- (id)resizedGeometryForTransform:(CGAffineTransform *)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  CGAffineTransform *v12;
  unsigned __int8 v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v22;
  void *v23;
  __int128 v24;
  _OWORD v25[3];
  _OWORD v26[3];
  CGAffineTransform v27;
  CGAffineTransform v28;
  CGAffineTransform t1;
  CGAffineTransform v30;
  CGAffineTransform t2;
  CGAffineTransform v32;

  memset(&v32, 0, sizeof(v32));
  v5 = objc_claimAutoreleasedReturnValue(-[CRLImageRep maskInfo](self, "maskInfo"));
  if (!v5)
  {
LABEL_5:
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self, "imageLayout"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "originalImageGeometry"));
    v10 = v9;
    if (v9)
      objc_msgSend(v9, "fullTransform");
    else
      memset(v25, 0, sizeof(v25));
    v11 = *(_OWORD *)&a3->c;
    *(_OWORD *)&t2.a = *(_OWORD *)&a3->a;
    *(_OWORD *)&t2.c = v11;
    *(_OWORD *)&t2.tx = *(_OWORD *)&a3->tx;
    v12 = (CGAffineTransform *)v25;
    goto LABEL_9;
  }
  v6 = (void *)v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self, "imageLayout"));
  if (objc_msgSend(v7, "maskEditModeForResizing") != (id)2 || -[CRLCanvasRep isBeingRotated](self, "isBeingRotated"))
  {

    goto LABEL_5;
  }
  v14 = -[CRLCanvasRep isBeingFreeTransformed](self, "isBeingFreeTransformed");

  if ((v14 & 1) != 0)
    goto LABEL_5;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep info](self, "info"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "geometry"));
  v17 = v16;
  if (v16)
    objc_msgSend(v16, "transform");
  else
    memset(&t1, 0, sizeof(t1));
  v18 = *(_OWORD *)&a3->c;
  *(_OWORD *)&t2.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&t2.c = v18;
  *(_OWORD *)&t2.tx = *(_OWORD *)&a3->tx;
  CGAffineTransformConcat(&v30, &t1, &t2);
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep info](self, "info"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "geometry"));
  v21 = v20;
  if (v20)
    objc_msgSend(v20, "transform");
  else
    memset(&v27, 0, sizeof(v27));
  CGAffineTransformInvert(&v28, &v27);
  CGAffineTransformConcat(&t2, &v30, &v28);
  v22 = *(_OWORD *)&t2.c;
  *(_OWORD *)&a3->a = *(_OWORD *)&t2.a;
  *(_OWORD *)&a3->c = v22;
  *(_OWORD *)&a3->tx = *(_OWORD *)&t2.tx;

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep maskInfo](self, "maskInfo"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "geometry"));
  v10 = v23;
  if (v23)
    objc_msgSend(v23, "fullTransform");
  else
    memset(v26, 0, sizeof(v26));
  v24 = *(_OWORD *)&a3->c;
  *(_OWORD *)&t2.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&t2.c = v24;
  *(_OWORD *)&t2.tx = *(_OWORD *)&a3->tx;
  v12 = (CGAffineTransform *)v26;
LABEL_9:
  CGAffineTransformConcat(&v32, v12, &t2);

  t2 = v32;
  return (id)objc_claimAutoreleasedReturnValue(+[CRLCanvasInfoGeometry geometryFromFullTransform:](CRLCanvasInfoGeometry, "geometryFromFullTransform:", &t2));
}

- (id)actionStringForResize
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  NSString *v8;
  objc_super v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self, "imageLayout"));
  v4 = objc_msgSend(v3, "isInMaskEditMode");

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Edit Mask"), 0, CFSTR("UndoStrings")));

    return v6;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)CRLImageRep;
    v8 = -[CRLCanvasRep actionStringForResize](&v9, "actionStringForResize");
    return (id)objc_claimAutoreleasedReturnValue(v8);
  }
}

- (CGPoint)centerForRotation
{
  void *v3;
  unsigned int v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v12;
  CGPoint result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self, "imageLayout"));
  v4 = objc_msgSend(v3, "isInMaskEditMode");

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self, "imageLayout"));
    objc_msgSend(v5, "centerForRotationInMaskMode");
    v7 = v6;
    v9 = v8;

    v10 = v7;
    v11 = v9;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)CRLImageRep;
    -[CRLCanvasRep centerForRotation](&v12, "centerForRotation");
  }
  result.y = v11;
  result.x = v10;
  return result;
}

- (double)angleForRotation
{
  void *v3;
  id v4;
  double result;
  void *v6;
  void *v7;
  double v8;
  double v9;
  objc_super v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self, "imageLayout"));
  v4 = objc_msgSend(v3, "maskEditModeForRotating");

  if (v4 == (id)3)
  {
    v10.receiver = self;
    v10.super_class = (Class)CRLImageRep;
    -[CRLCanvasRep angleForRotation](&v10, "angleForRotation");
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageInfo](self, "imageInfo"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "geometryWithMask"));
    objc_msgSend(v7, "angle");
    v9 = v8;

    return v9;
  }
  return result;
}

- (BOOL)shouldRasterizeRenderableDuringRotation
{
  return !-[CRLImageRep directlyManagesLayerContent](self, "directlyManagesLayerContent");
}

- (CGPoint)unscaledGuidePosition
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  void *v14;
  void *v15;
  float64x2_t v16;
  float64x2_t v17;
  float64x2_t v18;
  double v19;
  double v20;
  double MinY;
  double MidX;
  float64x2_t v23;
  objc_super v24;
  float64x2_t v25;
  float64x2_t v26;
  float64x2_t v27;
  CGPoint result;
  CGRect v29;
  CGRect v30;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self, "imageLayout"));
  v4 = objc_msgSend(v3, "maskEditModeForRotating");

  if (v4 == (id)3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self, "imageLayout"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "imageGeometry"));
    objc_msgSend(v6, "size");
    v7 = sub_10005FDDC();
    v9 = v8;
    v11 = v10;
    v13 = v12;

    v29.origin.x = v7;
    v29.origin.y = v9;
    v29.size.width = v11;
    v29.size.height = v13;
    MidX = CGRectGetMidX(v29);
    v30.origin.x = v7;
    v30.origin.y = v9;
    v30.size.width = v11;
    v30.size.height = v13;
    MinY = CGRectGetMinY(v30);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self, "imageLayout"));
    v15 = v14;
    if (v14)
    {
      objc_msgSend(v14, "layoutToImageTransform");
      v16 = v25;
      v17 = v26;
      v18 = v27;
    }
    else
    {
      v18 = 0uLL;
      v26 = 0u;
      v27 = 0u;
      v25 = 0u;
      v16 = 0uLL;
      v17 = 0uLL;
    }
    v23 = vaddq_f64(v18, vmlaq_n_f64(vmulq_n_f64(v17, MinY), v16, MidX));

    -[CRLCanvasRep convertNaturalPointToUnscaledCanvas:](self, "convertNaturalPointToUnscaledCanvas:", *(_OWORD *)&v23);
  }
  else
  {
    v24.receiver = self;
    v24.super_class = (Class)CRLImageRep;
    -[CRLCanvasRep unscaledGuidePosition](&v24, "unscaledGuidePosition");
  }
  result.y = v20;
  result.x = v19;
  return result;
}

- (id)actionStringForRotate
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  NSString *v8;
  objc_super v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self, "imageLayout"));
  v4 = objc_msgSend(v3, "isInMaskEditMode");

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Edit Mask"), 0, CFSTR("UndoStrings")));

    return v6;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)CRLImageRep;
    v8 = -[CRLCanvasRep actionStringForRotate](&v9, "actionStringForRotate");
    return (id)objc_claimAutoreleasedReturnValue(v8);
  }
}

- (CGPoint)centerForGuideRenderablePlacement
{
  double v2;
  double v3;
  objc_super v4;
  CGPoint result;

  v4.receiver = self;
  v4.super_class = (Class)CRLImageRep;
  -[CRLCanvasRep centerForRotation](&v4, "centerForRotation");
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)dynamicMoveSmartShapeKnobDidBegin
{
  id v3;
  id v4;

  v3 = -[CRLImageRep dynamicResizeDidBegin](self, "dynamicResizeDidBegin");
  v4 = (id)objc_claimAutoreleasedReturnValue(-[CRLImageRep maskLayout](self, "maskLayout"));
  objc_msgSend(v4, "dynamicMovePathKnobDidBegin");

}

- (void)dynamicallyMovedSmartShapeKnobTo:(CGPoint)a3 withTracker:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  __int128 v10;
  CGPoint v11;
  float64x2_t v12;
  CGAffineTransform v13;
  CGAffineTransform v14;

  v10 = *(__int128 *)&a3.y;
  v11 = a3;
  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self, "imageLayout"));
  v7 = v6;
  if (v6)
    objc_msgSend(v6, "layoutToMaskTransform", v10, v11);
  else
    memset(&v13, 0, sizeof(v13));
  CGAffineTransformInvert(&v14, &v13);
  v12 = vaddq_f64(*(float64x2_t *)&v14.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v14.c, *(double *)&v10), *(float64x2_t *)&v14.a, v11.x));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep maskLayout](self, "maskLayout"));
  objc_msgSend(v8, "dynamicallyMovedSmartShapeKnobTo:withTracker:", v5, *(_OWORD *)&v12);

  self->_frameInUnscaledCanvasIsValid = 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "layoutController"));
  objc_msgSend(v9, "validateLayoutWithDependencies:", v8);

  -[CRLCanvasRep invalidateKnobPositions](self, "invalidateKnobPositions");
  -[CRLStyledRep setNeedsDisplay](self, "setNeedsDisplay");

}

- (void)dynamicMoveSmartShapeKnobDidEndWithTracker:(id)a3
{
  void *v4;
  void *v5;
  CRLCanvasCommandSelectionBehavior *v6;
  void *v7;
  CRLCanvasCommandSelectionBehavior *v8;
  _TtC8Freeform17CRLCommandSetMask *v9;
  void *v10;
  void *v11;
  void *v12;
  _TtC8Freeform17CRLCommandSetMask *v13;
  id v14;

  v14 = (id)objc_claimAutoreleasedReturnValue(-[CRLImageRep maskLayout](self, "maskLayout", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "commandController"));
  v6 = [CRLCanvasCommandSelectionBehavior alloc];
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "canvasEditor"));
  v8 = -[CRLCanvasCommandSelectionBehavior initWithCanvasEditor:](v6, "initWithCanvasEditor:", v7);

  v9 = [_TtC8Freeform17CRLCommandSetMask alloc];
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageInfo](self, "imageInfo"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "infoGeometry"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "pathSource"));
  v13 = -[CRLCommandSetMask initWithImageItem:maskGeometry:maskPath:](v9, "initWithImageItem:maskGeometry:maskPath:", v10, v11, v12);

  objc_msgSend(v5, "enqueueCommand:withSelectionBehavior:", v13, v8);
  -[CRLCanvasRep dynamicResizeDidEndWithTracker:](self, "dynamicResizeDidEndWithTracker:", 0);
  -[CRLCanvasRep invalidateKnobs](self, "invalidateKnobs");

}

- (BOOL)canEditMaskInMaskEditMode:(int64_t)a3
{
  return 1;
}

- (void)beginEditingMaskInMaskEditMode:(int64_t)a3
{
  void *v5;
  id v6;
  void *v7;

  -[CRLImageRep p_enterMaskModeIfNecessaryWithHUD:](self, "p_enterMaskModeIfNecessaryWithHUD:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self, "imageLayout"));
  v6 = objc_msgSend(v5, "maskEditMode");

  if (v6 != (id)a3)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self, "imageLayout"));
    objc_msgSend(v7, "beginEditingMaskInMaskEditMode:", a3);

    -[CRLImageRep p_updateHUD](self, "p_updateHUD");
    -[CRLCanvasRep invalidateKnobs](self, "invalidateKnobs");
  }
}

- (void)p_listenForAssetChangesIfAppropriate
{
  NSUUID *downloadObserverIdentifier;
  void *v4;
  void *v5;
  void *v6;
  NSUUID *v7;
  _QWORD *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[6];

  downloadObserverIdentifier = self->_downloadObserverIdentifier;
  if (!downloadObserverIdentifier)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101250778);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E1E9C4();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101250798);
    v4 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageRep p_listenForAssetChangesIfAppropriate]"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageRep.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 1759, 0, "invalid nil value for '%{public}s'", "_downloadObserverIdentifier");

    downloadObserverIdentifier = self->_downloadObserverIdentifier;
  }
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100308050;
  v13[3] = &unk_101250868;
  v13[4] = self;
  v13[5] = downloadObserverIdentifier;
  v7 = downloadObserverIdentifier;
  v8 = objc_retainBlock(v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageInfo](self, "imageInfo"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "imageAssetPayload"));
  ((void (*)(_QWORD *, void *, _QWORD))v8[2])(v8, v10, 0);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageInfo](self, "imageInfo"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "thumbnailAssetPayload"));
  ((void (*)(_QWORD *, void *, uint64_t))v8[2])(v8, v12, 1);

}

- (void)p_handleAssetPreparationCompletion
{
  void *v3;
  NSUUID *downloadObserverIdentifier;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;

  if (!-[CRLCanvasRep hasBeenRemoved](self, "hasBeenRemoved"))
  {
    if (qword_10147E4A8 != -1)
      dispatch_once(&qword_10147E4A8, &stru_101250888);
    v3 = off_1013D91A8;
    if (os_log_type_enabled((os_log_t)off_1013D91A8, OS_LOG_TYPE_DEFAULT))
    {
      downloadObserverIdentifier = self->_downloadObserverIdentifier;
      v5 = v3;
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](downloadObserverIdentifier, "UUIDString"));
      v9 = 138543362;
      v10 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Image Rep with observerUUID %{public}@ preparing for the downloaded asset", (uint8_t *)&v9, 0xCu);

    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
    objc_msgSend(v7, "processChangedProperty:", 18);
    -[CRLImageRepDrawingHelper invalidateSizedImage](self->_drawingHelper, "invalidateSizedImage");
    -[CRLStyledRep setNeedsDisplay](self, "setNeedsDisplay");
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
    objc_msgSend(v8, "invalidateContentLayersForRep:", self);

  }
}

- (BOOL)directlyManagesLayerContent
{
  return self->_directlyManagesLayerContent;
}

- (void)p_updateDirectlyManagesLayerContentForRenderable:(id)a3
{
  _BOOL4 directlyManagesLayerContent;
  _BOOL4 v5;
  void *v7;
  unsigned int v8;
  void *v9;
  id v10;

  directlyManagesLayerContent = self->_directlyManagesLayerContent;
  v5 = -[CRLImageRep p_directlyManagesContentForRenderable:](self, "p_directlyManagesContentForRenderable:", a3);
  self->_directlyManagesLayerContent = v5;
  if (!directlyManagesLayerContent || v5)
  {
    if (!directlyManagesLayerContent && v5)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
      v8 = objc_msgSend(v7, "isCanvasInteractive");

      if (v8)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
        v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "renderableForRep:", self));

        objc_msgSend(v10, "setContents:", 0);
      }
    }
  }
  else
  {
    -[CRLStyledRep setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (BOOL)p_directlyManagesContentForRenderable:(id)a3
{
  unsigned int v4;
  void *v5;
  _BOOL4 v6;
  unsigned __int8 v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned int v21;
  void *v22;
  unsigned int v23;
  unsigned int v24;
  unsigned int v25;
  double v26;
  CGRect v28;
  CGRect v29;

  v4 = -[CRLImageRepDrawingHelper canRenderDirectlyManagedForRenderable:](self->_drawingHelper, "canRenderDirectlyManagedForRenderable:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  if ((objc_msgSend(v5, "createRepsForOffscreenLayouts") & 1) != 0)
  {
    v6 = 0;
    if (!v4)
    {
LABEL_3:
      v7 = 0;
      goto LABEL_26;
    }
  }
  else
  {
    objc_msgSend(v5, "visibleBoundsRectForTiling");
    objc_msgSend(v5, "convertBoundsToUnscaledRect:");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "geometryInRoot"));
    objc_msgSend(v17, "frame");
    v29.origin.x = v9;
    v29.origin.y = v11;
    v29.size.width = v13;
    v29.size.height = v15;
    v6 = !CGRectIntersectsRect(v28, v29);

    if (!v4)
      goto LABEL_3;
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "stroke"));

  if ((objc_msgSend(v19, "shouldRender") & 1) == 0)
  {

    v19 = 0;
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self, "imageLayout"));
  if ((objc_msgSend(v20, "isInMaskEditMode") & 1) != 0)
    v21 = 1;
  else
    v21 = -[CRLCanvasRep isBeingResized](self, "isBeingResized");

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
  if (objc_msgSend(v22, "isStrokeBeingManipulated"))
    v23 = objc_msgSend(v19, "prefersToApplyToShapeRenderableDuringManipulation");
  else
    v23 = 0;

  if (v19)
    v24 = objc_msgSend(v19, "canApplyToShapeRenderable") ^ 1;
  else
    v24 = 0;
  if ((v21 | v23) != 1 || v24)
  {
    v25 = -[CRLImageRepDrawingHelper imagePrefersDrawing](self->_drawingHelper, "imagePrefersDrawing") || v6;
    v7 = v25 ^ 1;
    if (v19 && (v25 & 1) == 0)
    {
      if (objc_msgSend(v19, "prefersToApplyToShapeRenderableDuringManipulation")
        && (-[CRLStyledRep opacity](self, "opacity"), v26 == 1.0))
      {
        v7 = objc_msgSend(v19, "canApplyToShapeRenderable");
      }
      else
      {
        v7 = 0;
      }
    }
  }
  else
  {
    v7 = 1;
  }

LABEL_26:
  return v7;
}

- (void)p_getAliasedValuesForMaskToBoundsDirectLayerFrame:(CGRect *)a3 transform:(CGAffineTransform *)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  CGAffineTransform v22;
  CGAffineTransform v23;
  CGAffineTransform v24;
  CGAffineTransform v25;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v28;
  _OWORD v29[3];

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self, "imageLayout"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "pureGeometry"));
  v9 = v8;
  if (v8)
    objc_msgSend(v8, "fullTransform");
  else
    memset(v29, 0, sizeof(v29));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[CRLCanvasLayoutGeometry geometryFromFullTransform:](CRLCanvasLayoutGeometry, "geometryFromFullTransform:", v29));

  v11 = objc_msgSend(v10, "mutableCopy");
  memset(&v28, 0, sizeof(v28));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self, "imageLayout"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "imageGeometry"));
  v14 = v13;
  if (v13)
    objc_msgSend(v13, "transform");
  else
    memset(&t1, 0, sizeof(t1));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self, "imageLayout"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "pureGeometry"));
  v17 = v16;
  if (v16)
    objc_msgSend(v16, "transform");
  else
    memset(&v25, 0, sizeof(v25));
  CGAffineTransformInvert(&t2, &v25);
  CGAffineTransformConcat(&v28, &t1, &t2);

  memset(&v24, 0, sizeof(v24));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self, "imageLayout"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "maskLayout"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "pureGeometry"));
  v21 = v20;
  if (v20)
    objc_msgSend(v20, "transform");
  else
    memset(&v23, 0, sizeof(v23));
  v22 = v28;
  CGAffineTransformConcat(&v24, &v23, &v22);

  v22 = v24;
  objc_msgSend(v11, "transformBy:", &v22);
  -[CRLCanvasRep computeDirectLayerFrame:andTransform:basedOnLayoutGeometry:](self, "computeDirectLayerFrame:andTransform:basedOnLayoutGeometry:", a3, a4, v11);

}

- (void)updateRenderableGeometryFromLayout:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  CRLImageRepLayerContentsRecipe *directlyManagedLayerContentsRecipe;
  void *v8;
  void *v9;
  void *v10;
  CGAffineTransform *v11;
  CRLImageRepLayerContentsRecipe *v12;
  void *v13;
  void *v14;
  void *v15;
  CGAffineTransform *v16;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v19;
  CGAffineTransform v20;
  CGAffineTransform v21;
  __int128 v22;
  CGFloat v23[3];
  objc_super v24;

  v4 = a3;
  if (-[CRLImageRep directlyManagesLayerContent](self, "directlyManagesLayerContent"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self, "imageLayout"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "imageGeometry"));
    v22 = 0u;
    *(_OWORD *)v23 = 0u;
    memset(&v21, 0, sizeof(v21));
    if (-[CRLImageRep p_shouldRenderWithMaskToBounds](self, "p_shouldRenderWithMaskToBounds"))
    {
      -[CRLImageRep p_getAliasedValuesForMaskToBoundsDirectLayerFrame:transform:](self, "p_getAliasedValuesForMaskToBoundsDirectLayerFrame:transform:", &v22, &v21);
      if (-[CRLImageRep p_shouldRenderWithMaskMatchingImage](self, "p_shouldRenderWithMaskMatchingImage"))
      {
        directlyManagedLayerContentsRecipe = self->_directlyManagedLayerContentsRecipe;
        if (!directlyManagedLayerContentsRecipe)
        {
          +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_1012508A8);
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
            sub_100E1EA50();
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_1012508C8);
          v8 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
            sub_100DE7468(v8);
          v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageRep updateRenderableGeometryFromLayout:]"));
          v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageRep.m"));
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 1901, 0, "invalid nil value for '%{public}s'", "_directlyManagedLayerContentsRecipe");

          directlyManagedLayerContentsRecipe = self->_directlyManagedLayerContentsRecipe;
        }
        v11 = -[CRLImageRepLayerContentsRecipe orientation](directlyManagedLayerContentsRecipe, "orientation");
        memset(&v20, 0, sizeof(v20));
        sub_1003F6270(v11, 0, (uint64_t)&v20, *(CGFloat *)&v22, *((CGFloat *)&v22 + 1), v23[0], v23[1]);
        t1 = v20;
        t2 = v21;
        CGAffineTransformConcat(&v19, &t1, &t2);
        v21 = v19;
      }
      v20 = v21;
      -[CRLCanvasRep antiAliasDefeatLayerFrame:forTransform:](self, "antiAliasDefeatLayerFrame:forTransform:", &v22, &v20);
    }
    else
    {
      -[CRLCanvasRep computeDirectLayerFrame:andTransform:basedOnLayoutGeometry:](self, "computeDirectLayerFrame:andTransform:basedOnLayoutGeometry:", &v22, &v21, v6);
      v12 = self->_directlyManagedLayerContentsRecipe;
      if (!v12)
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_1012508E8);
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100E1EADC();
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101250908);
        v13 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100DE7468(v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageRep updateRenderableGeometryFromLayout:]"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageRep.m"));
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v14, v15, 1913, 0, "invalid nil value for '%{public}s'", "_directlyManagedLayerContentsRecipe");

        v12 = self->_directlyManagedLayerContentsRecipe;
      }
      v16 = -[CRLImageRepLayerContentsRecipe orientation](v12, "orientation");
      memset(&v20, 0, sizeof(v20));
      sub_1003F6270(v16, 0, (uint64_t)&v20, *(CGFloat *)&v22, *((CGFloat *)&v22 + 1), v23[0], v23[1]);
      t1 = v20;
      t2 = v21;
      CGAffineTransformConcat(&v19, &t1, &t2);
      v21 = v19;
      -[CRLCanvasRep antiAliasDefeatLayerTransform:forFrame:](self, "antiAliasDefeatLayerTransform:forFrame:", &v21, v22, *(_OWORD *)v23);
    }
    v20 = v21;
    objc_msgSend(v4, "setIfDifferentFrame:orTransform:", &v20, v22, *(_OWORD *)v23);

  }
  else
  {
    v24.receiver = self;
    v24.super_class = (Class)CRLImageRep;
    -[CRLCanvasRep updateRenderableGeometryFromLayout:](&v24, "updateRenderableGeometryFromLayout:", v4);
  }
  -[CRLImageRep p_invalidateHitTestCache](self, "p_invalidateHitTestCache");

}

- (void)willUpdateRenderable:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  CRLImageRepLayerContentsRecipe *v12;
  CRLImageRepLayerContentsRecipe *directlyManagedLayerContentsRecipe;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  unsigned __int8 v18;
  char v19;
  void *v20;
  void *v21;
  CRLCanvasShapeRenderable *v22;
  CRLCanvasShapeRenderable *strokeRenderable;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)CRLImageRep;
  -[CRLCanvasRep willUpdateRenderable:](&v24, "willUpdateRenderable:", v4);
  -[CRLImageRep p_updateDirectlyManagesLayerContentForRenderable:](self, "p_updateDirectlyManagesLayerContentForRenderable:", v4);
  if (self->_sizedImageNeedsDisplay)
  {
    self->_sizedImageNeedsDisplay = 0;
    if (-[CRLImageRep directlyManagesLayerContent](self, "directlyManagesLayerContent"))
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep shadowRenderable](self, "shadowRenderable"));

      if (v5)
      {
        if (!+[NSThread isMainThread](NSThread, "isMainThread"))
        {
          +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_101250928);
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
            sub_100E1EBF4();
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_101250948);
          v6 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
            sub_100DE7468(v6);
          v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageRep willUpdateRenderable:]"));
          v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageRep.m"));
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 1943, 0, "Can't draw sized image on the main thread while we are doing threaded layout and rendering if image has a shadow!");

        }
        -[CRLCanvasRep invalidateShadowRenderable](self, "invalidateShadowRenderable");
      }
    }
    else
    {
      -[CRLStyledRep setNeedsDisplay](self, "setNeedsDisplay");
    }
  }
  -[CRLImageRep p_generateSizedImageIfNecessary](self, "p_generateSizedImageIfNecessary");
  if (!-[CRLImageRep directlyManagesLayerContent](self, "directlyManagesLayerContent"))
  {
    -[CRLImageRep p_disposeStrokeLayer](self, "p_disposeStrokeLayer");
    goto LABEL_42;
  }
  if (self->_directlyManagedLayerContentsRecipe)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101250968);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E1EB68();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101250988);
    v9 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageRep willUpdateRenderable:]"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageRep.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 1960, 0, "expected nil value for '%{public}s'", "_directlyManagedLayerContentsRecipe");

  }
  v12 = (CRLImageRepLayerContentsRecipe *)objc_claimAutoreleasedReturnValue(-[CRLImageRepDrawingHelper contentsRecipeForDirectlyManagedRenderable:](self->_drawingHelper, "contentsRecipeForDirectlyManagedRenderable:", v4));
  directlyManagedLayerContentsRecipe = self->_directlyManagedLayerContentsRecipe;
  self->_directlyManagedLayerContentsRecipe = v12;

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self, "imageLayout"));
  v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "maskLayout"));
  if (v15)
  {
    v16 = (void *)v15;
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self, "imageLayout"));
    if ((objc_msgSend(v17, "isInMaskEditMode") & 1) != 0
      || !-[CRLImageRep p_shouldRenderWithMaskToBounds](self, "p_shouldRenderWithMaskToBounds"))
    {
      v18 = -[CRLImageRepLayerContentsRecipe hasBakedMask](self->_directlyManagedLayerContentsRecipe, "hasBakedMask");

      if ((v18 & 1) == 0)
      {
        -[CRLImageRep p_createMaskRenderableForRenderable:](self, "p_createMaskRenderableForRenderable:", v4);
        v19 = 1;
        goto LABEL_35;
      }
    }
    else
    {

    }
  }
  v19 = 0;
LABEL_35:
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "stroke"));

  if (!v21 || !objc_msgSend(v21, "shouldRender"))
  {

    -[CRLImageRep p_disposeStrokeLayer](self, "p_disposeStrokeLayer");
    if ((v19 & 1) != 0)
      goto LABEL_43;
LABEL_42:
    -[CRLImageRep p_disposeMaskRenderable](self, "p_disposeMaskRenderable");
    goto LABEL_43;
  }
  if (!self->_strokeRenderable)
  {
    v22 = (CRLCanvasShapeRenderable *)objc_claimAutoreleasedReturnValue(+[CRLCanvasShapeRenderable renderable](CRLCanvasShapeRenderable, "renderable"));
    strokeRenderable = self->_strokeRenderable;
    self->_strokeRenderable = v22;

    -[CRLCanvasRenderable setDelegate:](self->_strokeRenderable, "setDelegate:", self);
    -[CRLCanvasShapeRenderable setFillColor:](self->_strokeRenderable, "setFillColor:", 0);
  }

  if ((v19 & 1) == 0)
    goto LABEL_42;
LABEL_43:

}

- (void)didUpdateRenderable:(id)a3
{
  id v4;
  void *v5;
  CRLCanvasRenderable *contentsRenderable;
  CRLCanvasRenderable *v7;
  double y;
  CRLImageRepLayerContentsRecipe *directlyManagedLayerContentsRecipe;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _BOOL4 v18;
  unsigned int v19;
  uint64_t v20;
  void *v21;
  unsigned int v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  CRLCanvasRenderable *v26;
  void *v27;
  CRLCanvasRenderable *v28;
  CRLCanvasRenderable *v29;
  void *v30;
  unsigned __int8 v31;
  void *v32;
  double v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  CGFloat v42;
  double v43;
  CGFloat v44;
  double v45;
  CGFloat v46;
  CGAffineTransform *v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  unsigned int v60;
  id v61;
  id WeakRetained;
  void *v63;
  void *v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  void *v73;
  CGFloat v74;
  CGFloat v75;
  CGFloat v76;
  CGFloat v77;
  BOOL v78;
  void *v79;
  CRLCanvasShapeRenderable *maskSubrenderable;
  CGFloat v81;
  CGFloat v82;
  CGFloat v83;
  CGFloat v84;
  CRLImageRepLayerContentsRecipe *v85;
  double v86;
  double v87;
  float v88;
  double v89;
  double v90;
  CGAffineTransform v91;
  CGAffineTransform v92;
  CGAffineTransform v93;
  CGAffineTransform v94;
  CGAffineTransform v95;
  CGAffineTransform v96;
  _OWORD v97[2];
  CGAffineTransform v98;
  CGAffineTransform v99;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v102;
  CGAffineTransform v103;
  CGAffineTransform v104;
  CGAffineTransform v105;
  CGAffineTransform v106;
  CGAffineTransform v107;
  objc_super v108[3];
  objc_super v109;
  CGRect v110;
  CGRect v111;
  CGRect v112;
  CGRect v113;
  CGRect v114;
  CGRect v115;
  CGRect v116;

  v4 = a3;
  v109.receiver = self;
  v109.super_class = (Class)CRLImageRep;
  -[CRLCanvasRep didUpdateRenderable:](&v109, "didUpdateRenderable:", v4);
  objc_msgSend(v4, "crl_ignoreAccessibilityInvertColorsIfNeeded");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep maskLayout](self, "maskLayout"));
  if (!-[CRLImageRep p_shouldRenderWithMaskToBounds](self, "p_shouldRenderWithMaskToBounds"))
  {
    contentsRenderable = self->_contentsRenderable;
    if (contentsRenderable)
    {
      -[CRLCanvasRenderable removeFromSuperlayer](contentsRenderable, "removeFromSuperlayer");
      v7 = self->_contentsRenderable;
      self->_contentsRenderable = 0;

      objc_msgSend(v4, "setMasksToBounds:", 0);
      objc_msgSend(v4, "setCornerRadius:", 0.0);
      objc_msgSend(v4, "setCornerCurve:", kCACornerCurveCircular);
    }
  }
  y = CGPointZero.y;
  if (-[CRLImageRep directlyManagesLayerContent](self, "directlyManagesLayerContent"))
  {
    +[CATransaction begin](CATransaction, "begin");
    +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
    directlyManagedLayerContentsRecipe = self->_directlyManagedLayerContentsRecipe;
    if (!directlyManagedLayerContentsRecipe)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_1012509A8);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E1EC74();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_1012509C8);
      v10 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageRep didUpdateRenderable:]"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageRep.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 2025, 0, "invalid nil value for '%{public}s'", "_directlyManagedLayerContentsRecipe");

      directlyManagedLayerContentsRecipe = self->_directlyManagedLayerContentsRecipe;
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRepLayerContentsRecipe image](directlyManagedLayerContentsRecipe, "image"));
    if (-[CRLImageRepDrawingHelper isGeneratingSizedImageWithBakedMask](self->_drawingHelper, "isGeneratingSizedImageWithBakedMask")&& !+[NSThread isMainThread](NSThread, "isMainThread"))
    {

      v13 = 0;
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contents"));

    if (v14 != v13)
      objc_msgSend(v4, "setContents:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self, "imageLayout"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "imageGeometryInRoot"));
    v17 = v16;
    if (v16)
      objc_msgSend(v16, "transform");
    else
      memset(v108, 0, sizeof(v108));
    v18 = sub_100079384((double *)v108);

    v19 = objc_msgSend(v4, "edgeAntialiasingMask");
    if (v18)
    {
      if (!v19)
        goto LABEL_31;
      v20 = 0;
    }
    else
    {
      if (v19 == 15)
        goto LABEL_31;
      v20 = 15;
    }
    objc_msgSend(v4, "setEdgeAntialiasingMask:", v20);
LABEL_31:
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v22 = objc_msgSend(v21, "BOOLForKey:", CFSTR("TSDSuppressImageInterpolation"));

    if (v22)
      v23 = CFSTR("nearest");
    else
      v23 = CFSTR("linear");
    objc_msgSend(v4, "setMagnificationFilter:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "stroke"));

    if (v25 && objc_msgSend(v25, "shouldRender"))
      -[CRLImageRep p_updateStrokeLayerForStroke:repRenderable:](self, "p_updateStrokeLayerForStroke:repRenderable:", v25, v4);
    if (!v5)
      goto LABEL_55;
    if (-[CRLImageRep p_shouldRenderWithMaskMatchingImage](self, "p_shouldRenderWithMaskMatchingImage"))
    {
      -[CRLCanvasRenderable removeFromSuperlayer](self->_contentsRenderable, "removeFromSuperlayer");
      v26 = self->_contentsRenderable;
      self->_contentsRenderable = 0;

      v27 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageInfo](self, "imageInfo"));
      objc_msgSend(v4, "setMasksToBounds:", objc_msgSend(v27, "hasRoundedCorners"));

      -[CRLImageRep p_updateCornerRadiusOnRenderable:](self, "p_updateCornerRadiusOnRenderable:", v4);
LABEL_55:
      -[CRLMediaRep updateSpatialLabel](self, "updateSpatialLabel");
      v64 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep maskRenderable](self, "maskRenderable"));

      if (v64)
      {
        +[CATransaction begin](CATransaction, "begin");
        +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
        objc_msgSend(v4, "bounds");
        v66 = v65;
        v68 = v67;
        v70 = v69;
        v72 = v71;
        v73 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep maskRenderable](self, "maskRenderable"));
        objc_msgSend(v73, "frame");
        v114.origin.x = v74;
        v114.origin.y = v75;
        v114.size.width = v76;
        v114.size.height = v77;
        v111.origin.x = v66;
        v111.origin.y = v68;
        v111.size.width = v70;
        v111.size.height = v72;
        v78 = CGRectEqualToRect(v111, v114);

        if (!v78)
        {
          v79 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep maskRenderable](self, "maskRenderable"));
          objc_msgSend(v79, "setFrame:", v66, v68, v70, v72);

        }
        maskSubrenderable = self->_maskSubrenderable;
        if (maskSubrenderable)
        {
          -[CRLCanvasRenderable frame](maskSubrenderable, "frame");
          v115.origin.x = v81;
          v115.origin.y = v82;
          v115.size.width = v83;
          v115.size.height = v84;
          v112.origin.x = v66;
          v112.origin.y = v68;
          v112.size.width = v70;
          v112.size.height = v72;
          if (!CGRectEqualToRect(v112, v115))
            -[CRLCanvasRenderable setFrame:](self->_maskSubrenderable, "setFrame:", v66, v68, v70, v72);
        }
        +[CATransaction commit](CATransaction, "commit");
      }
      +[CATransaction commit](CATransaction, "commit");
      v85 = self->_directlyManagedLayerContentsRecipe;
      self->_directlyManagedLayerContentsRecipe = 0;

      goto LABEL_63;
    }
    if (-[CRLImageRep p_shouldRenderWithMaskToBounds](self, "p_shouldRenderWithMaskToBounds"))
    {
      if (!self->_contentsRenderable)
      {
        v28 = (CRLCanvasRenderable *)objc_claimAutoreleasedReturnValue(+[CRLCanvasRenderable renderable](CRLCanvasRenderable, "renderable"));
        v29 = self->_contentsRenderable;
        self->_contentsRenderable = v28;

      }
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "subrenderables"));
      v31 = objc_msgSend(v30, "containsObject:", self->_contentsRenderable);

      if ((v31 & 1) == 0)
        objc_msgSend(v4, "addSubrenderable:", self->_contentsRenderable);
      objc_msgSend(v4, "setMasksToBounds:", 1);
      -[CRLCanvasRenderable setContents:](self->_contentsRenderable, "setContents:", v13);
      objc_msgSend(v4, "setContents:", 0);
      -[CRLImageRep p_updateCornerRadiusOnRenderable:](self, "p_updateCornerRadiusOnRenderable:", v4);
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
      objc_msgSend(v32, "viewScale");
      v90 = v33;

      v34 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self, "imageLayout"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "imageGeometry"));
      objc_msgSend(v35, "size");
      v37 = v36;
      v39 = v38;

      sub_1000603DC(v37, v39, v90);
      v40 = sub_10005FDDC();
      v42 = v41;
      v44 = v43;
      v46 = v45;
      v47 = -[CRLImageRepLayerContentsRecipe orientation](self->_directlyManagedLayerContentsRecipe, "orientation");
      memset(&v107, 0, sizeof(v107));
      sub_1003F6270(v47, 0, (uint64_t)&v107, v40, v42, v44, v46);
      v106 = v107;
      v110.origin.x = v40;
      v110.origin.y = v42;
      v110.size.width = v44;
      v110.size.height = v46;
      CGRectApplyAffineTransform(v110, &v106);
      v48 = sub_10005FDDC();
      v50 = v49;
      v52 = v51;
      v54 = v53;
      memset(&v106, 0, sizeof(v106));
      v55 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self, "imageLayout"));
      v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "maskLayout"));
      v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "pureGeometry"));
      v58 = v57;
      if (v57)
        objc_msgSend(v57, "transform");
      else
        memset(&v105, 0, sizeof(v105));
      CGAffineTransformInvert(&v106, &v105);

      memset(&v104, 0, sizeof(v104));
      CGAffineTransformMakeTranslation(&v104, v37 * -0.5, v39 * -0.5);
      memset(&v103, 0, sizeof(v103));
      t1 = v104;
      t2 = v107;
      CGAffineTransformConcat(&v102, &t1, &t2);
      t1 = v104;
      CGAffineTransformInvert(&v99, &t1);
      CGAffineTransformConcat(&v103, &v102, &v99);
      t2 = v103;
      v98 = v106;
      CGAffineTransformConcat(&t1, &t2, &v98);
      *(_OWORD *)&v106.a = *(_OWORD *)&t1.a;
      *(_OWORD *)&v106.c = *(_OWORD *)&t1.c;
      *(float64x2_t *)&v106.tx = vmulq_n_f64(*(float64x2_t *)&t1.tx, v90);
      *(_OWORD *)&t2.a = *(_OWORD *)&t1.a;
      *(_OWORD *)&t2.c = *(_OWORD *)&t1.c;
      *(_OWORD *)&t2.tx = *(_OWORD *)&v106.tx;
      sub_1000796D4(&t2, &t1, v52 * 0.5, v54 * 0.5);
      v106 = t1;
      -[CRLCanvasRenderable setBounds:](self->_contentsRenderable, "setBounds:", v48, v50, v52, v54);
      memset(v97, 0, sizeof(v97));
      memset(&t1, 0, sizeof(t1));
      -[CRLImageRep p_getAliasedValuesForMaskToBoundsDirectLayerFrame:transform:](self, "p_getAliasedValuesForMaskToBoundsDirectLayerFrame:transform:", v97, &t1);
      memset(&t2, 0, sizeof(t2));
      CGAffineTransformMakeTranslation(&v96, *(CGFloat *)v97, *((CGFloat *)v97 + 1));
      v98 = t1;
      CGAffineTransformConcat(&t2, &v98, &v96);
      memset(&v98, 0, sizeof(v98));
      v95 = v106;
      v94 = t2;
      CGAffineTransformConcat(&v98, &v95, &v94);
      -[CRLCanvasRep antiAliasDefeatLayerTransform:forFrame:](self, "antiAliasDefeatLayerTransform:forFrame:", &v98, v48, v50, v52, v54);
      v95 = t1;
      -[CRLCanvasRep antiAliasDefeatLayerFrame:forTransform:](self, "antiAliasDefeatLayerFrame:forTransform:", v97, &v95);
      memset(&v95, 0, sizeof(v95));
      CGAffineTransformMakeTranslation(&v93, *(CGFloat *)v97, *((CGFloat *)v97 + 1));
      v94 = t1;
      CGAffineTransformConcat(&v95, &v94, &v93);
      v94 = v95;
      CGAffineTransformInvert(&v92, &v94);
      v91 = v98;
      CGAffineTransformConcat(&v94, &v91, &v92);
      v106 = v94;
      -[CRLCanvasRenderable setIfDifferentFrame:orTransform:](self->_contentsRenderable, "setIfDifferentFrame:orTransform:", &v94, v48, v50, v52, v54);
      WeakRetained = objc_loadWeakRetained((id *)&self->_frameMaskLayer);
      v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "mask"));

      if (!v63)
        goto LABEL_55;
      v61 = objc_loadWeakRetained((id *)&self->_frameMaskLayer);
      objc_msgSend(v61, "setMask:", 0);
    }
    else
    {
      v59 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self, "imageLayout"));
      v60 = objc_msgSend(v59, "isInMaskEditMode");

      if (v60)
      {
        -[CRLImageRep p_updateMaskSublayersForMaskEditMode](self, "p_updateMaskSublayersForMaskEditMode");
        -[CRLImageRep p_updateMaskRenderable:forRepRenderable:shouldIncludeMask:shouldIncludeInstantAlpha:siblingLayer:](self, "p_updateMaskRenderable:forRepRenderable:shouldIncludeMask:shouldIncludeInstantAlpha:siblingLayer:", self->_maskSubrenderable, v4, 1, 0, 0);
        -[CRLImageRep p_updateMaskRenderable:forRepRenderable:shouldIncludeMask:shouldIncludeInstantAlpha:siblingLayer:](self, "p_updateMaskRenderable:forRepRenderable:shouldIncludeMask:shouldIncludeInstantAlpha:siblingLayer:", self->_maskPathRenderable, v4, 1, 0, 1);
        goto LABEL_55;
      }
      if (-[CRLImageRepLayerContentsRecipe hasBakedMask](self->_directlyManagedLayerContentsRecipe, "hasBakedMask"))
        goto LABEL_55;
      v61 = (id)objc_claimAutoreleasedReturnValue(-[CRLImageRep maskRenderable](self, "maskRenderable"));
      -[CRLImageRep p_updateMaskRenderable:forRepRenderable:shouldIncludeMask:shouldIncludeInstantAlpha:siblingLayer:](self, "p_updateMaskRenderable:forRepRenderable:shouldIncludeMask:shouldIncludeInstantAlpha:siblingLayer:", v61, v4, 1, 1, 0);
    }

    goto LABEL_55;
  }
  if (objc_msgSend(v4, "edgeAntialiasingMask") != 15)
    objc_msgSend(v4, "setEdgeAntialiasingMask:", 15);
LABEL_63:
  objc_msgSend(v4, "contentsRect");
  v116.size.width = 1.0;
  v116.size.height = 1.0;
  v116.origin.x = CGPointZero.x;
  v116.origin.y = y;
  if (!CGRectEqualToRect(v113, v116))
    objc_msgSend(v4, "setContentsRect:", CGPointZero.x, y, 1.0, 1.0);
  -[CRLStyledRep opacity](self, "opacity");
  v87 = v86;
  if (-[CRLImageRep shouldShowLoadingUI](self, "shouldShowLoadingUI")
    && !-[CRLImageRep directlyManagesLayerContent](self, "directlyManagesLayerContent"))
  {
    v87 = 1.0;
  }
  objc_msgSend(v4, "opacity");
  v89 = v88;
  if (v87 != v89)
  {
    *(float *)&v89 = v87;
    objc_msgSend(v4, "setOpacity:", v89);
  }

}

- (BOOL)shouldDisplayAsSpatial
{
  void *v3;
  void *v4;
  unsigned int v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageInfo](self, "imageInfo"));
  if (objc_msgSend(v3, "shouldDisplayAsSpatial"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self, "imageLayout"));
    v5 = objc_msgSend(v4, "isInMaskEditMode") ^ 1;

  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (void)p_updateCornerRadiusOnRenderable:(id)a3
{
  uint64_t v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  const CALayerCornerCurve *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  unsigned int v18;
  id v19;

  v19 = a3;
  *(_QWORD *)&v5 = objc_opt_class(CRLScalarPathSource, v4).n128_u64[0];
  v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self, "imageLayout", v5));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "maskLayout"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "pathSource"));
  v11 = sub_100221D0C(v7, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  if (v12 && !objc_msgSend(v12, "type"))
  {
    objc_msgSend(v12, "cornerRadius");
    v15 = v14;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
    objc_msgSend(v16, "viewScale");
    objc_msgSend(v19, "setCornerRadius:", v15 * v17);

    v18 = objc_msgSend(v12, "isCurveContinuous");
    v13 = &kCACornerCurveContinuous;
    if (!v18)
      v13 = &kCACornerCurveCircular;
  }
  else
  {
    objc_msgSend(v19, "setCornerRadius:", 0.0);
    v13 = &kCACornerCurveCircular;
  }
  objc_msgSend(v19, "setCornerCurve:", *v13);

}

- (void)p_updateMaskRenderable:(id)a3 forRepRenderable:(id)a4 shouldIncludeMask:(BOOL)a5 shouldIncludeInstantAlpha:(BOOL)a6 siblingLayer:(BOOL)a7
{
  _BOOL4 v8;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  CGFloat v20;
  const CGPath *Copy;
  __int128 v22;
  double v23;
  double v24;
  CRLImageRepLayerContentsRecipe *directlyManagedLayerContentsRecipe;
  void *v26;
  void *v27;
  void *v28;
  CGAffineTransform *v29;
  CGAffineTransform *v30;
  double v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  double v38;
  double v39;
  CGFloat v40;
  void *v41;
  unsigned int v42;
  void *v43;
  void *v44;
  void *v45;
  CGPath *v46;
  CGAffineTransform v47;
  CGAffineTransform v48;
  CGAffineTransform v49;
  CGAffineTransform v50;
  CGAffineTransform v51;
  CGAffineTransform v52;
  CGAffineTransform v53;
  CGAffineTransform t1;
  CGAffineTransform t2;
  CGAffineTransform v56;
  CGAffineTransform v57;

  v8 = a5;
  v11 = a3;
  v12 = a4;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self, "imageLayout"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "maskLayout"));

  if (!-[CRLImageRep directlyManagesLayerContent](self, "directlyManagesLayerContent"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012509E8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E1EE0C();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101250A08);
    v15 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageRep p_updateMaskRenderable:forRepRenderable:shouldIncludeMask:shouldIncludeInstantAlpha:siblingLayer:]"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageRep.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v16, v17, 2234, 0, "Updating mask layer for a non-directly managed layer!");

  }
  if (v11 && !-[CRLImageRep p_shouldRenderWithMaskToBounds](self, "p_shouldRenderWithMaskToBounds"))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
    objc_msgSend(v18, "viewScale");
    v20 = v19;

    Copy = 0;
    v22 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)&v57.a = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&v57.c = v22;
    *(_OWORD *)&v57.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
    if (v14 && v8)
    {
      objc_msgSend(v14, "pathBounds");
      CGAffineTransformMakeTranslation(&v57, -v23, -v24);
      objc_msgSend(v14, "transform");
      t1 = v57;
      CGAffineTransformConcat(&v56, &t1, &t2);
      v57 = v56;
      CGAffineTransformMakeScale(&v53, v20, v20);
      t1 = v57;
      CGAffineTransformConcat(&v56, &t1, &v53);
      v57 = v56;
      Copy = CGPathCreateCopy((CGPathRef)objc_msgSend(v14, "path"));
    }
    directlyManagedLayerContentsRecipe = self->_directlyManagedLayerContentsRecipe;
    if (!directlyManagedLayerContentsRecipe)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101250A28);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E1ED80();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101250A48);
      v26 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageRep p_updateMaskRenderable:forRepRenderable:shouldIncludeMask:shouldIncludeInstantAlpha:siblingLayer:]"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageRep.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v27, v28, 2250, 0, "invalid nil value for '%{public}s'", "_directlyManagedLayerContentsRecipe");

      directlyManagedLayerContentsRecipe = self->_directlyManagedLayerContentsRecipe;
    }
    v29 = -[CRLImageRepLayerContentsRecipe orientation](directlyManagedLayerContentsRecipe, "orientation");
    if (v29 && !a7)
    {
      v30 = v29;
      objc_msgSend(v12, "bounds");
      v31 = sub_10005FDDC();
      v33 = v32;
      v35 = v34;
      v37 = v36;
      memset(&v56, 0, sizeof(v56));
      sub_1003F6270(v30, 0, (uint64_t)&v56, v31, v32, v34, v36);
      v38 = sub_100061400(v31, v33, v35, v37);
      v40 = v39;
      memset(&t1, 0, sizeof(t1));
      CGAffineTransformMakeTranslation(&v52, -v38, -v39);
      CGAffineTransformMakeTranslation(&v50, v38, v40);
      v49 = v56;
      CGAffineTransformConcat(&v51, &v49, &v50);
      CGAffineTransformConcat(&t1, &v52, &v51);
      v49 = t1;
      CGAffineTransformInvert(&v48, &v49);
      v47 = v57;
      CGAffineTransformConcat(&v49, &v47, &v48);
      v57 = v49;
    }
    if (!Copy)
    {
      v41 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self, "imageLayout"));
      v42 = objc_msgSend(v41, "maskIntersectsImage");

      if (v42)
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101250A68);
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100E1ED00();
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101250A88);
        v43 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100DE7468(v43);
        v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageRep p_updateMaskRenderable:forRepRenderable:shouldIncludeMask:shouldIncludeInstantAlpha:siblingLayer:]"));
        v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageRep.m"));
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v44, v45, 2264, 0, "maskPath is nil when it should not be");

      }
    }
    v56 = v57;
    v46 = sub_1000C8414(Copy, &v56);
    objc_msgSend(v11, "setPath:", v46);
    CGPathRelease(v46);
    CGPathRelease(Copy);
  }

}

- (void)p_updateStrokeLayerForStroke:(id)a3 repRenderable:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  __int128 v13;
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
  double v27;
  double v28;
  float v29;
  double v30;
  CGPath *v31;
  CGPath *Mutable;
  const CGPath *v33;
  CRLCanvasShapeRenderable *strokeRenderable;
  uint64_t v35;
  CRLCanvasShapeRenderable *v36;
  CGAffineTransform v37;
  CGAffineTransform v38;
  CGAffineTransform v39;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v42;
  __int128 v43;
  __int128 v44;
  CGAffineTransform v45;
  CGRect v46;

  v5 = a3;
  +[CATransaction begin](CATransaction, "begin");
  +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self, "imageLayout"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep maskLayout](self, "maskLayout"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
  objc_msgSend(v8, "viewScale");
  v10 = v9;

  v44 = 0u;
  memset(&v45, 0, sizeof(v45));
  v43 = 0u;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self, "imageLayout"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "imageGeometry"));
  -[CRLCanvasRep computeDirectLayerFrame:andTransform:basedOnLayoutGeometry:](self, "computeDirectLayerFrame:andTransform:basedOnLayoutGeometry:", &v43, &v45, v12);

  v13 = v44;
  v14 = sub_10005FDDC();
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v21 = sub_100061400(*(CGFloat *)&v43, *((CGFloat *)&v43 + 1), *(CGFloat *)&v13, *((CGFloat *)&v13 + 1));
  v23 = v22;
  -[CRLCanvasRenderable position](self->_strokeRenderable, "position");
  if (v25 != v21 || v24 != v23)
    -[CRLCanvasRenderable setPosition:](self->_strokeRenderable, "setPosition:", v21, v23);
  -[CRLStyledRep opacity](self, "opacity");
  v28 = v27;
  -[CRLCanvasRenderable opacity](self->_strokeRenderable, "opacity");
  v30 = v29;
  if (v28 != v30)
  {
    *(float *)&v30 = v28;
    -[CRLCanvasRenderable setOpacity:](self->_strokeRenderable, "setOpacity:", v30);
  }
  -[CRLCanvasRenderable setBounds:](self->_strokeRenderable, "setBounds:", v14, v16, v18, v20);
  objc_msgSend(v5, "applyToShapeRenderable:withScale:", self->_strokeRenderable, v10);

  v31 = (CGPath *)objc_msgSend(v6, "pathToStroke");
  Mutable = v31;
  if (!v7)
  {
    if (!v31)
    {
      Mutable = CGPathCreateMutable();
      v46.origin.x = v14;
      v46.origin.y = v16;
      v46.size.width = v18;
      v46.size.height = v20;
      CGPathAddRect(Mutable, 0, v46);
      goto LABEL_14;
    }
    memset(&v42, 0, sizeof(v42));
    CGAffineTransformMakeScale(&v42, v10, v10);
    v33 = (const CGPath *)objc_msgSend(v6, "pathToStroke");
    v39 = v42;
LABEL_13:
    Mutable = sub_1000C8414(v33, &v39);
LABEL_14:
    strokeRenderable = self->_strokeRenderable;
    v35 = 0;
    goto LABEL_16;
  }
  if (v31)
  {
    memset(&v42, 0, sizeof(v42));
    objc_msgSend(v7, "transform");
    CGAffineTransformMakeScale(&t2, v10, v10);
    CGAffineTransformConcat(&v42, &t1, &t2);
    v39 = v42;
    v33 = Mutable;
    goto LABEL_13;
  }
  strokeRenderable = self->_strokeRenderable;
  v35 = 1;
LABEL_16:
  -[CRLCanvasRenderable setHidden:](strokeRenderable, "setHidden:", v35);
  -[CRLCanvasShapeRenderable setPath:](self->_strokeRenderable, "setPath:", Mutable);
  CGPathRelease(Mutable);
  v36 = self->_strokeRenderable;
  if (v36)
    -[CRLCanvasRenderable affineTransform](v36, "affineTransform");
  else
    memset(&v38, 0, sizeof(v38));
  v42 = v45;
  if (!CGAffineTransformEqualToTransform(&v38, &v42))
  {
    v37 = v45;
    -[CRLCanvasRenderable setAffineTransform:](self->_strokeRenderable, "setAffineTransform:", &v37);
  }
  +[CATransaction commit](CATransaction, "commit");

}

- (id)additionalRenderablesOverRenderable
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  CRLCanvasShapeRenderable *maskPathRenderable;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  _OWORD v22[3];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)CRLImageRep;
  v3 = -[CRLMediaRep additionalRenderablesOverRenderable](&v26, "additionalRenderablesOverRenderable");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v4));

  if (self->_strokeRenderable)
    objc_msgSend(v5, "addObject:");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self, "imageLayout"));
  if (objc_msgSend(v6, "isInMaskEditMode"))
  {
    maskPathRenderable = self->_maskPathRenderable;

    if (!maskPathRenderable)
      -[CRLImageRep p_updateMaskSublayersForMaskEditMode](self, "p_updateMaskSublayersForMaskEditMode");
  }
  else
  {

  }
  if (self->_maskPathRenderable)
  {
    +[CATransaction begin](CATransaction, "begin");
    +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
    v24 = 0u;
    v25 = 0u;
    v23 = 0u;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self, "imageLayout"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "imageGeometryInRoot"));
    v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "transform");
    }
    else
    {
      v24 = 0u;
      v25 = 0u;
      v23 = 0u;
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
    objc_msgSend(v11, "viewScale");
    *(double *)&v25 = v12 * *(double *)&v25;

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
    objc_msgSend(v13, "viewScale");
    *((double *)&v25 + 1) = v14 * *((double *)&v25 + 1);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep parentRep](self, "parentRep"));
    if (v15)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep parentRep](self, "parentRep"));
      objc_msgSend(v16, "layerFrameInScaledCanvas");
      v18 = v17;
      v20 = v19;

      *(double *)&v25 = *(double *)&v25 - v18;
      *((double *)&v25 + 1) = *((double *)&v25 + 1) - v20;
    }
    v22[0] = v23;
    v22[1] = v24;
    v22[2] = v25;
    -[CRLCanvasRenderable setAffineTransform:](self->_maskPathRenderable, "setAffineTransform:", v22);
    +[CATransaction commit](CATransaction, "commit");
    objc_msgSend(v5, "addObject:", self->_maskPathRenderable);
  }
  return v5;
}

- (void)p_setDefaultMaskWithActionString:(id)a3
{
  id v4;
  CRLCanvasCommandSelectionBehavior *v5;
  void *v6;
  void *v7;
  CRLCanvasCommandSelectionBehavior *v8;
  void *v9;
  void *v10;
  _TtC8Freeform17CRLCommandSetMask *v11;
  void *v12;
  void *v13;
  id v14;

  v4 = a3;
  v14 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep commandController](self, "commandController"));
  v5 = [CRLCanvasCommandSelectionBehavior alloc];
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "canvasEditor"));
  v8 = -[CRLCanvasCommandSelectionBehavior initWithCanvasEditor:](v5, "initWithCanvasEditor:", v7);

  objc_msgSend(v14, "openGroupWithSelectionBehavior:", v8);
  objc_msgSend(v14, "setCurrentGroupActionString:", v4);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageInfo](self, "imageInfo"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "defaultMaskInfo"));
  v11 = -[CRLCommandSetMask initWithImageItem:maskInfo:]([_TtC8Freeform17CRLCommandSetMask alloc], "initWithImageItem:maskInfo:", v9, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "commandController"));

  objc_msgSend(v13, "enqueueCommand:", v11);
  objc_msgSend(v14, "closeGroup");

}

- (void)p_endEditingMask
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD block[2];
  void (*v8)(uint64_t);
  void *v9;
  CRLImageRep *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self, "imageLayout"));
  objc_msgSend(v3, "endMaskEditMode");

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageInfo](self, "imageInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "maskInfo"));

  if (!v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self, "imageLayout"));
    objc_msgSend(v6, "maskWasReset");

  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  v8 = sub_10030B324;
  v9 = &unk_10122D110;
  v10 = self;
  if (+[NSThread isMainThread](NSThread, "isMainThread"))
    v8((uint64_t)block);
  else
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  -[CRLImageRep p_cleanUpMaskModeUI](self, "p_cleanUpMaskModeUI");
}

- (void)p_setUpMaskModeUI
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenuController sharedMenuController](UIMenuController, "sharedMenuController"));
  objc_msgSend(v3, "hideMenu");

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "editorController"));
  objc_msgSend(v4, "addObserver:selector:name:object:", self, "p_selectionPathDidChange:", CFSTR("CRLEditorControllerSelectionPathDidChangeNotification"), v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  objc_msgSend(v7, "canvasInvalidatedForRep:", self);

  -[CRLCanvasRep invalidateKnobs](self, "invalidateKnobs");
  -[CRLImageRep p_updateHUD](self, "p_updateHUD");
  -[CRLImageRep p_invalidateHitTestCache](self, "p_invalidateHitTestCache");
}

- (void)p_cleanUpMaskModeUI
{
  CRLCanvasShapeRenderable *maskSubrenderable;
  CRLCanvasShapeRenderable *maskPathRenderable;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  +[CATransaction begin](CATransaction, "begin");
  -[CRLCanvasRenderable removeFromSuperlayer](self->_maskSubrenderable, "removeFromSuperlayer");
  maskSubrenderable = self->_maskSubrenderable;
  self->_maskSubrenderable = 0;

  maskPathRenderable = self->_maskPathRenderable;
  self->_maskPathRenderable = 0;

  +[CATransaction commit](CATransaction, "commit");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "editorController"));
  objc_msgSend(v5, "removeObserver:name:object:", self, CFSTR("CRLEditorControllerSelectionPathDidChangeNotification"), v7);

  if (-[CRLImageRep p_shouldBakeMaskIntoSizedImage](self, "p_shouldBakeMaskIntoSizedImage"))
    -[CRLImageRepDrawingHelper invalidateSizedImage](self->_drawingHelper, "invalidateSizedImage");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  objc_msgSend(v8, "canvasInvalidatedForRep:", self);

  -[CRLCanvasRep invalidateKnobs](self, "invalidateKnobs");
  -[CRLImageRep p_invalidateHitTestCache](self, "p_invalidateHitTestCache");
}

- (void)p_updateHUD
{
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "layerHost"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "imageHUDController"));
  objc_msgSend(v4, "updateControlsForRep:", self);

}

- (void)p_disposeStrokeLayer
{
  CRLImageRep *v2;
  CRLCanvasShapeRenderable *strokeRenderable;
  CGSize size;
  __int128 v5;
  id WeakRetained;

  if (self->_strokeRenderable)
  {
    v2 = self;
    +[CATransaction begin](CATransaction, "begin");
    -[CRLCanvasRenderable setDelegate:](v2->_strokeRenderable, "setDelegate:", 0);
    strokeRenderable = v2->_strokeRenderable;
    v2->_strokeRenderable = 0;

    size = CGRectZero.size;
    v2->_lastPictureFrameLayerRect.origin = CGRectZero.origin;
    v2->_lastPictureFrameLayerRect.size = size;
    v5 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)&v2->_lastPictureFrameLayerTransform.a = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&v2->_lastPictureFrameLayerTransform.c = v5;
    *(_OWORD *)&v2->_lastPictureFrameLayerTransform.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
    v2 = (CRLImageRep *)((char *)v2 + 424);
    WeakRetained = objc_loadWeakRetained((id *)&v2->super.super.super.super.isa);
    objc_msgSend(WeakRetained, "removeFromSuperlayer");

    objc_storeWeak((id *)&v2->super.super.super.super.isa, 0);
    +[CATransaction commit](CATransaction, "commit");
  }
}

- (void)p_disposeMaskRenderable
{
  void *v3;
  CRLCanvasShapeRenderable *maskSubrenderable;
  void *v5;
  void *v6;
  CALayer **p_frameMaskLayer;
  id WeakRetained;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep maskRenderable](self, "maskRenderable"));

  if (v3)
  {
    +[CATransaction begin](CATransaction, "begin");
    -[CRLCanvasRenderable removeFromSuperlayer](self->_maskSubrenderable, "removeFromSuperlayer");
    maskSubrenderable = self->_maskSubrenderable;
    self->_maskSubrenderable = 0;

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep maskRenderable](self, "maskRenderable"));
    objc_msgSend(v5, "removeFromSuperlayer");

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep maskRenderable](self, "maskRenderable"));
    objc_msgSend(v6, "setDelegate:", 0);

    -[CRLImageRep setMaskRenderable:](self, "setMaskRenderable:", 0);
    p_frameMaskLayer = &self->_frameMaskLayer;
    WeakRetained = objc_loadWeakRetained((id *)p_frameMaskLayer);
    objc_msgSend(WeakRetained, "removeFromSuperlayer");

    objc_storeWeak((id *)p_frameMaskLayer, 0);
    +[CATransaction commit](CATransaction, "commit");
  }
}

- (void)p_createMaskRenderableForRenderable:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  double y;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep maskRenderable](self, "maskRenderable"));

  if (!v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[CRLCanvasShapeRenderable renderable](CRLCanvasShapeRenderable, "renderable"));
    -[CRLImageRep setMaskRenderable:](self, "setMaskRenderable:", v5);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep maskRenderable](self, "maskRenderable"));
    objc_msgSend(v6, "setDelegate:", self);

    y = CGPointZero.y;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep maskRenderable](self, "maskRenderable"));
    objc_msgSend(v8, "setAnchorPoint:", CGPointZero.x, y);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep maskRenderable](self, "maskRenderable"));
    objc_msgSend(v10, "setMaskRenderable:", v9);

  }
}

- (void)p_updateMaskSublayersForMaskEditMode
{
  void *v3;
  void *v4;
  CRLCanvasShapeRenderable *v5;
  CRLCanvasShapeRenderable *maskSubrenderable;
  void *v7;
  void *v8;
  CRLCanvasShapeRenderable *v9;
  CRLCanvasShapeRenderable *maskPathRenderable;
  void *v11;
  void *v12;
  id v13;

  +[CATransaction begin](CATransaction, "begin");
  +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "renderableForRep:", self));

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep maskRenderable](self, "maskRenderable"));
  if (!v4)
    -[CRLImageRep p_createMaskRenderableForRenderable:](self, "p_createMaskRenderableForRenderable:", v13);
  if (!self->_maskSubrenderable)
  {
    v5 = (CRLCanvasShapeRenderable *)objc_claimAutoreleasedReturnValue(+[CRLCanvasShapeRenderable renderable](CRLCanvasShapeRenderable, "renderable"));
    maskSubrenderable = self->_maskSubrenderable;
    self->_maskSubrenderable = v5;

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep maskRenderable](self, "maskRenderable"));
    objc_msgSend(v7, "addSubrenderable:", self->_maskSubrenderable);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CRLColor colorWithRed:green:blue:alpha:](CRLColor, "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 0.5));
  -[CRLCanvasRenderable setBackgroundColor:](self->_maskSubrenderable, "setBackgroundColor:", objc_msgSend(v8, "CGColor"));

  if (!self->_maskPathRenderable)
  {
    v9 = (CRLCanvasShapeRenderable *)objc_claimAutoreleasedReturnValue(+[CRLCanvasShapeRenderable renderable](CRLCanvasShapeRenderable, "renderable"));
    maskPathRenderable = self->_maskPathRenderable;
    self->_maskPathRenderable = v9;

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[CRLColor blackColor](CRLColor, "blackColor"));
    -[CRLCanvasShapeRenderable setStrokeColor:](self->_maskPathRenderable, "setStrokeColor:", objc_msgSend(v11, "CGColor"));

    -[CRLCanvasShapeRenderable setFillColor:](self->_maskPathRenderable, "setFillColor:", 0);
    -[CRLCanvasShapeRenderable setLineWidth:](self->_maskPathRenderable, "setLineWidth:", 1.0);
    -[CRLCanvasShapeRenderable setLineDashPattern:](self->_maskPathRenderable, "setLineDashPattern:", &off_1012CB890);
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep maskRenderable](self, "maskRenderable"));
  objc_msgSend(v12, "setPath:", 0);

  +[CATransaction commit](CATransaction, "commit");
}

- (BOOL)p_okayToGenerateSizedImage
{
  return !-[CRLCanvasRep isBeingResized](self, "isBeingResized");
}

- (void)p_generateSizedImageIfNecessary
{
  if (-[CRLImageRep p_okayToGenerateSizedImage](self, "p_okayToGenerateSizedImage"))
    -[CRLImageRepDrawingHelper generateSizedImageIfNeeded](self->_drawingHelper, "generateSizedImageIfNeeded");
}

+ (CGPath)p_newPathToBakeIntoSizedImageForSize:(CGSize)a3 withImageLayout:(id)a4 orientation:(int64_t)a5
{
  double height;
  double width;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGPath *v17;
  double v18;
  double v19;
  const CGPath *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  CGAffineTransform v25;
  CGAffineTransform v26;
  CGAffineTransform v27;
  CGAffineTransform v28;
  CGAffineTransform v29;
  CGAffineTransform t1;
  CGAffineTransform t2;
  CGAffineTransform v32;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "maskLayout"));
  v23 = *(_OWORD *)&CGAffineTransformIdentity.c;
  v24 = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&v32.a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&v32.c = v23;
  v22 = *(_OWORD *)&CGAffineTransformIdentity.tx;
  *(_OWORD *)&v32.tx = v22;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "imageGeometry"));
  objc_msgSend(v9, "size");
  v11 = v10;

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "imageGeometry"));
  objc_msgSend(v12, "size");
  v14 = v13;

  if (v8)
  {
    objc_msgSend(v8, "pathBounds");
    CGAffineTransformMakeTranslation(&t2, -v15, -v16);
    *(_OWORD *)&t1.a = v24;
    *(_OWORD *)&t1.c = v23;
    *(_OWORD *)&t1.tx = v22;
    CGAffineTransformConcat(&v32, &t1, &t2);
    if (v7)
      objc_msgSend(v7, "layoutToMaskTransform");
    else
      memset(&v29, 0, sizeof(v29));
    v18 = width / v11;
    v28 = v32;
    v19 = height / v14;
    CGAffineTransformConcat(&t1, &v28, &v29);
    v32 = t1;
    if (v7)
      objc_msgSend(v7, "layoutToImageTransform");
    else
      memset(&v26, 0, sizeof(v26));
    CGAffineTransformInvert(&v27, &v26);
    v28 = v32;
    CGAffineTransformConcat(&t1, &v28, &v27);
    v32 = t1;
    CGAffineTransformMakeScale(&v25, v18, v19);
    v28 = v32;
    CGAffineTransformConcat(&t1, &v28, &v25);
    v32 = t1;
    v20 = (const CGPath *)objc_msgSend(v8, "path");
    t1 = v32;
    v17 = sub_1000C8414(v20, &t1);
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (void)p_injectSizedImageIntoLayerContentsIfReady
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  id v9;

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101250AA8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E1EE8C();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101250AC8);
    v3 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageRep p_injectSizedImageIntoLayerContentsIfReady]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageRep.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 2602, 0, "This operation must only be performed on the main thread.");

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "canvasController"));

  if (v7)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10030BF10;
    v8[3] = &unk_101250B70;
    v8[4] = self;
    v9 = v7;
    objc_msgSend(v9, "updateRenderableForRep:usingBlock:", self, v8);

  }
}

- (BOOL)p_shouldBakeMaskIntoSizedImage
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  BOOL v22;
  void *v23;
  void *v24;
  unsigned int v25;
  void *v26;
  void *v27;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep p_validatedImageProvider](self, "p_validatedImageProvider"));
  objc_msgSend(v3, "naturalSize");
  v5 = v4;
  v7 = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self, "imageLayout"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "imageGeometry"));
  objc_msgSend(v9, "size");
  v11 = v10;
  v13 = v12;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
  objc_msgSend(v14, "viewScale");
  v16 = v15;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
  objc_msgSend(v17, "contentsScale");
  v19 = sub_1000603DC(v11, v13, v16 * v18);
  v21 = v20;

  v22 = v5 < v19 || v7 < v21;
  if (v22 || !-[CRLImageRep directlyManagesLayerContent](self, "directlyManagesLayerContent"))
  {
    LOBYTE(v25) = 0;
  }
  else
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep maskLayout](self, "maskLayout"));
    if (v23)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self, "imageLayout"));
      if ((objc_msgSend(v24, "isInMaskEditMode") & 1) != 0)
      {
        LOBYTE(v25) = 0;
      }
      else
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self, "imageLayout"));
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "maskLayout"));
        if ((objc_msgSend(v27, "hasSmartPath") & 1) != 0)
          LOBYTE(v25) = 0;
        else
          v25 = !-[CRLImageRep p_shouldRenderWithMaskToBounds](self, "p_shouldRenderWithMaskToBounds");

      }
    }
    else
    {
      LOBYTE(v25) = 0;
    }

  }
  return v25;
}

+ (BOOL)p_canRenderWithMaskToBoundsWithImageLayout:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;
  uint64_t v7;
  BOOL v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "maskLayout"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "pathSource"));
  v6 = objc_msgSend(v5, "isRectangular");

  if ((v6 & 1) != 0)
  {
    v8 = 1;
  }
  else
  {
    *(_QWORD *)&v9 = objc_opt_class(CRLScalarPathSource, v7).n128_u64[0];
    v11 = v10;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "maskLayout", v9));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "pathSource"));
    v14 = sub_100221D0C(v11, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

    if (v15)
      v8 = objc_msgSend(v15, "type") == 0;
    else
      v8 = 0;

  }
  return v8;
}

- (BOOL)p_shouldRenderWithMaskToBounds
{
  void *v3;
  BOOL v4;
  void *v5;

  if (!-[CRLImageRep directlyManagesLayerContent](self, "directlyManagesLayerContent"))
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self, "imageLayout"));
  if ((objc_msgSend(v3, "isInMaskEditMode") & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self, "imageLayout"));
    v4 = +[CRLImageRep p_canRenderWithMaskToBoundsWithImageLayout:](CRLImageRep, "p_canRenderWithMaskToBoundsWithImageLayout:", v5);

  }
  return v4;
}

- (BOOL)p_shouldRenderWithMaskMatchingImage
{
  void *v3;
  unsigned __int8 v4;
  void *v5;

  if (!-[CRLImageRep directlyManagesLayerContent](self, "directlyManagesLayerContent"))
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self, "imageLayout"));
  if ((objc_msgSend(v3, "isInMaskEditMode") & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageInfo](self, "imageInfo"));
    v4 = objc_msgSend(v5, "maskMatchesImageGeometryWithIgnoreRoundedCorners:", 1);

  }
  return v4;
}

- (BOOL)canRemoveBackgroundFromImage
{
  os_unfair_lock_s *p_backgroundRemovalLock;
  int64_t autoBackgroundRemovalState;
  int64_t userInitiatedBackgroundRemovalState;

  p_backgroundRemovalLock = &self->_backgroundRemovalLock;
  os_unfair_lock_lock(&self->_backgroundRemovalLock);
  autoBackgroundRemovalState = self->_autoBackgroundRemovalState;
  userInitiatedBackgroundRemovalState = self->_userInitiatedBackgroundRemovalState;
  os_unfair_lock_unlock(p_backgroundRemovalLock);
  return autoBackgroundRemovalState != 2 && userInitiatedBackgroundRemovalState != 1;
}

- (void)removeBackgroundFromImage
{
  -[CRLImageRep p_removeBackgroundFromImageInitiatedByUser:](self, "p_removeBackgroundFromImageInitiatedByUser:", 1);
}

- (void)p_removeBackgroundFromImageInitiatedByUser:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int64_t imageForRemoveBackgroundAssetDataHash;
  void *v12;
  id v13;
  int64_t *p_userInitiatedBackgroundRemovalState;
  CRLRemoveImageBackgroundData *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  int *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  CGImageRef v25;
  dispatch_queue_global_t global_queue;
  NSObject *v27;
  _QWORD block[4];
  id v29[3];
  BOOL v30;
  id location;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageInfo](self, "imageInfo"));
  v6 = objc_msgSend(v5, "isBackgroundRemoved");

  if (v6)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101250B90);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E1F00C();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101250BB0);
    v7 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageRep p_removeBackgroundFromImageInitiatedByUser:]"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageRep.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 2740, 0, "Background has already been removed from this image");

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep p_validatedImageProvider](self, "p_validatedImageProvider"));
  if ((objc_msgSend(v10, "isError") & 1) == 0)
  {
    if (v3)
      goto LABEL_13;
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
    v15 = (CRLRemoveImageBackgroundData *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "infosForCurrentSelectionPath"));

    if (-[CRLRemoveImageBackgroundData count](v15, "count") != (id)1)
      goto LABEL_32;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CRLRemoveImageBackgroundData anyObject](v15, "anyObject"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep info](self, "info"));

    if (v18 == v19)
    {
LABEL_13:
      os_unfair_lock_lock(&self->_backgroundRemovalLock);
      imageForRemoveBackgroundAssetDataHash = self->_imageForRemoveBackgroundAssetDataHash;
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "imageData"));
      v13 = objc_msgSend(v12, "crl_hash");

      if ((id)imageForRemoveBackgroundAssetDataHash != v13)
      {
        -[CRLRemoveImageBackgroundData setImage:](self->_cachedRemoveImageBackgroundData, "setImage:", 0);
        -[CRLRemoveImageBackgroundData setOffset:](self->_cachedRemoveImageBackgroundData, "setOffset:", CGPointZero.x, CGPointZero.y);
        -[CRLRemoveImageBackgroundData setError:](self->_cachedRemoveImageBackgroundData, "setError:", 0);
      }
      if (v3
        && (p_userInitiatedBackgroundRemovalState = &self->_userInitiatedBackgroundRemovalState,
            self->_userInitiatedBackgroundRemovalState != 1)
        || (p_userInitiatedBackgroundRemovalState = &self->_autoBackgroundRemovalState,
            self->_autoBackgroundRemovalState != 1))
      {
        *p_userInitiatedBackgroundRemovalState = 0;
      }
      v15 = self->_cachedRemoveImageBackgroundData;
      v16 = (id)self->_imageForRemoveBackgroundAssetDataHash;
      os_unfair_lock_unlock(&self->_backgroundRemovalLock);
      if (v3)
      {
        if (-[CRLRemoveImageBackgroundData image](v15, "image"))
        {
          -[CRLImageRep p_calcNewImageGeometryAndReplaceImageWithRemoveImageBackgroundData:dismissMiniFormatter:](self, "p_calcNewImageGeometryAndReplaceImageWithRemoveImageBackgroundData:dismissMiniFormatter:", v15, 1);
LABEL_32:

          goto LABEL_33;
        }
        v20 = &OBJC_IVAR___CRLImageRep__userInitiatedBackgroundRemovalState;
      }
      else
      {
        v20 = &OBJC_IVAR___CRLImageRep__autoBackgroundRemovalState;
      }
      os_unfair_lock_lock(&self->_backgroundRemovalLock);
      v21 = *v20;
      v22 = *(uint64_t *)((char *)&self->super.super.super.super.isa + v21);
      *(Class *)((char *)&self->super.super.super.super.isa + v21) = (Class)1;
      os_unfair_lock_unlock(&self->_backgroundRemovalLock);
      if (v22 != 1)
      {
        if (!-[CRLImageRep imageForRemoveBackground](self, "imageForRemoveBackground")
          || (v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "imageData")),
              v24 = objc_msgSend(v23, "crl_hash"),
              v23,
              v16 != v24))
        {
          self->_imageForRemoveBackground = -[CRLImageRep p_createImageForRemoveBackground](self, "p_createImageForRemoveBackground");
          os_unfair_lock_lock(&self->_backgroundRemovalLock);
          v16 = (id)self->_imageForRemoveBackgroundAssetDataHash;
          os_unfair_lock_unlock(&self->_backgroundRemovalLock);
        }
        v25 = CGImageRetain(-[CRLImageRep imageForRemoveBackground](self, "imageForRemoveBackground"));
        objc_initWeak(&location, self);
        global_queue = dispatch_get_global_queue(25, 0);
        v27 = objc_claimAutoreleasedReturnValue(global_queue);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10030CB54;
        block[3] = &unk_101250C40;
        v29[1] = v25;
        objc_copyWeak(v29, &location);
        v29[2] = v16;
        v30 = v3;
        dispatch_async(v27, block);

        objc_destroyWeak(v29);
        objc_destroyWeak(&location);
      }
      goto LABEL_32;
    }
  }
LABEL_33:

}

- (CGImage)p_createImageForRemoveBackground
{
  CGImage *imageForRemoveBackground;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  char v12;
  CGContext *v13;
  CGImage *Image;
  int v15;
  void *v16;
  void *v17;
  void *v18;

  imageForRemoveBackground = self->_imageForRemoveBackground;
  if (imageForRemoveBackground)
  {
    CFRelease(imageForRemoveBackground);
    self->_imageForRemoveBackground = 0;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep p_validatedImageProvider](self, "p_validatedImageProvider"));
  os_unfair_lock_lock(&self->_backgroundRemovalLock);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "imageData"));
  self->_imageForRemoveBackgroundAssetDataHash = (int64_t)objc_msgSend(v5, "hash");

  os_unfair_lock_unlock(&self->_backgroundRemovalLock);
  objc_msgSend(v4, "naturalSize");
  v8 = sub_100062E58(v6, v7, (double)-[CRLImageRep p_maxPixelAreaForBackgroundRemoval](self, "p_maxPixelAreaForBackgroundRemoval"));
  v9 = sub_100061064(v8);
  v11 = v10;
  if (objc_msgSend(v4, "imageGamut") == (id)2)
    v12 = 27;
  else
    v12 = 59;
  v13 = sub_10040FA64(v12, v9, v11);
  objc_msgSend(v4, "drawImageInContext:rect:", v13, sub_10005FDDC());
  Image = CGBitmapContextCreateImage(v13);
  CGContextRelease(v13);
  if (!Image)
  {
    v15 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101250C60);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E1F10C(v15);
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101250C80);
    v16 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageRep p_createImageForRemoveBackground]"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageRep.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v17, v18, 2883, 0, "expected inequality between %{public}s and %{public}s", "newRBImage", "NULL");

  }
  return Image;
}

- (unint64_t)p_maxPixelAreaForBackgroundRemoval
{
  unint64_t v2;
  double v3;

  if (CRLWPShapeLayout.columnsAreLeftToRight.getter())
  {
    v2 = sub_10040EA9C();
    v3 = VKCImageRemoveBackgroundMaxResolution;
    if (VKCImageRemoveBackgroundMaxResolution > (double)v2)
      return (unint64_t)(double)v2;
  }
  else
  {
    return (unint64_t)VKCImageRemoveBackgroundMaxResolution;
  }
  return (unint64_t)v3;
}

- (CGImage)imageForRemoveBackground
{
  return self->_imageForRemoveBackground;
}

- (void)p_replaceImageDataWithRemoveImageBackgroundData:(id)a3 rect:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v9;
  uint64_t v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  double v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  _TtC8Freeform27CRLPreinsertionAssetWrapper *v34;
  __CFData *v35;
  void *v36;
  _TtC8Freeform27CRLPreinsertionAssetWrapper *v37;
  _QWORD v38[7];
  id v39[5];
  id location;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3;
  if (!objc_msgSend(v9, "image"))
  {
    v11 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101250CA0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E1F27C();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101250CC0);
    v12 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E1F1C4(v12, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageRep p_replaceImageDataWithRemoveImageBackgroundData:rect:]"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageRep.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 2900, 0, "invalid nil value for '%{public}s'", "removeImageBackgroundData.image");

  }
  *(_QWORD *)&v15 = objc_opt_class(_TtC8Freeform12CRLImageItem, v10).n128_u64[0];
  v17 = v16;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep info](self, "info", v15));
  v19 = sub_100221D0C(v17, v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);

  *(_QWORD *)&v22 = objc_opt_class(CRLImageLayout, v21).n128_u64[0];
  v24 = v23;
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout", v22));
  v26 = sub_100221D0C(v24, v25);
  v27 = (void *)objc_claimAutoreleasedReturnValue(v26);

  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "imageAssetPayload"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "filename"));
  if (objc_msgSend(v29, "length"))
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "imageAssetPayload"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "filename"));

  }
  else
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBoardItemImporter defaultPastedImageName](CRLBoardItemImporter, "defaultPastedImageName"));
  }

  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "stringByDeletingPathExtension"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "stringByAppendingPathExtension:", CFSTR("png")));

  objc_initWeak(&location, self);
  v34 = [_TtC8Freeform27CRLPreinsertionAssetWrapper alloc];
  v35 = sub_100435130((CGImage *)objc_msgSend(v9, "image"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
  v37 = -[CRLPreinsertionAssetWrapper initWithData:filename:owner:error:](v34, "initWithData:filename:owner:error:", v36, v33, v20, 0);

  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_10030D664;
  v38[3] = &unk_101250D70;
  objc_copyWeak(v39, &location);
  v38[4] = v27;
  v38[5] = self;
  v38[6] = v20;
  v39[1] = *(id *)&x;
  v39[2] = *(id *)&y;
  v39[3] = *(id *)&width;
  v39[4] = *(id *)&height;
  -[CRLPreinsertionAssetWrapper createAssetWithCompletionHandler:](v37, "createAssetWithCompletionHandler:", v38);
  objc_destroyWeak(v39);

  objc_destroyWeak(&location);
}

- (void)p_enqueueCommandsToUpdateMagnetsForLineEnd:(unint64_t)a3 withClineLayout:(id)a4 withUnscaledPosition:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  double v19;
  __int128 v20;
  double v21;
  __int128 v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  CRLConnectionLineMagnet *v32;
  uint64_t v33;
  double v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  double v39;
  uint64_t v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  _TtC8Freeform37CRLCommandSetConnectionLineConnection *v47;
  void *v48;
  _TtC8Freeform37CRLCommandSetConnectionLineConnection *v49;
  __int128 v50;
  double v51;
  float64x2_t v52;
  CGAffineTransform v53;
  CGAffineTransform v54;

  v8 = a4;
  v9 = a5;
  *(_QWORD *)&v11 = objc_opt_class(CRLImageLayout, v10).n128_u64[0];
  v13 = v12;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout", v11));
  v15 = sub_100221D0C(v13, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

  if (a3 == 11)
    v17 = objc_msgSend(v8, "headMagnetType");
  else
    v17 = objc_msgSend(v8, "tailMagnetType");
  v18 = v17;
  objc_msgSend(v9, "CGPointValue");
  v50 = v20;
  v51 = v19;

  if (v18 == (id)6)
  {
    objc_msgSend(v16, "findNewEdgeMagnetCanvasPositionForConnectionLine:forLineEnd:withCanvasPosition:", v8, a3, v51, *(double *)&v50);
    v50 = v22;
    v51 = v21;
  }
  if (v16)
    objc_msgSend(v16, "pureTransformInRoot");
  else
    memset(&v53, 0, sizeof(v53));
  CGAffineTransformInvert(&v54, &v53);
  v52 = vaddq_f64(*(float64x2_t *)&v54.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v54.c, *(double *)&v50), *(float64x2_t *)&v54.a, v51));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "pureGeometry"));
  objc_msgSend(v23, "size");
  v24 = sub_10005FDDC();
  v27 = sub_1000626B8(v52.f64[0], v52.f64[1], v24, v25, v26);
  v29 = v28;

  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "connectionLineInfo"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "connectionLinePathSource"));

  v32 = -[CRLConnectionLineMagnet initWithType:normalizedPosition:]([CRLConnectionLineMagnet alloc], "initWithType:normalizedPosition:", v18, v27, v29);
  if (a3 == 11)
  {
    objc_msgSend(v31, "setHeadMagnet:", v32);

    *(_QWORD *)&v34 = objc_opt_class(_TtC8Freeform12CRLBoardItem, v33).n128_u64[0];
    v36 = v35;
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "connectedTo", v34));
  }
  else
  {
    objc_msgSend(v31, "setTailMagnet:", v32);

    *(_QWORD *)&v39 = objc_opt_class(_TtC8Freeform12CRLBoardItem, v38).n128_u64[0];
    v36 = v40;
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "connectedFrom", v39));
  }
  v41 = v37;
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "info", v50));
  v43 = sub_100221D0C(v36, v42);
  v44 = (void *)objc_claimAutoreleasedReturnValue(v43);

  v45 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "commandController"));
  v47 = [_TtC8Freeform37CRLCommandSetConnectionLineConnection alloc];
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "connectionLineInfo"));
  v49 = -[CRLCommandSetConnectionLineConnection initWithConnectionLine:connectedItem:chirality:pathSource:](v47, "initWithConnectionLine:connectedItem:chirality:pathSource:", v48, v44, a3 == 11, v31);
  objc_msgSend(v46, "enqueueCommand:", v49);

}

- (id)p_getMagnetUnscaledPositionValueForMagnet:(id)a3 withConnectedItem:(id)a4
{
  id v5;
  double v6;
  double v7;
  void *v8;
  float64x2_t v9;
  float64x2_t v10;
  float64x2_t v11;
  double v13;
  double v14;
  float64x2_t v15;
  float64x2_t v16;
  float64x2_t v17;
  float64x2_t v18;

  v5 = a4;
  objc_msgSend(a3, "magnetNormalizedPosition");
  v13 = v7;
  v14 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "pureGeometry"));

  if (v8)
  {
    objc_msgSend(v8, "fullTransform");
    v9 = v16;
    v10 = v17;
    v11 = v18;
  }
  else
  {
    v11 = 0uLL;
    v9 = 0uLL;
    v10 = 0uLL;
  }
  v15 = vaddq_f64(v11, vmlaq_n_f64(vmulq_n_f64(v10, v13), v9, v14));

  return (id)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", *(_OWORD *)&v15));
}

- (CGRect)p_calcNewImageItemRectWithRawSize:(CGSize)a3 offset:(CGPoint)a4
{
  double y;
  double x;
  double height;
  double width;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
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
  CGRect result;

  y = a4.y;
  x = a4.x;
  height = a3.height;
  width = a3.width;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep p_validatedImageProvider](self, "p_validatedImageProvider"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep info](self, "info"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "geometry"));

  if (v9 && !objc_msgSend(v9, "isError"))
  {
    v23 = width / (double)CGImageGetWidth(self->_imageForRemoveBackground);
    v24 = height / (double)CGImageGetHeight(self->_imageForRemoveBackground);
    objc_msgSend(v11, "size");
    v20 = v23 * v25;
    objc_msgSend(v11, "size");
    v22 = v24 * v26;
    objc_msgSend(v11, "size");
    v16 = x * v27;
    objc_msgSend(v11, "size");
    v18 = y * v28;
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101250D90);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E1F474();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101250DB0);
    v12 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageRep p_calcNewImageItemRectWithRawSize:offset:]"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageRep.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 3018, 0, "image provider for current image is invalid");

    objc_msgSend(v11, "boundsBeforeRotation");
    v16 = v15;
    objc_msgSend(v11, "boundsBeforeRotation");
    v18 = v17;
    objc_msgSend(v11, "size");
    v20 = v19;
    objc_msgSend(v11, "size");
    v22 = v21;
  }

  v29 = v16;
  v30 = v18;
  v31 = v20;
  v32 = v22;
  result.size.height = v32;
  result.size.width = v31;
  result.origin.y = v30;
  result.origin.x = v29;
  return result;
}

- (void)p_calcNewImageGeometryAndReplaceImageWithRemoveImageBackgroundData:(id)a3 dismissMiniFormatter:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  double Width;
  double Height;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;

  v4 = a4;
  v6 = a3;
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101250DD0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E1F4F4();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101250DF0);
    v7 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageRep p_calcNewImageGeometryAndReplaceImageWithRemoveImageBackgroundData:dismissMiniFormatter:]"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageRep.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 3031, 0, "This operation must only be performed on the main thread.");

  }
  Width = (double)CGImageGetWidth((CGImageRef)objc_msgSend(v6, "image"));
  Height = (double)CGImageGetHeight((CGImageRef)objc_msgSend(v6, "image"));
  objc_msgSend(v6, "offset");
  -[CRLImageRep p_calcNewImageItemRectWithRawSize:offset:](self, "p_calcNewImageItemRectWithRawSize:offset:", Width, Height, v12, v13);
  -[CRLImageRep p_replaceImageDataWithRemoveImageBackgroundData:rect:](self, "p_replaceImageDataWithRemoveImageBackgroundData:rect:", v6);

  if (v4)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "layerHost"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "miniFormatterPresenter"));
    objc_msgSend(v16, "dismissMiniFormatter");

  }
}

- (id)newTrackerForKnob:(id)a3
{
  id v4;
  CRLShapeControlKnobTracker *v5;
  CRLShapeControlKnobTracker *v6;
  objc_super v8;

  v4 = a3;
  if ((char *)objc_msgSend(v4, "tag") - 12 > (char *)4)
  {
    v8.receiver = self;
    v8.super_class = (Class)CRLImageRep;
    v5 = -[CRLCanvasRep newTrackerForKnob:](&v8, "newTrackerForKnob:", v4);
  }
  else
  {
    v5 = -[CRLShapeControlKnobTracker initWithRep:knob:]([CRLShapeControlKnobTracker alloc], "initWithRep:knob:", self, v4);
  }
  v6 = v5;

  return v6;
}

- (BOOL)shouldShowSmartMaskKnobs
{
  void *v3;
  void *v4;
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
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  unsigned int v19;
  void *v20;
  void *v21;
  BOOL v22;
  void *v23;
  void *v24;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep maskLayout](self, "maskLayout"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "maskInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageInfo](self, "imageInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "maskInfo"));

  if (v4 == v6)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep maskLayout](self, "maskLayout"));
    v19 = objc_msgSend(v18, "hasSmartPath");
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageInfo](self, "imageInfo"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "maskInfo"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "pathSource"));
    objc_opt_class(CRLPathSource, v10);
    v17 = sub_10022209C(v9, v11, 1, v12, v13, v14, v15, v16, (uint64_t)&OBJC_PROTOCOL___CRLSmartPathSource);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);

    v19 = v18 != 0;
  }

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageInfo](self, "imageInfo"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "maskInfo"));
  v22 = 0;
  if (v21 && v19)
  {
    if (-[CRLCanvasRep isSelected](self, "isSelected"))
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self, "imageLayout"));
      if (objc_msgSend(v23, "isInMaskEditMode"))
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self, "imageLayout"));
        v22 = objc_msgSend(v24, "maskEditMode") == (id)2;

      }
      else
      {
        v22 = 1;
      }

    }
    else
    {
      v22 = 0;
    }
  }

  return v22;
}

- (void)updatePositionsOfKnobs:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  void *v14;
  void *v15;
  float64x2_t v16;
  float64x2_t v17;
  float64x2_t v18;
  __int128 v19;
  __int128 v20;
  float64x2_t v21;
  float64x2_t v22;
  float64x2_t v23;
  float64x2_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  objc_super v29;
  _BYTE v30[128];

  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)CRLImageRep;
  -[CRLCanvasRep updatePositionsOfKnobs:](&v29, "updatePositionsOfKnobs:", v4);
  if (-[CRLImageRep shouldShowSmartMaskKnobs](self, "shouldShowSmartMaskKnobs"))
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v26 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);
          if ((unint64_t)objc_msgSend(v10, "tag", (_QWORD)v19) >= 0xC
            && (unint64_t)objc_msgSend(v10, "tag") <= 0x10)
          {
            v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep maskLayout](self, "maskLayout"));
            objc_msgSend(v11, "getControlKnobPosition:", objc_msgSend(v10, "tag"));
            v19 = v13;
            v20 = v12;

            v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self, "imageLayout"));
            v15 = v14;
            if (v14)
            {
              objc_msgSend(v14, "layoutToMaskTransform", v19, v20);
              v16 = v22;
              v17 = v23;
              v18 = v24;
            }
            else
            {
              v23 = 0u;
              v24 = 0u;
              v18 = 0uLL;
              v16 = 0uLL;
              v17 = 0uLL;
              v22 = 0u;
            }
            v21 = vaddq_f64(v18, vmlaq_n_f64(vmulq_n_f64(v17, *(double *)&v19), v16, *(double *)&v20));

            objc_msgSend(v10, "setPosition:", *(_OWORD *)&v21);
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      }
      while (v7);
    }

  }
}

- (id)newSelectionKnobForType:(unint64_t)a3 tag:(unint64_t)a4
{
  void *v7;
  id v8;
  objc_super v10;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self, "imageLayout"));
  v8 = objc_msgSend(v7, "maskEditMode");

  if (v8 == (id)2)
    return -[CRLCanvasKnob initWithType:position:radius:tag:onRep:]([CRLImageMaskKnob alloc], "initWithType:position:radius:tag:onRep:", a3, a4, self, CGPointZero.x, CGPointZero.y, 15.0);
  v10.receiver = self;
  v10.super_class = (Class)CRLImageRep;
  return -[CRLCanvasRep newSelectionKnobForType:tag:](&v10, "newSelectionKnobForType:tag:", a3, a4);
}

- (void)addKnobsToArray:(id)a3
{
  id v4;
  void *v5;
  char *v6;
  char *v7;
  char *i;
  void *v9;
  __int128 v10;
  __int128 v11;
  void *v12;
  void *v13;
  float64x2_t v14;
  float64x2_t v15;
  float64x2_t v16;
  CRLCanvasKnob *v17;
  __int128 v18;
  __int128 v19;
  float64x2_t v20;
  float64x2_t v21;
  float64x2_t v22;
  float64x2_t v23;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)CRLImageRep;
  -[CRLCanvasRep addKnobsToArray:](&v24, "addKnobsToArray:", v4);
  if (-[CRLImageRep shouldShowSmartMaskKnobs](self, "shouldShowSmartMaskKnobs"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep maskLayout](self, "maskLayout"));
    v6 = (char *)objc_msgSend(v5, "numberOfControlKnobs");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep maskLayout](self, "maskLayout", (_QWORD)v18));
        objc_msgSend(v9, "getControlKnobPosition:", i + 12);
        v18 = v11;
        v19 = v10;

        v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self, "imageLayout"));
        v13 = v12;
        if (v12)
        {
          objc_msgSend(v12, "layoutToMaskTransform", v18, v19);
          v14 = v21;
          v15 = v22;
          v16 = v23;
        }
        else
        {
          v22 = 0u;
          v23 = 0u;
          v16 = 0uLL;
          v14 = 0uLL;
          v15 = 0uLL;
          v21 = 0u;
        }
        v20 = vaddq_f64(v16, vmlaq_n_f64(vmulq_n_f64(v15, *(double *)&v18), v14, *(double *)&v19));

        v17 = -[CRLCanvasKnob initWithType:position:radius:tag:onRep:]([CRLCanvasKnob alloc], "initWithType:position:radius:tag:onRep:", 0, i + 12, self, *(_OWORD *)&v20, 15.0);
        objc_msgSend(v4, "addObject:", v17);

      }
    }

  }
}

- (double)additionalRotationForKnobOrientation
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  objc_super v11[3];
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CRLImageRep;
  -[CRLCanvasRep additionalRotationForKnobOrientation](&v12, "additionalRotationForKnobOrientation");
  v4 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self, "imageLayout"));
  if (!objc_msgSend(v5, "isInMaskEditMode"))
  {
LABEL_7:

    return v4;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self, "imageLayout"));
  v7 = objc_msgSend(v6, "maskEditMode");

  if (v7 == (id)3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self, "imageLayout"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "maskLayout"));
    v9 = v8;
    if (v8)
      objc_msgSend(v8, "transform");
    else
      memset(v11, 0, sizeof(v11));
    v4 = v4 - sub_1000791B0(v11);

    goto LABEL_7;
  }
  return v4;
}

- (id)cursorAtPoint:(CGPoint)a3 forKnob:(id)a4 withCursorPlatformObject:(id)a5
{
  double y;
  double x;
  id v9;
  id v10;
  void *v11;
  unsigned int v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
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
  id v33;
  objc_super v35;

  y = a3.y;
  x = a3.x;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self, "imageLayout"));
  v12 = objc_msgSend(v11, "isInMaskEditMode");

  if (v9)
    goto LABEL_4;
  if (!v12)
    goto LABEL_4;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self, "imageLayout"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "imageGeometryInRoot"));
  objc_msgSend(v14, "frame");
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  objc_msgSend(v23, "convertUnscaledToBoundsRect:", v16, v18, v20, v22);
  v25 = v24;
  v27 = v26;
  v29 = v28;
  v31 = v30;

  v32 = (void *)objc_claimAutoreleasedReturnValue(+[CRLCursor moveCursorWithActiveScaledRect:](CRLCursor, "moveCursorWithActiveScaledRect:", v25, v27, v29, v31));
  objc_msgSend(v32, "setConstrainedAxes:", 0);
  if (!v32)
  {
LABEL_4:
    v35.receiver = self;
    v35.super_class = (Class)CRLImageRep;
    v33 = -[CRLStyledRep cursorAtPoint:forKnob:withCursorPlatformObject:](&v35, "cursorAtPoint:forKnob:withCursorPlatformObject:", v9, v10, x, y);
    v32 = (void *)objc_claimAutoreleasedReturnValue(v33);
  }

  return v32;
}

- (void)p_invalidateHitTestCache
{
  -[NSMutableDictionary removeAllObjects](self->_hitTestCache, "removeAllObjects");
}

- (BOOL)p_hitCacheGetCachedValue:(BOOL *)a3 forPoint:(CGPoint)a4
{
  void *v6;
  void *v7;
  void *v8;

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", a4.x, a4.y));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_hitTestCache, "objectForKey:", v6));
  v8 = v7;
  if (v7)
    *a3 = objc_msgSend(v7, "BOOLValue");

  return v8 != 0;
}

- (void)p_hitCacheSetCachedValue:(BOOL)a3 forPoint:(CGPoint)a4
{
  double y;
  double x;
  NSMutableDictionary *hitTestCache;
  void *v7;
  id v8;

  y = a4.y;
  x = a4.x;
  hitTestCache = self->_hitTestCache;
  v8 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", a3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", x, y));
  -[NSMutableDictionary setObject:forKey:](hitTestCache, "setObject:forKey:", v8, v7);

}

- (int64_t)dragTypeAtCanvasPoint:(CGPoint)a3 forTouchType:(int64_t)a4
{
  double y;
  double x;
  void *v8;
  void *v9;
  objc_super *v10;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  _BOOL4 v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _BOOL4 v29;
  double v30;
  double point;
  CGPoint pointa;
  objc_super v33;
  CRLImageRep *v34;
  CGAffineTransform v35;
  CGAffineTransform v36;
  CGPoint v37;
  CGRect v38;
  CGRect v39;

  y = a3.y;
  x = a3.x;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self, "imageLayout"));
  if (!objc_msgSend(v8, "isInMaskEditMode"))
    goto LABEL_4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self, "imageLayout"));
  if (objc_msgSend(v9, "maskIntersectsImage"))
  {

LABEL_4:
LABEL_5:
    v33.receiver = self;
    v10 = &v33;
LABEL_6:
    v10->super_class = (Class)CRLImageRep;
    return (int64_t)-[objc_super dragTypeAtCanvasPoint:forTouchType:](v10, "dragTypeAtCanvasPoint:forTouchType:", a4, x, y);
  }
  -[CRLCanvasRep naturalBounds](self, "naturalBounds");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  -[CRLCanvasRep convertNaturalPointFromUnscaledCanvas:](self, "convertNaturalPointFromUnscaledCanvas:", x, y);
  v37.x = v20;
  v37.y = v21;
  v38.origin.x = v13;
  v38.origin.y = v15;
  v38.size.width = v17;
  v38.size.height = v19;
  v22 = CGRectContainsPoint(v38, v37);

  if (!v22)
    goto LABEL_5;
  -[CRLCanvasRep convertNaturalPointFromUnscaledCanvas:](self, "convertNaturalPointFromUnscaledCanvas:", x, y);
  v30 = v24;
  point = v23;
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self, "imageLayout"));
  v26 = v25;
  if (v25)
    objc_msgSend(v25, "layoutToImageTransform");
  else
    memset(&v35, 0, sizeof(v35));
  CGAffineTransformInvert(&v36, &v35);
  pointa = (CGPoint)vaddq_f64(*(float64x2_t *)&v36.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v36.c, v30), *(float64x2_t *)&v36.a, point));

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self, "imageLayout"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "imageGeometry"));
  objc_msgSend(v28, "size");
  v39.origin.x = sub_10005FDDC();
  v29 = CGRectContainsPoint(v39, pointa);

  if (v29)
  {
    v34 = self;
    v10 = (objc_super *)&v34;
    goto LABEL_6;
  }
  return 0;
}

- (BOOL)supportsAlternatePressureDrag
{
  void *v3;
  BOOL v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRep imageLayout](self, "imageLayout"));
  if ((objc_msgSend(v3, "isInMaskEditMode") & 1) != 0)
    v4 = 0;
  else
    v4 = -[CRLImageRep p_allowedToEditMask](self, "p_allowedToEditMask");

  return v4;
}

- (void)willEnterForeground
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CRLImageRep;
  -[CRLCanvasRep willEnterForeground](&v3, "willEnterForeground");
  if (-[CRLImageRep p_okayToGenerateSizedImage](self, "p_okayToGenerateSizedImage"))
    -[CRLImageRepDrawingHelper retryGeneratingSizedImageIfNeeded](self->_drawingHelper, "retryGeneratingSizedImageIfNeeded");
}

- (CRLCanvasShapeRenderable)maskRenderable
{
  return self->_maskRenderable;
}

- (void)setMaskRenderable:(id)a3
{
  objc_storeStrong((id *)&self->_maskRenderable, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maskRenderable, 0);
  objc_storeStrong((id *)&self->_cachedRemoveImageBackgroundData, 0);
  objc_storeStrong((id *)&self->_downloadObserverIdentifier, 0);
  objc_storeStrong((id *)&self->_updateFromLayoutBlocksLock, 0);
  objc_storeStrong((id *)&self->_updateFromLayoutBlocks, 0);
  objc_storeStrong((id *)&self->_disabledCanvasViewGRs, 0);
  objc_storeStrong((id *)&self->_hitTestCache, 0);
  objc_destroyWeak((id *)&self->_frameMaskLayer);
  objc_storeStrong((id *)&self->_strokeRenderable, 0);
  objc_storeStrong((id *)&self->_maskSubrenderable, 0);
  objc_storeStrong((id *)&self->_maskPathRenderable, 0);
  objc_storeStrong((id *)&self->_contentsRenderable, 0);
  objc_storeStrong((id *)&self->_directlyManagedLayerContentsRecipe, 0);
  objc_storeStrong((id *)&self->_drawingHelper, 0);
  objc_storeStrong((id *)&self->_lastMaskGeometryInRoot, 0);
  objc_storeStrong((id *)&self->_lastImageGeometryInRoot, 0);
}

- (BOOL)wantsToHandleDoubleTapsWhenLocked
{
  return 1;
}

- (void)enterPreviewMode
{
  CRLImageRep *v2;

  v2 = self;
  sub_100D46778();

}

@end
