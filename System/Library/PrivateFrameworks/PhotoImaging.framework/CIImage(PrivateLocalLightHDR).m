@implementation CIImage(PrivateLocalLightHDR)

- (id)localLightHDRStatisticsNoProxy
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  double x;
  double y;
  double width;
  double height;
  double v11;
  unint64_t v12;
  double v13;
  unint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  double v29;
  double v30;
  double v31;
  unint64_t v32;
  _BYTE *v33;
  _BYTE *v34;
  uint64_t v35;
  unsigned int v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  double v41;
  uint64_t v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  void *v47;
  id v49;
  void *v50;
  void *v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  unint64_t v58;
  _QWORD v59[5];
  _QWORD v60[5];
  _BYTE v61[76880];
  _QWORD v62[2];
  _QWORD v63[2];
  _QWORD v64[258];
  CGRect v65;
  CGRect v66;

  v0 = (void *)MEMORY[0x1E0C80A78]();
  v64[256] = *MEMORY[0x1E0C80C00];
  v1 = (void *)MEMORY[0x1E0C9DD90];
  v2 = *MEMORY[0x1E0C9DF88];
  v62[0] = *MEMORY[0x1E0C9DF58];
  v62[1] = v2;
  v63[0] = MEMORY[0x1E0C9AAA0];
  v63[1] = CFSTR("PILocalLightHDR-stats");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v63, v62, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "contextWithOptions:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = v0;
  v6 = v4;
  objc_msgSend(v5, "extent");
  v66 = CGRectIntegral(v65);
  x = v66.origin.x;
  y = v66.origin.y;
  width = v66.size.width;
  height = v66.size.height;
  objc_msgSend(v5, "extent");
  v12 = (unint64_t)v11;
  objc_msgSend(v5, "extent");
  v14 = (unint64_t)v13;
  v15 = 4 * v12;
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", 4 * v12 * (unint64_t)v13);
  v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v17 = objc_msgSend(v16, "bytes");
  v49 = objc_retainAutorelease(v16);
  v18 = objc_msgSend(v49, "mutableBytes");
  v50 = v5;
  v51 = v6;
  objc_msgSend(v6, "render:toBitmap:rowBytes:bounds:format:colorSpace:", v5, v18, 4 * v12, *MEMORY[0x1E0C9E070], 0, x, y, width, height);
  v19 = 0;
  v20 = 0;
  LODWORD(v21) = 0;
  v22 = vcvtas_u32_f32((float)v14 / 31.0);
  v57 = v12 - 1;
  v58 = vcvtas_u32_f32((float)v12 / 31.0);
  v23 = v17 + 2;
  v52 = 4 * v12 * v22;
  v53 = v22;
  do
  {
    v24 = 0;
    v55 = v20;
    v56 = v19;
    v25 = v20 * v22;
    if (v20 * v22 + v22 <= v14 - 1)
      v26 = v20 * v22 + v22;
    else
      v26 = v14;
    v21 = (int)v21;
    v27 = v26 + v19;
    v54 = v23;
    do
    {
      v28 = v24 * v58;
      bzero(v64, 0x800uLL);
      v32 = v24 * v58 + v58;
      if (v32 >= v57)
        v32 = v57;
      if (v32 > v28)
      {
        v33 = (_BYTE *)v23;
        do
        {
          v34 = v33;
          v35 = v27;
          if (v26 > v25)
          {
            do
            {
              LOBYTE(v29) = *(v34 - 2);
              LOBYTE(v30) = *(v34 - 1);
              v30 = (double)*(unint64_t *)&v30 / 255.0;
              LOBYTE(v31) = *v34;
              v31 = (double)*(unint64_t *)&v31 / 255.0;
              v36 = llround(((double)*(unint64_t *)&v29 / 255.0 + v30 + v31) / 3.0 * 255.0);
              v29 = 1.0 / (double)(v32 * v26) + *(double *)&v64[v36];
              *(double *)&v64[v36] = v29;
              v34 += v15;
              --v35;
            }
            while (v35);
          }
          ++v28;
          v33 += 4;
        }
        while (v28 != v32);
      }
      area_light_stats_from_histogram((uint64_t)v64, (uint64_t)&v61[80 * v21++]);
      ++v24;
      v23 += 4 * v58;
    }
    while (v24 != 31);
    v20 = v55 + 1;
    v22 = v53;
    v19 = v56 - v53;
    v23 = v54 + v52;
  }
  while (v55 != 30);

  v37 = 961;
  arealight_coeffs_from_stats((uint64_t)v61, 961);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  average_light_coeffs_from_stats((uint64_t)v61, 0x3C1uLL);
  v39 = objc_claimAutoreleasedReturnValue();
  v40 = (void *)v39;
  v41 = 0.0;
  v42 = 56;
  v43 = 0.0;
  do
  {
    v44 = *(double *)&v61[v42];
    if (v44 > v43)
      v43 = *(double *)&v61[v42];
    v41 = v41 + v44;
    v42 += 80;
    --v37;
  }
  while (v37);
  if (v43 + v41 / -961.0 <= 0.5)
    v45 = v43;
  else
    v45 = v43 * 0.45;
  v59[0] = CFSTR("lightMap");
  v59[1] = CFSTR("lightMapWidth");
  v60[0] = v38;
  v60[1] = &unk_1E50514F0;
  v59[2] = CFSTR("lightMapHeight");
  v59[3] = CFSTR("lightMapAvg");
  v60[2] = &unk_1E50514F0;
  v60[3] = v39;
  v59[4] = CFSTR("localAutoValue");
  if (fabs(v45) < 1.0e-10)
    v45 = 0.0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v60[4] = v46;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v60, v59, 5);
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  return v47;
}

@end
