@implementation MFPGradientBrush

- (MFPGradientBrush)init
{
  MFPGradientBrush *result;
  __int128 v3;
  __int128 v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MFPGradientBrush;
  result = -[MFPGradientBrush init](&v5, sel_init);
  if (result)
  {
    v4 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
    v3 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
    *(_OWORD *)&result->mTransform.a = *MEMORY[0x24BDBD8B8];
    *(_OWORD *)&result->mTransform.c = v4;
    *(_OWORD *)&result->mTransform.tx = v3;
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  CGShadingRelease(self->mShading);
  CGFunctionRelease(self->mShadingFunction);
  v3.receiver = self;
  v3.super_class = (Class)MFPGradientBrush;
  -[MFPGradientBrush dealloc](&v3, sel_dealloc);
}

- (void)setTransform:(CGAffineTransform *)a3
{
  __int128 v3;
  __int128 v4;

  v4 = *(_OWORD *)&a3->c;
  v3 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->mTransform.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&self->mTransform.c = v4;
  *(_OWORD *)&self->mTransform.tx = v3;
}

- (void)setBlend:(id)a3
{
  objc_storeStrong((id *)&self->mBlend, a3);
}

- (void)setColorBlend:(id)a3
{
  objc_storeStrong((id *)&self->mColorBlend, a3);
}

- (void)setWrapMode:(int)a3
{
  self->mWrapMode = a3;
}

- (void)fillPath:(id)a3
{
  CGContext *v4;
  id v5;

  v5 = a3;
  v4 = TCCurrentGraphicsContext();
  CGContextSaveGState(v4);
  objc_msgSend(v5, "addClip");
  CGContextDrawShading(v4, self->mShading);
  CGContextRestoreGState(v4);

}

- (id)color
{
  double v2;

  LODWORD(v2) = 0;
  return -[MFPGradientBrush colorAtPosition:](self, "colorAtPosition:", v2);
}

- (void)createPhoneBrush
{
  if (self->mColorBlend)
  {
    -[MFPGradientBrush createStopsFromColorBlend](self, "createStopsFromColorBlend");
  }
  else if (self->mBlend)
  {
    -[MFPGradientBrush createStopsFromBlend](self, "createStopsFromBlend");
  }
  else
  {
    -[MFPGradientBrush createStopsFromStartAndEndColors](self, "createStopsFromStartAndEndColors");
  }
  -[MFPGradientBrush createShadingFunction](self, "createShadingFunction");
  -[MFPGradientBrush createShading](self, "createShading");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mStops, 0);
  objc_storeStrong((id *)&self->mColorBlend, 0);
  objc_storeStrong((id *)&self->mBlend, 0);
}

- (id)startColor
{
  return 0;
}

- (id)endColor
{
  return 0;
}

- (id)colorAtPosition:(float)a3
{
  NSArray *mStops;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  float v11;
  float v12;
  void *v13;
  uint64_t v14;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  void *v22;
  void *v23;

  if (a3 <= 0.0)
  {
    -[NSArray objectAtIndex:](self->mStops, "objectAtIndex:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "color");
    v14 = objc_claimAutoreleasedReturnValue();
LABEL_11:
    v13 = (void *)v14;
LABEL_12:

    return v13;
  }
  mStops = self->mStops;
  if (a3 >= 1.0)
  {
    -[NSArray lastObject](mStops, "lastObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "color");
    v14 = objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  v6 = -[NSArray count](mStops, "count");
  if (v6 != 1)
  {
    v7 = v6;
    v8 = 1;
    while (1)
    {
      -[NSArray objectAtIndex:](self->mStops, "objectAtIndex:", v8 - 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray objectAtIndex:](self->mStops, "objectAtIndex:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "position");
      if (v11 <= a3)
      {
        objc_msgSend(v10, "position");
        if (v12 >= a3)
          break;
      }

      if (v7 == ++v8)
        goto LABEL_8;
    }
    objc_msgSend(v10, "position");
    v17 = v16;
    objc_msgSend(v9, "position");
    v19 = v18;
    objc_msgSend(v9, "position");
    v21 = v20;
    objc_msgSend(v9, "color");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "color");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "blendedColorWithFraction:ofColor:", v23, (float)((float)(a3 - v21) / (float)(v17 - v19)));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_12;
  }
LABEL_8:
  v13 = 0;
  return v13;
}

- (void)createStopsFromColorBlend
{
  objc_storeStrong((id *)&self->mStops, self->mColorBlend);
}

- (void)createStopsFromBlend
{
  void *v3;
  NSUInteger v4;
  NSArray *v5;
  uint64_t i;
  void *v7;
  int v8;
  int v9;
  float v10;
  void *v11;
  MFPGradientStop *v12;
  double v13;
  MFPGradientStop *v14;
  NSArray *mStops;
  id v16;

  -[MFPGradientBrush startColor](self, "startColor");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  -[MFPGradientBrush endColor](self, "endColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[NSArray count](self->mBlend, "count");
  v5 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", v4);
  if (v4)
  {
    for (i = 0; i != v4; ++i)
    {
      -[NSArray objectAtIndex:](self->mBlend, "objectAtIndex:", i);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "position");
      v9 = v8;
      objc_msgSend(v7, "factor");
      objc_msgSend(v16, "blendedColorWithFraction:ofColor:", v3, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = [MFPGradientStop alloc];
      LODWORD(v13) = v9;
      v14 = -[MFPGradientStop initWithColor:position:](v12, "initWithColor:position:", v11, v13);
      -[NSArray addObject:](v5, "addObject:", v14);

    }
  }
  mStops = self->mStops;
  self->mStops = v5;

}

- (void)createStopsFromStartAndEndColors
{
  MFPGradientStop *v3;
  double v4;
  MFPGradientStop *v5;
  void *v6;
  MFPGradientStop *v7;
  double v8;
  MFPGradientStop *v9;
  NSArray *v10;
  NSArray *mStops;
  id v12;

  -[MFPGradientBrush startColor](self, "startColor");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v3 = [MFPGradientStop alloc];
  LODWORD(v4) = 0;
  v5 = -[MFPGradientStop initWithColor:position:](v3, "initWithColor:position:", v12, v4);
  -[MFPGradientBrush endColor](self, "endColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = [MFPGradientStop alloc];
  LODWORD(v8) = 1.0;
  v9 = -[MFPGradientStop initWithColor:position:](v7, "initWithColor:position:", v6, v8);
  v10 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithObjects:", v5, v9, 0);
  mStops = self->mStops;
  self->mStops = v10;

}

- (void)createShadingFunction
{
  CGFunctionCallbacks callbacks;
  CGFloat range[2];
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  CGFloat domain[3];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  *(_OWORD *)domain = xmmword_22A4C0C30;
  range[0] = 0.0;
  v4 = 0;
  v6 = 0;
  range[1] = 1.0;
  v5 = 0x3FF0000000000000;
  v7 = 0x3FF0000000000000;
  v8 = 0;
  v9 = 0x3FF0000000000000;
  callbacks.version = 0;
  callbacks.evaluate = (CGFunctionEvaluateCallback)evaluateGradient;
  callbacks.releaseInfo = 0;
  self->mShadingFunction = CGFunctionCreate(self, 1uLL, domain, 4uLL, range, &callbacks);
}

@end
