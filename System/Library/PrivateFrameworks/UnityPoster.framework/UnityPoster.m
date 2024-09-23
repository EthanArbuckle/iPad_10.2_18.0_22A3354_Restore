double UPSubtractPoints(double a1, double a2, double a3)
{
  return a1 - a3;
}

id UPQuiltCornerBezierPath(void *a1, double a2, double a3, double a4, double a5, double a6, double a7)
{
  void *v13;
  id v14;
  void *v15;

  v13 = (void *)MEMORY[0x24BEBD420];
  v14 = a1;
  objc_msgSend(v13, "bezierPath");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "moveToPoint:", a6, a7);
  UPBezierPathAddValues(v15, v14, a6, a7, a4, a5, *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));

  objc_msgSend(v15, "addLineToPoint:", a2, a3);
  objc_msgSend(v15, "addLineToPoint:", a6, a7);
  objc_msgSend(v15, "closePath");
  return v15;
}

double UPBezierPathAddValues(void *a1, void *a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v20;
  void *v21;
  float v22;
  float v23;
  float v24;
  double v25;
  double *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  double v31;
  _QWORD v33[4];
  id v34;
  id v35;
  _QWORD *v36;
  _QWORD *v37;
  uint64_t *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  _QWORD v43[4];
  _QWORD v44[4];
  uint64_t v45;
  double *v46;
  uint64_t v47;
  void *v48;
  double v49;
  double v50;

  v15 = a1;
  v16 = a2;
  UPOrderedKeysForValues(v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  v45 = 0;
  v46 = (double *)&v45;
  v47 = 0x3010000000;
  v49 = 0.0;
  v50 = 0.0;
  v48 = &unk_226FF87DE;
  if (a7 == *MEMORY[0x24BDBEFB0] && a8 == *(double *)(MEMORY[0x24BDBEFB0] + 8))
  {
    v28 = 0;
    v49 = a3;
    v50 = a4;
  }
  else
  {
    objc_msgSend(v17, "firstObject");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKey:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "floatValue");
    v23 = v22;
    objc_msgSend(v21, "floatValue");
    v25 = UPTangentialPointFromLine(a3, a4, a5, a6, v23, v24);
    v26 = v46;
    v46[4] = v25;
    *((_QWORD *)v26 + 5) = v27;
    objc_msgSend(v15, "addQuadCurveToPoint:controlPoint:");

    v28 = 1;
  }
  if (objc_msgSend(v18, "count"))
  {
    v29 = objc_msgSend(v18, "count");
    objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndexesInRange:", v28, v29 - v28);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v44[0] = 0;
    v44[1] = v44;
    v44[2] = 0x2020000000;
    v44[3] = 0;
    v43[0] = 0;
    v43[1] = v43;
    v43[2] = 0x2020000000;
    v43[3] = 0;
    v33[0] = MEMORY[0x24BDAC760];
    v33[1] = 3221225472;
    v33[2] = __UPBezierPathAddValues_block_invoke;
    v33[3] = &unk_24EF48600;
    v39 = a3;
    v40 = a4;
    v41 = a5;
    v42 = a6;
    v34 = v16;
    v36 = v44;
    v37 = v43;
    v35 = v15;
    v38 = &v45;
    objc_msgSend(v18, "enumerateObjectsAtIndexes:options:usingBlock:", v30, 0, v33);

    _Block_object_dispose(v43, 8);
    _Block_object_dispose(v44, 8);

  }
  v31 = v46[4];
  _Block_object_dispose(&v45, 8);

  return v31;
}

void sub_226FF3D94(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

id UPQuiltPieceTopBezierPath(void *a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9)
{
  void *v17;
  id v18;
  void *v19;

  v17 = (void *)MEMORY[0x24BEBD420];
  v18 = a1;
  objc_msgSend(v17, "bezierPath");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "moveToPoint:", a2, a3);
  objc_msgSend(v19, "addLineToPoint:", a4, a5);
  objc_msgSend(v19, "addLineToPoint:", a8, a9);
  UPBezierPathAddValues(v19, v18, a8, a9, a6, a7, *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));

  objc_msgSend(v19, "addLineToPoint:", a2, a3);
  objc_msgSend(v19, "closePath");
  return v19;
}

id UPQuiltPieceBottomBezierPath(void *a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9)
{
  void *v17;
  id v18;
  void *v19;

  v17 = (void *)MEMORY[0x24BEBD420];
  v18 = a1;
  objc_msgSend(v17, "bezierPath");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "moveToPoint:", a2, a3);
  objc_msgSend(v19, "addLineToPoint:", a4, a5);
  UPBezierPathAddValues(v19, v18, a4, a5, a8, a9, *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));

  objc_msgSend(v19, "addLineToPoint:", a6, a7);
  objc_msgSend(v19, "addLineToPoint:", a2, a3);
  objc_msgSend(v19, "closePath");
  return v19;
}

id UPOrderedKeysForValues(void *a1)
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "allKeys");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "sortedArrayUsingComparator:", &__block_literal_global);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

double UPTangentialPointFromLine(double a1, double a2, double a3, double a4, double a5, double a6)
{
  double v9;
  double v10;
  float v11;
  float v12;

  v9 = a3 - a1;
  v10 = -1.0 / ((a4 - a2) / (a3 - a1));
  v11 = v10;
  v12 = atanf(v11);
  if (v10 <= 0.0)
    v12 = -v12;
  return a1 + v9 * fmin(fmax(a5, 0.0), 1.0) + a6 * -50.0 * __sincosf_stret(v12).__cosval;
}

double UPFloatForNumber(void *a1)
{
  float v1;

  objc_msgSend(a1, "floatValue");
  return v1;
}

double UPBeierGetPointOnLine(double a1, double a2, double a3, double a4, double a5)
{
  return a3 * (1.0 - a5) + a5 * a1;
}

double UPBezierExtrapolatePointOnLine()
{
  return -50.0;
}

double UPInterpolateBetweenPointsUnclipped(double a1, double a2, double a3, double a4, double a5)
{
  return a1 + (a3 - a1) * a5;
}

double UPInterpolateBetweenPoints(double a1, double a2, double a3, double a4, double a5)
{
  return a1 + (a3 - a1) * fmin(fmax(a5, 0.0), 1.0);
}

double UPTangentialInterceptingFractionOnLine(double a1, double a2, double a3, double a4, double a5, double a6)
{
  return ((a6 - -1.0 / ((a4 - a2) / (a3 - a1)) * a5 - (a2 - (a4 - a2) / (a3 - a1) * a1))
        / ((a4 - a2) / (a3 - a1) - -1.0 / ((a4 - a2) / (a3 - a1)))
        - a1)
       / (a3 - a1);
}

double UPHorizontalFractionOnLine(double a1, double a2, double a3, double a4, double a5)
{
  return a5 / (a3 - a1);
}

double UPLengthBetweenPoints(double a1, double a2, double a3, double a4)
{
  float v4;
  float v5;

  v4 = a1 - a3;
  v5 = a2 - a4;
  return sqrtf((float)(v4 * v4) + (float)(v5 * v5));
}

CGFloat UPHorizontallyCenteredFrameWithEdgeInsets(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, double a5, double a6, double a7)
{
  double v11;
  CGRect v13;

  v11 = (a5 + a7) * (CGRectGetWidth(*(CGRect *)&a1) * 0.5);
  v13.origin.x = a1;
  v13.origin.y = a2;
  v13.size.width = a3;
  v13.size.height = a4;
  return a1 + v11 / CGRectGetHeight(v13);
}

void UPBuildPathElement(void *a1, uint64_t a2)
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  UPBezierPathElement *v8;
  id v9;

  v9 = a1;
  if (objc_msgSend(v9, "count"))
  {
    objc_msgSend(v9, "lastObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "endPoint");
    v5 = v4;
    v7 = v6;

  }
  else
  {
    v5 = *MEMORY[0x24BDBEFB0];
    v7 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  }
  v8 = -[UPBezierPathElement initWithStartPoint:pathElement:]([UPBezierPathElement alloc], "initWithStartPoint:pathElement:", a2, v5, v7);
  objc_msgSend(v9, "addObject:", v8);

}

id UPInterpolateBetweenBezierPaths(void *a1, void *a2, double a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  double v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  void *v18;
  void *v19;
  int v20;
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
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  uint64_t v44;
  uint64_t v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  uint64_t v54;
  uint64_t v55;
  double v56;
  double v57;
  uint64_t v58;
  uint64_t v59;
  id v60;
  id v61;
  unint64_t i;
  void *v63;
  void *v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  uint64_t v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  uint64_t v102;
  double v103;
  double v104;
  double v105;
  double v106;
  double v107;
  double v108;
  uint64_t v109;
  unint64_t v110;
  void *v111;
  void *v112;
  double v113;
  double v114;
  double v115;
  double v116;
  double v117;
  double v118;
  double v119;
  double v120;
  double v121;
  double v122;
  double v123;
  double v124;
  double v125;
  double v126;
  double v127;
  double v128;
  double v129;
  double v130;
  double v131;
  double v132;
  uint64_t v133;
  double v134;
  double v135;
  double v136;
  double v137;
  double v138;
  double v139;
  double v140;
  double v141;
  double v142;
  double v143;
  uint64_t v144;
  double v145;
  double v146;
  double v147;
  double v148;
  uint64_t v149;
  double v150;
  double v151;

  v5 = a1;
  v6 = a2;
  v7 = v6;
  if (!v5)
  {
    v60 = v6;
LABEL_24:
    v61 = v60;
    goto LABEL_44;
  }
  if (!v6)
  {
    v60 = v5;
    goto LABEL_24;
  }
  objc_msgSend(MEMORY[0x24BEBD420], "bezierPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_retainAutorelease(v5);
  CGPathApply((CGPathRef)objc_msgSend(v10, "CGPath"), v9, (CGPathApplierFunction)UPBuildPathElement);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_retainAutorelease(v7);
  CGPathApply((CGPathRef)objc_msgSend(v12, "CGPath"), v11, (CGPathApplierFunction)UPBuildPathElement);
  if (objc_msgSend(v9, "count"))
  {
    if (objc_msgSend(v11, "count"))
    {
      v13 = fmin(fmax(a3, 0.0), 1.0);
      v14 = objc_msgSend(v9, "count");
      v15 = objc_msgSend(v11, "count");
      if (v14 >= v15)
        v16 = v15;
      else
        v16 = v14;
      if (v16)
      {
        v17 = 0;
        do
        {
          objc_msgSend(v9, "objectAtIndexedSubscript:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "objectAtIndexedSubscript:", v17);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v18, "type");
          if (v20 == objc_msgSend(v19, "type"))
          {
            switch(objc_msgSend(v18, "type"))
            {
              case 0u:
                objc_msgSend(v18, "endPoint");
                v22 = v21;
                v24 = v23;
                objc_msgSend(v19, "endPoint");
                objc_msgSend(v8, "moveToPoint:", v22 + (v25 - v22) * v13, v24 + (v26 - v24) * v13);
                break;
              case 1u:
                goto LABEL_13;
              case 2u:
                objc_msgSend(v18, "endPoint");
                v37 = v36;
                v39 = v38;
                objc_msgSend(v19, "endPoint");
                v41 = v37 + (v40 - v37) * v13;
                v43 = v39 + (v42 - v39) * v13;
                v44 = objc_msgSend(v18, "points");
                v45 = objc_msgSend(v19, "points");
                objc_msgSend(v8, "addQuadCurveToPoint:controlPoint:", v41, v43, *(double *)(v44 + 16) + (*(double *)(v45 + 16) - *(double *)(v44 + 16)) * v13, *(double *)(v44 + 24) + (*(double *)(v45 + 24) - *(double *)(v44 + 24)) * v13);
                break;
              case 3u:
                objc_msgSend(v18, "endPoint");
                v47 = v46;
                v49 = v48;
                objc_msgSend(v19, "endPoint");
                v51 = v47 + (v50 - v47) * v13;
                v53 = v49 + (v52 - v49) * v13;
                v54 = objc_msgSend(v18, "points");
                v55 = objc_msgSend(v19, "points");
                v56 = *(double *)(v54 + 16) + (*(double *)(v55 + 16) - *(double *)(v54 + 16)) * v13;
                v57 = *(double *)(v54 + 24) + (*(double *)(v55 + 24) - *(double *)(v54 + 24)) * v13;
                v58 = objc_msgSend(v18, "points");
                v59 = objc_msgSend(v19, "points");
                objc_msgSend(v8, "addCurveToPoint:controlPoint1:controlPoint2:", v51, v53, v56, v57, *(double *)(v58 + 32) + (*(double *)(v59 + 32) - *(double *)(v58 + 32)) * v13, *(double *)(v58 + 40) + (*(double *)(v59 + 40) - *(double *)(v58 + 40)) * v13);
                break;
              case 4u:
                objc_msgSend(v8, "closePath");
                break;
              default:
                break;
            }
          }
          else
          {
LABEL_13:
            objc_msgSend(v18, "endPoint");
            v28 = v27;
            v30 = v29;
            objc_msgSend(v19, "endPoint");
            objc_msgSend(v8, "addLineToPoint:", v28 + (v31 - v28) * v13, v30 + (v32 - v30) * v13);
          }

          ++v17;
          v33 = objc_msgSend(v9, "count");
          v34 = objc_msgSend(v11, "count");
          if (v33 >= v34)
            v35 = v34;
          else
            v35 = v33;
        }
        while (v17 < v35);
      }
      for (i = objc_msgSend(v9, "count"); i < objc_msgSend(v11, "count"); ++i)
      {
        objc_msgSend(v9, "lastObject");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectAtIndexedSubscript:", i);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        switch(objc_msgSend(v64, "type"))
        {
          case 0u:
            objc_msgSend(v63, "endPoint");
            v66 = v65;
            v68 = v67;
            objc_msgSend(v64, "endPoint");
            objc_msgSend(v8, "moveToPoint:", v66 + (v69 - v66) * v13, v68 + (v70 - v68) * v13);
            break;
          case 1u:
            objc_msgSend(v63, "endPoint");
            v72 = v71;
            v74 = v73;
            objc_msgSend(v64, "endPoint");
            objc_msgSend(v8, "addLineToPoint:", v72 + (v75 - v72) * v13, v74 + (v76 - v74) * v13);
            break;
          case 2u:
            objc_msgSend(v63, "endPoint");
            v78 = v77;
            v80 = v79;
            objc_msgSend(v64, "endPoint");
            v82 = v78 + (v81 - v78) * v13;
            v84 = v80 + (v83 - v80) * v13;
            objc_msgSend(v63, "endPoint");
            v86 = v85;
            v88 = v87;
            v89 = objc_msgSend(v64, "points");
            objc_msgSend(v8, "addQuadCurveToPoint:controlPoint:", v82, v84, v86 + (*(double *)(v89 + 16) - v86) * v13, v88 + (*(double *)(v89 + 24) - v88) * v13);
            break;
          case 3u:
            objc_msgSend(v63, "endPoint");
            v91 = v90;
            v93 = v92;
            objc_msgSend(v64, "endPoint");
            v95 = v91 + (v94 - v91) * v13;
            v97 = v93 + (v96 - v93) * v13;
            objc_msgSend(v63, "endPoint");
            v99 = v98;
            v101 = v100;
            v102 = objc_msgSend(v64, "points");
            v103 = v99 + (*(double *)(v102 + 16) - v99) * v13;
            v104 = v101 + (*(double *)(v102 + 24) - v101) * v13;
            objc_msgSend(v63, "endPoint");
            v106 = v105;
            v108 = v107;
            v109 = objc_msgSend(v64, "points");
            objc_msgSend(v8, "addCurveToPoint:controlPoint1:controlPoint2:", v95, v97, v103, v104, v106 + (*(double *)(v109 + 32) - v106) * v13, v108 + (*(double *)(v109 + 40) - v108) * v13);
            break;
          case 4u:
            objc_msgSend(v8, "closePath");
            break;
          default:
            break;
        }

      }
      v110 = objc_msgSend(v11, "count");
      v12 = v8;
      if (v110 < objc_msgSend(v9, "count"))
      {
        do
        {
          objc_msgSend(v9, "objectAtIndexedSubscript:", v110);
          v111 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "lastObject");
          v112 = (void *)objc_claimAutoreleasedReturnValue();
          switch(objc_msgSend(v112, "type"))
          {
            case 0u:
              objc_msgSend(v111, "endPoint");
              v114 = v113;
              v116 = v115;
              objc_msgSend(v112, "endPoint");
              objc_msgSend(v8, "moveToPoint:", v114 + (v117 - v114) * v13, v116 + (v118 - v116) * v13);
              break;
            case 1u:
              objc_msgSend(v111, "endPoint");
              v120 = v119;
              v122 = v121;
              objc_msgSend(v112, "endPoint");
              objc_msgSend(v8, "addLineToPoint:", v120 + (v123 - v120) * v13, v122 + (v124 - v122) * v13);
              break;
            case 2u:
              objc_msgSend(v111, "endPoint");
              v126 = v125;
              v128 = v127;
              objc_msgSend(v112, "endPoint");
              v130 = v126 + (v129 - v126) * v13;
              v132 = v128 + (v131 - v128) * v13;
              v133 = objc_msgSend(v111, "points");
              objc_msgSend(v112, "endPoint");
              objc_msgSend(v8, "addQuadCurveToPoint:controlPoint:", v130, v132, *(double *)(v133 + 16) + (v134 - *(double *)(v133 + 16)) * v13, *(double *)(v133 + 24) + (v135 - *(double *)(v133 + 24)) * v13);
              break;
            case 3u:
              objc_msgSend(v111, "endPoint");
              v137 = v136;
              v139 = v138;
              objc_msgSend(v112, "endPoint");
              v141 = v137 + (v140 - v137) * v13;
              v143 = v139 + (v142 - v139) * v13;
              v144 = objc_msgSend(v111, "points");
              objc_msgSend(v112, "endPoint");
              v146 = *(double *)(v144 + 16) + (v145 - *(double *)(v144 + 16)) * v13;
              v148 = *(double *)(v144 + 24) + (v147 - *(double *)(v144 + 24)) * v13;
              v149 = objc_msgSend(v111, "points");
              objc_msgSend(v112, "endPoint");
              objc_msgSend(v8, "addCurveToPoint:controlPoint1:controlPoint2:", v141, v143, v146, v148, *(double *)(v149 + 32) + (v150 - *(double *)(v149 + 32)) * v13, *(double *)(v149 + 40) + (v151 - *(double *)(v149 + 40)) * v13);
              break;
            case 4u:
              objc_msgSend(v8, "closePath");
              break;
            default:
              break;
          }

          ++v110;
        }
        while (v110 < objc_msgSend(v9, "count"));
        v12 = v8;
      }
    }
    else
    {
      v12 = v10;
    }
  }
  v61 = v12;

LABEL_44:
  return v61;
}

CGAffineTransform *__cdecl CGAffineTransformRotate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8F8](retstr, t, angle);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD900](retstr, t, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD908](retstr, t, tx, ty);
}

void CGPathApply(CGPathRef path, void *info, CGPathApplierFunction function)
{
  MEMORY[0x24BDBEE08](path, info, function);
}

CGPathRef CGPathCreateCopyByIntersectingPath(CGPathRef path, CGPathRef maskPath, BOOL evenOddFillRule)
{
  return (CGPathRef)MEMORY[0x24BDBEE38](path, maskPath, evenOddFillRule);
}

CGPathRef CGPathCreateCopyBySubtractingPath(CGPathRef path, CGPathRef maskPath, BOOL evenOddFillRule)
{
  return (CGPathRef)MEMORY[0x24BDBEE50](path, maskPath, evenOddFillRule);
}

CGPathRef CGPathCreateCopyByTransformingPath(CGPathRef path, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x24BDBEE60](path, transform);
}

void CGPathRelease(CGPathRef path)
{
  MEMORY[0x24BDBEF48](path);
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x24BDBEFB8](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFE8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF020]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x24BED8490]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

__float2 __sincosf_stret(float a1)
{
  float v1;
  float v2;
  __float2 result;

  MEMORY[0x24BDAC898](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

float atanf(float a1)
{
  float result;

  MEMORY[0x24BDAD230](a1);
  return result;
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

