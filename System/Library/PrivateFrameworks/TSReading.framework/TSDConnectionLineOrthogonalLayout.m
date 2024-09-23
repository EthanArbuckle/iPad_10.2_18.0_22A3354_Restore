@implementation TSDConnectionLineOrthogonalLayout

- (CGRect)orthoRectOfLayout:(id)a3 outset:(double)a4
{
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  double v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  CGFloat v19;
  id v20;
  double v21;
  double v22;
  id v23;
  BOOL v24;
  CGFloat v25;
  CGFloat v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  char v34;
  CGRect result;

  objc_msgSend(a3, "centerForConnecting");
  v8 = v7;
  v10 = v9;
  objc_msgSend(a3, "boundsForStandardKnobs");
  v13 = 0;
  if (v11 <= v12)
    v14 = v12;
  else
    v14 = v11;
  v15 = a4 + 10.0 + v14;
  v34 = 1;
  v16 = 0.0;
  v17 = v8;
  v18 = v10;
  v19 = 0.0;
  do
  {
    v20 = +[TSDBezierPath bezierPath](TSDBezierPath, "bezierPath");
    objc_msgSend(v20, "moveToPoint:", v8, v10);
    v21 = TSDDirectionDelta(v13);
    objc_msgSend(v20, "relativeLineToPoint:", TSDMultiplyPointScalar(v21, v22, v15));
    v23 = -[TSDConnectionLineAbstractLayout clipPath:onLayout:outset:reversed:isValid:](self, "clipPath:onLayout:outset:reversed:isValid:", v20, a3, 0, &v34, a4);
    if (v23)
      v24 = v34 == 0;
    else
      v24 = 1;
    if (!v24)
    {
      objc_msgSend(v23, "point");
      v17 = TSDGrowRectToPoint(v17, v18, v16, v19, v25, v26);
      v18 = v27;
      v16 = v28;
      v19 = v29;
    }
    ++v13;
  }
  while (v13 != 4);
  v30 = v17;
  v31 = v18;
  v32 = v16;
  v33 = v19;
  result.size.height = v33;
  result.size.width = v32;
  result.origin.y = v31;
  result.origin.x = v30;
  return result;
}

- (id)createConnectedPathFrom:(id)a3 to:(id)a4 withControlPoints:(CGPoint)a5[3]
{
  unint64_t v9;
  double v10;
  double *v11;
  uint64_t v12;
  double v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  double v25;
  double v26;
  uint64_t v27;
  uint64_t v28;
  double v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  double v33;
  double v34;
  uint64_t v35;
  uint64_t v36;
  double *v37;
  uint64_t v38;
  double v39;
  double *v40;
  double *v41;
  double *v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  unint64_t v46;
  char *v47;
  double *v48;
  char *v49;
  uint64_t v50;
  double v51;
  double *v52;
  double *v53;
  double *v54;
  uint64_t v55;
  unint64_t v56;
  uint64_t v57;
  unint64_t v58;
  char *v59;
  double *v60;
  double *v61;
  uint64_t v62;
  double v63;
  double *v64;
  double *v65;
  double *v66;
  uint64_t v67;
  unint64_t v68;
  uint64_t v69;
  unint64_t v70;
  char *v71;
  double *v72;
  char *v73;
  uint64_t v74;
  double v75;
  double v76;
  void *v77;
  int64_t v78;
  char *v79;
  void *v80;
  int64_t v81;
  char *v82;
  double v83;
  double v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  CGAffineTransform v89;
  void *v90;
  void *v91;
  uint64_t v92;
  void *v93;
  void *__dst;
  uint64_t v95;
  void *__p;
  double *v97;
  unint64_t v98;
  void *v99;
  double *v100;
  double *v101;
  _OWORD v102[2];
  _OWORD v103[2];
  __int128 v104;
  __int128 v105;
  uint64_t v106;
  uint64_t v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  uint64_t v112;
  __int128 v113;
  __int128 v114;
  uint64_t v115;
  uint64_t v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  uint64_t v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  double v126[4];
  double v127;
  double v128;
  uint64_t v129;

  v9 = 0;
  v129 = *MEMORY[0x24BDAC8D0];
  do
  {
    v10 = TSDMultiplyPointScalar(a5[v9 / 2].x, a5[v9 / 2].y, 10.0);
    v11 = &v126[v9];
    *v11 = v10;
    *((_QWORD *)v11 + 1) = v12;
    v9 += 2;
  }
  while (v9 != 6);
  v124 = 0u;
  v125 = 0u;
  v13 = v126[0];
  TSDIntRectMake((uint64_t)v126[0], (uint64_t)v126[1], 0, 0, &v124);
  v122 = 0u;
  v123 = 0u;
  v14 = v127;
  TSDIntRectMake((uint64_t)v127, (uint64_t)v128, 0, 0, &v122);
  v113 = v124;
  v114 = v125;
  v15 = TSDIntPointFromCGPoint(v13);
  v17 = v16;
  v115 = v15;
  v116 = v16;
  v117 = 0u;
  v118 = 0u;
  v119 = 0u;
  v120 = 0u;
  v121 = 0;
  v104 = v122;
  v105 = v123;
  v18 = TSDIntPointFromCGPoint(v14);
  v20 = v19;
  v106 = v18;
  v107 = v19;
  v108 = 0u;
  v109 = 0u;
  v110 = 0u;
  v111 = 0u;
  v112 = 0;
  if (a3)
  {
    -[TSDConnectionLineAbstractLayout outsetFrom](self, "outsetFrom");
    -[TSDConnectionLineOrthogonalLayout orthoRectOfLayout:outset:](self, "orthoRectOfLayout:outset:", a3);
    objc_msgSend(a3, "centerForConnecting", TSDIntRectFromCGRectWithScale((uint64_t *)&v113, v21, v22, v23, v24, 10.0));
    TSDIntPointFromCGPointWithScale(v25, v26, 10.0);
    v15 = v27;
    v17 = v28;
    v115 = v27;
    v116 = v28;
    v103[0] = v113;
    v103[1] = v114;
    TSDExpandShapeRectToIncludePoint((uint64_t)v103, v27, v28, &v113);
    if ((uint64_t)v114 >= 1 && *((uint64_t *)&v114 + 1) >= 1)
      *(_QWORD *)&v117 = 200;
  }
  if (a4)
  {
    -[TSDConnectionLineAbstractLayout outsetTo](self, "outsetTo");
    -[TSDConnectionLineOrthogonalLayout orthoRectOfLayout:outset:](self, "orthoRectOfLayout:outset:", a4);
    objc_msgSend(a4, "centerForConnecting", TSDIntRectFromCGRectWithScale((uint64_t *)&v104, v29, v30, v31, v32, 10.0));
    TSDIntPointFromCGPointWithScale(v33, v34, 10.0);
    v18 = v35;
    v20 = v36;
    v106 = v35;
    v107 = v36;
    v102[0] = v104;
    v102[1] = v105;
    TSDExpandShapeRectToIncludePoint((uint64_t)v102, v35, v36, &v104);
    if ((uint64_t)v105 >= 1 && *((uint64_t *)&v105 + 1) >= 1)
      *(_QWORD *)&v108 = 200;
  }
  self->super.mVisibleLine = 1;
  v101 = 0;
  __p = 0;
  v97 = 0;
  v98 = 0;
  v37 = (double *)std::__allocate_at_least[abi:nn180100]<std::allocator<EQKitLayoutContext *>>((uint64_t)&v101, 1uLL);
  *v37 = (double)v15;
  v99 = v37;
  v101 = &v37[v38];
  v39 = (double)v17;
  v100 = v37 + 1;
  v40 = v97;
  if ((unint64_t)v97 >= v98)
  {
    v42 = (double *)__p;
    v43 = ((char *)v97 - (_BYTE *)__p) >> 3;
    v44 = v43 + 1;
    if ((unint64_t)(v43 + 1) >> 61)
      abort();
    v45 = v98 - (_QWORD)__p;
    if ((uint64_t)(v98 - (_QWORD)__p) >> 2 > v44)
      v44 = v45 >> 2;
    if ((unint64_t)v45 >= 0x7FFFFFFFFFFFFFF8)
      v46 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v46 = v44;
    if (v46)
    {
      v47 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<EQKitLayoutContext *>>((uint64_t)&v98, v46);
      v42 = (double *)__p;
      v40 = v97;
    }
    else
    {
      v47 = 0;
    }
    v48 = (double *)&v47[8 * v43];
    v49 = &v47[8 * v46];
    *v48 = v39;
    v41 = v48 + 1;
    while (v40 != v42)
    {
      v50 = *((_QWORD *)v40-- - 1);
      *((_QWORD *)v48-- - 1) = v50;
    }
    __p = v48;
    v97 = v41;
    v98 = (unint64_t)v49;
    if (v42)
      operator delete(v42);
  }
  else
  {
    *v97 = v39;
    v41 = v40 + 1;
  }
  v97 = v41;
  v51 = (double)v18;
  v52 = v100;
  if (v100 >= v101)
  {
    v54 = (double *)v99;
    v55 = ((char *)v100 - (_BYTE *)v99) >> 3;
    v56 = v55 + 1;
    if ((unint64_t)(v55 + 1) >> 61)
      abort();
    v57 = (char *)v101 - (_BYTE *)v99;
    if (((char *)v101 - (_BYTE *)v99) >> 2 > v56)
      v56 = v57 >> 2;
    if ((unint64_t)v57 >= 0x7FFFFFFFFFFFFFF8)
      v58 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v58 = v56;
    if (v58)
    {
      v59 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<EQKitLayoutContext *>>((uint64_t)&v101, v58);
      v54 = (double *)v99;
      v52 = v100;
    }
    else
    {
      v59 = 0;
    }
    v60 = (double *)&v59[8 * v55];
    v61 = (double *)&v59[8 * v58];
    *v60 = v51;
    v53 = v60 + 1;
    while (v52 != v54)
    {
      v62 = *((_QWORD *)v52-- - 1);
      *((_QWORD *)v60-- - 1) = v62;
    }
    v99 = v60;
    v100 = v53;
    v101 = v61;
    if (v54)
      operator delete(v54);
  }
  else
  {
    *v100 = v51;
    v53 = v52 + 1;
  }
  v100 = v53;
  v63 = (double)v20;
  v64 = v97;
  if ((unint64_t)v97 >= v98)
  {
    v66 = (double *)__p;
    v67 = ((char *)v97 - (_BYTE *)__p) >> 3;
    v68 = v67 + 1;
    if ((unint64_t)(v67 + 1) >> 61)
      abort();
    v69 = v98 - (_QWORD)__p;
    if ((uint64_t)(v98 - (_QWORD)__p) >> 2 > v68)
      v68 = v69 >> 2;
    if ((unint64_t)v69 >= 0x7FFFFFFFFFFFFFF8)
      v70 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v70 = v68;
    if (v70)
    {
      v71 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<EQKitLayoutContext *>>((uint64_t)&v98, v70);
      v66 = (double *)__p;
      v64 = v97;
    }
    else
    {
      v71 = 0;
    }
    v72 = (double *)&v71[8 * v67];
    v73 = &v71[8 * v70];
    *v72 = v63;
    v65 = v72 + 1;
    while (v64 != v66)
    {
      v74 = *((_QWORD *)v64-- - 1);
      *((_QWORD *)v72-- - 1) = v74;
    }
    __p = v72;
    v97 = v65;
    v98 = (unint64_t)v73;
    if (v66)
      operator delete(v66);
  }
  else
  {
    *v97 = v63;
    v65 = v64 + 1;
  }
  v97 = v65;
  v75 = v126[2];
  v76 = v126[3];
  __dst = 0;
  v95 = 0;
  v93 = 0;
  v77 = v99;
  v78 = (char *)v100 - (_BYTE *)v99;
  if (v100 != v99)
  {
    std::vector<unsigned long>::__vallocate[abi:nn180100](&v93, v78 >> 3);
    v79 = (char *)__dst;
    memmove(__dst, v77, v78);
    __dst = &v79[8 * (v78 >> 3)];
    v65 = v97;
  }
  v90 = 0;
  v91 = 0;
  v92 = 0;
  v80 = __p;
  v81 = (char *)v65 - (_BYTE *)__p;
  if (v65 != __p)
  {
    std::vector<unsigned long>::__vallocate[abi:nn180100](&v90, v81 >> 3);
    v82 = (char *)v91;
    memmove(v91, v80, v81);
    v91 = &v82[8 * (v81 >> 3)];
  }
  -[TSDConnectionLineOrthogonalLayout axisSnapPoint:toXs:toYs:withThreshold:](self, "axisSnapPoint:toXs:toYs:withThreshold:", &v93, &v90, v75, v76, 20.0);
  v84 = v83;
  if (v90)
  {
    v91 = v90;
    operator delete(v90);
  }
  if (v93)
  {
    __dst = v93;
    operator delete(v93);
  }
  v85 = TSDIntPointFromCGPoint(v84);
  v87 = routePath((uint64_t)&v113, v85, v86, (uint64_t)&v104);
  CGAffineTransformMakeScale(&v89, 0.1, 0.1);
  objc_msgSend(v87, "transformUsingAffineTransform:", &v89);
  if (__p)
  {
    v97 = (double *)__p;
    operator delete(__p);
  }
  if (v99)
  {
    v100 = (double *)v99;
    operator delete(v99);
  }
  return v87;
}

- (CGPoint)controlPointForPointA:(CGPoint)a3 pointB:(CGPoint)a4 andOriginalA:(CGPoint)a5 originalB:(CGPoint)a6
{
  void *v7;
  TSDInfoGeometry *mResizeInfoGeometry;
  double v9;
  double v10;
  float64x2_t v11;
  double v12;
  __int128 v13;
  float64x2_t v14;
  __int128 v15;
  float64x2_t v16;
  __int128 v17;
  float64x2_t v18;
  CGPoint result;

  objc_opt_class();
  if (!self->super.super.mResizePathSource)
    objc_msgSend(-[TSDShapeLayout shapeInfo](self, "shapeInfo"), "pathSource");
  v7 = (void *)TSUDynamicCast();
  mResizeInfoGeometry = self->super.super.mResizeInfoGeometry;
  if (mResizeInfoGeometry)
  {
    v15 = 0u;
    v17 = 0u;
    v13 = 0u;
LABEL_6:
    -[TSDInfoGeometry transform](mResizeInfoGeometry, "transform", v13, v15, v17);
    goto LABEL_7;
  }
  mResizeInfoGeometry = (TSDInfoGeometry *)-[TSDInfo geometry](-[TSDLayout info](self, "info"), "geometry");
  v15 = 0u;
  v17 = 0u;
  v13 = 0u;
  if (mResizeInfoGeometry)
    goto LABEL_6;
LABEL_7:
  objc_msgSend(v7, "getControlKnobPosition:", 12, v13, v15, v17);
  v11 = vaddq_f64(v18, vmlaq_n_f64(vmulq_n_f64(v16, v9), v14, v10));
  v12 = v11.f64[1];
  result.x = v11.f64[0];
  result.y = v12;
  return result;
}

- (BOOL)canEndpointsCoincide
{
  return 1;
}

- (CGPoint)axisSnapPoint:(CGPoint)a3 toXs:()vector<double toYs:(std:()vector<double :(std:(double)a6 :allocator<double>> *)a5 allocator<double>> *)a4 withThreshold:
{
  double *begin;
  double *end;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double *v13;
  double *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGPoint result;

  begin = a4->__begin_;
  end = a4->__end_;
  if (a4->__begin_ == end)
  {
    v8 = 1.79769313e308;
  }
  else
  {
    v8 = 1.79769313e308;
    do
    {
      v9 = *begin++;
      v10 = a3.x - v9;
      v11 = -v8;
      if (v8 >= 0.0)
        v11 = v8;
      v12 = -v10;
      if (v10 >= 0.0)
        v12 = v10;
      if (v11 >= v12)
        v8 = v10;
    }
    while (begin != end);
  }
  v13 = a5->__begin_;
  v14 = a5->__end_;
  if (a5->__begin_ == v14)
  {
    v15 = 1.79769313e308;
  }
  else
  {
    v15 = 1.79769313e308;
    do
    {
      v16 = *v13++;
      v17 = a3.y - v16;
      v18 = -v15;
      if (v15 >= 0.0)
        v18 = v15;
      v19 = -v17;
      if (v17 >= 0.0)
        v19 = v17;
      if (v18 >= v19)
        v15 = v17;
    }
    while (v13 != v14);
  }
  v20 = -v8;
  if (v8 >= 0.0)
    v20 = v8;
  if (v20 >= a6)
    v8 = 0.0;
  v21 = a3.x - v8;
  v22 = -v15;
  if (v15 >= 0.0)
    v22 = v15;
  if (v22 >= a6)
    v23 = 0.0;
  else
    v23 = v15;
  v24 = a3.y - v23;
  result.y = v24;
  result.x = v21;
  return result;
}

- (void)addEndpointSnapsToXs:(void *)a3 andYs:(void *)a4
{
  TSDLayout *mConnectedFrom;
  TSDAbstractLayout *v8;
  TSDLayout *v9;
  TSDLayout *mConnectedTo;
  TSDAbstractLayout *v11;
  TSDLayout *v12;
  TSDConnectionLinePathSource *v13;
  TSDConnectionLinePathSource *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  id v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  id v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  unint64_t v45;
  double *v46;
  double *v47;
  double *v48;
  uint64_t v49;
  unint64_t v50;
  uint64_t v51;
  unint64_t v52;
  char *v53;
  double *v54;
  char *v55;
  uint64_t v56;
  unint64_t v57;
  double *v58;
  double *v59;
  double *v60;
  uint64_t v61;
  unint64_t v62;
  uint64_t v63;
  unint64_t v64;
  char *v65;
  double *v66;
  char *v67;
  uint64_t v68;
  unint64_t v69;
  double *v70;
  double *v71;
  double *v72;
  uint64_t v73;
  unint64_t v74;
  uint64_t v75;
  unint64_t v76;
  char *v77;
  double *v78;
  char *v79;
  uint64_t v80;
  unint64_t v81;
  double *v82;
  double *v83;
  double *v84;
  uint64_t v85;
  unint64_t v86;
  uint64_t v87;
  unint64_t v88;
  char *v89;
  double *v90;
  char *v91;
  uint64_t v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;

  mConnectedFrom = self->super.mConnectedFrom;
  if (mConnectedFrom
    && (v8 = -[TSDAbstractLayout parent](mConnectedFrom, "parent"), v8 == -[TSDAbstractLayout parent](self, "parent")))
  {
    v9 = self->super.mConnectedFrom;
  }
  else
  {
    v9 = 0;
  }
  mConnectedTo = self->super.mConnectedTo;
  if (mConnectedTo
    && (v11 = -[TSDAbstractLayout parent](mConnectedTo, "parent"), v11 == -[TSDAbstractLayout parent](self, "parent")))
  {
    v12 = self->super.mConnectedTo;
  }
  else
  {
    v12 = 0;
  }
  v13 = -[TSDConnectionLineAbstractLayout connectedPathSource](self, "connectedPathSource");
  v14 = v13;
  if (v9)
  {
    -[TSDLayout centerForConnecting](v9, "centerForConnecting");
    v16 = v15;
    v18 = v17;
    if (v12)
    {
LABEL_11:
      -[TSDLayout centerForConnecting](v12, "centerForConnecting");
      v20 = v19;
      v22 = v21;
      goto LABEL_20;
    }
  }
  else
  {
    -[TSDConnectionLinePathSource getControlKnobPosition:](v13, "getControlKnobPosition:", 10);
    v24 = v23;
    v26 = v25;
    v27 = -[TSDLayout pureGeometry](self, "pureGeometry");
    if (v27)
    {
      objc_msgSend(v27, "transform");
      v28 = v100;
      v29 = v99;
      v30 = v102;
      v31 = v101;
      v32 = v104;
      v33 = v103;
    }
    else
    {
      v32 = 0.0;
      v30 = 0.0;
      v28 = 0.0;
      v33 = 0.0;
      v31 = 0.0;
      v29 = 0.0;
    }
    v16 = v33 + v26 * v31 + v29 * v24;
    v18 = v32 + v26 * v30 + v28 * v24;
    if (v12)
      goto LABEL_11;
  }
  -[TSDConnectionLinePathSource getControlKnobPosition:](v14, "getControlKnobPosition:", 11);
  v35 = v34;
  v37 = v36;
  v38 = -[TSDLayout pureGeometry](self, "pureGeometry");
  if (v38)
  {
    objc_msgSend(v38, "transform");
    v39 = v94;
    v40 = v93;
    v41 = v96;
    v42 = v95;
    v43 = v98;
    v44 = v97;
  }
  else
  {
    v43 = 0.0;
    v41 = 0.0;
    v39 = 0.0;
    v44 = 0.0;
    v42 = 0.0;
    v40 = 0.0;
  }
  v20 = v44 + v37 * v42 + v40 * v35;
  v22 = v43 + v37 * v41 + v39 * v35;
LABEL_20:
  v45 = *((_QWORD *)a3 + 2);
  v46 = (double *)*((_QWORD *)a3 + 1);
  if ((unint64_t)v46 >= v45)
  {
    v48 = *(double **)a3;
    v49 = ((uint64_t)v46 - *(_QWORD *)a3) >> 3;
    v50 = v49 + 1;
    if ((unint64_t)(v49 + 1) >> 61)
      goto LABEL_85;
    v51 = v45 - (_QWORD)v48;
    if (v51 >> 2 > v50)
      v50 = v51 >> 2;
    if ((unint64_t)v51 >= 0x7FFFFFFFFFFFFFF8)
      v52 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v52 = v50;
    if (v52)
    {
      v53 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<EQKitLayoutContext *>>((uint64_t)a3 + 16, v52);
      v48 = *(double **)a3;
      v46 = (double *)*((_QWORD *)a3 + 1);
    }
    else
    {
      v53 = 0;
    }
    v54 = (double *)&v53[8 * v49];
    v55 = &v53[8 * v52];
    *v54 = v16;
    v47 = v54 + 1;
    while (v46 != v48)
    {
      v56 = *((_QWORD *)v46-- - 1);
      *((_QWORD *)v54-- - 1) = v56;
    }
    *(_QWORD *)a3 = v54;
    *((_QWORD *)a3 + 1) = v47;
    *((_QWORD *)a3 + 2) = v55;
    if (v48)
      operator delete(v48);
  }
  else
  {
    *v46 = v16;
    v47 = v46 + 1;
  }
  *((_QWORD *)a3 + 1) = v47;
  v57 = *((_QWORD *)a4 + 2);
  v58 = (double *)*((_QWORD *)a4 + 1);
  if ((unint64_t)v58 >= v57)
  {
    v60 = *(double **)a4;
    v61 = ((uint64_t)v58 - *(_QWORD *)a4) >> 3;
    v62 = v61 + 1;
    if ((unint64_t)(v61 + 1) >> 61)
      goto LABEL_85;
    v63 = v57 - (_QWORD)v60;
    if (v63 >> 2 > v62)
      v62 = v63 >> 2;
    if ((unint64_t)v63 >= 0x7FFFFFFFFFFFFFF8)
      v64 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v64 = v62;
    if (v64)
    {
      v65 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<EQKitLayoutContext *>>((uint64_t)a4 + 16, v64);
      v60 = *(double **)a4;
      v58 = (double *)*((_QWORD *)a4 + 1);
    }
    else
    {
      v65 = 0;
    }
    v66 = (double *)&v65[8 * v61];
    v67 = &v65[8 * v64];
    *v66 = v18;
    v59 = v66 + 1;
    while (v58 != v60)
    {
      v68 = *((_QWORD *)v58-- - 1);
      *((_QWORD *)v66-- - 1) = v68;
    }
    *(_QWORD *)a4 = v66;
    *((_QWORD *)a4 + 1) = v59;
    *((_QWORD *)a4 + 2) = v67;
    if (v60)
      operator delete(v60);
  }
  else
  {
    *v58 = v18;
    v59 = v58 + 1;
  }
  *((_QWORD *)a4 + 1) = v59;
  v70 = (double *)*((_QWORD *)a3 + 1);
  v69 = *((_QWORD *)a3 + 2);
  if ((unint64_t)v70 >= v69)
  {
    v72 = *(double **)a3;
    v73 = ((uint64_t)v70 - *(_QWORD *)a3) >> 3;
    v74 = v73 + 1;
    if ((unint64_t)(v73 + 1) >> 61)
      goto LABEL_85;
    v75 = v69 - (_QWORD)v72;
    if (v75 >> 2 > v74)
      v74 = v75 >> 2;
    if ((unint64_t)v75 >= 0x7FFFFFFFFFFFFFF8)
      v76 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v76 = v74;
    if (v76)
    {
      v77 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<EQKitLayoutContext *>>((uint64_t)a3 + 16, v76);
      v72 = *(double **)a3;
      v70 = (double *)*((_QWORD *)a3 + 1);
    }
    else
    {
      v77 = 0;
    }
    v78 = (double *)&v77[8 * v73];
    v79 = &v77[8 * v76];
    *v78 = v20;
    v71 = v78 + 1;
    while (v70 != v72)
    {
      v80 = *((_QWORD *)v70-- - 1);
      *((_QWORD *)v78-- - 1) = v80;
    }
    *(_QWORD *)a3 = v78;
    *((_QWORD *)a3 + 1) = v71;
    *((_QWORD *)a3 + 2) = v79;
    if (v72)
      operator delete(v72);
  }
  else
  {
    *v70 = v20;
    v71 = v70 + 1;
  }
  *((_QWORD *)a3 + 1) = v71;
  v82 = (double *)*((_QWORD *)a4 + 1);
  v81 = *((_QWORD *)a4 + 2);
  if ((unint64_t)v82 < v81)
  {
    *v82 = v22;
    v83 = v82 + 1;
    goto LABEL_84;
  }
  v84 = *(double **)a4;
  v85 = ((uint64_t)v82 - *(_QWORD *)a4) >> 3;
  v86 = v85 + 1;
  if ((unint64_t)(v85 + 1) >> 61)
LABEL_85:
    abort();
  v87 = v81 - (_QWORD)v84;
  if (v87 >> 2 > v86)
    v86 = v87 >> 2;
  if ((unint64_t)v87 >= 0x7FFFFFFFFFFFFFF8)
    v88 = 0x1FFFFFFFFFFFFFFFLL;
  else
    v88 = v86;
  if (v88)
  {
    v89 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<EQKitLayoutContext *>>((uint64_t)a4 + 16, v88);
    v84 = *(double **)a4;
    v82 = (double *)*((_QWORD *)a4 + 1);
  }
  else
  {
    v89 = 0;
  }
  v90 = (double *)&v89[8 * v85];
  v91 = &v89[8 * v88];
  *v90 = v22;
  v83 = v90 + 1;
  while (v82 != v84)
  {
    v92 = *((_QWORD *)v82-- - 1);
    *((_QWORD *)v90-- - 1) = v92;
  }
  *(_QWORD *)a4 = v90;
  *((_QWORD *)a4 + 1) = v83;
  *((_QWORD *)a4 + 2) = v91;
  if (v84)
    operator delete(v84);
LABEL_84:
  *((_QWORD *)a4 + 1) = v83;
}

- (CGPoint)getControlKnobPosition:(unint64_t)a3
{
  float64x2_t v5;
  double v6;
  double v7;
  id v8;
  double b;
  double a;
  double d;
  double c;
  double ty;
  double tx;
  const void *v15;
  int64_t v16;
  char *v17;
  const void *v18;
  int64_t v19;
  char *v20;
  double v21;
  double v22;
  float64x2_t v23;
  float64x2_t v24;
  double v25;
  double v26;
  float64x2_t v27;
  double v28;
  double v29;
  float64x2_t v30;
  float64x2_t v31;
  CGAffineTransform v32;
  CGAffineTransform v33;
  void *__p;
  void *v35;
  uint64_t v36;
  void *v37;
  void *__dst;
  uint64_t v39;
  CGAffineTransform v40;
  _BYTE *v41;
  _BYTE *v42;
  uint64_t v43;
  _BYTE *v44;
  _BYTE *v45;
  uint64_t v46;
  CGPoint result;

  -[TSDConnectionLinePathSource getControlKnobPosition:](-[TSDConnectionLineAbstractLayout connectedPathSource](self, "connectedPathSource"), "getControlKnobPosition:", a3);
  v7 = v6;
  if (a3 == 12)
  {
    v28 = v5.f64[0];
    v44 = 0;
    v45 = 0;
    v46 = 0;
    v41 = 0;
    v42 = 0;
    v43 = 0;
    -[TSDConnectionLineOrthogonalLayout addEndpointSnapsToXs:andYs:](self, "addEndpointSnapsToXs:andYs:", &v44, &v41);
    memset(&v40, 0, sizeof(v40));
    v8 = -[TSDLayout pureGeometry](self, "pureGeometry");
    if (v8)
    {
      objc_msgSend(v8, "transform");
      b = v40.b;
      a = v40.a;
      d = v40.d;
      c = v40.c;
      ty = v40.ty;
      tx = v40.tx;
    }
    else
    {
      memset(&v40, 0, sizeof(v40));
      ty = 0.0;
      tx = 0.0;
      d = 0.0;
      c = 0.0;
      b = 0.0;
      a = 0.0;
    }
    v37 = 0;
    __dst = 0;
    v39 = 0;
    v15 = v44;
    v16 = v45 - v44;
    if (v45 != v44)
    {
      std::vector<unsigned long>::__vallocate[abi:nn180100](&v37, v16 >> 3);
      v17 = (char *)__dst;
      memmove(__dst, v15, v16);
      __dst = &v17[8 * (v16 >> 3)];
    }
    __p = 0;
    v35 = 0;
    v36 = 0;
    v18 = v41;
    v19 = v42 - v41;
    if (v42 != v41)
    {
      std::vector<unsigned long>::__vallocate[abi:nn180100](&__p, v19 >> 3);
      v20 = (char *)v35;
      memmove(v35, v18, v19);
      v35 = &v20[8 * (v19 >> 3)];
    }
    -[TSDConnectionLineOrthogonalLayout axisSnapPoint:toXs:toYs:withThreshold:](self, "axisSnapPoint:toXs:toYs:withThreshold:", &v37, &__p, tx + v7 * c + a * v28, ty + v7 * d + b * v28, 2.0);
    v26 = v22;
    v29 = v21;
    if (__p)
    {
      v35 = __p;
      operator delete(__p);
    }
    if (v37)
    {
      __dst = v37;
      operator delete(v37);
    }
    v32 = v40;
    CGAffineTransformInvert(&v33, &v32);
    v23 = vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v33.c, v26), *(float64x2_t *)&v33.a, v29);
    v24 = *(float64x2_t *)&v33.tx;
    if (v41)
    {
      v42 = v41;
      v27 = *(float64x2_t *)&v33.tx;
      v30 = v23;
      operator delete(v41);
      v24 = v27;
      v23 = v30;
    }
    v5 = vaddq_f64(v24, v23);
    if (v44)
    {
      v45 = v44;
      v31 = v5;
      operator delete(v44);
      v5 = v31;
    }
    v7 = v5.f64[1];
  }
  v25 = v7;
  result.x = v5.f64[0];
  result.y = v25;
  return result;
}

@end
