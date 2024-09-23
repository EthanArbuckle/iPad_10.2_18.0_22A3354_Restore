@implementation VKTransitPolylinePath

- (VKTransitPolylinePath)initWithOverlay:(id)a3 section:(id)a4 points:(void *)a5 pointCount:(unint64_t)a6 reversePoints:(BOOL)a7 transform:(void *)a8 routeStartIndex:(unsigned int)a9 routeEndIndex:(unsigned int)a10 lineID:(unint64_t)a11 tileZ:(unsigned int)a12 vertexPrecision:(unsigned __int8)a13
{
  id v19;
  id v20;
  NSArray *matchedPathSegments;
  char *v22;
  char *v23;
  uint64_t v24;
  unint64_t *v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  int v31;
  unint64_t v32;
  unint64_t v33;
  int v34;
  unsigned int v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  int v40;
  unint64_t v41;
  unint64_t v42;
  int v43;
  unsigned int v44;
  uint64_t v45;
  unint64_t v46;
  unint64_t v47;
  unint64_t v48;
  BOOL v49;
  unint64_t v50;
  unint64_t v51;
  BOOL v52;
  BOOL v53;
  float *v55;
  __int128 v56;
  const float *v57;
  unint64_t v58;
  const float *v59;
  float32x4_t v60;
  const float *v61;
  float32x4_t v62;
  int8x16_t v63;
  int8x16_t v64;
  int8x16_t v65;
  int8x16_t v66;
  unsigned int v67;
  float32x2_t *v68;
  BOOL v69;
  unint64_t v70;
  unint64_t v71;
  BOOL v72;
  BOOL v73;
  __int128 v75;
  const float *v76;
  float *v77;
  unint64_t v78;
  const float *v79;
  float32x4_t v80;
  const float *v81;
  float32x4_t v82;
  float32x4_t v83;
  float32x4_t v84;
  unsigned int v85;
  float32x2_t *v86;
  uint64_t v87;
  unint64_t v88;
  unint64_t v89;
  int v90;
  unsigned int v91;
  unint64_t v92;
  unsigned int v93;
  double v94;
  char *v95;
  unint64_t v97;
  int32x4_t v98;
  uint64_t v99;
  int64x2_t v100;
  __int128 v101;
  int8x16_t v102;
  int32x4_t v103;
  int32x4_t v104;
  float *v105;
  int8x16_t v106;
  int8x16_t v107;
  float *v108;
  int8x16_t v109;
  int32x4_t v110;
  int32x4_t v111;
  int32x4_t v112;
  float *v113;
  __int128 v114;
  int32x4_t v115;
  unint64_t v116;
  int32x4_t v117;
  float *v118;
  unint64_t v119;
  unint64_t v120;
  BOOL v121;
  unint64_t v122;
  float *v123;
  __int128 v124;
  const float *v125;
  unint64_t v126;
  int8x16_t v127;
  int8x16_t v128;
  int8x16_t v129;
  BOOL v130;
  unint64_t v131;
  const float *v132;
  __int128 v133;
  float *v134;
  unint64_t v135;
  const float *v136;
  float *v137;
  float *v138;
  objc_super v139;
  float32x4x2_t v140;
  float32x4x2_t v141;
  float32x4x2_t v142;
  float32x4x2_t v143;
  float32x4x2_t v144;
  float32x4x2_t v145;
  float32x4x3_t v146;

  v19 = a3;
  v20 = a4;
  matchedPathSegments = self->super._matchedPathSegments;
  v139.receiver = self;
  v139.super_class = (Class)VKTransitPolylinePath;
  v22 = -[VKPolylinePath initWithOverlay:section:matchedPathSegments:](&v139, sel_initWithOverlay_section_matchedPathSegments_, v19, v20, matchedPathSegments);
  v23 = v22;
  if (!v22)
    goto LABEL_94;
  v25 = (unint64_t *)(v22 + 32);
  v24 = *((_QWORD *)v22 + 4);
  *(_QWORD *)(v22 + 84) = a9;
  *((_DWORD *)v22 + 23) = a10;
  *((_DWORD *)v22 + 24) = 0;
  v26 = 0xAAAAAAAAAAAAAAABLL * ((*((_QWORD *)v22 + 5) - v24) >> 2);
  if (a6 <= v26)
  {
    if (a6 < v26)
      *((_QWORD *)v22 + 5) = v24 + 12 * a6;
  }
  else
  {
    std::vector<gm::Matrix<float,3,1>>::__append((char **)v22 + 4, a6 - v26);
  }
  v27 = *((_QWORD *)v23 + 7);
  v28 = (*((_QWORD *)v23 + 8) - v27) >> 3;
  if (a6 <= v28)
  {
    if (a6 < v28)
      *((_QWORD *)v23 + 8) = v27 + 8 * a6;
  }
  else
  {
    std::vector<geo::PolylineCoordinate>::__append((char **)v23 + 7, a6 - v28);
  }
  if (!a8)
  {
    if (a7)
    {
      if (!a6)
        goto LABEL_90;
      v32 = *v25;
      if (a6 >= 0x1C)
      {
        v34 = 0;
        v33 = 0;
        v119 = 12 * a6;
        v120 = 12 * a6 + v32;
        v121 = !is_mul_ok(a6 - 1, 0xCuLL);
        v122 = 12 * a6 - 12;
        if (v32 > v120 - 12
          || v120 - 4 - v122 > v120 - 4
          || (_DWORD)a6 == 0x100000000
          || (a6 - 1) >> 32
          || v120 - 8 - v122 > v120 - 8
          || v121)
        {
          goto LABEL_19;
        }
        if (v32 >= (unint64_t)a5 + 8 * a6 || v32 + v119 <= (unint64_t)a5)
        {
          v33 = a6 & 0xFFFFFFFFFFFFFFFCLL;
          v123 = (float *)(v119 + v32 - 48);
          v124 = 0uLL;
          v125 = (const float *)a5;
          v126 = a6 & 0xFFFFFFFFFFFFFFFCLL;
          do
          {
            v141 = vld2q_f32(v125);
            v125 += 8;
            v127 = (int8x16_t)vrev64q_s32((int32x4_t)v141.val[0]);
            v128 = vextq_s8(v127, v127, 8uLL);
            v141.val[0] = (float32x4_t)vrev64q_s32((int32x4_t)v141.val[1]);
            v129 = vextq_s8((int8x16_t)v141.val[0], (int8x16_t)v141.val[0], 8uLL);
            vst3q_f32(v123, *(float32x4x3_t *)(&v124 - 2));
            v123 -= 12;
            v126 -= 4;
          }
          while (v126);
          v34 = a6 & 0xFFFFFFFC;
          if (v33 == a6)
            goto LABEL_78;
          goto LABEL_19;
        }
      }
      v33 = 0;
      v34 = 0;
LABEL_19:
      v35 = v34 + 1;
      do
      {
        v36 = *((_QWORD *)a5 + v33);
        v37 = v32 + 12 * (~v33 + a6);
        *(_QWORD *)v37 = v36;
        *(_DWORD *)(v37 + 8) = 0;
        v33 = v35++;
      }
      while (v33 < a6);
      goto LABEL_78;
    }
    if (!a6)
      goto LABEL_90;
    v41 = *v25;
    if (a6 > 0x1B)
    {
      v43 = 0;
      v42 = 0;
      v130 = !is_mul_ok(a6 - 1, 0xCuLL);
      v131 = 12 * (a6 - 1);
      if (v41 + v131 < v41
        || v41 + 8 + v131 < v41 + 8
        || (_DWORD)a6 == 0x100000000
        || (a6 - 1) >> 32
        || v41 + 4 + v131 < v41 + 4
        || v130)
      {
        goto LABEL_28;
      }
      if (v41 >= (unint64_t)a5 + 8 * a6 || v41 + 12 * a6 <= (unint64_t)a5)
      {
        v42 = a6 & 0xFFFFFFFFFFFFFFF8;
        v132 = (const float *)((char *)a5 + 32);
        v133 = 0uLL;
        v134 = (float *)*v25;
        v135 = a6 & 0xFFFFFFFFFFFFFFF8;
        do
        {
          v136 = v132 - 8;
          v140 = vld2q_f32(v136);
          *(float32x4x2_t *)v146.val[0].f32 = vld2q_f32(v132);
          v146.val[2] = 0uLL;
          v137 = v134 + 24;
          vst3q_f32(v134, *(float32x4x3_t *)(&v133 - 2));
          v138 = v134 + 12;
          vst3q_f32(v138, v146);
          v132 += 16;
          v134 = v137;
          v135 -= 8;
        }
        while (v135);
        v43 = a6 & 0xFFFFFFF8;
        if (v42 == a6)
          goto LABEL_78;
        goto LABEL_28;
      }
    }
    v42 = 0;
    v43 = 0;
LABEL_28:
    v44 = v43 + 1;
    do
    {
      v45 = *((_QWORD *)a5 + v42);
      v46 = v41 + 12 * v42;
      *(_QWORD *)v46 = v45;
      *(_DWORD *)(v46 + 8) = 0;
      v42 = v44++;
    }
    while (v42 < a6);
    goto LABEL_78;
  }
  if (!a7)
  {
    if (!a6)
      goto LABEL_90;
    v38 = *v25;
    if (a6 > 0xF)
    {
      v40 = 0;
      v39 = 0;
      v69 = !is_mul_ok(a6 - 1, 0xCuLL);
      v70 = 12 * (a6 - 1);
      if (v38 + v70 >= v38
        && v38 + 8 + v70 >= v38 + 8
        && (_DWORD)a6 != 0x100000000
        && !((a6 - 1) >> 32)
        && v38 + 4 + v70 >= v38 + 4
        && !v69)
      {
        v40 = 0;
        v39 = 0;
        v71 = v38 + 12 * a6;
        v72 = v38 < (unint64_t)a5 + 8 * a6 && v71 > (unint64_t)a5;
        v73 = v72;
        if ((v71 <= (unint64_t)a8 || v38 >= (unint64_t)a8 + 16) && !v73)
        {
          v39 = a6 & 0xFFFFFFFFFFFFFFFCLL;
          v75 = 0uLL;
          v76 = (const float *)a5;
          v77 = (float *)*v25;
          v78 = a6 & 0xFFFFFFFFFFFFFFFCLL;
          do
          {
            v79 = (const float *)((char *)a8 + 8);
            v80 = vld1q_dup_f32(v79);
            v81 = (const float *)((char *)a8 + 12);
            v82 = vld1q_dup_f32(v81);
            v142 = vld2q_f32(v76);
            v76 += 8;
            v83 = vmlaq_n_f32(v80, v142.val[0], *(float *)a8);
            v84 = vmlaq_n_f32(v82, v142.val[1], *((float *)a8 + 1));
            vst3q_f32(v77, *(float32x4x3_t *)(&v75 - 2));
            v77 += 12;
            v78 -= 4;
          }
          while (v78);
          v40 = a6 & 0xFFFFFFFC;
          if (v39 == a6)
            goto LABEL_78;
        }
      }
    }
    else
    {
      v39 = 0;
      v40 = 0;
    }
    v85 = v40 + 1;
    do
    {
      v86 = (float32x2_t *)(v38 + 12 * v39);
      *v86 = vmla_f32(*(float32x2_t *)((char *)a8 + 8), *(float32x2_t *)a8, *(float32x2_t *)((char *)a5 + 8 * v39));
      v86[1].i32[0] = 0;
      v39 = v85++;
    }
    while (v39 < a6);
    goto LABEL_78;
  }
  if (!a6)
    goto LABEL_90;
  v29 = *v25;
  if (a6 < 0x10)
  {
    v30 = 0;
    v31 = 0;
LABEL_52:
    v67 = v31 + 1;
    do
    {
      v68 = (float32x2_t *)(v29 + 12 * (~v30 + a6));
      *v68 = vmla_f32(*(float32x2_t *)((char *)a8 + 8), *(float32x2_t *)a8, *(float32x2_t *)((char *)a5 + 8 * v30));
      v68[1].i32[0] = 0;
      v30 = v67++;
    }
    while (v30 < a6);
    goto LABEL_78;
  }
  v31 = 0;
  v30 = 0;
  v47 = 12 * a6;
  v48 = 12 * a6 + v29;
  v49 = !is_mul_ok(a6 - 1, 0xCuLL);
  v50 = 12 * a6 - 12;
  if (v29 > v48 - 12
    || v48 - 4 - v50 > v48 - 4
    || (_DWORD)a6 == 0x100000000
    || (a6 - 1) >> 32
    || v48 - 8 - v50 > v48 - 8
    || v49)
  {
    goto LABEL_52;
  }
  v31 = 0;
  v30 = 0;
  v51 = v29 + v47;
  v52 = v29 < (unint64_t)a5 + 8 * a6 && v51 > (unint64_t)a5;
  v53 = v52;
  if (v51 > (unint64_t)a8 && v29 < (unint64_t)a8 + 16)
    goto LABEL_52;
  if (v53)
    goto LABEL_52;
  v30 = a6 & 0xFFFFFFFFFFFFFFFCLL;
  v55 = (float *)(v47 + v29 - 48);
  v56 = 0uLL;
  v57 = (const float *)a5;
  v58 = a6 & 0xFFFFFFFFFFFFFFFCLL;
  do
  {
    v59 = (const float *)((char *)a8 + 8);
    v60 = vld1q_dup_f32(v59);
    v61 = (const float *)((char *)a8 + 12);
    v62 = vld1q_dup_f32(v61);
    v144 = vld2q_f32(v57);
    v57 += 8;
    v63 = (int8x16_t)vrev64q_s32((int32x4_t)vmlaq_n_f32(v60, v144.val[0], *(float *)a8));
    v64 = vextq_s8(v63, v63, 8uLL);
    v65 = (int8x16_t)vrev64q_s32((int32x4_t)vmlaq_n_f32(v62, v144.val[1], *((float *)a8 + 1)));
    v66 = vextq_s8(v65, v65, 8uLL);
    vst3q_f32(v55, *(float32x4x3_t *)(&v56 - 2));
    v55 -= 12;
    v58 -= 4;
  }
  while (v58);
  v31 = a6 & 0xFFFFFFFC;
  if (v30 != a6)
    goto LABEL_52;
LABEL_78:
  v87 = *((_QWORD *)v23 + 7);
  if (a6 <= 1)
    v88 = 1;
  else
    v88 = a6;
  if (!a7)
  {
    if (v88 > 0xB)
    {
      v93 = 0;
      v92 = 0;
      if ((_DWORD)v88)
      {
        if (!((v88 - 1) >> 32))
        {
          v92 = v88 & 0xFFFFFFFFFFFFFFF8;
          v110 = vdupq_n_s32(a9);
          v111 = vdupq_n_s32(a9 + 4);
          v112 = (int32x4_t)xmmword_19FFB2E90;
          v113 = (float *)(v87 + 32);
          v114 = 0uLL;
          v115.i64[0] = 0x800000008;
          v115.i64[1] = 0x800000008;
          v116 = v88 & 0xFFFFFFFFFFFFFFF8;
          do
          {
            v117 = vaddq_s32(v112, v110);
            v118 = v113 - 8;
            vst2q_f32(v118, *(float32x4x2_t *)(&v114 - 1));
            v143.val[0] = (float32x4_t)vaddq_s32(v111, v112);
            v143.val[1] = 0uLL;
            vst2q_f32(v113, v143);
            v112 = vaddq_s32(v112, v115);
            v113 += 16;
            v116 -= 8;
          }
          while (v116);
          v93 = v88 & 0xFFFFFFF8;
          if (v88 == v92)
            goto LABEL_90;
        }
      }
    }
    else
    {
      v92 = 0;
      v93 = 0;
    }
    do
    {
      *(_QWORD *)(v87 + 8 * v92) = a9 + v93++;
      v92 = v93;
    }
    while (v93 < a6);
    goto LABEL_90;
  }
  if (v88 < 8)
  {
    v89 = 0;
    v90 = 0;
LABEL_84:
    v91 = v90 + 1;
    do
    {
      *(_QWORD *)(v87 + 8 * (~v89 + a6)) = ~(_DWORD)v89 + (_DWORD)a6 + a9;
      v89 = v91++;
    }
    while (v89 < a6);
    goto LABEL_90;
  }
  v90 = 0;
  v89 = 0;
  if (!(_DWORD)v88)
    goto LABEL_84;
  if ((v88 - 1) >> 32)
    goto LABEL_84;
  v97 = 0;
  v89 = v88 & 0xFFFFFFFFFFFFFFF8;
  v98 = vdupq_n_s32(a9);
  v99 = v87 - 28;
  v100 = vdupq_n_s64(a6);
  v101 = 0uLL;
  do
  {
    v102 = (int8x16_t)vdupq_n_s64(v97);
    v103 = (int32x4_t)vaddq_s64((int64x2_t)veorq_s8(v102, (int8x16_t)xmmword_19FFB4B50), v100);
    v104 = (int32x4_t)vaddq_s64((int64x2_t)veorq_s8(v102, (int8x16_t)xmmword_19FFB4B70), v100);
    v105 = (float *)(v99 + 8 * v103.i64[0] + 4);
    v106 = (int8x16_t)vrev64q_s32(vaddq_s32(v98, vuzp1q_s32(v103, (int32x4_t)vaddq_s64((int64x2_t)veorq_s8(v102, (int8x16_t)xmmword_19FFB4B60), v100))));
    v107 = vextq_s8(v106, v106, 8uLL);
    vst2q_f32(v105, *(float32x4x2_t *)(&v101 - 1));
    v108 = (float *)(v99 + 8 * v104.i64[0] + 4);
    v109 = (int8x16_t)vrev64q_s32(vaddq_s32(v98, vuzp1q_s32(v104, (int32x4_t)vaddq_s64((int64x2_t)veorq_s8(v102, (int8x16_t)xmmword_19FFB4B80), v100))));
    v145.val[0] = (float32x4_t)vextq_s8(v109, v109, 8uLL);
    v145.val[1] = 0uLL;
    vst2q_f32(v108, v145);
    v97 += 8;
  }
  while (v89 != v97);
  v90 = v88 & 0xFFFFFFF8;
  if (v88 != v89)
    goto LABEL_84;
LABEL_90:
  *((_QWORD *)v23 + 17) = a11;
  if (a13)
    v94 = 1.0 / (double)(1 << a13 << a12);
  else
    v94 = 0.0;
  *((double *)v23 + 18) = fmax(v94, 0.0000001);
  v95 = v23;
LABEL_94:

  return (VKTransitPolylinePath *)v23;
}

- (VKTransitPolylinePath)initWithOverlay:(id)a3 section:(id)a4 points:(void *)a5 pointCount:(unint64_t)a6 reversePoints:(BOOL)a7 transform:(void *)a8 routeStartIndex:(unsigned int)a9 routeEndIndex:(unsigned int)a10 lineID:(unint64_t)a11
{
  uint64_t v12;

  BYTE4(v12) = 0;
  LODWORD(v12) = 0;
  return -[VKTransitPolylinePath initWithOverlay:section:points:pointCount:reversePoints:transform:routeStartIndex:routeEndIndex:lineID:tileZ:vertexPrecision:](self, "initWithOverlay:section:points:pointCount:reversePoints:transform:routeStartIndex:routeEndIndex:lineID:tileZ:vertexPrecision:", a3, a4, a5, a6, a7, a8, __PAIR64__(a10, a9), a11, v12);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<VKTransitPolylinePath %p>: %f - %f; line %llu"),
               self,
               (float)(self->super._routeStart.offset + (float)self->super._routeStart.index),
               (float)(self->super._routeEnd.offset + (float)self->super._routeEnd.index),
               self->_lineID);
}

- (double)vertexEqualityTolerance
{
  return self->_vertexEqualityTolerance;
}

@end
