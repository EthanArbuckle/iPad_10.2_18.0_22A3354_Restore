@implementation CRLCanvasMutableLayoutGeometry

- (void)setTransform:(CGAffineTransform *)a3
{
  __int128 v3;
  _OWORD v4[3];

  v3 = *(_OWORD *)&a3->c;
  v4[0] = *(_OWORD *)&a3->a;
  v4[1] = v3;
  v4[2] = *(_OWORD *)&a3->tx;
  -[CRLCanvasLayoutGeometry i_setTransform:](self, "i_setTransform:", v4);
}

- (void)transformBy:(CGAffineTransform *)a3
{
  __int128 v5;
  CGAffineTransform v6;
  CGAffineTransform t1;
  CGAffineTransform v8;

  -[CRLCanvasLayoutGeometry transform](self, "transform");
  v5 = *(_OWORD *)&a3->c;
  *(_OWORD *)&v6.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&v6.c = v5;
  *(_OWORD *)&v6.tx = *(_OWORD *)&a3->tx;
  CGAffineTransformConcat(&v8, &t1, &v6);
  -[CRLCanvasLayoutGeometry i_setTransform:](self, "i_setTransform:", &v8);
}

- (void)outsetBy:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGAffineTransform v11;
  CGAffineTransform t2;
  CGAffineTransform v13;
  CGAffineTransform v14;

  height = a3.height;
  width = a3.width;
  -[CRLCanvasLayoutGeometry size](self, "size");
  v7 = v6;
  v9 = v8;
  v10 = sub_1000603DC(width, height, 2.0);
  -[CRLCanvasLayoutGeometry i_setSize:](self, "i_setSize:", sub_1000603D0(v7, v9, v10));
  memset(&v14, 0, sizeof(v14));
  CGAffineTransformMakeTranslation(&v14, -width, -height);
  -[CRLCanvasLayoutGeometry transform](self, "transform");
  v11 = v14;
  CGAffineTransformConcat(&v13, &v11, &t2);
  -[CRLCanvasLayoutGeometry i_setTransform:](self, "i_setTransform:", &v13);
}

@end
