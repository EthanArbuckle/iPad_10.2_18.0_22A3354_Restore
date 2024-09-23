@implementation CRLBezierPathSimplifier

- (CRLBezierPathSimplifier)initWithPath:(id)a3 threshold:(double)a4
{
  id v7;
  CRLBezierPathSimplifier *v8;
  CRLBezierPathSimplifier *v9;
  CRLBezierPath *v10;
  CRLBezierPath *simplifiedPath;
  objc_super v13;

  v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CRLBezierPathSimplifier;
  v8 = -[CRLBezierPathSimplifier init](&v13, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_path, a3);
    v9->_threshold = a4;
    v10 = objc_alloc_init(CRLBezierPath);
    simplifiedPath = v9->_simplifiedPath;
    v9->_simplifiedPath = v10;

  }
  return v9;
}

- (void)addPointsForElementOfType:(int64_t)a3
{
  uint64_t *v5;
  uint64_t v6;
  double v7;
  double v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double *v14;
  double v15;
  CRLPointVector3 *v16;
  double y;
  CRLPointVector3 *v18;
  double v19;
  double v20;
  CRLPointVector3 *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void **v27;
  void *v28;
  float v29;
  void *v30;
  id v31;
  __int128 v32;
  unint64_t v33;
  _QWORD *v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  unint64_t v39;
  double v40;
  double v41;
  float v42;
  float v43;
  float v44;
  float v45;
  float *v46;
  float *v47;
  double *v48;
  double v49;
  double v50;
  double v51;
  double *v52;
  uint64_t v53;
  unint64_t v54;
  uint64_t v55;
  unint64_t v56;
  char *v57;
  double *v58;
  double *v59;
  unsigned int v60;
  NSObject *v61;
  void *v62;
  void *v63;
  void *v64;
  double *v65;
  double *v66;
  uint64_t v67;
  unint64_t v68;
  uint64_t v69;
  unint64_t v70;
  char *v71;
  double *v72;
  double *v73;
  char *v74;
  CRLPointVector3 *v75;
  double v76;
  double v77;
  double v78;
  double v79;
  float *v80;
  void *v81;
  void *v82;
  void *v83;
  _QWORD *v84;
  float v85;
  float v86;
  float v87;
  float v88;
  double v89;
  float v90;
  float *v91;
  float *i;
  float v93;
  void **v94;
  void **v95;
  double v96;
  double v97;
  double v98;
  uint64_t v99;
  double *v100;
  double *v101;
  double *v102;
  double *v103;
  uint64_t v104;
  unint64_t v105;
  uint64_t v106;
  unint64_t v107;
  char *v108;
  double *v109;
  double *v110;
  void **v111;
  double **v112;
  uint64_t v113;
  double *v114;
  double *v115;
  double *v116;
  double *v117;
  uint64_t v118;
  unint64_t v119;
  uint64_t v120;
  unint64_t v121;
  char *v122;
  double *v123;
  double *v124;
  _QWORD *v125;
  __int128 v126;
  float v127;
  uint64_t v128;
  uint64_t v129;
  double v130;
  double x;
  void *v132;
  float *v133;
  float *v134;
  uint64_t v135;
  uint8_t buf[4];
  unsigned int v137;
  __int16 v138;
  const char *v139;
  __int16 v140;
  const char *v141;
  __int16 v142;
  int v143;
  void *__p[2];
  __int128 v145;
  __int128 v146;

  v5 = -[CRLBezierPathSimplifier pointsToSimplify](self, "pointsToSimplify");
  v128 = *v5;
  v129 = v5[1];
  v6 = *((_QWORD *)-[CRLBezierPathSimplifier pointsToSimplify](self, "pointsToSimplify") + 1);
  v7 = *(double *)(v6 - 16);
  v8 = *(double *)(v6 - 8);
  if (a3 == 2)
  {
    v9 = 0;
    v10 = *(double *)(v6 - 8);
    v11 = *(double *)(v6 - 16);
    v12 = v10;
    v13 = v11;
    do
    {
      v14 = (double *)((char *)-[CRLBezierPathSimplifier associatedPoints](self, "associatedPoints") + v9);
      v15 = v14[1];
      v11 = fmin(v11, *v14);
      v10 = fmin(v10, v15);
      v13 = fmax(v13, *v14);
      v12 = fmax(v12, v15);
      v9 += 16;
    }
    while (v9 != 48);
    if (!sub_10005FDF0(v11, v10, v13, v12))
    {
      v16 = -[CRLBezierPathSimplifier associatedPoints](self, "associatedPoints");
      y = v16->v[0].y;
      x = v16->v[0].x;
      v18 = -[CRLBezierPathSimplifier associatedPoints](self, "associatedPoints");
      v19 = v18->v[1].x;
      v20 = v18->v[1].y;
      v21 = -[CRLBezierPathSimplifier associatedPoints](self, "associatedPoints");
      v22 = v21->v[2].x;
      v23 = v21->v[2].y;
      -[CRLBezierPathSimplifier threshold](self, "threshold");
      v25 = v24;
      -[CRLBezierPathSimplifier threshold](self, "threshold");
      v130 = v26;
      v27 = -[CRLBezierPathSimplifier pointsToSimplify](self, "pointsToSimplify");
      v133 = 0;
      v134 = 0;
      v135 = 0;
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPath](CRLBezierPath, "bezierPath"));
      v132 = v28;
      objc_msgSend(v28, "moveToPoint:", v7, v8);
      objc_msgSend(v28, "curveToPoint:controlPoint1:controlPoint2:", v22, v23, x, y, v19, v20);
      v29 = v25;
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "bezierPathByFlatteningPathWithFlatness:", (float)(v29 * 0.5)));
      v31 = objc_msgSend(v30, "elementCount");
      if (v31)
      {
        v33 = 0;
        v34 = v27 + 2;
        *(float *)&v32 = v130 * 4.0;
        v127 = *(float *)&v32;
        v36 = CGPointZero.x;
        v35 = CGPointZero.y;
        v37 = (float)(*(float *)&v32 * *(float *)&v32);
        *(_QWORD *)&v32 = 67109378;
        v126 = v32;
        do
        {
          *(_OWORD *)__p = xmmword_100EEC438;
          v145 = xmmword_100EEC438;
          v146 = xmmword_100EEC438;
          v38 = v30;
          v39 = (unint64_t)objc_msgSend(v30, "elementAtIndex:associatedPoints:", v33, __p, v126);
          if (v39 | v33)
          {
            if (v33 && v39 == 1)
            {
              v40 = *(double *)__p;
              v41 = *(double *)&__p[1];
              if (sub_10006010C(v36, v35, *(double *)__p, *(double *)&__p[1]) <= v37)
              {
                v48 = (double *)v27[1];
              }
              else
              {
                v42 = v36;
                v43 = v35;
                v44 = v40;
                v45 = v41;
                sub_1001126D4((uint64_t)&v133, v42, v43, v44, v45, v127);
                v46 = v133;
                v47 = v134;
                v48 = (double *)v27[1];
                while (v46 != v47)
                {
                  v49 = *v46;
                  v50 = v40 * v49 + v36 * (1.0 - v49);
                  v51 = v41 * v49 + v35 * (1.0 - v49);
                  if ((unint64_t)v48 >= *v34)
                  {
                    v52 = (double *)*v27;
                    v53 = ((char *)v48 - (_BYTE *)*v27) >> 4;
                    v54 = v53 + 1;
                    if ((unint64_t)(v53 + 1) >> 60)
                      sub_100007810();
                    v55 = *v34 - (_QWORD)v52;
                    if (v55 >> 3 > v54)
                      v54 = v55 >> 3;
                    if ((unint64_t)v55 >= 0x7FFFFFFFFFFFFFF0)
                      v56 = 0xFFFFFFFFFFFFFFFLL;
                    else
                      v56 = v54;
                    if (v56)
                    {
                      v57 = (char *)sub_10001FB2C((uint64_t)(v27 + 2), v56);
                      v52 = (double *)*v27;
                      v48 = (double *)v27[1];
                    }
                    else
                    {
                      v57 = 0;
                    }
                    v58 = (double *)&v57[16 * v53];
                    *v58 = v50;
                    v58[1] = v51;
                    v59 = v58;
                    if (v48 == v52)
                    {
                      v28 = v132;
                    }
                    else
                    {
                      v28 = v132;
                      do
                      {
                        *((_OWORD *)v59 - 1) = *((_OWORD *)v48 - 1);
                        v59 -= 2;
                        v48 -= 2;
                      }
                      while (v48 != v52);
                      v52 = (double *)*v27;
                    }
                    v48 = v58 + 2;
                    *v27 = v59;
                    v27[1] = v58 + 2;
                    v27[2] = &v57[16 * v56];
                    if (v52)
                      operator delete(v52);
                  }
                  else
                  {
                    *v48 = v50;
                    v48[1] = v51;
                    v48 += 2;
                  }
                  v27[1] = v48;
                  ++v46;
                }
              }
              if ((unint64_t)v48 >= *v34)
              {
                v66 = (double *)*v27;
                v67 = ((char *)v48 - (_BYTE *)*v27) >> 4;
                v68 = v67 + 1;
                if ((unint64_t)(v67 + 1) >> 60)
                  sub_100007810();
                v69 = *v34 - (_QWORD)v66;
                if (v69 >> 3 > v68)
                  v68 = v69 >> 3;
                if ((unint64_t)v69 >= 0x7FFFFFFFFFFFFFF0)
                  v70 = 0xFFFFFFFFFFFFFFFLL;
                else
                  v70 = v68;
                if (v70)
                {
                  v71 = (char *)sub_10001FB2C((uint64_t)(v27 + 2), v70);
                  v66 = (double *)*v27;
                  v48 = (double *)v27[1];
                }
                else
                {
                  v71 = 0;
                }
                v72 = (double *)&v71[16 * v67];
                *v72 = v40;
                v72[1] = v41;
                v73 = v72;
                if (v48 != v66)
                {
                  do
                  {
                    *((_OWORD *)v73 - 1) = *((_OWORD *)v48 - 1);
                    v73 -= 2;
                    v48 -= 2;
                  }
                  while (v48 != v66);
                  v66 = (double *)*v27;
                }
                v65 = v72 + 2;
                *v27 = v73;
                v27[1] = v72 + 2;
                v27[2] = &v71[16 * v70];
                if (v66)
                  operator delete(v66);
              }
              else
              {
                *v48 = v40;
                v48[1] = v41;
                v65 = v48 + 2;
              }
              v27[1] = v65;
            }
            else
            {
              v60 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
              if (qword_10147E370 != -1)
                dispatch_once(&qword_10147E370, &stru_1012390B0);
              v61 = off_1013D9070;
              if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 67109890;
                v137 = v60;
                v138 = 2082;
                v139 = "void CRLGetCGPointsOnFlattenedCubicBezierSegment(CGPoint, CGPoint, CGPoint, CGPoint, float, float"
                       ", std::vector<CGPoint> &)";
                v140 = 2082;
                v141 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPathSimplifier.mm";
                v142 = 1024;
                v143 = 59;
                _os_log_error_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Unexpected element/index combination in flattened path", buf, 0x22u);
                if (qword_10147E370 != -1)
                  dispatch_once(&qword_10147E370, &stru_1012390D0);
              }
              v62 = off_1013D9070;
              if (os_log_type_enabled((os_log_t)v62, OS_LOG_TYPE_ERROR))
              {
                v74 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
                *(_DWORD *)buf = v126;
                v137 = v60;
                v138 = 2114;
                v139 = v74;
                _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v62, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

              }
              v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "void CRLGetCGPointsOnFlattenedCubicBezierSegment(CGPoint, CGPoint, CGPoint, CGPoint, float, float, std::vector<CGPoint> &)"));
              v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPathSimplifier.mm"));
              +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v63, v64, 59, 0, "Unexpected element/index combination in flattened path");

              v40 = v36;
              v41 = v35;
            }
          }
          else
          {
            v40 = *(double *)__p;
            v41 = *(double *)&__p[1];
          }
          v30 = v38;
          ++v33;
          v35 = v41;
          v36 = v40;
        }
        while ((id)v33 != v31);
      }

      v80 = v133;
      if (v133)
      {
        v134 = v133;
LABEL_112:
        operator delete(v80);
      }
    }
  }
  else
  {
    v75 = -[CRLBezierPathSimplifier associatedPoints](self, "associatedPoints");
    v76 = v75->v[0].x;
    v77 = v75->v[0].y;
    if (a3 != 1)
    {
      if (a3 == 3)
      {
        -[CRLBezierPathSimplifier startOfSubpath](self, "startOfSubpath");
        v76 = v78;
        v77 = v79;
      }
      else
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101238EB0);
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100DFBC00();
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101238ED0);
        v81 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)v81, OS_LOG_TYPE_ERROR))
        {
          objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
          sub_100DE7E60();
        }

        v82 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBezierPathSimplifier addPointsForElementOfType:]"));
        v83 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPathSimplifier.mm"));
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v82, v83, 314, 0, "Unexpected Bezier element type");

      }
    }
    v84 = -[CRLBezierPathSimplifier pointsToSimplify](self, "pointsToSimplify");
    if (!sub_10005FDF0(*(double *)(v84[1] - 16), *(double *)(v84[1] - 8), v76, v77))
    {
      __p[0] = 0;
      __p[1] = 0;
      *(_QWORD *)&v145 = 0;
      -[CRLBezierPathSimplifier threshold](self, "threshold");
      v85 = v77;
      v86 = v76;
      v87 = v8;
      v88 = v7;
      v90 = v89;
      sub_1001126D4((uint64_t)__p, v88, v87, v86, v85, v90);
      v91 = (float *)__p[0];
      for (i = (float *)__p[1]; v91 != i; ++v91)
      {
        v93 = *v91;
        v94 = -[CRLBezierPathSimplifier pointsToSimplify](self, "pointsToSimplify");
        v95 = v94;
        v96 = 1.0 - v93;
        v97 = v76 * v93 + v7 * v96;
        v98 = v77 * v93 + v8 * v96;
        v99 = (uint64_t)(v94 + 2);
        v100 = (double *)v94[2];
        v101 = (double *)v94[1];
        if (v101 >= v100)
        {
          v103 = (double *)*v94;
          v104 = ((char *)v101 - (_BYTE *)*v95) >> 4;
          v105 = v104 + 1;
          if ((unint64_t)(v104 + 1) >> 60)
            sub_100007810();
          v106 = (char *)v100 - (char *)v103;
          if (v106 >> 3 > v105)
            v105 = v106 >> 3;
          if ((unint64_t)v106 >= 0x7FFFFFFFFFFFFFF0)
            v107 = 0xFFFFFFFFFFFFFFFLL;
          else
            v107 = v105;
          if (v107)
          {
            v108 = (char *)sub_10001FB2C(v99, v107);
            v103 = (double *)*v95;
            v101 = (double *)v95[1];
          }
          else
          {
            v108 = 0;
          }
          v109 = (double *)&v108[16 * v104];
          *v109 = v97;
          v109[1] = v98;
          v110 = v109;
          if (v101 != v103)
          {
            do
            {
              *((_OWORD *)v110 - 1) = *((_OWORD *)v101 - 1);
              v110 -= 2;
              v101 -= 2;
            }
            while (v101 != v103);
            v103 = (double *)*v95;
          }
          v102 = v109 + 2;
          *v95 = v110;
          v95[1] = v109 + 2;
          v95[2] = &v108[16 * v107];
          if (v103)
            operator delete(v103);
        }
        else
        {
          *v101 = v97;
          v101[1] = v98;
          v102 = v101 + 2;
        }
        v95[1] = v102;
      }
      v111 = -[CRLBezierPathSimplifier pointsToSimplify](self, "pointsToSimplify");
      v112 = (double **)v111;
      v113 = (uint64_t)(v111 + 2);
      v114 = (double *)v111[2];
      v115 = (double *)v111[1];
      if (v115 >= v114)
      {
        v117 = (double *)*v111;
        v118 = ((char *)v115 - (char *)*v112) >> 4;
        v119 = v118 + 1;
        if ((unint64_t)(v118 + 1) >> 60)
          sub_100007810();
        v120 = (char *)v114 - (char *)v117;
        if (v120 >> 3 > v119)
          v119 = v120 >> 3;
        if ((unint64_t)v120 >= 0x7FFFFFFFFFFFFFF0)
          v121 = 0xFFFFFFFFFFFFFFFLL;
        else
          v121 = v119;
        if (v121)
        {
          v122 = (char *)sub_10001FB2C(v113, v121);
          v117 = *v112;
          v115 = v112[1];
        }
        else
        {
          v122 = 0;
        }
        v123 = (double *)&v122[16 * v118];
        v124 = (double *)&v122[16 * v121];
        *v123 = v76;
        v123[1] = v77;
        v116 = v123 + 2;
        if (v115 != v117)
        {
          do
          {
            *((_OWORD *)v123 - 1) = *((_OWORD *)v115 - 1);
            v123 -= 2;
            v115 -= 2;
          }
          while (v115 != v117);
          v117 = *v112;
        }
        *v112 = v123;
        v112[1] = v116;
        v112[2] = v124;
        if (v117)
          operator delete(v117);
      }
      else
      {
        *v115 = v76;
        v115[1] = v77;
        v116 = v115 + 2;
      }
      v112[1] = v116;
      v80 = (float *)__p[0];
      if (__p[0])
      {
        __p[1] = __p[0];
        goto LABEL_112;
      }
    }
  }
  v125 = -[CRLBezierPathSimplifier pointsToSimplify](self, "pointsToSimplify");
  -[CRLBezierPathSimplifier setTailLength:](self, "setTailLength:", ((uint64_t)(v125[1] - *v125) >> 4) - ((v129 - v128) >> 4));
}

- (BOOL)findApproximationForPointsWithTailElementType:(int64_t)a3
{
  _QWORD *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  CRLPointVector3 *v12;
  CRLPointVector3 *v13;
  CRLPointSequenceCubicBezierApproximator *v14;
  double v15;
  double v16;
  double v17;

  v5 = -[CRLBezierPathSimplifier pointsToSimplify](self, "pointsToSimplify");
  if (v5[1] - *v5 <= 0x10uLL)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101238EF0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DFBC80();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101238F10);
    v6 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DE7E60();
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBezierPathSimplifier findApproximationForPointsWithTailElementType:]"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPathSimplifier.mm"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 330, 0, "At least 2 points expected");

  }
  v9 = -[CRLBezierPathSimplifier pointsToSimplify](self, "pointsToSimplify");
  v11 = *v9;
  v10 = v9[1];
  if ((id)((v10 - v11) >> 4) == (char *)-[CRLBezierPathSimplifier tailLength](self, "tailLength") + 1)
  {
    if (a3 == 2)
    {
      -[CRLBezierPathSimplifier setSolutionElementType:](self, "setSolutionElementType:", 2);
      v12 = -[CRLBezierPathSimplifier associatedPoints](self, "associatedPoints");
      -[CRLBezierPathSimplifier setControlPoint1:](self, "setControlPoint1:", v12->v[0].x, v12->v[0].y);
      v13 = -[CRLBezierPathSimplifier associatedPoints](self, "associatedPoints");
      -[CRLBezierPathSimplifier setControlPoint2:](self, "setControlPoint2:", v13->v[1].x, v13->v[1].y);
    }
    else
    {
      -[CRLBezierPathSimplifier setSolutionElementType:](self, "setSolutionElementType:", 1);
    }
  }
  else
  {
    v14 = -[CRLPointSequenceCubicBezierApproximator initWithDataPoints:]([CRLPointSequenceCubicBezierApproximator alloc], "initWithDataPoints:", &self->_pointsToSimplify);
    -[CRLPointSequenceCubicBezierApproximator run](v14, "run");
    -[CRLPointSequenceCubicBezierApproximator approximationError](v14, "approximationError");
    v16 = v15;
    -[CRLBezierPathSimplifier threshold](self, "threshold");
    if (v16 > v17)
    {

      return 0;
    }
    -[CRLBezierPathSimplifier setSolutionElementType:](self, "setSolutionElementType:", 2);
    -[CRLPointSequenceCubicBezierApproximator controlPoint1](v14, "controlPoint1");
    -[CRLBezierPathSimplifier setControlPoint1:](self, "setControlPoint1:");
    -[CRLPointSequenceCubicBezierApproximator controlPoint2](v14, "controlPoint2");
    -[CRLBezierPathSimplifier setControlPoint2:](self, "setControlPoint2:");

  }
  -[CRLBezierPathSimplifier setTailLength:](self, "setTailLength:", 0);
  return 1;
}

- (void)resetSolution
{
  -[CRLBezierPathSimplifier setSolutionElementType:](self, "setSolutionElementType:", 3);
  -[CRLBezierPathSimplifier setControlPoint2:](self, "setControlPoint2:", INFINITY, INFINITY);
  -[CRLBezierPathSimplifier setControlPoint1:](self, "setControlPoint1:", INFINITY, INFINITY);
}

- (void)outputCurrentSolution
{
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  int v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD *v30;
  char *v31;
  uint64_t v32;
  unint64_t v33;
  _BYTE *v34;
  _BYTE *v35;
  int64_t v36;
  uint8_t buf[48];

  v3 = -[CRLBezierPathSimplifier pointsToSimplify](self, "pointsToSimplify");
  v4 = v3[1] - *v3;
  if (-[CRLBezierPathSimplifier tailLength](self, "tailLength") + 2 > v4 >> 4)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101238F30);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DFBE04();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101238F50);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DE7E60();
    }

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBezierPathSimplifier outputCurrentSolution]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPathSimplifier.mm"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 366, 0, "At least 2 points expected before the tail");

  }
  v8 = *((_QWORD *)-[CRLBezierPathSimplifier pointsToSimplify](self, "pointsToSimplify") + 1);
  v9 = v8 - 16 * -[CRLBezierPathSimplifier tailLength](self, "tailLength");
  v11 = *(double *)(v9 - 16);
  v10 = *(double *)(v9 - 8);
  if ((id)-[CRLBezierPathSimplifier solutionElementType](self, "solutionElementType") == (id)2)
  {
    -[CRLBezierPathSimplifier controlPoint1](self, "controlPoint1");
    if (!sub_100061860(v12, v13)
      || (-[CRLBezierPathSimplifier controlPoint2](self, "controlPoint2"), (sub_100061860(v14, v15) & 1) == 0))
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101238F70);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DFBD00();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101238F90);
      v16 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_ERROR))
      {
        objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
        sub_100DE7E60();
      }

      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBezierPathSimplifier outputCurrentSolution]"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPathSimplifier.mm"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v17, v18, 369, 0, "Undefined cubic control points");

    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBezierPathSimplifier simplifiedPath](self, "simplifiedPath"));
    -[CRLBezierPathSimplifier controlPoint1](self, "controlPoint1");
    v21 = v20;
    v23 = v22;
    -[CRLBezierPathSimplifier controlPoint2](self, "controlPoint2");
    objc_msgSend(v19, "curveToPoint:controlPoint1:controlPoint2:", v11, v10, v21, v23, v24, v25);
  }
  else if ((id)-[CRLBezierPathSimplifier solutionElementType](self, "solutionElementType") == (id)1)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBezierPathSimplifier simplifiedPath](self, "simplifiedPath"));
    objc_msgSend(v19, "lineToPoint:", v11, v10);
  }
  else
  {
    v26 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101238FB0);
    v27 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v27, OS_LOG_TYPE_ERROR))
      sub_100DFBD80((int)-[CRLBezierPathSimplifier solutionElementType](self, "solutionElementType"), buf, v26, (os_log_t)v27);

    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101238FD0);
    v28 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v28, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DE7E60();
    }

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBezierPathSimplifier outputCurrentSolution]"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPathSimplifier.mm"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v19, v29, 374, 0, "Unexpected solution element type: %d", -[CRLBezierPathSimplifier solutionElementType](self, "solutionElementType"));

  }
  v30 = -[CRLBezierPathSimplifier pointsToSimplify](self, "pointsToSimplify");
  v31 = *(char **)-[CRLBezierPathSimplifier pointsToSimplify](self, "pointsToSimplify");
  v32 = *((_QWORD *)-[CRLBezierPathSimplifier pointsToSimplify](self, "pointsToSimplify") + 1);
  v33 = -[CRLBezierPathSimplifier tailLength](self, "tailLength");
  if (v31 != (char *)(v32 + 16 * ~v33))
  {
    v34 = (_BYTE *)(v32 + 16 * ~v33);
    v35 = (_BYTE *)v30[1];
    v36 = v35 - v34;
    if (v35 != v34)
      memmove(v31, v34, v35 - v34);
    v30[1] = &v31[v36];
  }
  -[CRLBezierPathSimplifier resetSolution](self, "resetSolution");
}

- (void)run
{
  void *v3;
  char *v4;
  _QWORD *v5;
  __int128 v6;
  char *v7;
  CRLPointVector3 *v8;
  CRLPointVector3 *v9;
  void *v10;
  id v11;
  _BOOL4 v12;
  void *v13;
  id v14;
  _QWORD *v15;
  uint64_t v16;
  unsigned int v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  unsigned int v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  unsigned int v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  CRLPointVector3 *v32;
  void **v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  char *v39;
  _QWORD *v40;
  _QWORD *v41;
  _QWORD *v42;
  void *v43;
  char *v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  unint64_t v48;
  char *v49;
  char *v50;
  char *v51;
  char *v52;
  char *v53;
  char *v54;
  __int128 v55;
  uint8_t buf[4];
  unsigned int v57;
  __int16 v58;
  const char *v59;
  __int16 v60;
  const char *v61;
  __int16 v62;
  int v63;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBezierPathSimplifier path](self, "path"));
  v4 = (char *)objc_msgSend(v3, "elementCount");

  v5 = -[CRLBezierPathSimplifier pointsToSimplify](self, "pointsToSimplify");
  v5[1] = *v5;
  if (v4)
  {
    v7 = 0;
    *(_QWORD *)&v6 = 67109378;
    v55 = v6;
    while (1)
    {
      v8 = -[CRLBezierPathSimplifier associatedPoints](self, "associatedPoints", v55);
      v8->v[2] = (CGPoint)xmmword_100EEC438;
      v9 = -[CRLBezierPathSimplifier associatedPoints](self, "associatedPoints");
      v9->v[1] = v8->v[2];
      *(CGPoint *)-[CRLBezierPathSimplifier associatedPoints](self, "associatedPoints") = v9->v[1];
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBezierPathSimplifier path](self, "path"));
      v11 = objc_msgSend(v10, "elementAtIndex:associatedPoints:", v7, -[CRLBezierPathSimplifier associatedPoints](self, "associatedPoints"));

      ++v7;
      v12 = 1;
      if (v7 != v4 && v11 != (id)3)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBezierPathSimplifier path](self, "path"));
        v14 = objc_msgSend(v13, "elementAtIndex:", v7);

        v12 = v14 == 0;
      }
      v15 = -[CRLBezierPathSimplifier pointsToSimplify](self, "pointsToSimplify");
      v16 = v15[1];
      if (!v11)
      {
        if (v16 != *v15)
        {
          v27 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_101238FF0);
          v28 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109890;
            v57 = v27;
            v58 = 2082;
            v59 = "-[CRLBezierPathSimplifier run]";
            v60 = 2082;
            v61 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPathSimplifier.mm";
            v62 = 1024;
            v63 = 392;
            _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Subpath should start with zero points", buf, 0x22u);
          }
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_101239010);
          v29 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)v29, OS_LOG_TYPE_ERROR))
          {
            v53 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
            *(_DWORD *)buf = v55;
            v57 = v27;
            v58 = 2114;
            v59 = v53;
            _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v29, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

          }
          v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBezierPathSimplifier run]"));
          v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPathSimplifier.mm"));
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v30, v31, 392, 0, "Subpath should start with zero points");

        }
        if (v12)
          goto LABEL_66;
        -[CRLBezierPathSimplifier resetSolution](self, "resetSolution");
        v32 = -[CRLBezierPathSimplifier associatedPoints](self, "associatedPoints");
        -[CRLBezierPathSimplifier setStartOfSubpath:](self, "setStartOfSubpath:", v32->v[0].x, v32->v[0].y);
        v33 = -[CRLBezierPathSimplifier pointsToSimplify](self, "pointsToSimplify");
        -[CRLBezierPathSimplifier startOfSubpath](self, "startOfSubpath");
        v36 = v34;
        v37 = v35;
        v38 = (char *)v33[2];
        v39 = (char *)v33[1];
        if (v39 >= v38)
        {
          v44 = (char *)*v33;
          v45 = (v39 - (_BYTE *)*v33) >> 4;
          v46 = v45 + 1;
          if ((unint64_t)(v45 + 1) >> 60)
            sub_100007810();
          v47 = v38 - v44;
          if (v47 >> 3 > v46)
            v46 = v47 >> 3;
          if ((unint64_t)v47 >= 0x7FFFFFFFFFFFFFF0)
            v48 = 0xFFFFFFFFFFFFFFFLL;
          else
            v48 = v46;
          if (v48)
          {
            v49 = (char *)sub_10001FB2C((uint64_t)(v33 + 2), v48);
            v44 = (char *)*v33;
            v39 = (char *)v33[1];
          }
          else
          {
            v49 = 0;
          }
          v50 = &v49[16 * v45];
          *(_QWORD *)v50 = v36;
          *((_QWORD *)v50 + 1) = v37;
          v51 = v50;
          if (v39 != v44)
          {
            do
            {
              *((_OWORD *)v51 - 1) = *((_OWORD *)v39 - 1);
              v51 -= 16;
              v39 -= 16;
            }
            while (v39 != v44);
            v44 = (char *)*v33;
          }
          v40 = v50 + 16;
          *v33 = v51;
          v33[1] = v50 + 16;
          v33[2] = &v49[16 * v48];
          if (v44)
            operator delete(v44);
        }
        else
        {
          *(_QWORD *)v39 = v34;
          *((_QWORD *)v39 + 1) = v35;
          v40 = v39 + 16;
        }
        v33[1] = v40;
        v43 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBezierPathSimplifier simplifiedPath](self, "simplifiedPath"));
        -[CRLBezierPathSimplifier startOfSubpath](self, "startOfSubpath");
        objc_msgSend(v43, "moveToPoint:");
        goto LABEL_65;
      }
      if (v16 == *v15)
      {
        v17 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101239030);
        v18 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109890;
          v57 = v17;
          v58 = 2082;
          v59 = "-[CRLBezierPathSimplifier run]";
          v60 = 2082;
          v61 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPathSimplifier.mm";
          v62 = 1024;
          v63 = 400;
          _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Subpath should have been started", buf, 0x22u);
        }
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101239050);
        v19 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_ERROR))
        {
          v52 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
          *(_DWORD *)buf = v55;
          v57 = v17;
          v58 = 2114;
          v59 = v52;
          _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v19, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

        }
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBezierPathSimplifier run]"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPathSimplifier.mm"));
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v20, v21, 400, 0, "Subpath should have been started");

      }
      -[CRLBezierPathSimplifier addPointsForElementOfType:](self, "addPointsForElementOfType:", v11);
      if (!-[CRLBezierPathSimplifier tailLength](self, "tailLength"))
        break;
      if (!-[CRLBezierPathSimplifier findApproximationForPointsWithTailElementType:](self, "findApproximationForPointsWithTailElementType:", v11))
      {
        -[CRLBezierPathSimplifier outputCurrentSolution](self, "outputCurrentSolution");
        if (!-[CRLBezierPathSimplifier findApproximationForPointsWithTailElementType:](self, "findApproximationForPointsWithTailElementType:", v11))
        {
          v22 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_101239070);
          v23 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109890;
            v57 = v22;
            v58 = 2082;
            v59 = "-[CRLBezierPathSimplifier run]";
            v60 = 2082;
            v61 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPathSimplifier.mm";
            v62 = 1024;
            v63 = 407;
            _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d One element should always produce success", buf, 0x22u);
          }
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_101239090);
          v24 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)v24, OS_LOG_TYPE_ERROR))
          {
            v54 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
            *(_DWORD *)buf = v55;
            v57 = v22;
            v58 = 2114;
            v59 = v54;
            _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v24, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

          }
          v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBezierPathSimplifier run]"));
          v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPathSimplifier.mm"));
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v25, v26, 407, 0, "One element should always produce success");

        }
      }
      if (v12)
        goto LABEL_46;
LABEL_48:
      if (v11 == (id)3)
      {
        v43 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBezierPathSimplifier simplifiedPath](self, "simplifiedPath"));
        objc_msgSend(v43, "closePath");
LABEL_65:

      }
LABEL_66:
      if (v7 == v4)
        return;
    }
    if (!v12)
      goto LABEL_48;
    v41 = -[CRLBezierPathSimplifier pointsToSimplify](self, "pointsToSimplify");
    if (v41[1] - *v41 != 16)
LABEL_46:
      -[CRLBezierPathSimplifier outputCurrentSolution](self, "outputCurrentSolution");
    v42 = -[CRLBezierPathSimplifier pointsToSimplify](self, "pointsToSimplify");
    v42[1] = *v42;
    goto LABEL_48;
  }
}

+ (id)cleanPathForPath:(id)a3
{
  id v3;
  CRLBezierPath *v4;
  double x;
  double y;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  id v11;
  CGPoint v12;
  double v13;
  double v14;
  _BOOL4 v15;
  double v16;
  double v17;
  CGPoint v19;
  CGPoint v20;
  CGPoint v21;
  CGPoint v22;

  v3 = a3;
  v4 = objc_alloc_init(CRLBezierPath);
  x = CGPointZero.x;
  y = CGPointZero.y;
  v7 = (uint64_t)objc_msgSend(v3, "elementCount");
  if (v7 >= 1)
  {
    v8 = 0;
    v19.x = CGPointZero.x;
    v19.y = y;
    while (1)
    {
      v22 = CGPointZero;
      v21 = v22;
      v20 = v22;
      switch((unint64_t)objc_msgSend(v3, "elementAtIndex:associatedPoints:", v8, &v20, v19))
      {
        case 0uLL:
          -[CRLBezierPath moveToPoint:](v4, "moveToPoint:", v20);
          y = v20.y;
          x = v20.x;
          v19 = v20;
          goto LABEL_17;
        case 1uLL:
          v10 = v20.y;
          v9 = v20.x;
          if (!sub_10005FDF0(x, y, v20.x, v20.y))
          {
            if (v8 + 1 >= v7
              || (v11 = objc_msgSend(v3, "elementAtIndex:"), v10 = v20.y, v9 = v20.x, v11 != (id)3)
              || !sub_10005FDF0(v20.x, v20.y, v19.x, v19.y))
            {
              -[CRLBezierPath lineToPoint:](v4, "lineToPoint:", v9, v10);
              y = v20.y;
              x = v20.x;
            }
          }
          goto LABEL_17;
        case 2uLL:
          v12 = v20;
          if (sub_10005FDF0(x, y, v20.x, v20.y))
          {
            v14 = v21.y;
            v13 = v21.x;
            v15 = sub_10005FDF0(x, y, v21.x, v21.y);
            v17 = v22.y;
            v16 = v22.x;
            if (v15 && sub_10005FDF0(x, y, v22.x, v22.y))
              goto LABEL_17;
          }
          else
          {
            v17 = v22.y;
            v16 = v22.x;
            v14 = v21.y;
            v13 = v21.x;
          }
          -[CRLBezierPath curveToPoint:controlPoint1:controlPoint2:](v4, "curveToPoint:controlPoint1:controlPoint2:", v16, v17, v12, v13, v14);
          y = v22.y;
          x = v22.x;
LABEL_17:
          if (v7 == ++v8)
            goto LABEL_18;
          break;
        case 3uLL:
          -[CRLBezierPath closePath](v4, "closePath");
          goto LABEL_17;
        default:
          goto LABEL_17;
      }
    }
  }
LABEL_18:

  return v4;
}

+ (id)simplifiedPathWithRawPath:(id)a3 threshold:(double)a4
{
  void *v5;
  CRLBezierPathSimplifier *v6;
  void *v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "cleanPathForPath:", a3));
  v6 = -[CRLBezierPathSimplifier initWithPath:threshold:]([CRLBezierPathSimplifier alloc], "initWithPath:threshold:", v5, a4);
  -[CRLBezierPathSimplifier run](v6, "run");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBezierPathSimplifier simplifiedPath](v6, "simplifiedPath"));

  return v7;
}

- (void)pointsToSimplify
{
  return &self->_pointsToSimplify;
}

- (void)setPointsToSimplify:(void *)a3
{
  char *p_pointsToSimplify;

  p_pointsToSimplify = (char *)&self->_pointsToSimplify;
  if (p_pointsToSimplify != a3)
    sub_10001FB60(p_pointsToSimplify, *(char **)a3, *((_QWORD *)a3 + 1), (uint64_t)(*((_QWORD *)a3 + 1) - *(_QWORD *)a3) >> 4);
}

- (CRLPointVector3)associatedPoints
{
  return &self->_associatedPoints;
}

- (void)setAssociatedPoints:(CRLPointVector3 *)a3
{
  CGPoint v3;
  CGPoint v4;

  v3 = a3->v[0];
  v4 = a3->v[1];
  self->_associatedPoints.v[2] = a3->v[2];
  self->_associatedPoints.v[1] = v4;
  self->_associatedPoints.v[0] = v3;
}

- (CGPoint)startOfSubpath
{
  double x;
  double y;
  CGPoint result;

  x = self->_startOfSubpath.x;
  y = self->_startOfSubpath.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setStartOfSubpath:(CGPoint)a3
{
  self->_startOfSubpath = a3;
}

- (unint64_t)tailLength
{
  return self->_tailLength;
}

- (void)setTailLength:(unint64_t)a3
{
  self->_tailLength = a3;
}

- (int64_t)solutionElementType
{
  return self->_solutionElementType;
}

- (void)setSolutionElementType:(int64_t)a3
{
  self->_solutionElementType = a3;
}

- (CGPoint)controlPoint1
{
  double x;
  double y;
  CGPoint result;

  x = self->_controlPoint1.x;
  y = self->_controlPoint1.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setControlPoint1:(CGPoint)a3
{
  self->_controlPoint1 = a3;
}

- (CGPoint)controlPoint2
{
  double x;
  double y;
  CGPoint result;

  x = self->_controlPoint2.x;
  y = self->_controlPoint2.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setControlPoint2:(CGPoint)a3
{
  self->_controlPoint2 = a3;
}

- (CRLBezierPath)simplifiedPath
{
  return self->_simplifiedPath;
}

- (CRLBezierPath)path
{
  return self->_path;
}

- (double)threshold
{
  return self->_threshold;
}

- (void).cxx_destruct
{
  CGPoint *begin;

  begin = self->_pointsToSimplify.__begin_;
  if (begin)
  {
    self->_pointsToSimplify.__end_ = begin;
    operator delete(begin);
  }
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_simplifiedPath, 0);
}

- (id).cxx_construct
{
  CGPoint v2;

  *((_QWORD *)self + 12) = 0;
  *((_QWORD *)self + 13) = 0;
  *((_QWORD *)self + 14) = 0;
  v2 = CGPointZero;
  *(CGPoint *)((char *)self + 152) = CGPointZero;
  *(CGPoint *)((char *)self + 136) = v2;
  *(CGPoint *)((char *)self + 120) = v2;
  return self;
}

@end
