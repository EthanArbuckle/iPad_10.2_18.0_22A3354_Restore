@implementation CRLConnectionLineOrthogonalLayout

- (CRLConnectionLineOrthogonalLayout)initWithInfo:(id)a3
{
  CRLConnectionLineOrthogonalLayout *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CRLConnectionLineOrthogonalLayout;
  result = -[CRLConnectionLineAbstractLayout initWithInfo:](&v4, "initWithInfo:", a3);
  if (result)
  {
    *(CGPoint *)((char *)&result->super.mTailMagnetCanvasPosition + 3) = (CGPoint)xmmword_100EEC438;
    *(CGPoint *)((char *)&result->mSnappedUserSetControlPoint + 3) = (CGPoint)xmmword_100EEC438;
    *(CGPoint *)((char *)&result->mOverriddenControlPoint + 3) = (CGPoint)xmmword_100EEC438;
    *(CGPoint *)((char *)&result->mLastPtA + 3) = (CGPoint)xmmword_100EEC438;
  }
  return result;
}

- (void)setUserDidSetControlPoint:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CRLConnectionLineOrthogonalLayout;
  -[CRLConnectionLineAbstractLayout setUserDidSetControlPoint:](&v4, "setUserDidSetControlPoint:", a3);
  *(CGPoint *)((char *)&self->super.mTailMagnetCanvasPosition + 3) = (CGPoint)xmmword_100EEC438;
}

- (id)getClippedHeadPortion
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  double v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  void *v29;
  double v30;
  double v31;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v35;
  CGAffineTransform v36;
  _BYTE v37[24];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineAbstractLayout connectedTo](self, "connectedTo"));

  if (!v3)
  {
    v4 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101246910);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E0FBBC();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101246930);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DEB414(v6, (uint64_t)v37, v4);
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLConnectionLineOrthogonalLayout getClippedHeadPortion]"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLConnectionLineOrthogonalLayout.mm"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 179, 0, "invalid nil value for '%{public}s'", "self.connectedTo");

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout pureGeometry](self, "pureGeometry"));
  objc_msgSend(v9, "size");
  if (v10 == 0.0 || fabs(v10) < 0.00999999978)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout pureGeometry](self, "pureGeometry"));
    objc_msgSend(v11, "size");
    v13 = fabs(v12) >= 0.00999999978 && v12 != 0.0;

    if (!v13)
    {
      v21 = 0;
      return v21;
    }
  }
  else
  {

  }
  memset(&v36, 0, sizeof(v36));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout pureGeometry](self, "pureGeometry"));
  v15 = v14;
  if (v14)
    objc_msgSend(v14, "transform");
  else
    memset(&v36, 0, sizeof(v36));

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout parent](self, "parent"));
  v17 = v16 == 0;

  if (!v17)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout parent](self, "parent"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "geometryInParent"));
    v20 = v19;
    if (v19)
      objc_msgSend(v19, "transform");
    else
      memset(&t1, 0, sizeof(t1));
    t2 = v36;
    CGAffineTransformConcat(&v35, &t1, &t2);
    v36 = v35;

  }
  -[CRLShapeLayout headPoint](self, "headPoint");
  v23 = v22;
  v25 = v24;
  v26 = *(_OWORD *)&v36.a;
  v27 = *(_OWORD *)&v36.c;
  v28 = *(_OWORD *)&v36.tx;
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineAbstractLayout connectedTo](self, "connectedTo"));
  objc_msgSend(v29, "getCardinalPositionWithParentTransformFromType:", 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPathWithStart:end:](CRLBezierPath, "bezierPathWithStart:end:", *(double *)&v28 + v25 * *(double *)&v27 + *(double *)&v26 * v23, *((double *)&v28 + 1) + v25 * *((double *)&v27 + 1) + *((double *)&v26 + 1) * v23, v30, v31));

  return v21;
}

- (id)getClippedTailPortion
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  double v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  void *v29;
  double v30;
  double v31;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v35;
  CGAffineTransform v36;
  _BYTE v37[24];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineAbstractLayout connectedFrom](self, "connectedFrom"));

  if (!v3)
  {
    v4 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101246950);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E0FC5C();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101246970);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DEB414(v6, (uint64_t)v37, v4);
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLConnectionLineOrthogonalLayout getClippedTailPortion]"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLConnectionLineOrthogonalLayout.mm"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 192, 0, "invalid nil value for '%{public}s'", "self.connectedFrom");

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout pureGeometry](self, "pureGeometry"));
  objc_msgSend(v9, "size");
  if (v10 == 0.0 || fabs(v10) < 0.00999999978)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout pureGeometry](self, "pureGeometry"));
    objc_msgSend(v11, "size");
    v13 = fabs(v12) >= 0.00999999978 && v12 != 0.0;

    if (!v13)
    {
      v21 = 0;
      return v21;
    }
  }
  else
  {

  }
  memset(&v36, 0, sizeof(v36));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout pureGeometry](self, "pureGeometry"));
  v15 = v14;
  if (v14)
    objc_msgSend(v14, "transform");
  else
    memset(&v36, 0, sizeof(v36));

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout parent](self, "parent"));
  v17 = v16 == 0;

  if (!v17)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout parent](self, "parent"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "geometryInParent"));
    v20 = v19;
    if (v19)
      objc_msgSend(v19, "transform");
    else
      memset(&t1, 0, sizeof(t1));
    t2 = v36;
    CGAffineTransformConcat(&v35, &t1, &t2);
    v36 = v35;

  }
  -[CRLShapeLayout tailPoint](self, "tailPoint");
  v23 = v22;
  v25 = v24;
  v26 = *(_OWORD *)&v36.a;
  v27 = *(_OWORD *)&v36.c;
  v28 = *(_OWORD *)&v36.tx;
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineAbstractLayout connectedFrom](self, "connectedFrom"));
  objc_msgSend(v29, "getCardinalPositionWithParentTransformFromType:", 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPathWithStart:end:](CRLBezierPath, "bezierPathWithStart:end:", *(double *)&v28 + v25 * *(double *)&v27 + *(double *)&v26 * v23, *((double *)&v28 + 1) + v25 * *((double *)&v27 + 1) + *((double *)&v26 + 1) * v23, v30, v31));

  return v21;
}

- (CGRect)orthoRectOfLayout:(id)a3 outset:(double)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  Swift::String v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  double v18;
  double v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  BOOL v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  _QWORD v32[2];
  void (*v33)(uint64_t, uint64_t);
  void *v34;
  CRLConnectionLineOrthogonalLayout *v35;
  id v36;
  _QWORD *v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  double v41;
  double v42;
  _QWORD v43[3];
  char v44;
  uint64_t v45;
  double *v46;
  uint64_t v47;
  __n128 (*v48)(uint64_t, uint64_t);
  uint64_t (*v49)();
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char v55;
  Freeform::SyncEvent::FetchedRecordZoneChanges::Deletion v56;
  CGRect result;

  v6 = a3;
  v7 = objc_msgSend(v6, "centerForConnecting");
  v9 = v8;
  v11 = v10;
  v45 = 0;
  v46 = (double *)&v45;
  v48 = sub_10022B2DC;
  v49 = nullsub_34;
  v47 = 0x5012000000;
  v50 = &unk_1010E66AB;
  v56 = SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:)((CKRecordID)v7, v12);
  v51 = v13;
  v52 = v14;
  v53 = v15;
  v54 = v16;
  objc_msgSend(v6, "boundsForStandardKnobs", v56.recordType._object);
  if (v17 <= v18)
    v19 = v18;
  else
    v19 = v17;
  v43[0] = 0;
  v43[1] = v43;
  v43[2] = 0x2020000000;
  v44 = 1;
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v33 = sub_10022B2EC;
  v34 = &unk_101246998;
  v39 = v9;
  v40 = v11;
  v41 = a4 + 10.0 + v19;
  v35 = self;
  v20 = v6;
  v21 = 0;
  v42 = a4;
  v36 = v20;
  v37 = v43;
  v38 = &v45;
  do
  {
    v22 = qword_100EEE668[v21];
    v55 = 0;
    ((void (*)(_QWORD *, uint64_t, char *))v33)(v32, v22, &v55);
    if (v55)
      v23 = 1;
    else
      v23 = v21 == 3;
    ++v21;
  }
  while (!v23);
  v24 = v46[6];
  v25 = v46[7];
  v26 = v46[8];
  v27 = v46[9];

  _Block_object_dispose(v43, 8);
  _Block_object_dispose(&v45, 8);

  v28 = v24;
  v29 = v25;
  v30 = v26;
  v31 = v27;
  result.size.height = v31;
  result.size.width = v30;
  result.origin.y = v29;
  result.origin.x = v28;
  return result;
}

- (id)createConnectedPathFrom:(id)a3 to:(id)a4 withControlPoints:(CGPoint)a5[3] clipPath:(BOOL)a6
{
  id v9;
  id v10;
  unint64_t i;
  double v12;
  double *v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  double v27;
  double v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  double v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  double v39;
  double v40;
  uint64_t v41;
  uint64_t v42;
  double v43;
  CGFloat v44;
  CGFloat v45;
  CGFloat v46;
  double v47;
  double v48;
  uint64_t v49;
  uint64_t v50;
  double *v51;
  uint64_t v52;
  double *v53;
  uint64_t v54;
  double v55;
  double *v56;
  double *v57;
  uint64_t v58;
  unint64_t v59;
  uint64_t v60;
  unint64_t v61;
  char *v62;
  double *v63;
  uint64_t v64;
  unint64_t v65;
  uint64_t v66;
  unint64_t v67;
  char *v68;
  double *v69;
  char *v70;
  uint64_t v71;
  uint64_t v72;
  double *v73;
  double v74;
  double *v75;
  double v76;
  double *v77;
  double *v78;
  uint64_t v79;
  unint64_t v80;
  uint64_t v81;
  unint64_t v82;
  char *v83;
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
  double *v94;
  double *v95;
  uint64_t v96;
  unint64_t v97;
  uint64_t v98;
  unint64_t v99;
  char *v100;
  double *v101;
  char *v102;
  uint64_t v103;
  double *v104;
  uint64_t v105;
  unint64_t v106;
  uint64_t v107;
  unint64_t v108;
  char *v109;
  double *v110;
  char *v111;
  uint64_t v112;
  uint64_t v113;
  double v114;
  double v115;
  double v116;
  double v117;
  double v118;
  double v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  double v125;
  double v126;
  void *v127;
  double v128;
  double v129;
  double v130;
  double v131;
  double v132;
  double v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  void *v138;
  double v139;
  double v140;
  double v141;
  double v142;
  double v143;
  double v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  double x;
  double y;
  double v151;
  double v152;
  double v153;
  double v154;
  void *v155;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  _BOOL4 v161;
  _BOOL4 v162;
  __int128 v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  void *v171;
  void *v172;
  uint64_t v173;
  void *v174;
  void *v175;
  uint64_t v176;
  void *__p;
  double *v178;
  unint64_t v179;
  void *v180;
  double *v181;
  unint64_t v182;
  _OWORD v183[2];
  _OWORD v184[2];
  __int128 v185;
  __int128 v186;
  uint64_t v187;
  uint64_t v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  uint64_t v193;
  __int128 v194;
  __int128 v195;
  uint64_t v196;
  uint64_t v197;
  __int128 v198;
  __int128 v199;
  __int128 v200;
  __int128 v201;
  uint64_t v202;
  __int128 v203;
  __int128 v204;
  __int128 v205;
  __int128 v206;
  double v207[2];
  double v208;
  double v209;
  double v210;
  double v211;

  v9 = a3;
  v10 = a4;
  for (i = 0; i != 6; i += 2)
  {
    v12 = sub_1000603DC(a5[i / 2].x, a5[i / 2].y, 10.0);
    v13 = &v207[i];
    *v13 = v12;
    *((_QWORD *)v13 + 1) = v14;
  }
  if (-[CRLConnectionLineAbstractLayout headMagnetType](self, "headMagnetType"))
    v161 = (id)-[CRLConnectionLineAbstractLayout headMagnetType](self, "headMagnetType") != (id)1;
  else
    v161 = 0;
  if (-[CRLConnectionLineAbstractLayout tailMagnetType](self, "tailMagnetType"))
    v162 = (id)-[CRLConnectionLineAbstractLayout tailMagnetType](self, "tailMagnetType") != (id)1;
  else
    v162 = 0;
  v15 = *(double *)((char *)&self->mLastPtA.x + 3);
  v16 = *(double *)((char *)&self->mLastPtA.y + 3);
  if (sub_100061890(v15, v16))
  {
    -[CRLConnectionLineAbstractLayout headMagnetCanvasPosition](self, "headMagnetCanvasPosition");
    v15 = v17;
    v16 = v18;
  }
  v19 = *(double *)((char *)&self->mOverriddenControlPoint.x + 3);
  v20 = *(double *)((char *)&self->mOverriddenControlPoint.y + 3);
  if (sub_100061890(v19, v20))
  {
    -[CRLConnectionLineAbstractLayout tailMagnetCanvasPosition](self, "tailMagnetCanvasPosition");
    v19 = v21;
    v20 = v22;
  }
  sub_1001E97E8(v15, v16, 10.0);
  v157 = v24;
  v158 = v23;
  sub_1001E97E8(v19, v20, 10.0);
  v159 = v26;
  v160 = v25;
  v205 = 0u;
  v206 = 0u;
  v27 = v207[0];
  sub_1001E980C((uint64_t)v207[0], (uint64_t)v207[1], 0, 0, &v205);
  v203 = 0u;
  v204 = 0u;
  v28 = v210;
  sub_1001E980C((uint64_t)v210, (uint64_t)v211, 0, 0, &v203);
  v194 = v205;
  v195 = v206;
  v29 = sub_1001E97DC(v27);
  v31 = v30;
  v196 = v29;
  v197 = v30;
  v198 = 0u;
  v199 = 0u;
  v200 = 0u;
  v201 = 0u;
  v202 = 0;
  v185 = v203;
  v186 = v204;
  v32 = sub_1001E97DC(v28);
  v34 = v33;
  v187 = v32;
  v188 = v33;
  v189 = 0u;
  v190 = 0u;
  v191 = 0u;
  v192 = 0u;
  v193 = 0;
  if (v9)
  {
    -[CRLConnectionLineAbstractLayout outsetFrom](self, "outsetFrom");
    -[CRLConnectionLineOrthogonalLayout orthoRectOfLayout:outset:](self, "orthoRectOfLayout:outset:", v9);
    objc_msgSend(v9, "centerForConnecting", sub_1001E98A4((uint64_t *)&v194, v35, v36, v37, v38, 10.0));
    sub_1001E97E8(v39, v40, 10.0);
    v29 = v41;
    v31 = v42;
    v196 = v41;
    v197 = v42;
    v184[0] = v194;
    v184[1] = v195;
    sub_10022B408((uint64_t)v184, v41, v42, &v194);
    if ((uint64_t)v195 >= 1 && *((uint64_t *)&v195 + 1) >= 1)
      *(_QWORD *)&v198 = 200;
  }
  if (v10)
  {
    -[CRLConnectionLineAbstractLayout outsetTo](self, "outsetTo");
    -[CRLConnectionLineOrthogonalLayout orthoRectOfLayout:outset:](self, "orthoRectOfLayout:outset:", v10);
    objc_msgSend(v10, "centerForConnecting", sub_1001E98A4((uint64_t *)&v185, v43, v44, v45, v46, 10.0));
    sub_1001E97E8(v47, v48, 10.0);
    v32 = v49;
    v34 = v50;
    v187 = v49;
    v188 = v50;
    v183[0] = v185;
    v183[1] = v186;
    sub_10022B408((uint64_t)v183, v49, v50, &v185);
    if ((uint64_t)v186 >= 1 && *((uint64_t *)&v186 + 1) >= 1)
      *(_QWORD *)&v189 = 200;
  }
  -[CRLConnectionLineAbstractLayout i_setVisibleLine:](self, "i_setVisibleLine:", 1);
  v180 = 0;
  v181 = 0;
  v182 = 0;
  __p = 0;
  v178 = 0;
  v179 = 0;
  if (!v162)
  {
    v53 = (double *)sub_10002BA34((uint64_t)&v182, 1uLL);
    *v53 = (double)v29;
    v180 = v53;
    v181 = v53 + 1;
    v182 = (unint64_t)&v53[v54];
    v181 = v53 + 1;
    v55 = (double)v31;
    v56 = v178;
    if ((unint64_t)v178 >= v179)
    {
      v57 = (double *)__p;
      v64 = ((char *)v178 - (_BYTE *)__p) >> 3;
      v65 = v64 + 1;
      if ((unint64_t)(v64 + 1) >> 61)
        sub_100007810();
      v66 = v179 - (_QWORD)__p;
      if ((uint64_t)(v179 - (_QWORD)__p) >> 2 > v65)
        v65 = v66 >> 2;
      if ((unint64_t)v66 >= 0x7FFFFFFFFFFFFFF8)
        v67 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v67 = v65;
      if (v67)
      {
        v68 = (char *)sub_10002BA34((uint64_t)&v179, v67);
        v57 = (double *)__p;
        v56 = v178;
      }
      else
      {
        v68 = 0;
      }
      v69 = (double *)&v68[8 * v64];
      v70 = &v68[8 * v67];
      *v69 = v55;
      v63 = v69 + 1;
      while (v56 != v57)
      {
        v72 = *((_QWORD *)v56-- - 1);
        *((_QWORD *)v69-- - 1) = v72;
      }
      goto LABEL_51;
    }
LABEL_34:
    *v56 = v55;
    v63 = v56 + 1;
    goto LABEL_53;
  }
  v51 = (double *)sub_10002BA34((uint64_t)&v182, 1uLL);
  *v51 = (double)v160;
  v180 = v51;
  v181 = v51 + 1;
  v182 = (unint64_t)&v51[v52];
  v181 = v51 + 1;
  v55 = (double)v159;
  v56 = v178;
  if ((unint64_t)v178 < v179)
    goto LABEL_34;
  v57 = (double *)__p;
  v58 = ((char *)v178 - (_BYTE *)__p) >> 3;
  v59 = v58 + 1;
  if ((unint64_t)(v58 + 1) >> 61)
    sub_100007810();
  v60 = v179 - (_QWORD)__p;
  if ((uint64_t)(v179 - (_QWORD)__p) >> 2 > v59)
    v59 = v60 >> 2;
  if ((unint64_t)v60 >= 0x7FFFFFFFFFFFFFF8)
    v61 = 0x1FFFFFFFFFFFFFFFLL;
  else
    v61 = v59;
  if (v61)
  {
    v62 = (char *)sub_10002BA34((uint64_t)&v179, v61);
    v57 = (double *)__p;
    v56 = v178;
  }
  else
  {
    v62 = 0;
  }
  v69 = (double *)&v62[8 * v58];
  v70 = &v62[8 * v61];
  *v69 = v55;
  v63 = v69 + 1;
  while (v56 != v57)
  {
    v71 = *((_QWORD *)v56-- - 1);
    *((_QWORD *)v69-- - 1) = v71;
  }
LABEL_51:
  __p = v69;
  v178 = v63;
  v179 = (unint64_t)v70;
  if (v57)
    operator delete(v57);
LABEL_53:
  v178 = v63;
  v73 = v181;
  if (!v161)
  {
    v76 = (double)v32;
    if ((unint64_t)v181 >= v182)
    {
      v84 = (double *)v180;
      v85 = ((char *)v181 - (_BYTE *)v180) >> 3;
      v86 = v85 + 1;
      if ((unint64_t)(v85 + 1) >> 61)
        sub_100007810();
      v87 = v182 - (_QWORD)v180;
      if ((uint64_t)(v182 - (_QWORD)v180) >> 2 > v86)
        v86 = v87 >> 2;
      if ((unint64_t)v87 >= 0x7FFFFFFFFFFFFFF8)
        v88 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v88 = v86;
      if (v88)
      {
        v89 = (char *)sub_10002BA34((uint64_t)&v182, v88);
        v84 = (double *)v180;
        v73 = v181;
      }
      else
      {
        v89 = 0;
      }
      v101 = (double *)&v89[8 * v85];
      v102 = &v89[8 * v88];
      *v101 = v76;
      v77 = v101 + 1;
      while (v73 != v84)
      {
        v103 = *((_QWORD *)v73-- - 1);
        *((_QWORD *)v101-- - 1) = v103;
      }
      v180 = v101;
      v181 = v77;
      v182 = (unint64_t)v102;
      if (v84)
        operator delete(v84);
    }
    else
    {
      *v181 = v76;
      v77 = v73 + 1;
    }
    v181 = v77;
    v93 = (double)v34;
    v94 = v178;
    if ((unint64_t)v178 >= v179)
    {
      v95 = (double *)__p;
      v105 = ((char *)v178 - (_BYTE *)__p) >> 3;
      v106 = v105 + 1;
      if ((unint64_t)(v105 + 1) >> 61)
        sub_100007810();
      v107 = v179 - (_QWORD)__p;
      if ((uint64_t)(v179 - (_QWORD)__p) >> 2 > v106)
        v106 = v107 >> 2;
      if ((unint64_t)v107 >= 0x7FFFFFFFFFFFFFF8)
        v108 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v108 = v106;
      if (v108)
      {
        v109 = (char *)sub_10002BA34((uint64_t)&v179, v108);
        v95 = (double *)__p;
        v94 = v178;
      }
      else
      {
        v109 = 0;
      }
      v110 = (double *)&v109[8 * v105];
      v111 = &v109[8 * v108];
      *v110 = v93;
      v104 = v110 + 1;
      while (v94 != v95)
      {
        v113 = *((_QWORD *)v94-- - 1);
        *((_QWORD *)v110-- - 1) = v113;
      }
      goto LABEL_113;
    }
LABEL_96:
    *v94 = v93;
    v104 = v94 + 1;
    goto LABEL_115;
  }
  v74 = (double)v158;
  if ((unint64_t)v181 >= v182)
  {
    v78 = (double *)v180;
    v79 = ((char *)v181 - (_BYTE *)v180) >> 3;
    v80 = v79 + 1;
    if ((unint64_t)(v79 + 1) >> 61)
      sub_100007810();
    v81 = v182 - (_QWORD)v180;
    if ((uint64_t)(v182 - (_QWORD)v180) >> 2 > v80)
      v80 = v81 >> 2;
    if ((unint64_t)v81 >= 0x7FFFFFFFFFFFFFF8)
      v82 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v82 = v80;
    if (v82)
    {
      v83 = (char *)sub_10002BA34((uint64_t)&v182, v82);
      v78 = (double *)v180;
      v73 = v181;
    }
    else
    {
      v83 = 0;
    }
    v90 = (double *)&v83[8 * v79];
    v91 = &v83[8 * v82];
    *v90 = v74;
    v75 = v90 + 1;
    while (v73 != v78)
    {
      v92 = *((_QWORD *)v73-- - 1);
      *((_QWORD *)v90-- - 1) = v92;
    }
    v180 = v90;
    v181 = v75;
    v182 = (unint64_t)v91;
    if (v78)
      operator delete(v78);
  }
  else
  {
    *v181 = v74;
    v75 = v73 + 1;
  }
  v181 = v75;
  v93 = (double)v157;
  v94 = v178;
  if ((unint64_t)v178 < v179)
    goto LABEL_96;
  v95 = (double *)__p;
  v96 = ((char *)v178 - (_BYTE *)__p) >> 3;
  v97 = v96 + 1;
  if ((unint64_t)(v96 + 1) >> 61)
    sub_100007810();
  v98 = v179 - (_QWORD)__p;
  if ((uint64_t)(v179 - (_QWORD)__p) >> 2 > v97)
    v97 = v98 >> 2;
  if ((unint64_t)v98 >= 0x7FFFFFFFFFFFFFF8)
    v99 = 0x1FFFFFFFFFFFFFFFLL;
  else
    v99 = v97;
  if (v99)
  {
    v100 = (char *)sub_10002BA34((uint64_t)&v179, v99);
    v95 = (double *)__p;
    v94 = v178;
  }
  else
  {
    v100 = 0;
  }
  v110 = (double *)&v100[8 * v96];
  v111 = &v100[8 * v99];
  *v110 = v93;
  v104 = v110 + 1;
  while (v94 != v95)
  {
    v112 = *((_QWORD *)v94-- - 1);
    *((_QWORD *)v110-- - 1) = v112;
  }
LABEL_113:
  __p = v110;
  v178 = v104;
  v179 = (unint64_t)v111;
  if (v95)
    operator delete(v95);
LABEL_115:
  v178 = v104;
  v114 = v208;
  v115 = v209;
  v175 = 0;
  v176 = 0;
  v174 = 0;
  sub_1002318DC(&v174, v180, (uint64_t)v181, ((char *)v181 - (_BYTE *)v180) >> 3);
  v171 = 0;
  v172 = 0;
  v173 = 0;
  sub_1002318DC(&v171, __p, (uint64_t)v178, ((char *)v178 - (_BYTE *)__p) >> 3);
  -[CRLConnectionLineOrthogonalLayout axisSnapPoint:toXs:toYs:withThreshold:](self, "axisSnapPoint:toXs:toYs:withThreshold:", &v174, &v171, v114, v115, 20.0);
  v117 = v116;
  v119 = v118;
  v208 = v116;
  v209 = v118;
  if (v171)
  {
    v172 = v171;
    operator delete(v171);
  }
  if (v174)
  {
    v175 = v174;
    operator delete(v174);
  }
  v120 = sub_1001E97DC(v117);
  v122 = v121;
  -[CRLConnectionLineOrthogonalLayout p_getAdjustedShapeOutset](self, "p_getAdjustedShapeOutset");
  v124 = v123;
  v125 = v117 / 10.0;
  v126 = v119 / 10.0;
  if (!v9)
  {
    v137 = 0;
    v135 = 0;
    if (v10)
      goto LABEL_121;
LABEL_123:
    v148 = 0;
    v146 = 0;
    goto LABEL_124;
  }
  v127 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "pureGeometry"));
  objc_msgSend(v127, "frame");
  -[CRLConnectionLineOrthogonalLayout outsetFromMagnetPosition:withRect:controlPoint:distance:](self, "outsetFromMagnetPosition:withRect:controlPoint:distance:", v19, v20, v128, v129, v130, v131, v125, v126, v124);
  sub_1001E97E8(v132, v133, 10.0);
  v135 = v134;
  v137 = v136;

  if (!v10)
    goto LABEL_123;
LABEL_121:
  v138 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "pureGeometry"));
  objc_msgSend(v138, "frame");
  -[CRLConnectionLineOrthogonalLayout outsetFromMagnetPosition:withRect:controlPoint:distance:](self, "outsetFromMagnetPosition:withRect:controlPoint:distance:", v15, v16, v139, v140, v141, v142, v125, v126, v124);
  sub_1001E97E8(v143, v144, 10.0);
  v146 = v145;
  v148 = v147;

LABEL_124:
  x = a5->x;
  y = a5->y;
  v151 = a5[1].x;
  v152 = a5[1].y;
  if (sub_10006108C(a5->x, y, v151, v152) >= 10.0
    && (v153 = a5[2].x, v154 = a5[2].y, sub_10006108C(v153, v154, v151, v152) >= 10.0))
  {
    if (sub_10006108C(x, y, v153, v154) >= 10.0)
    {
      LOBYTE(v163) = v161;
      BYTE1(v163) = v162;
      *(_DWORD *)((char *)&v163 + 2) = 0;
      WORD3(v163) = 0;
      *((_QWORD *)&v163 + 1) = v158;
      v164 = v157;
      v165 = v160;
      v166 = v159;
      v167 = v146;
      v168 = v148;
      v169 = v135;
      v170 = v137;
      sub_10022C220((uint64_t)&v194, v120, v122, (uint64_t)&v185, &v163);
    }
    v155 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPath](CRLBezierPath, "bezierPath"));
    objc_msgSend(v155, "moveToPoint:", a5->x, a5->y);
    objc_msgSend(v155, "lineToPoint:", a5->x, a5[1].y);
    objc_msgSend(v155, "lineToPoint:", a5[1].x, a5[1].y);
    objc_msgSend(v155, "lineToPoint:", a5[1].x, a5->y);
    objc_msgSend(v155, "lineToPoint:", a5[2].x, a5[2].y);
  }
  else
  {
    v155 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPath](CRLBezierPath, "bezierPath"));
    objc_msgSend(v155, "moveToPoint:", a5->x, a5->y);
    objc_msgSend(v155, "lineToPoint:", a5[2].x, a5[2].y);
  }
  if (__p)
  {
    v178 = (double *)__p;
    operator delete(__p);
  }
  if (v180)
  {
    v181 = (double *)v180;
    operator delete(v180);
  }

  return v155;
}

- (double)p_getAdjustedShapeOutset
{
  double v3;
  void *v4;
  unint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v17;
  double v18[6];

  v3 = 20.0;
  if (!-[CRLConnectionLineAbstractLayout userDidSetControlPoint](self, "userDidSetControlPoint"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineAbstractLayout connectedFrom](self, "connectedFrom"));
    v5 = -[CRLConnectionLineAbstractLayout tailMagnetType](self, "tailMagnetType");
    if (!v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineAbstractLayout tailNearestLayoutForRouting](self, "tailNearestLayoutForRouting"));

      if (v6)
      {
        v7 = objc_claimAutoreleasedReturnValue(-[CRLConnectionLineAbstractLayout tailNearestLayoutForRouting](self, "tailNearestLayoutForRouting"));

        v5 = -[CRLConnectionLineAbstractLayout tailNearestMagnetTypeForRouting](self, "tailNearestMagnetTypeForRouting");
        v4 = (void *)v7;
      }
      else
      {
        v5 = 0;
      }
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineAbstractLayout connectedTo](self, "connectedTo"));
    v9 = -[CRLConnectionLineAbstractLayout headMagnetType](self, "headMagnetType");
    if (!v9)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineAbstractLayout headNearestLayoutForRouting](self, "headNearestLayoutForRouting"));

      if (v9)
      {
        v10 = objc_claimAutoreleasedReturnValue(-[CRLConnectionLineAbstractLayout headNearestLayoutForRouting](self, "headNearestLayoutForRouting"));

        v9 = -[CRLConnectionLineAbstractLayout headNearestMagnetTypeForRouting](self, "headNearestMagnetTypeForRouting");
        v8 = (void *)v10;
      }
    }
    if (!v4)
      goto LABEL_23;
    if (!v8)
      goto LABEL_23;
    objc_msgSend(v4, "transform");
    if (sub_1000791EC(v18) != 0.0)
      goto LABEL_23;
    objc_msgSend(v8, "transform");
    if (sub_1000791EC(&v17) != 0.0)
      goto LABEL_23;
    if (v9 == (void *)3 && v5 == 5)
    {
      objc_msgSend(v4, "cardinalWestPosition");
      v12 = v11;
      objc_msgSend(v8, "cardinalEastPosition");
    }
    else
    {
      v14 = 20.0;
      if (v9 != (void *)5 || v5 != 3)
        goto LABEL_20;
      objc_msgSend(v8, "cardinalWestPosition", 20.0);
      v12 = v15;
      objc_msgSend(v4, "cardinalEastPosition");
    }
    v14 = v12 - v13;
LABEL_20:
    if (v14 <= 40.0)
      v3 = 20.0;
    else
      v3 = v14;
LABEL_23:

  }
  return v3;
}

- (CGPoint)controlPointForPointA:(CGPoint)a3 pointB:(CGPoint)a4 andOriginalA:(CGPoint)a5 originalB:(CGPoint)a6
{
  void *v6;
  double y;
  double x;
  double v9;
  double v10;
  double v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  float64x2_t v27;
  double v28;
  double v29;
  float64_t v30;
  double v31;
  float64x2_t v32;
  float64x2_t v33;
  float64x2_t v34;
  CGPoint result;

  y = a4.y;
  x = a4.x;
  v9 = a3.y;
  v10 = a3.x;
  *(_QWORD *)&v12 = objc_opt_class(CRLConnectionLinePathSource, a2).n128_u64[0];
  v14 = v13;
  v15 = *(CRLEditableBezierPathSource **)((char *)&self->super.super.mCachedEditableBezierPathSource + 3);
  v16 = v15;
  if (!v15)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLayout shapeInfo](self, "shapeInfo", v12));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "pathSource"));
  }
  v17 = sub_100221D0C(v14, v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  if (!v15)
  {

  }
  v19 = *(CRLPathSource **)((char *)&self->super.super.mCachedPathSource + 3);
  if (v19)
  {
    v20 = v19;
    v33 = 0u;
    v34 = 0u;
    v32 = 0u;
  }
  else
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout info](self, "info"));
    v20 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "geometry"));

    v33 = 0u;
    v34 = 0u;
    v32 = 0u;
    if (!v20)
      goto LABEL_9;
  }
  objc_msgSend(v20, "transform");
LABEL_9:
  *(double *)((char *)&self->mOverriddenControlPoint.x + 3) = v10;
  *(double *)((char *)&self->mOverriddenControlPoint.y + 3) = v9;
  *(double *)((char *)&self->mLastPtA.x + 3) = x;
  *(double *)((char *)&self->mLastPtA.y + 3) = y;
  -[CRLConnectionLineOrthogonalLayout p_getOverriddenControlPointWithPointA:pointB:](self, "p_getOverriddenControlPointWithPointA:pointB:", v10, v9, x, y);
  v23 = v22;
  v30 = v24;
  *(double *)((char *)&self->mSnappedUserSetControlPoint.x + 3) = v24;
  *(double *)((char *)&self->mSnappedUserSetControlPoint.y + 3) = v22;
  if (-[CRLConnectionLineAbstractLayout userDidSetControlPoint](self, "userDidSetControlPoint"))
  {
    objc_msgSend(v18, "getControlKnobPosition:", 12);
    v27 = vaddq_f64(v34, vmlaq_n_f64(vmulq_n_f64(v33, v25), v32, v26));
    v23 = v27.f64[1];
  }
  else
  {
    v27.f64[0] = v30;
  }
  v31 = v27.f64[0];
  if (!sub_10005FE60(v27.f64[0], v23, *(double *)((char *)&self->mLastPtB.x + 3), *(double *)((char *)&self->mLastPtB.y + 3)))
  {
    -[CRLConnectionLineAbstractLayout setControlKnobPositionChangedFromRouting:](self, "setControlKnobPositionChangedFromRouting:", 1);
    *(double *)((char *)&self->mLastPtB.x + 3) = v31;
    *(double *)((char *)&self->mLastPtB.y + 3) = v23;
  }

  v28 = v31;
  v29 = v23;
  result.y = v29;
  result.x = v28;
  return result;
}

- (CGPoint)p_getOverriddenControlPointWithPointA:(CGPoint)a3 pointB:(CGPoint)a4
{
  CGFloat y;
  CGFloat x;
  CGFloat v6;
  CGFloat v7;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  _BOOL4 v29;
  void *v30;
  _BOOL4 v31;
  double v32;
  _BOOL4 v33;
  double v34;
  double v35;
  double v36;
  double v37;
  BOOL v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  CGPoint result;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;

  y = a4.y;
  x = a4.x;
  v6 = a3.y;
  v7 = a3.x;
  v9 = sub_100061A8C(a3.x, a3.y, a4.x, a4.y, 0.5);
  v40 = v10;
  v41 = v9;
  -[CRLConnectionLineOrthogonalLayout p_getControlKnobPositionToMakeSingleCornerIfPossible:pointA:pointB:](self, "p_getControlKnobPositionToMakeSingleCornerIfPossible:pointA:pointB:");
  v42 = v7;
  v43 = x;
  v44 = v6;
  v39 = y;
  -[CRLConnectionLineOrthogonalLayout p_getControlKnobPositionToSnapToAnyExistingSetControlKnobs:pointA:pointB:](self, "p_getControlKnobPositionToSnapToAnyExistingSetControlKnobs:pointA:pointB:");
  v45 = v12;
  v46 = v11;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineAbstractLayout connectedTo](self, "connectedTo"));
  objc_msgSend(v13, "frame");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v22 = sub_10005FD98(v46, v45, 50.0);
  v24 = v23;
  v26 = v25;
  v28 = v27;
  v48.origin.x = v15;
  v48.origin.y = v17;
  v48.size.width = v19;
  v48.size.height = v21;
  v50.origin.x = v22;
  v50.origin.y = v24;
  v50.size.width = v26;
  v50.size.height = v28;
  if (CGRectIntersectsRect(v48, v50))
  {
    v29 = 1;
  }
  else
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineAbstractLayout connectedFrom](self, "connectedFrom"));
    objc_msgSend(v30, "frame");
    v51.origin.x = v22;
    v51.origin.y = v24;
    v51.size.width = v26;
    v51.size.height = v28;
    v29 = CGRectIntersectsRect(v49, v51);

  }
  v31 = sub_10005FE60(v46, v45, v42, v44) || sub_10005FE60(v46, v45, v43, v39);
  if (sub_10006108C(v41, v40, v42, v44) < 0.25)
    goto LABEL_14;
  v32 = sub_10006108C(v41, v40, v43, v39);
  v33 = v32 >= 0.25;
  if ((v29 || v31) && v33)
    v34 = v40;
  else
    v34 = v45;
  v35 = v46;
  if ((v29 || v31) && v33)
    v35 = v41;
  if (v32 < 0.25)
  {
LABEL_14:
    v36 = vabdd_f64(v42, v43);
    v37 = vabdd_f64(v44, v44);
    v38 = v36 <= v37;
    if (v36 > v37)
      v35 = v41;
    else
      v35 = v41 + -0.25;
    if (v38)
      v34 = v40;
    else
      v34 = v40 + -0.25;
  }
  result.y = v34;
  result.x = v35;
  return result;
}

- (CGPoint)p_getControlKnobPositionToMakeSingleCornerIfPossible:(CGPoint)a3 pointA:(CGPoint)a4 pointB:(CGPoint)a5
{
  CGFloat x;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  unint64_t v16;
  uint64_t v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  unint64_t v32;
  uint64_t v33;
  _BOOL4 v34;
  BOOL v35;
  uint64_t v36;
  int v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  _BOOL4 v43;
  BOOL v44;
  uint64_t v45;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  void *v58;
  double v59;
  double v60;
  int v61;
  int v62;
  double v63;
  double v64;
  double v65;
  double v66;
  void *v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  void *v74;
  double v75;
  double v76;
  int v77;
  int v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  BOOL v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  void *v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  void *v103;
  double v104;
  double v105;
  void *v106;
  double v107;
  void *v108;
  double v109;
  double v110;
  double v111;
  double v112;
  void *v113;
  double v114;
  void *v115;
  double v116;
  double v117;
  CGFloat v118;
  void *v119;
  int v120;
  double y;
  int v123;
  _BOOL4 v125;
  CGFloat v126;
  _BOOL4 v127;
  int v128;
  CGPoint result;

  y = a4.y;
  x = a4.x;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineAbstractLayout connectedFrom](self, "connectedFrom"));
  objc_msgSend(v7, "frame");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  v16 = -[CRLConnectionLineAbstractLayout tailMagnetType](self, "tailMagnetType");
  v126 = x;
  if (!v16)
  {
    v17 = objc_claimAutoreleasedReturnValue(-[CRLConnectionLineAbstractLayout tailNearestLayoutForRouting](self, "tailNearestLayoutForRouting"));

    if (!v17)
      goto LABEL_5;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineAbstractLayout tailNearestLayoutForRouting](self, "tailNearestLayoutForRouting"));
    objc_msgSend(v18, "frame");
    v9 = v19;
    v11 = v20;
    v13 = v21;
    v15 = v22;

    v16 = -[CRLConnectionLineAbstractLayout tailNearestMagnetTypeForRouting](self, "tailNearestMagnetTypeForRouting");
  }
  v17 = v16;
LABEL_5:
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineAbstractLayout connectedTo](self, "connectedTo"));
  objc_msgSend(v23, "frame");
  v25 = v24;
  v27 = v26;
  v29 = v28;
  v31 = v30;

  v32 = -[CRLConnectionLineAbstractLayout headMagnetType](self, "headMagnetType");
  if (v32)
  {
    v33 = v32;
    v127 = 0;
    v34 = v17 != 0;
  }
  else
  {
    v33 = objc_claimAutoreleasedReturnValue(-[CRLConnectionLineAbstractLayout headNearestLayoutForRouting](self, "headNearestLayoutForRouting"));

    if (v33)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineAbstractLayout headNearestLayoutForRouting](self, "headNearestLayoutForRouting"));
      objc_msgSend(v23, "frame");
      v25 = v39;
      v27 = v40;
      v29 = v41;
      v31 = v42;

      v33 = -[CRLConnectionLineAbstractLayout headNearestMagnetTypeForRouting](self, "headNearestMagnetTypeForRouting");
    }
    v127 = v33 == 0;
    v34 = v17 != 0;
    if (!v33 && v17)
    {
      v33 = 0;
      v37 = 0;
      v43 = v17 == 1;
      v34 = 1;
      v127 = 1;
      v36 = 1;
      goto LABEL_26;
    }
  }
  if (v33)
    v35 = v17 == 0;
  else
    v35 = 0;
  v36 = v35;
  v37 = v33 == 1;
  if (v33 != 1 || v17 != 1)
  {
    if (v17 == 1)
    {
      switch(v33)
      {
        case 2:
          v123 = 0;
          v36 = v27 > v11 + v15;
          v33 = 2;
          goto LABEL_16;
        case 3:
          if (v29 + v25 >= v9)
            goto LABEL_61;
          v123 = 0;
          v36 = 1;
          v33 = 3;
          break;
        case 4:
          v123 = 0;
          v36 = v31 + v27 < v11;
          v33 = 4;
          goto LABEL_16;
        case 5:
          if (v25 <= v9 + v13)
          {
LABEL_61:
            v123 = 0;
            v36 = v27 > v11 + v15 && v33 == 2;
          }
          else
          {
            v123 = 0;
            v36 = 1;
            v33 = 5;
          }
          break;
        default:
          v43 = 1;
          goto LABEL_26;
      }
      goto LABEL_16;
    }
    v43 = 0;
LABEL_26:
    v44 = (v17 & 0xFFFFFFFFFFFFFFFELL) == 4 || (v17 & 0xFFFFFFFFFFFFFFFELL) == 2;
    if (v44 && v37)
    {
      if (v17 == 5 && v9 > v29 + v25 || v17 == 3 && v9 + v13 < v25)
      {
        v37 = 1;
LABEL_37:
        v36 = 1;
      }
      else
      {
        v36 = v11 > v31 + v27 && v17 == 2;
        if (v17 == 4)
        {
          v36 = v11 + v15 < v27;
          v123 = 0;
          if (!v43)
          {
            v125 = v11 + v15 < v27;
            v61 = 0;
            v36 = 0;
            v38 = v126;
            goto LABEL_91;
          }
          v37 = 1;
          goto LABEL_16;
        }
        v37 = 1;
      }
    }
    else
    {
      if (!v33)
        v34 = 0;
      if (v34)
      {
        switch(v33)
        {
          case 2:
            if ((v17 == 5 || v17 == 3) && v27 > v11 + v15)
              goto LABEL_37;
            v36 = 0;
            v123 = 0;
            v45 = 0;
            v33 = 2;
            goto LABEL_79;
          case 3:
            if ((v17 == 4 || v17 == 2) && v29 + v25 < v9)
              goto LABEL_37;
            v36 = 0;
            v123 = 0;
            v45 = 0;
            v33 = 3;
            goto LABEL_79;
          case 4:
            if ((v17 == 5 || v17 == 3) && v31 + v27 < v11)
              goto LABEL_37;
            v36 = 0;
            v123 = 0;
            v45 = 0;
            v33 = 4;
            goto LABEL_79;
          case 5:
            if (v17 != 4 && v17 != 2)
              goto LABEL_81;
            v123 = 0;
            v45 = 0;
            v36 = v25 > v9 + v13;
            v33 = 5;
LABEL_79:
            v38 = v126;
            if (!v43)
              goto LABEL_90;
            goto LABEL_83;
          default:
LABEL_81:
            v36 = 0;
            break;
        }
      }
    }
    v38 = v126;
    v123 = 0;
    v45 = 0;
    if (!v43)
      goto LABEL_90;
    goto LABEL_83;
  }
  v36 = 1;
  v33 = 1;
  v37 = 1;
  v123 = 1;
LABEL_16:
  v38 = v126;
LABEL_83:
  -[CRLConnectionLineOrthogonalLayout p_getLineEndPointAdjustedToCardinalForClineLayout:withHead:withTail:forLineEnd:](self, "p_getLineEndPointAdjustedToCardinalForClineLayout:withHead:withTail:forLineEnd:", self, 10, *(double *)((char *)&self->mLastPtA.x + 3), *(double *)((char *)&self->mLastPtA.y + 3), *(double *)((char *)&self->mOverriddenControlPoint.x + 3), *(double *)((char *)&self->mOverriddenControlPoint.y + 3));
  v49 = v48;
  v51 = v50;
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineAbstractLayout connectedFrom](self, "connectedFrom"));
  objc_msgSend(v23, "cardinalNorthPosition");
  if (!sub_10005FE60(v49, v51, v52, v53))
  {
    -[CRLConnectionLineOrthogonalLayout p_getLineEndPointAdjustedToCardinalForClineLayout:withHead:withTail:forLineEnd:](self, "p_getLineEndPointAdjustedToCardinalForClineLayout:withHead:withTail:forLineEnd:", self, 10, *(double *)((char *)&self->mLastPtA.x + 3), *(double *)((char *)&self->mLastPtA.y + 3), *(double *)((char *)&self->mOverriddenControlPoint.x + 3), *(double *)((char *)&self->mOverriddenControlPoint.y + 3));
    v55 = v54;
    v57 = v56;
    v58 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineAbstractLayout connectedFrom](self, "connectedFrom"));
    objc_msgSend(v58, "cardinalSouthPosition");
    v125 = v36;
    LODWORD(v45) = v127 & sub_10005FE60(v55, v57, v59, v60);
    if ((v45 & 1) != 0 || ((v37 ^ 1) & 1) != 0)
    {
      LOBYTE(v37) = v45 & v37;

      goto LABEL_103;
    }
    v119 = v58;
    v61 = 1;
    v36 = 1;
    goto LABEL_91;
  }
  v45 = 1;
  if (v127)
  {
    v125 = v36;
    goto LABEL_103;
  }
  v127 = 0;
LABEL_90:
  v125 = v36;
  v61 = 0;
  v62 = v37;
  v36 = v45;
  LOBYTE(v37) = 0;
  LOBYTE(v45) = 0;
  if (!v62)
    goto LABEL_102;
LABEL_91:
  -[CRLConnectionLineOrthogonalLayout p_getLineEndPointAdjustedToCardinalForClineLayout:withHead:withTail:forLineEnd:](self, "p_getLineEndPointAdjustedToCardinalForClineLayout:withHead:withTail:forLineEnd:", self, 11, *(double *)((char *)&self->mLastPtA.x + 3), *(double *)((char *)&self->mLastPtA.y + 3), *(double *)((char *)&self->mOverriddenControlPoint.x + 3), *(double *)((char *)&self->mOverriddenControlPoint.y + 3), v119);
  v64 = v63;
  v66 = v65;
  v67 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineAbstractLayout connectedFrom](self, "connectedFrom"));
  objc_msgSend(v67, "cardinalNorthPosition");
  if (sub_10005FE60(v64, v66, v68, v69))
  {
    LOBYTE(v45) = v17 == 0;
    goto LABEL_95;
  }
  -[CRLConnectionLineOrthogonalLayout p_getLineEndPointAdjustedToCardinalForClineLayout:withHead:withTail:forLineEnd:](self, "p_getLineEndPointAdjustedToCardinalForClineLayout:withHead:withTail:forLineEnd:", self, 11, *(double *)((char *)&self->mLastPtA.x + 3), *(double *)((char *)&self->mLastPtA.y + 3), *(double *)((char *)&self->mOverriddenControlPoint.x + 3), *(double *)((char *)&self->mOverriddenControlPoint.y + 3));
  v71 = v70;
  v73 = v72;
  v74 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineAbstractLayout connectedFrom](self, "connectedFrom"));
  objc_msgSend(v74, "cardinalSouthPosition");
  if (sub_10005FE60(v71, v73, v75, v76))
  {
    LOBYTE(v45) = v17 == 0;

LABEL_95:
    if ((v61 & 1) != 0)
    {
LABEL_96:

      if ((v36 & 1) == 0)
      {
        v77 = 0;
        v78 = 0;
        goto LABEL_116;
      }
      LOBYTE(v37) = 1;
      goto LABEL_103;
    }
    goto LABEL_101;
  }

  LOBYTE(v45) = 0;
  if (v61)
    goto LABEL_96;
LABEL_101:
  LOBYTE(v37) = 1;
LABEL_102:
  if ((v36 & 1) == 0)
  {
    v78 = 0;
    goto LABEL_110;
  }
LABEL_103:

  -[CRLConnectionLineOrthogonalLayout p_getLineEndPointAdjustedToCardinalForClineLayout:withHead:withTail:forLineEnd:](self, "p_getLineEndPointAdjustedToCardinalForClineLayout:withHead:withTail:forLineEnd:", self, 10, *(double *)((char *)&self->mLastPtA.x + 3), *(double *)((char *)&self->mLastPtA.y + 3), *(double *)((char *)&self->mOverriddenControlPoint.x + 3), *(double *)((char *)&self->mOverriddenControlPoint.y + 3));
  v80 = v79;
  v82 = v81;
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineAbstractLayout connectedFrom](self, "connectedFrom"));
  objc_msgSend(v23, "cardinalEastPosition");
  if (!sub_10005FE60(v80, v82, v83, v84))
  {
    -[CRLConnectionLineOrthogonalLayout p_getLineEndPointAdjustedToCardinalForClineLayout:withHead:withTail:forLineEnd:](self, "p_getLineEndPointAdjustedToCardinalForClineLayout:withHead:withTail:forLineEnd:", self, 10, *(double *)((char *)&self->mLastPtA.x + 3), *(double *)((char *)&self->mLastPtA.y + 3), *(double *)((char *)&self->mOverriddenControlPoint.x + 3), *(double *)((char *)&self->mOverriddenControlPoint.y + 3));
    v87 = v86;
    v89 = v88;
    v36 = objc_claimAutoreleasedReturnValue(-[CRLConnectionLineAbstractLayout connectedFrom](self, "connectedFrom"));
    objc_msgSend((id)v36, "cardinalWestPosition");
    if ((v127 & sub_10005FE60(v87, v89, v90, v91)) == 1)
    {

      if (v125)
      {
        v85 = 1;
        goto LABEL_129;
      }
    }
    else
    {
      if ((v37 & 1) != 0)
      {
        v77 = 1;
        v78 = 1;
        goto LABEL_116;
      }

      if (v125)
      {
        v85 = 0;
        goto LABEL_129;
      }
    }
LABEL_139:
    v111 = a3.x;
    v112 = a3.y;
    goto LABEL_155;
  }
  v78 = 1;
  v85 = 1;
  if (!v127)
  {
LABEL_110:
    v77 = 0;
    v85 = 0;
    if ((v37 & 1) == 0)
    {
      if (v78)
        goto LABEL_112;
      goto LABEL_122;
    }
LABEL_116:
    LODWORD(v119) = v77;
    v128 = v78;
    -[CRLConnectionLineOrthogonalLayout p_getLineEndPointAdjustedToCardinalForClineLayout:withHead:withTail:forLineEnd:](self, "p_getLineEndPointAdjustedToCardinalForClineLayout:withHead:withTail:forLineEnd:", self, 10, *(double *)((char *)&self->mLastPtA.x + 3), *(double *)((char *)&self->mLastPtA.y + 3), *(double *)((char *)&self->mOverriddenControlPoint.x + 3), *(double *)((char *)&self->mOverriddenControlPoint.y + 3), v119);
    v93 = v92;
    v95 = v94;
    v96 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineAbstractLayout connectedFrom](self, "connectedFrom"));
    objc_msgSend(v96, "cardinalEastPosition");
    if (sub_10005FE60(v93, v95, v97, v98))
    {
      v85 = v17 == 0;
    }
    else
    {
      -[CRLConnectionLineOrthogonalLayout p_getLineEndPointAdjustedToCardinalForClineLayout:withHead:withTail:forLineEnd:](self, "p_getLineEndPointAdjustedToCardinalForClineLayout:withHead:withTail:forLineEnd:", self, 10, *(double *)((char *)&self->mLastPtA.x + 3), *(double *)((char *)&self->mLastPtA.y + 3), *(double *)((char *)&self->mOverriddenControlPoint.x + 3), *(double *)((char *)&self->mOverriddenControlPoint.y + 3));
      v100 = v99;
      v102 = v101;
      v103 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineAbstractLayout connectedFrom](self, "connectedFrom"));
      objc_msgSend(v103, "cardinalWestPosition");
      if (!sub_10005FE60(v100, v102, v104, v105))
      {

        v85 = 0;
        if (v120)
        {
LABEL_121:

          if ((v128 & 1) != 0)
            goto LABEL_112;
          goto LABEL_122;
        }
LABEL_125:
        if (v128)
          goto LABEL_112;
LABEL_122:
        if (!v125)
          goto LABEL_139;
        goto LABEL_129;
      }
      v85 = v17 == 0;

    }
    if ((v120 & 1) != 0)
      goto LABEL_121;
    goto LABEL_125;
  }
LABEL_112:

  if (!v125)
    goto LABEL_139;
LABEL_129:
  if (v123)
  {
    v106 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineAbstractLayout connectedFrom](self, "connectedFrom"));
    objc_msgSend(v106, "centerForConnecting");
    if (v38 == v107 || vabdd_f64(v38, v107) < 0.00999999978)
    {

    }
    else
    {
      v108 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineAbstractLayout connectedTo](self, "connectedTo"));
      objc_msgSend(v108, "centerForConnecting");
      v110 = v109;

      if (a5.x != v110)
      {
        v111 = v38;
        v112 = a5.y;
        if (vabdd_f64(a5.x, v110) < 0.00999999978)
          goto LABEL_155;
        v113 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineAbstractLayout connectedFrom](self, "connectedFrom", v38, a5.y));
        objc_msgSend(v113, "centerForConnecting");
        if (y == v114 || vabdd_f64(y, v114) < 0.00999999978)
        {

          v111 = a5.x;
          v112 = y;
          goto LABEL_155;
        }
        v115 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineAbstractLayout connectedTo](self, "connectedTo"));
        objc_msgSend(v115, "centerForConnecting");
        v117 = v116;

        if (a5.y != v117)
        {
          v111 = a3.x;
          v112 = a3.y;
          v118 = a5.x;
          if (vabdd_f64(a5.y, v117) < 0.00999999978)
          {
LABEL_154:
            v111 = v118;
            v112 = y;
          }
          goto LABEL_155;
        }
LABEL_151:
        v112 = y;
        v111 = a5.x;
        goto LABEL_155;
      }
    }
LABEL_148:
    v111 = v38;
    v112 = a5.y;
    goto LABEL_155;
  }
  if (v17 == 2 || v17 == 4 || (v45 & 1) != 0)
    goto LABEL_148;
  if (v17 == 3)
    goto LABEL_151;
  v112 = y;
  v118 = a5.x;
  if (v17 == 5 || v85)
  {
    v111 = a5.x;
  }
  else
  {
    v111 = a3.x;
    v112 = a3.y;
    switch(v33)
    {
      case 2:
      case 4:
        goto LABEL_154;
      case 3:
      case 5:
        goto LABEL_148;
      default:
        break;
    }
  }
LABEL_155:
  result.y = v112;
  result.x = v111;
  return result;
}

- (CGPoint)p_getControlKnobPositionToSnapToAnyExistingSetControlKnobs:(CGPoint)a3 pointA:(CGPoint)a4 pointB:(CGPoint)a5
{
  double y;
  CGFloat v6;
  CGFloat x;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGPoint result;

  y = a5.y;
  v6 = a3.y;
  x = a3.x;
  v9 = sub_100061A8C(a4.x, a4.y, a5.x, a5.y, 0.5);
  -[CRLConnectionLineOrthogonalLayout p_getExistingUserSetControlPointToMatch](self, "p_getExistingUserSetControlPointToMatch");
  v11 = v10;
  if (sub_100061890(v12, v10))
  {
    *(CGPoint *)((char *)&self->super.mTailMagnetCanvasPosition + 3) = (CGPoint)xmmword_100EEC438;
  }
  else if (-[CRLConnectionLineOrthogonalLayout p_tailComingFromSouth](self, "p_tailComingFromSouth") && y > v11
         || -[CRLConnectionLineOrthogonalLayout p_tailComingFromNorth](self, "p_tailComingFromNorth") && y < v11)
  {
    *(double *)((char *)&self->super.mTailMagnetCanvasPosition.x + 3) = v9;
    *(double *)((char *)&self->super.mTailMagnetCanvasPosition.y + 3) = v11;
  }
  if (!sub_100061890(*(double *)((char *)&self->super.mTailMagnetCanvasPosition.x + 3), *(double *)((char *)&self->super.mTailMagnetCanvasPosition.y + 3))&& !-[CRLConnectionLineAbstractLayout userDidSetControlPoint](self, "userDidSetControlPoint"))
  {
    x = *(double *)((char *)&self->super.mTailMagnetCanvasPosition.x + 3);
    v6 = *(double *)((char *)&self->super.mTailMagnetCanvasPosition.y + 3);
  }
  v13 = x;
  v14 = v6;
  result.y = v14;
  result.x = v13;
  return result;
}

- (CGPoint)p_getExistingUserSetControlPointToMatch
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  double v9;
  void *i;
  CRLConnectionLineOrthogonalLayout *v11;
  uint64_t v12;
  void *v13;
  char isKindOfClass;
  void *v15;
  void *v16;
  double v17;
  double v18;
  uint64_t v19;
  float64x2_t v20;
  float64x2_t v21;
  float64x2_t v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  float64x2_t v28;
  float64x2_t v29;
  float64x2_t v30;
  float64x2_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  CGPoint result;

  v3 = INFINITY;
  v4 = INFINITY;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineAbstractLayout connectedFrom](self, "connectedFrom"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "connectedLayouts"));

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v33;
    v9 = 1.79769313e308;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v33 != v8)
          objc_enumerationMutation(v6);
        v11 = *(CRLConnectionLineOrthogonalLayout **)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)i);
        if (v11 != self)
        {
          v12 = objc_opt_self(CRLConnectionLineOrthogonalLayout);
          v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
          isKindOfClass = objc_opt_isKindOfClass(v11, v13);

          if ((isKindOfClass & 1) != 0)
          {
            if (-[CRLConnectionLineOrthogonalLayout p_connectionLineComingFromSideOfOriginObject:](self, "p_connectionLineComingFromSideOfOriginObject:", v11))
            {
              v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineAbstractLayout connectionLineInfo](v11, "connectionLineInfo"));
              v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "connectionLinePathSource"));

              objc_msgSend(v16, "getControlKnobPosition:", 12);
              v26 = v18;
              v27 = v17;
              if (v11)
              {
                -[CRLCanvasAbstractLayout transform](v11, "transform", *(_QWORD *)&v18, v19, *(_QWORD *)&v17);
                v20 = v29;
                v21 = v30;
                v22 = v31;
              }
              else
              {
                v30 = 0u;
                v31 = 0u;
                v22 = 0uLL;
                v20 = 0uLL;
                v21 = 0uLL;
                v29 = 0u;
              }
              v28 = vaddq_f64(v22, vmlaq_n_f64(vmulq_n_f64(v21, v26), v20, v27));
              v23 = sub_10006108C(v28.f64[0], v28.f64[1], *(double *)((char *)&self->mLastPtA.x + 3), *(double *)((char *)&self->mLastPtA.y + 3));
              if (v23 < v9)
              {
                v9 = v23;
                v3 = v28.f64[0];
                v4 = v28.f64[1];
              }

            }
          }
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v7);
  }

  v24 = v3;
  v25 = v4;
  result.y = v25;
  result.x = v24;
  return result;
}

- (BOOL)p_tailComingFromNorth
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  BOOL v10;

  -[CRLConnectionLineOrthogonalLayout p_getLineEndPointAdjustedToCardinalForClineLayout:withHead:withTail:forLineEnd:](self, "p_getLineEndPointAdjustedToCardinalForClineLayout:withHead:withTail:forLineEnd:", self, 10, *(double *)((char *)&self->mLastPtA.x + 3), *(double *)((char *)&self->mLastPtA.y + 3), *(double *)((char *)&self->mOverriddenControlPoint.x + 3), *(double *)((char *)&self->mOverriddenControlPoint.y + 3));
  v4 = v3;
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineAbstractLayout connectedFrom](self, "connectedFrom"));
  objc_msgSend(v7, "cardinalNorthPosition");
  v10 = sub_10005FE60(v4, v6, v8, v9);

  return v10;
}

- (BOOL)p_tailComingFromSouth
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  BOOL v10;

  -[CRLConnectionLineOrthogonalLayout p_getLineEndPointAdjustedToCardinalForClineLayout:withHead:withTail:forLineEnd:](self, "p_getLineEndPointAdjustedToCardinalForClineLayout:withHead:withTail:forLineEnd:", self, 10, *(double *)((char *)&self->mLastPtA.x + 3), *(double *)((char *)&self->mLastPtA.y + 3), *(double *)((char *)&self->mOverriddenControlPoint.x + 3), *(double *)((char *)&self->mOverriddenControlPoint.y + 3));
  v4 = v3;
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineAbstractLayout connectedFrom](self, "connectedFrom"));
  objc_msgSend(v7, "cardinalSouthPosition");
  v10 = sub_10005FE60(v4, v6, v8, v9);

  return v10;
}

- (BOOL)p_connectionLineComingFromSideOfOriginObject:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  unint64_t v9;
  double v10;
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
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  BOOL v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;

  v4 = a3;
  if ((id)-[CRLConnectionLineAbstractLayout tailMagnetType](self, "tailMagnetType") == (id)1)
  {
    -[CRLConnectionLineOrthogonalLayout p_getLineEndPointAdjustedToCardinalForClineLayout:withHead:withTail:forLineEnd:](self, "p_getLineEndPointAdjustedToCardinalForClineLayout:withHead:withTail:forLineEnd:", self, 10, *(double *)((char *)&self->mLastPtA.x + 3), *(double *)((char *)&self->mLastPtA.y + 3), *(double *)((char *)&self->mOverriddenControlPoint.x + 3), *(double *)((char *)&self->mOverriddenControlPoint.y + 3));
    v6 = v5;
    v8 = v7;
  }
  else
  {
    v6 = *(double *)((char *)&self->mOverriddenControlPoint.x + 3);
    v8 = *(double *)((char *)&self->mOverriddenControlPoint.y + 3);
  }
  v9 = -[CRLConnectionLineAbstractLayout headMagnetType](self, "headMagnetType");
  v11 = *(double *)((char *)&self->mLastPtA.x + 3);
  v10 = *(double *)((char *)&self->mLastPtA.y + 3);
  if (v9 == 1)
  {
    -[CRLConnectionLineOrthogonalLayout p_getLineEndPointAdjustedToCardinalForClineLayout:withHead:withTail:forLineEnd:](self, "p_getLineEndPointAdjustedToCardinalForClineLayout:withHead:withTail:forLineEnd:", self, 11, v11, v10, *(double *)((char *)&self->mOverriddenControlPoint.x + 3), *(double *)((char *)&self->mOverriddenControlPoint.y + 3));
    v11 = v12;
    v10 = v13;
  }
  if (objc_msgSend(v4, "tailMagnetType") == (id)1)
  {
    objc_msgSend(v4, "headMagnetCanvasPosition");
    v15 = v14;
    v17 = v16;
    objc_msgSend(v4, "tailMagnetCanvasPosition");
    -[CRLConnectionLineOrthogonalLayout p_getLineEndPointAdjustedToCardinalForClineLayout:withHead:withTail:forLineEnd:](self, "p_getLineEndPointAdjustedToCardinalForClineLayout:withHead:withTail:forLineEnd:", self, 10, v15, v17, v18, v19);
  }
  else
  {
    objc_msgSend(v4, "tailMagnetCanvasPosition");
  }
  v22 = v20;
  v23 = v21;
  if (objc_msgSend(v4, "headMagnetType") == (id)1)
  {
    objc_msgSend(v4, "headMagnetCanvasPosition");
    v25 = v24;
    v27 = v26;
    objc_msgSend(v4, "tailMagnetCanvasPosition");
    -[CRLConnectionLineOrthogonalLayout p_getLineEndPointAdjustedToCardinalForClineLayout:withHead:withTail:forLineEnd:](self, "p_getLineEndPointAdjustedToCardinalForClineLayout:withHead:withTail:forLineEnd:", self, 11, v25, v27, v28, v29);
  }
  else
  {
    objc_msgSend(v4, "headMagnetCanvasPosition");
  }
  v32 = v30;
  v33 = v31;
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "connectedTo"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineAbstractLayout connectedTo](self, "connectedTo"));
  if (v34 == v35 && sub_10006108C(v32, v33, v11, v10) < 5.0)
  {
    v36 = 1;
  }
  else
  {
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "connectedFrom"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineAbstractLayout connectedTo](self, "connectedTo"));
    if (v37 == v38 && sub_10006108C(v22, v23, v11, v10) < 5.0)
    {
      v36 = 1;
    }
    else
    {
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "connectedTo"));
      v40 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineAbstractLayout connectedFrom](self, "connectedFrom"));
      if (v39 == v40 && sub_10006108C(v32, v33, v6, v8) < 5.0)
      {
        v36 = 1;
      }
      else
      {
        v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "connectedFrom"));
        v42 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineAbstractLayout connectedFrom](self, "connectedFrom"));
        v36 = v41 == v42 && sub_10006108C(v22, v23, v6, v8) < 5.0;

      }
    }

  }
  return v36;
}

- (CGPoint)p_getLineEndPointAdjustedToCardinalForClineLayout:(id)a3 withHead:(CGPoint)a4 withTail:(CGPoint)a5 forLineEnd:(unint64_t)a6
{
  double y;
  double x;
  double v9;
  double v10;
  id v11;
  void *v12;
  double v13;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGPoint result;

  y = a5.y;
  x = a5.x;
  v9 = a4.y;
  v10 = a4.x;
  v11 = a3;
  v12 = v11;
  if (a6 == 11)
  {
    x = v10;
    v13 = v9;
  }
  else
  {
    v13 = y;
  }
  if (v9 > y && a6 == 11)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "connectedTo"));
    objc_msgSend(v16, "cardinalNorthPosition");
    goto LABEL_20;
  }
  if (y > v9 && a6 == 10)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "connectedFrom"));
    objc_msgSend(v16, "cardinalNorthPosition");
    goto LABEL_20;
  }
  if (y > v9 && a6 == 11)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "connectedTo"));
    objc_msgSend(v16, "cardinalSouthPosition");
LABEL_20:
    x = v17;
    v13 = v18;

    goto LABEL_21;
  }
  if (v9 > y && a6 == 10)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "connectedFrom"));
    objc_msgSend(v16, "cardinalSouthPosition");
    goto LABEL_20;
  }
LABEL_21:

  v19 = x;
  v20 = v13;
  result.y = v20;
  result.x = v19;
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
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
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
  double v41;
  double v42;
  void *v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  unint64_t v51;
  double *v52;
  double *v53;
  double *v54;
  uint64_t v55;
  unint64_t v56;
  uint64_t v57;
  unint64_t v58;
  char *v59;
  double *v60;
  char *v61;
  uint64_t v62;
  unint64_t v63;
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
  unint64_t v75;
  double *v76;
  double *v77;
  double *v78;
  uint64_t v79;
  unint64_t v80;
  uint64_t v81;
  unint64_t v82;
  char *v83;
  double *v84;
  char *v85;
  uint64_t v86;
  unint64_t v87;
  double *v88;
  double *v89;
  double *v90;
  uint64_t v91;
  unint64_t v92;
  uint64_t v93;
  unint64_t v94;
  char *v95;
  double *v96;
  char *v97;
  uint64_t v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  double v105;
  double v106;
  double v107;
  double v108;
  double v109;
  double v110;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineAbstractLayout connectedFrom](self, "connectedFrom"));
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineAbstractLayout connectedFrom](self, "connectedFrom"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "parent"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout parent](self, "parent"));
    if (v9 == v10)
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineAbstractLayout connectedFrom](self, "connectedFrom"));
    else
      v11 = 0;

  }
  else
  {
    v11 = 0;
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineAbstractLayout connectedFrom](self, "connectedFrom"));
  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineAbstractLayout connectedFrom](self, "connectedFrom"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "parent"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout parent](self, "parent"));
    if (v14 == v15)
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineAbstractLayout connectedFrom](self, "connectedFrom"));
    else
      v16 = 0;

  }
  else
  {
    v16 = 0;
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineAbstractLayout connectedPathSource](self, "connectedPathSource"));
  v18 = v17;
  if (v11)
  {
    objc_msgSend(v11, "centerForConnecting");
    v20 = v19;
    v22 = v21;
    if (v16)
    {
LABEL_15:
      objc_msgSend(v16, "centerForConnecting");
      v24 = v23;
      v26 = v25;
      goto LABEL_24;
    }
  }
  else
  {
    objc_msgSend(v17, "getControlKnobPosition:", 10);
    v28 = v27;
    v30 = v29;
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout pureGeometry](self, "pureGeometry"));
    v32 = v31;
    if (v31)
    {
      objc_msgSend(v31, "transform");
      v33 = v106;
      v34 = v105;
      v35 = v108;
      v36 = v107;
      v37 = v110;
      v38 = v109;
    }
    else
    {
      v37 = 0.0;
      v35 = 0.0;
      v33 = 0.0;
      v38 = 0.0;
      v36 = 0.0;
      v34 = 0.0;
    }
    v20 = v38 + v30 * v36 + v34 * v28;
    v22 = v37 + v30 * v35 + v33 * v28;

    if (v16)
      goto LABEL_15;
  }
  objc_msgSend(v18, "getControlKnobPosition:", 11);
  v40 = v39;
  v42 = v41;
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout pureGeometry](self, "pureGeometry"));
  v44 = v43;
  if (v43)
  {
    objc_msgSend(v43, "transform");
    v45 = v100;
    v46 = v99;
    v47 = v102;
    v48 = v101;
    v49 = v104;
    v50 = v103;
  }
  else
  {
    v49 = 0.0;
    v47 = 0.0;
    v45 = 0.0;
    v50 = 0.0;
    v48 = 0.0;
    v46 = 0.0;
  }
  v24 = v50 + v42 * v48 + v46 * v40;
  v26 = v49 + v42 * v47 + v45 * v40;

LABEL_24:
  v51 = *((_QWORD *)a3 + 2);
  v52 = (double *)*((_QWORD *)a3 + 1);
  if ((unint64_t)v52 >= v51)
  {
    v54 = *(double **)a3;
    v55 = ((uint64_t)v52 - *(_QWORD *)a3) >> 3;
    v56 = v55 + 1;
    if ((unint64_t)(v55 + 1) >> 61)
      goto LABEL_89;
    v57 = v51 - (_QWORD)v54;
    if (v57 >> 2 > v56)
      v56 = v57 >> 2;
    if ((unint64_t)v57 >= 0x7FFFFFFFFFFFFFF8)
      v58 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v58 = v56;
    if (v58)
    {
      v59 = (char *)sub_10002BA34((uint64_t)a3 + 16, v58);
      v54 = *(double **)a3;
      v52 = (double *)*((_QWORD *)a3 + 1);
    }
    else
    {
      v59 = 0;
    }
    v60 = (double *)&v59[8 * v55];
    v61 = &v59[8 * v58];
    *v60 = v20;
    v53 = v60 + 1;
    while (v52 != v54)
    {
      v62 = *((_QWORD *)v52-- - 1);
      *((_QWORD *)v60-- - 1) = v62;
    }
    *(_QWORD *)a3 = v60;
    *((_QWORD *)a3 + 1) = v53;
    *((_QWORD *)a3 + 2) = v61;
    if (v54)
      operator delete(v54);
  }
  else
  {
    *v52 = v20;
    v53 = v52 + 1;
  }
  *((_QWORD *)a3 + 1) = v53;
  v63 = *((_QWORD *)a4 + 2);
  v64 = (double *)*((_QWORD *)a4 + 1);
  if ((unint64_t)v64 >= v63)
  {
    v66 = *(double **)a4;
    v67 = ((uint64_t)v64 - *(_QWORD *)a4) >> 3;
    v68 = v67 + 1;
    if ((unint64_t)(v67 + 1) >> 61)
      goto LABEL_89;
    v69 = v63 - (_QWORD)v66;
    if (v69 >> 2 > v68)
      v68 = v69 >> 2;
    if ((unint64_t)v69 >= 0x7FFFFFFFFFFFFFF8)
      v70 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v70 = v68;
    if (v70)
    {
      v71 = (char *)sub_10002BA34((uint64_t)a4 + 16, v70);
      v66 = *(double **)a4;
      v64 = (double *)*((_QWORD *)a4 + 1);
    }
    else
    {
      v71 = 0;
    }
    v72 = (double *)&v71[8 * v67];
    v73 = &v71[8 * v70];
    *v72 = v22;
    v65 = v72 + 1;
    while (v64 != v66)
    {
      v74 = *((_QWORD *)v64-- - 1);
      *((_QWORD *)v72-- - 1) = v74;
    }
    *(_QWORD *)a4 = v72;
    *((_QWORD *)a4 + 1) = v65;
    *((_QWORD *)a4 + 2) = v73;
    if (v66)
      operator delete(v66);
  }
  else
  {
    *v64 = v22;
    v65 = v64 + 1;
  }
  *((_QWORD *)a4 + 1) = v65;
  v76 = (double *)*((_QWORD *)a3 + 1);
  v75 = *((_QWORD *)a3 + 2);
  if ((unint64_t)v76 >= v75)
  {
    v78 = *(double **)a3;
    v79 = ((uint64_t)v76 - *(_QWORD *)a3) >> 3;
    v80 = v79 + 1;
    if ((unint64_t)(v79 + 1) >> 61)
      goto LABEL_89;
    v81 = v75 - (_QWORD)v78;
    if (v81 >> 2 > v80)
      v80 = v81 >> 2;
    if ((unint64_t)v81 >= 0x7FFFFFFFFFFFFFF8)
      v82 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v82 = v80;
    if (v82)
    {
      v83 = (char *)sub_10002BA34((uint64_t)a3 + 16, v82);
      v78 = *(double **)a3;
      v76 = (double *)*((_QWORD *)a3 + 1);
    }
    else
    {
      v83 = 0;
    }
    v84 = (double *)&v83[8 * v79];
    v85 = &v83[8 * v82];
    *v84 = v24;
    v77 = v84 + 1;
    while (v76 != v78)
    {
      v86 = *((_QWORD *)v76-- - 1);
      *((_QWORD *)v84-- - 1) = v86;
    }
    *(_QWORD *)a3 = v84;
    *((_QWORD *)a3 + 1) = v77;
    *((_QWORD *)a3 + 2) = v85;
    if (v78)
      operator delete(v78);
  }
  else
  {
    *v76 = v24;
    v77 = v76 + 1;
  }
  *((_QWORD *)a3 + 1) = v77;
  v88 = (double *)*((_QWORD *)a4 + 1);
  v87 = *((_QWORD *)a4 + 2);
  if ((unint64_t)v88 < v87)
  {
    *v88 = v26;
    v89 = v88 + 1;
    goto LABEL_88;
  }
  v90 = *(double **)a4;
  v91 = ((uint64_t)v88 - *(_QWORD *)a4) >> 3;
  v92 = v91 + 1;
  if ((unint64_t)(v91 + 1) >> 61)
LABEL_89:
    sub_100007810();
  v93 = v87 - (_QWORD)v90;
  if (v93 >> 2 > v92)
    v92 = v93 >> 2;
  if ((unint64_t)v93 >= 0x7FFFFFFFFFFFFFF8)
    v94 = 0x1FFFFFFFFFFFFFFFLL;
  else
    v94 = v92;
  if (v94)
  {
    v95 = (char *)sub_10002BA34((uint64_t)a4 + 16, v94);
    v90 = *(double **)a4;
    v88 = (double *)*((_QWORD *)a4 + 1);
  }
  else
  {
    v95 = 0;
  }
  v96 = (double *)&v95[8 * v91];
  v97 = &v95[8 * v94];
  *v96 = v26;
  v89 = v96 + 1;
  while (v88 != v90)
  {
    v98 = *((_QWORD *)v88-- - 1);
    *((_QWORD *)v96-- - 1) = v98;
  }
  *(_QWORD *)a4 = v96;
  *((_QWORD *)a4 + 1) = v89;
  *((_QWORD *)a4 + 2) = v97;
  if (v90)
    operator delete(v90);
LABEL_88:
  *((_QWORD *)a4 + 1) = v89;

}

- (CGPoint)getControlKnobPosition:(unint64_t)a3
{
  void *v5;
  double v6;
  double v7;
  float64_t v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  double v14;
  double v15;
  float64x2_t v16;
  float64x2_t v17;
  float64x2_t v18;
  double v19;
  double v20;
  double v21;
  float64x2_t v22;
  float64x2_t v23;
  double v24;
  float64x2_t v25;
  CGAffineTransform v26;
  CGAffineTransform v27;
  void *__p;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  CGAffineTransform v34;
  void *v35;
  _BYTE *v36;
  uint64_t v37;
  void *v38;
  _BYTE *v39;
  uint64_t v40;
  CGPoint result;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineAbstractLayout connectedPathSource](self, "connectedPathSource"));
  objc_msgSend(v5, "getControlKnobPosition:", a3);
  v7 = v6;
  v23.f64[0] = v8;
  if (a3 == 12)
  {
    v38 = 0;
    v39 = 0;
    v40 = 0;
    v35 = 0;
    v36 = 0;
    v37 = 0;
    -[CRLConnectionLineOrthogonalLayout addEndpointSnapsToXs:andYs:](self, "addEndpointSnapsToXs:andYs:", &v38, &v35);
    memset(&v34, 0, sizeof(v34));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout pureGeometry](self, "pureGeometry"));
    v10 = v9;
    if (v9)
      objc_msgSend(v9, "transform");
    else
      memset(&v34, 0, sizeof(v34));

    v11 = *(_OWORD *)&v34.a;
    v12 = *(_OWORD *)&v34.c;
    v13 = *(_OWORD *)&v34.tx;
    v32 = 0;
    v33 = 0;
    v31 = 0;
    sub_1002318DC(&v31, v38, (uint64_t)v39, (v39 - (_BYTE *)v38) >> 3);
    __p = 0;
    v29 = 0;
    v30 = 0;
    sub_1002318DC(&__p, v35, (uint64_t)v36, (v36 - (_BYTE *)v35) >> 3);
    -[CRLConnectionLineOrthogonalLayout axisSnapPoint:toXs:toYs:withThreshold:](self, "axisSnapPoint:toXs:toYs:withThreshold:", &v31, &__p, *(double *)&v13 + v7 * *(double *)&v12 + *(double *)&v11 * v23.f64[0], *((double *)&v13 + 1) + v7 * *((double *)&v12 + 1) + *((double *)&v11 + 1) * v23.f64[0], 2.0);
    v21 = v15;
    v24 = v14;
    if (__p)
    {
      v29 = __p;
      operator delete(__p);
    }
    if (v31)
    {
      v32 = v31;
      operator delete(v31);
    }
    v26 = v34;
    CGAffineTransformInvert(&v27, &v26);
    v16 = vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v27.c, v21), *(float64x2_t *)&v27.a, v24);
    v17 = *(float64x2_t *)&v27.tx;
    if (v35)
    {
      v36 = v35;
      v22 = *(float64x2_t *)&v27.tx;
      v25 = v16;
      operator delete(v35);
      v17 = v22;
      v16 = v25;
    }
    v18 = vaddq_f64(v17, v16);
    v23 = v18;
    if (v38)
    {
      v39 = v38;
      operator delete(v38);
      v18.f64[1] = v23.f64[1];
    }
    v7 = v18.f64[1];
  }

  v19 = v23.f64[0];
  v20 = v7;
  result.y = v20;
  result.x = v19;
  return result;
}

- (void)dynamicallyMovedSmartShapeKnobTo:(CGPoint)a3 withTracker:(id)a4
{
  double y;
  double x;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  unsigned __int128 v14;
  void *v15;
  uint64_t v16;
  id v17;
  CRLConnectionLineOrthogonalLayout *v18;
  void *i;
  CRLConnectionLineOrthogonalLayout *v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t j;
  float64_t v30;
  float64_t v31;
  double v32;
  double v33;
  double v34;
  _QWORD *v35;
  _QWORD *v36;
  _QWORD *v37;
  _QWORD *v38;
  _QWORD *v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  unint64_t v43;
  char *v44;
  _QWORD *v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  unint64_t v49;
  char *v50;
  char *v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  void *v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  _BOOL4 v61;
  void *v62;
  void *v63;
  double a;
  double b;
  double c;
  double d;
  double ty;
  double tx;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  id v77;
  id obj;
  uint64_t v79;
  objc_super v80;
  CGAffineTransform v81;
  CGAffineTransform v82;
  void *v83;
  void *v84;
  uint64_t v85;
  void *v86;
  void *v87;
  uint64_t v88;
  float64x2_t v89;
  float64x2_t v90;
  float64x2_t v91;
  float64x2_t v92;
  float64x2_t v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  void *v98;
  _QWORD *v99;
  unint64_t v100;
  void *__p;
  _QWORD *v102;
  unint64_t v103;
  __int128 v104;
  __int128 v105;
  unsigned __int128 v106;
  _BYTE v107[128];

  y = a3.y;
  x = a3.x;
  v77 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "knob"));
  v8 = objc_msgSend(v7, "tag");

  if (v8 == (id)12)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout originalGeometry](self, "originalGeometry"));
    v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "transform");
      v11 = *(double *)&v104;
      v74 = *((double *)&v105 + 1);
      v12 = *(double *)&v105;
      v75 = *((double *)&v104 + 1);
      v14 = v106;
      *(_QWORD *)&v76 = v14 >> 64;
      *(_QWORD *)&v13 = v14;
    }
    else
    {
      v105 = 0u;
      v106 = 0u;
      v104 = 0u;
      v75 = 0.0;
      v76 = 0.0;
      v74 = 0.0;
      v13 = 0.0;
      v12 = 0.0;
      v11 = 0.0;
    }

    __p = 0;
    v102 = 0;
    v103 = 0;
    v98 = 0;
    v99 = 0;
    v100 = 0;
    -[CRLConnectionLineOrthogonalLayout addEndpointSnapsToXs:andYs:](self, "addEndpointSnapsToXs:andYs:", &__p, &v98);
    v96 = 0u;
    v97 = 0u;
    v94 = 0u;
    v95 = 0u;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout parent](self, "parent"));
    obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "children"));

    v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v94, v107, 16);
    if (v17)
    {
      v79 = *(_QWORD *)v95;
      v18 = self;
      do
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(_QWORD *)v95 != v79)
            objc_enumerationMutation(obj);
          v20 = *(CRLConnectionLineOrthogonalLayout **)(*((_QWORD *)&v94 + 1) + 8 * (_QWORD)i);
          if (v20 != self)
          {
            objc_opt_class(CRLConnectionLineOrthogonalLayout, v16);
            v22 = sub_100221D0C(v21, v20);
            v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
            v24 = v23;
            if (v23)
            {
              v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "path"));
              v92 = 0u;
              v93 = 0u;
              v91 = 0u;
              v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "pureGeometry"));
              v27 = v26;
              if (v26)
              {
                objc_msgSend(v26, "transform");
              }
              else
              {
                v92 = 0u;
                v93 = 0u;
                v91 = 0u;
              }

              objc_msgSend(v25, "elementAtIndex:associatedPoints:", 0, &v90);
              v90 = vaddq_f64(v93, vmlaq_n_f64(vmulq_n_f64(v92, v90.f64[1]), v91, v90.f64[0]));
              v28 = objc_msgSend(v25, "elementCount");
              if ((unint64_t)v28 >= 2)
              {
                for (j = 1; (id)j != v28; ++j)
                {
                  objc_msgSend(v25, "elementAtIndex:associatedPoints:", j, &v89, *(_QWORD *)&v74, *(_QWORD *)&v75, *(_QWORD *)&v76);
                  v30 = v90.f64[0];
                  v89 = vaddq_f64(v93, vmlaq_n_f64(vmulq_n_f64(v92, v89.f64[1]), v91, v89.f64[0]));
                  v31 = v90.f64[1];
                  v32 = fabs(sub_1000603B8(v89.f64[0], v89.f64[1], v90.f64[0]));
                  v34 = fabs(v33);
                  if (v32 >= 0.1 || v34 <= 0.1)
                  {
                    if (v32 <= 0.1 || v34 >= 0.1)
                      goto LABEL_56;
                    v37 = v99;
                    if ((unint64_t)v99 >= v100)
                    {
                      v45 = v98;
                      v46 = ((char *)v99 - (_BYTE *)v98) >> 3;
                      v47 = v46 + 1;
                      if ((unint64_t)(v46 + 1) >> 61)
LABEL_79:
                        sub_100007810();
                      v48 = v100 - (_QWORD)v98;
                      if ((uint64_t)(v100 - (_QWORD)v98) >> 2 > v47)
                        v47 = v48 >> 2;
                      if ((unint64_t)v48 >= 0x7FFFFFFFFFFFFFF8)
                        v49 = 0x1FFFFFFFFFFFFFFFLL;
                      else
                        v49 = v47;
                      if (v49)
                      {
                        v50 = (char *)sub_10002BA34((uint64_t)&v100, v49);
                        v45 = v98;
                        v37 = v99;
                        v31 = v90.f64[1];
                      }
                      else
                      {
                        v50 = 0;
                      }
                      v53 = &v50[8 * v46];
                      *(float64_t *)v53 = v31;
                      v38 = v53 + 8;
                      while (v37 != v45)
                      {
                        v54 = *--v37;
                        *((_QWORD *)v53 - 1) = v54;
                        v53 -= 8;
                      }
                      v98 = v53;
                      v99 = v38;
                      v100 = (unint64_t)&v50[8 * v49];
                      if (v45)
                        operator delete(v45);
                    }
                    else
                    {
                      *(float64_t *)v99 = v31;
                      v38 = v37 + 1;
                    }
                    v99 = v38;
                  }
                  else
                  {
                    v35 = v102;
                    if ((unint64_t)v102 >= v103)
                    {
                      v39 = __p;
                      v40 = ((char *)v102 - (_BYTE *)__p) >> 3;
                      v41 = v40 + 1;
                      if ((unint64_t)(v40 + 1) >> 61)
                        goto LABEL_79;
                      v42 = v103 - (_QWORD)__p;
                      if ((uint64_t)(v103 - (_QWORD)__p) >> 2 > v41)
                        v41 = v42 >> 2;
                      if ((unint64_t)v42 >= 0x7FFFFFFFFFFFFFF8)
                        v43 = 0x1FFFFFFFFFFFFFFFLL;
                      else
                        v43 = v41;
                      if (v43)
                      {
                        v44 = (char *)sub_10002BA34((uint64_t)&v103, v43);
                        v39 = __p;
                        v35 = v102;
                        v30 = v90.f64[0];
                      }
                      else
                      {
                        v44 = 0;
                      }
                      v51 = &v44[8 * v40];
                      *(float64_t *)v51 = v30;
                      v36 = v51 + 8;
                      while (v35 != v39)
                      {
                        v52 = *--v35;
                        *((_QWORD *)v51 - 1) = v52;
                        v51 -= 8;
                      }
                      __p = v51;
                      v102 = v36;
                      v103 = (unint64_t)&v44[8 * v43];
                      if (v39)
                        operator delete(v39);
                    }
                    else
                    {
                      *(float64_t *)v102 = v30;
                      v36 = v35 + 1;
                    }
                    v102 = v36;
                  }
                  self = v18;
LABEL_56:
                  v90 = v89;
                }
              }

            }
          }
        }
        v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v94, v107, 16);
      }
      while (v17);
    }

    v86 = 0;
    v87 = 0;
    v88 = 0;
    sub_1002318DC(&v86, __p, (uint64_t)v102, ((char *)v102 - (_BYTE *)__p) >> 3);
    v83 = 0;
    v84 = 0;
    v85 = 0;
    sub_1002318DC(&v83, v98, (uint64_t)v99, ((char *)v99 - (_BYTE *)v98) >> 3);
    v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "icc"));
    objc_msgSend(v55, "viewScale");
    -[CRLConnectionLineOrthogonalLayout axisSnapPoint:toXs:toYs:withThreshold:](self, "axisSnapPoint:toXs:toYs:withThreshold:", &v86, &v83, v13 + y * v12 + v11 * x, v76 + y * v74 + v75 * x, (double)7 / v56);
    v58 = v57;
    v60 = v59;

    if (v83)
    {
      v84 = v83;
      operator delete(v83);
    }
    if (v86)
    {
      v87 = v86;
      operator delete(v86);
    }
    v61 = sub_10006108C(*(double *)((char *)&self->mOverriddenControlPoint.x + 3), *(double *)((char *)&self->mOverriddenControlPoint.y + 3), v58, v60) >= 10.0&& sub_10006108C(*(double *)((char *)&self->mLastPtA.x + 3), *(double *)((char *)&self->mLastPtA.y + 3), v58, v60) >= 10.0;
    if (-[CRLConnectionLineAbstractLayout userDidSetControlPoint](self, "userDidSetControlPoint", *(_QWORD *)&v74, *(_QWORD *)&v75, *(_QWORD *)&v76)&& !v61)
    {
      v58 = *(double *)((char *)&self->mSnappedUserSetControlPoint.x + 3);
      v60 = *(double *)((char *)&self->mSnappedUserSetControlPoint.y + 3);
    }
    v62 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout originalGeometry](self, "originalGeometry"));
    v63 = v62;
    if (v62)
      objc_msgSend(v62, "transform");
    else
      memset(&v81, 0, sizeof(v81));
    CGAffineTransformInvert(&v82, &v81);
    a = v82.a;
    b = v82.b;
    c = v82.c;
    d = v82.d;
    tx = v82.tx;
    ty = v82.ty;

    v70 = v60 * c;
    v71 = v60 * d;
    if (v98)
    {
      v99 = v98;
      operator delete(v98);
    }
    v72 = v70 + a * v58;
    v73 = v71 + b * v58;
    if (__p)
    {
      v102 = __p;
      operator delete(__p);
    }
    x = tx + v72;
    y = ty + v73;
  }
  v80.receiver = self;
  v80.super_class = (Class)CRLConnectionLineOrthogonalLayout;
  -[CRLConnectionLineAbstractLayout dynamicallyMovedSmartShapeKnobTo:withTracker:](&v80, "dynamicallyMovedSmartShapeKnobTo:withTracker:", v77, x, y);

}

- (CGPoint)outsetFromMagnetPosition:(CGPoint)a3 withRect:(CGRect)a4 controlPoint:(CGPoint)a5 distance:(double)a6
{
  double height;
  double width;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  float v16;
  float v17;
  double v18;
  __double2 v19;
  double v20;
  double v21;
  double v22;
  double v24;
  double v28;
  double v29;
  double x;
  double v31;
  double v32;
  double v33;
  double v34;
  double y;
  CGPoint result;

  y = a5.y;
  x = a5.x;
  height = a4.size.height;
  width = a4.size.width;
  v8 = a4.origin.y;
  v9 = a4.origin.x;
  v10 = a3.y;
  v11 = a3.x;
  v12 = sub_100061400(a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  v14 = v13;
  v31 = height;
  v15 = sqrt(height * height + width * width) * 0.5 + 2.0;
  v16 = v10 - v13;
  *(float *)&v13 = v11 - v12;
  v17 = atan2f(v16, *(float *)&v13);
  sub_100062084(v17);
  v34 = v12;
  v19 = __sincos_stret(v18);
  v33 = v14;
  v20 = v19.__sinval * (v15 - vabdd_f64(v10, v14));
  v21 = v11 + v19.__cosval * (v15 - vabdd_f64(v11, v12));
  v22 = v10 + v20;
  if (sub_100060A50(v11, v10, v21, v10 + v20, v9, v8, v9 + width, v8))
  {
    if (y <= v8 - a6 || y > v10 + 2.0)
      v10 = v8 - a6;
    else
      v10 = y;
  }
  else
  {
    v24 = v8 + v31;
    v32 = v9 + width;
    if (sub_100060A50(v34, v33, v21, v22, v9, v24, v9 + width, v24))
    {
      if (y >= v24 + a6 || y < v10 + -2.0)
        v10 = v24 + a6;
      else
        v10 = y;
    }
    else if (sub_100060A50(v34, v33, v21, v22, v9, v8, v9, v24))
    {
      if (x <= v9 - a6 || x > v11 + 2.0)
        v11 = v9 - a6;
      else
        v11 = x;
    }
    else if (x >= v32 + a6 || x < v11 + -2.0)
    {
      v11 = v32 + a6;
    }
    else
    {
      v11 = x;
    }
  }
  v28 = v11;
  v29 = v10;
  result.y = v29;
  result.x = v28;
  return result;
}

@end
