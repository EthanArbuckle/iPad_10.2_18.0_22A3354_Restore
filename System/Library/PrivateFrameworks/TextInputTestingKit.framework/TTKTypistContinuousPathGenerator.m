@implementation TTKTypistContinuousPathGenerator

- (id)_generateTouchPointsOnPath:(id)a3 withSegmentTiming:(id)a4
{
  id v6;
  TIContinuousPath *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  double v15;
  double v16;
  TIContinuousPathSample *v17;
  TIContinuousPathSample *v18;
  void *v20;
  id v21;
  uint64_t v22;

  v6 = a3;
  v21 = a4;
  v7 = objc_alloc_init(TIContinuousPath);
  if (objc_msgSend(v6, "count") != 1)
  {
    v8 = 0;
    v9 = 0;
    v20 = v6;
    do
    {
      if (objc_msgSend(v6, "count") - v8 > 3)
        v10 = 4;
      else
        v10 = objc_msgSend(v6, "count") - v8;
      objc_msgSend(v6, "subarrayWithRange:", v8, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v9;
      objc_msgSend(v21, "objectAtIndexedSubscript:", v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "count"))
      {
        v13 = 0;
        do
        {
          objc_msgSend(v12, "objectAtIndex:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "doubleValue");
          v16 = v15;

          self->_currentTimestamp = v16 + self->_currentTimestamp;
          v17 = [TIContinuousPathSample alloc];
          -[TTKTypistContinuousPathGenerator _pointOnCurve:atTime:](self, "_pointOnCurve:atTime:", v11, v16);
          v18 = -[TIContinuousPathSample initWithPoint:timeStamp:force:radius:stage:pathIndex:](v17, "initWithPoint:timeStamp:force:radius:stage:pathIndex:", 7, -1);
          -[TIContinuousPath addSample:](v7, "addSample:", v18);

          ++v13;
        }
        while (v13 < objc_msgSend(v12, "count"));
      }
      v9 = v22 + 1;

      v8 += 3;
      v6 = v20;
    }
    while (objc_msgSend(v20, "count") - 1 > v8);
  }

  return v7;
}

- (CGPoint)_pointOnCurve:(id)a3 atTime:(double)a4
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

- (id)_generateControlPoints:(id)a3 alpha:(double)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  float v12;
  float v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
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
  double v44;
  double v45;
  double v46;
  float v47;
  double v48;
  float v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  float v56;
  double v57;
  double v58;
  double v59;
  double v60;
  float v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  float v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  float v74;
  float v75;
  double v76;
  double v77;
  double v78;
  double v79;
  float v80;
  double v81;
  double v82;
  double v83;
  double v84;
  float v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  float v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  double v106;
  float v107;
  float v108;
  void *v109;
  double v110;
  double v111;
  double v112;
  float v113;
  double v114;
  double v115;
  double v116;
  double v117;
  double v118;
  double v119;
  _QWORD v120[5];

  v120[3] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    v8 = objc_msgSend(v6, "count");
    if (v8 >= 4)
    {
      v10 = v8;
      objc_msgSend(MEMORY[0x24BDF6870], "bezierPath");
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_opt_new();
      v11 = 0;
      v12 = a4 + a4;
      v13 = a4;
      v107 = v13;
      v108 = v12;
      while (1)
      {
        objc_msgSend(v7, "objectAtIndex:", v11);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "CGPointValue");
        v16 = v15;
        v18 = v17;

        objc_msgSend(v7, "objectAtIndex:", v11 + 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "CGPointValue");
        v21 = v20;
        v23 = v22;

        objc_msgSend(v7, "objectAtIndex:", (v11 + 2) % v10);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "CGPointValue");
        v26 = v25;
        v28 = v27;

        objc_msgSend(v7, "objectAtIndex:", ((v11 + 2) % v10 + 1) % v10);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "CGPointValue");
        v31 = v30;
        v33 = v32;

        v110 = v18;
        v111 = v16;
        -[TTKDefaultContinuousPathGenerator subtractPoint:byPoint:](self, "subtractPoint:byPoint:", v21, v23, v16, v18);
        v35 = v34;
        v37 = v36;
        v118 = v23;
        v119 = v21;
        -[TTKDefaultContinuousPathGenerator subtractPoint:byPoint:](self, "subtractPoint:byPoint:", v26, v28, v21, v23);
        v39 = v38;
        v41 = v40;
        v114 = v33;
        v115 = v31;
        -[TTKDefaultContinuousPathGenerator subtractPoint:byPoint:](self, "subtractPoint:byPoint:", v31, v33, v26, v28);
        v43 = v42;
        v45 = v44;
        -[TTKDefaultContinuousPathGenerator dotProduct:andPoint:](self, "dotProduct:andPoint:", v35, v37, v35, v37);
        *(float *)&v46 = v46;
        v47 = sqrtf(*(float *)&v46);
        -[TTKDefaultContinuousPathGenerator dotProduct:andPoint:](self, "dotProduct:andPoint:", v39, v41, v39, v41);
        *(float *)&v48 = v48;
        v49 = sqrtf(*(float *)&v48);
        -[TTKDefaultContinuousPathGenerator dotProduct:andPoint:](self, "dotProduct:andPoint:", v43, v45, v43, v45);
        v51 = v50;
        v116 = v28;
        v117 = v26;
        v113 = v49;
        if (fabsf(v47) >= 0.00000011921)
        {
          v106 = v50;
          v56 = powf(v47, v108);
          -[TTKDefaultContinuousPathGenerator scalarMultiplyPoint:by:](self, "scalarMultiplyPoint:by:", v26, v28, v56);
          v58 = v57;
          v60 = v59;
          v61 = powf(v49, v108);
          -[TTKDefaultContinuousPathGenerator scalarMultiplyPoint:by:](self, "scalarMultiplyPoint:by:", v111, v110, v61);
          -[TTKDefaultContinuousPathGenerator subtractPoint:byPoint:](self, "subtractPoint:byPoint:", v58, v60, v62, v63);
          v65 = v64;
          v67 = v66;
          v68 = powf(v47, v107) * 3.0;
          v69 = (float)(v61 + (float)((float)(v68 * powf(v49, v107)) + (float)(v56 * 2.0)));
          v52 = v118;
          v53 = v119;
          -[TTKDefaultContinuousPathGenerator scalarMultiplyPoint:by:](self, "scalarMultiplyPoint:by:", v119, v118, v69);
          -[TTKDefaultContinuousPathGenerator addPoint:andPoint:](self, "addPoint:andPoint:", v65, v67, v70, v71);
          -[TTKDefaultContinuousPathGenerator scalarMultiplyPoint:by:](self, "scalarMultiplyPoint:by:");
          v51 = v106;
          v55 = v72;
          v54 = v73;
        }
        else
        {
          v52 = v118;
          v53 = v119;
          v54 = v118;
          v55 = v119;
        }
        v74 = v51;
        v75 = sqrtf(v74);
        if (fabsf(v75) >= 0.00000011921)
        {
          v80 = powf(v75, v108);
          -[TTKDefaultContinuousPathGenerator scalarMultiplyPoint:by:](self, "scalarMultiplyPoint:by:", v53, v52, v80);
          v82 = v81;
          v112 = v55;
          v84 = v83;
          v85 = powf(v113, v108);
          -[TTKDefaultContinuousPathGenerator scalarMultiplyPoint:by:](self, "scalarMultiplyPoint:by:", v115, v114, v85);
          -[TTKDefaultContinuousPathGenerator subtractPoint:byPoint:](self, "subtractPoint:byPoint:", v82, v84, v86, v87);
          v89 = v88;
          v91 = v90;
          v92 = powf(v75, v107) * 3.0;
          v93 = (float)(v85 + (float)((float)(powf(v113, v107) * v92) + (float)(v80 * 2.0)));
          v76 = v116;
          v77 = v117;
          -[TTKDefaultContinuousPathGenerator scalarMultiplyPoint:by:](self, "scalarMultiplyPoint:by:", v117, v116, v93);
          v95 = v94;
          v96 = v91;
          v55 = v112;
          -[TTKDefaultContinuousPathGenerator addPoint:andPoint:](self, "addPoint:andPoint:", v89, v96, v97, v95);
          -[TTKDefaultContinuousPathGenerator scalarMultiplyPoint:by:](self, "scalarMultiplyPoint:by:");
          v78 = v98;
          v79 = v99;
          if (!v11)
          {
LABEL_12:
            objc_msgSend(v109, "moveToPoint:", v119, v118, *(_QWORD *)&v106);
            objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGPoint:", v119, v118);
            v100 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "addObject:", v100);

          }
        }
        else
        {
          v76 = v116;
          v77 = v117;
          v78 = v117;
          v79 = v116;
          if (!v11)
            goto LABEL_12;
        }
        objc_msgSend(v109, "addCurveToPoint:controlPoint1:controlPoint2:", v77, v76, v55, v54, v78, v79, *(_QWORD *)&v106);
        objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGPoint:", v55, v54);
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        v120[0] = v101;
        objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGPoint:", v78, v79);
        v102 = (void *)objc_claimAutoreleasedReturnValue();
        v120[1] = v102;
        objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGPoint:", v77, v76);
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        v120[2] = v103;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v120, 3);
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObjectsFromArray:", v104);

        if (v10 - 3 == ++v11)
        {

          goto LABEL_15;
        }
      }
    }
  }
  v9 = 0;
LABEL_15:

  return v9;
}

- (TTKTypistContinuousPathGenerator)initWithParams:(id)a3
{
  id v4;
  TTKTypistContinuousPathGenerator *v5;
  TTKTypistContinuousPathGenerator *v6;
  void *v7;
  void *v8;
  float v9;
  double v10;
  BOOL v11;
  double v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)TTKTypistContinuousPathGenerator;
  v5 = -[TTKDefaultContinuousPathGenerator initWithParams:](&v14, sel_initWithParams_, v4);
  v6 = v5;
  if (v5)
  {
    if (v4)
    {
      objc_msgSend(v4, "objectForKey:", CFSTR("ALPHA"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        objc_msgSend(v4, "objectForKey:", CFSTR("ALPHA"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "floatValue");
        v10 = v9;
        if (v9 > 1.0)
          v10 = 1.0;
        v11 = v9 < 0.0;
        v12 = 0.0;
        if (!v11)
          v12 = v10;
        -[TTKTypistContinuousPathGenerator setAlpha:](v6, "setAlpha:", v12);

      }
      else
      {
        -[TTKTypistContinuousPathGenerator setAlpha:](v6, "setAlpha:", 0.5);
      }

    }
    else
    {
      -[TTKTypistContinuousPathGenerator setAlpha:](v5, "setAlpha:", 0.5);
    }
  }

  return v6;
}

- (id)generatePathFromInflectionPoints:(id)a3 segmentTiming:(id)a4 keys:(id)a5 string:(id)a6 layout:(id)a7
{
  return -[TTKTypistContinuousPathGenerator generatePathFromInflectionPoints:timestamp:segmentTiming:keys:string:layout:](self, "generatePathFromInflectionPoints:timestamp:segmentTiming:keys:string:layout:", a3, a4, a5, a6, a7, 0.0);
}

- (id)generatePathFromInflectionPoints:(id)a3 timestamp:(double)a4 segmentTiming:(id)a5 keys:(id)a6 string:(id)a7 layout:(id)a8
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v18;

  v10 = a3;
  v11 = a5;
  v12 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObject:", v13);

  objc_msgSend(v12, "addObjectsFromArray:", v10);
  objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v10, "count") - 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObject:", v14);

  if (!v11)
  {
    v18.receiver = self;
    v18.super_class = (Class)TTKTypistContinuousPathGenerator;
    -[TTKDefaultContinuousPathGenerator generateTimingArray:](&v18, sel_generateTimingArray_, v10);
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  -[TTKTypistContinuousPathGenerator alpha](self, "alpha");
  -[TTKTypistContinuousPathGenerator _generateControlPoints:alpha:](self, "_generateControlPoints:alpha:", v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[TTKTypistContinuousPathGenerator _generateTouchPointsOnPath:withSegmentTiming:](self, "_generateTouchPointsOnPath:withSegmentTiming:", v15, v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (double)alpha
{
  return self->_alpha;
}

- (void)setAlpha:(double)a3
{
  self->_alpha = a3;
}

@end
