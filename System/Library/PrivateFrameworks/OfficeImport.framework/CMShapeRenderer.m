@implementation CMShapeRenderer

+ (void)renderCanonicalShape:(int)a3 fill:(id)a4 stroke:(id)a5 adjustValues:(id)a6 orientedBounds:(id)a7 state:(id)a8 drawingContext:(id)a9
{
  uint64_t v13;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  CMCanonicalShapeBuilder *v21;
  const CGPath *v22;
  CGAffineTransform v23;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v26;

  v13 = *(_QWORD *)&a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  v21 = objc_alloc_init(CMCanonicalShapeBuilder);
  -[CMShapeBuilder setOrientedBounds:](v21, "setOrientedBounds:", v18);
  -[CMShapeBuilder setShapeType:](v21, "setShapeType:", v13);
  -[CMShapeBuilder setAdjustValues:](v21, "setAdjustValues:", v17);
  -[CMShapeBuilder setFileFormat:](v21, "setFileFormat:", objc_msgSend(v19, "sourceFormat"));
  memset(&v26, 0, sizeof(v26));
  if (v21)
  {
    -[CMCanonicalShapeBuilder affineTransform](v21, "affineTransform");
    if (v20)
    {
LABEL_3:
      objc_msgSend(v20, "currentTransform");
      goto LABEL_6;
    }
  }
  else
  {
    memset(&t1, 0, sizeof(t1));
    if (v20)
      goto LABEL_3;
  }
  memset(&t2, 0, sizeof(t2));
LABEL_6:
  CGAffineTransformConcat(&v26, &t1, &t2);
  v23 = v26;
  v22 = -[CMCanonicalShapeBuilder copyShapeWithTransform:](v21, "copyShapeWithTransform:", &v23);
  if (v22)
  {
    objc_msgSend(a1, "_renderCGPath:stroke:fill:orientedBounds:state:drawingContext:", v22, v16, v15, v18, v19, v20);
    CGPathRelease(v22);
  }

}

+ (void)_renderCGPath:(CGPath *)a3 stroke:(id)a4 fill:(id)a5 orientedBounds:(id)a6 state:(id)a7 drawingContext:(id)a8
{
  id v13;
  id v14;
  id v15;
  CGImage *v16;
  id v17;

  v17 = a4;
  v13 = a5;
  v14 = a7;
  v15 = a8;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v16 = (CGImage *)objc_msgSend(a1, "copyImageFromOADImageFill:withContext:", v13, v15);
    if (v16)
    {
      objc_msgSend(v15, "setFillImage:", v16);
      CGImageRelease(v16);
    }
    objc_msgSend(a1, "_setupDrawingStyleInDrawingContext:fill:stroke:state:", v15, v13, v17, v14);
    objc_msgSend(v15, "addPath:", a3);
    objc_msgSend(v15, "setFillImage:", 0);
  }
  else
  {
    objc_msgSend(a1, "_setupDrawingStyleInDrawingContext:fill:stroke:state:", v15, v13, v17, v14);
    objc_msgSend(v15, "addPath:", a3);
  }

}

+ (void)_setupDrawingStyleInDrawingContext:(id)a3 fill:(id)a4 stroke:(id)a5 state:(id)a6
{
  id v10;
  id v11;
  CGColor *GenericRGBA;
  id v13;

  v13 = a3;
  v10 = a4;
  v11 = a6;
  objc_msgSend(a1, "_setupDrawingStyleInDrawingContext:stroke:state:", v13, a5, v11);
  if (!v10 || (GenericRGBA = (CGColor *)objc_msgSend(a1, "_copyCGColorFromOADFill:andState:", v10, v11)) == 0)
    GenericRGBA = CMShapeRendererCreateGenericRGBA(0.0, 0.0, 0.0, 0.0);
  objc_msgSend(v13, "setFillColor:", GenericRGBA);
  CGColorRelease(GenericRGBA);

}

+ (void)_setupDrawingStyleInDrawingContext:(id)a3 stroke:(id)a4 state:(id)a5
{
  id v8;
  id v9;
  void *v10;
  char isKindOfClass;
  void *v12;
  uint64_t v13;
  CGColor *GenericRGBA;
  CGColor *v15;
  void *v16;
  id v17;

  v17 = a3;
  v8 = a4;
  v9 = a5;
  if (v8)
  {
    if (objc_msgSend(v8, "isFillOverridden"))
    {
      objc_msgSend(v8, "fill");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        objc_msgSend(v8, "color");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v12)
        {
          objc_msgSend(v8, "fill");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v12)
            goto LABEL_10;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
LABEL_15:

            goto LABEL_16;
          }
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            objc_msgSend(v12, "color");
            v13 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
LABEL_10:
            v13 = 0;
          }

          v12 = (void *)v13;
        }
        v15 = (CGColor *)objc_msgSend(a1, "_copyCGColorFromOADColor:andState:", v12, v9);
        if (v15)
        {
          objc_msgSend(v17, "setStrokeColor:", v15);
          objc_msgSend(v17, "setFillColor:", v15);
          CGColorRelease(v15);
        }
        objc_msgSend(v8, "width");
        objc_msgSend(v17, "setLineWidth:");
        objc_msgSend(v8, "dash");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "_setupDrawingStyleInDrawingContext:dash:state:", v17, v16, v9);

        goto LABEL_15;
      }
    }
    GenericRGBA = CMShapeRendererCreateGenericRGBA(0.0, 0.0, 0.0, 0.0);
    objc_msgSend(v17, "setStrokeColor:", GenericRGBA);
    objc_msgSend(v17, "setFillColor:", GenericRGBA);
    CGColorRelease(GenericRGBA);
  }
LABEL_16:

}

+ (CGColor)_copyCGColorFromOADFill:(id)a3 andState:(id)a4
{
  id v5;
  id v6;
  CGColor *GenericRGBA;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  float v15;
  float v16;
  float v17;
  double v18;
  float v19;

  v5 = a3;
  v6 = a4;
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    +[CMColorProperty nsColorFromOADFill:state:](CMColorProperty, "nsColorFromOADFill:state:", v5, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "redComponent");
    v10 = v9;
    objc_msgSend(v8, "greenComponent");
    v12 = v11;
    objc_msgSend(v8, "blueComponent");
    v14 = v13;
    objc_msgSend(v8, "alphaComponent");
    v15 = v10;
    v16 = v12;
    v17 = v14;
    v19 = v18;
    GenericRGBA = CMShapeRendererCreateGenericRGBA(v15, v16, v17, v19);

  }
  else
  {
    GenericRGBA = CMShapeRendererCreateGenericRGBA(1.0, 1.0, 1.0, 0.0);
  }

  return GenericRGBA;
}

+ (CGColor)_copyCGColorFromOADColor:(id)a3 andState:(id)a4
{
  id v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  float v14;
  float v15;
  float v16;
  double v17;
  float v18;
  CGColor *GenericRGBA;

  v5 = a3;
  v6 = a4;
  if (v5)
  {
    +[CMColorProperty nsColorFromOADColor:state:](CMColorProperty, "nsColorFromOADColor:state:", v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "redComponent");
    v9 = v8;
    objc_msgSend(v7, "greenComponent");
    v11 = v10;
    objc_msgSend(v7, "blueComponent");
    v13 = v12;
    objc_msgSend(v7, "alphaComponent");
    v14 = v9;
    v15 = v11;
    v16 = v13;
    v18 = v17;
    GenericRGBA = CMShapeRendererCreateGenericRGBA(v14, v15, v16, v18);

  }
  else
  {
    GenericRGBA = CMShapeRendererCreateGenericRGBA(1.0, 1.0, 1.0, 1.0);
  }

  return GenericRGBA;
}

+ (void)_setupDrawingStyleInDrawingContext:(id)a3 dash:(id)a4 state:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;

  v27 = a3;
  v7 = a4;
  v8 = a5;
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (!objc_msgSend(v7, "type"))
      {
        objc_msgSend(v27, "setLineDash:", 0);
        goto LABEL_20;
      }
      objc_msgSend(v7, "equivalentCustomDash");
      v9 = objc_claimAutoreleasedReturnValue();

      v7 = (id)v9;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = (void *)objc_opt_new();
      v11 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v7, "dash");
      objc_msgSend(v11, "numberWithFloat:");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObject:", v12);

      v13 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v7, "space");
      objc_msgSend(v13, "numberWithFloat:");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObject:", v14);

      v15 = v10;
    }
    else
    {
      v15 = 0;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v7, "stops");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "count");
      if (v17 >= 3)
        v18 = 3;
      else
        v18 = v17;
      v19 = (void *)objc_opt_new();

      if (v18)
      {
        for (i = 0; i != v18; ++i)
        {
          v21 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(v16, "objectAtIndexedSubscript:", i);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "dash");
          objc_msgSend(v21, "numberWithFloat:");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "addObject:", v23);

          v24 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(v16, "objectAtIndexedSubscript:", i);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "space");
          objc_msgSend(v24, "numberWithFloat:");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "addObject:", v26);

        }
      }

      if (!v19)
        goto LABEL_19;
    }
    else
    {
      v19 = v15;
      if (!v15)
      {
LABEL_19:

        goto LABEL_20;
      }
    }
    objc_msgSend(v27, "setLineDash:", v19);
    goto LABEL_19;
  }
LABEL_20:

}

+ (void)renderLine:(int)a3 stroke:(id)a4 adjustValues:(id)a5 orientedBounds:(id)a6 state:(id)a7 drawingContext:(id)a8
{
  uint64_t v12;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  CMLineShapeBuilder *v19;
  const CGPath *v20;
  CGAffineTransform v21;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v24;

  v12 = *(_QWORD *)&a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v19 = objc_alloc_init(CMLineShapeBuilder);
  -[CMShapeBuilder setOrientedBounds:](v19, "setOrientedBounds:", v16);
  -[CMShapeBuilder setShapeType:](v19, "setShapeType:", v12);
  -[CMLineShapeBuilder setStroke:](v19, "setStroke:", v14);
  -[CMShapeBuilder setAdjustValues:](v19, "setAdjustValues:", v15);
  -[CMShapeBuilder setFileFormat:](v19, "setFileFormat:", objc_msgSend(v17, "sourceFormat"));
  memset(&v24, 0, sizeof(v24));
  if (v19)
  {
    -[CMShapeBuilder affineTransform](v19, "affineTransform");
    if (v18)
    {
LABEL_3:
      objc_msgSend(v18, "currentTransform");
      goto LABEL_6;
    }
  }
  else
  {
    memset(&t1, 0, sizeof(t1));
    if (v18)
      goto LABEL_3;
  }
  memset(&t2, 0, sizeof(t2));
LABEL_6:
  CGAffineTransformConcat(&v24, &t1, &t2);
  v21 = v24;
  v20 = -[CMLineShapeBuilder copyShapeWithTransform:](v19, "copyShapeWithTransform:", &v21);
  if (v20)
  {
    objc_msgSend(a1, "_renderCGPath:stroke:fill:orientedBounds:state:drawingContext:", v20, v14, 0, v16, v17, v18);
    CGPathRelease(v20);
  }

}

+ (void)renderFreeForm:(id)a3 fill:(id)a4 stroke:(id)a5 orientedBounds:(id)a6 state:(id)a7 drawingContext:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  int v20;
  int v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CMFreeFormShapeBuilder *v26;
  const CGPath *v27;
  id v29;
  id v30;
  CGAffineTransform v31;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v34;
  uint64_t v35;
  uint64_t v36;

  v13 = a3;
  v29 = a4;
  v30 = a5;
  v14 = a6;
  v15 = a7;
  v16 = a8;
  v17 = objc_msgSend(v13, "pathCount");
  if (v17)
  {
    for (i = 0; v17 != i; ++i)
    {
      objc_msgSend(v13, "pathAtIndex:", i);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        objc_msgSend(v13, "geometryCoordSpace");
        v20 = v36;
        v21 = HIDWORD(v36);
      }
      else
      {
        v21 = 0;
        v20 = 0;
        v35 = 0;
        v36 = 0;
      }
      objc_msgSend(v14, "bounds");
      v24 = v23;
      if (v23 == 0.0 || (v25 = v22, v22 == 0.0))
      {

        break;
      }
      v26 = objc_alloc_init(CMFreeFormShapeBuilder);
      -[CMShapeBuilder setOrientedBounds:](v26, "setOrientedBounds:", v14);
      -[CMFreeFormShapeBuilder setPath:](v26, "setPath:", v19);
      -[CMLineShapeBuilder setStroke:](v26, "setStroke:", v30);
      -[CMShapeBuilder setFileFormat:](v26, "setFileFormat:", objc_msgSend(v15, "sourceFormat"));
      -[CMFreeFormShapeBuilder setSpace:](v26, "setSpace:", (double)v20 / v24, (double)v21 / v25);
      memset(&v34, 0, sizeof(v34));
      if (v26)
      {
        -[CMFreeFormShapeBuilder affineTransform](v26, "affineTransform");
        if (!v16)
          goto LABEL_12;
      }
      else
      {
        memset(&t1, 0, sizeof(t1));
        if (!v16)
        {
LABEL_12:
          memset(&t2, 0, sizeof(t2));
          goto LABEL_13;
        }
      }
      objc_msgSend(v16, "currentTransform");
LABEL_13:
      CGAffineTransformConcat(&v34, &t1, &t2);
      v31 = v34;
      v27 = -[CMFreeFormShapeBuilder copyShapeWithTransform:](v26, "copyShapeWithTransform:", &v31);
      if (v27)
      {
        objc_msgSend(a1, "_renderCGPath:stroke:fill:orientedBounds:state:drawingContext:", v27, v30, v29, v14, v15, v16);
        CGPathRelease(v27);
      }

    }
  }

}

+ (void)renderDiagramPath:(id)a3 fill:(id)a4 stroke:(id)a5 state:(id)a6 drawingContext:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  CMFreeFormShapeBuilder *v17;
  const CGPath *v18;
  _OWORD v19[3];

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = objc_alloc_init(CMFreeFormShapeBuilder);
  -[CMFreeFormShapeBuilder setPath:](v17, "setPath:", v12);
  -[CMLineShapeBuilder setStroke:](v17, "setStroke:", v14);
  -[CMShapeBuilder setFileFormat:](v17, "setFileFormat:", objc_msgSend(v15, "sourceFormat"));
  -[CMFreeFormShapeBuilder setSpace:](v17, "setSpace:", 1.0, 1.0);
  if (v16)
    objc_msgSend(v16, "currentTransform");
  else
    memset(v19, 0, sizeof(v19));
  v18 = -[CMFreeFormShapeBuilder copyShapeWithTransform:](v17, "copyShapeWithTransform:", v19);
  if (v18)
  {
    objc_msgSend(a1, "_renderCGPath:stroke:fill:orientedBounds:state:drawingContext:", v18, v14, v13, 0, v15, v16);
    CGPathRelease(v18);
  }

}

+ (CGImage)copyImageFromOADImageFill:(id)a3 withMapper:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  CGImageSource *v12;
  CGImageSource *v13;
  CGImage *ImageAtIndex;
  uint64_t v15;

  v5 = a3;
  v6 = a4;
  if (!objc_msgSend(v5, "isBlipRefOverridden"))
  {
    v8 = 0;
    goto LABEL_9;
  }
  objc_msgSend(v5, "blipRef");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "blip");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {

LABEL_4:
    objc_msgSend(v8, "mainSubBlip");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "load");

    if ((v10 & 1) != 0)
    {
      objc_msgSend(v8, "mainSubBlip");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "data");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        v12 = CGImageSourceCreateWithData((CFDataRef)v7, 0);
        v13 = v12;
        if (v12)
        {
          ImageAtIndex = CGImageSourceCreateImageAtIndex(v12, 0, 0);
          CFRelease(v13);
LABEL_15:

          goto LABEL_16;
        }
      }
LABEL_14:
      ImageAtIndex = 0;
      goto LABEL_15;
    }
    goto LABEL_9;
  }
  v15 = objc_msgSend(v7, "index");
  if ((int)v15 < 1)
  {
    v8 = 0;
    goto LABEL_14;
  }
  objc_msgSend(v6, "blipAtIndex:", v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    goto LABEL_4;
LABEL_9:
  ImageAtIndex = 0;
LABEL_16:

  return ImageAtIndex;
}

+ (CGImage)copyImageFromOADImageFill:(id)a3 withContext:(id)a4
{
  id v6;
  void *v7;
  CGImage *v8;

  v6 = a3;
  objc_msgSend(a4, "mapper");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (CGImage *)objc_msgSend(a1, "copyImageFromOADImageFill:withMapper:", v6, v7);

  return v8;
}

@end
