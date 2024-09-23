@implementation SBCursiveTextPath

- (SBCursiveTextPath)initWithURL:(id)a3
{
  return -[SBCursiveTextPath initWithURL:resolution:](self, "initWithURL:resolution:", a3, 40);
}

- (SBCursiveTextPath)initWithURL:(id)a3 resolution:(int64_t)a4
{
  char *v5;
  char *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  float v10;
  void *v11;
  float v12;
  void *v13;
  float v14;
  id v15;
  void *v16;
  void *v17;
  unsigned int v18;
  void *v19;
  unsigned int v20;
  void *v21;
  unsigned int v22;
  void *v23;
  uint64_t v24;
  __int128 v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  _QWORD *v34;
  const void *v35;
  int64_t v36;
  char *v37;
  uint64_t v38;
  const CGPath *v39;
  float v40;
  SBCursiveTextPath *v41;
  NSObject *v42;
  void *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  uint64_t v48;
  unsigned int v49;
  unsigned int v50;
  void *v51;
  id v52;
  void *v53;
  void *v55;
  id v56;
  id obj[2];
  unsigned int objb;
  id obja;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  void *v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  float32x4_t v69;
  id v70;
  objc_super v71;
  uint8_t v72[128];
  uint8_t buf[8];
  const void *v74;
  uint64_t v75;
  _BYTE v76[128];
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v56 = a3;
  v71.receiver = self;
  v71.super_class = (Class)SBCursiveTextPath;
  v5 = -[SBCursiveTextPath init](&v71, sel_init);
  v6 = v5;
  if (v5)
  {
    *(_OWORD *)(v5 + 8) = xmmword_1D0E88560;
    *((_QWORD *)v5 + 3) = 0x3FD0000000000000;
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", v56);
    v7 = objc_claimAutoreleasedReturnValue();
    v53 = (void *)v7;
    if (v7)
    {
      v70 = 0;
      objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v7, 0, 0, &v70);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = v70;
      v55 = v8;
      if (v8)
      {
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("unitsPerEm"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "floatValue");
        *((double *)v6 + 10) = v10;

        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("ascender"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "floatValue");
        *((double *)v6 + 11) = v12;

        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("descender"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "floatValue");
        *((double *)v6 + 12) = v14;

        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("scale"));
        v15 = (id)objc_claimAutoreleasedReturnValue();
        v16 = v15;
        *(_OWORD *)obj = 0u;
        if (v15 && objc_msgSend(v15, "count") == 4)
        {
          objc_msgSend(v16, "objectAtIndexedSubscript:", 0);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "floatValue");
          objb = v18;
          objc_msgSend(v16, "objectAtIndexedSubscript:", 1);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "floatValue");
          v50 = v20;
          objc_msgSend(v16, "objectAtIndexedSubscript:", 2);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "floatValue");
          v49 = v22;
          objc_msgSend(v16, "objectAtIndexedSubscript:", 3);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "floatValue");
          v48 = v24;

          *(_QWORD *)&v25 = __PAIR64__(v50, objb);
          *((_QWORD *)&v25 + 1) = __PAIR64__(v48, v49);
          *(_OWORD *)obj = v25;
        }

        v69 = *(float32x4_t *)obj;
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("strokes"));
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        std::vector<std::vector<BezierCurve>>::reserve((_QWORD *)v6 + 13, objc_msgSend(v51, "count"));
        v67 = 0u;
        v68 = 0u;
        v65 = 0u;
        v66 = 0u;
        obja = v51;
        v26 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v65, v76, 16);
        if (v26)
        {
          v27 = *(_QWORD *)v66;
          do
          {
            for (i = 0; i != v26; ++i)
            {
              if (*(_QWORD *)v66 != v27)
                objc_enumerationMutation(obja);
              v29 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * i);
              *(_QWORD *)buf = 0;
              v74 = 0;
              v75 = 0;
              std::vector<BezierCurve>::reserve((void **)buf, objc_msgSend(v29, "count", v48));
              v60 = 0u;
              v61 = 0u;
              v62 = 0u;
              v63 = 0u;
              v30 = v29;
              v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v60, v72, 16);
              if (v31)
              {
                v32 = *(_QWORD *)v61;
                do
                {
                  for (j = 0; j != v31; ++j)
                  {
                    if (*(_QWORD *)v61 != v32)
                      objc_enumerationMutation(v30);
                    v64 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * j);
                    _ZNSt3__16vectorI11BezierCurveNS_9allocatorIS1_EEE12emplace_backIJRU8__strongKP12NSDictionaryRDv4_fEEERS1_DpOT_((float32x4_t **)buf, &v64, &v69);
                  }
                  v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v60, v72, 16);
                }
                while (v31);
              }

              v34 = (_QWORD *)*((_QWORD *)v6 + 14);
              if ((unint64_t)v34 >= *((_QWORD *)v6 + 15))
              {
                v38 = std::vector<std::vector<BezierCurve>>::__emplace_back_slow_path<std::vector<BezierCurve>&>((uint64_t *)v6 + 13, (uint64_t)buf);
              }
              else
              {
                *v34 = 0;
                v34[1] = 0;
                v34[2] = 0;
                v35 = *(const void **)buf;
                v36 = (int64_t)v74 - *(_QWORD *)buf;
                if (v74 != *(const void **)buf)
                {
                  std::vector<BezierCurve>::__vallocate[abi:nn180100](v34, v36 >> 6);
                  v37 = (char *)v34[1];
                  memmove(v37, v35, v36);
                  v34[1] = &v37[64 * (v36 >> 6)];
                }
                v38 = (uint64_t)(v34 + 3);
                *((_QWORD *)v6 + 14) = v34 + 3;
              }
              *((_QWORD *)v6 + 14) = v38;
              if (*(_QWORD *)buf)
              {
                v74 = *(const void **)buf;
                operator delete(*(void **)buf);
              }
            }
            v26 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v65, v76, 16);
          }
          while (v26);
        }

        *((_QWORD *)v6 + 16) = a4;
        v39 = (const CGPath *)objc_msgSend(v6, "pathForFraction:calculateLength:", 1, 0.0);
        *(CGRect *)(v6 + 48) = CGPathGetPathBoundingBox(v39);
        CGPathRelease(v39);
        v40 = *((double *)v6 + 4) / 3000.0;
        *((double *)v6 + 5) = (float)((float)(powf((float)(fminf(fmaxf(v40, 0.0), 10.0) / 10.0) + -1.0, 3.0) + 1.0) * 4.0);

        goto LABEL_29;
      }
      SBLogDashBoard();
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v56, "absoluteString");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "description");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBCursiveTextPath initWithURL:resolution:].cold.2(v45, v46, buf, v44);
      }

    }
    else
    {
      SBLogDashBoard();
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v56, "absoluteString");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBCursiveTextPath initWithURL:resolution:].cold.1(v43, buf, v42);
      }

    }
    v41 = 0;
    goto LABEL_37;
  }
LABEL_29:
  v41 = v6;
LABEL_37:

  return v41;
}

- (CGAffineTransform)transformForRect:(SEL)a3 pointSize:(CGRect)a4 flipped:(double)a5
{
  _BOOL4 v6;
  double descender;
  double v11;
  double v12;
  double v13;
  CGFloat x;
  CGFloat y;
  CGFloat height;
  CGFloat width;
  double MinX;
  CGFloat v19;
  double v20;
  double v21;
  double v22;
  __int128 v23;
  double v24;
  __int128 v25;
  __int128 v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGAffineTransform *result;
  __int128 v32;
  double v33;
  CGAffineTransform v35;
  CGAffineTransform v36;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v39;
  CGRect v40;
  CGRect v41;

  v6 = a6;
  descender = self->_descender;
  v11 = self->_ascender - descender;
  v12 = -descender / v11;
  v13 = v11 / self->_unitsPerM * a5;
  v33 = (CGRectGetHeight(a4) - v13) * 0.5;
  x = self->_boundingBoxOfPath.origin.x;
  y = self->_boundingBoxOfPath.origin.y;
  width = self->_boundingBoxOfPath.size.width;
  height = self->_boundingBoxOfPath.size.height;
  *(_OWORD *)&retstr->a = 0u;
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  v40.origin.x = x;
  v40.origin.y = y;
  v40.size.width = width;
  v40.size.height = height;
  MinX = CGRectGetMinX(v40);
  v41.origin.x = x;
  v41.origin.y = y;
  v41.size.width = width;
  v41.size.height = height;
  v19 = CGRectGetWidth(v41);
  CGAffineTransformMakeTranslation(retstr, -(MinX + v19 * 0.5), 0.0);
  v20 = 1.0 - v12;
  if (!v6)
    v20 = v12;
  v21 = v33 + v20 * v13;
  v22 = a5 / self->_unitsPerM;
  v23 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&t1.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&t1.c = v23;
  *(_OWORD *)&t1.tx = *(_OWORD *)&retstr->tx;
  v24 = -v22;
  if (!v6)
    v24 = v22;
  CGAffineTransformMakeScale(&t2, v22, v24);
  CGAffineTransformConcat(&v39, &t1, &t2);
  v25 = *(_OWORD *)&v39.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&v39.a;
  *(_OWORD *)&retstr->c = v25;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&v39.tx;
  v26 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v36.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v36.c = v26;
  *(_OWORD *)&v36.tx = *(_OWORD *)&retstr->tx;
  v27 = a4.origin.x;
  *(CGFloat *)&v26 = a4.origin.y;
  v28 = a4.size.width;
  v29 = a4.size.height;
  v30 = CGRectGetWidth(*(CGRect *)((char *)&v26 - 8));
  CGAffineTransformMakeTranslation(&v35, v30 * 0.5, v21);
  result = CGAffineTransformConcat(&v39, &v36, &v35);
  v32 = *(_OWORD *)&v39.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&v39.a;
  *(_OWORD *)&retstr->c = v32;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&v39.tx;
  return result;
}

- (double)duration
{
  return self->_duration;
}

- (CGPath)pathForTime:(double)a3
{
  return -[SBCursiveTextPath pathForFraction:calculateLength:](self, "pathForFraction:calculateLength:", 0, a3 / self->_duration);
}

- (CGPath)pathForFraction:(double)a3 calculateLength:(BOOL)a4
{
  _BOOL4 v4;
  double rampTime;
  double duration;
  float32x4_t **begin;
  char v9;
  char v10;
  double v11;
  double v12;
  double v13;
  float v14;
  float v15;
  double v16;
  float32x4_t *v23;
  int8x8_t *v24;
  int64_t resolution;
  uint64_t v26;
  float32x4_t v27;
  float v28;
  float32x4_t v29;
  float32x4_t v30;
  float32x4_t v31;
  float32x4_t v32;
  float32x4_t v33;
  float32x4_t v34;
  float32x2_t v35;
  float32_t v36;
  float32x2_t v37;
  float32x2_t v38;
  float32x2_t v39;
  float32x4_t v40;
  float32x4_t v41;
  double v42;
  double v43;
  double v44;
  float v45;
  double initialWeight;
  double finalWeight;
  float v48;
  int8x8_t v49;
  float v50;
  float v51;
  float v52;
  __int32 v53;
  unint64_t v54;
  unint64_t v55;
  unint64_t v56;
  char *v57;
  uint64_t v58;
  int8x8_t *v59;
  __int32 v60;
  char *v61;
  char *v62;
  int8x8_t *v63;
  __int128 v64;
  int v65;
  CGPath *Mutable;
  uint64_t v67;
  uint64_t i;
  float32x2_t *v69;
  uint64_t v70;
  float32x2_t v71;
  unint64_t v72;
  uint64_t v73;
  unint64_t v74;
  float32x2_t v75;
  float v76;
  float32x2_t v77;
  uint64_t v78;
  int64_t v79;
  unint64_t v80;
  unint64_t v81;
  float32x2_t v82;
  float v83;
  float32x4_t **end;
  float32x4_t *v86;
  float32x4_t **v87;
  double v88;
  float32x4_t v89;
  float32x4_t v90;
  int8x8_t v91;
  float32x4_t v92;
  void *__p;
  int8x8_t *v94;
  char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;

  v4 = a4;
  rampTime = self->_rampTime;
  duration = self->_duration;
  v96 = 0;
  v97 = 0;
  v98 = 0;
  begin = (float32x4_t **)self->_bezierArrays.__begin_;
  end = (float32x4_t **)self->_bezierArrays.__end_;
  if (begin == end)
  {
    v16 = 0.0;
  }
  else
  {
    v9 = 0;
    v10 = 0;
    v11 = rampTime / duration;
    v12 = 1.0;
    v13 = -(v11 - (v11 + 1.0) * a3);
    v14 = v13;
    v15 = v11;
    v88 = v11 + v13;
    v16 = 0.0;
    v92 = 0u;
    __asm
    {
      FMOV            V1.4S, #3.0
      FMOV            V0.4S, #6.0
    }
    v89 = _Q0;
    v90 = _Q1;
    do
    {
      __p = 0;
      v94 = 0;
      v95 = 0;
      v23 = *begin;
      v86 = begin[1];
      v87 = begin;
      if (*begin == v86)
      {
LABEL_32:
        std::vector<std::vector<PathPoint>>::emplace_back<std::vector<PathPoint>>(&v96, (uint64_t)&__p);
        v65 = 0;
      }
      else
      {
        v24 = 0;
        while ((vminvq_u32((uint32x4_t)vceqq_f32(*v23, v23[3])) & 0x80000000) == 0)
        {
          resolution = self->_resolution;
          if ((resolution & 0x8000000000000000) == 0)
            goto LABEL_9;
LABEL_31:
          v23 += 4;
          v10 = 1;
          if (v23 == v86)
            goto LABEL_32;
        }
        resolution = 0;
LABEL_9:
        v26 = 0;
        while (1)
        {
          v27 = v92;
          v28 = v12 / (double)self->_resolution * (double)v26;
          v29 = v23[1];
          v30 = vmulq_f32(v29, v90);
          v31 = v23[2];
          v32 = v23[3];
          v33 = vmulq_n_f32(vmulq_n_f32(vmulq_f32(v31, v90), v28), v28);
          v34 = vaddq_f32(vmulq_n_f32(vmulq_n_f32(vmulq_n_f32(v32, v28), v28), v28), vaddq_f32(vmulq_n_f32(v33, 1.0 - v28), vaddq_f32(vmulq_n_f32(vmulq_n_f32(vmulq_n_f32(v30, v28), 1.0 - v28), 1.0 - v28), vmulq_n_f32(vmulq_n_f32(vmulq_n_f32(*v23, 1.0 - v28), 1.0 - v28), 1.0 - v28))));
          v35 = (float32x2_t)vaddq_f32(vmulq_n_f32(vmulq_n_f32(vmulq_f32(v32, v90), v28), v28), vsubq_f32(vaddq_f32(vmulq_n_f32(vmulq_n_f32(vmulq_f32(v31, v89), 1.0 - v28), v28), vsubq_f32(vsubq_f32(vmulq_n_f32(vmulq_n_f32(v30, 1.0 - v28), 1.0 - v28), vmulq_n_f32(vmulq_n_f32(vmulq_f32(*v23, v90), 1.0 - v28), 1.0 - v28)), vmulq_n_f32(vmulq_n_f32(vmulq_f32(v29, v89), 1.0 - v28), v28))), v33)).u64[0];
          v36 = -v35.f32[0];
          v35.i32[0] = vdup_lane_s32((int32x2_t)v35, 1).u32[0];
          v35.f32[1] = v36;
          v37 = vmul_f32(v35, v35);
          v37.i32[0] = vadd_f32(v37, (float32x2_t)vdup_lane_s32((int32x2_t)v37, 1)).u32[0];
          v38 = vrsqrte_f32((float32x2_t)v37.u32[0]);
          v39 = vmul_f32(v38, vrsqrts_f32((float32x2_t)v37.u32[0], vmul_f32(v38, v38)));
          v91 = (int8x8_t)vmul_n_f32(v35, vmul_f32(v39, vrsqrts_f32((float32x2_t)v37.u32[0], vmul_f32(v39, v39))).f32[0]);
          v92 = v34;
          if ((v9 & 1) != 0)
          {
            v40 = vsubq_f32(v34, v27);
            v41 = vmulq_f32(v40, v40);
            v42 = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v41, 2), vaddq_f32(v41, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v41.f32, 1))).f32[0]);
            v43 = 0.5;
            if ((v10 & 1) == 0)
              v43 = v12;
            v16 = v16 + v42 * v43;
            v10 = 0;
          }
          v44 = v16 / self->_length;
          v45 = v44;
          initialWeight = self->_initialWeight;
          finalWeight = self->_finalWeight;
          v48 = powf((float)(1.0 - fminf(fmaxf((float)(v45 - v14) / v15, 0.0), 1.0)) + -1.0, 3.0);
          if (!v4 && v44 > v88)
            break;
          v49 = vbsl_s8((int8x8_t)vdup_n_s32(0), (int8x8_t)0x3F80000000000000, v91);
          v50 = initialWeight;
          v51 = finalWeight;
          v52 = vmuls_lane_f32(v50 + (float)((float)(v48 + 1.0) * (float)(v51 - v50)), v92, 3);
          if (v24 >= (int8x8_t *)v95)
          {
            v54 = 0xAAAAAAAAAAAAAAABLL * (((char *)v24 - (_BYTE *)__p) >> 3);
            v55 = v54 + 1;
            if (v54 + 1 > 0xAAAAAAAAAAAAAAALL)
              abort();
            if (0x5555555555555556 * ((v95 - (_BYTE *)__p) >> 3) > v55)
              v55 = 0x5555555555555556 * ((v95 - (_BYTE *)__p) >> 3);
            if (0xAAAAAAAAAAAAAAABLL * ((v95 - (_BYTE *)__p) >> 3) >= 0x555555555555555)
              v56 = 0xAAAAAAAAAAAAAAALL;
            else
              v56 = v55;
            v57 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<std::vector<BezierCurve>>>((uint64_t)&v95, v56);
            v59 = (int8x8_t *)&v57[24 * v54];
            *(float *)&v60 = v16;
            *v59 = *(int8x8_t *)v92.f32;
            v59[1] = v49;
            *(float *)v59[2].i32 = v52;
            v59[2].i32[1] = v60;
            v62 = (char *)__p;
            v61 = (char *)v94;
            v63 = v59;
            v12 = 1.0;
            if (v94 != __p)
            {
              do
              {
                v64 = *(_OWORD *)(v61 - 24);
                v63[-1] = *(int8x8_t *)(v61 - 8);
                *(_OWORD *)v63[-3].i8 = v64;
                v63 -= 3;
                v61 -= 24;
              }
              while (v61 != v62);
              v61 = (char *)__p;
            }
            v24 = v59 + 3;
            __p = v63;
            v94 = v59 + 3;
            v95 = &v57[24 * v58];
            if (v61)
              operator delete(v61);
          }
          else
          {
            *(float *)&v53 = v16;
            *v24 = *(int8x8_t *)v92.f32;
            v24[1] = v49;
            *(float *)v24[2].i32 = v52;
            v24[2].i32[1] = v53;
            v24 += 3;
            v12 = 1.0;
          }
          v94 = v24;
          v9 = 1;
          if (v26++ == resolution)
            goto LABEL_31;
        }
        std::vector<std::vector<PathPoint>>::emplace_back<std::vector<PathPoint>>(&v96, (uint64_t)&__p);
        v65 = 9;
        v9 = 1;
      }
      if (__p)
      {
        v94 = (int8x8_t *)__p;
        operator delete(__p);
      }
      if (v65)
        break;
      begin = v87 + 3;
    }
    while (v87 + 3 != end);
  }
  if (v4)
    self->_length = v16;
  Mutable = CGPathCreateMutable();
  v67 = v96;
  for (i = v97; v67 != i; v67 += 24)
  {
    v69 = *(float32x2_t **)v67;
    v70 = *(_QWORD *)(v67 + 8);
    if (*(_QWORD *)v67 != v70)
    {
      v71 = vmla_n_f32(*v69, v69[1], v69[2].f32[0]);
      CGPathMoveToPoint(Mutable, 0, v71.f32[0], v71.f32[1]);
      v72 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(v67 + 8) - *(_QWORD *)v67) >> 3);
      if (v72 - 1 >= 2)
      {
        v73 = 0;
        v74 = v72 - 2;
        do
        {
          v75 = vmla_n_f32(*(float32x2_t *)(*(_QWORD *)v67 + v73 + 24), *(float32x2_t *)(*(_QWORD *)v67 + v73 + 32), *(float *)(*(_QWORD *)v67 + v73 + 40));
          CGPathAddLineToPoint(Mutable, 0, v75.f32[0], v75.f32[1]);
          v73 += 24;
          --v74;
        }
        while (v74);
      }
      v76 = atan2f(COERCE_FLOAT(HIDWORD(*(_QWORD *)(v70 - 16))), COERCE_FLOAT(*(_QWORD *)(v70 - 16)));
      CGPathAddArc(Mutable, 0, COERCE_FLOAT(*(_QWORD *)(v70 - 24)), COERCE_FLOAT(HIDWORD(*(_QWORD *)(v70 - 24))), *(float *)(v70 - 8), v76, v76 + 3.14159265, 0);
      v78 = *(_QWORD *)(v67 + 8) - *(_QWORD *)v67;
      if (v78 >= 49)
      {
        v79 = v78 / 0x18uLL - 1;
        v80 = 24 * (v78 / 0x18uLL);
        do
        {
          v81 = *(_QWORD *)v67 + v80;
          v77.i32[0] = *(_DWORD *)(v81 - 32);
          v82 = vmls_lane_f32(*(float32x2_t *)(v81 - 48), *(float32x2_t *)(v81 - 40), v77, 0);
          CGPathAddLineToPoint(Mutable, 0, v82.f32[0], v82.f32[1]);
          --v79;
          v80 -= 24;
        }
        while (v79 > 1);
      }
      v83 = atan2f(-COERCE_FLOAT(HIDWORD(*(_QWORD *)&v69[1])), -COERCE_FLOAT(*(_QWORD *)&v69[1]));
      CGPathAddArc(Mutable, 0, COERCE_FLOAT(*v69), COERCE_FLOAT(HIDWORD(*(unint64_t *)v69)), v69[2].f32[0], v83, v83 + 3.14159265, 0);
    }
  }
  __p = &v96;
  std::vector<std::vector<PathPoint>>::__destroy_vector::operator()[abi:nn180100]((void ***)&__p);
  return Mutable;
}

- (void).cxx_destruct
{
  vector<std::vector<BezierCurve>, std::allocator<std::vector<BezierCurve>>> *p_bezierArrays;

  p_bezierArrays = &self->_bezierArrays;
  std::vector<std::vector<PathPoint>>::__destroy_vector::operator()[abi:nn180100]((void ***)&p_bezierArrays);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 13) = 0;
  *((_QWORD *)self + 14) = 0;
  *((_QWORD *)self + 15) = 0;
  return self;
}

- (void)initWithURL:(os_log_t)log resolution:.cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1D0540000, log, OS_LOG_TYPE_ERROR, "[SBCursiveTextPath] No data for url %@", buf, 0xCu);

}

- (void)initWithURL:(uint8_t *)buf resolution:(os_log_t)log .cold.2(void *a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(_QWORD *)(buf + 14) = a2;
  _os_log_error_impl(&dword_1D0540000, log, OS_LOG_TYPE_ERROR, "[SBCursiveTextPath] Indecipherable plist for url: %@, error: %@", buf, 0x16u);

}

@end
