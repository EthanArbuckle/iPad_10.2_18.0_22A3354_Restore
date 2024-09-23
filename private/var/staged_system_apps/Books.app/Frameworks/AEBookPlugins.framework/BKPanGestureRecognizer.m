@implementation BKPanGestureRecognizer

- (void)dealloc
{
  UITouch *trackingTouch;
  objc_super v4;

  trackingTouch = self->_trackingTouch;
  self->_trackingTouch = 0;

  v4.receiver = self;
  v4.super_class = (Class)BKPanGestureRecognizer;
  -[BKPanGestureRecognizer dealloc](&v4, "dealloc");
}

- (BKPanGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  BKPanGestureRecognizer *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BKPanGestureRecognizer;
  result = -[BKPanGestureRecognizer initWithTarget:action:](&v5, "initWithTarget:action:", a3, a4);
  if (result)
  {
    result->_rightSideMovementThreshold = 20.0;
    result->_leftSideMovementThreshold = 20.0;
  }
  return result;
}

- (void)reset
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BKPanGestureRecognizer;
  -[BKPanGestureRecognizer reset](&v6, "reset");
  -[BKPanGestureRecognizer setTrackingTouch:](self, "setTrackingTouch:", 0);
  v3 = _AEPanGRLog();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Reseting pan gesture", v5, 2u);
  }

}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  id v25;
  objc_super v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[16];
  _BYTE v32[128];

  v6 = a3;
  v7 = a4;
  v8 = _AEPanGRLog();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "touches began event", buf, 2u);
  }

  if (!-[BKPanGestureRecognizer state](self, "state"))
    -[BKPanGestureRecognizer setTrackingTouch:](self, "setTrackingTouch:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKPanGestureRecognizer trackingTouch](self, "trackingTouch"));

  if (v10)
  {
    v11 = _AEPanGRLog();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "tracking touch -- ignoring new touches", buf, 2u);
    }

  }
  else
  {
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v25 = v6;
    v13 = v6;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(_QWORD *)v28 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "window"));
          objc_msgSend(v18, "locationInView:", 0);
          objc_msgSend(v19, "convertPoint:toWindow:", 0);
          v21 = v20;
          v23 = v22;

          v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", v21, v23));
          objc_setAssociatedObject(v18, &unk_1732B7, v24, (char *)&dword_0 + 1);

        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      }
      while (v15);
    }

    v26.receiver = self;
    v26.super_class = (Class)BKPanGestureRecognizer;
    -[BKPanGestureRecognizer touchesBegan:withEvent:](&v26, "touchesBegan:withEvent:", v13, v7);
    v6 = v25;
  }

}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  double v18;
  void *i;
  void *v20;
  id AssociatedObject;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  double Width;
  void *v36;
  double v37;
  double v38;
  int *v39;
  double v40;
  id v41;
  NSObject *v42;
  id v43;
  NSObject *v44;
  NSString *v45;
  void *v46;
  void *v47;
  NSString *v48;
  void *v49;
  id v50;
  NSObject *v51;
  id v52;
  NSString *v53;
  void *v54;
  NSString *v55;
  void *v56;
  void *v57;
  id v58;
  id v59;
  void *v60;
  void *v61;
  id v62;
  NSObject *v63;
  void *v64;
  id v65;
  id v66;
  NSObject *v67;
  void *v68;
  void *v69;
  id v70;
  id v71;
  id v72;
  BKPanGestureRecognizer *v73;
  objc_super v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  uint8_t buf[4];
  double v80;
  __int16 v81;
  double v82;
  _BYTE v83[128];
  CGPoint v84;
  CGPoint v85;
  CGPoint v86;
  CGPoint v87;
  CGRect v88;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKPanGestureRecognizer trackingTouch](self, "trackingTouch"));

  if (v8)
    goto LABEL_2;
  v77 = 0u;
  v78 = 0u;
  v75 = 0u;
  v76 = 0u;
  v14 = v6;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v75, v83, 16);
  if (!v15)
  {

LABEL_2:
    v9 = v6;
    goto LABEL_3;
  }
  v16 = v15;
  v70 = v7;
  v71 = v6;
  v11 = 0;
  v17 = *(_QWORD *)v76;
  v18 = 0.0;
  v72 = v14;
  v73 = self;
  do
  {
    for (i = 0; i != v16; i = (char *)i + 1)
    {
      if (*(_QWORD *)v76 != v17)
        objc_enumerationMutation(v14);
      v20 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * (_QWORD)i);
      AssociatedObject = objc_getAssociatedObject(v20, &unk_1732B7);
      v22 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
      v23 = v22;
      if (v22)
      {
        objc_msgSend(v22, "CGPointValue");
        v25 = v24;
        v27 = v26;
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "window"));
        objc_msgSend(v20, "locationInView:", 0);
        objc_msgSend(v28, "convertPoint:fromWindow:", 0);
        v30 = v29;
        v32 = v31;

        v33 = vabdd_f64(v30, v25);
        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "window"));
        objc_msgSend(v34, "bounds");
        Width = CGRectGetWidth(v88);

        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "view"));
        objc_msgSend(v20, "locationInView:", v36);
        v38 = v37;

        v39 = &OBJC_IVAR___BKPanGestureRecognizer__rightSideMovementThreshold;
        if (v38 < Width * 0.5)
          v39 = &OBJC_IVAR___BKPanGestureRecognizer__leftSideMovementThreshold;
        v40 = *(double *)((char *)&self->super.super.super.isa + *v39);
        if (v33 <= v40)
        {
          v33 = vabdd_f64(v32, v27);
          if (v33 <= v40)
            goto LABEL_25;
          v50 = _AEPanGRLog();
          v51 = objc_claimAutoreleasedReturnValue(v50);
          if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134218240;
            v80 = v33;
            v81 = 2048;
            v82 = v40;
            _os_log_impl(&dword_0, v51, OS_LOG_TYPE_DEFAULT, "enough movement in a touch %f > %f", buf, 0x16u);
          }

          v52 = _AEPanGRLog();
          v44 = objc_claimAutoreleasedReturnValue(v52);
          if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
          {
            v86.x = v25;
            v86.y = v27;
            v53 = NSStringFromCGPoint(v86);
            v54 = (void *)objc_claimAutoreleasedReturnValue(v53);
            v87.x = v30;
            v87.y = v32;
            v55 = NSStringFromCGPoint(v87);
            v56 = v11;
            v57 = (void *)objc_claimAutoreleasedReturnValue(v55);
            *(_DWORD *)buf = 138412546;
            v80 = *(double *)&v54;
            v81 = 2112;
            v82 = *(double *)&v57;
            _os_log_impl(&dword_0, v44, OS_LOG_TYPE_DEFAULT, "start %@ moved %@", buf, 0x16u);

            v11 = v56;
            v14 = v72;

            self = v73;
          }
        }
        else
        {
          v41 = _AEPanGRLog();
          v42 = objc_claimAutoreleasedReturnValue(v41);
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134218240;
            v80 = v33;
            v81 = 2048;
            v82 = v40;
            _os_log_impl(&dword_0, v42, OS_LOG_TYPE_DEFAULT, "enough movement in a touch %f > %f", buf, 0x16u);
          }

          v43 = _AEPanGRLog();
          v44 = objc_claimAutoreleasedReturnValue(v43);
          if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
          {
            v84.x = v25;
            v84.y = v27;
            v45 = NSStringFromCGPoint(v84);
            v46 = v11;
            v47 = (void *)objc_claimAutoreleasedReturnValue(v45);
            v85.x = v30;
            v85.y = v32;
            v48 = NSStringFromCGPoint(v85);
            v49 = (void *)objc_claimAutoreleasedReturnValue(v48);
            *(_DWORD *)buf = 138412546;
            v80 = *(double *)&v47;
            v81 = 2112;
            v82 = *(double *)&v49;
            _os_log_impl(&dword_0, v44, OS_LOG_TYPE_DEFAULT, "start %@ moved %@", buf, 0x16u);

            self = v73;
            v11 = v46;
            v14 = v72;
          }
        }

        if (v33 > v18)
        {
          v58 = v20;

          v18 = v33;
          v11 = v58;
        }
      }
LABEL_25:

    }
    v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v75, v83, 16);
  }
  while (v16);

  v59 = v14;
  v6 = v71;
  if (!v11)
  {
LABEL_3:
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKPanGestureRecognizer trackingTouch](self, "trackingTouch", v70, v71));

    v11 = 0;
    v12 = 0;
    v13 = v6;
    if (v10)
      goto LABEL_37;
    goto LABEL_38;
  }
  v60 = v59;
  v61 = (void *)objc_claimAutoreleasedReturnValue(-[BKPanGestureRecognizer trackingTouch](self, "trackingTouch"));

  if (!v61)
  {
    v62 = _AEPanGRLog();
    v63 = objc_claimAutoreleasedReturnValue(v62);
    if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v80 = *(double *)&v11;
      _os_log_impl(&dword_0, v63, OS_LOG_TYPE_DEFAULT, "Now tracking touch %@", buf, 0xCu);
    }

    -[BKPanGestureRecognizer setTrackingTouch:](self, "setTrackingTouch:", v11);
  }
  -[BKPanGestureRecognizer setState:](self, "setState:", 1, v7, v71);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v11));

  v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allTouches"));
  v65 = objc_msgSend(v64, "mutableCopy");

  objc_msgSend(v65, "removeObject:", v11);
  if (objc_msgSend(v65, "count"))
  {
    v66 = _AEPanGRLog();
    v67 = objc_claimAutoreleasedReturnValue(v66);
    if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v80 = *(double *)&v65;
      v81 = 2112;
      v82 = *(double *)&v11;
      _os_log_impl(&dword_0, v67, OS_LOG_TYPE_DEFAULT, "Ending touches %@. Tracking %@", buf, 0x16u);
    }

    -[BKPanGestureRecognizer touchesEnded:withEvent:](self, "touchesEnded:withEvent:", v65, v7);
  }

LABEL_37:
  v74.receiver = self;
  v74.super_class = (Class)BKPanGestureRecognizer;
  -[BKPanGestureRecognizer touchesMoved:withEvent:](&v74, "touchesMoved:withEvent:", v13, v7);
  v12 = v11;
LABEL_38:
  v68 = (void *)objc_claimAutoreleasedReturnValue(-[BKPanGestureRecognizer trackingTouch](self, "trackingTouch"));
  if (v68)
  {

  }
  else if ((uint64_t)-[BKPanGestureRecognizer state](self, "state") >= 1)
  {
    -[BKPanGestureRecognizer setTrackingTouch:](self, "setTrackingTouch:", v12);
  }
  v69 = (void *)objc_claimAutoreleasedReturnValue(-[BKPanGestureRecognizer trackingTouch](self, "trackingTouch"));

  if (v69 && -[BKPanGestureRecognizer numberOfTouches](self, "numberOfTouches"))
  {
    -[BKPanGestureRecognizer locationOfTouch:inView:](self, "locationOfTouch:inView:", 0, 0);
    -[BKPanGestureRecognizer setLastLocation:](self, "setLastLocation:");
  }

}

- (CGPoint)locationInView:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGPoint result;

  v4 = a3;
  -[BKPanGestureRecognizer lastLocation](self, "lastLocation");
  objc_msgSend(v4, "convertPoint:fromView:", 0);
  v6 = v5;
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.y = v10;
  result.x = v9;
  return result;
}

- (CGPoint)startLocationInView:(id)a3
{
  id v4;
  void *v5;
  id AssociatedObject;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGPoint result;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKPanGestureRecognizer trackingTouch](self, "trackingTouch"));
  AssociatedObject = objc_getAssociatedObject(v5, &unk_1732B7);
  v7 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);

  objc_msgSend(v7, "CGPointValue");
  objc_msgSend(v4, "convertPoint:fromView:", 0);
  v9 = v8;
  v11 = v10;

  v12 = v9;
  v13 = v11;
  result.y = v13;
  result.x = v12;
  return result;
}

- (void)cancelRecognizing
{
  -[BKPanGestureRecognizer setState:](self, "setState:", 4);
}

- (double)leftSideMovementThreshold
{
  return self->_leftSideMovementThreshold;
}

- (void)setLeftSideMovementThreshold:(double)a3
{
  self->_leftSideMovementThreshold = a3;
}

- (double)rightSideMovementThreshold
{
  return self->_rightSideMovementThreshold;
}

- (void)setRightSideMovementThreshold:(double)a3
{
  self->_rightSideMovementThreshold = a3;
}

- (UITouch)trackingTouch
{
  return self->_trackingTouch;
}

- (void)setTrackingTouch:(id)a3
{
  objc_storeStrong((id *)&self->_trackingTouch, a3);
}

- (CGPoint)lastLocation
{
  double x;
  double y;
  CGPoint result;

  x = self->lastLocation.x;
  y = self->lastLocation.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setLastLocation:(CGPoint)a3
{
  self->lastLocation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackingTouch, 0);
}

@end
