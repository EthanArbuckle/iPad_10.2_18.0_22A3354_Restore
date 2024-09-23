@implementation AVAsset(PUPerspectiveTransform)

- (uint64_t)pu_supportsVitality
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  const void *v7;
  void *v8;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_getAssociatedObject(a1, (const void *)SupportsVitalityKey);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = objc_msgSend(v2, "BOOLValue");
  }
  else
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D75140]), "initWithAVAsset:timeZoneLookup:", a1, 0);
    v6 = v5;
    if (v5)
    {
      v4 = objc_msgSend(v5, "hasVitality");
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v10 = 138412290;
        v11 = a1;
        _os_log_error_impl(&dword_1AAB61000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Attempted to read vitality disabled metadata from asset %@, but failed", (uint8_t *)&v10, 0xCu);
      }
      v4 = 1;
    }
    v7 = (const void *)SupportsVitalityKey;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setAssociatedObject(a1, v7, v8, (void *)1);

  }
  return v4;
}

- (id)pu_stillImageTransformAssetTrack
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  id obj;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  objc_msgSend(MEMORY[0x1E0D75130], "tracksWithMediaType:forAsset:", *MEMORY[0x1E0C8A7D0], a1);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v1)
  {
    v2 = v1;
    v3 = *(_QWORD *)v21;
    v4 = *MEMORY[0x1E0CA2570];
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v21 != v3)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v5);
        v16 = 0u;
        v17 = 0u;
        v18 = 0u;
        v19 = 0u;
        objc_msgSend(v6, "formatDescriptions");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v17;
LABEL_8:
          v11 = 0;
          while (1)
          {
            if (*(_QWORD *)v17 != v10)
              objc_enumerationMutation(v7);
            CMMetadataFormatDescriptionGetIdentifiers(*(CMMetadataFormatDescriptionRef *)(*((_QWORD *)&v16 + 1) + 8 * v11));
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v12, "containsObject:", v4) & 1) != 0)
              break;

            if (v9 == ++v11)
            {
              v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
              if (v9)
                goto LABEL_8;
              goto LABEL_14;
            }
          }
          v13 = v6;

          if (v13)
            goto LABEL_19;
        }
        else
        {
LABEL_14:

        }
        ++v5;
      }
      while (v5 != v2);
      v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v2);
  }
  v13 = 0;
LABEL_19:

  return v13;
}

- (void)pu_loadNormalizedVitalityPerspectiveTransformWithAdditionalNormalizedTransform:()PUPerspectiveTransform completion:
{
  id v7;
  NSObject *v8;
  id v9;
  _QWORD block[4];
  __n128 v14;
  __n128 v15;
  __n128 v16;
  uint64_t v17;
  id v18;

  v7 = a6;
  _vitalityLoadingQueue();
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __125__AVAsset_PUPerspectiveTransform__pu_loadNormalizedVitalityPerspectiveTransformWithAdditionalNormalizedTransform_completion___block_invoke;
  block[3] = &unk_1E589DDC8;
  v14 = a2;
  v15 = a3;
  v16 = a4;
  v17 = a1;
  v18 = v7;
  v9 = v7;
  dispatch_async(v8, block);

}

- (void)_pu_handleRequiredPropertiesLoadedWithAdditionalNormalizedTransform:()PUPerspectiveTransform completion:
{
  void (**v7)(id, _QWORD, __n128, __n128, __n128);
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  __n128 v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  __int128 v22;
  float v23;
  simd_float3 v24;
  simd_float3 v25;
  __float2 v26;
  simd_float3 v27;
  simd_float3 v33;
  __int32 v34;
  float v35;
  float v36;
  uint64_t v37;
  float32x4_t v38;
  int8x16_t v39;
  uint64_t v40;
  simd_float3 v41;
  int8x16_t v42;
  simd_float3 v44;
  float32x4_t v45;
  float32x4_t v46;
  float32x4_t v47;
  uint64_t v48;
  simd_float3x3 v49;
  float32x4_t v50;
  uint64_t v51;
  simd_float3 v52;
  float32x4_t v53;
  float32x4_t v54;
  uint64_t v55;
  float32x4_t v56;
  float32x4_t v57;
  float32x4_t v58;
  uint64_t v59;
  float32x4_t v60;
  float32x4_t v61;
  float32x4_t v62;
  uint64_t v63;
  float32x4_t v64;
  float32x4_t v65;
  float32x4_t v66;
  uint64_t v67;
  float32x4_t v68;
  float32x4_t v69;
  float32x4_t v70;
  uint64_t v71;
  float32x4_t v72;
  float32x4_t v73;
  float32x4_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  float32x4_t v78;
  float32x4_t v79;
  simd_float3x3 v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  float32x4_t v85;
  float32x4_t v86;
  float32x4_t v87;
  simd_float3 v88;
  simd_float3 v89;
  simd_float3 v90;
  float32x4_t v91;
  float32x4_t v92;
  simd_float3 v93;
  float32x4_t v94;
  float32x4_t v95;
  simd_float3 v96;
  simd_float3 v97;
  simd_float3 v98;
  simd_float3 v99;
  simd_float3 v100;
  simd_float3 v101;
  simd_float3 v102;
  int8x16_t v103;
  simd_float3 v104;
  float32x4_t v105;
  simd_float3 v106;
  simd_float3 v107;
  simd_float3 v108;
  simd_float3 v109;
  simd_float3 v110;
  simd_float3 v111;
  float32x4_t v112;
  float32x4_t v113;
  float32x4_t v114;
  simd_float3x3 v115;
  float32x4_t v116;
  float32x4_t v117;
  float32x4_t v118;
  float32x4_t v119;
  float32x4_t v120;
  simd_float3 v121;
  float32x4_t v122;
  float32x4_t v123;
  simd_float3 v124;
  float32x4_t v125;
  float32x4_t v126;
  float32x4_t v127;
  __int128 v128;
  __int128 v129;
  float32x4_t v130;
  __int128 v131;
  simd_float3 v132;
  simd_float3 v133;
  simd_float3 v134;
  id v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int16 v140;
  simd_float3x3 v141;
  _BYTE v142[128];
  uint8_t buf[32];
  float32x4_t v144;
  uint64_t v145;
  simd_float3x3 v146;
  simd_float3x3 v147;
  simd_float3x3 v148;
  simd_float3x3 v149;
  simd_float3x3 v150;
  simd_float3x3 v151;
  simd_float3x3 v152;
  simd_float3x3 v153;
  simd_float3x3 v154;
  simd_float3x3 v155;

  v115.columns[1] = a3;
  v115.columns[2] = a4;
  v115.columns[0] = a2;
  v145 = *MEMORY[0x1E0C80C00];
  v7 = a6;
  v136 = 0u;
  v137 = 0u;
  v138 = 0u;
  v139 = 0u;
  _vitalityTransformRequiredProperties();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v136, v142, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = *(_QWORD *)v137;
    while (2)
    {
      v13 = 0;
      v14 = v11;
      do
      {
        if (*(_QWORD *)v137 != v12)
          objc_enumerationMutation(v8);
        v15 = *(_QWORD *)(*((_QWORD *)&v136 + 1) + 8 * v13);
        v135 = v14;
        v16 = objc_msgSend(a1, "statusOfValueForKey:error:", v15, &v135);
        v11 = v135;

        if (v16 != 2)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412802;
            *(_QWORD *)&buf[4] = a1;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v15;
            *(_WORD *)&buf[22] = 2112;
            *(_QWORD *)&buf[24] = v11;
            _os_log_error_impl(&dword_1AAB61000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Attempted to load vitality transform from asset %@, but required property %@ coud not be loaded. Received error: %@", buf, 0x20u);
          }
          v7[2](v7, 0, *MEMORY[0x1E0C83FE8], *(__n128 *)(MEMORY[0x1E0C83FE8] + 16), *(__n128 *)(MEMORY[0x1E0C83FE8] + 32));

          goto LABEL_57;
        }
        ++v13;
        v14 = v11;
      }
      while (v10 != v13);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v136, v142, 16);
      if (v10)
        continue;
      break;
    }
  }
  else
  {
    v11 = 0;
  }

  v17 = *(__n128 *)(MEMORY[0x1E0C83FE8] + 16);
  v114 = *(float32x4_t *)MEMORY[0x1E0C83FE8];
  v132 = *(simd_float3 *)MEMORY[0x1E0C83FE8];
  v133 = (simd_float3)v17;
  v112 = (float32x4_t)v17;
  v113 = *(float32x4_t *)(MEMORY[0x1E0C83FE8] + 32);
  v134 = (simd_float3)v113;
  if (objc_msgSend(a1, "pu_supportsVitality"))
  {
    v131 = *MEMORY[0x1E0CB3440];
    if (objc_msgSend(a1, "_pu_getVitalityTransform:dimensions:", &v132, &v131))
    {
      v129 = 0u;
      v130 = 0u;
      v128 = 0u;
      objc_msgSend(MEMORY[0x1E0D75130], "tracksWithMediaType:forAsset:", *MEMORY[0x1E0C8A808], a1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "firstObject");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v19;
      if (v19)
      {
        objc_msgSend(v19, "preferredTransform");
      }
      else
      {
        v129 = 0u;
        v130 = 0u;
        v128 = 0u;
      }

      v90 = v133;
      v93 = v132;
      v89 = v134;
      *(_OWORD *)buf = v128;
      *(_OWORD *)&buf[16] = v129;
      v144 = v130;
      v22 = v131;
      v140 = 0;
      v23 = (double)(int)FigGetRotationAngleAndFlipsFromCGAffineTransform() * 0.0174532925;
      v24.i64[0] = 0xBF000000BF000000;
      v24.i64[1] = v113.u32[2] | 0xBF00000000000000;
      v110 = v24;
      v26 = __sincosf_stret(v23);
      v25.i64[0] = __PAIR64__(LODWORD(v26.__sinval), LODWORD(v26.__cosval));
      v27.f32[0] = -v26.__sinval;
      v27.i32[1] = LODWORD(v26.__cosval);
      __asm { FMOV            V4.4S, #-1.0 }
      v102 = (simd_float3)v114;
      if ((_BYTE)v140)
      {
        v33.i64[0] = __PAIR64__(v114.u32[1], _Q4.u32[0]);
        v33.i64[1] = v114.i64[1];
        v102 = v33;
      }
      v25.i32[2] = v114.i32[2];
      v108 = v25;
      v146.columns[1] = (simd_float3)v112;
      v27.i32[2] = v112.i32[2];
      _Q4.i32[0] = v112.i32[0];
      _Q4.i32[2] = v112.i32[2];
      v103 = _Q4;
      v106 = v27;
      v146.columns[2] = v110;
      v146.columns[2].i32[3] = 0;
      v146.columns[1].i32[3] = 0;
      v34 = HIBYTE(v140);
      v146.columns[0] = (simd_float3)v114;
      v146.columns[0].i32[3] = 0;
      v35 = *(double *)&v22;
      *(float *)_Q4.i32 = 1.0 / v35;
      *(uint64_t *)((char *)_Q4.i64 + 4) = *(uint64_t *)((char *)v114.i64 + 4);
      v88 = (simd_float3)_Q4;
      v100 = v146.columns[0];
      v101 = v146.columns[1];
      v111 = v146.columns[2];
      v147 = __invert_f3(v146);
      v37 = 0;
      v97 = v147.columns[1];
      v98 = v147.columns[0];
      v141 = v147;
      v96 = v147.columns[2];
      memset(buf, 0, sizeof(buf));
      v144 = 0u;
      do
      {
        v38 = (float32x4_t)v141.columns[v37];
        v39 = (int8x16_t)vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v114, v38.f32[0]), v112, *(float32x2_t *)v38.f32, 1), v113, v38, 2);
        *(int8x16_t *)&buf[v37 * 16] = v39;
        ++v37;
      }
      while (v37 != 3);
      v38.i32[0] = 0;
      v40 = 0;
      v39.i32[0] = v34;
      v41 = (simd_float3)v103;
      v42 = vbslq_s8(vdupq_lane_s8((int8x8_t)*(_OWORD *)&vceqq_s8(v39, (int8x16_t)v38), 0), (int8x16_t)v112, v103);
      v42.i32[3] = v112.i32[3];
      __asm { FMOV            V19.4S, #1.0 }
      _Q19.i32[0] = v113.i32[0];
      _Q19.i32[2] = v113.i32[2];
      v44 = v108;
      v44.i32[3] = 0;
      v45 = *(float32x4_t *)buf;
      v46 = *(float32x4_t *)&buf[16];
      v47 = v144;
      v141.columns[0] = (simd_float3)v114;
      v141.columns[1] = (simd_float3)v42;
      v99 = (simd_float3)v42;
      v141.columns[2] = (simd_float3)v113;
      memset(buf, 0, sizeof(buf));
      v144 = 0u;
      do
      {
        *(float32x4_t *)&buf[v40 * 16] = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v45, COERCE_FLOAT(*(_OWORD *)&v141.columns[v40])), v46, *(float32x2_t *)v141.columns[v40].f32, 1), v47, (float32x4_t)v141.columns[v40], 2);
        ++v40;
      }
      while (v40 != 3);
      v48 = 0;
      v49.columns[1].i32[0] = v112.i32[0];
      v36 = *((double *)&v22 + 1);
      v49.columns[1].f32[1] = 1.0 / v36;
      v49.columns[1].i32[2] = v112.i32[2];
      v49.columns[0] = *(simd_float3 *)buf;
      v49.columns[2] = *(simd_float3 *)&buf[16];
      v50 = v144;
      v141.columns[0] = v102;
      v141.columns[1] = (simd_float3)v112;
      v141.columns[2] = (simd_float3)v113;
      memset(buf, 0, sizeof(buf));
      v144 = 0u;
      do
      {
        *(float32x4_t *)&buf[v48 * 16] = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v49.columns[0], COERCE_FLOAT(*(_OWORD *)&v141.columns[v48])), (float32x4_t)v49.columns[2], *(float32x2_t *)v141.columns[v48].f32, 1), v50, (float32x4_t)v141.columns[v48], 2);
        ++v48;
      }
      while (v48 != 3);
      v51 = 0;
      v49.columns[2] = (simd_float3)v113;
      v49.columns[2].i32[3] = 0;
      v52 = v106;
      v52.i32[3] = 0;
      v49.columns[0] = *(simd_float3 *)buf;
      v53 = *(float32x4_t *)&buf[16];
      v54 = v144;
      v141.columns[0] = v44;
      v141.columns[1] = v52;
      v107 = v52;
      v141.columns[2] = v49.columns[2];
      memset(buf, 0, sizeof(buf));
      v144 = 0u;
      do
      {
        *(float32x4_t *)&buf[v51 * 16] = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v49.columns[0], COERCE_FLOAT(*(_OWORD *)&v141.columns[v51])), v53, *(float32x2_t *)v141.columns[v51].f32, 1), v54, (float32x4_t)v141.columns[v51], 2);
        ++v51;
      }
      while (v51 != 3);
      v55 = 0;
      v41.i32[3] = v112.i32[3];
      v56 = *(float32x4_t *)buf;
      v57 = *(float32x4_t *)&buf[16];
      v58 = v144;
      v141.columns[0] = v100;
      v141.columns[1] = v101;
      v141.columns[2] = v111;
      memset(buf, 0, sizeof(buf));
      v144 = 0u;
      do
      {
        *(float32x4_t *)&buf[v55 * 16] = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v56, COERCE_FLOAT(*(_OWORD *)&v141.columns[v55])), v57, *(float32x2_t *)v141.columns[v55].f32, 1), v58, (float32x4_t)v141.columns[v55], 2);
        ++v55;
      }
      while (v55 != 3);
      v59 = 0;
      _Q19.i32[3] = v113.i32[3];
      v60 = *(float32x4_t *)buf;
      v61 = *(float32x4_t *)&buf[16];
      v62 = v144;
      v141.columns[0] = (simd_float3)v114;
      v141.columns[1] = v41;
      v141.columns[2] = _Q19;
      memset(buf, 0, sizeof(buf));
      v144 = 0u;
      do
      {
        *(float32x4_t *)&buf[v59 * 16] = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v60, COERCE_FLOAT(*(_OWORD *)&v141.columns[v59])), v61, *(float32x2_t *)v141.columns[v59].f32, 1), v62, (float32x4_t)v141.columns[v59], 2);
        ++v59;
      }
      while (v59 != 3);
      v63 = 0;
      v64 = *(float32x4_t *)buf;
      v65 = *(float32x4_t *)&buf[16];
      v66 = v144;
      v141 = v115;
      memset(buf, 0, sizeof(buf));
      v144 = 0u;
      v49.columns[0] = v88;
      do
      {
        *(float32x4_t *)&buf[v63 * 16] = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v64, COERCE_FLOAT(*(_OWORD *)&v141.columns[v63])), v65, *(float32x2_t *)v141.columns[v63].f32, 1), v66, (float32x4_t)v141.columns[v63], 2);
        ++v63;
      }
      while (v63 != 3);
      v67 = 0;
      v49.columns[1].i32[3] = 0;
      v49.columns[0].i32[3] = 0;
      v68 = *(float32x4_t *)buf;
      v69 = *(float32x4_t *)&buf[16];
      v70 = v144;
      v141 = v49;
      memset(buf, 0, sizeof(buf));
      v144 = 0u;
      do
      {
        *(float32x4_t *)&buf[v67 * 16] = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v68, COERCE_FLOAT(*(_OWORD *)&v141.columns[v67])), v69, *(float32x2_t *)v141.columns[v67].f32, 1), v70, (float32x4_t)v141.columns[v67], 2);
        ++v67;
      }
      while (v67 != 3);
      v124 = _Q19;
      v104 = v41;
      v109 = v44;
      v71 = 0;
      v72 = *(float32x4_t *)buf;
      v73 = *(float32x4_t *)&buf[16];
      v74 = v144;
      v141.columns[0] = v93;
      v141.columns[1] = v90;
      v141.columns[2] = v89;
      memset(buf, 0, sizeof(buf));
      v144 = 0u;
      do
      {
        *(float32x4_t *)&buf[v71 * 16] = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v72, COERCE_FLOAT(*(_OWORD *)&v141.columns[v71])), v73, *(float32x2_t *)v141.columns[v71].f32, 1), v74, (float32x4_t)v141.columns[v71], 2);
        ++v71;
      }
      while (v71 != 3);
      v116 = *(float32x4_t *)buf;
      v121 = v49.columns[2];
      v91 = v144;
      v94 = *(float32x4_t *)&buf[16];
      v148 = __invert_f3(v49);
      v75 = 0;
      v141 = v148;
      memset(buf, 0, sizeof(buf));
      v144 = 0u;
      do
      {
        *(float32x4_t *)&buf[v75 * 16] = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v116, COERCE_FLOAT(*(_OWORD *)&v141.columns[v75])), v94, *(float32x2_t *)v141.columns[v75].f32, 1), v91, (float32x4_t)v141.columns[v75], 2);
        ++v75;
      }
      while (v75 != 3);
      v117 = *(float32x4_t *)buf;
      v92 = v144;
      v95 = *(float32x4_t *)&buf[16];
      v149.columns[0] = (simd_float3)v114;
      v149.columns[1] = v104;
      v149.columns[2] = v124;
      v150 = __invert_f3(v149);
      v76 = 0;
      v141 = v150;
      memset(buf, 0, sizeof(buf));
      v144 = 0u;
      do
      {
        *(float32x4_t *)&buf[v76 * 16] = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v117, COERCE_FLOAT(*(_OWORD *)&v141.columns[v76])), v95, *(float32x2_t *)v141.columns[v76].f32, 1), v92, (float32x4_t)v141.columns[v76], 2);
        ++v76;
      }
      while (v76 != 3);
      v77 = 0;
      v78 = *(float32x4_t *)buf;
      v80.columns[1] = *(simd_float3 *)&buf[16];
      v79 = v144;
      v141.columns[0] = v98;
      v141.columns[1] = v97;
      v141.columns[2] = v96;
      memset(buf, 0, sizeof(buf));
      v144 = 0u;
      v80.columns[0] = v109;
      v80.columns[2] = v121;
      do
      {
        *(float32x4_t *)&buf[v77 * 16] = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v78, COERCE_FLOAT(*(_OWORD *)&v141.columns[v77])), (float32x4_t)v80.columns[1], *(float32x2_t *)v141.columns[v77].f32, 1), v79, (float32x4_t)v141.columns[v77], 2);
        ++v77;
      }
      while (v77 != 3);
      v125 = *(float32x4_t *)buf;
      v118 = *(float32x4_t *)&buf[16];
      v105 = v144;
      v80.columns[1] = v107;
      v151 = __invert_f3(v80);
      v81 = 0;
      v141 = v151;
      memset(buf, 0, sizeof(buf));
      v144 = 0u;
      do
      {
        *(float32x4_t *)&buf[v81 * 16] = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v125, COERCE_FLOAT(*(_OWORD *)&v141.columns[v81])), v118, *(float32x2_t *)v141.columns[v81].f32, 1), v105, (float32x4_t)v141.columns[v81], 2);
        ++v81;
      }
      while (v81 != 3);
      v122 = *(float32x4_t *)&buf[16];
      v126 = *(float32x4_t *)buf;
      v119 = v144;
      v152.columns[0] = v102;
      v152.columns[1] = (simd_float3)v112;
      v152.columns[2] = (simd_float3)v113;
      v153 = __invert_f3(v152);
      v82 = 0;
      v141 = v153;
      memset(buf, 0, sizeof(buf));
      v144 = 0u;
      do
      {
        *(float32x4_t *)&buf[v82 * 16] = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v126, COERCE_FLOAT(*(_OWORD *)&v141.columns[v82])), v122, *(float32x2_t *)v141.columns[v82].f32, 1), v119, (float32x4_t)v141.columns[v82], 2);
        ++v82;
      }
      while (v82 != 3);
      v123 = *(float32x4_t *)&buf[16];
      v127 = *(float32x4_t *)buf;
      v120 = v144;
      v154.columns[2] = (simd_float3)v113;
      v154.columns[0] = (simd_float3)v114;
      v154.columns[1] = v99;
      v155 = __invert_f3(v154);
      v83 = 0;
      v141 = v155;
      memset(buf, 0, sizeof(buf));
      v144 = 0u;
      do
      {
        *(float32x4_t *)&buf[v83 * 16] = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v127, COERCE_FLOAT(*(_OWORD *)&v141.columns[v83])), v123, *(float32x2_t *)v141.columns[v83].f32, 1), v120, (float32x4_t)v141.columns[v83], 2);
        ++v83;
      }
      while (v83 != 3);
      v84 = 0;
      v85 = *(float32x4_t *)buf;
      v86 = *(float32x4_t *)&buf[16];
      v87 = v144;
      v141.columns[0] = v100;
      v141.columns[1] = v101;
      v141.columns[2] = v111;
      memset(buf, 0, sizeof(buf));
      v144 = 0u;
      do
      {
        *(float32x4_t *)&buf[v84 * 16] = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v85, COERCE_FLOAT(*(_OWORD *)&v141.columns[v84])), v86, *(float32x2_t *)v141.columns[v84].f32, 1), v87, (float32x4_t)v141.columns[v84], 2);
        ++v84;
      }
      while (v84 != 3);
      v132.i32[2] = *(_DWORD *)&buf[8];
      v133.i32[2] = *(_DWORD *)&buf[24];
      v132.i64[0] = *(_QWORD *)buf;
      v133.i64[0] = *(_QWORD *)&buf[16];
      v134.i32[2] = v144.i32[2];
      v134.i64[0] = v144.i64[0];
    }
    v21 = objc_msgSend(a1, "_pu_isVitalityLimitingAllowed", *(_OWORD *)&v88);
  }
  else
  {
    v21 = 0;
  }
  v7[2](v7, v21, (__n128)v132, (__n128)v133, (__n128)v134);
LABEL_57:

}

- (uint64_t)_pu_isVitalityLimitingAllowed
{
  void *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D75140]), "initWithAVAsset:timeZoneLookup:", a1, 0);
  if (!v2 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v5 = 138412290;
    v6 = a1;
    _os_log_error_impl(&dword_1AAB61000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Attempted to load vitality limiting from asset %@, but an error occurred", (uint8_t *)&v5, 0xCu);
  }
  v3 = objc_msgSend(v2, "livePhotoVitalityLimitingAllowed");

  return v3;
}

- (uint64_t)_pu_getVitalityTransform:()PUPerspectiveTransform dimensions:
{
  void *v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  BOOL v20;
  uint64_t v21;
  int v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  objc_getAssociatedObject(a1, (const void *)VitalityTransformKey);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_getAssociatedObject(a1, (const void *)DimensionsKey);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v7)
    v10 = v8 == 0;
  else
    v10 = 1;
  if (v10)
  {
    v11 = (void *)objc_msgSend(a1, "pu_stillAssetTransformMetadataPair");
    v13 = v12;
    v14 = v11;
    if (v11)
    {
      v15 = (void *)MEMORY[0x1E0CB3B18];
      objc_msgSend(a1, "pu_perspectiveTransformForMetadata:", v14);
      objc_msgSend(v15, "pu_valueWithPUPerspectiveTransform:");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_setAssociatedObject(a1, (const void *)VitalityTransformKey, v16, (void *)1);
      v7 = v16;
    }
    v17 = v13;
    v18 = v17;
    if (v13)
    {
      objc_msgSend(v17, "value");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_setAssociatedObject(a1, (const void *)DimensionsKey, v19, (void *)1);
      v9 = v19;
    }

  }
  if (v9)
    v20 = v7 == 0;
  else
    v20 = 1;
  v21 = !v20;
  if (!v20)
  {
    objc_msgSend(v7, "pu_PUPerspectiveTransformValue");
    *(_DWORD *)(a3 + 8) = v22;
    *(_DWORD *)(a3 + 24) = v23;
    *(_QWORD *)a3 = v24;
    *(_QWORD *)(a3 + 16) = v25;
    *(_DWORD *)(a3 + 40) = v26;
    *(_QWORD *)(a3 + 32) = v27;
    objc_msgSend(v9, "sizeValue");
    *a4 = v28;
    a4[1] = v29;
  }

  return v21;
}

- (__n128)pu_perspectiveTransformForMetadata:()PUPerspectiveTransform
{
  _OWORD *v3;
  void *v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  __int128 v12;
  _OWORD v13[3];

  v3 = (_OWORD *)MEMORY[0x1E0C83FE8];
  if (a3)
  {
    objc_msgSend(a3, "value");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 0;
    v6 = v3[1];
    v13[0] = *v3;
    v13[1] = v6;
    v13[2] = v3[2];
    do
    {
      v7 = 0;
      v8 = v5;
      do
      {
        objc_msgSend(v4, "objectAtIndexedSubscript:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "floatValue");
        *((_DWORD *)&v13[v5] + v7) = v10;

        ++v7;
        v8 += 3;
      }
      while (v7 != 3);
      ++v5;
    }
    while (v5 != 3);
    v12 = v13[0];

    return (__n128)v12;
  }
  else
  {
    return *(__n128 *)MEMORY[0x1E0C83FE8];
  }
}

- (void)pu_stillAssetTransformMetadataPair
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  opaqueCMSampleBuffer *v10;
  opaqueCMSampleBuffer *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  id v26;

  objc_msgSend(a1, "pu_stillImageTransformAssetTrack");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C8B000], "assetReaderTrackOutputWithTrack:outputSettings:", v2, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0;
    objc_msgSend(MEMORY[0x1E0C8AFD0], "assetReaderWithAsset:error:", a1, &v26);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v26;
    v6 = v5;
    if (v4)
    {
      v23 = v5;
      v24 = v2;
      objc_msgSend(v4, "addOutput:", v3);
      v22 = v4;
      objc_msgSend(v4, "startReading");
      v7 = 0;
      v8 = 0;
      v25 = *MEMORY[0x1E0CA2570];
      v9 = *MEMORY[0x1E0CA2578];
      while (1)
      {
        v10 = (opaqueCMSampleBuffer *)objc_msgSend(v3, "copyNextSampleBuffer");
        if (!v10)
          break;
        v11 = v10;
        if (CMSampleBufferGetNumSamples(v10))
        {
          v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C8B3B0]), "initWithSampleBuffer:", v11);
          v13 = (void *)MEMORY[0x1E0C8B220];
          objc_msgSend(v12, "items");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "metadataItemsFromArray:filteredByIdentifier:", v14, v25);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "firstObject");
          v16 = objc_claimAutoreleasedReturnValue();

          v17 = (void *)MEMORY[0x1E0C8B220];
          objc_msgSend(v12, "items");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "metadataItemsFromArray:filteredByIdentifier:", v18, v9);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "firstObject");
          v20 = objc_claimAutoreleasedReturnValue();

          v7 = (void *)v20;
          v8 = (void *)v16;
        }
        CFRelease(v11);
        if (v8)
        {
          if (v7)
            break;
        }
      }
      v4 = v22;
      objc_msgSend(v22, "cancelReading");
      v6 = v23;
      v2 = v24;
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end
