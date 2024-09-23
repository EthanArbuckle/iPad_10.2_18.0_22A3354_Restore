@implementation KPFEvent

- (KPFEvent)initWithDictionary:(id)a3
{
  KPFEvent *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)KPFEvent;
  v4 = -[KPFEvent init](&v6, "init");
  if (v4)
  {
    v4->mEventDictionary = (NSDictionary *)a3;
    v4->_animationDelegate = -[KPFEventAnimationDelegate initWithEvent:]([KPFEventAnimationDelegate alloc], "initWithEvent:", v4);
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[KPFEventAnimationDelegate setWeakEvent:](self->_animationDelegate, "setWeakEvent:", 0);

  v3.receiver = self;
  v3.super_class = (Class)KPFEvent;
  -[KPFEvent dealloc](&v3, "dealloc");
}

- (void)setAnimationEndHandler:(id)a3
{

  self->mAnimationEndHandler = objc_msgSend(a3, "copy");
}

- (void)renderEventWithSession:(id)a3
{
  id v3;
  id v5;
  double v6;
  double y;
  uint64_t v8;
  void *v9;
  id v10;
  THImageLayer *v11;
  float v12;
  id v13;
  void *v14;
  float v15;
  float v16;
  float v17;
  double v18;
  double v19;
  double v20;
  id v21;
  void *v22;
  float v23;
  double v24;
  float v25;
  id v26;
  void *v27;
  float v28;
  double v29;
  float v30;
  float v31;
  double v32;
  float v33;
  id v34;
  void *v35;
  float v36;
  double v37;
  float v38;
  id v39;
  id v40;
  id v41;
  id v42;
  char v43;
  uint64_t v44;
  void *i;
  void *v46;
  id v47;
  KPFMovie *v48;
  AVPlayerLayer *v49;
  double v50;
  double v51;
  id v52;
  id v53;
  id v54;
  id v55;
  uint64_t v56;
  void *j;
  void *v58;
  double v59;
  double v60;
  double v61;
  double v62;
  id v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  id v71;
  CGFloat v72;
  CGFloat v73;
  id v74;
  CGFloat v75;
  CGFloat v76;
  id v77;
  float v78;
  id v79;
  CFTimeInterval v80;
  void *v81;
  KPFEvent *v82;
  void *v83;
  id obj;
  uint64_t v85;
  id v86;
  void *v87;
  uint64_t v88;
  THImageLayer *v89;
  id v90;
  CGAffineTransform v91;
  CGAffineTransform v92;
  CGAffineTransform v93;
  CGAffineTransform t1;
  CGAffineTransform t2;
  CGAffineTransform v96;
  CGAffineTransform v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  _OWORD v102[8];
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  char v115[48];
  _QWORD v116[6];
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  _BYTE v121[128];
  _BYTE v122[128];
  _BYTE v123[128];

  v3 = a3;
  v5 = objc_msgSend(a3, "KPFDocument");
  v6 = CACurrentMediaTime();

  self->mLayers = (TSUNoCopyDictionary *)objc_alloc_init((Class)TSUNoCopyDictionary);
  self->mCanvasIDMap = (TSUNoCopyDictionary *)objc_alloc_init((Class)TSUNoCopyDictionary);
  +[CATransaction begin](CATransaction, "begin");
  +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
  objc_msgSend(objc_msgSend(v3, "showLayer"), "setSublayers:", 0);
  v119 = 0u;
  v120 = 0u;
  v117 = 0u;
  v118 = 0u;
  obj = -[KPFEvent p_initialStatesArray](self, "p_initialStatesArray");
  v82 = self;
  v83 = v3;
  v86 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v117, v123, 16);
  if (v86)
  {
    v85 = *(_QWORD *)v118;
    y = CGPointZero.y;
    v81 = v5;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v118 != v85)
          objc_enumerationMutation(obj);
        v88 = v8;
        v9 = *(void **)(*((_QWORD *)&v117 + 1) + 8 * v8);
        v10 = objc_msgSend(v9, "objectForKey:", CFSTR("texture"));
        v11 = objc_alloc_init(THImageLayer);
        -[THImageLayer setHidden:](v11, "setHidden:", objc_msgSend(objc_msgSend(v9, "objectForKey:", CFSTR("hidden")), "BOOLValue"));
        objc_msgSend(objc_msgSend(v9, "objectForKey:", CFSTR("zIndex")), "floatValue");
        -[THImageLayer setZPosition:](v11, "setZPosition:", v12);
        -[THImageLayer setDoubleSided:](v11, "setDoubleSided:", 0);
        -[THImageLayer setEdgeAntialiasingMask:](v11, "setEdgeAntialiasingMask:", 0);
        objc_msgSend(objc_msgSend(v9, "objectForKey:", CFSTR("opacity")), "floatValue");
        -[THImageLayer setOpacity:](v11, "setOpacity:");
        v13 = objc_msgSend(v9, "objectForKey:", CFSTR("opacityMultiplier"));
        if (v13)
        {
          v14 = v13;
          -[THImageLayer opacity](v11, "opacity");
          v16 = v15;
          objc_msgSend(v14, "floatValue");
          *(float *)&v18 = v16 * v17;
          -[THImageLayer setOpacity:](v11, "setOpacity:", v18);
        }
        v116[0] = _NSConcreteStackBlock;
        v116[1] = 3221225472;
        v116[2] = sub_FA8FC;
        v116[3] = &unk_429918;
        v116[4] = v5;
        v116[5] = v10;
        -[THImageLayer setImageProviderBlock:setLayerBounds:maxSize:outNativeSize:](v11, "setImageProviderBlock:setLayerBounds:maxSize:outNativeSize:", v116, 0, 0, 1.79769313e308, 1.79769313e308);
        objc_msgSend(v5, "textureSizeForName:", v10);
        -[THImageLayer setBounds:](v11, "setBounds:", CGPointZero.x, y, v19, v20);
        v90 = v10;
        -[THImageLayer setName:](v11, "setName:", v10);
        -[KPFEvent p_affineTransformFromArray:](self, "p_affineTransformFromArray:", objc_msgSend(v9, "objectForKey:", CFSTR("affineTransform")));
        -[THImageLayer setAffineTransform:](v11, "setAffineTransform:", v115);
        v21 = objc_msgSend(v9, "objectForKey:", CFSTR("translationEmphasis"));
        if (v21)
        {
          v22 = v21;
          if (objc_msgSend(v21, "count") == (char *)&dword_0 + 3)
          {
            objc_msgSend(objc_msgSend(v22, "objectAtIndex:", 0), "floatValue");
            v24 = v23;
            objc_msgSend(objc_msgSend(v22, "objectAtIndex:", 1), "floatValue");
            -[THImageLayer setValue:forKey:](v11, "setValue:forKey:", +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", v24, v25), CFSTR("translationEmphasis"));
          }
        }
        v26 = objc_msgSend(v9, "objectForKey:", CFSTR("scaleEmphasis"));
        if (v26)
        {
          v27 = v26;
          if (objc_msgSend(v26, "count") == (char *)&dword_4 + 2)
          {
            objc_msgSend(objc_msgSend(v27, "objectAtIndex:", 3), "floatValue");
            v29 = v28;
            objc_msgSend(objc_msgSend(v27, "objectAtIndex:", 4), "floatValue");
            -[THImageLayer setValue:forKey:](v11, "setValue:forKey:", +[NSValue valueWithCGSize:](NSValue, "valueWithCGSize:", v29, v30), CFSTR("scaleEmphasis"));
            objc_msgSend(objc_msgSend(v27, "objectAtIndex:", 0), "floatValue");
            v32 = v31;
            objc_msgSend(objc_msgSend(v27, "objectAtIndex:", 1), "floatValue");
            -[THImageLayer setValue:forKey:](v11, "setValue:forKey:", +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", v32, v33), CFSTR("centerOfEmphasis"));
          }
        }
        v87 = v9;
        v34 = objc_msgSend(v9, "objectForKey:", CFSTR("rotationEmphasis"));
        if (v34)
        {
          v35 = v34;
          if (objc_msgSend(v34, "count") == (char *)&dword_4 + 3)
          {
            objc_msgSend(objc_msgSend(v35, "objectAtIndex:", 6), "floatValue");
            -[THImageLayer setValue:forKey:](v11, "setValue:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"), CFSTR("rotationEmphasis"));
            objc_msgSend(objc_msgSend(v35, "objectAtIndex:", 0), "floatValue");
            v37 = v36;
            objc_msgSend(objc_msgSend(v35, "objectAtIndex:", 1), "floatValue");
            -[THImageLayer setValue:forKey:](v11, "setValue:forKey:", +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", v37, v38), CFSTR("centerOfEmphasis"));
          }
        }
        objc_msgSend(objc_msgSend(v3, "showLayer"), "addSublayer:", v11);
        v89 = v11;
        -[TSUNoCopyDictionary setObject:forKey:](self->mLayers, "setObject:forKey:", v11, v90);
        if (!self->mMovie)
        {
          if (objc_msgSend(v5, "movieURLForTextureName:", v90))
          {
            v113 = 0u;
            v114 = 0u;
            v111 = 0u;
            v112 = 0u;
            v40 = -[KPFEvent p_animationsArray](self, "p_animationsArray");
            v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v111, v122, 16);
            if (v41)
            {
              v42 = v41;
              v43 = 0;
              v44 = *(_QWORD *)v112;
              do
              {
                for (i = 0; i != v42; i = (char *)i + 1)
                {
                  if (*(_QWORD *)v112 != v44)
                    objc_enumerationMutation(v40);
                  v46 = *(void **)(*((_QWORD *)&v111 + 1) + 8 * (_QWORD)i);
                  v47 = objc_msgSend(v46, "objectForKey:", CFSTR("effect"));
                  if (((objc_msgSend(v47, "isEqualToString:", CFSTR("movieStart")) & 1) != 0
                     || objc_msgSend(v47, "isEqualToString:", CFSTR("apple:movie-start")))
                    && !objc_msgSend(objc_msgSend(v46, "objectForKey:", CFSTR("animationType")), "isEqualToString:", CFSTR("buildOut")))
                  {
                    v43 = 1;
                  }
                }
                v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v111, v122, 16);
              }
              while (v42);
              self = v82;
              v3 = v83;
              v5 = v81;
              if ((v43 & 1) != 0)
              {
                v48 = (KPFMovie *)objc_msgSend(v81, "newMovieForTextureName:", v90);
                v82->mMovie = v48;
                if (v48)
                {
                  v49 = -[KPFMovie playerLayer](v48, "playerLayer");
                  objc_msgSend(v81, "textureSizeForName:", v90);
                  -[AVPlayerLayer setBounds:](v49, "setBounds:", 0.0, 0.0, v50, v51);
                  -[AVPlayerLayer setPosition:](v49, "setPosition:", CGPointZero.x, y);
                  -[AVPlayerLayer setHidden:](v49, "setHidden:", 1);
                  -[THImageLayer zPosition](v89, "zPosition");
                  -[AVPlayerLayer setZPosition:](v49, "setZPosition:");
                  if (v89)
                  {
                    -[THImageLayer transform](v89, "transform");
                  }
                  else
                  {
                    v109 = 0u;
                    v110 = 0u;
                    v107 = 0u;
                    v108 = 0u;
                    v105 = 0u;
                    v106 = 0u;
                    v103 = 0u;
                    v104 = 0u;
                  }
                  v102[4] = v107;
                  v102[5] = v108;
                  v102[6] = v109;
                  v102[7] = v110;
                  v102[0] = v103;
                  v102[1] = v104;
                  v102[2] = v105;
                  v102[3] = v106;
                  -[AVPlayerLayer setTransform:](v49, "setTransform:", v102);
                  -[AVPlayerLayer setValue:forKey:](v49, "setValue:forKey:", v89, CFSTR("textureLayer"));
                  -[THImageLayer setValue:forKey:](v89, "setValue:forKey:", v49, CFSTR("movieLayer"));
                  objc_msgSend(objc_msgSend(v83, "showLayer"), "addSublayer:", v49);
                }
              }
            }
          }
        }
        v39 = objc_msgSend(v87, "objectForKey:", CFSTR("canvasObjectID"));
        if (v39)
          -[TSUNoCopyDictionary setObject:forKey:](self->mCanvasIDMap, "setObject:forKey:", v89, v39);

        v8 = v88 + 1;
      }
      while ((id)(v88 + 1) != v86);
      v52 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v117, v123, 16);
      v86 = v52;
    }
    while (v52);
  }
  v100 = 0u;
  v101 = 0u;
  v98 = 0u;
  v99 = 0u;
  v53 = -[TSUNoCopyDictionary allValues](self->mLayers, "allValues");
  v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v98, v121, 16);
  if (v54)
  {
    v55 = v54;
    v56 = *(_QWORD *)v99;
    do
    {
      for (j = 0; j != v55; j = (char *)j + 1)
      {
        if (*(_QWORD *)v99 != v56)
          objc_enumerationMutation(v53);
        v58 = *(void **)(*((_QWORD *)&v98 + 1) + 8 * (_QWORD)j);
        memset(&v97, 0, sizeof(v97));
        if (v58)
          objc_msgSend(v58, "affineTransform");
        objc_msgSend(v58, "bounds");
        v60 = v59;
        objc_msgSend(v58, "bounds");
        v62 = v61;
        v63 = objc_msgSend(v58, "valueForKey:", CFSTR("centerOfEmphasis"));
        if (v63)
        {
          objc_msgSend(v63, "CGPointValue");
          v65 = v64 + 1.0;
          v67 = v66 + 1.0;
        }
        else
        {
          v65 = v60 * 0.5;
          v67 = v62 * 0.5;
        }
        CGAffineTransformMakeTranslation(&t2, v65, v67);
        t1 = v97;
        CGAffineTransformConcat(&v96, &t1, &t2);
        v97 = v96;
        objc_msgSend(v58, "bounds");
        v69 = v65 / v68;
        objc_msgSend(v58, "bounds");
        objc_msgSend(v58, "setAnchorPoint:", v69, v67 / v70);
        v71 = objc_msgSend(v58, "valueForKey:", CFSTR("translationEmphasis"));
        if (v71)
        {
          objc_msgSend(v71, "CGPointValue");
          CGAffineTransformMakeTranslation(&v93, v72, v73);
          t1 = v97;
          CGAffineTransformConcat(&v96, &v93, &t1);
          v97 = v96;
        }
        v74 = objc_msgSend(v58, "valueForKey:", CFSTR("scaleEmphasis"));
        if (v74)
        {
          objc_msgSend(v74, "CGSizeValue");
          CGAffineTransformMakeScale(&v92, v75, v76);
          t1 = v97;
          CGAffineTransformConcat(&v96, &v92, &t1);
          v97 = v96;
        }
        v77 = objc_msgSend(v58, "valueForKey:", CFSTR("rotationEmphasis"));
        if (v77)
        {
          objc_msgSend(v77, "floatValue");
          CGAffineTransformMakeRotation(&v91, v78);
          t1 = v97;
          CGAffineTransformConcat(&v96, &v91, &t1);
          v97 = v96;
        }
        v96 = v97;
        objc_msgSend(v58, "setAffineTransform:", &v96);
        v79 = objc_msgSend(v58, "valueForKey:", CFSTR("movieLayer"));
        v96 = v97;
        objc_msgSend(v79, "setAffineTransform:", &v96);
      }
      v55 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v98, v121, 16);
    }
    while (v55);
  }
  +[CATransaction commit](CATransaction, "commit");
  v82->mAnimationsStarted = 0;
  if (objc_msgSend(v83, "isDebuggingEnabled"))
  {
    v80 = CACurrentMediaTime();
    NSLog(CFSTR("Rendering time: %f"), v80 - v6);
  }
}

- (void)p_movieEndCallback:(id)a3
{
  void (**mAnimationEndHandler)(void);

  if (!self->mAnimationsStarted)
  {
    mAnimationEndHandler = (void (**)(void))self->mAnimationEndHandler;
    if (mAnimationEndHandler)
      mAnimationEndHandler[2]();
  }
}

- (void)p_glAnimationEndCallback
{
  unint64_t mAnimationsStarted;
  unint64_t v3;
  void (**mAnimationEndHandler)(void);

  mAnimationsStarted = self->mAnimationsStarted;
  if (!mAnimationsStarted || (v3 = mAnimationsStarted - 1, (self->mAnimationsStarted = v3) == 0))
  {
    mAnimationEndHandler = (void (**)(void))self->mAnimationEndHandler;
    if (mAnimationEndHandler)
      mAnimationEndHandler[2]();
  }
}

- (void)p_addAnimationFromAnimationDict:(id)a3 forLayer:(id)a4 withTextureName:(id)a5
{
  id v9;
  id v10;
  id v11;
  char v12;
  unsigned __int8 v13;
  uint64_t v14;
  void *i;
  void *v16;
  id v17;
  id v18;
  id v19;
  CABasicAnimation *v20;
  float v21;
  float v22;
  float v23;
  double v24;
  id v25;
  float v26;
  NSString *v27;
  id v28;
  id obj;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];

  if (a4)
  {
    v30 = +[NSMutableArray array](NSMutableArray, "array");
    v9 = objc_msgSend(a3, "objectForKey:", CFSTR("actions"));
    if (!v9)
      v9 = objc_msgSend(a3, "objectForKey:", CFSTR("noPluginActions"));
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    if (v10)
    {
      v11 = v10;
      v28 = a3;
      v12 = 0;
      v13 = 0;
      v14 = *(_QWORD *)v32;
      obj = v9;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v32 != v14)
            objc_enumerationMutation(obj);
          v16 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)i);
          v17 = objc_msgSend(v16, "objectForKey:", CFSTR("texture"));
          if (!a5 || objc_msgSend(v17, "isEqualToString:", a5))
          {
            v18 = objc_msgSend(v16, "objectForKey:", CFSTR("action"));
            v19 = v18;
            if ((v13 & 1) != 0)
              v13 = 1;
            else
              v13 = objc_msgSend(v18, "isEqualToString:", CFSTR("transform"));
            v20 = +[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", -[KPFEvent p_animationKeyPathForAction:](self, "p_animationKeyPathForAction:", v19));
            objc_msgSend(objc_msgSend(v16, "objectForKey:", CFSTR("beginTime")), "floatValue");
            -[CABasicAnimation setBeginTime:](v20, "setBeginTime:", v21);
            objc_msgSend(objc_msgSend(v16, "objectForKey:", CFSTR("duration")), "floatValue");
            -[CABasicAnimation setDuration:](v20, "setDuration:", v22);
            -[CABasicAnimation setFromValue:](v20, "setFromValue:", -[KPFEvent p_propertyValueFromDictionary:forLayer:forAction:](self, "p_propertyValueFromDictionary:forLayer:forAction:", objc_msgSend(v16, "objectForKey:", CFSTR("from")), a4, v19));
            -[CABasicAnimation setToValue:](v20, "setToValue:", -[KPFEvent p_propertyValueFromDictionary:forLayer:forAction:](self, "p_propertyValueFromDictionary:forLayer:forAction:", objc_msgSend(v16, "objectForKey:", CFSTR("to")), a4, v19));
            -[CABasicAnimation setTimingFunction:](v20, "setTimingFunction:", -[KPFEvent p_timingFunctionFromString:forActionDictionary:](self, "p_timingFunctionFromString:forActionDictionary:", objc_msgSend(v16, "objectForKey:", CFSTR("timingFunction")), v16));
            -[CABasicAnimation setFillMode:](v20, "setFillMode:", kCAFillModeForwards);
            objc_msgSend(v30, "addObject:", v20);
            v12 = 1;
          }
        }
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      }
      while (v11);
      if ((v12 & 1) != 0)
      {
        if ((v13 & 1) != 0)
          -[KPFEvent p_addPerspectiveTransform:](self, "p_addPerspectiveTransform:", a4);
        objc_msgSend(objc_msgSend(v28, "objectForKey:", CFSTR("beginTime")), "floatValue");
        v24 = v23;
        v25 = +[CAAnimationGroup animation](CAAnimationGroup, "animation");
        objc_msgSend(v25, "setAnimations:", v30);
        objc_msgSend(objc_msgSend(v28, "objectForKey:", CFSTR("duration")), "floatValue");
        objc_msgSend(v25, "setDuration:", v24 + v26);
        objc_msgSend(v25, "setDelegate:", self->_animationDelegate);
        objc_msgSend(v25, "setRemovedOnCompletion:", 0);
        objc_msgSend(v25, "setFillMode:", kCAFillModeForwards);
        objc_msgSend(v25, "setValue:forKey:", a4, CFSTR("layer"));
        v27 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%@-%@"), objc_msgSend(v28, "objectForKey:", CFSTR("effect")), objc_msgSend(v28, "objectForKey:", CFSTR("beginTime")), objc_msgSend(v28, "objectForKey:", CFSTR("duration")));
        if (!objc_msgSend(a4, "animationForKey:", v27))
          ++self->mAnimationsStarted;
        objc_msgSend(a4, "addAnimation:forKey:", v25, v27);
      }
    }
  }
}

- (void)p_setupAndAnimateGLAnimationsFromPluginArray:(id)a3 withEffect:(id)a4 session:(id)a5
{
  id v6;
  void *v7;
  id v8;
  id v9;
  void *i;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  KPFMTLTransitionRenderer *v17;
  id v18;
  KPFMTLTransitionRenderer *v19;
  KPFMTLTransitionRenderer *mRenderer;
  float v21;
  uint64_t v23;
  uint64_t v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];

  v6 = objc_msgSend(objc_msgSend(a5, "animationRegistry"), "effectClassWithName:", a4);
  if (v6)
  {
    v7 = v6;
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v8)
    {
      v9 = v8;
      v23 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v28 != v23)
            objc_enumerationMutation(a3);
          v11 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
          v12 = objc_msgSend(v11, "objectForKey:", CFSTR("animationAttributes"));
          v13 = objc_msgSend(v11, "objectForKey:", CFSTR("duration"));
          v14 = objc_msgSend(v12, "objectForKey:", CFSTR("animationDelay"));
          v15 = objc_msgSend(v12, "objectForKey:", CFSTR("direction"));
          v26 = 0;
          v26 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
          objc_msgSend(v26, "setObject:forKey:", v15, CFSTR("KNTransitionAttributesDirection"));
          if (objc_msgSend(v7, "conformsToProtocol:", &OBJC_PROTOCOL___KNAnimationPluginArchiving))
          {
            v16 = objc_msgSend(v7, "supportedTypes");
            v25 = 0;
            objc_msgSend(v7, "upgradeAttributes:animationName:warning:type:isFromClassic:version:", &v26, 0, &v25, objc_msgSend(objc_msgSend(v16, "objectAtIndex:", 0), "integerValue"), 1, 90000000000);
          }
          v17 = [KPFMTLTransitionRenderer alloc];
          v18 = objc_msgSend(objc_msgSend(v26, "valueForKey:", CFSTR("KNTransitionAttributesDirection")), "unsignedIntegerValue");
          objc_msgSend(v13, "doubleValue");
          v19 = -[KPFMTLTransitionRenderer initWithEffectClass:direction:duration:session:](v17, "initWithEffectClass:direction:duration:session:", v7, v18, a5);
          self->mRenderer = v19;
          -[KPFMTLTransitionRenderer registerForTransitionEndCallback:target:](v19, "registerForTransitionEndCallback:target:", "p_glAnimationEndCallback", self);
          ++self->mAnimationsStarted;
          mRenderer = self->mRenderer;
          objc_msgSend(v14, "floatValue");
          -[KPFMTLTransitionRenderer animateWithDelay:](mRenderer, "animateWithDelay:", v21);
        }
        v9 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v9);
    }
  }
}

- (void)animateEventWithSession:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  id v9;
  void *v10;
  KPFMovie *mMovie;
  float v12;
  id v13;
  id v14;
  NSArray *mTextures;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *j;
  id v21;
  void (**mAnimationEndHandler)(void);
  id obj;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];

  if (self->mLayers)
  {
    if (!objc_msgSend(-[KPFEvent p_animationsArray](self, "p_animationsArray"), "count"))
    {
      mAnimationEndHandler = (void (**)(void))self->mAnimationEndHandler;
      if (mAnimationEndHandler)
      {
        mAnimationEndHandler[2]();
        return;
      }
    }
    +[CATransaction begin](CATransaction, "begin");
    +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    obj = -[KPFEvent p_animationsArray](self, "p_animationsArray");
    v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    if (!v4)
      goto LABEL_34;
    v5 = v4;
    v6 = *(_QWORD *)v30;
    while (1)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v30 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i);
        v9 = objc_msgSend(v8, "objectForKey:", CFSTR("effect"));
        v10 = v9;
        if (self->mMovie)
        {
          if ((objc_msgSend(v9, "isEqualToString:", CFSTR("movieStart")) & 1) != 0
            || objc_msgSend(v10, "isEqualToString:", CFSTR("apple:movie-start")))
          {
            -[KPFMovie registerForMovieEndCallback:target:](self->mMovie, "registerForMovieEndCallback:target:", "p_movieEndCallback:", self);
            -[AVPlayerLayer setHidden:](-[KPFMovie playerLayer](self->mMovie, "playerLayer"), "setHidden:", 0);
            mMovie = self->mMovie;
            objc_msgSend(objc_msgSend(v8, "objectForKey:", CFSTR("beginTime")), "floatValue");
            -[KPFMovie playAfterDelay:](mMovie, "playAfterDelay:", v12);
            continue;
          }
          if (self->mMovie && objc_msgSend(v10, "isEqualToString:", CFSTR("movieStop")))
          {
            -[KPFMovie stop](self->mMovie, "stop");
            -[AVPlayerLayer setHidden:](-[KPFMovie playerLayer](self->mMovie, "playerLayer"), "setHidden:", 1);
            continue;
          }
        }
        self->mTextures = (NSArray *)objc_msgSend(v8, "objectForKey:", CFSTR("textures"));
        v13 = objc_msgSend(v8, "objectForKey:", CFSTR("pluginActions"));
        v14 = objc_msgSend(v8, "objectForKey:", CFSTR("animationType"));
        mTextures = self->mTextures;
        if (mTextures && v13)
        {
          v16 = v14;
          if (objc_msgSend(objc_msgSend(a3, "animationRegistry"), "containsEffect:", v10)
            && objc_msgSend(v16, "isEqualToString:", CFSTR("transition")))
          {
            -[KPFEvent p_setupAndAnimateGLAnimationsFromPluginArray:withEffect:session:](self, "p_setupAndAnimateGLAnimationsFromPluginArray:withEffect:session:", v13, v10, a3);
            continue;
          }
          mTextures = self->mTextures;
        }
        if (mTextures)
        {
          v27 = 0u;
          v28 = 0u;
          v25 = 0u;
          v26 = 0u;
          v17 = -[NSArray countByEnumeratingWithState:objects:count:](mTextures, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
          if (v17)
          {
            v18 = v17;
            v19 = *(_QWORD *)v26;
            do
            {
              for (j = 0; j != v18; j = (char *)j + 1)
              {
                if (*(_QWORD *)v26 != v19)
                  objc_enumerationMutation(mTextures);
                -[KPFEvent p_addAnimationFromAnimationDict:forLayer:withTextureName:](self, "p_addAnimationFromAnimationDict:forLayer:withTextureName:", v8, -[TSUNoCopyDictionary objectForKey:](self->mLayers, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)j)), *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)j));
              }
              v18 = -[NSArray countByEnumeratingWithState:objects:count:](mTextures, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
            }
            while (v18);
          }
        }
        else
        {
          v21 = objc_msgSend(v8, "objectForKey:", CFSTR("canvasObjectID"));
          if (v21)
            -[KPFEvent p_addAnimationFromAnimationDict:forLayer:withTextureName:](self, "p_addAnimationFromAnimationDict:forLayer:withTextureName:", v8, -[TSUNoCopyDictionary objectForKey:](self->mCanvasIDMap, "objectForKey:", v21), 0);
        }
      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      if (!v5)
      {
LABEL_34:
        +[CATransaction commit](CATransaction, "commit");
        return;
      }
    }
  }
}

- (BOOL)containsMovie
{
  return self->mMovie != 0;
}

- (BOOL)isAnimating
{
  return self->mAnimationsStarted != 0;
}

- (BOOL)isMoviePlaying
{
  KPFMovie *mMovie;

  mMovie = self->mMovie;
  if (mMovie)
    LOBYTE(mMovie) = -[KPFMovie isPlaying](mMovie, "isPlaying");
  return (char)mMovie;
}

- (void)stopAllAnimations
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  -[KPFEvent stopMoviePlayback](self, "stopMoviePlayback");
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v3 = -[TSUNoCopyDictionary allValues](self->mLayers, "allValues", 0);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)v7), "removeAllAnimations");
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }
}

- (void)stopMoviePlayback
{
  KPFMovie *mMovie;
  void (**mAnimationEndHandler)(void);

  mMovie = self->mMovie;
  if (mMovie)
  {
    -[KPFMovie stop](mMovie, "stop");
    if (!self->mAnimationsStarted)
    {
      mAnimationEndHandler = (void (**)(void))self->mAnimationEndHandler;
      if (mAnimationEndHandler)
        mAnimationEndHandler[2]();
    }
  }
}

- (void)pauseMoviePlayback
{
  if (-[KPFEvent isMoviePlaying](self, "isMoviePlaying"))
    -[KPFMovie pause](self->mMovie, "pause");
}

- (BOOL)isAutomatic
{
  return objc_msgSend(-[NSDictionary objectForKey:](self->mEventDictionary, "objectForKey:", CFSTR("automaticPlay")), "BOOLValue");
}

- (id)hyperlinksRectArray
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v3 = -[KPFEvent p_hyperlinksArray](self, "p_hyperlinksArray");
  if (!objc_msgSend(v3, "count"))
    return 0;
  v4 = +[NSMutableArray array](NSMutableArray, "array");
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(v3, "reverseObjectEnumerator", 0);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        -[KPFEvent p_rectFromDictionary:](self, "p_rectFromDictionary:", objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i), "objectForKey:", CFSTR("targetRectangle")));
        objc_msgSend(v4, "addObject:", +[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:"));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }
  return v4;
}

- (id)hyperlinkAtLocation:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  id v6;
  id result;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  CGPoint v17;
  CGRect v18;

  y = a3.y;
  x = a3.x;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = objc_msgSend(-[KPFEvent p_hyperlinksArray](self, "p_hyperlinksArray"), "reverseObjectEnumerator", 0);
  result = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (result)
  {
    v8 = result;
    v9 = *(_QWORD *)v13;
    while (2)
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v10);
        -[KPFEvent p_rectFromDictionary:](self, "p_rectFromDictionary:", objc_msgSend(v11, "objectForKey:", CFSTR("targetRectangle")));
        v17.x = x;
        v17.y = y;
        if (CGRectContainsPoint(v18, v17))
          return objc_msgSend(v11, "objectForKey:", CFSTR("url"));
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      result = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      v8 = result;
      if (result)
        continue;
      break;
    }
  }
  return result;
}

- (id)accessibilityArray
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSValue *v13;
  id obj;
  _QWORD v16[4];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _QWORD v21[2];
  _QWORD v22[2];
  _BYTE v23[128];

  v3 = +[NSMutableArray array](NSMutableArray, "array");
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = -[NSDictionary objectForKey:](self->mEventDictionary, "objectForKey:", CFSTR("textRegions"));
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v18;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v7);
        v21[0] = CFSTR("targetRectangle");
        -[KPFEvent p_rectFromDictionary:](self, "p_rectFromDictionary:", objc_msgSend(v8, "objectForKey:", CFSTR("targetRectangle")));
        v16[0] = v9;
        v16[1] = v10;
        v16[2] = v11;
        v16[3] = v12;
        v13 = +[NSValue valueWithBytes:objCType:](NSValue, "valueWithBytes:objCType:", v16, "{CGRect={CGPoint=dd}{CGSize=dd}}");
        v21[1] = CFSTR("text");
        v22[0] = v13;
        v22[1] = objc_msgSend(v8, "objectForKey:", CFSTR("text"));
        objc_msgSend(v3, "addObject:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v22, v21, 2));
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
    }
    while (v5);
  }
  return objc_msgSend(v3, "copy");
}

- (void)tearDown
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = -[TSUNoCopyDictionary allValues](self->mLayers, "allValues", 0);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)v7), "removeAllAnimations");
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

  self->mAnimationEndHandler = 0;
  self->mMovie = 0;
}

- (NSArray)textures
{
  return self->mTextures;
}

- (KPFEventAnimationDelegate)animationDelegate
{
  return self->_animationDelegate;
}

- (void)setAnimationDelegate:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 72);
}

- (CGRect)p_rectFromDictionary:(id)a3
{
  float v4;
  double v5;
  float v6;
  double v7;
  float v8;
  double v9;
  float v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  objc_msgSend(objc_msgSend(a3, "objectForKey:", CFSTR("x")), "floatValue");
  v5 = v4;
  objc_msgSend(objc_msgSend(a3, "objectForKey:", CFSTR("y")), "floatValue");
  v7 = v6;
  objc_msgSend(objc_msgSend(a3, "objectForKey:", CFSTR("width")), "floatValue");
  v9 = v8;
  objc_msgSend(objc_msgSend(a3, "objectForKey:", CFSTR("height")), "floatValue");
  v11 = v10;
  v12 = v5;
  v13 = v7;
  v14 = v9;
  result.size.height = v11;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (id)p_initialStatesArray
{
  return -[NSDictionary objectForKey:](self->mEventDictionary, "objectForKey:", CFSTR("eventInitialStates"));
}

- (id)p_animationsArray
{
  return -[NSDictionary objectForKey:](self->mEventDictionary, "objectForKey:", CFSTR("eventAnimations"));
}

- (id)p_hyperlinksArray
{
  return -[NSDictionary objectForKey:](self->mEventDictionary, "objectForKey:", CFSTR("hyperlinks"));
}

- (id)p_propertyValueFromDictionary:(id)a3 forLayer:(id)a4 forAction:(id)a5
{
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  float v17;
  double v18;
  float v19;
  float v20;
  id v21;
  double v22;
  double v23;
  double v24;
  double v25;
  id v26;
  double v27;
  double v28;
  float v29;
  double v30;
  float v31;
  double v32;
  double v33;
  id v34;
  uint64_t v35;
  float v36;
  double v37;
  float v38;
  float v39;
  double v40;
  double v41;
  float v42;
  double v43;
  double v44;
  id v45;
  CATransform3D v46;
  CATransform3D b;
  CATransform3D v48;
  CATransform3D v49;

  if ((objc_msgSend(a5, "isEqualToString:", CFSTR("transform.rotation.x")) & 1) != 0
    || (objc_msgSend(a5, "isEqualToString:", CFSTR("transform.rotation.y")) & 1) != 0
    || (objc_msgSend(a5, "isEqualToString:", CFSTR("transform.rotation.z")) & 1) != 0
    || (objc_msgSend(a5, "isEqualToString:", CFSTR("transform.scale.x")) & 1) != 0
    || (objc_msgSend(a5, "isEqualToString:", CFSTR("transform.scale.y")) & 1) != 0
    || (objc_msgSend(a5, "isEqualToString:", CFSTR("transform.scale.z")) & 1) != 0
    || (objc_msgSend(a5, "isEqualToString:", CFSTR("transform.scale")) & 1) != 0
    || (objc_msgSend(a5, "isEqualToString:", CFSTR("hidden")) & 1) != 0
    || (objc_msgSend(a5, "isEqualToString:", CFSTR("zPosition")) & 1) != 0
    || (objc_msgSend(a5, "isEqualToString:", CFSTR("anchorPointZ")) & 1) != 0
    || (objc_msgSend(a5, "isEqualToString:", CFSTR("zOrderHint")) & 1) != 0
    || (objc_msgSend(a5, "isEqualToString:", CFSTR("isPlaying")) & 1) != 0
    || objc_msgSend(a5, "isEqualToString:", CFSTR("translation.z")))
  {
    return objc_msgSend(a3, "objectForKey:", CFSTR("scalar"));
  }
  if (objc_msgSend(a5, "isEqualToString:", CFSTR("transform.translation.x")))
  {
    objc_msgSend(a4, "frame");
    v11 = v10;
    objc_msgSend(a4, "frame");
    v13 = v12 * 0.5;
LABEL_19:
    v16 = v11 + v13;
    objc_msgSend(objc_msgSend(a3, "objectForKey:", CFSTR("scalar")), "floatValue");
    v18 = v16 + v17;
    *(float *)&v18 = v18;
    return +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v18);
  }
  if (objc_msgSend(a5, "isEqualToString:", CFSTR("transform.translation.y")))
  {
    objc_msgSend(a4, "frame");
    v11 = v14;
    objc_msgSend(a4, "frame");
    v13 = v15 * 0.5;
    goto LABEL_19;
  }
  if ((objc_msgSend(a5, "isEqualToString:", CFSTR("opacity")) & 1) != 0
    || objc_msgSend(a5, "isEqualToString:", CFSTR("opacityMultiplier")))
  {
    objc_msgSend(a4, "opacity");
    v20 = v19;
    objc_msgSend(objc_msgSend(a3, "objectForKey:", CFSTR("scalar")), "floatValue");
    *(float *)&v18 = v20 * *(float *)&v18;
    return +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v18);
  }
  if (objc_msgSend(a5, "isEqualToString:", CFSTR("translationEmphasis")))
  {
    v21 = objc_msgSend(a3, "objectForKey:", CFSTR("translationEmphasis"));
    objc_msgSend(a4, "position");
    v23 = v22;
    v25 = v24;
    v26 = objc_msgSend(a4, "valueForKey:", CFSTR("addtionalInitialTranslation"));
    if (v26)
    {
      objc_msgSend(v26, "CGPointValue");
      v23 = v23 - v27;
      v25 = v25 - v28;
    }
    objc_msgSend(objc_msgSend(v21, "objectAtIndex:", 0), "floatValue");
    v30 = v23 + v29;
    objc_msgSend(objc_msgSend(v21, "objectAtIndex:", 1), "floatValue");
    v32 = v25 + v31;
    v33 = v30;
    return +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", v33, v32);
  }
  if (objc_msgSend(a5, "isEqualToString:", CFSTR("rotationEmphasis")))
  {
    v34 = objc_msgSend(a3, "objectForKey:", CFSTR("rotationEmphasis"));
    v35 = 6;
    return objc_msgSend(v34, "objectAtIndex:", v35);
  }
  if (objc_msgSend(a5, "isEqualToString:", CFSTR("scaleEmphasis")))
  {
    v34 = objc_msgSend(a3, "objectForKey:", CFSTR("scaleEmphasis"));
    v35 = 3;
    return objc_msgSend(v34, "objectAtIndex:", v35);
  }
  if ((objc_msgSend(a5, "isEqualToString:", CFSTR("transform.translation")) & 1) != 0
    || objc_msgSend(a5, "isEqualToString:", CFSTR("anchorPoint")))
  {
    objc_msgSend(objc_msgSend(a3, "objectForKey:", CFSTR("pointX")), "floatValue");
    v37 = v36;
    objc_msgSend(objc_msgSend(a3, "objectForKey:", CFSTR("pointY")), "floatValue");
    v32 = v38;
LABEL_37:
    v33 = v37;
    return +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", v33, v32);
  }
  if (objc_msgSend(a5, "isEqualToString:", CFSTR("position")))
  {
    objc_msgSend(objc_msgSend(a3, "objectForKey:", CFSTR("pointX")), "floatValue");
    v40 = v39;
    objc_msgSend(a4, "position");
    v37 = v41 + v40;
    objc_msgSend(objc_msgSend(a3, "objectForKey:", CFSTR("pointY")), "floatValue");
    v43 = v42;
    objc_msgSend(a4, "position");
    v32 = v44 + v43;
    goto LABEL_37;
  }
  if (!objc_msgSend(a5, "isEqualToString:", CFSTR("transform")))
    return 0;
  memset(&v49, 0, sizeof(v49));
  v45 = objc_msgSend(a3, "objectForKey:", CFSTR("transform"));
  if (self)
    -[KPFEvent p_transformFromArray:](self, "p_transformFromArray:", v45);
  else
    memset(&v49, 0, sizeof(v49));
  if (a4)
    objc_msgSend(a4, "transform");
  else
    memset(&b, 0, sizeof(b));
  v46 = v49;
  CATransform3DConcat(&v48, &v46, &b);
  v49 = v48;
  return +[NSValue valueWithCATransform3D:](NSValue, "valueWithCATransform3D:", &v48);
}

- (id)p_timingFunctionFromString:(id)a3 forActionDictionary:(id)a4
{
  const CAMediaTimingFunctionName *v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  double v14;
  double v15;
  double v16;
  double v17;

  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("easeOut")) & 1) != 0)
  {
    v6 = &kCAMediaTimingFunctionEaseOut;
  }
  else if ((objc_msgSend(a3, "isEqualToString:", CFSTR("easeIn")) & 1) != 0)
  {
    v6 = &kCAMediaTimingFunctionEaseIn;
  }
  else if ((objc_msgSend(a3, "isEqualToString:", CFSTR("easeInEaseOut")) & 1) != 0)
  {
    v6 = &kCAMediaTimingFunctionEaseInEaseOut;
  }
  else if ((objc_msgSend(a3, "isEqualToString:", CFSTR("linear")) & 1) != 0)
  {
    v6 = &kCAMediaTimingFunctionLinear;
  }
  else
  {
    if (objc_msgSend(a3, "isEqualToString:", CFSTR("custom")))
    {
      objc_msgSend(objc_msgSend(a4, "objectForKey:", CFSTR("timingControlPoint1x")), "floatValue");
      v8 = v7;
      objc_msgSend(objc_msgSend(a4, "objectForKey:", CFSTR("timingControlPoint1y")), "floatValue");
      v10 = v9;
      objc_msgSend(objc_msgSend(a4, "objectForKey:", CFSTR("timingControlPoint2x")), "floatValue");
      v12 = v11;
      objc_msgSend(objc_msgSend(a4, "objectForKey:", CFSTR("timingControlPoint2y")), "floatValue");
      LODWORD(v14) = v13;
      LODWORD(v15) = v8;
      LODWORD(v16) = v10;
      LODWORD(v17) = v12;
      return +[CAMediaTimingFunction functionWithControlPoints::::](CAMediaTimingFunction, "functionWithControlPoints::::", v15, v16, v17, v14);
    }
    v6 = &kCAMediaTimingFunctionDefault;
  }
  return +[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", *v6);
}

- (CGAffineTransform)p_affineTransformFromArray:(SEL)a3
{
  float v6;
  CGFloat v7;
  float v8;
  CGFloat v9;
  float v10;
  CGFloat v11;
  float v12;
  CGFloat v13;
  float v14;
  CGFloat v15;
  CGAffineTransform *result;
  float v17;

  objc_msgSend(objc_msgSend(a4, "objectAtIndex:", 0), "floatValue");
  v7 = v6;
  objc_msgSend(objc_msgSend(a4, "objectAtIndex:", 1), "floatValue");
  v9 = v8;
  objc_msgSend(objc_msgSend(a4, "objectAtIndex:", 2), "floatValue");
  v11 = v10;
  objc_msgSend(objc_msgSend(a4, "objectAtIndex:", 3), "floatValue");
  v13 = v12;
  objc_msgSend(objc_msgSend(a4, "objectAtIndex:", 4), "floatValue");
  v15 = v14;
  result = (CGAffineTransform *)objc_msgSend(objc_msgSend(a4, "objectAtIndex:", 5), "floatValue");
  retstr->a = v7;
  retstr->b = v9;
  retstr->c = v11;
  retstr->d = v13;
  retstr->tx = v15;
  retstr->ty = v17;
  return result;
}

- (CATransform3D)p_transformFromArray:(SEL)a3
{
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;

  v5 = *(_OWORD *)&CATransform3DIdentity.m33;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&CATransform3DIdentity.m31;
  *(_OWORD *)&retstr->m33 = v5;
  v6 = *(_OWORD *)&CATransform3DIdentity.m43;
  *(_OWORD *)&retstr->m41 = *(_OWORD *)&CATransform3DIdentity.m41;
  *(_OWORD *)&retstr->m43 = v6;
  v7 = *(_OWORD *)&CATransform3DIdentity.m13;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&CATransform3DIdentity.m11;
  *(_OWORD *)&retstr->m13 = v7;
  v8 = *(_OWORD *)&CATransform3DIdentity.m23;
  *(_OWORD *)&retstr->m21 = *(_OWORD *)&CATransform3DIdentity.m21;
  *(_OWORD *)&retstr->m23 = v8;
  if (a4)
  {
    self = (CATransform3D *)objc_msgSend(a4, "count");
    if (self == (CATransform3D *)&dword_10)
    {
      objc_msgSend(objc_msgSend(a4, "objectAtIndex:", 0), "floatValue");
      retstr->m11 = v10;
      objc_msgSend(objc_msgSend(a4, "objectAtIndex:", 1), "floatValue");
      retstr->m12 = v11;
      objc_msgSend(objc_msgSend(a4, "objectAtIndex:", 2), "floatValue");
      retstr->m13 = v12;
      objc_msgSend(objc_msgSend(a4, "objectAtIndex:", 3), "floatValue");
      retstr->m14 = v13;
      objc_msgSend(objc_msgSend(a4, "objectAtIndex:", 4), "floatValue");
      retstr->m21 = v14;
      objc_msgSend(objc_msgSend(a4, "objectAtIndex:", 5), "floatValue");
      retstr->m22 = v15;
      objc_msgSend(objc_msgSend(a4, "objectAtIndex:", 6), "floatValue");
      retstr->m23 = v16;
      objc_msgSend(objc_msgSend(a4, "objectAtIndex:", 7), "floatValue");
      retstr->m24 = v17;
      objc_msgSend(objc_msgSend(a4, "objectAtIndex:", 8), "floatValue");
      retstr->m31 = v18;
      objc_msgSend(objc_msgSend(a4, "objectAtIndex:", 9), "floatValue");
      retstr->m32 = v19;
      objc_msgSend(objc_msgSend(a4, "objectAtIndex:", 10), "floatValue");
      retstr->m33 = v20;
      objc_msgSend(objc_msgSend(a4, "objectAtIndex:", 11), "floatValue");
      retstr->m34 = v21;
      objc_msgSend(objc_msgSend(a4, "objectAtIndex:", 12), "floatValue");
      retstr->m41 = v22;
      objc_msgSend(objc_msgSend(a4, "objectAtIndex:", 13), "floatValue");
      retstr->m42 = v23;
      objc_msgSend(objc_msgSend(a4, "objectAtIndex:", 14), "floatValue");
      retstr->m43 = v24;
      self = (CATransform3D *)objc_msgSend(objc_msgSend(a4, "objectAtIndex:", 15), "floatValue");
      retstr->m44 = v25;
    }
  }
  return self;
}

- (id)p_animationKeyPathForAction:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("opacityMultiplier")) & 1) != 0)
    return CFSTR("opacity");
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("translationEmphasis")) & 1) != 0)
    return CFSTR("position");
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("zOrderHint")) & 1) != 0)
    return CFSTR("zPosition");
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("rotationEmphasis")) & 1) != 0)
    return CFSTR("transform.rotation.z");
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("scaleEmphasis")))
    return CFSTR("transform.scale.xy");
  return a3;
}

- (void)p_addPerspectiveTransform:(id)a3
{
  id v4;
  id v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  _OWORD v11[8];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;

  v4 = objc_msgSend(a3, "superlayer");
  v5 = a3;
  v6 = objc_alloc_init((Class)CALayer);
  objc_msgSend(v4, "bounds");
  objc_msgSend(v6, "setFrame:");
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  if (v6)
    objc_msgSend(v6, "sublayerTransform");
  objc_msgSend(v4, "bounds");
  v8 = v7;
  objc_msgSend(v4, "bounds");
  if (v8 >= v9)
    v10 = v9;
  else
    v10 = v8;
  *((double *)&v17 + 1) = 1.0 / (v10 * -2.64490471);
  v11[6] = v18;
  v11[7] = v19;
  v11[0] = v12;
  v11[1] = v13;
  v11[2] = v14;
  v11[3] = v15;
  v11[4] = v16;
  v11[5] = v17;
  objc_msgSend(v6, "setSublayerTransform:", v11);
  objc_msgSend(a3, "zPosition");
  objc_msgSend(v6, "setZPosition:");
  objc_msgSend(v4, "insertSublayer:above:", v6, a3);
  objc_msgSend(a3, "removeFromSuperlayer");
  objc_msgSend(v6, "addSublayer:", v5);

}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  unint64_t mAnimationsStarted;
  unint64_t v6;
  KPFMovie *mMovie;
  void (**mAnimationEndHandler)(void);

  if (a4)
  {
    mAnimationsStarted = self->mAnimationsStarted;
    if (!mAnimationsStarted || (v6 = mAnimationsStarted - 1, (self->mAnimationsStarted = v6) == 0))
    {
      mMovie = self->mMovie;
      if (!mMovie || !-[KPFMovie isPlaying](mMovie, "isPlaying", a3))
      {
        mAnimationEndHandler = (void (**)(void))self->mAnimationEndHandler;
        if (mAnimationEndHandler)
          mAnimationEndHandler[2]();
      }
    }
  }
}

@end
