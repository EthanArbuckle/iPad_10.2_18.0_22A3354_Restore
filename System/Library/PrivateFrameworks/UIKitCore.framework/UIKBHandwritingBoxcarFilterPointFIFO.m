@implementation UIKBHandwritingBoxcarFilterPointFIFO

- (UIKBHandwritingBoxcarFilterPointFIFO)initWithFIFO:(id)a3 width:(unint64_t)a4
{
  UIKBHandwritingBoxcarFilterPointFIFO *v5;
  UIKBHandwritingBoxcarFilterPointFIFO *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)UIKBHandwritingBoxcarFilterPointFIFO;
  v5 = -[UIKBHandwritingPointFIFO initWithFIFO:](&v9, sel_initWithFIFO_, a3);
  v6 = v5;
  if (v5)
  {
    -[UIKBHandwritingBoxcarFilterPointFIFO setWidth:](v5, "setWidth:", a4);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBHandwritingBoxcarFilterPointFIFO setPrevPoints:](v6, "setPrevPoints:", v7);

  }
  return v6;
}

- (void)emitAveragedPoint
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  uint64_t i;
  double v11;
  double v12;
  double v13;
  unint64_t v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[UIKBHandwritingBoxcarFilterPointFIFO prevPoints](self, "prevPoints", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v20;
    v7 = 0.0;
    v8 = 0.0;
    v9 = 0.0;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v20 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "UIKBHandwritingPointValue");
        v9 = v9 + v11;
        v8 = v8 + v12;
        v7 = v7 + v13;
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v5);
  }
  else
  {
    v7 = 0.0;
    v8 = 0.0;
    v9 = 0.0;
  }

  v14 = -[UIKBHandwritingBoxcarFilterPointFIFO width](self, "width");
  v15 = v9 / (double)v14;
  v16 = v8 / (double)v14;
  v17 = v7 / (double)v14;
  -[UIKBHandwritingBoxcarFilterPointFIFO prevPoints](self, "prevPoints");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "removeObjectAtIndex:", 0);

  -[UIKBHandwritingPointFIFO emitPoint:](self, "emitPoint:", v15, v16, v17);
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
  uint64_t v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  unint64_t v25;
  void *v26;
  void *v27;

  v6 = v5;
  v7 = v4;
  v8 = v3;
  -[UIKBHandwritingBoxcarFilterPointFIFO prevPoints](self, "prevPoints", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v11)
  {
    -[UIKBHandwritingBoxcarFilterPointFIFO prevPoints](self, "prevPoints");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "lastObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "UIKBHandwritingPointValue");
    v15 = v14;
    v17 = v16;
    v19 = v18;

    if (hypot(v15 - v8, v17 - v7) >= 2.0 || (v20 = v6 - v19, v6 - v19 > 0.1))
    {
      -[UIKBHandwritingBoxcarFilterPointFIFO prevPoints](self, "prevPoints");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithUIKBHandwritingPoint:", v8, v7, v6);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "addObject:", v22);

    }
    -[UIKBHandwritingBoxcarFilterPointFIFO prevPoints](self, "prevPoints", v20);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "count");
    v25 = -[UIKBHandwritingBoxcarFilterPointFIFO width](self, "width");

    if (v24 == v25)
      -[UIKBHandwritingBoxcarFilterPointFIFO emitAveragedPoint](self, "emitAveragedPoint");
  }
  else
  {
    -[UIKBHandwritingBoxcarFilterPointFIFO prevPoints](self, "prevPoints");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithUIKBHandwritingPoint:", v8, v7, v6);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addObject:", v27);

    -[UIKBHandwritingPointFIFO emitPoint:](self, "emitPoint:", v8, v7, v6);
  }
}

- (void)flush
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  -[UIKBHandwritingBoxcarFilterPointFIFO prevPoints](self, "prevPoints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");
  v5 = -[UIKBHandwritingBoxcarFilterPointFIFO width](self, "width");

  if (v4 == v5)
    -[UIKBHandwritingBoxcarFilterPointFIFO emitAveragedPoint](self, "emitAveragedPoint");
  -[UIKBHandwritingBoxcarFilterPointFIFO prevPoints](self, "prevPoints");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    -[UIKBHandwritingBoxcarFilterPointFIFO prevPoints](self, "prevPoints");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lastObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "UIKBHandwritingPointValue");
    -[UIKBHandwritingPointFIFO emitPoint:](self, "emitPoint:");

  }
  -[UIKBHandwritingBoxcarFilterPointFIFO prevPoints](self, "prevPoints");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeAllObjects");

  v11.receiver = self;
  v11.super_class = (Class)UIKBHandwritingBoxcarFilterPointFIFO;
  -[UIKBHandwritingPointFIFO flush](&v11, sel_flush);
}

- (void)clear
{
  void *v3;
  objc_super v4;

  -[UIKBHandwritingBoxcarFilterPointFIFO prevPoints](self, "prevPoints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  v4.receiver = self;
  v4.super_class = (Class)UIKBHandwritingBoxcarFilterPointFIFO;
  -[UIKBHandwritingPointFIFO clear](&v4, sel_clear);
}

- (NSMutableArray)prevPoints
{
  return self->_prevPoints;
}

- (void)setPrevPoints:(id)a3
{
  objc_storeStrong((id *)&self->_prevPoints, a3);
}

- (unint64_t)width
{
  return self->_width;
}

- (void)setWidth:(unint64_t)a3
{
  self->_width = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prevPoints, 0);
}

@end
