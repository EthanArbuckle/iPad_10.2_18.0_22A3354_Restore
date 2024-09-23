@implementation CRLConnectionLineRep

- (id)connectionLineLayout
{
  double v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;

  *(_QWORD *)&v3 = objc_opt_class(CRLConnectionLineAbstractLayout, a2).n128_u64[0];
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout", v3));
  v7 = sub_100221D0C(v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  return v8;
}

- (BOOL)containsPoint:(CGPoint)a3 withPrecision:(BOOL)a4
{
  _BOOL8 v4;
  double y;
  double x;
  void *v8;
  BOOL v9;
  objc_super v11;

  v4 = a4;
  y = a3.y;
  x = a3.x;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineRep connectionLineLayout](self, "connectionLineLayout"));
  if ((objc_msgSend(v8, "isInvisible") & 1) != 0 || !objc_msgSend(v8, "validLine"))
  {
    v9 = 0;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)CRLConnectionLineRep;
    v9 = -[CRLShapeRep containsPoint:withPrecision:](&v11, "containsPoint:withPrecision:", v4, x, y);
  }

  return v9;
}

- (double)shortestDistanceToPoint:(CGPoint)a3 countAsHit:(BOOL *)a4
{
  double y;
  double x;
  void *v8;
  double v9;
  double v10;
  objc_super v12;

  y = a3.y;
  x = a3.x;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineRep connectionLineLayout](self, "connectionLineLayout"));
  v9 = 3.40282347e38;
  if ((objc_msgSend(v8, "isInvisible") & 1) == 0 && objc_msgSend(v8, "validLine"))
  {
    v12.receiver = self;
    v12.super_class = (Class)CRLConnectionLineRep;
    -[CRLShapeRep shortestDistanceToPoint:countAsHit:](&v12, "shortestDistanceToPoint:countAsHit:", a4, x, y);
    v9 = v10;
  }

  return v9;
}

- (void)updateFromLayout
{
  void *v3;
  void *v4;
  CRLPathSource *v5;
  CRLPathSource *mLastPathSource;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CRLConnectionLineRep;
  -[CRLCanvasRep updateFromLayout](&v7, "updateFromLayout");
  if (!-[CRLCanvasRep isBeingDragged](self, "isBeingDragged")
    && !-[CRLCanvasRep isBeingRotated](self, "isBeingRotated")
    && !-[CRLCanvasRep isBeingFreeTransformed](self, "isBeingFreeTransformed"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeRep shapeLayout](self, "shapeLayout"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "pathSource"));

    if ((objc_msgSend(v4, "isEqual:", self->mLastPathSource) & 1) == 0)
    {
      -[CRLShapeRep layoutInRootChangedFrom:to:translatedOnly:](self, "layoutInRootChangedFrom:to:translatedOnly:", 0, 0, 0);
      v5 = (CRLPathSource *)objc_msgSend(v4, "copy");
      mLastPathSource = self->mLastPathSource;
      self->mLastPathSource = v5;

    }
  }
}

- (BOOL)shouldSetPathSourceWhenChangingInfoGeometry
{
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
  if (objc_msgSend(v4, "isInTopLevelContainerForEditing"))
  {
    if (objc_msgSend(v3, "displaysMultiselectionWithSingleBounds"))
      v5 = objc_msgSend(v3, "shouldSuppressSelectionKnobsForRep:", self);
    else
      v5 = 0;
  }
  else
  {
    v5 = 1;
  }

  return v5;
}

+ (id)infosToConnectFromSelectionPath:(id)a3 withInteractiveCanvasController:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void **v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *, _BYTE *);
  void *v18;
  id v19;
  id v20;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "selectionModelTranslator"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "boardItemsForSelectionPath:", v6));

  v15 = _NSConcreteStackBlock;
  v16 = 3221225472;
  v17 = sub_100223558;
  v18 = &unk_101246678;
  v10 = v5;
  v19 = v10;
  v11 = v7;
  v20 = v11;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", &v15);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray array](NSArray, "array", v15, v16, v17, v18));
  if (objc_msgSend(v11, "count") == (id)2
    && (objc_msgSend(v10, "hasSelectedInfosInMultipleContainers") & 1) == 0)
  {
    v13 = v11;

    v12 = v13;
  }

  return v12;
}

+ (BOOL)canConnectToRep:(id)a3
{
  void *v3;
  uint64_t v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  unsigned __int8 v11;
  unsigned __int8 v12;
  void *v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "repForSelecting"));
  *(_QWORD *)&v5 = objc_opt_class(CRLShapeLayout, v4).n128_u64[0];
  v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "layout", v5));
  v9 = sub_100221D0C(v7, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = objc_msgSend(v10, "pathIsLineSegment");

  if ((v11 & 1) != 0)
  {
    v12 = 0;
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "layout"));
    v12 = objc_msgSend(v13, "allowsConnections");

  }
  return v12;
}

- (BOOL)canConnectToRep:(id)a3
{
  CRLConnectionLineRep *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  BOOL v24;

  v4 = (CRLConnectionLineRep *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "repForSelecting"));
  if (v4 == self
    || !+[CRLConnectionLineRep canConnectToRep:](CRLConnectionLineRep, "canConnectToRep:", v4))
  {
    v24 = 0;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](v4, "layout"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "parent"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "parent"));

    if (v6 == v8)
    {
      v24 = 1;
    }
    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "freehandDrawingToolkit"));
      *(_QWORD *)&v12 = objc_opt_class(_TtC8Freeform27CRLFreehandDrawingShapeItem, v11).n128_u64[0];
      v14 = v13;
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep info](v4, "info", v12));
      v16 = sub_100221D0C(v14, v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue(v16);

      if (v17 && objc_msgSend(v10, "isLassoSelectionForMixedTypeEnabledInDrawingMode"))
      {
        v18 = sub_1000664C4(v17);
        v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "layoutForInfo:", v19));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "parent"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "parent"));
        v24 = v21 == v23;

      }
      else
      {
        v24 = 0;
      }

    }
  }

  return v24;
}

- (void)updateMagnetRenderables:(id)a3 withEmptyMagnets:(id)a4 withHighlightedMagnets:(id)a5 includeClippedPortions:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  NSMutableArray *v11;
  NSMutableArray *mMagnetRenderables;
  uint64_t v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  CRLConnectionLineRep *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  id v28;
  id v29;
  id v30;
  uint64_t v31;
  double height;
  void *v33;
  void *v34;
  CGPath *Mutable;
  double v36;
  double v37;
  void *v38;
  void *v39;
  double v40;
  id v41;
  id v42;
  id v43;
  uint64_t v44;
  void *v45;
  NSMutableArray *v46;
  void *v47;
  id v48;
  id v49;
  id v50;
  uint64_t v51;
  void *v52;
  NSMutableArray *v53;
  void *v54;
  id v55;
  id v56;
  void *v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  CGAffineTransform v66;
  CGAffineTransform v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  _BYTE v72[128];
  _BYTE v73[128];
  _BYTE v74[128];
  CGRect v75;

  v6 = a6;
  v56 = a3;
  v55 = a4;
  v10 = a5;
  v11 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  mMagnetRenderables = self->mMagnetRenderables;
  self->mMagnetRenderables = v11;

  *(_QWORD *)&v14 = objc_opt_class(CRLConnectionLineAbstractLayout, v13).n128_u64[0];
  v16 = v15;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout", v14));
  v18 = sub_100221D0C(v16, v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);

  if (v6)
  {
    if (objc_msgSend(v19, "drawClippedHeadPortion")
      && (v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "connectedTo")), v20, v20))
    {
      v21 = self;
      v22 = 11;
    }
    else
    {
      if (!objc_msgSend(v19, "drawClippedTailPortion"))
        goto LABEL_11;
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "connectedFrom"));

      if (!v23)
        goto LABEL_11;
      v21 = self;
      v22 = 10;
    }
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineRep p_createClippedPathRenderableForEnd:](v21, "p_createClippedPathRenderableForEnd:", v22));
    if (v24)
      -[NSMutableArray addObject:](self->mMagnetRenderables, "addObject:", v24);

  }
LABEL_11:
  v57 = v19;
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
  objc_msgSend(v25, "viewScale");
  v27 = v26;

  v70 = 0u;
  v71 = 0u;
  v68 = 0u;
  v69 = 0u;
  v28 = v10;
  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v68, v74, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v69;
    height = CGSizeZero.height;
    do
    {
      v33 = 0;
      do
      {
        if (*(_QWORD *)v69 != v31)
          objc_enumerationMutation(v28);
        v34 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * (_QWORD)v33);
        Mutable = CGPathCreateMutable();
        objc_msgSend(v34, "CGPointValue");
        v75.origin.x = sub_10005FD98(v36, v37, 13.125 / v27);
        CGPathAddEllipseInRect(Mutable, 0, v75);
        v38 = (void *)objc_claimAutoreleasedReturnValue(+[CRLCanvasShapeRenderable renderable](CRLCanvasShapeRenderable, "renderable"));
        objc_msgSend(v38, "setShadowPath:", Mutable);
        CGAffineTransformMakeScale(&v67, v27, v27);
        v66 = v67;
        objc_msgSend(v38, "setAffineTransform:", &v66);
        v39 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep defaultSelectionHighlightColor](self, "defaultSelectionHighlightColor"));
        objc_msgSend(v38, "setShadowColor:", objc_msgSend(v39, "CGColor"));

        objc_msgSend(v38, "setShadowOffset:", CGSizeZero.width, height);
        LODWORD(v40) = 1.0;
        objc_msgSend(v38, "setShadowOpacity:", v40);
        objc_msgSend(v38, "setShadowRadius:", 1.0);
        CGPathRelease(Mutable);
        -[NSMutableArray addObject:](self->mMagnetRenderables, "addObject:", v38);

        v33 = (char *)v33 + 1;
      }
      while (v30 != v33);
      v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v68, v74, 16);
    }
    while (v30);
  }

  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  v41 = v55;
  v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v62, v73, 16);
  if (v42)
  {
    v43 = v42;
    v44 = *(_QWORD *)v63;
    do
    {
      v45 = 0;
      do
      {
        if (*(_QWORD *)v63 != v44)
          objc_enumerationMutation(v41);
        v46 = self->mMagnetRenderables;
        objc_msgSend(*(id *)(*((_QWORD *)&v62 + 1) + 8 * (_QWORD)v45), "CGPointValue");
        v47 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineRep p_createRenderableForMagnet:connected:](self, "p_createRenderableForMagnet:connected:", 0));
        -[NSMutableArray addObject:](v46, "addObject:", v47);

        v45 = (char *)v45 + 1;
      }
      while (v43 != v45);
      v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v62, v73, 16);
    }
    while (v43);
  }

  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  v48 = v56;
  v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v58, v72, 16);
  if (v49)
  {
    v50 = v49;
    v51 = *(_QWORD *)v59;
    do
    {
      v52 = 0;
      do
      {
        if (*(_QWORD *)v59 != v51)
          objc_enumerationMutation(v48);
        v53 = self->mMagnetRenderables;
        objc_msgSend(*(id *)(*((_QWORD *)&v58 + 1) + 8 * (_QWORD)v52), "CGPointValue");
        v54 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineRep p_createRenderableForMagnet:connected:](self, "p_createRenderableForMagnet:connected:", 1));
        -[NSMutableArray addObject:](v53, "addObject:", v54);

        v52 = (char *)v52 + 1;
      }
      while (v50 != v52);
      v50 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v58, v72, 16);
    }
    while (v50);
  }

}

- (id)p_createClippedPathRenderableForEnd:(unint64_t)a3
{
  double v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  double v16;
  CGFloat v17;
  void *v18;
  CGFloat v19;
  void *v20;
  CGAffineTransform v22;
  CGAffineTransform v23;

  *(_QWORD *)&v5 = objc_opt_class(CRLConnectionLineAbstractLayout, a2).n128_u64[0];
  v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout", v5));
  v9 = sub_100221D0C(v7, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  if (a3 == 11)
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "getClippedHeadPortion"));
  else
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "getClippedTailPortion"));
  v12 = (void *)v11;
  if (v11)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[CRLCanvasShapeRenderable renderable](CRLCanvasShapeRenderable, "renderable"));
    objc_msgSend(v13, "setFillColor:", 0);
    LODWORD(v14) = 0.25;
    objc_msgSend(v13, "setOpacity:", v14);
    objc_msgSend(v13, "setPath:", objc_msgSend(objc_retainAutorelease(v12), "CGPath"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
    objc_msgSend(v15, "viewScale");
    v17 = v16;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
    objc_msgSend(v18, "viewScale");
    CGAffineTransformMakeScale(&v23, v17, v19);
    v22 = v23;
    objc_msgSend(v13, "setAffineTransform:", &v22);

    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stroke"));
    objc_msgSend(v20, "applyToShapeRenderable:withScale:", v13, 1.0);

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)p_createRenderableForMagnet:(CGPoint)a3 connected:(BOOL)a4
{
  const __CFString *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  __int128 v11;
  void *v12;
  double v13;
  CGFloat v14;
  void *v15;
  CGFloat v16;
  double v18;
  double x;
  CGAffineTransform v20;
  _OWORD v21[3];

  x = a3.x;
  if (a4)
    v5 = CFSTR("ios-canvas-diagram-connect");
  else
    v5 = CFSTR("ios-canvas-diagram-magnet");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[CRLImage imageNamed:](CRLImage, "imageNamed:", v5, *(_QWORD *)&a3.y, v6));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
  objc_msgSend(v8, "contentsScale");
  v9 = objc_msgSend(v7, "CGImageForContentsScale:");

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[CRLCanvasShapeRenderable renderable](CRLCanvasShapeRenderable, "renderable"));
  objc_msgSend(v10, "setContents:", v9);
  v11 = *(_OWORD *)&CGAffineTransformIdentity.c;
  v21[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
  v21[1] = v11;
  v21[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
  objc_msgSend(v10, "setAffineTransform:", v21);
  objc_msgSend(v7, "size");
  objc_msgSend(v10, "setBounds:", sub_10005FDDC());
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
  objc_msgSend(v12, "viewScale");
  v14 = v13;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
  objc_msgSend(v15, "viewScale");
  CGAffineTransformMakeScale(&v20, v14, v16);
  objc_msgSend(v10, "setPosition:", vaddq_f64(*(float64x2_t *)&v20.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v20.c, v18), *(float64x2_t *)&v20.a, x)));

  return v10;
}

- (id)newTrackerForKnob:(id)a3
{
  id v4;
  int v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  CRLConnectionLineKnobTracker *v10;
  CRLConnectionLineKnobTracker *v11;
  objc_super v13;

  v4 = a3;
  if (!v4)
  {
    v5 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101246698);
    v6 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E0F7F8(v5, v6);
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012466B8);
    v7 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE81F0(v7, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLConnectionLineRep newTrackerForKnob:]"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLConnectionLineRep.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 250, 0, "invalid nil value for '%{public}s'", "knob");

  }
  if (objc_msgSend(v4, "tag") == (id)28)
  {
    v13.receiver = self;
    v13.super_class = (Class)CRLConnectionLineRep;
    v10 = -[CRLShapeRep newTrackerForKnob:](&v13, "newTrackerForKnob:", v4);
  }
  else
  {
    v10 = -[CRLConnectionLineKnobTracker initWithRep:knob:]([CRLConnectionLineKnobTracker alloc], "initWithRep:knob:", self, v4);
  }
  v11 = v10;

  return v11;
}

- (BOOL)shouldShowSmartShapeKnobs
{
  void *v3;
  void *v4;
  id v5;
  unsigned int v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  float v16;
  unsigned int v17;
  void *v19;
  objc_super v20;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineRep connectionLineLayout](self, "connectionLineLayout"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "connectedPathSource"));
  v5 = objc_msgSend(v4, "type");

  v6 = -[CRLConnectionLineRep shouldCreateKnobs](self, "shouldCreateKnobs");
  if (v5 == (id)1 || !v6)
  {
    if (!v6)
      goto LABEL_9;
  }
  else
  {
    -[CRLCanvasRep boundsForStandardKnobs](self, "boundsForStandardKnobs");
    v8 = v7;
    v10 = v9;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
    objc_msgSend(v11, "viewScale");
    v13 = sub_1000603DC(v8, v10, v12);
    v15 = v14;

    v16 = v15 * v15 + v13 * v13;
    if (sqrtf(v16) < 60.0)
      goto LABEL_9;
  }
  if (!-[CRLCanvasRep isPlaceholder](self, "isPlaceholder"))
  {
    v20.receiver = self;
    v20.super_class = (Class)CRLConnectionLineRep;
    if ((-[CRLShapeRep enabledKnobMask](&v20, "enabledKnobMask") & 0x800) != 0
      && !-[CRLCanvasRep isLocked](self, "isLocked"))
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
      v17 = objc_msgSend(v19, "documentIsSharedReadOnly") ^ 1;

      goto LABEL_10;
    }
  }
LABEL_9:
  LOBYTE(v17) = 0;
LABEL_10:

  return v17;
}

- (BOOL)shouldCreateKnobs
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineRep connectionLineLayout](self, "connectionLineLayout"));
  if ((objc_msgSend(v2, "isInvisible") & 1) != 0)
    v3 = 0;
  else
    v3 = objc_msgSend(v2, "validLine");

  return v3;
}

- (unint64_t)enabledKnobMask
{
  unint64_t v3;
  objc_super v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CRLConnectionLineRep;
  v3 = -[CRLShapeRep enabledKnobMask](&v6, "enabledKnobMask");
  v5.receiver = self;
  v5.super_class = (Class)CRLConnectionLineRep;
  if (-[CRLCanvasRep shouldCreateKnobs](&v5, "shouldCreateKnobs"))
    return v3;
  else
    return v3 & 0xFFFFFFFFFFFFF3FFLL;
}

- (BOOL)shouldCreateSelectionKnobs
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)CRLConnectionLineRep;
  if (!-[CRLCanvasRep shouldCreateSelectionKnobs](&v19, "shouldCreateSelectionKnobs"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineRep connectionLineLayout](self, "connectionLineLayout"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "connectedPathSource"));
    v6 = objc_msgSend(v5, "type");

    if (v6 != (id)1)
    {
      LOBYTE(v3) = 0;
      return (char)v3;
    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineRep connectionLineLayout](self, "connectionLineLayout"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "connectedFrom"));

    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "connectedFrom"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "repForLayout:", v10));

      if ((objc_msgSend(v11, "shouldCreateKnobs") & 1) != 0)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "connectedFrom"));
        v13 = objc_msgSend(v12, "layoutState");

        if (v13 == 2)
        {
          LOBYTE(v3) = 1;
LABEL_15:

          return (char)v3;
        }
      }
      else
      {

      }
    }
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "connectedTo"));

    if (v3)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "connectedTo"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "repForLayout:", v15));

      if (objc_msgSend(v16, "shouldCreateKnobs"))
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "connectedTo"));
        LOBYTE(v3) = objc_msgSend(v17, "layoutState") == 2;

      }
      else
      {
        LOBYTE(v3) = 0;
      }

    }
    goto LABEL_15;
  }
  LOBYTE(v3) = 1;
  return (char)v3;
}

- (id)overlayRenderables
{
  id v3;
  void *v4;
  uint64_t v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  CGFloat v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  CGFloat tx;
  CGFloat ty;
  id v26;
  CGPathRef v27;
  void *v28;
  double v29;
  void *v30;
  CGAffineTransform v32;
  CGAffineTransform v33;
  CGAffineTransform t1;
  CGAffineTransform t2;
  CGAffineTransform v36;
  CGAffineTransform transform;
  objc_super v38;

  v38.receiver = self;
  v38.super_class = (Class)CRLConnectionLineRep;
  v3 = -[CRLShapeRep overlayRenderables](&v38, "overlayRenderables");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  *(_QWORD *)&v6 = objc_opt_class(CRLConnectionLineKnobTracker, v5).n128_u64[0];
  v8 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep currentKnobTracker](self, "currentKnobTracker", v6));
  v10 = sub_100221D0C(v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "connectedRepForHighlighting"));
  if (v12)
  {
    if (v4)
      v13 = v4;
    else
      v13 = &__NSArray0__struct;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[CRLCanvasShapeRenderable renderable](CRLCanvasShapeRenderable, "renderable"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "layout"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
    objc_msgSend(v16, "viewScale");
    v18 = v17;

    memset(&transform, 0, sizeof(transform));
    if (v15)
      objc_msgSend(v15, "transformInRoot");
    CGAffineTransformMakeScale(&t2, v18, v18);
    t1 = transform;
    CGAffineTransformConcat(&v36, &t1, &t2);
    transform = v36;
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "pathForClippingConnectionLines"));
    v20 = v19;
    if (!v19
      || (uint64_t)objc_msgSend(v19, "elementCount") < 2
      || (objc_opt_class(CRLGroupLayout, v21), (objc_opt_isKindOfClass(v15, v22) & 1) != 0))
    {
      objc_msgSend(v15, "boundsForStandardKnobs");
      v23 = objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPathWithRect:](CRLBezierPath, "bezierPathWithRect:"));

      v20 = (void *)v23;
    }
    tx = transform.tx;
    ty = transform.ty;
    transform.tx = 0.0;
    transform.ty = 0.0;
    v26 = objc_retainAutorelease(v20);
    v27 = CGPathCreateCopyByStrokingPath((CGPathRef)objc_msgSend(v26, "CGPath"), &transform, 3.0 / v18, kCGLineCapButt, kCGLineJoinBevel, 1.0);
    objc_msgSend(v14, "setShadowPath:", v27);
    CGAffineTransformMakeTranslation(&v33, tx, ty);
    v32 = v33;
    objc_msgSend(v14, "setAffineTransform:", &v32);
    CFRelease(v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep defaultSelectionHighlightColor](self, "defaultSelectionHighlightColor"));
    objc_msgSend(v14, "setShadowColor:", objc_msgSend(v28, "CGColor"));

    objc_msgSend(v14, "setShadowOffset:", CGSizeZero.width, CGSizeZero.height);
    LODWORD(v29) = 1.0;
    objc_msgSend(v14, "setShadowOpacity:", v29);
    objc_msgSend(v14, "setShadowRadius:", 1.0);
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "arrayByAddingObject:", v14));

  }
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "arrayByAddingObjectsFromArray:", self->mMagnetRenderables));

  return v30;
}

- (id)additionalRepsForDragging
{
  void *v3;
  id v4;
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

  if (-[CRLConnectionLineRep p_isConnected](self, "p_isConnected"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineRep connectionLineLayout](self, "connectionLineLayout"));
    v4 = objc_alloc_init((Class)NSMutableSet);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "connectedFrom"));

    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "connectedFrom"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "repForLayout:", v7));

      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "additionalRepsForDraggingConnectionLine:", self));
      objc_msgSend(v4, "unionSet:", v9);

    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "connectedTo"));

    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "connectedTo"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "repForLayout:", v12));

      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "additionalRepsForDraggingConnectionLine:", self));
      objc_msgSend(v4, "unionSet:", v14);

    }
  }
  else
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));
  }
  return v4;
}

- (BOOL)canMakePathEditable
{
  return 0;
}

- (CGRect)targetRectForEditMenu
{
  void *v3;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep knobForTag:](self, "knobForTag:", 12));
  x = CGRectNull.origin.x;
  y = CGRectNull.origin.y;
  width = CGRectNull.size.width;
  height = CGRectNull.size.height;
  if (-[CRLConnectionLineRep p_controlKnobVisible](self, "p_controlKnobVisible")
    && !-[CRLConnectionLineRep i_editMenuOverlapsEndKnobs](self, "i_editMenuOverlapsEndKnobs"))
  {
    objc_msgSend(v3, "position");
    x = sub_10005FD98(v8, v9, 2.0);
    y = v10;
    width = v11;
    height = v12;
  }

  v13 = x;
  v14 = y;
  v15 = width;
  v16 = height;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (BOOL)canUseSpecializedHitRegionForKnob:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  if (objc_msgSend(v4, "tag") == (id)12)
  {
    v5 = 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)CRLConnectionLineRep;
    v5 = -[CRLShapeRep canUseSpecializedHitRegionForKnob:](&v7, "canUseSpecializedHitRegionForKnob:", v4);
  }

  return v5;
}

- (BOOL)directlyManagesLayerContent
{
  return 0;
}

- (BOOL)canBeUsedForImageMask
{
  return 0;
}

- (CGPoint)i_dragOffset
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  objc_super v13;
  CGPoint result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineRep connectionLineLayout](self, "connectionLineLayout"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "connectedTo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "connectedFrom"));
  v6 = (v4 != 0) ^ (v5 == 0);

  if ((v6 & 1) != 0)
  {
    v13.receiver = self;
    v13.super_class = (Class)CRLConnectionLineRep;
    -[CRLCanvasRep i_dragOffset](&v13, "i_dragOffset");
  }
  else
  {
    if (objc_msgSend(v3, "isBeingTransformed"))
      objc_msgSend(v3, "pauseDynamicTransformation");
    objc_msgSend(v3, "i_accumulatedDrag");
  }
  v9 = v7;
  v10 = v8;

  v11 = v9;
  v12 = v10;
  result.y = v12;
  result.x = v11;
  return result;
}

- (BOOL)i_editMenuOverlapsEndKnobs
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  void *v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  void *v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  BOOL v30;
  CGPoint v32;
  CGPoint v33;
  CGRect v34;
  CGRect v35;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep knobForTag:](self, "knobForTag:", 12));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep knobForTag:](self, "knobForTag:", 11));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep knobForTag:](self, "knobForTag:", 10));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
  objc_msgSend(v3, "position");
  -[CRLCanvasRep convertNaturalPointToUnscaledCanvas:](self, "convertNaturalPointToUnscaledCanvas:");
  objc_msgSend(v6, "convertUnscaledToBoundsPoint:");
  v8 = v7;
  v10 = v9;

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
  objc_msgSend(v4, "position");
  -[CRLCanvasRep convertNaturalPointToUnscaledCanvas:](self, "convertNaturalPointToUnscaledCanvas:");
  objc_msgSend(v11, "convertUnscaledToBoundsPoint:");
  v13 = v12;
  v15 = v14;

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
  objc_msgSend(v5, "position");
  -[CRLCanvasRep convertNaturalPointToUnscaledCanvas:](self, "convertNaturalPointToUnscaledCanvas:");
  objc_msgSend(v16, "convertUnscaledToBoundsPoint:");
  v18 = v17;
  v20 = v19;

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
  objc_msgSend(v21, "i_approximateScaledFrameOfEditingMenuAtPoint:", v8, v10);
  v23 = v22;
  v25 = v24;
  v27 = v26;
  v29 = v28;

  v34.origin.x = v23;
  v34.origin.y = v25;
  v34.size.width = v27;
  v34.size.height = v29;
  v32.x = v13;
  v32.y = v15;
  if (CGRectContainsPoint(v34, v32))
  {
    v30 = 1;
  }
  else
  {
    v35.origin.x = v23;
    v35.origin.y = v25;
    v35.size.width = v27;
    v35.size.height = v29;
    v33.x = v18;
    v33.y = v20;
    v30 = CGRectContainsPoint(v35, v33);
  }

  return v30;
}

- (BOOL)i_targetsDropsToStroke
{
  return 1;
}

- (BOOL)p_isConnected
{
  void *v2;
  void *v3;
  BOOL v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineRep connectionLineLayout](self, "connectionLineLayout"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "connectedFrom"));
  if (v3)
  {
    v4 = 1;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "connectedTo"));
    v4 = v5 != 0;

  }
  return v4;
}

- (BOOL)p_controlKnobVisible
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  void *v10;
  CGPoint v12;
  CGRect v13;

  v3 = -[CRLConnectionLineRep shouldShowSmartShapeKnobs](self, "shouldShowSmartShapeKnobs");
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep knobForTag:](self, "knobForTag:", 12));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
    objc_msgSend(v4, "position");
    -[CRLCanvasRep convertNaturalPointToUnscaledCanvas:](self, "convertNaturalPointToUnscaledCanvas:");
    objc_msgSend(v5, "convertUnscaledToBoundsPoint:");
    v7 = v6;
    v9 = v8;

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
    objc_msgSend(v10, "visibleBoundsRect");
    v12.x = v7;
    v12.y = v9;
    LOBYTE(v5) = CGRectContainsPoint(v13, v12);

    LOBYTE(v3) = (_BYTE)v5;
  }
  return v3;
}

- (BOOL)crlaxIsStraightLine
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineRep connectionLineLayout](self, "connectionLineLayout"));
  v3 = objc_msgSend(v2, "isStraightLine");

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mMagnetRenderables, 0);
  objc_storeStrong((id *)&self->mLastPathSource, 0);
}

@end
