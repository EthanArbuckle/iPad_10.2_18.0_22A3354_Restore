@implementation KPFGingerEvent

- (KPFGingerEvent)initWithDictionary:(id)a3
{
  KPFGingerEvent *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)KPFGingerEvent;
  v4 = -[KPFGingerEvent init](&v6, "init");
  if (v4)
  {
    v4->mEventsDictionary = (NSDictionary *)a3;
    v4->_isAutomatic = objc_msgSend(objc_msgSend(a3, "objectForKey:", CFSTR("automaticPlay")), "BOOLValue");
  }
  return v4;
}

- (KPFGingerEvent)initWithEffectsDictionary:(id)a3
{
  KPFGingerEvent *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)KPFGingerEvent;
  v4 = -[KPFGingerEvent init](&v6, "init");
  if (v4)
  {
    v4->mEffectsDictionary = (NSDictionary *)a3;
    v4->mEventsDictionary = 0;
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  self->mAnimationDict = 0;
  v3.receiver = self;
  v3.super_class = (Class)KPFGingerEvent;
  -[KPFGingerEvent dealloc](&v3, "dealloc");
}

- (void)setAnimationEndHandler:(id)a3
{
  self->mAnimationEndHandler = objc_msgSend(a3, "copy");
}

- (void)renderEventWithSession:(id)a3
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  id v12;
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  self->mAnimationDict = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  self->mSwappableLayersDict = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);

  self->mMovietoLayerMap = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  self->mKPFSession = (KPFSession *)a3;
  +[CATransaction begin](CATransaction, "begin");
  +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
  -[CALayer setSublayers:](-[KPFSession showLayer](self->mKPFSession, "showLayer"), "setSublayers:", 0);
  v5 = -[KPFGingerEvent p_newLayerFromDict:](self, "p_newLayerFromDict:", -[NSDictionary objectForKey:](self->mEventsDictionary, "objectForKey:", CFSTR("baseLayer")));
  v6 = -[NSMutableDictionary allKeys](self->mMovietoLayerMap, "allKeys");
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        v12 = objc_msgSend(-[NSMutableDictionary objectForKeyedSubscript:](self->mMovietoLayerMap, "objectForKeyedSubscript:", v11), "playerLayer");
        v13 = objc_msgSend(v11, "nonretainedObjectValue");
        if (objc_msgSend(objc_msgSend(v13, "sublayers"), "count"))
          objc_msgSend(v13, "insertSublayer:atIndex:", v12, 1);
        else
          objc_msgSend(v13, "addSublayer:", v12);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }
  -[CALayer addSublayer:](-[KPFSession showLayer](self->mKPFSession, "showLayer"), "addSublayer:", v5);
  +[CATransaction commit](CATransaction, "commit");
  self->mAnimationsStarted = 0;
}

- (void)p_AnimationEnded
{
  unint64_t mAnimationsStarted;
  unint64_t v3;

  mAnimationsStarted = self->mAnimationsStarted;
  if (!mAnimationsStarted || (v3 = mAnimationsStarted - 1, (self->mAnimationsStarted = v3) == 0))
    (*((void (**)(void))self->mAnimationEndHandler + 2))();
}

- (id)p_newLayerFromDict:(id)a3
{
  CALayer *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  float v10;
  id v11;
  float v12;
  double v13;
  float v14;
  id v15;
  float v16;
  double v17;
  float v18;
  float v19;
  double v20;
  float v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  float v26;
  float v27;
  float v28;
  double v29;
  KPFSession *mKPFSession;
  id v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  uint64_t v38;
  void *i;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _OWORD v45[3];
  _OWORD v46[8];
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];

  v5 = +[CALayer layer](CALayer, "layer");
  v6 = objc_msgSend(a3, "objectForKey:", CFSTR("texture"));
  v7 = objc_msgSend(a3, "objectForKey:", CFSTR("initialState"));
  v8 = objc_msgSend(a3, "objectForKey:", CFSTR("layers"));
  v9 = objc_msgSend(objc_msgSend(a3, "objectForKey:", CFSTR("objectID")), "stringValue");
  -[CALayer setMasksToBounds:](v5, "setMasksToBounds:", objc_msgSend(objc_msgSend(v7, "objectForKey:", CFSTR("masksToBounds")), "BOOLValue"));
  -[CALayer setHidden:](v5, "setHidden:", objc_msgSend(objc_msgSend(v7, "objectForKey:", CFSTR("hidden")), "BOOLValue"));
  objc_msgSend(objc_msgSend(v7, "objectForKey:", CFSTR("zIndex")), "floatValue");
  -[CALayer setZPosition:](v5, "setZPosition:", v10);
  -[CALayer setDoubleSided:](v5, "setDoubleSided:", 0);
  -[CALayer setEdgeAntialiasingMask:](v5, "setEdgeAntialiasingMask:", 0);
  v11 = objc_msgSend(v7, "objectForKey:", CFSTR("anchorPoint"));
  objc_msgSend(objc_msgSend(v11, "objectForKey:", CFSTR("pointX")), "floatValue");
  v13 = v12;
  objc_msgSend(objc_msgSend(v11, "objectForKey:", CFSTR("pointY")), "floatValue");
  -[CALayer setAnchorPoint:](v5, "setAnchorPoint:", v13, v14);
  v15 = objc_msgSend(v7, "objectForKey:", CFSTR("position"));
  objc_msgSend(objc_msgSend(v15, "objectForKey:", CFSTR("pointX")), "floatValue");
  v17 = v16;
  objc_msgSend(objc_msgSend(v15, "objectForKey:", CFSTR("pointY")), "floatValue");
  -[CALayer setPosition:](v5, "setPosition:", v17, v18);
  objc_msgSend(objc_msgSend(v7, "objectForKey:", CFSTR("width")), "floatValue");
  v20 = v19;
  objc_msgSend(objc_msgSend(v7, "objectForKey:", CFSTR("height")), "floatValue");
  -[CALayer setBounds:](v5, "setBounds:", 0.0, 0.0, v20, v21);
  v22 = objc_msgSend(v7, "objectForKey:", CFSTR("sublayerTransform"));
  if (self)
  {
    -[KPFGingerEvent p_transformFromArray:](self, "p_transformFromArray:", v22);
  }
  else
  {
    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
  }
  v46[4] = v51;
  v46[5] = v52;
  v46[6] = v53;
  v46[7] = v54;
  v46[0] = v47;
  v46[1] = v48;
  v46[2] = v49;
  v46[3] = v50;
  -[CALayer setSublayerTransform:](v5, "setSublayerTransform:", v46);
  v23 = objc_msgSend(v7, "objectForKey:", CFSTR("affineTransform"));
  if (self)
    -[KPFGingerEvent p_affineTransformFromArray:](self, "p_affineTransformFromArray:", v23);
  else
    memset(v45, 0, sizeof(v45));
  -[CALayer setAffineTransform:](v5, "setAffineTransform:", v45);
  -[KPFGingerEvent p_rectFromDictionary:](self, "p_rectFromDictionary:", objc_msgSend(v7, "objectForKey:", CFSTR("contentsRect")));
  -[CALayer setContentsRect:](v5, "setContentsRect:");
  objc_msgSend(objc_msgSend(v7, "objectForKey:", CFSTR("opacity")), "floatValue");
  -[CALayer setOpacity:](v5, "setOpacity:");
  v24 = objc_msgSend(v7, "objectForKey:", CFSTR("opacityMultiplier"));
  if (v24)
  {
    v25 = v24;
    -[CALayer opacity](v5, "opacity");
    v27 = v26;
    objc_msgSend(v25, "floatValue");
    *(float *)&v29 = v27 * v28;
    -[CALayer setOpacity:](v5, "setOpacity:", v29);
  }
  mKPFSession = self->mKPFSession;
  if (mKPFSession && v6)
  {
    -[CALayer setContents:](v5, "setContents:", -[KPFGingerSlide CGImageForTextureName:session:](-[KPFSession currentSlide](mKPFSession, "currentSlide"), "CGImageForTextureName:session:", v6, self->mKPFSession));
    -[CALayer setName:](v5, "setName:", v6);
  }
  if (v9)
  {
    v31 = -[NSMutableDictionary objectForKey:](self->mSwappableLayersDict, "objectForKey:", v9);
    if (v31)
    {
      v32 = v31;
      v33 = objc_msgSend(v31, "superlayer");
      v34 = objc_msgSend(v32, "superlayer");
      if (v33)
        objc_msgSend(v34, "replaceSublayer:with:", v32, v5);
    }
    -[CALayer setName:](v5, "setName:", v9);
    v35 = -[KPFGingerSlide movieForObjectID:](-[KPFSession currentSlide](self->mKPFSession, "currentSlide"), "movieForObjectID:", v9);
    if (v35)
      -[NSMutableDictionary setObject:forKey:](self->mMovietoLayerMap, "setObject:forKey:", v35, +[NSValue valueWithNonretainedObject:](NSValue, "valueWithNonretainedObject:", v5));
    -[NSMutableDictionary setObject:forKey:](self->mSwappableLayersDict, "setObject:forKey:", v5, v9);
  }
  if (objc_msgSend(v8, "count"))
  {
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v36 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v41, v55, 16);
    if (v36)
    {
      v37 = v36;
      v38 = *(_QWORD *)v42;
      do
      {
        for (i = 0; i != v37; i = (char *)i + 1)
        {
          if (*(_QWORD *)v42 != v38)
            objc_enumerationMutation(v8);
          -[CALayer addSublayer:](v5, "addSublayer:", -[KPFGingerEvent p_newLayerFromDict:](self, "p_newLayerFromDict:", *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)i)));
        }
        v37 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v41, v55, 16);
      }
      while (v37);
    }
  }
  return v5;
}

- (void)animateWithSession:(id)a3
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  _QWORD v11[5];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  if (objc_msgSend(-[KPFGingerEvent p_effectsArray](self, "p_effectsArray"), "count"))
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v5 = -[KPFGingerEvent p_effectsArray](self, "p_effectsArray");
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v10, "renderEffectWithSession:withSwappableLayersDict:", a3, self->mSwappableLayersDict);
          v11[0] = _NSConcreteStackBlock;
          v11[1] = 3221225472;
          v11[2] = sub_10DF5C;
          v11[3] = &unk_426DD0;
          v11[4] = self;
          objc_msgSend(v10, "setAnimationEndHandler:", v11);
          objc_msgSend(v10, "animateWithSession:", a3);
          ++self->mAnimationsStarted;
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }
  }
  else
  {
    (*((void (**)(void))self->mAnimationEndHandler + 2))();
  }
}

- (id)hyperlinksRectArray
{
  id v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v3 = +[NSMutableArray array](NSMutableArray, "array");
  v4 = -[KPFGingerEvent p_hyperlinksArray](self, "p_hyperlinksArray");
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        -[KPFGingerEvent p_rectFromDictionary:](self, "p_rectFromDictionary:", objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v8), "objectForKeyedSubscript:", CFSTR("targetRectangle")));
        objc_msgSend(v3, "addObject:", +[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:"));
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }
  return v3;
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
  v6 = objc_msgSend(-[KPFGingerEvent p_hyperlinksArray](self, "p_hyperlinksArray"), "reverseObjectEnumerator", 0);
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
        -[KPFGingerEvent p_rectFromDictionary:](self, "p_rectFromDictionary:", objc_msgSend(v11, "objectForKey:", CFSTR("targetRectangle")));
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
  obj = -[NSDictionary objectForKey:](self->mEventsDictionary, "objectForKey:", CFSTR("accessibility"));
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
        -[KPFGingerEvent p_rectFromDictionary:](self, "p_rectFromDictionary:", objc_msgSend(v8, "objectForKey:", CFSTR("targetRectangle")));
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
  return v3;
}

- (BOOL)containsMovie
{
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = -[KPFGingerEvent p_effectsArray](self, "p_effectsArray", 0);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    while (2)
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)v6), "containsMovie") & 1) != 0)
        {
          LOBYTE(v3) = 1;
          return (char)v3;
        }
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      v4 = v3;
      if (v3)
        continue;
      break;
    }
  }
  return (char)v3;
}

- (BOOL)isMoviePlaying
{
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = -[KPFGingerEvent p_effectsArray](self, "p_effectsArray", 0);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    while (2)
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)v6), "isMoviePlaying") & 1) != 0)
        {
          LOBYTE(v3) = 1;
          return (char)v3;
        }
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      v4 = v3;
      if (v3)
        continue;
      break;
    }
  }
  return (char)v3;
}

- (void)pauseMoviePlayback
{
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];

  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = -[KPFGingerEvent p_effectsArray](self, "p_effectsArray", 0);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * (_QWORD)v6), "pauseMoviePlayback");
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }
}

- (void)resumeMoviePlayback
{
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];

  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = -[KPFGingerEvent p_effectsArray](self, "p_effectsArray", 0);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * (_QWORD)v6), "resumeMoviePlayback");
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }
}

- (void)stopMoviePlayback
{
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];

  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = -[KPFGingerEvent p_effectsArray](self, "p_effectsArray", 0);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * (_QWORD)v6), "stopMoviePlayback");
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }
}

- (void)tearDown
{
  NSMutableArray *mEffectsArray;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  mEffectsArray = self->mEffectsArray;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mEffectsArray, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(mEffectsArray);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i), "tearDown");
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mEffectsArray, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

  self->mEffectsArray = 0;
  self->mSwappableLayersDict = 0;

  self->mMovietoLayerMap = 0;
}

- (BOOL)isAnimating
{
  return self->mAnimationsStarted != 0;
}

- (BOOL)isAutomatic
{
  return self->_isAutomatic;
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

- (id)p_hyperlinksArray
{
  id result;

  result = self->mEventsDictionary;
  if (result)
    return objc_msgSend(result, "objectForKey:", CFSTR("hyperlinks"));
  return result;
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

- (id)p_effectsArray
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  KPFGingerEffect *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  if (!self->mEventsDictionary)
    return 0;
  if (!self->mEffectsArray)
  {
    self->mEffectsArray = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v3 = -[NSDictionary objectForKey:](self->mEventsDictionary, "objectForKey:", CFSTR("effects"));
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v11;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(_QWORD *)v11 != v6)
            objc_enumerationMutation(v3);
          v8 = -[KPFGingerEffect initWithEffectDict:]([KPFGingerEffect alloc], "initWithEffectDict:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i));
          if (!-[NSString isEqualToString:](-[KPFGingerEffect name](v8, "name"), "isEqualToString:", CFSTR("none"))
            || !-[NSString isEqualToString:](-[KPFGingerEffect type](v8, "type"), "isEqualToString:", CFSTR("transition")))
          {
            -[NSMutableArray addObject:](self->mEffectsArray, "addObject:", v8);
          }

        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v5);
    }
  }
  return self->mEffectsArray;
}

@end
