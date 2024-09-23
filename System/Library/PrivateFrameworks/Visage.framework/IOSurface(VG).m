@implementation IOSurface(VG)

- (id)vg_basicProperties
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[7];
  _QWORD v12[8];

  v12[7] = *MEMORY[0x24BDAC8D0];
  v11[0] = *MEMORY[0x24BDD8D90];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(a1, "width"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v2;
  v11[1] = *MEMORY[0x24BDD8D58];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(a1, "height"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v3;
  v11[2] = *MEMORY[0x24BDD8D50];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(a1, "elementWidth"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v4;
  v11[3] = *MEMORY[0x24BDD8D48];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(a1, "elementHeight"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[3] = v5;
  v11[4] = *MEMORY[0x24BDD8D38];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(a1, "bytesPerElement"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[4] = v6;
  v11[5] = *MEMORY[0x24BDD8D40];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(a1, "bytesPerRow"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[5] = v7;
  v11[6] = *MEMORY[0x24BDD8D60];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend(a1, "pixelFormat"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[6] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, v11, 7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)vg_data
{
  uint64_t v2;
  size_t v3;
  uint64_t v4;
  void *v5;
  void (**v6)(_QWORD);
  id v7;
  char *v8;
  id v9;
  char *v10;
  unint64_t i;
  id v12;
  _QWORD v14[5];

  v2 = objc_msgSend(a1, "width");
  v3 = objc_msgSend(a1, "bytesPerElement") * v2;
  v4 = objc_msgSend(a1, "bytesPerRow");
  objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", objc_msgSend(a1, "height") * v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "lockWithOptions:seed:", 1, 0);
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __24__IOSurface_VG__vg_data__block_invoke;
  v14[3] = &unk_251B22CB8;
  v14[4] = a1;
  v6 = (void (**)(_QWORD))MEMORY[0x24BD03294](v14);
  v7 = objc_retainAutorelease(a1);
  v8 = (char *)objc_msgSend(v7, "baseAddress");
  v9 = objc_retainAutorelease(v5);
  v10 = (char *)objc_msgSend(v9, "mutableBytes");
  for (i = 0; i < objc_msgSend(v7, "height"); ++i)
  {
    memcpy(v10, v8, v3);
    v8 += v4;
    v10 += v3;
  }
  v12 = v9;
  v6[2](v6);

  return v12;
}

- (uint64_t)vg_hasBasicProperties:()VG
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(a1, "vg_basicProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v6);
        v10 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v6, "objectForKeyedSubscript:", v10, (_QWORD)v16);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectForKeyedSubscript:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "isEqual:", v12);

        if (!v13)
        {
          v14 = 0;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v7)
        continue;
      break;
    }
  }
  v14 = 1;
LABEL_11:

  return v14;
}

- (uint64_t)vg_vImageBuffer
{
  id v3;
  uint64_t result;

  v3 = objc_retainAutorelease(a1);
  *a2 = objc_msgSend(v3, "baseAddress");
  a2[1] = objc_msgSend(v3, "height");
  a2[2] = objc_msgSend(v3, "width");
  result = objc_msgSend(v3, "bytesPerRow");
  a2[3] = result;
  return result;
}

- (uint64_t)vg_vImageBufferOfPlaneAtIndex:()VG
{
  id v5;
  uint64_t result;

  v5 = objc_retainAutorelease(a1);
  *a3 = objc_msgSend(v5, "baseAddressOfPlaneAtIndex:", a2);
  a3[1] = objc_msgSend(v5, "heightOfPlaneAtIndex:", a2);
  a3[2] = objc_msgSend(v5, "widthOfPlaneAtIndex:", a2);
  result = objc_msgSend(v5, "bytesPerRowOfPlaneAtIndex:", a2);
  a3[3] = result;
  return result;
}

- (uint64_t)vg_vImageBufferWithCropOrigin:()VG cropSize:
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;

  v7 = objc_retainAutorelease(a1);
  v8 = objc_msgSend(v7, "baseAddress");
  v9 = v8 + objc_msgSend(v7, "bytesPerRow") * HIWORD(a2);
  *a4 = v9 + objc_msgSend(v7, "bytesPerElement") * (unsigned __int16)a2;
  a4[1] = HIWORD(a3);
  a4[2] = (unsigned __int16)a3;
  result = objc_msgSend(v7, "bytesPerRow");
  a4[3] = result;
  return result;
}

- (id)vg_copy
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "allAttachments");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("CreationProperties"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD8DE8]), "initWithProperties:", v3);
  objc_msgSend(a1, "vg_copyToSurface:", v4);

  return v4;
}

- (id)vg_emptyLike
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc(MEMORY[0x24BDD8DE8]);
  objc_msgSend(a1, "vg_basicProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithProperties:", v3);

  return v4;
}

- (void)vg_copyToSurface:()VG
{
  id v4;
  void *v5;
  id v6;
  const void *v7;
  uint64_t v8;
  uint64_t v9;
  size_t v10;
  id v11;

  v4 = a3;
  objc_msgSend(v4, "lockWithOptions:seed:", 0, 0);
  objc_msgSend(a1, "lockWithOptions:seed:", 1, 0);
  v11 = objc_retainAutorelease(v4);
  v5 = (void *)objc_msgSend(v11, "baseAddress");
  v6 = objc_retainAutorelease(a1);
  v7 = (const void *)objc_msgSend(v6, "baseAddress");
  v8 = objc_msgSend(v6, "allocationSize");
  v9 = objc_msgSend(v11, "allocationSize");
  if (v9 >= v8)
    v10 = v8;
  else
    v10 = v9;
  memcpy(v5, v7, v10);
  objc_msgSend(v6, "unlockWithOptions:seed:", 1, 0);
  objc_msgSend(v11, "unlockWithOptions:seed:", 0, 0);

}

- (void)vg_cropIntoSurface:()VG origin:
{
  id v6;
  unsigned __int16 v7;
  unsigned __int16 v8;
  uint64_t v9;
  uint64_t v10;
  size_t v11;
  unsigned int v12;

  v6 = a3;
  v7 = objc_msgSend(v6, "width");
  v8 = objc_msgSend(v6, "height");
  v9 = objc_msgSend(v6, "bytesPerElement");
  objc_msgSend(a1, "lockWithOptions:seed:", 1, 0);
  objc_msgSend(v6, "lockWithOptions:seed:", 0, 0);
  HIWORD(v12) = v8;
  LOWORD(v12) = v7;
  objc_msgSend(a1, "vg_vImageBufferWithCropOrigin:cropSize:", a4, v12);
  if (v6)
    objc_msgSend(v6, "vg_vImageBuffer");
  v10 = v8;
  if (v8)
  {
    v11 = v9 * v7;
    do
    {
      memcpy(0, 0, v11);
      --v10;
    }
    while (v10);
  }
  objc_msgSend(a1, "unlockWithOptions:seed:", 1, 0);
  objc_msgSend(v6, "unlockWithOptions:seed:", 0, 0);

}

- (void)vg_cropAndResizeYIntoSurface:()VG origin:size:
{
  id v8;
  uint64_t v9;
  void (**v10)(_QWORD);
  id v11;
  void (**v12)(_QWORD);
  size_t v13;
  vImage_Buffer v14;
  vImage_Buffer dest;
  _QWORD v16[4];
  id v17;
  _QWORD v18[5];

  v8 = a3;
  objc_msgSend(a1, "lockWithOptions:seed:", 1, 0);
  objc_msgSend(v8, "lockWithOptions:seed:", 0, 0);
  v9 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __58__IOSurface_VG__vg_cropAndResizeYIntoSurface_origin_size___block_invoke;
  v18[3] = &unk_251B22CB8;
  v18[4] = a1;
  v10 = (void (**)(_QWORD))MEMORY[0x24BD03294](v18);
  v16[0] = v9;
  v16[1] = 3221225472;
  v16[2] = __58__IOSurface_VG__vg_cropAndResizeYIntoSurface_origin_size___block_invoke_2;
  v16[3] = &unk_251B22CB8;
  v11 = v8;
  v17 = v11;
  v12 = (void (**)(_QWORD))MEMORY[0x24BD03294](v16);
  memset(&dest, 0, sizeof(dest));
  if (v11)
    objc_msgSend(v11, "vg_vImageBuffer");
  v13 = objc_msgSend(a1, "bytesPerRowOfPlaneAtIndex:", 0);
  v14.data = (void *)(objc_msgSend(objc_retainAutorelease(a1), "baseAddressOfPlaneAtIndex:", 0)
                    + v13 * HIWORD(a4)
                    + (unsigned __int16)a4);
  v14.height = HIWORD(a5);
  v14.width = (unsigned __int16)a5;
  v14.rowBytes = v13;
  vImageScale_Planar8(&v14, &dest, 0, 0);
  v12[2](v12);

  v10[2](v10);
}

- (uint64_t)debugQuickLookObject
{
  return objc_msgSend(MEMORY[0x24BDBF660], "imageWithIOSurface:", a1);
}

- (void)vg_convert420Yp8_CbCr8ToARGB8888:()VG
{
  id v4;
  const vImage_YpCbCrToARGBMatrix *v5;
  int16x8_t v6;
  __int32 v7;
  int32x2_t v8;
  int32x2_t v9;
  int8x8_t v10;
  int32_t v11;
  vImage_Buffer v12;
  vImage_Buffer srcCbCr;
  vImage_Buffer srcYp;
  vImage_YpCbCrPixelRange pixelRange;
  uint8_t permuteMap[4];
  vImage_YpCbCrToARGB outInfo;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (const vImage_YpCbCrToARGBMatrix *)*MEMORY[0x24BDB2EE0];
  if (objc_msgSend(v4, "pixelFormat") == 32)
  {
    v6.i64[0] = 0x3000200010000;
  }
  else
  {
    if (objc_msgSend(v4, "pixelFormat") != 1111970369)
      goto LABEL_6;
    v6.i64[0] = 0x100020003;
  }
  *(_DWORD *)permuteMap = vmovn_s16(v6).u32[0];
LABEL_6:
  v7 = objc_msgSend(a1, "pixelFormat");
  v8.i32[0] = 875704422;
  v9.i32[0] = v7;
  v10 = vbsl_s8((int8x8_t)vdup_lane_s32(vceq_s32(v9, v8), 0), (int8x8_t)0x1000000FFLL, (int8x8_t)0x10000000EBLL);
  pixelRange.Yp_bias = 16 * (v7 != 875704422);
  pixelRange.CbCr_bias = 128;
  pixelRange.YpRangeMax = v10.i32[0];
  if (v7 == 875704422)
    v11 = 255;
  else
    v11 = 240;
  pixelRange.CbCrRangeMax = v11;
  *(int8x8_t *)&pixelRange.YpMax = v10;
  pixelRange.CbCrMax = v11;
  pixelRange.CbCrMin = 16 * (v7 != 875704422);
  vImageConvert_YpCbCrToARGB_GenerateConversion(v5, &pixelRange, &outInfo, kvImage420Yp8_CbCr8, kvImageARGB8888, 0);
  objc_msgSend(a1, "lockWithOptions:seed:", 1, 0);
  objc_msgSend(v4, "lockWithOptions:seed:", 0, 0);
  memset(&srcYp, 0, sizeof(srcYp));
  objc_msgSend(a1, "vg_vImageBufferOfPlaneAtIndex:", 0);
  memset(&srcCbCr, 0, sizeof(srcCbCr));
  objc_msgSend(a1, "vg_vImageBufferOfPlaneAtIndex:", 1);
  memset(&v12, 0, sizeof(v12));
  if (v4)
    objc_msgSend(v4, "vg_vImageBuffer", *(_OWORD *)&v12.data, *(_OWORD *)&v12.width);
  vImageConvert_420Yp8_CbCr8ToARGB8888(&srcYp, &srcCbCr, &v12, &outInfo, permuteMap, 0xFFu, 0);
  objc_msgSend(v4, "unlockWithOptions:seed:", 0, 0);
  objc_msgSend(a1, "unlockWithOptions:seed:", 1, 0);

}

- (void)vg_convertARGB8888To420Yp8_CbCr8:()VG
{
  id v4;
  const vImage_ARGBToYpCbCrMatrix *v5;
  int16x8_t v6;
  __int32 v7;
  int32x2_t v8;
  int32x2_t v9;
  int8x8_t v10;
  int32_t v11;
  vImage_Buffer v12;
  vImage_Buffer destYp;
  vImage_Buffer src;
  vImage_YpCbCrPixelRange pixelRange;
  uint8_t permuteMap[4];
  vImage_ARGBToYpCbCr outInfo;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (const vImage_ARGBToYpCbCrMatrix *)*MEMORY[0x24BDB2EC8];
  if (objc_msgSend(a1, "pixelFormat") == 32)
  {
    v6.i64[0] = 0x3000200010000;
  }
  else
  {
    if (objc_msgSend(a1, "pixelFormat") != 1111970369)
      goto LABEL_6;
    v6.i64[0] = 0x100020003;
  }
  *(_DWORD *)permuteMap = vmovn_s16(v6).u32[0];
LABEL_6:
  v7 = objc_msgSend(v4, "pixelFormat");
  v8.i32[0] = 875704422;
  v9.i32[0] = v7;
  v10 = vbsl_s8((int8x8_t)vdup_lane_s32(vceq_s32(v9, v8), 0), (int8x8_t)0x1000000FFLL, (int8x8_t)0x10000000EBLL);
  pixelRange.Yp_bias = 16 * (v7 != 875704422);
  pixelRange.CbCr_bias = 128;
  pixelRange.YpRangeMax = v10.i32[0];
  if (v7 == 875704422)
    v11 = 255;
  else
    v11 = 240;
  pixelRange.CbCrRangeMax = v11;
  *(int8x8_t *)&pixelRange.YpMax = v10;
  pixelRange.CbCrMax = v11;
  pixelRange.CbCrMin = 16 * (v7 != 875704422);
  vImageConvert_ARGBToYpCbCr_GenerateConversion(v5, &pixelRange, &outInfo, kvImageARGB8888, kvImage420Yp8_CbCr8, 0);
  objc_msgSend(a1, "lockWithOptions:seed:", 1, 0);
  objc_msgSend(v4, "lockWithOptions:seed:", 0, 0);
  memset(&src, 0, sizeof(src));
  objc_msgSend(a1, "vg_vImageBuffer");
  memset(&destYp, 0, sizeof(destYp));
  if (v4)
  {
    objc_msgSend(v4, "vg_vImageBufferOfPlaneAtIndex:", 0);
    objc_msgSend(v4, "vg_vImageBufferOfPlaneAtIndex:", 1, 0, 0, 0, 0, destYp.data, destYp.height, destYp.width, destYp.rowBytes);
  }
  else
  {
    memset(&v12, 0, sizeof(v12));
  }
  vImageConvert_ARGB8888To420Yp8_CbCr8(&src, &destYp, &v12, &outInfo, permuteMap, 0);
  objc_msgSend(v4, "unlockWithOptions:seed:", 0, 0);
  objc_msgSend(a1, "unlockWithOptions:seed:", 1, 0);

}

- (void)vg_convert444Yp8_CbCr8FullRangeToARGB8888:()VG
{
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  int v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;
  unsigned int v16;
  unsigned int v17;
  unsigned int v18;
  float v21;
  float v22;
  float v23;
  float v29;
  float v30;
  float v32;
  unsigned int v33;
  unsigned int v34;
  int v35;
  int v36;
  unsigned int v37;
  unsigned int v38;
  void (**v39)(_QWORD);
  void (**v40)(_QWORD);
  int v41;
  int v42;
  int v43;
  unsigned int v44;
  unsigned int v45;
  unsigned int v46;
  uint64_t v47;
  id v48;
  _QWORD v49[4];
  id v50;
  _QWORD v51[6];

  v4 = a3;
  objc_msgSend(a1, "lockWithOptions:seed:", 1, 0, v4);
  v5 = MEMORY[0x24BDAC760];
  v51[0] = MEMORY[0x24BDAC760];
  v51[1] = 3221225472;
  v51[2] = __59__IOSurface_VG__vg_convert444Yp8_CbCr8FullRangeToARGB8888___block_invoke;
  v51[3] = &unk_251B22CB8;
  v51[4] = a1;
  v39 = (void (**)(_QWORD))MEMORY[0x24BD03294](v51);
  objc_msgSend(v4, "lockWithOptions:seed:", 0, 0);
  v49[0] = v5;
  v49[1] = 3221225472;
  v49[2] = __59__IOSurface_VG__vg_convert444Yp8_CbCr8FullRangeToARGB8888___block_invoke_2;
  v49[3] = &unk_251B22CB8;
  v6 = v4;
  v50 = v6;
  v40 = (void (**)(_QWORD))MEMORY[0x24BD03294](v49);
  v43 = objc_msgSend(a1, "bytesPerRowOfPlaneAtIndex:", 0);
  v42 = objc_msgSend(a1, "bytesPerRowOfPlaneAtIndex:", 1);
  v41 = objc_msgSend(v6, "bytesPerRow");
  v7 = objc_retainAutorelease(a1);
  v47 = objc_msgSend(v7, "baseAddressOfPlaneAtIndex:", 0);
  v48 = objc_retainAutorelease(v7);
  v8 = objc_msgSend(v48, "baseAddressOfPlaneAtIndex:", 1);
  v9 = objc_retainAutorelease(v6);
  v10 = objc_msgSend(v9, "baseAddress");
  v11 = 0;
  v12 = 0;
  v13 = 0;
  v14 = 0;
  while (objc_msgSend(v48, "height") > v14)
  {
    v44 = v14;
    v45 = v13;
    v15 = 0;
    v46 = v12;
    while (objc_msgSend(v48, "width") > v15)
    {
      LOBYTE(v16) = *(_BYTE *)(v47 + v11 + v15);
      LOBYTE(v17) = *(_BYTE *)(v8 + v12);
      LOBYTE(v18) = *(_BYTE *)(v8 + v12 + 1);
      _Q0 = vaddq_f32(vmlaq_n_f32(vmlaq_n_f32(vmulq_n_f32((float32x4_t)xmmword_249D3CEF0, (float)v16 * 0.0039216), (float32x4_t)xmmword_249D3CF00, (float)v17 * 0.0039216), (float32x4_t)xmmword_249D3CF10, (float)v18 * 0.0039216), (float32x4_t)xmmword_249D3CF20);
      _S1 = 1132396544;
      v21 = vmlas_n_f32(0.5, 255.0, _Q0.f32[0]);
      if (v21 <= 255.0)
        v22 = v21;
      else
        v22 = 255.0;
      if (v21 >= 0.0)
        v23 = v22;
      else
        v23 = 0.0;
      __asm { FMLA            S2, S1, V0.S[1] }
      if (_S2 <= 255.0)
        v29 = _S2;
      else
        v29 = 255.0;
      if (_S2 >= 0.0)
        v30 = v29;
      else
        v30 = 0.0;
      __asm { FMLA            S2, S1, V0.S[2] }
      if (_S2 <= 255.0)
        _Q0.f32[0] = _S2;
      else
        _Q0.f32[0] = 255.0;
      if (_S2 >= 0.0)
        v32 = _Q0.f32[0];
      else
        v32 = 0.0;
      if (objc_msgSend(v9, "pixelFormat", *(double *)_Q0.i64) == 32)
        v33 = v13 + 1;
      else
        v33 = v13 + 2;
      if (objc_msgSend(v9, "pixelFormat") == 32)
        v34 = v13 + 2;
      else
        v34 = v13 + 1;
      v35 = objc_msgSend(v9, "pixelFormat");
      v36 = objc_msgSend(v9, "pixelFormat");
      v37 = v13 + 3;
      if (v35 == 32)
        v38 = v13 + 3;
      else
        v38 = v13;
      if (v36 == 32)
        v37 = v13;
      *(_BYTE *)(v10 + v37) = -1;
      *(_BYTE *)(v10 + v33) = (int)v23;
      *(_BYTE *)(v10 + v34) = (int)v30;
      *(_BYTE *)(v10 + v38) = (int)v32;
      ++v15;
      v13 += 4;
      v12 += 2;
    }
    v14 = v44 + 1;
    v13 = v45 + v41;
    v12 = v46 + v42;
    v11 += v43;
  }
  v40[2](v40);

  v39[2](v39);
}

- (void)vg_convertARGB8888To444Yp8_CbCr8FullRange:()VG
{
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;
  unsigned int v16;
  int v17;
  int v18;
  unsigned int v19;
  unsigned int v20;
  unsigned int v21;
  unsigned int v22;
  unsigned int v23;
  unsigned int v24;
  float v27;
  float v28;
  float v29;
  float v35;
  float v36;
  void (**v38)(_QWORD);
  void (**v39)(_QWORD);
  int v40;
  int v41;
  int v42;
  int v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  _QWORD v47[4];
  id v48;
  _QWORD v49[6];

  v4 = a3;
  objc_msgSend(a1, "lockWithOptions:seed:", 1, 0, v4);
  v5 = MEMORY[0x24BDAC760];
  v49[0] = MEMORY[0x24BDAC760];
  v49[1] = 3221225472;
  v49[2] = __59__IOSurface_VG__vg_convertARGB8888To444Yp8_CbCr8FullRange___block_invoke;
  v49[3] = &unk_251B22CB8;
  v49[4] = a1;
  v38 = (void (**)(_QWORD))MEMORY[0x24BD03294](v49);
  objc_msgSend(v4, "lockWithOptions:seed:", 0, 0);
  v47[0] = v5;
  v47[1] = 3221225472;
  v47[2] = __59__IOSurface_VG__vg_convertARGB8888To444Yp8_CbCr8FullRange___block_invoke_2;
  v47[3] = &unk_251B22CB8;
  v6 = v4;
  v48 = v6;
  v39 = (void (**)(_QWORD))MEMORY[0x24BD03294](v47);
  v42 = objc_msgSend(v6, "bytesPerRowOfPlaneAtIndex:", 0);
  v41 = objc_msgSend(v6, "bytesPerRowOfPlaneAtIndex:", 1);
  v40 = objc_msgSend(a1, "bytesPerRow");
  v7 = objc_retainAutorelease(v6);
  v45 = objc_msgSend(v7, "baseAddressOfPlaneAtIndex:", 0);
  v8 = objc_retainAutorelease(v7);
  v9 = objc_msgSend(v8, "baseAddressOfPlaneAtIndex:", 1);
  v46 = objc_retainAutorelease(a1);
  v10 = objc_msgSend(v46, "baseAddress");
  v11 = 0;
  v44 = 0;
  v43 = 1;
  while (objc_msgSend(v46, "height") > HIDWORD(v44))
  {
    v12 = 0;
    v13 = v43;
    v14 = v44;
    while (objc_msgSend(v46, "width") > v12)
    {
      if (objc_msgSend(v8, "pixelFormat") == 32)
        v15 = v14 + 1;
      else
        v15 = v14 + 2;
      if (objc_msgSend(v8, "pixelFormat") == 32)
        v16 = v14 + 2;
      else
        v16 = v14 + 1;
      v17 = objc_msgSend(v8, "pixelFormat");
      v18 = objc_msgSend(v8, "pixelFormat");
      v23 = v14 + 3;
      if (v17 == 32)
        v24 = v14 + 3;
      else
        v24 = v14;
      if (v18 == 32)
        v23 = v14;
      LOBYTE(v19) = *(_BYTE *)(v10 + v23);
      LOBYTE(v20) = *(_BYTE *)(v10 + v15);
      LOBYTE(v21) = *(_BYTE *)(v10 + v16);
      LOBYTE(v22) = *(_BYTE *)(v10 + v24);
      _Q1 = vmlaq_n_f32(vmlaq_n_f32(vmlaq_n_f32(vmulq_n_f32((float32x4_t)xmmword_249D3CF30, (float)v20 * 0.0039216), (float32x4_t)xmmword_249D3CF40, (float)v21 * 0.0039216), (float32x4_t)xmmword_249D3CF50, (float)v22 * 0.0039216), (float32x4_t)xmmword_249D3CF60, (float)v19 * 0.0039216);
      _S0 = 255.0;
      v27 = vmlas_n_f32(0.5, 255.0, _Q1.f32[0]);
      if (v27 <= 255.0)
        v28 = v27;
      else
        v28 = 255.0;
      if (v27 >= 0.0)
        v29 = v28;
      else
        v29 = 0.0;
      *(_BYTE *)(v45 + v11 + v12) = (int)v29;
      __asm { FMLA            S2, S0, V1.S[1] }
      if (_S2 <= 255.0)
        v35 = _S2;
      else
        v35 = 255.0;
      if (_S2 >= 0.0)
        v36 = v35;
      else
        v36 = 0.0;
      *(_BYTE *)(v9 + v13 - 1) = (int)v36;
      __asm { FMLA            S2, S0, V1.S[2] }
      if (_S2 <= 255.0)
        _S0 = _S2;
      if (_S2 < 0.0)
        _S0 = 0.0;
      *(_BYTE *)(v9 + v13) = (int)_S0;
      ++v12;
      v13 += 2;
      v14 += 4;
    }
    v43 += v41;
    LODWORD(v44) = v44 + v40;
    ++HIDWORD(v44);
    v11 += v42;
  }
  v39[2](v39);

  v38[2](v38);
}

- (BOOL)vg_convertARGB8888ToPlanarF:()VG
{
  void (**v5)(_QWORD);
  __int128 v6;
  vImage_Error v7;
  _BOOL8 v8;
  vImage_Buffer v10;
  vImage_Buffer src;
  __int128 v12;
  __int128 v13;
  _QWORD v14[5];

  if (objc_msgSend(a1, "pixelFormat") != 32
    && objc_msgSend(a1, "pixelFormat") != 1111970369
    && objc_msgSend(a1, "pixelFormat") != 1380401729)
  {
    return 0;
  }
  objc_msgSend(a1, "lockWithOptions:seed:", 1, 0);
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __45__IOSurface_VG__vg_convertARGB8888ToPlanarF___block_invoke;
  v14[3] = &unk_251B22CB8;
  v14[4] = a1;
  v5 = (void (**)(_QWORD))MEMORY[0x24BD03294](v14);
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(a1, "vg_vImageBuffer");
  *(_OWORD *)&src.data = v12;
  src.rowBytes = *((_QWORD *)&v13 + 1);
  src.width = 4 * v13;
  v6 = a3[1];
  *(_OWORD *)&v10.data = *a3;
  v10.rowBytes = *((_QWORD *)&v6 + 1);
  v10.width = 4 * v6;
  v7 = vImageConvert_Planar8toPlanarF(&src, &v10, 255.0, 0.0, 0x100u);
  v5[2](v5);
  v8 = v7 == 0;

  return v8;
}

- (id)vg_toFloat32Surface
{
  id v2;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void (**v13)(_QWORD);
  void (**v14)(_QWORD);
  vImage_Buffer v15;
  vImage_Buffer src;
  _QWORD v17[5];
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  _QWORD v21[5];

  v21[4] = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(a1, "pixelFormat") == 1278226534
    || objc_msgSend(a1, "pixelFormat") == 1717855600)
  {
    v2 = a1;
  }
  else if (objc_msgSend(a1, "pixelFormat") == 1278226536
         || objc_msgSend(a1, "pixelFormat") == 1751410032)
  {
    v4 = objc_alloc(MEMORY[0x24BDD8DE8]);
    v20[0] = *MEMORY[0x24BDD8D90];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(a1, "width"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v5;
    v20[1] = *MEMORY[0x24BDD8D58];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(a1, "height"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *MEMORY[0x24BDD8D60];
    v21[1] = v6;
    v21[2] = &unk_251B34CB8;
    v8 = *MEMORY[0x24BDD8D38];
    v20[2] = v7;
    v20[3] = v8;
    v21[3] = &unk_251B34CD0;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, v20, 4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v4, "initWithProperties:", v9);

    objc_msgSend(v10, "lockWithOptions:seed:", 0, 0);
    objc_msgSend(a1, "lockWithOptions:seed:", 1, 0);
    v11 = MEMORY[0x24BDAC760];
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __36__IOSurface_VG__vg_toFloat32Surface__block_invoke;
    v18[3] = &unk_251B22CB8;
    v12 = v10;
    v19 = v12;
    v13 = (void (**)(_QWORD))MEMORY[0x24BD03294](v18);
    v17[0] = v11;
    v17[1] = 3221225472;
    v17[2] = __36__IOSurface_VG__vg_toFloat32Surface__block_invoke_2;
    v17[3] = &unk_251B22CB8;
    v17[4] = a1;
    v14 = (void (**)(_QWORD))MEMORY[0x24BD03294](v17);
    memset(&src, 0, sizeof(src));
    objc_msgSend(a1, "vg_vImageBuffer");
    memset(&v15, 0, sizeof(v15));
    if (v12)
      objc_msgSend(v12, "vg_vImageBuffer", *(_OWORD *)&v15.data, *(_OWORD *)&v15.width);
    if (vImageConvert_Planar16FtoPlanarF(&src, &v15, 0))
      v2 = 0;
    else
      v2 = v12;
    v14[2](v14);

    v13[2](v13);
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)vg_toFloat16Surface
{
  id v2;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void (**v13)(_QWORD);
  void (**v14)(_QWORD);
  vImage_Buffer v15;
  vImage_Buffer src;
  _QWORD v17[5];
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  _QWORD v21[5];

  v21[4] = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(a1, "pixelFormat") == 1278226536
    || objc_msgSend(a1, "pixelFormat") == 1751410032)
  {
    v2 = a1;
  }
  else if (objc_msgSend(a1, "pixelFormat") == 1278226534
         || objc_msgSend(a1, "pixelFormat") == 1717855600)
  {
    v4 = objc_alloc(MEMORY[0x24BDD8DE8]);
    v20[0] = *MEMORY[0x24BDD8D90];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(a1, "width"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v5;
    v20[1] = *MEMORY[0x24BDD8D58];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(a1, "height"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *MEMORY[0x24BDD8D60];
    v21[1] = v6;
    v21[2] = &unk_251B34CE8;
    v8 = *MEMORY[0x24BDD8D38];
    v20[2] = v7;
    v20[3] = v8;
    v21[3] = &unk_251B34D00;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, v20, 4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v4, "initWithProperties:", v9);

    objc_msgSend(v10, "lockWithOptions:seed:", 0, 0);
    objc_msgSend(a1, "lockWithOptions:seed:", 1, 0);
    v11 = MEMORY[0x24BDAC760];
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __36__IOSurface_VG__vg_toFloat16Surface__block_invoke;
    v18[3] = &unk_251B22CB8;
    v12 = v10;
    v19 = v12;
    v13 = (void (**)(_QWORD))MEMORY[0x24BD03294](v18);
    v17[0] = v11;
    v17[1] = 3221225472;
    v17[2] = __36__IOSurface_VG__vg_toFloat16Surface__block_invoke_2;
    v17[3] = &unk_251B22CB8;
    v17[4] = a1;
    v14 = (void (**)(_QWORD))MEMORY[0x24BD03294](v17);
    memset(&src, 0, sizeof(src));
    objc_msgSend(a1, "vg_vImageBuffer");
    memset(&v15, 0, sizeof(v15));
    if (v12)
      objc_msgSend(v12, "vg_vImageBuffer", *(_OWORD *)&v15.data, *(_OWORD *)&v15.width);
    if (vImageConvert_PlanarFtoPlanar16F(&src, &v15, 0))
      v2 = 0;
    else
      v2 = v12;
    v14[2](v14);

    v13[2](v13);
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (NSObject)vg_convertSurfaceStride:()VG
{
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void (**v18)(_QWORD);
  void (**v19)(_QWORD);
  id v20;
  char *v21;
  id v22;
  char *v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  size_t v27;
  _QWORD v29[5];
  _QWORD v30[4];
  id v31;
  uint8_t buf[16];
  _QWORD v33[5];
  _QWORD v34[7];

  v34[5] = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend(a1, "width");
  if (objc_msgSend(a1, "bytesPerElement") * v5 <= a3)
  {
    v8 = objc_alloc(MEMORY[0x24BDD8DE8]);
    v33[0] = *MEMORY[0x24BDD8D90];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(a1, "width"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = v9;
    v33[1] = *MEMORY[0x24BDD8D58];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(a1, "height"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v34[1] = v10;
    v33[2] = *MEMORY[0x24BDD8D60];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend(a1, "pixelFormat"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v34[2] = v11;
    v33[3] = *MEMORY[0x24BDD8D38];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(a1, "bytesPerElement"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v34[3] = v12;
    v33[4] = *MEMORY[0x24BDD8D40];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v34[4] = v13;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v34, v33, 5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v8, "initWithProperties:", v14);

    objc_msgSend(v15, "lockWithOptions:seed:", 0, 0);
    objc_msgSend(a1, "lockWithOptions:seed:", 1, 0);
    v16 = MEMORY[0x24BDAC760];
    v30[0] = MEMORY[0x24BDAC760];
    v30[1] = 3221225472;
    v30[2] = __41__IOSurface_VG__vg_convertSurfaceStride___block_invoke;
    v30[3] = &unk_251B22CB8;
    v17 = v15;
    v31 = v17;
    v18 = (void (**)(_QWORD))MEMORY[0x24BD03294](v30);
    v29[0] = v16;
    v29[1] = 3221225472;
    v29[2] = __41__IOSurface_VG__vg_convertSurfaceStride___block_invoke_2;
    v29[3] = &unk_251B22CB8;
    v29[4] = a1;
    v19 = (void (**)(_QWORD))MEMORY[0x24BD03294](v29);
    v20 = objc_retainAutorelease(a1);
    v21 = (char *)objc_msgSend(v20, "baseAddress");
    v22 = objc_retainAutorelease(v17);
    v23 = (char *)objc_msgSend(v22, "baseAddress");
    v24 = objc_msgSend(v20, "bytesPerRow");
    v25 = v24;
    v26 = 0;
    if (v24 >= a3)
      v27 = a3;
    else
      v27 = v24;
    while (v26 < objc_msgSend(v20, "height"))
    {
      memcpy(v23, v21, v27);
      ++v26;
      v23 += a3;
      v21 += v25;
    }
    v6 = v22;
    v19[2](v19);

    v18[2](v18);
    v7 = v6;
  }
  else
  {
    __VGLogSharedInstance();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_249CAD000, v6, OS_LOG_TYPE_ERROR, " Invalid stride size. ", buf, 2u);
    }
    v7 = 0;
  }

  return v7;
}

- (IOSurface)vg_multiplyAlphaFromSurface:()VG
{
  IOSurface *v4;
  IOSurface *v5;
  uint64_t i;
  uint64_t j;
  unsigned int v8;
  char *v9;
  char *v10;
  unsigned int v11;
  float v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;
  id v17[5];
  id v18[5];
  id v19[5];

  v4 = a3;
  -[IOSurface vg_emptyLike](a1, "vg_emptyLike");
  v5 = (IOSurface *)objc_claimAutoreleasedReturnValue();
  vg::IOSurfaceData::IOSurfaceData((vg::IOSurfaceData *)v19, v4, 1);
  vg::IOSurfaceData::IOSurfaceData((vg::IOSurfaceData *)v18, a1, 1);
  vg::IOSurfaceData::IOSurfaceData((vg::IOSurfaceData *)v17, v5, 0);
  for (i = 0; i < -[IOSurface height](a1, "height"); ++i)
  {
    for (j = 0; j < -[IOSurface width](a1, "width"); ++j)
    {
      v9 = (char *)v18[2] + (uint64_t)v18[3] * i + (uint64_t)v18[4] * j;
      v10 = (char *)v17[2] + (uint64_t)v17[3] * i + (uint64_t)v17[4] * j;
      LOBYTE(v8) = *((_BYTE *)v19[2] + (uint64_t)v19[3] * i + (uint64_t)v19[4] * j);
      v11 = 1132396544;
      v12 = (float)v8 / 255.0;
      if (v12 > 1.0)
        v12 = 1.0;
      LOBYTE(v11) = *v9;
      *(float *)&v13 = v12 * (float)v11;
      *v10 = (int)*(float *)&v13;
      LOBYTE(v13) = v9[1];
      *(float *)&v14 = v12 * (float)v13;
      v10[1] = (int)*(float *)&v14;
      LOBYTE(v14) = v9[2];
      *(float *)&v15 = v12 * (float)v14;
      v10[2] = (int)*(float *)&v15;
      LOBYTE(v15) = v9[3];
      v10[3] = (int)(float)(v12 * (float)v15);
    }
  }
  vg::IOSurfaceData::~IOSurfaceData(v17);
  vg::IOSurfaceData::~IOSurfaceData(v18);
  vg::IOSurfaceData::~IOSurfaceData(v19);

  return v5;
}

- (IOSurface)vg_copyAlphaFromSurface:()VG
{
  IOSurface *v4;
  IOSurface *v5;
  uint64_t i;
  uint64_t j;
  unsigned int v8;
  char *v9;
  char *v10;
  unsigned int v11;
  float v12;
  id v14[5];
  id v15[5];
  id v16[5];

  v4 = a3;
  -[IOSurface vg_emptyLike](a1, "vg_emptyLike");
  v5 = (IOSurface *)objc_claimAutoreleasedReturnValue();
  vg::IOSurfaceData::IOSurfaceData((vg::IOSurfaceData *)v16, v4, 1);
  vg::IOSurfaceData::IOSurfaceData((vg::IOSurfaceData *)v15, a1, 1);
  vg::IOSurfaceData::IOSurfaceData((vg::IOSurfaceData *)v14, v5, 0);
  for (i = 0; i < -[IOSurface height](a1, "height"); ++i)
  {
    for (j = 0; j < -[IOSurface width](a1, "width"); ++j)
    {
      v9 = (char *)v15[2] + (uint64_t)v15[3] * i + (uint64_t)v15[4] * j;
      v10 = (char *)v14[2] + (uint64_t)v14[3] * i + (uint64_t)v14[4] * j;
      LOBYTE(v8) = *((_BYTE *)v16[2] + (uint64_t)v16[3] * i + (uint64_t)v16[4] * j);
      v11 = 1132396544;
      v12 = (float)v8 / 255.0;
      if (v12 > 1.0)
        v12 = 1.0;
      LOBYTE(v11) = *v9;
      *v10 = (int)(float)(v12 * (float)v11);
      v10[1] = v9[1];
      v10[2] = v9[2];
      v10[3] = v9[3];
    }
  }
  vg::IOSurfaceData::~IOSurfaceData(v14);
  vg::IOSurfaceData::~IOSurfaceData(v15);
  vg::IOSurfaceData::~IOSurfaceData(v16);

  return v5;
}

- (id)vg_stack420Yp8_CbCr8ToL008
{
  uint64_t v2;
  void (**v3)(_QWORD);
  unsigned __int16 height;
  unsigned __int16 v5;
  unsigned __int16 v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void (**v15)(_QWORD);
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _BYTE *v21;
  char *v22;
  char v23;
  id v24;
  __int16 width;
  unsigned int v27;
  unsigned int v28;
  unsigned int v29;
  unsigned int v30;
  __int128 v31;
  vImage_Buffer dest;
  _QWORD v33[4];
  id v34;
  __int128 v35;
  __int128 v36;
  vImage_Buffer src;
  _QWORD v38[5];
  _QWORD v39[4];
  _QWORD v40[6];

  v40[4] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "lockWithOptions:seed:", 1, 0);
  v2 = MEMORY[0x24BDAC760];
  v38[0] = MEMORY[0x24BDAC760];
  v38[1] = 3221225472;
  v38[2] = __43__IOSurface_VG__vg_stack420Yp8_CbCr8ToL008__block_invoke;
  v38[3] = &unk_251B22CB8;
  v38[4] = a1;
  v3 = (void (**)(_QWORD))MEMORY[0x24BD03294](v38);
  memset(&src, 0, sizeof(src));
  objc_msgSend(a1, "vg_vImageBufferOfPlaneAtIndex:", 0);
  v35 = 0u;
  v36 = 0u;
  objc_msgSend(a1, "vg_vImageBufferOfPlaneAtIndex:", 1);
  height = src.height;
  width = src.width;
  v6 = WORD4(v35);
  v5 = v36;
  v7 = objc_alloc(MEMORY[0x24BDD8DE8]);
  v39[0] = *MEMORY[0x24BDD8D90];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 2 * v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = v8;
  v39[1] = *MEMORY[0x24BDD8D58];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v6 + height);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *MEMORY[0x24BDD8D60];
  v40[1] = v9;
  v40[2] = &unk_251B34D18;
  v11 = *MEMORY[0x24BDD8D38];
  v39[2] = v10;
  v39[3] = v11;
  v40[3] = &unk_251B34D30;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v40, v39, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v7, "initWithProperties:", v12);

  objc_msgSend(v13, "lockWithOptions:seed:", 0, 0);
  v33[0] = v2;
  v33[1] = 3221225472;
  v33[2] = __43__IOSurface_VG__vg_stack420Yp8_CbCr8ToL008__block_invoke_13;
  v33[3] = &unk_251B22CB8;
  v14 = v13;
  v34 = v14;
  v15 = (void (**)(_QWORD))MEMORY[0x24BD03294](v33);
  memset(&dest, 0, sizeof(dest));
  if (v14)
  {
    HIWORD(v30) = height;
    LOWORD(v30) = width;
    objc_msgSend(v14, "vg_vImageBufferWithCropOrigin:cropSize:", 0, v30);
  }
  vImageCopyBuffer(&src, &dest, 1uLL, 0);
  if (v14)
  {
    HIWORD(v29) = height;
    LOWORD(v29) = 0;
    HIWORD(v28) = v6;
    LOWORD(v28) = v5;
    objc_msgSend(v14, "vg_vImageBufferWithCropOrigin:cropSize:", v29, v28);
    v31 = 0u;
    LOWORD(v27) = v5;
    HIWORD(v27) = height;
    objc_msgSend(v14, "vg_vImageBufferWithCropOrigin:cropSize:", v27, v28);
  }
  else
  {
    *((_QWORD *)&v31 + 1) = 0;
  }
  v16 = *((_QWORD *)&v35 + 1);
  if (*((_QWORD *)&v35 + 1))
  {
    v17 = 0;
    v18 = 0;
    v19 = v35;
    v20 = v36;
    do
    {
      if (v20)
      {
        v21 = 0;
        v22 = (char *)(v19 + 1);
        do
        {
          *v21 = *(v22 - 1);
          v23 = *v22;
          v22 += 2;
          (v21++)[v18] = v23;
          v20 = v36;
        }
        while ((unint64_t)v21 < (unint64_t)v36);
        v16 = *((_QWORD *)&v35 + 1);
      }
      v19 += *((_QWORD *)&v36 + 1);
      v18 += *((_QWORD *)&v31 + 1);
      ++v17;
    }
    while (v17 < v16);
  }
  v24 = v14;
  v15[2](v15);

  v3[2](v3);
  return v24;
}

- (void)vg_unstackL008To420Yp8_CbCr8:()VG
{
  id v4;
  uint64_t v5;
  void (**v6)(_QWORD);
  id v7;
  void (**v8)(_QWORD);
  __int128 v9;
  int32x2_t v10;
  int32x2_t v11;
  __int128 v12;
  __int16 v13;
  unsigned int v14;
  unsigned int v15;
  unsigned int v16;
  vImage_Buffer src;
  __int128 v18;
  __int128 v19;
  vImage_Buffer dest;
  _QWORD v21[4];
  id v22;
  _QWORD v23[5];

  v4 = a3;
  objc_msgSend(a1, "lockWithOptions:seed:", 1, 0);
  objc_msgSend(v4, "lockWithOptions:seed:", 0, 0);
  v5 = MEMORY[0x24BDAC760];
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __46__IOSurface_VG__vg_unstackL008To420Yp8_CbCr8___block_invoke;
  v23[3] = &unk_251B22CB8;
  v23[4] = a1;
  v6 = (void (**)(_QWORD))MEMORY[0x24BD03294](v23);
  v21[0] = v5;
  v21[1] = 3221225472;
  v21[2] = __46__IOSurface_VG__vg_unstackL008To420Yp8_CbCr8___block_invoke_2;
  v21[3] = &unk_251B22CB8;
  v7 = v4;
  v22 = v7;
  v8 = (void (**)(_QWORD))MEMORY[0x24BD03294](v21);
  v9 = 0uLL;
  memset(&dest, 0, sizeof(dest));
  if (v7)
  {
    objc_msgSend(v7, "vg_vImageBufferOfPlaneAtIndex:", 0);
    v18 = 0u;
    v19 = 0u;
    objc_msgSend(v7, "vg_vImageBufferOfPlaneAtIndex:", 1);
    *((_QWORD *)&v9 + 1) = dest.width;
    *(int32x2_t *)&v9 = vmovn_s64(*(int64x2_t *)&dest.height);
  }
  else
  {
    v18 = 0uLL;
    v19 = 0uLL;
  }
  v12 = v9;
  v10 = vrev64_s32(*(int32x2_t *)&v9);
  HIWORD(v16) = v10.i16[2];
  LOWORD(v16) = v10.i16[0];
  memset(&src, 0, sizeof(src));
  objc_msgSend(a1, "vg_vImageBufferWithCropOrigin:cropSize:", 0, v16, (_QWORD)v12);
  vImageCopyBuffer(&src, &dest, 1uLL, 0);
  LOWORD(v15) = 0;
  v11 = vzip1_s32(0, *(int32x2_t *)&v12);
  HIWORD(v15) = v11.i16[2];
  objc_msgSend(a1, "vg_vImageBufferWithCropOrigin:cropSize:", v15, 0, *(_QWORD *)&v11, *((_QWORD *)&v12 + 1));
  LOWORD(v14) = 0;
  HIWORD(v14) = v13;
  objc_msgSend(a1, "vg_vImageBufferWithCropOrigin:cropSize:", v14, 0);
  v8[2](v8);

  v6[2](v6);
}

- (id)vg_stack444Yp8_CbCr8ToL008
{
  uint64_t v2;
  void (**v3)(_QWORD);
  unsigned __int16 width;
  unsigned __int16 height;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void (**v15)(_QWORD);
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _BYTE *v21;
  char *v22;
  char v23;
  id v24;
  uint64_t v26;
  unsigned int v27;
  unsigned int v28;
  unsigned int v29;
  unsigned int v30;
  __int128 v31;
  vImage_Buffer dest;
  _QWORD v33[4];
  id v34;
  __int128 v35;
  __int128 v36;
  vImage_Buffer src;
  _QWORD v38[5];
  _QWORD v39[4];
  _QWORD v40[5];

  v40[4] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "lockWithOptions:seed:", 1, 0);
  v2 = MEMORY[0x24BDAC760];
  v38[0] = MEMORY[0x24BDAC760];
  v38[1] = 3221225472;
  v38[2] = __43__IOSurface_VG__vg_stack444Yp8_CbCr8ToL008__block_invoke;
  v38[3] = &unk_251B22CB8;
  v38[4] = a1;
  v3 = (void (**)(_QWORD))MEMORY[0x24BD03294](v38);
  memset(&src, 0, sizeof(src));
  objc_msgSend(a1, "vg_vImageBufferOfPlaneAtIndex:", 0);
  v35 = 0u;
  v36 = 0u;
  objc_msgSend(a1, "vg_vImageBufferOfPlaneAtIndex:", 1);
  width = src.width;
  height = src.height;
  LOWORD(v6) = v36;
  WORD2(v6) = WORD4(v35);
  v26 = v6;
  v7 = objc_alloc(MEMORY[0x24BDD8DE8]);
  v39[0] = *MEMORY[0x24BDD8D90];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", width);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = v8;
  v39[1] = *MEMORY[0x24BDD8D58];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 3 * height);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *MEMORY[0x24BDD8D60];
  v40[1] = v9;
  v40[2] = &unk_251B34D18;
  v11 = *MEMORY[0x24BDD8D38];
  v39[2] = v10;
  v39[3] = v11;
  v40[3] = &unk_251B34D30;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v40, v39, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v7, "initWithProperties:", v12);

  objc_msgSend(v13, "lockWithOptions:seed:", 0, 0);
  v33[0] = v2;
  v33[1] = 3221225472;
  v33[2] = __43__IOSurface_VG__vg_stack444Yp8_CbCr8ToL008__block_invoke_2;
  v33[3] = &unk_251B22CB8;
  v14 = v13;
  v34 = v14;
  v15 = (void (**)(_QWORD))MEMORY[0x24BD03294](v33);
  memset(&dest, 0, sizeof(dest));
  if (v14)
  {
    HIWORD(v30) = height;
    LOWORD(v30) = width;
    objc_msgSend(v14, "vg_vImageBufferWithCropOrigin:cropSize:", 0, v30);
  }
  vImageCopyBuffer(&src, &dest, 1uLL, 0);
  if (v14)
  {
    HIWORD(v29) = height;
    LOWORD(v29) = 0;
    HIWORD(v28) = WORD2(v26);
    LOWORD(v28) = v26;
    objc_msgSend(v14, "vg_vImageBufferWithCropOrigin:cropSize:", v29, v28);
    v31 = 0u;
    HIWORD(v27) = 2 * height;
    LOWORD(v27) = 0;
    objc_msgSend(v14, "vg_vImageBufferWithCropOrigin:cropSize:", v27, v28);
  }
  else
  {
    *((_QWORD *)&v31 + 1) = 0;
  }
  v16 = *((_QWORD *)&v35 + 1);
  if (*((_QWORD *)&v35 + 1))
  {
    v17 = 0;
    v18 = 0;
    v19 = v35;
    v20 = v36;
    do
    {
      if (v20)
      {
        v21 = 0;
        v22 = (char *)(v19 + 1);
        do
        {
          *v21 = *(v22 - 1);
          v23 = *v22;
          v22 += 2;
          (v21++)[v18] = v23;
          v20 = v36;
        }
        while ((unint64_t)v21 < (unint64_t)v36);
        v16 = *((_QWORD *)&v35 + 1);
      }
      v19 += *((_QWORD *)&v36 + 1);
      v18 += *((_QWORD *)&v31 + 1);
      ++v17;
    }
    while (v17 < v16);
  }
  v24 = v14;
  v15[2](v15);

  v3[2](v3);
  return v24;
}

- (void)vg_unstackL008To444Yp8_CbCr8:()VG
{
  id v4;
  uint64_t v5;
  void (**v6)(_QWORD);
  id v7;
  void (**v8)(_QWORD);
  __int128 v9;
  int32x2_t v10;
  int32x2_t v11;
  __int16 v12;
  int32x2_t v13;
  uint64_t v14;
  unsigned int v15;
  unsigned int v16;
  vImage_Buffer src;
  __int128 v18;
  __int128 v19;
  vImage_Buffer dest;
  _QWORD v21[4];
  id v22;
  _QWORD v23[5];

  v4 = a3;
  objc_msgSend(a1, "lockWithOptions:seed:", 1, 0);
  objc_msgSend(v4, "lockWithOptions:seed:", 0, 0);
  v5 = MEMORY[0x24BDAC760];
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __46__IOSurface_VG__vg_unstackL008To444Yp8_CbCr8___block_invoke;
  v23[3] = &unk_251B22CB8;
  v23[4] = a1;
  v6 = (void (**)(_QWORD))MEMORY[0x24BD03294](v23);
  v21[0] = v5;
  v21[1] = 3221225472;
  v21[2] = __46__IOSurface_VG__vg_unstackL008To444Yp8_CbCr8___block_invoke_2;
  v21[3] = &unk_251B22CB8;
  v7 = v4;
  v22 = v7;
  v8 = (void (**)(_QWORD))MEMORY[0x24BD03294](v21);
  v9 = 0uLL;
  memset(&dest, 0, sizeof(dest));
  if (v7)
  {
    objc_msgSend(v7, "vg_vImageBufferOfPlaneAtIndex:", 0);
    v18 = 0u;
    v19 = 0u;
    objc_msgSend(v7, "vg_vImageBufferOfPlaneAtIndex:", 1);
    *(int32x2_t *)&v9 = vmovn_s64(*(int64x2_t *)&dest.height);
  }
  else
  {
    v18 = 0uLL;
    v19 = 0uLL;
  }
  v13 = (int32x2_t)v9;
  v10 = vrev64_s32(*(int32x2_t *)&v9);
  HIWORD(v16) = v10.i16[2];
  LOWORD(v16) = v10.i16[0];
  memset(&src, 0, sizeof(src));
  objc_msgSend(a1, "vg_vImageBufferWithCropOrigin:cropSize:", 0, v16);
  vImageCopyBuffer(&src, &dest, 1uLL, 0);
  LOWORD(v15) = 0;
  v11 = vzip1_s32(0, v13);
  v12 = v11.i16[0];
  HIWORD(v15) = v11.i16[2];
  HIWORD(v14) = 0;
  objc_msgSend(a1, "vg_vImageBufferWithCropOrigin:cropSize:", v15, 0);
  LOWORD(v14) = v12;
  *(_DWORD *)((char *)&v14 + 2) = (unsigned __int16)(2 * v13.i16[0]);
  objc_msgSend(a1, "vg_vImageBufferWithCropOrigin:cropSize:", v14, HIDWORD(v14));
  v8[2](v8);

  v6[2](v6);
}

- (void)vg_fillWithData:()VG
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (**v8)(_QWORD);
  id v9;
  char *v10;
  id v11;
  char *v12;
  unint64_t v13;
  size_t v14;
  _QWORD v15[5];

  v4 = a3;
  v5 = objc_msgSend(a1, "width");
  v6 = objc_msgSend(a1, "bytesPerElement");
  v7 = objc_msgSend(a1, "bytesPerRow");
  objc_msgSend(a1, "lockWithOptions:seed:", 0, 0);
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __33__IOSurface_VG__vg_fillWithData___block_invoke;
  v15[3] = &unk_251B22CB8;
  v15[4] = a1;
  v8 = (void (**)(_QWORD))MEMORY[0x24BD03294](v15);
  v9 = objc_retainAutorelease(v4);
  v10 = (char *)objc_msgSend(v9, "bytes");
  v11 = objc_retainAutorelease(a1);
  v12 = (char *)objc_msgSend(v11, "baseAddress");
  v13 = 0;
  v14 = v6 * v5;
  while (v13 < objc_msgSend(v11, "height"))
  {
    memcpy(v12, v10, v14);
    ++v13;
    v10 += v14;
    v12 += v7;
  }
  v8[2](v8);

}

+ (id)vg_surfaceWithPNGData:()VG
{
  id v3;
  void *v4;
  void *v5;
  CGImageSourceRef v6;
  CGImageSource *v7;
  CGImageRef ImageAtIndex;
  CGImage *v9;
  CGDataProvider *DataProvider;
  CFDataRef v11;
  const __CFData *v12;
  CFDictionaryRef v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  CGColorSpace *ColorSpace;
  CGColorSpaceModel Model;
  size_t BitsPerPixel;
  size_t v27;
  uint64_t v28;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  uint64_t v36;
  id v37;
  void (**v38)(_QWORD);
  int16x8_t v39;
  id v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v57;
  const __CFData *theData;
  const __CFData *data;
  uint8_t permuteMap[4];
  vImage_Buffer dest;
  _QWORD v62[4];
  id v63;
  vImage_Buffer src;
  id v65;
  _QWORD v66[4];
  _QWORD v67[4];
  _QWORD v68[4];
  _QWORD v69[4];
  uint64_t v70;
  _QWORD v71[4];

  v71[1] = *MEMORY[0x24BDAC8D0];
  data = a3;
  v3 = objc_alloc(MEMORY[0x24BDBCED8]);
  v70 = *MEMORY[0x24BDD97D0];
  v71[0] = MEMORY[0x24BDBD1C0];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v71, &v70, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithDictionary:", v4);

  objc_msgSend(v5, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("kCGImageSourceCreateUnpremultipliedPNG"));
  v6 = CGImageSourceCreateWithData(data, (CFDictionaryRef)v5);
  v7 = (CGImageSource *)CFAutorelease(v6);
  ImageAtIndex = CGImageSourceCreateImageAtIndex(v7, 0, (CFDictionaryRef)v5);
  v9 = (CGImage *)CFAutorelease(ImageAtIndex);
  DataProvider = CGImageGetDataProvider(v9);
  v11 = CGDataProviderCopyData(DataProvider);
  v12 = (const __CFData *)CFAutorelease(v11);
  v13 = CGImageSourceCopyPropertiesAtIndex(v7, 0, 0);
  CFAutorelease(v13);
  theData = v12;
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "objectForKeyedSubscript:", *MEMORY[0x24BDD9470]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x24BDD94E8]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
    goto LABEL_3;
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64EncodedString:options:", v15, 0);
  v17 = (void *)MEMORY[0x24BDBCF20];
  v18 = objc_opt_class();
  v19 = objc_opt_class();
  v20 = objc_opt_class();
  objc_msgSend(v17, "setWithObjects:", v18, v19, v20, objc_opt_class(), 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = 0;
  objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClasses:fromData:error:", v21, v16, &v65);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v65;

  if (!v22)
  {
LABEL_3:
    ColorSpace = CGImageGetColorSpace(v9);
    Model = CGColorSpaceGetModel(ColorSpace);
    BitsPerPixel = CGImageGetBitsPerPixel(v9);
    v27 = BitsPerPixel;
    v28 = 1278226488;
    if (Model || BitsPerPixel != 8)
    {
      if (Model || BitsPerPixel != 16)
      {
        if (BitsPerPixel == 32 && Model == kCGColorSpaceModelRGB)
          v28 = 1380401729;
        else
          v28 = 0;
      }
      else
      {
        v28 = 1278226742;
      }
    }
    v68[0] = *MEMORY[0x24BDD8D90];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", CGImageGetWidth(v9));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v69[0] = v30;
    v68[1] = *MEMORY[0x24BDD8D58];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", CGImageGetHeight(v9));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v69[1] = v31;
    v68[2] = *MEMORY[0x24BDD8D60];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v28);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v69[2] = v32;
    v68[3] = *MEMORY[0x24BDD8D38];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v27 >> 3);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v69[3] = v33;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v69, v68, 4);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD8DE8]), "initWithProperties:", v22);
  v35 = objc_msgSend(v34, "pixelFormat");
  switch(v35)
  {
    case 32:
LABEL_18:
      src.data = (void *)CFDataGetBytePtr(theData);
      src.height = objc_msgSend(v34, "height");
      src.width = objc_msgSend(v34, "width");
      v36 = objc_msgSend(v34, "width");
      src.rowBytes = objc_msgSend(v34, "bytesPerElement") * v36;
      objc_msgSend(v34, "lockWithOptions:seed:", 0, 0);
      v62[0] = MEMORY[0x24BDAC760];
      v62[1] = 3221225472;
      v62[2] = __39__IOSurface_VG__vg_surfaceWithPNGData___block_invoke;
      v62[3] = &unk_251B22CB8;
      v37 = v34;
      v63 = v37;
      v38 = (void (**)(_QWORD))MEMORY[0x24BD03294](v62);
      memset(&dest, 0, sizeof(dest));
      if (v37)
        objc_msgSend(v37, "vg_vImageBuffer");
      if (objc_msgSend(v37, "pixelFormat") == 32)
      {
        v39.i64[0] = 0x2000100000003;
      }
      else
      {
        if (objc_msgSend(v37, "pixelFormat") != 1111970369)
        {
LABEL_28:
          vImagePermuteChannels_ARGB8888(&src, &dest, permuteMap, 0x10u);
          v38[2](v38);

          break;
        }
        v39.i64[0] = 0x3000000010002;
      }
      *(_DWORD *)permuteMap = vmovn_s16(v39).u32[0];
      goto LABEL_28;
    case 875704422:
      v40 = objc_alloc(MEMORY[0x24BDD8DE8]);
      v66[0] = *MEMORY[0x24BDD8D90];
      v41 = (void *)MEMORY[0x24BDD16E0];
      if ((objc_msgSend(v34, "width") & 1) != 0)
      {
        v43 = objc_msgSend(v34, "width");
        v44 = objc_msgSend(v34, "width");
        v45 = v44 & 1;
        if (v44 < 0)
          v45 = -v45;
        v42 = v43 - v45 + 2;
      }
      else
      {
        v42 = objc_msgSend(v34, "width");
      }
      objc_msgSend(v41, "numberWithInteger:", v42);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v67[0] = v46;
      v66[1] = *MEMORY[0x24BDD8D58];
      v47 = (void *)MEMORY[0x24BDD16E0];
      v48 = objc_msgSend(v34, "height");
      v49 = objc_msgSend(v34, "height");
      v50 = v49 + 2;
      if (v49 >= -1)
        v50 = v49 + 1;
      objc_msgSend(v47, "numberWithInteger:", v48 + (v50 >> 1));
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = *MEMORY[0x24BDD8D60];
      v67[1] = v51;
      v67[2] = &unk_251B34D18;
      v53 = *MEMORY[0x24BDD8D38];
      v66[2] = v52;
      v66[3] = v53;
      v67[3] = &unk_251B34D30;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v67, v66, 4);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = (void *)objc_msgSend(v40, "initWithProperties:", v54);

      objc_msgSend(v55, "vg_fillWithData:", theData);
      objc_msgSend(v55, "vg_unstackL008To420Yp8_CbCr8:", v34);

      break;
    case 1111970369:
      goto LABEL_18;
    default:
      objc_msgSend(v34, "vg_fillWithData:", theData);
      break;
  }

  return v34;
}

- (BOOL)vg_scaleToSurface:()VG temporaryBuffer:
{
  return objc_msgSend(a1, "_scaleToSurface:temporaryBuffer:flags:", a3, a4, 0) == 0;
}

- (uint64_t)vg_bufferSizeForScalingToSurface:()VG
{
  return objc_msgSend(a1, "_scaleToSurface:temporaryBuffer:flags:", a3, 0, 128);
}

- (uint64_t)_scaleToSurface:()VG temporaryBuffer:flags:
{
  IOSurface *v8;
  int v9;
  uint64_t v10;
  int v11;
  vImage_Error v12;
  vImage_Buffer v14;
  vImage_Buffer src;
  id v16[5];
  id v17[5];

  v8 = a3;
  vg::IOSurfaceData::IOSurfaceData((vg::IOSurfaceData *)v17, a1, 1);
  vg::IOSurfaceData::IOSurfaceData((vg::IOSurfaceData *)v16, v8, 0);
  memset(&src, 0, sizeof(src));
  -[IOSurface vg_vImageBuffer](a1, "vg_vImageBuffer");
  memset(&v14, 0, sizeof(v14));
  if (v8)
    -[IOSurface vg_vImageBuffer](v8, "vg_vImageBuffer", *(_OWORD *)&v14.data, *(_OWORD *)&v14.width);
  v9 = -[IOSurface pixelFormat](a1, "pixelFormat", *(_OWORD *)&v14.data, *(_OWORD *)&v14.width);
  v10 = -21778;
  if (v9 > 1278226533)
  {
    if (v9 <= 1380401728)
    {
      if (v9 != 1278226534)
      {
        v11 = 1278226536;
LABEL_14:
        if (v9 == v11)
        {
          v12 = vImageScale_Planar16F(&src, &v14, a4, a5);
LABEL_21:
          v10 = v12;
          goto LABEL_22;
        }
        goto LABEL_22;
      }
LABEL_20:
      v12 = vImageScale_PlanarF(&src, &v14, a4, a5);
      goto LABEL_21;
    }
    if (v9 != 1380401729)
    {
      if (v9 != 1717855600)
      {
        v11 = 1751410032;
        goto LABEL_14;
      }
      goto LABEL_20;
    }
LABEL_19:
    v12 = vImageScale_ARGB8888(&src, &v14, a4, a5);
    goto LABEL_21;
  }
  if (v9 <= 1111970368)
  {
    if (v9 != 32 && v9 != 1094862674)
      goto LABEL_22;
    goto LABEL_19;
  }
  if (v9 == 1111970369)
    goto LABEL_19;
  if (v9 == 1278226488)
  {
    v12 = vImageScale_Planar8(&src, &v14, a4, a5);
    goto LABEL_21;
  }
LABEL_22:
  vg::IOSurfaceData::~IOSurfaceData(v16);
  vg::IOSurfaceData::~IOSurfaceData(v17);

  return v10;
}

@end
