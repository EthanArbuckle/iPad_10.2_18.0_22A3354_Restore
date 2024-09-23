@implementation UIKBHandwritingBezierPathPointFIFO

- (UIKBHandwritingBezierPathPointFIFO)initWithFIFO:(id)a3
{
  UIKBHandwritingBezierPathPointFIFO *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UIKBHandwritingBezierPathPointFIFO;
  v3 = -[UIKBHandwritingPointFIFO initWithFIFO:](&v7, sel_initWithFIFO_, a3);
  if (v3)
  {
    +[UIBezierPath bezierPath](UIBezierPath, "bezierPath");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBHandwritingBezierPathPointFIFO setPath:](v3, "setPath:", v4);

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBHandwritingBezierPathPointFIFO setPrevPoints:](v3, "setPrevPoints:", v5);

  }
  return v3;
}

- (void)addPoint:(id *)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void (**emissionHandler)(id, void *);
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  void (**v36)(id, void *);
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  double v43;
  double v44;
  double v45;
  double v46;
  void *v47;
  void *v48;
  double v49;
  double v50;
  double v51;
  double v52;
  void *v53;
  void *v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  void *v61;
  void *v62;
  void (**v63)(id, void *);
  void *v64;
  id v65;
  _QWORD v66[3];
  _QWORD v67[3];

  v5 = v4;
  v6 = v3;
  v67[2] = *MEMORY[0x1E0C80C00];
  -[UIKBHandwritingBezierPathPointFIFO prevPoints](self, "prevPoints", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (!v9)
  {
    -[UIKBHandwritingBezierPathPointFIFO path](self, "path");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeAllPoints");

  }
  -[UIKBHandwritingBezierPathPointFIFO prevPoints](self, "prevPoints");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v6, v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObject:", v12);

  -[UIKBHandwritingBezierPathPointFIFO prevPoints](self, "prevPoints");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  if (v14 == 1)
  {
    -[UIKBHandwritingBezierPathPointFIFO path](self, "path");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "moveToPoint:", v6, v5);

    emissionHandler = (void (**)(id, void *))self->_emissionHandler;
    if (emissionHandler)
    {
      -[UIKBHandwritingBezierPathPointFIFO prevPoints](self, "prevPoints");
      v65 = (id)objc_claimAutoreleasedReturnValue();
      v17 = (void *)objc_msgSend(v65, "copy");
      emissionHandler[2](emissionHandler, v17);

    }
    return;
  }
  -[UIKBHandwritingBezierPathPointFIFO prevPoints](self, "prevPoints");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "count");

  -[UIKBHandwritingBezierPathPointFIFO prevPoints](self, "prevPoints");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v19 == 2)
  {
    objc_msgSend(v20, "objectAtIndexedSubscript:", 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "CGPointValue");
    v24 = v23;
    v26 = v25;

    -[UIKBHandwritingBezierPathPointFIFO prevPoints](self, "prevPoints");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "objectAtIndexedSubscript:", 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "CGPointValue");
    v30 = v29;
    v32 = v31;

    v33 = (v24 + v30) * 0.5;
    v34 = (v26 + v32) * 0.5;
    -[UIKBHandwritingBezierPathPointFIFO path](self, "path");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "addLineToPoint:", v33, v34);

    v36 = (void (**)(id, void *))self->_emissionHandler;
    if (!v36)
      return;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v24, v26);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v67[0] = v37;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v33, v34);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v67[1] = v38;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v67, 2);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v36[2](v36, v39);
    goto LABEL_12;
  }
  v40 = objc_msgSend(v20, "count");

  if (v40 == 3)
  {
    -[UIKBHandwritingBezierPathPointFIFO prevPoints](self, "prevPoints");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "objectAtIndexedSubscript:", 0);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "CGPointValue");
    v44 = v43;
    v46 = v45;

    -[UIKBHandwritingBezierPathPointFIFO prevPoints](self, "prevPoints");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "objectAtIndexedSubscript:", 1);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "CGPointValue");
    v50 = v49;
    v52 = v51;

    -[UIKBHandwritingBezierPathPointFIFO prevPoints](self, "prevPoints");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "objectAtIndexedSubscript:", 2);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "CGPointValue");
    v56 = v55;
    v58 = v57;

    v59 = (v50 + v56) * 0.5;
    v60 = (v52 + v58) * 0.5;
    -[UIKBHandwritingBezierPathPointFIFO path](self, "path");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "addQuadCurveToPoint:controlPoint:", v59, v60, v50, v52);

    -[UIKBHandwritingBezierPathPointFIFO prevPoints](self, "prevPoints");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "removeObjectAtIndex:", 0);

    v63 = (void (**)(id, void *))self->_emissionHandler;
    if (v63)
    {
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v44, v46);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v66[0] = v37;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v50, v52);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v66[1] = v38;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v59, v60);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v66[2] = v39;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v66, 3);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v63[2](v63, v64);

LABEL_12:
    }
  }
}

- (void)flush
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void (**emissionHandler)(id, void *);
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v20;
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  -[UIKBHandwritingBezierPathPointFIFO path](self, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentPoint");
  v5 = v4;
  v7 = v6;

  -[UIKBHandwritingBezierPathPointFIFO prevPoints](self, "prevPoints");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lastObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "CGPointValue");
  v11 = v10;
  v13 = v12;

  -[UIKBHandwritingBezierPathPointFIFO path](self, "path");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addLineToPoint:", v11, v13);

  emissionHandler = (void (**)(id, void *))self->_emissionHandler;
  if (emissionHandler)
  {
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v5, v7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v16;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v11, v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v21[1] = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    emissionHandler[2](emissionHandler, v18);

  }
  -[UIKBHandwritingBezierPathPointFIFO prevPoints](self, "prevPoints");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "removeAllObjects");

  v20.receiver = self;
  v20.super_class = (Class)UIKBHandwritingBezierPathPointFIFO;
  -[UIKBHandwritingPointFIFO flush](&v20, sel_flush);
}

- (void)clear
{
  void *v3;
  void *v4;
  objc_super v5;

  -[UIKBHandwritingBezierPathPointFIFO prevPoints](self, "prevPoints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  -[UIKBHandwritingBezierPathPointFIFO path](self, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllPoints");

  v5.receiver = self;
  v5.super_class = (Class)UIKBHandwritingBezierPathPointFIFO;
  -[UIKBHandwritingPointFIFO clear](&v5, sel_clear);
}

- (UIBezierPath)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
  objc_storeStrong((id *)&self->_path, a3);
}

- (id)emissionHandler
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setEmissionHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (NSMutableArray)prevPoints
{
  return self->_prevPoints;
}

- (void)setPrevPoints:(id)a3
{
  objc_storeStrong((id *)&self->_prevPoints, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prevPoints, 0);
  objc_storeStrong(&self->_emissionHandler, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

@end
