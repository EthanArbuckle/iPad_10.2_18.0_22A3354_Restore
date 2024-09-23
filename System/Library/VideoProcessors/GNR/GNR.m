void computeNoiseModel(uint64_t a1, void *a2, float *a3, int a4, char a5, int a6)
{
  id *v11;
  float v12;
  float v13;
  int *v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float *v26;
  id *v27;
  uint64_t v28;
  float v29;
  float v30;
  float v31;
  float v32;
  float v33;
  float v34;
  id *v35;

  v11 = a2;
  v12 = *a3;
  v35 = v11;
  if (a6)
  {
    v13 = exp2f(a3[8]);
    v11 = v35;
    v12 = v12 / sqrtf(v13);
  }
  if (objc_msgSend(v11[11], "count") <= (unint64_t)a4)
  {
    v22 = 1.0;
    v33 = 0.0;
    v34 = 0.0;
    v21 = 0.0;
    v20 = 0.0;
    v24 = 0.0;
    v23 = 0.0;
    v32 = 1.0;
    v15 = 1.0;
  }
  else
  {
    objc_msgSend(v35[11], "objectAtIndexedSubscript:", a4);
    v14 = (int *)objc_claimAutoreleasedReturnValue();
    v15 = interpolate_with_gain((uint64_t)(v14 + 6), v12);
    v16 = interpolate_with_gain((uint64_t)(v14 + 2), v12);
    v17 = interpolate_with_gain((uint64_t)(v14 + 10), v12);
    if (a3[7] < 0.0)
    {
      if (v14[18] >= 1)
        v15 = interpolate_with_gain((uint64_t)(v14 + 18), v12);
      if (v14[14] >= 1)
        v16 = interpolate_with_gain((uint64_t)(v14 + 14), v12);
      if (v14[22] >= 1)
        v17 = interpolate_with_gain((uint64_t)(v14 + 22), v12);
    }
    v18 = 0.0;
    v19 = 0.0;
    if (v14[26] >= 1)
      v19 = interpolate_with_gain((uint64_t)(v14 + 26), v12);
    v33 = v19;
    if (v14[30] >= 1)
      v18 = interpolate_with_gain((uint64_t)(v14 + 30), v12);
    v34 = v18;
    v20 = 0.0;
    v21 = 0.0;
    if (v14[34] >= 1)
      v21 = interpolate_with_gain((uint64_t)(v14 + 34), v12);
    v32 = v16;
    if (v14[38] >= 1)
      v20 = interpolate_with_gain((uint64_t)(v14 + 38), v12);
    v22 = v17;
    v23 = 0.0;
    v24 = 0.0;
    if (v14[42] >= 1)
      v24 = interpolate_with_gain((uint64_t)(v14 + 42), v12);
    if (v14[58] >= 1)
      v23 = interpolate_with_gain((uint64_t)(v14 + 58), v12);

  }
  v25 = interpolate_with_gain((uint64_t)(v35 + 9), v12);
  if ((a5 & 1) != 0)
  {
    v26 = (float *)a1;
    v27 = v35;
    v28 = (uint64_t)a3;
    v29 = v12;
    v30 = v15;
    v31 = v32;
  }
  else
  {
    v30 = 1.0;
    v31 = 1.0;
    v26 = (float *)a1;
    v27 = v35;
    v28 = (uint64_t)a3;
    v29 = v12;
  }
  getLumaChromaNoiseThreshold(v26, v27, v28, a4, v29, v30, v31);
  *(float *)(a1 + 24) = v22;
  *(_DWORD *)(a1 + 28) = 1065353216;
  *(float *)(a1 + 32) = v33;
  *(float *)(a1 + 36) = v34;
  *(float *)(a1 + 40) = v21;
  *(float *)(a1 + 44) = v25;
  *(float *)(a1 + 48) = v20;
  *(float *)(a1 + 60) = v24;
  *(float *)(a1 + 64) = v23;
  *(_QWORD *)(a1 + 68) = *(id *)((char *)v35 + 44);
  *(_DWORD *)(a1 + 76) = *((_DWORD *)v35 + 13);
  *(_QWORD *)(a1 + 80) = v35[7];
  *(_DWORD *)(a1 + 88) = *((_DWORD *)v35 + 16);
  *(_DWORD *)(a1 + 52) = *((_DWORD *)v35 + 25);
  *(_DWORD *)(a1 + 56) = *((_DWORD *)v35 + 26);

}

uint64_t sbp_setProperty(uint64_t a1, const void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;

  v5 = *(id *)CMBaseObjectGetDerivedStorage();
  if (!v5)
  {
LABEL_4:
    v6 = FigSignalErrorAt();
    goto LABEL_5;
  }
  if (CFEqual(a2, (CFTypeRef)*MEMORY[0x24BE11E28]))
  {
    v6 = objc_msgSend(v5, "processSequence");
LABEL_5:
    v7 = v6;

    return v7;
  }
  if (!CFEqual(a2, (CFTypeRef)*MEMORY[0x24BE11E60]))
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v6 = objc_msgSend(v5, "setValue:forProperty:", a3, a2);
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  if (objc_msgSend(a3, "BOOLValue"))
    objc_msgSend(v5, "resetState");

  return 0;
}

unint64_t getLTM_validWidth(_WORD *a1)
{
  switch(*a1)
  {
    case 1:
    case 2:
    case 3:
    case 4:
      return (unsigned __int16)a1[1] - ((unsigned __int16)a1[7] + (unint64_t)(unsigned __int16)a1[8]);
    default:
      if (*a1 == 1001)
        return (unsigned __int16)a1[1] - ((unsigned __int16)a1[7] + (unint64_t)(unsigned __int16)a1[8]);
      else
        return 0;
  }
}

uint64_t FigSampleBufferProcessorCreateForAny(objc_class *a1, uint64_t a2, void *a3, _QWORD *a4)
{
  uint64_t v7;
  _QWORD *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  const void **DerivedStorage;
  const void *v14;

  FigSampleBufferProcessorGetClassID();
  v7 = CMDerivedObjectCreate();
  if ((_DWORD)v7)
  {
    v12 = v7;
    FigDebugAssert3();
    v9 = 0;
    DerivedStorage = (const void **)CMBaseObjectGetDerivedStorage();
    v14 = *DerivedStorage;
    if (!*DerivedStorage)
      goto LABEL_6;
    goto LABEL_5;
  }
  v8 = (_QWORD *)CMBaseObjectGetDerivedStorage();
  v9 = a3;
  v10 = (void *)objc_msgSend([a1 alloc], "initWithOptions:", v9);
  if (!v10)
  {
    v12 = 0xFFFFFFFFLL;
    DerivedStorage = (const void **)CMBaseObjectGetDerivedStorage();
    v14 = *DerivedStorage;
    if (!*DerivedStorage)
      goto LABEL_6;
LABEL_5:
    CFRelease(v14);
    *DerivedStorage = 0;
    goto LABEL_6;
  }
  v11 = v10;
  CFRetain(v10);
  *v8 = v11;
  *a4 = 0;

  v12 = 0;
LABEL_6:

  return v12;
}

void Pyramid_destructor(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  if (a1)
  {
    v2 = (void *)a1[2];
    if (v2)
    {
      free(v2);
      a1[2] = 0;
    }
    v3 = (void *)a1[3];
    if (v3)
    {
      free(v3);
      a1[3] = 0;
    }
    v4 = (void *)a1[4];
    if (v4)
    {
      free(v4);
      a1[4] = 0;
    }
    v5 = (void *)a1[5];
    if (v5)
    {
      free(v5);
      a1[5] = 0;
    }
    v6 = (void *)a1[6];
    if (v6)
    {
      free(v6);
      a1[6] = 0;
    }
    v7 = (void *)a1[7];
    if (v7)
    {
      free(v7);
      a1[7] = 0;
    }
    v8 = (void *)a1[8];
    if (v8)
    {
      free(v8);
      a1[8] = 0;
    }
    v9 = (void *)a1[9];
    if (v9)
    {
      free(v9);
      a1[9] = 0;
    }
    v10 = (void *)a1[10];
    if (v10)
    {
      free(v10);
      a1[10] = 0;
    }
    v11 = (void *)a1[11];
    if (v11)
      free(v11);
    free(a1);
  }
}

void sub_216F600FC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t *FeatureMatcher_constructor()
{
  int64x2_t *v0;
  uint64_t *v1;
  void *v2;
  void *v4;
  void *v5;

  v0 = (int64x2_t *)malloc_type_calloc(0x330uLL, 1uLL, 0x684EFA7BuLL);
  v1 = (uint64_t *)v0;
  if (!v0)
    return v1;
  *v0 = vdupq_n_s64(0xBuLL);
  v0[1] = vdupq_n_s64(0x17uLL);
  v0[2].i64[0] = 529;
  v0[50].i16[4] = 0;
  v0[2].i64[1] = (uint64_t)malloc_type_calloc(0x844uLL, 1uLL, 0xFC9EB72EuLL);
  v1[6] = (uint64_t)malloc_type_calloc(4 * v1[4], 1uLL, 0x4C7C9D80uLL);
  v2 = malloc_type_calloc(4 * v1[4], 1uLL, 0xE2134AE9uLL);
  v1[8] = (uint64_t)v2;
  if (v1[5])
  {
    if (v1[6] && v2)
      return v1;
  }
  if (v2)
  {
    free(v2);
    v1[8] = 0;
  }
  v4 = (void *)v1[6];
  if (v4)
  {
    free(v4);
    v1[6] = 0;
  }
  v5 = (void *)v1[5];
  if (v5)
    free(v5);
  free(v1);
  return 0;
}

uint64_t sbp_setOutputCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  _QWORD v7[6];

  v5 = *(void **)CMBaseObjectGetDerivedStorage();
  if (!v5)
    return FigSignalErrorAt();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __sbp_setOutputCallback_block_invoke;
  v7[3] = &__block_descriptor_48_e34_v20__0i8__opaqueCMSampleBuffer__12l;
  v7[4] = a2;
  v7[5] = a3;
  objc_msgSend(v5, "onOutput:", v7);
  return 0;
}

unint64_t *RansacEngine_constructor(unint64_t a1)
{
  unint64_t *v2;
  unint64_t *v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v2 = (unint64_t *)malloc_type_calloc(0x40uLL, 1uLL, 0xF2B40F10uLL);
  v3 = v2;
  if (!v2)
    goto LABEL_12;
  *v2 = a1;
  v2[1] = (unint64_t)malloc_type_calloc(8 * a1, 1uLL, 0xB85DB823uLL);
  v3[2] = (unint64_t)malloc_type_calloc(4 * a1, 1uLL, 0xB1FEC377uLL);
  v3[3] = (unint64_t)malloc_type_calloc(4 * a1, 1uLL, 0x8078C128uLL);
  v3[4] = (unint64_t)malloc_type_calloc(4 * a1, 1uLL, 0xA0F9A1BEuLL);
  v3[5] = (unint64_t)malloc_type_calloc(2 * a1, 1uLL, 0xE7969C0DuLL);
  RigidTransform_constructor();
  v3[7] = v4;
  v5 = v3[1];
  if (!v5)
    goto LABEL_12;
  if (v3[2] && v3[3] && v3[4] && v3[5] && v4)
  {
    if (*v3)
    {
      v6 = 0;
      do
      {
        *(_QWORD *)(v5 + 8 * v6) = v6;
        ++v6;
      }
      while (v6 < *v3);
    }
    return v3;
  }
  else
  {
LABEL_12:
    RansacEngine_destructor(v3);
    return 0;
  }
}

void HomographyTransform_destructor(void *a1)
{
  if (a1)
    free(a1);
}

void RegistrationEngine_destructor(uint64_t a1)
{
  RegistrationEngine_purgeResources(a1);
  if (a1)
  {
    RansacEngine_destructor(*(_QWORD **)(a1 + 9624));
    FeatureMatcher_destructor(*(_QWORD **)(a1 + 9616));
    HomographyTransform_destructor(*(void **)(a1 + 32));
    HomographyTransform_destructor(*(void **)(a1 + 16));
    HomographyTransform_destructor(*(void **)(a1 + 24));
    HomographyTransform_destructor(*(void **)(a1 + 40));
    bzero((void *)a1, 0x25A8uLL);
    free((void *)a1);
  }
}

uint64_t sbp_invalidate()
{
  CFTypeRef *DerivedStorage;

  DerivedStorage = (CFTypeRef *)CMBaseObjectGetDerivedStorage();
  if (*DerivedStorage)
  {
    CFRelease(*DerivedStorage);
    *DerivedStorage = 0;
  }
  return 0;
}

void sub_216F608EC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t invertLTMCurves(_WORD *a1, uint64_t a2, float a3, double a4, float a5)
{
  unint64_t v5;
  float v6;
  float v7;
  float v8;
  float v9;
  uint64_t v10;
  unsigned int v11;
  unint64_t v12;
  unsigned int v13;
  float v14;
  float v15;
  unint64_t v16;
  float v17;
  float v18;
  float v19;
  float v20;
  uint64_t v21;
  unint64_t v22;
  unsigned int v23;
  float v24;
  float v25;
  int v26;
  _WORD *v27;
  _WORD *v28;
  _WORD *v29;
  _WORD *v30;
  _WORD *v31;
  unint64_t v32;
  _WORD *v33;
  _WORD *v34;
  _WORD *v35;
  _WORD *v36;
  _WORD *v37;
  float v38;
  float v39;
  uint64_t v40;
  unsigned int v41;
  float v42;
  unint64_t v43;
  float v44;
  int v45;
  unint64_t v46;
  _WORD *v47;
  _WORD *v48;
  _WORD *v49;
  _WORD *v50;
  float v51;
  float v52;
  uint64_t v53;
  unint64_t v54;
  unsigned int v55;
  float v56;
  float v57;
  int v58;
  unint64_t v59;
  _WORD *v60;
  _WORD *v61;
  _WORD *v62;
  float v63;
  float v64;
  uint64_t v65;
  unint64_t v66;
  unsigned int v67;
  float v68;
  float v69;
  int v70;
  unint64_t v71;
  _WORD *v72;
  _WORD *v73;
  float v74;
  float v75;
  uint64_t v76;
  unint64_t v77;
  unsigned int v78;
  float v79;
  float v80;
  int v81;
  unint64_t v82;
  _WORD *v83;
  float v84;
  float v85;
  uint64_t v86;
  unint64_t v87;
  unsigned int v88;
  float v89;
  float v90;
  int v91;
  uint64_t v92;
  unint64_t v93;
  float v94;
  float v95;
  uint64_t v96;
  unint64_t v97;
  unsigned int v98;
  float v99;
  float v100;

  v5 = 0;
  LOWORD(a3) = a1[1584];
  v6 = (float)LODWORD(a3) * 0.000015259;
  LOWORD(a5) = a1[1585];
  v7 = (float)LODWORD(a5) * 0.000015259;
  v8 = 0.0;
  v9 = 0.0038911;
  v10 = 1;
  v11 = 1.0;
  while (1)
  {
    HIWORD(v13) = 15232;
    v14 = (float)v5 * 0.0039062;
    if (v14 > v7)
      break;
    v12 = v10;
LABEL_3:
    *(_WORD *)(a2 + 24576 + 2 * v5) = (int)(float)(fminf((float)((float)((float)(v14 - v6) * (float)(v9 - v8))/ (float)(v7 - v6))+ v8, 1.0)* 65535.0);
    v10 = v12;
    if (++v5 == 256)
    {
      v16 = 0;
      LOWORD(v6) = a1[1841];
      v17 = (float)LODWORD(v6) * 0.000015259;
      LOWORD(v11) = a1[1842];
      v18 = (float)v11 * 0.000015259;
      v19 = 0.0;
      v20 = 0.0038911;
      v21 = 1;
      while (1)
      {
        HIWORD(v23) = 15232;
        v24 = (float)v16 * 0.0039062;
        if (v24 > v18)
          break;
        v22 = v21;
LABEL_10:
        *(_WORD *)(a2 + 25088 + 2 * v16) = (int)(float)(fminf((float)((float)((float)(v24 - v17) * (float)(v20 - v19))/ (float)(v18 - v17))+ v19, 1.0)* 65535.0);
        v21 = v22;
        if (++v16 == 256)
        {
          v26 = 0;
          v27 = a1 + 166;
          v28 = a1 + 133;
          v29 = a1 + 100;
          v30 = a1 + 67;
          v31 = a1 + 34;
          while (2)
          {
            v32 = 0;
            v33 = v27;
            v34 = v28;
            v35 = v29;
            v36 = v30;
            v37 = v31;
            LOWORD(v19) = *a1;
            v19 = (float)LODWORD(v19) * 0.000015259;
            LOWORD(v18) = a1[1];
            v18 = (float)LODWORD(v18) * 0.000015259;
            v38 = 0.0;
            v39 = 0.030303;
            v40 = 1;
            do
            {
              HIWORD(v41) = 15232;
              v42 = (float)v32 * 0.0039062;
              if (v42 > v18)
              {
                v43 = v40 + 1;
                while (v43 <= 0x20)
                {
                  v38 = v39;
                  v19 = v18;
                  v40 = v43;
                  LOWORD(v41) = a1[v43];
                  v39 = (float)v43 * 0.030303;
                  v44 = (float)v41;
                  HIWORD(v41) = 14208;
                  v18 = v44 * 0.000015259;
                  ++v43;
                  if (v42 <= v18)
                    goto LABEL_18;
                }
                goto LABEL_71;
              }
LABEL_18:
              *(_WORD *)(a2 + 2 * v32++) = (int)(float)(fminf((float)((float)((float)(v42 - v19) * (float)(v39 - v38))/ (float)(v18 - v19))+ v38, 1.0)* 65535.0);
            }
            while (v32 != 256);
            a1 += 33;
            a2 += 512;
            ++v26;
            v27 = v33 + 33;
            v28 = v34 + 33;
            v29 += 33;
            v30 += 33;
            v31 += 33;
            if (v26 != 8)
              continue;
            break;
          }
          v45 = 0;
          while (2)
          {
            v46 = 0;
            v47 = v33;
            v48 = v34;
            v49 = v35;
            v50 = v36;
            LOWORD(v19) = *a1;
            v19 = (float)LODWORD(v19) * 0.000015259;
            LOWORD(v18) = a1[1];
            v18 = (float)LODWORD(v18) * 0.000015259;
            v51 = 0.0;
            v52 = 0.030303;
            v53 = 1;
            do
            {
              HIWORD(v55) = 15232;
              v56 = (float)v46 * 0.0039062;
              if (v56 > v18)
              {
                while (1)
                {
                  v54 = v53 + 1;
                  if ((unint64_t)(v53 + 1) > 0x20)
                    goto LABEL_71;
                  v51 = v52;
                  v19 = v18;
                  LOWORD(v55) = v37[v53];
                  v52 = (float)v54 * 0.030303;
                  v57 = (float)v55;
                  HIWORD(v55) = 14208;
                  v18 = v57 * 0.000015259;
                  ++v53;
                  if (v56 <= v18)
                    goto LABEL_30;
                }
              }
              v54 = v53;
LABEL_30:
              *(_WORD *)(a2 + 2 * v46) = (int)(float)(fminf((float)((float)((float)(v56 - v19) * (float)(v52 - v51))/ (float)(v18 - v19))+ v51, 1.0)* 65535.0);
              v53 = v54;
              ++v46;
            }
            while (v46 != 256);
            a1 += 33;
            a2 += 512;
            ++v45;
            v33 = v47 + 33;
            v34 = v48 + 33;
            v35 += 33;
            v36 += 33;
            v37 += 33;
            if (v45 != 8)
              continue;
            break;
          }
          v58 = 0;
          while (2)
          {
            v59 = 0;
            v60 = v47;
            v61 = v48;
            v62 = v49;
            LOWORD(v19) = *a1;
            v19 = (float)LODWORD(v19) * 0.000015259;
            LOWORD(v18) = a1[1];
            v18 = (float)LODWORD(v18) * 0.000015259;
            v63 = 0.0;
            v64 = 0.030303;
            v65 = 1;
            do
            {
              HIWORD(v67) = 15232;
              v68 = (float)v59 * 0.0039062;
              if (v68 > v18)
              {
                while (1)
                {
                  v66 = v65 + 1;
                  if ((unint64_t)(v65 + 1) > 0x20)
                    goto LABEL_71;
                  v63 = v64;
                  v19 = v18;
                  LOWORD(v67) = v50[v65];
                  v64 = (float)v66 * 0.030303;
                  v69 = (float)v67;
                  HIWORD(v67) = 14208;
                  v18 = v69 * 0.000015259;
                  ++v65;
                  if (v68 <= v18)
                    goto LABEL_39;
                }
              }
              v66 = v65;
LABEL_39:
              *(_WORD *)(a2 + 2 * v59) = (int)(float)(fminf((float)((float)((float)(v68 - v19) * (float)(v64 - v63))/ (float)(v18 - v19))+ v63, 1.0)* 65535.0);
              v65 = v66;
              ++v59;
            }
            while (v59 != 256);
            a1 += 33;
            a2 += 512;
            ++v58;
            v47 = v60 + 33;
            v48 = v61 + 33;
            v49 += 33;
            v50 += 33;
            if (v58 != 8)
              continue;
            break;
          }
          v70 = 0;
          while (2)
          {
            v71 = 0;
            v72 = v60;
            v73 = v61;
            LOWORD(v19) = *a1;
            v19 = (float)LODWORD(v19) * 0.000015259;
            LOWORD(v18) = a1[1];
            v18 = (float)LODWORD(v18) * 0.000015259;
            v74 = 0.0;
            v75 = 0.030303;
            v76 = 1;
            do
            {
              HIWORD(v78) = 15232;
              v79 = (float)v71 * 0.0039062;
              if (v79 > v18)
              {
                while (1)
                {
                  v77 = v76 + 1;
                  if ((unint64_t)(v76 + 1) > 0x20)
                    goto LABEL_71;
                  v74 = v75;
                  v19 = v18;
                  LOWORD(v78) = v62[v76];
                  v75 = (float)v77 * 0.030303;
                  v80 = (float)v78;
                  HIWORD(v78) = 14208;
                  v18 = v80 * 0.000015259;
                  ++v76;
                  if (v79 <= v18)
                    goto LABEL_48;
                }
              }
              v77 = v76;
LABEL_48:
              *(_WORD *)(a2 + 2 * v71) = (int)(float)(fminf((float)((float)((float)(v79 - v19) * (float)(v75 - v74))/ (float)(v18 - v19))+ v74, 1.0)* 65535.0);
              v76 = v77;
              ++v71;
            }
            while (v71 != 256);
            a1 += 33;
            a2 += 512;
            ++v70;
            v60 = v72 + 33;
            v61 = v73 + 33;
            v62 += 33;
            if (v70 != 8)
              continue;
            break;
          }
          v81 = 0;
          while (2)
          {
            v82 = 0;
            v83 = v72;
            LOWORD(v19) = *a1;
            v19 = (float)LODWORD(v19) * 0.000015259;
            LOWORD(v18) = a1[1];
            v18 = (float)LODWORD(v18) * 0.000015259;
            v84 = 0.0;
            v85 = 0.030303;
            v86 = 1;
            do
            {
              HIWORD(v88) = 15232;
              v89 = (float)v82 * 0.0039062;
              if (v89 > v18)
              {
                while (1)
                {
                  v87 = v86 + 1;
                  if ((unint64_t)(v86 + 1) > 0x20)
                    goto LABEL_71;
                  v84 = v85;
                  v19 = v18;
                  LOWORD(v88) = v73[v86];
                  v85 = (float)v87 * 0.030303;
                  v90 = (float)v88;
                  HIWORD(v88) = 14208;
                  v18 = v90 * 0.000015259;
                  ++v86;
                  if (v89 <= v18)
                    goto LABEL_57;
                }
              }
              v87 = v86;
LABEL_57:
              *(_WORD *)(a2 + 2 * v82) = (int)(float)(fminf((float)((float)((float)(v89 - v19) * (float)(v85 - v84))/ (float)(v18 - v19))+ v84, 1.0)* 65535.0);
              v86 = v87;
              ++v82;
            }
            while (v82 != 256);
            a1 += 33;
            a2 += 512;
            ++v81;
            v72 = v83 + 33;
            v73 += 33;
            if (v81 != 8)
              continue;
            break;
          }
          v91 = 0;
LABEL_64:
          v93 = 0;
          LOWORD(v19) = *a1;
          v19 = (float)LODWORD(v19) * 0.000015259;
          LOWORD(v18) = a1[1];
          v18 = (float)LODWORD(v18) * 0.000015259;
          v94 = 0.0;
          v95 = 0.030303;
          v96 = 1;
          while (1)
          {
            HIWORD(v98) = 15232;
            v99 = (float)v93 * 0.0039062;
            if (v99 > v18)
              break;
            v97 = v96;
LABEL_66:
            *(_WORD *)(a2 + 2 * v93) = (int)(float)(fminf((float)((float)((float)(v99 - v19) * (float)(v95 - v94))/ (float)(v18 - v19))+ v94, 1.0)* 65535.0);
            v96 = v97;
            if (++v93 == 256)
            {
              v92 = 0;
              a1 += 33;
              a2 += 512;
              ++v91;
              v83 += 33;
              if (v91 == 8)
                return v92;
              goto LABEL_64;
            }
          }
          while (1)
          {
            v97 = v96 + 1;
            if ((unint64_t)(v96 + 1) > 0x20)
              goto LABEL_71;
            v94 = v95;
            v19 = v18;
            LOWORD(v98) = v83[v96];
            v95 = (float)v97 * 0.030303;
            v100 = (float)v98;
            HIWORD(v98) = 14208;
            v18 = v100 * 0.000015259;
            ++v96;
            if (v99 <= v18)
              goto LABEL_66;
          }
        }
      }
      while (1)
      {
        v22 = v21 + 1;
        if ((unint64_t)(v21 + 1) > 0x100)
          goto LABEL_71;
        v19 = v20;
        v17 = v18;
        LOWORD(v23) = a1[v21 + 1842];
        v20 = (float)v22 * 0.0038911;
        v25 = (float)v23;
        HIWORD(v23) = 14208;
        v18 = v25 * 0.000015259;
        ++v21;
        if (v24 <= v18)
          goto LABEL_10;
      }
    }
  }
  while (1)
  {
    v12 = v10 + 1;
    if ((unint64_t)(v10 + 1) > 0x100)
      break;
    v8 = v9;
    v6 = v7;
    LOWORD(v13) = a1[v10 + 1585];
    v9 = (float)v12 * 0.0038911;
    v15 = (float)v13;
    HIWORD(v13) = 14208;
    v7 = v15 * 0.000015259;
    ++v10;
    if (v14 <= v7)
      goto LABEL_3;
  }
LABEL_71:
  FigDebugAssert3();
  v92 = 4294954516;
  FigDebugAssert3();
  return v92;
}

void RegistrationEngine_purgeResources(uint64_t a1)
{
  if (a1)
  {
    IPDetector_destructor(*(_QWORD **)(a1 + 9608));
    *(_QWORD *)(a1 + 9608) = 0;
    Pyramid_destructor(*(_QWORD **)a1);
    *(_QWORD *)a1 = 0;
    Pyramid_destructor(*(_QWORD **)(a1 + 8));
    *(_QWORD *)(a1 + 8) = 0;
    HomographyTransform_destructor(*(void **)(a1 + 48));
    *(_QWORD *)(a1 + 48) = 0;
    HomographyTransform_destructor(*(void **)(a1 + 56));
    *(_QWORD *)(a1 + 56) = 0;
    HomographyTransform_destructor(*(void **)(a1 + 64));
    *(_QWORD *)(a1 + 64) = 0;
    HomographyTransform_destructor(*(void **)(a1 + 72));
    *(_QWORD *)(a1 + 72) = 0;
    HomographyTransform_destructor(*(void **)(a1 + 80));
    *(_QWORD *)(a1 + 80) = 0;
    HomographyTransform_destructor(*(void **)(a1 + 88));
    *(_QWORD *)(a1 + 88) = 0;
    HomographyTransform_destructor(*(void **)(a1 + 96));
    *(_QWORD *)(a1 + 96) = 0;
    HomographyTransform_destructor(*(void **)(a1 + 104));
    *(_QWORD *)(a1 + 104) = 0;
    HomographyTransform_destructor(*(void **)(a1 + 112));
    *(_QWORD *)(a1 + 112) = 0;
    HomographyTransform_destructor(*(void **)(a1 + 120));
    *(_QWORD *)(a1 + 120) = 0;
  }
}

uint64_t FigSampleBufferProcessorCreateForGNR(uint64_t a1, void *a2, _QWORD *a3)
{
  objc_class *v6;

  v6 = (objc_class *)objc_opt_class();
  return FigSampleBufferProcessorCreateForAny(v6, a1, a2, a3);
}

uint64_t get_tuning_for_sensor_id(void *a1, void *a2, void *a3, void *a4)
{
  id v7;
  const char *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  int v20;
  uint64_t v21;
  id v22;
  NoiseModelDeviceParameters *v23;
  void *v24;
  void *v25;
  uint64_t i;
  void *v27;
  BandDataNM *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  void *v34;
  void *v35;
  void *v36;
  int *p_length;
  int v38;
  int v39;
  NoiseModelDeviceParameters *v40;
  int v41;
  void *v42;
  void *v43;
  void *v44;
  float v45;
  void *v46;
  float v47;
  void *v48;
  float v49;
  void *v50;
  float v51;
  void *v52;
  float v53;
  void *v54;
  float v55;
  void *v56;
  float v57;
  void *v58;
  float v59;
  void *v60;
  float v61;
  void *v62;
  void *v63;
  void *v64;
  float v65;
  void *v66;
  void *v67;
  float v68;
  void *v69;
  void *v70;
  float v71;
  void *v72;
  void *v73;
  void *v74;
  float v75;
  void *v76;
  void *v77;
  float v78;
  void *v79;
  void *v80;
  float v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  float v86;
  void *v87;
  float v88;
  void *v89;
  float v90;
  int v91;
  int v92;
  id v93;
  FusionDeviceParameters *v94;
  void *v95;
  uint64_t v96;
  void *v97;
  BandDataFusion *v98;
  id v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t k;
  int v104;
  void *v105;
  void *v106;
  int v107;
  void *v108;
  void *v109;
  int *v110;
  int *v111;
  int v112;
  int v113;
  int v114;
  int v115;
  uint64_t v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  float v121;
  void *v122;
  float v123;
  void *v124;
  float v125;
  void *v126;
  float v127;
  void *v128;
  float v129;
  void *v130;
  float v131;
  void *v132;
  float v133;
  void *v134;
  float v135;
  void *v136;
  float v137;
  void *v138;
  float v139;
  void *v140;
  float v141;
  void *v142;
  void *v143;
  id v144;
  uint64_t (**v145)(_QWORD);
  uint64_t v146;
  void *v147;
  int v148;
  void *v149;
  void *v150;
  float v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  float v157;
  float v158;
  id v159;
  id v160;
  void *v161;
  int v162;
  void *v163;
  void *v164;
  uint64_t v165;
  void *v166;
  void *v167;
  void *v168;
  uint64_t v169;
  void *v171;
  id v172;
  uint64_t v173;
  void *v174;
  id v175;
  id v176;
  uint64_t v177;
  id obj;
  uint64_t v179;
  id v180;
  uint64_t v181;
  uint64_t v182;
  void *v183;
  void *v184;
  id v185;
  id v186;
  uint64_t v187;
  void *v188;
  void *v189;
  id v190;
  id v191;
  id v192;
  id v193;
  id v194;
  id v195;
  id v196;
  uint64_t v197;
  uint64_t v198;
  NoiseModelDeviceParameters *v199;
  FusionDeviceParameters *v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  __int128 v204;
  __int128 v205;
  __int128 v206;
  __int128 v207;
  __int128 v208;
  __int128 v209;
  __int128 v210;
  __int128 v211;
  __int128 v212;
  __int128 v213;
  __int128 v214;
  __int128 v215;
  __int128 v216;
  __int128 v217;
  __int128 v218;
  __int128 v219;
  _BYTE v220[128];
  _BYTE v221[128];
  _BYTE v222[128];
  void *v223;
  uint64_t v224;
  BOOL (*v225)(uint64_t);
  void *v226;
  id v227;
  uint64_t v228;

  v228 = *MEMORY[0x24BDAC8D0];
  v7 = a1;
  v172 = a2;
  v176 = a3;
  v175 = a4;
  v171 = v7;
  if (v7 && (v8 = (const char *)objc_msgSend(objc_retainAutorelease(v7), "UTF8String")) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", (int)strtoul(v8, 0, 16));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v185 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v208 = 0u;
    v209 = 0u;
    v210 = 0u;
    v211 = 0u;
    obj = v172;
    v177 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v208, v221, 16);
    if (v177)
    {
      v173 = *(_QWORD *)v209;
      v174 = v9;
      v184 = v10;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v209 != v173)
            objc_enumerationMutation(obj);
          v179 = v11;
          v183 = *(void **)(*((_QWORD *)&v208 + 1) + 8 * v11);
          objc_msgSend(obj, "objectForKeyedSubscript:");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v204 = 0u;
          v205 = 0u;
          v206 = 0u;
          v207 = 0u;
          v186 = v12;
          v182 = objc_msgSend(v186, "countByEnumeratingWithState:objects:count:", &v204, v220, 16);
          if (v182)
          {
            v181 = *(_QWORD *)v205;
            do
            {
              v13 = 0;
              do
              {
                if (*(_QWORD *)v205 != v181)
                  objc_enumerationMutation(v186);
                v187 = v13;
                v14 = *(void **)(*((_QWORD *)&v204 + 1) + 8 * v13);
                objc_msgSend(v186, "objectForKeyedSubscript:", v14);
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                if (!v15)
                  goto LABEL_171;
                v192 = v15;
                v16 = v14;
                v17 = v183;
                v18 = v184;
                v190 = v185;
                v19 = v16;
                v188 = v19;
                if ((objc_msgSend(v19, "isEqualToString:", CFSTR("SingleImageParameters")) & 1) != 0)
                {
                  v20 = 0;
                  v21 = 0;
                }
                else if ((objc_msgSend(v19, "isEqualToString:", CFSTR("SingleImageParametersForISPSingleBand")) & 1) != 0)
                {
                  v20 = 0;
                  v21 = 10;
                }
                else if ((objc_msgSend(v19, "isEqualToString:", CFSTR("SingleImageParametersForStereoFusion")) & 1) != 0)
                {
                  v20 = 0;
                  v21 = 4;
                }
                else if ((objc_msgSend(v19, "isEqualToString:", CFSTR("SingleImageParametersForStereoFusedHDR")) & 1) != 0)
                {
                  v20 = 0;
                  v21 = 5;
                }
                else if ((objc_msgSend(v19, "isEqualToString:", CFSTR("SISParameters")) & 1) != 0)
                {
                  v20 = 0;
                  v21 = 1;
                }
                else if ((objc_msgSend(v19, "isEqualToString:", CFSTR("SISParametersForStereoFusion")) & 1) != 0)
                {
                  v20 = 0;
                  v21 = 6;
                }
                else if ((objc_msgSend(v19, "isEqualToString:", CFSTR("OISParameters")) & 1) != 0)
                {
                  v20 = 0;
                  v21 = 2;
                }
                else if ((objc_msgSend(v19, "isEqualToString:", CFSTR("OISParametersForStereoFusion")) & 1) != 0)
                {
                  v20 = 0;
                  v21 = 7;
                }
                else if ((objc_msgSend(v19, "isEqualToString:", CFSTR("LTMHDRParameters")) & 1) != 0)
                {
                  v20 = 1;
                  v21 = 9;
                }
                else
                {
                  if (!objc_msgSend(v19, "isEqualToString:", CFSTR("PanoramaParameters")))
                  {
                    v92 = -1;

                    goto LABEL_166;
                  }
                  v20 = 0;
                  v21 = 100;
                }

                objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v21);
                v189 = (void *)objc_claimAutoreleasedReturnValue();
                v191 = v17;
                v193 = v18;
                if ((objc_msgSend(v17, "isEqualToString:", CFSTR("NoiseModel")) & 1) != 0
                  || objc_msgSend(v17, "isEqualToString:", CFSTR("HighGainNoiseModel")))
                {
                  v22 = v192;
                  v23 = objc_alloc_init(NoiseModelDeviceParameters);
                  objc_msgSend(v22, "valueForKey:", CFSTR("Bands"));
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  v25 = v24;
                  if (v24)
                  {
                    v180 = v22;
                    v218 = 0u;
                    v219 = 0u;
                    v216 = 0u;
                    v217 = 0u;
                    v201 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v216, &v223, 16);
                    if (v201)
                    {
                      v197 = *(_QWORD *)v217;
                      v199 = v23;
                      v194 = v25;
                      do
                      {
                        for (i = 0; i != v201; ++i)
                        {
                          if (*(_QWORD *)v217 != v197)
                            objc_enumerationMutation(v194);
                          v27 = *(void **)(*((_QWORD *)&v216 + 1) + 8 * i);
                          v28 = objc_alloc_init(BandDataNM);
                          v212 = 0u;
                          v213 = 0u;
                          v214 = 0u;
                          v215 = 0u;
                          v29 = v27;
                          v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v212, v222, 16);
                          if (v30)
                          {
                            v31 = v30;
                            v32 = *(_QWORD *)v213;
                            do
                            {
                              for (j = 0; j != v31; ++j)
                              {
                                while (1)
                                {
                                  if (*(_QWORD *)v213 != v32)
                                    objc_enumerationMutation(v29);
                                  v34 = *(void **)(*((_QWORD *)&v212 + 1) + 8 * j);
                                  objc_msgSend(v29, "objectForKeyedSubscript:", v34);
                                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                                  if (objc_msgSend(v34, "isEqualToString:", CFSTR("LumaDenoiseStrength")))
                                  {
                                    v36 = v35;
                                    p_length = &v28->luma_denoise_strength.length;
                                    if (v20)
                                    {
                                      v38 = handle_evm_band_data(v35, p_length, &v28->luma_denoise_strength_evm.length);
                                      goto LABEL_76;
                                    }
                                    goto LABEL_75;
                                  }
                                  if (objc_msgSend(v34, "isEqualToString:", CFSTR("ChromaDenoiseStrength")))
                                  {
                                    v36 = v35;
                                    if (v20)
                                    {
                                      v38 = handle_evm_band_data(v35, &v28->chroma_denoise_strength.length, &v28->chroma_denoise_strength_evm.length);
                                      goto LABEL_76;
                                    }
                                    p_length = &v28->chroma_denoise_strength.length;
                                    goto LABEL_75;
                                  }
                                  if (objc_msgSend(v34, "isEqualToString:", CFSTR("LumaRemixWeight")))
                                    break;
                                  if (objc_msgSend(v34, "isEqualToString:", CFSTR("BlueBoost")))
                                  {
                                    v36 = v35;
                                    p_length = &v28->blue_boost.length;
                                    goto LABEL_75;
                                  }
                                  if (objc_msgSend(v34, "isEqualToString:", CFSTR("FlatnessBoost")))
                                  {
                                    v36 = v35;
                                    p_length = &v28->flatness_boost.length;
                                    goto LABEL_75;
                                  }
                                  if (objc_msgSend(v34, "isEqualToString:", CFSTR("FlatnessThreshold")))
                                  {
                                    v36 = v35;
                                    p_length = &v28->flatness_threshold.length;
                                    goto LABEL_75;
                                  }
                                  if (objc_msgSend(v34, "isEqualToString:", CFSTR("HaloSuppression")))
                                  {
                                    v36 = v35;
                                    p_length = &v28->halo_suppression.length;
                                    goto LABEL_75;
                                  }
                                  if (objc_msgSend(v34, "isEqualToString:", CFSTR("RadialSharpnessBoost")))
                                  {
                                    v36 = v35;
                                    p_length = &v28->radial_sharpness_boost.length;
                                    goto LABEL_75;
                                  }
                                  if ((objc_msgSend(v34, "isEqualToString:", CFSTR("RadialFlatnessBoost")) & 1) != 0)
                                  {
                                    v36 = v35;
                                    p_length = &v28->radial_flatness_boost.length;
                                    goto LABEL_75;
                                  }

                                  if (v31 == ++j)
                                    goto LABEL_80;
                                }
                                v36 = v35;
                                if (v20)
                                {
                                  v38 = handle_evm_band_data(v35, &v28->luma_remix_weight.length, &v28->luma_remix_weight_evm.length);
                                  goto LABEL_76;
                                }
                                p_length = &v28->luma_remix_weight.length;
LABEL_75:
                                v38 = handle_band_data(v36, p_length);
LABEL_76:
                                v39 = v38;

                                if (v39)
                                  goto LABEL_44;
                              }
LABEL_80:
                              v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v212, v222, 16);
                            }
                            while (v31);
                          }
LABEL_44:

                          v23 = v199;
                          -[NSMutableArray addObject:](v199->bands, "addObject:", v28);

                        }
                        v25 = v194;
                        v201 = objc_msgSend(v194, "countByEnumeratingWithState:objects:count:", &v216, &v223, 16);
                      }
                      while (v201);
                    }
                    v40 = v23;
                    v17 = v191;
                    v18 = v193;
                    v22 = v180;
                  }
                  else
                  {
                    v40 = 0;
                  }

                  v41 = objc_msgSend(v17, "isEqualToString:", CFSTR("HighGainNoiseModel"));
                  objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("HighGainThreshold"));
                  v42 = (void *)objc_claimAutoreleasedReturnValue();
                  if (!v42)
                  {
                    objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("HighGainThreshold"));
                    v43 = (void *)objc_claimAutoreleasedReturnValue();
                    v223 = &unk_24D670740;
                    v224 = (uint64_t)v43;
                    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v223, 2);
                    v42 = (void *)objc_claimAutoreleasedReturnValue();

                  }
                  handle_band_data(v42, &v40->high_gain_threshold.length);

                  objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("GammaY"));
                  v44 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v44, "floatValue");
                  v40->gammaY = v45;

                  objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("BandFactorY"));
                  v46 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v46, "floatValue");
                  v40->bandFactorY = v47;

                  objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("BiasFactor"));
                  v48 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v48, "floatValue");
                  v40->biasFactor = v49;

                  objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("SlopeFactor"));
                  v50 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v50, "floatValue");
                  v40->slopeFactor = v51;

                  objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("GammaC"));
                  v52 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v52, "floatValue");
                  v40->gammaC = v53;

                  objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("BandFactorC"));
                  v54 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v54, "floatValue");
                  v40->bandFactorC = v55;

                  objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("LensShadingFactorLuma"));
                  v56 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v56, "floatValue");
                  v40->lensShadingFactors[0] = v57;

                  objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("LensShadingFactorChroma"));
                  v58 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v58, "floatValue");
                  v40->lensShadingFactors[1] = v59;

                  objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("ChromaDemoireStrength"));
                  v60 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v60, "floatValue");
                  v40->chromaDemoireStrength = v61;

                  objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("BluenessCb"));
                  v62 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v62)
                  {
                    objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("BluenessCb"));
                    v63 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v63, "objectForKeyedSubscript:", CFSTR("start"));
                    v64 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v64, "floatValue");
                    v40->bluenessCb.start = v65;

                    objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("BluenessCb"));
                    v66 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v66, "objectForKeyedSubscript:", CFSTR("end"));
                    v67 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v67, "floatValue");
                    v40->bluenessCb.end = v68;

                    objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("BluenessCb"));
                    v69 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v69, "objectForKeyedSubscript:", CFSTR("margin"));
                    v70 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v70, "floatValue");
                    v40->bluenessCb.margin = v71;

                  }
                  else
                  {
                    v40->bluenessCb.margin = 0.05;
                    *(_QWORD *)&v40->bluenessCb.start = 0x3F8000003F266666;
                  }
                  objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("BluenessCr"));
                  v72 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v72)
                  {
                    objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("BluenessCr"));
                    v73 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v73, "objectForKeyedSubscript:", CFSTR("start"));
                    v74 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v74, "floatValue");
                    v40->bluenessCr.start = v75;

                    objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("BluenessCr"));
                    v76 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v76, "objectForKeyedSubscript:", CFSTR("end"));
                    v77 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v77, "floatValue");
                    v40->bluenessCr.end = v78;

                    objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("BluenessCr"));
                    v79 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v79, "objectForKeyedSubscript:", CFSTR("margin"));
                    v80 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v80, "floatValue");
                    v40->bluenessCr.margin = v81;

                  }
                  else
                  {
                    v40->bluenessCr.margin = 0.6;
                    *(_QWORD *)&v40->bluenessCr.start = 0;
                  }
                  objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("DisableLGAThreshold"));
                  v82 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("HighGainDenoiseThreshold"));
                  v83 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("HighGainSharpenThreshold"));
                  v84 = (void *)objc_claimAutoreleasedReturnValue();

                  if (!v41 || !v82 || !v83 || !v84)
                  {
                    if (v82)
                      v91 = 1;
                    else
                      v91 = v41;
                    if (v83)
                      v91 = 1;
                    if (v84)
                      v91 = 1;
                    v92 = v91 << 31 >> 31;
                    goto LABEL_162;
                  }
                  objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("DisableLGAThreshold"));
                  v85 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v85, "floatValue");
                  v40->disableLGAThreshold = v86;

                  objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("HighGainDenoiseThreshold"));
                  v87 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v87, "floatValue");
                  v40->highGainDenoiseThreshold = v88;

                  objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("HighGainSharpenThreshold"));
                  v89 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v89, "floatValue");
                  v40->highGainSharpenThreshold = v90;
                  goto LABEL_160;
                }
                if (objc_msgSend(v17, "isEqualToString:", CFSTR("Fusion")))
                {
                  v93 = v192;
                  v94 = objc_alloc_init(FusionDeviceParameters);
                  objc_msgSend(v93, "valueForKey:", CFSTR("Bands"));
                  v95 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v95)
                  {
                    v195 = v93;
                    v196 = v95;
                    v218 = 0u;
                    v219 = 0u;
                    v216 = 0u;
                    v217 = 0u;
                    v202 = objc_msgSend(v95, "countByEnumeratingWithState:objects:count:", &v216, &v223, 16);
                    if (v202)
                    {
                      v198 = *(_QWORD *)v217;
                      v200 = v94;
                      do
                      {
                        v96 = 0;
                        do
                        {
                          if (*(_QWORD *)v217 != v198)
                            objc_enumerationMutation(v196);
                          v203 = v96;
                          v97 = *(void **)(*((_QWORD *)&v216 + 1) + 8 * v96);
                          v98 = objc_alloc_init(BandDataFusion);
                          v212 = 0u;
                          v213 = 0u;
                          v214 = 0u;
                          v215 = 0u;
                          v99 = v97;
                          v100 = objc_msgSend(v99, "countByEnumeratingWithState:objects:count:", &v212, v222, 16);
                          if (v100)
                          {
                            v101 = v100;
                            v102 = *(_QWORD *)v213;
                            do
                            {
                              for (k = 0; k != v101; ++k)
                              {
                                while (1)
                                {
                                  if (*(_QWORD *)v213 != v102)
                                    objc_enumerationMutation(v99);
                                  v105 = *(void **)(*((_QWORD *)&v212 + 1) + 8 * k);
                                  objc_msgSend(v99, "objectForKeyedSubscript:", v105);
                                  v106 = (void *)objc_claimAutoreleasedReturnValue();
                                  if (!objc_msgSend(v105, "isEqualToString:", CFSTR("Sharpening")))
                                    break;
                                  v104 = handle_band_data(v106, &v98->sharpening.length);

                                  if (v104)
                                    goto LABEL_144;
LABEL_118:
                                  if (v101 == ++k)
                                    goto LABEL_143;
                                }
                                if (objc_msgSend(v105, "isEqualToString:", CFSTR("AdaptiveBlur")))
                                {
                                  v107 = handle_band_data(v106, &v98->adaptive_blur.length);

                                  if (v107)
                                    goto LABEL_144;
                                  goto LABEL_118;
                                }
                                if (objc_msgSend(v105, "isEqualToString:", CFSTR("DiffWeight")))
                                {
                                  objc_msgSend(v99, "objectForKeyedSubscript:", v105);
                                  v108 = (void *)objc_claimAutoreleasedReturnValue();
                                  v109 = v108;
                                  v111 = &v98->diff_weight_dense.length;
                                  v110 = &v98->diff_weight.length;
                                  goto LABEL_131;
                                }
                                if (objc_msgSend(v105, "isEqualToString:", CFSTR("LumaFusionStrength")))
                                {
                                  objc_msgSend(v99, "objectForKeyedSubscript:", v105);
                                  v108 = (void *)objc_claimAutoreleasedReturnValue();
                                  v109 = v108;
                                  v111 = &v98->luma_fusion_strength_dense.length;
                                  v110 = &v98->luma_fusion_strength.length;
                                  goto LABEL_131;
                                }
                                if (objc_msgSend(v105, "isEqualToString:", CFSTR("ChromaFusionStrength")))
                                {
                                  objc_msgSend(v99, "objectForKeyedSubscript:", v105);
                                  v108 = (void *)objc_claimAutoreleasedReturnValue();
                                  v109 = v108;
                                  v111 = &v98->chroma_fusion_strength_dense.length;
                                  v110 = &v98->chroma_fusion_strength.length;
LABEL_131:
                                  v112 = handle_dense_band_data(v108, v110, v111);

                                  if (v112)
                                    goto LABEL_144;
                                  goto LABEL_118;
                                }
                                if (objc_msgSend(v105, "isEqualToString:", CFSTR("BlackThreshold")))
                                {
                                  v113 = handle_band_data(v106, &v98->black_threshold.length);

                                  if (v113)
                                    goto LABEL_144;
                                  goto LABEL_118;
                                }
                                if (objc_msgSend(v105, "isEqualToString:", CFSTR("ChromaBlackThreshold")))
                                {
                                  v114 = handle_band_data(v106, &v98->chroma_black_threshold.length);

                                  if (v114)
                                    goto LABEL_144;
                                  goto LABEL_118;
                                }
                                if ((objc_msgSend(v105, "isEqualToString:", CFSTR("StaticOISSharpening")) & 1) != 0)
                                {
                                  v115 = handle_band_data(v106, &v98->static_ois_sharpening.length);

                                  if (v115)
                                    goto LABEL_144;
                                  goto LABEL_118;
                                }

                              }
LABEL_143:
                              v101 = objc_msgSend(v99, "countByEnumeratingWithState:objects:count:", &v212, v222, 16);
                            }
                            while (v101);
                          }
LABEL_144:

                          objc_msgSend(v99, "objectForKey:", CFSTR("BlackThreshold"));
                          v116 = objc_claimAutoreleasedReturnValue();
                          if (v116)
                          {
                            v117 = (void *)v116;
                            objc_msgSend(v99, "objectForKey:", CFSTR("ChromaBlackThreshold"));
                            v118 = (void *)objc_claimAutoreleasedReturnValue();

                            if (!v118)
                            {
                              objc_msgSend(v99, "objectForKeyedSubscript:", CFSTR("BlackThreshold"));
                              v119 = (void *)objc_claimAutoreleasedReturnValue();
                              handle_band_data(v119, &v98->chroma_black_threshold.length);

                            }
                          }
                          v94 = v200;
                          -[NSMutableArray addObject:](v200->bands, "addObject:", v98);

                          v96 = v203 + 1;
                          v18 = v193;
                        }
                        while (v203 + 1 != v202);
                        v202 = objc_msgSend(v196, "countByEnumeratingWithState:objects:count:", &v216, &v223, 16);
                      }
                      while (v202);
                    }
                    v40 = v94;
                    v93 = v195;
                    v95 = v196;
                  }
                  else
                  {
                    v40 = 0;
                  }

                  objc_msgSend(v93, "objectForKeyedSubscript:", CFSTR("TemporalFusionEffectivenessPerBracket"));
                  v120 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v120, "floatValue");
                  v40->gammaY = v121;

                  objc_msgSend(v93, "objectForKeyedSubscript:", CFSTR("GrayGhostingCutoff"));
                  v122 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v122, "floatValue");
                  v40->bandFactorY = v123;

                  objc_msgSend(v93, "objectForKeyedSubscript:", CFSTR("GrayGhostingEV0WeightThreshold"));
                  v124 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v124, "floatValue");
                  v40->biasFactor = v125;

                  objc_msgSend(v93, "objectForKeyedSubscript:", CFSTR("GrayGhostingEV0EVMDifferenceThreshold"));
                  v126 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v126, "floatValue");
                  v40->slopeFactor = v127;

                  objc_msgSend(v93, "objectForKeyedSubscript:", CFSTR("BlackSubtractionLowLimit"));
                  v128 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v128, "floatValue");
                  v40->gammaC = v129;

                  objc_msgSend(v93, "objectForKeyedSubscript:", CFSTR("BlackSubtractionClippingRatio"));
                  v130 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v130, "floatValue");
                  v40->bandFactorC = v131;

                  objc_msgSend(v93, "objectForKeyedSubscript:", CFSTR("MaximumContrastStrength"));
                  v132 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v132, "floatValue");
                  v40->lensShadingFactors[0] = v133;

                  objc_msgSend(v93, "objectForKeyedSubscript:", CFSTR("DetailEnhanceLeftLimit"));
                  v134 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v134, "floatValue");
                  v40->lensShadingFactors[1] = v135;

                  objc_msgSend(v93, "objectForKeyedSubscript:", CFSTR("DetailEnhanceRightLimit"));
                  v136 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v136, "floatValue");
                  v40->chromaDemoireStrength = v137;

                  objc_msgSend(v93, "objectForKeyedSubscript:", CFSTR("DetailEnhanceStrength"));
                  v138 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v138, "floatValue");
                  v40->bluenessCb.start = v139;

                  objc_msgSend(v93, "objectForKeyedSubscript:", CFSTR("EVPChromaWeightBoost"));
                  v140 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v140, "floatValue");
                  v40->bluenessCb.end = v141;

                  HIBYTE(v40->bluenessCr.margin) = 0;
                  objc_msgSend(v93, "valueForKey:", CFSTR("SupportLumaBlotchinessRemoval"));
                  v142 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v142)
                  {
                    objc_msgSend(v93, "objectForKeyedSubscript:", CFSTR("SupportLumaBlotchinessRemoval"));
                    v143 = (void *)objc_claimAutoreleasedReturnValue();
                    HIBYTE(v40->bluenessCr.margin) = objc_msgSend(v143, "BOOLValue");

                  }
                  LOWORD(v40->bluenessCr.margin) = 0;
                  BYTE2(v40->bluenessCr.margin) = 0;
                  v40->bluenessCb.margin = 0.0;
                  v223 = (void *)MEMORY[0x24BDAC760];
                  v224 = 3221225472;
                  v225 = __get_options_for_gnr_params_block_invoke;
                  v226 = &unk_24D669530;
                  v144 = v93;
                  v227 = v144;
                  v145 = (uint64_t (**)(_QWORD))MEMORY[0x219A0603C](&v223);
                  objc_msgSend(v144, "valueForKey:", CFSTR("SupportStaticOISMode"));
                  v146 = objc_claimAutoreleasedReturnValue();
                  if (v146)
                  {
                    v147 = (void *)v146;
                    v148 = v145[2](v145);

                    if (v148)
                    {
                      objc_msgSend(v144, "objectForKeyedSubscript:", CFSTR("SupportStaticOISMode"));
                      v149 = (void *)objc_claimAutoreleasedReturnValue();
                      LOBYTE(v40->bluenessCr.margin) = objc_msgSend(v149, "BOOLValue");

                      objc_msgSend(v144, "objectForKeyedSubscript:", CFSTR("MotionThreshold"));
                      v150 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v150, "floatValue");
                      v40->bluenessCb.margin = v151;

                    }
                  }
                  objc_msgSend(v144, "valueForKey:", CFSTR("FixPyramidAlignment"));
                  v152 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v152)
                  {
                    objc_msgSend(v144, "objectForKeyedSubscript:", CFSTR("FixPyramidAlignment"));
                    v153 = (void *)objc_claimAutoreleasedReturnValue();
                    BYTE2(v40->bluenessCr.margin) = objc_msgSend(v153, "BOOLValue");

                  }
                  objc_msgSend(v144, "valueForKey:", CFSTR("ReduceOISGhosting"));
                  v154 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v154)
                  {
                    objc_msgSend(v144, "objectForKeyedSubscript:", CFSTR("ReduceOISGhosting"));
                    v155 = (void *)objc_claimAutoreleasedReturnValue();
                    BYTE1(v40->bluenessCr.margin) = objc_msgSend(v155, "BOOLValue");

                  }
                  objc_msgSend(v144, "objectForKeyedSubscript:", CFSTR("DenseRegisterLastFrameBelowNormalizedSNR"));
                  v156 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v156, "floatValue");
                  v40->bluenessCr.start = v157;

                  objc_msgSend(v144, "objectForKeyedSubscript:", CFSTR("AccumulatedWeightSaturationOffset"));
                  v89 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v89, "floatValue");
                  v40->bluenessCr.end = v158;
LABEL_160:

                  goto LABEL_161;
                }
                v40 = 0;
LABEL_161:
                v92 = 0;
LABEL_162:
                v159 = objc_alloc_init(MEMORY[0x24BDBCED8]);
                v160 = objc_alloc_init(MEMORY[0x24BDBCED8]);
                objc_msgSend(v159, "setObject:forKeyedSubscript:", v40, v189);
                objc_msgSend(v160, "setObject:forKeyedSubscript:", v192, v189);
                objc_msgSend(v18, "allKeys");
                v161 = (void *)objc_claimAutoreleasedReturnValue();
                v162 = objc_msgSend(v161, "containsObject:", v191);

                if (v162)
                {
                  objc_msgSend(v18, "objectForKeyedSubscript:", v191);
                  v163 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v163, "addEntriesFromDictionary:", v159);

                  objc_msgSend(v190, "objectForKeyedSubscript:", v191);
                  v164 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v164, "addEntriesFromDictionary:", v160);

                }
                else
                {
                  objc_msgSend(v18, "setObject:forKeyedSubscript:", v159, v191);
                  objc_msgSend(v190, "setObject:forKeyedSubscript:", v160, v191);
                }

                v17 = v191;
                v19 = v188;

LABEL_166:
                if (v92)
                  goto LABEL_171;
                v13 = v187 + 1;
              }
              while (v187 + 1 != v182);
              v165 = objc_msgSend(v186, "countByEnumeratingWithState:objects:count:", &v204, v220, 16);
              v182 = v165;
            }
            while (v165);
          }
LABEL_171:

          v10 = v184;
          v9 = v174;
          objc_msgSend(v184, "objectForKeyedSubscript:", v174);
          v166 = (void *)objc_claimAutoreleasedReturnValue();

          if (v166)
          {
            objc_msgSend(v176, "objectForKeyedSubscript:", v174);
            v167 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v167, "addEntriesFromDictionary:", v184);

            objc_msgSend(v175, "objectForKeyedSubscript:", v174);
            v168 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v168, "addEntriesFromDictionary:", v185);

          }
          else
          {
            objc_msgSend(v176, "setObject:forKeyedSubscript:", v184, v174);
            objc_msgSend(v175, "setObject:forKeyedSubscript:", v185, v174);
          }

          v11 = v179 + 1;
        }
        while (v179 + 1 != v177);
        v177 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v208, v221, 16);
      }
      while (v177);
    }

    v169 = 0;
  }
  else
  {
    v169 = 0xFFFFFFFFLL;
  }

  return v169;
}

uint64_t __sbp_setOutputCallback_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD))(a1 + 32))(*(_QWORD *)(a1 + 40));
}

uint64_t handle_band_data(void *a1, int *a2)
{
  id v3;
  int v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  uint64_t v12;

  v3 = a1;
  v4 = objc_msgSend(v3, "count");
  if ((v4 & 1) != 0 || *((_QWORD *)a2 + 1))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v12 = 0xFFFFFFFFLL;
  }
  else
  {
    if (v4 >= 0)
      v5 = v4;
    else
      v5 = v4 + 1;
    *a2 = v5 >> 1;
    *((_QWORD *)a2 + 1) = malloc_type_calloc((uint64_t)v5 >> 1, 8uLL, 0x100004000313F17uLL);
    if (*a2 >= 1)
    {
      v6 = 0;
      v7 = 0;
      do
      {
        objc_msgSend(v3, "objectAtIndexedSubscript:", v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "floatValue");
        *(_DWORD *)(*((_QWORD *)a2 + 1) + 4 * v6) = v9;

        objc_msgSend(v3, "objectAtIndexedSubscript:", v6 + 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "floatValue");
        *(_DWORD *)(*((_QWORD *)a2 + 1) + 4 * v6 + 4) = v11;

        ++v7;
        v6 += 2;
      }
      while (v7 < *a2);
    }
    v12 = 0;
  }

  return v12;
}

uint64_t getLTM_lutsBytesPerColumn(_WORD *a1)
{
  uint64_t result;

  switch(*a1)
  {
    case 1:
    case 2:
      result = 2 * (unsigned __int16)a1[4];
      break;
    case 3:
    case 4:
      goto LABEL_4;
    default:
      if (*a1 == 1001)
LABEL_4:
        result = (unsigned __int16)a1[4];
      else
        result = 0;
      break;
  }
  return result;
}

uint64_t getLTMCurvesFromMetadata(void *a1, _OWORD *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  BOOL v8;
  _WORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  char *v19;
  uint64_t LTM_data;
  uint64_t LTM_topPadding;
  uint64_t LTM_lutsBytesPerRow;
  uint64_t LTM_leftPadding;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t LTM_lutsBytesPerColumn;
  uint64_t i;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t j;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t k;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  char *v69;
  unint64_t v70;
  unint64_t v71;
  _BOOL4 v73;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  _WORD *v107;
  uint64_t v108;
  _OWORD *v110;
  _OWORD *v111;
  _OWORD *v112;
  uint64_t v113;
  uint64_t v114;
  void *v115;
  void *v116;
  void *v117;
  id v118;
  char *v119;
  char *v120;
  char *v121;
  char *v122;
  uint64_t v123;
  uint64_t v124;
  _OWORD *v125;

  v3 = a1;
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BE11CC8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BE11C90]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BE11CA0]);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v4)
    v8 = v5 == 0;
  else
    v8 = 1;
  if (v8 || v6 == 0)
  {
    v108 = 4294954512;
  }
  else
  {
    v10 = (_WORD *)objc_msgSend(objc_retainAutorelease(v4), "bytes");
    v11 = objc_msgSend(objc_retainAutorelease(v5), "bytes");
    v12 = objc_msgSend(objc_retainAutorelease(v7), "bytes");
    if (getLTM_validWidth(v10) == 8 && getLTM_validHeight(v10) == 6 && getLTM_ltmCurveEntryCount(v10) == 33)
    {
      v115 = v7;
      v116 = v5;
      v117 = v4;
      v118 = v3;
      v13 = 0;
      v14 = 0;
      v112 = (_OWORD *)((char *)a2 + 3682);
      v113 = v12;
      v114 = v11;
      v110 = (_OWORD *)(v11 + 258);
      v111 = (_OWORD *)(v12 + 258);
      v121 = (char *)a2 + 198;
      v122 = (char *)a2 + 4;
      v119 = (char *)a2 + 396;
      v120 = (char *)a2 + 202;
      v125 = a2;
      do
      {
        v15 = 0;
        v124 = v14;
        v16 = 2 * v14;
        v17 = (char *)a2 + v16;
        v123 = v16;
        v18 = &v122[v16];
        do
        {
          v19 = v18;
          LTM_data = getLTM_data(v10, 0);
          LTM_topPadding = getLTM_topPadding(v10);
          LTM_lutsBytesPerRow = getLTM_lutsBytesPerRow(v10);
          LTM_leftPadding = getLTM_leftPadding(v10);
          *(_WORD *)&v17[2 * v15] = *(_WORD *)(LTM_data
                                             + LTM_lutsBytesPerRow * (v13 + LTM_topPadding)
                                             + LTM_leftPadding * getLTM_lutsBytesPerColumn(v10)
                                             + 2 * v15);
          ++v15;
          v18 = v19 + 2;
        }
        while (v15 != 33);
        v24 = 0;
        v25 = v124 + 33;
        do
        {
          v26 = v19;
          v27 = getLTM_data(v10, 0);
          v28 = getLTM_topPadding(v10);
          v29 = getLTM_lutsBytesPerRow(v10);
          v30 = getLTM_leftPadding(v10);
          LTM_lutsBytesPerColumn = getLTM_lutsBytesPerColumn(v10);
          *((_WORD *)v125 + v25++) = *(_WORD *)(v27
                                              + LTM_lutsBytesPerColumn
                                              + LTM_lutsBytesPerColumn * v30
                                              + v29 * (v13 + v28)
                                              + v24);
          v24 += 2;
          v19 += 2;
        }
        while (v24 != 66);
        for (i = 0; i != 66; i += 2)
        {
          v33 = getLTM_data(v10, 0);
          v34 = getLTM_topPadding(v10);
          v35 = getLTM_lutsBytesPerRow(v10);
          v36 = getLTM_leftPadding(v10) + 2;
          *(_WORD *)v26 = *(_WORD *)(v33 + v36 * getLTM_lutsBytesPerColumn(v10) + v35 * (v13 + v34) + i);
          v26 += 2;
        }
        v37 = 0;
        v38 = &v120[v123];
        do
        {
          v39 = v38;
          v40 = getLTM_data(v10, 0);
          v41 = getLTM_topPadding(v10);
          v42 = getLTM_lutsBytesPerRow(v10);
          v43 = getLTM_leftPadding(v10) + 3;
          *(_WORD *)&v121[2 * v37 + v123] = *(_WORD *)(v40
                                                     + v43 * getLTM_lutsBytesPerColumn(v10)
                                                     + v42 * (v13 + v41)
                                                     + 2 * v37);
          ++v37;
          v38 = v39 + 2;
        }
        while (v37 != 33);
        v44 = 0;
        v45 = v124 + 132;
        do
        {
          v46 = v39;
          v47 = getLTM_data(v10, 0);
          v48 = getLTM_topPadding(v10);
          v49 = getLTM_lutsBytesPerRow(v10);
          v50 = getLTM_leftPadding(v10) + 4;
          *((_WORD *)v125 + v45++) = *(_WORD *)(v47 + v50 * getLTM_lutsBytesPerColumn(v10) + v49 * (v13 + v48) + v44);
          v44 += 2;
          v39 = v46 + 2;
        }
        while (v44 != 66);
        for (j = 0; j != 66; j += 2)
        {
          v52 = getLTM_data(v10, 0);
          v53 = getLTM_topPadding(v10);
          v54 = getLTM_lutsBytesPerRow(v10);
          v55 = getLTM_leftPadding(v10) + 5;
          *(_WORD *)v46 = *(_WORD *)(v52 + v55 * getLTM_lutsBytesPerColumn(v10) + v54 * (v13 + v53) + j);
          v46 += 2;
        }
        for (k = 0; k != 33; ++k)
        {
          v57 = getLTM_data(v10, 0);
          v58 = getLTM_topPadding(v10);
          v59 = getLTM_lutsBytesPerRow(v10);
          v60 = getLTM_leftPadding(v10) + 6;
          *(_WORD *)&v119[2 * v124 + 2 * k] = *(_WORD *)(v57
                                                       + v60 * getLTM_lutsBytesPerColumn(v10)
                                                       + v59 * (v13 + v58)
                                                       + 2 * k);
        }
        v61 = 0;
        v14 = v124 + 231;
        a2 = v125;
        do
        {
          v62 = v14;
          v63 = getLTM_data(v10, 0);
          v64 = getLTM_topPadding(v10);
          v65 = getLTM_lutsBytesPerRow(v10);
          v66 = getLTM_leftPadding(v10) + 7;
          v67 = getLTM_lutsBytesPerColumn(v10);
          v14 = v62 + 1;
          *((_WORD *)v125 + v62) = *(_WORD *)(v63 + v66 * v67 + v65 * (v13 + v64) + v61);
          v61 += 2;
        }
        while (v61 != 66);
        ++v13;
      }
      while (v13 != 6);
      v68 = 0;
      v69 = (char *)v125 + 4196;
      v70 = v114 + 2;
      v71 = v113 + 2;
      v73 = (unint64_t)(v125 + 198) < v113 + 516 && v71 < (unint64_t)v69;
      if (v70 >= (unint64_t)v69 || (unint64_t)(v125 + 198) >= v114 + 516)
      {
        v4 = v117;
        v3 = v118;
        v7 = v115;
        v5 = v116;
        if (!v73)
        {
          v75 = *(_OWORD *)(v114 + 18);
          v125[198] = *(_OWORD *)(v114 + 2);
          v125[199] = v75;
          v76 = *(_OWORD *)(v113 + 18);
          *v112 = *(_OWORD *)(v113 + 2);
          v112[1] = v76;
          v77 = *(_OWORD *)(v114 + 50);
          v125[200] = *(_OWORD *)(v114 + 34);
          v125[201] = v77;
          v78 = *(_OWORD *)(v113 + 50);
          v112[2] = *(_OWORD *)(v113 + 34);
          v112[3] = v78;
          v79 = *(_OWORD *)(v114 + 82);
          v125[202] = *(_OWORD *)(v114 + 66);
          v125[203] = v79;
          v80 = *(_OWORD *)(v113 + 82);
          v112[4] = *(_OWORD *)(v113 + 66);
          v112[5] = v80;
          v81 = *(_OWORD *)(v114 + 114);
          v125[204] = *(_OWORD *)(v114 + 98);
          v125[205] = v81;
          v82 = *(_OWORD *)(v113 + 114);
          v112[6] = *(_OWORD *)(v113 + 98);
          v112[7] = v82;
          v83 = *(_OWORD *)(v114 + 146);
          v125[206] = *(_OWORD *)(v114 + 130);
          v125[207] = v83;
          v84 = *(_OWORD *)(v113 + 146);
          v112[8] = *(_OWORD *)(v113 + 130);
          v112[9] = v84;
          v85 = *(_OWORD *)(v114 + 178);
          v125[208] = *(_OWORD *)(v114 + 162);
          v125[209] = v85;
          v86 = *(_OWORD *)(v113 + 178);
          v112[10] = *(_OWORD *)(v113 + 162);
          v112[11] = v86;
          v87 = *(_OWORD *)(v114 + 210);
          v125[210] = *(_OWORD *)(v114 + 194);
          v125[211] = v87;
          v88 = *(_OWORD *)(v113 + 210);
          v112[12] = *(_OWORD *)(v113 + 194);
          v112[13] = v88;
          v89 = *(_OWORD *)(v114 + 242);
          v125[212] = *(_OWORD *)(v114 + 226);
          v125[213] = v89;
          v90 = *(_OWORD *)(v113 + 242);
          v112[14] = *(_OWORD *)(v113 + 226);
          v112[15] = v90;
          v91 = v110[1];
          v125[214] = *v110;
          v125[215] = v91;
          v92 = v111[1];
          v112[16] = *v111;
          v112[17] = v92;
          v93 = v110[3];
          v125[216] = v110[2];
          v125[217] = v93;
          v94 = v111[3];
          v112[18] = v111[2];
          v112[19] = v94;
          v95 = v110[5];
          v125[218] = v110[4];
          v125[219] = v95;
          v96 = v111[5];
          v112[20] = v111[4];
          v112[21] = v96;
          v97 = v110[7];
          v125[220] = v110[6];
          v125[221] = v97;
          v98 = v111[7];
          v112[22] = v111[6];
          v112[23] = v98;
          v99 = v110[9];
          v125[222] = v110[8];
          v125[223] = v99;
          v100 = v111[9];
          v112[24] = v111[8];
          v112[25] = v100;
          v101 = v110[11];
          v125[224] = v110[10];
          v125[225] = v101;
          v102 = v111[11];
          v112[26] = v111[10];
          v112[27] = v102;
          v103 = v110[13];
          v125[226] = v110[12];
          v125[227] = v103;
          v104 = v111[13];
          v112[28] = v111[12];
          v112[29] = v104;
          v105 = v110[15];
          v125[228] = v110[14];
          v125[229] = v105;
          v106 = v111[15];
          v68 = 256;
          v112[30] = v111[14];
          v112[31] = v106;
        }
      }
      else
      {
        v4 = v117;
        v3 = v118;
        v7 = v115;
        v5 = v116;
      }
      v107 = (_WORD *)v125 + v68 + 1584;
      do
      {
        *v107 = *(_WORD *)(v70 + 2 * v68);
        v107[257] = *(_WORD *)(v71 + 2 * v68++);
        ++v107;
      }
      while (v68 != 257);
      v108 = 0;
    }
    else
    {
      v108 = 4294954516;
    }
  }

  return v108;
}

float getExposureParameters(void *a1, uint64_t a2, int a3)
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  int v9;
  BOOL v10;
  float v11;
  int v12;
  int v13;
  float v14;
  int v15;
  int v16;
  int v17;
  float v18;
  int v19;
  int v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  double v31;
  void *v32;
  int v33;
  void *v34;
  float v35;
  void *v36;
  int v37;
  void *v38;
  double v39;
  double v40;
  float v41;
  float result;
  int v43;
  id v44;

  v5 = a1;
  if (v5)
  {
    v44 = v5;
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BE11C60]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "floatValue");
      v9 = v8;
    }
    else
    {
      v9 = 1017370378;
    }
    objc_msgSend(v44, "objectForKeyedSubscript:", *MEMORY[0x24BE11B68]);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
      v43 = objc_msgSend(v22, "intValue");
    else
      v43 = 256;
    objc_msgSend(v44, "objectForKeyedSubscript:", *MEMORY[0x24BE11DB0]);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
      v16 = objc_msgSend(v23, "intValue");
    else
      v16 = 256;
    objc_msgSend(v44, "objectForKeyedSubscript:", *MEMORY[0x24BE11D98]);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
      v17 = objc_msgSend(v24, "intValue");
    else
      v17 = 256;
    objc_msgSend(v44, "objectForKeyedSubscript:", *MEMORY[0x24BE11BA8]);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
      v12 = objc_msgSend(v25, "shortValue");
    else
      v12 = 4096;
    objc_msgSend(v44, "objectForKeyedSubscript:", *MEMORY[0x24BE11BB0]);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
      v19 = objc_msgSend(v26, "shortValue");
    else
      v19 = 4096;
    objc_msgSend(v44, "objectForKeyedSubscript:", *MEMORY[0x24BE11B70]);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27)
      v21 = objc_msgSend(v27, "shortValue");
    else
      v21 = 4096;
    objc_msgSend(v44, "objectForKeyedSubscript:", *MEMORY[0x24BE11BE8]);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
      v18 = (float)(unint64_t)objc_msgSend(v28, "unsignedLongLongValue");
    else
      v18 = 1.0;
    v29 = a3;
    objc_msgSend(v44, "objectForKeyedSubscript:", *MEMORY[0x24BE11B00]);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = 0;
    v11 = 0.0;
    if (v30)
    {
      objc_msgSend(v30, "doubleValue");
      v11 = v31;
    }
    objc_msgSend(v44, "objectForKeyedSubscript:", *MEMORY[0x24BE11C58]);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (v32)
    {
      objc_msgSend(v32, "floatValue");
      v20 = v33;
    }
    objc_msgSend(v44, "objectForKeyedSubscript:", *MEMORY[0x24BE11DA0]);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (v34)
    {
      objc_msgSend(v34, "floatValue");
      v14 = v35;
    }
    else
    {
      v14 = 1.0;
    }
    objc_msgSend(v44, "objectForKeyedSubscript:", *MEMORY[0x24BE11CF8]);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (v36)
    {
      objc_msgSend(v36, "floatValue");
      v15 = v37;
    }
    else
    {
      v15 = 2139095040;
    }
    objc_msgSend(v44, "objectForKeyedSubscript:", *MEMORY[0x24BE11A98]);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (v38)
      v10 = objc_msgSend(v38, "intValue") == 1;
    else
      v10 = 0;

    v5 = v44;
    a3 = v29;
    v13 = v43;
  }
  else
  {
    v10 = 0;
    v11 = 0.0;
    v12 = 4096;
    v13 = 256;
    v14 = 1.0;
    v9 = 1017370378;
    v15 = 2139095040;
    v16 = 256;
    v17 = 256;
    v18 = 1.0;
    v19 = 4096;
    v20 = 0;
    v21 = 4096;
  }
  v39 = v14 * 256.0;
  if (a3)
    v39 = 256.0;
  v40 = (double)v17 / v39;
  v41 = (double)v13 * 0.0000152587891 * (double)v16 * v40;
  *(float *)a2 = v41;
  *(float *)(a2 + 4) = (float)v19 / (float)v12;
  *(float *)&v40 = v40;
  *(float *)(a2 + 8) = (float)v21 / (float)v12;
  *(_DWORD *)(a2 + 12) = LODWORD(v40);
  *(_DWORD *)(a2 + 16) = v9;
  *(float *)(a2 + 20) = v18;
  *(_DWORD *)(a2 + 24) = v15;
  *(float *)(a2 + 28) = v11;
  *(_DWORD *)(a2 + 32) = v20;
  *(_BYTE *)(a2 + 36) = v10;

  return result;
}

void sub_216F6FB6C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void ImageRegistrationDestroyContext(uint64_t a1)
{
  NSObject *v2;
  const void *v3;
  const void *v4;

  if (a1)
  {
    v2 = *(NSObject **)(a1 + 40);
    if (v2)
      dispatch_release(v2);
    v3 = *(const void **)(a1 + 80);
    if (v3)
      CFRelease(v3);
    v4 = *(const void **)(a1 + 88);
    if (v4)
      CFRelease(v4);
    RegistrationEngine_destructor(*(_QWORD *)a1);
    if (*(_DWORD *)(a1 + 52) == 1)
      HistEqDestroyContext(a1 + 16);
    free((void *)a1);
  }
}

uint64_t ImageRegistrationCreateContext(uint64_t a1, int a2)
{
  _QWORD *v4;
  uint64_t v5;
  const __CFAllocator *v11;
  CFMutableDictionaryRef Mutable;
  CFMutableArrayRef v13;
  _QWORD *v14;
  uint64_t v15;

  v4 = malloc_type_calloc(1uLL, 0x80uLL, 0x10A0040BE6D952FuLL);
  v5 = (uint64_t)v4;
  if (v4)
  {
    v4[12] = 0;
    v4[13] = 0;
    __asm { FMOV            V0.2D, #1.0 }
    *((_OWORD *)v4 + 7) = _Q0;
    v11 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 14, 0, 0);
    *(_QWORD *)(v5 + 80) = Mutable;
    if (Mutable)
    {
      v13 = CFArrayCreateMutable(v11, 7, 0);
      *(_QWORD *)(v5 + 88) = v13;
      if (v13)
      {
        *(_QWORD *)(v5 + 8) = a1;
        *(_DWORD *)(v5 + 52) = a2;
        if (a2 == 1 && HistEqCreateContext((GLuint *)(v5 + 16)))
        {
          NSLog(CFSTR("%s : HistEqCreateContext failed\n"), "ImageRegistrationCreateContext");
        }
        else
        {
          v14 = RegistrationEngine_constructor();
          *(_QWORD *)v5 = v14;
          if (v14)
          {
            v15 = FigDispatchQueueCreateWithPriority();
            *(_QWORD *)(v5 + 40) = v15;
            if (v15)
              return v5;
            NSLog(CFSTR("%s : dispatch_queue_create failed\n"), "ImageRegistrationCreateContext");
          }
          else
          {
            NSLog(CFSTR("%s : RegistrationEngine_constructor failed\n"), "ImageRegistrationCreateContext");
          }
        }
      }
      else
      {
        NSLog(CFSTR("%s : CFArrayCreateMutable failed\n"), "ImageRegistrationCreateContext");
      }
    }
    else
    {
      NSLog(CFSTR("%s : CFDictionaryCreateMutable failed\n"), "ImageRegistrationCreateContext");
    }
  }
  else
  {
    NSLog(CFSTR("%s : calloc failed\n"), "ImageRegistrationCreateContext");
  }
  ImageRegistrationDestroyContext(v5);
  return 0;
}

void RansacEngine_destructor(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if (a1)
  {
    v2 = (void *)a1[1];
    if (v2)
    {
      free(v2);
      a1[1] = 0;
    }
    v3 = (void *)a1[2];
    if (v3)
    {
      free(v3);
      a1[2] = 0;
    }
    v4 = (void *)a1[3];
    if (v4)
    {
      free(v4);
      a1[3] = 0;
    }
    v5 = (void *)a1[4];
    if (v5)
    {
      free(v5);
      a1[4] = 0;
    }
    v6 = (void *)a1[5];
    if (v6)
    {
      free(v6);
      a1[5] = 0;
    }
    v7 = (void *)a1[7];
    if (v7)
      HomographyTransform_destructor(v7);
    free(a1);
  }
}

float getLumaChromaNoiseThreshold(float *a1, void *a2, uint64_t a3, int a4, float a5, float a6, float a7)
{
  int v13;
  float *v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float result;
  unsigned int v27;

  v13 = -a4;
  v14 = a2;
  v15 = ldexpf(1.0, v13);
  v16 = powf(a5, (float)-v15 / v14[3]);
  v17 = exp2f(v16 * (float)v13);
  v18 = (float)(powf(a5, v14[2]) * a7) * v17;
  v19 = 0.0039216 / sqrtf((float)(1 << a4));
  v20 = v18 * v19;
  *a1 = (float)(v18 * v19) / v14[4];
  if (a5 <= 8.0)
    v21 = v18 / v14[5];
  else
    v21 = v18 / (v14[5] + v14[5]);
  a1[1] = v21;
  a1[2] = v20;
  v22 = (double)~a4 * 0.526315789;
  v23 = (float)((float)((float)(a4 + 1) * (float)(a4 + 1)) * powf(v14[7], v22)) * (float)(v19 * a6);
  *(float *)&v27 = v23 * powf(*(float *)(a3 + 8) * a5, v14[6]);
  *((_DWORD *)a1 + 4) = v27;
  v24 = *(float *)(a3 + 4) * a5;
  v25 = v14[6];

  result = v23 * powf(v24, v25);
  *((_QWORD *)a1 + 2) = __PAIR64__(LODWORD(result), v27);
  return result;
}

float interpolate_with_gain(uint64_t a1, float a2)
{
  uint64_t v2;
  float *v3;
  float v5;

  v2 = (*(_DWORD *)a1 - 1);
  if (*(int *)a1 < 1)
    return NAN;
  v3 = *(float **)(a1 + 8);
  if (*v3 >= a2)
    return v3[1];
  if (v3[2 * (*(_DWORD *)a1 - 1)] <= a2)
    return v3[2 * v2 + 1];
  if (*(_DWORD *)a1 < 2u)
    return NAN;
  while (1)
  {
    if (*v3 <= a2)
    {
      v5 = v3[2];
      if (v5 > a2)
        break;
    }
    v3 += 2;
    if (!--v2)
      return NAN;
  }
  return (float)((float)((float)(v3[3] - v3[1]) * (float)(a2 - *v3)) / (float)(v5 - *v3)) + v3[1];
}

uint64_t sbp_copyProperty(uint64_t a1, const void *a2, uint64_t a3, _QWORD *a4)
{
  id v6;
  uint64_t v8;
  uint64_t v9;

  v6 = *(id *)CMBaseObjectGetDerivedStorage();
  if (v6)
  {
    if (a4)
      goto LABEL_3;
LABEL_9:
    v8 = FigSignalErrorAt();
    goto LABEL_10;
  }
  FigSignalErrorAt();
  if (!a4)
    goto LABEL_9;
LABEL_3:
  if (CFEqual(a2, (CFTypeRef)*MEMORY[0x24BE11E20]))
  {
    *a4 = v6;

    return 0;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
    goto LABEL_9;
  v8 = objc_msgSend(v6, "copyValue:forProperty:", a4, a2);
LABEL_10:
  v9 = v8;

  return v9;
}

double HomographyTransform_constructor()
{
  _OWORD *v0;
  double result;

  v0 = malloc_type_malloc(0x40uLL, 0x1000040FA0F61DDuLL);
  if (v0)
  {
    *(_QWORD *)&result = 1065353216;
    *v0 = xmmword_216F96200;
    v0[1] = xmmword_216F96200;
    v0[2] = xmmword_216F96200;
    v0[3] = xmmword_216F96200;
  }
  return result;
}

uint64_t getLTM_data(_WORD *a1, uint64_t a2)
{
  uint64_t result;

  switch(*a1)
  {
    case 1:
    case 2:
      result = (uint64_t)&a1[a2 + 11];
      break;
    case 3:
      result = (uint64_t)&a1[a2 + 13];
      break;
    case 4:
      result = (uint64_t)&a1[a2 + 12];
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

uint64_t getLTM_leftPadding(_WORD *a1)
{
  switch(*a1)
  {
    case 1:
    case 2:
    case 3:
    case 4:
      return (unsigned __int16)a1[7];
    default:
      if (*a1 == 1001)
        return (unsigned __int16)a1[7];
      else
        return 0;
  }
}

uint64_t getROIMetadata(uint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
  double v7;
  BOOL v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;

  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  FigCFDictionaryGetCGRectIfPresent();
  if (*(double *)a2 != 0.0)
  {
    v7 = *(double *)(a2 + 16);
    goto LABEL_11;
  }
  v7 = *(double *)(a2 + 16);
  v8 = v7 == 0.0 && *(double *)(a2 + 8) == 0.0;
  if (!v8 || *(double *)(a2 + 24) != 0.0)
  {
LABEL_11:
    v12 = *(double *)(a2 + 24);
    *(_QWORD *)a2 = 0;
    v13 = ((double)a4 - v12) * 0.5 / (double)a4;
    v10 = v7 / (double)a3;
    *(double *)(a2 + 8) = v13;
    *(double *)(a2 + 16) = v10;
    v9 = v12 / (double)a4;
    *(double *)(a2 + 24) = v9;
    v11 = 1.0;
    if (v13 < 0.0 || v13 > 1.0)
      return 4294954516;
    goto LABEL_16;
  }
  *(_QWORD *)a2 = 0;
  *(_QWORD *)(a2 + 8) = 0;
  *(_QWORD *)(a2 + 16) = 0x3FF0000000000000;
  v9 = 1.0;
  v10 = 1.0;
  *(double *)(a2 + 24) = 1.0;
  v11 = 1.0;
  if (1.0 < 0.0)
    return 4294954516;
LABEL_16:
  if (v10 < 0.0 || v10 > v11 || v9 > v11)
    return 4294954516;
  return 0;
}

float getRelativeBrightness(float *a1, float *a2)
{
  return (float)(a1[4] * *a1) / (float)(a2[4] * *a2);
}

unint64_t getLTM_validHeight(_WORD *a1)
{
  switch(*a1)
  {
    case 1:
    case 2:
    case 3:
    case 4:
      return (unsigned __int16)a1[2] - ((unsigned __int16)a1[5] + (unint64_t)(unsigned __int16)a1[6]);
    default:
      if (*a1 == 1001)
        return (unsigned __int16)a1[2] - ((unsigned __int16)a1[5] + (unint64_t)(unsigned __int16)a1[6]);
      else
        return 0;
  }
}

uint64_t getLTM_topPadding(_WORD *a1)
{
  switch(*a1)
  {
    case 1:
    case 2:
    case 3:
    case 4:
      return (unsigned __int16)a1[5];
    default:
      if (*a1 == 1001)
        return (unsigned __int16)a1[5];
      else
        return 0;
  }
}

uint64_t getLTM_lutsBytesPerRow(_WORD *a1)
{
  switch(*a1)
  {
    case 1:
    case 2:
    case 3:
    case 4:
      return (unsigned __int16)a1[3];
    default:
      if (*a1 == 1001)
        return (unsigned __int16)a1[3];
      else
        return 0;
  }
}

uint64_t getLTM_ltmCurveEntryCount(_WORD *a1)
{
  uint64_t result;
  int v2;
  unsigned int v4;
  int v5;
  int v6;
  int v7;
  unsigned int v8;

  switch(*a1)
  {
    case 1:
      v2 = (unsigned __int16)a1[4];
      if (v2 == 60 || v2 == 33)
        v4 = 33;
      else
        v4 = 0;
      result = v4;
      break;
    case 2:
      v5 = (unsigned __int16)a1[4];
      if (v5 == 92)
        v6 = 65;
      else
        v6 = 0;
      if (v5 == 65)
        v6 = 65;
      if (v5 == 60)
        v7 = 33;
      else
        v7 = 0;
      if (v5 == 33)
        v7 = 33;
      if ((unsigned __int16)a1[4] <= 0x40u)
        v8 = v7;
      else
        v8 = v6;
      result = v8;
      break;
    case 3:
    case 4:
      result = (unsigned __int16)a1[11];
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

BOOL __get_options_for_gnr_params_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  _BOOL8 v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "valueForKey:", CFSTR("Bands"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v4 = v2;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v13;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v13 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "valueForKey:", CFSTR("StaticOISSharpening"), (_QWORD)v12);
          v9 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v9)
          {
            v10 = 0;
            goto LABEL_12;
          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v6)
          continue;
        break;
      }
    }

    objc_msgSend(*(id *)(a1 + 32), "valueForKey:", CFSTR("MotionThreshold"));
    v4 = (id)objc_claimAutoreleasedReturnValue();
    v10 = v4 != 0;
LABEL_12:

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

uint64_t handle_evm_band_data(void *a1, int *a2, int *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;

  v5 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("nonEVMFrameParameters"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("EVMFrameParameters"));
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (!v8)
      v8 = v7;
    if (handle_band_data(v7, a2) || handle_band_data(v8, a3))
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      v9 = 0xFFFFFFFFLL;
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0xFFFFFFFFLL;
  }

  return v9;
}

uint64_t handle_dense_band_data(void *a1, int *a2, int *a3)
{
  id v5;
  char isKindOfClass;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;

  v5 = a1;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v7 = v5;
  v8 = v7;
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("SparseFrameParameters"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("DenseFrameParameters"));
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (!v10)
      v10 = v9;
    if (v9)
    {
      if (handle_band_data(v9, a2) || handle_band_data(v10, a3))
      {
        fig_log_get_emitter();
        FigDebugAssert3();
        v11 = 0xFFFFFFFFLL;
        goto LABEL_8;
      }
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }
    v11 = 0;
LABEL_8:

    goto LABEL_12;
  }
  if (handle_band_data(v7, a2) || handle_band_data(v8, a3))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v11 = 0xFFFFFFFFLL;
  }
  else
  {
    v11 = 0;
  }
LABEL_12:

  return v11;
}

void sbp_finalize()
{
  CFTypeRef *DerivedStorage;

  DerivedStorage = (CFTypeRef *)CMBaseObjectGetDerivedStorage();
  if (*DerivedStorage)
  {
    CFRelease(*DerivedStorage);
    *DerivedStorage = 0;
  }
}

uint64_t sbp_copyDebugDescription()
{
  objc_msgSend(*(id *)CMBaseObjectGetDerivedStorage(), "debugDescription");
  return objc_claimAutoreleasedReturnValue();
}

uint64_t sbp_processSampleBuffer(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)CMBaseObjectGetDerivedStorage(), "processSampleBuffer:", a2);
}

uint64_t sbp_finishPendingProcessing()
{
  void *v0;

  v0 = *(void **)CMBaseObjectGetDerivedStorage();
  if (!v0)
    return FigSignalErrorAt();
  objc_msgSend(v0, "finishPendingProcessing");
  return 0;
}

uint64_t sbp_purgeResources()
{
  objc_msgSend(*(id *)CMBaseObjectGetDerivedStorage(), "purgeResources");
  return 0;
}

void print_grid_stats(void *a1, uint64_t a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  float32x4_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  double v12;
  float v13;
  float v14;
  double v15;
  double v16;
  float32x4_t v17;
  float32x4_t *v18;
  float64x2_t v19;
  float32x4_t v20;
  unint64_t v21;
  float64x2_t v22;
  float64x2_t v23;
  float64x2_t v24;
  float32x4_t v25;
  float32x4_t v26;
  float32x4_t v27;
  unint64_t v28;
  float *v29;
  float v30;
  _QWORD v31[6];

  v3 = a1;
  v4 = objc_msgSend(v3, "width");
  v5 = objc_msgSend(v3, "height") * v4;
  v6 = v5 * objc_msgSend(v3, "depth");
  v7 = (float32x4_t *)malloc_type_malloc(4 * v6, 0x100004052888210uLL);
  v8 = 4 * objc_msgSend(v3, "width");
  v9 = objc_msgSend(v3, "width");
  v10 = 4 * v9 * objc_msgSend(v3, "height");
  memset(v31, 0, 24);
  v31[3] = objc_msgSend(v3, "width");
  v31[4] = objc_msgSend(v3, "height");
  v31[5] = objc_msgSend(v3, "depth");
  objc_msgSend(v3, "getBytes:bytesPerRow:bytesPerImage:fromRegion:mipmapLevel:slice:", v7, v8, v10, v31, 0, 0);
  if (v6)
  {
    if (v6 >= 8)
    {
      v17 = (float32x4_t)vdupq_n_s32(0x7F7FFFFFu);
      v11 = v6 & 0xFFFFFFFFFFFFFFF8;
      v18 = v7 + 1;
      v19 = 0uLL;
      v20.i64[0] = 0x80000000800000;
      v20.i64[1] = 0x80000000800000;
      v21 = v6 & 0xFFFFFFFFFFFFFFF8;
      v22 = 0uLL;
      v23 = 0uLL;
      v24 = 0uLL;
      v25.i64[0] = 0x80000000800000;
      v25.i64[1] = 0x80000000800000;
      v26 = v17;
      do
      {
        v27 = v18[-1];
        v17 = vminnmq_f32(v27, v17);
        v26 = vminnmq_f32(*v18, v26);
        v20 = vmaxnmq_f32(v27, v20);
        v25 = vmaxnmq_f32(*v18, v25);
        v22 = vaddq_f64(v22, vcvt_hight_f64_f32(v27));
        v19 = vaddq_f64(v19, vcvtq_f64_f32(*(float32x2_t *)v27.f32));
        v24 = vaddq_f64(v24, vcvt_hight_f64_f32(*v18));
        v23 = vaddq_f64(v23, vcvtq_f64_f32(*(float32x2_t *)v18->f32));
        v18 += 2;
        v21 -= 8;
      }
      while (v21);
      v13 = vminnmvq_f32(vminnmq_f32(v17, v26));
      v14 = vmaxnmvq_f32(vmaxnmq_f32(v20, v25));
      v12 = vaddvq_f64(vaddq_f64(vaddq_f64(v23, v19), vaddq_f64(v24, v22)));
      if (v6 == v11)
        goto LABEL_10;
    }
    else
    {
      v11 = 0;
      v12 = 0.0;
      v13 = 3.4028e38;
      v14 = 1.1755e-38;
    }
    v28 = v6 - v11;
    v29 = &v7->f32[v11];
    do
    {
      v30 = *v29++;
      v13 = fminf(v30, v13);
      v14 = fmaxf(v30, v14);
      v12 = v12 + v30;
      --v28;
    }
    while (v28);
LABEL_10:
    v16 = v13;
    v15 = v14;
    goto LABEL_11;
  }
  v12 = 0.0;
  v15 = 1.17549435e-38;
  v16 = 3.40282347e38;
LABEL_11:
  NSLog(CFSTR("%s\t(%f,\t%f\t%g)"), a2, *(_QWORD *)&v16, *(_QWORD *)&v15, *(_QWORD *)&v12);
  free(v7);

}

double HomographyTransform_eye(_OWORD *a1)
{
  double result;

  *(_QWORD *)&result = 1065353216;
  *a1 = xmmword_216F96200;
  a1[1] = xmmword_216F96200;
  a1[2] = xmmword_216F96200;
  a1[3] = xmmword_216F96200;
  return result;
}

uint64_t AffineTransform_estimate(float32x4_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned __int16 *a6, int a7)
{
  uint64_t v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  unsigned __int16 *v20;
  uint64_t v21;
  unsigned int v22;
  uint64_t v23;
  float v24;
  float v25;
  float v26;
  float v27;
  const float *v28;
  float32x4_t v29;
  float32x4_t v35;
  float32x4_t v36;
  float32x4_t v37;
  float32x4_t v39;
  unint64_t v40;
  float32x4_t v41;
  float32x4_t v42;
  int v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v8 = 4 * *a6;
  v9 = *(float *)(a4 + v8);
  v10 = *(float *)(a5 + v8);
  v11 = *(float *)(a2 + v8);
  v12 = *(float *)(a3 + v8);
  v13 = v9 * v9;
  v14 = v10 * v9;
  v15 = v10 * v10;
  v16 = v11 * v9;
  v17 = v11 * v10;
  v18 = v12 * v9;
  v19 = v12 * v10;
  if (a7 >= 2)
  {
    v20 = a6 + 1;
    v21 = a7 - 1;
    do
    {
      v22 = *v20++;
      v23 = 4 * v22;
      v24 = *(float *)(a4 + v23);
      v25 = *(float *)(a5 + v23);
      v26 = *(float *)(a2 + v23);
      v27 = *(float *)(a3 + v23);
      v13 = v13 + (float)(v24 * v24);
      v14 = v14 + (float)(v25 * v24);
      v15 = v15 + (float)(v25 * v25);
      v9 = v9 + v24;
      v10 = v10 + v25;
      v16 = v16 + (float)(v26 * v24);
      v17 = v17 + (float)(v26 * v25);
      v11 = v11 + v26;
      v18 = v18 + (float)(v27 * v24);
      v19 = v19 + (float)(v27 * v25);
      v12 = v12 + v27;
      --v21;
    }
    while (v21);
  }
  v39.i64[0] = __PAIR64__(LODWORD(v17), LODWORD(v16));
  v39.i64[1] = __PAIR64__(LODWORD(v18), LODWORD(v11));
  v40 = __PAIR64__(LODWORD(v12), LODWORD(v19));
  sposv_NEWLAPACK();
  *a1 = v39;
  a1[1].i64[0] = v40;
  a1[1].i64[1] = 0;
  v41 = v39;
  v42 = (float32x4_t)v40;
  v43 = 1065353216;
  invMatrix((uint64_t)&v41, 3);
  v28 = (const float *)&v43;
  v29 = vld1q_dup_f32(v28);
  __asm { FMOV            V1.4S, #1.0 }
  v35 = vdivq_f32(_Q1, v29);
  v36 = vmulq_f32(v41, v35);
  v37 = vmulq_f32(v42, v35);
  a1[2] = v36;
  a1[3] = v37;
  return 0;
}

float HomographyTransform_get3x3Matrix(float *a1, uint64_t a2, int a3, float a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  float result;

  *(float *)a2 = a1[6] + *a1;
  v4 = 4;
  if (a3)
    v5 = 4;
  else
    v5 = 12;
  v6 = 8;
  if (a3)
    v7 = 8;
  else
    v7 = 24;
  if (a3)
  {
    v4 = 12;
    v8 = 20;
  }
  else
  {
    v8 = 28;
  }
  if (a3)
    v6 = 24;
  *(float *)(a2 + v5) = (float)(a1[7] + a1[1]) * a4;
  *(float *)(a2 + v7) = (float)((float)((float)(a1[2] - (float)(a1[6] + *a1)) - (float)((float)(a1[7] + a1[1]) * a4))
                              * 0.5)
                      + 0.5;
  *(float *)(a2 + v4) = (float)(a1[3] / a4) + a1[6];
  *(float *)(a2 + 16) = a1[4] + (float)(a1[7] * a4);
  *(float *)(a2 + v8) = (float)((float)((float)(a1[3] - (float)(a1[5] + a4))
                                      + (float)((float)((float)(a1[4] + a1[6]) + (float)(a1[7] * a4)) * a4))
                              * -0.5)
                      / a4;
  if (a3)
    v9 = 28;
  else
    v9 = 20;
  *(float *)(a2 + v6) = a1[6] + a1[6];
  result = a4 * (float)(a1[7] + a1[7]);
  *(float *)(a2 + v9) = result;
  *(_DWORD *)(a2 + 32) = 1065353216;
  return result;
}

void RansacEngine_init(uint64_t a1)
{
  bzero(*(void **)(a1 + 8), 8 * *(_QWORD *)a1);
  bzero(*(void **)(a1 + 16), 4 * *(_QWORD *)a1);
  bzero(*(void **)(a1 + 24), 4 * *(_QWORD *)a1);
  bzero(*(void **)(a1 + 32), 4 * *(_QWORD *)a1);
  bzero(*(void **)(a1 + 40), 2 * *(_QWORD *)a1);
}

uint64_t RansacEngine_execute(uint64_t a1, uint64_t a2, void *a3, float32x4_t *a4, float32x4_t *a5, const float *a6, const float *a7, const float *__C, vDSP_Length __N)
{
  vDSP_Length *v14;
  vDSP_Length v15;
  unsigned int v16;
  int v17;
  int v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  float32x4_t v22;
  float32x4_t *v23;
  float32x4_t *v24;
  float32x4_t *v25;
  const float *v26;
  const float *v27;
  const float *v28;
  uint64_t v29;
  unsigned __int16 v30;
  uint64_t v31;
  float32x4_t v33;
  int v34;
  float32x4_t v35;
  uint64_t v36;
  unsigned __int16 v37;
  uint64_t v38;
  unsigned __int16 v39;
  int v40;
  unsigned __int16 v41;
  int v42;
  uint64_t v43;
  uint64_t v44;
  unsigned __int16 v48;
  int v49;
  unsigned __int16 v50[2];

  v14 = *(vDSP_Length **)(a1 + 8);
  if (*(_QWORD *)a1)
  {
    v15 = 0;
    do
    {
      v14[v15] = v15;
      ++v15;
    }
    while (v15 < *(_QWORD *)a1);
  }
  vDSP_vsorti(__C, v14, 0, (unsigned __int16)__N, -1);
  v48 = 0;
  v16 = 0;
  v17 = 0;
  v49 = 1000;
  do
  {
    if (v17 <= (unsigned __int16)__N - 2)
      v18 = v17;
    else
      v18 = 0;
    v19 = (uint64_t *)(*(_QWORD *)(a1 + 8) + 8 * v18);
    v21 = *v19;
    v20 = v19[1];
    v50[0] = v21;
    v50[1] = v20;
    v22.f32[0] = RigidTransform_estimate(*(float **)(a1 + 56), (uint64_t)a6, (uint64_t)a7, (uint64_t)a4, (uint64_t)a5, v50, 2);
    v23 = a4;
    v24 = a4;
    v25 = a5;
    RigidTransform_dirs(*(float **)(a1 + 56), *(float32x4_t **)(a1 + 16), *(float32x4_t **)(a1 + 24), v24, a5, (unsigned __int16)__N, v22);
    v26 = a6;
    v27 = a6;
    v28 = a7;
    vDSP_vpythg(v27, 1, a7, 1, *(const float **)(a1 + 16), 1, *(const float **)(a1 + 24), 1, *(float **)(a1 + 32), 1, (unsigned __int16)__N);
    *(_WORD *)(a1 + 48) = 0;
    if ((_WORD)__N)
    {
      v29 = 0;
      v30 = 0;
      v31 = *(_QWORD *)(a1 + 32);
      do
      {
        if (*(float *)(v31 + 4 * v29) < 0.005)
        {
          *(_WORD *)(*(_QWORD *)(a1 + 40) + 2 * v30) = v29;
          v30 = *(_WORD *)(a1 + 48) + 1;
          *(_WORD *)(a1 + 48) = v30;
        }
        ++v29;
      }
      while ((unsigned __int16)__N != v29);
      if (v30 > v48)
      {
        memcpy(a3, *(const void **)(a1 + 40), 2 * v30);
        v49 = RigidTransform_numTestsToDo(v30, (unsigned __int16)__N);
        v48 = v30;
      }
    }
    a7 = v28;
    a6 = v26;
    a5 = v25;
    a4 = v23;
    if ((int)(v16 + 1) >= v49)
      break;
    v17 = v18 + 1;
  }
  while (v16++ < 0x3E7);
  if (!v48)
    return 0;
  v33.f32[0] = RigidTransform_estimate(*(float **)(a1 + 56), (uint64_t)a6, (uint64_t)a7, (uint64_t)v23, (uint64_t)a5, (unsigned __int16 *)a3, v48);
  if (v34 == -1)
  {
LABEL_36:
    syslog(3, "RigidTransform_estimate failed", *(double *)v33.i64);
    return 0;
  }
  v35.f32[0] = RigidTransform_deepCopy(a2, *(_QWORD *)(a1 + 56));
  RigidTransform_dirs(*(float **)(a1 + 56), *(float32x4_t **)(a1 + 16), *(float32x4_t **)(a1 + 24), v23, a5, (unsigned __int16)__N, v35);
  vDSP_vpythg(a6, 1, a7, 1, *(const float **)(a1 + 16), 1, *(const float **)(a1 + 24), 1, *(float **)(a1 + 32), 1, (unsigned __int16)__N);
  *(_WORD *)(a1 + 48) = 0;
  if ((_WORD)__N)
  {
    v36 = 0;
    v37 = 0;
    v38 = *(_QWORD *)(a1 + 32);
    v39 = v48;
    do
    {
      if (*(float *)(v38 + 4 * v36) < 0.005)
      {
        *(_WORD *)(*(_QWORD *)(a1 + 40) + 2 * v37) = v36;
        v37 = *(_WORD *)(a1 + 48) + 1;
        *(_WORD *)(a1 + 48) = v37;
      }
      ++v36;
    }
    while ((unsigned __int16)__N != v36);
  }
  else
  {
    v37 = 0;
    v39 = v48;
  }
  if (v39 < v37)
  {
    while (1)
    {
      v40 = v37;
      v41 = v37;
      memcpy(a3, *(const void **)(a1 + 40), 2 * v37);
      RigidTransform_deepCopy(a2, *(_QWORD *)(a1 + 56));
      v33.f32[0] = RigidTransform_estimate(*(float **)(a1 + 56), (uint64_t)a6, (uint64_t)a7, (uint64_t)a4, (uint64_t)a5, (unsigned __int16 *)a3, v40);
      if (v42 == -1)
        break;
      RigidTransform_dirs(*(float **)(a1 + 56), *(float32x4_t **)(a1 + 16), *(float32x4_t **)(a1 + 24), a4, a5, (unsigned __int16)__N, v33);
      vDSP_vpythg(a6, 1, a7, 1, *(const float **)(a1 + 16), 1, *(const float **)(a1 + 24), 1, *(float **)(a1 + 32), 1, (unsigned __int16)__N);
      *(_WORD *)(a1 + 48) = 0;
      if ((_WORD)__N)
      {
        v43 = 0;
        v37 = 0;
        v44 = *(_QWORD *)(a1 + 32);
        v39 = v41;
        do
        {
          if (*(float *)(v44 + 4 * v43) < 0.005)
          {
            *(_WORD *)(*(_QWORD *)(a1 + 40) + 2 * v37) = v43;
            v37 = *(_WORD *)(a1 + 48) + 1;
            *(_WORD *)(a1 + 48) = v37;
          }
          ++v43;
        }
        while ((unsigned __int16)__N != v43);
      }
      else
      {
        v37 = 0;
        v39 = v41;
      }
      if (v39 >= v37)
        return v39;
    }
    goto LABEL_36;
  }
  return v39;
}

void computeNormalizedHistogram(uint64_t a1, int a2, int a3, int a4, int8x16_t *a5)
{
  unsigned int v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v21;
  float v22;
  float32x4_t v23;
  float32x4_t v24;
  float32x4_t v25;
  float32x4_t v26;
  _DWORD v27[256];
  uint64_t v28;
  int8x16x4_t v29;

  _X20 = a1;
  v28 = *MEMORY[0x24BDAC8D0];
  bzero(v27, 0x400uLL);
  v10 = a3 - 5;
  if (a3 != 5)
  {
    v11 = 0;
    do
    {
      v12 = 0;
      __asm { PRFM            #4, [X20] }
      do
      {
        _X13 = _X20 + v12;
        __asm { PRFUM           #4, [X13,#5] }
        ++v27[*(unsigned __int8 *)(_X20 + v12)];
        v12 += 5;
      }
      while (v12 <= a2 - 5);
      _X20 += (5 * a4);
      v11 += 5;
    }
    while (v11 < v10);
    v10 = v27[0];
  }
  for (i = 1; i != 256; ++i)
  {
    v10 += v27[i];
    v27[i] = v10;
  }
  v21 = 0;
  v22 = 255.0 / (float)v27[255];
  do
  {
    v23.i64[0] = 0x3F0000003F000000;
    v23.i64[1] = 0x3F0000003F000000;
    v24.i64[0] = 0x3F0000003F000000;
    v24.i64[1] = 0x3F0000003F000000;
    v25.i64[0] = 0x3F0000003F000000;
    v25.i64[1] = 0x3F0000003F000000;
    v26.i64[0] = 0x3F0000003F000000;
    v26.i64[1] = 0x3F0000003F000000;
    v29.val[3] = (int8x16_t)vcvtq_u32_f32(vmlaq_n_f32(v26, vcvtq_f32_u32(*(uint32x4_t *)&v27[v21 + 12]), v22));
    v29.val[2] = (int8x16_t)vcvtq_u32_f32(vmlaq_n_f32(v25, vcvtq_f32_u32(*(uint32x4_t *)&v27[v21 + 8]), v22));
    v29.val[1] = (int8x16_t)vcvtq_u32_f32(vmlaq_n_f32(v24, vcvtq_f32_u32(*(uint32x4_t *)&v27[v21 + 4]), v22));
    v29.val[0] = (int8x16_t)vcvtq_u32_f32(vmlaq_n_f32(v23, vcvtq_f32_u32(*(uint32x4_t *)&v27[v21]), v22));
    *a5++ = vqtbl4q_s8(v29, (int8x16_t)xmmword_216F96220);
    v21 += 16;
  }
  while (v21 != 256);
}

uint64_t histEqualization_uint8(void *a1, unsigned int a2, char *a3, unsigned int a4, unsigned int a5, unsigned int a6)
{
  Pixel_8 *v12;
  unsigned int data;
  unsigned int v14;
  uint64_t v16;
  uint64_t i;
  uint64_t v25;
  uint32x4_t *p_src;
  float v27;
  float32x4_t v28;
  float32x4_t v29;
  float32x4_t v30;
  float32x4_t v31;
  vImage_Buffer dest;
  vImage_Buffer src;
  unsigned int v35;
  uint64_t v36;
  int8x16x4_t v37;

  v36 = *MEMORY[0x24BDAC8D0];
  v12 = (Pixel_8 *)malloc_type_calloc(0x100uLL, 1uLL, 0x19325D71uLL);
  bzero(&src, 0x400uLL);
  data = a6 - 5;
  if (a6 != 5)
  {
    v14 = 0;
    _X11 = a3;
    do
    {
      v16 = 0;
      __asm { PRFM            #4, [X11] }
      do
      {
        _X14 = &_X11[v16];
        __asm { PRFUM           #4, [X14,#5] }
        ++*((_DWORD *)&src.data + _X11[v16]);
        v16 += 5;
      }
      while (v16 <= a5 - 5);
      _X11 += 5 * a4;
      v14 += 5;
    }
    while (v14 < data);
    data = src.data;
  }
  for (i = 4; i != 1024; i += 4)
  {
    data += *(_DWORD *)((char *)&src.data + i);
    *(_DWORD *)((char *)&src.data + i) = data;
  }
  v25 = 0;
  p_src = (uint32x4_t *)&src;
  v27 = 255.0 / (float)v35;
  do
  {
    v28.i64[0] = 0x3F0000003F000000;
    v28.i64[1] = 0x3F0000003F000000;
    v29.i64[0] = 0x3F0000003F000000;
    v29.i64[1] = 0x3F0000003F000000;
    v30.i64[0] = 0x3F0000003F000000;
    v30.i64[1] = 0x3F0000003F000000;
    v31.i64[0] = 0x3F0000003F000000;
    v31.i64[1] = 0x3F0000003F000000;
    v37.val[2] = (int8x16_t)vcvtq_u32_f32(vmlaq_n_f32(v31, vcvtq_f32_u32(p_src[2]), v27));
    v37.val[1] = (int8x16_t)vcvtq_u32_f32(vmlaq_n_f32(v30, vcvtq_f32_u32(p_src[1]), v27));
    v37.val[0] = (int8x16_t)vcvtq_u32_f32(vmlaq_n_f32(v29, vcvtq_f32_u32(*p_src), v27));
    v37.val[3] = (int8x16_t)vcvtq_u32_f32(vmlaq_n_f32(v28, vcvtq_f32_u32(p_src[3]), v27));
    *(int8x16_t *)&v12[v25] = vqtbl4q_s8(v37, (int8x16_t)xmmword_216F96220);
    v25 += 16;
    p_src += 4;
  }
  while (v25 != 256);
  src.data = a3;
  src.height = a6;
  src.width = a5;
  src.rowBytes = a4;
  dest.data = a1;
  dest.height = a6;
  dest.width = a5;
  dest.rowBytes = a2;
  vImageTableLookUp_Planar8(&src, &dest, v12, 0x10u);
  free(v12);
  return 0;
}

vImage_Error boxFilter_uint8_init(unsigned int a1, unsigned int a2, unsigned int a3, uint32_t kernel_height)
{
  vImage_Error result;
  vImage_Buffer dest;
  vImage_Buffer src;
  char v7;

  v7 = 0;
  src.data = &v7;
  src.height = a3;
  src.width = a2;
  src.rowBytes = a1;
  dest.data = &v7;
  dest.height = a3;
  dest.width = a2;
  dest.rowBytes = a1;
  result = vImageBoxConvolve_Planar8(&src, &dest, 0, 0, 0, kernel_height, kernel_height, 0, 0x82u);
  if ((result & 0x80000000) != 0)
  {
    syslog(3, "boxFilter_uint8_init: box filter failed when request minimum size err=%d\n", result);
    return 0xFFFFFFFFLL;
  }
  return result;
}

vImage_Error boxFilter_uint8(void *a1, void *a2, unsigned int a3, unsigned int a4, unsigned int a5, uint32_t kernel_width, void *tempBuffer)
{
  vImage_Error result;
  vImage_Buffer dest;
  vImage_Buffer src;

  src.data = a2;
  src.height = a5;
  src.width = a4;
  src.rowBytes = a3;
  dest.data = a1;
  dest.height = a5;
  dest.width = a4;
  dest.rowBytes = a3;
  result = vImageBoxConvolve_Planar8(&src, &dest, tempBuffer, 0, 0, kernel_width, kernel_width, 0, 2u);
  if (result)
  {
    syslog(3, "boxFilter_uint8: box filter failed err=%d\n", result);
    return 0xFFFFFFFFLL;
  }
  return result;
}

uint64_t invMatrix(uint64_t a1, int a2)
{
  void *v3;
  void *v4;

  v3 = malloc_type_malloc(4 * (a2 + 1), 0x100004052888210uLL);
  v4 = malloc_type_malloc(4 * (a2 * a2), 0x100004052888210uLL);
  sgetrf_NEWLAPACK();
  sgetri_NEWLAPACK();
  free(v3);
  free(v4);
  return 0;
}

double RigidTransform_constructor()
{
  _OWORD *v0;
  double result;

  v0 = malloc_type_malloc(0x20uLL, 0x1000040E0EAB150uLL);
  if (v0)
  {
    *(_QWORD *)&result = 1065353216;
    *v0 = xmmword_216F96200;
    v0[1] = xmmword_216F96200;
  }
  return result;
}

double RigidTransform_eye(_OWORD *a1)
{
  double result;

  *(_QWORD *)&result = 1065353216;
  *a1 = xmmword_216F96200;
  a1[1] = xmmword_216F96200;
  return result;
}

float RigidTransform_deepCopy(uint64_t a1, uint64_t a2)
{
  float result;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_DWORD *)(a1 + 4) = *(_DWORD *)(a2 + 4);
  *(_DWORD *)(a1 + 8) = *(_DWORD *)(a2 + 8);
  *(_DWORD *)(a1 + 12) = *(_DWORD *)(a2 + 12);
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(_DWORD *)(a1 + 20) = *(_DWORD *)(a2 + 20);
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 24);
  result = *(float *)(a2 + 28);
  *(float *)(a1 + 28) = result;
  return result;
}

float RigidTransform_setParams(float *a1, float a2, float a3, float a4, float a5)
{
  float v5;
  float v6;
  float result;

  *a1 = a2;
  a1[1] = a3;
  a1[2] = a4;
  a1[3] = a5;
  v5 = 1.0 / (float)((float)(a2 * a2) + (float)(a3 * a3));
  a1[4] = a2 * v5;
  a1[5] = -(float)(a3 * v5);
  v6 = -(float)((float)((float)(a4 * a2) + (float)(a5 * a3)) * v5);
  result = (float)-(float)((float)(a5 * a2) - (float)(a4 * a3)) * v5;
  a1[6] = v6;
  a1[7] = result;
  return result;
}

float RigidTransform_changeCoordinateSystem(float *a1, float *a2)
{
  float v2;
  float v3;
  float v4;
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float result;

  v2 = a2[1];
  v3 = a1[1];
  v4 = -(float)((float)(v3 * v2) - (float)(*a1 * *a2));
  v5 = (float)(v2 * *a1) + (float)(v3 * *a2);
  v6 = a2[4];
  v7 = a2[5];
  v8 = -(float)((float)(v7 * v5) - (float)(v4 * v6));
  v9 = (float)(v7 * v4) + (float)(v5 * v6);
  v10 = a2[6];
  v11 = a2[7];
  v12 = a1[2];
  v13 = a1[3];
  v14 = (float)((float)((float)(v10 * v4) + (float)(v12 * *a2)) + a2[2])
      - (float)((float)(v11 * v5) + (float)(v13 * v2));
  v15 = (float)((float)((float)((float)(v10 * v5) + (float)(v11 * v4)) + (float)(v12 * v2)) + (float)(v13 * *a2))
      + a2[3];
  *a1 = v8;
  a1[1] = v9;
  a1[2] = v14;
  a1[3] = v15;
  v16 = 1.0 / (float)((float)(v8 * v8) + (float)(v9 * v9));
  a1[4] = v8 * v16;
  a1[5] = -(float)(v9 * v16);
  v17 = -(float)((float)((float)(v15 * v9) + (float)(v14 * v8)) * v16);
  result = (float)-(float)((float)(v15 * v8) - (float)(v14 * v9)) * v16;
  a1[6] = v17;
  a1[7] = result;
  return result;
}

float32_t RigidTransform_dirs(float *a1, float32x4_t *a2, float32x4_t *a3, float32x4_t *a4, float32x4_t *a5, unsigned int a6, float32x4_t a7)
{
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  char *v10;
  char *v11;
  float *v12;
  BOOL v14;
  BOOL v16;
  BOOL v18;
  BOOL v20;
  BOOL v22;
  BOOL v24;
  const float *v26;
  float32x4_t v27;
  const float *v28;
  float32x4_t v29;
  const float *v30;
  uint64_t v31;
  float32x4_t v32;
  float32x4_t *v33;
  float32x4_t *v34;
  float32x4_t *v35;
  float32x4_t *v36;
  float32x4_t v37;
  float32x4_t v38;
  float32x4_t v39;
  float *v40;
  __int32 *v41;
  float *v42;
  float *v43;
  uint64_t v44;
  float v45;
  float v46;
  float v47;
  float v48;

  if (a6)
  {
    if (a6 < 0xC)
    {
      v7 = 0;
LABEL_53:
      v40 = &a2->f32[v7];
      v41 = &a3->i32[v7];
      v42 = &a4->f32[v7];
      v43 = &a5->f32[v7];
      v44 = a6 - v7;
      do
      {
        v45 = *v42++;
        v46 = v45;
        v47 = a1[2] + (float)(*a1 * v45);
        v48 = *v43++;
        *v40++ = v47 - (float)(a1[1] * v48);
        a7.f32[0] = (float)((float)(a1[1] * v46) + (float)(*a1 * v48)) + a1[3];
        *v41++ = a7.i32[0];
        --v44;
      }
      while (v44);
      return a7.f32[0];
    }
    v7 = 0;
    v8 = (unint64_t)a2->u64 + 4 * a6;
    v9 = (unint64_t)a3->u64 + 4 * a6;
    v10 = &a4->i8[4 * a6];
    v11 = &a5->i8[4 * a6];
    v12 = a1 + 4;
    v14 = v10 > (char *)a2 && v8 > (unint64_t)a4;
    v16 = v11 > (char *)a2 && v8 > (unint64_t)a5;
    v18 = v12 > (float *)a2 && v8 > (unint64_t)a1;
    v20 = v10 > (char *)a3 && v9 > (unint64_t)a4;
    v22 = v11 > (char *)a3 && v9 > (unint64_t)a5;
    v24 = v12 > (float *)a3 && v9 > (unint64_t)a1;
    if (v8 > (unint64_t)a3 && v9 > (unint64_t)a2)
      goto LABEL_53;
    if (v14)
      goto LABEL_53;
    if (v16)
      goto LABEL_53;
    if (v18)
      goto LABEL_53;
    if (v20)
      goto LABEL_53;
    if (v22)
      goto LABEL_53;
    if (v24)
      goto LABEL_53;
    v26 = a1;
    a7 = vld1q_dup_f32(v26++);
    v27 = vld1q_dup_f32(v26);
    v7 = (unsigned __int16)a6 & 0xFFFC;
    v28 = a1 + 2;
    v29 = vld1q_dup_f32(v28);
    v30 = a1 + 3;
    v31 = v7;
    v32 = vld1q_dup_f32(v30);
    v33 = a5;
    v34 = a4;
    v35 = a3;
    v36 = a2;
    do
    {
      v37 = *v34++;
      v38 = v37;
      v39 = *v33++;
      *v36++ = vmlsq_f32(vmlaq_f32(v29, a7, v38), v27, v39);
      *v35++ = vaddq_f32(vmlaq_f32(vmulq_f32(v27, v38), a7, v39), v32);
      v31 -= 4;
    }
    while (v31);
    if (v7 != a6)
      goto LABEL_53;
  }
  return a7.f32[0];
}

float32_t RigidTransform_invs(float *a1, float32x4_t *a2, float32x4_t *a3, float32x4_t *a4, float32x4_t *a5, unsigned int a6, float32x4_t a7)
{
  uint64_t v7;
  uint64_t v8;
  float *v9;
  char *v10;
  char *v11;
  char *v12;
  char *v13;
  float *v14;
  BOOL v16;
  BOOL v18;
  BOOL v20;
  BOOL v22;
  BOOL v24;
  BOOL v26;
  const float *v28;
  const float *v29;
  float32x4_t v30;
  const float *v31;
  float32x4_t v32;
  const float *v33;
  uint64_t v34;
  float32x4_t v35;
  float32x4_t *v36;
  float32x4_t *v37;
  float32x4_t *v38;
  float32x4_t *v39;
  float32x4_t v40;
  float32x4_t v41;
  float32x4_t v42;
  float *v43;
  __int32 *v44;
  float *v45;
  float *v46;
  uint64_t v47;
  float v48;
  float v49;
  float v50;
  float v51;

  if (a6)
  {
    v7 = a6;
    if (a6 < 0xC)
    {
      v8 = 0;
LABEL_53:
      v43 = &a2->f32[v8];
      v44 = &a3->i32[v8];
      v45 = &a4->f32[v8];
      v46 = &a5->f32[v8];
      v47 = v7 - v8;
      do
      {
        v48 = *v45++;
        v49 = v48;
        v50 = a1[6] + (float)(a1[4] * v48);
        v51 = *v46++;
        *v43++ = v50 - (float)(a1[5] * v51);
        a7.f32[0] = (float)((float)(a1[5] * v49) + (float)(a1[4] * v51)) + a1[7];
        *v44++ = a7.i32[0];
        --v47;
      }
      while (v47);
      return a7.f32[0];
    }
    v8 = 0;
    v9 = a1 + 4;
    v10 = &a2->i8[4 * a6];
    v11 = &a3->i8[4 * a6];
    v12 = &a4->i8[4 * a6];
    v13 = &a5->i8[4 * a6];
    v14 = a1 + 8;
    v16 = v12 > (char *)a2 && v10 > (char *)a4;
    v18 = v13 > (char *)a2 && v10 > (char *)a5;
    v20 = v14 > (float *)a2 && v9 < (float *)v10;
    v22 = v12 > (char *)a3 && v11 > (char *)a4;
    v24 = v13 > (char *)a3 && v11 > (char *)a5;
    v26 = v14 > (float *)a3 && v9 < (float *)v11;
    if (v10 > (char *)a3 && v11 > (char *)a2)
      goto LABEL_53;
    if (v16)
      goto LABEL_53;
    if (v18)
      goto LABEL_53;
    if (v20)
      goto LABEL_53;
    if (v22)
      goto LABEL_53;
    if (v24)
      goto LABEL_53;
    if (v26)
      goto LABEL_53;
    v28 = a1 + 4;
    a7 = vld1q_dup_f32(v28);
    v29 = a1 + 5;
    v30 = vld1q_dup_f32(v29);
    v8 = (unsigned __int16)v7 & 0xFFFC;
    v31 = a1 + 6;
    v32 = vld1q_dup_f32(v31);
    v33 = a1 + 7;
    v34 = v8;
    v35 = vld1q_dup_f32(v33);
    v36 = a5;
    v37 = a4;
    v38 = a3;
    v39 = a2;
    do
    {
      v40 = *v37++;
      v41 = v40;
      v42 = *v36++;
      *v39++ = vmlsq_f32(vmlaq_f32(v32, a7, v41), v30, v42);
      *v38++ = vaddq_f32(vmlaq_f32(vmulq_f32(v30, v41), a7, v42), v35);
      v34 -= 4;
    }
    while (v34);
    if (v8 != v7)
      goto LABEL_53;
  }
  return a7.f32[0];
}

float RigidTransform_estimate(float *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned __int16 *a6, int a7)
{
  uint64_t v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  unsigned __int16 *v16;
  uint64_t v17;
  unsigned int v18;
  uint64_t v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;
  float result;
  float v29;
  float v30;
  float v31;
  float v32;

  v8 = 4 * *a6;
  v9 = *(float *)(a4 + v8);
  v10 = *(float *)(a5 + v8);
  v11 = *(float *)(a2 + v8);
  v12 = *(float *)(a3 + v8);
  v13 = (float)(v9 * v9) + (float)(v10 * v10);
  v14 = (float)(v11 * v9) + (float)(v12 * v10);
  v15 = -(float)((float)(v11 * v10) - (float)(v12 * v9));
  if (a7 >= 2)
  {
    v16 = a6 + 1;
    v17 = a7 - 1;
    do
    {
      v18 = *v16++;
      v19 = 4 * v18;
      v20 = *(float *)(a4 + v19);
      v21 = *(float *)(a5 + v19);
      v22 = *(float *)(a2 + v19);
      v23 = *(float *)(a3 + v19);
      v13 = (float)((float)(v20 * v20) + (float)(v21 * v21)) + v13;
      v9 = v9 + v20;
      v10 = v10 + v21;
      v14 = (float)((float)(v22 * v20) + (float)(v23 * v21)) + v14;
      v15 = v15 - (float)((float)(v22 * v21) - (float)(v23 * v20));
      v11 = v11 + v22;
      v12 = v12 + v23;
      --v17;
    }
    while (v17);
  }
  v32 = v12;
  v29 = v14;
  v30 = v15;
  v31 = v11;
  sposv_NEWLAPACK();
  v24 = v29;
  v25 = 0.0;
  if (v29 < 0.95)
    v24 = 1.0;
  else
    v25 = v30;
  *a1 = v24;
  a1[1] = v25;
  a1[2] = v31;
  a1[3] = v32;
  v26 = 1.0 / (float)((float)(v24 * v24) + (float)(v25 * v25));
  a1[4] = v24 * v26;
  a1[5] = -(float)(v25 * v26);
  v27 = -(float)((float)((float)(v31 * v24) + (float)(v32 * v25)) * v26);
  result = (float)-(float)((float)(v32 * v24) - (float)(v31 * v25)) * v26;
  a1[6] = v27;
  a1[7] = result;
  return result;
}

uint64_t RigidTransform_numTestsToDo(int a1, int a2)
{
  return KKNumSamplesToTest_Rigid[((a2 - a1) << 10) / a2];
}

uint64_t UpdateImageSize(uint64_t a1, unint64_t a2, unint64_t a3)
{
  double v3;
  double v4;
  double v5;
  double v6;
  unint64_t v8;
  double v9;
  double v10;
  unint64_t v11;
  unsigned int v12;
  BOOL v13;
  int v14;

  v4 = *(double *)(a1 + 96);
  v3 = *(double *)(a1 + 104);
  v5 = *(double *)(a1 + 112);
  v6 = *(double *)(a1 + 120);
  if (*(_QWORD *)(a1 + 56) == a2 && *(_QWORD *)(a1 + 64) == a3)
    return 0;
  *(_QWORD *)(a1 + 56) = a2;
  *(_QWORD *)(a1 + 64) = a3;
  *(float *)(a1 + 72) = (float)a3 / (float)a2;
  v8 = (unint64_t)(v6 * (double)a3);
  v9 = v5 * (double)a2;
  v10 = v3 * (double)a3;
  if ((unint64_t)v9 >= v8)
    v11 = (unint64_t)(v6 * (double)a3);
  else
    v11 = (unint64_t)v9;
  if (v11 < 0x56)
  {
    v12 = 0;
  }
  else
  {
    v12 = 0;
    do
    {
      ++v12;
      v13 = v11 > 0xAB;
      v11 >>= 1;
    }
    while (v13);
  }
  if (v12 >= 7)
    v14 = 7;
  else
    v14 = v12;
  *(_BYTE *)(a1 + 48) = v12 < 2;
  if (RegistrationEngine_init(*(_QWORD *)a1, a2, a3, v14 != 0, v14, (unint64_t)v9, v8, (unint64_t)(v4 * (double)a2), (unint64_t)v10, *(_DWORD *)(a1 + 52) == 3))return 0xFFFFFFFFLL;
  else
    return 0;
}

uint64_t ImageRegistrationSetROI(double *a1, double a2, double a3, double a4, double a5)
{
  BOOL v5;
  BOOL v6;

  v5 = a2 >= 0.0 && a2 <= 1.0;
  if (v5 && (a3 >= 0.0 ? (v6 = a3 <= 1.0) : (v6 = 0), v6 && a4 > 0.0 && a4 <= 1.0 && a5 > 0.0 && a5 <= 1.0))
  {
    a1[12] = a2;
    a1[13] = a3;
    a1[14] = a4;
    a1[15] = a5;
    return 0;
  }
  else
  {
    NSLog(CFSTR("ROI extends outside of bounds (x: %f, y: %f, w: %f, h: %f)"), *(_QWORD *)&a2, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5);
    return 0xFFFFFFFFLL;
  }
}

uint64_t HistogramEqualization(uint64_t a1, CVPixelBufferRef pixelBuffer, __CVBuffer *a3)
{
  uint64_t v3;
  double v6;
  double v7;
  double v8;
  double v9;
  int WidthOfPlane;
  int HeightOfPlane;
  int v12;
  char *BaseAddressOfPlane;
  char *v15;
  size_t BytesPerRowOfPlane;
  size_t v17;

  v3 = *(unsigned int *)(a1 + 52);
  switch((int)v3)
  {
    case 0:
      return v3;
    case 1:
      v3 = HistEqualize(*(void **)(a1 + 8), (GLuint *)(a1 + 16), pixelBuffer, a3);
      if ((_DWORD)v3)
        NSLog(CFSTR("%s : GPU histogram equalization failed\n"), "HistogramEqualization");
      return v3;
    case 2:
      if (!pixelBuffer || !a3)
      {
        NSLog(CFSTR("%s : NULL input parameters\n"), "HistEqualizeCPU");
        goto LABEL_16;
      }
      v7 = *(double *)(a1 + 96);
      v6 = *(double *)(a1 + 104);
      v9 = *(double *)(a1 + 112);
      v8 = *(double *)(a1 + 120);
      WidthOfPlane = CVPixelBufferGetWidthOfPlane(pixelBuffer, 0);
      HeightOfPlane = CVPixelBufferGetHeightOfPlane(pixelBuffer, 0);
      if ((WidthOfPlane & 3) != 0
        || (v12 = HeightOfPlane, WidthOfPlane != CVPixelBufferGetWidthOfPlane(a3, 0))
        || v12 != CVPixelBufferGetHeightOfPlane(a3, 0))
      {
        NSLog(CFSTR("%s : Unsupported image width,height\n"), "HistEqualizeCPU");
        goto LABEL_16;
      }
      if (CVPixelBufferLockBaseAddress(a3, 1uLL))
      {
        NSLog(CFSTR("%s : Couldn't lock input buffer\n"), "HistEqualizeCPU");
LABEL_16:
        NSLog(CFSTR("%s : CPU histogram equalization failed\n"), "HistogramEqualization");
        return 0xFFFFFFFFLL;
      }
      if (CVPixelBufferLockBaseAddress(pixelBuffer, 0))
      {
        NSLog(CFSTR("%s : Couldn't lock output buffer\n"), "HistEqualizeCPU");
        CVPixelBufferUnlockBaseAddress(a3, 1uLL);
        goto LABEL_16;
      }
      BaseAddressOfPlane = (char *)CVPixelBufferGetBaseAddressOfPlane(a3, 0);
      v15 = (char *)CVPixelBufferGetBaseAddressOfPlane(pixelBuffer, 0);
      BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a3, 0);
      v17 = CVPixelBufferGetBytesPerRowOfPlane(pixelBuffer, 0);
      histEqualization_uint8(&v15[(unint64_t)(v7 * (double)WidthOfPlane) + v17 * (unint64_t)(v6 * (double)v12)], v17, &BaseAddressOfPlane[(unint64_t)(v7 * (double)WidthOfPlane)+ BytesPerRowOfPlane * (unint64_t)(v6 * (double)v12)], BytesPerRowOfPlane, (v9 * (double)WidthOfPlane), (v8 * (double)v12));
      CVPixelBufferUnlockBaseAddress(pixelBuffer, 0);
      CVPixelBufferUnlockBaseAddress(a3, 1uLL);
      return 0;
    case 3:
      NSLog(CFSTR("should not call %s if histEqMethod == histEqCPUWhenDownscaling"), "HistogramEqualization");
      return 0xFFFFFFFFLL;
    default:
      NSLog(CFSTR("%s : invalid histogram equalization method\n"), "HistogramEqualization");
      return 0;
  }
}

uint64_t ImageRegister(uint64_t a1, CVPixelBufferRef pixelBuffer, CVPixelBufferRef *a3, unsigned int a4, uint64_t a5, uint64_t a6, const void **a7, int a8)
{
  CVPixelBufferRef *v8;
  uint64_t v9;
  uint64_t v10;
  int v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _DWORD *v18;
  uint64_t v22;
  const void *v23;
  __CVBuffer *Value;
  __CVBuffer *v25;
  const __CFArray *v26;
  CFIndex FirstIndexOfValue;
  __CVBuffer *UnusedExtraBuffer;
  uint64_t TemplateImage;
  void *v30;
  void *v31;
  const __CFArray *v32;
  CFIndex v33;
  __CVBuffer *v34;
  size_t WidthOfPlane;
  size_t HeightOfPlane;
  unsigned __int8 *BaseAddressOfPlane;
  size_t BytesPerRowOfPlane;
  uint64_t v39;
  uint64_t v40;
  CVPixelBufferRef *v41;
  uint64_t v42;
  __CVBuffer *PreregisteredOutput;
  uint64_t InputImage;
  uint64_t v45;
  __CVBuffer *v46;
  unsigned __int8 *v47;
  size_t v48;
  __int16 v49;
  CVPixelBufferRef pixelBuffera;
  CVPixelBufferRef v51;
  uint64_t v52;
  CFRange v53;
  CFRange v54;

  v52 = *MEMORY[0x24BDAC8D0];
  pixelBuffera = 0;
  v51 = 0;
  v49 = 0;
  if (!a1 || (v8 = a3) == 0)
  {
    NSLog(CFSTR("%s : NULL input parameters\n"), pixelBuffer, "ImageRegister");
    return 0xFFFFFFFFLL;
  }
  v9 = a6;
  LODWORD(v10) = a4;
  v13 = *(_DWORD *)(a1 + 52);
  if (v13 == 3 || v13 == 0)
  {
    if (!ImageRegisterIterative_Reference(a1, pixelBuffer))
    {
      if (!(_DWORD)v10)
        return 0;
      v15 = v10;
      while (!ImageRegisterIterative_NonReference(a1, *v8, v9))
      {
        v9 += 36;
        ++v8;
        if (!--v15)
          return 0;
      }
    }
    fig_log_get_emitter();
    FigDebugAssert3();
    v16 = FigSignalErrorAt();
    goto LABEL_62;
  }
  if (*(_BYTE *)(a1 + 48))
  {
    if (a4)
    {
      v17 = a4;
      v18 = (_DWORD *)(a6 + 32);
      do
      {
        *((_OWORD *)v18 - 2) = xmmword_216F96200;
        *((_OWORD *)v18 - 1) = xmmword_216F96200;
        *v18 = 1065353216;
        v18 += 9;
        --v17;
      }
      while (v17);
    }
    return 0;
  }
  if (!a4)
  {
    NSLog(CFSTR("%s : Need at least one non-reference image\n"), pixelBuffer, "ImageRegister");
    return 0xFFFFFFFFLL;
  }
  if (CFArrayGetCount(*(CFArrayRef *)(a1 + 88)))
  {
    NSLog(CFSTR("%s : CFArrayGetCount(imageRegCtx->availExtraBuffers) != 0\n"), "ImageRegister");
    CFArrayRemoveAllValues(*(CFMutableArrayRef *)(a1 + 88));
  }
  if (a7 && a8 >= 1)
  {
    v22 = a8;
    do
    {
      v23 = *a7++;
      CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 88), v23);
      --v22;
    }
    while (v22);
  }
  Value = (__CVBuffer *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 80), pixelBuffer);
  if (Value)
  {
    v25 = Value;
    v26 = *(const __CFArray **)(a1 + 88);
    v53.length = CFArrayGetCount(v26);
    v53.location = 0;
    FirstIndexOfValue = CFArrayGetFirstIndexOfValue(v26, v53, v25);
    if (FirstIndexOfValue != -1)
      CFArrayRemoveValueAtIndex(v26, FirstIndexOfValue);
    pixelBuffera = v25;
  }
  else
  {
    UnusedExtraBuffer = (__CVBuffer *)GetUnusedExtraBuffer(a1);
    pixelBuffera = UnusedExtraBuffer;
    if (!UnusedExtraBuffer)
      goto LABEL_73;
    v25 = UnusedExtraBuffer;
    if (pixelBuffer)
    {
      TemplateImage = HistogramEqualization(a1, UnusedExtraBuffer, pixelBuffer);
      if ((_DWORD)TemplateImage)
        goto LABEL_72;
    }
  }
  v30 = (void *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 80), *v8);
  if (v30)
  {
    v31 = v30;
    v32 = *(const __CFArray **)(a1 + 88);
    v54.length = CFArrayGetCount(v32);
    v54.location = 0;
    v33 = CFArrayGetFirstIndexOfValue(v32, v54, v31);
    if (v33 != -1)
      CFArrayRemoveValueAtIndex(v32, v33);
    v51 = (CVPixelBufferRef)v31;
LABEL_43:
    WidthOfPlane = CVPixelBufferGetWidthOfPlane(v25, 0);
    HeightOfPlane = CVPixelBufferGetHeightOfPlane(v25, 0);
    if (!UpdateImageSize(a1, WidthOfPlane, HeightOfPlane))
    {
      if (!pixelBuffer)
        goto LABEL_49;
      TemplateImage = CVPixelBufferLockBaseAddress(v25, 0);
      if (!(_DWORD)TemplateImage)
      {
        LOBYTE(v49) = 1;
        BaseAddressOfPlane = (unsigned __int8 *)CVPixelBufferGetBaseAddressOfPlane(v25, 0);
        BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(v25, 0);
        TemplateImage = RegistrationEngine_loadTemplateImage(*(_QWORD *)a1, BaseAddressOfPlane, BytesPerRowOfPlane, *(NSObject **)(a1 + 40));
        if (!(_DWORD)TemplateImage)
        {
          TemplateImage = RegistrationEngine_detectCorners(*(uint64_t **)a1, *(NSObject **)(a1 + 40));
          if (!(_DWORD)TemplateImage)
          {
            CVPixelBufferUnlockBaseAddress(v25, 0);
            LOBYTE(v49) = 0;
LABEL_49:
            v39 = 0;
            v40 = (int)v10 - 1;
            if (v10 <= 1)
              v10 = 1;
            else
              v10 = v10;
            v41 = v8 + 1;
            while (1)
            {
              if (v39 < v40)
              {
                v42 = v39 & 1;
                PreregisteredOutput = (__CVBuffer *)GetPreregisteredOutput(a1, v41[v39]);
                if (PreregisteredOutput)
                {
                  *(&pixelBuffera + v42) = PreregisteredOutput;
                }
                else
                {
                  InputImage = HistogramEqualization(a1, *(&pixelBuffera + v42), v41[v39]);
                  if ((_DWORD)InputImage)
                    break;
                }
              }
              v45 = ++v39 & 1;
              v46 = *(&pixelBuffera + v45);
              InputImage = CVPixelBufferLockBaseAddress(v46, 0);
              if ((_DWORD)InputImage)
                break;
              *(_BYTE *)((unint64_t)&v49 | v45) = 1;
              v47 = (unsigned __int8 *)CVPixelBufferGetBaseAddressOfPlane(v46, 0);
              v48 = CVPixelBufferGetBytesPerRowOfPlane(v46, 0);
              InputImage = RegistrationEngine_loadInputImage(*(_QWORD *)a1, v47, v48, *(NSObject **)(a1 + 40));
              if ((_DWORD)InputImage)
                break;
              InputImage = RegistrationEngine_execute(*(unsigned __int16 ***)a1);
              if ((_DWORD)InputImage)
                break;
              CVPixelBufferUnlockBaseAddress(v46, 0);
              *(_BYTE *)((unint64_t)&v49 | v45) = 0;
              HomographyTransform_get3x3Matrix(*(float **)(*(_QWORD *)a1 + 16), v9, 1, *(float *)(a1 + 72));
              v9 += 36;
              if (v10 == v39)
              {
                v16 = 0;
                goto LABEL_62;
              }
            }
            v16 = InputImage;
            fig_log_get_emitter();
            FigDebugAssert3();
            goto LABEL_62;
          }
        }
      }
      goto LABEL_72;
    }
LABEL_73:
    fig_log_get_emitter();
    FigDebugAssert3();
    v16 = 0xFFFFFFFFLL;
    goto LABEL_62;
  }
  v34 = (__CVBuffer *)GetUnusedExtraBuffer(a1);
  v51 = v34;
  if (!v34)
    goto LABEL_73;
  TemplateImage = HistogramEqualization(a1, v34, *v8);
  if (!(_DWORD)TemplateImage)
    goto LABEL_43;
LABEL_72:
  v16 = TemplateImage;
  fig_log_get_emitter();
  FigDebugAssert3();
LABEL_62:
  if ((_BYTE)v49)
    CVPixelBufferUnlockBaseAddress(pixelBuffera, 0);
  if (HIBYTE(v49))
    CVPixelBufferUnlockBaseAddress(v51, 0);
  CFDictionaryRemoveAllValues(*(CFMutableDictionaryRef *)(a1 + 80));
  CFArrayRemoveAllValues(*(CFMutableArrayRef *)(a1 + 88));
  return v16;
}

uint64_t ImageRegisterIterative_Reference(uint64_t a1, CVPixelBufferRef pixelBuffer)
{
  int v3;
  BOOL v4;
  size_t WidthOfPlane;
  size_t HeightOfPlane;
  uint64_t v8;
  unsigned __int8 *BaseAddressOfPlane;
  size_t BytesPerRowOfPlane;
  uint64_t v11;
  uint64_t v13;

  if (a1
    && ((v3 = *(_DWORD *)(a1 + 52)) != 0 ? (v4 = v3 == 3) : (v4 = 1),
        v4
     && pixelBuffer
     && (WidthOfPlane = CVPixelBufferGetWidthOfPlane(pixelBuffer, 0),
         HeightOfPlane = CVPixelBufferGetHeightOfPlane(pixelBuffer, 0),
         !UpdateImageSize(a1, WidthOfPlane, HeightOfPlane))))
  {
    v8 = CVPixelBufferLockBaseAddress(pixelBuffer, 1uLL);
    if ((_DWORD)v8)
    {
      v13 = v8;
      fig_log_get_emitter();
      FigDebugAssert3();
      return v13;
    }
    else
    {
      BaseAddressOfPlane = (unsigned __int8 *)CVPixelBufferGetBaseAddressOfPlane(pixelBuffer, 0);
      BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(pixelBuffer, 0);
      if (RegistrationEngine_loadTemplateImage(*(_QWORD *)a1, BaseAddressOfPlane, BytesPerRowOfPlane, *(NSObject **)(a1 + 40))|| RegistrationEngine_detectCorners(*(uint64_t **)a1, *(NSObject **)(a1 + 40)))
      {
        fig_log_get_emitter();
        FigDebugAssert3();
        v11 = FigSignalErrorAt();
      }
      else
      {
        v11 = 0;
      }
      CVPixelBufferUnlockBaseAddress(pixelBuffer, 1uLL);
      return v11;
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return FigSignalErrorAt();
  }
}

uint64_t ImageRegisterIterative_NonReference(uint64_t a1, CVPixelBufferRef pixelBuffer, uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  unsigned __int8 *BaseAddressOfPlane;
  size_t BytesPerRowOfPlane;

  if (*(_BYTE *)(a1 + 48))
    return 0;
  v7 = CVPixelBufferLockBaseAddress(pixelBuffer, 1uLL);
  if ((_DWORD)v7)
  {
    v3 = v7;
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  else
  {
    BaseAddressOfPlane = (unsigned __int8 *)CVPixelBufferGetBaseAddressOfPlane(pixelBuffer, 0);
    BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(pixelBuffer, 0);
    if (RegistrationEngine_loadInputImage(*(_QWORD *)a1, BaseAddressOfPlane, BytesPerRowOfPlane, *(NSObject **)(a1 + 40))|| (v3 = RegistrationEngine_execute(*(unsigned __int16 ***)a1), (_DWORD)v3))
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      v3 = FigSignalErrorAt();
    }
    else
    {
      HomographyTransform_get3x3Matrix(*(float **)(*(_QWORD *)a1 + 16), a3, 1, *(float *)(a1 + 72));
    }
    CVPixelBufferUnlockBaseAddress(pixelBuffer, 1uLL);
  }
  return v3;
}

const void *GetPreregisteredOutput(uint64_t a1, const void *a2)
{
  const void *Value;
  const __CFArray *v4;
  CFIndex FirstIndexOfValue;
  CFRange v7;

  Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 80), a2);
  if (Value)
  {
    v4 = *(const __CFArray **)(a1 + 88);
    v7.length = CFArrayGetCount(v4);
    v7.location = 0;
    FirstIndexOfValue = CFArrayGetFirstIndexOfValue(v4, v7, Value);
    if (FirstIndexOfValue != -1)
      CFArrayRemoveValueAtIndex(v4, FirstIndexOfValue);
  }
  return Value;
}

const void *GetUnusedExtraBuffer(uint64_t a1)
{
  const __CFArray *v2;
  CFIndex Count;
  int v4;
  CFIndex v5;
  uint64_t v6;
  const void *ValueAtIndex;
  CFIndex v8;
  const void *Value;
  __CFArray *v10;
  CFIndex v11;

  v2 = *(const __CFArray **)(a1 + 88);
  Count = CFArrayGetCount(v2);
  v4 = Count;
  if ((int)Count < 1)
  {
    NSLog(CFSTR("%s : CFArrayGetCount(imageRegCtx->availExtraBuffers) returned %d\n"), "GetUnusedExtraBuffer", Count);
    return 0;
  }
  else
  {
    v5 = 0;
    v6 = Count;
    do
    {
      ValueAtIndex = CFArrayGetValueAtIndex(v2, v5);
      if (!CFDictionaryContainsKey(*(CFDictionaryRef *)(a1 + 80), ValueAtIndex))
      {
        v10 = v2;
        v11 = v5;
        goto LABEL_12;
      }
      ++v5;
    }
    while (v6 != v5);
    v8 = (v4 - 1);
    ValueAtIndex = CFArrayGetValueAtIndex(v2, v8);
    if (ValueAtIndex)
    {
      Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 80), ValueAtIndex);
      if (Value)
      {
        CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(a1 + 80), Value);
        CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(a1 + 80), ValueAtIndex);
      }
    }
    else
    {
      NSLog(CFSTR("%s : NULL input parameters\n"), "ImageRegistrationUnregisterOneImage");
    }
    v10 = v2;
    v11 = v8;
LABEL_12:
    CFArrayRemoveValueAtIndex(v10, v11);
  }
  return ValueAtIndex;
}

float Norm_constructor(unint64_t a1, unint64_t a2)
{
  float *v4;
  float result;
  float v6;
  float v7;
  unint64_t v8;
  float v9;
  float v10;

  v4 = (float *)malloc_type_malloc(0x20uLL, 0x1000040E0EAB150uLL);
  if (v4)
  {
    v6 = (float)a2;
    v7 = (float)a1;
    if (a1 <= a2)
      v8 = a2;
    else
      v8 = a1;
    v9 = 1.0 / (float)v8;
    *v4 = v9 + v9;
    v4[1] = v9 + v9;
    v4[2] = -(float)(v7 * v9);
    v4[3] = -(float)(v6 * v9);
    v10 = 1.0 / (float)(v9 + v9);
    v4[4] = v10;
    v4[5] = v10;
    result = v6 * 0.5;
    v4[6] = v7 * 0.5;
    v4[7] = result;
  }
  return result;
}

float32_t Norm_dirs(float *a1, unint64_t a2, unint64_t a3, uint16x8_t *a4, uint16x8_t *a5, unsigned int a6, float32x4_t a7)
{
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  BOOL v11;
  BOOL v13;
  const float *v15;
  const float *v16;
  float32x4_t v17;
  float32x4_t v18;
  const float *v19;
  uint64_t v20;
  float32x4_t v21;
  float32x4_t *v22;
  float32x4_t *v23;
  uint16x8_t *v24;
  uint16x8_t *v25;
  uint16x8_t v26;
  uint16x8_t v27;
  uint16x8_t v28;
  unsigned __int16 *v29;
  unsigned __int16 *v30;
  _DWORD *v31;
  float *v32;
  uint64_t v33;
  unsigned int v34;
  unsigned int v35;
  unsigned int v36;
  float v37;

  if (a6)
  {
    if (a6 < 8)
    {
      v7 = 0;
LABEL_25:
      v29 = (unsigned __int16 *)a4 + v7;
      v30 = (unsigned __int16 *)a5 + v7;
      v31 = (_DWORD *)(a2 + 4 * v7);
      v32 = (float *)(a3 + 4 * v7);
      v33 = a6 - v7;
      do
      {
        v35 = *v29++;
        v34 = v35;
        v36 = *v30++;
        a7.f32[0] = a1[2] + (float)(*a1 * (float)v34);
        v37 = a1[3] + (float)(a1[1] * (float)v36);
        *v31++ = a7.i32[0];
        *v32++ = v37;
        --v33;
      }
      while (v33);
      return a7.f32[0];
    }
    v7 = 0;
    v8 = a2 + 4 * a6;
    v9 = a3 + 4 * a6;
    v11 = (unint64_t)(a1 + 4) > a2 && v8 > (unint64_t)a1;
    v13 = (unint64_t)(a1 + 4) > a3 && v9 > (unint64_t)a1;
    if (v8 > a3 && v9 > a2)
      goto LABEL_25;
    if (v11)
      goto LABEL_25;
    if (v13)
      goto LABEL_25;
    v7 = (unsigned __int16)a6 & 0xFFF8;
    v15 = a1;
    a7 = vld1q_dup_f32(v15++);
    v16 = a1 + 2;
    v17 = vld1q_dup_f32(v16);
    v18 = vld1q_dup_f32(v15);
    v19 = a1 + 3;
    v20 = v7;
    v21 = vld1q_dup_f32(v19);
    v22 = (float32x4_t *)a3;
    v23 = (float32x4_t *)a2;
    v24 = a5;
    v25 = a4;
    do
    {
      v26 = *v25++;
      v27 = v26;
      v28 = *v24++;
      *v23 = vmlaq_f32(v17, a7, vcvtq_f32_u32(vmovl_u16(*(uint16x4_t *)v27.i8)));
      v23[1] = vmlaq_f32(v17, a7, vcvtq_f32_u32(vmovl_high_u16(v27)));
      v23 += 2;
      *v22 = vmlaq_f32(v21, v18, vcvtq_f32_u32(vmovl_u16(*(uint16x4_t *)v28.i8)));
      v22[1] = vmlaq_f32(v21, v18, vcvtq_f32_u32(vmovl_high_u16(v28)));
      v22 += 2;
      v20 -= 8;
    }
    while (v20);
    if (v7 != a6)
      goto LABEL_25;
  }
  return a7.f32[0];
}

float *Norm_invs(float *result, int16x8_t *a2, int16x8_t *a3, float32x4_t *a4, float32x4_t *a5, unsigned int a6, double a7, double a8, double a9, double a10)
{
  uint64_t v10;
  float v11;
  float v12;
  float32x4_t v13;
  uint64_t v14;
  float32x4_t v15;
  int16x8_t *v16;
  int16x8_t *v17;
  float32x4_t *v18;
  float32x4_t *v19;
  float32x4_t v20;
  float32x4_t v21;
  float32x4_t v22;
  float32x4_t v23;
  float *v24;
  float *v25;
  __int16 *v26;
  __int16 *v27;
  uint64_t v28;
  float v29;
  float v30;
  float v31;

  if (a6)
  {
    v10 = 0;
    v11 = result[4];
    v12 = result[5];
    *(float *)&a9 = result[6] + 0.5;
    *(float *)&a10 = result[7] + 0.5;
    if (a6 < 8)
      goto LABEL_7;
    if ((unint64_t)((char *)a3 - (char *)a2) < 0x10)
      goto LABEL_7;
    v10 = (unsigned __int16)a6 & 0xFFF8;
    v13 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)&a9, 0);
    v14 = v10;
    v15 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)&a10, 0);
    v16 = a3;
    v17 = a2;
    v18 = a5;
    v19 = a4;
    do
    {
      v20 = *v19;
      v21 = v19[1];
      v19 += 2;
      v22 = *v18;
      v23 = v18[1];
      v18 += 2;
      *v17++ = vuzp1q_s16((int16x8_t)vcvtq_u32_f32(vmlaq_n_f32(v13, v20, v11)), (int16x8_t)vcvtq_u32_f32(vmlaq_n_f32(v13, v21, v11)));
      *v16++ = vuzp1q_s16((int16x8_t)vcvtq_u32_f32(vmlaq_n_f32(v15, v22, v12)), (int16x8_t)vcvtq_u32_f32(vmlaq_n_f32(v15, v23, v12)));
      v14 -= 8;
    }
    while (v14);
    if (v10 != a6)
    {
LABEL_7:
      v24 = &a4->f32[v10];
      v25 = &a5->f32[v10];
      v26 = &a2->i16[v10];
      v27 = &a3->i16[v10];
      v28 = a6 - v10;
      do
      {
        v29 = *v24++;
        v30 = v29;
        v31 = *v25++;
        *v26++ = (int)(float)(*(float *)&a9 + (float)(v11 * v30));
        *v27++ = (int)(float)(*(float *)&a10 + (float)(v12 * v31));
        --v28;
      }
      while (v28);
    }
  }
  return result;
}

_QWORD *RegistrationEngine_constructor()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  BOOL v4;
  uint64_t v5;
  uint64_t *v6;
  unint64_t *v7;

  v0 = malloc_type_calloc(1uLL, 0x25A8uLL, 0x1020040A4D661E3uLL);
  if (!v0)
    goto LABEL_10;
  HomographyTransform_constructor();
  v0[2] = v1;
  if (!v1)
    goto LABEL_10;
  RigidTransform_constructor();
  v0[3] = v2;
  RigidTransform_constructor();
  v0[4] = v3;
  v4 = !v0[3] || v3 == 0;
  if (v4
    || (RigidTransform_constructor(), (v0[5] = v5) == 0)
    || (v6 = FeatureMatcher_constructor(), (v0[1202] = v6) == 0)
    || (v7 = RansacEngine_constructor(0x64uLL), (v0[1203] = v7) == 0))
  {
LABEL_10:
    RegistrationEngine_destructor((uint64_t)v0);
    return 0;
  }
  return v0;
}

uint64_t RegistrationEngine_init(uint64_t a1, unint64_t a2, unint64_t a3, int a4, int a5, unint64_t a6, unint64_t a7, unint64_t a8, unint64_t a9, char a10)
{
  unsigned __int16 v13;
  uint64_t v17;
  uint64_t v18;
  unsigned __int16 *v19;
  unsigned __int16 *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  unint64_t v32;
  unint64_t v33;

  if (!a1)
    return 0;
  v13 = a5;
  v17 = a1;
  if (*(_QWORD *)(a1 + 128) == a2
    && *(_QWORD *)(a1 + 136) == a3
    && *(_DWORD *)(a1 + 176) == a4
    && *(_DWORD *)(a1 + 180) == a5
    && *(_QWORD *)(a1 + 144) == a6
    && *(_QWORD *)(a1 + 152) == a7
    && *(_QWORD *)(a1 + 160) == a8
    && *(_QWORD *)(a1 + 168) == a9
    && *(_QWORD *)(a1 + 9608)
    && *(_QWORD *)a1
    && *(_QWORD *)(a1 + 8)
    && *(_QWORD *)(a1 + 48)
    && *(_QWORD *)(a1 + 56)
    && *(_QWORD *)(a1 + 64)
    && *(_QWORD *)(a1 + 72)
    && *(_QWORD *)(a1 + 80)
    && *(_QWORD *)(a1 + 88)
    && *(_QWORD *)(a1 + 96)
    && *(_QWORD *)(a1 + 104)
    && *(_QWORD *)(a1 + 112)
    && *(_QWORD *)(a1 + 120))
  {
    return 0;
  }
  RegistrationEngine_purgeResources(a1);
  *(_QWORD *)(v17 + 128) = a2;
  *(_QWORD *)(v17 + 136) = a3;
  *(_QWORD *)(v17 + 160) = a8;
  *(_QWORD *)(v17 + 168) = a9;
  *(_QWORD *)(v17 + 144) = a6;
  *(_QWORD *)(v17 + 152) = a7;
  v19 = Pyramid_constructor(a6, a7, (unsigned __int16)a4, v13);
  *(_QWORD *)v17 = v19;
  if (v19)
  {
    v20 = Pyramid_constructor(*(_QWORD *)(v17 + 144), *(_QWORD *)(v17 + 152), (unsigned __int16)a4, v13);
    *(_QWORD *)(v17 + 8) = v20;
    if (v20)
    {
      Norm_constructor(*(_QWORD *)(*(_QWORD *)v17 + 336), *(_QWORD *)(*(_QWORD *)v17 + 416));
      *(_QWORD *)(v17 + 48) = v21;
      if (!v21)
        goto LABEL_44;
      Norm_constructor(*(_QWORD *)(*(_QWORD *)v17 + 344), *(_QWORD *)(*(_QWORD *)v17 + 424));
      *(_QWORD *)(v17 + 56) = v22;
      if (!v22)
        goto LABEL_44;
      Norm_constructor(*(_QWORD *)(*(_QWORD *)v17 + 352), *(_QWORD *)(*(_QWORD *)v17 + 432));
      *(_QWORD *)(v17 + 64) = v23;
      if (!v23)
        goto LABEL_44;
      Norm_constructor(*(_QWORD *)(*(_QWORD *)v17 + 360), *(_QWORD *)(*(_QWORD *)v17 + 440));
      *(_QWORD *)(v17 + 72) = v24;
      if (!v24)
        goto LABEL_44;
      Norm_constructor(*(_QWORD *)(*(_QWORD *)v17 + 368), *(_QWORD *)(*(_QWORD *)v17 + 448));
      *(_QWORD *)(v17 + 80) = v25;
      if (!v25)
        goto LABEL_44;
      Norm_constructor(*(_QWORD *)(*(_QWORD *)v17 + 376), *(_QWORD *)(*(_QWORD *)v17 + 456));
      *(_QWORD *)(v17 + 88) = v26;
      if (!v26)
        goto LABEL_44;
      Norm_constructor(*(_QWORD *)(*(_QWORD *)v17 + 384), *(_QWORD *)(*(_QWORD *)v17 + 464));
      *(_QWORD *)(v17 + 96) = v27;
      if (!v27)
        goto LABEL_44;
      Norm_constructor(*(_QWORD *)(*(_QWORD *)v17 + 392), *(_QWORD *)(*(_QWORD *)v17 + 472));
      *(_QWORD *)(v17 + 104) = v28;
      if (v28
        && (Norm_constructor(*(_QWORD *)(*(_QWORD *)v17 + 400), *(_QWORD *)(*(_QWORD *)v17 + 480)),
            (*(_QWORD *)(v17 + 112) = v29) != 0)
        && (Norm_constructor(*(_QWORD *)(*(_QWORD *)v17 + 408), *(_QWORD *)(*(_QWORD *)v17 + 488)),
            (*(_QWORD *)(v17 + 120) = v30) != 0))
      {
        v31 = IPDetector_constructor(*(_QWORD *)(*(_QWORD *)v17 + 8 * a4 + 336), *(_QWORD *)(*(_QWORD *)v17 + 8 * a4 + 256), *(_QWORD *)(*(_QWORD *)v17 + 8 * a4 + 176));
        *(_QWORD *)(v17 + 9608) = v31;
        if (v31)
        {
          if (a6 <= a7)
            v32 = a7;
          else
            v32 = a6;
          if (a2 <= a3)
            v33 = a3;
          else
            v33 = a2;
          RigidTransform_setParams(*(float **)(v17 + 40), (float)v32 * (float)(1.0 / (float)v33), 0.0, (float)((float)((float)a6 - (float)a2) + (float)((float)a8 + (float)a8)) * (float)(1.0 / (float)v33), (float)((float)((float)a7 - (float)a3) + (float)((float)a9 + (float)a9)) * (float)(1.0 / (float)v33));
          v18 = 0;
          *(_BYTE *)(v17 + 9632) = a10;
          v17 = 0;
        }
        else
        {
          v18 = 4294967292;
        }
      }
      else
      {
LABEL_44:
        v18 = 4294967293;
      }
    }
    else
    {
      v18 = 4294967294;
    }
  }
  else
  {
    v18 = 0xFFFFFFFFLL;
  }
  RegistrationEngine_purgeResources(v17);
  return v18;
}

uint64_t RegistrationEngine_loadTemplateImage(uint64_t a1, unsigned __int8 *a2, uint64_t a3, NSObject *a4)
{
  return Pyramid_loadImage(*(unsigned __int16 **)a1, a2, a3, *(_QWORD *)(a1 + 144), *(_QWORD *)(a1 + 152), *(_QWORD *)(a1 + 160), *(_QWORD *)(a1 + 168), *(unsigned __int8 *)(a1 + 9632), a4);
}

uint64_t RegistrationEngine_loadInputImage(uint64_t a1, unsigned __int8 *a2, uint64_t a3, NSObject *a4)
{
  return Pyramid_loadImage(*(unsigned __int16 **)(a1 + 8), a2, a3, *(_QWORD *)(a1 + 144), *(_QWORD *)(a1 + 152), *(_QWORD *)(a1 + 160), *(_QWORD *)(a1 + 168), *(unsigned __int8 *)(a1 + 9632), a4);
}

uint64_t RegistrationEngine_detectCorners(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  unsigned int v3;
  uint64_t *v6;

  v2 = *a1;
  v3 = *(unsigned __int16 *)(*a1 + 2);
  if (v3 >= *(unsigned __int16 *)*a1)
  {
    v6 = a1 + 773;
    do
    {
      *((_WORD *)v6 + v3) = IPDetector_execute(a1[1201], &a1[25 * v3 + 23], &a1[25 * v3 + 273], &a1[25 * v3 + 523], 0x64u, *(_QWORD *)(v2 + 8 * v3 + 16), 26, *(_QWORD *)(v2 + 8 * v3 + 336), *(_QWORD *)(v2 + 8 * v3 + 416), *(_QWORD *)(v2 + 8 * v3 + 176), a2);
      v2 = *a1;
    }
    while ((int)v3-- > *(unsigned __int16 *)*a1);
  }
  return 0;
}

uint64_t RegistrationEngine_oneLevel(uint64_t a1, int a2)
{
  uint16x8_t *v2;
  uint64_t v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint16x8_t *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  float32x4_t v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  uint64_t v33;
  unsigned int v34;
  uint64_t v36;
  uint64_t v37;
  float32x4_t v38;
  double v39;
  double v40;
  double v41;
  double v42;
  uint64_t v43;
  unsigned __int16 v44;
  unsigned __int16 *v45;
  unint64_t v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  _DWORD *v50;
  _WORD *v51;
  uint64_t v52;
  _WORD *v53;
  _DWORD *v54;
  uint64_t result;
  float32x4_t v56;
  vDSP_Length __N;
  uint16x8_t *v58;
  uint16x8_t *v59;

  v2 = (uint16x8_t *)(a1 + 6204);
  v3 = a1 + 200 * a2;
  *(_OWORD *)(a1 + 6204) = *(_OWORD *)(v3 + 184);
  v4 = *(_OWORD *)(v3 + 200);
  v5 = *(_OWORD *)(v3 + 216);
  v6 = *(_OWORD *)(v3 + 248);
  *(_OWORD *)(a1 + 6252) = *(_OWORD *)(v3 + 232);
  *(_OWORD *)(a1 + 6268) = v6;
  *(_OWORD *)(a1 + 6220) = v4;
  *(_OWORD *)(a1 + 6236) = v5;
  v7 = *(_OWORD *)(v3 + 264);
  v8 = *(_OWORD *)(v3 + 280);
  v9 = *(_OWORD *)(v3 + 312);
  *(_OWORD *)(a1 + 6316) = *(_OWORD *)(v3 + 296);
  *(_OWORD *)(a1 + 6332) = v9;
  *(_OWORD *)(a1 + 6284) = v7;
  *(_OWORD *)(a1 + 6300) = v8;
  v10 = *(_OWORD *)(v3 + 328);
  v11 = *(_OWORD *)(v3 + 344);
  v12 = *(_OWORD *)(v3 + 360);
  *(_QWORD *)(a1 + 6396) = *(_QWORD *)(v3 + 376);
  *(_OWORD *)(a1 + 6364) = v11;
  *(_OWORD *)(a1 + 6380) = v12;
  *(_OWORD *)(a1 + 6348) = v10;
  v13 = (uint16x8_t *)(a1 + 6404);
  *(_OWORD *)(a1 + 6404) = *(_OWORD *)(v3 + 2184);
  v14 = *(_OWORD *)(v3 + 2200);
  v15 = *(_OWORD *)(v3 + 2216);
  v16 = *(_OWORD *)(v3 + 2248);
  *(_OWORD *)(a1 + 6452) = *(_OWORD *)(v3 + 2232);
  *(_OWORD *)(a1 + 6468) = v16;
  *(_OWORD *)(a1 + 6420) = v14;
  *(_OWORD *)(a1 + 6436) = v15;
  v17 = *(_OWORD *)(v3 + 2264);
  v18 = *(_OWORD *)(v3 + 2280);
  v19 = *(_OWORD *)(v3 + 2312);
  *(_OWORD *)(a1 + 6516) = *(_OWORD *)(v3 + 2296);
  *(_OWORD *)(a1 + 6532) = v19;
  *(_OWORD *)(a1 + 6484) = v17;
  *(_OWORD *)(a1 + 6500) = v18;
  v20 = *(_OWORD *)(v3 + 2328);
  v21 = *(_OWORD *)(v3 + 2344);
  v22 = *(_OWORD *)(v3 + 2360);
  *(_QWORD *)(a1 + 6596) = *(_QWORD *)(v3 + 2376);
  *(_OWORD *)(a1 + 6564) = v21;
  *(_OWORD *)(a1 + 6580) = v22;
  *(_OWORD *)(a1 + 6548) = v20;
  *(_OWORD *)(a1 + 6604) = *(_OWORD *)(v3 + 4184);
  v23 = *(_OWORD *)(v3 + 4200);
  v24 = *(_OWORD *)(v3 + 4216);
  v25 = *(_OWORD *)(v3 + 4248);
  *(_OWORD *)(a1 + 6652) = *(_OWORD *)(v3 + 4232);
  *(_OWORD *)(a1 + 6668) = v25;
  *(_OWORD *)(a1 + 6620) = v23;
  *(_OWORD *)(a1 + 6636) = v24;
  v26 = *(_OWORD *)(v3 + 4264);
  v27 = *(_OWORD *)(v3 + 4280);
  v28 = *(_OWORD *)(v3 + 4312);
  *(_OWORD *)(a1 + 6716) = *(_OWORD *)(v3 + 4296);
  *(_OWORD *)(a1 + 6732) = v28;
  *(_OWORD *)(a1 + 6684) = v26;
  *(_OWORD *)(a1 + 6700) = v27;
  v29 = *(float32x4_t *)(v3 + 4328);
  v30 = *(_OWORD *)(v3 + 4344);
  v31 = *(_OWORD *)(v3 + 4360);
  *(_QWORD *)(a1 + 6796) = *(_QWORD *)(v3 + 4376);
  *(_OWORD *)(a1 + 6764) = v30;
  *(_OWORD *)(a1 + 6780) = v31;
  *(float32x4_t *)(a1 + 6748) = v29;
  v32 = 2 * a2;
  v33 = *(unsigned __int16 *)(a1 + v32 + 6184);
  v34 = *(unsigned __int16 *)((char *)&kRegistrationMinNumInliers + v32);
  if (v33 < v34)
    return 0;
  v36 = 8 * a2;
  v37 = a1 + v36;
  v38.f32[0] = Norm_dirs(*(float **)(a1 + v36 + 48), a1 + 7404, a1 + 7804, v2, v13, v33, v29);
  *(float *)&v39 = RigidTransform_invs(*(float **)(a1 + 24), (float32x4_t *)(a1 + 8204), (float32x4_t *)(a1 + 8604), (float32x4_t *)(a1 + 7404), (float32x4_t *)(a1 + 7804), v33, v38);
  v58 = (uint16x8_t *)(a1 + 7004);
  v59 = (uint16x8_t *)(a1 + 6804);
  Norm_invs(*(float **)(v37 + 48), (int16x8_t *)(a1 + 6804), (int16x8_t *)(a1 + 7004), (float32x4_t *)(a1 + 8204), (float32x4_t *)(a1 + 8604), v33, v39, v40, v41, v42);
  if (!(_DWORD)v33)
    goto LABEL_15;
  v43 = 0;
  v44 = 0;
  v45 = (unsigned __int16 *)(a1 + 7004);
  do
  {
    v46 = *(v45 - 100);
    if (v46 >= 0x1A)
    {
      v47 = *(_QWORD *)a1 + v36;
      if (*(_QWORD *)(v47 + 336) - 26 > v46)
      {
        v48 = *v45;
        if (v48 >= 0x1A && *(_QWORD *)(v47 + 416) - 26 > v48)
          *(_WORD *)(a1 + 7204 + 2 * v44++) = v43;
      }
    }
    ++v43;
    ++v45;
  }
  while (v33 != v43);
  if (v44)
  {
    v49 = 0;
    v50 = (_DWORD *)(a1 + 7404);
    v51 = (_WORD *)(a1 + 6204);
    do
    {
      v52 = (unsigned __int16)v51[500];
      if (v49 != v52)
      {
        v53 = (_WORD *)(a1 + 2 * v52);
        v51[300] = v53[3402];
        v54 = (_DWORD *)(a1 + 4 * v52);
        v50[200] = v54[2051];
        v51[400] = v53[3502];
        v50[300] = v54[2151];
        *v51 = v53[3102];
        *v50 = v54[1851];
        v51[100] = v53[3202];
        v50[100] = v54[1951];
      }
      ++v49;
      ++v50;
      ++v51;
    }
    while (v44 != v49);
  }
  else
  {
LABEL_15:
    v44 = 0;
  }
  if (v34 > v44)
    return 0;
  FeatureMatcher_execute(*(_QWORD *)(a1 + 9616), (unsigned __int16 *)v2, (unsigned __int16 *)v13, (unsigned __int16 *)v59, (unsigned __int16 *)v58, (float *)(a1 + 9004), v44, *(_QWORD *)(*(_QWORD *)a1 + v36 + 96), *(_QWORD *)(*(_QWORD *)a1 + v36 + 176), *(_QWORD *)(*(_QWORD *)(a1 + 8) + v36 + 96), *(_QWORD *)(*(_QWORD *)(a1 + 8) + v36 + 176), 1u);
  Norm_dirs(*(float **)(v37 + 48), a1 + 8204, a1 + 8604, v59, v58, v44, v56);
  RigidTransform_deepCopy(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 24));
  LOWORD(__N) = v44;
  result = RansacEngine_execute(*(_QWORD *)(a1 + 9624), *(_QWORD *)(a1 + 24), (void *)(a1 + 9404), (float32x4_t *)(a1 + 8204), (float32x4_t *)(a1 + 8604), (const float *)(a1 + 7404), (const float *)(a1 + 7804), (const float *)(a1 + 9004), __N);
  *(_WORD *)(a1 + 9604) = result;
  if (result <= v34)
  {
    RigidTransform_deepCopy(*(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32));
    return *(unsigned __int16 *)(a1 + 9604);
  }
  return result;
}

uint64_t RegistrationEngine_execute(unsigned __int16 **a1)
{
  unsigned __int16 *v2;
  int v3;
  unsigned int v5;

  v2 = (unsigned __int16 *)a1 + 4802;
  *((_WORD *)a1 + 4802) = 0;
  RigidTransform_eye(a1[3]);
  HomographyTransform_eye(a1[2]);
  FeatureMatcher_init((uint64_t)a1[1202]);
  RansacEngine_init((uint64_t)a1[1203]);
  v3 = (*a1)[1];
  if (v3 >= **a1)
  {
    do
      RegistrationEngine_oneLevel((uint64_t)a1, v3);
    while (v3-- > **a1);
  }
  v5 = *v2;
  if (v5 >= 6)
  {
    AffineTransform_estimate((float32x4_t *)a1[2], (uint64_t)a1 + 8204, (uint64_t)a1 + 8604, (uint64_t)a1 + 7404, (uint64_t)a1 + 7804, (unsigned __int16 *)a1 + 4702, v5);
    RigidTransform_changeCoordinateSystem((float *)a1[3], (float *)a1[5]);
    return 0;
  }
  else
  {
    syslog(4, "Registration could not detect more that %d inlier corners at the highest resolution.\n", *v2);
    return 0xFFFFFFFFLL;
  }
}

unsigned __int16 *Pyramid_constructor(unint64_t a1, unint64_t a2, unsigned int a3, unsigned int a4)
{
  unsigned __int16 *v8;
  unsigned __int16 *v9;
  unsigned int v10;
  unint64_t *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unsigned __int16 *v16;
  unsigned __int16 *v17;
  void *v18;
  uint64_t v19;
  unsigned __int16 *v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unsigned __int16 *v24;
  uint64_t v25;
  uint64_t v26;
  _OWORD *v28;
  uint64_t v29;
  unsigned __int16 *v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  unsigned __int16 *v34;
  int64x2_t v35;
  unint64_t v36;
  int64x2_t v37;
  unsigned __int16 *v38;
  uint64_t v39;

  v8 = (unsigned __int16 *)malloc_type_calloc(0x330uLL, 1uLL, 0x6E6CDEE9uLL);
  v9 = v8;
  if (!v8)
    return v9;
  *v8 = a3;
  if (a4 >= 9)
    v10 = 9;
  else
    v10 = a4;
  v8[1] = v10;
  v8[2] = v10 - a3 + 1;
  v8[4] = 26;
  v8[3] = a3;
  *((_QWORD *)v8 + 42) = a1;
  *((_QWORD *)v8 + 52) = a2;
  if (v10)
  {
    v11 = (unint64_t *)(v8 + 212);
    v12 = a4;
    if (a4 >= 9uLL)
      v12 = 9;
    do
    {
      a1 >>= 1;
      *(v11 - 10) = a1;
      a2 >>= 1;
      *v11++ = a2;
      --v12;
    }
    while (v12);
  }
  v13 = 0;
  v14 = a4;
  if (a4 >= 9uLL)
    v14 = 9;
  v15 = 8 * v14 + 8;
  do
  {
    v16 = &v8[v13 / 2];
    *((_QWORD *)v16 + 32) = *(_QWORD *)&v8[v13 / 2 + 208] + 52;
    *((_QWORD *)v16 + 22) = *(_QWORD *)&v8[v13 / 2 + 168] + 52;
    v13 += 8;
  }
  while (v15 != v13);
  *((_OWORD *)v8 + 4) = 0u;
  *((_OWORD *)v8 + 5) = 0u;
  *((_OWORD *)v8 + 2) = 0u;
  *((_OWORD *)v8 + 3) = 0u;
  *((_OWORD *)v8 + 1) = 0u;
  if (v10 < a3)
  {
LABEL_16:
    v19 = v10;
    v20 = &v9[4 * v10];
    v21 = *((_QWORD *)v20 + 52);
    v22 = v21 >> 1;
    *((_QWORD *)v20 + 62) = v21 >> 1;
    *((_QWORD *)v20 + 72) = v21 - (v21 >> 1);
    if (v10)
    {
      v23 = v10 + 1;
      v24 = &v9[4 * v19 + 204];
      do
      {
        v22 *= 2;
        *((_QWORD *)v24 + 10) = v22;
        *((_QWORD *)v24 + 20) = *(_QWORD *)v24 - v22;
        --v23;
        v24 -= 4;
      }
      while (v23 > 1);
    }
    v25 = *v9;
    if (*v9)
    {
      if ((_DWORD)v25 == 1)
      {
        v26 = 0;
LABEL_26:
        v30 = &v9[4 * v26 + 368];
        v31 = v25 - v26;
        do
        {
          *((_QWORD *)v30 - 10) = 0;
          *(_QWORD *)v30 = 0;
          v30 += 4;
          --v31;
        }
        while (v31);
        goto LABEL_28;
      }
      v26 = (unsigned __int16)v25 & 0xFFFE;
      v28 = v9 + 368;
      v29 = v26;
      do
      {
        *(v28 - 5) = 0uLL;
        *v28++ = 0uLL;
        v29 -= 2;
      }
      while (v29);
      if (v26 != v25)
        goto LABEL_26;
    }
LABEL_28:
    if (v25 <= v19)
    {
      v32 = v19 - v25 + 1;
      if (v32 >= 2)
      {
        v33 = (v32 & 0xFFFFFFFFFFFFFFFELL) + v25;
        v34 = &v9[4 * v25];
        v35 = vdupq_n_s64(0x1AuLL);
        v36 = v32 & 0xFFFFFFFFFFFFFFFELL;
        do
        {
          *((_OWORD *)v34 + 41) = 0uLL;
          v37 = vaddq_s64(*((int64x2_t *)v34 + 31), v35);
          v37.i64[0] *= *((_QWORD *)v34 + 22);
          v37.i64[1] *= *((_QWORD *)v34 + 23);
          *((int64x2_t *)v34 + 46) = v37;
          v34 += 8;
          v36 -= 2;
        }
        while (v36);
        if (v32 == (v32 & 0xFFFFFFFFFFFFFFFELL))
          return v9;
      }
      else
      {
        v33 = v25;
      }
      v38 = &v9[4 * v33];
      v39 = v19 - v33 + 1;
      do
      {
        *((_QWORD *)v38 + 82) = 0;
        *((_QWORD *)v38 + 92) = (*((_QWORD *)v38 + 62) + 26) * *((_QWORD *)v38 + 22);
        v38 += 4;
        --v39;
      }
      while (v39);
    }
    return v9;
  }
  while (1)
  {
    v17 = &v9[4 * (unsigned __int16)a3];
    v18 = malloc_type_calloc(*((_QWORD *)v17 + 32) * *((_QWORD *)v17 + 22), 1uLL, 0x51D75206uLL);
    *((_QWORD *)v17 + 2) = v18;
    if (!v18)
      break;
    bzero(v18, *((_QWORD *)v17 + 32) * *((_QWORD *)v17 + 22));
    *((_QWORD *)v17 + 12) = *((_QWORD *)v17 + 2) + v9[4] + *((_QWORD *)v17 + 22) * v9[4];
    LOWORD(a3) = a3 + 1;
    v10 = v9[1];
    if (v10 < (unsigned __int16)a3)
      goto LABEL_16;
  }
  Pyramid_destructor(v9);
  return 0;
}

uint64_t Pyramid_loadImage(unsigned __int16 *a1, unsigned __int8 *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8, NSObject *a9)
{
  uint64_t v9;
  uint64_t v10;
  int v13;
  int v14;
  int8x16_t *v18;
  unsigned int v19;
  uint64_t v20;
  unsigned __int16 *v21;
  uint64_t v22;
  size_t v23;
  uint64_t v24;
  char *v25;
  unsigned __int8 *v26;
  uint64_t v27;
  size_t v28;
  uint64_t v29;
  char *v30;
  unsigned __int8 *v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD *v34;
  NSObject *v35;
  unsigned __int8 *v36;
  _QWORD block[7];
  _QWORD v38[7];
  _QWORD v39[7];
  int v40;
  int v41;
  int8x16_t v42[16];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v9 = *((_QWORD *)a1 + 42);
  v10 = *((_QWORD *)a1 + 52);
  if (v9 != a4 || v10 != a5)
  {
    syslog(3, "Pyramid_loadImage: incompatible size in pyramid (%lu!=%lu) or (%lu!=%lu)", a4, v9, a5, v10);
    return 0xFFFFFFFFLL;
  }
  v13 = a7;
  v14 = a6;
  memset(&v42[2], 0, 224);
  if (a8)
    v18 = v42;
  else
    v18 = 0;
  memset(v42, 0, 32);
  if (!a8)
  {
    v19 = *a1;
    v36 = a2;
    if (v19 < 2)
      goto LABEL_11;
LABEL_14:
    v20 = 0;
    do
    {
      v21 = &a1[4 * v20++];
      filterSubsampling1channel(a2, *((_QWORD *)v21 + 43), *((_QWORD *)v21 + 53), a3, 0, 0, (uint64_t)a2, a3, v14, v13, (uint64_t)v18);
      if (v20 == a1[3])
      {
        v22 = *((_QWORD *)v21 + 53);
        if (v22)
        {
          v23 = *((_QWORD *)v21 + 43);
          v24 = *((_QWORD *)v21 + 23);
          v25 = (char *)(*((_QWORD *)v21 + 3) + a1[4] + v24 * a1[4]);
          v26 = a2;
          do
          {
            memcpy(v25, v26, v23);
            v25 += v24;
            v26 += a3;
            --v22;
          }
          while (v22);
        }
      }
      v18 = 0;
      v14 = 0;
      v13 = 0;
    }
    while (v20 < *a1 - 1);
    v13 = 0;
    v35 = a9;
    if (!*a1)
      goto LABEL_23;
    goto LABEL_22;
  }
  computeNormalizedHistogram((uint64_t)&a2[a6 + a7 * a3], a4, a5, a3, v42);
  v19 = *a1;
  v36 = a2;
  if (v19 >= 2)
    goto LABEL_14;
LABEL_11:
  v35 = a9;
  if (!v19)
  {
LABEL_23:
    v27 = *((_QWORD *)a1 + 52);
    if (v27)
    {
      v28 = *((_QWORD *)a1 + 42);
      v29 = *((_QWORD *)a1 + 22);
      v30 = (char *)(*((_QWORD *)a1 + 2) + a1[4] + v29 * a1[4]);
      v31 = &v36[v14 + v13 * a3];
      do
      {
        memcpy(v30, v31, v28);
        v30 += v29;
        v31 += a3;
        --v27;
      }
      while (v27);
    }
    goto LABEL_26;
  }
LABEL_22:
  if (!a1[3])
    goto LABEL_23;
LABEL_26:
  v32 = MEMORY[0x24BDAC760];
  v39[0] = MEMORY[0x24BDAC760];
  v39[1] = 0x40000000;
  v39[2] = __Pyramid_loadImage_block_invoke;
  v39[3] = &__block_descriptor_tmp;
  v39[4] = a1;
  v39[5] = v36;
  v39[6] = a3;
  v40 = v14;
  v41 = v13;
  if (v35)
  {
    v33 = *a1;
    if (*a1)
    {
      v34 = a1 + 368;
      do
      {
        *v34 = *(v34 - 30) * a3;
        ++v34;
        --v33;
      }
      while (v33);
    }
    block[6] = v18;
    v38[0] = v32;
    v38[1] = 0x40000000;
    v38[2] = __Pyramid_loadImage_block_invoke_2;
    v38[3] = &unk_24D669788;
    v38[4] = v39;
    v38[5] = a1;
    v38[6] = v18;
    block[0] = v32;
    block[1] = 0x40000000;
    block[2] = __Pyramid_loadImage_block_invoke_3;
    block[3] = &unk_24D6697B0;
    block[4] = v39;
    block[5] = a1;
    dispatch_async(v35, block);
    dispatch_async(v35, v38);
    dispatch_barrier_sync(v35, &__block_literal_global_3);
  }
  else
  {
    __Pyramid_loadImage_block_invoke((unsigned __int8 *)v39, (uint64_t)(a1 + 208), (uint64_t)(a1 + 328), a1[4], a1[4], (uint64_t)v18);
  }
  return 0;
}

unsigned __int8 *filterSubsampling1channel(unsigned __int8 *result, unint64_t a2, uint64_t a3, uint64_t a4, int a5, int a6, uint64_t a7, uint64_t a8, int a9, int a10, uint64_t a11)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unsigned __int8 *v15;
  unsigned __int8 *v16;
  uint8x8_t *v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unsigned __int8 *v22;
  uint8x8_t *v23;
  const char *v24;
  unsigned __int8 *v25;
  const char *v26;
  uint8x8_t v27;
  uint8x8_t v28;
  uint8x8_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint8x8_t *v34;
  const char *v35;
  unsigned __int8 *v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  const char *v40;
  uint8x8_t v41;
  int8x8x2_t v42;
  int8x8x2_t v43;
  uint16x8_t v44;
  int8x8x2_t v45;
  int8x8x2_t v46;

  if (a3)
  {
    v11 = (int)a8 * a10;
    v12 = (int)a4 * a6;
    v13 = 2 * a8;
    v14 = a2 & 7;
    if (a2 > 7)
    {
      v17 = (uint8x8_t *)&result[a5 + v12];
      v18 = a2 >> 3;
      if (a11)
      {
        v19 = 0;
        v20 = a9 + v11 + a7 - 16;
        do
        {
          v21 = v18;
          v22 = (unsigned __int8 *)v20;
          v23 = v17;
          do
          {
            result = v22 + 16;
            v24 = (const char *)(v22 + 16);
            v45 = vld2_s8(v24);
            v25 = (unsigned __int8 *)&v24[a8];
            v26 = (const char *)&v22[a8 + 16];
            v42 = vld2_s8(v26);
            v27.i8[0] = *(_BYTE *)(a11 + v45.val[0].u8[0]);
            v27.i8[1] = *(_BYTE *)(a11 + v45.val[0].u8[1]);
            v27.i8[2] = *(_BYTE *)(a11 + v45.val[0].u8[2]);
            v27.i8[3] = *(_BYTE *)(a11 + v45.val[0].u8[3]);
            v28.i8[0] = *(_BYTE *)(a11 + v45.val[1].u8[0]);
            v28.i8[1] = *(_BYTE *)(a11 + v45.val[1].u8[1]);
            v28.i8[2] = *(_BYTE *)(a11 + v45.val[1].u8[2]);
            v28.i8[3] = *(_BYTE *)(a11 + v45.val[1].u8[3]);
            v29.i8[0] = *(_BYTE *)(a11 + v42.val[0].u8[0]);
            v27.i8[4] = *(_BYTE *)(a11 + v45.val[0].u8[4]);
            v28.i8[4] = *(_BYTE *)(a11 + v45.val[1].u8[4]);
            v29.i8[1] = *(_BYTE *)(a11 + v42.val[0].u8[1]);
            v27.i8[5] = *(_BYTE *)(a11 + v45.val[0].u8[5]);
            v28.i8[5] = *(_BYTE *)(a11 + v45.val[1].u8[5]);
            v29.i8[2] = *(_BYTE *)(a11 + v42.val[0].u8[2]);
            v27.i8[6] = *(_BYTE *)(a11 + v45.val[0].u8[6]);
            v28.i8[6] = *(_BYTE *)(a11 + v45.val[1].u8[6]);
            v29.i8[3] = *(_BYTE *)(a11 + v42.val[0].u8[3]);
            v27.i8[7] = *(_BYTE *)(a11 + v45.val[0].u8[7]);
            v28.i8[7] = *(_BYTE *)(a11 + v45.val[1].u8[7]);
            v29.i8[4] = *(_BYTE *)(a11 + v42.val[0].u8[4]);
            v29.i8[5] = *(_BYTE *)(a11 + v42.val[0].u8[5]);
            v29.i8[6] = *(_BYTE *)(a11 + v42.val[0].u8[6]);
            v29.i8[7] = *(_BYTE *)(a11 + v42.val[0].u8[7]);
            v45.val[0].i8[0] = *(_BYTE *)(a11 + v42.val[1].u8[0]);
            v45.val[0].i8[1] = *(_BYTE *)(a11 + v42.val[1].u8[1]);
            v45.val[0].i8[2] = *(_BYTE *)(a11 + v42.val[1].u8[2]);
            v45.val[0].i8[3] = *(_BYTE *)(a11 + v42.val[1].u8[3]);
            v45.val[0].i8[4] = *(_BYTE *)(a11 + v42.val[1].u8[4]);
            v45.val[0].i8[5] = *(_BYTE *)(a11 + v42.val[1].u8[5]);
            v45.val[0].i8[6] = *(_BYTE *)(a11 + v42.val[1].u8[6]);
            v45.val[0].i8[7] = *(_BYTE *)(a11 + v42.val[1].u8[7]);
            v22 = result;
            *v23++ = vqmovn_u16(vrshrq_n_u16(vaddw_u8(vaddw_u8(vaddl_u8(v28, v27), v29), (uint8x8_t)v45.val[0]), 2uLL));
            --v21;
          }
          while (v21);
          if (v14)
          {
            result = (unsigned __int8 *)(*(unsigned __int8 *)(a11 + result[16])
                                       + *(unsigned __int8 *)(a11 + result[17])
                                       + *(unsigned __int8 *)(a11 + v25[16]));
            v23->i8[0] = (result + *(unsigned __int8 *)(a11 + v25[17]) + 2) >> 2;
            if (v14 != 1)
            {
              result = (unsigned __int8 *)(*(unsigned __int8 *)(a11 + v22[18])
                                         + *(unsigned __int8 *)(a11 + v22[19])
                                         + *(unsigned __int8 *)(a11 + v25[18]));
              v23->i8[1] = (result + *(unsigned __int8 *)(a11 + v25[19]) + 2) >> 2;
              if (v14 != 2)
              {
                result = (unsigned __int8 *)(*(unsigned __int8 *)(a11 + v22[20])
                                           + *(unsigned __int8 *)(a11 + v22[21])
                                           + *(unsigned __int8 *)(a11 + v25[20]));
                v23->i8[2] = (result + *(unsigned __int8 *)(a11 + v25[21]) + 2) >> 2;
                if (v14 != 3)
                {
                  result = (unsigned __int8 *)(*(unsigned __int8 *)(a11 + v22[22])
                                             + *(unsigned __int8 *)(a11 + v22[23])
                                             + *(unsigned __int8 *)(a11 + v25[22]));
                  v23->i8[3] = (result + *(unsigned __int8 *)(a11 + v25[23]) + 2) >> 2;
                  if (v14 != 4)
                  {
                    result = (unsigned __int8 *)(*(unsigned __int8 *)(a11 + v22[24])
                                               + *(unsigned __int8 *)(a11 + v22[25])
                                               + *(unsigned __int8 *)(a11 + v25[24]));
                    v23->i8[4] = (result + *(unsigned __int8 *)(a11 + v25[25]) + 2) >> 2;
                    if (v14 != 5)
                    {
                      result = (unsigned __int8 *)(*(unsigned __int8 *)(a11 + v22[26])
                                                 + *(unsigned __int8 *)(a11 + v22[27])
                                                 + *(unsigned __int8 *)(a11 + v25[26]));
                      v23->i8[5] = (result + *(unsigned __int8 *)(a11 + v25[27]) + 2) >> 2;
                      if (v14 != 6)
                      {
                        result = (unsigned __int8 *)(*(unsigned __int8 *)(a11 + v22[28])
                                                   + *(unsigned __int8 *)(a11 + v22[29]));
                        v23->i8[6] = ((_DWORD)result
                                    + *(unsigned __int8 *)(a11 + v25[28])
                                    + *(unsigned __int8 *)(a11 + v25[29])
                                    + 2) >> 2;
                      }
                    }
                  }
                }
              }
            }
          }
          v17 = (uint8x8_t *)((char *)v17 + a4);
          ++v19;
          v20 += v13;
        }
        while (v19 != a3);
      }
      else if ((a2 & 7) != 0)
      {
        v30 = 0;
        v31 = a9 + v11 + a7 - 16;
        do
        {
          v32 = a2 >> 3;
          v33 = v31;
          v34 = v17;
          do
          {
            v35 = (const char *)(v33 + a8);
            v33 += 16;
            v43 = vld2_s8((const char *)v33);
            v36 = (unsigned __int8 *)(v33 + a8);
            v35 += 16;
            v46 = vld2_s8(v35);
            *v34++ = vqmovn_u16(vrshrq_n_u16(vaddw_u8(vaddw_u8(vaddl_u8((uint8x8_t)v43.val[1], (uint8x8_t)v43.val[0]), (uint8x8_t)v46.val[0]), (uint8x8_t)v46.val[1]), 2uLL));
            --v32;
          }
          while (v32);
          result = (unsigned __int8 *)*(unsigned __int8 *)(v33 + 17);
          v34->i8[0] = (*(unsigned __int8 *)(v33 + 16) + (_DWORD)result + v36[16] + v36[17] + 2) >> 2;
          if (v14 != 1)
          {
            result = (unsigned __int8 *)*(unsigned __int8 *)(v33 + 19);
            v34->i8[1] = (*(unsigned __int8 *)(v33 + 18) + (_DWORD)result + v36[18] + v36[19] + 2) >> 2;
            if (v14 != 2)
            {
              result = (unsigned __int8 *)*(unsigned __int8 *)(v33 + 21);
              v34->i8[2] = (*(unsigned __int8 *)(v33 + 20) + (_DWORD)result + v36[20] + v36[21] + 2) >> 2;
              if (v14 != 3)
              {
                result = (unsigned __int8 *)*(unsigned __int8 *)(v33 + 23);
                v34->i8[3] = (*(unsigned __int8 *)(v33 + 22) + (_DWORD)result + v36[22] + v36[23] + 2) >> 2;
                if (v14 != 4)
                {
                  result = (unsigned __int8 *)*(unsigned __int8 *)(v33 + 25);
                  v34->i8[4] = (*(unsigned __int8 *)(v33 + 24) + (_DWORD)result + v36[24] + v36[25] + 2) >> 2;
                  if (v14 != 5)
                  {
                    result = (unsigned __int8 *)*(unsigned __int8 *)(v33 + 27);
                    v34->i8[5] = (*(unsigned __int8 *)(v33 + 26) + (_DWORD)result + v36[26] + v36[27] + 2) >> 2;
                    if (v14 != 6)
                    {
                      result = (unsigned __int8 *)v36[28];
                      v34->i8[6] = (*(unsigned __int8 *)(v33 + 28)
                                  + *(unsigned __int8 *)(v33 + 29)
                                  + (_DWORD)result
                                  + v36[29]
                                  + 2) >> 2;
                    }
                  }
                }
              }
            }
          }
          v17 = (uint8x8_t *)((char *)v17 + a4);
          ++v30;
          v31 += v13;
        }
        while (v30 != a3);
      }
      else
      {
        v37 = (const char *)(a7 + a9 + v11);
        do
        {
          v38 = 0;
          v39 = v37;
          do
          {
            v40 = &v39[a8];
            v44 = (uint16x8_t)vld2_s8(v39);
            v39 += 16;
            v44 = vaddl_u8((uint8x8_t)v44.u64[1], *(uint8x8_t *)v44.i8);
            *(int8x8x2_t *)((char *)&v44 + 8) = vld2_s8(v40);
            v17[v38++] = vqmovn_u16(vrshrq_n_u16(vaddw_u8(vaddw_u8(v44, (uint8x8_t)v44.u64[1]), v41), 2uLL));
          }
          while (v18 != v38);
          v17 = (uint8x8_t *)((char *)v17 + a4);
          v37 += v13;
          ++v14;
        }
        while (v14 != a3);
      }
    }
    else if ((a2 & 7) != 0)
    {
      v15 = (unsigned __int8 *)(a9 + v11 + a7 + 13);
      v16 = &result[a5 + 3 + v12];
      if (a11)
      {
        do
        {
          *(v16 - 3) = (*(unsigned __int8 *)(a11 + *(v15 - 13))
                      + *(unsigned __int8 *)(a11 + *(v15 - 12))
                      + *(unsigned __int8 *)(a11 + v15[a8 - 13])
                      + *(unsigned __int8 *)(a11 + v15[a8 - 12])
                      + 2) >> 2;
          if (v14 != 1)
          {
            *(v16 - 2) = (*(unsigned __int8 *)(a11 + *(v15 - 11))
                        + *(unsigned __int8 *)(a11 + *(v15 - 10))
                        + *(unsigned __int8 *)(a11 + v15[a8 - 11])
                        + *(unsigned __int8 *)(a11 + v15[a8 - 10])
                        + 2) >> 2;
            if (v14 != 2)
            {
              *(v16 - 1) = (*(unsigned __int8 *)(a11 + *(v15 - 9))
                          + *(unsigned __int8 *)(a11 + *(v15 - 8))
                          + *(unsigned __int8 *)(a11 + v15[a8 - 9])
                          + *(unsigned __int8 *)(a11 + v15[a8 - 8])
                          + 2) >> 2;
              if (v14 != 3)
              {
                *v16 = (*(unsigned __int8 *)(a11 + *(v15 - 7))
                      + *(unsigned __int8 *)(a11 + *(v15 - 6))
                      + *(unsigned __int8 *)(a11 + v15[a8 - 7])
                      + *(unsigned __int8 *)(a11 + v15[a8 - 6])
                      + 2) >> 2;
                if (v14 != 4)
                {
                  v16[1] = (*(unsigned __int8 *)(a11 + *(v15 - 5))
                          + *(unsigned __int8 *)(a11 + *(v15 - 4))
                          + *(unsigned __int8 *)(a11 + v15[a8 - 5])
                          + *(unsigned __int8 *)(a11 + v15[a8 - 4])
                          + 2) >> 2;
                  if (v14 != 5)
                  {
                    v16[2] = (*(unsigned __int8 *)(a11 + *(v15 - 3))
                            + *(unsigned __int8 *)(a11 + *(v15 - 2))
                            + *(unsigned __int8 *)(a11 + v15[a8 - 3])
                            + *(unsigned __int8 *)(a11 + v15[a8 - 2])
                            + 2) >> 2;
                    if (v14 != 6)
                      v16[3] = (*(unsigned __int8 *)(a11 + *(v15 - 1))
                              + *(unsigned __int8 *)(a11 + *v15)
                              + *(unsigned __int8 *)(a11 + v15[a8 - 1])
                              + *(unsigned __int8 *)(a11 + v15[a8])
                              + 2) >> 2;
                  }
                }
              }
            }
          }
          v15 += v13;
          v16 += a4;
          --a3;
        }
        while (a3);
      }
      else
      {
        do
        {
          *(v16 - 3) = (*(v15 - 13) + *(v15 - 12) + v15[a8 - 13] + v15[a8 - 12] + 2) >> 2;
          if (v14 != 1)
          {
            *(v16 - 2) = (*(v15 - 11) + *(v15 - 10) + v15[a8 - 11] + v15[a8 - 10] + 2) >> 2;
            if (v14 != 2)
            {
              *(v16 - 1) = (*(v15 - 9) + *(v15 - 8) + v15[a8 - 9] + v15[a8 - 8] + 2) >> 2;
              if (v14 != 3)
              {
                *v16 = (*(v15 - 7) + *(v15 - 6) + v15[a8 - 7] + v15[a8 - 6] + 2) >> 2;
                if (v14 != 4)
                {
                  v16[1] = (*(v15 - 5) + *(v15 - 4) + v15[a8 - 5] + v15[a8 - 4] + 2) >> 2;
                  if (v14 != 5)
                  {
                    v16[2] = (*(v15 - 3) + *(v15 - 2) + v15[a8 - 3] + v15[a8 - 2] + 2) >> 2;
                    if (v14 != 6)
                      v16[3] = (*(v15 - 1) + *v15 + v15[a8 - 1] + v15[a8] + 2) >> 2;
                  }
                }
              }
            }
          }
          v15 += v13;
          v16 += a4;
          --a3;
        }
        while (a3);
      }
    }
  }
  return result;
}

void FeatureMatcher_destructor(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;

  if (a1)
  {
    v2 = (void *)a1[8];
    if (v2)
    {
      free(v2);
      a1[8] = 0;
    }
    v3 = (void *)a1[6];
    if (v3)
    {
      free(v3);
      a1[6] = 0;
    }
    v4 = (void *)a1[5];
    if (v4)
      free(v4);
    free(a1);
  }
}

void FeatureMatcher_init(uint64_t a1)
{
  bzero(*(void **)(a1 + 40), 4 * *(_QWORD *)(a1 + 32));
  bzero(*(void **)(a1 + 48), 4 * *(_QWORD *)(a1 + 32));
  bzero(*(void **)(a1 + 64), 4 * *(_QWORD *)(a1 + 32));
}

uint64_t FeatureMatcher_getPreprocessBlkData(uint64_t a1, void *a2, float *a3, unsigned int a4, unsigned int a5, uint64_t a6, size_t a7)
{
  vImagePixelCount v10;
  vImagePixelCount v11;
  vImage_Error v12;
  float __C;
  vImage_Buffer dest;
  vImage_Buffer src;

  v11 = *(_QWORD *)(a1 + 16);
  v10 = *(_QWORD *)(a1 + 24);
  src.data = (void *)(a6 - *(_QWORD *)a1 + a4 + (a5 - *(_QWORD *)(a1 + 8)) * a7);
  src.height = v10;
  src.width = v11;
  src.rowBytes = a7;
  dest.data = a2;
  dest.height = v10;
  dest.width = v11;
  dest.rowBytes = 4 * v11;
  v12 = vImageConvert_Planar8toPlanarF(&src, &dest, 255.0, 0.0, 0);
  if (v12)
  {
    syslog(3, "FeatureMatcher_getPreprocessBlkData: block extraction faild err=%d", v12);
    return 0xFFFFFFFFLL;
  }
  else
  {
    __C = 0.0;
    vDSP_meanv((const float *)a2, 1, &__C, *(_QWORD *)(a1 + 32));
    __C = -__C;
    vDSP_vsadd((const float *)a2, 1, &__C, (float *)a2, 1, *(_QWORD *)(a1 + 32));
    vDSP_vsq((const float *)a2, 1, *(float **)(a1 + 64), 1, *(_QWORD *)(a1 + 32));
    vDSP_meanv(*(const float **)(a1 + 64), 1, a3, *(_QWORD *)(a1 + 32));
    return 0;
  }
}

uint64_t FeatureMatcher_BestMatch(uint64_t a1, unsigned __int16 *a2, unsigned __int16 *a3, float *a4, uint64_t a5, size_t a6, int a7)
{
  _WORD *v10;
  _WORD *v11;
  unsigned int v13;
  unsigned int v14;
  uint64_t v15;
  float v16;
  unint64_t v17;
  int v18;
  unsigned int v19;
  unsigned int v20;
  unsigned int v21;
  unsigned int v22;
  unsigned int v23;
  unsigned int v24;
  BOOL v25;
  unsigned int v26;
  unsigned int v27;
  uint64_t result;
  unsigned __int16 v29;
  unsigned int v30;
  void *v31;
  vImagePixelCount v32;
  vImagePixelCount v33;
  vImage_Error v34;
  float v35;
  unint64_t v36;
  _WORD *v37;
  _WORD *v38;
  float *v39;
  unsigned int v40;
  unsigned __int16 v41;
  unsigned int v42;
  uint64_t v43;
  __int16 v44;
  __int16 v45;
  float __B;
  vImage_Buffer dest;
  vImage_Buffer __C;

  v10 = a3;
  v11 = a2;
  v13 = *a2;
  v14 = *a3;
  if (*(_BYTE *)(a1 + 808))
  {
    v15 = *(_QWORD *)(a1 + 784);
    if (v15)
      memset_pattern16((void *)(a1 + 72), &unk_216F96A50, 4 * v15);
    memset_pattern16((void *)(a1 + 748), &unk_216F96A50, 0x24uLL);
  }
  if (FeatureMatcher_getPreprocessBlkData(a1, *(void **)(a1 + 48), (float *)(a1 + 60), v13, v14, a5, a6) == -1)
  {
    syslog(3, "FeatureMatcher_BestMatch: failed getting the template block");
    return 0xFFFFFFFFLL;
  }
  LODWORD(__C.data) = 0;
  vDSP_vmul(*(const float **)(a1 + 40), 1, *(const float **)(a1 + 48), 1, *(float **)(a1 + 64), 1, *(_QWORD *)(a1 + 32));
  vDSP_meanv(*(const float **)(a1 + 64), 1, (float *)&__C, *(_QWORD *)(a1 + 32));
  if (*(_BYTE *)(a1 + 809))
  {
    v16 = *(float *)&__C.data / sqrtf(*(float *)(a1 + 60) * *(float *)(a1 + 56));
    if (!*(_BYTE *)(a1 + 808))
      goto LABEL_13;
LABEL_11:
    v17 = *(_QWORD *)(a1 + 792) + *(_QWORD *)(a1 + 792) * *(_QWORD *)(a1 + 800);
    if (v17 < *(_QWORD *)(a1 + 784))
      *(float *)(a1 + 4 * v17 + 72) = v16;
    goto LABEL_13;
  }
  v16 = (float)(*(float *)&__C.data * *(float *)&__C.data) / (float)(*(float *)(a1 + 60) * *(float *)(a1 + 56));
  if (*(_BYTE *)(a1 + 808))
    goto LABEL_11;
LABEL_13:
  v18 = v14 - a7;
  v19 = (unsigned __int16)(v14 - a7);
  if (v14 + a7 < v19)
    goto LABEL_26;
  v42 = v14 + a7;
  v20 = v13 + a7;
  v41 = v13 - a7;
  v40 = (unsigned __int16)(v13 - a7);
  if (v13 + a7 < v40)
  {
    v21 = v14 + a7 + 1;
    v22 = (unsigned __int16)(v18 + 1);
    v23 = v42 + 1 - v22;
    if (v42 + 1 < v22)
      v23 = 0;
    v24 = v23 + 1;
    if (v24 < 2)
      goto LABEL_47;
    v25 = v21 >= v22;
    v26 = v21 - v22;
    if (!v25)
      v26 = 0;
    if (((v22 + (unsigned __int16)v26) & 0x10000) != 0)
      goto LABEL_47;
    if (HIWORD(v26))
      goto LABEL_47;
    v18 += v24 & 0xFFFFFFFE;
    v27 = v24 & 0xFFFFFFFE;
    do
      v27 -= 2;
    while (v27);
    if (v24 != (v24 & 0xFFFFFFFE))
    {
LABEL_47:
      do
        ++v18;
      while (v42 >= (unsigned __int16)v18);
    }
LABEL_26:
    v44 = v14;
    v45 = v13;
LABEL_27:
    result = 0;
    *v11 = v45;
    *v10 = v44;
    *a4 = v16;
    return result;
  }
  v44 = v14;
  v45 = v13;
  v38 = v10;
  v39 = a4;
  v37 = v11;
LABEL_30:
  v43 = (int)(v19 - v14);
  v30 = v40;
  v29 = v41;
  while (v13 == v29 && v14 == (unsigned __int16)v18)
  {
LABEL_31:
    v30 = ++v29;
    if (v20 < v29)
    {
      LOWORD(v18) = v18 + 1;
      v19 = (unsigned __int16)v18;
      v10 = v38;
      a4 = v39;
      v11 = v37;
      if (v42 < (unsigned __int16)v18)
        goto LABEL_27;
      goto LABEL_30;
    }
  }
  v31 = *(void **)(a1 + 48);
  v33 = *(_QWORD *)(a1 + 16);
  v32 = *(_QWORD *)(a1 + 24);
  __C.data = (void *)(a5 - *(_QWORD *)a1 + v29 + ((unsigned __int16)v18 - *(_QWORD *)(a1 + 8)) * a6);
  __C.height = v32;
  __C.width = v33;
  __C.rowBytes = a6;
  dest.data = v31;
  dest.height = v32;
  dest.width = v33;
  dest.rowBytes = 4 * v33;
  v34 = vImageConvert_Planar8toPlanarF(&__C, &dest, 255.0, 0.0, 0);
  if (!v34)
  {
    __B = 0.0;
    vDSP_meanv((const float *)v31, 1, &__B, *(_QWORD *)(a1 + 32));
    __B = -__B;
    vDSP_vsadd((const float *)v31, 1, &__B, (float *)v31, 1, *(_QWORD *)(a1 + 32));
    vDSP_vsq((const float *)v31, 1, *(float **)(a1 + 64), 1, *(_QWORD *)(a1 + 32));
    vDSP_meanv(*(const float **)(a1 + 64), 1, (float *)(a1 + 60), *(_QWORD *)(a1 + 32));
    LODWORD(__C.data) = 0;
    vDSP_vmul(*(const float **)(a1 + 40), 1, *(const float **)(a1 + 48), 1, *(float **)(a1 + 64), 1, *(_QWORD *)(a1 + 32));
    vDSP_meanv(*(const float **)(a1 + 64), 1, (float *)&__C, *(_QWORD *)(a1 + 32));
    if (*(_BYTE *)(a1 + 809))
    {
      v35 = *(float *)&__C.data / sqrtf(*(float *)(a1 + 60) * *(float *)(a1 + 56));
      if (!*(_BYTE *)(a1 + 808))
      {
LABEL_41:
        if (v35 > v16)
        {
          v44 = v18;
          v45 = v29;
          v16 = v35;
        }
        goto LABEL_31;
      }
    }
    else
    {
      v35 = (float)(*(float *)&__C.data * *(float *)&__C.data) / (float)(*(float *)(a1 + 60) * *(float *)(a1 + 56));
      if (!*(_BYTE *)(a1 + 808))
        goto LABEL_41;
    }
    v36 = *(_QWORD *)(a1 + 792) + (int)(v30 - v13) + (*(_QWORD *)(a1 + 792) + v43) * *(_QWORD *)(a1 + 800);
    if (v36 < *(_QWORD *)(a1 + 784))
      *(float *)(a1 + 72 + 4 * v36) = v35;
    goto LABEL_41;
  }
  syslog(3, "FeatureMatcher_getPreprocessBlkData: block extraction faild err=%d", v34);
  syslog(3, "FeatureMatcher_BestMatch: failed getting the source block");
  return 0xFFFFFFFFLL;
}

uint64_t FeatureMatcher_execute(uint64_t a1, unsigned __int16 *a2, unsigned __int16 *a3, unsigned __int16 *a4, unsigned __int16 *a5, float *a6, unsigned int a7, uint64_t a8, size_t a9, uint64_t a10, size_t a11, unsigned __int16 a12)
{
  unint64_t v20;
  int v21;
  int PreprocessBlkData;
  uint64_t v24;
  float *v25;

  if (a7)
  {
    v25 = (float *)(a1 + 56);
    if (FeatureMatcher_getPreprocessBlkData(a1, *(void **)(a1 + 40), (float *)(a1 + 56), *a2, *a3, a8, a9) == -1)
    {
      v21 = 1;
      syslog(3, "FeatureMatcher_execute: failed getting the source block");
    }
    else
    {
      v24 = a8;
      v20 = 1;
      v21 = 1;
      while (FeatureMatcher_BestMatch(a1, a4, a5, a6, a10, a11, a12) != -1)
      {
        if (a7 == v20)
          goto LABEL_8;
        v21 = v20 < a7;
        PreprocessBlkData = FeatureMatcher_getPreprocessBlkData(a1, *(void **)(a1 + 40), v25, a2[v20], a3[v20], v24, a9);
        ++v20;
        ++a6;
        ++a5;
        ++a4;
        if (PreprocessBlkData == -1)
        {
          syslog(3, "FeatureMatcher_execute: failed getting the source block");
          return (v21 << 31 >> 31);
        }
      }
      syslog(3, "FeatureMatcher_execute: failed finding the best match");
    }
  }
  else
  {
LABEL_8:
    v21 = 0;
  }
  return (v21 << 31 >> 31);
}

uint64_t HistEqCreateContext(GLuint *a1)
{
  uint64_t v1;
  GLuint Shader;
  GLuint v4;
  GLuint v5;
  GLuint v6;
  GLuint Program;
  GLuint v8;
  GLint UniformLocation;
  GLint v10;
  GLint v11;
  GLint v12;
  uint64_t v14;
  GLint params;
  _OWORD pixels[16];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  memset(pixels, 0, sizeof(pixels));
  Shader = gl_UtilsCreateShader(0x8B31u, "attribute vec2 position;\n"
             "varying vec2 texcoord;\n"
             "void main()\n"
             "{\n"
             "  texcoord = 0.5 * (position + 1.0);\n"
             "  gl_Position = vec4(position.x, position.y, 0.0, 1.0);\n"
             "}\n");
  if (!Shader)
  {
    fig_log_get_emitter();
    v14 = v1;
    FigDebugAssert3();
LABEL_10:
    *a1 = 0;
    goto LABEL_11;
  }
  v4 = Shader;
  v5 = gl_UtilsCreateShader(0x8B30u, "precision mediump float;\n"
         "uniform sampler2D source;\n"
         "uniform sampler2D lut;\n"
         "uniform float textureScale;\n"
         "uniform float textureBias;\n"
         "varying highp vec2 texcoord;\n"
         "void main()\n"
         "{\n"
         "  vec4 texColor = texture2D(source, texcoord);\n"
         "  texColor = textureScale * texColor + textureBias;\n"
         "  gl_FragColor.xyzw = vec4(texture2D(lut, vec2(texColor.x, 0.0)).x,\n"
         "                           texture2D(lut, vec2(texColor.y, 0.0)).x,\n"
         "                           texture2D(lut, vec2(texColor.z, 0.0)).x,\n"
         "                           texture2D(lut, vec2(texColor.w, 0.0)).x);\n"
         "}\n");
  if (!v5)
  {
    fig_log_get_emitter();
    v14 = v1;
    FigDebugAssert3();
    glDeleteShader(v4);
    goto LABEL_10;
  }
  v6 = v5;
  params = 0;
  Program = glCreateProgram();
  v8 = Program;
  if (Program)
  {
    glAttachShader(Program, v4);
    glAttachShader(v8, v6);
    glLinkProgram(v8);
    glGetProgramiv(v8, 0x8B82u, &params);
    if (!params)
    {
      glDeleteProgram(v8);
      v8 = 0;
    }
    glDeleteShader(v4);
    glDeleteShader(v6);
    *a1 = v8;
    if (v8)
    {
      a1[1] = glGetAttribLocation(v8, "position");
      glGenFramebuffers(1, a1 + 2);
      glGenTextures(1, a1 + 3);
      glGenTextures(1, a1 + 4);
      glGenTextures(1, a1 + 5);
      glActiveTexture(0x84C1u);
      glBindTexture(0xDE1u, a1[5]);
      glTexImage2D(0xDE1u, 0, 33321, 256, 1, 0, 0x1903u, 0x1401u, pixels);
      glBindTexture(0xDE1u, 0);
      glActiveTexture(0x84C0u);
      glUseProgram(*a1);
      UniformLocation = glGetUniformLocation(*a1, "source");
      glUniform1i(UniformLocation, 0);
      v10 = glGetUniformLocation(*a1, "lut");
      glUniform1i(v10, 1);
      v11 = glGetUniformLocation(*a1, "textureScale");
      glUniform1f(v11, 0.99609);
      v12 = glGetUniformLocation(*a1, "textureBias");
      glUniform1f(v12, 0.0019531);
      glUseProgram(0);
      return 0;
    }
  }
  else
  {
    fig_log_get_emitter();
    v14 = v1;
    FigDebugAssert3();
    glDeleteShader(v4);
    glDeleteShader(v6);
    *a1 = 0;
  }
LABEL_11:
  NSLog(CFSTR("%s : GL program failed to compile/link\n"), "HistEqCreateContext", v14);
  return 0xFFFFFFFFLL;
}

void HistEqDestroyContext(uint64_t a1)
{
  glUseProgram(0);
  glBindFramebuffer(0x8D40u, 0);
  glActiveTexture(0x84C0u);
  glBindTexture(0xDE1u, 0);
  glActiveTexture(0x84C1u);
  glBindTexture(0xDE1u, 0);
  glActiveTexture(0x84C2u);
  glBindTexture(0xDE1u, 0);
  glDeleteProgram(*(_DWORD *)a1);
  glDeleteFramebuffers(1, (const GLuint *)(a1 + 8));
  glDeleteTextures(1, (const GLuint *)(a1 + 12));
  glDeleteTextures(1, (const GLuint *)(a1 + 16));
  glDeleteTextures(1, (const GLuint *)(a1 + 20));
  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 16) = 0;
}

uint64_t HistEqualize(void *a1, GLuint *a2, CVPixelBufferRef pixelBuffer, __CVBuffer *a4)
{
  int WidthOfPlane;
  size_t HeightOfPlane;
  size_t v10;
  IOSurfaceRef IOSurface;
  IOSurfaceRef v12;
  uint64_t v13;
  int v15;
  int v16;
  int BytesPerRowOfPlane;
  unsigned int v18;
  uint64_t v19;
  int v27;
  uint64_t v28;
  uint64_t Error;
  uint64_t i;
  uint64_t v32;
  uint32x4_t *v33;
  float v34;
  float32x4_t v35;
  float32x4_t v36;
  float32x4_t v37;
  float32x4_t v38;
  uint64_t v39;
  uint64_t j;
  char v41;
  _BYTE *v42;
  int v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  IOSurfaceRef v48;
  _BYTE pixels[512];
  _DWORD v50[256];
  _DWORD v51[256];
  uint64_t v52;
  int8x16x4_t v53;

  v52 = *MEMORY[0x24BDAC8D0];
  if (a2 && a1 && pixelBuffer && a4)
  {
    WidthOfPlane = CVPixelBufferGetWidthOfPlane(pixelBuffer, 0);
    HeightOfPlane = CVPixelBufferGetHeightOfPlane(pixelBuffer, 0);
    if ((WidthOfPlane & 3) == 0
      && (v10 = HeightOfPlane, WidthOfPlane == CVPixelBufferGetWidthOfPlane(a4, 0))
      && (_DWORD)v10 == CVPixelBufferGetHeightOfPlane(a4, 0))
    {
      IOSurface = CVPixelBufferGetIOSurface(pixelBuffer);
      v12 = CVPixelBufferGetIOSurface(a4);
      if (IOSurface && v12)
      {
        v48 = v12;
        v13 = CVPixelBufferLockBaseAddress(a4, 1uLL);
        if ((_DWORD)v13)
        {
          v28 = v13;
          fig_log_get_emitter();
          FigDebugAssert3();
          fig_log_get_emitter();
          FigDebugAssert3();
          goto LABEL_21;
        }
        bzero(v51, 0x400uLL);
        _X26 = (char *)CVPixelBufferGetBaseAddressOfPlane(a4, 0);
        v15 = CVPixelBufferGetWidthOfPlane(a4, 0);
        v16 = CVPixelBufferGetHeightOfPlane(a4, 0);
        BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a4, 0);
        if (v16 == 5)
        {
          CVPixelBufferUnlockBaseAddress(a4, 1uLL);
          v27 = 0;
        }
        else
        {
          v18 = 0;
          do
          {
            v19 = 0;
            __asm { PRFM            #4, [X26] }
            do
            {
              _X13 = &_X26[v19];
              __asm { PRFUM           #4, [X13,#5] }
              ++v51[_X26[v19]];
              v19 += 5;
            }
            while (v19 <= v15 - 5);
            _X26 += (5 * BytesPerRowOfPlane);
            v18 += 5;
          }
          while (v18 < v16 - 5);
          CVPixelBufferUnlockBaseAddress(a4, 1uLL);
          v27 = v51[0];
        }
        v50[0] = v27;
        for (i = 1; i != 256; ++i)
        {
          v27 += v51[i];
          v50[i] = v27;
        }
        v32 = 0;
        v33 = (uint32x4_t *)v50;
        v34 = 255.0 / (float)v50[255];
        do
        {
          v35.i64[0] = 0x3F0000003F000000;
          v35.i64[1] = 0x3F0000003F000000;
          v36.i64[0] = 0x3F0000003F000000;
          v36.i64[1] = 0x3F0000003F000000;
          v37.i64[0] = 0x3F0000003F000000;
          v37.i64[1] = 0x3F0000003F000000;
          v38.i64[0] = 0x3F0000003F000000;
          v38.i64[1] = 0x3F0000003F000000;
          v53.val[2] = (int8x16_t)vcvtq_u32_f32(vmlaq_n_f32(v38, vcvtq_f32_u32(v33[2]), v34));
          v53.val[1] = (int8x16_t)vcvtq_u32_f32(vmlaq_n_f32(v37, vcvtq_f32_u32(v33[1]), v34));
          v53.val[0] = (int8x16_t)vcvtq_u32_f32(vmlaq_n_f32(v36, vcvtq_f32_u32(*v33), v34));
          v53.val[3] = (int8x16_t)vcvtq_u32_f32(vmlaq_n_f32(v35, vcvtq_f32_u32(v33[3]), v34));
          *(int8x16_t *)&pixels[v32 + 256] = vqtbl4q_s8(v53, (int8x16_t)xmmword_216F96220);
          v32 += 16;
          v33 += 4;
        }
        while (v32 != 256);
        v39 = 0;
        for (j = 0; j != 256; j += 2)
        {
          v41 = pixels[((v39 + 65793) >> 16) + 256];
          v42 = &pixels[j];
          *v42 = pixels[WORD1(v39) + 256];
          v42[1] = v41;
          v39 += 131586;
        }
        glUseProgram(*a2);
        glVertexAttribPointer(a2[1], 2, 0x1406u, 0, 0, &HistEqualize_verts);
        glEnableVertexAttribArray(a2[1]);
        glActiveTexture(0x84C2u);
        glBindTexture(0xDE1u, a2[3]);
        v44 = (WidthOfPlane / 4);
        BYTE4(v46) = 0;
        LODWORD(v46) = 0;
        if ((objc_msgSend(a1, "texImageIOSurface:target:internalFormat:width:height:format:type:plane:invert:", IOSurface, 3553, 6408, (v43 >> 2), v10, 6408, 5121, v46) & 1) == 0)
        {
          NSLog(CFSTR("%s : Unable to bind dest IOSurface as texture\n"), "HistEqualize");
          goto LABEL_41;
        }
        glBindFramebuffer(0x8D40u, a2[2]);
        glFramebufferTexture2D(0x8D40u, 0x8CE0u, 0xDE1u, a2[3], 0);
        v45 = glCheckFramebufferStatus(0x8D40u);
        if ((_DWORD)v45 == 36053)
        {
          glActiveTexture(0x84C0u);
          glBindTexture(0xDE1u, a2[4]);
          BYTE4(v47) = 0;
          LODWORD(v47) = 0;
          if ((objc_msgSend(a1, "texImageIOSurface:target:internalFormat:width:height:format:type:plane:invert:", v48, 3553, 6408, v44, v10, 6408, 5121, v47) & 1) != 0)
          {
            setTextureMode(0x2600u);
            glActiveTexture(0x84C1u);
            glBindTexture(0xDE1u, a2[5]);
            glTexImage2D(0xDE1u, 0, 33321, 256, 1, 0, 0x1903u, 0x1401u, pixels);
            setTextureMode(0x2601u);
            glViewport(0, 0, v44, v10);
            glDrawArrays(5u, 0, 4);
            glFlush();
            v28 = 0;
            goto LABEL_21;
          }
          NSLog(CFSTR("%s : Unable to bind source IOSurface as texture\n"), "HistEqualize");
LABEL_41:
          v28 = 1;
          goto LABEL_21;
        }
        NSLog(CFSTR("%s : Framebuffer not complete (status 0x%04x)\n"), "HistEqualize", v45);
      }
      else
      {
        NSLog(CFSTR("%s : Input images aren't backed by IOSurfaces\n"), "HistEqualize");
      }
    }
    else
    {
      NSLog(CFSTR("%s : Unsupported image width,height\n"), "HistEqualize");
    }
    v28 = 0xFFFFFFFFLL;
LABEL_21:
    glUseProgram(0);
    goto LABEL_22;
  }
  NSLog(CFSTR("%s : NULL input parameters\n"), "HistEqualize");
  glUseProgram(0);
  v28 = 0xFFFFFFFFLL;
  if (a2)
LABEL_22:
    glDisableVertexAttribArray(a2[1]);
  glBindFramebuffer(0x8D40u, 0);
  glActiveTexture(0x84C0u);
  glBindTexture(0xDE1u, 0);
  glActiveTexture(0x84C1u);
  glBindTexture(0xDE1u, 0);
  glActiveTexture(0x84C2u);
  glBindTexture(0xDE1u, 0);
  Error = glGetError();
  if ((_DWORD)Error)
  {
    NSLog(CFSTR("%s : glGetError returned 0x%04x\n"), "HistEqualize", Error);
    return 0xFFFFFFFFLL;
  }
  return v28;
}

void setTextureMode(unsigned int a1)
{
  GLfloat v1;

  v1 = (float)a1;
  glTexParameterf(0xDE1u, 0x2800u, (float)a1);
  glTexParameterf(0xDE1u, 0x2801u, v1);
  glTexParameterf(0xDE1u, 0x2802u, 33071.0);
  glTexParameterf(0xDE1u, 0x2803u, 33071.0);
}

uint64_t gl_UtilsCreateShader(GLenum a1, GLchar *a2)
{
  uint64_t Shader;
  uint64_t v3;
  GLint params;
  GLchar *string;

  string = a2;
  Shader = glCreateShader(a1);
  v3 = Shader;
  if ((_DWORD)Shader)
  {
    params = 0;
    glShaderSource(Shader, 1, (const GLchar *const *)&string, 0);
    glCompileShader(v3);
    glGetShaderiv(v3, 0x8B81u, &params);
    if (params)
    {
      return v3;
    }
    else
    {
      glDeleteShader(v3);
      return 0;
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return v3;
  }
}

char *IPDetector_constructor(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char *v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  size_t v11;
  int v12;
  void *v13;
  void *v14;
  size_t v15;
  size_t v16;
  void *v17;
  void *v18;
  const char *v19;

  v6 = (char *)malloc_type_calloc(1uLL, 0x78uLL, 0x10B0040839BCD1CuLL);
  v7 = v6;
  if (v6)
  {
    *((_DWORD *)v6 + 10) = 3;
    *(_QWORD *)v6 = a1;
    *((_QWORD *)v6 + 1) = a2;
    *((_QWORD *)v6 + 2) = a3;
    *(int64x2_t *)(v6 + 72) = vdupq_n_s64(0xAuLL);
    *((_QWORD *)v6 + 13) = 23;
    *(_OWORD *)(v6 + 88) = xmmword_216F96A80;
    *((_WORD *)v6 + 56) = -1;
    v8 = malloc_type_calloc(1uLL, a3 * a2, 0x100004077774924uLL);
    *((_QWORD *)v7 + 3) = v8;
    if (v8)
    {
      v10 = *((_QWORD *)v7 + 1);
      v9 = *((_QWORD *)v7 + 2);
      v11 = 2 * v9 * v10;
      v12 = boxFilter_uint8_init(v9, *(_DWORD *)v7, v10, *((_DWORD *)v7 + 10));
      if (v11 <= v12)
        v11 = v12;
      v13 = malloc_type_calloc(1uLL, v11, 0x19B98B04uLL);
      *((_QWORD *)v7 + 4) = v13;
      if (v13)
      {
        bzero(v13, v11);
        v14 = malloc_type_calloc(1uLL, 0x258uLL, 0x1000040274DC3F3uLL);
        *((_QWORD *)v7 + 6) = v14;
        if (v14)
        {
          bzero(v14, 0x258uLL);
          v15 = 2 * a1;
          *((_QWORD *)v7 + 7) = malloc_type_calloc(1uLL, v15, 0x1000040BDFB0063uLL);
          v16 = 2 * a2;
          v17 = malloc_type_calloc(1uLL, v16, 0x1000040BDFB0063uLL);
          *((_QWORD *)v7 + 8) = v17;
          v18 = (void *)*((_QWORD *)v7 + 7);
          v19 = "IPDetector_constructor: Cannot allocate mBX, mBY ";
          if (v18 && v17)
          {
            bzero(v18, v15);
            bzero(*((void **)v7 + 8), v16);
            return v7;
          }
        }
        else
        {
          v19 = "IPDetector_constructor: Cannot allocate mCornerVec ";
        }
        syslog(3, v19);
      }
      else
      {
        syslog(3, "IPDetector_constructor: Cannot allocate mTmpBuffer ");
      }
    }
    else
    {
      syslog(3, "IPDetector_constructor: Cannot allocate mFltImage ");
    }
  }
  IPDetector_destructor(v7);
  return 0;
}

void IPDetector_destructor(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if (a1)
  {
    v2 = (void *)a1[8];
    if (v2)
    {
      free(v2);
      a1[8] = 0;
    }
    v3 = (void *)a1[7];
    if (v3)
    {
      free(v3);
      a1[7] = 0;
    }
    v4 = (void *)a1[6];
    if (v4)
    {
      free(v4);
      a1[6] = 0;
    }
    v5 = (void *)a1[4];
    if (v5)
    {
      free(v5);
      a1[4] = 0;
    }
    v6 = (void *)a1[3];
    if (v6)
      free(v6);
    free(a1);
  }
}

uint64_t IPDetector_execute(uint64_t a1, _WORD *a2, _WORD *a3, _WORD *a4, unsigned int a5, uint64_t a6, uint64_t a7, unint64_t a8, unint64_t a9, uint64_t a10, NSObject *a11)
{
  unint64_t v11;
  unint64_t v12;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unsigned int v21;
  unsigned __int16 *v22;
  int v23;
  int v24;
  unsigned int v25;
  unsigned int v26;
  uint64_t v27;
  unsigned __int16 v28;
  _WORD *v29;

  v11 = *(_QWORD *)(a1 + 104);
  v12 = a8 - v11;
  if (a8 <= v11 || a9 <= v11)
    return 0;
  v18 = *(_QWORD *)(a1 + 96);
  if (IPDetector_response(a1, a6, a7, a8, a9, a10, a11) == -1)
    return 0;
  IPDetector_cornerDetect(a1, v12, a9 - v11, a10, v18);
  if (!a2 || !a3 || !a4)
  {
    FigDebugAssert3();
    return 0;
  }
  qsort(*(void **)(a1 + 48), *(_QWORD *)(a1 + 88), 6uLL, (int (__cdecl *)(const void *, const void *))Corner_compare);
  v19 = *(_QWORD *)(a1 + 88);
  if (!v19)
  {
    LODWORD(v20) = 0;
    v21 = 0;
    v26 = *(unsigned __int16 *)(a1 + 112);
    v25 = a5;
    if (v26 != 0xFFFF)
      goto LABEL_20;
    goto LABEL_19;
  }
  v20 = 0;
  v21 = 0;
  v22 = (unsigned __int16 *)(*(_QWORD *)(a1 + 48) + 4);
  while (1)
  {
    v24 = *v22;
    v22 += 3;
    v23 = v24;
    if (!v24)
      break;
    ++v20;
    v21 += v23;
    if (v19 == v20)
    {
      v20 = *(_QWORD *)(a1 + 88);
      break;
    }
  }
  v25 = a5;
  v26 = *(unsigned __int16 *)(a1 + 112);
  if (v26 == 0xFFFF)
  {
    if ((_DWORD)v20)
      v21 /= v20;
LABEL_19:
    v26 = v21 >> 1;
  }
LABEL_20:
  if (v20 >= v25)
    v27 = v25;
  else
    v27 = v20;
  if (!(_DWORD)v27)
    return 0;
  v28 = 0;
  v29 = (_WORD *)(*(_QWORD *)(a1 + 48) + 4);
  do
  {
    if (v26 < (unsigned __int16)*v29)
    {
      ++v28;
      *a2 = *(v29 - 2);
      *a3 = *(v29 - 1);
      *a4 = *v29;
    }
    v29 += 3;
    ++a4;
    ++a3;
    ++a2;
    --v27;
  }
  while (v27);
  return v28;
}

uint64_t IPDetector_response(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, uint64_t a6, NSObject *a7)
{
  uint64_t v12;
  unsigned __int8 *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  _WORD *v18;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint8x8_t *v24;
  uint8x8_t *v25;
  unsigned __int8 *v26;
  unsigned __int8 *v27;
  uint8x8_t v28;
  int8x16_t v29;
  int16x4_t v30;
  int8x16_t v31;
  int16x4_t v32;
  int8x16_t v33;
  int32x4_t v34;
  int16x8_t v35;
  int16x4_t v36;
  int16x4_t v37;
  int32x4_t v38;
  int16x4_t v39;
  unsigned __int8 *v40;
  unsigned __int8 *v41;
  unsigned __int8 *v42;
  _WORD *v43;
  unsigned __int8 *v44;
  unsigned __int8 *v45;
  unsigned __int8 *v46;
  unsigned __int8 *v47;
  unsigned __int8 *v48;
  int v49;
  int v50;
  int v51;
  int v52;
  int v53;
  int v54;
  int v55;
  int v56;
  int v57;
  int v58;
  int v59;
  int v60;
  int v61;
  int v62;
  int v63;
  int v64;
  int v65;
  int v66;
  int v67;
  int v68;
  int v69;
  int v70;
  int v71;
  int v72;
  int v73;
  int v74;
  int v75;
  int v76;
  int v77;
  int v78;
  int v79;
  int v80;
  int v81;
  int v82;
  int v83;
  int v84;
  int v85;
  int v86;
  int v87;
  int v88;
  _QWORD v89[7];
  _QWORD block[6];
  _QWORD v91[11];
  _QWORD v92[4];

  v12 = a3 + a3 * a6;
  v13 = (unsigned __int8 *)(*(_QWORD *)(a1 + 24) + v12);
  if (boxFilter_uint8(v13, (void *)(a2 + v12), a6, a4, a5, *(_DWORD *)(a1 + 40), *(void **)(a1 + 32)) != -1)
  {
    v14 = 2 * a6;
    v15 = 3 * a6;
    v92[0] = 0;
    v92[1] = v92;
    v16 = a4 >> 3;
    v17 = a4 & 7;
    v92[2] = 0x2000000000;
    v18 = *(_WORD **)(a1 + 32);
    v92[3] = v18;
    v91[0] = MEMORY[0x24BDAC760];
    v91[1] = 0x40000000;
    v91[2] = __IPDetector_response_block_invoke;
    v91[3] = &unk_24D669818;
    v91[4] = v92;
    v91[5] = v13;
    v91[6] = a6;
    v91[7] = 3 * a6;
    v91[8] = 2 * a6;
    v91[9] = a4 >> 3;
    v91[10] = v17;
    if (a7)
    {
      v89[6] = a5;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 0x40000000;
      block[2] = __IPDetector_response_block_invoke_2;
      block[3] = &unk_24D669840;
      block[4] = v91;
      block[5] = a5 >> 1;
      v89[0] = MEMORY[0x24BDAC760];
      v89[1] = 0x40000000;
      v89[2] = __IPDetector_response_block_invoke_3;
      v89[3] = &unk_24D669868;
      v89[4] = v91;
      v89[5] = a5 >> 1;
      dispatch_async(a7, v89);
      dispatch_async(a7, block);
      dispatch_barrier_sync(a7, &__block_literal_global_4);
LABEL_4:
      _Block_object_dispose(v92, 8);
      return 0;
    }
    if (!a5)
      goto LABEL_4;
    v20 = 0;
    v21 = a4 >> 3;
    while (1)
    {
      if (v21)
      {
        v22 = 0;
        v23 = 0;
        v24 = (uint8x8_t *)v13;
        do
        {
          v25 = v24;
          v26 = (unsigned __int8 *)v24 + v14;
          v27 = (unsigned __int8 *)v24 - v14;
          v28 = *v24++;
          v29 = (int8x16_t)vmovl_u8(v28);
          v30 = (int16x4_t)vextq_s8(v29, v29, 8uLL).u64[0];
          *(int16x4_t *)v29.i8 = vadd_s16(*(int16x4_t *)v29.i8, *(int16x4_t *)v29.i8);
          v31 = (int8x16_t)vaddl_u8(*(uint8x8_t *)((char *)v25 + 3), *(uint8x8_t *)((char *)v25 - 3));
          v32 = vsub_s16(*(int16x4_t *)v29.i8, *(int16x4_t *)v31.i8);
          v33 = (int8x16_t)vaddl_u8(*(uint8x8_t *)((char *)v25 + 3 * a6), *(uint8x8_t *)((char *)v25 - 3 * a6));
          *(int16x4_t *)v29.i8 = vsub_s16(*(int16x4_t *)v29.i8, *(int16x4_t *)v33.i8);
          v34 = vmull_s16(v32, *(int16x4_t *)v29.i8);
          *(int16x4_t *)v29.i8 = vshr_n_s16(vadd_s16(*(int16x4_t *)v29.i8, v32), 4uLL);
          v35 = vsubq_s16((int16x8_t)vaddl_u8(*(uint8x8_t *)(v26 - 2), *(uint8x8_t *)(v27 + 2)), (int16x8_t)vaddl_u8(*(uint8x8_t *)(v26 + 2), *(uint8x8_t *)(v27 - 2)));
          v36 = vadd_s16(v30, v30);
          *(int16x4_t *)v31.i8 = vsub_s16(v36, (int16x4_t)*(_OWORD *)&vextq_s8(v31, v31, 8uLL));
          v37 = vsub_s16(v36, (int16x4_t)*(_OWORD *)&vextq_s8(v33, v33, 8uLL));
          v38 = vmull_s16(*(int16x4_t *)v31.i8, v37);
          v39 = vshr_n_s16(vadd_s16(v37, *(int16x4_t *)v31.i8), 4uLL);
          *(int16x8_t *)&v18[8 * v23++] = vshrn_high_n_s32(vshrn_n_s32(vmlsl_s16(vmlsl_s16(v34, *(int16x4_t *)v29.i8, *(int16x4_t *)v29.i8), *(int16x4_t *)v35.i8, *(int16x4_t *)v35.i8), 9uLL), vmlsl_high_s16(vmlsl_s16(v38, v39, v39), v35, v35), 9uLL);
          v22 += 8;
        }
        while (v23 < v16);
        v40 = (unsigned __int8 *)((char *)v24 - v14 - 2);
        v41 = (unsigned __int8 *)((char *)v24 - v14 + 2);
        v42 = (unsigned __int8 *)v24 + v14 + 2;
        v43 = &v18[v22];
        v44 = (unsigned __int8 *)v24 + v14 - 2;
        v45 = (unsigned __int8 *)v24 + v15;
        v46 = (unsigned __int8 *)v24 - v15;
        v47 = (unsigned __int8 *)&v25[1] + 3;
        v48 = (unsigned __int8 *)v25 + 5;
        v21 = v16;
        if (v17)
        {
LABEL_15:
          v49 = 2 * v24->u8[0];
          v50 = v49 - (*v48 + *v47);
          v51 = v49 - (*v46 + v24->u8[3 * a6]);
          v52 = v51 * v50;
          v53 = (v51 + v50) >> 4;
          v54 = *v44 - *v42 - *v40 + *v41;
          *v43 = (v52 - v54 * v54 - v53 * v53) >> 9;
          if (v17 != 1)
          {
            v55 = 2 * v24->u8[1];
            v56 = v55 - (v48[1] + v47[1]);
            v57 = v55 - (v46[1] + v45[1]);
            v58 = v57 * v56;
            v59 = (v57 + v56) >> 4;
            v60 = v44[1] - v42[1] - v40[1] + v41[1];
            v43[1] = (v58 - v60 * v60 - v59 * v59) >> 9;
            if (v17 != 2)
            {
              v61 = 2 * v24->u8[2];
              v62 = v61 - (v48[2] + v47[2]);
              v63 = v61 - (v46[2] + v45[2]);
              v64 = v63 * v62;
              v65 = (v63 + v62) >> 4;
              v66 = v44[2] - v42[2] - v40[2] + v41[2];
              v43[2] = (v64 - v66 * v66 - v65 * v65) >> 9;
              if (v17 != 3)
              {
                v67 = 2 * v24->u8[3];
                v68 = v67 - (v48[3] + v47[3]);
                v69 = v67 - (v46[3] + v45[3]);
                v70 = v69 * v68;
                v71 = (v69 + v68) >> 4;
                v72 = v44[3] - v42[3] - v40[3] + v41[3];
                v43[3] = (v70 - v72 * v72 - v71 * v71) >> 9;
                if (v17 != 4)
                {
                  v73 = 2 * v24->u8[4];
                  v74 = v73 - (v48[4] + v47[4]);
                  v75 = v73 - (v46[4] + v45[4]);
                  v76 = v75 * v74;
                  v77 = (v75 + v74) >> 4;
                  v78 = v44[4] - v42[4] - v40[4] + v41[4];
                  v43[4] = (v76 - v78 * v78 - v77 * v77) >> 9;
                  if (v17 != 5)
                  {
                    v79 = 2 * v24->u8[5];
                    v80 = v79 - (v48[5] + v47[5]);
                    v81 = v79 - (v46[5] + v45[5]);
                    v82 = v81 * v80;
                    v83 = (v81 + v80) >> 4;
                    v84 = v44[5] - v42[5] - v40[5] + v41[5];
                    v43[5] = (v82 - v84 * v84 - v83 * v83) >> 9;
                    if (v17 != 6)
                    {
                      v85 = 2 * v24->u8[6];
                      v86 = v85 - (v48[6] + v47[6]);
                      v87 = v85 - (v46[6] + v45[6]);
                      v88 = v44[6] - v42[6] - v40[6] + v41[6];
                      v43[6] = (v87 * v86 - v88 * v88 - ((v87 + v86) >> 4) * ((v87 + v86) >> 4)) >> 9;
                    }
                  }
                }
              }
            }
          }
        }
      }
      else
      {
        v48 = v13 - 3;
        v47 = v13 + 3;
        v46 = &v13[-v15];
        v45 = &v13[v15];
        v44 = &v13[v14 - 2];
        v42 = &v13[v14 + 2];
        v41 = &v13[-v14 + 2];
        v40 = &v13[-v14 - 2];
        v43 = v18;
        v24 = (uint8x8_t *)v13;
        if (v17)
          goto LABEL_15;
      }
      v13 += a6;
      v18 = (_WORD *)((char *)v18 + v14);
      if (++v20 == a5)
        goto LABEL_4;
    }
  }
  syslog(3, "IPDetector_response: box filter failed");
  return 0xFFFFFFFFLL;
}

void IPDetector_cornerDetect(uint64_t a1, unint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5)
{
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  int v18;
  unint64_t v19;
  _WORD *v20;
  uint64_t v21;
  unint64_t v22;
  int v23;
  unint64_t v24;
  _WORD *v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  int v37;
  uint64_t i;
  int v39;
  __int16 *v40;
  __int16 *v41;
  uint64_t v42;
  int v43;
  uint64_t v44;
  uint64_t v45;
  _WORD *v46;

  bzero(*(void **)(a1 + 48), 6 * *(_QWORD *)(a1 + 88));
  v10 = *(_QWORD *)(a1 + 72);
  v11 = *(_QWORD *)(a1 + 80);
  v12 = a2 / v10;
  v13 = a2 / v10 * v10;
  v14 = a3 / v11;
  v15 = a3 / v11 * v11;
  if (v15)
  {
    v16 = *(_QWORD *)(a1 + 64);
    if (v15 == 1)
    {
      v17 = 0;
      v18 = 0;
      do
      {
LABEL_9:
        *(_WORD *)(v16 + 2 * v17) = v17 / v14;
        v17 = (unsigned __int16)++v18;
      }
      while (v15 > (unsigned __int16)v18);
      goto LABEL_10;
    }
    v18 = 0;
    v17 = 0;
    if (!(_WORD)v15)
      goto LABEL_9;
    v19 = (v15 - 1) >> 16;
    if (v19)
      goto LABEL_9;
    v17 = v15 & 0xFFFFFFFFFFFFFFFELL;
    v18 = v15 & 0xFFFFFFFE;
    do
    {
      v20 = (_WORD *)(v16 + 2 * v19);
      *v20 = v19 / v14;
      v20[1] = (v19 + 1) / v14;
      v19 += 2;
    }
    while (v17 != v19);
    if (v15 != v17)
      goto LABEL_9;
  }
LABEL_10:
  if (!v13)
    goto LABEL_19;
  v21 = *(_QWORD *)(a1 + 56);
  if (v13 == 1)
  {
    v22 = 0;
    v23 = 0;
    do
    {
LABEL_18:
      *(_WORD *)(v21 + 2 * v22) = v22 / v12;
      v22 = (unsigned __int16)++v23;
    }
    while (v13 > (unsigned __int16)v23);
    goto LABEL_19;
  }
  v23 = 0;
  v22 = 0;
  if (!(_WORD)v13)
    goto LABEL_18;
  v24 = (v13 - 1) >> 16;
  if (v24)
    goto LABEL_18;
  v22 = v13 & 0xFFFFFFFFFFFFFFFELL;
  v23 = v13 & 0xFFFFFFFE;
  do
  {
    v25 = (_WORD *)(v21 + 2 * v24);
    *v25 = v24 / v12;
    v25[1] = (v24 + 1) / v12;
    v24 += 2;
  }
  while (v22 != v24);
  if (v13 != v22)
    goto LABEL_18;
LABEL_19:
  v26 = v15 - 1;
  if (v15 - 1 >= 2)
  {
    v27 = v13 - 1;
    if (v27 >= 2)
    {
      v28 = *(_QWORD *)(a1 + 64);
      v29 = *(_QWORD *)(a1 + 32);
      v30 = 2 * a4;
      v31 = a5 * (2 * a4 + 2);
      v32 = v31 + 2 * a4 + v29 + 4;
      v33 = v29 + v31;
      v34 = v29 + v31 + 4 * a4;
      v35 = 1;
      do
      {
        v36 = 0;
        v37 = v10 * *(unsigned __int16 *)(v28 + 2 * v35);
        for (i = 1; i != v27; ++i)
        {
          v39 = *(__int16 *)(v32 + v36 - 2);
          if (v39 >= 1 && v39 >= *(__int16 *)(v32 + v36 - 4) && v39 >= *(__int16 *)(v32 + v36))
          {
            v40 = (__int16 *)(v33 + v36);
            if (v39 >= *(__int16 *)(v33 + v36 + 2))
            {
              v41 = (__int16 *)(v34 + v36);
              if (v39 >= *(__int16 *)(v34 + v36 + 2) && v39 >= *v40 && v39 >= v40[2] && v39 >= *v41 && v39 >= v41[2])
              {
                v42 = *(_QWORD *)(a1 + 48);
                v43 = v37 + *(unsigned __int16 *)(*(_QWORD *)(a1 + 56) + v36 + 2);
                v44 = v42 + 6 * v43;
                if (*(unsigned __int16 *)(v44 + 4) < (unsigned __int16)v39)
                {
                  *(_WORD *)(v44 + 4) = v39;
                  *(_WORD *)(v42 + 6 * v43) = i;
                  *(_WORD *)(v44 + 2) = v35;
                }
              }
            }
          }
          v36 += 2;
        }
        ++v35;
        v32 += v30;
        v33 += v30;
        v34 += v30;
      }
      while (v35 != v26);
    }
  }
  v45 = *(_QWORD *)(a1 + 88);
  if (v45)
  {
    v46 = (_WORD *)(*(_QWORD *)(a1 + 48) + 2);
    do
    {
      *(v46 - 1) += a5;
      *v46 += a5;
      v46 += 3;
      --v45;
    }
    while (v45);
  }
}

uint64_t Corner_compare(uint64_t a1, uint64_t a2)
{
  return *(unsigned __int16 *)(a2 + 4) - *(unsigned __int16 *)(a1 + 4);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x24BDBB7C8](theArray, value);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x24BDBB808](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x24BDBB820](theArray);
}

CFIndex CFArrayGetFirstIndexOfValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x24BDBB838](theArray, range.location, range.length, value);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x24BDBB860](theArray, idx);
}

void CFArrayRemoveAllValues(CFMutableArrayRef theArray)
{
  MEMORY[0x24BDBB878](theArray);
}

void CFArrayRemoveValueAtIndex(CFMutableArrayRef theArray, CFIndex idx)
{
  MEMORY[0x24BDBB880](theArray, idx);
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x24BDBBDC0](theDict, key);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF0](allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

void CFDictionaryRemoveAllValues(CFMutableDictionaryRef theDict)
{
  MEMORY[0x24BDBBE40](theDict);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
  MEMORY[0x24BDBBE48](theDict, key);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x24BDBBE68](cf1, cf2);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

uint64_t CMBaseObjectGetDerivedStorage()
{
  return MEMORY[0x24BDC0080]();
}

uint64_t CMDerivedObjectCreate()
{
  return MEMORY[0x24BDC0180]();
}

CFTypeRef CMGetAttachment(CMAttachmentBearerRef target, CFStringRef key, CMAttachmentMode *attachmentModeOut)
{
  return (CFTypeRef)MEMORY[0x24BDC01E0](target, key, attachmentModeOut);
}

void CMPropagateAttachments(CMAttachmentBearerRef source, CMAttachmentBearerRef destination)
{
  MEMORY[0x24BDC0258](source, destination);
}

CVImageBufferRef CMSampleBufferGetImageBuffer(CMSampleBufferRef sbuf)
{
  return (CVImageBufferRef)MEMORY[0x24BDC02E8](sbuf);
}

OSStatus CMSampleBufferGetSampleTimingInfoArray(CMSampleBufferRef sbuf, CMItemCount numSampleTimingEntries, CMSampleTimingInfo *timingArrayOut, CMItemCount *timingArrayEntriesNeededOut)
{
  return MEMORY[0x24BDC0348](sbuf, numSampleTimingEntries, timingArrayOut, timingArrayEntriesNeededOut);
}

void CMSetAttachment(CMAttachmentBearerRef target, CFStringRef key, CFTypeRef value, CMAttachmentMode attachmentMode)
{
  MEMORY[0x24BDC0380](target, key, value, *(_QWORD *)&attachmentMode);
}

void CVBufferPropagateAttachments(CVBufferRef sourceBuffer, CVBufferRef destinationBuffer)
{
  MEMORY[0x24BDC5160](sourceBuffer, destinationBuffer);
}

uint64_t CVPixelBufferGetAttributes()
{
  return MEMORY[0x24BDC5270]();
}

void *__cdecl CVPixelBufferGetBaseAddressOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return (void *)MEMORY[0x24BDC5288](pixelBuffer, planeIndex);
}

size_t CVPixelBufferGetBytesPerRowOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x24BDC5298](pixelBuffer, planeIndex);
}

size_t CVPixelBufferGetHeight(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x24BDC52B0](pixelBuffer);
}

size_t CVPixelBufferGetHeightOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x24BDC52B8](pixelBuffer, planeIndex);
}

IOSurfaceRef CVPixelBufferGetIOSurface(CVPixelBufferRef pixelBuffer)
{
  return (IOSurfaceRef)MEMORY[0x24BDC52C0](pixelBuffer);
}

OSType CVPixelBufferGetPixelFormatType(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x24BDC52D0](pixelBuffer);
}

size_t CVPixelBufferGetWidth(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x24BDC52E8](pixelBuffer);
}

size_t CVPixelBufferGetWidthOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x24BDC52F0](pixelBuffer, planeIndex);
}

CVReturn CVPixelBufferLockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags lockFlags)
{
  return MEMORY[0x24BDC5308](pixelBuffer, lockFlags);
}

CVReturn CVPixelBufferPoolCreatePixelBufferWithAuxAttributes(CFAllocatorRef allocator, CVPixelBufferPoolRef pixelBufferPool, CFDictionaryRef auxAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x24BDC5330](allocator, pixelBufferPool, auxAttributes, pixelBufferOut);
}

void CVPixelBufferPoolRelease(CVPixelBufferPoolRef pixelBufferPool)
{
  MEMORY[0x24BDC5358](pixelBufferPool);
}

CVReturn CVPixelBufferUnlockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags unlockFlags)
{
  return MEMORY[0x24BDC53B0](pixelBuffer, unlockFlags);
}

uint64_t CreatePixelBuffer()
{
  return MEMORY[0x24BE119C8]();
}

uint64_t CreatePixelBufferPool()
{
  return MEMORY[0x24BE119D0]();
}

uint64_t CreateSampleBuffer()
{
  return MEMORY[0x24BE119D8]();
}

uint64_t FigCFDictionaryGetCGRectIfPresent()
{
  return MEMORY[0x24BDC06C8]();
}

uint64_t FigDebugAssert3()
{
  return MEMORY[0x24BDC07F8]();
}

uint64_t FigDispatchQueueCreateWithPriority()
{
  return MEMORY[0x24BDC0820]();
}

uint64_t FigSampleBufferProcessorGetClassID()
{
  return MEMORY[0x24BDDCE08]();
}

uint64_t FigSignalErrorAt()
{
  return MEMORY[0x24BDC09E0]();
}

void *__cdecl IOSurfaceGetBaseAddressOfPlane(IOSurfaceRef buffer, size_t planeIndex)
{
  return (void *)MEMORY[0x24BDD8BA8](buffer, planeIndex);
}

size_t IOSurfaceGetBytesPerRow(IOSurfaceRef buffer)
{
  return MEMORY[0x24BDD8BD0](buffer);
}

size_t IOSurfaceGetBytesPerRowOfPlane(IOSurfaceRef buffer, size_t planeIndex)
{
  return MEMORY[0x24BDD8BE0](buffer, planeIndex);
}

size_t IOSurfaceGetPlaneCount(IOSurfaceRef buffer)
{
  return MEMORY[0x24BDD8C88](buffer);
}

kern_return_t IOSurfaceLock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x24BDD8D08](buffer, *(_QWORD *)&options, seed);
}

kern_return_t IOSurfaceUnlock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x24BDD8DD0](buffer, *(_QWORD *)&options, seed);
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

uint64_t WritePixelBufferToFile()
{
  return MEMORY[0x24BE11A20]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

simd_float3x3 __invert_f3(simd_float3x3 a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  simd_float3x3 result;

  MEMORY[0x24BDAC820]((__n128)a1.columns[0], (__n128)a1.columns[1], (__n128)a1.columns[2]);
  result.columns[2].i64[1] = v6;
  result.columns[2].i64[0] = v5;
  result.columns[1].i64[1] = v4;
  result.columns[1].i64[0] = v3;
  result.columns[0].i64[1] = v2;
  result.columns[0].i64[0] = v1;
  return result;
}

uint64_t __isnanf()
{
  return MEMORY[0x24BDAC830]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCF8](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x24BDADF10](object);
}

float exp2f(float a1)
{
  float result;

  MEMORY[0x24BDAE280](a1);
  return result;
}

float expf(float a1)
{
  float result;

  MEMORY[0x24BDAE288](a1);
  return result;
}

uint64_t fig_log_get_emitter()
{
  return MEMORY[0x24BDC0B30]();
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x24BDAE590](__ptr, __size, __nitems, __stream);
}

void glActiveTexture(GLenum texture)
{
  MEMORY[0x24BDE2820](*(_QWORD *)&texture);
}

void glAttachShader(GLuint program, GLuint shader)
{
  MEMORY[0x24BDE2828](*(_QWORD *)&program, *(_QWORD *)&shader);
}

void glBindFramebuffer(GLenum target, GLuint framebuffer)
{
  MEMORY[0x24BDE2840](*(_QWORD *)&target, *(_QWORD *)&framebuffer);
}

void glBindTexture(GLenum target, GLuint texture)
{
  MEMORY[0x24BDE2850](*(_QWORD *)&target, *(_QWORD *)&texture);
}

GLenum glCheckFramebufferStatus(GLenum target)
{
  return MEMORY[0x24BDE2890](*(_QWORD *)&target);
}

void glCompileShader(GLuint shader)
{
  MEMORY[0x24BDE28C0](*(_QWORD *)&shader);
}

GLuint glCreateProgram(void)
{
  return MEMORY[0x24BDE28D0]();
}

GLuint glCreateShader(GLenum type)
{
  return MEMORY[0x24BDE28D8](*(_QWORD *)&type);
}

void glDeleteFramebuffers(GLsizei n, const GLuint *framebuffers)
{
  MEMORY[0x24BDE28E8](*(_QWORD *)&n, framebuffers);
}

void glDeleteProgram(GLuint program)
{
  MEMORY[0x24BDE28F0](*(_QWORD *)&program);
}

void glDeleteShader(GLuint shader)
{
  MEMORY[0x24BDE2900](*(_QWORD *)&shader);
}

void glDeleteTextures(GLsizei n, const GLuint *textures)
{
  MEMORY[0x24BDE2910](*(_QWORD *)&n, textures);
}

void glDisableVertexAttribArray(GLuint index)
{
  MEMORY[0x24BDE2940](*(_QWORD *)&index);
}

void glDrawArrays(GLenum mode, GLint first, GLsizei count)
{
  MEMORY[0x24BDE2950](*(_QWORD *)&mode, *(_QWORD *)&first, *(_QWORD *)&count);
}

void glEnableVertexAttribArray(GLuint index)
{
  MEMORY[0x24BDE2968](*(_QWORD *)&index);
}

void glFlush(void)
{
  MEMORY[0x24BDE2980]();
}

void glFramebufferTexture2D(GLenum target, GLenum attachment, GLenum textarget, GLuint texture, GLint level)
{
  MEMORY[0x24BDE2990](*(_QWORD *)&target, *(_QWORD *)&attachment, *(_QWORD *)&textarget, *(_QWORD *)&texture, *(_QWORD *)&level);
}

void glGenFramebuffers(GLsizei n, GLuint *framebuffers)
{
  MEMORY[0x24BDE29A0](*(_QWORD *)&n, framebuffers);
}

void glGenTextures(GLsizei n, GLuint *textures)
{
  MEMORY[0x24BDE29B0](*(_QWORD *)&n, textures);
}

int glGetAttribLocation(GLuint program, const GLchar *name)
{
  return MEMORY[0x24BDE29C8](*(_QWORD *)&program, name);
}

GLenum glGetError(void)
{
  return MEMORY[0x24BDE29D8]();
}

void glGetProgramiv(GLuint program, GLenum pname, GLint *params)
{
  MEMORY[0x24BDE2A00](*(_QWORD *)&program, *(_QWORD *)&pname, params);
}

void glGetShaderiv(GLuint shader, GLenum pname, GLint *params)
{
  MEMORY[0x24BDE2A18](*(_QWORD *)&shader, *(_QWORD *)&pname, params);
}

int glGetUniformLocation(GLuint program, const GLchar *name)
{
  return MEMORY[0x24BDE2A30](*(_QWORD *)&program, name);
}

void glLinkProgram(GLuint program)
{
  MEMORY[0x24BDE2A48](*(_QWORD *)&program);
}

void glShaderSource(GLuint shader, GLsizei count, const GLchar *const *string, const GLint *length)
{
  MEMORY[0x24BDE2AA0](*(_QWORD *)&shader, *(_QWORD *)&count, string, length);
}

void glTexImage2D(GLenum target, GLint level, GLint internalformat, GLsizei width, GLsizei height, GLint border, GLenum format, GLenum type, const GLvoid *pixels)
{
  MEMORY[0x24BDE2AC0](*(_QWORD *)&target, *(_QWORD *)&level, *(_QWORD *)&internalformat, *(_QWORD *)&width, *(_QWORD *)&height, *(_QWORD *)&border, *(_QWORD *)&format, *(_QWORD *)&type);
}

void glTexParameterf(GLenum target, GLenum pname, GLfloat param)
{
  MEMORY[0x24BDE2AC8](*(_QWORD *)&target, *(_QWORD *)&pname, param);
}

void glUniform1f(GLint location, GLfloat x)
{
  MEMORY[0x24BDE2AF0](*(_QWORD *)&location, x);
}

void glUniform1i(GLint location, GLint x)
{
  MEMORY[0x24BDE2B00](*(_QWORD *)&location, *(_QWORD *)&x);
}

void glUseProgram(GLuint program)
{
  MEMORY[0x24BDE2B98](*(_QWORD *)&program);
}

void glVertexAttribPointer(GLuint indx, GLint size, GLenum type, GLBOOLean normalized, GLsizei stride, const GLvoid *ptr)
{
  MEMORY[0x24BDE2BB8](*(_QWORD *)&indx, *(_QWORD *)&size, *(_QWORD *)&type, normalized, *(_QWORD *)&stride, ptr);
}

void glViewport(GLint x, GLint y, GLsizei width, GLsizei height)
{
  MEMORY[0x24BDE2BC0](*(_QWORD *)&x, *(_QWORD *)&y, *(_QWORD *)&width, *(_QWORD *)&height);
}

uint64_t kdebug_trace()
{
  return MEMORY[0x24BDAE958]();
}

float ldexpf(float a1, int a2)
{
  float result;

  MEMORY[0x24BDAEA38](*(_QWORD *)&a2, a1);
  return result;
}

uint64_t loadDefaultsWritesWithPrefix()
{
  return MEMORY[0x24BE11930]();
}

float log2f(float a1)
{
  float result;

  MEMORY[0x24BDAEAE0](a1);
  return result;
}

float logf(float a1)
{
  float result;

  MEMORY[0x24BDAEAF8](a1);
  return result;
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
  MEMORY[0x24BDAEEB0](__b, __pattern16, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x24BEDD438](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x24BEDD440](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

float powf(float a1, float a2)
{
  float result;

  MEMORY[0x24BDAF690](a1, a2);
  return result;
}

void qsort(void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
  MEMORY[0x24BDAFA18](__base, __nel, __width, __compar);
}

uint64_t sgetrf_NEWLAPACK()
{
  return MEMORY[0x24BDB2FB0]();
}

uint64_t sgetri_NEWLAPACK()
{
  return MEMORY[0x24BDB2FC0]();
}

uint64_t sposv_NEWLAPACK()
{
  return MEMORY[0x24BDB3098]();
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x24BDB0030](__str, __endptr, *(_QWORD *)&__base);
}

void syslog(int a1, const char *a2, ...)
{
  MEMORY[0x24BDB0128](*(_QWORD *)&a1, a2);
}

void vDSP_meanv(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Length __N)
{
  MEMORY[0x24BDB3248](__A, __IA, __C, __N);
}

void vDSP_vmul(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x24BDB3430](__A, __IA, __B, __IB, __C, __IC, __N);
}

void vDSP_vpythg(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, const float *__C, vDSP_Stride __IC, const float *__D, vDSP_Stride __ID, float *__E, vDSP_Stride __IE, vDSP_Length __N)
{
  MEMORY[0x24BDB3450](__A, __IA, __B, __IB, __C, __IC, __D, __ID);
}

void vDSP_vsadd(const float *__A, vDSP_Stride __IA, const float *__B, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x24BDB3498](__A, __IA, __B, __C, __IC, __N);
}

void vDSP_vsorti(const float *__C, vDSP_Length *__I, vDSP_Length *__Temporary, vDSP_Length __N, int __Order)
{
  MEMORY[0x24BDB3510](__C, __I, __Temporary, __N, *(_QWORD *)&__Order);
}

void vDSP_vsq(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x24BDB3528](__A, __IA, __C, __IC, __N);
}

vImage_Error vImageBoxConvolve_Planar8(const vImage_Buffer *src, const vImage_Buffer *dest, void *tempBuffer, vImagePixelCount srcOffsetToROI_X, vImagePixelCount srcOffsetToROI_Y, uint32_t kernel_height, uint32_t kernel_width, Pixel_8 backgroundColor, vImage_Flags flags)
{
  return MEMORY[0x24BDB3618](src, dest, tempBuffer, srcOffsetToROI_X, srcOffsetToROI_Y, *(_QWORD *)&kernel_height, *(_QWORD *)&kernel_width, backgroundColor);
}

vImage_Error vImageConvert_Planar8toPlanarF(const vImage_Buffer *src, const vImage_Buffer *dest, Pixel_F maxFloat, Pixel_F minFloat, vImage_Flags flags)
{
  return MEMORY[0x24BDB37A0](src, dest, *(_QWORD *)&flags, maxFloat, minFloat);
}

vImage_Error vImageConvolve_Planar8(const vImage_Buffer *src, const vImage_Buffer *dest, void *tempBuffer, vImagePixelCount srcOffsetToROI_X, vImagePixelCount srcOffsetToROI_Y, const int16_t *kernel, uint32_t kernel_height, uint32_t kernel_width, int32_t divisor, Pixel_8 backgroundColor, vImage_Flags flags)
{
  return MEMORY[0x24BDB3898](src, dest, tempBuffer, srcOffsetToROI_X, srcOffsetToROI_Y, kernel, *(_QWORD *)&kernel_height, *(_QWORD *)&kernel_width);
}

vImage_Error vImageMax_Planar8(const vImage_Buffer *src, const vImage_Buffer *dest, void *tempBuffer, vImagePixelCount srcOffsetToROI_X, vImagePixelCount srcOffsetToROI_Y, vImagePixelCount kernel_height, vImagePixelCount kernel_width, vImage_Flags flags)
{
  return MEMORY[0x24BDB3920](src, dest, tempBuffer, srcOffsetToROI_X, srcOffsetToROI_Y, kernel_height, kernel_width, *(_QWORD *)&flags);
}

vImage_Error vImageMin_Planar8(const vImage_Buffer *src, const vImage_Buffer *dest, void *tempBuffer, vImagePixelCount srcOffsetToROI_X, vImagePixelCount srcOffsetToROI_Y, vImagePixelCount kernel_height, vImagePixelCount kernel_width, vImage_Flags flags)
{
  return MEMORY[0x24BDB3928](src, dest, tempBuffer, srcOffsetToROI_X, srcOffsetToROI_Y, kernel_height, kernel_width, *(_QWORD *)&flags);
}

vImage_Error vImageTableLookUp_Planar8(const vImage_Buffer *src, const vImage_Buffer *dest, const Pixel_8 table[256], vImage_Flags flags)
{
  return MEMORY[0x24BDB3A90](src, dest, table, *(_QWORD *)&flags);
}

