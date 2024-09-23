@implementation CIImage(PrivateSmartToneHDR)

- (id)smartToneHDRStatistics
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  double x;
  double y;
  double width;
  double height;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  double v29;
  unsigned __int8 *v30;
  unsigned __int8 *v31;
  unint64_t v32;
  uint64_t v33;
  int v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v46;
  void *v47;
  id v48;
  void *v49;
  void *context;
  void *contexta;
  void *v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint64_t v58;
  _QWORD v59[10];
  _QWORD v60[10];
  double v61[512];
  _QWORD v62[5];
  _QWORD v63[5];
  _QWORD v64[2];
  _QWORD v65[4];
  CGRect v66;
  CGRect v67;

  v1 = (void *)MEMORY[0x1E0C80A78](a1);
  v65[2] = *MEMORY[0x1E0C80C00];
  v58 = 0;
  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v53 = 0u;
  objc_msgSend(v1, "properties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
    NSLog(CFSTR("Warning smartToneStatistics will soon need [receiver properties] be non-nil so flash-fired state can be determined."));
  objc_msgSend(v1, "properties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKey:", *MEMORY[0x1E0CBCB50]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForKey:", *MEMORY[0x1E0CBCB88]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = 1.0;
  if (v5)
  {
    if ((objc_msgSend(v5, "intValue") & 1) != 0)
      v6 = 0.6;
    else
      v6 = 1.0;
  }
  v52 = v5;
  context = (void *)MEMORY[0x1A85BFFB8]();
  v7 = (void *)MEMORY[0x1E0C9DD90];
  v64[0] = *MEMORY[0x1E0C9DFC8];
  v8 = (void *)MEMORY[0x1E0CB37E8];
  v9 = *MEMORY[0x1E0C9E080];
  v10 = v1;
  objc_msgSend(v8, "numberWithInt:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v64[1] = *MEMORY[0x1E0C9DF88];
  v65[0] = v11;
  v65[1] = CFSTR("PISmartToneFilterHDR-histogram");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v65, v64, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contextWithOptions:", v12);
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "extent");
  v67 = CGRectIntegral(v66);
  x = v67.origin.x;
  y = v67.origin.y;
  width = v67.size.width;
  height = v67.size.height;
  v17 = (unint64_t)v67.size.width;
  v18 = (unint64_t)v67.size.height;
  v19 = 4 * (unint64_t)v67.size.width;
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", v19 * (unint64_t)v67.size.height);
  v48 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v46 = objc_msgSend(v48, "bytes");
  v62[0] = CFSTR("inputRVector");
  objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:Z:W:", 0.333333333, 0.333333333, 0.333333333, 0.0);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v63[0] = v47;
  v62[1] = CFSTR("inputGVector");
  objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:Z:W:", 0.166666667, 0.166666667, 0.166666667, 0.0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v63[1] = v20;
  v62[2] = CFSTR("inputBVector");
  objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:Z:W:", -1.0, -1.0, -1.0, 0.0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v63[2] = v21;
  v62[3] = CFSTR("inputAVector");
  objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:Z:W:", 0.0, 0.0, 0.0, 1.0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v63[3] = v22;
  v62[4] = CFSTR("inputBiasVector");
  objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:Z:W:", 0.0, 0.0, 0.0, 0.0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v63[4] = v23;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v63, v62, 5);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "imageByApplyingFilter:withInputParameters:", CFSTR("CIColorMatrix"), v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = objc_retainAutorelease(v48);
  v27 = objc_msgSend(v26, "mutableBytes");
  objc_msgSend(v49, "render:toBitmap:rowBytes:bounds:format:colorSpace:", v25, v27, v19, *MEMORY[0x1E0C9E070], 0, x, y, width, height);
  bzero(v61, 0x1000uLL);
  if (v18)
  {
    v28 = 0;
    v29 = 1.0 / (double)(v18 * v17);
    v30 = (unsigned __int8 *)(v46 + 2);
    while (1)
    {
      v31 = v30;
      v32 = v17;
      if (v17)
        break;
LABEL_17:
      ++v28;
      v30 += v19;
      if (v28 == v18)
        goto LABEL_18;
    }
    while (1)
    {
      v33 = *v31;
      v34 = (char)*(v31 - 1);
      v61[*(v31 - 2)] = v29 + v61[*(v31 - 2)];
      if (v34 < 0)
        break;
      if ((_DWORD)v33)
        goto LABEL_12;
LABEL_13:
      v31 += 4;
      if (!--v32)
        goto LABEL_17;
    }
    v61[2 * v34] = v29 + v61[2 * v34];
    if (!(_DWORD)v33)
      goto LABEL_13;
LABEL_12:
    v61[v33 + 255] = v29 + v61[v33 + 255];
    goto LABEL_13;
  }
LABEL_18:

  objc_autoreleasePoolPop(context);
  smart_tone_stats_from_histogram((uint64_t)v61, 0x100uLL, 256, (uint64_t)&v53);
  v59[0] = CFSTR("tonalRange");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)&v53);
  contexta = (void *)objc_claimAutoreleasedReturnValue();
  v60[0] = contexta;
  v59[1] = CFSTR("highKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *((double *)&v53 + 1));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v60[1] = v35;
  v59[2] = CFSTR("p02");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)&v54);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v60[2] = v36;
  v59[3] = CFSTR("p10");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *((double *)&v54 + 1));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v60[3] = v37;
  v59[4] = CFSTR("p25");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)&v55);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v60[4] = v38;
  v59[5] = CFSTR("p50");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *((double *)&v55 + 1));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v60[5] = v39;
  v59[6] = CFSTR("p98");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)&v56);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v60[6] = v40;
  v59[7] = CFSTR("autoValue");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v6 * *((double *)&v56 + 1));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v60[7] = v41;
  v59[8] = CFSTR("blackPoint");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)&v57);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v60[8] = v42;
  v59[9] = CFSTR("whitePoint");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *((double *)&v57 + 1));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v60[9] = v43;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v60, v59, 10);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  return v44;
}

@end
