@implementation PU_VKCImageSubjectGlowLayer

- (PU_VKCImageSubjectGlowLayer)init
{
  PU_VKCImageSubjectGlowLayer *v2;
  CALayer *v3;
  CALayer *glowLayer;
  double v5;
  uint64_t v6;
  NSMutableDictionary *subLayersMap;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PU_VKCImageSubjectGlowLayer;
  v2 = -[PU_VKCImageSubjectGlowLayer init](&v9, sel_init);
  if (v2)
  {
    v3 = (CALayer *)objc_alloc_init(MEMORY[0x1E0CD27A8]);
    glowLayer = v2->_glowLayer;
    v2->_glowLayer = v3;

    -[CALayer setBackgroundColor:](v2->_glowLayer, "setBackgroundColor:", 0);
    -[PU_VKCImageSubjectGlowLayer addSublayer:](v2, "addSublayer:", v2->_glowLayer);
    -[CALayer setAllowsGroupBlending:](v2->_glowLayer, "setAllowsGroupBlending:", 0);
    -[CALayer setAllowsGroupOpacity:](v2->_glowLayer, "setAllowsGroupOpacity:", 0);
    LODWORD(v5) = 0;
    -[CALayer setOpacity:](v2->_glowLayer, "setOpacity:", v5);
    -[PU_VKCImageSubjectGlowLayer setAllowsGroupBlending:](v2, "setAllowsGroupBlending:", 0);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = objc_claimAutoreleasedReturnValue();
    subLayersMap = v2->_subLayersMap;
    v2->_subLayersMap = (NSMutableDictionary *)v6;

  }
  return v2;
}

- (id)thinGlowParametersWithScreenScale:(double)a3 viewScale:(double)a4
{
  PU_VKCGlowParameters *v6;
  uint64_t v7;
  uint64_t v8;

  v6 = objc_alloc_init(PU_VKCGlowParameters);
  -[PU_VKCGlowParameters setMinThickness:](v6, "setMinThickness:", a4 * 0.3);
  -[PU_VKCGlowParameters setMaxThickness:](v6, "setMaxThickness:", a4 * 1.5);
  -[PU_VKCGlowParameters setBlurRadius:](v6, "setBlurRadius:", a4 * 1.5);
  -[PU_VKCGlowParameters setStrokeLengthFraction:](v6, "setStrokeLengthFraction:", 0.25);
  -[PU_VKCGlowParameters setStrokeTaperLength:](v6, "setStrokeTaperLength:", a4 * 200.0);
  -[PU_VKCGlowParameters setMinOpacity:](v6, "setMinOpacity:", 1.0);
  -[PU_VKCGlowParameters setMaxOpacity:](v6, "setMaxOpacity:", 1.0);
  v7 = 12;
  if (a3 == 2.0)
    v7 = 8;
  if (a3 == 1.0)
    v8 = 6;
  else
    v8 = v7;
  -[PU_VKCGlowParameters setStrokeCount:](v6, "setStrokeCount:", v8);
  return v6;
}

- (id)thickGlowParametersWithViewScale:(double)a3
{
  PU_VKCGlowParameters *v4;

  v4 = objc_alloc_init(PU_VKCGlowParameters);
  -[PU_VKCGlowParameters setMinThickness:](v4, "setMinThickness:", a3 * 4.0);
  -[PU_VKCGlowParameters setMaxThickness:](v4, "setMaxThickness:", a3 * 16.0);
  -[PU_VKCGlowParameters setBlurRadius:](v4, "setBlurRadius:", a3 * 20.0);
  -[PU_VKCGlowParameters setStrokeLengthFraction:](v4, "setStrokeLengthFraction:", 0.25);
  -[PU_VKCGlowParameters setStrokeTaperLength:](v4, "setStrokeTaperLength:", a3 * 200.0);
  -[PU_VKCGlowParameters setMinOpacity:](v4, "setMinOpacity:", 0.1);
  -[PU_VKCGlowParameters setMaxOpacity:](v4, "setMaxOpacity:", 0.2);
  -[PU_VKCGlowParameters setStrokeCount:](v4, "setStrokeCount:", 3);
  return v4;
}

- (void)beginAnimationWithViewScale:(double)a3 screenScale:(double)a4 path:(id)a5 index:(int64_t)a6 count:(int64_t)a7 identifier:(id)a8
{
  void *v9;
  double v10;
  void *v11;
  double v12;

  -[PU_VKCImageSubjectGlowLayer configureAnimationWithViewScale:screenScale:path:index:count:identifier:](self, "configureAnimationWithViewScale:screenScale:path:index:count:identifier:", a5, a6, a7, a8, a3, a4);
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  -[PU_VKCImageSubjectGlowLayer glowLayer](self, "glowLayer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v10) = 0;
  objc_msgSend(v9, "setOpacity:", v10);

  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setAnimationDuration:", 2.0);
  -[PU_VKCImageSubjectGlowLayer glowLayer](self, "glowLayer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v12) = 1.0;
  objc_msgSend(v11, "setOpacity:", v12);

  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  -[PU_VKCImageSubjectGlowLayer setActive:](self, "setActive:", 1);
}

- (void)stopAnimationAnimated:(BOOL)a3
{
  -[PU_VKCImageSubjectGlowLayer hideGlow:](self, "hideGlow:", a3);
  -[PU_VKCImageSubjectGlowLayer setActive:](self, "setActive:", 0);
}

- (void)hideGlow:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  -[PU_VKCImageSubjectGlowLayer glowLayer](self, "glowLayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sublayers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CD28B0], "setAnimationDuration:", 0.35);
    LODWORD(v9) = 0;
    objc_msgSend(v5, "setOpacity:", v9);
    v10 = (void *)MEMORY[0x1E0CD28B0];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __40__PU_VKCImageSubjectGlowLayer_hideGlow___block_invoke;
    v12[3] = &unk_1E5149198;
    v13 = v7;
    objc_msgSend(v10, "setCompletionBlock:", v12);

  }
  else
  {
    LODWORD(v8) = 0;
    objc_msgSend(v5, "setOpacity:", v8);
    objc_msgSend(v7, "makeObjectsPerformSelector:", sel_removeFromSuperlayer);
  }
  -[PU_VKCImageSubjectGlowLayer subLayersMap](self, "subLayersMap");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeAllObjects");

  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

- (void)stopAnimationForIdentifier:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v4 = a4;
  v6 = a3;
  -[PU_VKCImageSubjectGlowLayer subLayersMap](self, "subLayersMap");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copy");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    objc_msgSend(MEMORY[0x1E0CD28B0], "setAnimationDuration:", 0.2);
    v10 = (void *)MEMORY[0x1E0CD28B0];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __67__PU_VKCImageSubjectGlowLayer_stopAnimationForIdentifier_animated___block_invoke;
    v12[3] = &unk_1E5149198;
    v13 = v9;
    objc_msgSend(v10, "setCompletionBlock:", v12);
    objc_msgSend(MEMORY[0x1E0CD28B0], "commit");

  }
  else
  {
    objc_msgSend(v9, "makeObjectsPerformSelector:", sel_removeFromSuperlayer);
  }
  -[PU_VKCImageSubjectGlowLayer subLayersMap](self, "subLayersMap");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", 0, v6);

}

- (void)configureAnimationWithViewScale:(double)a3 screenScale:(double)a4 path:(id)a5 index:(int64_t)a6 count:(int64_t)a7 identifier:(id)a8
{
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  uint64_t i;
  double v25;
  void *v26;
  uint64_t v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  id v36;
  _QWORD v37[5];
  id v38;
  uint64_t v39;
  double v40;
  double v41;
  double v42;
  double v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _QWORD v49[3];

  v49[2] = *MEMORY[0x1E0C80C00];
  v14 = a5;
  v15 = a8;
  -[PU_VKCImageSubjectGlowLayer thinGlowParametersWithScreenScale:viewScale:](self, "thinGlowParametersWithScreenScale:viewScale:", a4, a3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v49[0] = v16;
  -[PU_VKCImageSubjectGlowLayer thickGlowParametersWithViewScale:](self, "thickGlowParametersWithViewScale:", a3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v49[1] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v19 = v18;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v45;
    v23 = 0.0;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v45 != v22)
          objc_enumerationMutation(v19);
        objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * i), "strokeLengthFraction");
        if (v23 < v25)
          v23 = v25;
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
    }
    while (v21);
  }
  else
  {
    v23 = 0.0;
  }

  objc_msgSend(v14, "bezierPathByReversingPath");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = objc_msgSend(v26, "vk_CGPath");
  objc_msgSend(v26, "vk_lengthIgnoringCurves");
  v29 = v28;
  v30 = v28 / 550.0;
  v31 = 1.5;
  if (v30 >= 1.5)
  {
    v31 = v30;
    if (v30 > 3.0)
      v31 = 3.0;
  }
  v32 = v31 / (double)a7 * (double)a6;
  if (a7 < 1)
    v32 = 0.0;
  if (a6 >= 1)
    v33 = v32;
  else
    v33 = 0.0;
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin", 0.0, v32);
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v19, "count"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[PU_VKCImageSubjectGlowLayer subLayersMap](self, "subLayersMap");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setObject:forKeyedSubscript:", v34, v15);

  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __103__PU_VKCImageSubjectGlowLayer_configureAnimationWithViewScale_screenScale_path_index_count_identifier___block_invoke;
  v37[3] = &unk_1E51491C0;
  v38 = v15;
  v39 = v27;
  v40 = v29;
  v41 = v31;
  v42 = v23;
  v43 = v33;
  v37[4] = self;
  v36 = v15;
  objc_msgSend(v19, "enumerateObjectsUsingBlock:", v37);
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");

}

- (void)renderGlowParameters:(id)a3 path:(CGPath *)a4 pathLength:(double)a5 duration:(double)a6 maxStrokeLengthFraction:(id)a7 beginDelay:(double)a8 identifier:(id)a9
{
  id v15;
  id v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  unint64_t v33;
  PU_VKCImageSubjectGlowLayer *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  double v61;
  void *v62;
  void *v64;
  void *v65;
  void *v66;
  _OWORD v67[5];
  _QWORD v68[2];
  _QWORD v69[2];
  _QWORD v70[3];

  v70[1] = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a7;
  v59 = a9;
  objc_msgSend(v15, "blurRadius");
  v18 = v17;
  objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2C88]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setValue:forKeyPath:", v20, *MEMORY[0x1E0CD2D90]);

  objc_msgSend(v19, "setValue:forKey:", CFSTR("low"), *MEMORY[0x1E0CD2D88]);
  objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2F08]);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v67[0] = xmmword_1A7C0C9B0;
  v67[1] = xmmword_1A7C0C9C0;
  v67[2] = xmmword_1A7C0C9D0;
  v67[3] = xmmword_1A7C0C9E0;
  v67[4] = xmmword_1A7C0C9F0;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCAColorMatrix:", v67);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = v21;
  objc_msgSend(v21, "setValue:forKeyPath:", v22, CFSTR("inputColorMatrix"));

  v23 = objc_alloc_init(MEMORY[0x1E0CD27A8]);
  v58 = v19;
  v70[0] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v70, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setFilters:", v24);

  objc_msgSend(v23, "setCompositingFilter:", *MEMORY[0x1E0CD2E00]);
  v25 = CACurrentMediaTime() + a8;
  objc_msgSend(v15, "strokeLengthFraction");
  v27 = v26;
  objc_msgSend(v15, "strokeTaperLength");
  v29 = (v27 - v28 / a5) * a6;
  objc_msgSend(v15, "strokeLengthFraction");
  v31 = v30 * a6;
  if (v16)
    objc_msgSend(v16, "doubleValue");
  else
    objc_msgSend(v15, "strokeLengthFraction");
  v60 = v16;
  v61 = v32 * a6;
  objc_msgSend(v15, "strokeCount");
  v33 = -1;
  v34 = self;
  v62 = v15;
  do
  {
    v35 = (double)(uint64_t)++v33 / (double)(unint64_t)objc_msgSend(v15, "strokeCount");
    objc_msgSend(v15, "minThickness");
    v37 = v36;
    objc_msgSend(v15, "maxThickness");
    v39 = v37 + (v38 - v37) * v35;
    v40 = v29 + (v31 - v29) * (1.0 - v35);
    objc_msgSend(v15, "minOpacity");
    v42 = v41;
    objc_msgSend(v15, "maxOpacity");
    v44 = v42 + (v43 - v42) * v35;
    v45 = v61 + v40 * -0.5;
    -[PU_VKCImageSubjectGlowLayer shapeLayerLineWidth:opacity:path:](v34, "shapeLayerLineWidth:opacity:path:", a4, v39, v44);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    -[PU_VKCImageSubjectGlowLayer shapeLayerLineWidth:opacity:path:](v34, "shapeLayerLineWidth:opacity:path:", a4, v39, v44);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[PU_VKCImageSubjectGlowLayer animationWithKeyPath:beginTime:duration:](v34, "animationWithKeyPath:beginTime:duration:", CFSTR("strokeEnd"), v45, a6);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    -[PU_VKCImageSubjectGlowLayer animationWithKeyPath:beginTime:duration:](v34, "animationWithKeyPath:beginTime:duration:", CFSTR("strokeStart"), v40 + v45, a6);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    -[PU_VKCImageSubjectGlowLayer animationWithKeyPath:beginTime:duration:](v34, "animationWithKeyPath:beginTime:duration:", CFSTR("strokeEnd"), v45, a6);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[PU_VKCImageSubjectGlowLayer animationWithKeyPath:beginTime:duration:](v34, "animationWithKeyPath:beginTime:duration:", CFSTR("strokeStart"), v40 + v45, a6);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v69[0] = v64;
    v69[1] = v65;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v69, 2);
    v49 = v23;
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[PU_VKCImageSubjectGlowLayer animationGroupWithDuration:beginTime:animations:](v34, "animationGroupWithDuration:beginTime:animations:", v50, a6 + a6, v25);
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    v68[0] = v48;
    v68[1] = v47;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v68, 2);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[PU_VKCImageSubjectGlowLayer animationGroupWithDuration:beginTime:animations:](v34, "animationGroupWithDuration:beginTime:animations:", v52, a6 + a6, v25 - a6);
    v53 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = v49;
    objc_msgSend(v66, "addAnimation:forKey:", v51, CFSTR("strokeAnimationGroup"));
    objc_msgSend(v46, "addAnimation:forKey:", v53, CFSTR("strokeAnimationGroup2"));
    objc_msgSend(v49, "addSublayer:", v46);
    objc_msgSend(v49, "addSublayer:", v66);

    v34 = self;
    v15 = v62;

  }
  while (v33 < objc_msgSend(v62, "strokeCount"));
  -[PU_VKCImageSubjectGlowLayer glowLayer](self, "glowLayer");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "addSublayer:", v49);

  -[PU_VKCImageSubjectGlowLayer subLayersMap](self, "subLayersMap");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "objectForKeyedSubscript:", v59);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "addObject:", v49);

}

- (id)shapeLayerLineWidth:(double)a3 opacity:(double)a4 path:(CGPath *)a5
{
  id v8;
  id v9;
  double v10;

  v8 = objc_alloc_init(MEMORY[0x1E0CD2840]);
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v8, "setStrokeColor:", objc_msgSend(v9, "CGColor"));

  objc_msgSend(v8, "setLineWidth:", a3);
  objc_msgSend(v8, "setFillColor:", 0);
  *(float *)&v10 = a4;
  objc_msgSend(v8, "setOpacity:", v10);
  objc_msgSend(v8, "setPath:", a5);
  objc_msgSend(v8, "setStrokeStart:", 0.0);
  objc_msgSend(v8, "setStrokeEnd:", 0.0);
  return v8;
}

- (id)animationWithKeyPath:(id)a3 beginTime:(double)a4 duration:(double)a5
{
  void *v7;

  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFromValue:", &unk_1E53EFF60);
  objc_msgSend(v7, "setToValue:", &unk_1E53EFF70);
  objc_msgSend(v7, "setBeginTime:", a4);
  objc_msgSend(v7, "setDuration:", a5);
  objc_msgSend(v7, "setFillMode:", *MEMORY[0x1E0CD2B60]);
  return v7;
}

- (id)animationGroupWithDuration:(double)a3 beginTime:(double)a4 animations:(id)a5
{
  objc_class *v7;
  id v8;
  id v9;
  double v10;

  v7 = (objc_class *)MEMORY[0x1E0CD2700];
  v8 = a5;
  v9 = objc_alloc_init(v7);
  objc_msgSend(v9, "setDuration:", a3);
  LODWORD(v10) = 2139095040;
  objc_msgSend(v9, "setRepeatCount:", v10);
  objc_msgSend(v9, "setBeginTime:", a4);
  objc_msgSend(v9, "setAnimations:", v8);

  return v9;
}

- (BOOL)active
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (CALayer)glowLayer
{
  return self->_glowLayer;
}

- (void)setGlowLayer:(id)a3
{
  objc_storeStrong((id *)&self->_glowLayer, a3);
}

- (NSMutableDictionary)subLayersMap
{
  return self->_subLayersMap;
}

- (void)setSubLayersMap:(id)a3
{
  objc_storeStrong((id *)&self->_subLayersMap, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subLayersMap, 0);
  objc_storeStrong((id *)&self->_glowLayer, 0);
}

@end
