@implementation TypistPathUtilities

+ (double)_dotProduct:(CGPoint)a3 and:(CGPoint)a4
{
  return a3.y * a4.y + a3.x * a4.x;
}

+ (CGPoint)_subtractPoint:(CGPoint)a3 byPoint:(CGPoint)a4
{
  double v4;
  double v5;
  CGPoint result;

  v4 = a3.x - a4.x;
  v5 = a3.y - a4.y;
  result.y = v5;
  result.x = v4;
  return result;
}

+ (CGPoint)_addPoint:(CGPoint)a3 andPoint:(CGPoint)a4
{
  double v4;
  double v5;
  CGPoint result;

  v4 = a3.x + a4.x;
  v5 = a3.y + a4.y;
  result.y = v5;
  result.x = v4;
  return result;
}

+ (CGPoint)_scalarMultiplyPoint:(CGPoint)a3 by:(double)a4
{
  double v4;
  double v5;
  CGPoint result;

  v4 = a3.x * a4;
  v5 = a3.y * a4;
  result.y = v5;
  result.x = v4;
  return result;
}

+ (CGPoint)_reflectPoint:(CGPoint)a3 origin:(CGPoint)a4
{
  double v4;
  double v5;
  CGPoint result;

  v4 = a4.x + a4.x - a3.x;
  v5 = a4.y + a4.y - a3.y;
  result.y = v5;
  result.x = v4;
  return result;
}

+ (CGPoint)pointOnCurve:(id)a3 atTime:(double)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  float v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  void *v45;
  double v46;
  void *v47;
  double v48;
  void *v49;
  double v50;
  void *v51;
  double v52;
  void *v53;
  double v54;
  void *v55;
  double v56;
  void *v57;
  double v58;
  double v59;
  void *v60;
  double v61;
  float v62;
  double v63;
  double v64;
  float v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  CGPoint result;

  v5 = a3;
  v6 = objc_msgSend(v5, "count");
  if (v6 == 3)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "CGPointValue");
    v14 = v13;

    objc_msgSend(v5, "objectAtIndexedSubscript:", 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "CGPointValue");
    v17 = v16;

    objc_msgSend(v5, "objectAtIndexedSubscript:", 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "CGPointValue");
    v20 = v19;

    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "CGPointValue");
    v23 = v22;

    objc_msgSend(v5, "objectAtIndexedSubscript:", 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "CGPointValue");
    v26 = v25;

    objc_msgSend(v5, "objectAtIndexedSubscript:", 2);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "CGPointValue");
    v29 = v28;

    v30 = 1.0 - a4;
    v31 = (float)(v30 * v30);
    v32 = (1.0 - a4 + 1.0 - a4) * a4;
    v9 = v32 * v17 + v31 * v14 + a4 * a4 * v20;
    v11 = v32 * v26 + v31 * v23 + a4 * a4 * v29;
    goto LABEL_9;
  }
  if (v6 == 2)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "CGPointValue");
    v35 = v34;
    v37 = v36;

    objc_msgSend(v5, "objectAtIndexedSubscript:", 1);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "CGPointValue");
    v40 = v39;
    v42 = v41;

    v43 = 1.0 - a4;
    v9 = v40 * a4 + (1.0 - a4) * v35;
    v44 = v42 * a4;
LABEL_8:
    v11 = v44 + v43 * v37;
    goto LABEL_9;
  }
  if (v6 != 1)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "CGPointValue");
    v74 = v46;

    objc_msgSend(v5, "objectAtIndexedSubscript:", 1);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "CGPointValue");
    v73 = v48;

    objc_msgSend(v5, "objectAtIndexedSubscript:", 2);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "CGPointValue");
    v72 = v50;

    objc_msgSend(v5, "objectAtIndexedSubscript:", 3);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "CGPointValue");
    v71 = v52;

    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "CGPointValue");
    v70 = v54;

    objc_msgSend(v5, "objectAtIndexedSubscript:", 1);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "CGPointValue");
    v69 = v56;

    objc_msgSend(v5, "objectAtIndexedSubscript:", 2);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "CGPointValue");
    v59 = v58;

    objc_msgSend(v5, "objectAtIndexedSubscript:", 3);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "CGPointValue");
    v37 = v61;

    v62 = 1.0 - a4;
    v63 = powf(v62, 3.0);
    v64 = a4 * 3.0 * (float)(v62 * v62);
    v65 = a4;
    v66 = (1.0 - a4) * (float)((float)(v65 * v65) * 3.0);
    v43 = powf(v65, 3.0);
    v9 = v64 * v73 + v63 * v74 + v66 * v72 + v43 * v71;
    v44 = v64 * v69 + v63 * v70 + v66 * v59;
    goto LABEL_8;
  }
  objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "CGPointValue");
  v9 = v8;
  v11 = v10;

LABEL_9:
  v67 = v9;
  v68 = v11;
  result.y = v68;
  result.x = v67;
  return result;
}

+ (CGPoint)pointOnSineCurve:(double)a3 withHeight:(double)a4 withStartPoint:(CGPoint)a5 withEndPoint:(CGPoint)a6 atTime:(double)a7
{
  CGFloat v7;
  float v8;
  double v9;
  double v10;
  CGPoint result;

  v7 = a5.x + a7 * (a6.x - a5.x);
  v8 = 6.28318531 / a3 * v7 - 6.28318531 / a3 * a5.x;
  v9 = a5.y + a4 * 0.5 * sinf(v8);
  v10 = v7;
  result.y = v9;
  result.x = v10;
  return result;
}

+ (id)convertCurveDeleteTouchPoints:(CGPoint)a3 endPoint:(CGPoint)a4 curveHeight:(double)a5 curveDensity:(int64_t)a6 tilt:(double)a7
{
  double x;
  double y;
  double (**v12)(_QWORD, double);
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v22;
  double v23;
  _QWORD v24[5];

  x = a4.x;
  y = a3.y;
  v23 = a3.x;
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __92__TypistPathUtilities_convertCurveDeleteTouchPoints_endPoint_curveHeight_curveDensity_tilt___block_invoke;
  v24[3] = &__block_descriptor_40_e8_d16__0d8l;
  v24[4] = 0x3FC5555555555555;
  v12 = (double (**)(_QWORD, double))MEMORY[0x2495B14D4](v24, a2);
  v13 = (void *)objc_opt_new();
  if (a6 >= 1)
  {
    v14 = (x - v23) / (double)a6;
    v22 = (double)(2 * a6);
    v15 = -a7;
    v16 = 0.166666667;
    do
    {
      +[TypistPathUtilities pointOnSineCurve:withHeight:withStartPoint:withEndPoint:atTime:](TypistPathUtilities, "pointOnSineCurve:withHeight:withStartPoint:withEndPoint:atTime:", v14, a5, v23, y, v23 + v14 * 0.5, y, v16);
      v18 = v17;
      *(float *)&v17 = 6.28318531 / v14 * v17 - 6.28318531 / v14 * v23;
      objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGPoint:", v18 + v15 * sinf(*(float *)&v17), v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addObject:", v20);

      v16 = v12[2](v12, v16);
    }
    while (v16 <= v22);
  }

  return v13;
}

double __92__TypistPathUtilities_convertCurveDeleteTouchPoints_endPoint_curveHeight_curveDensity_tilt___block_invoke(uint64_t a1, double a2)
{
  return *(double *)(a1 + 32) + a2;
}

+ (id)generatePathArgumentStringWithParameters:(id)a3 fromPoints:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  __CFString *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  __CFString *v30;
  id v31;

  v5 = a3;
  v6 = a4;
  v31 = (id)objc_opt_new();
  v7 = objc_alloc_init(MEMORY[0x24BDD16F0]);
  objc_msgSend(v7, "setPositiveFormat:", CFSTR("0.##"));
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("CPPATHGEN_TIME_INTERVAL"));
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  v10 = CFSTR("0.0");
  if (v8)
    v10 = (__CFString *)v8;
  v30 = v10;

  v29 = v5;
  v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB5AB8]), "initWithParams:", v5);
  v28 = v6;
  objc_msgSend(v27, "generatePathFromInflectionPoints:segmentTiming:keys:string:layout:", v6, 0, 0, 0, 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "samples");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "count"))
  {
    v12 = 0;
    do
    {
      objc_msgSend(v11, "objectAtIndexedSubscript:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "point");
      v15 = v14;
      v17 = v16;

      v18 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v15);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringFromNumber:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v17);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringFromNumber:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(&unk_251A94D40, "stringValue");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "stringWithFormat:", CFSTR("[%@ %@ %@ %@] %@ "), v20, v22, &unk_251A94D30, v23, v30);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "appendString:", v24);

      ++v12;
    }
    while (v12 < objc_msgSend(v11, "count"));
  }

  return v31;
}

+ (id)generatePathWithParameters:(id)a3 fromPoints:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;

  v5 = (objc_class *)MEMORY[0x24BEB5AB8];
  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend([v5 alloc], "initWithParams:", v7);

  objc_msgSend(v8, "generatePathFromInflectionPoints:segmentTiming:keys:string:layout:", v6, 0, 0, 0, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)convertUIBezierPathToTouchPoints:(id)a3
{
  id v3;
  void *v4;
  id v5;
  const CGPath *v6;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  v5 = objc_retainAutorelease(v3);
  v6 = (const CGPath *)objc_msgSend(v5, "CGPath");

  CGPathApply(v6, v4, (CGPathApplierFunction)getTouchPoints);
  return v4;
}

+ (id)convertSVGStringPathToUIBezierPath:(id)a3
{
  id v3;
  void *v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  int v27;
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
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  double v45;
  double v46;
  double v47;
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
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
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
  double v89;
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
  double v102;
  double v103;
  double v104;
  double v105;
  double v106;
  double v107;
  double v108;
  double v109;
  double v110;
  double v111;
  double v112;
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
  double v133;
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
  double v146;
  double v147;
  id obj;
  double v149;
  uint64_t v150;
  id v151;
  uint64_t v152;
  double v153;
  double v154;
  double v155;
  double v156;
  double v157;
  double v158;
  double v159;
  int v160;
  double v161;
  id v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  _BYTE v167[128];
  uint64_t v168;

  v168 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v151 = (id)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("MmLlHhVvCcSsQqTtAaZ"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v163 = 0u;
  v164 = 0u;
  v165 = 0u;
  v166 = 0u;
  obj = v3;
  v152 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v163, v167, 16);
  if (v152)
  {
    v150 = *(_QWORD *)v164;
    v146 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
    v147 = *MEMORY[0x24BDBEFB0];
    v5 = 0x24BDD1000uLL;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v164 != v150)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v163 + 1) + 8 * v6);
        objc_msgSend(MEMORY[0x24BDD17A8], "scannerWithString:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_alloc_init(MEMORY[0x24BDF6870]);
        objc_msgSend(*(id *)(v5 + 1992), "stringWithFormat:", CFSTR("%C"), 83);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v7, "containsString:", v10) & 1) != 0)
        {
          v160 = 1;
        }
        else
        {
          objc_msgSend(*(id *)(v5 + 1992), "stringWithFormat:", CFSTR("%C"), 115);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v160 = objc_msgSend(v7, "containsString:", v11);

        }
        v12 = (void *)objc_opt_new();
        if ((objc_msgSend(v8, "isAtEnd") & 1) == 0)
        {
          v13 = v147;
          v14 = v146;
          v15 = v147;
          v16 = v146;
          v153 = v146;
          v154 = v147;
          v155 = v146;
          v156 = v147;
          do
          {
            v162 = 0;
            objc_msgSend(v8, "scanCharactersFromSet:intoString:", v4, &v162);
            v17 = v162;
            if (v17)
            {
              v18 = v17;
              objc_msgSend(v12, "addObject:", v17);
            }
            else
            {
              objc_msgSend(v12, "lastObject");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              TYLog(CFSTR("Command letter misssing, use the preceded one \"%@\"), v19, v20, v21, v22, v23, v24, v25, (char)v18);
            }
            v26 = objc_msgSend(v18, "characterAtIndex:", 0);
            v27 = v26;
            if (v26 <= 89)
            {
              if (v26 == 76)
              {
LABEL_26:
                objc_msgSend(v8, "scanPoint");
                v37 = v36;
                v39 = v38;
                if (v27 == 108)
                {
                  objc_msgSend(v9, "currentPoint");
                  +[TypistPathUtilities _addPoint:andPoint:](TypistPathUtilities, "_addPoint:andPoint:", v37, v39, v40, v41);
                  v37 = v42;
                  v39 = v43;
                }
                v44 = v9;
                v45 = v37;
                v46 = v39;
                goto LABEL_29;
              }
              if (v26 == 77)
              {
LABEL_23:
                objc_msgSend(v8, "scanPoint");
                v29 = v28;
                v31 = v30;
                if (v27 == 109)
                {
                  objc_msgSend(v9, "currentPoint");
                  +[TypistPathUtilities _addPoint:andPoint:](TypistPathUtilities, "_addPoint:andPoint:", v29, v31, v32, v33);
                  v29 = v34;
                  v31 = v35;
                }
                objc_msgSend(v9, "moveToPoint:", v29, v31);
                goto LABEL_30;
              }
            }
            else
            {
              switch(v26)
              {
                case 'l':
                  goto LABEL_26;
                case 'm':
                  goto LABEL_23;
                case 'Z':

                  goto LABEL_10;
              }
            }
            if (v26 > 98)
            {
              if (v26 > 112)
              {
                if (v26 == 113)
                {
LABEL_57:
                  v99 = v14;
                  objc_msgSend(v8, "scanPoint");
                  v101 = v100;
                  v103 = v102;
                  objc_msgSend(v8, "scanPoint");
                  v105 = v104;
                  v107 = v106;
                  if (v27 == 113)
                  {
                    objc_msgSend(v9, "currentPoint");
                    +[TypistPathUtilities _addPoint:andPoint:](TypistPathUtilities, "_addPoint:andPoint:", v101, v103, v108, v109);
                    v101 = v110;
                    v103 = v111;
                    objc_msgSend(v9, "currentPoint");
                    +[TypistPathUtilities _addPoint:andPoint:](TypistPathUtilities, "_addPoint:andPoint:", v105, v107, v112, v113);
                    v105 = v114;
                    v107 = v115;
                  }
                  objc_msgSend(v9, "addQuadCurveToPoint:controlPoint:", v105, v107, v101, v103);
                  v14 = v99;
                  goto LABEL_30;
                }
                if (v26 == 118)
                {
LABEL_49:
                  v161 = 0.0;
                  objc_msgSend(v8, "scanDouble:", &v161);
                  if (v27 == 118)
                  {
                    objc_msgSend(v9, "currentPoint");
                    v46 = v161 + v52;
                    v161 = v46;
                  }
                  else
                  {
                    v46 = v161;
                  }
                  v45 = 0.0;
LABEL_66:
                  v44 = v9;
LABEL_29:
                  objc_msgSend(v44, "addLineToPoint:", v45, v46);
                  goto LABEL_30;
                }
              }
              else
              {
                if (v26 == 99)
                {
LABEL_51:
                  v53 = v13;
                  v158 = v16;
                  v159 = v15;
                  objc_msgSend(v8, "scanPoint");
                  v157 = v54;
                  v56 = v55;
                  objc_msgSend(v8, "scanPoint");
                  v58 = v57;
                  v60 = v59;
                  objc_msgSend(v8, "scanPoint");
                  v63 = v61;
                  v64 = v62;
                  if (v160)
                  {
                    v149 = v56;
                    v65 = v58;
                    v66 = v60;
                    v67 = v62;
                    v68 = v61;
                    if (v27 != 67)
                    {
                      objc_msgSend(v9, "currentPoint");
                      +[TypistPathUtilities _addPoint:andPoint:](TypistPathUtilities, "_addPoint:andPoint:", v58, v60, v69, v70);
                      v65 = v71;
                      v66 = v72;
                      objc_msgSend(v9, "currentPoint");
                      +[TypistPathUtilities _addPoint:andPoint:](TypistPathUtilities, "_addPoint:andPoint:", v63, v64, v73, v74);
                      v68 = v75;
                      v67 = v76;
                    }
                    objc_msgSend(v9, "currentPoint");
                    v158 = v66;
                    v159 = v65;
                    +[TypistPathUtilities _subtractPoint:byPoint:](TypistPathUtilities, "_subtractPoint:byPoint:", v65, v66, v77, v78);
                    v155 = v80;
                    v156 = v79;
                    objc_msgSend(v9, "currentPoint");
                    v53 = v68;
                    +[TypistPathUtilities _subtractPoint:byPoint:](TypistPathUtilities, "_subtractPoint:byPoint:", v68, v67, v81, v82);
                    v153 = v84;
                    v154 = v83;
                    v14 = v67;
                    v56 = v149;
                  }
                  v85 = v14;
                  if (v27 == 99)
                  {
                    objc_msgSend(v9, "currentPoint");
                    +[TypistPathUtilities _addPoint:andPoint:](TypistPathUtilities, "_addPoint:andPoint:", v157, v56, v86, v87);
                    v89 = v88;
                    v56 = v90;
                    objc_msgSend(v9, "currentPoint");
                    +[TypistPathUtilities _addPoint:andPoint:](TypistPathUtilities, "_addPoint:andPoint:", v58, v60, v91, v92);
                    v58 = v93;
                    v60 = v94;
                    objc_msgSend(v9, "currentPoint");
                    +[TypistPathUtilities _addPoint:andPoint:](TypistPathUtilities, "_addPoint:andPoint:", v63, v64, v95, v96);
                    v63 = v97;
                    v64 = v98;
                  }
                  else
                  {
                    v89 = v157;
                  }
                  objc_msgSend(v9, "addCurveToPoint:controlPoint1:controlPoint2:", v63, v64, v89, v56, v58, v60);
                  v16 = v158;
                  v15 = v159;
                  v13 = v53;
                  v14 = v85;
                  goto LABEL_30;
                }
                if (v26 == 104)
                {
LABEL_40:
                  v161 = 0.0;
                  objc_msgSend(v8, "scanDouble:", &v161);
                  if (v27 == 104)
                  {
                    objc_msgSend(v9, "currentPoint");
                    v45 = v161 + v47;
                    v161 = v45;
                  }
                  else
                  {
                    v45 = v161;
                  }
                  v46 = 0.0;
                  goto LABEL_66;
                }
              }
            }
            else if (v26 > 80)
            {
              if (v26 == 81)
                goto LABEL_57;
              if (v26 == 86)
                goto LABEL_49;
            }
            else
            {
              if (v26 == 67)
                goto LABEL_51;
              if (v26 == 72)
                goto LABEL_40;
            }
            if (v26 == 83)
            {
              v48 = v15;
              v49 = v16;
              v50 = v13;
              v51 = v14;
              goto LABEL_68;
            }
            if (v26 == 115)
            {
              v49 = v155;
              v48 = v156;
              v51 = v153;
              v50 = v154;
LABEL_68:
              +[TypistPathUtilities _reflectPoint:origin:](TypistPathUtilities, "_reflectPoint:origin:", v48, v49, v50, v51);
              v117 = v116;
              v119 = v118;
              objc_msgSend(v8, "scanPoint");
              v15 = v120;
              v16 = v121;
              objc_msgSend(v8, "scanPoint");
              v13 = v122;
              v14 = v123;
              if (v27 == 115)
              {
                objc_msgSend(v9, "currentPoint");
                +[TypistPathUtilities _addPoint:andPoint:](TypistPathUtilities, "_addPoint:andPoint:", v117, v119, v124, v125);
                v117 = v126;
                v119 = v127;
                objc_msgSend(v9, "currentPoint");
                +[TypistPathUtilities _addPoint:andPoint:](TypistPathUtilities, "_addPoint:andPoint:", v15, v16, v128, v129);
                v15 = v130;
                v16 = v131;
                objc_msgSend(v9, "currentPoint");
                +[TypistPathUtilities _addPoint:andPoint:](TypistPathUtilities, "_addPoint:andPoint:", v13, v14, v132, v133);
                v13 = v134;
                v14 = v135;
              }
              objc_msgSend(v9, "addCurveToPoint:controlPoint1:controlPoint2:", v13, v14, v117, v119, v15, v16);
              objc_msgSend(v9, "currentPoint");
              +[TypistPathUtilities _subtractPoint:byPoint:](TypistPathUtilities, "_subtractPoint:byPoint:", v15, v16, v136, v137);
              v155 = v139;
              v156 = v138;
              objc_msgSend(v9, "currentPoint");
              +[TypistPathUtilities _subtractPoint:byPoint:](TypistPathUtilities, "_subtractPoint:byPoint:", v13, v14, v140, v141);
              v153 = v143;
              v154 = v142;
            }
LABEL_30:

          }
          while (!objc_msgSend(v8, "isAtEnd"));
        }
LABEL_10:
        objc_msgSend(v151, "addObject:", v9);

        ++v6;
        v5 = 0x24BDD1000;
      }
      while (v6 != v152);
      v144 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v163, v167, 16);
      v152 = v144;
    }
    while (v144);
  }

  return v151;
}

+ (id)convertSVGPaths:(id)a3 withTransformation:(CGAffineTransform *)a4
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  void *v15;
  _OWORD v17[3];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void *)objc_opt_new();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v12);
        v14 = *(_OWORD *)&a4->c;
        v17[0] = *(_OWORD *)&a4->a;
        v17[1] = v14;
        v17[2] = *(_OWORD *)&a4->tx;
        objc_msgSend(a1, "convertSingleSVGPaths:withTransformation:", v13, v17);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v15);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v10);
  }

  return v7;
}

+ (id)convertSingleSVGPaths:(id)a3 withTransformation:(CGAffineTransform *)a4
{
  void *v6;
  __int128 v7;
  void *v8;
  _OWORD v10[3];

  v6 = (void *)objc_msgSend(a3, "copy");
  v7 = *(_OWORD *)&a4->c;
  v10[0] = *(_OWORD *)&a4->a;
  v10[1] = v7;
  v10[2] = *(_OWORD *)&a4->tx;
  objc_msgSend(v6, "applyTransform:", v10);
  objc_msgSend(a1, "convertUIBezierPathToTouchPoints:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (BOOL)_validatePoints:(CGPoint)a3 To:(CGPoint)a4
{
  double y;
  double x;
  double v6;
  double v7;
  double v8;
  double v9;
  BOOL v10;

  y = a4.y;
  x = a4.x;
  v6 = a3.y;
  v7 = a3.x;
  GSMainScreenPointSize();
  v10 = x >= 0.0;
  if (y < 0.0)
    v10 = 0;
  if (v7 < 0.0)
    v10 = 0;
  if (v6 < 0.0)
    v10 = 0;
  if (x > v8)
    v10 = 0;
  if (v7 > v8)
    v10 = 0;
  if (y > v9)
    v10 = 0;
  return v6 <= v9 && v10;
}

+ (id)_decomposeCharactersWhereNeeded:(id)a3
{
  id v3;
  void *v4;
  uint64_t i;
  void *v6;
  unint64_t v7;
  char v8;
  uint64_t v9;
  void *v10;
  uint64_t v12;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  v12 = objc_msgSend(v3, "graphemeCount");
  if (!v12)
    goto LABEL_17;
  for (i = 0; i != v12; ++i)
  {
    objc_msgSend(v3, "graphemeAtIndex:", i);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v6, "length"))
      goto LABEL_15;
    v7 = 0;
    v8 = 0;
    do
    {
      v9 = objc_msgSend(v6, "characterAtIndex:", v7);
      if (+[TypistKoreanHangulSyllable isKoreanSyllable:](TypistKoreanHangulSyllable, "isKoreanSyllable:", v9))
      {
        +[TypistKoreanHangulSyllable decomposeSyllableForScribble:](TypistKoreanHangulSyllable, "decomposeSyllableForScribble:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v10)
          goto LABEL_13;
        goto LABEL_12;
      }
      if (!+[TypistThaiSyllable isThaiCharacter:](TypistThaiSyllable, "isThaiCharacter:", v9)
        && !+[TypistArabicSyllable isArabicCharacter:](TypistArabicSyllable, "isArabicCharacter:", v9)
        && !+[TypistArabicSyllable isArabicPresentationFormBCharacter:](TypistArabicSyllable, "isArabicPresentationFormBCharacter:", v9))
      {
        break;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%C"), v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:
      objc_msgSend(v4, "appendString:", v10);
      v8 = 1;
LABEL_13:

      ++v7;
    }
    while (v7 < objc_msgSend(v6, "length"));
    if ((v8 & 1) == 0)
LABEL_15:
      objc_msgSend(v4, "appendString:", v6);

  }
LABEL_17:

  return v4;
}

+ (id)_decomposeGraphemeIntoSeparateCharactersIfNeeded:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "characterAtIndex:", 0);
    if (+[TypistThaiSyllable isThaiCharacter:](TypistThaiSyllable, "isThaiCharacter:", v5)
      || +[TypistArabicSyllable isArabicPresentationFormBCharacter:](TypistArabicSyllable, "isArabicPresentationFormBCharacter:", v5))
    {
      objc_msgSend(v4, "splitGraphemeIntoCharacterArray");
      v6 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v4);
      v6 = objc_claimAutoreleasedReturnValue();
    }
    v7 = (void *)v6;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)_processHangulCharacter:(unsigned __int16)a3 withPathMap:(id)a4 forLocale:(unint64_t)a5
{
  uint64_t v6;
  id v7;
  TypistKoreanHangulSyllable *v8;
  void *v9;
  TYPathData *v10;

  v6 = a3;
  v7 = a4;
  v8 = -[TypistKoreanHangulSyllable initWithSyllable:]([TypistKoreanHangulSyllable alloc], "initWithSyllable:", v6);
  +[TypistPathUtilities shiftJamosInSyllable:withPath:forLocale:](TypistPathUtilities, "shiftJamosInSyllable:withPath:forLocale:", v8, v7, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[TYPathData initWithArray:width:height:isCursive:]([TYPathData alloc], "initWithArray:width:height:isCursive:", v9, 76, 109, 0);
  return v10;
}

+ (id)_processArabicCharacter:(id)a3 withPathMap:(id)a4 forLocale:(unint64_t)a5
{
  id v7;
  id v8;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  TYPathData *v23;
  uint64_t v25;
  uint64_t v26;

  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_opt_new();
  if (objc_msgSend(v7, "length"))
  {
    v25 = 0;
    v26 = 0;
    v10 = 0;
    v11 = 0x24BDD1000uLL;
    do
    {
      v12 = objc_msgSend(v7, "characterAtIndex:", v10);
      objc_msgSend(*(id *)(v11 + 1992), "stringWithFormat:", CFSTR("%C"), v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringByAppendingFormat:", CFSTR("_%lu"), a5);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "objectForKeyedSubscript:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (v15)
      {
        v17 = v15;
      }
      else
      {
        objc_msgSend(*(id *)(v11 + 1992), "stringWithFormat:", CFSTR("%C"), v12);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKeyedSubscript:", v18);
        v17 = (id)objc_claimAutoreleasedReturnValue();

      }
      if (!v10)
      {
        v26 = objc_msgSend(v17, "width");
        v25 = objc_msgSend(v17, "height");
      }
      v19 = objc_msgSend(v17, "isCursive");
      objc_msgSend(v17, "strokeArray");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObjectsFromArray:", v20);

      ++v10;
      v11 = 0x24BDD1000;
    }
    while (v10 < objc_msgSend(v7, "length"));
    v22 = v25;
    v21 = v26;
  }
  else
  {
    v19 = 0;
    v22 = 0;
    v21 = 0;
  }
  if (objc_msgSend(v9, "count"))
    v23 = -[TYPathData initWithArray:width:height:isCursive:]([TYPathData alloc], "initWithArray:width:height:isCursive:", v9, v21, v22, v19);
  else
    v23 = 0;

  return v23;
}

+ (id)_processThaiCharacter:(id)a3 withPathMap:(id)a4 forLocale:(unint64_t)a5
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  double v10;
  unint64_t v11;
  void **v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  unint64_t v21;
  void *v22;
  void **v23;
  void *v24;
  int v25;
  void *v26;
  int v27;
  void *v28;
  int v29;
  uint64_t v30;
  TYPathData *v31;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_opt_new();
  if (objc_msgSend(v6, "length"))
  {
    v33 = 0;
    v34 = 0;
    v9 = 0;
    v10 = 0.0;
    v11 = 0x24BDD1000uLL;
    v12 = (void **)&off_251A7C000;
    v35 = v6;
    v36 = v8;
    while (1)
    {
      v13 = objc_msgSend(v6, "characterAtIndex:", v9);
      objc_msgSend(*(id *)(v11 + 1992), "stringWithFormat:", CFSTR("%C"), v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringByAppendingFormat:", CFSTR("_%lu"), a5);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "objectForKeyedSubscript:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if (v16)
      {
        v18 = v16;
      }
      else
      {
        objc_msgSend(*(id *)(v11 + 1992), "stringWithFormat:", CFSTR("%C"), v13);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKeyedSubscript:", v19);
        v18 = (id)objc_claimAutoreleasedReturnValue();

        v12 = (void **)&off_251A7C000;
      }
      v20 = v7;
      v21 = v11;

      if (!v9)
      {
        v33 = objc_msgSend(v18, "width");
        v34 = objc_msgSend(v18, "height");
      }
      objc_msgSend(v18, "strokeArray");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12[70], "smallCharacers");
      v23 = v12;
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "characterIsMember:", v13);

      if (v25)
      {
        v10 = v10 + 0.485;
      }
      else
      {
        objc_msgSend(v23[70], "tallCharacters");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v26, "characterIsMember:", v13);

        if (!v27)
        {
          objc_msgSend(v23[70], "upperCombiningCharacters");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v28, "characterIsMember:", v13);

          if (v29)
          {
            +[TypistPathUtilities _shiftThaiStrokes:withRatio:ofHeight:](TypistPathUtilities, "_shiftThaiStrokes:withRatio:ofHeight:", v22, v34, v10);
            v30 = objc_claimAutoreleasedReturnValue();

            v10 = v10 + 0.141;
            v22 = (void *)v30;
          }
          v11 = v21;
          v8 = v36;
          v12 = (void **)&off_251A7C000;
          goto LABEL_16;
        }
        v10 = v10 + 0.716;
      }
      v11 = v21;
      v8 = v36;
      v12 = v23;
LABEL_16:
      v7 = v20;
      v6 = v35;
      objc_msgSend(v8, "addObjectsFromArray:", v22);

      if (++v9 >= (unint64_t)objc_msgSend(v35, "length"))
        goto LABEL_19;
    }
  }
  v33 = 0;
  v34 = 0;
LABEL_19:
  if (objc_msgSend(v8, "count"))
    v31 = -[TYPathData initWithArray:width:height:isCursive:]([TYPathData alloc], "initWithArray:width:height:isCursive:", v8, v33, v34, 0);
  else
    v31 = 0;

  return v31;
}

+ (id)_shiftThaiStrokes:(id)a3 withRatio:(double)a4 ofHeight:(int64_t)a5
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  uint64_t v13;
  void *v14;
  _OWORD v16[3];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithArray:copyItems:", v7, 1);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v21;
    v12 = (double)a5 * a4;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v13);
        v18 = 0u;
        v19 = 0u;
        v17 = 0u;
        +[TypistPathUtilities _makeTranslationWithOffset:](TypistPathUtilities, "_makeTranslationWithOffset:", v12);
        v16[0] = v17;
        v16[1] = v18;
        v16[2] = v19;
        objc_msgSend(v14, "applyTransform:", v16);
        ++v13;
      }
      while (v10 != v13);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v10);
  }

  return v8;
}

+ (CGAffineTransform)_makeTranslationWithOffset:(SEL)a3
{
  CGAffineTransform v6;
  CGAffineTransform t1;
  CGAffineTransform v8;
  CGAffineTransform v9;

  memset(&v9, 0, sizeof(v9));
  CGAffineTransformMakeTranslation(&v9, 0.0, -a4);
  memset(&v8, 0, sizeof(v8));
  CGAffineTransformMakeScale(&v8, 1.0, 1.0);
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  t1 = v8;
  v6 = v9;
  return CGAffineTransformConcat(retstr, &t1, &v6);
}

+ (int)_mappingRegionToVariantID:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if (objc_msgSend(v3, "caseInsensitiveCompare:", CFSTR("hans")))
  {
    if (objc_msgSend(v3, "caseInsensitiveCompare:", CFSTR("hant")))
    {
      if (objc_msgSend(v3, "caseInsensitiveCompare:", CFSTR("kr")))
      {
        if (objc_msgSend(v3, "caseInsensitiveCompare:", CFSTR("jp")))
          v4 = 1;
        else
          v4 = 9;
      }
      else
      {
        v4 = 2;
      }
    }
    else
    {
      v4 = 8;
    }
  }
  else
  {
    v4 = 7;
  }

  return v4;
}

+ (id)_processCharacters:(id)a3 withPathMap:(id)a4 forLocale:(int)a5
{
  uint64_t v5;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v23;
  uint64_t v24;

  v5 = *(_QWORD *)&a5;
  v8 = a3;
  v9 = a4;
  v10 = objc_msgSend(v8, "graphemeCount");
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v12 = 0;
    v13 = v5;
    v23 = v5;
    v24 = v5;
    do
    {
      objc_msgSend(v8, "graphemeAtIndex:", v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "characterAtIndex:", 0);
      if (+[TypistKoreanHangulSyllable isKoreanSyllable:](TypistKoreanHangulSyllable, "isKoreanSyllable:", v15))
      {
        objc_msgSend(a1, "_processHangulCharacter:withPathMap:forLocale:", v15, v9, v13);
        v16 = objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(a1, "isKoreanConsonantVariant:", v15))
      {
        objc_msgSend(v9, "objectForKeyedSubscript:", v14);
        v16 = objc_claimAutoreleasedReturnValue();
      }
      else if (+[TypistThaiSyllable isThaiCharacter:](TypistThaiSyllable, "isThaiCharacter:", v15))
      {
        objc_msgSend(a1, "_processThaiCharacter:withPathMap:forLocale:", v14, v9, v13);
        v16 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (!+[TypistArabicSyllable isArabicPresentationFormBCharacter:](TypistArabicSyllable, "isArabicPresentationFormBCharacter:", v15))
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("_%u"), v5);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "stringByAppendingString:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v9, "objectForKeyedSubscript:", v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (v20)
            v21 = v19;
          else
            v21 = v14;
          objc_msgSend(v9, "objectForKeyedSubscript:", v21);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          v13 = v23;
          v5 = v24;
          goto LABEL_12;
        }
        objc_msgSend(a1, "_processArabicCharacter:withPathMap:forLocale:", v14, v9, v13);
        v16 = objc_claimAutoreleasedReturnValue();
      }
      v17 = (void *)v16;
LABEL_12:
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v17, v14);

      ++v12;
    }
    while (v10 != v12);
  }

  return v11;
}

+ (double)getWidthOfFirstCharacterInString:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;

  objc_msgSend(a1, "_decomposeCharactersWhereNeeded:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%C"), objc_msgSend(v4, "characterAtIndex:", 0));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_queryHandwritingSourceForCharactersInString:withRegion:", v5, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (double)objc_msgSend(v7, "width");

  }
  else
  {
    v8 = 0.0;
  }

  return v8;
}

+ (id)getPathDataForCharacters:(id)a3 withRegion:(id)a4 isCursive:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  objc_msgSend(a1, "_decomposeCharactersWhereNeeded:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(a1, "_mappingRegionToVariantID:", v9);
  objc_msgSend(a1, "_queryHandwritingSourceForCharactersInString:withRegion:", v10, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_processCharacters:withPathMap:forLocale:", v8, v12, v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(a1, "_connectPath:forCharacters:withRegion:", v14, v8, v9);
      v15 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = v14;
    }
    v16 = v15;

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

+ (unint64_t)getTotalWidthForText:(id)a3 isCursive:(BOOL)a4 withRegion:(id)a5 fromPathMap:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a5;
  v11 = a6;
  if (a4)
    +[TypistPathUtilities getTextClustersFrom:withRegion:](TypistPathUtilities, "getTextClustersFrom:withRegion:", v9, v10);
  else
    objc_msgSend(v9, "graphemeArray");
  v31 = v10;
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v13)
  {
    v14 = v13;
    v15 = 0;
    v16 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v33 != v16)
          objc_enumerationMutation(v12);
        v18 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
        objc_msgSend(v11, "objectForKeyedSubscript:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = v19;
        if (v19)
        {
          if (objc_msgSend(v19, "width") >= 1)
          {
            objc_msgSend(v26, "perCharacterScale");
            if (v27 > 0.0)
            {
              v28 = (double)objc_msgSend(v26, "width");
              objc_msgSend(v26, "perCharacterScale");
              v15 += llround(v29 * v28);
            }
          }
        }
        else
        {
          TYLogl(OS_LOG_TYPE_ERROR, CFSTR("No path data found for character: [%@]"), v20, v21, v22, v23, v24, v25, v18);
        }

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v14);
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

+ (id)getTextClustersFrom:(id)a3 withRegion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "_decomposeCharactersWhereNeeded:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_queryHandwritingSourceForCharactersInString:withRegion:", v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "getTextClustersFrom:forCharacters:", v9, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)getTextClustersFrom:(id)a3 forCharacters:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  v9 = 0;
  if (v6 && v7)
  {
    objc_msgSend(MEMORY[0x24BDD14A8], "arabicGenericCharacters");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v8, "rangeOfCharacterFromSet:", v10);

    objc_msgSend(MEMORY[0x24BDD14A8], "arabicPresentationFormCharacters");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v8, "rangeOfCharacterFromSet:", v12);

    if (v11 != 0x7FFFFFFFFFFFFFFFLL || v13 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(a1, "_processCharacters:withPathMap:forLocale:", v8, v6, 3);
      v15 = objc_claimAutoreleasedReturnValue();

      v6 = (id)v15;
    }
    objc_msgSend(a1, "_determineWritingStyle:forCharacters:", v6, v8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_opt_new();
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v17 = v16;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v25 != v20)
            objc_enumerationMutation(v17);
          objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "characterCluster", (_QWORD)v24);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v22);

        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v19);
    }

  }
  return v9;
}

+ (id)_determineWritingStyle:(id)a3 forCharacters:(id)a4
{
  id v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  char v12;
  uint64_t v13;
  TYCharacterCluster *v14;
  TYCharacterCluster *v15;
  TYCharacterCluster *v16;
  void *v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  id v23;

  v22 = a3;
  v5 = a4;
  v6 = objc_msgSend(v5, "graphemeCount");
  v23 = (id)objc_opt_new();
  if (v6)
  {
    v7 = 0;
    v8 = 0;
    v9 = 0;
    v20 = v6 - 1;
    v21 = 0;
    v19 = v6;
    do
    {
      objc_msgSend(v5, "graphemeAtIndex:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "objectForKeyedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isCursive");
      v8 += objc_msgSend(v10, "length");
      if ((v12 & 1) != 0)
      {
        v13 = ++v21;
        if (v20 != v9 || v9 < v7)
          goto LABEL_14;
        if (v13 == v6)
        {
          v14 = -[TYCharacterCluster initWithCharacters:isCursive:]([TYCharacterCluster alloc], "initWithCharacters:isCursive:", v5, 1);
        }
        else
        {
          objc_msgSend(v5, "substringWithRange:", v7, v8 - v7);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = -[TYCharacterCluster initWithCharacters:isCursive:]([TYCharacterCluster alloc], "initWithCharacters:isCursive:", v17, 1);

          v6 = v19;
        }
        objc_msgSend(v23, "addObject:", v14);
      }
      else
      {
        objc_msgSend(v5, "substringWithRange:", v7, v8 + ~v7);
        v14 = (TYCharacterCluster *)objc_claimAutoreleasedReturnValue();
        if (-[TYCharacterCluster length](v14, "length"))
        {
          v15 = -[TYCharacterCluster initWithCharacters:isCursive:]([TYCharacterCluster alloc], "initWithCharacters:isCursive:", v14, 1);
          objc_msgSend(v23, "addObject:", v15);

        }
        v16 = -[TYCharacterCluster initWithCharacters:isCursive:]([TYCharacterCluster alloc], "initWithCharacters:isCursive:", v10, 0);
        objc_msgSend(v23, "addObject:", v16);

        v7 = v8;
      }

LABEL_14:
      ++v9;
    }
    while (v6 != v9);
  }

  return v23;
}

+ (int)_getScribbleRuleFromRegion:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if (objc_msgSend(v3, "caseInsensitiveCompare:", CFSTR("RU"))
    && objc_msgSend(v3, "caseInsensitiveCompare:", CFSTR("UA")))
  {
    if (objc_msgSend(v3, "caseInsensitiveCompare:", CFSTR("ar")))
      v4 = 1;
    else
      v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)_separateFinalFormCharacters:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v14;
  void *v15;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  v5 = (void *)objc_opt_new();
  v15 = v3;
  v6 = objc_msgSend(v3, "graphemeCount");
  objc_msgSend(MEMORY[0x24BDD17C8], "arabicFinalFormsCharacterSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v6;
  if (v6)
  {
    v8 = 0;
    do
    {
      objc_msgSend(v15, "graphemeAtIndex:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "length"))
      {
        v10 = 0;
        do
        {
          v11 = objc_msgSend(v9, "characterAtIndex:", v10);
          if ((objc_msgSend(v7, "characterIsMember:", v11) & 1) != 0)
          {
            if ((unint64_t)objc_msgSend(v9, "length") < 2)
            {
              if (objc_msgSend(v5, "length"))
              {
                objc_msgSend(v5, "appendFormat:", CFSTR("%C"), v11);
                v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithString:", v5);
                objc_msgSend(v4, "addObject:", v12);
                objc_msgSend(v5, "setString:", &stru_251A7DE60);

              }
            }
            else
            {
              objc_msgSend(v5, "appendFormat:", CFSTR("%C"), v11);
            }
          }
          else
          {
            objc_msgSend(v5, "appendFormat:", CFSTR("%C"), v11);
            if (v8 == v14 - 1 && v10 == objc_msgSend(v9, "length") - 1)
              objc_msgSend(v4, "addObject:", v5);
          }
          ++v10;
        }
        while (v10 < objc_msgSend(v9, "length"));
      }

      ++v8;
    }
    while (v8 != v14);
  }

  return v4;
}

+ (id)_separateIsolatedCharacters:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  v5 = (void *)objc_opt_new();
  v6 = (void *)objc_opt_new();
  v7 = objc_msgSend(v3, "graphemeCount");
  if (v7)
  {
    v8 = v7;
    for (i = 0; i != v8; ++i)
    {
      objc_msgSend(v3, "graphemeAtIndex:", i);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v10);

    }
  }
  if (objc_msgSend(v4, "count"))
  {
    v11 = 0;
    do
    {
      objc_msgSend(MEMORY[0x24BDD14A8], "arabicIsolatedCharacters");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectAtIndexedSubscript:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v12, "characterIsMember:", objc_msgSend(v13, "characterAtIndex:", 0));

      if ((v14 & 1) != 0)
      {
        if (objc_msgSend(v6, "length"))
        {
          v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithString:", v6);
          objc_msgSend(v5, "addObject:", v15);
          objc_msgSend(v6, "setString:", &stru_251A7DE60);

        }
        objc_msgSend(v4, "objectAtIndexedSubscript:", v11);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v16);

      }
      else
      {
        objc_msgSend(v4, "objectAtIndexedSubscript:", v11);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "appendString:", v17);

        if (v11 == objc_msgSend(v4, "count") - 1)
          objc_msgSend(v5, "addObject:", v6);
      }
      ++v11;
    }
    while (v11 < objc_msgSend(v4, "count"));
  }

  return v5;
}

+ (id)_separateUniqueCharacters:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  v5 = objc_msgSend(v3, "graphemeCount");
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = 0;
    v9 = 0;
    v10 = v5 - 1;
    do
    {
      objc_msgSend(v3, "graphemeAtIndex:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD14A8], "cyrillicCharactersWithUniqueWritingRule");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "characterIsMember:", objc_msgSend(v11, "characterAtIndex:", 0));

      if ((v13 & 1) != 0)
      {
        ++v8;
        v14 = (void *)objc_opt_new();
        objc_msgSend(v3, "substringWithRange:", v7, v9 + 1 - v7);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v4, "addObject:", v15);
        v7 = v9 + 1;
      }
      else if (v10 == v9 && v9 >= v7)
      {
        if (v8 == v6)
        {
          objc_msgSend(v4, "addObject:", v3);
          v8 = v6;
        }
        else
        {
          objc_msgSend(v3, "substringWithRange:", v7, v6 - v7);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v16, "length"))
            objc_msgSend(v4, "addObject:", v16);

        }
      }

      ++v9;
    }
    while (v6 != v9);
  }

  return v4;
}

+ (id)_shiftPath:(id)a3 forCharacters:(id)a4 withRule:(int)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  double v20;
  unint64_t v21;
  double v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  char v33;
  double v34;
  void *v35;
  double v36;
  void *v37;
  char v38;
  void *v39;
  void *v40;
  int v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t j;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t k;
  void *v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t m;
  void *v62;
  id v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t n;
  double v68;
  double v69;
  TYPathData *v70;
  void *v72;
  void *v73;
  id obj;
  uint64_t v75;
  uint64_t v77;
  uint64_t v78;
  id v79;
  void *v80;
  uint64_t v81;
  int v82;
  uint64_t v83;
  void *v84;
  void *v85;
  void *v86;
  uint64_t v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  CGAffineTransform v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  CGAffineTransform v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  _BYTE v114[128];
  _BYTE v115[128];
  _BYTE v116[128];
  _BYTE v117[128];
  _BYTE v118[128];
  _BYTE v119[128];
  uint64_t v120;

  v120 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x24BDBCE30], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = a5;
  if (a5 == 2)
  {
    objc_msgSend(a1, "_separateIsolatedCharacters:", v8);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a5)
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v8);
    else
      objc_msgSend(a1, "_separateUniqueCharacters:", v8);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v11 = (void *)v10;

  v73 = v8;
  objc_msgSend(v8, "textDirectionAnnotations");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "objectAtIndexedSubscript:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = objc_msgSend(v12, "textDirection");

  v13 = (void *)objc_opt_new();
  v14 = (void *)objc_opt_new();
  v110 = 0u;
  v111 = 0u;
  v112 = 0u;
  v113 = 0u;
  obj = v11;
  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v110, v119, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v111;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v111 != v17)
          objc_enumerationMutation(obj);
        objc_msgSend(a1, "_separateFinalFormCharacters:", *(_QWORD *)(*((_QWORD *)&v110 + 1) + 8 * i));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addObjectsFromArray:", v19);

      }
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v110, v119, 16);
    }
    while (v16);
  }

  v108 = 0u;
  v109 = 0u;
  v106 = 0u;
  v107 = 0u;
  v79 = v14;
  v77 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v106, v118, 16);
  if (v77)
  {
    v75 = *(_QWORD *)v107;
    v20 = 0.0;
    v21 = 0x24BDD1000uLL;
    v22 = 0.0;
    v80 = v7;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v107 != v75)
          objc_enumerationMutation(v79);
        v78 = v23;
        v24 = *(void **)(*((_QWORD *)&v106 + 1) + 8 * v23);
        v25 = (void *)objc_opt_new();
        v26 = (void *)objc_opt_new();
        v84 = v24;
        v83 = objc_msgSend(v24, "graphemeCount");
        if (v83)
        {
          v27 = 0;
          v28 = 0.0;
          do
          {
            objc_msgSend(v84, "graphemeAtIndex:", v27);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "objectForKeyedSubscript:", v29);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "strokeArray");
            v31 = (void *)objc_claimAutoreleasedReturnValue();

            if (v27
              || (objc_msgSend(v79, "firstObject"),
                  v32 = (void *)objc_claimAutoreleasedReturnValue(),
                  v33 = objc_msgSend(v84, "isEqual:", v32),
                  v32,
                  v34 = 0.0,
                  (v33 & 1) == 0))
            {
              objc_msgSend(v7, "objectForKeyedSubscript:", v29);
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              v34 = v28 - (double)objc_msgSend(v35, "width");

            }
            v28 = v34;
            memset(&v105, 0, sizeof(v105));
            v36 = v20 + v34;
            if (v81 != 2)
              v36 = v22;
            CGAffineTransformMakeTranslation(&v105, v36, 0.0);
            objc_msgSend(*(id *)(v21 + 1192), "cyrillicCharactersWithUniqueWritingRule");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v37, "characterIsMember:", objc_msgSend(v29, "characterAtIndex:", 0)) & 1) != 0)
            {
              v38 = 1;
            }
            else
            {
              objc_msgSend(*(id *)(v21 + 1192), "arabicCharactersWithUniqueWritingRule");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              v38 = objc_msgSend(v39, "characterIsMember:", objc_msgSend(v29, "characterAtIndex:", 0));

            }
            objc_msgSend(*(id *)(v21 + 1192), "arabicIsolatedCharacters");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v41 = objc_msgSend(v40, "characterIsMember:", objc_msgSend(v29, "characterAtIndex:", 0));

            v86 = v29;
            v87 = v27;
            v85 = v31;
            if (v82 == 1 || (v38 & 1) != 0 || (unint64_t)objc_msgSend(v29, "length") >= 2)
            {
              v103 = 0u;
              v104 = 0u;
              v101 = 0u;
              v102 = 0u;
              v42 = v31;
              v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v101, v117, 16);
              if (v43)
              {
                v44 = v43;
                v45 = *(_QWORD *)v102;
                do
                {
                  for (j = 0; j != v44; ++j)
                  {
                    if (*(_QWORD *)v102 != v45)
                      objc_enumerationMutation(v42);
                    v47 = *(void **)(*((_QWORD *)&v101 + 1) + 8 * j);
                    v48 = (void *)objc_msgSend(v47, "copy");
                    v100 = v105;
                    objc_msgSend(v48, "applyTransform:", &v100);
                    objc_msgSend(v42, "firstObject");
                    v49 = (void *)objc_claimAutoreleasedReturnValue();
                    LODWORD(v47) = objc_msgSend(v47, "isEqual:", v49);

                    if ((_DWORD)v47)
                      objc_msgSend(v25, "appendPath:", v48);
                    else
                      objc_msgSend(v26, "addObject:", v48);

                  }
                  v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v101, v117, 16);
                }
                while (v44);
              }
            }
            else if (v41)
            {
              v98 = 0uLL;
              v99 = 0uLL;
              v96 = 0uLL;
              v97 = 0uLL;
              v51 = v31;
              v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v96, v116, 16);
              if (v52)
              {
                v53 = v52;
                v54 = *(_QWORD *)v97;
                do
                {
                  for (k = 0; k != v53; ++k)
                  {
                    if (*(_QWORD *)v97 != v54)
                      objc_enumerationMutation(v51);
                    v56 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v96 + 1) + 8 * k), "copy");
                    v100 = v105;
                    objc_msgSend(v56, "applyTransform:", &v100);
                    objc_msgSend(v26, "addObject:", v56);

                  }
                  v53 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v96, v116, 16);
                }
                while (v53);
              }
            }
            else
            {
              v94 = 0uLL;
              v95 = 0uLL;
              v92 = 0uLL;
              v93 = 0uLL;
              v57 = v31;
              v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v92, v115, 16);
              if (v58)
              {
                v59 = v58;
                v60 = *(_QWORD *)v93;
                do
                {
                  for (m = 0; m != v59; ++m)
                  {
                    if (*(_QWORD *)v93 != v60)
                      objc_enumerationMutation(v57);
                    v62 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v92 + 1) + 8 * m), "copy");
                    v100 = v105;
                    objc_msgSend(v62, "applyTransform:", &v100);
                    objc_msgSend(v25, "appendPath:", v62);

                  }
                  v59 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v92, v115, 16);
                }
                while (v59);
              }
            }

            v7 = v80;
            objc_msgSend(v80, "objectForKeyedSubscript:", v86);
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = v22 + (double)objc_msgSend(v50, "width");

            v27 = v87 + 1;
            v21 = 0x24BDD1000;
          }
          while (v87 + 1 != v83);
        }
        else
        {
          v28 = 0.0;
        }
        if ((objc_msgSend(v25, "isEmpty") & 1) == 0)
          objc_msgSend(v13, "addObject:", v25);
        v90 = 0u;
        v91 = 0u;
        v88 = 0u;
        v89 = 0u;
        v63 = v26;
        v64 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v88, v114, 16);
        if (v64)
        {
          v65 = v64;
          v66 = *(_QWORD *)v89;
          do
          {
            for (n = 0; n != v65; ++n)
            {
              if (*(_QWORD *)v89 != v66)
                objc_enumerationMutation(v63);
              objc_msgSend(v13, "addObject:", *(_QWORD *)(*((_QWORD *)&v88 + 1) + 8 * n));
            }
            v65 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v88, v114, 16);
          }
          while (v65);
        }
        v20 = v20 + v28;

        v23 = v78 + 1;
      }
      while (v78 + 1 != v77);
      v77 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v106, v118, 16);
    }
    while (v77);
  }

  objc_msgSend(a1, "_getWidthAndHeight:forCharacters:", v7, v73);
  v70 = -[TYPathData initWithArray:width:height:isCursive:]([TYPathData alloc], "initWithArray:width:height:isCursive:", v13, (uint64_t)v68, (uint64_t)v69, 0);

  return v70;
}

+ (CGSize)_getWidthAndHeight:(id)a3 forCharacters:(id)a4
{
  id v5;
  id v6;
  unint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  CGSize result;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v6, "graphemeCount");
  if (v7)
  {
    v8 = 0;
    v9 = 0.0;
    v10 = 0.0;
    do
    {
      objc_msgSend(v6, "graphemeAtIndex:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKeyedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v10 + (double)objc_msgSend(v12, "width");

      objc_msgSend(v5, "objectForKeyedSubscript:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v9 + (double)objc_msgSend(v13, "height");

      ++v8;
    }
    while (v7 != v8);
  }
  else
  {
    v10 = 0.0;
    v9 = 0.0;
  }

  v14 = v10;
  v15 = v9 / (double)v7;
  result.height = v15;
  result.width = v14;
  return result;
}

+ (id)_connectPath:(id)a3 forCharacters:(id)a4 withRegion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  uint64_t v23;
  void *v24;
  void *v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  unsigned int v30;
  unsigned int v31;
  id obj;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  objc_msgSend(a1, "_determineWritingStyle:forCharacters:", v8, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_opt_new();
  v31 = objc_msgSend(a1, "_mappingRegionToVariantID:", v9);
  v26 = v9;
  v30 = objc_msgSend(a1, "_getScribbleRuleFromRegion:", v9);
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  obj = v10;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v38;
    v27 = *(_QWORD *)v38;
    v28 = a1;
    do
    {
      v15 = 0;
      v29 = v13;
      do
      {
        if (*(_QWORD *)v38 != v14)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v15);
        objc_msgSend(v16, "characterCluster");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v16, "isCursive"))
        {
          objc_msgSend(a1, "_shiftPath:forCharacters:withRule:", v8, v17, v30);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setObject:forKeyedSubscript:", v18, v17);
        }
        else
        {
          objc_msgSend(a1, "_processCharacters:withPathMap:forLocale:", v17, v8, v31);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = 0u;
          v34 = 0u;
          v35 = 0u;
          v36 = 0u;
          v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
          if (v19)
          {
            v20 = v19;
            v21 = *(_QWORD *)v34;
            do
            {
              for (i = 0; i != v20; ++i)
              {
                if (*(_QWORD *)v34 != v21)
                  objc_enumerationMutation(v18);
                v23 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
                objc_msgSend(v18, "objectForKeyedSubscript:", v23);
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v11, "setValue:forKey:", v24, v23);

              }
              v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
            }
            while (v20);
            v14 = v27;
            a1 = v28;
            v13 = v29;
          }
        }

        ++v15;
      }
      while (v15 != v13);
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    }
    while (v13);
  }

  return v11;
}

+ (sqlite3)_openDatabaseFromFile:(id)a3
{
  id v3;
  void *v4;
  sqlite3 *v5;
  sqlite3 *ppDb;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  ppDb = 0;
  v5 = 0;
  if (objc_msgSend(v4, "fileExistsAtPath:", v3))
  {
    sqlite3_open((const char *)objc_msgSend(objc_retainAutorelease(v3), "UTF8String"), &ppDb);
    v5 = ppDb;
  }

  return v5;
}

+ (unint64_t)_queryDatabase:(sqlite3 *)a3 withSql:(id)a4 forRegion:(id)a5
{
  id v7;
  id v8;
  sqlite3_stmt *v9;
  id v10;
  const char *v11;
  unint64_t v12;
  sqlite3_stmt *ppStmt;

  ppStmt = 0;
  v7 = objc_retainAutorelease(a4);
  v8 = a5;
  sqlite3_prepare_v2(a3, (const char *)objc_msgSend(v7, "UTF8String"), -1, &ppStmt, 0);
  v9 = ppStmt;
  v10 = objc_retainAutorelease(v8);
  v11 = (const char *)objc_msgSend(v10, "UTF8String");

  sqlite3_bind_text(v9, 1, v11, -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  v12 = 0;
  if (sqlite3_step(ppStmt) == 100)
    v12 = sqlite3_column_int(ppStmt, 0);
  sqlite3_finalize(ppStmt);
  return v12;
}

+ (id)_queryHandwritingSourceForCharactersInString:(id)a3 withRegion:(id)a4
{
  id v5;
  void *v6;
  __CFString *v7;
  uint64_t v8;
  sqlite3 *v9;
  __CFString *v10;
  uint64_t v11;
  void *v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  int v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  uint64_t j;
  id v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  uint64_t v33;
  uint64_t k;
  sqlite3_stmt *v35;
  id v36;
  const unsigned __int8 *v37;
  int v38;
  int v39;
  const unsigned __int8 *v40;
  uint64_t v41;
  int v42;
  BOOL v43;
  _BOOL8 v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  TYPathData *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v56;
  void *v57;
  void *v58;
  sqlite3 *v59;
  const __CFString *v60;
  void *v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  sqlite3_stmt *ppStmt;
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pathForResource:ofType:", CFSTR("Handwriting/strokes"), CFSTR("db"));
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(a1, "_openDatabaseFromFile:", v7);
  if (v8)
  {
    v9 = (sqlite3 *)v8;
    v60 = v7;
  }
  else
  {

    v10 = CFSTR("/AppleInternal/Library/Frameworks/TypistFramework.framework/Handwriting/strokes.db");
    v9 = (sqlite3 *)objc_msgSend(a1, "_openDatabaseFromFile:", CFSTR("/AppleInternal/Library/Frameworks/TypistFramework.framework/Handwriting/strokes.db"));
    if (!v9)
      goto LABEL_41;
    v60 = CFSTR("/AppleInternal/Library/Frameworks/TypistFramework.framework/Handwriting/strokes.db");
  }
  v11 = objc_msgSend(v5, "graphemeCount");
  v12 = (void *)objc_opt_new();
  if (v11)
  {
    for (i = 0; i != v11; ++i)
    {
      objc_msgSend(v5, "graphemeAtIndex:", i);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_decomposeGraphemeIntoSeparateCharactersIfNeeded:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObjectsFromArray:", v15);

    }
  }
  objc_msgSend(&stru_251A7DE60, "stringByPaddingToLength:withString:startingAtIndex:", objc_msgSend(v12, "count"), CFSTR("?"), 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v16, "mutableCopy");

  v58 = v17;
  objc_msgSend(v17, "stringByReplacingOccurrencesOfString:withString:options:range:", CFSTR("?"), CFSTR("?,"), 0, 0, objc_msgSend(v12, "count") - 1);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("SELECT pathData.pathData, pathData.width, pathData.height, characters.character, pathData.variant_id, pathData.isCursive FROM pathData INNER JOIN characters ON characters.characterid = pathData.character_id"), "stringByAppendingFormat:", CFSTR(" WHERE characters.character IN (%@)"), v57);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v12;
  ppStmt = 0;
  v20 = objc_retainAutorelease(v18);
  v59 = v9;
  sqlite3_prepare_v2(v9, (const char *)objc_msgSend(v20, "UTF8String"), -1, &ppStmt, 0);
  v56 = v20;
  objc_msgSend(v20, "componentsSeparatedByString:", CFSTR("?"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "count");

  v61 = v19;
  if (v22 - 1 == objc_msgSend(v19, "count"))
  {
    v64 = 0uLL;
    v65 = 0uLL;
    v62 = 0uLL;
    v63 = 0uLL;
    v23 = v19;
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v62, v67, 16);
    if (v24)
    {
      v25 = v24;
      v26 = 0;
      v27 = *(_QWORD *)v63;
      do
      {
        for (j = 0; j != v25; ++j)
        {
          if (*(_QWORD *)v63 != v27)
            objc_enumerationMutation(v23);
          sqlite3_bind_text(ppStmt, v26 + j + 1, (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v62 + 1) + 8 * j)), "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v62, v67, 16);
        v26 += j;
      }
      while (v25);
    }
  }
  else
  {
    v64 = 0uLL;
    v65 = 0uLL;
    v62 = 0uLL;
    v63 = 0uLL;
    v29 = v19;
    v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v62, v67, 16);
    if (v30)
    {
      v31 = v30;
      v32 = 0;
      v33 = *(_QWORD *)v63;
      do
      {
        for (k = 0; k != v31; ++k)
        {
          if (*(_QWORD *)v63 != v33)
            objc_enumerationMutation(v29);
          v35 = ppStmt;
          v36 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v62 + 1) + 8 * k));
          sqlite3_bind_text(v35, v32 + k + 1, (const char *)objc_msgSend(v36, "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
          sqlite3_bind_text(ppStmt, v32 + k + 1 + objc_msgSend(v29, "count"), (const char *)objc_msgSend(objc_retainAutorelease(v36), "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
        }
        v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v62, v67, 16);
        v32 += k;
      }
      while (v31);
    }
  }

  v9 = (sqlite3 *)objc_opt_new();
  while (sqlite3_step(ppStmt) == 100)
  {
    v37 = sqlite3_column_text(ppStmt, 0);
    v38 = sqlite3_column_int(ppStmt, 1);
    v39 = sqlite3_column_int(ppStmt, 2);
    v40 = sqlite3_column_text(ppStmt, 3);
    v41 = sqlite3_column_int(ppStmt, 4);
    v42 = sqlite3_column_int(ppStmt, 5);
    if (v37)
      v43 = v39 == 0;
    else
      v43 = 1;
    if (!v43 && v38 != 0)
    {
      v45 = v42 != 0;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v40);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v37);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "componentsSeparatedByString:", CFSTR("Z"));
      v48 = (void *)objc_claimAutoreleasedReturnValue();

      +[TypistPathUtilities convertSVGStringPathToUIBezierPath:](TypistPathUtilities, "convertSVGStringPathToUIBezierPath:", v48);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = -[TYPathData initWithArray:width:height:isCursive:]([TYPathData alloc], "initWithArray:width:height:isCursive:", v49, v38, v39, v45);
      if ((_DWORD)v41)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("_%d"), v41);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "stringByAppendingString:", v51);
        v52 = (void *)objc_claimAutoreleasedReturnValue();

        -[sqlite3 objectForKey:](v9, "objectForKey:", v52);
        v53 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v53)
          -[sqlite3 setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v50, v52);

      }
      else
      {
        -[sqlite3 objectForKey:](v9, "objectForKey:", v46);
        v54 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v54)
          -[sqlite3 setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v50, v46);
      }

    }
  }
  sqlite3_finalize(ppStmt);

  sqlite3_close(v59);
  v10 = (__CFString *)v60;
LABEL_41:

  return v9;
}

+ (id)_jamoShiftsForStructure:(int)a3
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD *v6;
  id result;
  void *v8;
  void *v9;
  _QWORD *v10;
  void *v11;
  _QWORD v12[3];
  _QWORD v13[2];
  _QWORD v14[3];
  _QWORD v15[3];
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x24BDAC8D0];
  switch(a3)
  {
    case 0:
      objc_msgSend(MEMORY[0x24BDD1968], "hangulJamoTransformationDataValueWithJamoType:direction:", 0, 2);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = v3;
      objc_msgSend(MEMORY[0x24BDD1968], "hangulJamoTransformationDataValueWithJamoType:direction:", 3, 3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v16[1] = v4;
      v5 = (void *)MEMORY[0x24BDBCE30];
      v6 = v16;
      goto LABEL_8;
    case 1:
      objc_msgSend(MEMORY[0x24BDD1968], "hangulJamoTransformationDataValueWithJamoType:direction:", 0, 0);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = v3;
      objc_msgSend(MEMORY[0x24BDD1968], "hangulJamoTransformationDataValueWithJamoType:direction:", 2, 1);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v17[1] = v4;
      v5 = (void *)MEMORY[0x24BDBCE30];
      v6 = v17;
      goto LABEL_8;
    case 2:
      objc_msgSend(MEMORY[0x24BDD1968], "hangulJamoTransformationDataValueWithJamoType:direction:", 0, 4);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = v3;
      objc_msgSend(MEMORY[0x24BDD1968], "hangulJamoTransformationDataValueWithJamoType:direction:", 2, 5);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v15[1] = v4;
      objc_msgSend(MEMORY[0x24BDD1968], "hangulJamoTransformationDataValueWithJamoType:direction:", 1, 6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v15[2] = v8;
      v9 = (void *)MEMORY[0x24BDBCE30];
      v10 = v15;
      goto LABEL_10;
    case 3:
      objc_msgSend(MEMORY[0x24BDD1968], "hangulJamoTransformationDataValueWithJamoType:direction:", 0, 7);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = v3;
      objc_msgSend(MEMORY[0x24BDD1968], "hangulJamoTransformationDataValueWithJamoType:direction:", 3, 8);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v14[1] = v4;
      objc_msgSend(MEMORY[0x24BDD1968], "hangulJamoTransformationDataValueWithJamoType:direction:", 1, 9);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v14[2] = v8;
      v9 = (void *)MEMORY[0x24BDBCE30];
      v10 = v14;
      goto LABEL_10;
    case 4:
      objc_msgSend(MEMORY[0x24BDD1968], "hangulJamoTransformationDataValueWithJamoType:direction:", 0, 10);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = v3;
      objc_msgSend(MEMORY[0x24BDD1968], "hangulJamoTransformationDataValueWithJamoType:direction:", 4, 14);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v13[1] = v4;
      v5 = (void *)MEMORY[0x24BDBCE30];
      v6 = v13;
LABEL_8:
      objc_msgSend(v5, "arrayWithObjects:count:", v6, 2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    case 5:
      objc_msgSend(MEMORY[0x24BDD1968], "hangulJamoTransformationDataValueWithJamoType:direction:", 0, 11);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1968], "hangulJamoTransformationDataValueWithJamoType:direction:", 4, 12, v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v12[1] = v4;
      objc_msgSend(MEMORY[0x24BDD1968], "hangulJamoTransformationDataValueWithJamoType:direction:", 1, 13);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v12[2] = v8;
      v9 = (void *)MEMORY[0x24BDBCE30];
      v10 = v12;
LABEL_10:
      objc_msgSend(v9, "arrayWithObjects:count:", v10, 3);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_11:
      result = v11;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

+ (id)getStrokesForJamo:(id)a3 forVariant:(BOOL)a4 ofType:(int)a5 fromPath:(id)a6 forLocale:(unint64_t)a7
{
  void *v7;
  _BOOL4 v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;

  v10 = a4;
  v11 = a3;
  v12 = a6;
  v13 = 0;
  if (objc_msgSend(v11, "count"))
  {
    v14 = 0;
    while (1)
    {
      objc_msgSend(v11, "objectAtIndexedSubscript:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "hangulJamoPosition");

      if (v16 == a5)
        break;
LABEL_10:
      if (++v14 >= (unint64_t)objc_msgSend(v11, "count"))
        goto LABEL_11;
    }
    if (v10
      && (objc_msgSend(v11, "objectAtIndexedSubscript:", v14),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v7, "isConsonantVariant")))
    {
      objc_msgSend(v11, "objectAtIndexedSubscript:", v14);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "description");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "stringByAppendingFormat:", CFSTR("_%lu"), a7);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v11, "objectAtIndexedSubscript:", v14);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "description");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v10)
      {
LABEL_9:
        objc_msgSend(v12, "valueForKey:", v19);
        v21 = objc_claimAutoreleasedReturnValue();

        v13 = (void *)v21;
        goto LABEL_10;
      }
    }

    goto LABEL_9;
  }
LABEL_11:
  objc_msgSend(v13, "strokeArray");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

+ (id)shiftJamosInSyllable:(id)a3 withPath:(id)a4 forLocale:(unint64_t)a5
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  id v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  unint64_t v22;
  void *v23;
  void *v25;
  void *v26;

  v7 = a3;
  v8 = a4;
  v9 = objc_msgSend(v7, "syllableStructure");
  objc_msgSend(v7, "jamos");
  v25 = v7;
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "hasConsonantVariants");
  +[TypistPathUtilities _jamoShiftsForStructure:](TypistPathUtilities, "_jamoShiftsForStructure:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_opt_new();
  if (objc_msgSend(v11, "count"))
  {
    v13 = 0;
    do
    {
      objc_msgSend(v11, "objectAtIndexedSubscript:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v8;
      v16 = objc_msgSend(v14, "hangulJamoTransformationDataValue");
      v17 = HIDWORD(v16);

      v18 = v16;
      v8 = v15;
      +[TypistPathUtilities getStrokesForJamo:forVariant:ofType:fromPath:forLocale:](TypistPathUtilities, "getStrokesForJamo:forVariant:ofType:fromPath:forLocale:", v26, v10, v18, v15, a5);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      +[TypistPathUtilities shiftStrokesForJamo:withDirection:](TypistPathUtilities, "shiftStrokesForJamo:withDirection:", v19, v17);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObject:", v20);

      ++v13;
    }
    while (v13 < objc_msgSend(v11, "count"));
  }
  v21 = (void *)objc_opt_new();
  if (objc_msgSend(v12, "count"))
  {
    v22 = 0;
    do
    {
      objc_msgSend(v12, "objectAtIndexedSubscript:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "addObjectsFromArray:", v23);

      ++v22;
    }
    while (v22 < objc_msgSend(v12, "count"));
  }

  return v21;
}

+ (BOOL)isKoreanConsonantVariant:(unsigned __int16)a3
{
  uint64_t v3;
  void *v4;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD14A8], "hangulConsonantVariants");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v4, "characterIsMember:", v3);

  return v3;
}

+ (id)shiftStrokesForJamo:(id)a3 withDirection:(int)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _OWORD v15[3];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v4 = *(_QWORD *)&a4;
  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithArray:copyItems:", v6, 1);
  v21 = 0u;
  v22 = 0u;
  v20 = 0u;
  objc_msgSend(a1, "_determineShiftBasedOnDirection:", v4);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v23, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v12);
        v15[0] = v20;
        v15[1] = v21;
        v15[2] = v22;
        objc_msgSend(v13, "applyTransform:", v15);
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v23, 16);
    }
    while (v10);
  }

  return v8;
}

+ (CGAffineTransform)_determineShiftBasedOnDirection:(SEL)a3
{
  __int128 v5;
  __int128 v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGAffineTransform v11;
  CGAffineTransform t1;
  CGAffineTransform v13;
  CGAffineTransform v14;

  v5 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  *(_OWORD *)&v14.a = *MEMORY[0x24BDBD8B8];
  *(_OWORD *)&v14.c = v5;
  v6 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  *(_OWORD *)&v14.tx = v6;
  *(_OWORD *)&v13.a = *(_OWORD *)&v14.a;
  *(_OWORD *)&v13.c = v5;
  *(_OWORD *)&v13.tx = v6;
  switch(a4)
  {
    case 0:
      CGAffineTransformMakeTranslation(&v14, -3.815, -10.9);
      v7 = 1.1;
      v8 = 0.8;
      goto LABEL_25;
    case 1:
      v9 = 30.52;
      goto LABEL_21;
    case 2:
      CGAffineTransformMakeTranslation(&v14, -4.23888889, -13.8727273);
      v7 = 0.7;
      v8 = 1.2;
      goto LABEL_25;
    case 3:
      CGAffineTransformMakeTranslation(&v14, 25.4333333, -6.93636364);
      v7 = 0.9;
      goto LABEL_24;
    case 4:
      v10 = -7.63;
      goto LABEL_10;
    case 5:
      CGAffineTransformMakeTranslation(&v14, -0.0, 21.8);
      v7 = 1.0;
      goto LABEL_16;
    case 6:
      v10 = 38.15;
LABEL_10:
      CGAffineTransformMakeTranslation(&v14, -3.052, v10);
      v7 = 1.1;
      v8 = 0.7;
      goto LABEL_25;
    case 7:
      CGAffineTransformMakeTranslation(&v14, -4.23888889, -15.26);
      v7 = 0.7;
      v8 = 0.9;
      goto LABEL_25;
    case 8:
      CGAffineTransformMakeTranslation(&v14, 30.52, -0.0);
      v7 = 0.7;
      goto LABEL_18;
    case 9:
      CGAffineTransformMakeTranslation(&v14, 0.0, 36.3333333);
      v8 = 0.66;
      goto LABEL_22;
    case 10:
      CGAffineTransformMakeTranslation(&v14, 8.47777778, -7.63);
      v7 = 0.6;
      v8 = 0.6;
      goto LABEL_25;
    case 11:
      CGAffineTransformMakeTranslation(&v14, 4.23888889, 0.0);
      v7 = 0.6;
LABEL_16:
      v8 = 0.5;
      goto LABEL_25;
    case 12:
      CGAffineTransformMakeTranslation(&v14, 5.08666667, 12.7166667);
      v7 = 0.9;
LABEL_18:
      v8 = 0.6;
      goto LABEL_25;
    case 13:
      v9 = 42.3888889;
LABEL_21:
      CGAffineTransformMakeTranslation(&v14, 0.0, v9);
      v8 = 0.6;
LABEL_22:
      v7 = 1.0;
      goto LABEL_25;
    case 14:
      CGAffineTransformMakeTranslation(&v14, 0.0, 7.63);
      v7 = 1.0;
LABEL_24:
      v8 = 1.0;
LABEL_25:
      CGAffineTransformMakeScale(&v13, v7, v8);
      t1 = v13;
      v11 = v14;
      result = CGAffineTransformConcat(retstr, &t1, &v11);
      break;
    default:
      *(_OWORD *)&retstr->a = *(_OWORD *)&v14.a;
      *(_OWORD *)&retstr->c = v5;
      *(_OWORD *)&retstr->tx = v6;
      break;
  }
  return result;
}

@end
