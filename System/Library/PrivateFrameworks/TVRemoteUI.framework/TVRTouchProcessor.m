@implementation TVRTouchProcessor

+ (id)touchProcessorForDevice:(id)a3
{
  int v3;
  __objc2_class **v4;
  void *v5;
  id v6;

  v3 = objc_msgSend(a3, "supportsTouchEvents");
  v4 = off_24DE2B5C8;
  if (!v3)
    v4 = off_24DE2B5A0;
  v5 = (void *)objc_msgSend(objc_alloc(*v4), "_init");
  v6 = -[TVRTouchpadView _init]([TVRTouchpadView alloc], "_init");
  objc_msgSend(v6, "setTouchProcessor:", v5);
  objc_msgSend(v5, "setTouchpadView:", v6);

  return v5;
}

- (id)_init
{
  TVRTouchProcessor *v2;
  uint64_t v3;
  NSMapTable *touches;
  NSMutableSet *v5;
  NSMutableSet *activeButtonTypes;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TVRTouchProcessor;
  v2 = -[TVRTouchProcessor init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD1650], "strongToStrongObjectsMapTable");
    v3 = objc_claimAutoreleasedReturnValue();
    touches = v2->_touches;
    v2->_touches = (NSMapTable *)v3;

    v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    activeButtonTypes = v2->_activeButtonTypes;
    v2->_activeButtonTypes = v5;

  }
  return v2;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __objc2_class_ro **p_info;
  uint64_t i;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  __objc2_class_ro **v25;
  void *v26;
  TVRTouchProcessor *v27;
  uint64_t v28;
  id obj;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = v6;
  v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v31;
    v28 = *MEMORY[0x24BDBCB80];
    p_info = &OBJC_METACLASS___TVRApplication.info;
    v27 = self;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v31 != v10)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        -[TVRTouchProcessor touchpadView](self, "touchpadView", v27);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "preciseLocationInView:", v14);
        v16 = v15;
        v18 = v17;
        v19 = objc_alloc_init((Class)(p_info + 211));
        objc_msgSend(v19, "setInitialLocation:", v16, v18);
        objc_msgSend(v19, "setVirtualPhase:", 0);
        objc_msgSend(v7, "timestamp");
        objc_msgSend(v19, "setTimestamp:");
        objc_msgSend(v7, "timestamp");
        objc_msgSend(v19, "setPreviousTimestamp:");
        -[NSMapTable setObject:forKey:](self->_touches, "setObject:forKey:", v19, v13);
        if (-[TVRTouchProcessor _deviceSupportsMovableBoundingBox](self, "_deviceSupportsMovableBoundingBox"))
        {
          objc_msgSend(MEMORY[0x24BDBCF40], "timerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__touchTimerExpired_, v13, 0, 0.2);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDBCF18], "mainRunLoop");
          v21 = v14;
          v22 = v7;
          v23 = v9;
          v24 = v10;
          v25 = p_info;
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "addTimer:forMode:", v20, v28);

          p_info = v25;
          v10 = v24;
          v9 = v23;
          v7 = v22;
          v14 = v21;
          self = v27;

        }
        else
        {
          -[TVRTouchProcessor _beginTrackingTouch:withRelativeLocation:](self, "_beginTrackingTouch:withRelativeLocation:", v13, -[TVRTouchProcessor _defaultRelativeStartingLocation](self, "_defaultRelativeStartingLocation"));
        }
        -[TVRTouchProcessor _dispatchGameControllerEventForTouch:event:](self, "_dispatchGameControllerEventForTouch:event:", v13, v7);

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v9);
  }

}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  uint64_t *v8;
  uint64_t *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  _BOOL4 v30;
  _BOOL4 v31;
  void *v32;
  void *v33;
  double v34;
  uint64_t *v35;
  id v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t v43;
  char v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double MaxX;
  void *v55;
  void *v56;
  double v57;
  double v58;
  double v59;
  int64_t v60;
  TVRTouchProcessor *v61;
  void *v62;
  double v63;
  double MinX;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double MinY;
  double MaxY;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  CGFloat v82;
  CGFloat v83;
  CGFloat v84;
  CGFloat v85;
  double v86;
  void *v87;
  double v88;
  double v89;
  uint64_t v90;
  double v91;
  double v92;
  double v93;
  CGFloat v94;
  CGFloat v95;
  CGFloat v96;
  CGFloat v97;
  CGFloat v98;
  double v99;
  uint64_t v100;
  uint64_t v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  _BYTE v106[128];
  uint64_t v107;
  CGPoint v108;
  CGPoint v109;
  CGRect v110;
  CGRect v111;
  CGRect v112;
  CGRect v113;
  CGRect v114;
  CGRect v115;
  CGRect v116;
  CGRect v117;
  CGRect v118;
  CGRect v119;
  CGRect v120;
  CGRect v121;
  CGRect v122;
  CGRect v123;
  CGRect v124;
  CGRect v125;
  CGRect v126;

  v107 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v102 = 0u;
  v103 = 0u;
  v104 = 0u;
  v105 = 0u;
  v101 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v102, v106, 16);
  if (v101)
  {
    v8 = &OBJC_IVAR____TtC10TVRemoteUI11FMPFSKScene_experienceType;
    v9 = &OBJC_IVAR____TtC10TVRemoteUI11FMPFSKScene_experienceType;
    v100 = *(_QWORD *)v103;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v103 != v100)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v102 + 1) + 8 * v10);
        -[NSMapTable objectForKey:](self->_touches, "objectForKey:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "timestamp");
        objc_msgSend(v12, "setTimestamp:");
        objc_msgSend(v7, "timestamp");
        v14 = v13;
        objc_msgSend(v12, "previousTimestamp");
        v16 = v14 - v15;
        objc_msgSend(v11, "preciseLocationInView:", self->_touchpadView);
        v18 = v17;
        v20 = v19;
        objc_msgSend(v11, "precisePreviousLocationInView:", self->_touchpadView);
        v22 = v21;
        v24 = v23;
        v25 = hypot(v21 - v18, v23 - v20);
        objc_msgSend(v12, "initialLocation");
        v28 = hypot(v26 - v18, v27 - v20);
        v29 = v25 / v16;
        objc_msgSend(v12, "boundingBox");
        v108.x = v18;
        v108.y = v20;
        v30 = CGRectContainsPoint(v110, v108);
        objc_msgSend(v12, "boundingBox");
        v109.x = v22;
        v109.y = v24;
        v31 = CGRectContainsPoint(v111, v109);
        if (objc_msgSend(v12, "virtualPhase"))
        {
          if (objc_msgSend(v12, "virtualPhase") == 1 || objc_msgSend(v12, "virtualPhase") == 2)
          {
            if (v30 || !v31)
            {
              if (v30)
                goto LABEL_80;
LABEL_42:
              if (!-[TVRTouchProcessor _deviceSupportsMovableBoundingBox](self, "_deviceSupportsMovableBoundingBox"))
                goto LABEL_80;
              objc_msgSend(v12, "boundingBox");
              v98 = v45;
              v47 = v46;
              v49 = v48;
              -[TVRTouchpadView bounds](self->_touchpadView, "bounds");
              v95 = v51;
              v96 = v50;
              v94 = v52;
              v97 = v53;
              v92 = v49;
              v93 = v47;
              v91 = v18;
              if (!objc_msgSend(v12, "isLikelyLongListScrollingEdgeGesture"))
                goto LABEL_59;
              objc_msgSend(v12, "boundingBox");
              if (v18 <= CGRectGetMaxX(v112))
                goto LABEL_59;
              objc_msgSend(v12, "boundingBox");
              MaxX = CGRectGetMaxX(v113);
              if (_TVRCGetBoundingBoxExtraRightDistance_onceToken != -1)
                dispatch_once(&_TVRCGetBoundingBoxExtraRightDistance_onceToken, &__block_literal_global_266);
              if ((__hasCachedBoundingBoxExtraRightDistance & 1) == 0)
              {
                objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
                v55 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v55, "objectForKey:", CFSTR("BoundingBoxExtraRightDistance"));
                v56 = (void *)objc_claimAutoreleasedReturnValue();

                if (v56)
                  objc_msgSend(v56, "doubleValue");
                else
                  v57 = 0.25;
                __cachedBoundingBoxExtraRightDistance = *(_QWORD *)&v57;
                __hasCachedBoundingBoxExtraRightDistance = 1;

              }
              v63 = *(double *)&__cachedBoundingBoxExtraRightDistance;
              objc_msgSend(v12, "boundingBox", *(_QWORD *)&v18);
              if (v18 > MaxX + v63 * CGRectGetWidth(v114))
              {
LABEL_59:
                objc_msgSend(v12, "boundingBox", *(_QWORD *)&v91);
                MinX = CGRectGetMinX(v115);
                objc_msgSend(v12, "boundingBox");
                v65 = CGRectGetMaxX(v116);
                v117.origin.x = v96;
                v117.origin.y = v95;
                v117.size.width = v94;
                v117.size.height = v97;
                v99 = CGRectGetMinX(v117);
                v118.origin.x = v96;
                v118.origin.y = v95;
                v118.size.width = v94;
                v118.size.height = v97;
                v66 = CGRectGetMaxX(v118);
                v67 = v65 - MinX;
                v68 = MinX;
                if (v18 > v65)
                {
                  if (v65 + v67 <= v66)
                    v68 = MinX + v67;
                  else
                    v68 = v66 - v67;
                }
                v69 = MinX - v67;
                v70 = v68 - v67;
                if (v69 >= v99)
                  v71 = v70;
                else
                  v71 = v99;
                if (v18 >= MinX)
                  v71 = v68;
                v98 = v71;
              }
              objc_msgSend(v12, "boundingBox");
              MinY = CGRectGetMinY(v119);
              objc_msgSend(v12, "boundingBox");
              MaxY = CGRectGetMaxY(v120);
              v121.origin.x = v96;
              v121.origin.y = v95;
              v121.size.width = v94;
              v121.size.height = v97;
              v74 = CGRectGetMinY(v121);
              v122.origin.x = v96;
              v122.origin.y = v95;
              v122.size.width = v94;
              v122.size.height = v97;
              v75 = CGRectGetMaxY(v122);
              v76 = MaxY - MinY;
              v77 = MinY;
              if (v20 > MaxY)
              {
                if (MaxY + v76 <= v75)
                  v77 = MinY + v76;
                else
                  v77 = v75 - v76;
              }
              v78 = MinY - v76;
              v79 = v77 - v76;
              v80 = v78 >= v74 ? v79 : v74;
              v81 = v20 < MinY ? v80 : v77;
              objc_msgSend(v12, "boundingBox", v80);
              v126.origin.x = v82;
              v126.origin.y = v83;
              v126.size.width = v84;
              v126.size.height = v85;
              v86 = v98;
              v123.origin.x = v98;
              v123.origin.y = v81;
              v123.size.width = v93;
              v123.size.height = v92;
              if (CGRectEqualToRect(v123, v126))
              {
LABEL_80:
                v40 = 2;
                goto LABEL_81;
              }
              if (objc_msgSend(v12, "isLikelyLongListScrollingEdgeGesture"))
              {
                objc_msgSend(v12, "initialProportionalLocation");
                v89 = v88;
                v124.origin.x = v98;
                v124.origin.y = v81;
                v124.size.width = v93;
                v124.size.height = v92;
                v86 = v91 - CGRectGetWidth(v124) * v89;
                objc_msgSend(v12, "boundingBox");
                if (v91 < CGRectGetMinX(v125))
                  objc_msgSend(v12, "setIsLikelyLongListScrollingEdgeGesture:", 0);
              }
              objc_msgSend(v12, "setVirtualPhase:", 4);
              -[TVRTouchProcessor _deliverTouchToDelegate:info:](self, "_deliverTouchToDelegate:info:", v11, v12);
              objc_msgSend(v12, "setBoundingBox:", v86, v81, v93, v92);
              v87 = v12;
              v40 = 1;
LABEL_82:
              objc_msgSend(v87, "setVirtualPhase:", v40);
LABEL_83:
              -[TVRTouchProcessor _deliverTouchToDelegate:info:](self, "_deliverTouchToDelegate:info:", v11, v12);
              goto LABEL_84;
            }
            if (_TVRCGetBoundingBoxExitSpeed_onceToken != -1)
              dispatch_once(&_TVRCGetBoundingBoxExitSpeed_onceToken, &__block_literal_global_261);
            if ((__hasCachedBoundingBoxExitSpeed & 1) == 0)
            {
              v35 = v8;
              v36 = v6;
              objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "objectForKey:", CFSTR("BoundingBoxExitSpeed"));
              v38 = (void *)objc_claimAutoreleasedReturnValue();

              if (v38)
                objc_msgSend(v38, "doubleValue");
              else
                v39 = 0x408F400000000000;
              __cachedBoundingBoxExitSpeed = v39;
              __hasCachedBoundingBoxExitSpeed = 1;

              v6 = v36;
              v8 = v35;
              v9 = &OBJC_IVAR____TtC10TVRemoteUI11FMPFSKScene_experienceType;
            }
            v44 = v29 > *(double *)&__cachedBoundingBoxExitSpeed || v30;
            if (v29 <= *(double *)&__cachedBoundingBoxExitSpeed)
              v40 = 2;
            else
              v40 = 4;
            if ((v44 & 1) == 0)
              goto LABEL_42;
          }
          else
          {
            if (objc_msgSend(v12, "virtualPhase") != 4)
              goto LABEL_83;
            if (!v30 || v31)
              goto LABEL_84;
            v40 = 1;
          }
LABEL_81:
          v87 = v12;
          goto LABEL_82;
        }
        if (v8[186] != -1)
          dispatch_once(&_TVRCGetBoundingBoxThresholdDistance_onceToken, &__block_literal_global_3);
        if ((v9[187] & 1) == 0)
        {
          objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "objectForKey:", CFSTR("BoundingBoxThresholdDistance"));
          v33 = (void *)objc_claimAutoreleasedReturnValue();

          if (v33)
            objc_msgSend(v33, "doubleValue");
          else
            v34 = 20.0;
          __cachedBoundingBoxThresholdDistance = *(_QWORD *)&v34;
          *((_BYTE *)v9 + 1496) = 1;

        }
        if (v28 > *(double *)&__cachedBoundingBoxThresholdDistance)
        {
          if (_TVRCGetBoundingBoxThresholdSpeed_onceToken != -1)
            dispatch_once(&_TVRCGetBoundingBoxThresholdSpeed_onceToken, &__block_literal_global_256);
          if ((__hasCachedBoundingBoxThresholdSpeed & 1) == 0)
          {
            objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "objectForKey:", CFSTR("BoundingBoxThresholdSpeed"));
            v42 = (void *)objc_claimAutoreleasedReturnValue();

            if (v42)
              objc_msgSend(v42, "doubleValue");
            else
              v43 = 0x4069000000000000;
            __cachedBoundingBoxThresholdSpeed = v43;
            __hasCachedBoundingBoxThresholdSpeed = 1;

          }
          if (v29 <= *(double *)&__cachedBoundingBoxThresholdSpeed)
          {
            v61 = self;
            v62 = v11;
            v60 = 0;
          }
          else
          {
            objc_msgSend(v12, "initialLocation");
            v60 = -[TVRTouchProcessor _relativeTouchLocationForDistanceTraveled:](self, "_relativeTouchLocationForDistanceTraveled:", v18 - v58, v20 - v59);
            v61 = self;
            v62 = v11;
          }
          -[TVRTouchProcessor _beginTrackingTouch:withRelativeLocation:](v61, "_beginTrackingTouch:withRelativeLocation:", v62, v60);
        }
LABEL_84:
        -[TVRTouchProcessor _dispatchGameControllerEventForTouch:event:](self, "_dispatchGameControllerEventForTouch:event:", v11, v7);
        objc_msgSend(v7, "timestamp");
        objc_msgSend(v12, "setPreviousTimestamp:");

        ++v10;
      }
      while (v101 != v10);
      v90 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v102, v106, 16);
      v101 = v90;
    }
    while (v90);
  }

}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v6);
        v12 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        -[NSMapTable objectForKey:](self->_touches, "objectForKey:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "pendingCancellation"))
          v14 = 5;
        else
          v14 = 4;
        if (objc_msgSend(v13, "virtualPhase")
          && objc_msgSend(v13, "virtualPhase") != 4
          && objc_msgSend(v13, "virtualPhase") != 5)
        {
          objc_msgSend(v13, "setVirtualPhase:", v14);
          -[TVRTouchProcessor _deliverTouchToDelegate:info:](self, "_deliverTouchToDelegate:info:", v12, v13);
        }
        -[NSMapTable removeObjectForKey:](self->_touches, "removeObjectForKey:", v12);
        -[TVRTouchProcessor _dispatchGameControllerEventForTouch:event:](self, "_dispatchGameControllerEventForTouch:event:", v12, v7);

      }
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }
  if (!-[NSMapTable count](self->_touches, "count"))
    -[TVRTouchProcessor reset](self, "reset");

}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v6);
        v12 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        -[NSMapTable objectForKey:](self->_touches, "objectForKey:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "virtualPhase")
          && objc_msgSend(v13, "virtualPhase") != 4
          && objc_msgSend(v13, "virtualPhase") != 5)
        {
          objc_msgSend(v13, "setVirtualPhase:", 5);
          -[TVRTouchProcessor _deliverTouchToDelegate:info:](self, "_deliverTouchToDelegate:info:", v12, v13);
        }
        -[NSMapTable removeObjectForKey:](self->_touches, "removeObjectForKey:", v12);
        -[TVRTouchProcessor _dispatchGameControllerEventForTouch:event:](self, "_dispatchGameControllerEventForTouch:event:", v12, v7);

      }
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }
  if (!-[NSMapTable count](self->_touches, "count"))
    -[TVRTouchProcessor reset](self, "reset");

}

- (void)markCurrentTouchToBeCancelled
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[NSMapTable keyEnumerator](self->_touches, "keyEnumerator", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v7);
        -[NSMapTable objectForKey:](self->_touches, "objectForKey:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "virtualPhase") == 1
          || objc_msgSend(v9, "virtualPhase") == 3
          || objc_msgSend(v9, "virtualPhase") == 2)
        {
          objc_msgSend(v9, "setVirtualPhase:", 5);
          -[TVRTouchProcessor _deliverTouchToDelegate:info:](self, "_deliverTouchToDelegate:info:", v8, v9);
        }
        else
        {
          objc_msgSend(v9, "setPendingCancellation:", 1);
        }

        ++v7;
      }
      while (v5 != v7);
      v10 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      v5 = v10;
    }
    while (v10);
  }

}

- (void)sendPressBegan:(int64_t)a3
{
  NSMutableSet *activeButtonTypes;
  void *v6;
  NSMutableSet *v7;
  void *v8;
  id WeakRetained;
  char v10;
  void *v11;
  id v12;
  id v13;

  activeButtonTypes = self->_activeButtonTypes;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(activeButtonTypes) = -[NSMutableSet containsObject:](activeButtonTypes, "containsObject:", v6);

  if ((activeButtonTypes & 1) == 0)
  {
    v7 = self->_activeButtonTypes;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableSet addObject:](v7, "addObject:", v8);

    if (a3 == 1)
      -[TVRTouchProcessor _beginTrackingAnyTouchIfNeeded](self, "_beginTrackingAnyTouchIfNeeded");
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
    {
      v13 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BEB4068]), "_initWithButtonType:", a3);
      objc_msgSend(MEMORY[0x24BEB4070], "buttonEventForButton:eventType:", v13, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v12, "touchProcessor:generatedButtonEvent:", self, v11);

    }
  }
}

- (void)sendPressEnded:(int64_t)a3
{
  NSMutableSet *activeButtonTypes;
  void *v6;
  NSMutableSet *v7;
  void *v8;
  id WeakRetained;
  char v10;
  void *v11;
  id v12;
  id v13;

  activeButtonTypes = self->_activeButtonTypes;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(activeButtonTypes) = -[NSMutableSet containsObject:](activeButtonTypes, "containsObject:", v6);

  if ((_DWORD)activeButtonTypes)
  {
    v7 = self->_activeButtonTypes;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableSet removeObject:](v7, "removeObject:", v8);

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
    {
      v13 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BEB4068]), "_initWithButtonType:", a3);
      objc_msgSend(MEMORY[0x24BEB4070], "buttonEventForButton:eventType:", v13, 2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v12, "touchProcessor:generatedButtonEvent:", self, v11);

    }
  }
}

- (void)reset
{
  NSMutableSet *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id WeakRetained;
  char v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v3 = self->_activeButtonTypes;
  v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v16;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v7);
        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        v10 = objc_opt_respondsToSelector();

        if ((v10 & 1) != 0)
        {
          v11 = objc_alloc(MEMORY[0x24BEB4068]);
          v12 = (void *)objc_msgSend(v11, "_initWithButtonType:", objc_msgSend(v8, "integerValue", (_QWORD)v15));
          objc_msgSend(MEMORY[0x24BEB4070], "buttonEventForButton:eventType:", v12, 2);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_loadWeakRetained((id *)&self->_delegate);
          objc_msgSend(v14, "touchProcessor:generatedButtonEvent:", self, v13);

        }
        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v5);
  }

  -[NSMutableSet removeAllObjects](self->_activeButtonTypes, "removeAllObjects");
}

- (void)_touchTimerExpired:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a3, "userInfo");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMapTable objectForKey:](self->_touches, "objectForKey:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 && !objc_msgSend(v4, "virtualPhase"))
    -[TVRTouchProcessor _beginTrackingTouch:withRelativeLocation:](self, "_beginTrackingTouch:withRelativeLocation:", v6, -[TVRTouchProcessor _defaultRelativeStartingLocation](self, "_defaultRelativeStartingLocation"));

}

- (void)_beginTrackingAnyTouchIfNeeded
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[NSMapTable objectEnumerator](self->_touches, "objectEnumerator", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (!v4)
  {

LABEL_11:
    if (-[NSMapTable count](self->_touches, "count"))
    {
      -[NSMapTable keyEnumerator](self->_touches, "keyEnumerator");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "nextObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      -[TVRTouchProcessor _beginTrackingTouch:withRelativeLocation:](self, "_beginTrackingTouch:withRelativeLocation:", v10, -[TVRTouchProcessor _defaultRelativeStartingLocation](self, "_defaultRelativeStartingLocation"));
    }
    return;
  }
  v5 = v4;
  v6 = 0;
  v7 = *(_QWORD *)v12;
  do
  {
    for (i = 0; i != v5; ++i)
    {
      if (*(_QWORD *)v12 != v7)
        objc_enumerationMutation(v3);
      v6 |= objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "virtualPhase") != 0;
    }
    v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  }
  while (v5);

  if ((v6 & 1) == 0)
    goto LABEL_11;
}

- (int64_t)_defaultRelativeStartingLocation
{
  if (-[TVRTouchProcessor _deviceSupportsMovableBoundingBox](self, "_deviceSupportsMovableBoundingBox"))
    return 5;
  else
    return 0;
}

- (int64_t)_relativeTouchLocationForDistanceTraveled:(CGPoint)a3
{
  double v3;
  double v4;
  int64_t v5;
  int64_t v6;

  v3 = fabs(a3.x);
  v4 = fabs(a3.y);
  v5 = 4;
  if (a3.x > 0.0)
    v5 = 3;
  v6 = 2;
  if (a3.y > 0.0)
    v6 = 1;
  if (v3 <= v4)
    return v6;
  else
    return v5;
}

- (BOOL)_deviceSupportsMovableBoundingBox
{
  void *v2;
  BOOL v3;

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom") == 1;

  return v3;
}

- (void)_beginTrackingTouch:(id)a3 withRelativeLocation:(int64_t)a4
{
  NSMapTable *touches;
  id v7;
  double v8;
  double v9;
  _BOOL8 v11;
  id v12;

  touches = self->_touches;
  v7 = a3;
  -[NSMapTable objectForKey:](touches, "objectForKey:", v7);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[TVRTouchProcessor _boundingBoxForTouch:relativeStartLocation:](self, "_boundingBoxForTouch:relativeStartLocation:", v7, a4);
  objc_msgSend(v12, "setBoundingBox:");
  objc_msgSend(v12, "setVirtualPhase:", 1);
  -[TVRTouchProcessor _virtualTouchLocationForTouch:](self, "_virtualTouchLocationForTouch:", v7);
  v9 = v8;
  objc_msgSend(v12, "setInitialProportionalLocation:");
  v11 = v9 >= 0.9 && (unint64_t)(a4 - 5) < 0xFFFFFFFFFFFFFFFELL;
  objc_msgSend(v12, "setIsLikelyLongListScrollingEdgeGesture:", v11);
  -[TVRTouchProcessor _deliverTouchToDelegate:info:](self, "_deliverTouchToDelegate:info:", v7, v12);

}

- (void)_deliverTouchToDelegate:(id)a3 info:(id)a4
{
  id v6;
  id WeakRetained;
  char v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;
  double v14;
  void *v15;
  id v16;
  id v17;

  v17 = a3;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[TVRTouchProcessor _virtualTouchLocationForTouch:](self, "_virtualTouchLocationForTouch:", v17);
    v10 = v9;
    v12 = v11;
    v13 = objc_alloc(MEMORY[0x24BEB40D8]);
    objc_msgSend(v6, "timestamp");
    v15 = (void *)objc_msgSend(v13, "_initWithTimestamp:finger:phase:digitizerLocation:", 1, objc_msgSend(v6, "virtualPhase"), v14, v10, v12);
    v16 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v16, "touchProcessor:generatedTouchEvent:", self, v15);

  }
}

- (CGRect)_boundingBoxForTouch:(id)a3 relativeStartLocation:(int64_t)a4
{
  TVRTouchpadView *touchpadView;
  id v7;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v12;
  double v13;
  double v14;
  double v15;
  double MinX;
  double v17;
  double v18;
  double MinY;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
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
  double MaxX;
  double v38;
  double v39;
  double v40;
  double MaxY;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double MidY;
  double MidX;
  double v52;
  CGFloat v53;
  double rect;
  double recta;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;
  CGRect result;

  touchpadView = self->_touchpadView;
  v7 = a3;
  -[TVRTouchpadView bounds](touchpadView, "bounds");
  x = v56.origin.x;
  y = v56.origin.y;
  width = v56.size.width;
  height = v56.size.height;
  MidX = CGRectGetMidX(v56);
  v57.origin.x = x;
  v57.origin.y = y;
  v57.size.width = width;
  v57.size.height = height;
  MidY = CGRectGetMidY(v57);
  objc_msgSend(v7, "preciseLocationInView:", self->_touchpadView);
  v13 = v12;
  v15 = v14;

  v58.origin.x = x;
  v58.origin.y = y;
  v58.size.width = width;
  v58.size.height = height;
  MinX = CGRectGetMinX(v58);
  v59.origin.x = x;
  v59.origin.y = y;
  v59.size.width = width;
  v59.size.height = height;
  v52 = v13;
  v17 = (v13 - MinX) / (CGRectGetMaxX(v59) - MinX);
  if (v17 >= 0.0)
    v18 = v17;
  else
    v18 = 0.0;
  v60.origin.x = x;
  v60.origin.y = y;
  v60.size.width = width;
  v60.size.height = height;
  MinY = CGRectGetMinY(v60);
  v61.origin.x = x;
  v61.origin.y = y;
  v61.size.width = width;
  v61.size.height = height;
  rect = v15;
  v20 = (v15 - MinY) / (CGRectGetMaxY(v61) - MinY);
  if (v20 >= 0.0)
    v21 = v20;
  else
    v21 = 0.0;
  if (_TVRCGetTouchCenteringWeight_onceToken != -1)
    dispatch_once(&_TVRCGetTouchCenteringWeight_onceToken, &__block_literal_global_271);
  v53 = x;
  v22 = fmin(v18, 1.0);
  v49 = fmin(v21, 1.0);
  if ((__hasCachedTouchCenteringWeight & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "objectForKey:", CFSTR("TouchCenteringWeight"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
      objc_msgSend(v24, "doubleValue");
    else
      v25 = -1.0;
    __cachedTouchCenteringWeight = *(_QWORD *)&v25;
    __hasCachedTouchCenteringWeight = 1;

  }
  v26 = *(double *)&__cachedTouchCenteringWeight;
  v27 = hypot(v52 - MidX, v15 - MidY);
  v62.origin.x = v53;
  v62.origin.y = y;
  v62.size.width = width;
  v62.size.height = height;
  v28 = CGRectGetWidth(v62);
  v63.origin.x = v53;
  v63.origin.y = y;
  v63.size.width = width;
  v63.size.height = height;
  v29 = CGRectGetHeight(v63);
  if (v28 < v29)
    v29 = v28;
  v30 = v27 / (v29 * 0.5);
  if (v30 < 0.0)
    v30 = 0.0;
  v31 = v26 + (0.0 - v26) * fmin(v30, 1.0);
  v32 = v22 + (0.5 - v22) * v31;
  v33 = v49 + (0.5 - v49) * v31;
  switch(a4)
  {
    case 1:
      v33 = 0.0;
      break;
    case 2:
      v33 = 1.0;
      break;
    case 3:
      v32 = 0.0;
      break;
    case 4:
      v32 = 1.0;
      break;
    case 5:
      v32 = 0.5;
      v33 = 0.5;
      break;
    default:
      break;
  }
  if (_TVRCPointSizeOfSiriRemoteOnMainScreen_onceToken != -1)
    dispatch_once(&_TVRCPointSizeOfSiriRemoteOnMainScreen_onceToken, &__block_literal_global_276);
  v34 = v52 - *(double *)&_TVRCPointSizeOfSiriRemoteOnMainScreen_size_0 * v32;
  v35 = rect - *(double *)&_TVRCPointSizeOfSiriRemoteOnMainScreen_size_1 * v33;
  v64.size.width = v52 + *(double *)&_TVRCPointSizeOfSiriRemoteOnMainScreen_size_0 * (1.0 - v32) - v34;
  v36 = rect + *(double *)&_TVRCPointSizeOfSiriRemoteOnMainScreen_size_1 * (1.0 - v33) - v35;
  v64.origin.x = v34;
  v64.origin.y = v35;
  recta = v64.size.width;
  v64.size.height = v36;
  MaxX = CGRectGetMaxX(v64);
  v65.origin.x = v53;
  v65.origin.y = y;
  v65.size.width = width;
  v65.size.height = height;
  if (MaxX <= CGRectGetMaxX(v65))
  {
    v68.origin.x = v53;
    v68.origin.y = y;
    v68.size.width = width;
    v68.size.height = height;
    v39 = CGRectGetMinX(v68);
    v69.origin.x = v34;
    v69.origin.y = v35;
    v69.size.width = recta;
    v69.size.height = v36;
    if (v39 > CGRectGetMinX(v69))
    {
      v70.origin.x = v53;
      v70.origin.y = y;
      v70.size.width = width;
      v70.size.height = height;
      v40 = CGRectGetMinX(v70);
      v71.origin.x = v34;
      v71.origin.y = v35;
      v71.size.width = recta;
      v71.size.height = v36;
      v34 = v34 + v40 - CGRectGetMinX(v71);
    }
  }
  else
  {
    v66.origin.x = v34;
    v66.origin.y = v35;
    v66.size.width = recta;
    v66.size.height = v36;
    v38 = CGRectGetMaxX(v66);
    v67.origin.x = v53;
    v67.origin.y = y;
    v67.size.width = width;
    v67.size.height = height;
    v34 = v34 - (v38 - CGRectGetMaxX(v67));
  }
  v72.origin.x = v34;
  v72.origin.y = v35;
  v72.size.width = recta;
  v72.size.height = v36;
  MaxY = CGRectGetMaxY(v72);
  v73.origin.x = v53;
  v73.origin.y = y;
  v73.size.width = width;
  v73.size.height = height;
  if (MaxY <= CGRectGetMaxY(v73))
  {
    v76.origin.x = v53;
    v76.origin.y = y;
    v76.size.width = width;
    v76.size.height = height;
    v43 = CGRectGetMinY(v76);
    v77.origin.x = v34;
    v77.origin.y = v35;
    v77.size.width = recta;
    v77.size.height = v36;
    if (v43 > CGRectGetMinY(v77))
    {
      v78.origin.x = v53;
      v78.origin.y = y;
      v78.size.width = width;
      v78.size.height = height;
      v44 = CGRectGetMinY(v78);
      v79.origin.x = v34;
      v79.origin.y = v35;
      v79.size.width = recta;
      v79.size.height = v36;
      v35 = v35 + v44 - CGRectGetMinY(v79);
    }
  }
  else
  {
    v74.origin.x = v34;
    v74.origin.y = v35;
    v74.size.width = recta;
    v74.size.height = v36;
    v42 = CGRectGetMaxY(v74);
    v75.origin.x = v53;
    v75.origin.y = y;
    v75.size.width = width;
    v75.size.height = height;
    v35 = v35 - (v42 - CGRectGetMaxY(v75));
  }
  v45 = v34;
  v46 = v35;
  v47 = recta;
  v48 = v36;
  result.size.height = v48;
  result.size.width = v47;
  result.origin.y = v46;
  result.origin.x = v45;
  return result;
}

- (CGPoint)_virtualTouchLocationForTouch:(id)a3
{
  NSMapTable *touches;
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MinX;
  double v16;
  double v17;
  double v18;
  double MinY;
  double v20;
  double v21;
  double v22;
  double v23;
  CGPoint result;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;

  touches = self->_touches;
  v5 = a3;
  -[NSMapTable objectForKey:](touches, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRTouchProcessor touchpadView](self, "touchpadView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preciseLocationInView:", v7);
  v9 = v8;
  v23 = v10;

  objc_msgSend(v6, "boundingBox");
  x = v25.origin.x;
  y = v25.origin.y;
  width = v25.size.width;
  height = v25.size.height;
  MinX = CGRectGetMinX(v25);
  v26.origin.x = x;
  v26.origin.y = y;
  v26.size.width = width;
  v26.size.height = height;
  v16 = (v9 - MinX) / (CGRectGetMaxX(v26) - MinX);
  if (v16 < 0.0)
    v16 = 0.0;
  v17 = 1.0;
  if (v16 >= 1.0)
    v18 = 1.0;
  else
    v18 = v16 + 0.0;
  v27.origin.x = x;
  v27.origin.y = y;
  v27.size.width = width;
  v27.size.height = height;
  MinY = CGRectGetMinY(v27);
  v28.origin.x = x;
  v28.origin.y = y;
  v28.size.width = width;
  v28.size.height = height;
  v20 = (v23 - MinY) / (CGRectGetMaxY(v28) - MinY);
  if (v20 < 0.0)
    v20 = 0.0;
  if (v20 < 1.0)
    v17 = v20 + 0.0;

  v21 = v18;
  v22 = v17;
  result.y = v22;
  result.x = v21;
  return result;
}

- (void)_dispatchGameControllerEventForTouch:(id)a3 event:(id)a4
{
  id v6;
  id v7;
  id v8;
  char v9;
  double v10;
  double v11;
  double v12;
  double v13;
  float MidX;
  double v15;
  float MidY;
  double v17;
  float v18;
  _BOOL8 v19;
  id v20;
  void *v21;
  id v22;
  id to;
  CGRect v24;
  CGRect v25;

  v6 = a3;
  v7 = a4;
  objc_copyWeak(&to, (id *)&self->_delegate);
  v8 = objc_loadWeakRetained(&to);
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    objc_msgSend(v6, "preciseLocationInView:", self->_touchpadView);
    v11 = v10;
    v13 = v12;
    -[TVRTouchpadView bounds](self->_touchpadView, "bounds");
    MidX = CGRectGetMidX(v24);
    v15 = _TVRCGameControllerNormalizedDigitizerValue(MidX, v11);
    -[TVRTouchpadView bounds](self->_touchpadView, "bounds");
    *(float *)&v15 = v15;
    MidY = CGRectGetMidY(v25);
    v17 = _TVRCGameControllerNormalizedDigitizerValue(MidY, v13);
    if (__fpclassifyf(*(float *)&v15) != 3 || (v18 = v17, __fpclassifyf(-v18) != 3))
    {
      v19 = objc_msgSend(v6, "phase") != 3 && objc_msgSend(v6, "phase") != 4;
      v20 = objc_alloc(MEMORY[0x24BEB4098]);
      objc_msgSend(v7, "timestamp");
      v21 = (void *)objc_msgSend(v20, "_initWithTimestamp:isDown:joystickLocation:", v19);
      v22 = objc_loadWeakRetained(&to);
      objc_msgSend(v22, "touchProcessor:generatedGameControllerEvent:", self, v21);

    }
  }
  objc_destroyWeak(&to);

}

- (TVRTouchProcessorDelegate)delegate
{
  return (TVRTouchProcessorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (TVRTouchpadView)touchpadView
{
  return self->_touchpadView;
}

- (void)setTouchpadView:(id)a3
{
  objc_storeStrong((id *)&self->_touchpadView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_touchpadView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_touches, 0);
  objc_storeStrong((id *)&self->_activeButtonTypes, 0);
}

@end
