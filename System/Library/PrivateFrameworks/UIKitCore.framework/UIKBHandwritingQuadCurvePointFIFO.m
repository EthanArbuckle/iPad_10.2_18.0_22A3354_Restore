@implementation UIKBHandwritingQuadCurvePointFIFO

- (UIKBHandwritingQuadCurvePointFIFO)initWithFIFO:(id)a3 scale:(double)a4
{
  UIKBHandwritingQuadCurvePointFIFO *v5;
  UIKBHandwritingQuadCurvePointFIFO *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)UIKBHandwritingQuadCurvePointFIFO;
  v5 = -[UIKBHandwritingPointFIFO initWithFIFO:](&v9, sel_initWithFIFO_, a3);
  v6 = v5;
  if (v5)
  {
    v5->_scale = a4;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBHandwritingQuadCurvePointFIFO setPrevPoints:](v6, "setPrevPoints:", v7);

  }
  return v6;
}

- (void)addPoint:(id *)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void (**emissionHandler)(id, void *);
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  double v44;
  long double v45;
  double v46;
  double v47;
  double v48;
  int v49;
  float v50;
  float v51;
  void *v52;
  double v53;
  void *v54;
  void (**v55)(id, id);
  double v56;
  double v57;
  id v58;
  double v59;
  id v60;
  _QWORD v61[2];

  v6 = v5;
  v7 = v4;
  v8 = v3;
  v61[1] = *MEMORY[0x1E0C80C00];
  -[UIKBHandwritingQuadCurvePointFIFO prevPoints](self, "prevPoints", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithUIKBHandwritingPoint:", v8, v7, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v11);

  -[UIKBHandwritingQuadCurvePointFIFO prevPoints](self, "prevPoints");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  if (v13 == 1)
  {
    -[UIKBHandwritingQuadCurvePointFIFO setLastPoint:](self, "setLastPoint:", v8, v7, v6);
    emissionHandler = (void (**)(id, void *))self->_emissionHandler;
    if (emissionHandler)
    {
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithUIKBHandwritingPoint:", v8, v7, v6);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v61[0] = v15;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v61, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      emissionHandler[2](emissionHandler, v16);

    }
  }
  else
  {
    -[UIKBHandwritingQuadCurvePointFIFO prevPoints](self, "prevPoints");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "count");

    if (v18 == 3)
    {
      -[UIKBHandwritingQuadCurvePointFIFO lastPoint](self, "lastPoint");
      v20 = v19;
      v22 = v21;
      v57 = v23;
      -[UIKBHandwritingQuadCurvePointFIFO prevPoints](self, "prevPoints");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "objectAtIndexedSubscript:", 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "UIKBHandwritingPointValue");
      v27 = v26;
      v29 = v28;
      v31 = v30;

      -[UIKBHandwritingQuadCurvePointFIFO prevPoints](self, "prevPoints");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "objectAtIndexedSubscript:", 2);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "UIKBHandwritingPointValue");
      v35 = v34;
      v37 = v36;
      v58 = v38;

      v39 = (v27 + v35) * 0.5;
      v40 = v29;
      v41 = (v29 + v37) * 0.5;
      v56 = v31;
      v42 = (v31 + *(double *)&v58) * 0.5;
      -[UIKBHandwritingQuadCurvePointFIFO prevPoints](self, "prevPoints");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "removeObjectAtIndex:", 0);

      v44 = v20;
      v45 = v20 - v27;
      v46 = v22;
      v59 = hypot(v45, v22 - v40);
      v47 = v27;
      v48 = (v59 + hypot(v27 - v39, v40 - v41)) * self->_scale;
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", vcvtmd_u64_f64(v48));
      v60 = (id)objc_claimAutoreleasedReturnValue();
      if (v48 > 1.0)
      {
        v49 = 2;
        do
        {
          v50 = (float)(v49 - 1) / v48;
          v51 = 1.0 - v50;
          objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithUIKBHandwritingPoint:", v39 * (float)(v50 * v50) + v44 * (float)(v51 * v51) + v47 * (float)((float)(v51 + v51) * v50), v41 * (float)(v50 * v50) + v46 * (float)(v51 * v51) + v40 * (float)((float)(v51 + v51) * v50), v42 * (float)(v50 * v50) + v57 * (float)(v51 * v51) + v56 * (float)((float)(v51 + v51) * v50));
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "addObject:", v52);

          v53 = (double)v49++;
        }
        while (v48 > v53);
      }
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithUIKBHandwritingPoint:", v39, v41, v42);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "addObject:", v54);

      -[UIKBHandwritingQuadCurvePointFIFO setLastPoint:](self, "setLastPoint:", v39, v41, v42);
      v55 = (void (**)(id, id))self->_emissionHandler;
      if (v55)
        v55[2](v55, v60);

    }
  }
}

- (void)flush
{
  void *v3;
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  int v21;
  float v22;
  void *v23;
  void *v24;
  void *v25;
  void (**emissionHandler)(id, void *);
  double v27;
  double v28;
  objc_super v29;

  -[UIKBHandwritingQuadCurvePointFIFO prevPoints](self, "prevPoints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    -[UIKBHandwritingQuadCurvePointFIFO lastPoint](self, "lastPoint");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    -[UIKBHandwritingQuadCurvePointFIFO prevPoints](self, "prevPoints");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "lastObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "UIKBHandwritingPointValue");
    v14 = v13;
    v16 = v15;
    v28 = v17;

    v27 = v14;
    v18 = hypot(v14 - v6, v16 - v8) * self->_scale;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", vcvtmd_u64_f64(v18));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 1.0;
    if (v18 > 1.0)
    {
      v21 = 2;
      do
      {
        v22 = v20 / v18;
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithUIKBHandwritingPoint:", v6 + (v14 - v6) * v22, v8 + (v16 - v8) * v22, v10 + (v28 - v10) * v22, *(_QWORD *)&v27);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addObject:", v23);

        v20 = (double)v21++;
      }
      while (v18 > v20);
    }
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithUIKBHandwritingPoint:", v27, v16, v28, *(_QWORD *)&v27);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObject:", v24);

    -[UIKBHandwritingQuadCurvePointFIFO prevPoints](self, "prevPoints");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "removeAllObjects");

    emissionHandler = (void (**)(id, void *))self->_emissionHandler;
    if (emissionHandler)
      emissionHandler[2](emissionHandler, v19);

  }
  v29.receiver = self;
  v29.super_class = (Class)UIKBHandwritingQuadCurvePointFIFO;
  -[UIKBHandwritingPointFIFO flush](&v29, sel_flush);
}

- (void)clear
{
  void *v3;
  objc_super v4;

  -[UIKBHandwritingQuadCurvePointFIFO prevPoints](self, "prevPoints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  v4.receiver = self;
  v4.super_class = (Class)UIKBHandwritingQuadCurvePointFIFO;
  -[UIKBHandwritingPointFIFO clear](&v4, sel_clear);
}

- (id)emissionHandler
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setEmissionHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (double)scale
{
  return self->_scale;
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
}

- (NSMutableArray)prevPoints
{
  return self->_prevPoints;
}

- (void)setPrevPoints:(id)a3
{
  objc_storeStrong((id *)&self->_prevPoints, a3);
}

- ($89C9DF7554150EC42DA90319EED2ADED)lastPoint
{
  return self;
}

- (void)setLastPoint:(id *)a3
{
  CGFloat v3;
  CGFloat v4;
  double v5;

  self->_lastPoint.point.x = v3;
  self->_lastPoint.point.y = v4;
  self->_lastPoint.force = v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prevPoints, 0);
  objc_storeStrong(&self->_emissionHandler, 0);
}

@end
