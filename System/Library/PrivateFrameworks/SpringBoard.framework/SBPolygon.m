@implementation SBPolygon

- (SBPolygon)initWithPoints:(CGPoint *)a3 pointCount:(unint64_t)a4
{
  unint64_t v4;
  void *v7;
  CGFloat *p_y;
  void *v9;
  SBPolygon *v10;
  void *v13;

  v4 = a4;
  if (a4 >= 6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBPolygon.m"), 20, CFSTR("The max number of points allowed is %d"), 5);

  }
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v4);
  if (v4)
  {
    p_y = &a3->y;
    do
    {
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", *(p_y - 1), *p_y);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v9);

      p_y += 2;
      --v4;
    }
    while (v4);
  }
  v10 = -[SBPolygon initWithPoints:](self, "initWithPoints:", v7);

  return v10;
}

- (SBPolygon)initWithPoints:(id)a3
{
  id v4;
  SBPolygon *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SBPolygon;
  v5 = -[SBPolygon init](&v8, sel_init);
  if (v5)
  {
    +[SBPolygon _sortPoints:](SBPolygon, "_sortPoints:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBPolygon _setPoints:](v5, "_setPoints:", v6);
    -[SBPolygon _updateProperties](v5, "_updateProperties");

  }
  return v5;
}

- (id)description
{
  void *v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SBPolygon pointCount](self, "pointCount"))
  {
    v4 = 0;
    do
    {
      -[SBPolygon _pointAtIndex:](self, "_pointAtIndex:", v4);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%f, %f)"), v5, v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v7);

      ++v4;
    }
    while (-[SBPolygon pointCount](self, "pointCount") > v4);
  }
  v8 = (void *)MEMORY[0x1E0CB3940];
  v9 = objc_opt_class();
  -[SBPolygon _isLeftHanded](self, "_isLeftHanded");
  NSStringFromBOOL();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("<%@:%p points=%@ leftHanded=%@ thumbIndex: %lu>"), v9, self, v3, v10, -[SBPolygon _thumbIndex](self, "_thumbIndex"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (unint64_t)pointCount
{
  void *v2;
  unint64_t v3;

  -[SBPolygon points](self, "points");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (double)distanceOfFarthestPointFromCentroid
{
  uint64_t v3;
  uint64_t v4;
  double v5;
  _QWORD v7[7];
  uint64_t v8;
  double *v9;
  uint64_t v10;
  uint64_t v11;

  v8 = 0;
  v9 = (double *)&v8;
  v10 = 0x2020000000;
  v11 = 0;
  -[SBPolygon _centroid](self, "_centroid");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__SBPolygon_distanceOfFarthestPointFromCentroid__block_invoke;
  v7[3] = &unk_1E8EAE618;
  v7[5] = v3;
  v7[6] = v4;
  v7[4] = &v8;
  -[SBPolygon enumeratePointsUsingBlock:](self, "enumeratePointsUsingBlock:", v7);
  v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __48__SBPolygon_distanceOfFarthestPointFromCentroid__block_invoke(uint64_t a1)
{
  uint64_t result;
  double v3;
  uint64_t v4;

  result = UIDistanceBetweenPoints();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (v3 > *(double *)(v4 + 24))
    *(double *)(v4 + 24) = v3;
  return result;
}

- (void)enumeratePointsUsingBlock:(id)a3
{
  void (**v4)(id, uint64_t, _BYTE *);
  unint64_t v5;
  char v6;

  v4 = (void (**)(id, uint64_t, _BYTE *))a3;
  v6 = 0;
  if (-[SBPolygon pointCount](self, "pointCount"))
  {
    v5 = 1;
    do
    {
      if (v4)
      {
        -[SBPolygon _pointAtIndex:](self, "_pointAtIndex:", v5 - 1);
        v4[2](v4, v5 - 1, &v6);
      }
      if (v5 >= -[SBPolygon pointCount](self, "pointCount"))
        break;
      ++v5;
    }
    while (!v6);
  }

}

- (BOOL)isEqual:(id)a3
{
  SBPolygon *v4;
  SBPolygon *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (SBPolygon *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[SBPolygon points](self, "points");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBPolygon points](v5, "points");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = objc_msgSend(v6, "isEqualToArray:", v7);
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (double)_perimeter
{
  double v3;
  unint64_t v4;
  double v5;

  v3 = 0.0;
  if (-[SBPolygon pointCount](self, "pointCount") >= 2 && -[SBPolygon pointCount](self, "pointCount") != 1)
  {
    v4 = 0;
    do
    {
      -[SBPolygon _pointAtIndex:](self, "_pointAtIndex:", v4++);
      -[SBPolygon _pointAtIndex:](self, "_pointAtIndex:", v4);
      UIDistanceBetweenPoints();
      v3 = v3 + v5;
    }
    while (v4 < -[SBPolygon pointCount](self, "pointCount") - 1);
  }
  return v3;
}

- (CGPoint)_pointAtIndex:(unint64_t)a3
{
  double v3;
  double v4;
  CGPoint result;

  +[SBPolygon _pointAtIndex:ofPointArray:](SBPolygon, "_pointAtIndex:ofPointArray:", a3, self->_mutablePoints);
  result.y = v4;
  result.x = v3;
  return result;
}

- (double)_weightAtIndex:(unint64_t)a3
{
  void *v3;
  double v4;
  double v5;

  -[NSMutableArray objectAtIndex:](self->_weights, "objectAtIndex:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  v5 = v4;

  return v5;
}

- (void)_updateProperties
{
  -[SBPolygon _updateCentroid](self, "_updateCentroid");
  -[SBPolygon _updateWeights](self, "_updateWeights");
  -[SBPolygon _updateWeightedCentroid](self, "_updateWeightedCentroid");
}

- (void)_updateCentroid
{
  unint64_t v3;
  _QWORD v4[6];
  uint64_t v5;
  double *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double *v10;
  uint64_t v11;
  uint64_t v12;

  v9 = 0;
  v10 = (double *)&v9;
  v11 = 0x2020000000;
  v12 = 0;
  v5 = 0;
  v6 = (double *)&v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __28__SBPolygon__updateCentroid__block_invoke;
  v4[3] = &unk_1E8EAE640;
  v4[4] = &v9;
  v4[5] = &v5;
  -[SBPolygon enumeratePointsUsingBlock:](self, "enumeratePointsUsingBlock:", v4);
  v3 = -[SBPolygon pointCount](self, "pointCount");
  -[SBPolygon _setCentroid:](self, "_setCentroid:", v10[3] / (double)v3, v6[3] / (double)v3);
  _Block_object_dispose(&v5, 8);
  _Block_object_dispose(&v9, 8);
}

double __28__SBPolygon__updateCentroid__block_invoke(uint64_t a1, double a2, double a3)
{
  uint64_t v3;
  double result;

  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2
                                                              + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                          + 24);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  result = a3 + *(double *)(v3 + 24);
  *(double *)(v3 + 24) = result;
  return result;
}

- (void)_updateWeights
{
  unint64_t v3;
  void *v4;
  unint64_t v5;
  id v6;

  v3 = -[SBPolygon pointCount](self, "pointCount");
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v3);
  v6 = v4;
  if (v3)
  {
    v5 = v3;
    do
    {
      objc_msgSend(v4, "addObject:", &unk_1E91D0E48);
      v4 = v6;
      --v5;
    }
    while (v5);
    if (v3 == 5)
    {
      objc_msgSend(v6, "setObject:atIndexedSubscript:", &unk_1E91CF758, -[SBPolygon _thumbIndex](self, "_thumbIndex"));
      v4 = v6;
    }
  }
  -[SBPolygon _setWeights:](self, "_setWeights:", v4);

}

- (void)_updateWeightedCentroid
{
  _QWORD v3[8];
  uint64_t v4;
  double *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double *v13;
  uint64_t v14;
  uint64_t v15;

  v12 = 0;
  v13 = (double *)&v12;
  v14 = 0x2020000000;
  v15 = 0;
  v8 = 0;
  v9 = (double *)&v8;
  v10 = 0x2020000000;
  v11 = 0;
  v4 = 0;
  v5 = (double *)&v4;
  v6 = 0x2020000000;
  v7 = 0;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __36__SBPolygon__updateWeightedCentroid__block_invoke;
  v3[3] = &unk_1E8EAE668;
  v3[4] = self;
  v3[5] = &v12;
  v3[6] = &v8;
  v3[7] = &v4;
  -[SBPolygon enumeratePointsUsingBlock:](self, "enumeratePointsUsingBlock:", v3);
  -[SBPolygon _setWeightedCentroid:](self, "_setWeightedCentroid:", v13[3] / v5[3], v9[3] / v5[3]);
  _Block_object_dispose(&v4, 8);
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v12, 8);
}

double __36__SBPolygon__updateWeightedCentroid__block_invoke(uint64_t a1, uint64_t a2, double a3, double a4)
{
  double v8;
  double v9;
  uint64_t v10;
  double v11;
  double result;

  objc_msgSend(*(id *)(a1 + 32), "_weightAtIndex:", a2);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                          + 24)
                                                              + v8 * a3;
  objc_msgSend(*(id *)(a1 + 32), "_weightAtIndex:", a2);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                          + 24)
                                                              + v9 * a4;
  objc_msgSend(*(id *)(a1 + 32), "_weightAtIndex:", a2);
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  result = v11 + *(double *)(v10 + 24);
  *(double *)(v10 + 24) = result;
  return result;
}

- (BOOL)_isLeftHanded
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  float v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;

  if (-[SBPolygon pointCount](self, "pointCount") != 5)
    return 0;
  -[SBPolygon _pointAtIndex:](self, "_pointAtIndex:", 0);
  v4 = v3;
  v6 = v5;
  -[SBPolygon _pointAtIndex:](self, "_pointAtIndex:", 1);
  *(float *)&v7 = v7 - v4;
  *(float *)&v8 = v8 - v6;
  v9 = (float)(*(float *)&v7 * *(float *)&v7) + (float)(*(float *)&v8 * *(float *)&v8);
  -[SBPolygon _pointAtIndex:](self, "_pointAtIndex:", 3);
  v11 = v10;
  v13 = v12;
  -[SBPolygon _pointAtIndex:](self, "_pointAtIndex:", 4);
  *(float *)&v14 = v14 - v11;
  *(float *)&v15 = v15 - v13;
  return v9 < (float)((float)(*(float *)&v14 * *(float *)&v14) + (float)(*(float *)&v15 * *(float *)&v15));
}

- (unint64_t)_thumbIndex
{
  if (-[SBPolygon _isLeftHanded](self, "_isLeftHanded"))
    return -[SBPolygon pointCount](self, "pointCount") - 1;
  else
    return 0;
}

- (void)_applyTransform:(CGAffineTransform *)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  unint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;

  -[SBPolygon _centroid](self, "_centroid");
  v6 = v5;
  v8 = v7;
  if (-[SBPolygon pointCount](self, "pointCount"))
  {
    v9 = 0;
    do
    {
      -[SBPolygon _pointAtIndex:](self, "_pointAtIndex:", v9);
      v11 = v10 - v6;
      v13 = v12 - v8;
      v14 = v6 + a3->tx + v13 * a3->c + a3->a * v11;
      v15 = v8 + a3->ty + v13 * a3->d + a3->b * v11;
      -[SBPolygon _points](self, "_points");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v14, v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setObject:atIndexedSubscript:", v17, v9);

      ++v9;
    }
    while (-[SBPolygon pointCount](self, "pointCount") > v9);
  }
}

- (void)_flipHorizontally
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  CGAffineTransform v13;

  CGAffineTransformMakeScale(&v13, -1.0, 1.0);
  -[SBPolygon _applyTransform:](self, "_applyTransform:", &v13);
  v3 = -[SBPolygon pointCount](self, "pointCount");
  v4 = v3 - 1;
  if (v3 != 1)
  {
    v5 = 1;
    do
    {
      -[SBPolygon _points](self, "_points");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectAtIndex:", v5 - 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      -[SBPolygon _points](self, "_points");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBPolygon _points](self, "_points");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectAtIndex:", v4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:atIndexedSubscript:", v10, v5 - 1);

      -[SBPolygon _points](self, "_points");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:atIndexedSubscript:", v7, v4);

    }
    while (v5++ < --v4);
  }
  -[SBPolygon _updateProperties](self, "_updateProperties");
}

- (void)_scale:(double)a3
{
  CGAffineTransform v4;

  CGAffineTransformMakeScale(&v4, a3, a3);
  -[SBPolygon _applyTransform:](self, "_applyTransform:", &v4);
  -[SBPolygon _updateCentroid](self, "_updateCentroid");
  -[SBPolygon _updateWeightedCentroid](self, "_updateWeightedCentroid");
}

- (void)_rotate:(double)a3
{
  CGAffineTransform v4;

  CGAffineTransformMakeRotation(&v4, a3);
  -[SBPolygon _applyTransform:](self, "_applyTransform:", &v4);
  -[SBPolygon _updateCentroid](self, "_updateCentroid");
  -[SBPolygon _updateWeightedCentroid](self, "_updateWeightedCentroid");
}

- (void)_translate:(CGPoint)a3
{
  CGAffineTransform v4;

  CGAffineTransformMakeTranslation(&v4, a3.x, a3.y);
  -[SBPolygon _applyTransform:](self, "_applyTransform:", &v4);
  -[SBPolygon _updateCentroid](self, "_updateCentroid");
  -[SBPolygon _updateWeightedCentroid](self, "_updateWeightedCentroid");
}

- (double)_baseOrientation
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  if (-[SBPolygon pointCount](self, "pointCount") < 2)
    return 0.0;
  -[SBPolygon _pointAtIndex:](self, "_pointAtIndex:", 0);
  v5 = v4;
  v7 = v6;
  -[SBPolygon _pointAtIndex:](self, "_pointAtIndex:", -[SBPolygon pointCount](self, "pointCount") - 1);
  return atan2(v8 - v7, v9 - v5);
}

- (double)_meanFingertipRowAngle
{
  unint64_t v3;
  double result;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  SBPolygon *v17;
  uint64_t v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;

  v3 = -[SBPolygon pointCount](self, "pointCount");
  if (v3 == 5)
  {
    if (!-[SBPolygon _isLeftHanded](self, "_isLeftHanded"))
    {
      -[SBPolygon _pointAtIndex:](self, "_pointAtIndex:", 1);
      v6 = v19;
      v8 = v20;
      -[SBPolygon _pointAtIndex:](self, "_pointAtIndex:", 2);
      v10 = v21;
      v12 = v22;
      -[SBPolygon _pointAtIndex:](self, "_pointAtIndex:", 3);
      v14 = v23;
      v16 = v24;
      v17 = self;
      v18 = 4;
      goto LABEL_9;
    }
LABEL_6:
    -[SBPolygon _pointAtIndex:](self, "_pointAtIndex:", 0);
    v6 = v5;
    v8 = v7;
    -[SBPolygon _pointAtIndex:](self, "_pointAtIndex:", 1);
    v10 = v9;
    v12 = v11;
    -[SBPolygon _pointAtIndex:](self, "_pointAtIndex:", 2);
    v14 = v13;
    v16 = v15;
    v17 = self;
    v18 = 3;
LABEL_9:
    -[SBPolygon _pointAtIndex:](v17, "_pointAtIndex:", v18);
    return mean_tetragon_orientation(v6, v8, v10, v12, v14, v16, v25, v26);
  }
  if (v3 == 4)
    goto LABEL_6;
  if (v3 != 3)
    return 0.0;
  -[SBPolygon _baseOrientation](self, "_baseOrientation");
  return result;
}

- (double)_meanRadius
{
  double v2;
  double v3;
  double v4;
  _QWORD v6[7];
  uint64_t v7;
  double *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double *v12;
  uint64_t v13;
  uint64_t v14;

  v11 = 0;
  v12 = (double *)&v11;
  v13 = 0x2020000000;
  v14 = 0;
  v7 = 0;
  v8 = (double *)&v7;
  v9 = 0x2020000000;
  v10 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __24__SBPolygon__meanRadius__block_invoke;
  v6[3] = &unk_1E8EAE690;
  v6[4] = self;
  v6[5] = &v11;
  v6[6] = &v7;
  -[SBPolygon enumeratePointsUsingBlock:](self, "enumeratePointsUsingBlock:", v6);
  v2 = v12[3];
  v3 = 0.0;
  if (v2 != 0.0)
  {
    v4 = v8[3];
    if (v4 != 0.0)
      v3 = v2 / v4;
  }
  _Block_object_dispose(&v7, 8);
  _Block_object_dispose(&v11, 8);
  return v3;
}

double __24__SBPolygon__meanRadius__block_invoke(uint64_t a1, uint64_t a2)
{
  double v4;
  double v5;
  double v6;
  uint64_t v7;
  double v8;
  double result;

  objc_msgSend(*(id *)(a1 + 32), "_weightAtIndex:", a2);
  v5 = v4;
  objc_msgSend(*(id *)(a1 + 32), "_centroid");
  UIDistanceBetweenPoints();
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                          + 24)
                                                              + v5 * v6;
  objc_msgSend(*(id *)(a1 + 32), "_weightAtIndex:", a2);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  result = v8 + *(double *)(v7 + 24);
  *(double *)(v7 + 24) = result;
  return result;
}

+ (CGPoint)_pointAtIndex:(unint64_t)a3 ofPointArray:(id)a4
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGPoint result;

  objc_msgSend(a4, "objectAtIndex:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "CGPointValue");
  v6 = v5;
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.y = v10;
  result.x = v9;
  return result;
}

+ (id)_sortPoints:(id)a3
{
  id v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  double v10;
  uint64_t v11;
  double v12;
  double v13;
  unint64_t v14;
  double v15;
  double v16;
  unint64_t i;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  float v23;
  double v24;
  BOOL v25;
  unint64_t v26;
  unint64_t v27;
  double v28;
  uint64_t v30;
  double v31;
  double v32;
  double v33;
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
  id v46;
  void *v47;
  uint64_t v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  unint64_t v56;
  void *v57;
  double v58;
  double v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;

  v4 = a3;
  v5 = objc_msgSend(v4, "count");
  if (!v5)
    goto LABEL_50;
  v6 = v5;
  v7 = 0;
  v8 = 0;
  v9 = 0;
  v10 = 0.0;
  v11 = 1;
  do
  {
    objc_msgSend(a1, "_pointAtIndex:ofPointArray:", v7, v4);
    v14 = v7 + 1;
    if (v6 > v7 + 1)
    {
      v15 = v12;
      v16 = v13;
      for (i = v11; v6 > i; ++i)
      {
        objc_msgSend(a1, "_pointAtIndex:ofPointArray:", i, v4);
        v19 = v18;
        v21 = v20;
        UIDistanceBetweenPoints();
        v23 = v22;
        v24 = v23;
        v25 = v10 < v23;
        if (v10 < v23)
          v26 = i;
        else
          v26 = v9;
        if (v10 < v23)
          v27 = v7;
        else
          v27 = v8;
        if (v10 < v23)
          v28 = v23;
        else
          v28 = v10;
        if (v25 && v6 >= 3)
        {
          v30 = 0;
          v31 = v19 - v15;
          v32 = -(v21 - v16);
          v33 = 1.17549435e-38;
          v34 = 3.40282347e38;
          do
          {
            objc_msgSend(a1, "_pointAtIndex:ofPointArray:", v30, v4);
            v37 = -((v36 - v15) * v32 + v31 * (v35 - v16)) / v24;
            if (v37 > v33)
              v33 = v37;
            if (v37 < v34)
              v34 = v37;
            ++v30;
          }
          while (v6 != v30);
          if (fabs(v33) <= fabs(v34))
          {
            if (v33 < 20.0)
            {
              v9 = v7;
              v8 = i;
              goto LABEL_30;
            }
          }
          else if (v34 > -20.0)
          {
            v9 = i;
            v8 = v7;
LABEL_30:
            v10 = v24;
          }
        }
        else
        {
          v9 = v26;
          v8 = v27;
          v10 = v28;
        }
      }
    }
    ++v11;
    ++v7;
  }
  while (v14 != v6);
  if (v10 <= 0.0)
  {
LABEL_50:
    v46 = v4;
    goto LABEL_51;
  }
  objc_msgSend(a1, "_pointAtIndex:ofPointArray:", v8, v4);
  v39 = v38;
  v41 = v40;
  objc_msgSend(a1, "_pointAtIndex:ofPointArray:", v9, v4);
  v43 = v42;
  v45 = v44;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v46 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = 0;
  v49 = v43 - v39;
  v50 = v45 - v41;
  while (2)
  {
    if (v8 != v48 && v9 != v48)
    {
      objc_msgSend(a1, "_pointAtIndex:ofPointArray:", v48, v4);
      v52 = v51;
      v54 = v53;
      v55 = v50 * (v53 - v41) + v49 * (v51 - v39);
      if (objc_msgSend(v47, "count"))
      {
        if (!objc_msgSend(v47, "count"))
          goto LABEL_45;
        v56 = 0;
        do
        {
          objc_msgSend(v47, "objectAtIndex:", v56);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "doubleValue");
          v59 = v58;

          if (v55 <= v59)
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v55);
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "insertObject:atIndex:", v60, v56);

            objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v52, v54);
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "insertObject:atIndex:", v61, v56);

          }
          ++v56;
        }
        while (objc_msgSend(v47, "count") > v56 && v55 > v59);
        if (v55 > v59)
        {
LABEL_45:
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v55);
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "addObject:", v62);

          objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v52, v54);
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          v64 = v46;
          goto LABEL_47;
        }
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v52, v54);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "addObject:", v65);

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v55);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        v64 = v47;
LABEL_47:
        objc_msgSend(v64, "addObject:", v63);

      }
    }
    if (++v48 != v6)
      continue;
    break;
  }
  v66 = (void *)MEMORY[0x1E0CB3B18];
  objc_msgSend(a1, "_pointAtIndex:ofPointArray:", v8, v4);
  objc_msgSend(v66, "valueWithCGPoint:");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "insertObject:atIndex:", v67, 0);

  v68 = (void *)MEMORY[0x1E0CB3B18];
  objc_msgSend(a1, "_pointAtIndex:ofPointArray:", v9, v4);
  objc_msgSend(v68, "valueWithCGPoint:");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "insertObject:atIndex:", v69, v6 - 1);

LABEL_51:
  return v46;
}

- (NSMutableArray)_points
{
  return self->_mutablePoints;
}

- (void)_setPoints:(id)a3
{
  objc_storeStrong((id *)&self->_mutablePoints, a3);
}

- (CGPoint)_centroid
{
  double x;
  double y;
  CGPoint result;

  x = self->_centroid.x;
  y = self->_centroid.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)_setCentroid:(CGPoint)a3
{
  self->_centroid = a3;
}

- (NSMutableArray)_weights
{
  return self->_weights;
}

- (void)_setWeights:(id)a3
{
  objc_storeStrong((id *)&self->_weights, a3);
}

- (CGPoint)_weightedCentroid
{
  double x;
  double y;
  CGPoint result;

  x = self->_weightedCentroid.x;
  y = self->_weightedCentroid.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)_setWeightedCentroid:(CGPoint)a3
{
  self->_weightedCentroid = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_weights, 0);
  objc_storeStrong((id *)&self->_mutablePoints, 0);
}

@end
