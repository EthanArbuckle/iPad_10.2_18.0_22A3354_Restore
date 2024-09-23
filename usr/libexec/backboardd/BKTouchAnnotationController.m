@implementation BKTouchAnnotationController

- (BKTouchAnnotationController)initWithDisplayUUID:(id)a3
{
  id v4;
  BKTouchAnnotationController *v5;
  uint64_t v6;
  BKTouchAnnotationController *v7;
  id v8;
  uint64_t v9;
  OS_dispatch_queue *workQueue;
  id v11;
  void *v12;
  uint64_t v13;
  BKDisplayAnnotationController *displayAnnotationController;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)BKTouchAnnotationController;
  v5 = -[BKTouchAnnotationController init](&v16, "init");
  v7 = v5;
  if (v5)
  {
    v8 = objc_msgSend((id)objc_opt_class(v5, v6), "workQueue");
    v9 = objc_claimAutoreleasedReturnValue(v8);
    workQueue = v7->_workQueue;
    v7->_workQueue = (OS_dispatch_queue *)v9;

    v11 = sub_100034B98(v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = objc_claimAutoreleasedReturnValue(+[BKDisplayAnnotationController annotationControllerForDisplay:](BKDisplayAnnotationController, "annotationControllerForDisplay:", v12));
    displayAnnotationController = v7->_displayAnnotationController;
    v7->_displayAnnotationController = (BKDisplayAnnotationController *)v13;

  }
  return v7;
}

- (BOOL)shouldVisualizeTouches
{
  NSObject *workQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  workQueue = self->_workQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100041BEC;
  v5[3] = &unk_1000ECDD0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(workQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)shouldVisualizeHitTestRegions
{
  NSObject *workQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  workQueue = self->_workQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100041BD8;
  v5[3] = &unk_1000ECDD0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(workQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setShouldVisualizeTouches:(BOOL)a3
{
  NSObject *workQueue;
  _QWORD v4[5];
  BOOL v5;

  workQueue = self->_workQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100041BA0;
  v4[3] = &unk_1000EC978;
  v4[4] = self;
  v5 = a3;
  dispatch_async(workQueue, v4);
}

- (void)setShouldVisualizeHitTestRegions:(BOOL)a3
{
  NSObject *workQueue;
  _QWORD v4[5];
  BOOL v5;

  workQueue = self->_workQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100041B68;
  v4[3] = &unk_1000EC978;
  v4[4] = self;
  v5 = a3;
  dispatch_async(workQueue, v4);
}

- (void)annotateTouch:(unsigned int)a3 withUniqueString:(id)a4
{
  id v6;
  NSObject *workQueue;
  id v8;
  _QWORD block[5];
  id v10;
  unsigned int v11;

  v6 = a4;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100041B58;
  block[3] = &unk_1000ECDF8;
  v11 = a3;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(workQueue, block);

}

- (void)annotateTouch:(unsigned int)a3 withString:(id)a4 uniqueIdentifier:(id)a5
{
  id v8;
  id v9;
  NSObject *workQueue;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  unsigned int v16;

  v8 = a4;
  v9 = a5;
  workQueue = self->_workQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100041B40;
  v13[3] = &unk_1000EA970;
  v16 = a3;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_async(workQueue, v13);

}

- (void)annotateTouch:(unsigned int)a3 withString:(id)a4 uniqueIdentifier:(id)a5 fromPID:(int)a6
{
  id v10;
  id v11;
  NSObject *workQueue;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  unsigned int v18;
  int v19;

  v10 = a4;
  v11 = a5;
  workQueue = self->_workQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100041B2C;
  v15[3] = &unk_1000ECE90;
  v15[4] = self;
  v16 = v10;
  v17 = v11;
  v18 = a3;
  v19 = a6;
  v13 = v11;
  v14 = v10;
  dispatch_async(workQueue, v15);

}

- (void)_queue_applyBasicAnnotationTextForTouchIdentifier:(unsigned int)a3 pathIndex:(int64_t)a4
{
  uint64_t v5;
  void *v7;
  void *v8;
  void *v9;
  BKDisplayAnnotationNullRenderer *v10;
  void *v11;
  id v12;

  v5 = *(_QWORD *)&a3;
  v12 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("touch.%X.id"), *(_QWORD *)&a3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKDisplayAnnotationController annotationForKeyPath:](self->_displayAnnotationController, "annotationForKeyPath:"));

  if (!v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("t%X p%d"), v5, a4));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[BKDisplayAnnotation annotationWithString:](BKDisplayAnnotation, "annotationWithString:", v8));

    v10 = objc_alloc_init(BKDisplayAnnotationNullRenderer);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[BKDisplayAnnotationStyle colorVariationStyleWithIndex:](BKDisplayAnnotationStyle, "colorVariationStyleWithIndex:", v5));
    objc_msgSend(v9, "setStyleModifier:", v11);

    objc_msgSend(v9, "setRenderer:", v10);
    -[BKDisplayAnnotationController setAnnotation:forKeyPath:](self->_displayAnnotationController, "setAnnotation:forKeyPath:", v9, v12);

  }
}

- (void)touch:(unsigned int)a3 pathIndex:(int64_t)a4 rangeInAtPoint:(CGPoint)a5 eventMask:(unsigned int)a6 z:(double)a7 maxZ:(double)a8 transducerType:(unsigned int)a9
{
  NSObject *workQueue;
  _QWORD block[5];
  CGPoint v11;
  int64_t v12;
  double v13;
  double v14;
  unsigned int v15;

  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100041AE4;
  block[3] = &unk_1000EA998;
  block[4] = self;
  v11 = a5;
  v15 = a3;
  v12 = a4;
  v13 = a7;
  v14 = a8;
  dispatch_async(workQueue, block);
}

- (void)touch:(unsigned int)a3 pathIndex:(int64_t)a4 downAtPoint:(CGPoint)a5 eventMask:(unsigned int)a6 transducerType:(unsigned int)a7
{
  NSObject *workQueue;
  _QWORD block[5];
  CGPoint v9;
  int64_t v10;
  unsigned int v11;
  unsigned int v12;

  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000419A4;
  block[3] = &unk_1000EA9C0;
  block[4] = self;
  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = a6;
  dispatch_async(workQueue, block);
}

- (void)touch:(unsigned int)a3 didHitTestToDestination:(id)a4 hostingChainIndex:(int64_t)a5
{
  id v8;
  NSObject *workQueue;
  id v10;
  _QWORD v11[5];
  id v12;
  int64_t v13;
  unsigned int v14;

  v8 = a4;
  workQueue = self->_workQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100041904;
  v11[3] = &unk_1000EB7C0;
  v11[4] = self;
  v12 = v8;
  v14 = a3;
  v13 = a5;
  v10 = v8;
  dispatch_async(workQueue, v11);

}

- (void)touchDidDetach:(unsigned int)a3 destinations:(id)a4
{
  NSObject *workQueue;
  _QWORD v5[5];
  unsigned int v6;

  workQueue = self->_workQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000418EC;
  v5[3] = &unk_1000EC950;
  v5[4] = self;
  v6 = a3;
  dispatch_async(workQueue, v5);
}

- (void)touchDidTransfer:(unsigned int)a3 destination:(id)a4
{
  id v6;
  NSObject *workQueue;
  id v8;
  _QWORD block[5];
  id v10;
  unsigned int v11;

  v6 = a4;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100041884;
  block[3] = &unk_1000ECDF8;
  v11 = a3;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(workQueue, block);

}

- (void)touch:(unsigned int)a3 didMoveToPoint:(CGPoint)a4 eventMask:(unsigned int)a5 z:(double)a6 maxZ:(double)a7
{
  NSObject *workQueue;
  _QWORD v8[5];
  CGPoint v9;
  double v10;
  double v11;
  unsigned int v12;

  workQueue = self->_workQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100041834;
  v8[3] = &unk_1000EA9E8;
  v8[4] = self;
  v9 = a4;
  v12 = a3;
  v10 = a7;
  v11 = a6;
  dispatch_async(workQueue, v8);
}

- (void)touch:(unsigned int)a3 pathIndex:(int64_t)a4 upAtPoint:(CGPoint)a5 detached:(BOOL)a6
{
  NSObject *workQueue;
  _QWORD v7[5];
  unsigned int v8;

  workQueue = self->_workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000417F4;
  v7[3] = &unk_1000EC950;
  v7[4] = self;
  v8 = a3;
  dispatch_async(workQueue, v7);
}

- (void)touch:(unsigned int)a3 pathIndex:(int64_t)a4 rangeOutAtPoint:(CGPoint)a5
{
  NSObject *workQueue;
  _QWORD v6[5];
  unsigned int v7;

  workQueue = self->_workQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000417A8;
  v6[3] = &unk_1000EC950;
  v6[4] = self;
  v7 = a3;
  dispatch_async(workQueue, v6);
}

- (void)touchDidHIDCancel:(unsigned int)a3
{
  NSObject *workQueue;
  _QWORD v4[5];
  unsigned int v5;

  workQueue = self->_workQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100041798;
  v4[3] = &unk_1000EC950;
  v4[4] = self;
  v5 = a3;
  dispatch_async(workQueue, v4);
}

- (void)touch:(unsigned int)a3 didAlwaysRouteToContext:(unsigned int)a4 clientPort:(unsigned int)a5
{
  NSObject *workQueue;
  _QWORD block[5];
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;

  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000416E0;
  block[3] = &unk_1000EAA10;
  block[4] = self;
  v7 = a4;
  v8 = a5;
  v9 = a3;
  dispatch_async(workQueue, block);
}

- (void)touchDidSoftCancel:(unsigned int)a3
{
  NSObject *workQueue;
  _QWORD v4[5];
  unsigned int v5;

  workQueue = self->_workQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000416D0;
  v4[3] = &unk_1000EC950;
  v4[4] = self;
  v5 = a3;
  dispatch_async(workQueue, v4);
}

- (void)hitTestRegionsDidChange:(id)a3
{
  id v4;
  NSObject *workQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000413E8;
  v7[3] = &unk_1000ECD80;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(workQueue, v7);

}

- (void)_queue_updateHoverStateForTouchIdentifier:(unsigned int)a3 z:(double)a4 maxZ:(double)a5
{
  uint64_t v5;
  const __CFString *v7;
  __CFString *v8;

  v5 = *(_QWORD *)&a3;
  if (a4 > 0.0 || a5 > 0.0)
    v7 = (const __CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("in range"), "stringByAppendingFormat:", CFSTR(" max:%.4g z:%.4g"), *(_QWORD *)&a5, *(_QWORD *)&a4));
  else
    v7 = CFSTR("in range");
  v8 = (__CFString *)v7;
  -[BKTouchAnnotationController _queue_annotateTouch:withString:uniqueIdentifier:fromPID:](self, "_queue_annotateTouch:withString:uniqueIdentifier:fromPID:", v5, v7, CFSTR("withinRange"), 0xFFFFFFFFLL);

}

- (void)_queue_annotateTouch:(unsigned int)a3 withUniqueString:(id)a4
{
  -[BKTouchAnnotationController _queue_annotateTouch:withString:uniqueIdentifier:fromPID:](self, "_queue_annotateTouch:withString:uniqueIdentifier:fromPID:", *(_QWORD *)&a3, a4, a4, 0xFFFFFFFFLL);
}

- (void)_queue_annotateTouch:(unsigned int)a3 withString:(id)a4 uniqueIdentifier:(id)a5 fromPID:(int)a6
{
  uint64_t v6;
  uint64_t v8;
  id v10;
  id v11;
  BKDisplayAnnotationController *displayAnnotationController;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  BKDisplayAnnotationNullRenderer *v19;
  void *v20;
  uint8_t buf[4];
  int v22;
  __int16 v23;
  id v24;
  __int16 v25;
  int v26;

  v6 = *(_QWORD *)&a6;
  v8 = *(_QWORD *)&a3;
  v10 = a4;
  v11 = a5;
  displayAnnotationController = self->_displayAnnotationController;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKTouchAnnotationController _keyPathForTouchIdentifier:](self, "_keyPathForTouchIdentifier:", v8));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKDisplayAnnotationController annotationForKeyPath:](displayAnnotationController, "annotationForKeyPath:", v13));

  v15 = sub_1000598B8();
  v16 = objc_claimAutoreleasedReturnValue(v15);
  v17 = v16;
  if (v14)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109634;
      v22 = v8;
      v23 = 2114;
      v24 = v10;
      v25 = 1024;
      v26 = v6;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "touchIdentifier:%X annotation:%{public}@ pid:%d", buf, 0x18u);
    }

    v17 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("touch.%X.%@"), v8, v11));
    if (objc_msgSend(v10, "length"))
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[BKDisplayAnnotation annotationWithString:](BKDisplayAnnotation, "annotationWithString:", v10));
      v19 = objc_alloc_init(BKDisplayAnnotationNullRenderer);
      objc_msgSend(v18, "setRenderer:", v19);
      if ((int)v6 >= 1)
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[BKTouchAnnotationController _stringDescribingPID:](self, "_stringDescribingPID:", v6));
        objc_msgSend(v18, "setSection:", v20);

      }
      -[BKDisplayAnnotationController setAnnotation:forKeyPath:](self->_displayAnnotationController, "setAnnotation:forKeyPath:", v18, v17);

    }
    else
    {
      -[BKDisplayAnnotationController removeAnnotationsForKeyPath:](self->_displayAnnotationController, "removeAnnotationsForKeyPath:", v17);
    }
  }
  else if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109378;
    v22 = v8;
    v23 = 2114;
    v24 = v10;
    _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "touchIdentifier %X does not exist; dropping annotation:%{public}@",
      buf,
      0x12u);
  }

}

- (void)_queue_removeAnnotationForTouch:(unsigned int)a3 withUniqueIdentifier:(id)a4
{
  -[BKTouchAnnotationController _queue_annotateTouch:withString:uniqueIdentifier:fromPID:](self, "_queue_annotateTouch:withString:uniqueIdentifier:fromPID:", *(_QWORD *)&a3, &stru_1000F0F50, a4, 0xFFFFFFFFLL);
}

- (id)_stringByRemovingPrefix:(id)a3 fromString:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v5, "length");
  if (objc_msgSend(v6, "length") > v7 && objc_msgSend(v6, "hasPrefix:", v5))
    v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "substringFromIndex:", v7));
  else
    v8 = v6;
  v9 = v8;

  return v9;
}

- (id)_stringDescribingPID:(int)a3
{
  uint64_t v3;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  __CFString *v9;
  uint64_t v10;
  uint64_t v11;

  if (a3 >= 1)
  {
    v3 = *(_QWORD *)&a3;
    v5 = BSBundleIDForPID(*(_QWORD *)&a3, a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    if (objc_msgSend(v6, "length"))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKTouchAnnotationController _stringByRemovingPrefix:fromString:](self, "_stringByRemovingPrefix:fromString:", CFSTR("com.apple."), v6));
      v8 = objc_msgSend(v7, "stringByAppendingFormat:", CFSTR(" (%d)"), v3);
    }
    else
    {
      v10 = BSProcessNameForPID(v3);
      v7 = (void *)objc_claimAutoreleasedReturnValue(v10);
      if (!objc_msgSend(v7, "length"))
      {
        v11 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("pid %d"), v3));
        goto LABEL_8;
      }
      v8 = objc_msgSend(v7, "stringByAppendingFormat:", CFSTR(" (%d)"), v3);
    }
    v11 = objc_claimAutoreleasedReturnValue(v8);
LABEL_8:
    v9 = (__CFString *)v11;

    return v9;
  }
  v9 = &stru_1000F0F50;
  return v9;
}

- (id)_stringDescribingContextID:(unsigned int)a3 clientPort:(unsigned int)a4
{
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = *(_QWORD *)&a3;
  v6 = -[BKTouchAnnotationController _pidForClientPort:](self, "_pidForClientPort:", *(_QWORD *)&a4);
  if ((int)v6 < 1)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("ctx:%X"), v4));
  }
  else
  {
    v8 = v6;
    v9 = BSBundleIDForPID(v6, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKTouchAnnotationController _stringByRemovingPrefix:fromString:](self, "_stringByRemovingPrefix:fromString:", CFSTR("com.apple."), v10));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stringByAppendingFormat:", CFSTR(" (%d)"), v8));

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("ctx:%X -- %@"), v4, v12));
  }
  return v13;
}

- (int)_pidForClientPort:(unsigned int)a3
{
  uint64_t v3;
  uint64_t ClientConnectionManager;
  void *v5;
  void *v6;
  void *v7;
  int v8;

  v3 = *(_QWORD *)&a3;
  ClientConnectionManager = BKHIDEventRoutingGetClientConnectionManager(self, a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue(ClientConnectionManager);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "clientForTaskPort:", v3));
  v7 = v6;
  if (v6)
    v8 = objc_msgSend(v6, "pid");
  else
    v8 = -1;

  return v8;
}

- (id)_keyPathForTouchIdentifier:(unsigned int)a3
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("touch.%X"), *(_QWORD *)&a3);
}

- (void)_queue_setCenter:(CGPoint)a3 forTouchIdentifier:(unsigned int)a4
{
  double y;
  double x;
  void *v7;
  void *v8;
  void *v9;
  BKDisplayAnnotationContainedSubnodeRenderer *v10;
  id v11;

  y = a3.y;
  x = a3.x;
  v11 = (id)objc_claimAutoreleasedReturnValue(-[BKTouchAnnotationController _keyPathForTouchIdentifier:](self, "_keyPathForTouchIdentifier:", *(_QWORD *)&a4));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKDisplayAnnotationController annotationForKeyPath:](self->_displayAnnotationController, "annotationForKeyPath:"));
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[BKDisplayAnnotationLocation centerAtPoint:](BKDisplayAnnotationLocation, "centerAtPoint:", x, y));
    objc_msgSend(v7, "setLocation:", v8);
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[BKDisplayAnnotation annotationWithEllipseSize:](BKDisplayAnnotation, "annotationWithEllipseSize:", 64.0, 64.0));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[BKDisplayAnnotationLocation centerAtPoint:](BKDisplayAnnotationLocation, "centerAtPoint:", x, y));
    v10 = objc_alloc_init(BKDisplayAnnotationContainedSubnodeRenderer);
    objc_msgSend(v8, "setLocation:", v9);
    objc_msgSend(v8, "setRenderer:", v10);
    -[BKDisplayAnnotationController setAnnotation:forKeyPath:](self->_displayAnnotationController, "setAnnotation:forKeyPath:", v8, v11);

  }
}

- (void)_queue_touchWasHardCanceled:(unsigned int)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[BKTouchAnnotationController _keyPathForTouchIdentifier:](self, "_keyPathForTouchIdentifier:", *(_QWORD *)&a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKDisplayAnnotationController annotationForKeyPath:](self->_displayAnnotationController, "annotationForKeyPath:", v6));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[BKDisplayAnnotationStyle canceledStyle](BKDisplayAnnotationStyle, "canceledStyle"));
  objc_msgSend(v4, "setStyleModifier:", v5);

  -[BKDisplayAnnotationController removeAnnotationsForKeyPath:afterDelay:queue:](self->_displayAnnotationController, "removeAnnotationsForKeyPath:afterDelay:queue:", v6, self->_workQueue, 0.5);
}

- (void)_queue_touchWasSoftCanceled:(unsigned int)a3
{
  BKDisplayAnnotationController *displayAnnotationController;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  displayAnnotationController = self->_displayAnnotationController;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKTouchAnnotationController _keyPathForTouchIdentifier:](self, "_keyPathForTouchIdentifier:", *(_QWORD *)&a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingString:", CFSTR(".ctx")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKDisplayAnnotationController allAnnotationsForKeyPath:](displayAnnotationController, "allAnnotationsForKeyPath:", v5));

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[BKDisplayAnnotationStyle canceledStyle](BKDisplayAnnotationStyle, "canceledStyle", (_QWORD)v14));
        objc_msgSend(v12, "setStyleModifier:", v13);

        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

}

- (BKDisplayAnnotationController)displayAnnotationController
{
  return self->_displayAnnotationController;
}

- (void)setDisplayAnnotationController:(id)a3
{
  objc_storeStrong((id *)&self->_displayAnnotationController, a3);
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_displayAnnotationController, 0);
}

+ (id)workQueue
{
  if (qword_1001172F0 != -1)
    dispatch_once(&qword_1001172F0, &stru_1000EA948);
  return (id)qword_1001172E8;
}

@end
