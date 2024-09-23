@implementation KPFGingerEffect

- (KPFGingerEffect)initWithEffectDict:(id)a3
{
  KPFGingerEffect *v4;
  float v5;
  float v6;
  NSArray *mChildrenArray;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  objc_super v17;
  _BYTE v18[128];

  v17.receiver = self;
  v17.super_class = (Class)KPFGingerEffect;
  v4 = -[KPFGingerEffect init](&v17, "init");
  if (v4)
  {
    v4->mEffectDict = (NSDictionary *)a3;
    v4->mChildren = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v4->mBaseLayerDict = (NSDictionary *)objc_msgSend(a3, "objectForKey:", CFSTR("baseLayer"));
    v4->mName = (NSString *)objc_msgSend(a3, "objectForKey:", CFSTR("name"));
    v4->mType = (NSString *)objc_msgSend(a3, "objectForKey:", CFSTR("type"));
    objc_msgSend(objc_msgSend(a3, "objectForKey:", CFSTR("beginTime")), "floatValue");
    v4->mBeginTime = v5;
    objc_msgSend(objc_msgSend(a3, "objectForKey:", CFSTR("duration")), "floatValue");
    v4->mDuration = v6;
    v4->mChildrenArray = (NSArray *)objc_msgSend(a3, "objectForKey:", CFSTR("effects"));
    v4->mMovieDict = (NSDictionary *)objc_msgSend(a3, "objectForKey:", CFSTR("movie"));
    v4->mObjectID = (NSString *)objc_msgSend(a3, "objectForKey:", CFSTR("objectID"));
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    mChildrenArray = v4->mChildrenArray;
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](mChildrenArray, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v14 != v10)
            objc_enumerationMutation(mChildrenArray);
          -[KPFGingerEffect p_createSubEffectsFromDict:](v4, "p_createSubEffectsFromDict:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i));
        }
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](mChildrenArray, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
      }
      while (v9);
    }
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  self->mBuildRenderer = 0;
  self->mTransitionRenderer = 0;
  v3.receiver = self;
  v3.super_class = (Class)KPFGingerEffect;
  -[KPFGingerEffect dealloc](&v3, "dealloc");
}

- (void)setAnimationEndHandler:(id)a3
{
  self->mAnimationEndHandler = objc_msgSend(a3, "copy");
}

- (void)p_createSubEffectsFromDict:(id)a3
{
  KPFGingerEffect *v4;

  if (a3)
  {
    v4 = -[KPFGingerEffect initWithEffectDict:]([KPFGingerEffect alloc], "initWithEffectDict:", a3);
    -[NSMutableArray addObject:](self->mChildren, "addObject:", v4);

  }
}

- (void)renderEffectWithSession:(id)a3 withSwappableLayersDict:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  double v10;
  double v11;
  id v12;
  _OWORD v13[3];
  __int128 v14;
  __int128 v15;
  __int128 v16;

  self->mKPFSession = (KPFSession *)a3;
  self->mSwappableLayersDict = (NSMutableDictionary *)a4;
  self->mAnimationDict = (TSURetainedPointerKeyDictionary *)objc_alloc_init((Class)TSURetainedPointerKeyDictionary);

  self->mTextures = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  +[CATransaction begin](CATransaction, "begin");
  +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
  if (self->mMovieDict && !self->mBaseLayerDict)
  {
    -[KPFGingerSlide newMovieForTextureName:movieDict:withObjectID:](-[KPFSession currentSlide](self->mKPFSession, "currentSlide"), "newMovieForTextureName:movieDict:withObjectID:", 0, self->mMovieDict, -[KPFGingerEffect objectID](self, "objectID"));
    goto LABEL_14;
  }
  self->_baseLayer = (CALayer *)-[KPFGingerEffect p_newLayerFromDict:](self, "p_newLayerFromDict:", -[KPFGingerEffect baseLayerDict](self, "baseLayerDict"));
  if (!-[KPFGingerEffect objectID](self, "objectID"))
    goto LABEL_11;
  if (!self->mMovieDict)
  {
    v5 = -[KPFGingerSlide movieForObjectID:](-[KPFSession currentSlide](self->mKPFSession, "currentSlide"), "movieForObjectID:", -[KPFGingerEffect objectID](self, "objectID"));
    if (v5)
    {
      v6 = v5;
      v7 = -[NSArray objectAtIndexedSubscript:](-[CALayer sublayers](self->_baseLayer, "sublayers"), "objectAtIndexedSubscript:", 0);
      v8 = v7;
      if (v7)
      {
        objc_msgSend(v7, "affineTransform");
      }
      else
      {
        v15 = 0u;
        v16 = 0u;
        v14 = 0u;
      }
      v9 = objc_msgSend(v6, "playerLayer");
      v13[0] = v14;
      v13[1] = v15;
      v13[2] = v16;
      objc_msgSend(v9, "setAffineTransform:", v13);
      objc_msgSend(v8, "anchorPoint");
      objc_msgSend(objc_msgSend(v6, "playerLayer"), "setAnchorPoint:", v10, v11);
      -[CALayer insertSublayer:atIndex:](self->_baseLayer, "insertSublayer:atIndex:", objc_msgSend(v6, "playerLayer"), 1);
    }
LABEL_11:
    if (!self->mMovieDict)
      goto LABEL_14;
  }
  v12 = -[KPFGingerSlide movieForObjectID:](-[KPFSession currentSlide](self->mKPFSession, "currentSlide"), "movieForObjectID:", -[KPFGingerEffect objectID](self, "objectID"));
  if (v12)
    -[CALayer insertSublayer:atIndex:](self->_baseLayer, "insertSublayer:atIndex:", objc_msgSend(v12, "playerLayer"), 1);
LABEL_14:
  +[CATransaction commit](CATransaction, "commit");
  self->mAnimationsStarted = 0;
}

- (id)p_newLayerFromDict:(id)a3
{
  CALayer *v5;
  NSString *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  float v14;
  id v15;
  float v16;
  double v17;
  float v18;
  id v19;
  float v20;
  double v21;
  float v22;
  float v23;
  double v24;
  float v25;
  id v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  float v31;
  float v32;
  float v33;
  double v34;
  KPFSession *mKPFSession;
  id v36;
  KPFSession *v37;
  id v38;
  id v39;
  uint64_t v40;
  void *i;
  id v43;
  id v44;
  double v45;
  double v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _OWORD v51[8];
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _OWORD v60[8];
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _OWORD v69[3];
  _OWORD v70[8];
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  _BYTE v79[128];

  v5 = +[CALayer layer](CALayer, "layer");
  v6 = (NSString *)objc_msgSend(a3, "objectForKey:", CFSTR("texture"));
  v7 = objc_msgSend(a3, "objectForKey:", CFSTR("initialState"));
  v8 = objc_msgSend(a3, "objectForKey:", CFSTR("layers"));
  v9 = objc_msgSend(a3, "objectForKey:", CFSTR("objectID"));
  if (v9)
  {
    v10 = -[NSMutableDictionary objectForKey:](self->mSwappableLayersDict, "objectForKey:", v9);
    if (v10)
    {
      v11 = v10;
      v12 = objc_msgSend(v10, "superlayer");
      v13 = objc_msgSend(v11, "superlayer");
      if (v12)
        objc_msgSend(v13, "replaceSublayer:with:", v11, v5);
    }
    -[NSMutableDictionary setObject:forKey:](self->mSwappableLayersDict, "setObject:forKey:", v5, v9);
  }
  -[CALayer setMasksToBounds:](v5, "setMasksToBounds:", objc_msgSend(objc_msgSend(v7, "objectForKey:", CFSTR("masksToBounds")), "BOOLValue"));
  -[CALayer setHidden:](v5, "setHidden:", objc_msgSend(objc_msgSend(v7, "objectForKey:", CFSTR("hidden")), "BOOLValue"));
  objc_msgSend(objc_msgSend(v7, "objectForKey:", CFSTR("zIndex")), "floatValue");
  -[CALayer setZPosition:](v5, "setZPosition:", v14);
  -[CALayer setDoubleSided:](v5, "setDoubleSided:", 0);
  -[CALayer setEdgeAntialiasingMask:](v5, "setEdgeAntialiasingMask:", 0);
  v15 = objc_msgSend(v7, "objectForKey:", CFSTR("anchorPoint"));
  objc_msgSend(objc_msgSend(v15, "objectForKey:", CFSTR("pointX")), "floatValue");
  v17 = v16;
  objc_msgSend(objc_msgSend(v15, "objectForKey:", CFSTR("pointY")), "floatValue");
  -[CALayer setAnchorPoint:](v5, "setAnchorPoint:", v17, v18);
  v19 = objc_msgSend(v7, "objectForKey:", CFSTR("position"));
  objc_msgSend(objc_msgSend(v19, "objectForKey:", CFSTR("pointX")), "floatValue");
  v21 = v20;
  objc_msgSend(objc_msgSend(v19, "objectForKey:", CFSTR("pointY")), "floatValue");
  -[CALayer setPosition:](v5, "setPosition:", v21, v22);
  objc_msgSend(objc_msgSend(v7, "objectForKey:", CFSTR("width")), "floatValue");
  v24 = v23;
  objc_msgSend(objc_msgSend(v7, "objectForKey:", CFSTR("height")), "floatValue");
  -[CALayer setBounds:](v5, "setBounds:", 0.0, 0.0, v24, v25);
  v26 = objc_msgSend(v7, "objectForKey:", CFSTR("sublayerTransform"));
  if (self)
  {
    -[KPFGingerEffect p_transformFromArray:](self, "p_transformFromArray:", v26);
  }
  else
  {
    v77 = 0u;
    v78 = 0u;
    v75 = 0u;
    v76 = 0u;
    v73 = 0u;
    v74 = 0u;
    v71 = 0u;
    v72 = 0u;
  }
  v70[4] = v75;
  v70[5] = v76;
  v70[6] = v77;
  v70[7] = v78;
  v70[0] = v71;
  v70[1] = v72;
  v70[2] = v73;
  v70[3] = v74;
  -[CALayer setSublayerTransform:](v5, "setSublayerTransform:", v70);
  v27 = objc_msgSend(v7, "objectForKey:", CFSTR("affineTransform"));
  if (self)
    -[KPFGingerEffect p_affineTransformFromArray:](self, "p_affineTransformFromArray:", v27);
  else
    memset(v69, 0, sizeof(v69));
  -[CALayer setAffineTransform:](v5, "setAffineTransform:", v69);
  -[KPFGingerEffect p_rectFromDictionary:](self, "p_rectFromDictionary:", objc_msgSend(v7, "objectForKey:", CFSTR("contentsRect")));
  -[CALayer setContentsRect:](v5, "setContentsRect:");
  objc_msgSend(objc_msgSend(v7, "objectForKey:", CFSTR("opacity")), "floatValue");
  -[CALayer setOpacity:](v5, "setOpacity:");
  v28 = objc_msgSend(v7, "objectForKey:", CFSTR("backgroundColor"));
  if (v28)
    -[CALayer setBackgroundColor:](v5, "setBackgroundColor:", -[KPFGingerEffect p_colorFromArray:](self, "p_colorFromArray:", v28));
  v29 = objc_msgSend(v7, "objectForKey:", CFSTR("opacityMultiplier"));
  if (v29)
  {
    v30 = v29;
    -[CALayer opacity](v5, "opacity");
    v32 = v31;
    objc_msgSend(v30, "floatValue");
    *(float *)&v34 = v32 * v33;
    -[CALayer setOpacity:](v5, "setOpacity:", v34);
  }
  mKPFSession = self->mKPFSession;
  if (mKPFSession && v6)
  {
    -[CALayer setContents:](v5, "setContents:", -[KPFSession CGImageForTextureName:](mKPFSession, "CGImageForTextureName:", v6));
    -[CALayer setName:](v5, "setName:", v6);
    -[NSMutableArray addObject:](self->mTextures, "addObject:", v6);
  }
  if (v9)
    -[CALayer setName:](v5, "setName:", v9);
  v36 = objc_msgSend(a3, "objectForKey:", CFSTR("animations"));
  v37 = self->mKPFSession;
  if (v37)
  {
    if (!self->mMovie)
    {
      if (self->mMovieDict)
      {
        if (v6)
        {
          if (-[KPFSession movieNameForTextureName:](v37, "movieNameForTextureName:", v6))
          {
            if (-[NSString isEqualToString:](-[KPFGingerEffect name](self, "name"), "isEqualToString:", CFSTR("renderMovie")))
            {
              if (!-[NSString isEqualToString:](-[KPFGingerEffect type](self, "type"), "isEqualToString:", CFSTR("buildOut")))
              {
                -[KPFGingerSlide newMovieForTextureName:movieDict:withObjectID:](-[KPFSession currentSlide](self->mKPFSession, "currentSlide"), "newMovieForTextureName:movieDict:withObjectID:", v6, self->mMovieDict, -[KPFGingerEffect objectID](self, "objectID"));
                v43 = -[KPFGingerSlide movieForObjectID:](-[KPFSession currentSlide](self->mKPFSession, "currentSlide"), "movieForObjectID:", -[KPFGingerEffect objectID](self, "objectID"));
                if (v43)
                {
                  v44 = objc_msgSend(v43, "playerLayer");
                  -[KPFSession textureSizeForName:](self->mKPFSession, "textureSizeForName:", v6);
                  objc_msgSend(v44, "setBounds:", 0.0, 0.0, v45, v46);
                  -[CALayer anchorPoint](v5, "anchorPoint");
                  objc_msgSend(v44, "setAnchorPoint:");
                  -[CALayer position](v5, "position");
                  objc_msgSend(v44, "setPosition:");
                  if (v5)
                  {
                    -[CALayer sublayerTransform](v5, "sublayerTransform");
                  }
                  else
                  {
                    v67 = 0u;
                    v68 = 0u;
                    v65 = 0u;
                    v66 = 0u;
                    v63 = 0u;
                    v64 = 0u;
                    v61 = 0u;
                    v62 = 0u;
                  }
                  v60[4] = v65;
                  v60[5] = v66;
                  v60[6] = v67;
                  v60[7] = v68;
                  v60[0] = v61;
                  v60[1] = v62;
                  v60[2] = v63;
                  v60[3] = v64;
                  objc_msgSend(v44, "setSublayerTransform:", v60);
                  -[CALayer opacity](v5, "opacity");
                  objc_msgSend(v44, "setOpacity:");
                  -[CALayer zPosition](v5, "zPosition");
                  objc_msgSend(v44, "setZPosition:");
                  if (v5)
                  {
                    -[CALayer transform](v5, "transform");
                  }
                  else
                  {
                    v58 = 0u;
                    v59 = 0u;
                    v56 = 0u;
                    v57 = 0u;
                    v54 = 0u;
                    v55 = 0u;
                    v52 = 0u;
                    v53 = 0u;
                  }
                  v51[4] = v56;
                  v51[5] = v57;
                  v51[6] = v58;
                  v51[7] = v59;
                  v51[0] = v52;
                  v51[1] = v53;
                  v51[2] = v54;
                  v51[3] = v55;
                  objc_msgSend(v44, "setTransform:", v51);
                  objc_msgSend(v44, "setValue:forKey:", v5, CFSTR("textureLayer"));
                  -[CALayer setValue:forKey:](v5, "setValue:forKey:", v44, CFSTR("movieLayer"));
                  -[CALayer setHidden:](v5, "setHidden:", 0);
                }
              }
            }
          }
        }
      }
    }
  }
  if (objc_msgSend(v36, "count"))
  {
    -[TSURetainedPointerKeyDictionary setObject:forUncopiedKey:](self->mAnimationDict, "setObject:forUncopiedKey:", v36, v5);
    self->_layer = v5;
    self->_textureToBeAnimated = v6;
  }
  if (objc_msgSend(v8, "count"))
  {
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v38 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v47, v79, 16);
    if (v38)
    {
      v39 = v38;
      v40 = *(_QWORD *)v48;
      do
      {
        for (i = 0; i != v39; i = (char *)i + 1)
        {
          if (*(_QWORD *)v48 != v40)
            objc_enumerationMutation(v8);
          -[CALayer addSublayer:](v5, "addSublayer:", -[KPFGingerEffect p_newLayerFromDict:](self, "p_newLayerFromDict:", *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * (_QWORD)i)));
        }
        v39 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v47, v79, 16);
      }
      while (v39);
    }
  }
  return v5;
}

- (id)p_basicAnimationFromAnimationDict:(id)a3 forLayer:(id)a4
{
  id v7;
  CABasicAnimation *v8;
  float v9;
  double v10;
  float v11;

  if (!a4)
    return 0;
  v7 = objc_msgSend(a3, "objectForKey:", CFSTR("property"));
  if ((objc_msgSend(v7, "isEqualToString:", CFSTR("transform.rotation.y")) & 1) != 0
    || objc_msgSend(v7, "isEqualToString:", CFSTR("transform.translation.z")))
  {
    self->mRequiresPerspectiveTransform = 0;
  }
  v8 = +[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", v7);
  objc_msgSend(objc_msgSend(a3, "objectForKey:", CFSTR("beginTime")), "floatValue");
  -[CABasicAnimation setBeginTime:](v8, "setBeginTime:", v9);
  if (-[NSString isEqualToString:](-[KPFGingerEffect type](self, "type"), "isEqualToString:", CFSTR("transition")))
  {
    -[CABasicAnimation beginTime](v8, "beginTime");
    -[CABasicAnimation setBeginTime:](v8, "setBeginTime:", v10 + self->mBeginTime);
  }
  objc_msgSend(objc_msgSend(a3, "objectForKey:", CFSTR("duration")), "floatValue");
  -[CABasicAnimation setDuration:](v8, "setDuration:", v11);
  -[CABasicAnimation setFromValue:](v8, "setFromValue:", -[KPFGingerEffect p_propertyValueFromDictionary:forLayer:forAction:](self, "p_propertyValueFromDictionary:forLayer:forAction:", objc_msgSend(a3, "objectForKey:", CFSTR("from")), a4, v7));
  -[CABasicAnimation setToValue:](v8, "setToValue:", -[KPFGingerEffect p_propertyValueFromDictionary:forLayer:forAction:](self, "p_propertyValueFromDictionary:forLayer:forAction:", objc_msgSend(a3, "objectForKey:", CFSTR("to")), a4, v7));
  if (objc_msgSend(a3, "objectForKey:", CFSTR("timingFunction")))
    -[CABasicAnimation setTimingFunction:](v8, "setTimingFunction:", -[KPFGingerEffect p_timingFunctionFromString:forActionDictionary:](self, "p_timingFunctionFromString:forActionDictionary:", objc_msgSend(a3, "objectForKey:", CFSTR("timingFunction")), a3));
  -[CABasicAnimation setFillMode:](v8, "setFillMode:", -[KPFGingerEffect p_fillModefromDictionary:](self, "p_fillModefromDictionary:", a3));
  objc_msgSend(objc_msgSend(a3, "objectForKey:", CFSTR("repeatCount")), "floatValue");
  -[CABasicAnimation setRepeatCount:](v8, "setRepeatCount:");
  return v8;
}

- (id)p_keyframeAnimationFromAnimationDict:(id)a3 forLayer:(id)a4
{
  id v7;
  CAKeyframeAnimation *v8;
  float v9;
  double v10;
  float v11;
  id v12;
  id v13;
  CGPath *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  void *i;
  id v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  void *j;
  CAKeyframeAnimation *v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];

  v7 = objc_msgSend(a3, "objectForKey:", CFSTR("property"));
  v8 = +[CAKeyframeAnimation animationWithKeyPath:](CAKeyframeAnimation, "animationWithKeyPath:", v7);
  objc_msgSend(objc_msgSend(a3, "objectForKey:", CFSTR("beginTime")), "floatValue");
  -[CAKeyframeAnimation setBeginTime:](v8, "setBeginTime:", v9);
  if (-[NSString isEqualToString:](-[KPFGingerEffect type](self, "type"), "isEqualToString:", CFSTR("transition")))
  {
    -[CAKeyframeAnimation beginTime](v8, "beginTime");
    -[CAKeyframeAnimation setBeginTime:](v8, "setBeginTime:", v10 + self->mBeginTime);
  }
  objc_msgSend(objc_msgSend(a3, "objectForKey:", CFSTR("duration")), "floatValue");
  -[CAKeyframeAnimation setDuration:](v8, "setDuration:", v11);
  -[CAKeyframeAnimation setFillMode:](v8, "setFillMode:", -[KPFGingerEffect p_fillModefromDictionary:](self, "p_fillModefromDictionary:", a3));
  v12 = objc_msgSend(a3, "objectForKey:", CFSTR("path"));
  if (v12)
  {
    v13 = v12;
    if (objc_msgSend(v12, "count"))
    {
      v14 = -[KPFGingerEffect p_newPathFromArray:](self, "p_newPathFromArray:", v13);
      -[CAKeyframeAnimation setPath:](v8, "setPath:", v14);
      CGPathRelease(v14);
    }
  }
  v15 = objc_msgSend(a3, "objectForKey:", CFSTR("keyTimes"));
  if (v15)
  {
    v16 = v15;
    if (objc_msgSend(v15, "count"))
    {
      v30 = v8;
      v31 = a3;
      v17 = objc_msgSend(a3, "objectForKey:", CFSTR("timingFunctions"));
      v18 = +[NSMutableArray array](NSMutableArray, "array");
      v36 = 0u;
      v37 = 0u;
      v38 = 0u;
      v39 = 0u;
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v37;
        do
        {
          for (i = 0; i != v20; i = (char *)i + 1)
          {
            if (*(_QWORD *)v37 != v21)
              objc_enumerationMutation(v17);
            objc_msgSend(v18, "addObject:", -[KPFGingerEffect p_timingFunctionFromString:forActionDictionary:](self, "p_timingFunctionFromString:forActionDictionary:", objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)i), "objectForKey:", CFSTR("timingFunction")), *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)i)));
          }
          v20 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
        }
        while (v20);
      }
      v23 = objc_msgSend(v31, "objectForKey:", CFSTR("values"));
      v24 = +[NSMutableArray array](NSMutableArray, "array");
      v32 = 0u;
      v33 = 0u;
      v34 = 0u;
      v35 = 0u;
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
      if (v25)
      {
        v26 = v25;
        v27 = *(_QWORD *)v33;
        do
        {
          for (j = 0; j != v26; j = (char *)j + 1)
          {
            if (*(_QWORD *)v33 != v27)
              objc_enumerationMutation(v23);
            objc_msgSend(v24, "addObject:", -[KPFGingerEffect p_propertyValueFromDictionary:forLayer:forAction:](self, "p_propertyValueFromDictionary:forLayer:forAction:", *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)j), a4, v7));
          }
          v26 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
        }
        while (v26);
      }
      v8 = v30;
      -[CAKeyframeAnimation setKeyTimes:](v30, "setKeyTimes:", v16);
      -[CAKeyframeAnimation setTimingFunctions:](v30, "setTimingFunctions:", v18);
      -[CAKeyframeAnimation setValues:](v30, "setValues:", v24);
      objc_msgSend(objc_msgSend(v31, "objectForKey:", CFSTR("repeatCount")), "floatValue");
      -[CAKeyframeAnimation setRepeatCount:](v30, "setRepeatCount:");
    }
  }
  return v8;
}

- (id)p_groupedlLayerAnimationsFromAnimationDictionary:(id)a3 forLayer:(id)a4
{
  if (objc_msgSend(a3, "objectForKey:", CFSTR("keyTimes")) || objc_msgSend(a3, "objectForKey:", CFSTR("path")))
    return -[KPFGingerEffect p_keyframeAnimationFromAnimationDict:forLayer:](self, "p_keyframeAnimationFromAnimationDict:forLayer:", a3, a4);
  else
    return -[KPFGingerEffect p_basicAnimationFromAnimationDict:forLayer:](self, "p_basicAnimationFromAnimationDict:forLayer:", a3, a4);
}

- (void)p_setupAndAnimateGLAnimationsFromAttributesDict:(id)a3
{
  KPFGingerAnimationRegistry *v5;
  objc_class *v6;
  objc_class *v7;
  id v8;
  double mBeginTime;
  double mDuration;
  KPFMTLTransitionRenderer *v11;
  uint64_t v12;
  id v13;
  KPFMTLBuildRenderer *v14;
  uint64_t v15;
  uint64_t v16;

  v5 = -[KPFSession animationRegistry](self->mKPFSession, "animationRegistry");
  if (-[KPFGingerAnimationRegistry containsEffect:ofType:](v5, "containsEffect:ofType:", -[KPFGingerEffect name](self, "name"), -[KPFGingerEffect type](self, "type")))
  {
    v6 = -[KPFGingerAnimationRegistry effectClassWithName:andType:](v5, "effectClassWithName:andType:", -[KPFGingerEffect name](self, "name"), -[KPFGingerEffect type](self, "type"));
    if (v6)
    {
      v7 = v6;
      v8 = objc_msgSend(objc_msgSend(a3, "objectForKey:", CFSTR("direction")), "unsignedIntegerValue");
      mBeginTime = self->mBeginTime;
      mDuration = self->mDuration;
      if (-[NSString isEqualToString:](-[KPFGingerEffect type](self, "type"), "isEqualToString:", CFSTR("transition")))
      {
        v11 = -[KPFMTLTransitionRenderer initWithEffectClass:direction:duration:effect:session:]([KPFMTLTransitionRenderer alloc], "initWithEffectClass:direction:duration:effect:session:", v7, v8, self, self->mKPFSession, mDuration);
        self->mTransitionRenderer = (KPFTransitionProtocol *)v11;
        -[KPFMTLTransitionRenderer registerForTransitionEndCallback:target:](v11, "registerForTransitionEndCallback:target:", "p_glAnimationEndCallback", self);
        ++self->mAnimationsStarted;
        -[KPFTransitionProtocol animateWithDelay:](self->mTransitionRenderer, "animateWithDelay:", mBeginTime);
      }
      else if (-[NSString isEqualToString:](-[KPFGingerEffect type](self, "type"), "isEqualToString:", CFSTR("buildIn"))|| -[NSString isEqualToString:](-[KPFGingerEffect type](self, "type"), "isEqualToString:", CFSTR("buildOut")))
      {
        if (-[NSString isEqualToString:](-[KPFGingerEffect type](self, "type"), "isEqualToString:", CFSTR("buildIn")))
          v12 = 1;
        else
          v12 = 2;
        self->mTransitionRenderer = 0;
        LOWORD(v16) = 0;
        LOBYTE(v15) = 0;
        v13 = +[KNAnimatedBuild createWithBuildType:attributes:direction:effect:deliveryStyle:stageCount:eventIndex:stageIndex:startTime:eventStartTime:duration:automatic:renderer:animateAtEndOfPreviousBuild:isEmphasisBuild:](KNAnimatedBuild, "createWithBuildType:attributes:direction:effect:deliveryStyle:stageCount:eventIndex:stageIndex:startTime:eventStartTime:duration:automatic:renderer:animateAtEndOfPreviousBuild:isEmphasisBuild:", v12, a3, v8, -[KPFGingerEffect name](self, "name"), 0, 0, mBeginTime, mBeginTime, mDuration, 0, 0, v15, 0, v16);
        v14 = -[KPFMTLBuildRenderer initWithEffectClass:direction:duration:effect:session:]([KPFMTLBuildRenderer alloc], "initWithEffectClass:direction:duration:effect:session:", v7, v8, self, self->mKPFSession, mDuration);
        self->mBuildRenderer = (KPFBuildProtocol *)v14;
        -[KPFMTLBuildRenderer setAnimatedBuild:](v14, "setAnimatedBuild:", v13);
        -[KPFBuildProtocol registerForBuildEndCallback:target:](self->mBuildRenderer, "registerForBuildEndCallback:target:", "p_glAnimationEndCallback", self);
        ++self->mAnimationsStarted;
        -[KPFBuildProtocol animateAfterDelay:](self->mBuildRenderer, "animateAfterDelay:", mBeginTime);
      }
    }
  }
}

- (void)animateWithSession:(id)a3
{
  id v5;
  KPFGingerAnimationRegistry *v6;
  NSDictionary *mMovieDict;
  NSString *v8;
  id v9;
  NSString *v10;
  float v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *i;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  void *j;
  float v25;
  double v26;
  id v27;
  float v28;
  NSString *v29;
  float v30;
  double v31;
  float v32;
  NSString *v33;
  id obj;
  uint64_t v35;
  id v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  _BYTE v54[128];
  _BYTE v55[128];

  self->mKPFSession = (KPFSession *)a3;
  +[CATransaction begin](CATransaction, "begin");
  +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
  v5 = -[NSDictionary objectForKey:](self->mEffectDict, "objectForKey:", CFSTR("attributes"));
  v6 = -[KPFSession animationRegistry](self->mKPFSession, "animationRegistry");
  mMovieDict = self->mMovieDict;
  v8 = -[KPFGingerEffect name](self, "name");
  if (mMovieDict)
  {
    if (-[NSString isEqualToString:](v8, "isEqualToString:", CFSTR("renderMovie")))
    {
      v9 = objc_msgSend(a3, "currentSlide");
      v10 = -[KPFGingerEffect objectID](self, "objectID");
      objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->mEffectDict, "objectForKeyedSubscript:", CFSTR("beginTime")), "floatValue");
      objc_msgSend(v9, "playMovieForObjectID:afterDelay:", v10, v11);
    }
  }
  else if ((-[NSString isEqualToString:](v8, "isEqualToString:", CFSTR("apple:movie-start"))
          || -[NSString isEqualToString:](-[KPFGingerEffect name](self, "name"), "isEqualToString:", CFSTR("apple:audio-start")))&& -[NSString isEqualToString:](-[KPFGingerEffect type](self, "type"), "isEqualToString:", CFSTR("buildOut")))
  {
    objc_msgSend(objc_msgSend(a3, "currentSlide"), "stopMovieForObjectID:", -[KPFGingerEffect objectID](self, "objectID"));
  }
  else if (!-[NSString isEqualToString:](-[KPFGingerEffect name](self, "name"), "isEqualToString:", CFSTR("apple:audio-start"))|| !-[NSString isEqualToString:](-[KPFGingerEffect type](self, "type"), "isEqualToString:", CFSTR("buildIn")))
  {
    if (-[KPFGingerAnimationRegistry containsEffect:ofType:](v6, "containsEffect:ofType:", -[KPFGingerEffect name](self, "name"), -[KPFGingerEffect type](self, "type"))&& v5&& -[NSMutableArray count](self->mTextures, "count"))
    {
      v12 = objc_msgSend(-[NSMutableArray reverseObjectEnumerator](self->mTextures, "reverseObjectEnumerator"), "allObjects");
      -[NSMutableArray removeAllObjects](self->mTextures, "removeAllObjects");
      -[NSMutableArray addObjectsFromArray:](self->mTextures, "addObjectsFromArray:", v12);
      -[KPFGingerEffect p_setupAndAnimateGLAnimationsFromAttributesDict:](self, "p_setupAndAnimateGLAnimationsFromAttributesDict:", v5);
    }
    else
    {
      v51 = 0u;
      v52 = 0u;
      v49 = 0u;
      v50 = 0u;
      obj = -[TSURetainedPointerKeyDictionary allKeys](self->mAnimationDict, "allKeys");
      v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
      if (v36)
      {
        v35 = *(_QWORD *)v50;
        do
        {
          v13 = 0;
          do
          {
            if (*(_QWORD *)v50 != v35)
              objc_enumerationMutation(obj);
            v37 = v13;
            v14 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * v13);
            v15 = -[TSURetainedPointerKeyDictionary objectForKey:](self->mAnimationDict, "objectForKey:", v14);
            v45 = 0u;
            v46 = 0u;
            v47 = 0u;
            v48 = 0u;
            v38 = v15;
            v40 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
            if (v40)
            {
              v39 = *(_QWORD *)v46;
              do
              {
                for (i = 0; i != v40; i = (char *)i + 1)
                {
                  if (*(_QWORD *)v46 != v39)
                    objc_enumerationMutation(v38);
                  v17 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * (_QWORD)i);
                  self->mRequiresPerspectiveTransform = 0;
                  v18 = objc_msgSend(v17, "objectForKey:", CFSTR("animations"));
                  v19 = objc_msgSend(v18, "count");
                  v20 = +[NSMutableArray array](NSMutableArray, "array");
                  if (v19)
                  {
                    v43 = 0u;
                    v44 = 0u;
                    v41 = 0u;
                    v42 = 0u;
                    v21 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v41, v53, 16);
                    if (v21)
                    {
                      v22 = v21;
                      v23 = *(_QWORD *)v42;
                      do
                      {
                        for (j = 0; j != v22; j = (char *)j + 1)
                        {
                          if (*(_QWORD *)v42 != v23)
                            objc_enumerationMutation(v18);
                          objc_msgSend(v20, "addObject:", -[KPFGingerEffect p_groupedlLayerAnimationsFromAnimationDictionary:forLayer:](self, "p_groupedlLayerAnimationsFromAnimationDictionary:forLayer:", *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)j), v14));
                        }
                        v22 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v41, v53, 16);
                      }
                      while (v22);
                    }
                    objc_msgSend(objc_msgSend(v17, "objectForKey:", CFSTR("beginTime")), "floatValue");
                    v26 = v25;
                    if (-[NSString isEqualToString:](-[KPFGingerEffect type](self, "type"), "isEqualToString:", CFSTR("transition")))
                    {
                      v26 = self->mBeginTime + v26;
                    }
                    v27 = +[CAAnimationGroup animation](CAAnimationGroup, "animation");
                    objc_msgSend(v27, "setAnimations:", v20);
                    objc_msgSend(objc_msgSend(v17, "objectForKey:", CFSTR("duration")), "floatValue");
                    objc_msgSend(v27, "setDuration:", v26 + v28);
                    objc_msgSend(v27, "setFillMode:", kCAFillModeForwards);
                    objc_msgSend(objc_msgSend(v17, "objectForKey:", CFSTR("repeatCount")), "floatValue");
                    objc_msgSend(v27, "setRepeatCount:");
                    if (objc_msgSend(v17, "objectForKey:", CFSTR("timingFunction")))
                      objc_msgSend(v27, "setTimingFunction:", -[KPFGingerEffect p_timingFunctionFromString:forActionDictionary:](self, "p_timingFunctionFromString:forActionDictionary:", objc_msgSend(v17, "objectForKey:", CFSTR("timingFunction")), v17));
                    objc_msgSend(v27, "setDelegate:", self);
                    objc_msgSend(v27, "setRemovedOnCompletion:", 0);
                    objc_msgSend(v27, "setValue:forKey:", v14, CFSTR("layer"));
                    v29 = (NSString *)objc_msgSend(objc_msgSend(v20, "objectAtIndex:", 0), "keyPath");
                  }
                  else
                  {
                    objc_msgSend(v20, "addObject:", -[KPFGingerEffect p_groupedlLayerAnimationsFromAnimationDictionary:forLayer:](self, "p_groupedlLayerAnimationsFromAnimationDictionary:forLayer:", v17, v14));
                    objc_msgSend(objc_msgSend(v17, "objectForKey:", CFSTR("beginTime")), "floatValue");
                    v31 = v30;
                    if (-[NSString isEqualToString:](-[KPFGingerEffect type](self, "type"), "isEqualToString:", CFSTR("transition")))
                    {
                      v31 = self->mBeginTime + v31;
                    }
                    v27 = +[CAAnimationGroup animation](CAAnimationGroup, "animation");
                    objc_msgSend(v27, "setAnimations:", v20);
                    objc_msgSend(objc_msgSend(v17, "objectForKey:", CFSTR("duration")), "floatValue");
                    objc_msgSend(v27, "setDuration:", v31 + v32);
                    objc_msgSend(objc_msgSend(v17, "objectForKey:", CFSTR("repeatCount")), "floatValue");
                    objc_msgSend(v27, "setRepeatCount:");
                    objc_msgSend(v27, "setFillMode:", kCAFillModeForwards);
                    objc_msgSend(v27, "setDelegate:", self);
                    objc_msgSend(v27, "setRemovedOnCompletion:", 0);
                    objc_msgSend(v27, "setValue:forKey:", v14, CFSTR("layer"));
                    v29 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), objc_msgSend(v17, "objectForKey:", CFSTR("property")));
                  }
                  v33 = v29;
                  if (!objc_msgSend(v14, "animationForKey:", v29))
                    ++self->mAnimationsStarted;
                  objc_msgSend(v14, "addAnimation:forKey:", v27, v33);
                }
                v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
              }
              while (v40);
            }
            v13 = v37 + 1;
          }
          while ((id)(v37 + 1) != v36);
          v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
        }
        while (v36);
      }
    }
  }
  +[CATransaction commit](CATransaction, "commit");
  if (!self->mAnimationsStarted)
    -[KPFGingerEffect animationDidEnd](self, "animationDidEnd");
}

- (BOOL)containsMovie
{
  BOOL v2;
  NSMutableArray *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v2 = self->mMovieDict != 0;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = -[KPFGingerEffect children](self, "children", 0);
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i), "containsMovie") & 1) != 0)
          return 1;
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v5)
        continue;
      break;
    }
    return 0;
  }
  return v2;
}

- (BOOL)isMoviePlaying
{
  KPFMovie *mMovie;
  unsigned __int8 v4;
  NSMutableArray *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  mMovie = self->mMovie;
  if (mMovie)
    v4 = -[KPFMovie isPlaying](mMovie, "isPlaying");
  else
    v4 = 0;
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = -[KPFGingerEffect children](self, "children", 0);
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i), "isMoviePlaying") & 1) != 0)
          return 1;
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v7)
        continue;
      break;
    }
    return 0;
  }
  return v4;
}

- (void)stopMoviePlayback
{
  KPFMovie *mMovie;
  NSMutableArray *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  mMovie = self->mMovie;
  if (mMovie)
  {
    if (-[KPFMovie isPlaying](mMovie, "isPlaying"))
      -[KPFMovie stop](self->mMovie, "stop");
    -[KPFGingerEffect animationDidEnd](self, "animationDidEnd");
  }
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v4 = -[KPFGingerEffect children](self, "children", 0);
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v8), "stopMoviePlayback");
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }
}

- (void)pauseMoviePlayback
{
  NSMutableArray *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  if (-[KPFGingerEffect isMoviePlaying](self, "isMoviePlaying"))
    -[KPFMovie pause](self->mMovie, "pause");
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v3 = -[KPFGingerEffect children](self, "children", 0);
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)v7), "pauseMoviePlayback");
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }
}

- (void)resumeMoviePlayback
{
  NSMutableArray *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  if (-[KPFGingerEffect isMoviePlaying](self, "isMoviePlaying"))
    -[KPFMovie resume](self->mMovie, "resume");
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v3 = -[KPFGingerEffect children](self, "children", 0);
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)v7), "resumeMoviePlayback");
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }
}

- (void)tearDown
{
  KPFTransitionProtocol *mTransitionRenderer;
  KPFBuildProtocol *mBuildRenderer;
  KPFMovie *mMovie;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  NSMutableArray *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];

  mTransitionRenderer = self->mTransitionRenderer;
  if (mTransitionRenderer)
  {
    -[KPFTransitionProtocol removeAnimations](mTransitionRenderer, "removeAnimations");
    -[KPFTransitionProtocol teardown](self->mTransitionRenderer, "teardown");
  }
  mBuildRenderer = self->mBuildRenderer;
  if (mBuildRenderer)
  {
    -[KPFBuildProtocol stopAnimations](mBuildRenderer, "stopAnimations");
    -[KPFBuildProtocol teardown](self->mBuildRenderer, "teardown");
  }
  mMovie = self->mMovie;
  if (mMovie)
    -[KPFMovie stop](mMovie, "stop");
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = -[TSURetainedPointerKeyDictionary allKeys](self->mAnimationDict, "allKeys");
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v21;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v10), "removeAllAnimations");
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v8);
  }

  self->mAnimationDict = 0;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v11 = -[KPFGingerEffect children](self, "children", 0);
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v17;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v17 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v15), "tearDown");
        v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v13);
  }
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

- (void)p_animateSubEffect:(id)a3
{
  _QWORD v5[5];

  objc_msgSend(a3, "renderEffectWithSession:withSwappableLayersDict:", self->mKPFSession, self->mSwappableLayersDict);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_8CD4;
  v5[3] = &unk_426DD0;
  v5[4] = self;
  objc_msgSend(a3, "setAnimationEndHandler:", v5);
  if ((objc_msgSend(a3, "containsMovie") & 1) == 0)
    ++self->mAnimationsStarted;
  objc_msgSend(a3, "animateWithSession:", self->mKPFSession);
}

- (void)p_glAnimationEndCallback
{
  unint64_t mAnimationsStarted;

  mAnimationsStarted = self->mAnimationsStarted;
  if (mAnimationsStarted)
    self->mAnimationsStarted = mAnimationsStarted - 1;
  -[KPFGingerEffect animationDidEnd](self, "animationDidEnd");
}

- (void)p_subAnimationEnded
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

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  unint64_t mAnimationsStarted;
  unint64_t v5;

  if (a4)
  {
    mAnimationsStarted = self->mAnimationsStarted;
    if (!mAnimationsStarted || (v5 = mAnimationsStarted - 1, (self->mAnimationsStarted = v5) == 0))
      -[KPFGingerEffect animationDidEnd](self, "animationDidEnd", a3);
  }
}

- (void)animationDidEnd
{
  NSMutableArray *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void (**mAnimationEndHandler)(void);
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  if (-[NSMutableArray count](-[KPFGingerEffect children](self, "children"), "count"))
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v3 = -[KPFGingerEffect children](self, "children", 0);
    v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v10;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(_QWORD *)v10 != v6)
            objc_enumerationMutation(v3);
          -[KPFGingerEffect p_animateSubEffect:](self, "p_animateSubEffect:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i));
        }
        v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v5);
    }
  }
  else if (!self->mAnimationsStarted)
  {
    mAnimationEndHandler = (void (**)(void))self->mAnimationEndHandler;
    if (mAnimationEndHandler)
      mAnimationEndHandler[2]();
  }
}

- (id)p_fillModefromDictionary:(id)a3
{
  id v3;
  id *v4;
  unsigned int v5;

  v3 = objc_msgSend(a3, "objectForKey:", CFSTR("fillMode"));
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("both")) & 1) != 0)
  {
    v4 = (id *)&kCAFillModeBoth;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("forwards")) & 1) != 0)
  {
    v4 = (id *)&kCAFillModeForwards;
  }
  else
  {
    v5 = objc_msgSend(v3, "isEqualToString:", CFSTR("backwards"));
    v4 = (id *)&kCAFillModeRemoved;
    if (v5)
      v4 = (id *)&kCAFillModeBackwards;
  }
  return *v4;
}

- (CGPath)p_newPathFromArray:(id)a3
{
  CGPath *Mutable;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  float v13;
  CGFloat v14;
  float v15;
  float v16;
  CGFloat v17;
  float v18;
  id obj;
  uint64_t v21;
  id v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];

  Mutable = CGPathCreateMutable();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = a3;
  v22 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v22)
  {
    v21 = *(_QWORD *)v29;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v29 != v21)
          objc_enumerationMutation(obj);
        v23 = v5;
        v6 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v5);
        v7 = objc_msgSend(v6, "objectForKey:", CFSTR("points"));
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v25;
          do
          {
            for (i = 0; i != v9; i = (char *)i + 1)
            {
              if (*(_QWORD *)v25 != v10)
                objc_enumerationMutation(v7);
              v12 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i);
              if (objc_msgSend(objc_msgSend(v6, "objectForKey:", CFSTR("type")), "isEqualToString:", CFSTR("MoveToPoint")))
              {
                objc_msgSend(objc_msgSend(v12, "objectAtIndex:", 0), "floatValue");
                v14 = v13;
                objc_msgSend(objc_msgSend(v12, "objectAtIndex:", 1), "floatValue");
                CGPathMoveToPoint(Mutable, 0, v14, v15);
              }
              else if (objc_msgSend(objc_msgSend(v6, "objectForKey:", CFSTR("type")), "isEqualToString:", CFSTR("AddLine")))
              {
                objc_msgSend(objc_msgSend(v12, "objectAtIndex:", 0), "floatValue");
                v17 = v16;
                objc_msgSend(objc_msgSend(v12, "objectAtIndex:", 1), "floatValue");
                CGPathAddLineToPoint(Mutable, 0, v17, v18);
              }
            }
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
          }
          while (v9);
        }
        v5 = v23 + 1;
      }
      while ((id)(v23 + 1) != v22);
      v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v22);
  }
  return Mutable;
}

- (id)p_propertyValueFromDictionary:(id)a3 forLayer:(id)a4 forAction:(id)a5
{
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;
  double v16;
  double v17;
  float v18;
  double v19;
  float v20;
  double v21;
  double v22;
  id v23;
  uint64_t v24;
  float v25;
  double v26;
  float v27;
  id v28;
  float v29;
  double v30;
  float v31;
  double v32;
  float v33;
  double v34;
  float v35;
  CATransform3D v36;
  CATransform3D b;
  CATransform3D v38;
  CATransform3D v39;

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
    || (objc_msgSend(a5, "isEqualToString:", CFSTR("translation.z")) & 1) != 0
    || (objc_msgSend(a5, "isEqualToString:", CFSTR("transform.scale.xy")) & 1) != 0
    || (objc_msgSend(a5, "isEqualToString:", CFSTR("sublayerTransform.rotation.x")) & 1) != 0
    || (objc_msgSend(a5, "isEqualToString:", CFSTR("sublayerTransform.rotation.y")) & 1) != 0
    || (objc_msgSend(a5, "isEqualToString:", CFSTR("transform.rotation")) & 1) != 0
    || (objc_msgSend(a5, "isEqualToString:", CFSTR("opacity")) & 1) != 0
    || (objc_msgSend(a5, "isEqualToString:", CFSTR("doubleSided")) & 1) != 0
    || objc_msgSend(a5, "isEqualToString:", CFSTR("sublayerTransform.transform.scale")))
  {
    return objc_msgSend(a3, "objectForKey:", CFSTR("scalar"));
  }
  if (objc_msgSend(a5, "isEqualToString:", CFSTR("transform.translation.x"))
    || objc_msgSend(a5, "isEqualToString:", CFSTR("transform.translation.y"))
    || objc_msgSend(a5, "isEqualToString:", CFSTR("transform.translation.z")))
  {
    objc_msgSend(objc_msgSend(a3, "objectForKey:", CFSTR("scalar")), "floatValue");
    return +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  }
  if (objc_msgSend(a5, "isEqualToString:", CFSTR("opacityMultiplier")))
  {
    objc_msgSend(a4, "opacity");
    objc_msgSend(objc_msgSend(a3, "objectForKey:", CFSTR("scalar")), "floatValue");
    return +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  }
  if (objc_msgSend(a5, "isEqualToString:", CFSTR("translationEmphasis")))
  {
    v10 = objc_msgSend(a3, "objectForKey:", CFSTR("translationEmphasis"));
    objc_msgSend(a4, "position");
    v12 = v11;
    v14 = v13;
    v15 = objc_msgSend(a4, "valueForKey:", CFSTR("addtionalInitialTranslation"));
    if (v15)
    {
      objc_msgSend(v15, "CGPointValue");
      v12 = v12 - v16;
      v14 = v14 - v17;
    }
    objc_msgSend(objc_msgSend(v10, "objectAtIndex:", 0), "floatValue");
    v19 = v12 + v18;
    objc_msgSend(objc_msgSend(v10, "objectAtIndex:", 1), "floatValue");
    v21 = v14 + v20;
    v22 = v19;
    return +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", v22, v21);
  }
  if (objc_msgSend(a5, "isEqualToString:", CFSTR("rotationEmphasis")))
  {
    v23 = objc_msgSend(a3, "objectForKey:", CFSTR("rotationEmphasis"));
    v24 = 6;
    return objc_msgSend(v23, "objectAtIndex:", v24);
  }
  if (objc_msgSend(a5, "isEqualToString:", CFSTR("scaleEmphasis")))
  {
    v23 = objc_msgSend(a3, "objectForKey:", CFSTR("scaleEmphasis"));
    v24 = 3;
    return objc_msgSend(v23, "objectAtIndex:", v24);
  }
  if ((objc_msgSend(a5, "isEqualToString:", CFSTR("transform.translation")) & 1) != 0
    || objc_msgSend(a5, "isEqualToString:", CFSTR("anchorPoint"))
    || objc_msgSend(a5, "isEqualToString:", CFSTR("position")))
  {
    objc_msgSend(objc_msgSend(a3, "objectForKey:", CFSTR("pointX")), "floatValue");
    v26 = v25;
    objc_msgSend(objc_msgSend(a3, "objectForKey:", CFSTR("pointY")), "floatValue");
    v21 = v27;
    v22 = v26;
    return +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", v22, v21);
  }
  if (objc_msgSend(a5, "isEqualToString:", CFSTR("transform")))
  {
    memset(&v39, 0, sizeof(v39));
    v28 = objc_msgSend(a3, "objectForKey:", CFSTR("transform"));
    if (self)
      -[KPFGingerEffect p_transformFromArray:](self, "p_transformFromArray:", v28);
    else
      memset(&v39, 0, sizeof(v39));
    if (a4)
      objc_msgSend(a4, "transform");
    else
      memset(&b, 0, sizeof(b));
    v36 = v39;
    CATransform3DConcat(&v38, &v36, &b);
    v39 = v38;
    return +[NSValue valueWithCATransform3D:](NSValue, "valueWithCATransform3D:", &v38);
  }
  else
  {
    if (objc_msgSend(a5, "isEqualToString:", CFSTR("contents")))
    {
      if (self->mKPFSession)
        return -[KPFSession CGImageForTextureName:](self->mKPFSession, "CGImageForTextureName:", objc_msgSend(a3, "objectForKey:", CFSTR("texture")));
    }
    else if (objc_msgSend(a5, "isEqualToString:", CFSTR("bounds")))
    {
      objc_msgSend(objc_msgSend(a3, "objectForKey:", CFSTR("pointX")), "floatValue");
      v30 = v29;
      objc_msgSend(objc_msgSend(a3, "objectForKey:", CFSTR("pointY")), "floatValue");
      v32 = v31;
      objc_msgSend(objc_msgSend(a3, "objectForKey:", CFSTR("width")), "floatValue");
      v34 = v33;
      objc_msgSend(objc_msgSend(a3, "objectForKey:", CFSTR("height")), "floatValue");
      return +[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", v30, v32, v34, v35);
    }
    return 0;
  }
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

- (CGColor)p_colorFromArray:(id)a3
{
  CGColor *result;
  float v5;
  double v6;
  float v7;
  double v8;
  float v9;
  double v10;
  float v11;

  result = (CGColor *)objc_msgSend(+[TSUColor blackColor](TSUColor, "blackColor"), "CGColor");
  if (a3)
  {
    objc_msgSend(objc_msgSend(a3, "objectAtIndexedSubscript:", 0), "floatValue");
    v6 = v5;
    objc_msgSend(objc_msgSend(a3, "objectAtIndexedSubscript:", 1), "floatValue");
    v8 = v7;
    objc_msgSend(objc_msgSend(a3, "objectAtIndexedSubscript:", 2), "floatValue");
    v10 = v9;
    objc_msgSend(objc_msgSend(a3, "objectAtIndexedSubscript:", 3), "floatValue");
    return (CGColor *)-[TSUColor CGColor](+[TSUColor colorWithRed:green:blue:alpha:](TSUColor, "colorWithRed:green:blue:alpha:", v6, v8, v10, v11), "CGColor");
  }
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

- (NSDictionary)baseLayerDict
{
  return self->mBaseLayerDict;
}

- (NSMutableArray)children
{
  return self->mChildren;
}

- (NSString)name
{
  return self->mName;
}

- (NSString)type
{
  return self->mType;
}

- (NSMutableArray)textures
{
  return self->mTextures;
}

- (NSString)objectID
{
  return self->mObjectID;
}

- (CALayer)layer
{
  return self->_layer;
}

- (CALayer)baseLayer
{
  return self->_baseLayer;
}

- (NSString)textureToBeAnimated
{
  return self->_textureToBeAnimated;
}

@end
