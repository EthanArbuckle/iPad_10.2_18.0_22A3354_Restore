@implementation UIKBStrokeView

- (UIKBStrokeView)initWithFrame:(CGRect)a3
{
  UIKBStrokeView *v3;
  NSMutableArray *v4;
  NSMutableArray *points;
  UIKBStrokeView *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UIKBStrokeView;
  v3 = -[UIView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    points = v3->_points;
    v3->_points = v4;

    -[UIView setOpaque:](v3, "setOpaque:", 0);
    -[UIView setAlpha:](v3, "setAlpha:", 0.2);
    -[UIView setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 0);
    v6 = v3;
  }

  return v3;
}

- (void)addStrokePoint:(CGPoint)a3 withTimestamp:(double)a4
{
  UIKBStrokeSample *v5;

  v5 = -[UIKBStrokeSample initWithPoint:timestamp:]([UIKBStrokeSample alloc], "initWithPoint:timestamp:", a3.x, a3.y, a4);
  -[NSMutableArray addObject:](self->_points, "addObject:", v5);
  -[UIView setNeedsDisplay](self, "setNeedsDisplay");

}

- (void)resetStrokePoints
{
  -[NSMutableArray removeAllObjects](self->_points, "removeAllObjects");
  -[UIView setNeedsDisplay](self, "setNeedsDisplay");
}

- (void)drawRect:(CGRect)a3
{
  _QWORD *ContextStack;
  CGContext *v5;
  uint64_t SafeDeviceIdiom;
  double v7;
  double (**v8)(void *, uint64_t);
  uint64_t v9;
  uint64_t v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
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
  BOOL v28;
  double v29;
  double v30;
  double v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  double v36;
  CGFloat v37;
  double v38;
  CGFloat v39;
  CGFloat v40;
  CGFloat v41;
  uint64_t v42;
  uint64_t v43;
  void (*v44)(uint64_t, unint64_t);
  void *v45;
  UIKBStrokeView *v46;
  double v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;

  if ((unint64_t)-[NSMutableArray count](self->_points, "count", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height) >= 2)
  {
    ContextStack = GetContextStack(0);
    if (*(int *)ContextStack < 1)
      v5 = 0;
    else
      v5 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
    CGContextSaveGState(v5);
    CGContextSetGrayFillColor(v5, 0.0, 0.0);
    -[UIView bounds](self, "bounds");
    CGContextFillRect(v5, v48);
    CGContextSetLineJoin(v5, kCGLineJoinRound);
    CGContextSetLineCap(v5, kCGLineCapRound);
    SafeDeviceIdiom = UIKeyboardGetSafeDeviceIdiom();
    v7 = 7.5;
    v42 = MEMORY[0x1E0C809B0];
    v43 = 3221225472;
    v44 = __27__UIKBStrokeView_drawRect___block_invoke;
    v45 = &unk_1E16CAE60;
    if ((SafeDeviceIdiom & 0xFFFFFFFFFFFFFFFBLL) == 1)
      v7 = 10.0;
    v46 = self;
    v47 = v7;
    v8 = (double (**)(void *, uint64_t))_Block_copy(&v42);
    v9 = -[NSMutableArray count](self->_points, "count", v42, v43, v44, v45);
    v10 = v9 - 1;
    if (v9 != 1)
    {
      v11 = 0.5;
      do
      {
        -[NSMutableArray objectAtIndexedSubscript:](self->_points, "objectAtIndexedSubscript:", v10 - 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "point");
        v14 = v13;
        v16 = v15;

        -[NSMutableArray objectAtIndexedSubscript:](self->_points, "objectAtIndexedSubscript:", v10);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "point");
        v19 = v18;
        v21 = v20;

        CGContextSetRGBFillColor(v5, 0.0, 0.0, 1.0, 1.0);
        v22 = v8[2](v8, v10 - 1);
        v23 = v8[2](v8, v10);
        CGContextSaveGState(v5);
        v24 = v22 * v11;
        if (v24 > 0.0)
        {
          v49.origin.x = v14 - v24;
          v49.origin.y = v16 - v24;
          v49.size.width = v24 + v24;
          v49.size.height = v24 + v24;
          CGContextAddEllipseInRect(v5, v49);
          CGContextFillPath(v5);
        }
        v25 = v23 * 0.5;
        if (v23 * 0.5 > 0.0)
        {
          v50.origin.x = v19 - v25;
          v50.origin.y = v21 - v25;
          v50.size.width = v25 + v25;
          v50.size.height = v25 + v25;
          CGContextAddEllipseInRect(v5, v50);
          CGContextFillPath(v5);
        }
        v26 = v21 - v16;
        v27 = hypot(v19 - v14, v21 - v16);
        v28 = v25 <= 0.0 && v24 <= 0.0;
        if (!v28 && v27 > 0.0)
        {
          v29 = v26 / v27;
          v30 = -(v19 - v14) / v27;
          v31 = v24 * (v26 / v27);
          v32 = v14 + v31;
          v33 = v16 + v24 * v30;
          v34 = v14 - v31;
          v35 = v16 - v24 * v30;
          v36 = v25 * v29;
          v37 = v19 + v36;
          v38 = v25 * v30;
          v39 = v21 + v38;
          v40 = v19 - v36;
          v41 = v21 - v38;
          CGContextMoveToPoint(v5, v32, v33);
          CGContextAddLineToPoint(v5, v34, v35);
          CGContextAddLineToPoint(v5, v40, v41);
          CGContextAddLineToPoint(v5, v37, v39);
          CGContextClosePath(v5);
          CGContextFillPath(v5);
        }
        CGContextRestoreGState(v5);
        --v10;
        v11 = 0.5;
      }
      while (v10);
    }
    CGContextRestoreGState(v5);

  }
}

void __27__UIKBStrokeView_drawRect___block_invoke(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  unint64_t v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;

  v4 = a2 + 3;
  if (a2 + 3 >= objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "count"))
    v4 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "count") - 1;
  if (a2 <= 2)
    v5 = 0;
  else
    v5 = a2 - 3;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "objectAtIndexedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "point");
  v8 = v7;
  v10 = v9;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "objectAtIndexedSubscript:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "point");
  v13 = v12;
  v15 = v14;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "objectAtIndexedSubscript:", v5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "timestamp");

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "objectAtIndexedSubscript:", v4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "timestamp");

  hypot(v13 - v8, v15 - v10);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_points, 0);
}

@end
