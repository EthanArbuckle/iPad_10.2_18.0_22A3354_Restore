@implementation SHShazamButtonLayer

- (void)setup
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;

  v3 = objc_alloc_init(MEMORY[0x24BDE56D0]);
  -[SHShazamButtonLayer setBackgroundLayer:](self, "setBackgroundLayer:", v3);

  -[SHShazamButtonLayer bounds](self, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[SHShazamButtonLayer backgroundLayer](self, "backgroundLayer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

  -[SHShazamButtonLayer backgroundLayer](self, "backgroundLayer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setMasksToBounds:", 1);

  -[SHPaletteLayer palette](self, "palette");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "listeningButtonBackgroundColor");
  -[SHShazamButtonLayer backgroundLayer](self, "backgroundLayer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setBackgroundColor:", v15);

  -[SHShazamButtonLayer backgroundLayer](self, "backgroundLayer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHShazamButtonLayer addSublayer:](self, "addSublayer:", v17);

  v18 = objc_alloc_init(MEMORY[0x24BDE5758]);
  -[SHShazamButtonLayer setTopBorder:](self, "setTopBorder:", v18);

  -[SHPaletteLayer palette](self, "palette");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "listeningButtonTopBorderColor");
  -[SHShazamButtonLayer topBorder](self, "topBorder");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setStrokeColor:", v20);

  -[SHShazamButtonLayer topBorder](self, "topBorder");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setLineWidth:", 1.0);

  -[SHPaletteLayer palette](self, "palette");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "clearColor");
  -[SHShazamButtonLayer topBorder](self, "topBorder");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setFillColor:", v24);

  -[SHShazamButtonLayer backgroundLayer](self, "backgroundLayer");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHShazamButtonLayer topBorder](self, "topBorder");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "addSublayer:", v27);

  v28 = objc_alloc_init(MEMORY[0x24BDE56D0]);
  -[SHShazamButtonLayer setShapeLayer:](self, "setShapeLayer:", v28);

  -[SHShazamButtonLayer shapeLayer](self, "shapeLayer");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setFrame:", 0.0, 0.0, 210.0, 210.0);

  -[SHShazamButtonLayer backgroundLayer](self, "backgroundLayer");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHShazamButtonLayer shapeLayer](self, "shapeLayer");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "addSublayer:", v31);

  -[SHShazamButtonLayer drawTransparentShape](self, "drawTransparentShape");
}

- (void)layoutSublayers
{
  CGPath *Mutable;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  CGFloat v29;
  double v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  CATransform3D v35;
  CATransform3D v36;
  objc_super v37;

  v37.receiver = self;
  v37.super_class = (Class)SHShazamButtonLayer;
  -[SHShazamButtonLayer layoutSublayers](&v37, sel_layoutSublayers);
  Mutable = CGPathCreateMutable();
  -[SHShazamButtonLayer bounds](self, "bounds");
  v5 = v4 * 0.5;
  -[SHShazamButtonLayer bounds](self, "bounds");
  v7 = v6 * 0.5 + 2.0;
  -[SHShazamButtonLayer bounds](self, "bounds");
  CGPathAddArc(Mutable, 0, v5, v7, v8 * 0.5 + 1.0, 0.0, 3.14159265, 1);
  -[SHShazamButtonLayer topBorder](self, "topBorder");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPath:", Mutable);

  CGPathRelease(Mutable);
  -[SHShazamButtonLayer bounds](self, "bounds");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  -[SHShazamButtonLayer backgroundLayer](self, "backgroundLayer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setFrame:", v11, v13, v15, v17);

  -[SHShazamButtonLayer bounds](self, "bounds");
  v20 = v19 * 0.5;
  -[SHShazamButtonLayer backgroundLayer](self, "backgroundLayer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setCornerRadius:", v20);

  -[SHShazamButtonLayer backgroundLayer](self, "backgroundLayer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "position");
  v24 = v23;
  v26 = v25;
  -[SHShazamButtonLayer shapeLayer](self, "shapeLayer");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setPosition:", v24, v26);

  -[SHShazamButtonLayer frame](self, "frame");
  v29 = v28 / 367.5;
  -[SHShazamButtonLayer frame](self, "frame");
  CATransform3DMakeScale(&v36, v29, v30 / 367.5, 1.0);
  -[SHShazamButtonLayer shapeLayer](self, "shapeLayer");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v36;
  objc_msgSend(v31, "setTransform:", &v35);

  -[SHPaletteLayer palette](self, "palette");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "listeningButtonBackgroundColor");
  -[SHShazamButtonLayer backgroundLayer](self, "backgroundLayer");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setBackgroundColor:", v33);

}

- (void)skipIntroAnimation
{
  -[SHShazamButtonLayer setInitialAnimationPerformed:](self, "setInitialAnimationPerformed:", 1);
  -[SHShazamButtonLayer drawSolidShape](self, "drawSolidShape");
}

- (void)performSDrawingIntroAnimation
{
  if (!-[SHShazamButtonLayer initialAnimationPerformed](self, "initialAnimationPerformed"))
  {
    -[SHShazamButtonLayer setInitialAnimationPerformed:](self, "setInitialAnimationPerformed:", 1);
    -[SHShazamButtonLayer performSDrawingAnimationWithDuration:delay:](self, "performSDrawingAnimationWithDuration:delay:", 0.839999974, 0.0);
  }
}

- (void)performSDrawingAnimationWithDuration:(double)a3 delay:(double)a4
{
  double v5;
  uint64_t v6;
  double v7;
  _QWORD v8[5];
  _QWORD v9[5];

  v5 = a4 + a3 * 0.357142895;
  v6 = MEMORY[0x24BDAC760];
  v7 = a3 * 0.642857194;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __66__SHShazamButtonLayer_performSDrawingAnimationWithDuration_delay___block_invoke;
  v9[3] = &unk_24F1360B8;
  v9[4] = self;
  -[SHShazamButtonLayer removeTransparentShapeWithDuration:delay:completion:](self, "removeTransparentShapeWithDuration:delay:completion:", v9, a3 * 0.357142895);
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __66__SHShazamButtonLayer_performSDrawingAnimationWithDuration_delay___block_invoke_2;
  v8[3] = &unk_24F1360B8;
  v8[4] = self;
  -[SHShazamButtonLayer drawSolidShapeWithDuration:delay:completion:](self, "drawSolidShapeWithDuration:delay:completion:", v8, v7, v5);
}

void __66__SHShazamButtonLayer_performSDrawingAnimationWithDuration_delay___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "buttonDelegate");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "buttonWillFinishDrawingShazamShape");

}

void __66__SHShazamButtonLayer_performSDrawingAnimationWithDuration_delay___block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "buttonDelegate");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "buttonDidFinishDrawingShazamShape");

}

- (void)performFadeInIntroAnimation:(double)a3 delay:(double)a4
{
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];

  -[SHShazamButtonLayer drawSolidShape](self, "drawSolidShape");
  objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("opacity"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDuration:", a3);
  objc_msgSend(v7, "setBeginTime:", CACurrentMediaTime() + a4);
  objc_msgSend(v7, "setFromValue:", &unk_24F13B018);
  objc_msgSend(v7, "setToValue:", &unk_24F13B028);
  v8 = *MEMORY[0x24BDE5D20];
  objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", *MEMORY[0x24BDE5D20]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTimingFunction:", v9);

  objc_msgSend(v7, "setRemovedOnCompletion:", 1);
  v10 = *MEMORY[0x24BDE5970];
  objc_msgSend(v7, "setFillMode:", *MEMORY[0x24BDE5970]);
  objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("opacity"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setDuration:", a3);
  objc_msgSend(v11, "setBeginTime:", CACurrentMediaTime() + a4);
  objc_msgSend(v11, "setFromValue:", &unk_24F13B028);
  objc_msgSend(v11, "setToValue:", &unk_24F13B018);
  objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTimingFunction:", v12);

  objc_msgSend(v11, "setRemovedOnCompletion:", 1);
  objc_msgSend(v11, "setFillMode:", v10);
  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __57__SHShazamButtonLayer_performFadeInIntroAnimation_delay___block_invoke;
  v17[3] = &unk_24F1360B8;
  v17[4] = self;
  objc_msgSend(MEMORY[0x24BDE57D8], "setCompletionBlock:", v17);
  -[SHShazamButtonLayer topSolidLayer](self, "topSolidLayer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addAnimation:forKey:", v7, 0);

  -[SHShazamButtonLayer bottomSolidLayer](self, "bottomSolidLayer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addAnimation:forKey:", v7, 0);

  -[SHShazamButtonLayer topTransparentLayer](self, "topTransparentLayer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addAnimation:forKey:", v11, 0);

  -[SHShazamButtonLayer bottomTransparentLayer](self, "bottomTransparentLayer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addAnimation:forKey:", v11, 0);

  objc_msgSend(MEMORY[0x24BDE57D8], "commit");
}

uint64_t __57__SHShazamButtonLayer_performFadeInIntroAnimation_delay___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeTransparentShape");
}

- (void)removeTransparentShape
{
  void *v3;
  void *v4;

  -[SHShazamButtonLayer topTransparentLayer](self, "topTransparentLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperlayer");

  -[SHShazamButtonLayer bottomTransparentLayer](self, "bottomTransparentLayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeFromSuperlayer");

  -[SHShazamButtonLayer setTopTransparentLayer:](self, "setTopTransparentLayer:", 0);
  -[SHShazamButtonLayer setBottomTransparentLayer:](self, "setBottomTransparentLayer:", 0);
}

- (void)drawTransparentShape
{
  CGPath *v3;
  void *v4;
  void *v5;
  CGPath *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;

  v3 = -[SHShazamButtonLayer topStrokePath](self, "topStrokePath");
  -[SHPaletteLayer palette](self, "palette");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHShazamButtonLayer strokeLayerWithPath:color:](self, "strokeLayerWithPath:color:", v3, objc_msgSend(v4, "listeningButtonBackgroundTransparentColor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHShazamButtonLayer setTopTransparentLayer:](self, "setTopTransparentLayer:", v5);

  v6 = -[SHShazamButtonLayer bottomStrokePath](self, "bottomStrokePath");
  -[SHPaletteLayer palette](self, "palette");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHShazamButtonLayer strokeLayerWithPath:color:](self, "strokeLayerWithPath:color:", v6, objc_msgSend(v7, "listeningButtonBackgroundTransparentColor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHShazamButtonLayer setBottomTransparentLayer:](self, "setBottomTransparentLayer:", v8);

  -[SHPaletteLayer palette](self, "palette");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "listeningButtonTopBorderColor");
  -[SHShazamButtonLayer topTransparentLayer](self, "topTransparentLayer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setShadowColor:", v10);

  -[SHShazamButtonLayer topTransparentLayer](self, "topTransparentLayer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v13) = 1.0;
  objc_msgSend(v12, "setShadowOpacity:", v13);

  -[SHShazamButtonLayer topTransparentLayer](self, "topTransparentLayer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setShadowRadius:", 1.0);

  -[SHShazamButtonLayer topTransparentLayer](self, "topTransparentLayer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setShadowOffset:", 0.5, 1.0);

  -[SHPaletteLayer palette](self, "palette");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "listeningButtonTopBorderColor");
  -[SHShazamButtonLayer bottomTransparentLayer](self, "bottomTransparentLayer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setShadowColor:", v17);

  -[SHShazamButtonLayer bottomTransparentLayer](self, "bottomTransparentLayer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v20) = 1.0;
  objc_msgSend(v19, "setShadowOpacity:", v20);

  -[SHShazamButtonLayer bottomTransparentLayer](self, "bottomTransparentLayer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setShadowRadius:", 1.0);

  -[SHShazamButtonLayer bottomTransparentLayer](self, "bottomTransparentLayer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setShadowOffset:", 0.5, 1.0);

  -[SHShazamButtonLayer shapeLayer](self, "shapeLayer");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHShazamButtonLayer topTransparentLayer](self, "topTransparentLayer");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addSublayer:", v24);

  -[SHShazamButtonLayer shapeLayer](self, "shapeLayer");
  v26 = (id)objc_claimAutoreleasedReturnValue();
  -[SHShazamButtonLayer bottomTransparentLayer](self, "bottomTransparentLayer");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "addSublayer:", v25);

}

- (void)removeTransparentShapeWithDuration:(double)a3 delay:(double)a4 completion:(id)a5
{
  id v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t);
  void *v24;
  SHShazamButtonLayer *v25;
  id v26;

  v8 = a5;
  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("strokeStart"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDuration:", a3);
  objc_msgSend(v9, "setBeginTime:", CACurrentMediaTime() + a4);
  objc_msgSend(v9, "setFromValue:", &unk_24F13B018);
  objc_msgSend(v9, "setToValue:", &unk_24F13B028);
  LODWORD(v10) = 1.0;
  LODWORD(v11) = 0;
  LODWORD(v12) = 1.0;
  LODWORD(v13) = 1.0;
  objc_msgSend(MEMORY[0x24BDE56F0], "functionWithControlPoints::::", v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTimingFunction:", v14);

  objc_msgSend(v9, "setRemovedOnCompletion:", 1);
  objc_msgSend(v9, "setFillMode:", *MEMORY[0x24BDE5970]);
  objc_msgSend(MEMORY[0x24BDE57D8], "setValue:forKey:", *MEMORY[0x24BDBD270], *MEMORY[0x24BDE5DF0]);
  -[SHShazamButtonLayer topTransparentLayer](self, "topTransparentLayer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setStrokeStart:", 1.0);

  -[SHShazamButtonLayer bottomTransparentLayer](self, "bottomTransparentLayer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setStrokeStart:", 1.0);

  v17 = (void *)MEMORY[0x24BDE57D8];
  v21 = MEMORY[0x24BDAC760];
  v22 = 3221225472;
  v23 = __75__SHShazamButtonLayer_removeTransparentShapeWithDuration_delay_completion___block_invoke;
  v24 = &unk_24F1360E0;
  v25 = self;
  v26 = v8;
  v18 = v8;
  objc_msgSend(v17, "setCompletionBlock:", &v21);
  -[SHShazamButtonLayer topTransparentLayer](self, "topTransparentLayer", v21, v22, v23, v24, v25);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addAnimation:forKey:", v9, CFSTR("strokeEnd"));

  -[SHShazamButtonLayer bottomTransparentLayer](self, "bottomTransparentLayer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addAnimation:forKey:", v9, CFSTR("strokeEnd"));

  objc_msgSend(MEMORY[0x24BDE57D8], "commit");
}

uint64_t __75__SHShazamButtonLayer_removeTransparentShapeWithDuration_delay_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "topTransparentLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeFromSuperlayer");

  objc_msgSend(*(id *)(a1 + 32), "bottomTransparentLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperlayer");

  objc_msgSend(*(id *)(a1 + 32), "setTopTransparentLayer:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setBottomTransparentLayer:", 0);
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)drawSolidShape
{
  CGPath *v3;
  void *v4;
  void *v5;
  CGPath *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v3 = -[SHShazamButtonLayer topStrokePath](self, "topStrokePath");
  -[SHPaletteLayer palette](self, "palette");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHShazamButtonLayer strokeLayerWithPath:color:](self, "strokeLayerWithPath:color:", v3, objc_msgSend(v4, "listeningButtonShazamShapeColor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHShazamButtonLayer setTopSolidLayer:](self, "setTopSolidLayer:", v5);

  v6 = -[SHShazamButtonLayer bottomStrokePath](self, "bottomStrokePath");
  -[SHPaletteLayer palette](self, "palette");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHShazamButtonLayer strokeLayerWithPath:color:](self, "strokeLayerWithPath:color:", v6, objc_msgSend(v7, "listeningButtonShazamShapeColor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHShazamButtonLayer setBottomSolidLayer:](self, "setBottomSolidLayer:", v8);

  -[SHShazamButtonLayer shapeLayer](self, "shapeLayer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHShazamButtonLayer topSolidLayer](self, "topSolidLayer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSublayer:", v10);

  -[SHShazamButtonLayer shapeLayer](self, "shapeLayer");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[SHShazamButtonLayer bottomSolidLayer](self, "bottomSolidLayer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addSublayer:", v11);

}

- (void)drawSolidShapeWithDuration:(double)a3 delay:(double)a4 completion:(id)a5
{
  id v8;
  CGPath *v9;
  void *v10;
  void *v11;
  CGPath *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[5];
  id v34;
  _QWORD v35[3];

  v35[2] = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  v9 = -[SHShazamButtonLayer topStrokeLongPath](self, "topStrokeLongPath");
  -[SHPaletteLayer palette](self, "palette");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHShazamButtonLayer strokeLayerWithPath:color:](self, "strokeLayerWithPath:color:", v9, objc_msgSend(v10, "listeningButtonShazamShapeColor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHShazamButtonLayer setTopSolidLayer:](self, "setTopSolidLayer:", v11);

  v12 = -[SHShazamButtonLayer bottomStrokeLongPath](self, "bottomStrokeLongPath");
  -[SHPaletteLayer palette](self, "palette");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHShazamButtonLayer strokeLayerWithPath:color:](self, "strokeLayerWithPath:color:", v12, objc_msgSend(v13, "listeningButtonShazamShapeColor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHShazamButtonLayer setBottomSolidLayer:](self, "setBottomSolidLayer:", v14);

  -[SHShazamButtonLayer shapeLayer](self, "shapeLayer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHShazamButtonLayer topSolidLayer](self, "topSolidLayer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addSublayer:", v16);

  -[SHShazamButtonLayer shapeLayer](self, "shapeLayer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHShazamButtonLayer bottomSolidLayer](self, "bottomSolidLayer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addSublayer:", v18);

  LODWORD(v19) = 1053609165;
  LODWORD(v20) = 1053944709;
  LODWORD(v21) = 1.0;
  LODWORD(v22) = 1.0;
  objc_msgSend(MEMORY[0x24BDE56F0], "functionWithControlPoints::::", v19, v21, v20, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("strokeEnd"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setDuration:", a3);
  objc_msgSend(v24, "setFromValue:", &unk_24F13B1A8);
  objc_msgSend(v24, "setToValue:", &unk_24F13B1C0);
  objc_msgSend(v24, "setTimingFunction:", v23);
  objc_msgSend(v24, "setRemovedOnCompletion:", 0);
  v25 = *MEMORY[0x24BDE5970];
  objc_msgSend(v24, "setFillMode:", *MEMORY[0x24BDE5970]);
  objc_msgSend(v24, "setBeginTime:", a4);
  objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("strokeStart"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setDuration:", a3);
  objc_msgSend(v26, "setFromValue:", &unk_24F13B1A8);
  objc_msgSend(v26, "setToValue:", &unk_24F13B038);
  objc_msgSend(v26, "setTimingFunction:", v23);
  objc_msgSend(v26, "setRemovedOnCompletion:", 0);
  objc_msgSend(v26, "setFillMode:", v25);
  objc_msgSend(v26, "setBeginTime:", a4);
  v27 = (void *)MEMORY[0x24BDE57D8];
  v33[0] = MEMORY[0x24BDAC760];
  v33[1] = 3221225472;
  v33[2] = __67__SHShazamButtonLayer_drawSolidShapeWithDuration_delay_completion___block_invoke;
  v33[3] = &unk_24F1360E0;
  v33[4] = self;
  v34 = v8;
  v28 = v8;
  objc_msgSend(v27, "setCompletionBlock:", v33);
  objc_msgSend(MEMORY[0x24BDE5638], "animation");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v26;
  v35[1] = v24;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v35, 2);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setAnimations:", v30);

  objc_msgSend(v29, "setDuration:", a3 + a4);
  objc_msgSend(v29, "setRemovedOnCompletion:", 0);
  objc_msgSend(v29, "setFillMode:", v25);
  -[SHShazamButtonLayer topSolidLayer](self, "topSolidLayer");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "addAnimation:forKey:", v29, 0);

  -[SHShazamButtonLayer bottomSolidLayer](self, "bottomSolidLayer");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "addAnimation:forKey:", v29, 0);

  objc_msgSend(MEMORY[0x24BDE57D8], "commit");
}

uint64_t __67__SHShazamButtonLayer_drawSolidShapeWithDuration_delay_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "topSolidLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeFromSuperlayer");

  objc_msgSend(*(id *)(a1 + 32), "bottomSolidLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperlayer");

  v4 = *(void **)(a1 + 32);
  v5 = objc_msgSend(v4, "topStrokePath");
  objc_msgSend(*(id *)(a1 + 32), "palette");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "strokeLayerWithPath:color:", v5, objc_msgSend(v6, "listeningButtonShazamShapeColor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setTopSolidLayer:", v7);

  v8 = *(void **)(a1 + 32);
  v9 = objc_msgSend(v8, "bottomStrokePath");
  objc_msgSend(*(id *)(a1 + 32), "palette");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "strokeLayerWithPath:color:", v9, objc_msgSend(v10, "listeningButtonShazamShapeColor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setBottomSolidLayer:", v11);

  objc_msgSend(*(id *)(a1 + 32), "shapeLayer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "topSolidLayer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addSublayer:", v13);

  objc_msgSend(*(id *)(a1 + 32), "shapeLayer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "bottomSolidLayer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addSublayer:", v15);

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (id)strokeLayerWithPath:(CGPath *)a3 color:(CGColor *)a4
{
  id v7;
  void *v8;

  v7 = objc_alloc_init(MEMORY[0x24BDE5758]);
  objc_msgSend(v7, "setPath:", a3);
  objc_msgSend(v7, "setStrokeColor:", a4);
  objc_msgSend(v7, "setLineWidth:", 38.0);
  objc_msgSend(v7, "setLineCap:", *MEMORY[0x24BDE5CE8]);
  -[SHPaletteLayer palette](self, "palette");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFillColor:", objc_msgSend(v8, "clearColor"));

  return v7;
}

- (CGPath)topStrokeLongPath
{
  CGPath *Mutable;

  Mutable = CGPathCreateMutable();
  CGPathMoveToPoint(Mutable, 0, 133.6, 117.9);
  CGPathAddCurveToPoint(Mutable, 0, 144.05, 107.41, 155.21, 96.08, 161.2, 89.7);
  CGPathAddCurveToPoint(Mutable, 0, 181.72, 67.84, 180.89, 30.51, 159.4, 9.7);
  CGPathAddCurveToPoint(Mutable, 0, 136.89, -13.49, 100.97, -11.49, 80.7, 6.17);
  CGPathAddCurveToPoint(Mutable, 0, 80.7, 6.17, 77.6, 9.12, 76.3, 10.4);
  CGPathAddCurveToPoint(Mutable, 0, 62.4, 24.48, 41.85, 44.71, 32.49, 54.68);
  CGPathAddCurveToPoint(Mutable, 0, 11.96, 76.54, 12.8, 113.87, 34.29, 134.68);
  CGPathAddCurveToPoint(Mutable, 0, 56.8, 157.87, 93.03, 156.21, 113.29, 138.21);
  CGPathAddCurveToPoint(Mutable, 0, 119.79, 132.0, 133.69, 117.88, 133.69, 117.88);
  CFAutorelease(Mutable);
  return Mutable;
}

- (CGPath)bottomStrokeLongPath
{
  CGPath *Mutable;

  Mutable = CGPathCreateMutable();
  CGPathMoveToPoint(Mutable, 0, 76.4, 93.5);
  CGPathAddCurveToPoint(Mutable, 0, 65.95, 103.99, 55.21, 114.99, 49.22, 121.37);
  CGPathAddCurveToPoint(Mutable, 0, 28.69, 143.24, 29.53, 180.57, 51.02, 201.37);
  CGPathAddCurveToPoint(Mutable, 0, 73.53, 224.57, 109.45, 222.57, 129.72, 204.9);
  CGPathAddCurveToPoint(Mutable, 0, 129.72, 204.9, 132.31, 202.48, 133.62, 201.2);
  CGPathAddCurveToPoint(Mutable, 0, 147.6, 186.93, 168.16, 166.7, 177.52, 156.72);
  CGPathAddCurveToPoint(Mutable, 0, 198.04, 134.86, 197.21, 97.53, 175.72, 76.72);
  CGPathAddCurveToPoint(Mutable, 0, 153.21, 53.53, 116.98, 55.2, 96.72, 73.2);
  CGPathAddCurveToPoint(Mutable, 0, 90.22, 79.4, 76.32, 93.52, 76.32, 93.52);
  CFAutorelease(Mutable);
  return Mutable;
}

- (CGPath)topStrokePath
{
  CGPath *Mutable;

  Mutable = CGPathCreateMutable();
  CGPathMoveToPoint(Mutable, 0, 76.19, 10.38);
  CGPathAddCurveToPoint(Mutable, 0, 62.4, 24.48, 41.85, 44.71, 32.49, 54.68);
  CGPathAddCurveToPoint(Mutable, 0, 11.96, 76.54, 12.8, 113.87, 34.29, 134.68);
  CGPathAddCurveToPoint(Mutable, 0, 56.8, 157.87, 93.03, 156.21, 113.29, 138.21);
  CGPathAddCurveToPoint(Mutable, 0, 119.79, 132.0, 133.69, 117.88, 133.69, 117.88);
  CFAutorelease(Mutable);
  return Mutable;
}

- (CGPath)bottomStrokePath
{
  CGPath *Mutable;

  Mutable = CGPathCreateMutable();
  CGPathMoveToPoint(Mutable, 0, 133.82, 201.02);
  CGPathAddCurveToPoint(Mutable, 0, 147.6, 186.93, 168.16, 166.7, 177.52, 156.72);
  CGPathAddCurveToPoint(Mutable, 0, 198.04, 134.86, 197.21, 97.53, 175.72, 76.72);
  CGPathAddCurveToPoint(Mutable, 0, 153.21, 53.53, 116.98, 55.2, 96.72, 73.2);
  CGPathAddCurveToPoint(Mutable, 0, 90.22, 79.4, 76.32, 93.52, 76.32, 93.52);
  CFAutorelease(Mutable);
  return Mutable;
}

- (SHShazamButtonViewDelegate)buttonDelegate
{
  return (SHShazamButtonViewDelegate *)objc_loadWeakRetained((id *)&self->_buttonDelegate);
}

- (void)setButtonDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_buttonDelegate, a3);
}

- (CALayer)backgroundLayer
{
  return self->_backgroundLayer;
}

- (void)setBackgroundLayer:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundLayer, a3);
}

- (CALayer)shapeLayer
{
  return self->_shapeLayer;
}

- (void)setShapeLayer:(id)a3
{
  objc_storeStrong((id *)&self->_shapeLayer, a3);
}

- (CAShapeLayer)topTransparentLayer
{
  return self->_topTransparentLayer;
}

- (void)setTopTransparentLayer:(id)a3
{
  objc_storeStrong((id *)&self->_topTransparentLayer, a3);
}

- (CAShapeLayer)bottomTransparentLayer
{
  return self->_bottomTransparentLayer;
}

- (void)setBottomTransparentLayer:(id)a3
{
  objc_storeStrong((id *)&self->_bottomTransparentLayer, a3);
}

- (CAShapeLayer)topSolidLayer
{
  return self->_topSolidLayer;
}

- (void)setTopSolidLayer:(id)a3
{
  objc_storeStrong((id *)&self->_topSolidLayer, a3);
}

- (CAShapeLayer)bottomSolidLayer
{
  return self->_bottomSolidLayer;
}

- (void)setBottomSolidLayer:(id)a3
{
  objc_storeStrong((id *)&self->_bottomSolidLayer, a3);
}

- (CAShapeLayer)topBorder
{
  return self->_topBorder;
}

- (void)setTopBorder:(id)a3
{
  objc_storeStrong((id *)&self->_topBorder, a3);
}

- (BOOL)initialAnimationPerformed
{
  return self->_initialAnimationPerformed;
}

- (void)setInitialAnimationPerformed:(BOOL)a3
{
  self->_initialAnimationPerformed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topBorder, 0);
  objc_storeStrong((id *)&self->_bottomSolidLayer, 0);
  objc_storeStrong((id *)&self->_topSolidLayer, 0);
  objc_storeStrong((id *)&self->_bottomTransparentLayer, 0);
  objc_storeStrong((id *)&self->_topTransparentLayer, 0);
  objc_storeStrong((id *)&self->_shapeLayer, 0);
  objc_storeStrong((id *)&self->_backgroundLayer, 0);
  objc_destroyWeak((id *)&self->_buttonDelegate);
}

@end
