@implementation SHListeningLayer

- (SHListeningLayer)init
{
  return -[SHListeningLayer initWithIntroAnimation:useCustomCompatibleBackground:](self, "initWithIntroAnimation:useCustomCompatibleBackground:", 0, 0);
}

- (SHListeningLayer)initWithIntroAnimation:(BOOL)a3 useCustomCompatibleBackground:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  SHListeningLayer *v6;
  SHCustomBackgroundCompatiblePalette *v7;
  SHPalette *palette;
  void *v9;
  void *v10;
  objc_super v12;

  v4 = a4;
  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SHListeningLayer;
  v6 = -[SHListeningLayer init](&v12, sel_init);
  if (v6)
  {
    if (v4)
    {
      v7 = objc_alloc_init(SHCustomBackgroundCompatiblePalette);
    }
    else
    {
      +[SHPalette default](SHPalette, "default");
      v7 = (SHCustomBackgroundCompatiblePalette *)objc_claimAutoreleasedReturnValue();
    }
    palette = v6->_palette;
    v6->_palette = &v7->super;

    v6->_state = 1;
    v6->_shouldPerformIntroAnimation = v5;
    -[SHListeningLayer buildView](v6, "buildView");
    -[SHListeningLayer shazamButtonLayer](v6, "shazamButtonLayer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v5)
      objc_msgSend(v9, "performSDrawingIntroAnimation");
    else
      objc_msgSend(v9, "skipIntroAnimation");

  }
  return v6;
}

- (void)buildView
{
  SHShazamButtonLayer *v3;
  void *v4;
  SHShazamButtonLayer *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  id v16;

  v3 = [SHShazamButtonLayer alloc];
  -[SHListeningLayer palette](self, "palette");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SHPaletteLayer initWithPalette:](v3, "initWithPalette:", v4);
  -[SHListeningLayer setShazamButtonLayer:](self, "setShazamButtonLayer:", v5);

  -[SHListeningLayer shazamButtonLayer](self, "shazamButtonLayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setButtonDelegate:", self);

  -[SHListeningLayer shazamButtonLayer](self, "shazamButtonLayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHListeningLayer addSublayer:](self, "addSublayer:", v7);

  -[SHListeningLayer bounds](self, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  -[SHListeningLayer shazamButtonLayer](self, "shazamButtonLayer");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setFrame:", v9, v11, v13, v15);

}

- (void)layoutSublayers
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double MidX;
  void *v24;
  double MidY;
  void *v26;
  void *v27;
  CGFloat v28;
  void *v29;
  CGFloat v30;
  void *v31;
  void *v32;
  double v33;
  void *v34;
  double v35;
  void *v36;
  void *v37;
  CGFloat v38;
  void *v39;
  CGFloat v40;
  void *v41;
  void *v42;
  double v43;
  void *v44;
  double v45;
  void *v46;
  void *v47;
  CGFloat v48;
  void *v49;
  CGFloat v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  objc_super v60;
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

  v60.receiver = self;
  v60.super_class = (Class)SHListeningLayer;
  -[SHListeningLayer layoutSublayers](&v60, sel_layoutSublayers);
  -[SHListeningLayer bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[SHListeningLayer shazamButtonLayer](self, "shazamButtonLayer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  -[SHListeningLayer autoShadowContainerLayer](self, "autoShadowContainerLayer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHListeningLayer centerLayer:inSuperLayer:withRelativeSize:](self, "centerLayer:inSuperLayer:withRelativeSize:", v12, self, 1.0);

  -[SHListeningLayer autoShadowLayer](self, "autoShadowLayer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHListeningLayer autoShadowContainerLayer](self, "autoShadowContainerLayer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHListeningLayer centerLayer:inSuperLayer:withRelativeSize:](self, "centerLayer:inSuperLayer:withRelativeSize:", v13, v14, 1.0);

  if (-[SHListeningLayer state](self, "state") == 4)
    v15 = 3.0;
  else
    v15 = 2.70000005;
  -[SHListeningLayer innerCirclesContainerLayer](self, "innerCirclesContainerLayer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHListeningLayer centerLayer:inSuperLayer:withRelativeSize:](self, "centerLayer:inSuperLayer:withRelativeSize:", v16, self, v15);

  -[SHListeningLayer innerCirclesSecondaryContainerLayer](self, "innerCirclesSecondaryContainerLayer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHListeningLayer innerCirclesContainerLayer](self, "innerCirclesContainerLayer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHListeningLayer centerLayer:inSuperLayer:withRelativeSize:](self, "centerLayer:inSuperLayer:withRelativeSize:", v17, v18, 1.0);

  -[SHListeningLayer innerCirclesLayer](self, "innerCirclesLayer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHListeningLayer innerCirclesSecondaryContainerLayer](self, "innerCirclesSecondaryContainerLayer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHListeningLayer centerLayer:inSuperLayer:withRelativeSize:](self, "centerLayer:inSuperLayer:withRelativeSize:", v19, v20, 1.0);

  -[SHListeningLayer outerCirclesLayer](self, "outerCirclesLayer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHListeningLayer centerLayer:inSuperLayer:withRelativeSize:](self, "centerLayer:inSuperLayer:withRelativeSize:", v21, self, 6.30000019);

  -[SHListeningLayer innerCirclesContainerLayer](self, "innerCirclesContainerLayer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "bounds");
  MidX = CGRectGetMidX(v61);
  -[SHListeningLayer innerCirclesContainerLayer](self, "innerCirclesContainerLayer");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "bounds");
  MidY = CGRectGetMidY(v62);
  -[SHListeningLayer innerCircleToShazamButtonMaskLayer](self, "innerCircleToShazamButtonMaskLayer");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setPosition:", MidX, MidY);

  -[SHListeningLayer shazamButtonLayer](self, "shazamButtonLayer");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "bounds");
  v28 = CGRectGetWidth(v63) * 3.5;
  -[SHListeningLayer shazamButtonLayer](self, "shazamButtonLayer");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "bounds");
  v30 = CGRectGetHeight(v64) * 3.5;
  -[SHListeningLayer innerCircleToShazamButtonMaskLayer](self, "innerCircleToShazamButtonMaskLayer");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setBounds:", 0.0, 0.0, v28, v30);

  -[SHListeningLayer innerCirclesSecondaryContainerLayer](self, "innerCirclesSecondaryContainerLayer");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "bounds");
  v33 = CGRectGetMidX(v65);
  -[SHListeningLayer innerCirclesSecondaryContainerLayer](self, "innerCirclesSecondaryContainerLayer");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "bounds");
  v35 = CGRectGetMidY(v66);
  -[SHListeningLayer innerCircleToAutoShadowMaskLayer](self, "innerCircleToAutoShadowMaskLayer");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setPosition:", v33, v35);

  -[SHListeningLayer shazamButtonLayer](self, "shazamButtonLayer");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "bounds");
  v38 = CGRectGetWidth(v67) * 3.5;
  -[SHListeningLayer shazamButtonLayer](self, "shazamButtonLayer");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "bounds");
  v40 = CGRectGetHeight(v68) * 3.5;
  -[SHListeningLayer innerCircleToAutoShadowMaskLayer](self, "innerCircleToAutoShadowMaskLayer");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setBounds:", 0.0, 0.0, v38, v40);

  -[SHListeningLayer autoShadowContainerLayer](self, "autoShadowContainerLayer");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "bounds");
  v43 = CGRectGetMidX(v69);
  -[SHListeningLayer autoShadowContainerLayer](self, "autoShadowContainerLayer");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "bounds");
  v45 = CGRectGetMidY(v70);
  -[SHListeningLayer autoShadowToShazamButtonMaskLayer](self, "autoShadowToShazamButtonMaskLayer");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setPosition:", v43, v45);

  -[SHListeningLayer autoShadowLayer](self, "autoShadowLayer");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "bounds");
  v48 = CGRectGetWidth(v71) * 3.5;
  -[SHListeningLayer autoShadowLayer](self, "autoShadowLayer");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "bounds");
  v50 = CGRectGetHeight(v72) * 3.5;
  -[SHListeningLayer autoShadowToShazamButtonMaskLayer](self, "autoShadowToShazamButtonMaskLayer");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "setBounds:", 0.0, 0.0, v48, v50);

  -[SHListeningLayer shazamButtonLayer](self, "shazamButtonLayer");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setNeedsLayout");

  -[SHListeningLayer shazamButtonLayer](self, "shazamButtonLayer");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "layoutIfNeeded");

  -[SHListeningLayer innerCirclesLayer](self, "innerCirclesLayer");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "setNeedsLayout");

  -[SHListeningLayer innerCirclesLayer](self, "innerCirclesLayer");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "layoutIfNeeded");

  -[SHListeningLayer outerCirclesLayer](self, "outerCirclesLayer");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "setNeedsLayout");

  -[SHListeningLayer outerCirclesLayer](self, "outerCirclesLayer");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "layoutIfNeeded");

  -[SHListeningLayer autoShadowLayer](self, "autoShadowLayer");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "setNeedsLayout");

  -[SHListeningLayer autoShadowLayer](self, "autoShadowLayer");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "layoutIfNeeded");

}

- (void)centerLayer:(id)a3 inSuperLayer:(id)a4 withRelativeSize:(double)a5
{
  id v7;
  CGFloat v8;
  double MidX;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  id v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;

  v7 = a4;
  v18 = a3;
  objc_msgSend(v7, "bounds");
  v8 = CGRectGetWidth(v19) * a5;
  objc_msgSend(v7, "bounds");
  objc_msgSend(v18, "setBounds:", 0.0, 0.0, v8, CGRectGetHeight(v20) * a5);
  objc_msgSend(v7, "bounds");
  MidX = CGRectGetMidX(v21);
  objc_msgSend(v7, "bounds");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;

  v22.origin.x = v11;
  v22.origin.y = v13;
  v22.size.width = v15;
  v22.size.height = v17;
  objc_msgSend(v18, "setPosition:", MidX, CGRectGetMidY(v22));

}

- (double)bass
{
  return self->_bass;
}

- (void)setBass:(double)a3
{
  double v5;

  self->_bass = a3;
  -[SHListeningLayer treble](self, "treble");
  -[SHListeningLayer processBass:treble:](self, "processBass:treble:", a3, v5);
}

- (double)treble
{
  return self->_treble;
}

- (void)setTreble:(double)a3
{
  self->_treble = a3;
  -[SHListeningLayer processBass:treble:](self, "processBass:treble:", self->_bass, a3);
}

- (void)processBass:(double)a3 treble:(double)a4
{
  if (-[SHListeningLayer state](self, "state") == 4)
  {
    -[SHListeningLayer processBassForInnerCircle:](self, "processBassForInnerCircle:", a3);
    -[SHListeningLayer processBassForShazamButton:](self, "processBassForShazamButton:", a3);
    -[SHListeningLayer processTrebleForOuterCircles:](self, "processTrebleForOuterCircles:", a4);
  }
}

- (void)processBassForInnerCircle:(double)a3
{
  double v5;
  CGFloat v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  CATransform3D v12;
  CATransform3D v13;

  +[SHMaths interpolateValue:leftMin:leftMax:rightMin:rightMax:](SHMaths, "interpolateValue:leftMin:leftMax:rightMin:rightMax:", a3, 0.0, 1.0, 0.699999988, 1.29999995);
  v6 = v5;
  +[SHMaths interpolateValue:leftMin:leftMax:rightMin:rightMax:](SHMaths, "interpolateValue:leftMin:leftMax:rightMin:rightMax:", a3, 0.0, 1.0, 0.5, 0.899999976);
  v8 = v7;
  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  objc_msgSend(MEMORY[0x24BDE57D8], "setValue:forKey:", *MEMORY[0x24BDBD270], *MEMORY[0x24BDE5DF0]);
  CATransform3DMakeScale(&v13, v6, v6, 1.0);
  -[SHListeningLayer innerCirclesLayer](self, "innerCirclesLayer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v13;
  objc_msgSend(v9, "setTransform:", &v12);

  -[SHListeningLayer innerCirclesLayer](self, "innerCirclesLayer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v8 = v8;
  LODWORD(v11) = LODWORD(v8);
  objc_msgSend(v10, "setOpacity:", v11);

  objc_msgSend(MEMORY[0x24BDE57D8], "commit");
}

- (void)processTrebleForOuterCircles:(double)a3
{
  double v5;
  CGFloat v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  CATransform3D v12;
  CATransform3D v13;

  +[SHMaths interpolateValue:leftMin:leftMax:rightMin:rightMax:](SHMaths, "interpolateValue:leftMin:leftMax:rightMin:rightMax:", a3, 0.0, 1.0, 0.899999976, 1.10000002);
  v6 = v5;
  +[SHMaths interpolateValue:leftMin:leftMax:rightMin:rightMax:](SHMaths, "interpolateValue:leftMin:leftMax:rightMin:rightMax:", a3, 0.0, 1.0, 0.300000012, 0.699999988);
  v8 = v7;
  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  objc_msgSend(MEMORY[0x24BDE57D8], "setValue:forKey:", *MEMORY[0x24BDBD270], *MEMORY[0x24BDE5DF0]);
  CATransform3DMakeScale(&v13, v6, v6, 1.0);
  -[SHListeningLayer outerCirclesLayer](self, "outerCirclesLayer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v13;
  objc_msgSend(v9, "setTransform:", &v12);

  -[SHListeningLayer outerCirclesLayer](self, "outerCirclesLayer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v8 = v8;
  LODWORD(v11) = LODWORD(v8);
  objc_msgSend(v10, "setOpacity:", v11);

  objc_msgSend(MEMORY[0x24BDE57D8], "commit");
}

- (void)processBassForShazamButton:(double)a3
{
  double v4;
  CGFloat v5;
  void *v6;
  void *v7;
  void *v8;
  CATransform3D v9;
  CATransform3D v10;
  CATransform3D v11;
  CATransform3D v12;
  CATransform3D v13;
  CATransform3D v14;

  +[SHMaths interpolateValue:leftMin:leftMax:rightMin:rightMax:](SHMaths, "interpolateValue:leftMin:leftMax:rightMin:rightMax:", a3, 0.0, 1.0, 0.75, 1.10000002);
  v5 = v4;
  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  objc_msgSend(MEMORY[0x24BDE57D8], "setValue:forKey:", *MEMORY[0x24BDBD270], *MEMORY[0x24BDE5DF0]);
  CATransform3DMakeScale(&v14, v5, v5, 1.0);
  -[SHListeningLayer shazamButtonLayer](self, "shazamButtonLayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v14;
  objc_msgSend(v6, "setSublayerTransform:", &v13);

  CATransform3DMakeScale(&v12, v5, v5, 1.0);
  -[SHListeningLayer autoShadowToShazamButtonMaskLayer](self, "autoShadowToShazamButtonMaskLayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v12;
  objc_msgSend(v7, "setTransform:", &v11);

  CATransform3DMakeScale(&v10, v5, v5, 1.0);
  -[SHListeningLayer innerCircleToShazamButtonMaskLayer](self, "innerCircleToShazamButtonMaskLayer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v10;
  objc_msgSend(v8, "setTransform:", &v9);

  objc_msgSend(MEMORY[0x24BDE57D8], "commit");
}

- (void)startIdleAnimation
{
  int64_t v3;
  void *v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  SHListeningLayer *v13;

  v3 = -[SHListeningLayer state](self, "state");
  -[SHListeningLayer setState:](self, "setState:", 2);
  if (v3 == 1)
  {
    -[SHListeningLayer shazamButtonLayer](self, "shazamButtonLayer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeAllAnimations");

    objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("transform.scale"));
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setFromValue:", &unk_24F13B678);
    objc_msgSend(v10, "setToValue:", &unk_24F13B688);
    objc_msgSend(v10, "setDuration:", 1.0);
    objc_msgSend(v10, "setAutoreverses:", 1);
    LODWORD(v5) = 2139095040;
    objc_msgSend(v10, "setRepeatCount:", v5);
    objc_msgSend(v10, "setRemovedOnCompletion:", 0);
    objc_msgSend(v10, "setFillMode:", *MEMORY[0x24BDE5978]);
    +[SHListeningMediaTimingFunctionProvider inOutSineMediaTimingFunction](SHListeningMediaTimingFunctionProvider, "inOutSineMediaTimingFunction");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTimingFunction:", v6);

    -[SHListeningLayer shazamButtonLayer](self, "shazamButtonLayer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addAnimation:forKey:", v10, CFSTR("SHListeningShazamButtonScaleAnimationKey"));

  }
  else
  {
    -[SHListeningLayer innerCirclesLayer](self, "innerCirclesLayer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __38__SHListeningLayer_startIdleAnimation__block_invoke;
    v11[3] = &unk_24F136230;
    v12 = v8;
    v13 = self;
    v9 = v8;
    -[SHListeningLayer animateToIdleStateWithCompletion:](self, "animateToIdleStateWithCompletion:", v11);

  }
}

void __38__SHListeningLayer_startIdleAnimation__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  _OWORD v9[8];

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "innerCirclesLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2 == v3)
  {
    objc_msgSend(*(id *)(a1 + 40), "removeAnimationLayers");
    objc_msgSend(*(id *)(a1 + 40), "shazamButtonLayer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_OWORD *)(MEMORY[0x24BDE5598] + 80);
    v9[4] = *(_OWORD *)(MEMORY[0x24BDE5598] + 64);
    v9[5] = v5;
    v6 = *(_OWORD *)(MEMORY[0x24BDE5598] + 112);
    v9[6] = *(_OWORD *)(MEMORY[0x24BDE5598] + 96);
    v9[7] = v6;
    v7 = *(_OWORD *)(MEMORY[0x24BDE5598] + 16);
    v9[0] = *MEMORY[0x24BDE5598];
    v9[1] = v7;
    v8 = *(_OWORD *)(MEMORY[0x24BDE5598] + 48);
    v9[2] = *(_OWORD *)(MEMORY[0x24BDE5598] + 32);
    v9[3] = v8;
    objc_msgSend(v4, "setSublayerTransform:", v9);

  }
}

- (void)startActiveListeningAnimation
{
  void *v3;
  void *v4;
  void *v5;

  if (-[SHListeningLayer state](self, "state") == 2 || -[SHListeningLayer state](self, "state") == 1)
  {
    -[SHListeningLayer setState:](self, "setState:", 4);
    -[SHListeningLayer shazamButtonLayer](self, "shazamButtonLayer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeAllAnimations");

    -[SHListeningLayer addInnerCirclesLayer](self, "addInnerCirclesLayer");
    -[SHListeningLayer addOuterCirclesLayer](self, "addOuterCirclesLayer");
    -[SHListeningLayer addInnerCirclesToShazamButtonMaskLayer](self, "addInnerCirclesToShazamButtonMaskLayer");
    -[SHListeningLayer innerCirclesLayer](self, "innerCirclesLayer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "startListeningAnimation");

    -[SHListeningLayer outerCirclesLayer](self, "outerCirclesLayer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "startListeningAnimation");

    -[SHListeningLayer setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)startPassiveListeningAnimation
{
  void *v3;

  if (-[SHListeningLayer state](self, "state") == 2 || -[SHListeningLayer state](self, "state") == 1)
  {
    -[SHListeningLayer setState:](self, "setState:", 3);
    -[SHListeningLayer addAutoShadowLayer](self, "addAutoShadowLayer");
    -[SHListeningLayer addInnerCirclesLayer](self, "addInnerCirclesLayer");
    -[SHListeningLayer addInnerCircleToAutoShadowMaskLayer](self, "addInnerCircleToAutoShadowMaskLayer");
    -[SHListeningLayer addInnerCirclesToShazamButtonMaskLayer](self, "addInnerCirclesToShazamButtonMaskLayer");
    -[SHListeningLayer addAutoShadowToShazamButtonMaskLayer](self, "addAutoShadowToShazamButtonMaskLayer");
    -[SHListeningLayer addAutoAnimationInitialShazamButtonPulse](self, "addAutoAnimationInitialShazamButtonPulse");
    -[SHListeningLayer innerCirclesLayer](self, "innerCirclesLayer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "startListeningAnimation");

    -[SHListeningLayer setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)stopAllAnimations
{
  void *v3;
  void *v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  _OWORD v9[8];

  if (-[SHListeningLayer state](self, "state") != 1)
  {
    -[SHListeningLayer shazamButtonLayer](self, "shazamButtonLayer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeAllAnimations");

    -[SHListeningLayer removeAnimationLayers](self, "removeAnimationLayers");
    -[SHListeningLayer shazamButtonLayer](self, "shazamButtonLayer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_OWORD *)(MEMORY[0x24BDE5598] + 80);
    v9[4] = *(_OWORD *)(MEMORY[0x24BDE5598] + 64);
    v9[5] = v5;
    v6 = *(_OWORD *)(MEMORY[0x24BDE5598] + 112);
    v9[6] = *(_OWORD *)(MEMORY[0x24BDE5598] + 96);
    v9[7] = v6;
    v7 = *(_OWORD *)(MEMORY[0x24BDE5598] + 16);
    v9[0] = *MEMORY[0x24BDE5598];
    v9[1] = v7;
    v8 = *(_OWORD *)(MEMORY[0x24BDE5598] + 48);
    v9[2] = *(_OWORD *)(MEMORY[0x24BDE5598] + 32);
    v9[3] = v8;
    objc_msgSend(v4, "setSublayerTransform:", v9);

  }
}

- (void)addAutoAnimationInitialShazamButtonPulse
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x24BDE5760], "animationWithKeyPath:", CFSTR("sublayerTransform.scale"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFromValue:", &unk_24F13B698);
  objc_msgSend(v8, "setToValue:", &unk_24F13B6A8);
  objc_msgSend(v8, "setDuration:", 0.200000003);
  objc_msgSend(v8, "setRemovedOnCompletion:", 0);
  v3 = *MEMORY[0x24BDE5978];
  objc_msgSend(v8, "setFillMode:", *MEMORY[0x24BDE5978]);
  -[SHListeningLayer shazamButtonLayer](self, "shazamButtonLayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addAnimation:forKey:", v8, CFSTR("SHListeningShazamButtonScaleAnimationKey"));

  objc_msgSend(MEMORY[0x24BDE5760], "animationWithKeyPath:", CFSTR("transform.scale"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFromValue:", &unk_24F13B698);
  objc_msgSend(v5, "setToValue:", &unk_24F13B6A8);
  objc_msgSend(v5, "setDuration:", 0.200000003);
  objc_msgSend(v5, "setRemovedOnCompletion:", 0);
  objc_msgSend(v5, "setFillMode:", v3);
  -[SHListeningLayer innerCircleToShazamButtonMaskLayer](self, "innerCircleToShazamButtonMaskLayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addAnimation:forKey:", v5, CFSTR("SHListeningShazamButtonScaleAnimationKey"));

  -[SHListeningLayer autoShadowToShazamButtonMaskLayer](self, "autoShadowToShazamButtonMaskLayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addAnimation:forKey:", v5, CFSTR("SHListeningShazamButtonScaleAnimationKey"));

}

- (void)addTouchDownAnimation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("transform.scale"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[SHListeningLayer shazamButtonLayer](self, "shazamButtonLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentationLayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForKeyPath:", CFSTR("transform.scale"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFromValue:", v5);

  objc_msgSend(v8, "setToValue:", &unk_24F13B6A8);
  objc_msgSend(v8, "setDuration:", 0.349999994);
  objc_msgSend(v8, "setFillMode:", *MEMORY[0x24BDE5978]);
  objc_msgSend(v8, "setRemovedOnCompletion:", 0);
  objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", *MEMORY[0x24BDE5D28]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTimingFunction:", v6);

  -[SHListeningLayer shazamButtonLayer](self, "shazamButtonLayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addAnimation:forKey:", v8, CFSTR("SHListeningShazamButtonScaleAnimationKey"));

}

- (void)animateToIdleStateWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  id v43;

  v4 = a3;
  -[SHListeningLayer innerCircleToShazamButtonMaskLayer](self, "innerCircleToShazamButtonMaskLayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAllAnimations");

  -[SHListeningLayer shazamButtonLayer](self, "shazamButtonLayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeAllAnimations");

  -[SHListeningLayer autoShadowToShazamButtonMaskLayer](self, "autoShadowToShazamButtonMaskLayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeAllAnimations");

  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  objc_msgSend(MEMORY[0x24BDE57D8], "setCompletionBlock:", v4);

  -[SHListeningLayer shazamButtonLayer](self, "shazamButtonLayer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "presentationLayer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "valueForKeyPath:", CFSTR("sublayerTransform.scale"));
  v43 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("sublayerTransform.scale"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFromValue:", v43);
  objc_msgSend(v10, "setToValue:", &unk_24F13B678);
  objc_msgSend(v10, "setDuration:", 0.349999994);
  objc_msgSend(v10, "setRemovedOnCompletion:", 0);
  v11 = *MEMORY[0x24BDE5978];
  objc_msgSend(v10, "setFillMode:", *MEMORY[0x24BDE5978]);
  v12 = *MEMORY[0x24BDE5D28];
  v40 = *MEMORY[0x24BDE5D28];
  objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", *MEMORY[0x24BDE5D28]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTimingFunction:", v13);

  -[SHListeningLayer shazamButtonLayer](self, "shazamButtonLayer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addAnimation:forKey:", v10, CFSTR("SHListeningShazamButtonScaleAnimationKey"));

  -[SHListeningLayer innerCircleToShazamButtonMaskLayer](self, "innerCircleToShazamButtonMaskLayer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "presentationLayer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "valueForKeyPath:", CFSTR("transform.scale"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("transform.scale"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setFromValue:", v42);
  objc_msgSend(v17, "setToValue:", &unk_24F13B678);
  objc_msgSend(v17, "setDuration:", 0.349999994);
  objc_msgSend(v17, "setRemovedOnCompletion:", 0);
  objc_msgSend(v17, "setFillMode:", v11);
  objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", v12);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setTimingFunction:", v18);

  -[SHListeningLayer innerCircleToShazamButtonMaskLayer](self, "innerCircleToShazamButtonMaskLayer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addAnimation:forKey:", v17, CFSTR("SHListeningShazamButtonScaleAnimationKey"));

  -[SHListeningLayer autoShadowToShazamButtonMaskLayer](self, "autoShadowToShazamButtonMaskLayer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addAnimation:forKey:", v17, CFSTR("SHListeningShazamButtonScaleAnimationKey"));

  -[SHListeningLayer innerCirclesLayer](self, "innerCirclesLayer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "presentationLayer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "valueForKeyPath:", CFSTR("transform.scale"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("transform.scale"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setFromValue:", v41);
  objc_msgSend(v23, "setToValue:", &unk_24F13B6B8);
  objc_msgSend(v23, "setDuration:", 0.349999994);
  objc_msgSend(v23, "setRemovedOnCompletion:", 0);
  objc_msgSend(v23, "setFillMode:", v11);
  v38 = *MEMORY[0x24BDE5D18];
  objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setTimingFunction:", v24);

  -[SHListeningLayer innerCirclesLayer](self, "innerCirclesLayer");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "addAnimation:forKey:", v23, CFSTR("SHListeningInnerCirclesScaleAnimationKey"));

  -[SHListeningLayer outerCirclesLayer](self, "outerCirclesLayer");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "presentationLayer");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "valueForKeyPath:", CFSTR("opacity"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("opacity"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setFromValue:", v39);
  objc_msgSend(v28, "setToValue:", &unk_24F13B6C8);
  objc_msgSend(v28, "setDuration:", 0.5);
  objc_msgSend(v28, "setRemovedOnCompletion:", 0);
  objc_msgSend(v28, "setFillMode:", v11);
  objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", v40);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setTimingFunction:", v29);

  -[SHListeningLayer outerCirclesLayer](self, "outerCirclesLayer");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "addAnimation:forKey:", v28, CFSTR("SHListeningOuterCirclesOpacityAnimationKey"));

  -[SHListeningLayer autoShadowLayer](self, "autoShadowLayer");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "presentationLayer");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "valueForKeyPath:", CFSTR("transform.scale"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("transform.scale"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setFromValue:", v33);
  objc_msgSend(v34, "setToValue:", &unk_24F13B6D8);
  objc_msgSend(v34, "setDuration:", 0.5);
  objc_msgSend(v34, "setRemovedOnCompletion:", 0);
  objc_msgSend(v34, "setFillMode:", v11);
  objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", v38);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setTimingFunction:", v35);

  -[SHListeningLayer autoShadowLayer](self, "autoShadowLayer");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "addAnimation:forKey:", v34, 0);

  -[SHListeningLayer innerCircleToAutoShadowMaskLayer](self, "innerCircleToAutoShadowMaskLayer");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "addAnimation:forKey:", v34, CFSTR("SHListeningAutoShadowScaleAnimationKey"));

  objc_msgSend(MEMORY[0x24BDE57D8], "commit");
}

- (void)addInnerCirclesLayer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  SHListeningInnerCirclesLayer *v13;
  void *v14;
  SHListeningInnerCirclesLayer *v15;
  void *v16;
  void *v17;
  id v18;

  -[SHListeningLayer innerCirclesLayer](self, "innerCirclesLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3
    || (-[SHListeningLayer innerCirclesContainerLayer](self, "innerCirclesContainerLayer"),
        (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {

  }
  else
  {
    -[SHListeningLayer innerCirclesSecondaryContainerLayer](self, "innerCirclesSecondaryContainerLayer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v17)
      goto LABEL_5;
  }
  -[SHListeningLayer innerCirclesLayer](self, "innerCirclesLayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeFromSuperlayer");

  -[SHListeningLayer innerCirclesContainerLayer](self, "innerCirclesContainerLayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeFromSuperlayer");

  -[SHListeningLayer innerCirclesSecondaryContainerLayer](self, "innerCirclesSecondaryContainerLayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeFromSuperlayer");

LABEL_5:
  v7 = objc_alloc_init(MEMORY[0x24BDE56D0]);
  -[SHListeningLayer setInnerCirclesContainerLayer:](self, "setInnerCirclesContainerLayer:", v7);

  -[SHListeningLayer innerCirclesContainerLayer](self, "innerCirclesContainerLayer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHListeningLayer shazamButtonLayer](self, "shazamButtonLayer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHListeningLayer insertSublayer:below:](self, "insertSublayer:below:", v8, v9);

  v10 = objc_alloc_init(MEMORY[0x24BDE56D0]);
  -[SHListeningLayer setInnerCirclesSecondaryContainerLayer:](self, "setInnerCirclesSecondaryContainerLayer:", v10);

  -[SHListeningLayer innerCirclesContainerLayer](self, "innerCirclesContainerLayer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHListeningLayer innerCirclesSecondaryContainerLayer](self, "innerCirclesSecondaryContainerLayer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addSublayer:", v12);

  v13 = [SHListeningInnerCirclesLayer alloc];
  -[SHListeningLayer palette](self, "palette");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[SHPaletteLayer initWithPalette:](v13, "initWithPalette:", v14);
  -[SHListeningLayer setInnerCirclesLayer:](self, "setInnerCirclesLayer:", v15);

  -[SHListeningLayer innerCirclesSecondaryContainerLayer](self, "innerCirclesSecondaryContainerLayer");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  -[SHListeningLayer innerCirclesLayer](self, "innerCirclesLayer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addSublayer:", v16);

}

- (void)addOuterCirclesLayer
{
  void *v3;
  void *v4;
  SHListeningOuterCirclesLayer *v5;
  void *v6;
  SHListeningOuterCirclesLayer *v7;
  id v8;

  -[SHListeningLayer outerCirclesLayer](self, "outerCirclesLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[SHListeningLayer outerCirclesLayer](self, "outerCirclesLayer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeFromSuperlayer");

  }
  v5 = [SHListeningOuterCirclesLayer alloc];
  -[SHListeningLayer palette](self, "palette");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SHPaletteLayer initWithPalette:](v5, "initWithPalette:", v6);
  -[SHListeningLayer setOuterCirclesLayer:](self, "setOuterCirclesLayer:", v7);

  -[SHListeningLayer outerCirclesLayer](self, "outerCirclesLayer");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[SHListeningLayer addSublayer:](self, "addSublayer:", v8);

}

- (void)addAutoShadowLayer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  SHListeningAutoShadowLayer *v10;
  void *v11;
  SHListeningAutoShadowLayer *v12;
  void *v13;
  id v14;

  -[SHListeningLayer autoShadowLayer](self, "autoShadowLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {

LABEL_4:
    -[SHListeningLayer autoShadowLayer](self, "autoShadowLayer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeFromSuperlayer");

    -[SHListeningLayer autoShadowContainerLayer](self, "autoShadowContainerLayer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeFromSuperlayer");

    goto LABEL_5;
  }
  -[SHListeningLayer autoShadowContainerLayer](self, "autoShadowContainerLayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    goto LABEL_4;
LABEL_5:
  v7 = objc_alloc_init(MEMORY[0x24BDE56D0]);
  -[SHListeningLayer setAutoShadowContainerLayer:](self, "setAutoShadowContainerLayer:", v7);

  -[SHListeningLayer autoShadowContainerLayer](self, "autoShadowContainerLayer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHListeningLayer shazamButtonLayer](self, "shazamButtonLayer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHListeningLayer insertSublayer:below:](self, "insertSublayer:below:", v8, v9);

  v10 = [SHListeningAutoShadowLayer alloc];
  -[SHListeningLayer palette](self, "palette");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[SHPaletteLayer initWithPalette:](v10, "initWithPalette:", v11);
  -[SHListeningLayer setAutoShadowLayer:](self, "setAutoShadowLayer:", v12);

  -[SHListeningLayer autoShadowContainerLayer](self, "autoShadowContainerLayer");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  -[SHListeningLayer autoShadowLayer](self, "autoShadowLayer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addSublayer:", v13);

}

- (void)addInnerCirclesToShazamButtonMaskLayer
{
  SHInnerCircleMaskLayer *v3;
  void *v4;
  SHInnerCircleMaskLayer *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = [SHInnerCircleMaskLayer alloc];
  -[SHListeningLayer palette](self, "palette");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SHPaletteLayer initWithPalette:](v3, "initWithPalette:", v4);
  -[SHListeningLayer setInnerCircleToShazamButtonMaskLayer:](self, "setInnerCircleToShazamButtonMaskLayer:", v5);

  -[SHListeningLayer innerCircleToShazamButtonMaskLayer](self, "innerCircleToShazamButtonMaskLayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setInnerCircleRelativeSize:", 3.5);

  -[SHListeningLayer innerCircleToShazamButtonMaskLayer](self, "innerCircleToShazamButtonMaskLayer");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[SHListeningLayer innerCirclesContainerLayer](self, "innerCirclesContainerLayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setMask:", v8);

}

- (void)addInnerCircleToAutoShadowMaskLayer
{
  SHInnerCircleMaskLayer *v3;
  void *v4;
  SHInnerCircleMaskLayer *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = [SHInnerCircleMaskLayer alloc];
  -[SHListeningLayer palette](self, "palette");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SHPaletteLayer initWithPalette:](v3, "initWithPalette:", v4);
  -[SHListeningLayer setInnerCircleToAutoShadowMaskLayer:](self, "setInnerCircleToAutoShadowMaskLayer:", v5);

  -[SHListeningLayer innerCircleToAutoShadowMaskLayer](self, "innerCircleToAutoShadowMaskLayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setInnerCircleRelativeSize:", 3.5);

  -[SHListeningLayer innerCircleToAutoShadowMaskLayer](self, "innerCircleToAutoShadowMaskLayer");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[SHListeningLayer innerCirclesSecondaryContainerLayer](self, "innerCirclesSecondaryContainerLayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setMask:", v8);

}

- (void)addAutoShadowToShazamButtonMaskLayer
{
  SHInnerCircleMaskLayer *v3;
  void *v4;
  SHInnerCircleMaskLayer *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = [SHInnerCircleMaskLayer alloc];
  -[SHListeningLayer palette](self, "palette");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SHPaletteLayer initWithPalette:](v3, "initWithPalette:", v4);
  -[SHListeningLayer setAutoShadowToShazamButtonMaskLayer:](self, "setAutoShadowToShazamButtonMaskLayer:", v5);

  -[SHListeningLayer autoShadowToShazamButtonMaskLayer](self, "autoShadowToShazamButtonMaskLayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setInnerCircleRelativeSize:", 3.5);

  -[SHListeningLayer autoShadowToShazamButtonMaskLayer](self, "autoShadowToShazamButtonMaskLayer");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[SHListeningLayer autoShadowContainerLayer](self, "autoShadowContainerLayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setMask:", v8);

}

- (void)removeAnimationLayers
{
  void *v3;
  void *v4;
  void *v5;

  -[SHListeningLayer innerCirclesContainerLayer](self, "innerCirclesContainerLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperlayer");

  -[SHListeningLayer autoShadowContainerLayer](self, "autoShadowContainerLayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeFromSuperlayer");

  -[SHListeningLayer outerCirclesLayer](self, "outerCirclesLayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeFromSuperlayer");

  -[SHListeningLayer setInnerCirclesLayer:](self, "setInnerCirclesLayer:", 0);
  -[SHListeningLayer setOuterCirclesLayer:](self, "setOuterCirclesLayer:", 0);
  -[SHListeningLayer setAutoShadowLayer:](self, "setAutoShadowLayer:", 0);
  -[SHListeningLayer setInnerCirclesContainerLayer:](self, "setInnerCirclesContainerLayer:", 0);
  -[SHListeningLayer setInnerCirclesSecondaryContainerLayer:](self, "setInnerCirclesSecondaryContainerLayer:", 0);
  -[SHListeningLayer setAutoShadowContainerLayer:](self, "setAutoShadowContainerLayer:", 0);
  -[SHListeningLayer setInnerCircleToAutoShadowMaskLayer:](self, "setInnerCircleToAutoShadowMaskLayer:", 0);
  -[SHListeningLayer setInnerCircleToShazamButtonMaskLayer:](self, "setInnerCircleToShazamButtonMaskLayer:", 0);
  -[SHListeningLayer setAutoShadowToShazamButtonMaskLayer:](self, "setAutoShadowToShazamButtonMaskLayer:", 0);
}

- (void)buttonWillFinishDrawingShazamShape
{
  id v2;

  -[SHListeningLayer viewDelegate](self, "viewDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "willFinishDrawingShazamShape");

}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (SHListeningLayerDelegate)viewDelegate
{
  return (SHListeningLayerDelegate *)objc_loadWeakRetained((id *)&self->_viewDelegate);
}

- (void)setViewDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_viewDelegate, a3);
}

- (SHShazamButtonLayer)shazamButtonLayer
{
  return self->_shazamButtonLayer;
}

- (void)setShazamButtonLayer:(id)a3
{
  objc_storeStrong((id *)&self->_shazamButtonLayer, a3);
}

- (CALayer)autoShadowContainerLayer
{
  return self->_autoShadowContainerLayer;
}

- (void)setAutoShadowContainerLayer:(id)a3
{
  objc_storeStrong((id *)&self->_autoShadowContainerLayer, a3);
}

- (CALayer)innerCirclesContainerLayer
{
  return self->_innerCirclesContainerLayer;
}

- (void)setInnerCirclesContainerLayer:(id)a3
{
  objc_storeStrong((id *)&self->_innerCirclesContainerLayer, a3);
}

- (CALayer)innerCirclesSecondaryContainerLayer
{
  return self->_innerCirclesSecondaryContainerLayer;
}

- (void)setInnerCirclesSecondaryContainerLayer:(id)a3
{
  objc_storeStrong((id *)&self->_innerCirclesSecondaryContainerLayer, a3);
}

- (SHListeningInnerCirclesLayer)innerCirclesLayer
{
  return self->_innerCirclesLayer;
}

- (void)setInnerCirclesLayer:(id)a3
{
  objc_storeStrong((id *)&self->_innerCirclesLayer, a3);
}

- (SHListeningOuterCirclesLayer)outerCirclesLayer
{
  return self->_outerCirclesLayer;
}

- (void)setOuterCirclesLayer:(id)a3
{
  objc_storeStrong((id *)&self->_outerCirclesLayer, a3);
}

- (SHListeningAutoShadowLayer)autoShadowLayer
{
  return self->_autoShadowLayer;
}

- (void)setAutoShadowLayer:(id)a3
{
  objc_storeStrong((id *)&self->_autoShadowLayer, a3);
}

- (SHInnerCircleMaskLayer)innerCircleToShazamButtonMaskLayer
{
  return self->_innerCircleToShazamButtonMaskLayer;
}

- (void)setInnerCircleToShazamButtonMaskLayer:(id)a3
{
  objc_storeStrong((id *)&self->_innerCircleToShazamButtonMaskLayer, a3);
}

- (SHInnerCircleMaskLayer)innerCircleToAutoShadowMaskLayer
{
  return self->_innerCircleToAutoShadowMaskLayer;
}

- (void)setInnerCircleToAutoShadowMaskLayer:(id)a3
{
  objc_storeStrong((id *)&self->_innerCircleToAutoShadowMaskLayer, a3);
}

- (SHInnerCircleMaskLayer)autoShadowToShazamButtonMaskLayer
{
  return self->_autoShadowToShazamButtonMaskLayer;
}

- (void)setAutoShadowToShazamButtonMaskLayer:(id)a3
{
  objc_storeStrong((id *)&self->_autoShadowToShazamButtonMaskLayer, a3);
}

- (SHPalette)palette
{
  return self->_palette;
}

- (BOOL)shouldPerformIntroAnimation
{
  return self->_shouldPerformIntroAnimation;
}

- (void)setShouldPerformIntroAnimation:(BOOL)a3
{
  self->_shouldPerformIntroAnimation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_palette, 0);
  objc_storeStrong((id *)&self->_autoShadowToShazamButtonMaskLayer, 0);
  objc_storeStrong((id *)&self->_innerCircleToAutoShadowMaskLayer, 0);
  objc_storeStrong((id *)&self->_innerCircleToShazamButtonMaskLayer, 0);
  objc_storeStrong((id *)&self->_autoShadowLayer, 0);
  objc_storeStrong((id *)&self->_outerCirclesLayer, 0);
  objc_storeStrong((id *)&self->_innerCirclesLayer, 0);
  objc_storeStrong((id *)&self->_innerCirclesSecondaryContainerLayer, 0);
  objc_storeStrong((id *)&self->_innerCirclesContainerLayer, 0);
  objc_storeStrong((id *)&self->_autoShadowContainerLayer, 0);
  objc_storeStrong((id *)&self->_shazamButtonLayer, 0);
  objc_destroyWeak((id *)&self->_viewDelegate);
}

@end
