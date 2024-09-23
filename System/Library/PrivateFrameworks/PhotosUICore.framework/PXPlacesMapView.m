@implementation PXPlacesMapView

- (PXPlacesMapView)initWithFrame:(CGRect)a3
{
  PXPlacesMapView *v3;
  PXPlacesMapView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXPlacesMapView;
  v3 = -[PXPlacesMapView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[PXPlacesMapView _commonInit](v3, "_commonInit");
  return v4;
}

- (PXPlacesMapView)initWithCoder:(id)a3
{
  PXPlacesMapView *v3;
  PXPlacesMapView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXPlacesMapView;
  v3 = -[PXPlacesMapView initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[PXPlacesMapView _commonInit](v3, "_commonInit");
  return v4;
}

- (void)awakeFromNib
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXPlacesMapView;
  -[PXPlacesMapView awakeFromNib](&v3, sel_awakeFromNib);
  -[PXPlacesMapView _commonInit](self, "_commonInit");
}

- (void)_commonInit
{
  id v3;
  PXObservable *v4;
  PXObservable *observable;
  objc_super v6;

  -[PXPlacesMapView setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 1);
  v3 = objc_alloc_init(MEMORY[0x1E0CC1960]);
  -[PXPlacesMapView setPreferredConfiguration:](self, "setPreferredConfiguration:", v3);

  v6.receiver = self;
  v6.super_class = (Class)PXPlacesMapView;
  -[PXPlacesMapView setDelegate:](&v6, sel_setDelegate_, self);
  v4 = (PXObservable *)objc_alloc_init((Class)off_1E50B3768);
  observable = self->_observable;
  self->_observable = v4;

}

- (void)setPreferredConfiguration:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[5];
  objc_super v8;

  v4 = a3;
  -[PXPlacesMapView preferredConfiguration](self, "preferredConfiguration");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v8.receiver = self;
  v8.super_class = (Class)PXPlacesMapView;
  -[PXPlacesMapView setPreferredConfiguration:](&v8, sel_setPreferredConfiguration_, v4);

  if (v5 != v4)
  {
    -[PXPlacesMapView observable](self, "observable");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __45__PXPlacesMapView_setPreferredConfiguration___block_invoke;
    v7[3] = &unk_1E51479C8;
    v7[4] = self;
    objc_msgSend(v6, "performChanges:", v7);

  }
}

- (double)pitch
{
  void *v2;
  double v3;
  double v4;

  -[PXPlacesMapView camera](self, "camera");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pitch");
  v4 = v3;

  return v4;
}

- (void)setPitch:(double)a3
{
  void *v5;
  id v6;

  -[PXPlacesMapView camera](self, "camera");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "copy");

  objc_msgSend(v6, "setPitch:", a3);
  -[PXPlacesMapView setCamera:animated:](self, "setCamera:animated:", v6, 1);

}

- (void)setPanningGestureMinimumNumberOfTouches:(int64_t)a3
{
  id v4;

  -[PXPlacesMapView _panningGestureRecognizer](self, "_panningGestureRecognizer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMinimumNumberOfTouches:", a3);

}

- (int64_t)panningGestureMinimumNumberOfTouches
{
  void *v2;
  int64_t v3;

  -[PXPlacesMapView _panningGestureRecognizer](self, "_panningGestureRecognizer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "minimumNumberOfTouches");

  return v3;
}

- (void)setDelegate:(id)a3
{
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPlacesMapView.m"), 97, CFSTR("Do not set this delegate. Use mapViewDelegate instead."));

}

- (id)currentViewPort
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  PXPlacesMapViewPort *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  PXPlacesMapViewPort *v23;
  CGFloat v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  double v29;
  double v30;
  double v31;
  long double v32;
  double currentScale;
  double v34;
  double v35;
  CGAffineTransform v37;
  CGAffineTransform t1;
  CGAffineTransform v39;
  CGAffineTransform v40;
  CGAffineTransform v41;
  CGAffineTransform v42;

  -[PXPlacesMapView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  -[PXPlacesMapView camera](self, "camera");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "heading");
  v9 = v8;

  -[PXPlacesMapView camera](self, "camera");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "pitch");
  v12 = v11;

  v13 = [PXPlacesMapViewPort alloc];
  -[PXPlacesMapView visibleMapRect](self, "visibleMapRect");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  -[PXPlacesMapView _px_zoomLevel](self, "_px_zoomLevel");
  v23 = -[PXPlacesMapViewPort initWithMapRect:andViewSize:zoomLevel:pitch:](v13, "initWithMapRect:andViewSize:zoomLevel:pitch:", v15, v17, v19, v21, v4, v6, v22, v12);
  if (v9 == 0.0)
  {
    v29 = -1.0;
  }
  else
  {
    v24 = v4 * 0.5 + -5.0 + 5.0;
    v25 = v6 * 0.5 + -5.0 + 5.0;
    -[PXPlacesMapView _radiansFromDegrees:](self, "_radiansFromDegrees:", v9);
    v27 = v26;
    memset(&v42, 0, sizeof(v42));
    CGAffineTransformMakeTranslation(&v42, v24, v25);
    memset(&v41, 0, sizeof(v41));
    CGAffineTransformMakeRotation(&v41, v27);
    memset(&v40, 0, sizeof(v40));
    v37 = v42;
    CGAffineTransformInvert(&t1, &v37);
    v37 = v41;
    CGAffineTransformConcat(&v39, &t1, &v37);
    v37 = v42;
    CGAffineTransformConcat(&v40, &v39, &v37);
    -[PXPlacesMapView _sampleMapDistanceFromViewPoint:toViewPoint:](self, "_sampleMapDistanceFromViewPoint:toViewPoint:", v40.tx + (v25 + -5.0) * v40.c + v40.a * (v24 + -5.0), v40.ty + (v25 + -5.0) * v40.d + v40.b * (v24 + -5.0), v40.tx + (v25 + -5.0) * v40.c + v40.a * (v24 + 5.0), v40.ty + (v25 + -5.0) * v40.d + v40.b * (v24 + 5.0));
    v29 = v28;
  }
  if (v12 > 45.0)
  {
    -[PXPlacesMapView _sampleMapDistanceFromViewPoint:toViewPoint:](self, "_sampleMapDistanceFromViewPoint:toViewPoint:", v4 * 0.5, v6 * 0.5 + -5.0, v4 * 0.5, v6 * 0.5 + 5.0);
    v31 = v30;
    -[PXPlacesMapView _radiansFromDegrees:](self, "_radiansFromDegrees:", v12);
    v29 = v31 * cos(v32);
  }
  if (v29 != -1.0)
  {
    -[PXPlacesMapViewPort scale](v23, "scale");
    v34 = v29 / 10.0;
    if (v29 / 10.0 <= currentScale)
    {
      currentScale = self->_currentScale;
      if (v34 >= currentScale)
      {
        currentScale = v29 / 10.0;
      }
      else if (vabdd_f64(currentScale, v34) / currentScale * 100.0 < 80.0)
      {
        currentScale = v29 / 10.0;
      }
    }
    -[PXPlacesMapViewPort setScale:](v23, "setScale:", currentScale, v34);
  }
  -[PXPlacesMapViewPort scale](v23, "scale");
  self->_currentScale = v35;
  return v23;
}

- (id)currentViewPortWithThumbnailOverscan
{
  void *v3;
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

  -[PXPlacesMapView currentViewPort](self, "currentViewPort");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mapRect");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[PXPlacesMapView frame](self, "frame");
  v13 = v12 * 0.5;
  -[PXPlacesMapView frame](self, "frame");
  v15 = v14 * 0.5;
  objc_msgSend(v3, "scale");
  v17 = v16 * v13;
  objc_msgSend(v3, "scale");
  objc_msgSend(v3, "setMapRect:", v5 - v17, v7 - v18 * v15, v9 + v17 * 2.0, v11 + v18 * v15 * 2.0);
  return v3;
}

- (void)deselectAllAnnotationsAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  -[PXPlacesMapView selectedAnnotations](self, "selectedAnnotations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
        -[PXPlacesMapView viewForAnnotation:](self, "viewForAnnotation:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setSelected:animated:", 0, 0);

        -[PXPlacesMapView deselectAnnotation:animated:](self, "deselectAnnotation:animated:", v10, v3);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

}

- (double)_sampleMapDistanceFromViewPoint:(CGPoint)a3 toViewPoint:(CGPoint)a4
{
  double y;
  double x;
  MKMapPoint v7;
  MKMapPoint v8;
  CLLocationCoordinate2D v10;
  CLLocationCoordinate2D v11;

  y = a4.y;
  x = a4.x;
  -[PXPlacesMapView convertPoint:toCoordinateFromView:](self, "convertPoint:toCoordinateFromView:", self, a3.x, a3.y);
  v7 = MKMapPointForCoordinate(v10);
  -[PXPlacesMapView convertPoint:toCoordinateFromView:](self, "convertPoint:toCoordinateFromView:", self, x, y);
  v8 = MKMapPointForCoordinate(v11);
  return sqrt((v7.x - v8.x) * (v7.x - v8.x) + (v7.y - v8.y) * (v7.y - v8.y));
}

- (double)_radiansFromDegrees:(double)a3
{
  return a3 * 3.14159265 / 180.0;
}

- (double)_px_zoomLevel
{
  double v3;
  double v4;
  double v5;
  double result;

  -[PXPlacesMapView region](self, "region");
  v4 = v3;
  -[PXPlacesMapView bounds](self, "bounds");
  result = 20.0 - log2(v4 * 85445659.4 * 3.14159265 / (v5 * 180.0));
  if (result < 0.0)
    return 0.0;
  return result;
}

- (void)mapViewDidFinishLoadingMap:(id)a3
{
  void *v4;
  _QWORD v5[5];

  -[PXPlacesMapView observable](self, "observable", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __46__PXPlacesMapView_mapViewDidFinishLoadingMap___block_invoke;
  v5[3] = &unk_1E51479C8;
  v5[4] = self;
  objc_msgSend(v4, "performChanges:", v5);

}

- (id)mapView:(id)a3 viewForAnnotation:(id)a4
{
  id v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;

  v5 = a4;
  -[PXPlacesMapView mapViewDelegate](self, "mapViewDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[PXPlacesMapView mapViewDelegate](self, "mapViewDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "mapView:viewForAnnotation:", self, v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)mapView:(id)a3 regionDidChangeAnimated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  _QWORD v10[5];

  v4 = a4;
  -[PXPlacesMapView mapViewDelegate](self, "mapViewDelegate", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[PXPlacesMapView mapViewDelegate](self, "mapViewDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "mapView:regionDidChangeAnimated:", self, v4);

  }
  -[PXPlacesMapView observable](self, "observable");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __51__PXPlacesMapView_mapView_regionDidChangeAnimated___block_invoke;
  v10[3] = &unk_1E51479C8;
  v10[4] = self;
  objc_msgSend(v9, "performChanges:", v10);

}

- (void)mapView:(id)a3 didAddAnnotationViews:(id)a4
{
  void *v5;
  char v6;
  void *v7;
  id v8;

  v8 = a4;
  -[PXPlacesMapView mapViewDelegate](self, "mapViewDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[PXPlacesMapView mapViewDelegate](self, "mapViewDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "mapView:didAddAnnotationViews:", self, v8);

  }
}

- (void)mapView:(id)a3 didSelectAnnotationView:(id)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  -[PXPlacesMapView mapViewDelegate](self, "mapViewDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[PXPlacesMapView mapViewDelegate](self, "mapViewDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "mapView:didSelectAnnotationView:", v10, v6);

  }
}

- (id)mapView:(id)a3 rendererForOverlay:(id)a4
{
  id v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;

  v5 = a4;
  -[PXPlacesMapView mapViewDelegate](self, "mapViewDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[PXPlacesMapView mapViewDelegate](self, "mapViewDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "mapView:rendererForOverlay:", self, v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)mapViewDidFinishRenderingMap:(id)a3 fullyRendered:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  char v7;
  id v8;

  v4 = a4;
  -[PXPlacesMapView mapViewDelegate](self, "mapViewDelegate", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[PXPlacesMapView mapViewDelegate](self, "mapViewDelegate");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "mapViewDidFinishRenderingMap:fullyRendered:", self, v4);

  }
}

- (void)mapViewWillStartLocatingUser:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  _QWORD v9[5];

  v4 = a3;
  -[PXPlacesMapView mapViewDelegate](self, "mapViewDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[PXPlacesMapView mapViewDelegate](self, "mapViewDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "mapViewWillStartLocatingUser:", v4);

  }
  -[PXPlacesMapView observable](self, "observable");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __48__PXPlacesMapView_mapViewWillStartLocatingUser___block_invoke;
  v9[3] = &unk_1E51479C8;
  v9[4] = self;
  objc_msgSend(v8, "performChanges:", v9);

}

- (void)mapView:(id)a3 didBecomePitched:(BOOL)a4
{
  void *v5;
  _QWORD v6[5];

  -[PXPlacesMapView observable](self, "observable", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __44__PXPlacesMapView_mapView_didBecomePitched___block_invoke;
  v6[3] = &unk_1E51479C8;
  v6[4] = self;
  objc_msgSend(v5, "performChanges:", v6);

}

- (void)mapView:(id)a3 canEnter3DModeDidChange:(BOOL)a4
{
  void *v5;
  _QWORD v6[5];

  -[PXPlacesMapView observable](self, "observable", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __51__PXPlacesMapView_mapView_canEnter3DModeDidChange___block_invoke;
  v6[3] = &unk_1E51479C8;
  v6[4] = self;
  objc_msgSend(v5, "performChanges:", v6);

}

- ($FACAC4C914AA3357BF58EDB133E9B698)ppt_cityMapRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  $FACAC4C914AA3357BF58EDB133E9B698 result;

  v2 = 42852201.5;
  v3 = 103675449.0;
  v4 = 133435.2;
  v5 = 181471.8;
  result.var1.var1 = v5;
  result.var1.var0 = v4;
  result.var0.var1 = v3;
  result.var0.var0 = v2;
  return result;
}

- (id)ppt_visibleMapRectBlockForQueue:(id)a3 delay:(double)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD aBlock[4];
  id v11;
  PXPlacesMapView *v12;
  double v13;

  v6 = a3;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __57__PXPlacesMapView_ppt_visibleMapRectBlockForQueue_delay___block_invoke;
  aBlock[3] = &unk_1E512C798;
  v11 = v6;
  v12 = self;
  v13 = a4;
  v7 = v6;
  v8 = _Block_copy(aBlock);

  return v8;
}

- (void)ppt_performPlacesScrollTest:(id)a3 iterations:(int64_t)a4 screenDelta:(int64_t)a5 delay:(double)a6 completion:(id)a7
{
  id v11;
  NSObject *v12;
  NSObject *v13;
  void (**v14)(_QWORD, double, double, double, double);
  double x;
  double y;
  double width;
  double height;
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
  double v33;
  double v34;
  double v35;
  double v36;
  _QWORD block[4];
  id v38;
  MKMapRect v39;
  MKMapRect v40;
  MKMapRect v41;
  MKMapRect v42;
  MKMapRect v43;

  v11 = a7;
  -[PXPlacesMapView ppt_cityMapRect](self, "ppt_cityMapRect");
  -[PXPlacesMapView setVisibleMapRect:animated:](self, "setVisibleMapRect:animated:", 0);
  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = dispatch_queue_create("scrollQueue", v12);

  -[PXPlacesMapView ppt_visibleMapRectBlockForQueue:delay:](self, "ppt_visibleMapRectBlockForQueue:delay:", v13, a6);
  v14 = (void (**)(_QWORD, double, double, double, double))objc_claimAutoreleasedReturnValue();
  if (a4 >= 1)
  {
    v23 = (double)a5;
    v24 = (double)-a5;
    do
    {
      -[PXPlacesMapView visibleMapRect](self, "visibleMapRect");
      x = v39.origin.x;
      y = v39.origin.y;
      width = v39.size.width;
      height = v39.size.height;
      v40 = MKMapRectOffset(v39, 0.0, v39.size.height * v24);
      v35 = v40.origin.y;
      v36 = v40.origin.x;
      v33 = v40.size.height;
      v34 = v40.size.width;
      v40.origin.x = x;
      v40.origin.y = y;
      v40.size.width = width;
      v40.size.height = height;
      v41 = MKMapRectOffset(v40, 0.0, height * v23);
      v27 = v41.origin.y;
      v28 = v41.origin.x;
      v25 = v41.size.height;
      v26 = v41.size.width;
      v41.origin.x = x;
      v41.origin.y = y;
      v41.size.width = width;
      v41.size.height = height;
      v42 = MKMapRectOffset(v41, width * v24, 0.0);
      v29 = v42.origin.x;
      v30 = v42.origin.y;
      v31 = v42.size.height;
      v32 = v42.size.width;
      v42.origin.x = x;
      v42.origin.y = y;
      v42.size.width = width;
      v42.size.height = height;
      v43 = MKMapRectOffset(v42, width * v23, 0.0);
      v19 = v43.origin.x;
      v20 = v43.origin.y;
      v21 = v43.size.width;
      v22 = v43.size.height;
      v14[2](v14, v36, v35, v34, v33);
      v14[2](v14, v28, v27, v26, v25);
      v14[2](v14, x, y, width, height);
      v14[2](v14, v29, v30, v32, v31);
      v14[2](v14, v19, v20, v21, v22);
      v14[2](v14, x, y, width, height);
      --a4;
    }
    while (a4);
  }
  if (v11)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __87__PXPlacesMapView_ppt_performPlacesScrollTest_iterations_screenDelta_delay_completion___block_invoke;
    block[3] = &unk_1E5148A40;
    v38 = v11;
    dispatch_async(v13, block);

  }
}

- (void)ppt_performPlacesZoomTest:(id)a3 iterations:(int64_t)a4 delay:(double)a5 completion:(id)a6
{
  id v9;
  NSObject *v10;
  NSObject *v11;
  void (**v12)(_QWORD, double, double, double, double);
  double x;
  double y;
  double width;
  double height;
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
  _QWORD block[4];
  id v30;
  MKMapRect v31;
  MKMapRect v32;
  MKMapRect v33;
  MKMapRect v34;
  MKMapRect v35;
  MKMapRect v36;

  v9 = a6;
  -[PXPlacesMapView ppt_cityMapRect](self, "ppt_cityMapRect");
  -[PXPlacesMapView setVisibleMapRect:animated:](self, "setVisibleMapRect:animated:", 0);
  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = dispatch_queue_create("scrollQueue", v10);

  -[PXPlacesMapView ppt_visibleMapRectBlockForQueue:delay:](self, "ppt_visibleMapRectBlockForQueue:delay:", v11, a5);
  v12 = (void (**)(_QWORD, double, double, double, double))objc_claimAutoreleasedReturnValue();
  if (a4 >= 1)
  {
    do
    {
      -[PXPlacesMapView visibleMapRect](self, "visibleMapRect");
      x = v31.origin.x;
      y = v31.origin.y;
      width = v31.size.width;
      height = v31.size.height;
      v32 = MKMapRectOffset(v31, v31.size.width / -3.0, 0.0);
      v33 = MKMapRectInset(v32, width / 3.0, height / 3.0);
      v23 = v33.origin.y;
      v24 = v33.origin.x;
      v21 = v33.size.height;
      v22 = v33.size.width;
      v33.origin.x = x;
      v33.origin.y = y;
      v33.size.width = width;
      v33.size.height = height;
      v34 = MKMapRectInset(v33, width / 3.0, height / 3.0);
      v27 = v34.origin.y;
      v28 = v34.origin.x;
      v25 = v34.size.height;
      v26 = v34.size.width;
      v34.origin.x = x;
      v34.origin.y = y;
      v34.size.width = width;
      v34.size.height = height;
      v35 = MKMapRectOffset(v34, width / 3.0, 0.0);
      v36 = MKMapRectInset(v35, width / 3.0, height / 3.0);
      v17 = v36.origin.x;
      v18 = v36.origin.y;
      v19 = v36.size.width;
      v20 = v36.size.height;
      v12[2](v12, v24, v23, v22, v21);
      v12[2](v12, x, y, width, height);
      v12[2](v12, v28, v27, v26, v25);
      v12[2](v12, x, y, width, height);
      v12[2](v12, v17, v18, v19, v20);
      v12[2](v12, x, y, width, height);
      --a4;
    }
    while (a4);
  }
  if (v9)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __73__PXPlacesMapView_ppt_performPlacesZoomTest_iterations_delay_completion___block_invoke;
    block[3] = &unk_1E5148A40;
    v30 = v9;
    dispatch_async(v11, block);

  }
}

- (PXPlacesMapViewDelegate)mapViewDelegate
{
  return (PXPlacesMapViewDelegate *)objc_loadWeakRetained((id *)&self->_mapViewDelegate);
}

- (void)setMapViewDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_mapViewDelegate, a3);
}

- (PXObservable)observable
{
  return self->_observable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observable, 0);
  objc_destroyWeak((id *)&self->_mapViewDelegate);
}

void __73__PXPlacesMapView_ppt_performPlacesZoomTest_iterations_delay_completion___block_invoke(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__PXPlacesMapView_ppt_performPlacesZoomTest_iterations_delay_completion___block_invoke_2;
  block[3] = &unk_1E5148A40;
  v2 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __73__PXPlacesMapView_ppt_performPlacesZoomTest_iterations_delay_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __87__PXPlacesMapView_ppt_performPlacesScrollTest_iterations_screenDelta_delay_completion___block_invoke(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __87__PXPlacesMapView_ppt_performPlacesScrollTest_iterations_screenDelta_delay_completion___block_invoke_2;
  block[3] = &unk_1E5148A40;
  v2 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __87__PXPlacesMapView_ppt_performPlacesScrollTest_iterations_screenDelta_delay_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __57__PXPlacesMapView_ppt_visibleMapRectBlockForQueue_delay___block_invoke(_QWORD *a1, double a2, double a3, double a4, double a5)
{
  NSObject *v5;
  _QWORD v6[10];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __57__PXPlacesMapView_ppt_visibleMapRectBlockForQueue_delay___block_invoke_2;
  v6[3] = &unk_1E51490D8;
  v5 = a1[4];
  v6[4] = a1[5];
  *(double *)&v6[5] = a2;
  *(double *)&v6[6] = a3;
  *(double *)&v6[7] = a4;
  *(double *)&v6[8] = a5;
  v6[9] = a1[6];
  dispatch_async(v5, v6);
}

uint64_t __57__PXPlacesMapView_ppt_visibleMapRectBlockForQueue_delay___block_invoke_2(uint64_t a1)
{
  __int128 v2;
  _QWORD block[5];
  __int128 v5;
  __int128 v6;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__PXPlacesMapView_ppt_visibleMapRectBlockForQueue_delay___block_invoke_3;
  block[3] = &unk_1E51490B0;
  block[4] = *(_QWORD *)(a1 + 32);
  v2 = *(_OWORD *)(a1 + 56);
  v5 = *(_OWORD *)(a1 + 40);
  v6 = v2;
  dispatch_async(MEMORY[0x1E0C80D38], block);
  return usleep((*(double *)(a1 + 72) * 1000000.0));
}

uint64_t __57__PXPlacesMapView_ppt_visibleMapRectBlockForQueue_delay___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setVisibleMapRect:animated:", 1, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

void __51__PXPlacesMapView_mapView_canEnter3DModeDidChange___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "observable");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "signalChange:", 8);

}

void __44__PXPlacesMapView_mapView_didBecomePitched___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "observable");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "signalChange:", 4);

}

void __48__PXPlacesMapView_mapViewWillStartLocatingUser___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "observable");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "signalChange:", 32);

}

void __51__PXPlacesMapView_mapView_regionDidChangeAnimated___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "observable");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "signalChange:", 1);

}

void __46__PXPlacesMapView_mapViewDidFinishLoadingMap___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "observable");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "signalChange:", 16);

}

void __45__PXPlacesMapView_setPreferredConfiguration___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "observable");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "signalChange:", 2);

}

+ ($FACAC4C914AA3357BF58EDB133E9B698)MKMapRectForCoordinateRegion:(id *)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  MKMapPoint v11;
  MKMapPoint v12;
  double x;
  double y;
  double v15;
  double v16;
  double v17;
  double v18;
  CLLocationCoordinate2D v19;
  CLLocationCoordinate2D v20;
  $FACAC4C914AA3357BF58EDB133E9B698 result;

  v7 = v4;
  v8 = v3;
  v9 = v5 * 0.5;
  v10 = v6 * 0.5;
  v19 = CLLocationCoordinate2DMake(v3 + v5 * 0.5, v4 - v6 * 0.5);
  v11 = MKMapPointForCoordinate(v19);
  v20 = CLLocationCoordinate2DMake(v8 - v9, v7 + v10);
  v12 = MKMapPointForCoordinate(v20);
  if (v11.x >= v12.x)
    x = v12.x;
  else
    x = v11.x;
  if (v11.y >= v12.y)
    y = v12.y;
  else
    y = v11.y;
  v15 = -(v11.x - v12.x);
  if (v11.x - v12.x >= 0.0)
    v15 = v11.x - v12.x;
  if (v11.y - v12.y >= 0.0)
    v16 = v11.y - v12.y;
  else
    v16 = -(v11.y - v12.y);
  v17 = x;
  v18 = y;
  result.var1.var1 = v16;
  result.var1.var0 = v15;
  result.var0.var1 = v18;
  result.var0.var0 = v17;
  return result;
}

+ ($FACAC4C914AA3357BF58EDB133E9B698)mapRectForNearbyQueriesFromRect:(id)a3 atScale:(double)a4 targetViewSize:(CGSize)a5
{
  double v5;
  double v6;
  double v7;
  double v8;
  $FACAC4C914AA3357BF58EDB133E9B698 result;

  objc_msgSend(a1, "canonicalMapRect:", a3.var0.var0 + a3.var1.var0 * 0.5 - a5.width * a4 * 0.5, a3.var0.var1 + a3.var1.var1 * 0.5 - a5.height * a4 * 0.5, a5.width * a4, a5.height * a4);
  result.var1.var1 = v8;
  result.var1.var0 = v7;
  result.var0.var1 = v6;
  result.var0.var0 = v5;
  return result;
}

+ ($FACAC4C914AA3357BF58EDB133E9B698)canonicalMapRect:(id)result
{
  double var1;
  double v4;
  double var0;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  var1 = result.var0.var1;
  v4 = *(double *)(MEMORY[0x1E0CC1670] + 16);
  if (result.var0.var0 >= 0.0)
  {
    if (result.var0.var0 > v4)
      result.var0.var0 = result.var0.var0 - v4;
  }
  else
  {
    result.var0.var0 = result.var0.var0 + v4;
  }
  var0 = 0.0;
  v6 = 0.0;
  if (var1 >= 0.0)
  {
    v6 = var1;
    if (var1 > *(double *)(MEMORY[0x1E0CC1670] + 24))
      v6 = *(double *)(MEMORY[0x1E0CC1670] + 24);
  }
  if (result.var1.var0 >= 0.0)
  {
    var0 = result.var1.var0;
    if (result.var1.var0 > v4)
      var0 = *(double *)(MEMORY[0x1E0CC1670] + 16);
  }
  v7 = 0.0;
  if (result.var1.var1 >= 0.0)
  {
    v8 = *(double *)(MEMORY[0x1E0CC1670] + 24);
    v7 = result.var1.var1;
    if (result.var1.var1 + v6 > v8)
      v7 = v8 - v6;
  }
  v9 = var0;
  v10 = v7;
  result.var1.var1 = v10;
  result.var1.var0 = v9;
  result.var0.var1 = v6;
  return result;
}

+ (PXPlacesMapView)mapViewWithMarkedLocation:(id)a3 regionRadius:(double)a4 frame:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  objc_class *v10;
  id v11;
  id v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;

  if (a3)
  {
    height = a5.size.height;
    width = a5.size.width;
    y = a5.origin.y;
    x = a5.origin.x;
    v10 = (objc_class *)MEMORY[0x1E0CC1908];
    v11 = a3;
    v12 = objc_alloc_init(v10);
    objc_msgSend(v11, "coordinate");
    objc_msgSend(v12, "setCoordinate:");
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC1870]), "initWithFrame:", x, y, width, height);
    objc_msgSend(v11, "coordinate");
    v15 = v14;
    v17 = v16;

    MEMORY[0x1A85CBC98](v15, v17, a4 + a4, a4 + a4);
    objc_msgSend(v13, "setRegion:");
    objc_msgSend(v13, "setMapType:", 0);
    objc_msgSend(v13, "addAnnotation:", v12);

  }
  else
  {
    v13 = 0;
  }
  return (PXPlacesMapView *)v13;
}

@end
