@implementation CACGestureLivePreviewHandwritingQuadCurvePointFIFO

- (CACGestureLivePreviewHandwritingQuadCurvePointFIFO)initWithFIFO:(id)a3 scale:(double)a4
{
  CACGestureLivePreviewHandwritingQuadCurvePointFIFO *v5;
  CACGestureLivePreviewHandwritingQuadCurvePointFIFO *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CACGestureLivePreviewHandwritingQuadCurvePointFIFO;
  v5 = -[CACGestureLivePreviewHandwritingPointFIFO initWithFIFO:](&v9, sel_initWithFIFO_, a3);
  v6 = v5;
  if (v5)
  {
    v5->_scale = a4;
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CACGestureLivePreviewHandwritingQuadCurvePointFIFO setPrevPoints:](v6, "setPrevPoints:", v7);

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
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  int v45;
  float v46;
  float v47;
  void *v48;
  void *v49;
  void (**v50)(id, id);
  double v51;
  double v52;
  double v53;
  double v54;
  id v55;
  _QWORD v56[2];

  v6 = v5;
  v7 = v4;
  v8 = v3;
  v56[1] = *MEMORY[0x24BDAC8D0];
  -[CACGestureLivePreviewHandwritingQuadCurvePointFIFO prevPoints](self, "prevPoints", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCACGestureLivePreviewHandwritingPoint:", v8, v7, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v11);

  -[CACGestureLivePreviewHandwritingQuadCurvePointFIFO prevPoints](self, "prevPoints");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  if (v13 == 1)
  {
    -[CACGestureLivePreviewHandwritingQuadCurvePointFIFO setLastPoint:](self, "setLastPoint:", v8, v7, v6);
    emissionHandler = (void (**)(id, void *))self->_emissionHandler;
    if (emissionHandler)
    {
      objc_msgSend(MEMORY[0x24BDD1968], "valueWithCACGestureLivePreviewHandwritingPoint:", v8, v7, v6);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v56[0] = v15;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v56, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      emissionHandler[2](emissionHandler, v16);

    }
  }
  else
  {
    -[CACGestureLivePreviewHandwritingQuadCurvePointFIFO prevPoints](self, "prevPoints");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "count");

    if (v18 == 3)
    {
      -[CACGestureLivePreviewHandwritingQuadCurvePointFIFO lastPoint](self, "lastPoint");
      v20 = v19;
      v51 = v21;
      v53 = v22;
      -[CACGestureLivePreviewHandwritingQuadCurvePointFIFO prevPoints](self, "prevPoints");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "objectAtIndexedSubscript:", 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "CACGestureLivePreviewHandwritingPointValue");
      v26 = v25;
      v28 = v27;
      v30 = v29;

      -[CACGestureLivePreviewHandwritingQuadCurvePointFIFO prevPoints](self, "prevPoints");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "objectAtIndexedSubscript:", 2);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "CACGestureLivePreviewHandwritingPointValue");
      v34 = v33;
      v36 = v35;
      v38 = v37;

      v39 = (v28 + v36) * 0.5;
      v52 = v30;
      v40 = (v30 + v38) * 0.5;
      -[CACGestureLivePreviewHandwritingQuadCurvePointFIFO prevPoints](self, "prevPoints");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "removeObjectAtIndex:", 0);

      v54 = hypot(v20 - v26, v51 - v28);
      v42 = (v26 + v34) * 0.5;
      v43 = v28;
      v44 = (v54 + hypot(v26 - v42, v28 - v39)) * self->_scale;
      objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", vcvtmd_u64_f64(v44));
      v55 = (id)objc_claimAutoreleasedReturnValue();
      if (v44 > 1.0)
      {
        v45 = 1;
        do
        {
          v46 = (float)v45 / v44;
          v47 = 1.0 - v46;
          objc_msgSend(MEMORY[0x24BDD1968], "valueWithCACGestureLivePreviewHandwritingPoint:", v26 * (float)((float)(v47 + v47) * v46) + (float)(v47 * v47) * v20 + (float)(v46 * v46) * v42, v43 * (float)((float)(v47 + v47) * v46) + (float)(v47 * v47) * v51 + (float)(v46 * v46) * v39, v52 * (float)((float)(v47 + v47) * v46) + (float)(v47 * v47) * v53 + (float)(v46 * v46) * v40);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "addObject:", v48);

          ++v45;
        }
        while (v44 > (double)v45);
      }
      objc_msgSend(MEMORY[0x24BDD1968], "valueWithCACGestureLivePreviewHandwritingPoint:", v42, v39, v40);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "addObject:", v49);

      -[CACGestureLivePreviewHandwritingQuadCurvePointFIFO setLastPoint:](self, "setLastPoint:", v42, v39, v40);
      v50 = (void (**)(id, id))self->_emissionHandler;
      if (v50)
        v50[2](v50, v55);

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

  -[CACGestureLivePreviewHandwritingQuadCurvePointFIFO prevPoints](self, "prevPoints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    -[CACGestureLivePreviewHandwritingQuadCurvePointFIFO lastPoint](self, "lastPoint");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    -[CACGestureLivePreviewHandwritingQuadCurvePointFIFO prevPoints](self, "prevPoints");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "lastObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "CACGestureLivePreviewHandwritingPointValue");
    v14 = v13;
    v16 = v15;
    v28 = v17;

    v27 = v14;
    v18 = hypot(v14 - v6, v16 - v8) * self->_scale;
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", vcvtmd_u64_f64(v18));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 1.0;
    if (v18 > 1.0)
    {
      v21 = 2;
      do
      {
        v22 = v20 / v18;
        objc_msgSend(MEMORY[0x24BDD1968], "valueWithCACGestureLivePreviewHandwritingPoint:", v6 + (v14 - v6) * v22, v8 + (v16 - v8) * v22, v10 + (v28 - v10) * v22, *(_QWORD *)&v27);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addObject:", v23);

        v20 = (double)v21++;
      }
      while (v18 > v20);
    }
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithCACGestureLivePreviewHandwritingPoint:", v27, v16, v28, *(_QWORD *)&v27);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObject:", v24);

    -[CACGestureLivePreviewHandwritingQuadCurvePointFIFO prevPoints](self, "prevPoints");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "removeAllObjects");

    emissionHandler = (void (**)(id, void *))self->_emissionHandler;
    if (emissionHandler)
      emissionHandler[2](emissionHandler, v19);

  }
  v29.receiver = self;
  v29.super_class = (Class)CACGestureLivePreviewHandwritingQuadCurvePointFIFO;
  -[CACGestureLivePreviewHandwritingPointFIFO flush](&v29, sel_flush);
}

- (void)clear
{
  void *v3;
  objc_super v4;

  -[CACGestureLivePreviewHandwritingQuadCurvePointFIFO prevPoints](self, "prevPoints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  v4.receiver = self;
  v4.super_class = (Class)CACGestureLivePreviewHandwritingQuadCurvePointFIFO;
  -[CACGestureLivePreviewHandwritingPointFIFO clear](&v4, sel_clear);
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

- ($8F6F21C65DCD0A0F8AC24DFE540A6236)lastPoint
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
