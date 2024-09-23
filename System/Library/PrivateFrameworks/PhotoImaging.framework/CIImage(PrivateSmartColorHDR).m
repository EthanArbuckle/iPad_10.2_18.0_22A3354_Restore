@implementation CIImage(PrivateSmartColorHDR)

- (id)smartColorHDRStatistics
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  double v22;
  double v23;
  uint64_t v24;
  float v25;
  _BYTE *v26;
  _BYTE *v27;
  unint64_t i;
  double v29;
  double v30;
  double v31;
  double v32;
  unsigned int v33;
  unsigned int v34;
  unsigned int v35;
  unsigned int v36;
  uint64_t v37;
  float32x4_t v43;
  float32x4_t v44;
  uint64_t v45;
  int v46;
  int v47;
  uint64_t v48;
  float v49;
  float v50;
  unint64_t v51;
  float v52;
  float v53;
  float v54;
  uint64_t v55;
  float v56;
  float v57;
  float v58;
  BOOL v59;
  float v60;
  float v61;
  void *v62;
  double v63;
  void *v64;
  double v65;
  void *v66;
  double v67;
  void *v68;
  void *v69;
  _QWORD v71[2];
  id v72;
  id v73;
  void *context;
  id v75;
  _QWORD v76[4];
  _QWORD v77[4];
  _BYTE v78[1024];
  _BYTE v79[1024];
  float v80[256];
  float v81[256];
  _QWORD v82[2];
  _QWORD v83[2];
  _BYTE v84[1024];
  _BYTE v85[1024];
  uint64_t v86;

  v0 = (void *)MEMORY[0x1E0C80A78]();
  v86 = *MEMORY[0x1E0C80C00];
  v1 = v0;
  context = (void *)MEMORY[0x1A85BFFB8]();
  v2 = (void *)MEMORY[0x1E0C9DD90];
  v82[0] = *MEMORY[0x1E0C9DFC8];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *MEMORY[0x1E0C9E080]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v82[1] = *MEMORY[0x1E0C9DF88];
  v83[0] = v3;
  v83[1] = CFSTR("PISmartColorHDR-sat-histogram");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v83, v82, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contextWithOptions:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v1, "extent");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v14 = (unint64_t)v10;
  v15 = (unint64_t)v12;
  v16 = 4 * (unint64_t)v10;
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", v16 * (unint64_t)v12);
  v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v18 = objc_msgSend(v17, "bytes");
  v72 = objc_retainAutorelease(v17);
  v19 = objc_msgSend(v72, "mutableBytes");
  v20 = *MEMORY[0x1E0C9E070];
  v73 = v5;
  v75 = v1;
  objc_msgSend(v5, "render:toBitmap:rowBytes:bounds:format:colorSpace:", v1, v19, v16, v20, 0, v7, v9, v11, v13);
  bzero(v79, 0x400uLL);
  bzero(v78, 0x400uLL);
  v71[1] = v71;
  bzero(v85, 0x400uLL);
  bzero(v84, 0x400uLL);
  bzero(v81, 0x400uLL);
  bzero(v80, 0x400uLL);
  if (v15)
  {
    v24 = 0;
    v25 = 1.0 / (float)(v15 * v14);
    v26 = (_BYTE *)(v18 + 2);
    do
    {
      v27 = v26;
      for (i = v14; i; --i)
      {
        LOBYTE(v21) = *(v27 - 2);
        LOBYTE(v22) = *(v27 - 1);
        v29 = (double)*(unint64_t *)&v21 / 255.0;
        v30 = (double)*(unint64_t *)&v22 / 255.0;
        LOBYTE(v23) = *v27;
        v31 = (double)*(unint64_t *)&v23 / 255.0;
        v32 = (v29 + v30 + v31) / 3.0;
        v21 = v29 * 255.0;
        v33 = llround(v21);
        v22 = v30 * 255.0;
        v34 = llround(v22);
        *(float *)&v22 = v25 + *(float *)&v84[4 * v34];
        v35 = llround(v31 * 255.0);
        *(float *)&v85[4 * v33] = v25 + *(float *)&v85[4 * v33];
        *(float *)&v21 = v25 + v81[v35];
        v23 = v32 * 255.0;
        *(_DWORD *)&v84[4 * v34] = LODWORD(v22);
        v36 = llround(v32 * 255.0);
        *(float *)&v22 = v80[v36];
        v81[v35] = *(float *)&v21;
        *(float *)&v21 = v25 + *(float *)&v22;
        v80[v36] = v25 + *(float *)&v22;
        v27 += 4;
      }
      ++v24;
      v26 += v16;
    }
    while (v24 != v15);
  }
  v37 = 0;
  __asm { FMOV            V1.4S, #1.0 }
  do
  {
    v43 = *(float32x4_t *)&v80[v37];
    v44 = vabdq_f32(*(float32x4_t *)&v84[v37 * 4], v43);
    *(float32x4_t *)&v79[v37 * 4] = vminnmq_f32(vmaxnmq_f32(vaddq_f32(vaddq_f32(vabdq_f32(*(float32x4_t *)&v85[v37 * 4], v43), v44), vabdq_f32(*(float32x4_t *)&v81[v37], v43)), (float32x4_t)0), _Q1);
    *(float32x4_t *)&v78[v37 * 4] = v44;
    v37 += 4;
  }
  while (v37 != 256);

  objc_autoreleasePoolPop(context);
  v45 = 0;
  v46 = 71362;
  v47 = 71362;
  do
  {
    *(float *)&v47 = *(float *)&v47 + *(float *)&v79[v45];
    *(float *)&v46 = *(float *)&v46 + *(float *)&v78[v45];
    v45 += 4;
  }
  while (v45 != 1024);
  v48 = 0;
  v49 = 0.0;
  v50 = 0.0;
  do
  {
    v50 = v50 + *(float *)&v79[v48];
    *(float *)&v85[v48] = v50 / *(float *)&v47;
    v49 = v49 + *(float *)&v78[v48];
    *(float *)&v84[v48] = v49 / *(float *)&v46;
    v48 += 4;
  }
  while (v48 != 1024);
  v51 = 0;
  v52 = 0.0;
  v53 = 0.0;
  do
  {
    v54 = *(float *)&v85[4 * v51];
    if (v54 >= 0.75 && v52 == 0.0)
      v52 = (float)v51 / 255.0;
    if (v54 >= 0.98 && v53 == 0.0)
      v53 = (float)v51 / 255.0;
    ++v51;
  }
  while (v51 != 256);
  v55 = 0;
  v56 = 0.0;
  do
  {
    if (*(float *)&v84[4 * v55] >= 0.98 && v56 == 0.0)
      v56 = (float)(int)v55 / 255.0;
    ++v55;
  }
  while (v55 != 256);
  v57 = 1.0;
  v58 = fmaxf(fminf(1.0 - v53, 1.0), 0.0);
  v59 = v52 >= 0.9 || v53 < 0.99;
  v60 = vabds_f32(0.5, v52);
  if (!v59)
    v58 = v60;
  if (v56 >= v53)
    v57 = 2.0;
  v61 = fminf(v58 * v57, 0.2);
  v76[0] = CFSTR("satPercentile75");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v77[0] = v62;
  v76[1] = CFSTR("satPercentile98");
  *(float *)&v63 = v53;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v63);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v77[1] = v64;
  v76[2] = CFSTR("satPercentileG98");
  *(float *)&v65 = v56;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v65);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v77[2] = v66;
  v76[3] = CFSTR("satAutoValue");
  *(float *)&v67 = v61;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v67);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v77[3] = v68;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v77, v76, 4);
  v69 = (void *)objc_claimAutoreleasedReturnValue();

  return v69;
}

@end
