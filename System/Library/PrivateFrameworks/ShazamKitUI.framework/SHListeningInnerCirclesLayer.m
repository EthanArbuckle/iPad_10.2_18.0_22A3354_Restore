@implementation SHListeningInnerCirclesLayer

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
  -[SHListeningInnerCirclesLayer buildInnerCircleLayers](self, "buildInnerCircleLayers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHListeningInnerCirclesLayer setInnerCircleLayers:](self, "setInnerCircleLayers:", v3);

  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[SHListeningInnerCirclesLayer innerCircleLayers](self, "innerCircleLayers", 0);
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
        -[SHListeningInnerCirclesLayer addSublayer:](self, "addSublayer:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (id)buildInnerCircleLayers
{
  void *v3;
  uint64_t i;
  SHListeningInnerCircleLayer *v5;
  void *v6;
  SHListeningInnerCircleLayer *v7;
  void *v8;

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i != 4; ++i)
  {
    v5 = [SHListeningInnerCircleLayer alloc];
    -[SHPaletteLayer palette](self, "palette");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[SHPaletteLayer initWithPalette:](v5, "initWithPalette:", v6);

    objc_msgSend(&unk_24F13B408, "objectAtIndex:", i);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "floatValue");
    -[SHListeningInnerCircleLayer setOpacity:](v7, "setOpacity:");

    objc_msgSend(v3, "addObject:", v7);
  }
  return v3;
}

- (void)layoutSublayers
{
  double MidX;
  double MidY;
  double Width;
  double Height;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  float v11;
  double v12;
  objc_super v13;
  CGRect v14;
  CGRect v15;
  CGRect v16;
  CGRect v17;

  v13.receiver = self;
  v13.super_class = (Class)SHListeningInnerCirclesLayer;
  -[SHListeningInnerCirclesLayer layoutSublayers](&v13, sel_layoutSublayers);
  -[SHListeningInnerCirclesLayer bounds](self, "bounds");
  MidX = CGRectGetMidX(v14);
  -[SHListeningInnerCirclesLayer bounds](self, "bounds");
  MidY = CGRectGetMidY(v15);
  -[SHListeningInnerCirclesLayer bounds](self, "bounds");
  Width = CGRectGetWidth(v16);
  -[SHListeningInnerCirclesLayer bounds](self, "bounds");
  Height = CGRectGetHeight(v17);
  for (i = 0; i != 4; ++i)
  {
    -[SHListeningInnerCirclesLayer innerCircleLayers](self, "innerCircleLayers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndex:", i);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(&unk_24F13B420, "objectAtIndex:", i);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "floatValue");
    v12 = v11;

    objc_msgSend(v9, "setBounds:", 0.0, 0.0, Width * v12, Height * v12);
    objc_msgSend(v9, "setPosition:", MidX, MidY);
    objc_msgSend(v9, "setNeedsLayout");
    objc_msgSend(v9, "layoutIfNeeded");

  }
}

- (void)startListeningAnimation
{
  uint64_t i;
  void *v4;
  void *v5;
  void *v6;
  float v7;
  double v8;

  for (i = 0; i != 4; ++i)
  {
    -[SHListeningInnerCirclesLayer innerCircleLayers](self, "innerCircleLayers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectAtIndex:", i);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(&unk_24F13B438, "objectAtIndex:", i);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "floatValue");
    v8 = v7;

    -[SHListeningInnerCirclesLayer addCoreAnimationToInnerCircleLayer:withStartOffset:](self, "addCoreAnimationToInnerCircleLayer:withStartOffset:", v5, v8);
    -[SHListeningInnerCirclesLayer addScaleNullAnimationToInnerCircleLayer:](self, "addScaleNullAnimationToInnerCircleLayer:", v5);

  }
}

- (void)addCoreAnimationToInnerCircleLayer:(id)a3 withStartOffset:(double)a4
{
  id v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  id v12;

  v6 = a3;
  -[SHListeningInnerCirclesLayer innerCircleCoreAnimation](self, "innerCircleCoreAnimation");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "duration");
  +[SHListeningViewHelperMethods animationFromAnimation:withStartOffset:duration:](SHListeningViewHelperMethods, "animationFromAnimation:withStartOffset:duration:", v12, v7 * a4, 2.32916653);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[SHListeningViewHelperMethods animationFromAnimation:withStartOffset:duration:](SHListeningViewHelperMethods, "animationFromAnimation:withStartOffset:duration:", v8, 0.209624996, 1.90991654);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setRemovedOnCompletion:", 0);
  LODWORD(v10) = 2139095040;
  objc_msgSend(v9, "setRepeatCount:", v10);
  objc_msgSend(v6, "circleContainerLayer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "addAnimation:forKey:", v9, CFSTR("SHListeningInnerCircleCoreAnimationGroupKey"));
}

- (void)addScaleNullAnimationToInnerCircleLayer:(id)a3
{
  id v4;
  void *v5;
  double v6;
  id v7;

  v4 = a3;
  -[SHListeningInnerCirclesLayer innerCircleScaleNullAnimation](self, "innerCircleScaleNullAnimation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SHListeningViewHelperMethods animationFromAnimation:withStartOffset:duration:](SHListeningViewHelperMethods, "animationFromAnimation:withStartOffset:duration:", v5, 0.209624996, 1.90991654);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setRemovedOnCompletion:", 0);
  LODWORD(v6) = 2139095040;
  objc_msgSend(v7, "setRepeatCount:", v6);
  objc_msgSend(v4, "addAnimation:forKey:", v7, CFSTR("SHListeningInnerCircleScaleNullAnimationKey"));

}

- (id)innerCircleScaleNullAnimation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDE56C0], "animationWithKeyPath:", CFSTR("transform.scale"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValues:", &unk_24F13B450);
  objc_msgSend(v3, "setKeyTimes:", &unk_24F13B468);
  objc_msgSend(v3, "setDuration:", 2.32916653);
  -[SHListeningInnerCirclesLayer linearTimingFunction](self, "linearTimingFunction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  -[SHListeningInnerCirclesLayer inOutSineTimingFunction](self, "inOutSineTimingFunction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTimingFunctions:", v6);

  return v3;
}

- (id)innerCircleCoreAnimation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[3];
  _QWORD v19[2];
  _QWORD v20[2];
  _QWORD v21[3];

  v21[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDE56C0], "animationWithKeyPath:", CFSTR("transform.scale"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValues:", &unk_24F13B480);
  objc_msgSend(v3, "setKeyTimes:", &unk_24F13B498);
  -[SHListeningInnerCirclesLayer inOutSineTimingFunction](self, "inOutSineTimingFunction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v4;
  -[SHListeningInnerCirclesLayer linearTimingFunction](self, "linearTimingFunction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTimingFunctions:", v6);

  objc_msgSend(v3, "setDuration:", 2.92499983);
  objc_msgSend(MEMORY[0x24BDE56C0], "animationWithKeyPath:", CFSTR("opacity"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setValues:", &unk_24F13B4B0);
  objc_msgSend(v7, "setKeyTimes:", &unk_24F13B4C8);
  -[SHListeningInnerCirclesLayer inOutSineTimingFunction](self, "inOutSineTimingFunction");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v8;
  -[SHListeningInnerCirclesLayer inOutSineTimingFunction](self, "inOutSineTimingFunction");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTimingFunctions:", v10);

  objc_msgSend(v7, "setDuration:", 2.92499983);
  objc_msgSend(MEMORY[0x24BDE56C0], "animationWithKeyPath:", CFSTR("sublayerTransform.scale"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setValues:", &unk_24F13B4E0);
  objc_msgSend(v11, "setKeyTimes:", &unk_24F13B4F8);
  -[SHListeningInnerCirclesLayer inOutSineTimingFunction](self, "inOutSineTimingFunction");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v12;
  -[SHListeningInnerCirclesLayer inOutSineTimingFunction](self, "inOutSineTimingFunction");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v13;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTimingFunctions:", v14);

  objc_msgSend(v11, "setDuration:", 2.92499983);
  objc_msgSend(MEMORY[0x24BDE5638], "animation");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v3;
  v18[1] = v7;
  v18[2] = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setAnimations:", v16);

  objc_msgSend(v15, "setDuration:", 2.92499983);
  objc_msgSend(v15, "setFillMode:", *MEMORY[0x24BDE5978]);

  return v15;
}

- (CAMediaTimingFunction)inOutSineTimingFunction
{
  return (CAMediaTimingFunction *)+[SHListeningMediaTimingFunctionProvider inOutSineMediaTimingFunction](SHListeningMediaTimingFunctionProvider, "inOutSineMediaTimingFunction");
}

- (CAMediaTimingFunction)linearTimingFunction
{
  return (CAMediaTimingFunction *)objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", *MEMORY[0x24BDE5D30]);
}

- (NSArray)innerCircleLayers
{
  return self->_innerCircleLayers;
}

- (void)setInnerCircleLayers:(id)a3
{
  objc_storeStrong((id *)&self->_innerCircleLayers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_innerCircleLayers, 0);
}

@end
