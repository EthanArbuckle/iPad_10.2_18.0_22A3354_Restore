@implementation OUObjectCompleteness

- (uint64_t)isPointInCameraView:(simd_float4)a3 cameraPose:(simd_float4)a4 camera:(simd_float4)a5 marginRatio:(float)a6
{
  id v10;
  float v11;
  float v12;
  float32x2_t v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  float v19;
  double v20;
  float v21;
  float v22;
  float v23;
  double v24;
  BOOL v25;
  double v26;
  uint64_t v27;
  simd_float4x4 v29;
  float v30;
  float32x2_t v31;
  float v32;
  float v33;
  float32x4_t v35;
  simd_float4x4 v36;

  v29.columns[2] = a4;
  v29.columns[3] = a5;
  v29.columns[0] = a2;
  v29.columns[1] = a3;
  v10 = a9;
  v36 = __invert_f4(v29);
  v35 = vaddq_f32((float32x4_t)v36.columns[3], vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v36.columns[0], a1.f32[0]), (float32x4_t)v36.columns[1], *(float32x2_t *)a1.f32, 1), (float32x4_t)v36.columns[2], a1, 2));
  if (v35.f32[2] <= 0.01)
    goto LABEL_9;
  objc_msgSend(v10, "intrinsics");
  v33 = v11;
  objc_msgSend(v10, "intrinsics");
  v32 = v12;
  objc_msgSend(v10, "intrinsics");
  v31 = v13;
  objc_msgSend(v10, "intrinsics");
  objc_msgSend(v10, "imageResolution", v14);
  v16 = v15;
  objc_msgSend(v10, "imageResolution");
  v18 = v17;
  v19 = (float)(vmuls_n_f32(v35.f32[0], v33) / v35.f32[2]) + v32;
  v20 = a6;
  v21 = v16 * a6;
  if (v19 < v21)
    goto LABEL_9;
  objc_msgSend(v10, "imageResolution");
  v22 = (float)(vmuls_lane_f32(v35.f32[1], v31, 1) / v35.f32[2]) + v30;
  v23 = v18 * v20;
  v25 = v24 - v21 <= v19 || v22 < v23;
  if (v25 || (objc_msgSend(v10, "imageResolution"), v26 - v23 <= v22))
LABEL_9:
    v27 = 0;
  else
    v27 = 1;

  return v27;
}

- (void)updateRawCornersStatusNoTimer:(float32x4_t)a3 withOldObjects:(float32x4_t)a4 cameraPose:(double)a5 camera:(uint64_t)a6
{
  id v11;
  unint64_t v12;
  float v13;
  int32x4_t v14;
  int32x4_t v15;
  int32x4_t v16;
  int32x4_t v17;
  __float2 v18;
  uint64_t v19;
  int32x4_t v20;
  float32x2x2_t v21;
  float32x4_t v22;
  float32x4_t v23;
  float *v24;
  uint64_t v25;
  unint64_t i;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  double v40;
  uint64_t j;
  uint64_t v42;
  unint64_t v43;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  void *v50;
  uint64_t k;
  void *v52;
  void *v53;
  void *v54;
  int v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v61;
  id v62;
  void *v63;
  id v64;
  unint64_t v65;
  float32x4_t v66;
  float32x4_t v67;
  int32x4_t v68;
  float32x4_t v69;
  int32x4_t v70;
  float32x4_t v71;
  simd_float4x4 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  _OWORD v81[2];
  _OWORD v82[3];

  v64 = a7;
  v62 = a8;
  v11 = a9;
  v12 = vaddq_f32(a4, vmlaq_f32(vmulq_f32(a2, (float32x4_t)0), (float32x4_t)0, a3)).u64[0];
  v13 = 1.57079633 - atan2f(*((float *)&v12 + 1), *(float *)&v12);
  v14.i64[0] = 0;
  v14.i32[2] = 0;
  *(float *)&v14.i32[3] = -*(float *)&a5;
  v15.i64[0] = 0;
  v15.i32[2] = 0;
  *(float *)&v15.i32[3] = -*((float *)&a5 + 1);
  v68 = vzip2q_s32(v14, (int32x4_t)xmmword_2295604C0);
  v70 = vzip2q_s32(v15, (int32x4_t)xmmword_229560490);
  v18 = __sincosf_stret(v13);
  *(float *)v17.i32 = v18.__cosval;
  *(__float2 *)v16.i8 = v18;
  v19 = 0;
  *(float *)&v17.i32[1] = -v18.__sinval;
  v20 = vzip1q_s32(v17, (int32x4_t)0);
  v21 = (float32x2x2_t)vzip1q_s32(v16, (int32x4_t)0);
  v22 = (float32x4_t)vzip1q_s32(v20, (int32x4_t)v21);
  v23 = (float32x4_t)vzip2q_s32(v20, (int32x4_t)v21);
  v81[0] = xmmword_2295604A0;
  v81[1] = xmmword_2295604B0;
  v24 = (float *)v82;
  v21.val[0] = (float32x2_t)v68.i64[0];
  v25 = v70.i64[0];
  vst2_f32(v24, v21);
  v82[1] = vzip2q_s32(v68, v70);
  do
  {
    v76.columns[v19] = (simd_float4)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v22, COERCE_FLOAT(v81[v19])), v23, *(float32x2_t *)&v81[v19], 1), (float32x4_t)xmmword_2295604C0, (float32x4_t)v81[v19], 2), (float32x4_t)xmmword_229560490, (float32x4_t)v81[v19], 3);
    ++v19;
  }
  while (v19 != 4);
  v71 = (float32x4_t)v76.columns[0];
  v67 = (float32x4_t)v76.columns[2];
  v69 = (float32x4_t)v76.columns[1];
  v66 = (float32x4_t)v76.columns[3];
  __invert_f4(v76);
  v61 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", objc_msgSend(v62, "count"));
  for (i = 0; objc_msgSend(v62, "count") > i; ++i)
  {
    objc_msgSend(v62, "objectAtIndexedSubscript:", i);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "objectAtIndexedSubscript:", i);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "identifier");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "setObject:forKey:", v27, v29);

  }
  v65 = 0;
  v30 = MEMORY[0x24BDBD1C8];
  v31 = MEMORY[0x24BDBD1C0];
  while (objc_msgSend(v64, "count") > v65)
  {
    objc_msgSend(v64, "objectAtIndexedSubscript:");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "identifier");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "objectForKey:", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v64, "objectAtIndexedSubscript:", v65);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "boxesDict");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "objectForKey:", CFSTR("rawdetection"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (v36)
    {
      v79 = 0u;
      v80 = 0u;
      v77 = 0u;
      v78 = 0u;
      memset(&v76, 0, sizeof(v76));
      objc_msgSend(v63, "boxesDict");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("rawdetection"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      box3dFromNSArray(v38, (uint64_t)&v76);

      v39 = (void *)objc_opt_new();
      for (j = 0; j != 8; ++j)
      {
        if (v11)
        {
          LODWORD(v40) = 0.125;
          if (objc_msgSend(a1, "isPointInCameraView:cameraPose:camera:marginRatio:", v11, *(double *)v76.columns[j].i64, *(double *)a2.i64, *(double *)a3.i64, *(double *)a4.i64, a5, v40))v42 = v30;
          else
            v42 = v31;
        }
        else
        {
          v43 = vaddq_f32(v66, vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v71, COERCE_FLOAT(*(_OWORD *)&v76.columns[j])), v69, *(float32x2_t *)v76.columns[j].f32, 1), v67, (float32x4_t)v76.columns[j], 2)).u64[0];
          if (fabsf(*(float *)&v43 / *((float *)&v43 + 1)) >= 0.483 || *((float *)&v43 + 1) <= 0.0)
            v42 = v31;
          else
            v42 = v30;
        }
        objc_msgSend(v39, "addObject:", v42);
      }
      v45 = (void *)objc_msgSend(v39, "copy");
      objc_msgSend(v63, "setCorners_status:", v45);

    }
    if (v34)
    {
      objc_msgSend(v34, "corners_status");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = objc_msgSend(v46, "count");

      if (v47 == 8)
      {
        objc_msgSend(v63, "corners_status");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = objc_msgSend(v48, "count");

        if (v49 == 8)
        {
          v50 = (void *)objc_opt_new();
          for (k = 0; k != 8; ++k)
          {
            v52 = v34;
            objc_msgSend(v34, "corners_status");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v53, "objectAtIndexedSubscript:", k);
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            v55 = objc_msgSend(v54, "BOOLValue");

            if (v55)
            {
              objc_msgSend(v50, "addObject:", v30);
            }
            else
            {
              objc_msgSend(v64, "objectAtIndexedSubscript:", v65);
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v56, "corners_status");
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v57, "objectAtIndexedSubscript:", k);
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v50, "addObject:", v58);

            }
            v34 = v52;
          }
          v59 = (void *)objc_msgSend(v50, "copy");
          objc_msgSend(v63, "setCorners_status:", v59);
        }
        else
        {
          objc_msgSend(v34, "corners_status");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          v59 = (void *)objc_msgSend(v50, "copy");
          objc_msgSend(v63, "setCorners_status:", v59);
        }

      }
    }

    ++v65;
  }

}

- (void)updateRawCornersStatus:(float32x4_t)a3 withOldObjects:(float32x4_t)a4 cameraPose:(double)a5 camera:(uint64_t)a6
{
  id v11;
  id v12;
  unint64_t v13;
  float v14;
  int32x4_t v15;
  int32x4_t v16;
  int32x4_t v17;
  int32x4_t v18;
  __float2 v19;
  uint64_t v20;
  int32x4_t v21;
  float32x2x2_t v22;
  float32x4_t v23;
  float32x4_t v24;
  float *v25;
  uint64_t v26;
  unint64_t i;
  void *v28;
  void *v29;
  void *v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
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
  void *v45;
  double v46;
  double v47;
  void *v48;
  double v49;
  uint64_t v50;
  float32x2_t *v51;
  int v52;
  unint64_t v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  NSObject *v61;
  _BYTE *v62;
  unint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  id v67;
  void *v68;
  float32x4_t v69;
  float32x4_t v70;
  float32x4_t v71;
  int32x4_t v72;
  float32x4_t v73;
  int32x4_t v74;
  __int128 v80;
  simd_float4x4 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  _OWORD v86[2];
  _OWORD v87[3];

  v67 = a7;
  v11 = a8;
  v12 = a9;
  v13 = vaddq_f32(a4, vmlaq_f32(vmulq_f32(a2, (float32x4_t)0), (float32x4_t)0, a3)).u64[0];
  v14 = 1.57079633 - atan2f(*((float *)&v13 + 1), *(float *)&v13);
  v15.i64[0] = 0;
  v15.i32[2] = 0;
  *(float *)&v15.i32[3] = -*(float *)&a5;
  v16.i64[0] = 0;
  v16.i32[2] = 0;
  *(float *)&v16.i32[3] = -*((float *)&a5 + 1);
  v72 = vzip2q_s32(v15, (int32x4_t)xmmword_2295604C0);
  v74 = vzip2q_s32(v16, (int32x4_t)xmmword_229560490);
  v19 = __sincosf_stret(v14);
  *(float *)v18.i32 = v19.__cosval;
  *(__float2 *)v17.i8 = v19;
  v20 = 0;
  *(float *)&v18.i32[1] = -v19.__sinval;
  v21 = vzip1q_s32(v18, (int32x4_t)0);
  v22 = (float32x2x2_t)vzip1q_s32(v17, (int32x4_t)0);
  v23 = (float32x4_t)vzip1q_s32(v21, (int32x4_t)v22);
  v24 = (float32x4_t)vzip2q_s32(v21, (int32x4_t)v22);
  v86[0] = xmmword_2295604A0;
  v86[1] = xmmword_2295604B0;
  v25 = (float *)v87;
  v22.val[0] = (float32x2_t)v72.i64[0];
  v26 = v74.i64[0];
  vst2_f32(v25, v22);
  v87[1] = vzip2q_s32(v72, v74);
  do
  {
    v81.columns[v20] = (simd_float4)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v23, COERCE_FLOAT(v86[v20])), v24, *(float32x2_t *)&v86[v20], 1), (float32x4_t)xmmword_2295604C0, (float32x4_t)v86[v20], 2), (float32x4_t)xmmword_229560490, (float32x4_t)v86[v20], 3);
    ++v20;
  }
  while (v20 != 4);
  v71 = (float32x4_t)v81.columns[1];
  v73 = (float32x4_t)v81.columns[0];
  v69 = (float32x4_t)v81.columns[3];
  v70 = (float32x4_t)v81.columns[2];
  __invert_f4(v81);
  v64 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", objc_msgSend(v11, "count"));
  v65 = v11;
  for (i = 0; objc_msgSend(v65, "count") > i; ++i)
  {
    objc_msgSend(v65, "objectAtIndexedSubscript:", i);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "objectAtIndexedSubscript:", i);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "identifier");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "setObject:forKey:", v28, v30);

  }
  v31 = 0;
  v62 = (char *)v86 + 1;
  v32 = MEMORY[0x24BDBD1C0];
  v33 = MEMORY[0x24BDBD1C8];
  v34 = v65;
  while (objc_msgSend(v67, "count", v62) > v31)
  {
    objc_msgSend(v67, "objectAtIndexedSubscript:", v31);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "identifier");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "objectForKey:", v36);
    v66 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v67, "objectAtIndexedSubscript:", v31);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "boxesDict");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "objectForKey:", CFSTR("rawdetection"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (v38)
    {
      if (v66)
      {
        objc_msgSend(v66, "corners_history");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = (void *)objc_msgSend(v39, "copy");
        objc_msgSend(v68, "setCorners_history:", v40);

      }
      v84 = 0u;
      v85 = 0u;
      v82 = 0u;
      v83 = 0u;
      memset(&v81, 0, sizeof(v81));
      objc_msgSend(v68, "boxesDict");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "objectForKeyedSubscript:", CFSTR("rawdetection"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      box3dFromNSArray(v42, (uint64_t)&v81);

      objc_msgSend(v68, "corners_history");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = (void *)objc_msgSend(v43, "mutableCopy");

      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "timeIntervalSince1970");
      v47 = v46;
      v63 = v31;

      v48 = (void *)objc_opt_new();
      v50 = 0;
      v51 = (float32x2_t *)&v81;
      do
      {
        if (v12)
        {
          LODWORD(v49) = 0.125;
          v52 = objc_msgSend(a1, "isPointInCameraView:cameraPose:camera:marginRatio:", v12, *(double *)v51, *(double *)a2.i64, *(double *)a3.i64, *(double *)a4.i64, a5, v49);
        }
        else
        {
          v53 = vaddq_f32(v69, vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v73, COERCE_FLOAT(*(_OWORD *)v51->f32)), v71, *v51, 1), v70, *(float32x4_t *)v51->f32, 2)).u64[0];
          v52 = fabsf(*(float *)&v53 / *((float *)&v53 + 1)) < 0.483 && *((float *)&v53 + 1) > 0.0;
        }
        if (v52)
          v54 = v33;
        else
          v54 = v32;
        objc_msgSend(v44, "objectAtIndexedSubscript:", v50);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v80 = *(_OWORD *)v51->f32;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v47);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "addCornerStatus:inView:timestamp:", v54, v56, *(double *)&v80);

        objc_msgSend(v44, "objectAtIndexedSubscript:", v50);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v57, "isCompleted"))
          v58 = v33;
        else
          v58 = v32;
        objc_msgSend(v48, "addObject:", v58);

        ++v50;
        v51 += 2;
      }
      while (v50 != 8);
      v31 = v63;
      v59 = (void *)objc_msgSend(v48, "copy");
      objc_msgSend(v68, "setCorners_status:", v59);

      v60 = (void *)objc_msgSend(v44, "copy");
      objc_msgSend(v68, "setCorners_history:", v60);

      v34 = v65;
    }
    else
    {
      _OULoggingGetOSLogForCategoryObjectUnderstanding();
      v61 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
        -[OUObjectCompleteness updateRawCornersStatus:withOldObjects:cameraPose:camera:].cold.1((uint8_t *)v86, v62, v61);

    }
    ++v31;
  }

}

- (void)updateRawFacesStatus:(double)a3 withOldObjects:(double)a4 pointCloud:(double)a5 cameraPose:(uint64_t)a6 camera:(void *)a7
{
  unint64_t i;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  uint64_t v34;
  int *v35;
  int *v36;
  unsigned int v37;
  unsigned int v38;
  uint64_t v39;
  int v40;
  void *v41;
  void *v42;
  int v43;
  BOOL v44;
  uint64_t v45;
  void *v46;
  int v47;
  uint64_t v48;
  uint64_t j;
  void *v50;
  int v51;
  uint64_t v52;
  int *v53;
  int *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  uint64_t k;
  uint64_t v59;
  void *v60;
  void *v61;
  NSObject *v62;
  void *v63;
  char v64;
  _BYTE *v65;
  void *v66;
  id v67;
  id v68;
  id v69;
  unint64_t v70;
  void *v71;
  void *v72;
  id v77;
  void *v78;
  std::vector<int>::value_type __x;
  _OWORD v80[8];
  _OWORD v81[8];
  float32x4_t v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  uint8_t v90;
  _BYTE v91[7];

  v68 = a7;
  v67 = a8;
  v69 = a9;
  v77 = a10;
  v66 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", objc_msgSend(v67, "count"));
  for (i = 0; objc_msgSend(v67, "count") > i; ++i)
  {
    objc_msgSend(v67, "objectAtIndexedSubscript:", i);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "objectAtIndexedSubscript:", i);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "identifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "setObject:forKey:", v15, v17);

  }
  v18 = 0;
  v65 = v91;
  v19 = MEMORY[0x24BDBD1C0];
  while (objc_msgSend(v68, "count", v65) > v18)
  {
    objc_msgSend(v68, "objectAtIndexedSubscript:", v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "identifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "objectForKey:", v21);
    v71 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v68, "objectAtIndexedSubscript:", v18);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "type");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v22, "isEqualToString:", CFSTR("Cabinet")) & 1) != 0)
      goto LABEL_9;
    objc_msgSend(v78, "type");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v23, "isEqualToString:", CFSTR("Sofa")))
    {

LABEL_9:
      goto LABEL_10;
    }
    objc_msgSend(v78, "type");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = objc_msgSend(v63, "isEqualToString:", CFSTR("Table"));

    if ((v64 & 1) == 0)
      goto LABEL_49;
LABEL_10:
    objc_msgSend(v78, "boxesDict");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "objectForKey:", CFSTR("rawdetection"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      v88 = 0u;
      v89 = 0u;
      v86 = 0u;
      v87 = 0u;
      v84 = 0u;
      v85 = 0u;
      v82 = 0u;
      v83 = 0u;
      objc_msgSend(v78, "boxesDict");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("rawdetection"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      box3dFromNSArray(v27, (uint64_t)&v82);

      box3dEnlarge(&v82, 0.02, 0.02, 0.02, v81);
      v86 = v81[4];
      v87 = v81[5];
      v88 = v81[6];
      v89 = v81[7];
      v82 = (float32x4_t)v81[0];
      v83 = v81[1];
      v84 = v81[2];
      v85 = v81[3];
      v72 = (void *)objc_opt_new();
      v29 = 0;
      v70 = v18;
      while (1)
      {
        if (!v71)
          goto LABEL_17;
        objc_msgSend(v71, "faces_status");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v30, "count") != 6)
          break;
        objc_msgSend(v71, "faces_status");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "objectAtIndexedSubscript:", v29);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v32, "BOOLValue");

        if (!v33)
          goto LABEL_17;
        objc_msgSend(v72, "addObject:", MEMORY[0x24BDBD1C8]);
LABEL_30:
        if (++v29 == 6)
        {
          __x = 0;
          std::vector<int>::vector((std::vector<int> *)v81, 0xCuLL, &__x);
          for (j = 0; j != 6; ++j)
          {
            objc_msgSend(v72, "objectAtIndexedSubscript:", j);
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            v51 = objc_msgSend(v50, "BOOLValue");

            if (v51)
            {
              v52 = kFaceEdgeIndicesMap + 24 * j;
              v53 = *(int **)v52;
              v54 = *(int **)(v52 + 8);
              if (v53 != v54)
              {
                v55 = *(_QWORD *)&v81[0];
                do
                {
                  v56 = *v53++;
                  ++*(_DWORD *)(v55 + 4 * v56);
                }
                while (v53 != v54);
              }
            }
          }
          v57 = (void *)objc_opt_new();
          for (k = 0; k != 48; k += 4)
          {
            if (*(int *)(*(_QWORD *)&v81[0] + k) <= 1)
              v59 = v19;
            else
              v59 = MEMORY[0x24BDBD1C8];
            objc_msgSend(v57, "addObject:", v59);
          }
          v60 = (void *)objc_msgSend(v72, "copy");
          objc_msgSend(v78, "setFaces_status:", v60);

          v61 = (void *)objc_msgSend(v57, "copy");
          objc_msgSend(v78, "setEdges_status:", v61);

          if (*(_QWORD *)&v81[0])
          {
            *((_QWORD *)&v81[0] + 1) = *(_QWORD *)&v81[0];
            operator delete(*(void **)&v81[0]);
          }

          goto LABEL_49;
        }
      }

LABEL_17:
      v34 = kFaceCornerIndicesMap + 24 * v29;
      v35 = *(int **)v34;
      v36 = *(int **)(v34 + 8);
      if (*(int **)v34 == v36)
        goto LABEL_25;
      v37 = 0;
      v38 = 0;
      do
      {
        v39 = *v35;
        LODWORD(v28) = 1011666125;
        v40 = objc_msgSend(a1, "isPointInCameraView:cameraPose:camera:marginRatio:", v77, *(double *)&v82.i64[2 * v39], a2, a3, a4, a5, v28);
        objc_msgSend(v78, "corners_status");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "objectAtIndexedSubscript:", v39);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = objc_msgSend(v42, "BOOLValue");
        v38 += v40;

        v37 += v43;
        ++v35;
      }
      while (v35 != v36);
      if (v38 > 3 || (v38 ? (v44 = v37 >= 2) : (v44 = 0), v44))
      {
        v80[4] = v86;
        v80[5] = v87;
        v80[6] = v88;
        v80[7] = v89;
        v80[0] = v82;
        v80[1] = v83;
        v80[2] = v84;
        v80[3] = v85;
        objc_msgSend(v78, "type");
        v45 = objc_claimAutoreleasedReturnValue();
        v18 = v70;
        v19 = MEMORY[0x24BDBD1C0];
        v46 = (void *)v45;
        v47 = objc_msgSend(a1, "checkBoxFaceCompleteness:faceIndex:boxType:pointCloud:", v80, v29, v45, v69);

        if (v47)
          v48 = MEMORY[0x24BDBD1C8];
        else
          v48 = v19;
        objc_msgSend(v72, "addObject:", v48);
      }
      else
      {
LABEL_25:
        v19 = MEMORY[0x24BDBD1C0];
        objc_msgSend(v72, "addObject:", MEMORY[0x24BDBD1C0]);
        v18 = v70;
      }
      goto LABEL_30;
    }
    _OULoggingGetOSLogForCategoryObjectUnderstanding();
    v62 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
      -[OUObjectCompleteness updateRawCornersStatus:withOldObjects:cameraPose:camera:].cold.1(&v90, v65, v62);

LABEL_49:
    ++v18;
  }

}

- (BOOL)checkBoxFaceCompleteness:(uint64_t)a3 faceIndex:(int)a4 boxType:(void *)a5 pointCloud:(void *)a6
{
  id v9;
  id v10;
  int *v11;
  int *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  char *v18;
  char *v19;
  char *v20;
  char *v21;
  __int128 v22;
  _BOOL8 v23;
  _DWORD v25[3];
  int v26;
  int v27;
  void *__p;
  char *v29;
  char *v30;
  void *v31;
  int *v32;
  uint64_t v33;

  v9 = a5;
  v10 = a6;
  if (a4 > 5)
  {
    v23 = 0;
    goto LABEL_35;
  }
  v32 = 0;
  v33 = 0;
  v31 = 0;
  std::vector<int>::__init_with_size[abi:ne180100]<int *,int *>(&v31, *(const void **)(kFaceCornerIndicesMap + 24 * a4), *(_QWORD *)(kFaceCornerIndicesMap + 24 * a4 + 8), (uint64_t)(*(_QWORD *)(kFaceCornerIndicesMap + 24 * a4 + 8) - *(_QWORD *)(kFaceCornerIndicesMap + 24 * a4)) >> 2);
  __p = 0;
  v29 = 0;
  v30 = 0;
  v11 = (int *)v31;
  v12 = v32;
  if (v31 != v32)
  {
    v13 = 0;
    do
    {
      v14 = *v11;
      if (v13 >= v30)
      {
        v15 = (v13 - (_BYTE *)__p) >> 4;
        if ((unint64_t)(v15 + 1) >> 60)
          std::vector<float>::__throw_length_error[abi:ne180100]();
        v16 = (v30 - (_BYTE *)__p) >> 3;
        if (v16 <= v15 + 1)
          v16 = v15 + 1;
        if ((unint64_t)(v30 - (_BYTE *)__p) >= 0x7FFFFFFFFFFFFFF0)
          v17 = 0xFFFFFFFFFFFFFFFLL;
        else
          v17 = v16;
        if (v17)
          v18 = (char *)_ZNSt3__119__allocate_at_leastB8ne180100INS_9allocatorIDv3_fEEEENS_19__allocation_resultINS_16allocator_traitsIT_E7pointerEEERS6_m((uint64_t)&v30, v17);
        else
          v18 = 0;
        v19 = &v18[16 * v15];
        *(_OWORD *)v19 = *(_OWORD *)(a3 + 16 * v14);
        v13 = v19 + 16;
        v21 = (char *)__p;
        v20 = v29;
        if (v29 != __p)
        {
          do
          {
            v22 = *((_OWORD *)v20 - 1);
            v20 -= 16;
            *((_OWORD *)v19 - 1) = v22;
            v19 -= 16;
          }
          while (v20 != v21);
          v20 = (char *)__p;
        }
        __p = v19;
        v29 = v13;
        v30 = &v18[16 * v17];
        if (v20)
          operator delete(v20);
      }
      else
      {
        *(_OWORD *)v13 = *(_OWORD *)(a3 + 16 * v14);
        v13 += 16;
      }
      v29 = v13;
      ++v11;
    }
    while (v11 != v12);
  }
  CountPointsNearPlane(v9, (float32x4_t **)&__p, v10, (uint64_t)v25, 0.1);
  if (3 * v26 < v25[2])
  {
    v23 = 1;
    if (v26 < 6 || (float)((float)v27 / (float)v26) > 0.5)
      goto LABEL_31;
    goto LABEL_28;
  }
  if (v26 >= 6)
  {
LABEL_28:
    v23 = v25[0] >= 6 && (float)((float)v25[0] / (float)v25[1]) >= 8.0;
    goto LABEL_31;
  }
  v23 = 1;
LABEL_31:
  if (__p)
  {
    v29 = (char *)__p;
    operator delete(__p);
  }
  if (v31)
  {
    v32 = (int *)v31;
    operator delete(v31);
  }
LABEL_35:

  return v23;
}

- (void)updateRawCornersStatus:(NSObject *)a3 withOldObjects:cameraPose:camera:.cold.1(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_0_3(&dword_2294C8000, (int)a2, a3, "[3DOD] WARNING: the object needs to have raw box for corner completeness.", a1);
}

@end
