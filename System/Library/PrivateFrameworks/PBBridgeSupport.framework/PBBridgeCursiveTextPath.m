@implementation PBBridgeCursiveTextPath

- (PBBridgeCursiveTextPath)initWithURL:(id)a3
{
  return -[PBBridgeCursiveTextPath initWithURL:options:](self, "initWithURL:options:", a3, 0);
}

- (PBBridgeCursiveTextPath)initWithURL:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  PBBridgeCursiveTextPath *v8;
  PBBridgeCursiveTextPath *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  NSDictionary *pathDefinition;
  void *v14;
  double v15;
  double v16;
  void *v17;
  int v18;
  PBBridgeCursiveTextPath *v19;
  const CGPath *v20;
  void *v21;
  void *v22;
  objc_super v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v24.receiver = self;
  v24.super_class = (Class)PBBridgeCursiveTextPath;
  v8 = -[PBBridgeCursiveTextPath init](&v24, sel_init);
  v9 = v8;
  if (!v8)
  {
LABEL_13:
    v19 = v9;
    goto LABEL_14;
  }
  *(_QWORD *)&v8->_initialWeight = 0x3F8000003F266666;
  v8->_rampTime = 0.25;
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:", v6);
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = v10;
    objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", v10, 0, 0, 0);
    v12 = objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      pathDefinition = v9->_pathDefinition;
      v9->_pathDefinition = (NSDictionary *)v12;

      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("resolution"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v14;
      if (v14)
        v18 = objc_msgSend(v14, "intValue");
      else
        v18 = 40;
      v9->_resolution = v18;
      LODWORD(v15) = 0;
      LODWORD(v16) = 0;
      v20 = -[PBBridgeCursiveTextPath pathForFraction:calculateLength:startFraction:](v9, "pathForFraction:calculateLength:startFraction:", 1, v15, v16);
      v9->_boundingBoxOfPath = CGPathGetPathBoundingBox(v20);
      CGPathRelease(v20);
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("enableErase"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v21;
      if (v21)
        LOBYTE(v21) = objc_msgSend(v21, "BOOLValue");
      v9->_enableErase = (char)v21;
      v9->_duration = (float)(powf((float)(fminf(fmaxf(v9->_length / 3000.0, 0.0), 10.0) / 10.0) + -1.0, 3.0) + 1.0)
                    * 4.0;

      goto LABEL_13;
    }
  }
  else
  {
    pbb_setup_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v26 = "-[PBBridgeCursiveTextPath initWithURL:options:]";
      v27 = 2112;
      v28 = v6;
      _os_log_impl(&dword_2113B6000, v11, OS_LOG_TYPE_DEFAULT, "%s - No data loaded from URL: %@", buf, 0x16u);
    }
  }

  v19 = 0;
LABEL_14:

  return v19;
}

- (CGAffineTransform)transformForRect:(SEL)a3 pointSize:(CGRect)a4 flipped:(double)a5
{
  CGAffineTransform *result;
  _BOOL4 v9;
  double height;
  double width;
  void *v13;
  float v14;
  double v15;
  void *v16;
  float v17;
  double v18;
  void *v19;
  float v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double x;
  double v27;
  double v28;
  double v29;
  float v30;
  double v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint64_t v37;
  __int128 v38;
  CGAffineTransform v39;
  CGAffineTransform t1;
  CGAffineTransform t2;
  CGAffineTransform v42;

  result = (CGAffineTransform *)self->_pathDefinition;
  if (result)
  {
    v9 = a6;
    height = a4.size.height;
    width = a4.size.width;
    -[CGAffineTransform objectForKeyedSubscript:](result, "objectForKeyedSubscript:", CFSTR("unitsPerEm"), a4.origin.x, a4.origin.y);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "floatValue");
    v15 = v14;

    -[NSDictionary objectForKeyedSubscript:](self->_pathDefinition, "objectForKeyedSubscript:", CFSTR("ascender"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "floatValue");
    v18 = v17;

    -[NSDictionary objectForKeyedSubscript:](self->_pathDefinition, "objectForKeyedSubscript:", CFSTR("descender"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "floatValue");
    v21 = v20;

    v22 = v18 - v21;
    v23 = -v21 / (v18 - v21);
    v24 = v22 / v15 * a5;
    v25 = (height - v24) * 0.5;
    *(float *)&v22 = v22;
    self->_lineHeight = *(float *)&v22;
    x = self->_boundingBoxOfPath.origin.x;
    v27 = self->_boundingBoxOfPath.size.width;
    *(_OWORD *)&retstr->a = 0u;
    *(_OWORD *)&retstr->c = 0u;
    *(_OWORD *)&retstr->tx = 0u;
    CGAffineTransformMakeTranslation(retstr, -(x + v27 * 0.5), 0.0);
    if (v9)
      v28 = 1.0 - v23;
    else
      v28 = v23;
    v29 = v25 + v28 * v24;
    v30 = a5 / v15;
    self->_scale = v30;
    v31 = -(a5 / v15);
    if (!v9)
      v31 = a5 / v15;
    CGAffineTransformMakeScale(&t2, a5 / v15, v31);
    v32 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&t1.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&t1.c = v32;
    *(_OWORD *)&t1.tx = *(_OWORD *)&retstr->tx;
    CGAffineTransformConcat(&v42, &t1, &t2);
    v33 = *(_OWORD *)&v42.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v42.a;
    *(_OWORD *)&retstr->c = v33;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&v42.tx;
    CGAffineTransformMakeTranslation(&v39, width * 0.5, v29);
    v34 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&t1.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&t1.c = v34;
    *(_OWORD *)&t1.tx = *(_OWORD *)&retstr->tx;
    result = CGAffineTransformConcat(&v42, &t1, &v39);
    v35 = *(_OWORD *)&v42.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v42.a;
    *(_OWORD *)&retstr->c = v35;
    v36 = *(_OWORD *)&v42.tx;
  }
  else
  {
    v37 = MEMORY[0x24BDBD8B8];
    v38 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
    *(_OWORD *)&retstr->a = *MEMORY[0x24BDBD8B8];
    *(_OWORD *)&retstr->c = v38;
    v36 = *(_OWORD *)(v37 + 32);
  }
  *(_OWORD *)&retstr->tx = v36;
  return result;
}

- (float)animationDuration
{
  float result;

  result = self->_duration;
  if (self->_enableErase)
    return result + result;
  return result;
}

- (float)duration
{
  return self->_duration;
}

- (CGRect)boundingBoxOfPath
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_boundingBoxOfPath.origin.x;
  y = self->_boundingBoxOfPath.origin.y;
  width = self->_boundingBoxOfPath.size.width;
  height = self->_boundingBoxOfPath.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (float)lineHeight
{
  return self->_lineHeight;
}

- (float)scale
{
  return self->_scale;
}

- (CGPath)pathForTime:(float)a3
{
  double v3;
  float duration;
  float v6;
  NSObject *v7;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  duration = self->_duration;
  if (duration == 0.0)
  {
    pbb_setup_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 136315138;
      v10 = "-[PBBridgeCursiveTextPath pathForTime:]";
      _os_log_impl(&dword_2113B6000, v7, OS_LOG_TYPE_DEFAULT, "%s Duration is 0", (uint8_t *)&v9, 0xCu);
    }

    a3 = 0.0;
    LODWORD(v3) = 0;
  }
  else
  {
    v6 = a3;
    a3 = a3 / duration;
    *(float *)&v3 = (float)(v6 - duration) / duration;
    if (!self->_enableErase)
      *(float *)&v3 = 0.0;
  }
  return -[PBBridgeCursiveTextPath pathForFraction:calculateLength:startFraction:](self, "pathForFraction:calculateLength:startFraction:", 0, *(double *)&a3, v3);
}

- (CGPath)pathForFraction:(float)a3 calculateLength:(BOOL)a4 startFraction:(float)a5
{
  _BOOL4 v6;
  float duration;
  float v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v20;
  unsigned int v21;
  void *v22;
  unsigned int v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  char v30;
  float v31;
  float v32;
  uint64_t v33;
  float v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t i;
  BezierCurve *v39;
  __int128 v40;
  float32x4_t v41;
  int resolution;
  float32x4_t v43;
  int v44;
  int v45;
  float32x4_t v46;
  double v47;
  float v48;
  float32x4_t v49;
  int32x2_t v50;
  __int32 v51;
  float32x2_t v52;
  float32x2_t v53;
  float32x2_t v54;
  float32x2_t v55;
  float32x4_t v56;
  float32x4_t v57;
  double v58;
  double v59;
  float v60;
  float v61;
  double v62;
  float v63;
  float finalWeight;
  float initialWeight;
  float v66;
  float v67;
  PathPoint *v68;
  double v69;
  double v70;
  PathPoint *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t j;
  void *v76;
  CGPath *Mutable;
  void *v78;
  float v79;
  float v80;
  float v81;
  CGFloat v82;
  float v83;
  CGFloat v84;
  float v85;
  CGFloat v86;
  float v87;
  id v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t k;
  void *v93;
  float32x2_t v94;
  float32x2_t v95;
  float32x2_t v96;
  float v97;
  float32x2_t v98;
  void *v99;
  float v100;
  float v101;
  float v102;
  CGFloat v103;
  float v104;
  CGFloat v105;
  float v106;
  CGFloat v107;
  float v108;
  void *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t m;
  void *v114;
  float32x2_t v115;
  float32x2_t v116;
  float32x2_t v117;
  float32x2_t v118;
  float32x2_t v119;
  uint64_t v121;
  uint64_t v122;
  void *v123;
  uint64_t v124;
  void *v125;
  void *v126;
  uint64_t v127;
  uint64_t v128;
  id obj;
  double v130;
  unsigned int v131;
  float v132;
  float v133;
  float v134;
  float v135;
  id v136;
  CGMutablePathRef path1c[2];
  CGMutablePathRef path1[2];
  int8x8_t path1a;
  CGPath *path1b;
  unsigned int v141;
  float32x4_t v142;
  float32x4_t v143;
  float32x2_t v144;
  float32x2_t v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  _BYTE v166[128];
  _BYTE v167[128];
  _BYTE v168[128];
  _BYTE v169[128];
  _BYTE v170[128];
  uint64_t v171;

  v6 = a4;
  v171 = *MEMORY[0x24BDAC8D0];
  duration = self->_duration;
  if (duration == 0.0)
    v10 = 0.0;
  else
    v10 = self->_rampTime / duration;
  v135 = v10;
  v11 = 0x24BDBC000uLL;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](self->_pathDefinition, "objectForKeyedSubscript:", CFSTR("scale"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  __asm { FMOV            V0.4S, #1.0 }
  v130 = *(double *)&_Q0;
  if (v13 && objc_msgSend(v13, "count") == 4)
  {
    objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "floatValue");
    v131 = v21;

    objc_msgSend(v14, "objectAtIndexedSubscript:", 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "floatValue");
    v141 = v23;

    objc_msgSend(v14, "objectAtIndexedSubscript:", 2);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "floatValue");

    objc_msgSend(v14, "objectAtIndexedSubscript:", 3);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "floatValue");
    v130 = COERCE_DOUBLE(__PAIR64__(v141, v131));

  }
  v125 = v14;
  -[NSDictionary objectForKeyedSubscript:](self->_pathDefinition, "objectForKeyedSubscript:", CFSTR("strokes"));
  v162 = 0u;
  v163 = 0u;
  v164 = 0u;
  v165 = 0u;
  v26 = (id)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v162, v170, 16);
  v126 = v26;
  if (v27)
  {
    v28 = v27;
    v29 = 0;
    v30 = 0;
    v31 = (float)-v135 + (v135 + 1.0) * a3;
    v32 = a5 * 1.25 + -0.25;
    v33 = *(_QWORD *)v163;
    v132 = (float)(a5 * -0.5) + 1.0;
    v133 = v31;
    v134 = v135 + v31;
    v142 = 0u;
    v34 = 0.0;
    v122 = *(_QWORD *)v163;
    v123 = v12;
    do
    {
      v35 = 0;
      do
      {
        if (*(_QWORD *)v163 != v33)
          objc_enumerationMutation(v26);
        v124 = v35;
        v36 = *(void **)(*((_QWORD *)&v162 + 1) + 8 * v35);
        objc_msgSend(*(id *)(v11 + 3768), "array");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v158 = 0u;
        v159 = 0u;
        v160 = 0u;
        v161 = 0u;
        obj = v36;
        v127 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v158, v169, 16);
        if (v127)
        {
          v128 = *(_QWORD *)v159;
          v121 = v28;
          do
          {
            for (i = 0; i != v127; ++i)
            {
              if (*(_QWORD *)v159 != v128)
                objc_enumerationMutation(obj);
              v39 = -[BezierCurve initWithDictionary:]([BezierCurve alloc], "initWithDictionary:", *(_QWORD *)(*((_QWORD *)&v158 + 1) + 8 * i));
              -[BezierCurve scaleBy:](v39, "scaleBy:", v130);
              -[BezierCurve p0](v39, "p0");
              *(_OWORD *)path1c = v40;
              -[BezierCurve p3](v39, "p3");
              if ((vminvq_u32((uint32x4_t)vceqq_f32(*(float32x4_t *)path1c, v41)) & 0x80000000) != 0)
              {
                resolution = 0;
                v43 = v142;
LABEL_21:
                v44 = 0;
                v45 = resolution + 1;
                v46 = v43;
                while (1)
                {
                  *(float32x4_t *)path1 = v46;
                  v47 = 1.0 / (float)self->_resolution * (float)v44;
                  v48 = v47;
                  *(float *)&v47 = v48;
                  -[BezierCurve pointAt:](v39, "pointAt:", v47);
                  v143 = v49;
                  v49.f32[0] = v48;
                  -[BezierCurve derivativeAt:](v39, "derivativeAt:", *(double *)v49.i64);
                  *(float *)&v51 = -*(float *)v50.i32;
                  v50.i32[0] = vdup_lane_s32(v50, 1).u32[0];
                  v50.i32[1] = v51;
                  v52 = vmul_f32((float32x2_t)v50, (float32x2_t)v50);
                  v52.i32[0] = vadd_f32(v52, (float32x2_t)vdup_lane_s32((int32x2_t)v52, 1)).u32[0];
                  v53 = vrsqrte_f32((float32x2_t)v52.u32[0]);
                  v54 = vmul_f32(v53, vrsqrts_f32((float32x2_t)v52.u32[0], vmul_f32(v53, v53)));
                  v55 = vmul_n_f32((float32x2_t)v50, vmul_f32(v54, vrsqrts_f32((float32x2_t)v52.u32[0], vmul_f32(v54, v54))).f32[0]);
                  if ((v30 & 1) != 0)
                  {
                    v56 = vsubq_f32(v143, *(float32x4_t *)path1);
                    v57 = vmulq_f32(v56, v56);
                    v58 = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v57, 2), vaddq_f32(v57, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v57.f32, 1))).f32[0]);
                    v59 = 0.5;
                    if ((v29 & 1) == 0)
                      v59 = 1.0;
                    v34 = v34 + v58 * v59;
                    v29 = 0;
                  }
                  v60 = v34 / self->_length;
                  if (v60 >= v32)
                  {
                    path1a = (int8x8_t)v55;
                    if (a5 <= 0.0)
                    {
                      v63 = a5;
                      initialWeight = self->_initialWeight;
                      finalWeight = self->_finalWeight;
                      *(float *)&v62 = powf((float)(1.0 - fminf(fmaxf((float)(v60 - v133) / v135, 0.0), 1.0)) + -1.0, 3.0);
                      v66 = finalWeight - initialWeight;
                      a5 = v63;
                      *(float *)&v62 = initialWeight + (float)((float)(*(float *)&v62 + 1.0) * v66);
                    }
                    else
                    {
                      v61 = v132 * self->_finalWeight;
                      *(float *)&v62 = (float)((float)(powf(fminf(fmaxf((float)(v60 - v32) * 4.0, 0.0), 1.0) + -1.0, 3.0)+ 1.0)* (float)(v61 + -0.2))+ 0.2;
                    }
                    if (!v6 && v60 > v134)
                    {
                      v12 = v123;
                      objc_msgSend(v123, "addObject:", v37, v62);

                      v26 = v126;
                      goto LABEL_41;
                    }
                    v67 = vmuls_lane_f32(*(float *)&v62, v143, 3);
                    v68 = [PathPoint alloc];
                    *(float *)&v69 = v67;
                    *(float *)&v70 = v34;
                    v71 = -[PathPoint initWithP:n:r:l:](v68, "initWithP:n:r:l:", *(double *)v143.i64, COERCE_DOUBLE(vbsl_s8((int8x8_t)vdup_n_s32(0xFFFFFFFF), path1a, (int8x8_t)0x3F80000000000000)), v69, v70);
                    objc_msgSend(v37, "addObject:", v71);

                  }
                  ++v44;
                  v30 = 1;
                  v43 = v143;
                  v46 = v143;
                  if (v45 == v44)
                    goto LABEL_34;
                }
              }
              resolution = self->_resolution;
              v43 = v142;
              if ((resolution & 0x80000000) == 0)
                goto LABEL_21;
LABEL_34:
              v142 = v43;

              v29 = 1;
            }
            v26 = v126;
            v12 = v123;
            v11 = 0x24BDBC000;
            v28 = v121;
            v127 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v158, v169, 16);
          }
          while (v127);
        }

        objc_msgSend(v12, "addObject:", v37);
        v35 = v124 + 1;
        v33 = v122;
      }
      while (v124 + 1 != v28);
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v162, v170, 16);
    }
    while (v28);
  }
  else
  {
    v34 = 0.0;
  }
LABEL_41:

  if (v6)
    self->_length = v34;
  path1b = CGPathCreateMutable();
  v154 = 0u;
  v155 = 0u;
  v156 = 0u;
  v157 = 0u;
  v136 = v12;
  v72 = objc_msgSend(v136, "countByEnumeratingWithState:objects:count:", &v154, v168, 16);
  if (v72)
  {
    v73 = v72;
    v74 = *(_QWORD *)v155;
    do
    {
      for (j = 0; j != v73; ++j)
      {
        if (*(_QWORD *)v155 != v74)
          objc_enumerationMutation(v136);
        v76 = *(void **)(*((_QWORD *)&v154 + 1) + 8 * j);
        if (objc_msgSend(v76, "count"))
        {
          Mutable = CGPathCreateMutable();
          objc_msgSend(v76, "objectAtIndexedSubscript:", 0);
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v78, "n");
          v80 = -v79;
          objc_msgSend(v78, "n");
          v82 = atan2f(v80, -v81);
          objc_msgSend(v78, "p");
          v84 = v83;
          objc_msgSend(v78, "p");
          v86 = v85;
          objc_msgSend(v78, "r");
          CGPathAddArc(Mutable, 0, v84, v86, v87, v82, v82 + 3.14159265, 0);
          v152 = 0u;
          v153 = 0u;
          v150 = 0u;
          v151 = 0u;
          v88 = v76;
          v89 = objc_msgSend(v88, "countByEnumeratingWithState:objects:count:", &v150, v167, 16);
          if (v89)
          {
            v90 = v89;
            v91 = *(_QWORD *)v151;
            do
            {
              for (k = 0; k != v90; ++k)
              {
                if (*(_QWORD *)v151 != v91)
                  objc_enumerationMutation(v88);
                v93 = *(void **)(*((_QWORD *)&v150 + 1) + 8 * k);
                objc_msgSend(v93, "p");
                v144 = v94;
                objc_msgSend(v93, "n");
                v96 = v95;
                objc_msgSend(v93, "r");
                v98 = vmla_n_f32(v144, v96, v97);
                CGPathAddLineToPoint(Mutable, 0, v98.f32[0], v98.f32[1]);
              }
              v90 = objc_msgSend(v88, "countByEnumeratingWithState:objects:count:", &v150, v167, 16);
            }
            while (v90);
          }

          objc_msgSend(v88, "objectAtIndexedSubscript:", objc_msgSend(v88, "count") - 1);
          v99 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v99, "n");
          v101 = v100;
          objc_msgSend(v99, "n");
          v103 = atan2f(v101, v102);
          objc_msgSend(v99, "p");
          v105 = v104;
          objc_msgSend(v99, "p");
          v107 = v106;
          objc_msgSend(v99, "r");
          CGPathAddArc(Mutable, 0, v105, v107, v108, v103, v103 + 3.14159265, 0);
          v148 = 0u;
          v149 = 0u;
          v146 = 0u;
          v147 = 0u;
          objc_msgSend(v88, "reverseObjectEnumerator");
          v109 = (void *)objc_claimAutoreleasedReturnValue();
          v110 = objc_msgSend(v109, "countByEnumeratingWithState:objects:count:", &v146, v166, 16);
          if (v110)
          {
            v111 = v110;
            v112 = *(_QWORD *)v147;
            do
            {
              for (m = 0; m != v111; ++m)
              {
                if (*(_QWORD *)v147 != v112)
                  objc_enumerationMutation(v109);
                v114 = *(void **)(*((_QWORD *)&v146 + 1) + 8 * m);
                objc_msgSend(v114, "p");
                v145 = v115;
                objc_msgSend(v114, "n");
                v117 = v116;
                objc_msgSend(v114, "r");
                v119 = vmls_lane_f32(v145, v117, v118, 0);
                CGPathAddLineToPoint(Mutable, 0, v119.f32[0], v119.f32[1]);
              }
              v111 = objc_msgSend(v109, "countByEnumeratingWithState:objects:count:", &v146, v166, 16);
            }
            while (v111);
          }

          CGPathAddPath(path1b, 0, Mutable);
          CGPathRelease(Mutable);

        }
      }
      v73 = objc_msgSend(v136, "countByEnumeratingWithState:objects:count:", &v154, v168, 16);
    }
    while (v73);
  }

  return path1b;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pathDefinition, 0);
}

@end
