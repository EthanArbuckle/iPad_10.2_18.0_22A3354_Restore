@implementation _WTSweepTextEffect

- (_WTSweepTextEffect)initWithChunk:(id)a3 effectView:(id)a4
{
  _WTSweepTextEffect *v4;
  uint64_t v5;
  NSArray *palette;
  uint64_t v7;
  NSArray *lightEdgePalette;
  _WTSweepTextEffect *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)_WTSweepTextEffect;
  v4 = -[_WTTextEffect initWithChunk:effectView:](&v11, sel_initWithChunk_effectView_, a3, a4);
  if (v4)
  {
    +[_WTLightEffectPalette ponderingSweep](_WTLightEffectPalette, "ponderingSweep");
    v5 = objc_claimAutoreleasedReturnValue();
    palette = v4->_palette;
    v4->_palette = (NSArray *)v5;

    +[_WTLightEffectPalette ponderingLightEdge](_WTLightEffectPalette, "ponderingLightEdge");
    v7 = objc_claimAutoreleasedReturnValue();
    lightEdgePalette = v4->_lightEdgePalette;
    v4->_lightEdgePalette = (NSArray *)v7;

    v4->_brightnessBoost = 1;
    v9 = v4;
  }

  return v4;
}

- (void)prepareWithPalette:(id)a3 lightEdgePalette:(id)a4 brightnessBoost:(BOOL)a5
{
  id v8;
  NSArray *v9;
  NSArray *palette;
  NSArray *v11;
  NSArray *lightEdgePalette;

  v8 = a4;
  v9 = (NSArray *)objc_msgSend(a3, "copy");
  palette = self->_palette;
  self->_palette = v9;

  v11 = (NSArray *)objc_msgSend(v8, "copy");
  lightEdgePalette = self->_lightEdgePalette;
  self->_lightEdgePalette = v11;

  self->_brightnessBoost = a5;
}

- (void)invalidate:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  void *v6;
  void *v7;
  double v8;
  _QWORD v9[5];

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  v5 = 0.083;
  if (!v3)
    v5 = 0.0;
  objc_msgSend(MEMORY[0x24BDE57D8], "setAnimationDuration:", v5);
  objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", *MEMORY[0x24BDE5D20]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDE57D8], "setAnimationTimingFunction:", v6);

  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __33___WTSweepTextEffect_invalidate___block_invoke;
  v9[3] = &unk_251C07238;
  v9[4] = self;
  objc_msgSend(MEMORY[0x24BDE57D8], "setCompletionBlock:", v9);
  -[_WTTextEffect rootLayer](self, "rootLayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = 0;
  objc_msgSend(v7, "setOpacity:", v8);

  objc_msgSend(MEMORY[0x24BDE57D8], "commit");
}

- (void)updateEffectWith:(id)a3
{
  id v4;
  _BOOL4 v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  double v47;
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
  _QWORD v60[5];
  id v61;
  _QWORD v62[5];
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  objc_super v67;
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v67.receiver = self;
  v67.super_class = (Class)_WTSweepTextEffect;
  -[_WTTextEffect updateEffectWith:](&v67, sel_updateEffectWith_, v4);
  v5 = -[_WTTextEffect needsSetup](self, "needsSetup");
  v6 = MEMORY[0x24BDAC760];
  if (v5)
  {
    -[_WTSweepTextEffect setStartTime:](self, "setStartTime:", CACurrentMediaTime() + 0.25);
    objc_msgSend(MEMORY[0x24BE7EF28], "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_WTSweepTextEffect setRbLayer:](self, "setRbLayer:", v7);

    -[_WTSweepTextEffect rbLayer](self, "rbLayer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setOpaque:", 0);

    -[_WTSweepTextEffect rbLayer](self, "rbLayer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setColorMode:", 11);

    -[_WTTextEffect effectView](self, "effectView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "window");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "platformBackingScale");
    v13 = v12;
    -[_WTSweepTextEffect rbLayer](self, "rbLayer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setContentsScale:", v13);

    -[_WTSweepTextEffect rbLayer](self, "rbLayer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setDelegate:", self);

    -[_WTTextEffect effectView](self, "effectView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "platformInstalledDisplayLinkWithTarget:selector:", self, sel_update_);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[_WTSweepTextEffect setDisplayLink:](self, "setDisplayLink:", v17);

    objc_msgSend(MEMORY[0x24BDE56D0], "layer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[_WTTextEffect setRootLayer:](self, "setRootLayer:", v18);

    +[_WTColor grayColor](_WTColor, "grayColor");
    v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v20 = objc_msgSend(v19, "CGColor");
    -[_WTTextEffect rootLayer](self, "rootLayer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setBackgroundColor:", v20);

    objc_msgSend(MEMORY[0x24BDE56D0], "layer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[_WTSweepTextEffect setRootMaskLayer:](self, "setRootMaskLayer:", v22);

    -[_WTSweepTextEffect rootMaskLayer](self, "rootMaskLayer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[_WTTextEffect rootLayer](self, "rootLayer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setMask:", v23);

    -[_WTTextEffect rootLayer](self, "rootLayer");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[_WTSweepTextEffect rbLayer](self, "rbLayer");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addSublayer:", v26);

    objc_msgSend(MEMORY[0x24BDE56D0], "layer");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[_WTSweepTextEffect setFadeOutLayer:](self, "setFadeOutLayer:", v27);

    -[_WTTextEffect effectView](self, "effectView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "bounds");
    v30 = v29;
    v32 = v31;
    v34 = v33;
    v36 = v35;
    -[_WTSweepTextEffect fadeOutLayer](self, "fadeOutLayer");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setFrame:", v30, v32, v34, v36);

    v65 = 0u;
    v66 = 0u;
    v63 = 0u;
    v64 = 0u;
    v38 = v4;
    v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v63, v68, 16);
    if (v39)
    {
      v40 = v39;
      v41 = *(_QWORD *)v64;
      do
      {
        v42 = 0;
        do
        {
          if (*(_QWORD *)v64 != v41)
            objc_enumerationMutation(v38);
          v43 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * v42);
          -[_WTSweepTextEffect fadeOutLayer](self, "fadeOutLayer");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "layerWithContents");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "addSublayer:", v45);

          ++v42;
        }
        while (v40 != v42);
        v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v63, v68, 16);
      }
      while (v40);
    }

    -[_WTSweepTextEffect fadeOutLayer](self, "fadeOutLayer");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v47) = 0;
    objc_msgSend(v46, "setOpacity:", v47);

    -[_WTTextEffect effectView](self, "effectView");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "layer");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[_WTTextEffect rootLayer](self, "rootLayer");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "addSublayer:", v50);

    -[_WTTextEffect effectView](self, "effectView");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "layer");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[_WTSweepTextEffect fadeOutLayer](self, "fadeOutLayer");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[_WTTextEffect rootLayer](self, "rootLayer");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "insertSublayer:above:", v53, v54);

    objc_msgSend(MEMORY[0x24BDE57D8], "begin");
    v62[0] = v6;
    v62[1] = 3221225472;
    v62[2] = __39___WTSweepTextEffect_updateEffectWith___block_invoke;
    v62[3] = &unk_251C07238;
    v62[4] = self;
    objc_msgSend(MEMORY[0x24BDE57D8], "setCompletionBlock:", v62);
    objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("opacity"));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "setFromValue:", &unk_251C0F7C8);
    objc_msgSend(v55, "setToValue:", &unk_251C0F7E0);
    objc_msgSend(v55, "setDuration:", 0.75);
    objc_msgSend(v55, "setFillMode:", *MEMORY[0x24BDE5970]);
    objc_msgSend(v55, "setRemovedOnCompletion:", 1);
    objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", *MEMORY[0x24BDE5D20]);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "setTimingFunction:", v56);

    -[_WTSweepTextEffect fadeOutLayer](self, "fadeOutLayer");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "addAnimation:forKey:", v55, 0);

    objc_msgSend(MEMORY[0x24BDE57D8], "commit");
  }
  -[_WTTextEffect effectView](self, "effectView");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v60[0] = v6;
  v60[1] = 3221225472;
  v60[2] = __39___WTSweepTextEffect_updateEffectWith___block_invoke_14;
  v60[3] = &unk_251C074F0;
  v60[4] = self;
  v61 = v4;
  v59 = v4;
  objc_msgSend(v58, "platformPerformWithoutAnimation:", v60);

  -[_WTSweepTextEffect setStartDisplayList:](self, "setStartDisplayList:", 0);
}

- (void)update:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  id v12;

  -[_WTSweepTextEffect displayLink](self, "displayLink", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timestamp");
  v6 = v5;
  -[_WTSweepTextEffect startTime](self, "startTime");
  v8 = v7;

  -[_WTSweepTextEffect startTime](self, "startTime");
  if (v9 == 0.0 || (-[_WTTextEffect sweepDuration](self, "sweepDuration"), v6 - v8 > v10))
  {
    -[_WTSweepTextEffect displayLink](self, "displayLink");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "timestamp");
    -[_WTSweepTextEffect setStartTime:](self, "setStartTime:");

  }
  -[_WTSweepTextEffect rbLayer](self, "rbLayer");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setNeedsDisplay");

}

- (void)RBLayer:(id)a3 draw:(id)a4
{
  double v5;
  double v6;
  double v7;
  double v8;
  double MidX;
  double MaxY;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  void *v27;
  double v28;
  void *v29;
  void *v30;
  double v31;
  void *v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  double v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  void *v45;
  uint64_t State;
  double v47;
  id v48;
  CGRect v49;
  CGRect v50;

  v48 = a4;
  -[_WTTextEffect sweepRadius](self, "sweepRadius");
  v6 = v5;
  -[_WTTextEffect effectVisibilityFrame](self, "effectVisibilityFrame");
  v8 = v7;
  -[_WTTextEffect effectVisibilityFrame](self, "effectVisibilityFrame");
  MidX = CGRectGetMidX(v49);
  -[_WTTextEffect effectVisibilityFrame](self, "effectVisibilityFrame");
  MaxY = CGRectGetMaxY(v50);
  -[_WTSweepTextEffect startDisplayList](self, "startDisplayList");
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = (void *)v11;
    -[_WTSweepTextEffect endDisplayList](self, "endDisplayList");
    v13 = objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = (void *)v13;
      -[_WTSweepTextEffect interpolator](self, "interpolator");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
        goto LABEL_11;
    }
    else
    {

    }
  }
  v17 = v8 * 3.0;
  v18 = v6 + MaxY;
  v19 = v6 - v8;
  v20 = v6 + v17;
  v21 = (void *)objc_opt_new();
  objc_msgSend(v21, "setInfinite");
  v22 = (void *)objc_opt_new();
  v23 = (void *)objc_opt_new();
  v24 = (void *)objc_opt_new();
  -[_WTSweepTextEffect setStartDisplayList:](self, "setStartDisplayList:", v24);

  -[_WTTextEffect _applyToFill:colors:center:startRadius:endRadius:](self, "_applyToFill:colors:center:startRadius:endRadius:", v22, self->_palette, MidX, v18, v19, v6);
  -[_WTTextEffect _applyToFill:colors:center:startRadius:endRadius:](self, "_applyToFill:colors:center:startRadius:endRadius:", v23, self->_lightEdgePalette, MidX, v18, v19, v6);
  -[_WTSweepTextEffect startDisplayList](self, "startDisplayList");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v26) = 1.0;
  objc_msgSend(v25, "drawShape:fill:alpha:blendMode:", v21, v22, 0, v26);

  if (-[NSArray count](self->_lightEdgePalette, "count"))
  {
    -[_WTSweepTextEffect startDisplayList](self, "startDisplayList");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v28) = 0.75;
    objc_msgSend(v27, "drawShape:fill:alpha:blendMode:", v21, v23, 1003, v28);

  }
  v29 = (void *)objc_opt_new();
  -[_WTSweepTextEffect setEndDisplayList:](self, "setEndDisplayList:", v29);

  -[_WTTextEffect _applyToFill:colors:center:startRadius:endRadius:](self, "_applyToFill:colors:center:startRadius:endRadius:", v22, self->_palette, MidX, v18, v19, v20);
  -[_WTTextEffect _applyToFill:colors:center:startRadius:endRadius:](self, "_applyToFill:colors:center:startRadius:endRadius:", v23, self->_lightEdgePalette, MidX, v18, v19, v20);
  -[_WTSweepTextEffect endDisplayList](self, "endDisplayList");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v31) = 1.0;
  objc_msgSend(v30, "drawShape:fill:alpha:blendMode:", v21, v22, 0, v31);

  if (-[NSArray count](self->_lightEdgePalette, "count"))
  {
    -[_WTSweepTextEffect endDisplayList](self, "endDisplayList");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v33) = 0.75;
    objc_msgSend(v32, "drawShape:fill:alpha:blendMode:", v21, v23, 1003, v33);

  }
  v34 = (void *)MEMORY[0x24BE7EF00];
  -[_WTSweepTextEffect startDisplayList](self, "startDisplayList");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[_WTSweepTextEffect endDisplayList](self, "endDisplayList");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "interpolatorWithFrom:to:options:", v35, v36, 0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[_WTSweepTextEffect setInterpolator:](self, "setInterpolator:", v37);

LABEL_11:
  if (self->_brightnessBoost)
  {
    LODWORD(v16) = 1067030938;
    objc_msgSend(v48, "addContrastFilterWithAmount:", v16);
    LODWORD(v38) = 1050253722;
    objc_msgSend(v48, "addBrightnessFilterWithAmount:", v38);
  }
  -[_WTSweepTextEffect displayLink](self, "displayLink");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "timestamp");
  v41 = v40;
  -[_WTSweepTextEffect startTime](self, "startTime");
  v43 = v41 - v42;
  -[_WTTextEffect sweepDuration](self, "sweepDuration");
  *(float *)&v43 = v43 / v44;

  -[_WTSweepTextEffect interpolator](self, "interpolator");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  State = RBDisplayListGetState();
  LODWORD(v47) = LODWORD(v43);
  objc_msgSend(v45, "drawInState:by:", State, v47);

}

- (RBLayer)rbLayer
{
  return (RBLayer *)objc_getProperty(self, a2, 160, 1);
}

- (void)setRbLayer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (RBDisplayList)startDisplayList
{
  return (RBDisplayList *)objc_getProperty(self, a2, 168, 1);
}

- (void)setStartDisplayList:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 168);
}

- (RBDisplayList)endDisplayList
{
  return (RBDisplayList *)objc_getProperty(self, a2, 176, 1);
}

- (void)setEndDisplayList:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 176);
}

- (RBDisplayListInterpolator)interpolator
{
  return (RBDisplayListInterpolator *)objc_getProperty(self, a2, 184, 1);
}

- (void)setInterpolator:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 184);
}

- (CADisplayLink)displayLink
{
  return (CADisplayLink *)objc_getProperty(self, a2, 192, 1);
}

- (void)setDisplayLink:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 192);
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (CALayer)rootMaskLayer
{
  return (CALayer *)objc_getProperty(self, a2, 208, 1);
}

- (void)setRootMaskLayer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 208);
}

- (CALayer)fadeOutLayer
{
  return (CALayer *)objc_getProperty(self, a2, 216, 1);
}

- (void)setFadeOutLayer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 216);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fadeOutLayer, 0);
  objc_storeStrong((id *)&self->_rootMaskLayer, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_interpolator, 0);
  objc_storeStrong((id *)&self->_endDisplayList, 0);
  objc_storeStrong((id *)&self->_startDisplayList, 0);
  objc_storeStrong((id *)&self->_rbLayer, 0);
  objc_storeStrong((id *)&self->_lightEdgePalette, 0);
  objc_storeStrong((id *)&self->_palette, 0);
}

@end
