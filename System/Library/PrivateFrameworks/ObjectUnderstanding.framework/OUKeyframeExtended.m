@implementation OUKeyframeExtended

- (int64_t)count
{
  return (uint64_t)(*(_QWORD *)&self->_anon_8[8] - *(_QWORD *)self->_anon_8) >> 4;
}

- (uint64_t)points
{
  return *(_QWORD *)(a1 + 8);
}

- (uint64_t)pointsToWorld
{
  return *(_QWORD *)(a1 + 32);
}

- (uint64_t)semanticLabels
{
  return *(_QWORD *)(a1 + 56);
}

- (uint64_t)semanticVotes
{
  return *(_QWORD *)(a1 + 80);
}

- (uint64_t)colors
{
  return *(_QWORD *)(a1 + 104);
}

- (id)copyWithZone:(_NSZone *)a3
{
  OUKeyframeExtended *v4;

  v4 = objc_alloc_init(OUKeyframeExtended);
  -[OUKeyframeExtended setIdentifier:](v4, "setIdentifier:", self->identifier);
  -[OUKeyframeExtended setCameraPose:](v4, "setCameraPose:", *(double *)&self[1].super.isa, *(double *)&self[1]._anon_8[8], *(double *)self[1]._anon_20, *(double *)&self[1]._anon_20[16]);
  -[OUKeyframeExtended setGroupId:](v4, "setGroupId:", self->groupId);
  if (v4 != self)
  {
    _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE18__assign_with_sizeB8ne180100IPS1_S6_EEvT_T0_l((char *)v4->_anon_8, *(char **)self->_anon_8, *(_QWORD *)&self->_anon_8[8], (uint64_t)(*(_QWORD *)&self->_anon_8[8] - *(_QWORD *)self->_anon_8) >> 4);
    _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE18__assign_with_sizeB8ne180100IPS1_S6_EEvT_T0_l((char *)v4->_anon_20, *(char **)self->_anon_20, *(_QWORD *)&self->_anon_20[8], (uint64_t)(*(_QWORD *)&self->_anon_20[8] - *(_QWORD *)self->_anon_20) >> 4);
    std::vector<float>::__assign_with_size[abi:ne180100]<float *,float *>((char *)v4->_anon_38, *(char **)self->_anon_38, *(_QWORD *)&self->_anon_38[8], (uint64_t)(*(_QWORD *)&self->_anon_38[8] - *(_QWORD *)self->_anon_38) >> 2);
    _ZNSt3__16vectorIDv4_tNS_9allocatorIS1_EEE18__assign_with_sizeB8ne180100IPS1_S6_EEvT_T0_l((char *)v4->_anon_50, *(char **)self->_anon_50, *(_QWORD *)&self->_anon_50[8], (uint64_t)(*(_QWORD *)&self->_anon_50[8] - *(_QWORD *)self->_anon_50) >> 3);
    _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE18__assign_with_sizeB8ne180100IPS1_S6_EEvT_T0_l((char *)v4->_anon_68, *(char **)self->_anon_68, *(_QWORD *)&self->_anon_68[8], (uint64_t)(*(_QWORD *)&self->_anon_68[8] - *(_QWORD *)self->_anon_68) >> 4);
  }
  return v4;
}

- (OUKeyframeExtended)initWithDictionary:(id)a3
{
  return -[OUKeyframeExtended initWithDictionary:withGroupId:](self, "initWithDictionary:withGroupId:", a3, 0);
}

- (OUKeyframeExtended)initWithDictionary:(id)a3 withGroupId:(unsigned int)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  __int128 *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  float32x4_t *v43;
  float32x4_t *v44;
  float32x4_t *v45;
  float32x4_t v46;
  void *v47;
  id v48;
  id v49;
  id v50;
  char *v51;
  unint64_t v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  void *v56;
  id v57;
  id v58;
  id v59;
  char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  unint64_t v64;
  void *v65;
  id v66;
  id v67;
  id v68;
  char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  unint64_t v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  void *v79;
  void *v80;
  uint64_t v81;
  OUKeyframeExtended *v82;
  unsigned int v84;
  id v85;
  void *v86;
  void *__p;
  _BYTE *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  objc_super v93;

  v6 = a3;
  v93.receiver = self;
  v93.super_class = (Class)OUKeyframeExtended;
  v7 = -[OUKeyframeExtended init](&v93, sel_init);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("identifier"));
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v86);
  v9 = (void *)*((_QWORD *)v7 + 17);
  *((_QWORD *)v7 + 17) = v8;

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("cameraPose"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;

  v85 = objc_retainAutorelease(v11);
  v12 = (__int128 *)objc_msgSend(v85, "bytes");
  v13 = *v12;
  v14 = v12[1];
  v15 = v12[3];
  *((_OWORD *)v7 + 12) = v12[2];
  *((_OWORD *)v7 + 13) = v15;
  *((_OWORD *)v7 + 10) = v13;
  *((_OWORD *)v7 + 11) = v14;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("count"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "integerValue");

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("points"));
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v84 = a4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v19 = v18;
  else
    v19 = 0;

  v20 = objc_retainAutorelease(v19);
  v21 = (char *)objc_msgSend(v20, "bytes");
  v22 = objc_msgSend(v20, "length");
  __p = 0;
  v88 = 0;
  v89 = 0;
  std::vector<float>::__assign_with_size[abi:ne180100]<float *,float *>((char *)&__p, v21, (uint64_t)&v21[v22 & 0xFFFFFFFFFFFFFFFCLL], v22 >> 2);

  _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEEC2Em(&v90, ((v88 - (_BYTE *)__p) >> 2) / 3uLL);
  v23 = v90;
  v24 = v91;
  if (v91 == v90)
  {
    v23 = v91;
  }
  else
  {
    v25 = 0;
    v26 = 0;
    v27 = 0;
    do
    {
      v28 = v23 + v25;
      v29 = *(_QWORD *)((char *)__p + v26);
      *(_DWORD *)(v28 + 8) = *(_DWORD *)((char *)__p + v26 + 8);
      *(_QWORD *)v28 = v29;
      ++v27;
      v23 = v90;
      v24 = v91;
      v26 += 12;
      v25 += 16;
    }
    while (v27 < (v91 - v90) >> 4);
  }
  v30 = (void *)*((_QWORD *)v7 + 1);
  if (v30)
  {
    *((_QWORD *)v7 + 2) = v30;
    operator delete(v30);
    *((_QWORD *)v7 + 1) = 0;
    *((_QWORD *)v7 + 2) = 0;
    *((_QWORD *)v7 + 3) = 0;
    v23 = v90;
    v24 = v91;
  }
  *((_QWORD *)v7 + 1) = v23;
  *((_QWORD *)v7 + 2) = v24;
  *((_QWORD *)v7 + 3) = v92;
  v90 = 0;
  v91 = 0;
  v92 = 0;
  if (__p)
  {
    v88 = __p;
    operator delete(__p);
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("pointsToWorld"));
  v31 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v32 = v31;
  else
    v32 = 0;

  if (v32)
  {
    v33 = objc_retainAutorelease(v32);
    v34 = (char *)objc_msgSend(v33, "bytes");
    v35 = objc_msgSend(v33, "length");
    __p = 0;
    v88 = 0;
    v89 = 0;
    std::vector<float>::__assign_with_size[abi:ne180100]<float *,float *>((char *)&__p, v34, (uint64_t)&v34[v35 & 0xFFFFFFFFFFFFFFFCLL], v35 >> 2);

    _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEEC2Em(&v90, ((v88 - (_BYTE *)__p) >> 2) / 3uLL);
    v36 = v90;
    v37 = v91;
    if (v91 == v90)
    {
      v36 = v91;
    }
    else
    {
      v38 = 0;
      v39 = 0;
      v40 = 0;
      do
      {
        v41 = v36 + v38;
        v42 = *(_QWORD *)((char *)__p + v39);
        *(_DWORD *)(v41 + 8) = *(_DWORD *)((char *)__p + v39 + 8);
        *(_QWORD *)v41 = v42;
        ++v40;
        v36 = v90;
        v37 = v91;
        v39 += 12;
        v38 += 16;
      }
      while (v40 < (v91 - v90) >> 4);
    }
    v47 = (void *)*((_QWORD *)v7 + 4);
    if (v47)
    {
      *((_QWORD *)v7 + 5) = v47;
      operator delete(v47);
      *((_QWORD *)v7 + 4) = 0;
      *((_QWORD *)v7 + 5) = 0;
      *((_QWORD *)v7 + 6) = 0;
      v36 = v90;
      v37 = v91;
    }
    *((_QWORD *)v7 + 4) = v36;
    *((_QWORD *)v7 + 5) = v37;
    *((_QWORD *)v7 + 6) = v92;
    v91 = 0;
    v92 = 0;
    v90 = 0;
    if (__p)
    {
      v88 = __p;
      operator delete(__p);
    }
  }
  else
  {
    _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE6resizeEm((uint64_t)v7 + 32, (uint64_t)(*((_QWORD *)v7 + 2) - *((_QWORD *)v7 + 1)) >> 4);
    v43 = (float32x4_t *)*((_QWORD *)v7 + 1);
    v44 = (float32x4_t *)*((_QWORD *)v7 + 2);
    if (v43 != v44)
    {
      v45 = (float32x4_t *)*((_QWORD *)v7 + 4);
      do
      {
        v46 = *v43++;
        *v45++ = vaddq_f32(*((float32x4_t *)v7 + 13), vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(*((float32x4_t *)v7 + 10), v46.f32[0]), *((float32x4_t *)v7 + 11), *(float32x2_t *)v46.f32, 1), *((float32x4_t *)v7 + 12), v46, 2));
      }
      while (v43 != v44);
    }
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("semanticLabels"));
  v48 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v49 = v48;
  else
    v49 = 0;

  v50 = objc_retainAutorelease(v49);
  v51 = (char *)objc_msgSend(v50, "bytes");
  v52 = objc_msgSend(v50, "length");
  __p = 0;
  v88 = 0;
  v89 = 0;
  std::vector<unsigned char>::__assign_with_size[abi:ne180100]<unsigned char const*,unsigned char const*>(&__p, v51, &v51[v52], v52);

  _ZNSt3__16vectorIDv4_hNS_9allocatorIS1_EEEC2Em(&v90, (unint64_t)(v88 - (_BYTE *)__p) >> 2);
  v53 = v90;
  v54 = v91;
  if (v91 == v90)
  {
    v53 = v91;
  }
  else
  {
    v55 = 0;
    do
    {
      *(_DWORD *)(v53 + 4 * v55) = *((_DWORD *)__p + v55);
      ++v55;
      v53 = v90;
      v54 = v91;
    }
    while (v55 < (v91 - v90) >> 2);
  }
  v56 = (void *)*((_QWORD *)v7 + 7);
  if (v56)
  {
    *((_QWORD *)v7 + 8) = v56;
    operator delete(v56);
    *((_QWORD *)v7 + 7) = 0;
    *((_QWORD *)v7 + 8) = 0;
    *((_QWORD *)v7 + 9) = 0;
    v53 = v90;
    v54 = v91;
  }
  *((_QWORD *)v7 + 7) = v53;
  *((_QWORD *)v7 + 8) = v54;
  *((_QWORD *)v7 + 9) = v92;
  v91 = 0;
  v92 = 0;
  v90 = 0;
  if (__p)
  {
    v88 = __p;
    operator delete(__p);
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("semanticVotes"));
  v57 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v58 = v57;
  else
    v58 = 0;

  v59 = objc_retainAutorelease(v58);
  v60 = (char *)objc_msgSend(v59, "bytes");
  v61 = objc_msgSend(v59, "length");
  __p = 0;
  v88 = 0;
  v89 = 0;
  std::vector<unsigned short>::__assign_with_size[abi:ne180100]<unsigned short const*,unsigned short const*>((char *)&__p, v60, (uint64_t)&v60[v61 & 0xFFFFFFFFFFFFFFFELL], v61 >> 1);

  _ZNSt3__16vectorIDv4_tNS_9allocatorIS1_EEEC2Em(&v90, (unint64_t)((v88 - (_BYTE *)__p) >> 1) >> 2);
  v62 = v90;
  v63 = v91;
  if (v91 == v90)
  {
    v62 = v91;
  }
  else
  {
    v64 = 0;
    do
    {
      *(_QWORD *)(v62 + 8 * v64) = *((_QWORD *)__p + v64);
      ++v64;
      v62 = v90;
      v63 = v91;
    }
    while (v64 < (v91 - v90) >> 3);
  }
  v65 = (void *)*((_QWORD *)v7 + 10);
  if (v65)
  {
    *((_QWORD *)v7 + 11) = v65;
    operator delete(v65);
    *((_QWORD *)v7 + 10) = 0;
    *((_QWORD *)v7 + 11) = 0;
    *((_QWORD *)v7 + 12) = 0;
    v62 = v90;
    v63 = v91;
  }
  *((_QWORD *)v7 + 10) = v62;
  *((_QWORD *)v7 + 11) = v63;
  *((_QWORD *)v7 + 12) = v92;
  v91 = 0;
  v92 = 0;
  v90 = 0;
  if (__p)
  {
    v88 = __p;
    operator delete(__p);
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("colors"));
  v66 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v67 = v66;
  else
    v67 = 0;

  v68 = objc_retainAutorelease(v67);
  v69 = (char *)objc_msgSend(v68, "bytes");
  v70 = objc_msgSend(v68, "length");
  __p = 0;
  v88 = 0;
  v89 = 0;
  std::vector<float>::__assign_with_size[abi:ne180100]<float *,float *>((char *)&__p, v69, (uint64_t)&v69[v70 & 0xFFFFFFFFFFFFFFFCLL], v70 >> 2);

  _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEEC2Em(&v90, ((v88 - (_BYTE *)__p) >> 2) / 3uLL);
  v71 = v90;
  v72 = v91;
  if (v91 == v90)
  {
    v71 = v91;
  }
  else
  {
    v73 = 0;
    v74 = 0;
    v75 = 0;
    do
    {
      v76 = v71 + v73;
      v77 = *(_QWORD *)((char *)__p + v74);
      *(_DWORD *)(v76 + 8) = *(_DWORD *)((char *)__p + v74 + 8);
      *(_QWORD *)v76 = v77;
      ++v75;
      v71 = v90;
      v72 = v91;
      v74 += 12;
      v73 += 16;
    }
    while (v75 < (v91 - v90) >> 4);
  }
  v78 = (void *)*((_QWORD *)v7 + 13);
  if (v78)
  {
    *((_QWORD *)v7 + 14) = v78;
    operator delete(v78);
    *((_QWORD *)v7 + 13) = 0;
    *((_QWORD *)v7 + 14) = 0;
    *((_QWORD *)v7 + 15) = 0;
    v71 = v90;
    v72 = v91;
  }
  *((_QWORD *)v7 + 13) = v71;
  *((_QWORD *)v7 + 14) = v72;
  *((_QWORD *)v7 + 15) = v92;
  v91 = 0;
  v92 = 0;
  v90 = 0;
  if (__p)
  {
    v88 = __p;
    operator delete(__p);
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("timestamp"));
  v79 = (void *)objc_claimAutoreleasedReturnValue();

  if (v79)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("timestamp"));
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "doubleValue");
    *((_QWORD *)v7 + 18) = v81;

  }
  *((_DWORD *)v7 + 32) = v84;
  if (v17 == (uint64_t)(*((_QWORD *)v7 + 2) - *((_QWORD *)v7 + 1)) >> 4
    && v17 == (uint64_t)(*((_QWORD *)v7 + 5) - *((_QWORD *)v7 + 4)) >> 4
    && v17 == (uint64_t)(*((_QWORD *)v7 + 11) - *((_QWORD *)v7 + 10)) >> 3
    && v17 == (uint64_t)(*((_QWORD *)v7 + 8) - *((_QWORD *)v7 + 7)) >> 2
    && v17 == (uint64_t)(*((_QWORD *)v7 + 14) - *((_QWORD *)v7 + 13)) >> 4)
  {
    v82 = (OUKeyframeExtended *)v7;
  }
  else
  {
    v82 = 0;
  }

  return v82;
}

- (void)rotateAlongZAxis:(float)a3
{
  int32x4_t v4;
  int32x4_t v5;
  __float2 v6;
  uint64_t v7;
  int32x4_t v8;
  int32x4_t v9;
  float32x4_t v10;
  float32x4_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _OWORD v18[4];
  _OWORD v19[4];

  v6 = __sincosf_stret(a3);
  *(float *)v5.i32 = v6.__cosval;
  *(__float2 *)v4.i8 = v6;
  v7 = 0;
  *(float *)&v5.i32[1] = -v6.__sinval;
  v8 = vzip1q_s32(v5, (int32x4_t)0);
  v9 = vzip1q_s32(v4, (int32x4_t)0);
  v10 = (float32x4_t)vzip1q_s32(v8, v9);
  v11 = (float32x4_t)vzip2q_s32(v8, v9);
  v12 = *(_OWORD *)&self[1]._anon_8[8];
  v13 = *(_OWORD *)self[1]._anon_20;
  v14 = *(_OWORD *)&self[1]._anon_20[16];
  v18[0] = *(_OWORD *)&self[1].super.isa;
  v18[1] = v12;
  v18[2] = v13;
  v18[3] = v14;
  do
  {
    v19[v7] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v10, COERCE_FLOAT(v18[v7])), v11, *(float32x2_t *)&v18[v7], 1), (float32x4_t)xmmword_2295604C0, (float32x4_t)v18[v7], 2), (float32x4_t)xmmword_229560490, (float32x4_t)v18[v7], 3);
    ++v7;
  }
  while (v7 != 4);
  v15 = v19[1];
  v16 = v19[2];
  v17 = v19[3];
  *(_OWORD *)&self[1].super.isa = v19[0];
  *(_OWORD *)&self[1]._anon_8[8] = v15;
  *(_OWORD *)self[1]._anon_20 = v16;
  *(_OWORD *)&self[1]._anon_20[16] = v17;
}

- (void)translateBy:(OUKeyframeExtended *)self
{
  float32x4_t v2;
  float32x4_t v3;

  v3 = vaddq_f32(*(float32x4_t *)&self[1]._anon_20[16], v2);
  v3.i32[3] = HIDWORD(*(_OWORD *)&self[1]._anon_20[16]);
  *(float32x4_t *)&self[1]._anon_20[16] = v3;
}

- (void)filterOutPointsBeyondDistance:(float)a3
{
  void *v5;
  uint64_t v6;
  unsigned __int8 *anon_8;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  float v11;
  uint64_t v12;
  float32x4_t v13;
  uint64_t v14;
  _OWORD *f32;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  char *v19;
  float32x4_t *v20;
  float32x4_t *v21;
  float32x4_t *v22;
  float32x4_t v23;
  uint64_t v24;
  char *v25;
  void *v26;
  int64_t v27;
  unint64_t v28;
  unint64_t v29;
  char *v30;
  char *v31;
  char *v32;
  char *v33;
  __int128 v34;
  uint64_t v35;
  char *v36;
  void *v37;
  int64_t v38;
  unint64_t v39;
  unint64_t v40;
  char *v41;
  char *v42;
  char *v43;
  char *v44;
  int v45;
  uint64_t v46;
  char *v47;
  void *v48;
  int64_t v49;
  unint64_t v50;
  unint64_t v51;
  char *v52;
  char *v53;
  char *v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  unint64_t v61;
  char *v62;
  char *v63;
  char *v64;
  __int128 v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  float32x4_t v70;
  __int128 v71;
  char *v72;
  void *__p[2];
  char *v74;
  void *v75[2];
  char *v76;
  void *v77[2];
  char *v78;
  __int128 v79;
  char *v80;

  v79 = 0uLL;
  v80 = 0;
  v77[0] = 0;
  v77[1] = 0;
  v78 = 0;
  v75[0] = 0;
  v75[1] = 0;
  v76 = 0;
  __p[0] = 0;
  __p[1] = 0;
  v74 = 0;
  v71 = 0uLL;
  v72 = 0;
  v6 = *(_QWORD *)self->_anon_8;
  v5 = *(void **)&self->_anon_8[8];
  anon_8 = self->_anon_8;
  v8 = (uint64_t)v5 - v6;
  if (v8)
  {
    v9 = 0;
    v10 = v8 >> 4;
    v11 = a3 * a3;
    if (v10 <= 1)
      v12 = 1;
    else
      v12 = v10;
    do
    {
      v70 = *(float32x4_t *)(*(_QWORD *)anon_8 + 16 * v9);
      v13 = vmulq_f32(v70, v70);
      if (vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v13, 2), vaddq_f32(v13, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v13.f32, 1))).f32[0] < v11)
      {
        v14 = *((_QWORD *)&v79 + 1);
        if (*((_QWORD *)&v79 + 1) >= (unint64_t)v80)
        {
          v16 = (uint64_t)(*((_QWORD *)&v79 + 1) - v79) >> 4;
          if ((unint64_t)(v16 + 1) >> 60)
            goto LABEL_108;
          v17 = (uint64_t)&v80[-v79] >> 3;
          if (v17 <= v16 + 1)
            v17 = v16 + 1;
          if ((unint64_t)&v80[-v79] >= 0x7FFFFFFFFFFFFFF0)
            v18 = 0xFFFFFFFFFFFFFFFLL;
          else
            v18 = v17;
          if (v18)
            v19 = (char *)_ZNSt3__119__allocate_at_leastB8ne180100INS_9allocatorIDv3_fEEEENS_19__allocation_resultINS_16allocator_traitsIT_E7pointerEEERS6_m((uint64_t)&v80, v18);
          else
            v19 = 0;
          v20 = (float32x4_t *)&v19[16 * v16];
          *v20 = v70;
          f32 = (_OWORD *)v20[1].f32;
          v21 = (float32x4_t *)*((_QWORD *)&v79 + 1);
          v22 = (float32x4_t *)v79;
          if (*((_QWORD *)&v79 + 1) != (_QWORD)v79)
          {
            do
            {
              v23 = v21[-1];
              --v21;
              v20[-1] = v23;
              --v20;
            }
            while (v21 != v22);
            v21 = (float32x4_t *)v79;
          }
          *(_QWORD *)&v79 = v20;
          *((_QWORD *)&v79 + 1) = f32;
          v80 = &v19[16 * v18];
          if (v21)
            operator delete(v21);
        }
        else
        {
          **((_OWORD **)&v79 + 1) = v70;
          f32 = (_OWORD *)(v14 + 16);
        }
        *((_QWORD *)&v79 + 1) = f32;
        v24 = *(_QWORD *)self->_anon_20;
        v25 = (char *)v77[1];
        if (v77[1] >= v78)
        {
          v27 = ((char *)v77[1] - (char *)v77[0]) >> 4;
          if ((unint64_t)(v27 + 1) >> 60)
            goto LABEL_108;
          v28 = (v78 - (char *)v77[0]) >> 3;
          if (v28 <= v27 + 1)
            v28 = v27 + 1;
          if ((unint64_t)(v78 - (char *)v77[0]) >= 0x7FFFFFFFFFFFFFF0)
            v29 = 0xFFFFFFFFFFFFFFFLL;
          else
            v29 = v28;
          if (v29)
            v30 = (char *)_ZNSt3__119__allocate_at_leastB8ne180100INS_9allocatorIDv3_fEEEENS_19__allocation_resultINS_16allocator_traitsIT_E7pointerEEERS6_m((uint64_t)&v78, v29);
          else
            v30 = 0;
          v31 = &v30[16 * v27];
          *(_OWORD *)v31 = *(_OWORD *)(v24 + 16 * v9);
          v26 = v31 + 16;
          v33 = (char *)v77[0];
          v32 = (char *)v77[1];
          if (v77[1] != v77[0])
          {
            do
            {
              v34 = *((_OWORD *)v32 - 1);
              v32 -= 16;
              *((_OWORD *)v31 - 1) = v34;
              v31 -= 16;
            }
            while (v32 != v33);
            v32 = (char *)v77[0];
          }
          v77[0] = v31;
          v77[1] = v26;
          v78 = &v30[16 * v29];
          if (v32)
            operator delete(v32);
        }
        else
        {
          *(_OWORD *)v77[1] = *(_OWORD *)(v24 + 16 * v9);
          v26 = v25 + 16;
        }
        v77[1] = v26;
        v35 = *(_QWORD *)self->_anon_38;
        v36 = (char *)v75[1];
        if (v75[1] >= v76)
        {
          v38 = ((char *)v75[1] - (char *)v75[0]) >> 2;
          if ((unint64_t)(v38 + 1) >> 62)
            std::vector<float>::__throw_length_error[abi:ne180100]();
          v39 = (v76 - (char *)v75[0]) >> 1;
          if (v39 <= v38 + 1)
            v39 = v38 + 1;
          if ((unint64_t)(v76 - (char *)v75[0]) >= 0x7FFFFFFFFFFFFFFCLL)
            v40 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v40 = v39;
          if (v40)
            v41 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)&v76, v40);
          else
            v41 = 0;
          v42 = &v41[4 * v38];
          *(_DWORD *)v42 = *(_DWORD *)(v35 + 4 * v9);
          v37 = v42 + 4;
          v44 = (char *)v75[0];
          v43 = (char *)v75[1];
          if (v75[1] != v75[0])
          {
            do
            {
              v45 = *((_DWORD *)v43 - 1);
              v43 -= 4;
              *((_DWORD *)v42 - 1) = v45;
              v42 -= 4;
            }
            while (v43 != v44);
            v43 = (char *)v75[0];
          }
          v75[0] = v42;
          v75[1] = v37;
          v76 = &v41[4 * v40];
          if (v43)
            operator delete(v43);
        }
        else
        {
          *(_DWORD *)v75[1] = *(_DWORD *)(v35 + 4 * v9);
          v37 = v36 + 4;
        }
        v75[1] = v37;
        v46 = *(_QWORD *)self->_anon_50;
        v47 = (char *)__p[1];
        if (__p[1] >= v74)
        {
          v49 = ((char *)__p[1] - (char *)__p[0]) >> 3;
          if ((unint64_t)(v49 + 1) >> 61)
            std::vector<float>::__throw_length_error[abi:ne180100]();
          v50 = (v74 - (char *)__p[0]) >> 2;
          if (v50 <= v49 + 1)
            v50 = v49 + 1;
          if ((unint64_t)(v74 - (char *)__p[0]) >= 0x7FFFFFFFFFFFFFF8)
            v51 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v51 = v50;
          if (v51)
            v52 = (char *)_ZNSt3__119__allocate_at_leastB8ne180100INS_9allocatorIDv2_fEEEENS_19__allocation_resultINS_16allocator_traitsIT_E7pointerEEERS6_m((uint64_t)&v74, v51);
          else
            v52 = 0;
          v53 = &v52[8 * v49];
          *(_QWORD *)v53 = *(_QWORD *)(v46 + 8 * v9);
          v48 = v53 + 8;
          v55 = (char *)__p[0];
          v54 = (char *)__p[1];
          if (__p[1] != __p[0])
          {
            do
            {
              v56 = *((_QWORD *)v54 - 1);
              v54 -= 8;
              *((_QWORD *)v53 - 1) = v56;
              v53 -= 8;
            }
            while (v54 != v55);
            v54 = (char *)__p[0];
          }
          __p[0] = v53;
          __p[1] = v48;
          v74 = &v52[8 * v51];
          if (v54)
            operator delete(v54);
        }
        else
        {
          *(_QWORD *)__p[1] = *(_QWORD *)(v46 + 8 * v9);
          v48 = v47 + 8;
        }
        __p[1] = v48;
        v57 = *(_QWORD *)self->_anon_68;
        if (*((_QWORD *)&v71 + 1) >= (unint64_t)v72)
        {
          v59 = (uint64_t)(*((_QWORD *)&v71 + 1) - v71) >> 4;
          if ((unint64_t)(v59 + 1) >> 60)
LABEL_108:
            std::vector<float>::__throw_length_error[abi:ne180100]();
          v60 = (uint64_t)&v72[-v71] >> 3;
          if (v60 <= v59 + 1)
            v60 = v59 + 1;
          if ((unint64_t)&v72[-v71] >= 0x7FFFFFFFFFFFFFF0)
            v61 = 0xFFFFFFFFFFFFFFFLL;
          else
            v61 = v60;
          if (v61)
            v62 = (char *)_ZNSt3__119__allocate_at_leastB8ne180100INS_9allocatorIDv3_fEEEENS_19__allocation_resultINS_16allocator_traitsIT_E7pointerEEERS6_m((uint64_t)&v72, v61);
          else
            v62 = 0;
          v63 = &v62[16 * v59];
          *(_OWORD *)v63 = *(_OWORD *)(v57 + 16 * v9);
          v58 = (uint64_t)(v63 + 16);
          v64 = (char *)*((_QWORD *)&v71 + 1);
          if (*((_QWORD *)&v71 + 1) != (_QWORD)v71)
          {
            do
            {
              v65 = *((_OWORD *)v64 - 1);
              v64 -= 16;
              *((_OWORD *)v63 - 1) = v65;
              v63 -= 16;
            }
            while (v64 != (char *)v71);
            v64 = (char *)v71;
          }
          *(_QWORD *)&v71 = v63;
          v72 = &v62[16 * v61];
          if (v64)
            operator delete(v64);
        }
        else
        {
          **((_OWORD **)&v71 + 1) = *(_OWORD *)(v57 + 16 * v9);
          v58 = *((_QWORD *)&v71 + 1) + 16;
        }
        *((_QWORD *)&v71 + 1) = v58;
      }
      ++v9;
    }
    while (v9 != v12);
    v5 = *(void **)anon_8;
  }
  if (v5)
  {
    *(_QWORD *)&self->_anon_8[8] = v5;
    operator delete(v5);
    *(_QWORD *)anon_8 = 0;
    *((_QWORD *)anon_8 + 1) = 0;
    *((_QWORD *)anon_8 + 2) = 0;
  }
  v66 = *(void **)self->_anon_20;
  *(_OWORD *)self->_anon_8 = v79;
  *(_QWORD *)&self->_anon_8[16] = v80;
  v80 = 0;
  v79 = 0uLL;
  if (v66)
  {
    *(_QWORD *)&self->_anon_20[8] = v66;
    operator delete(v66);
    *(_QWORD *)self->_anon_20 = 0;
    *(_QWORD *)&self->_anon_20[8] = 0;
    *(_QWORD *)&self->_anon_20[16] = 0;
  }
  v67 = *(void **)self->_anon_38;
  *(_OWORD *)self->_anon_20 = *(_OWORD *)v77;
  *(_QWORD *)&self->_anon_20[16] = v78;
  v77[1] = 0;
  v78 = 0;
  v77[0] = 0;
  if (v67)
  {
    *(_QWORD *)&self->_anon_38[8] = v67;
    operator delete(v67);
    *(_QWORD *)self->_anon_38 = 0;
    *(_QWORD *)&self->_anon_38[8] = 0;
    *(_QWORD *)&self->_anon_38[16] = 0;
  }
  v68 = *(void **)self->_anon_50;
  *(_OWORD *)self->_anon_38 = *(_OWORD *)v75;
  *(_QWORD *)&self->_anon_38[16] = v76;
  v75[1] = 0;
  v76 = 0;
  v75[0] = 0;
  if (v68)
  {
    *(_QWORD *)&self->_anon_50[8] = v68;
    operator delete(v68);
    *(_QWORD *)self->_anon_50 = 0;
    *(_QWORD *)&self->_anon_50[8] = 0;
    *(_QWORD *)&self->_anon_50[16] = 0;
  }
  v69 = *(void **)self->_anon_68;
  *(_OWORD *)self->_anon_50 = *(_OWORD *)__p;
  *(_QWORD *)&self->_anon_50[16] = v74;
  __p[1] = 0;
  v74 = 0;
  __p[0] = 0;
  if (v69)
  {
    *(_QWORD *)&self->_anon_68[8] = v69;
    operator delete(v69);
    *(_QWORD *)self->_anon_68 = 0;
    *(_QWORD *)&self->_anon_68[8] = 0;
    *(_QWORD *)&self->_anon_68[16] = 0;
    v69 = __p[0];
  }
  *(_OWORD *)self->_anon_68 = v71;
  *(_QWORD *)&self->_anon_68[16] = v72;
  if (v69)
  {
    __p[1] = v69;
    operator delete(v69);
  }
  if (v75[0])
  {
    v75[1] = v75[0];
    operator delete(v75[0]);
  }
  if (v77[0])
  {
    v77[1] = v77[0];
    operator delete(v77[0]);
  }
  if ((_QWORD)v79)
  {
    *((_QWORD *)&v79 + 1) = v79;
    operator delete((void *)v79);
  }
}

- (void)select:(unint64_t)a3 indices:(const unint64_t *)a4 from:(id)a5
{
  id v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  const unint64_t *v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  const unint64_t *v16;
  void *v17;
  uint64_t v18;
  unint64_t v19;
  const unint64_t *v20;
  void *v21;
  uint64_t v22;
  unint64_t v23;
  const unint64_t *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  __int128 v28;
  uint64_t v29;
  __int128 v30;
  void **v31;

  v8 = a5;
  v9 = objc_msgSend(v8, "points");
  v28 = 0uLL;
  v29 = 0;
  _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE7reserveEm((void **)&v28, a3);
  v31 = (void **)&v28;
  v10 = 8 * a3;
  if (a3)
  {
    v11 = 8 * a3;
    v12 = a4;
    do
    {
      v30 = *(_OWORD *)(v9 + 16 * *v12);
      _ZNSt3__120back_insert_iteratorINS_6vectorIDv3_fNS_9allocatorIS2_EEEEEaSB8ne180100EOS2_(&v31, &v30);
      ++v12;
      v11 -= 8;
    }
    while (v11);
  }
  v13 = *(void **)self->_anon_8;
  if (v13)
  {
    *(_QWORD *)&self->_anon_8[8] = v13;
    operator delete(v13);
    *(_QWORD *)self->_anon_8 = 0;
    *(_QWORD *)&self->_anon_8[8] = 0;
    *(_QWORD *)&self->_anon_8[16] = 0;
  }
  *(_OWORD *)self->_anon_8 = v28;
  *(_QWORD *)&self->_anon_8[16] = v29;
  v14 = objc_msgSend(v8, "pointsToWorld");
  v28 = 0uLL;
  v29 = 0;
  _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE7reserveEm((void **)&v28, a3);
  v31 = (void **)&v28;
  if (a3)
  {
    v15 = 8 * a3;
    v16 = a4;
    do
    {
      v30 = *(_OWORD *)(v14 + 16 * *v16);
      _ZNSt3__120back_insert_iteratorINS_6vectorIDv3_fNS_9allocatorIS2_EEEEEaSB8ne180100EOS2_(&v31, &v30);
      ++v16;
      v15 -= 8;
    }
    while (v15);
  }
  v17 = *(void **)self->_anon_20;
  if (v17)
  {
    *(_QWORD *)&self->_anon_20[8] = v17;
    operator delete(v17);
    *(_QWORD *)self->_anon_20 = 0;
    *(_QWORD *)&self->_anon_20[8] = 0;
    *(_QWORD *)&self->_anon_20[16] = 0;
  }
  *(_OWORD *)self->_anon_20 = v28;
  *(_QWORD *)&self->_anon_20[16] = v29;
  v18 = objc_msgSend(v8, "semanticLabels");
  v28 = 0uLL;
  v29 = 0;
  _ZNSt3__16vectorIDv4_hNS_9allocatorIS1_EEE7reserveEm((void **)&v28, a3);
  *(_QWORD *)&v30 = &v28;
  if (a3)
  {
    v19 = 8 * a3;
    v20 = a4;
    do
    {
      LODWORD(v31) = *(_DWORD *)(v18 + 4 * *v20);
      _ZNSt3__120back_insert_iteratorINS_6vectorIDv4_hNS_9allocatorIS2_EEEEEaSB8ne180100EOS2_((void ***)&v30, &v31);
      ++v20;
      v19 -= 8;
    }
    while (v19);
  }
  v21 = *(void **)self->_anon_38;
  if (v21)
  {
    *(_QWORD *)&self->_anon_38[8] = v21;
    operator delete(v21);
    *(_QWORD *)self->_anon_38 = 0;
    *(_QWORD *)&self->_anon_38[8] = 0;
    *(_QWORD *)&self->_anon_38[16] = 0;
  }
  *(_OWORD *)self->_anon_38 = v28;
  *(_QWORD *)&self->_anon_38[16] = v29;
  v22 = objc_msgSend(v8, "semanticVotes");
  v28 = 0uLL;
  v29 = 0;
  _ZNSt3__16vectorIDv4_tNS_9allocatorIS1_EEE7reserveEm((void **)&v28, a3);
  *(_QWORD *)&v30 = &v28;
  if (a3)
  {
    v23 = 8 * a3;
    v24 = a4;
    do
    {
      v31 = *(void ***)(v22 + 8 * *v24);
      _ZNSt3__120back_insert_iteratorINS_6vectorIDv4_tNS_9allocatorIS2_EEEEEaSB8ne180100EOS2_((void ***)&v30, &v31);
      ++v24;
      v23 -= 8;
    }
    while (v23);
  }
  v25 = *(void **)self->_anon_50;
  if (v25)
  {
    *(_QWORD *)&self->_anon_50[8] = v25;
    operator delete(v25);
    *(_QWORD *)self->_anon_50 = 0;
    *(_QWORD *)&self->_anon_50[8] = 0;
    *(_QWORD *)&self->_anon_50[16] = 0;
  }
  *(_OWORD *)self->_anon_50 = v28;
  *(_QWORD *)&self->_anon_50[16] = v29;
  v26 = objc_msgSend(v8, "colors");
  v28 = 0uLL;
  v29 = 0;
  _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE7reserveEm((void **)&v28, a3);
  v31 = (void **)&v28;
  if (a3)
  {
    do
    {
      v30 = *(_OWORD *)(v26 + 16 * *a4);
      _ZNSt3__120back_insert_iteratorINS_6vectorIDv3_fNS_9allocatorIS2_EEEEEaSB8ne180100EOS2_(&v31, &v30);
      ++a4;
      v10 -= 8;
    }
    while (v10);
  }
  v27 = *(void **)self->_anon_68;
  if (v27)
  {
    *(_QWORD *)&self->_anon_68[8] = v27;
    operator delete(v27);
    *(_QWORD *)self->_anon_68 = 0;
    *(_QWORD *)&self->_anon_68[8] = 0;
    *(_QWORD *)&self->_anon_68[16] = 0;
  }
  *(_OWORD *)self->_anon_68 = v28;
  *(_QWORD *)&self->_anon_68[16] = v29;

}

- (OUKeyframeExtended)initWithKeyframe:(id)a3 voxelize:(BOOL)a4 resample:(BOOL)a5 outlierRemove:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  _BOOL4 v8;
  id v10;
  OUKeyframeExtended *v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  simd_float4 v18;
  simd_float4 v19;
  unint64_t v20;
  char *v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  char *v28;
  char *v29;
  uint64_t v30;
  OUKeyframeExtended *v31;
  _QWORD *v32;
  char *v33;
  unint64_t v34;
  char *v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  unint64_t v39;
  char *v40;
  char *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t *v49;
  float32x2_t v50;
  uint64_t *v51;
  uint64_t v52;
  float32x2_t v53;
  float32x2_t v54;
  float32x2_t v55;
  float32x2_t v56;
  uint64_t *v57;
  uint64_t v58;
  float32x2_t v59;
  char *v60;
  float32x2_t v61;
  float32x2_t v67;
  uint64_t v68;
  int32x2_t v69;
  void *v70;
  char *v71;
  uint64_t v72;
  unint64_t v73;
  uint64_t v74;
  unint64_t v75;
  char *v76;
  char *v77;
  uint64_t v78;
  char *v79;
  void *v80;
  uint64_t v81;
  NSUUID *identifier;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  double v87;
  OUKeyframeExtended *v88;
  float32x4_t v90;
  void *__p[2];
  char *v92;
  void *v93[2];
  char *v94;
  objc_super v95;
  unint64_t v96;
  void *v97[2];
  __int128 v98;
  int v99;

  v6 = a6;
  v7 = a5;
  v8 = a4;
  v10 = a3;
  v95.receiver = self;
  v95.super_class = (Class)OUKeyframeExtended;
  v11 = -[OUKeyframeExtended init](&v95, sel_init);
  if (objc_msgSend(v10, "count"))
  {
    std::vector<unsigned long>::vector(v93, objc_msgSend(v10, "count"));
    v12 = v93[0];
    v13 = v93[1];
    if (v93[0] != v93[1])
    {
      v14 = 0;
      do
        *v12++ = v14++;
      while (v12 != v13);
    }
    if (v8)
    {
      v15 = objc_msgSend(v10, "points");
      if (!v15 || (v16 = v93[0], v17 = v93[1], v93[0] == v93[1]))
      {
        *(_OWORD *)__p = 0uLL;
        v92 = 0;
      }
      else
      {
        *(_OWORD *)__p = 0uLL;
        v92 = 0;
        *(_OWORD *)v97 = 0u;
        v98 = 0u;
        v99 = 1065353216;
        v90 = (float32x4_t)vdupq_n_s32(0x3C23D70Au);
        do
        {
          v18 = (simd_float4)vdivq_f32(*(float32x4_t *)(v15 + 16 * *v16), v90);
          v18.i32[3] = 0;
          v19 = _simd_round_f4(v18);
          *(int32x2_t *)v19.f32 = vcvt_s32_f32(*(float32x2_t *)v19.f32);
          LOWORD(v20) = 0;
          WORD1(v20) = v19.i16[0];
          WORD2(v20) = v19.i16[2];
          HIWORD(v20) = (int)v19.f32[2];
          v96 = v20;
          if (!std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::find<unsigned long long>(v97, &v96))
          {
            std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__emplace_unique_key_args<unsigned long long,unsigned long long const&>((uint64_t)v97, &v96, &v96);
            v21 = (char *)__p[1];
            if (__p[1] >= v92)
            {
              v23 = (char *)__p[0];
              v24 = ((char *)__p[1] - (char *)__p[0]) >> 3;
              v25 = v24 + 1;
              if ((unint64_t)(v24 + 1) >> 61)
                std::vector<float>::__throw_length_error[abi:ne180100]();
              v26 = v92 - (char *)__p[0];
              if ((v92 - (char *)__p[0]) >> 2 > v25)
                v25 = v26 >> 2;
              if ((unint64_t)v26 >= 0x7FFFFFFFFFFFFFF8)
                v27 = 0x1FFFFFFFFFFFFFFFLL;
              else
                v27 = v25;
              if (v27)
              {
                v28 = (char *)_ZNSt3__119__allocate_at_leastB8ne180100INS_9allocatorIDv2_fEEEENS_19__allocation_resultINS_16allocator_traitsIT_E7pointerEEERS6_m((uint64_t)&v92, v27);
                v21 = (char *)__p[1];
                v23 = (char *)__p[0];
              }
              else
              {
                v28 = 0;
              }
              v29 = &v28[8 * v24];
              *(_QWORD *)v29 = *v16;
              v22 = (uint64_t)(v29 + 8);
              while (v21 != v23)
              {
                v30 = *((_QWORD *)v21 - 1);
                v21 -= 8;
                *((_QWORD *)v29 - 1) = v30;
                v29 -= 8;
              }
              __p[0] = v29;
              v92 = &v28[8 * v27];
              if (v23)
                operator delete(v23);
            }
            else
            {
              *(_QWORD *)__p[1] = *v16;
              v22 = (uint64_t)__p[1] + 8;
            }
            __p[1] = (void *)v22;
          }
          ++v16;
        }
        while (v16 != v17);
        std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::~__hash_table((uint64_t)v97);
      }
      if (v93[0])
      {
        v93[1] = v93[0];
        operator delete(v93[0]);
      }
      *(_OWORD *)v93 = *(_OWORD *)__p;
      v94 = v92;
    }
    if (v7)
    {
      v97[0] = 0;
      v97[1] = 0;
      *(_QWORD *)&v98 = 0;
      v32 = v93[1];
      if (v93[1] == v93[0])
      {
        v45 = 0;
        v33 = 0;
        v44 = 0;
      }
      else
      {
        v33 = 0;
        v34 = 0;
        v32 = v93[0];
        do
        {
          if ((unint64_t)v33 >= (unint64_t)v98)
          {
            v35 = (char *)v97[0];
            v36 = (v33 - (char *)v97[0]) >> 3;
            v37 = v36 + 1;
            if ((unint64_t)(v36 + 1) >> 61)
              std::vector<float>::__throw_length_error[abi:ne180100]();
            v38 = v98 - (unint64_t)v97[0];
            if ((uint64_t)(v98 - (unint64_t)v97[0]) >> 2 > v37)
              v37 = v38 >> 2;
            if ((unint64_t)v38 >= 0x7FFFFFFFFFFFFFF8)
              v39 = 0x1FFFFFFFFFFFFFFFLL;
            else
              v39 = v37;
            if (v39)
            {
              v40 = (char *)_ZNSt3__119__allocate_at_leastB8ne180100INS_9allocatorIDv2_fEEEENS_19__allocation_resultINS_16allocator_traitsIT_E7pointerEEERS6_m((uint64_t)&v98, v39);
              v35 = (char *)v97[0];
              v33 = (char *)v97[1];
            }
            else
            {
              v40 = 0;
            }
            v41 = &v40[8 * v36];
            *(_QWORD *)v41 = v32[v34];
            v42 = v41 + 8;
            while (v33 != v35)
            {
              v43 = *((_QWORD *)v33 - 1);
              v33 -= 8;
              *((_QWORD *)v41 - 1) = v43;
              v41 -= 8;
            }
            v97[0] = v41;
            v97[1] = v42;
            *(_QWORD *)&v98 = &v40[8 * v39];
            if (v35)
              operator delete(v35);
            v33 = (char *)v42;
          }
          else
          {
            *(_QWORD *)v33 = v32[v34];
            v33 += 8;
          }
          v97[1] = v33;
          v34 = (int)v34 + 3;
          v32 = v93[0];
        }
        while (v34 < ((char *)v93[1] - (char *)v93[0]) >> 3);
        v44 = v97[0];
        v45 = (char *)v98;
      }
      v93[0] = v44;
      v93[1] = v33;
      v97[0] = v32;
      *(_QWORD *)&v98 = v94;
      v94 = v45;
      if (v32)
      {
        v97[1] = v32;
        operator delete(v32);
      }
    }
    if (v6)
    {
      v46 = objc_msgSend(v10, "points");
      v47 = v46;
      if (v46)
      {
        v48 = (uint64_t *)v93[0];
        v49 = (uint64_t *)v93[1];
        if (v93[0] != v93[1])
        {
          v97[0] = 0;
          v97[1] = 0;
          v50 = 0;
          v51 = (uint64_t *)v93[0];
          *(_QWORD *)&v98 = 0;
          do
          {
            v52 = *v51++;
            v53 = *(float32x2_t *)(v46 + 16 * v52);
            v50 = vadd_f32(v50, v53);
          }
          while (v51 != v93[1]);
          v53.f32[0] = (float)(unint64_t)(((char *)v93[1] - (char *)v93[0]) >> 3);
          v54 = (float32x2_t)vdup_lane_s32((int32x2_t)v53, 0);
          v55 = vdiv_f32(v50, v54);
          v56 = 0;
          v57 = (uint64_t *)v93[0];
          do
          {
            v58 = *v57++;
            v59 = vsub_f32(*(float32x2_t *)(v46 + 16 * v58), v55);
            v56 = vmla_f32(v56, v59, v59);
          }
          while (v57 != v93[1]);
          v60 = 0;
          v61 = vsqrt_f32(vdiv_f32(v56, v54));
          __asm { FMOV            V1.2S, #3.0 }
          v67 = vmul_f32(v61, _D1);
          do
          {
            v68 = *v48;
            v69 = vcgt_f32(vabd_f32(*(float32x2_t *)(v47 + 16 * *v48), v55), v67);
            if (((v69.i32[0] | v69.i32[1]) & 1) == 0)
            {
              if ((unint64_t)v60 >= (unint64_t)v98)
              {
                v71 = (char *)v97[0];
                v72 = (v60 - (char *)v97[0]) >> 3;
                v73 = v72 + 1;
                if ((unint64_t)(v72 + 1) >> 61)
                  std::vector<float>::__throw_length_error[abi:ne180100]();
                v74 = v98 - (unint64_t)v97[0];
                if ((uint64_t)(v98 - (unint64_t)v97[0]) >> 2 > v73)
                  v73 = v74 >> 2;
                if ((unint64_t)v74 >= 0x7FFFFFFFFFFFFFF8)
                  v75 = 0x1FFFFFFFFFFFFFFFLL;
                else
                  v75 = v73;
                if (v75)
                {
                  v76 = (char *)_ZNSt3__119__allocate_at_leastB8ne180100INS_9allocatorIDv2_fEEEENS_19__allocation_resultINS_16allocator_traitsIT_E7pointerEEERS6_m((uint64_t)&v98, v75);
                  v71 = (char *)v97[0];
                  v60 = (char *)v97[1];
                  v68 = *v48;
                }
                else
                {
                  v76 = 0;
                }
                v77 = &v76[8 * v72];
                *(_QWORD *)v77 = v68;
                v70 = v77 + 8;
                while (v60 != v71)
                {
                  v78 = *((_QWORD *)v60 - 1);
                  v60 -= 8;
                  *((_QWORD *)v77 - 1) = v78;
                  v77 -= 8;
                }
                v97[0] = v77;
                v97[1] = v70;
                *(_QWORD *)&v98 = &v76[8 * v75];
                if (v71)
                  operator delete(v71);
              }
              else
              {
                *(_QWORD *)v60 = v68;
                v70 = v60 + 8;
              }
              v97[1] = v70;
              v60 = (char *)v70;
            }
            ++v48;
          }
          while (v48 != v49);
          v79 = (char *)v98;
          v80 = v93[0];
          v93[0] = v97[0];
          v93[1] = v60;
          v97[0] = v80;
          *(_QWORD *)&v98 = v94;
          v94 = v79;
          if (v80)
          {
            v97[1] = v80;
            operator delete(v80);
          }
        }
      }
    }
    -[OUKeyframeExtended select:indices:from:](v11, "select:indices:from:", ((char *)v93[1] - (char *)v93[0]) >> 3, *(_OWORD *)&v90);
    objc_msgSend(v10, "identifier");
    v81 = objc_claimAutoreleasedReturnValue();
    identifier = v11->identifier;
    v11->identifier = (NSUUID *)v81;

    objc_msgSend(v10, "cameraPose");
    *(_OWORD *)&v11[1].super.isa = v83;
    *(_OWORD *)&v11[1]._anon_8[8] = v84;
    *(_OWORD *)v11[1]._anon_20 = v85;
    *(_OWORD *)&v11[1]._anon_20[16] = v86;
    objc_msgSend(v10, "timestamp");
    v11->timestamp = v87;
    v11->groupId = 0;
    v88 = v11;
    if (v93[0])
    {
      v93[1] = v93[0];
      operator delete(v93[0]);
    }
  }
  else
  {
    v31 = v11;
  }

  return v11;
}

- (NSUUID)identifier
{
  return self->identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->identifier, a3);
}

- (__n128)cameraPose
{
  return a1[10];
}

- (__n128)setCameraPose:(__n128)a3
{
  result[10] = a2;
  result[11] = a3;
  result[12] = a4;
  result[13] = a5;
  return result;
}

- (unsigned)groupId
{
  return self->groupId;
}

- (void)setGroupId:(unsigned int)a3
{
  self->groupId = a3;
}

- (double)timestamp
{
  return self->timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->timestamp = a3;
}

- (void).cxx_destruct
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_storeStrong((id *)&self->identifier, 0);
  v3 = *(void **)self->_anon_68;
  if (v3)
  {
    *(_QWORD *)&self->_anon_68[8] = v3;
    operator delete(v3);
  }
  v4 = *(void **)self->_anon_50;
  if (v4)
  {
    *(_QWORD *)&self->_anon_50[8] = v4;
    operator delete(v4);
  }
  v5 = *(void **)self->_anon_38;
  if (v5)
  {
    *(_QWORD *)&self->_anon_38[8] = v5;
    operator delete(v5);
  }
  v6 = *(void **)self->_anon_20;
  if (v6)
  {
    *(_QWORD *)&self->_anon_20[8] = v6;
    operator delete(v6);
  }
  v7 = *(void **)self->_anon_8;
  if (v7)
  {
    *(_QWORD *)&self->_anon_8[8] = v7;
    operator delete(v7);
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 15) = 0;
  *(_OWORD *)((char *)self + 104) = 0u;
  *(_OWORD *)((char *)self + 88) = 0u;
  *(_OWORD *)((char *)self + 72) = 0u;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

@end
