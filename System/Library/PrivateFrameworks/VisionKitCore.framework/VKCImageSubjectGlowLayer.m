@implementation VKCImageSubjectGlowLayer

- (VKCImageSubjectGlowLayer)init
{
  VKCImageSubjectGlowLayer *v2;
  CALayer *v3;
  CALayer *glowLayer;
  double v5;
  uint64_t v6;
  NSMutableDictionary *subLayersMap;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)VKCImageSubjectGlowLayer;
  v2 = -[VKCImageSubjectGlowLayer init](&v9, sel_init);
  if (v2)
  {
    v3 = (CALayer *)objc_alloc_init(MEMORY[0x1E0CD27A8]);
    glowLayer = v2->_glowLayer;
    v2->_glowLayer = v3;

    -[CALayer setBackgroundColor:](v2->_glowLayer, "setBackgroundColor:", 0);
    -[VKCImageSubjectGlowLayer addSublayer:](v2, "addSublayer:", v2->_glowLayer);
    -[CALayer setAllowsGroupBlending:](v2->_glowLayer, "setAllowsGroupBlending:", 0);
    -[CALayer setAllowsGroupOpacity:](v2->_glowLayer, "setAllowsGroupOpacity:", 0);
    LODWORD(v5) = 0;
    -[CALayer setOpacity:](v2->_glowLayer, "setOpacity:", v5);
    -[VKCImageSubjectGlowLayer setAllowsGroupBlending:](v2, "setAllowsGroupBlending:", 0);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = objc_claimAutoreleasedReturnValue();
    subLayersMap = v2->_subLayersMap;
    v2->_subLayersMap = (NSMutableDictionary *)v6;

  }
  return v2;
}

- (id)thinGlowParametersWithScreenScale:(double)a3 viewScale:(double)a4
{
  VKCGlowParameters *v6;
  uint64_t v7;
  uint64_t v8;

  v6 = objc_alloc_init(VKCGlowParameters);
  -[VKCGlowParameters setMinThickness:](v6, "setMinThickness:", a4 * 0.3);
  -[VKCGlowParameters setMaxThickness:](v6, "setMaxThickness:", a4 * 1.5);
  -[VKCGlowParameters setBlurRadius:](v6, "setBlurRadius:", a4 * 1.5);
  -[VKCGlowParameters setStrokeLengthFraction:](v6, "setStrokeLengthFraction:", 0.25);
  -[VKCGlowParameters setStrokeTaperLength:](v6, "setStrokeTaperLength:", a4 * 200.0);
  -[VKCGlowParameters setMinOpacity:](v6, "setMinOpacity:", 1.0);
  -[VKCGlowParameters setMaxOpacity:](v6, "setMaxOpacity:", 1.0);
  v7 = 12;
  if (a3 == 2.0)
    v7 = 8;
  if (a3 == 1.0)
    v8 = 6;
  else
    v8 = v7;
  -[VKCGlowParameters setStrokeCount:](v6, "setStrokeCount:", v8);
  return v6;
}

- (id)thickGlowParametersWithViewScale:(double)a3
{
  VKCGlowParameters *v4;

  v4 = objc_alloc_init(VKCGlowParameters);
  -[VKCGlowParameters setMinThickness:](v4, "setMinThickness:", a3 * 4.0);
  -[VKCGlowParameters setMaxThickness:](v4, "setMaxThickness:", a3 * 16.0);
  -[VKCGlowParameters setBlurRadius:](v4, "setBlurRadius:", a3 * 20.0);
  -[VKCGlowParameters setStrokeLengthFraction:](v4, "setStrokeLengthFraction:", 0.25);
  -[VKCGlowParameters setStrokeTaperLength:](v4, "setStrokeTaperLength:", a3 * 200.0);
  -[VKCGlowParameters setMinOpacity:](v4, "setMinOpacity:", 0.1);
  -[VKCGlowParameters setMaxOpacity:](v4, "setMaxOpacity:", 0.2);
  -[VKCGlowParameters setStrokeCount:](v4, "setStrokeCount:", 3);
  return v4;
}

- (void)beginAnimationWithViewScale:(double)a3 screenScale:(double)a4 path:(id)a5 index:(int64_t)a6 count:(int64_t)a7 identifier:(id)a8
{
  void *v9;
  double v10;
  void *v11;
  double v12;

  -[VKCImageSubjectGlowLayer configureAnimationWithViewScale:screenScale:path:index:count:identifier:](self, "configureAnimationWithViewScale:screenScale:path:index:count:identifier:", a5, a6, a7, a8, a3, a4);
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  -[VKCImageSubjectGlowLayer glowLayer](self, "glowLayer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v10) = 0;
  objc_msgSend(v9, "setOpacity:", v10);

  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setAnimationDuration:", 2.0);
  -[VKCImageSubjectGlowLayer glowLayer](self, "glowLayer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v12) = 1.0;
  objc_msgSend(v11, "setOpacity:", v12);

  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  -[VKCImageSubjectGlowLayer setActive:](self, "setActive:", 1);
}

- (void)stopAnimationAnimated:(BOOL)a3
{
  -[VKCImageSubjectGlowLayer hideGlow:](self, "hideGlow:", a3);
  -[VKCImageSubjectGlowLayer setActive:](self, "setActive:", 0);
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
  -[VKCImageSubjectGlowLayer glowLayer](self, "glowLayer");
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
    v12[2] = __37__VKCImageSubjectGlowLayer_hideGlow___block_invoke;
    v12[3] = &unk_1E94625B8;
    v13 = v7;
    objc_msgSend(v10, "setCompletionBlock:", v12);

  }
  else
  {
    LODWORD(v8) = 0;
    objc_msgSend(v5, "setOpacity:", v8);
    objc_msgSend(v7, "makeObjectsPerformSelector:", sel_removeFromSuperlayer);
  }
  -[VKCImageSubjectGlowLayer subLayersMap](self, "subLayersMap");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeAllObjects");

  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

uint64_t __37__VKCImageSubjectGlowLayer_hideGlow___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "makeObjectsPerformSelector:", sel_removeFromSuperlayer);
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
  -[VKCImageSubjectGlowLayer subLayersMap](self, "subLayersMap");
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
    v12[2] = __64__VKCImageSubjectGlowLayer_stopAnimationForIdentifier_animated___block_invoke;
    v12[3] = &unk_1E94625B8;
    v13 = v9;
    objc_msgSend(v10, "setCompletionBlock:", v12);
    objc_msgSend(MEMORY[0x1E0CD28B0], "commit");

  }
  else
  {
    objc_msgSend(v9, "makeObjectsPerformSelector:", sel_removeFromSuperlayer);
  }
  -[VKCImageSubjectGlowLayer subLayersMap](self, "subLayersMap");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", 0, v6);

}

uint64_t __64__VKCImageSubjectGlowLayer_stopAnimationForIdentifier_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "makeObjectsPerformSelector:", sel_removeFromSuperlayer);
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
  double v21;
  double v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  double v26;
  void *v27;
  uint64_t v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  id v35;
  _QWORD v36[5];
  id v37;
  uint64_t v38;
  double v39;
  double v40;
  double v41;
  double v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _QWORD v48[3];

  v48[2] = *MEMORY[0x1E0C80C00];
  v14 = a5;
  v15 = a8;
  -[VKCImageSubjectGlowLayer thinGlowParametersWithScreenScale:viewScale:](self, "thinGlowParametersWithScreenScale:viewScale:", a4, a3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v48[0] = v16;
  -[VKCImageSubjectGlowLayer thickGlowParametersWithViewScale:](self, "thickGlowParametersWithViewScale:", a3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v48[1] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v19 = v18;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
  v21 = 0.0;
  v22 = 0.0;
  if (v20)
  {
    v23 = v20;
    v24 = *(_QWORD *)v44;
    do
    {
      v25 = 0;
      do
      {
        if (*(_QWORD *)v44 != v24)
          objc_enumerationMutation(v19);
        objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * v25), "strokeLengthFraction");
        if (v22 < v26)
          v22 = v26;
        ++v25;
      }
      while (v23 != v25);
      v23 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
    }
    while (v23);
  }

  objc_msgSend(v14, "bezierPathByReversingPath");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = objc_msgSend(v27, "vk_CGPath");
  objc_msgSend(v27, "vk_lengthIgnoringCurves");
  v30 = v29;
  v31 = VKMClamp(v29 / 350.0, 4.5, 6.0);
  v32 = v31 / (double)a7 * (double)a6;
  if (a7 < 1)
    v32 = 0.0;
  if (a6 >= 1)
    v21 = v32;
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v19, "count"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCImageSubjectGlowLayer subLayersMap](self, "subLayersMap");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setObject:forKeyedSubscript:", v33, v15);

  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __100__VKCImageSubjectGlowLayer_configureAnimationWithViewScale_screenScale_path_index_count_identifier___block_invoke;
  v36[3] = &unk_1E94653A0;
  v37 = v15;
  v38 = v28;
  v39 = v30;
  v40 = v31;
  v41 = v22;
  v42 = v21;
  v36[4] = self;
  v35 = v15;
  objc_msgSend(v19, "enumerateObjectsUsingBlock:", v36);
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");

}

void __100__VKCImageSubjectGlowLayer_configureAnimationWithViewScale_screenScale_path_index_count_identifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  id v9;
  id v10;

  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(double *)(a1 + 56);
  v6 = *(double *)(a1 + 64);
  v7 = (void *)MEMORY[0x1E0CB37E8];
  v8 = *(double *)(a1 + 72);
  v9 = a2;
  objc_msgSend(v7, "numberWithDouble:", v8);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "renderGlowParameters:path:pathLength:duration:maxStrokeLengthFraction:beginDelay:identifier:", v9, v4, v10, *(_QWORD *)(a1 + 40), v5, v6, *(double *)(a1 + 80));

}

- (void)renderGlowParameters:(id)a3 path:(CGPath *)a4 pathLength:(double)a5 duration:(double)a6 maxStrokeLengthFraction:(id)a7 beginDelay:(double)a8 identifier:(id)a9
{
  id v16;
  id v17;
  double v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  VKCImageSubjectGlowLayer *v31;
  double v32;
  uint64_t v33;
  double v34;
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
  double v46;
  void *v47;
  double v48;
  double v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  void *v63;
  double v64;
  double v65;
  double v66;
  CGPath *v67;
  void *v68;
  void *v69;
  void *v70;
  _OWORD v71[5];
  _QWORD v72[2];
  _QWORD v73[2];
  _QWORD v74[3];

  v74[1] = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a7;
  v62 = a9;
  objc_msgSend(v16, "blurRadius");
  __64__VKCImageSubjectBaseView_configurePulseAnimationWithViewScale___block_invoke(v18);
  v19 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2F08]);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v71[0] = xmmword_1D2ED1290;
  v71[1] = xmmword_1D2ED12A0;
  v71[2] = xmmword_1D2ED12B0;
  v71[3] = xmmword_1D2ED12C0;
  v71[4] = xmmword_1D2ED12D0;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCAColorMatrix:", v71);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = v20;
  objc_msgSend(v20, "setValue:forKeyPath:", v21, CFSTR("inputColorMatrix"));

  v22 = objc_alloc_init(MEMORY[0x1E0CD27A8]);
  v61 = (void *)v19;
  v74[0] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v74, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setFilters:", v23);

  objc_msgSend(v22, "setCompositingFilter:", *MEMORY[0x1E0CD2E00]);
  v24 = CACurrentMediaTime() + a8;
  objc_msgSend(v16, "strokeLengthFraction");
  v26 = v25;
  objc_msgSend(v16, "strokeTaperLength");
  v28 = v26 - v27 / a5;
  objc_msgSend(v16, "strokeLengthFraction");
  v30 = v29;
  v31 = self;
  if (v17)
    objc_msgSend(v17, "doubleValue");
  else
    objc_msgSend(v16, "strokeLengthFraction");
  v63 = v17;
  v65 = v30 * a6;
  v66 = v28 * a6;
  v64 = v32 * a6;
  objc_msgSend(v16, "strokeCount");
  v33 = -1;
  v34 = v24 - a6;
  v67 = a4;
  do
  {
    ++v33;
    v35 = v24;
    v36 = (double)v33 / (double)(unint64_t)objc_msgSend(v16, "strokeCount");
    objc_msgSend(v16, "minThickness");
    v38 = v37;
    objc_msgSend(v16, "maxThickness");
    v40 = VKMMix(v38, v39, v36);
    v41 = VKMMix(v66, v65, 1.0 - v36);
    objc_msgSend(v16, "minOpacity");
    v43 = v42;
    objc_msgSend(v16, "maxOpacity");
    v45 = VKMMix(v43, v44, v36);
    v46 = v64 + v41 * -0.5;
    -[VKCImageSubjectGlowLayer shapeLayerLineWidth:opacity:path:](v31, "shapeLayerLineWidth:opacity:path:", a4, v40, v45);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKCImageSubjectGlowLayer shapeLayerLineWidth:opacity:path:](v31, "shapeLayerLineWidth:opacity:path:", a4, v40, v45);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKCImageSubjectGlowLayer animationWithKeyPath:beginTime:duration:](v31, "animationWithKeyPath:beginTime:duration:", CFSTR("strokeEnd"), v46, a6);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = v41 + v46;
    -[VKCImageSubjectGlowLayer animationWithKeyPath:beginTime:duration:](v31, "animationWithKeyPath:beginTime:duration:", CFSTR("strokeStart"), v48, a6);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = v46;
    v24 = v35;
    -[VKCImageSubjectGlowLayer animationWithKeyPath:beginTime:duration:](v31, "animationWithKeyPath:beginTime:duration:", CFSTR("strokeEnd"), v49, a6);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKCImageSubjectGlowLayer animationWithKeyPath:beginTime:duration:](v31, "animationWithKeyPath:beginTime:duration:", CFSTR("strokeStart"), v48, a6);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v73[0] = v68;
    v73[1] = v69;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v73, 2);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKCImageSubjectGlowLayer animationGroupWithDuration:beginTime:animations:](v31, "animationGroupWithDuration:beginTime:animations:", v52, a6 + a6, v35);
    v53 = (void *)objc_claimAutoreleasedReturnValue();

    v72[0] = v51;
    v72[1] = v50;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v72, 2);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKCImageSubjectGlowLayer animationGroupWithDuration:beginTime:animations:](v31, "animationGroupWithDuration:beginTime:animations:", v54, a6 + a6, v34);
    v55 = v16;
    v56 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v70, "addAnimation:forKey:", v53, CFSTR("strokeAnimationGroup"));
    objc_msgSend(v47, "addAnimation:forKey:", v56, CFSTR("strokeAnimationGroup2"));
    objc_msgSend(v22, "addSublayer:", v47);
    objc_msgSend(v22, "addSublayer:", v70);

    v16 = v55;
    a4 = v67;

  }
  while (v33 < (unint64_t)objc_msgSend(v55, "strokeCount"));
  -[VKCImageSubjectGlowLayer glowLayer](v31, "glowLayer");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "addSublayer:", v22);

  -[VKCImageSubjectGlowLayer subLayersMap](v31, "subLayersMap");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "objectForKeyedSubscript:", v62);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "addObject:", v22);

}

- (id)shapeLayerLineWidth:(double)a3 opacity:(double)a4 path:(CGPath *)a5
{
  id v8;
  id v9;
  double v10;

  v8 = objc_alloc_init(MEMORY[0x1E0CD2840]);
  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
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
  objc_msgSend(v7, "setFromValue:", &unk_1E9495198);
  objc_msgSend(v7, "setToValue:", &unk_1E94951A8);
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
