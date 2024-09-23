@implementation TCMPSRandomCropAugmenter

- (TCMPSRandomCropAugmenter)init
{
  TCMPSRandomCropAugmenter *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TCMPSRandomCropAugmenter;
  result = -[TCMPSRandomCropAugmenter init](&v3, sel_init);
  if (result)
  {
    *(_OWORD *)&result->_skipProbability = xmmword_2186F3480;
    *(_OWORD *)&result->_maxAspectRatio = xmmword_2186F3490;
    *(_OWORD *)&result->_maxAreaFraction = xmmword_2186F34A0;
    result->_maxAttempts = 50;
    result->_minEjectCoverage = 0.5;
  }
  return result;
}

- (id)imageAugmentedFromImage:(id)a3 generator:(id)a4
{
  id v6;
  double (**v7)(double, double);
  double v8;
  double v9;
  double Height;
  double Width;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  id v32;
  void *v34;
  CGRect v35;
  CGRect v36;

  v6 = a3;
  v7 = (double (**)(double, double))a4;
  v8 = v7[2](0.0, 1.0);
  -[TCMPSRandomCropAugmenter skipProbability](self, "skipProbability");
  if (v8 >= v9
    && (objc_msgSend(v6, "bounds"),
        Height = CGRectGetHeight(v35),
        objc_msgSend(v6, "bounds"),
        Width = CGRectGetWidth(v36),
        -[TCMPSRandomCropAugmenter maxAttempts](self, "maxAttempts")))
  {
    v12 = 0;
    v13 = Height * Width;
    while (1)
    {
      -[TCMPSRandomCropAugmenter minAspectRatio](self, "minAspectRatio");
      v15 = v14;
      -[TCMPSRandomCropAugmenter maxAspectRatio](self, "maxAspectRatio");
      v17 = ((double (*)(double (**)(double, double), double, double))v7[2])(v7, v15, v16);
      v18 = Height <= Width / v17 ? Height : Width / v17;
      -[TCMPSRandomCropAugmenter maxAreaFraction](self, "maxAreaFraction");
      *(float *)&v19 = v13 * v19 / v17;
      v20 = sqrtf(*(float *)&v19);
      if (v18 > v20)
        v18 = v20;
      -[TCMPSRandomCropAugmenter minAreaFraction](self, "minAreaFraction");
      *(float *)&v21 = v13 * v21 / v17;
      if (v18 >= sqrtf(*(float *)&v21))
      {
        v22 = ((double (*)(double (**)(double, double)))v7[2])(v7);
        v23 = v17 * v22;
        v24 = ((double (*)(double (**)(double, double), double, double))v7[2])(v7, 0.0, Width - v23);
        v25 = ((double (*)(double (**)(double, double), double, double))v7[2])(v7, 0.0, Height - v22);
        objc_msgSend(v6, "bounds");
        v27 = v24 + v26;
        objc_msgSend(v6, "bounds");
        v29 = v25 + v28;
        objc_msgSend(v6, "annotations");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[TCMPSRandomCropAugmenter applyCrop:toAnnotations:](self, "applyCrop:toAnnotations:", v30, v27, v29, v23, v22);
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        if (v31)
          break;
      }
      if (++v12 >= -[TCMPSRandomCropAugmenter maxAttempts](self, "maxAttempts"))
        goto LABEL_12;
    }
    v32 = (id)objc_opt_new();
    objc_msgSend(v6, "image");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setImage:", v34);

    objc_msgSend(v32, "setBounds:", v27, v29, v23, v22);
    objc_msgSend(v32, "setAnnotations:", v31);

  }
  else
  {
LABEL_12:
    v32 = v6;
  }

  return v32;
}

- (id)applyCrop:(CGRect)a3 toAnnotations:(id)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  double x;
  double y;
  double width;
  double height;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  id v30;
  double v33;
  CGFloat v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;

  v40 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v36;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v36 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        objc_msgSend(v12, "boundingBox");
        v45.origin.x = v13;
        v34 = v13;
        v15 = v14;
        v17 = v16;
        v19 = v18;
        v45.origin.y = v14;
        v45.size.width = v16;
        v45.size.height = v18;
        v41 = CGRectIntersection(a3, v45);
        x = v41.origin.x;
        y = v41.origin.y;
        width = v41.size.width;
        height = v41.size.height;
        v24 = CGRectGetHeight(v41);
        v42.origin.x = x;
        v42.origin.y = y;
        v42.size.width = width;
        v42.size.height = height;
        v33 = v24 * CGRectGetWidth(v42);
        v43.origin.x = v34;
        v43.origin.y = v15;
        v43.size.width = v17;
        v43.size.height = v19;
        v25 = CGRectGetHeight(v43);
        v44.origin.x = v34;
        v44.origin.y = v15;
        v44.size.width = v17;
        v44.size.height = v19;
        v26 = v33 / (v25 * CGRectGetWidth(v44));
        -[TCMPSRandomCropAugmenter minObjectCovered](self, "minObjectCovered");
        if (v26 < v27)
        {

          v30 = 0;
          goto LABEL_13;
        }
        -[TCMPSRandomCropAugmenter minEjectCoverage](self, "minEjectCoverage");
        if (v26 >= v28)
        {
          v29 = (void *)objc_msgSend(v12, "copy");
          objc_msgSend(v29, "setBoundingBox:", x, y, width, height);
          objc_msgSend(v6, "addObject:", v29);

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
      if (v9)
        continue;
      break;
    }
  }

  v30 = v6;
LABEL_13:

  return v30;
}

- (double)skipProbability
{
  return self->_skipProbability;
}

- (void)setSkipProbability:(double)a3
{
  self->_skipProbability = a3;
}

- (double)minAspectRatio
{
  return self->_minAspectRatio;
}

- (void)setMinAspectRatio:(double)a3
{
  self->_minAspectRatio = a3;
}

- (double)maxAspectRatio
{
  return self->_maxAspectRatio;
}

- (void)setMaxAspectRatio:(double)a3
{
  self->_maxAspectRatio = a3;
}

- (double)minAreaFraction
{
  return self->_minAreaFraction;
}

- (void)setMinAreaFraction:(double)a3
{
  self->_minAreaFraction = a3;
}

- (double)maxAreaFraction
{
  return self->_maxAreaFraction;
}

- (void)setMaxAreaFraction:(double)a3
{
  self->_maxAreaFraction = a3;
}

- (double)minObjectCovered
{
  return self->_minObjectCovered;
}

- (void)setMinObjectCovered:(double)a3
{
  self->_minObjectCovered = a3;
}

- (unint64_t)maxAttempts
{
  return self->_maxAttempts;
}

- (void)setMaxAttempts:(unint64_t)a3
{
  self->_maxAttempts = a3;
}

- (double)minEjectCoverage
{
  return self->_minEjectCoverage;
}

- (void)setMinEjectCoverage:(double)a3
{
  self->_minEjectCoverage = a3;
}

@end
