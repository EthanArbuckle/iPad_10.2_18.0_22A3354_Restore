@implementation SHListeningOuterCirclesLayer

- (void)setup
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  -[SHListeningOuterCirclesLayer buildOuterCircleLayers](self, "buildOuterCircleLayers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHListeningOuterCirclesLayer setOuterCircleLayers:](self, "setOuterCircleLayers:", v3);

  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[SHListeningOuterCirclesLayer outerCircleLayers](self, "outerCircleLayers", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
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
        -[SHListeningOuterCirclesLayer addSublayer:](self, "addSublayer:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (id)buildOuterCircleLayers
{
  void *v3;
  uint64_t v4;
  char v5;
  char v6;
  SHListeningOuterCircleLayer *v7;
  void *v8;
  SHListeningOuterCircleLayer *v9;
  void *v10;

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 0;
  v5 = 1;
  do
  {
    v6 = v5;
    v7 = [SHListeningOuterCircleLayer alloc];
    -[SHPaletteLayer palette](self, "palette");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[SHPaletteLayer initWithPalette:](v7, "initWithPalette:", v8);

    objc_msgSend(&unk_24F13B510, "objectAtIndex:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "floatValue");
    -[SHListeningOuterCircleLayer setOpacity:](v9, "setOpacity:");

    objc_msgSend(v3, "addObject:", v9);
    v5 = 0;
    v4 = 1;
  }
  while ((v6 & 1) != 0);
  return v3;
}

- (void)layoutSublayers
{
  double MidX;
  double MidY;
  double Width;
  double Height;
  uint64_t v7;
  char v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  float v13;
  double v14;
  objc_super v15;
  CGRect v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;

  v15.receiver = self;
  v15.super_class = (Class)SHListeningOuterCirclesLayer;
  -[SHListeningOuterCirclesLayer layoutSublayers](&v15, sel_layoutSublayers);
  -[SHListeningOuterCirclesLayer bounds](self, "bounds");
  MidX = CGRectGetMidX(v16);
  -[SHListeningOuterCirclesLayer bounds](self, "bounds");
  MidY = CGRectGetMidY(v17);
  -[SHListeningOuterCirclesLayer bounds](self, "bounds");
  Width = CGRectGetWidth(v18);
  -[SHListeningOuterCirclesLayer bounds](self, "bounds");
  Height = CGRectGetHeight(v19);
  v7 = 0;
  v8 = 1;
  do
  {
    v9 = v8;
    -[SHListeningOuterCirclesLayer outerCircleLayers](self, "outerCircleLayers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndex:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(&unk_24F13B528, "objectAtIndex:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "floatValue");
    v14 = v13;

    objc_msgSend(v11, "setBounds:", 0.0, 0.0, Width * v14, Height * v14);
    objc_msgSend(v11, "setPosition:", MidX, MidY);
    objc_msgSend(v11, "setNeedsDisplay");
    objc_msgSend(v11, "layoutIfNeeded");

    v8 = 0;
    v7 = 1;
  }
  while ((v9 & 1) != 0);
}

- (void)startListeningAnimation
{
  void *v3;
  void *v4;
  void *v5;
  float v6;
  double v7;
  void *v8;
  void *v9;
  float v10;
  double v11;
  id v12;

  -[SHListeningOuterCirclesLayer outerCircleLayers](self, "outerCircleLayers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndex:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(&unk_24F13B540, "objectAtIndex:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "floatValue");
  v7 = v6;

  -[SHListeningOuterCirclesLayer addCoreAnimationToOuterCircleLayer:withStartOffset:](self, "addCoreAnimationToOuterCircleLayer:withStartOffset:", v4, v7);
  -[SHListeningOuterCirclesLayer addScaleAnimationToCircleLayer:](self, "addScaleAnimationToCircleLayer:", v4);

  -[SHListeningOuterCirclesLayer outerCircleLayers](self, "outerCircleLayers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndex:", 1);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(&unk_24F13B540, "objectAtIndex:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "floatValue");
  v11 = v10;

  -[SHListeningOuterCirclesLayer addCoreAnimationToOuterCircleLayer:withStartOffset:](self, "addCoreAnimationToOuterCircleLayer:withStartOffset:", v12, v11);
  -[SHListeningOuterCirclesLayer addScaleAnimationToCircleLayer:](self, "addScaleAnimationToCircleLayer:", v12);

}

- (void)addScaleAnimationToCircleLayer:(id)a3
{
  id v4;
  double v5;
  id v6;

  v4 = a3;
  -[SHListeningOuterCirclesLayer scaleNullAnimation](self, "scaleNullAnimation");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = 2139095040;
  objc_msgSend(v6, "setRepeatCount:", v5);
  objc_msgSend(v6, "setRemovedOnCompletion:", 0);
  objc_msgSend(v4, "addAnimation:forKey:", v6, CFSTR("SHListeningOuterCircleScaleNullAnimationKey"));

}

- (void)addCoreAnimationToOuterCircleLayer:(id)a3 withStartOffset:(double)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[3];

  v23[2] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[SHListeningOuterCirclesLayer outerCircleCoreSizeAnimation](self, "outerCircleCoreSizeAnimation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHListeningOuterCirclesLayer outerCircleCoreBorderWidthAnimation](self, "outerCircleCoreBorderWidthAnimation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHListeningOuterCirclesLayer outerCircleCoreScaleAnimation](self, "outerCircleCoreScaleAnimation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDE5638], "animation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v7;
  v23[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAnimations:", v11);

  objc_msgSend(v10, "setDuration:", 1.50000004);
  v12 = *MEMORY[0x24BDE5970];
  objc_msgSend(v10, "setFillMode:", *MEMORY[0x24BDE5970]);
  objc_msgSend(MEMORY[0x24BDE5638], "animation");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v22, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAnimations:", v14);

  objc_msgSend(v13, "setDuration:", 1.50000004);
  objc_msgSend(v13, "setFillMode:", v12);
  v15 = a4 * 1.50000004;
  +[SHListeningViewHelperMethods animationFromAnimation:withStartOffset:duration:](SHListeningViewHelperMethods, "animationFromAnimation:withStartOffset:duration:", v10, v15, 1.58333337);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[SHListeningViewHelperMethods animationFromAnimation:withStartOffset:duration:](SHListeningViewHelperMethods, "animationFromAnimation:withStartOffset:duration:", v13, v15, 1.58333337);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v18) = 2139095040;
  objc_msgSend(v16, "setRepeatCount:", v18);
  objc_msgSend(v16, "setRemovedOnCompletion:", 0);
  LODWORD(v19) = 2139095040;
  objc_msgSend(v17, "setRepeatCount:", v19);
  objc_msgSend(v17, "setRemovedOnCompletion:", 0);
  objc_msgSend(v6, "circleLayer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addAnimation:forKey:", v16, CFSTR("SHListeningOuterCircleCoreAnimationGroup1Key"));

  objc_msgSend(v6, "circleContainerLayer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "addAnimation:forKey:", v17, CFSTR("SHListeningOuterCircleCoreAnimationGroup2Key"));
}

- (id)scaleNullAnimation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDE56C0], "animationWithKeyPath:", CFSTR("transform.scale"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValues:", &unk_24F13B558);
  objc_msgSend(v3, "setKeyTimes:", &unk_24F13B570);
  -[SHListeningOuterCirclesLayer linearTimingFunction](self, "linearTimingFunction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  -[SHListeningOuterCirclesLayer inOutSineTimingFunction](self, "inOutSineTimingFunction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTimingFunctions:", v6);

  objc_msgSend(v3, "setDuration:", 1.58333337);
  objc_msgSend(v3, "setFillMode:", *MEMORY[0x24BDE5978]);
  return v3;
}

- (id)outerCircleCoreSizeAnimation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDE56C0], "animationWithKeyPath:", CFSTR("transform.scale"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValues:", &unk_24F13B588);
  objc_msgSend(v3, "setKeyTimes:", &unk_24F13B5A0);
  -[SHListeningOuterCirclesLayer inOutSineTimingFunction](self, "inOutSineTimingFunction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  -[SHListeningOuterCirclesLayer linearTimingFunction](self, "linearTimingFunction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTimingFunctions:", v6);

  objc_msgSend(v3, "setDuration:", 1.50000004);
  objc_msgSend(v3, "setFillMode:", *MEMORY[0x24BDE5978]);
  return v3;
}

- (id)outerCircleCoreBorderWidthAnimation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];

  v9[3] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDE56C0], "animationWithKeyPath:", CFSTR("borderWidth"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValues:", &unk_24F13B5B8);
  objc_msgSend(v3, "setKeyTimes:", &unk_24F13B5D0);
  -[SHListeningOuterCirclesLayer inOutQuartTimingFunction](self, "inOutQuartTimingFunction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHListeningOuterCirclesLayer linearTimingFunction](self, "linearTimingFunction", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v5;
  -[SHListeningOuterCirclesLayer inOutQuartTimingFunction](self, "inOutQuartTimingFunction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTimingFunctions:", v7);

  objc_msgSend(v3, "setDuration:", 1.50000004);
  objc_msgSend(v3, "setFillMode:", *MEMORY[0x24BDE5978]);
  return v3;
}

- (id)outerCircleCoreScaleAnimation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDE56C0], "animationWithKeyPath:", CFSTR("transform.scale"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValues:", &unk_24F13B5E8);
  objc_msgSend(v3, "setKeyTimes:", &unk_24F13B600);
  -[SHListeningOuterCirclesLayer inOutSineTimingFunction](self, "inOutSineTimingFunction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  -[SHListeningOuterCirclesLayer linearTimingFunction](self, "linearTimingFunction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTimingFunctions:", v6);

  objc_msgSend(v3, "setDuration:", 1.50000004);
  objc_msgSend(v3, "setFillMode:", *MEMORY[0x24BDE5978]);
  return v3;
}

- (CAMediaTimingFunction)inOutSineTimingFunction
{
  return (CAMediaTimingFunction *)+[SHListeningMediaTimingFunctionProvider inOutSineMediaTimingFunction](SHListeningMediaTimingFunctionProvider, "inOutSineMediaTimingFunction");
}

- (CAMediaTimingFunction)inOutQuartTimingFunction
{
  return (CAMediaTimingFunction *)+[SHListeningMediaTimingFunctionProvider inOutQuartMediaTimingFunction](SHListeningMediaTimingFunctionProvider, "inOutQuartMediaTimingFunction");
}

- (CAMediaTimingFunction)linearTimingFunction
{
  return (CAMediaTimingFunction *)objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", *MEMORY[0x24BDE5D30]);
}

- (NSArray)outerCircleLayers
{
  return self->_outerCircleLayers;
}

- (void)setOuterCircleLayers:(id)a3
{
  objc_storeStrong((id *)&self->_outerCircleLayers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outerCircleLayers, 0);
}

@end
