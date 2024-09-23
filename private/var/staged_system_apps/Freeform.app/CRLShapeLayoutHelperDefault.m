@implementation CRLShapeLayoutHelperDefault

- (CRLShapeLayoutHelperDefault)initWithShapeLayout:(id)a3
{
  id v4;
  CRLShapeLayoutHelperDefault *v5;
  CRLShapeLayoutHelperDefault *v6;
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
  v15.super_class = (Class)CRLShapeLayoutHelperDefault;
  v5 = -[CRLShapeLayoutHelperDefault init](&v15, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_shapeLayout, v4);
    *(_QWORD *)&v8 = objc_opt_class(_TtC8Freeform12CRLShapeItem, v7).n128_u64[0];
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
  _TtC8Freeform12CRLShapeItem **p_shapeInfo;
  id WeakRetained;
  void *v4;
  id v5;
  void *v6;
  BOOL v7;

  p_shapeInfo = &self->_shapeInfo;
  WeakRetained = objc_loadWeakRetained((id *)&self->_shapeInfo);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "headLineEnd"));

  if (v4 && !objc_msgSend(v4, "isNone"))
  {
    v7 = 1;
  }
  else
  {
    v5 = objc_loadWeakRetained((id *)p_shapeInfo);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "tailLineEnd"));

    v7 = v6 && !objc_msgSend(v6, "isNone");
  }

  return v7;
}

- (CGRect)computePathBounds
{
  CRLShapeLayout **p_shapeLayout;
  id WeakRetained;
  void *v5;
  id v6;
  void *v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  id v16;
  unsigned int v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  double v30;
  double v31;
  double v32;
  double v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect result;
  CGRect v45;
  CGRect v46;

  p_shapeLayout = &self->_shapeLayout;
  WeakRetained = objc_loadWeakRetained((id *)&self->_shapeLayout);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "stroke"));

  v6 = objc_loadWeakRetained((id *)p_shapeLayout);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "path"));
  objc_msgSend(v7, "boundsIncludingCRLStroke:", v5);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  v16 = objc_loadWeakRetained((id *)p_shapeLayout);
  if (objc_msgSend(v16, "pathIsOpen"))
  {
    v17 = objc_msgSend(v5, "supportsWidth");

    if (v17)
    {
      v36 = *(_OWORD *)&CGAffineTransformIdentity.c;
      v37 = *(_OWORD *)&CGAffineTransformIdentity.a;
      v35 = v37;
      v38 = v36;
      v39 = *(_OWORD *)&CGAffineTransformIdentity.tx;
      v34 = v39;
      -[CRLShapeLayoutHelperDefault boundsOfLineEndForHead:transform:](self, "boundsOfLineEndForHead:transform:", 1, &v37);
      v45.origin.x = v18;
      v45.origin.y = v19;
      v45.size.width = v20;
      v45.size.height = v21;
      v40.origin.x = v9;
      v40.origin.y = v11;
      v40.size.width = v13;
      v40.size.height = v15;
      v41 = CGRectUnion(v40, v45);
      x = v41.origin.x;
      y = v41.origin.y;
      width = v41.size.width;
      height = v41.size.height;
      v37 = v35;
      v38 = v36;
      v39 = v34;
      -[CRLShapeLayoutHelperDefault boundsOfLineEndForHead:transform:](self, "boundsOfLineEndForHead:transform:", 0, &v37);
      v46.origin.x = v26;
      v46.origin.y = v27;
      v46.size.width = v28;
      v46.size.height = v29;
      v42.origin.x = x;
      v42.origin.y = y;
      v42.size.width = width;
      v42.size.height = height;
      v43 = CGRectUnion(v42, v46);
      v9 = v43.origin.x;
      v11 = v43.origin.y;
      v13 = v43.size.width;
      v15 = v43.size.height;
    }
  }
  else
  {

  }
  v30 = v9;
  v31 = v11;
  v32 = v13;
  v33 = v15;
  result.size.height = v33;
  result.size.width = v32;
  result.origin.y = v31;
  result.origin.x = v30;
  return result;
}

- (CGRect)computeClippedPathBoundsWithTransform:(CGAffineTransform *)a3
{
  CRLShapeLayout **p_shapeLayout;
  id WeakRetained;
  void *v6;
  id v7;
  __int128 v8;
  id v9;
  void *v10;
  double v11;
  double v12;
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
  _OWORD v23[3];
  CGRect result;

  p_shapeLayout = &self->_shapeLayout;
  WeakRetained = objc_loadWeakRetained((id *)&self->_shapeLayout);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "clippedPathForLineEnds"));
  v7 = objc_msgSend(v6, "copy");

  v8 = *(_OWORD *)&a3->c;
  v23[0] = *(_OWORD *)&a3->a;
  v23[1] = v8;
  v23[2] = *(_OWORD *)&a3->tx;
  objc_msgSend(v7, "transformUsingAffineTransform:", v23);
  v9 = objc_loadWeakRetained((id *)p_shapeLayout);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stroke"));
  objc_msgSend(v7, "boundsIncludingCRLStroke:", v10);
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;

  v19 = v12;
  v20 = v14;
  v21 = v16;
  v22 = v18;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (CGRect)boundsOfLineEndForHead:(BOOL)a3 transform:(CGAffineTransform *)a4
{
  _BOOL8 v5;
  CRLShapeLayout **p_shapeLayout;
  id WeakRetained;
  void *v8;
  uint64_t v9;
  void *v10;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  id v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  id v21;
  double v22;
  double v23;
  double v24;
  double v25;
  id v26;
  double v27;
  double v28;
  id v29;
  void *v30;
  __int128 v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  _OWORD v40[3];
  CGRect result;

  v5 = a3;
  p_shapeLayout = &self->_shapeLayout;
  WeakRetained = objc_loadWeakRetained((id *)&self->_shapeLayout);
  v8 = WeakRetained;
  if (v5)
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "strokeHeadLineEnd"));
  else
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "strokeTailLineEnd"));
  v10 = (void *)v9;
  x = CGRectNull.origin.x;
  y = CGRectNull.origin.y;
  width = CGRectNull.size.width;
  height = CGRectNull.size.height;

  if (v10 && (objc_msgSend(v10, "isNone") & 1) == 0)
  {
    v15 = objc_loadWeakRetained((id *)p_shapeLayout);
    v16 = v15;
    if (v5)
    {
      objc_msgSend(v15, "headLineEndPoint");
      v18 = v17;
      v20 = v19;

      v21 = objc_loadWeakRetained((id *)p_shapeLayout);
      objc_msgSend(v21, "headLineEndAngle");
    }
    else
    {
      objc_msgSend(v15, "tailLineEndPoint");
      v18 = v23;
      v20 = v24;

      v21 = objc_loadWeakRetained((id *)p_shapeLayout);
      objc_msgSend(v21, "tailLineEndAngle");
    }
    v25 = v22;

    v26 = objc_loadWeakRetained((id *)p_shapeLayout);
    objc_msgSend(v26, "lineEndScale:", v5);
    v28 = v27;

    v29 = objc_loadWeakRetained((id *)p_shapeLayout);
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "stroke"));
    v31 = *(_OWORD *)&a4->c;
    v40[0] = *(_OWORD *)&a4->a;
    v40[1] = v31;
    v40[2] = *(_OWORD *)&a4->tx;
    objc_msgSend(v30, "boundsForLineEnd:atPoint:atAngle:withScale:transform:", v10, v40, v18, v20, v25, v28);
    x = v32;
    y = v33;
    width = v34;
    height = v35;

  }
  v36 = x;
  v37 = y;
  v38 = width;
  v39 = height;
  result.size.height = v39;
  result.size.width = v38;
  result.origin.y = v37;
  result.origin.x = v36;
  return result;
}

- (CGRect)aliasedAlignmentFrameForScale:(double)a3
{
  CRLShapeLayout **p_shapeLayout;
  id WeakRetained;
  id v7;
  id v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  id v26;
  unsigned int v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v40;
  CGFloat v41;
  double v42;
  CGFloat v43;
  double v44;
  CGFloat v45;
  double v46;
  CGFloat v47;
  double v48;
  double v49;
  double v50;
  double v51;
  CGAffineTransform v52;
  CGAffineTransform v53;
  CGAffineTransform v54;
  CGAffineTransform v55;
  CGAffineTransform v56;
  id v57;
  id v58;
  CGFloat v59;
  CGFloat v60;
  CGFloat v61;
  CGFloat v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect result;
  CGRect v70;
  CGRect v71;

  v61 = 0.0;
  v62 = 0.0;
  v59 = 0.0;
  v60 = 0.0;
  p_shapeLayout = &self->_shapeLayout;
  WeakRetained = objc_loadWeakRetained((id *)&self->_shapeLayout);
  v57 = 0;
  v58 = 0;
  objc_msgSend(WeakRetained, "aliasPathForScale:adjustedStroke:adjustedPath:startDelta:endDelta:", &v58, &v57, &v61, &v59, a3);
  v7 = v58;
  v8 = v57;

  v9 = objc_loadWeakRetained((id *)p_shapeLayout);
  objc_msgSend(v9, "pathBounds");
  v11 = v10;
  v13 = v12;

  memset(&v56, 0, sizeof(v56));
  v14 = objc_loadWeakRetained((id *)p_shapeLayout);
  v15 = v14;
  if (v14)
    objc_msgSend(v14, "transform");
  else
    memset(&v56, 0, sizeof(v56));

  v54 = v56;
  CGAffineTransformTranslate(&v55, &v54, -v11, -v13);
  v56 = v55;
  v16 = v7;
  v17 = objc_msgSend(v8, "copy");
  v55 = v56;
  objc_msgSend(v17, "transformUsingAffineTransform:", &v55);
  objc_msgSend(v17, "boundsIncludingCRLStroke:", v16);
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v26 = objc_loadWeakRetained((id *)p_shapeLayout);
  v27 = objc_msgSend(v26, "pathIsOpen");

  if (v27)
  {
    v55 = v56;
    -[CRLShapeLayoutHelperDefault boundsOfLineEndForHead:transform:](self, "boundsOfLineEndForHead:transform:", 1, &v55);
    v29 = v28;
    v31 = v30;
    v33 = v32;
    v35 = v34;
    CGAffineTransformMakeTranslation(&v53, v61, v62);
    v63.origin.x = v29;
    v63.origin.y = v31;
    v63.size.width = v33;
    v63.size.height = v35;
    v70 = CGRectApplyAffineTransform(v63, &v53);
    v64.origin.x = v19;
    v64.origin.y = v21;
    v64.size.width = v23;
    v64.size.height = v25;
    v65 = CGRectUnion(v64, v70);
    x = v65.origin.x;
    y = v65.origin.y;
    width = v65.size.width;
    height = v65.size.height;
    v55 = v56;
    -[CRLShapeLayoutHelperDefault boundsOfLineEndForHead:transform:](self, "boundsOfLineEndForHead:transform:", 0, &v55);
    v41 = v40;
    v43 = v42;
    v45 = v44;
    v47 = v46;
    CGAffineTransformMakeTranslation(&v52, v59, v60);
    v66.origin.x = v41;
    v66.origin.y = v43;
    v66.size.width = v45;
    v66.size.height = v47;
    v71 = CGRectApplyAffineTransform(v66, &v52);
    v67.origin.x = x;
    v67.origin.y = y;
    v67.size.width = width;
    v67.size.height = height;
    v68 = CGRectUnion(v67, v71);
    v19 = v68.origin.x;
    v21 = v68.origin.y;
    v23 = v68.size.width;
    v25 = v68.size.height;
  }

  v48 = v19;
  v49 = v21;
  v50 = v23;
  v51 = v25;
  result.size.height = v51;
  result.size.width = v50;
  result.origin.y = v49;
  result.origin.x = v48;
  return result;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_shapeInfo);
  objc_destroyWeak((id *)&self->_shapeLayout);
}

@end
