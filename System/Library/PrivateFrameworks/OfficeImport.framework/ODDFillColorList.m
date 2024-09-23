@implementation ODDFillColorList

- (void)setHueDirection:(int)a3
{
  self->mHueDirection = a3;
}

- (void)setMethod:(int)a3
{
  self->mMethod = a3;
}

- (void)setColors:(id)a3
{
  objc_storeStrong((id *)&self->mColors, a3);
}

- (id)colorAtIndex:(unint64_t)a3 count:(unint64_t)a4 state:(id)a5
{
  id v8;
  int mMethod;
  uint64_t v10;
  void *v11;

  v8 = a5;
  if (-[NSArray count](self->mColors, "count"))
  {
    mMethod = self->mMethod;
    switch(mMethod)
    {
      case 0:
        -[ODDFillColorList cycleColorAtIndex:](self, "cycleColorAtIndex:", a3);
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_9;
      case 1:
        -[ODDFillColorList repeatColorAtIndex:](self, "repeatColorAtIndex:", a3);
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_9;
      case 2:
        -[ODDFillColorList spanColorAtIndex:count:state:](self, "spanColorAtIndex:count:state:", a3, a4, v8);
        v10 = objc_claimAutoreleasedReturnValue();
LABEL_9:
        v11 = (void *)v10;
        goto LABEL_10;
    }
  }
  v11 = 0;
LABEL_10:

  return v11;
}

- (id)repeatColorAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndex:](self->mColors, "objectAtIndex:", a3 % -[NSArray count](self->mColors, "count"));
}

- (id)spanColorAtIndex:(unint64_t)a3 count:(unint64_t)a4 state:(id)a5
{
  id v8;
  NSUInteger v9;
  float v10;
  unint64_t v11;
  float v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v19;
  float v20;
  float v21;
  uint64_t v22;

  v8 = a5;
  v9 = -[NSArray count](self->mColors, "count");
  if (a3 >= a4 || a4 < 2 || v9 == 1)
  {
    -[NSArray objectAtIndex:](self->mColors, "objectAtIndex:", 0);
    v13 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = (float)((float)a3 / (float)(a4 - 1)) * (float)(v9 - 1);
    v11 = vcvtms_u32_f32(v10);
    if (!TCFloatEqual(v10, (float)v11))
    {
      v22 = 0;
      v21 = 0.0;
      -[ODDFillColorList getComponentsForIndex:hue:saturation:brightness:state:](self, "getComponentsForIndex:hue:saturation:brightness:state:", v11, (char *)&v22 + 4, &v22, &v21, v8);
      v20 = 0.0;
      v19 = 0;
      -[ODDFillColorList getComponentsForIndex:hue:saturation:brightness:state:](self, "getComponentsForIndex:hue:saturation:brightness:state:", v11 + 1, &v20, (char *)&v19 + 4, &v19, v8);
      v12 = (float)v11;
      +[OITSUColor colorWithCalibratedHue:saturation:brightness:alpha:](OITSUColor, "colorWithCalibratedHue:saturation:brightness:alpha:", (float)((float)((float)(v10 - v12) * v20) + (float)(*((float *)&v22 + 1) * (float)(1.0 - (float)(v10 - v12)))), (float)((float)((float)(v10 - v12) * *((float *)&v19 + 1))+ (float)(*(float *)&v22 * (float)(1.0 - (float)(v10 - v12)))), (float)((float)((float)(v10 - v12) * *(float *)&v19) + (float)(v21 * (float)(1.0 - (float)(v10 - v12)))), 1.0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[OADRgbColor rgbColorWithTSUColor:](OADRgbColor, "rgbColorWithTSUColor:", v15);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray objectAtIndex:](self->mColors, "objectAtIndex:", v11);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "transforms");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setTransforms:", v17);

      goto LABEL_9;
    }
    -[NSArray objectAtIndex:](self->mColors, "objectAtIndex:", v11);
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v14 = (void *)v13;
LABEL_9:

  return v14;
}

- (id)cycleColorAtIndex:(unint64_t)a3
{
  NSUInteger v5;
  unint64_t v6;
  unint64_t v7;

  v5 = -[NSArray count](self->mColors, "count");
  if (v5 == 1)
  {
    v6 = 0;
  }
  else
  {
    v7 = a3 % (2 * v5 - 2);
    if (v7 >= v5)
      v6 = ~v7 + 2 * v5;
    else
      v6 = a3 % (2 * v5 - 2);
  }
  -[NSArray objectAtIndex:](self->mColors, "objectAtIndex:", v6);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mColors, 0);
}

- (void)getComponentsForIndex:(unint64_t)a3 hue:(float *)a4 saturation:(float *)a5 brightness:(float *)a6 state:(id)a7
{
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  id v23;

  v23 = a7;
  -[NSArray objectAtIndex:](self->mColors, "objectAtIndex:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "drawingTheme");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "colorMap");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "colorScheme");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "colorPalette");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[OADColor rgbColorWithColor:colorMap:colorScheme:colorPalette:](OADColor, "rgbColorWithColor:colorMap:colorScheme:colorPalette:", v12, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "red");
  v19 = v18;
  objc_msgSend(v17, "green");
  v21 = v20;
  objc_msgSend(v17, "blue");
  convertRgbToHsl(v19, v21, v22, a4, a5, a6);
  *a4 = *a4 / 360.0;

}

@end
