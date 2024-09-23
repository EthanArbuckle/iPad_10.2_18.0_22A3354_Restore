@implementation BKDisplayAnnotationController

- (void)invalidate
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[BKDisplayAnnotationController _lock_invalidate](self, "_lock_invalidate");
  os_unfair_lock_unlock(p_lock);
}

- (void)_lock_invalidate
{
  BSInvalidatable *displayObserver;
  BSInvalidatable *v4;
  BSInvalidatable *orientationObserver;

  displayObserver = self->_displayObserver;
  if (displayObserver)
  {
    -[BSInvalidatable invalidate](displayObserver, "invalidate");
    v4 = self->_displayObserver;
    self->_displayObserver = 0;

    -[BSInvalidatable invalidate](self->_orientationObserver, "invalidate");
    orientationObserver = self->_orientationObserver;
    self->_orientationObserver = 0;

    -[BKDisplayAnnotationController _lock_tearDownLayerTree](self, "_lock_tearDownLayerTree");
  }
}

- (id)annotationForKeyPath:(id)a3
{
  id v3;
  id v4;
  _QWORD v6[4];
  BKDisplayAnnotationController *v7;
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = sub_100072068;
  v14 = sub_100072078;
  v15 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100072984;
  v6[3] = &unk_1000ECE20;
  v9 = &v10;
  v7 = self;
  v3 = a3;
  v8 = v3;
  -[BKDisplayAnnotationController performSynchronized:](v7, "performSynchronized:", v6);
  v4 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return v4;
}

- (id)allAnnotationsForKeyPath:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  BKDisplayAnnotationController *v9;
  id v10;
  id v11;

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000728B8;
  v8[3] = &unk_1000ECD38;
  v9 = self;
  v10 = a3;
  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v11 = v3;
  v4 = v10;
  -[BKDisplayAnnotationController performSynchronized:](v9, "performSynchronized:", v8);
  v5 = v11;
  v6 = v3;

  return v6;
}

- (void)setAnnotation:(id)a3 forKeyPath:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  BKDisplayAnnotationController *v10;
  id v11;

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100072738;
  v8[3] = &unk_1000ECD38;
  v9 = a3;
  v10 = self;
  v11 = a4;
  v6 = v11;
  v7 = v9;
  -[BKDisplayAnnotationController performSynchronizedWithCATransaction:](self, "performSynchronizedWithCATransaction:", v8);

}

- (void)removeAnnotationsForKeyPath:(id)a3
{
  -[BKDisplayAnnotationController removeAnnotationsForKeyPath:afterDelay:queue:](self, "removeAnnotationsForKeyPath:afterDelay:queue:", a3, 0, 0.0);
}

- (void)removeAnnotationsForKeyPath:(id)a3 afterDelay:(double)a4 queue:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  double v17;
  uint8_t buf[4];
  id v19;

  v8 = a3;
  v9 = a5;
  v10 = sub_1000598B8();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v19 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "remove %{public}@", buf, 0xCu);
  }

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100072260;
  v14[3] = &unk_1000ECE90;
  v14[4] = self;
  v15 = v8;
  v17 = a4;
  v16 = v9;
  v12 = v9;
  v13 = v8;
  -[BKDisplayAnnotationController performSynchronizedWithCATransaction:](self, "performSynchronizedWithCATransaction:", v14);

}

- (void)orientationManager:(id)a3 deviceOrientationMayHaveChanged:(int64_t)a4 changeSource:(int64_t)a5 isDeviceOrientationLocked:(BOOL)a6
{
  _QWORD v6[5];

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100072170;
  v6[3] = &unk_1000ECDA8;
  v6[4] = self;
  -[BKDisplayAnnotationController performSynchronizedWithCATransaction:](self, "performSynchronizedWithCATransaction:", v6, a4, a5, a6);
}

- (void)monitor:(id)a3 activeDisplayPropertiesDidChange:(id)a4
{
  unsigned int v6;
  id v7;

  v7 = a4;
  v6 = objc_msgSend(v7, "displayId");
  if (v6 == -[CADisplay displayId](self->_display, "displayId"))
  {
    os_unfair_lock_lock(&self->_lock);
    objc_storeStrong((id *)&self->_display, a4);
    -[BKDisplayAnnotationController _lock_updateLayerTree](self, "_lock_updateLayerTree");
    os_unfair_lock_unlock(&self->_lock);
  }

}

- (void)monitor:(id)a3 displayDidBecomeActive:(id)a4
{
  unsigned int v6;
  id v7;

  v7 = a4;
  v6 = objc_msgSend(v7, "displayId");
  if (v6 == -[CADisplay displayId](self->_display, "displayId"))
  {
    os_unfair_lock_lock(&self->_lock);
    objc_storeStrong((id *)&self->_display, a4);
    -[BKDisplayAnnotationController _lock_setupLayerTree](self, "_lock_setupLayerTree");
    os_unfair_lock_unlock(&self->_lock);
  }

}

- (void)monitor:(id)a3 displayDidBecomeInactive:(id)a4
{
  unsigned int v5;

  v5 = objc_msgSend(a4, "displayId", a3);
  if (v5 == -[CADisplay displayId](self->_display, "displayId"))
  {
    os_unfair_lock_lock(&self->_lock);
    -[BKDisplayAnnotationController _lock_tearDownLayerTree](self, "_lock_tearDownLayerTree");
    os_unfair_lock_unlock(&self->_lock);
  }
}

- (void)_lock_updateLayerTree
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  os_unfair_lock_assert_owner(&self->_lock);
  v3 = sub_1000598B8();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "updateLayerTree", v5, 2u);
  }

  +[CATransaction begin](CATransaction, "begin");
  -[BKDisplayAnnotationController _lock_tearDownLayerTree](self, "_lock_tearDownLayerTree");
  -[BKDisplayAnnotationController _lock_setupLayerTree](self, "_lock_setupLayerTree");
  +[CATransaction commit](CATransaction, "commit");
}

- (void)_lock_setupLayerTree
{
  CADisplay *v3;
  void *v4;
  int v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;
  NSObject *v16;
  id v17;
  id v18;
  void *v19;
  double v20;
  id v21;
  NSObject *v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  id v27;
  NSObject *v28;
  id v29;
  id v30;
  void *v31;
  id v32;
  CALayer *v33;
  CALayer *rootLayer;
  CALayer *v35;
  CALayer *v36;
  CALayer *transformLayer;
  CALayer *v38;
  CALayer *referenceSpaceLayer;
  void *v40;
  void *v41;
  CAContext *v42;
  CAContext *context;
  double v44;
  CGAffineTransform v45;
  uint64_t v46;
  _QWORD v47[5];
  _QWORD v48[5];
  _BYTE buf[24];
  double v50;
  __int128 v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;

  os_unfair_lock_assert_owner(&self->_lock);
  if (!self->_rootLayer)
  {
    +[CATransaction begin](CATransaction, "begin");
    v3 = self->_display;
    *(double *)&v46 = 1.0;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CADisplay uniqueId](v3, "uniqueId"));
    v5 = sub_10000F94C(v4);

    if (v5)
    {
      *(_QWORD *)buf = _NSConcreteStackBlock;
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = sub_10000FBA8;
      v50 = COERCE_DOUBLE(&unk_1000EA5A0);
      v51 = 0uLL;
      v52 = &v46;
      v53 = 0;
      v54 = 0;
      v55 = 0;
      sub_10000FA60(buf);
      v6 = *(double *)&v46;
    }
    else
    {
      v6 = _BKSGetExternalDisplayScale(v3);
    }

    -[CADisplay bounds](self->_display, "bounds");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v15 = sub_1000598B8();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = (id)objc_claimAutoreleasedReturnValue(-[CADisplay uniqueId](self->_display, "uniqueId"));
      v18 = objc_msgSend(v17, "length");
      v19 = (void *)BKSDisplayUUIDMainKey;
      if (v18)
        v19 = v17;
      v20 = COERCE_DOUBLE(v19);

      *(_DWORD *)buf = 134218498;
      *(_QWORD *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2048;
      *(double *)&buf[14] = v6;
      *(_WORD *)&buf[22] = 2112;
      v50 = v20;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%p     scale (%g)    %@", buf, 0x20u);

    }
    v21 = sub_1000598B8();
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = (id)objc_claimAutoreleasedReturnValue(-[CADisplay uniqueId](self->_display, "uniqueId"));
      v24 = objc_msgSend(v23, "length");
      v25 = (void *)BKSDisplayUUIDMainKey;
      if (v24)
        v25 = v23;
      v26 = v25;

      *(_DWORD *)buf = 134218754;
      *(_QWORD *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2048;
      *(double *)&buf[14] = v12;
      *(_WORD *)&buf[22] = 2048;
      v50 = v14;
      LOWORD(v51) = 2112;
      *(_QWORD *)((char *)&v51 + 2) = v26;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%p      root (%g,%g) %@", buf, 0x2Au);

    }
    v27 = sub_1000598B8();
    v28 = objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      v29 = (id)objc_claimAutoreleasedReturnValue(-[CADisplay uniqueId](self->_display, "uniqueId"));
      v30 = objc_msgSend(v29, "length");
      v31 = (void *)BKSDisplayUUIDMainKey;
      if (v30)
        v31 = v29;
      v32 = v31;

      *(_DWORD *)buf = 134218754;
      *(_QWORD *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2048;
      *(double *)&buf[14] = v12 / v6;
      *(_WORD *)&buf[22] = 2048;
      v50 = v14 / v6;
      LOWORD(v51) = 2112;
      *(_QWORD *)((char *)&v51 + 2) = v32;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "%p transform (%g,%g) %@", buf, 0x2Au);

    }
    v33 = (CALayer *)objc_claimAutoreleasedReturnValue(+[CALayer layer](CALayer, "layer"));
    rootLayer = self->_rootLayer;
    self->_rootLayer = v33;

    -[CALayer setName:](self->_rootLayer, "setName:", CFSTR("Root"));
    -[CALayer setRasterizationScale:](self->_rootLayer, "setRasterizationScale:", v6);
    v35 = self->_rootLayer;
    CGAffineTransformMakeScale(&v45, v6, v6);
    -[CALayer setAffineTransform:](v35, "setAffineTransform:", &v45);
    v36 = (CALayer *)objc_claimAutoreleasedReturnValue(+[CALayer layer](CALayer, "layer"));
    transformLayer = self->_transformLayer;
    self->_transformLayer = v36;

    -[CALayer setName:](self->_transformLayer, "setName:", CFSTR("Transform"));
    -[CALayer addSublayer:](self->_rootLayer, "addSublayer:", self->_transformLayer);
    v38 = (CALayer *)objc_claimAutoreleasedReturnValue(+[CALayer layer](CALayer, "layer"));
    referenceSpaceLayer = self->_referenceSpaceLayer;
    self->_referenceSpaceLayer = v38;

    -[CALayer setName:](self->_referenceSpaceLayer, "setName:", CFSTR("ReferenceSpace"));
    -[CALayer addSublayer:](self->_rootLayer, "addSublayer:", self->_referenceSpaceLayer);
    -[CALayer setFrame:](self->_rootLayer, "setFrame:", v8, v10, v12, v14);
    -[CALayer setFrame:](self->_transformLayer, "setFrame:", 0.0, 0.0, v12 / v6, v14 / v6);
    -[BKDisplayAnnotationController _configureReferenceSpaceLayerTransformWithScale:](self, "_configureReferenceSpaceLayerTransformWithScale:", v6);
    v48[0] = &__kCFBooleanTrue;
    v47[0] = kCAContextDisplayable;
    v47[1] = kCAContextDisplayName;
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[CADisplay name](self->_display, "name"));
    v48[1] = v40;
    v48[2] = &__kCFBooleanTrue;
    v47[2] = kCAContextIgnoresHitTest;
    v47[3] = kCAContextSecure;
    v47[4] = kCAContextAllowsOcclusionDetectionOverride;
    v48[3] = &__kCFBooleanTrue;
    v48[4] = &__kCFBooleanTrue;
    v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v48, v47, 5));

    v42 = (CAContext *)objc_claimAutoreleasedReturnValue(+[CAContext remoteContextWithOptions:](CAContext, "remoteContextWithOptions:", v41));
    context = self->_context;
    self->_context = v42;

    LODWORD(v44) = 1173555200;
    -[CAContext setLevel:](self->_context, "setLevel:", v44);
    -[CAContext setSecure:](self->_context, "setSecure:", 1);
    -[CAContext setLayer:](self->_context, "setLayer:", self->_rootLayer);
    -[CALayer setDisableUpdateMask:](self->_rootLayer, "setDisableUpdateMask:", -[CALayer disableUpdateMask](self->_rootLayer, "disableUpdateMask") | 0x20);
    +[CATransaction flush](CATransaction, "flush");
    +[CATransaction commit](CATransaction, "commit");
    -[BKNamespaceNode enumerateNodesWithOptions:usingBlock:](self->_rootNode, "enumerateNodesWithOptions:usingBlock:", 1, &stru_1000EBCA0);

  }
}

- (void)_lock_tearDownLayerTree
{
  CALayer *rootLayer;
  CALayer *referenceSpaceLayer;
  CALayer *transformLayer;
  CAContext *context;

  os_unfair_lock_assert_owner(&self->_lock);
  rootLayer = self->_rootLayer;
  if (rootLayer)
  {
    self->_rootLayer = 0;

    referenceSpaceLayer = self->_referenceSpaceLayer;
    self->_referenceSpaceLayer = 0;

    transformLayer = self->_transformLayer;
    self->_transformLayer = 0;

    -[CAContext invalidate](self->_context, "invalidate");
    context = self->_context;
    self->_context = 0;

  }
}

- (void)performSynchronized:(id)a3
{
  os_unfair_lock_s *p_lock;
  void (**v4)(_QWORD);

  p_lock = &self->_lock;
  v4 = (void (**)(_QWORD))a3;
  os_unfair_lock_lock(p_lock);
  v4[2](v4);

  os_unfair_lock_unlock(p_lock);
}

- (void)performSynchronizedWithCATransaction:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100072104;
  v6[3] = &unk_1000EBCC8;
  v7 = v4;
  v5 = v4;
  -[BKDisplayAnnotationController _lock_CATransaction:](self, "_lock_CATransaction:", v6);
  os_unfair_lock_unlock(&self->_lock);

}

- (id)_lock_supernodeForRenderingAtKeyPath:(id)a3
{
  id v4;
  BKNamespaceNode *rootNode;
  id v6;
  id v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  BKNamespaceNode *v15;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = sub_100072068;
  v14 = sub_100072078;
  v15 = self->_rootNode;
  rootNode = self->_rootNode;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100072080;
  v9[3] = &unk_1000ECFD0;
  v9[4] = &v10;
  v6 = -[BKNamespaceNode enumerateKeyPathNodes:options:ifFound:ifMissing:](rootNode, "enumerateKeyPathNodes:options:ifFound:ifMissing:", v4, 1, v9, 0);
  v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

- (void)_lock_CATransaction:(id)a3
{
  os_unfair_lock_s *p_lock;
  void (**v4)(_QWORD);

  p_lock = &self->_lock;
  v4 = (void (**)(_QWORD))a3;
  os_unfair_lock_assert_owner(p_lock);
  +[CATransaction begin](CATransaction, "begin");
  v4[2](v4);

  +[CATransaction flush](CATransaction, "flush");
  +[CATransaction commit](CATransaction, "commit");
}

- (void)_lock_removeAnnotation:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v4;
  id v5;

  p_lock = &self->_lock;
  v4 = a3;
  os_unfair_lock_assert_owner(p_lock);
  objc_msgSend(v4, "setAnnotationController:", 0);
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "renderer"));

  objc_msgSend(v5, "didRemoveAnnotation");
}

- (void)_lock_locationDidChanges
{
  os_unfair_lock_assert_owner(&self->_lock);
  -[BKNamespaceNode enumerateNodesWithOptions:usingBlock:](self->_rootNode, "enumerateNodesWithOptions:usingBlock:", 1, &stru_1000EBCE8);
}

- (void)_configureReferenceSpaceLayerTransformWithScale:(double)a3
{
  double b;
  double a;
  double d;
  double c;
  double ty;
  double tx;
  void *v11;
  CGAffineTransform *p_t2;
  double v13;
  double v14;
  double v15;
  CALayer *referenceSpaceLayer;
  double v17;
  _QWORD v18[6];
  CGAffineTransform v19;
  CGAffineTransform t1;
  CGAffineTransform t2;
  CGAffineTransform v22;
  char v23;
  double v24;
  double v25;

  a = CGAffineTransformIdentity.a;
  b = CGAffineTransformIdentity.b;
  c = CGAffineTransformIdentity.c;
  d = CGAffineTransformIdentity.d;
  tx = CGAffineTransformIdentity.tx;
  ty = CGAffineTransformIdentity.ty;
  v24 = 0.0;
  v25 = 0.0;
  v23 = 0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CADisplay uniqueId](self->_display, "uniqueId"));
  sub_10000F834(v11, &v25, &v24, 0, &v23, 0);

  if (v23 == 1)
  {
    CGAffineTransformMakeRotation(&t2, -1.57079633);
    t1.a = CGAffineTransformIdentity.a;
    t1.b = b;
    t1.c = c;
    t1.d = d;
    t1.tx = tx;
    t1.ty = ty;
    p_t2 = &t2;
  }
  else
  {
    if (v23 != 3)
    {
      v13 = v24;
      v14 = v25;
      goto LABEL_7;
    }
    CGAffineTransformMakeRotation(&v19, 1.57079633);
    t1.a = CGAffineTransformIdentity.a;
    t1.b = b;
    t1.c = c;
    t1.d = d;
    t1.tx = tx;
    t1.ty = ty;
    p_t2 = &v19;
  }
  CGAffineTransformConcat(&v22, &t1, p_t2);
  a = v22.a;
  b = v22.b;
  c = v22.c;
  d = v22.d;
  tx = v22.tx;
  ty = v22.ty;
  v14 = v24;
  v13 = v25;
  v24 = v25;
  v25 = v14;
LABEL_7:
  v15 = v14 / a3;
  referenceSpaceLayer = self->_referenceSpaceLayer;
  v18[0] = round(a);
  v18[1] = round(b);
  v18[2] = round(c);
  v18[3] = round(d);
  v18[4] = round(tx);
  v18[5] = round(ty);
  v17 = v13 / a3;
  -[CALayer setAffineTransform:](referenceSpaceLayer, "setAffineTransform:", v18);
  -[CALayer setFrame:](self->_referenceSpaceLayer, "setFrame:", 0.0, 0.0, v15, v17);
}

- (CADisplay)display
{
  return self->_display;
}

- (void)setDisplay:(id)a3
{
  objc_storeStrong((id *)&self->_display, a3);
}

- (CAContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (CALayer)rootLayer
{
  return self->_rootLayer;
}

- (void)setRootLayer:(id)a3
{
  objc_storeStrong((id *)&self->_rootLayer, a3);
}

- (CALayer)transformLayer
{
  return self->_transformLayer;
}

- (void)setTransformLayer:(id)a3
{
  objc_storeStrong((id *)&self->_transformLayer, a3);
}

- (CALayer)referenceSpaceLayer
{
  return self->_referenceSpaceLayer;
}

- (void)setReferenceSpaceLayer:(id)a3
{
  objc_storeStrong((id *)&self->_referenceSpaceLayer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_referenceSpaceLayer, 0);
  objc_storeStrong((id *)&self->_transformLayer, 0);
  objc_storeStrong((id *)&self->_rootLayer, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_display, 0);
  objc_storeStrong((id *)&self->_rootNode, 0);
  objc_storeStrong((id *)&self->_annotations, 0);
  objc_storeStrong((id *)&self->_orientationObserver, 0);
  objc_storeStrong((id *)&self->_displayObserver, 0);
  objc_storeStrong((id *)&self->_displayController, 0);
}

+ (id)annotationControllerForDisplay:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  BKDisplayAnnotationController *v15;
  id v16;
  id v17;
  BKDisplayAnnotationController *v18;
  const char *v19;
  id displayController;
  id v21;
  uint64_t v22;
  BSInvalidatable *displayObserver;
  BKNamespaceNode *v24;
  BKNamespaceNode *rootNode;
  const char *v26;
  id Property;
  id v28;
  id v29;
  void *v30;
  id v31;
  unsigned int v32;
  void *v33;
  int v34;
  id v35;
  id *v36;
  id *v37;
  uint64_t v38;
  BSInvalidatable *orientationObserver;
  _BKDisplayAnnotationControllerReference *v40;
  id v42;
  id v43;
  id *p_display;
  objc_super v45;

  v4 = a3;
  v5 = sub_10004AD44();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7 = v4;
  if (v6)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(v6 + 8));
    if (!*(_QWORD *)(v6 + 16))
    {
      v8 = objc_alloc_init((Class)NSMutableDictionary);
      v9 = *(void **)(v6 + 16);
      *(_QWORD *)(v6 + 16) = v8;

    }
    v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "uniqueId"));
    v11 = objc_msgSend(v10, "length");
    v12 = (void *)BKSDisplayUUIDMainKey;
    if (v11)
      v13 = v10;
    else
      v13 = (void *)BKSDisplayUUIDMainKey;
    v14 = v13;

    v15 = (BKDisplayAnnotationController *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v6 + 16), "objectForKey:", v14));
    if (!v15)
    {
      v15 = [BKDisplayAnnotationController alloc];
      v16 = v7;
      v17 = (id)v6;
      if (v15)
      {
        v45.receiver = v15;
        v45.super_class = (Class)BKDisplayAnnotationController;
        v18 = objc_msgSendSuper2(&v45, "init");
        v15 = v18;
        if (v18)
        {
          v18->_lock._os_unfair_lock_opaque = 0;
          p_display = (id *)&v18->_display;
          objc_storeStrong((id *)&v18->_display, a3);
          objc_storeStrong((id *)&v15->_displayController, (id)v6);
          displayController = v15->_displayController;
          if (displayController)
            displayController = objc_getProperty(displayController, v19, 24, 1);
          v21 = displayController;
          v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "addObserver:", v15));
          displayObserver = v15->_displayObserver;
          v15->_displayObserver = (BSInvalidatable *)v22;

          v24 = objc_alloc_init(BKNamespaceNode);
          rootNode = v15->_rootNode;
          v15->_rootNode = v24;

          -[BKNamespaceNode setName:](v15->_rootNode, "setName:", CFSTR("<root>"));
          Property = v15->_displayController;
          v42 = v16;
          v43 = v17;
          if (Property)
            Property = objc_getProperty(Property, v26, 24, 1);
          v28 = Property;
          v29 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*p_display, "uniqueId"));
          if (objc_msgSend(v29, "length"))
            v30 = v29;
          else
            v30 = v12;
          v31 = v30;

          v32 = objc_msgSend(v28, "displayUUIDIsActive:", v31);
          if (v32)
          {
            os_unfair_lock_lock(&v15->_lock);
            -[BKDisplayAnnotationController _lock_setupLayerTree](v15, "_lock_setupLayerTree");
            os_unfair_lock_unlock(&v15->_lock);
          }
          if ((objc_msgSend(*p_display, "isExternal") & 1) != 0)
          {
            v16 = v42;
            v17 = v43;
          }
          else
          {
            v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*p_display, "uniqueId"));
            v34 = sub_10000F94C(v33);

            v17 = v43;
            if (v34)
            {
              v35 = sub_10001A7F4();
              v36 = (id *)objc_claimAutoreleasedReturnValue(v35);
              v37 = sub_10008BB88(v36, v15);
              v38 = objc_claimAutoreleasedReturnValue(v37);
              orientationObserver = v15->_orientationObserver;
              v15->_orientationObserver = (BSInvalidatable *)v38;

            }
            v16 = v42;
          }
        }
      }

      objc_msgSend(*(id *)(v6 + 16), "setObject:forKey:", v15, v14);
    }

    os_unfair_lock_unlock((os_unfair_lock_t)(v6 + 8));
    v40 = -[_BKDisplayAnnotationControllerReference initWithController:]([_BKDisplayAnnotationControllerReference alloc], "initWithController:", v15);

  }
  else
  {
    v40 = 0;
  }

  return v40;
}

+ (void)performBlockForEveryAnnotationController:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v3 = a3;
  v4 = sub_10004AD44();
  v7 = (id)objc_claimAutoreleasedReturnValue(v4);
  v5 = v3;
  if (v7)
  {
    os_unfair_lock_assert_not_owner((const os_unfair_lock *)v7 + 2);
    os_unfair_lock_lock((os_unfair_lock_t)v7 + 2);
    v6 = objc_msgSend(*((id *)v7 + 2), "copy");
    os_unfair_lock_unlock((os_unfair_lock_t)v7 + 2);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10004ADB0;
    v8[3] = &unk_1000EACB8;
    v9 = v5;
    objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v8);

  }
}

@end
