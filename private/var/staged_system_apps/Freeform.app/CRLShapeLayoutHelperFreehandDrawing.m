@implementation CRLShapeLayoutHelperFreehandDrawing

- (CRLShapeLayoutHelperFreehandDrawing)initWithShapeLayout:(id)a3
{
  id v4;
  CRLShapeLayoutHelperFreehandDrawing *v5;
  CRLShapeLayoutHelperFreehandDrawing *v6;
  uint64_t v7;
  double v8;
  objc_class *v9;
  objc_class *v10;
  void *v11;
  id v12;
  void *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CRLShapeLayoutHelperFreehandDrawing;
  v5 = -[CRLShapeLayoutHelperFreehandDrawing init](&v15, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_shapeLayout, v4);
    *(_QWORD *)&v8 = objc_opt_class(_TtC8Freeform27CRLFreehandDrawingShapeItem, v7).n128_u64[0];
    v10 = v9;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "info", v8));
    v12 = sub_1002223BC(v10, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    objc_storeWeak((id *)&v6->_shapeInfo, v13);

  }
  return v6;
}

- (BOOL)shouldComputeSeparateClippedPathBounds
{
  return 0;
}

- (CGRect)computePathBounds
{
  __int128 v2;
  double v3;
  double v4;
  double v5;
  double v6;
  _OWORD v7[3];
  CGRect result;

  v2 = *(_OWORD *)&CGAffineTransformIdentity.c;
  v7[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
  v7[1] = v2;
  v7[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
  -[CRLShapeLayoutHelperFreehandDrawing p_computePathBoundsWithTransform:](self, "p_computePathBoundsWithTransform:", v7);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)computeClippedPathBoundsWithTransform:(CGAffineTransform *)a3
{
  __int128 v3;
  double v4;
  double v5;
  double v6;
  double v7;
  _OWORD v8[3];
  CGRect result;

  v3 = *(_OWORD *)&a3->c;
  v8[0] = *(_OWORD *)&a3->a;
  v8[1] = v3;
  v8[2] = *(_OWORD *)&a3->tx;
  -[CRLShapeLayoutHelperFreehandDrawing p_computePathBoundsWithTransform:](self, "p_computePathBoundsWithTransform:", v8);
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (CGRect)p_computePathBoundsWithTransform:(CGAffineTransform *)a3
{
  CRLShapeLayout **p_shapeLayout;
  id WeakRetained;
  void *v7;
  __int128 v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  id v18;
  __int128 v19;
  id v20;
  __int128 v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  __int128 v27;
  double v28;
  double v29;
  double v30;
  double v31;
  _QWORD v32[4];
  __int128 v33;
  __int128 v34;
  __int128 v35;
  CGAffineTransform v36;
  CGRect result;

  p_shapeLayout = &self->_shapeLayout;
  WeakRetained = objc_loadWeakRetained((id *)&self->_shapeLayout);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "stroke"));

  if (v7 && !objc_msgSend(v7, "isNullStroke"))
  {
    v18 = objc_loadWeakRetained((id *)p_shapeLayout);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "pencilKitStrokes"));

    if (v9)
    {
      v19 = *(_OWORD *)&a3->c;
      *(_OWORD *)&v36.a = *(_OWORD *)&a3->a;
      *(_OWORD *)&v36.c = v19;
      *(_OWORD *)&v36.tx = *(_OWORD *)&a3->tx;
      if (CGAffineTransformIsIdentity(&v36))
      {
        v20 = v9;
      }
      else
      {
        v32[0] = _NSConcreteStackBlock;
        v32[1] = 3221225472;
        v32[2] = sub_10046F050;
        v32[3] = &unk_1012379D8;
        v27 = *(_OWORD *)&a3->c;
        v33 = *(_OWORD *)&a3->a;
        v34 = v27;
        v35 = *(_OWORD *)&a3->tx;
        v20 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "crl_arrayByTransformingWithBlock:", v32));
      }
      v22 = v20;
      +[CRLPencilKitInkStroke boundsOfStrokes:](CRLPencilKitInkStroke, "boundsOfStrokes:", v20);
    }
    else
    {
      v21 = *(_OWORD *)&a3->c;
      *(_OWORD *)&v36.a = *(_OWORD *)&a3->a;
      *(_OWORD *)&v36.c = v21;
      *(_OWORD *)&v36.tx = *(_OWORD *)&a3->tx;
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLayoutHelperFreehandDrawing p_possibleCopyOfPathUsingTransform:](self, "p_possibleCopyOfPathUsingTransform:", &v36));
      objc_msgSend(v22, "bounds");
    }
    v11 = v23;
    v13 = v24;
    v15 = v25;
    v17 = v26;

  }
  else
  {
    v8 = *(_OWORD *)&a3->c;
    *(_OWORD *)&v36.a = *(_OWORD *)&a3->a;
    *(_OWORD *)&v36.c = v8;
    *(_OWORD *)&v36.tx = *(_OWORD *)&a3->tx;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLayoutHelperFreehandDrawing p_possibleCopyOfPathUsingTransform:](self, "p_possibleCopyOfPathUsingTransform:", &v36));
    objc_msgSend(v9, "bounds");
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;
  }

  v28 = v11;
  v29 = v13;
  v30 = v15;
  v31 = v17;
  result.size.height = v31;
  result.size.width = v30;
  result.origin.y = v29;
  result.origin.x = v28;
  return result;
}

- (id)p_possibleCopyOfPathUsingTransform:(CGAffineTransform *)a3
{
  id WeakRetained;
  void *v5;
  __int128 v6;
  id v7;
  __int128 v8;
  CGAffineTransform v10;

  WeakRetained = objc_loadWeakRetained((id *)&self->_shapeLayout);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "path"));

  v6 = *(_OWORD *)&a3->c;
  *(_OWORD *)&v10.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&v10.c = v6;
  *(_OWORD *)&v10.tx = *(_OWORD *)&a3->tx;
  if (!CGAffineTransformIsIdentity(&v10))
  {
    v7 = objc_msgSend(v5, "copy");

    v8 = *(_OWORD *)&a3->c;
    *(_OWORD *)&v10.a = *(_OWORD *)&a3->a;
    *(_OWORD *)&v10.c = v8;
    *(_OWORD *)&v10.tx = *(_OWORD *)&a3->tx;
    objc_msgSend(v7, "transformUsingAffineTransform:", &v10);
    v5 = v7;
  }
  return v5;
}

- (CGRect)boundsOfLineEndForHead:(BOOL)a3 transform:(CGAffineTransform *)a4
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = CGRectNull.origin.x;
  y = CGRectNull.origin.y;
  width = CGRectNull.size.width;
  height = CGRectNull.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)aliasedAlignmentFrameForScale:(double)a3
{
  id WeakRetained;
  double v4;
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
  CGRect result;

  WeakRetained = objc_loadWeakRetained((id *)&self->_shapeLayout);
  objc_msgSend(WeakRetained, "alignmentFrame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_shapeInfo);
  objc_destroyWeak((id *)&self->_shapeLayout);
}

@end
