@implementation PTHumanDetections

- (PTHumanDetections)initWithMetalContext:(id)a3
{
  id v4;
  PTHumanDetections *v5;
  PTUtil *v6;
  PTUtil *util;
  PTHumanDetections *v8;
  NSObject *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PTHumanDetections;
  v5 = -[PTHumanDetections init](&v11, sel_init);
  if (!v5)
  {
LABEL_7:
    v8 = 0;
    goto LABEL_8;
  }
  v6 = -[PTUtil initWithMetalContext:]([PTUtil alloc], "initWithMetalContext:", v4);
  util = v5->_util;
  v5->_util = v6;

  if (!v5->_util)
  {
    _PTLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[PTHumanDetections initWithMetalContext:].cold.1(v9);

    goto LABEL_7;
  }
  memset_pattern16(v5->_faceDetectionsFilteredState, &unk_1C93437D0, 0x10uLL);
  v8 = v5;
LABEL_8:

  return v8;
}

- (void)unpackDetections:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  const __CFString *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  unsigned int v14;
  void *v15;
  unsigned int v16;
  void *v17;
  unsigned int v18;
  void *v19;
  unsigned int v20;
  __int128 v21;
  float32x2_t v22;
  BOOL v23;
  void *v24;
  BOOL v25;
  void *v26;
  uint64_t v27;
  void *v28;
  int v29;
  void *v30;
  __int128 v31;
  int v32;
  int v33;
  uint64_t v34;
  __int128 v35;
  float v36;
  uint64_t v37;
  uint64_t v38;
  char v39;
  void *v40;
  int v41;
  const __CFString *v42;
  void *v43;
  unsigned int v44;
  void *v45;
  unsigned int v46;
  void *v47;
  unsigned int v48;
  void *v49;
  __int128 v50;
  unsigned int v51;
  void *v52;
  void *v53;
  int v54;
  void *v55;
  void *v56;
  id v57;
  id v58;
  unint64_t v59;
  PTHumanDetection *detectionsRaw;
  PTHumanDetections *v61;
  void *v62;
  unsigned int v63;
  void *v64;
  unsigned int v65;
  unsigned int v66;
  unsigned int v67;
  int v68;
  unsigned int v69;
  __int128 v70;
  unsigned int v71;
  unsigned int v72;
  __int128 v73;
  __int128 v74;

  v57 = a3;
  objc_msgSend(v57, "objectForKeyedSubscript:", CFSTR("DetectedObjectsInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = v4;
  if (v4)
  {
    v5 = v4;

    v6 = v5;
  }
  else
  {
    v6 = v57;
  }
  v58 = v6;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("HumanFaces"), v55);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("ObjectsArray"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  self->_detectionsRawCount = 0;
  if (objc_msgSend(v8, "count"))
  {
    v9 = 0;
    v10 = CFSTR("X");
    detectionsRaw = self->_detectionsRaw;
    v61 = self;
    v62 = v8;
    do
    {
      if (self->_detectionsRawCount >= 4)
        break;
      objc_msgSend(v8, "objectAtIndexedSubscript:", v9);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "objectForKeyedSubscript:", CFSTR("Rect"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v10;
      objc_msgSend(v11, "objectForKeyedSubscript:", v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "floatValue");
      v71 = v14;
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("Y"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "floatValue");
      v67 = v16;
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("Width"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "floatValue");
      v65 = v18;
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("Height"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "floatValue");
      v63 = v20;

      LODWORD(v21) = v71;
      v22 = vmla_f32((float32x2_t)__PAIR64__(v67, v71), (float32x2_t)0x3F0000003F000000, (float32x2_t)__PAIR64__(v63, v65));
      v23 = v22.f32[0] > 0.0 && v22.f32[1] < 1.0;
      if (v23 && (v22.f32[1] > 0.0 ? (v25 = v22.f32[0] < 1.0) : (v25 = 0), v25))
      {
        v59 = v9;
        DWORD1(v21) = v67;
        *((_QWORD *)&v21 + 1) = __PAIR64__(v63, v65);
        *(_OWORD *)&detectionsRaw[36 * self->_detectionsRawCount + 4].groupId = v21;
        objc_msgSend(v64, "objectForKeyedSubscript:", CFSTR("AngleInfoYaw"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "floatValue");
        *(_QWORD *)&v70 = v27;
        objc_msgSend(v64, "objectForKeyedSubscript:", CFSTR("AngleInfoPitch"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "floatValue");
        v68 = v29;
        objc_msgSend(v64, "objectForKeyedSubscript:", CFSTR("AngleInfoRoll"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "floatValue");
        v31 = v70;
        DWORD1(v31) = v68;
        DWORD2(v31) = v32;
        *(_OWORD *)&detectionsRaw[36 * self->_detectionsRawCount + 16].groupId = v31;

        v33 = 0;
        v34 = (uint64_t)&detectionsRaw[36 * self->_detectionsRawCount + 16];
        do
        {
          v35 = *(_OWORD *)v34;
          v74 = *(_OWORD *)v34;
          v36 = *(float *)((unint64_t)&v74 & 0xFFFFFFFFFFFFFFF3 | (4 * (v33 & 3)));
          if (v36 > 180.0)
          {
            v73 = v35;
            *(float *)((unint64_t)&v73 & 0xFFFFFFFFFFFFFFF3 | (4 * (v33 & 3))) = -(float)(360.0 - v36);
            v37 = v73;
            *(_DWORD *)(v34 + 8) = DWORD2(v73);
            *(_QWORD *)v34 = v37;
          }
          ++v33;
        }
        while (v33 != 3);
        v38 = 0;
        v39 = 1;
        do
        {
          v40 = v11;
          v41 = v39 & 1;
          if ((v39 & 1) != 0)
            v42 = CFSTR("LeftEyeRect");
          else
            v42 = CFSTR("RightEyeRect");
          objc_msgSend(v64, "objectForKeyedSubscript:", v42);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          *((_BYTE *)&detectionsRaw[36 * v61->_detectionsRawCount + 21].groupId + v38) = v11 != 0;
          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("X"));
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "floatValue");
          v72 = v44;
          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("Y"));
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "floatValue");
          v69 = v46;
          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("Width"));
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "floatValue");
          v66 = v48;
          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("Height"));
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "floatValue");
          *(_QWORD *)&v50 = __PAIR64__(v69, v72);
          *((_QWORD *)&v50 + 1) = __PAIR64__(v51, v66);
          *(_OWORD *)&detectionsRaw[36 * v61->_detectionsRawCount + 24 + 4 * v38].groupId = v50;

          v39 = 0;
          v38 = 1;
        }
        while (v41);
        v24 = v64;
        objc_msgSend(v64, "objectForKeyedSubscript:", CFSTR("GroupID"));
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v59;
        v10 = CFSTR("X");
        if (!v52)
        {
          objc_msgSend(v64, "objectForKeyedSubscript:", CFSTR("FaceID"));
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v52)
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v59);
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            if (unpackDetections__once != -1)
              dispatch_once(&unpackDetections__once, &__block_literal_global_8);
          }
        }
        detectionsRaw[36 * v61->_detectionsRawCount].groupId = objc_msgSend(v52, "intValue");
        objc_msgSend(v64, "objectForKeyedSubscript:", CFSTR("ConfidenceLevel"));
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "floatValue");
        self = v61;
        detectionsRaw[36 * v61->_detectionsRawCount + 20].groupId = v54;

        ++v61->_detectionsRawCount;
      }
      else
      {
        v10 = v12;
        v24 = v64;
      }

      ++v9;
      v8 = v62;
    }
    while (objc_msgSend(v62, "count") > v9);
  }

}

- (int)detectionsRawCount
{
  return self->_detectionsRawCount;
}

- (void)clearFilterDetections
{
  uint64_t detectionsRawCount;
  uint64_t v3;
  PTHumanDetection *detectionsRaw;
  uint64_t v5;
  PTHumanDetection *v6;
  int8x16_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  float32x2_t v11;
  int8x16_t v12;
  __int128 v13;
  char v14;
  char v15;
  PTHumanDetection *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  int8x16_t v20;
  uint64_t v21;
  uint64_t v22;
  int8x16_t v24;
  int8x16_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;

  LODWORD(detectionsRawCount) = self->_detectionsRawCount;
  if ((int)detectionsRawCount < 1)
    goto LABEL_9;
  v3 = 0;
  detectionsRaw = self->_detectionsRaw;
  do
  {
    v5 = 0;
    v6 = &detectionsRaw[36 * v3];
    v12 = *(int8x16_t *)&v6->groupId;
    v7 = *(int8x16_t *)&v6[4].groupId;
    v8 = *(_OWORD *)&v6[32].groupId;
    v9 = *(_OWORD *)&v6[24].groupId;
    v31 = *(_OWORD *)&v6[28].groupId;
    v32 = v8;
    v10 = *(_OWORD *)&v6[16].groupId;
    v29 = *(_OWORD *)&v6[20].groupId;
    v30 = v9;
    v28 = v10;
    v24 = v12;
    v25 = v7;
    v11 = (float32x2_t)vextq_s8(v7, v7, 8uLL).u64[0];
    *(float32x2_t *)v12.i8 = vmla_f32(*(float32x2_t *)v7.i8, (float32x2_t)0x3F0000003F000000, v11);
    *(_QWORD *)&v13 = v12.i64[0];
    *((float32x2_t *)&v13 + 1) = v11;
    v26 = v13;
    v27 = v13;
    DWORD1(v32) = 1065353216;
    v14 = 1;
    do
    {
      v15 = v14;
      if (!*((_BYTE *)&v29 + v5 + 4))
        *(&v30 + v5) = (__int128)v12;
      v14 = 0;
      v5 = 1;
    }
    while ((v15 & 1) != 0);
    v16 = &self->_detectionsFiltered[36 * v3];
    v17 = v31;
    *(_OWORD *)&v16[24].groupId = v30;
    *(_OWORD *)&v16[28].groupId = v17;
    *(_OWORD *)&v16[32].groupId = v32;
    v18 = v27;
    *(_OWORD *)&v16[8].groupId = v26;
    *(_OWORD *)&v16[12].groupId = v18;
    v19 = v29;
    *(_OWORD *)&v16[16].groupId = v28;
    *(_OWORD *)&v16[20].groupId = v19;
    v20 = v25;
    *(int8x16_t *)&v16->groupId = v24;
    *(int8x16_t *)&v16[4].groupId = v20;
    *(int8x16_t *)&self->_faceDetectionsFiltered[16 * v3] = v7;
    self->_faceDetectionsFilteredState[v3] = 0;
    *(_OWORD *)&self->_faceDetectionsRaw[16 * v3] = *(_OWORD *)&detectionsRaw[36 * v3 + 4].groupId;
    ++v3;
    detectionsRawCount = self->_detectionsRawCount;
  }
  while (v3 < detectionsRawCount);
  if ((int)detectionsRawCount <= 3)
  {
LABEL_9:
    v21 = 144 * (int)detectionsRawCount + 592;
    v22 = (int)detectionsRawCount + 332;
    do
    {
      *(_DWORD *)((char *)&self->super.isa + v21) = -1;
      *((_DWORD *)&self->super.isa + v22) = 3;
      v21 += 144;
    }
    while ((_DWORD)v22++ != 335);
  }
}

- (PTHumanDetection)detectionsRaw
{
  return self->_detectionsRaw;
}

- (PTHumanDetection)detectionsFiltered
{
  return self->_detectionsFiltered;
}

- (uint64_t)faceDetectionsRaw
{
  return a1 + 1168;
}

- (uint64_t)faceDetectionsFiltered
{
  return a1 + 1264;
}

- (int)faceDetectionsFilteredState:(BOOL)a3
{
  uint64_t i;
  int32x2_t v4;

  if (a3)
  {
    for (i = 0; i != 4; i += 2)
    {
      v4 = vceq_s32(*(int32x2_t *)&self->_faceDetectionsFilteredState[i], (int32x2_t)0x200000002);
      if ((v4.i8[0] & 1) != 0)
        self->_faceDetectionsFilteredState[i] = 1;
      if ((v4.i8[4] & 1) != 0)
        self->_faceDetectionsFilteredState[i + 1] = 1;
    }
  }
  return self->_faceDetectionsFilteredState;
}

void __38__PTHumanDetections_unpackDetections___block_invoke()
{
  NSObject *v0;

  _PTLogSystem();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __38__PTHumanDetections_unpackDetections___block_invoke_cold_1(v0);

}

- (void)filterDetections
{
  float32x4_t v2;
  uint64_t v3;
  PTHumanDetection *detectionsFiltered;
  uint64_t detectionsRawCount;
  uint64_t v6;
  PTHumanDetection *detectionsRaw;
  int8x16_t *v8;
  int8x16_t *v9;
  int8x16_t *v10;
  __int32 v11;
  __int32 v12;
  uint64_t v13;
  _DWORD *v14;
  int8x16_t v15;
  float32x2_t v16;
  float32x2_t v17;
  float32x2_t v18;
  float32x2_t v19;
  uint64_t i;
  PTHumanDetection *v21;
  PTHumanDetection *v22;
  int groupId_low;
  float32x2_t *v24;
  uint64_t v25;
  _DWORD *v26;
  float32x4_t v27;
  float32x4_t v28;
  float32x2_t v29;
  float v30;
  PTHumanDetection *v31;
  uint64_t v32;
  PTHumanDetection *v33;
  unsigned __int8 *faceDetectionsRaw;
  float32x4_t v35;
  float32x4_t v36;
  int v37;
  PTHumanDetection *v38;
  float *p_groupId;
  float v40;
  float v41;
  PTHumanDetection *v42;
  float *v43;
  float v44;
  float v45;
  PTHumanDetection *v46;
  float32x4_t *v47;
  float32x4_t v48;
  float32x4_t v49;
  int8x16_t v50;
  float deadzone;
  char v52;
  float32x2_t v53;
  __int128 v54;
  float32x2_t v55;
  int8x16_t v56;
  float32x2_t v57;
  float v58;
  float v59;
  char v60;
  char v61;
  float v62;
  float v63;
  float v64;
  float32x2_t v65;
  int8x16_t v66;
  uint64_t v67;
  float32x2_t v68;
  float32x4_t v69;
  float32x4_t *v70;
  float32x4_t v71;
  float32x4_t v72;
  float32x4_t v73;
  float32x4_t v74;
  char v75;
  char v76;
  char *v77;
  _BYTE *v78;
  int v79;
  uint64_t v80;
  float32x4_t v81;
  float32x2_t v82;
  float32x4_t v83;
  int8x16_t v84;
  float32x4_t *v85;
  float32x4_t v86;
  float32x4_t *v87;
  float32x4_t v88;
  float32x4_t v89;
  float v90;
  int8x16_t v91;
  int8x16_t v92;
  uint64_t v93;
  int8x16_t *v99;
  int8x16_t v100;
  float32x2_t v101;
  float32x2_t v102;
  float32x2_t v103;
  float v105;
  float v106;
  float v107;
  int v108;
  uint64_t j;
  PTHumanDetection *v110;
  uint64_t v111;
  float v112;
  int v113;
  float *v114;
  float v115;
  float v116;
  uint64_t v117;
  uint64_t v118;
  int8x16_t v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  int8x16_t v123;
  __int128 v124;
  char v125;
  char v126;
  PTHumanDetection *v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  int8x16_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  int8x16_t v135;
  int8x16_t v136;
  int8x16_t v137;
  __int128 v138;
  uint64_t v139;
  float32x2_t v140;
  int8x16_t v141;
  int8x16_t v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  _DWORD v150[4];
  uint64_t v151;

  v3 = 0;
  v151 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&self->_deadzone = 0x3F0000003DCCCCCDLL;
  self->_faceRectOverlapThreshold = 0.15;
  detectionsFiltered = self->_detectionsFiltered;
  do
  {
    self->_anon_260[v3 + 112] = 0;
    v3 += 144;
  }
  while (v3 != 576);
  detectionsRawCount = self->_detectionsRawCount;
  if ((int)detectionsRawCount >= 1)
  {
    v6 = 0;
    detectionsRaw = self->_detectionsRaw;
    do
    {
      v8 = (int8x16_t *)&detectionsRaw[36 * v6];
      v8[8].i8[0] = 0;
      v9 = v8 + 8;
      v12 = v8->i32[0];
      v10 = v8 + 1;
      v11 = v12;
      v13 = -576;
      v14 = v150;
      while (1)
      {
        if (v11 == *(_DWORD *)&self->_faceDetectionsRaw[v13]
          && *(float *)&self->_faceDetectionsFiltered[v13 + 36] > 0.0)
        {
          v15 = *(int8x16_t *)&self->_faceDetectionsRaw[v13 + 16];
          v16 = (float32x2_t)vextq_s8(*v10, *v10, 8uLL).u64[0];
          v17 = (float32x2_t)vextq_s8(v15, v15, 8uLL).u64[0];
          v18 = vsub_f32(vmla_f32(*(float32x2_t *)v10->i8, (float32x2_t)0x3F0000003F000000, v16), vmla_f32(*(float32x2_t *)v15.i8, (float32x2_t)0x3F0000003F000000, v17));
          *(float32x2_t *)v15.i8 = vsub_f32(0, v16);
          v19 = vsub_f32(0, v17);
          *(float *)v15.i32 = sqrtf(vaddv_f32(vmul_f32(v19, v19))) * 0.5
                            + sqrtf(vaddv_f32(vmul_f32(*(float32x2_t *)v15.i8, *(float32x2_t *)v15.i8))) * 0.5;
          if ((float)(sqrtf(vaddv_f32(vmul_f32(v18, v18))) / *(float *)v15.i32) < 1.5)
            break;
        }
        ++v14;
        v13 += 144;
        if (!v13)
          goto LABEL_12;
      }
      self->_faceDetectionsFiltered[v13 + 32] = 1;
      v9->i8[0] = 1;
      *v14 = v6;
LABEL_12:
      ++v6;
    }
    while (v6 != detectionsRawCount);
    for (i = 0; i != detectionsRawCount; ++i)
    {
      v21 = &detectionsRaw[36 * i];
      groupId_low = LOBYTE(v21[32].groupId);
      v22 = v21 + 32;
      if (!groupId_low)
      {
        v24 = (float32x2_t *)&detectionsRaw[36 * i + 4];
        v25 = -576;
        v26 = v150;
        while (1)
        {
          if (!self->_faceDetectionsFiltered[v25 + 32])
          {
            v27 = *(float32x4_t *)v24->f32;
            v28 = *(float32x4_t *)&self->_faceDetectionsRaw[v25 + 16];
            v29 = vmaxnm_f32(vsub_f32(vminnm_f32(vadd_f32(*v24, (float32x2_t)*(_OWORD *)&vextq_s8((int8x16_t)v27, (int8x16_t)v27, 8uLL)), vadd_f32(*(float32x2_t *)v28.f32, (float32x2_t)*(_OWORD *)&vextq_s8((int8x16_t)v28, (int8x16_t)v28, 8uLL))), vmaxnm_f32(*v24, *(float32x2_t *)v28.f32)), 0);
            v30 = vmul_lane_f32(v29, v29, 1).f32[0];
            if (v30 != 0.0
              && (float)(v30
                       / (float)(COERCE_FLOAT(vaddq_f32(vmulq_laneq_f32(v27, v27, 3), vmulq_laneq_f32(v28, v28, 3)).i32[2])
                               - v30)) > 0.15)
            {
              v31 = (PTHumanDetection *)((char *)self + v25);
              if (*(float *)&self->_faceDetectionsFiltered[v25 + 36] > 0.0)
                break;
            }
          }
          ++v26;
          v25 += 144;
          if (!v25)
            goto LABEL_21;
        }
        v31[292].groupId = (int)detectionsRaw[36 * i];
        LOBYTE(v31[324].groupId) = 1;
        LOBYTE(v22->groupId) = 1;
        *v26 = i;
      }
LABEL_21:
      ;
    }
  }
  v32 = 0;
  v33 = self->_detectionsRaw;
  faceDetectionsRaw = self->_faceDetectionsRaw;
  v35.i64[0] = 0x4000000040000000;
  v35.i64[1] = 0x4000000040000000;
  v36.i64[0] = 0x3F0000003F000000;
  v36.i64[1] = 0x3F0000003F000000;
  do
  {
    if (LOBYTE(detectionsFiltered[36 * v32 + 32].groupId))
    {
      v37 = v150[v32];
      if (v33[36 * v37].groupId == detectionsFiltered[36 * v32].groupId)
      {
        v38 = &detectionsFiltered[36 * v32];
        v40 = *(float *)&v38[33].groupId;
        p_groupId = (float *)&v38[33].groupId;
        v41 = v40;
        if (v40 > 0.0)
        {
          v42 = &v33[36 * v37];
          v44 = *(float *)&v42[20].groupId;
          v43 = (float *)&v42[20].groupId;
          v45 = v44;
          if (v44 > 250.0)
          {
            v46 = &detectionsFiltered[36 * v32];
            v48 = *(float32x4_t *)&v46[4].groupId;
            v47 = (float32x4_t *)&v46[4];
            v49 = v48;
            v50 = *(int8x16_t *)&v33[36 * v37 + 4].groupId;
            *(int8x16_t *)&faceDetectionsRaw[16 * v32] = v50;
            deadzone = self->_deadzone;
            if (deadzone > 0.0)
            {
              v52 = 0;
              v53 = (float32x2_t)vextq_s8((int8x16_t)v49, (int8x16_t)v49, 8uLL).u64[0];
              *(float32x2_t *)v49.f32 = vmla_f32(*(float32x2_t *)v49.f32, (float32x2_t)0x3F0000003F000000, v53);
              *(_QWORD *)&v54 = v49.i64[0];
              *((float32x2_t *)&v54 + 1) = v53;
              v55 = (float32x2_t)vextq_s8(v50, v50, 8uLL).u64[0];
              *(float32x2_t *)v56.i8 = vmla_f32(*(float32x2_t *)v50.i8, (float32x2_t)0x3F0000003F000000, v55);
              v56.u64[1] = (unint64_t)v55;
              v57 = vsub_f32(*(float32x2_t *)v56.i8, *(float32x2_t *)v49.f32);
              v58 = fabsf(*(float *)&detectionsFiltered[36 * v32 + 16].groupId);
              if (v58 <= 90.0)
                v59 = v58 / 90.0;
              else
                v59 = 1.0;
              *(float32x2_t *)v2.f32 = vmul_n_f32(v53, deadzone + (float)(v59 * (float)(self->_deadzoneMax - deadzone)));
              v60 = 1;
              do
              {
                v61 = v60;
                v140 = v57;
                v62 = *(float *)((unint64_t)&v140 & 0xFFFFFFFFFFFFFFFBLL | (4 * (v52 & 1)));
                v139 = v2.i64[0];
                v63 = *(float *)((unint64_t)&v139 & 0xFFFFFFFFFFFFFFFBLL | (4 * (v52 & 1)));
                if (v62 >= (float)-v63)
                {
                  if (v62 <= v63)
                  {
                    v138 = v54;
                    v64 = *(float *)((unint64_t)&v138 & 0xFFFFFFFFFFFFFFF3 | (4 * (v52 & 3)));
                  }
                  else
                  {
                    v137 = v56;
                    v64 = *(float *)((unint64_t)&v137 & 0xFFFFFFFFFFFFFFF3 | (4 * (v52 & 3))) - v63;
                  }
                }
                else
                {
                  v136 = v56;
                  v64 = *(float *)((unint64_t)&v136 & 0xFFFFFFFFFFFFFFF3 | (4 * (v52 & 3))) + v63;
                }
                v60 = 0;
                v135 = v56;
                *(float *)((unint64_t)&v135 & 0xFFFFFFFFFFFFFFF3 | (4 * (v52 & 3))) = v64;
                v52 = 1;
                v56 = v135;
              }
              while ((v61 & 1) != 0);
              v65 = (float32x2_t)vextq_s8(v135, v135, 8uLL).u64[0];
              *(float32x2_t *)v66.i8 = vmla_f32(*(float32x2_t *)v135.i8, (float32x2_t)0xBF000000BF000000, v65);
              v66.u64[1] = (unint64_t)v65;
              v50 = v66;
            }
            v67 = 0;
            v68 = (float32x2_t)vextq_s8(v50, v50, 8uLL).u64[0];
            *(float32x2_t *)v69.f32 = vmla_f32(*(float32x2_t *)v50.i8, (float32x2_t)0x3F0000003F000000, v68);
            *(float32x2_t *)&v69.u32[2] = v68;
            v70 = (float32x4_t *)&detectionsFiltered[36 * v32];
            v71 = vmlaq_f32(v70[2], (float32x4_t)xmmword_1C93437C0, vsubq_f32(v69, v70[2]));
            v72 = vmlaq_f32(v70[3], (float32x4_t)xmmword_1C93437C0, vsubq_f32(v71, v70[3]));
            v70[2] = v71;
            v70[3] = v72;
            v73 = vmlaq_f32(vnegq_f32(v72), v35, v71);
            v71.i64[0] = vextq_s8((int8x16_t)v73, (int8x16_t)v73, 8uLL).u64[0];
            *(float32x2_t *)v73.f32 = vmls_f32(*(float32x2_t *)v73.f32, (float32x2_t)0x3F0000003F000000, *(float32x2_t *)v71.f32);
            v73.i64[1] = v71.i64[0];
            *v47 = v73;
            v74 = vsubq_f32(v73, v73);
            v75 = 1;
            do
            {
              v76 = v75;
              v77 = (char *)&v33[36 * v37] + v67;
              v79 = v77[84];
              v78 = v77 + 84;
              if (v79 && *((_BYTE *)&detectionsFiltered[36 * v32 + 21].groupId + v67))
              {
                v80 = (uint64_t)&detectionsFiltered[36 * v32 + 4 * v67];
                v81 = *(float32x4_t *)(v80 + 96);
                v82 = (float32x2_t)vextq_s8((int8x16_t)v81, (int8x16_t)v81, 8uLL).u64[0];
                *(float32x2_t *)v81.f32 = vmla_f32(*(float32x2_t *)v81.f32, (float32x2_t)0x3F0000003F000000, v82);
                *(float32x2_t *)&v81.u32[2] = v82;
                v83 = *(float32x4_t *)&v33[36 * v37 + 24 + 4 * v67].groupId;
                v2 = (float32x4_t)vextq_s8((int8x16_t)v83, (int8x16_t)v83, 8uLL);
                *(float32x2_t *)v83.f32 = vmla_f32(*(float32x2_t *)v83.f32, (float32x2_t)0x3F0000003F000000, *(float32x2_t *)v2.f32);
                v83.i64[1] = v2.i64[0];
                v84 = (int8x16_t)vmlaq_f32(v81, v36, vsubq_f32(v83, v81));
                v83.i64[0] = vextq_s8(v84, v84, 8uLL).u64[0];
                *(float32x2_t *)v84.i8 = vmls_f32(*(float32x2_t *)v84.i8, (float32x2_t)0x3F0000003F000000, *(float32x2_t *)v83.f32);
                v84.i64[1] = v83.i64[0];
                *(int8x16_t *)(v80 + 96) = v84;
              }
              else
              {
                v85 = (float32x4_t *)&detectionsFiltered[36 * v32 + 4 * v67];
                v86.i64[0] = vaddq_f32(v74, v85[6]).u64[0];
                v86.i64[1] = v85[6].i64[1];
                v85[6] = v86;
              }
              v75 = 0;
              *((_BYTE *)&detectionsFiltered[36 * v32 + 21].groupId + v67) = *v78;
              v67 = 1;
            }
            while ((v76 & 1) != 0);
            v87 = (float32x4_t *)&detectionsFiltered[36 * v32];
            v88 = v87[4];
            v89 = *(float32x4_t *)&v33[36 * v37 + 16].groupId;
            LODWORD(v90) = vsubq_f32(v88, v89).u32[0];
            v2.f32[0] = fabsf(v90);
            v49.i32[0] = 1119092736;
            v2 = (float32x4_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vcgtq_f32(v2, v49), 0);
            v91 = (int8x16_t)v88;
            v88.i32[0] = v89.i32[0];
            v91.i32[0] = vmlas_n_f32(v89.f32[0], 0.3, v90);
            v92 = vbslq_s8((int8x16_t)v2, (int8x16_t)v88, v91);
            v87[4].i32[2] = v92.i32[2];
            v87[4].i64[0] = v92.i64[0];
            v41 = *p_groupId;
            v45 = *v43;
          }
          *p_groupId = fminf(v41 + 0.1, 2.0);
          *(float *)&detectionsFiltered[36 * v32 + 20].groupId = v45
                                                               + (float)((float)(*(float *)&detectionsFiltered[36 * v32 + 20].groupId
                                                                               - v45)
                                                                       * 0.5);
        }
      }
    }
    ++v32;
  }
  while (v32 != 4);
  v93 = 0;
  __asm { FMOV            V1.2S, #1.0 }
  do
  {
    v99 = (int8x16_t *)((char *)self + v93);
    if (!self->_anon_260[v93 + 112])
    {
      v100 = v99[38];
      v101 = (float32x2_t)vextq_s8(v100, v100, 8uLL).u64[0];
      *(float32x2_t *)v100.i8 = vmla_f32(*(float32x2_t *)v100.i8, (float32x2_t)0x3F0000003F000000, v101);
      v102 = vminnm_f32(*(float32x2_t *)v100.i8, vsub_f32(_D1, *(float32x2_t *)v100.i8));
      v103 = vsub_f32(v102, vmul_f32(v101, (float32x2_t)0x3F0000003F000000));
      if (v103.f32[0] >= v103.f32[1])
        v103.f32[0] = v103.f32[1];
      if (v102.f32[0] >= v102.f32[1])
        v102.f32[0] = v102.f32[1];
      if (v102.f32[0] >= 0.2 || v103.f32[0] > 0.05)
        v105 = 0.01;
      else
        v105 = 0.1;
      v106 = *(float *)&v99[45].i32[1] - v105;
      if (v106 < 0.0)
        v106 = 0.0;
      *(float *)&v99[45].i32[1] = v106;
      v107 = *(float *)v99[42].i32 - v105;
      if (v107 < 0.0)
        v107 = 0.0;
      *(float *)v99[42].i32 = v107;
    }
    v93 += 144;
  }
  while (v93 != 576);
  v108 = self->_detectionsRawCount;
  if (v108 >= 1)
  {
    for (j = 0; j < v108; ++j)
    {
      v110 = &v33[36 * j];
      if (!LOBYTE(v110[32].groupId))
      {
        v111 = 0;
        v112 = 2.0;
        v113 = -1;
        v114 = (float *)&self->_anon_260[116];
        do
        {
          v115 = *v114;
          v114 += 36;
          v116 = v115;
          if (v115 < v112)
          {
            v112 = v116;
            v113 = v111;
          }
          ++v111;
        }
        while (v111 != 4);
        v117 = 0;
        v118 = v113;
        v119 = *(int8x16_t *)&v110->groupId;
        v123 = *(int8x16_t *)&v110[4].groupId;
        v120 = *(_OWORD *)&v110[32].groupId;
        v121 = *(_OWORD *)&v110[24].groupId;
        v148 = *(_OWORD *)&v110[28].groupId;
        v149 = v120;
        v122 = *(_OWORD *)&v110[16].groupId;
        v146 = *(_OWORD *)&v110[20].groupId;
        v147 = v121;
        v145 = v122;
        v141 = v119;
        v142 = v123;
        v119.i64[0] = vextq_s8(v123, v123, 8uLL).u64[0];
        *(float32x2_t *)v123.i8 = vmla_f32(*(float32x2_t *)v123.i8, (float32x2_t)0x3F0000003F000000, *(float32x2_t *)v119.i8);
        *(_QWORD *)&v124 = v123.i64[0];
        *((_QWORD *)&v124 + 1) = v119.i64[0];
        v143 = v124;
        v144 = v124;
        DWORD1(v149) = 1036831949;
        v125 = 1;
        do
        {
          v126 = v125;
          if (!*((_BYTE *)&v146 + v117 + 4))
            *(&v147 + v117) = (__int128)v123;
          v125 = 0;
          v117 = 1;
        }
        while ((v126 & 1) != 0);
        v127 = &detectionsFiltered[36 * (int)v118];
        v128 = v148;
        *(_OWORD *)&v127[24].groupId = v147;
        *(_OWORD *)&v127[28].groupId = v128;
        *(_OWORD *)&v127[32].groupId = v149;
        v129 = v144;
        *(_OWORD *)&v127[8].groupId = v143;
        *(_OWORD *)&v127[12].groupId = v129;
        v130 = v146;
        *(_OWORD *)&v127[16].groupId = v145;
        *(_OWORD *)&v127[20].groupId = v130;
        v131 = v142;
        *(int8x16_t *)&v127->groupId = v141;
        *(int8x16_t *)&v127[4].groupId = v131;
        LOBYTE(v127[32].groupId) = 1;
        *(_OWORD *)&faceDetectionsRaw[16 * v118] = *(_OWORD *)&v33[36 * j + 4].groupId;
        v108 = self->_detectionsRawCount;
      }
    }
  }
  v132 = 0;
  v133 = 1328;
  v134 = 1264;
  do
  {
    *(_OWORD *)((char *)&self->super.isa + v134) = *(_OWORD *)&self->_anon_260[v132];
    if (*(float *)&self->_anon_260[v132 + 116] == 0.0)
    {
      *(_DWORD *)((char *)&self->super.isa + v133) = 3;
    }
    else if (self->_anon_260[v132 + 112])
    {
      *(_DWORD *)((char *)&self->super.isa + v133) = fabsf(*(float *)&self->_anon_260[v132 + 48]) >= 22.5;
    }
    else
    {
      *(_DWORD *)((char *)&self->super.isa + v133) = 2;
    }
    v133 += 4;
    v134 += 16;
    v132 += 144;
  }
  while (v132 != 576);
}

- (void)reset
{
  uint64_t i;
  char *v4;

  self->_detectionsRawCount = 0;
  memset_pattern16(self->_faceDetectionsFilteredState, &unk_1C93437D0, 0x10uLL);
  for (i = 0; i != 576; i += 144)
  {
    v4 = (char *)self + i;
    *((_DWORD *)v4 + 181) = 0;
    *((_DWORD *)v4 + 168) = 0;
    v4[720] = 0;
  }
}

- (void)renderDebugRects:(id)a3 outTexture:(id)a4 debugFaceRects:(BOOL)a5
{
  id v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  PTHumanDetection *v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64x2_t v18;
  uint64x2_t v19;
  uint64_t v20;
  PTHumanDetection *detectionsFiltered;
  uint64_t v27;
  PTHumanDetection *v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64x2_t v35;
  uint64x2_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64x2_t v39;
  double v43;
  __int128 v47;
  __int128 v48;
  double v49;
  id v50;
  float32x4_t v51;
  float32x4_t v52;
  int32x2_t v53;
  int32x2_t v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v50 = a3;
  v7 = a4;
  if (self->_detectionsRawCount >= 1)
  {
    v9 = 0;
    do
    {
      v10 = 0;
      v11 = &self->_detectionsRaw[36 * v9];
      v12 = *(_OWORD *)&v11[24].groupId;
      v13 = *(_OWORD *)&v11[28].groupId;
      v55 = *(_OWORD *)&v11[4].groupId;
      v56 = v12;
      v57 = v13;
      do
      {
        v51 = *(float32x4_t *)((char *)&v55 + v10);
        v14 = objc_msgSend(v7, "width");
        v15 = objc_msgSend(v7, "height");
        v16 = objc_msgSend(v7, "width");
        v17 = objc_msgSend(v7, "height");
        v18.i64[0] = v16;
        v18.i64[1] = v17;
        v19.i64[0] = v14;
        v19.i64[1] = v15;
        -[PTUtil renderRect:rect:color:fill:outTexture:](self->_util, "renderRect:rect:color:fill:outTexture:", v50, 0, v7, *(double *)vcvtq_s32_f32(vmulq_f32(v51, vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vcvtq_f64_u64(v19)), vcvtq_f64_u64(v18)))).i64, 0.0000305175853);
        v10 += 16;
      }
      while (v10 != 48);
      ++v9;
    }
    while (v9 < self->_detectionsRawCount);
  }
  v20 = 0;
  detectionsFiltered = self->_detectionsFiltered;
  __asm { FMOV            V1.4S, #1.0 }
  *(_QWORD *)&v8 = 0x1000000080;
  v47 = v8;
  v49 = *(double *)&_Q1;
  do
  {
    if (*(float *)&detectionsFiltered[36 * v20 + 33].groupId > 0.0)
    {
      v27 = 0;
      v28 = &detectionsFiltered[36 * v20];
      v29 = *(_OWORD *)&v28[24].groupId;
      v30 = *(_OWORD *)&v28[28].groupId;
      v48 = *(_OWORD *)&v28[4].groupId;
      v55 = v48;
      v56 = v29;
      v57 = v30;
      do
      {
        v52 = *(float32x4_t *)((char *)&v55 + v27);
        v31 = objc_msgSend(v7, "width", v47);
        v32 = objc_msgSend(v7, "height");
        v33 = objc_msgSend(v7, "width");
        v34 = objc_msgSend(v7, "height");
        v35.i64[0] = v33;
        v35.i64[1] = v34;
        v36.i64[0] = v31;
        v36.i64[1] = v32;
        -[PTUtil renderRect:rect:color:fill:outTexture:](self->_util, "renderRect:rect:color:fill:outTexture:", v50, 0, v7, *(double *)vcvtq_s32_f32(vmulq_f32(v52, vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vcvtq_f64_u64(v36)), vcvtq_f64_u64(v35)))).i64, v49);
        v27 += 16;
      }
      while (v27 != 48);
      v37 = objc_msgSend(v7, "width");
      v38 = objc_msgSend(v7, "height");
      v39.i64[0] = v37;
      v39.i64[1] = v38;
      v53 = vcvt_s32_f32(vmul_f32(*(float32x2_t *)&v48, vcvt_f32_f64(vcvtq_f64_u64(v39))));
      -[PTUtil renderRect:rect:color:fill:outTexture:](self->_util, "renderRect:rect:color:fill:outTexture:", v50, 0, v7, *(double *)&v53, v49);
      -[PTUtil renderRect:rect:color:fill:outTexture:](self->_util, "renderRect:rect:color:fill:outTexture:", v50, 1, v7, COERCE_DOUBLE(vadd_s32(v53, (int32x2_t)0x200000002)), v49);
      LODWORD(v37) = (int)(float)((float)(unint64_t)objc_msgSend(v7, "width") * *(float *)&v48);
      _S0 = (float)(unint64_t)objc_msgSend(v7, "height");
      _V2.S[1] = DWORD1(v48);
      __asm { FMLA            S1, S0, V2.S[1] }
      LODWORD(v43) = v37;
      HIDWORD(v43) = (int)_S1;
      -[PTUtil renderRect:rect:color:fill:outTexture:](self->_util, "renderRect:rect:color:fill:outTexture:", v50, 0, v7, v43, v49);
      *(float *)v53.i32 = (float)(unint64_t)objc_msgSend(v7, "width") * *(float *)&v48;
      _S0 = (float)(unint64_t)objc_msgSend(v7, "height");
      _V2.S[1] = DWORD1(v48);
      __asm { FMLA            S1, S0, V2.S[1] }
      v54 = vcvt_s32_f32((float32x2_t)__PAIR64__(_S1, v53.u32[0]));
      -[PTUtil renderRect:rect:color:fill:outTexture:](self->_util, "renderRect:rect:color:fill:outTexture:", v50, 0, v7, *(double *)&v54, v49);
      -[PTUtil renderRect:rect:color:fill:outTexture:](self->_util, "renderRect:rect:color:fill:outTexture:", v50, 1, v7, COERCE_DOUBLE(vadd_s32(v54, (int32x2_t)0x200000002)), v49);
    }
    ++v20;
  }
  while (v20 != 4);

}

- (id)detectionDescription:(PTHumanDetection)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("groupId: %i rect: %.1f %.1f %.1f %.1f det: %i conf: %.2f"), **(unsigned int **)&a3.groupId, *(float *)(*(_QWORD *)&a3.groupId + 16), *(float *)(*(_QWORD *)&a3.groupId + 20), *(float *)(*(_QWORD *)&a3.groupId + 24), *(float *)(*(_QWORD *)&a3.groupId + 28), *(unsigned __int8 *)(*(_QWORD *)&a3.groupId + 128), *(float *)(*(_QWORD *)&a3.groupId + 132));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_util, 0);
}

- (void)initWithMetalContext:(os_log_t)log .cold.1(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 136315138;
  v2 = "_util";
  _os_log_error_impl(&dword_1C9281000, log, OS_LOG_TYPE_ERROR, "Assertion failed %s", (uint8_t *)&v1, 0xCu);
}

void __38__PTHumanDetections_unpackDetections___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1C9281000, log, OS_LOG_TYPE_ERROR, "GroupID / FaceID not found but was expected.", v1, 2u);
}

@end
