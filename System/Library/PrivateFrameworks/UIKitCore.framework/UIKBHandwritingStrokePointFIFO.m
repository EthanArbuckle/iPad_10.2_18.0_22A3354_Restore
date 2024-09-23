@implementation UIKBHandwritingStrokePointFIFO

- (UIKBHandwritingStrokePointFIFO)initWithFIFO:(id)a3
{
  UIKBHandwritingStrokePointFIFO *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIKBHandwritingStrokePointFIFO;
  v3 = -[UIKBHandwritingPointFIFO initWithFIFO:](&v6, sel_initWithFIFO_, a3);
  if (v3)
  {
    v4 = (void *)objc_opt_new();
    -[UIKBHandwritingStrokePointFIFO setStrokes:](v3, "setStrokes:", v4);

  }
  return v3;
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
  objc_super v11;

  v6 = v5;
  v7 = v4;
  v8 = v3;
  -[UIKBHandwritingStrokePointFIFO strokes](self, "strokes", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addPoint:", v8, v7);

  v11.receiver = self;
  v11.super_class = (Class)UIKBHandwritingStrokePointFIFO;
  -[UIKBHandwritingPointFIFO addPoint:](&v11, sel_addPoint_, v8, v7, v6);
}

- (void)flush
{
  void *v3;
  objc_super v4;

  -[UIKBHandwritingStrokePointFIFO strokes](self, "strokes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endStroke");

  v4.receiver = self;
  v4.super_class = (Class)UIKBHandwritingStrokePointFIFO;
  -[UIKBHandwritingPointFIFO flush](&v4, sel_flush);
}

- (void)clear
{
  void *v3;
  objc_super v4;

  -[UIKBHandwritingStrokePointFIFO strokes](self, "strokes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllStrokes");

  v4.receiver = self;
  v4.super_class = (Class)UIKBHandwritingStrokePointFIFO;
  -[UIKBHandwritingPointFIFO clear](&v4, sel_clear);
}

- (id)scaleStrokes:(double)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  unint64_t v18;

  if (a3 == 1.0)
  {
    -[UIKBHandwritingStrokePointFIFO strokes](self, "strokes");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = objc_alloc_init(MEMORY[0x1E0DBDB88]);
    -[UIKBHandwritingStrokePointFIFO strokes](self, "strokes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "numberOfStrokes");

    if (v7)
    {
      v8 = 0;
      do
      {
        -[UIKBHandwritingStrokePointFIFO strokes](self, "strokes");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "numberOfPointsInStrokeAtIndex:", v8);

        if (v10)
        {
          for (i = 0; i != v10; ++i)
          {
            -[UIKBHandwritingStrokePointFIFO strokes](self, "strokes");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "pointAtIndex:inStrokeAtIndex:", i, v8);
            v14 = v13;
            v16 = v15;

            objc_msgSend(v5, "addPoint:", v14 * a3, v16 * a3);
          }
        }
        objc_msgSend(v5, "endStroke");
        ++v8;
        -[UIKBHandwritingStrokePointFIFO strokes](self, "strokes");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "numberOfStrokes");

      }
      while (v8 < v18);
    }
  }
  return v5;
}

- (TIHandwritingStrokes)strokes
{
  return self->_strokes;
}

- (void)setStrokes:(id)a3
{
  objc_storeStrong((id *)&self->_strokes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strokes, 0);
}

@end
