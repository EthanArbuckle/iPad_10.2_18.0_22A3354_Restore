@implementation VGCaptureData

+ (__CVBuffer)_createColorFromYCbCr:(__CVBuffer *)a3
{
  NSObject *v4;
  uint64_t v5;
  void (**v6)(_QWORD);
  void *BaseAddressOfPlane;
  vImagePixelCount WidthOfPlane;
  void *v9;
  vImagePixelCount v10;
  void (**v11)(_QWORD);
  OSType PixelFormatType;
  int32x2_t v13;
  int32x2_t v14;
  int8x8_t v15;
  int32_t v16;
  __CVBuffer *v17;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  NSObject *v29;
  CVPixelBufferRef v30;
  uint8_t permuteMap[4];
  vImage_YpCbCrPixelRange pixelRange;
  _QWORD v33[4];
  vImage_Buffer v34;
  vImage_Buffer dest;
  vImage_Buffer srcCbCr;
  vImage_Buffer srcYp;
  _QWORD v38[5];
  _QWORD v39[5];
  _QWORD v40[5];
  vImage_YpCbCrToARGB buf;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  VGLogVGCaptureData();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v4))
  {
    *(_WORD *)buf.opaque = 0;
    _os_signpost_emit_with_name_impl(&dword_249CAD000, v4, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "CreateColorFromYCbCr", (const char *)&unk_249D51699, buf.opaque, 2u);
  }

  CVPixelBufferLockBaseAddress(a3, 1uLL);
  v5 = MEMORY[0x24BDAC760];
  v38[0] = MEMORY[0x24BDAC760];
  v38[1] = 3221225472;
  v38[2] = __39__VGCaptureData__createColorFromYCbCr___block_invoke_2;
  v38[3] = &__block_descriptor_40_e5_v8__0l;
  v38[4] = a3;
  v6 = (void (**)(_QWORD))MEMORY[0x24BD03294](v38);
  BaseAddressOfPlane = CVPixelBufferGetBaseAddressOfPlane(a3, 0);
  WidthOfPlane = CVPixelBufferGetWidthOfPlane(a3, 0);
  srcYp.data = BaseAddressOfPlane;
  srcYp.height = CVPixelBufferGetHeightOfPlane(a3, 0);
  srcYp.width = WidthOfPlane;
  srcYp.rowBytes = CVPixelBufferGetBytesPerRowOfPlane(a3, 0);
  v9 = CVPixelBufferGetBaseAddressOfPlane(a3, 1uLL);
  v10 = CVPixelBufferGetWidthOfPlane(a3, 1uLL);
  srcCbCr.data = v9;
  srcCbCr.height = CVPixelBufferGetHeightOfPlane(a3, 1uLL);
  srcCbCr.width = v10;
  srcCbCr.rowBytes = CVPixelBufferGetBytesPerRowOfPlane(a3, 1uLL);
  dest.data = malloc_type_malloc(4 * srcYp.width * srcYp.height, 0xD18F1F0EuLL);
  *(_OWORD *)&dest.height = *(_OWORD *)&srcYp.height;
  dest.rowBytes = 4 * srcYp.width;
  v33[0] = v5;
  v33[1] = 3221225472;
  v33[2] = __39__VGCaptureData__createColorFromYCbCr___block_invoke_2;
  v33[3] = &__block_descriptor_64_e5_v8__0l;
  v34 = dest;
  v11 = (void (**)(_QWORD))MEMORY[0x24BD03294](v33);
  PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  v13.i32[0] = 875704422;
  v14.i32[0] = PixelFormatType;
  v15 = vbsl_s8((int8x8_t)vdup_lane_s32(vceq_s32(v14, v13), 0), (int8x8_t)0x1000000FFLL, (int8x8_t)0x10000000EBLL);
  if (PixelFormatType == 875704422)
    v16 = 255;
  else
    v16 = 240;
  pixelRange.Yp_bias = 16 * (PixelFormatType != 875704422);
  pixelRange.CbCr_bias = 128;
  pixelRange.YpRangeMax = v15.i32[0];
  pixelRange.CbCrRangeMax = v16;
  *(int8x8_t *)&pixelRange.YpMax = v15;
  pixelRange.CbCrMax = v16;
  pixelRange.CbCrMin = pixelRange.Yp_bias;
  if (vImageConvert_YpCbCrToARGB_GenerateConversion((const vImage_YpCbCrToARGBMatrix *)*MEMORY[0x24BDB2EE0], &pixelRange, &buf, kvImage420Yp8_CbCr8, kvImageARGB8888, 0)|| (*(_DWORD *)permuteMap = 50462976, vImageConvert_420Yp8_CbCr8ToARGB8888(&srcYp, &srcCbCr, &dest, &buf, permuteMap, 0xFFu, 0x100u)))
  {
    v17 = 0;
  }
  else
  {
    v19 = objc_alloc(MEMORY[0x24BDD8DE8]);
    v39[0] = *MEMORY[0x24BDD8D90];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", dest.width);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v40[0] = v20;
    v39[1] = *MEMORY[0x24BDD8D58];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", dest.height);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = *MEMORY[0x24BDD8D38];
    v40[1] = v21;
    v40[2] = &unk_251B34BB0;
    v23 = *MEMORY[0x24BDD8D40];
    v39[2] = v22;
    v39[3] = v23;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", dest.rowBytes);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v39[4] = *MEMORY[0x24BDD8D60];
    v40[3] = v24;
    v40[4] = &unk_251B34BC8;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v40, v39, 5);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(v19, "initWithProperties:", v25);

    if (v26)
    {
      objc_msgSend(v26, "lockWithOptions:seed:", 0, 0);
      v27 = objc_retainAutorelease(v26);
      v28 = (void *)objc_msgSend(v27, "baseAddress");
      memcpy(v28, dest.data, dest.height * dest.rowBytes);
      objc_msgSend(v27, "unlockWithOptions:seed:", 0, 0);
      v30 = 0;
      if (CVPixelBufferCreateWithIOSurface(0, (IOSurfaceRef)v27, 0, &v30))
        v17 = 0;
      else
        v17 = v30;
    }
    else
    {
      __VGLogSharedInstance();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v30) = 0;
        _os_log_impl(&dword_249CAD000, v29, OS_LOG_TYPE_ERROR, " Failed to create IOSurface ", (uint8_t *)&v30, 2u);
      }

      v17 = 0;
    }

  }
  v11[2](v11);

  v6[2](v6);
  __39__VGCaptureData__createColorFromYCbCr___block_invoke();
  return v17;
}

void __39__VGCaptureData__createColorFromYCbCr___block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  VGLogVGCaptureData();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v0))
  {
    *(_WORD *)v1 = 0;
    _os_signpost_emit_with_name_impl(&dword_249CAD000, v0, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "CreateColorFromYCbCr", (const char *)&unk_249D51699, v1, 2u);
  }

}

uint64_t __39__VGCaptureData__createColorFromYCbCr___block_invoke_2(uint64_t a1)
{
  return CVPixelBufferUnlockBaseAddress(*(CVPixelBufferRef *)(a1 + 32), 1uLL);
}

void __39__VGCaptureData__createColorFromYCbCr___block_invoke_2(uint64_t a1)
{
  free(*(void **)(a1 + 32));
}

+ (id)computeYuvHighResChromaticAdaptationReverted:(id)a3 chromaticAdaptationMatrix:(id *)a4
{
  id v5;
  NSObject *v6;
  uint32x4_t v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  vg *v14;
  NSObject *v15;
  int32x4_t v16;
  const simd_float3x3 *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  float32x4_t v27;
  float32x4_t v28;
  float32x4_t v29;
  IOSurface v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[16];
  __int128 v37;
  __int128 v38;
  _QWORD v39[4];
  _QWORD v40[5];
  simd_float3x3 v41;
  simd_float3x3 v42;

  v40[4] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  VGLogVGCaptureData();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_249CAD000, v6, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "computeYuvHighResChromaticAdaptationReverted", (const char *)&unk_249D51699, buf, 2u);
  }

  if (v5)
  {
    v7 = (uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f32(*((float32x4_t *)a4 + 1), *(float32x4_t *)(MEMORY[0x24BDAEDF8] + 16)), (int8x16_t)vceqq_f32(*(float32x4_t *)a4, *MEMORY[0x24BDAEDF8])), (int8x16_t)vceqq_f32(*((float32x4_t *)a4 + 2), *(float32x4_t *)(MEMORY[0x24BDAEDF8] + 32)));
    v7.i32[3] = v7.i32[2];
    if ((vminvq_u32(v7) & 0x80000000) != 0)
    {
      v24 = v5;
    }
    else
    {
      v8 = objc_alloc(MEMORY[0x24BDD8DE8]);
      v39[0] = *MEMORY[0x24BDD8D90];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v5, "width"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v40[0] = v9;
      v39[1] = *MEMORY[0x24BDD8D58];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v5, "height"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *MEMORY[0x24BDD8D38];
      v40[1] = v10;
      v40[2] = &unk_251B34BB0;
      v12 = *MEMORY[0x24BDD8D60];
      v39[2] = v11;
      v39[3] = v12;
      v40[3] = &unk_251B34BC8;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v40, v39, 4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (vg *)objc_msgSend(v8, "initWithProperties:", v13);

      objc_msgSend(v5, "vg_convert420Yp8_CbCr8ToARGB8888:", v14);
      __VGLogSharedInstance();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_249CAD000, v15, OS_LOG_TYPE_INFO, " Inverting MCAM chromatic adaptation ", buf, 2u);
      }

      v41 = __invert_f3(*(simd_float3x3 *)_PromotedConst);
      v28 = (float32x4_t)v41.columns[1];
      v29 = (float32x4_t)v41.columns[0];
      v27 = (float32x4_t)v41.columns[2];
      v31 = 0u;
      v32 = 0u;
      v30 = (IOSurface)0;
      v41.columns[1] = (simd_float3)*((_OWORD *)a4 + 1);
      v41.columns[2] = (simd_float3)*((_OWORD *)a4 + 2);
      v16 = vzip1q_s32(*(int32x4_t *)a4, (int32x4_t)v41.columns[2]);
      v41.columns[0] = (simd_float3)vzip1q_s32(v16, (int32x4_t)v41.columns[1]);
      v41.columns[2] = (simd_float3)vzip1q_s32(vzip2q_s32(*(int32x4_t *)a4, (int32x4_t)v41.columns[2]), vdupq_laneq_s32((int32x4_t)v41.columns[1], 2));
      v41.columns[1] = (simd_float3)vzip2q_s32(v16, vdupq_lane_s32(*(int32x2_t *)v41.columns[1].f32, 1));
      v42 = __invert_f3(v41);
      v18 = 0;
      v33 = xmmword_249D3AA10;
      v34 = xmmword_249D3AA20;
      v35 = xmmword_249D3AA30;
      do
      {
        *(float32x4_t *)&buf[v18] = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v42.columns[0], COERCE_FLOAT(*(__int128 *)((char *)&v33 + v18))), (float32x4_t)v42.columns[1], *(float32x2_t *)((char *)&v33 + v18), 1), (float32x4_t)v42.columns[2], *(float32x4_t *)((char *)&v33 + v18), 2);
        v18 += 16;
      }
      while (v18 != 48);
      v19 = 0;
      v33 = *(_OWORD *)buf;
      v34 = v37;
      v35 = v38;
      do
      {
        *(float32x4_t *)&buf[v19] = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v29, COERCE_FLOAT(*(__int128 *)((char *)&v33 + v19))), v28, *(float32x2_t *)((char *)&v33 + v19), 1), v27, *(float32x4_t *)((char *)&v33 + v19), 2);
        v19 += 16;
      }
      while (v19 != 48);
      LODWORD(v30._impl) = *(_DWORD *)&buf[8];
      DWORD2(v31) = DWORD2(v37);
      v30.super.isa = *(Class *)buf;
      *(_QWORD *)&v31 = v37;
      DWORD2(v32) = DWORD2(v38);
      *(_QWORD *)&v32 = v38;
      vg::createSurfaceFromSurfaceWithTransform(v14, &v30, v17);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      __VGLogSharedInstance();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_249CAD000, v21, OS_LOG_TYPE_INFO, " Finished inverting MCAM chromatic adaptation ", buf, 2u);
      }

      objc_msgSend(v5, "allAttachments");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("CreationProperties"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      v24 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD8DE8]), "initWithProperties:", v23);
      if (v24)
      {
        objc_msgSend(v20, "vg_convertARGB8888To420Yp8_CbCr8:", v24);
        v25 = v24;
      }

    }
  }
  else
  {
    v24 = 0;
  }
  __88__VGCaptureData_computeYuvHighResChromaticAdaptationReverted_chromaticAdaptationMatrix___block_invoke();

  return v24;
}

void __88__VGCaptureData_computeYuvHighResChromaticAdaptationReverted_chromaticAdaptationMatrix___block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  VGLogVGCaptureData();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v0))
  {
    *(_WORD *)v1 = 0;
    _os_signpost_emit_with_name_impl(&dword_249CAD000, v0, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "computeYuvHighResChromaticAdaptationReverted", (const char *)&unk_249D51699, v1, 2u);
  }

}

- (id)getFaceCaptureData
{
  VGFaceCaptureData *v3;
  void *v4;
  void *v5;
  __int128 v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;

  v3 = objc_alloc_init(VGFaceCaptureData);
  -[VGFaceCaptureData setYuvRectified:](v3, "setYuvRectified:", -[VGCaptureData yuvRectified](self, "yuvRectified"));
  -[VGFaceCaptureData setDepth:](v3, "setDepth:", -[VGCaptureData depth](self, "depth"));
  -[VGCaptureData videoIntrinsics](self, "videoIntrinsics");
  -[VGFaceCaptureData setVideoIntrinsics:](v3, "setVideoIntrinsics:");
  -[VGCaptureData depthIntrinsics](self, "depthIntrinsics");
  -[VGFaceCaptureData setDepthIntrinsics:](v3, "setDepthIntrinsics:");
  -[VGCaptureData chromaticAdaptationMatrix](self, "chromaticAdaptationMatrix");
  -[VGFaceCaptureData setChromaticAdaptationMatrix:](v3, "setChromaticAdaptationMatrix:");
  -[VGCaptureData face](self, "face");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VGFaceCaptureData setFace:](v3, "setFace:", v4);

  -[VGCaptureData allFaces](self, "allFaces");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VGFaceCaptureData setAllFaces:](v3, "setAllFaces:", v5);

  -[VGCaptureData timestamp](self, "timestamp");
  v7 = v9;
  v8 = v10;
  -[VGFaceCaptureData setTimestamp:](v3, "setTimestamp:", &v7);
  return v3;
}

+ (id)_matrix33ToData:(__n128)a3
{
  id v3;
  uint64_t v4;
  uint64_t i;
  uint64_t v6;
  __int128 v7;
  __int128 v9;
  _OWORD v10[3];

  v10[0] = a1;
  v10[1] = a2;
  v10[2] = a3;
  v3 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithLength:", 36));
  v4 = objc_msgSend(v3, "mutableBytes");
  for (i = 0; i != 3; ++i)
  {
    v6 = 0;
    v7 = v10[i];
    do
    {
      v9 = v7;
      *(_DWORD *)(v4 + 4 * v6) = *(_DWORD *)((unint64_t)&v9 & 0xFFFFFFFFFFFFFFF3 | (4 * (v6 & 3)));
      ++v6;
    }
    while (v6 != 3);
    v4 += 12;
  }
  return v3;
}

+ (id)_matrix44ToData:(__n128)a3
{
  id v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  __int128 v8;
  __int128 v10;
  _OWORD v11[4];

  v11[0] = a1;
  v11[1] = a2;
  v11[2] = a3;
  v11[3] = a4;
  v4 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithLength:", 64));
  v5 = objc_msgSend(v4, "mutableBytes");
  for (i = 0; i != 4; ++i)
  {
    v7 = 0;
    v8 = v11[i];
    do
    {
      v10 = v8;
      *(_DWORD *)(v5 + 4 * v7) = *(_DWORD *)((unint64_t)&v10 & 0xFFFFFFFFFFFFFFF3 | (4 * (v7 & 3)));
      ++v7;
    }
    while (v7 != 4);
    v5 += 16;
  }
  return v4;
}

+ (double)_dataToMatrix33:(void *)a3
{
  uint64_t v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  _OWORD *v7;
  __int128 v8;
  int v9;
  __int128 v11;
  _OWORD v12[3];

  v3 = objc_msgSend(objc_retainAutorelease(a3), "bytes");
  v4 = 0;
  v5 = *(_OWORD *)(MEMORY[0x24BDAEDF8] + 16);
  v12[0] = *MEMORY[0x24BDAEDF8];
  v12[1] = v5;
  v12[2] = *(_OWORD *)(MEMORY[0x24BDAEDF8] + 32);
  do
  {
    v6 = 0;
    v7 = &v12[v4];
    v8 = *v7;
    do
    {
      v9 = *(_DWORD *)(v3 + 4 * v6);
      v11 = v8;
      *(_DWORD *)((unint64_t)&v11 & 0xFFFFFFFFFFFFFFF3 | (4 * (v6 & 3))) = v9;
      v8 = v11;
      ++v6;
    }
    while (v6 != 3);
    *((_DWORD *)v7 + 2) = DWORD2(v11);
    *(_QWORD *)v7 = v8;
    ++v4;
    v3 += 12;
  }
  while (v4 != 3);
  return *(double *)v12;
}

+ (double)_dataToMatrix44:(void *)a3
{
  uint64_t v3;
  uint64_t v4;
  __int128 v5;
  __int128 v6;
  uint64_t v7;
  __int128 v8;
  int v9;
  __int128 v11;
  _OWORD v12[4];

  v3 = objc_msgSend(objc_retainAutorelease(a3), "bytes");
  v4 = 0;
  v5 = *(_OWORD *)(MEMORY[0x24BDAEE00] + 16);
  v12[0] = *MEMORY[0x24BDAEE00];
  v12[1] = v5;
  v6 = *(_OWORD *)(MEMORY[0x24BDAEE00] + 48);
  v12[2] = *(_OWORD *)(MEMORY[0x24BDAEE00] + 32);
  v12[3] = v6;
  do
  {
    v7 = 0;
    v8 = v12[v4];
    do
    {
      v9 = *(_DWORD *)(v3 + 4 * v7);
      v11 = v8;
      *(_DWORD *)((unint64_t)&v11 & 0xFFFFFFFFFFFFFFF3 | (4 * (v7 & 3))) = v9;
      v8 = v11;
      ++v7;
    }
    while (v7 != 4);
    v12[v4++] = v11;
    v3 += 16;
  }
  while (v4 != 4);
  return *(double *)v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  __CVBuffer *v5;
  CVPixelBufferRef IOSurfaceBackedPixelBufferCopy;
  uint64_t v7;
  void (**v8)(_QWORD);
  __CVBuffer *v9;
  CVPixelBufferRef v10;
  void (**v11)(_QWORD);
  __CVBuffer *v12;
  IOSurface *yuvHighRes;
  void *v14;
  void *v15;
  CVPixelBufferRef v16;
  void (**v17)(_QWORD);
  __CVBuffer *v18;
  CVPixelBufferRef v19;
  void (**v20)(_QWORD);
  IOSurface *mcamLeftYuvHighRes;
  void *v22;
  void *v23;
  id v24;
  _QWORD v26[5];
  _QWORD v27[5];
  _QWORD v28[5];
  _QWORD v29[5];
  $95D729B680665BEAEFA1D6FCA8238556 timestamp;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  objc_msgSend(v4, "setRgbRectified:", self->_rgbRectified);
  objc_msgSend(v4, "setMirrored:", self->_mirrored);
  objc_msgSend(v4, "setVideoIntrinsics:", *(double *)self->_anon_d0, *(double *)&self->_anon_d0[16], *(double *)&self->_anon_d0[32]);
  objc_msgSend(v4, "setDepthIntrinsics:", *(double *)self->_anon_100, *(double *)&self->_anon_100[16], *(double *)&self->_anon_100[32]);
  objc_msgSend(v4, "setChromaticAdaptationMatrix:", *(double *)self->_anon_130, *(double *)&self->_anon_130[16], *(double *)&self->_anon_130[32]);
  objc_msgSend(v4, "setFace:", self->_face);
  objc_msgSend(v4, "setAllFaces:", self->_allFaces);
  timestamp = self->_timestamp;
  objc_msgSend(v4, "setTimestamp:", &timestamp);
  objc_msgSend(v4, "setFaceTrackingResult:", self->_faceTrackingResult);
  objc_msgSend(v4, "setSkeleton:", self->_skeleton);
  objc_msgSend(v4, "setCameraToDeviceTransform:", *(double *)self->_anon_1f0, *(double *)&self->_anon_1f0[16], *(double *)&self->_anon_1f0[32], *(double *)&self->_anon_1f0[48]);
  IOSurfaceBackedPixelBufferCopy = vg::createIOSurfaceBackedPixelBufferCopy(self->_depth, v5);
  v7 = MEMORY[0x24BDAC760];
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __30__VGCaptureData_copyWithZone___block_invoke;
  v29[3] = &__block_descriptor_40_e5_v8__0l;
  v29[4] = IOSurfaceBackedPixelBufferCopy;
  v8 = (void (**)(_QWORD))MEMORY[0x24BD03294](v29);
  objc_msgSend(v4, "setDepth:", IOSurfaceBackedPixelBufferCopy);
  v10 = vg::createIOSurfaceBackedPixelBufferCopy(self->_yuvRectified, v9);
  v28[0] = v7;
  v28[1] = 3221225472;
  v28[2] = __30__VGCaptureData_copyWithZone___block_invoke_2;
  v28[3] = &__block_descriptor_40_e5_v8__0l;
  v28[4] = v10;
  v11 = (void (**)(_QWORD))MEMORY[0x24BD03294](v28);
  objc_msgSend(v4, "setYuvRectified:", v10);
  yuvHighRes = self->_yuvHighRes;
  if (yuvHighRes)
  {
    -[IOSurface vg_copy](yuvHighRes, "vg_copy");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setYuvHighRes:", v14);

    -[IOSurface vg_copy](self->_yuvHighResUndistortionLut, "vg_copy");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setYuvHighResUndistortionLut:", v15);

  }
  v16 = vg::createIOSurfaceBackedPixelBufferCopy(self->_mcamLeftColorYuv, v12);
  v27[0] = v7;
  v27[1] = 3221225472;
  v27[2] = __30__VGCaptureData_copyWithZone___block_invoke_3;
  v27[3] = &__block_descriptor_40_e5_v8__0l;
  v27[4] = v16;
  v17 = (void (**)(_QWORD))MEMORY[0x24BD03294](v27);
  objc_msgSend(v4, "setMcamLeftColorYuv:", v16);
  objc_msgSend(v4, "setMcamLeftColorRGB:", self->_mcamLeftColorRGB);
  v19 = vg::createIOSurfaceBackedPixelBufferCopy(self->_mcamLeftDepth, v18);
  v26[0] = v7;
  v26[1] = 3221225472;
  v26[2] = __30__VGCaptureData_copyWithZone___block_invoke_4;
  v26[3] = &__block_descriptor_40_e5_v8__0l;
  v26[4] = v19;
  v20 = (void (**)(_QWORD))MEMORY[0x24BD03294](v26);
  objc_msgSend(v4, "setMcamLeftDepth:", v19);
  mcamLeftYuvHighRes = self->_mcamLeftYuvHighRes;
  if (mcamLeftYuvHighRes)
  {
    -[IOSurface vg_copy](mcamLeftYuvHighRes, "vg_copy");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setMcamLeftYuvHighRes:", v22);

    -[IOSurface vg_copy](self->_mcamLeftYuvHighResUndistortionLut, "vg_copy");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setMcamLeftYuvHighResUndistortionLut:", v23);

  }
  objc_msgSend(v4, "setMcamLeftColorIntrinsics:", *(double *)self->_anon_160, *(double *)&self->_anon_160[16], *(double *)&self->_anon_160[32]);
  objc_msgSend(v4, "setMcamLeftDepthIntrinsics:", *(double *)self->_anon_190, *(double *)&self->_anon_190[16], *(double *)&self->_anon_190[32]);
  objc_msgSend(v4, "setMcamLeftChromaticAdaptationMatrix:", *(double *)self->_anon_1c0, *(double *)&self->_anon_1c0[16], *(double *)&self->_anon_1c0[32]);
  objc_msgSend(v4, "setMcamLeftToDeviceTransform:", *(double *)&self[1].super.isa, *(double *)&self[1]._rgbRectified, *(double *)&self[1]._mcamLeftColorYuvChromaticAdaptationReverted, *(double *)&self[1]._yuvHighResChromaticAdaptationReverted);
  objc_msgSend(v4, "setEnrollmentPhase:", self->_enrollmentPhase);
  v24 = v4;
  v20[2](v20);

  v17[2](v17);
  v11[2](v11);

  v8[2](v8);
  return v24;
}

void __30__VGCaptureData_copyWithZone___block_invoke(uint64_t a1)
{
  CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 32));
}

void __30__VGCaptureData_copyWithZone___block_invoke_2(uint64_t a1)
{
  CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 32));
}

void __30__VGCaptureData_copyWithZone___block_invoke_3(uint64_t a1)
{
  CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 32));
}

void __30__VGCaptureData_copyWithZone___block_invoke_4(uint64_t a1)
{
  CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 32));
}

- (void)saveAtPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initFileURLWithPath:isDirectory:", v4, 0);
  objc_msgSend(MEMORY[0x24BDBF660], "imageWithCVPixelBuffer:", self->_yuvRectified);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc(MEMORY[0x24BDBF648]);
  v8 = (void *)objc_msgSend(v7, "initWithOptions:", MEMORY[0x24BDBD1B8]);
  v9 = objc_msgSend(v6, "colorSpace");
  v10 = *MEMORY[0x24BDBF8B0];
  v14 = 0;
  objc_msgSend(v8, "writePNGRepresentationOfImage:toURL:format:colorSpace:options:error:", v6, v5, v10, v9, MEMORY[0x24BDBD1B8], &v14);
  v11 = v14;
  __VGLogSharedInstance();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v16 = v5;
    _os_log_impl(&dword_249CAD000, v12, OS_LOG_TYPE_DEBUG, " VGCaptureData write at %@ ", buf, 0xCu);
  }

  if (v11)
  {
    __VGLogSharedInstance();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v11;
      _os_log_impl(&dword_249CAD000, v13, OS_LOG_TYPE_ERROR, " write error %@ ", buf, 0xCu);
    }

  }
}

- (IOSurface)yuvHighResChromaticAdaptationReverted
{
  IOSurface *v3;
  IOSurface *yuvHighResChromaticAdaptationReverted;

  +[VGCaptureData computeYuvHighResChromaticAdaptationReverted:chromaticAdaptationMatrix:](VGCaptureData, "computeYuvHighResChromaticAdaptationReverted:chromaticAdaptationMatrix:", self->_yuvHighRes, self->_anon_130);
  v3 = (IOSurface *)objc_claimAutoreleasedReturnValue();
  yuvHighResChromaticAdaptationReverted = self->_yuvHighResChromaticAdaptationReverted;
  self->_yuvHighResChromaticAdaptationReverted = v3;

  return self->_yuvHighResChromaticAdaptationReverted;
}

- (IOSurface)mcamLeftYuvHighResChromaticAdaptationReverted
{
  IOSurface *mcamLeftYuvHighRes;
  IOSurface *v4;
  IOSurface *mcamLeftYuvHighResChromaticAdaptationReverted;
  IOSurface *v6;

  mcamLeftYuvHighRes = self->_mcamLeftYuvHighRes;
  if (mcamLeftYuvHighRes)
  {
    +[VGCaptureData computeYuvHighResChromaticAdaptationReverted:chromaticAdaptationMatrix:](VGCaptureData, "computeYuvHighResChromaticAdaptationReverted:chromaticAdaptationMatrix:", mcamLeftYuvHighRes, self->_anon_1c0);
    v4 = (IOSurface *)objc_claimAutoreleasedReturnValue();
    mcamLeftYuvHighResChromaticAdaptationReverted = self->_mcamLeftYuvHighResChromaticAdaptationReverted;
    self->_mcamLeftYuvHighResChromaticAdaptationReverted = v4;

    v6 = self->_mcamLeftYuvHighResChromaticAdaptationReverted;
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (VGFaceMetadata)mcamLeftFaceMetadata
{
  vg::shared *v3;
  IOSurface *v4;
  vg::shared *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  VGFaceMetadata *v25;
  VGFaceMetadata *mcamLeftFaceMetadata;
  VGFaceMetadata *v27;

  if (-[VGCaptureData mcamLeftColorRGB](self, "mcamLeftColorRGB"))
  {
    CVPixelBufferGetIOSurface(-[VGCaptureData mcamLeftColorRGB](self, "mcamLeftColorRGB"));
    v3 = (vg::shared *)objc_claimAutoreleasedReturnValue();
    v5 = v3;
    if (v3)
    {
      vg::shared::VNGetLargestFaceObservation(v3, v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (v6)
      {
        objc_msgSend(v6, "boundingBox");
        v9 = v8;
        objc_msgSend(v7, "boundingBox");
        v11 = v10;
        objc_msgSend(v7, "boundingBox");
        v13 = v12;
        objc_msgSend(v7, "boundingBox");
        v15 = v14;
        objc_msgSend(v7, "boundingBox");
        v17 = v16;
        objc_msgSend(v7, "yaw");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "doubleValue");
        v20 = v19 * 57.2957795;

        if (v20 < 0.0)
          v20 = v20 + 360.0;
        objc_msgSend(v7, "roll");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "doubleValue");
        v23 = v22 * -57.2957795;

        if (v23 >= 0.0)
          v24 = v23;
        else
          v24 = v23 + 360.0;
        v25 = -[VGFaceMetadata initWithFaceId:bounds:yawAngle:rollAngle:]([VGFaceMetadata alloc], "initWithFaceId:bounds:yawAngle:rollAngle:", objc_msgSend(v7, "faceId"), v9, 1.0 - (v11 + v13), v15, v17, round(v20), round(v24));
        mcamLeftFaceMetadata = self->_mcamLeftFaceMetadata;
        self->_mcamLeftFaceMetadata = v25;

        v27 = self->_mcamLeftFaceMetadata;
      }
      else
      {
        v27 = 0;
      }

    }
    else
    {
      v27 = 0;
    }

  }
  else
  {
    v27 = 0;
  }
  return v27;
}

- (void)setRgbRectified:(__CVBuffer *)a3
{
  __CVBuffer *rgbRectified;

  rgbRectified = self->_rgbRectified;
  if (rgbRectified)
    CVPixelBufferRelease(rgbRectified);
  self->_rgbRectified = a3;
  if (a3)
    CVPixelBufferRetain(a3);
}

- (__CVBuffer)rgbRectified
{
  NSObject *v3;
  __CVBuffer *rgbRectified;
  uint8_t v6[16];

  VGLogVGCaptureData();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)v6 = 0;
    _os_signpost_emit_with_name_impl(&dword_249CAD000, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "RgbRectified", (const char *)&unk_249D51699, v6, 2u);
  }

  rgbRectified = self->_rgbRectified;
  if (!rgbRectified)
  {
    if (self->_yuvRectified)
    {
      rgbRectified = +[VGCaptureData _createColorFromYCbCr:](VGCaptureData, "_createColorFromYCbCr:");
      self->_rgbRectified = rgbRectified;
    }
    else
    {
      rgbRectified = 0;
    }
  }
  __29__VGCaptureData_rgbRectified__block_invoke();
  return rgbRectified;
}

void __29__VGCaptureData_rgbRectified__block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  VGLogVGCaptureData();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v0))
  {
    *(_WORD *)v1 = 0;
    _os_signpost_emit_with_name_impl(&dword_249CAD000, v0, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "RgbRectified", (const char *)&unk_249D51699, v1, 2u);
  }

}

- (void)setYuvRectified:(__CVBuffer *)a3
{
  __CVBuffer *yuvRectified;

  yuvRectified = self->_yuvRectified;
  if (yuvRectified)
    CVPixelBufferRelease(yuvRectified);
  self->_yuvRectified = a3;
  if (a3)
    CVPixelBufferRetain(a3);
}

- (void)setDepth:(__CVBuffer *)a3
{
  __CVBuffer *depth;

  depth = self->_depth;
  if (depth)
    CVPixelBufferRelease(depth);
  self->_depth = a3;
  if (a3)
    CVPixelBufferRetain(a3);
}

- (void)setMcamLeftColorRGB:(__CVBuffer *)a3
{
  __CVBuffer *mcamLeftColorRGB;

  mcamLeftColorRGB = self->_mcamLeftColorRGB;
  if (mcamLeftColorRGB)
    CVPixelBufferRelease(mcamLeftColorRGB);
  self->_mcamLeftColorRGB = a3;
  if (a3)
    CVPixelBufferRetain(a3);
}

- (__CVBuffer)mcamLeftColorRGB
{
  NSObject *v3;
  __CVBuffer *mcamLeftColorRGB;
  uint8_t v6[16];

  VGLogVGCaptureData();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)v6 = 0;
    _os_signpost_emit_with_name_impl(&dword_249CAD000, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "mcamLeftColorRGB", (const char *)&unk_249D51699, v6, 2u);
  }

  mcamLeftColorRGB = self->_mcamLeftColorRGB;
  if (!mcamLeftColorRGB)
  {
    if (self->_mcamLeftColorYuv)
    {
      mcamLeftColorRGB = +[VGCaptureData _createColorFromYCbCr:](VGCaptureData, "_createColorFromYCbCr:");
      self->_mcamLeftColorRGB = mcamLeftColorRGB;
    }
    else
    {
      mcamLeftColorRGB = 0;
    }
  }
  __33__VGCaptureData_mcamLeftColorRGB__block_invoke();
  return mcamLeftColorRGB;
}

void __33__VGCaptureData_mcamLeftColorRGB__block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  VGLogVGCaptureData();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v0))
  {
    *(_WORD *)v1 = 0;
    _os_signpost_emit_with_name_impl(&dword_249CAD000, v0, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "mcamLeftColorRGB", (const char *)&unk_249D51699, v1, 2u);
  }

}

- (void)setMcamLeftColorYuv:(__CVBuffer *)a3
{
  __CVBuffer *mcamLeftColorYuv;

  mcamLeftColorYuv = self->_mcamLeftColorYuv;
  if (mcamLeftColorYuv)
    CVPixelBufferRelease(mcamLeftColorYuv);
  self->_mcamLeftColorYuv = a3;
  if (a3)
    CVPixelBufferRetain(a3);
}

- (__CVBuffer)mcamLeftColorYuvChromaticAdaptationReverted
{
  NSObject *v3;
  __CVBuffer *mcamLeftColorYuvChromaticAdaptationReverted;
  __CVBuffer *mcamLeftColorYuv;
  void *v6;
  IOSurface *v7;
  uint8_t v9[16];

  VGLogVGCaptureData();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)v9 = 0;
    _os_signpost_emit_with_name_impl(&dword_249CAD000, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "mcamLeftColorYuvChromaticAdaptationReverted", (const char *)&unk_249D51699, v9, 2u);
  }

  mcamLeftColorYuvChromaticAdaptationReverted = self->_mcamLeftColorYuvChromaticAdaptationReverted;
  if (!mcamLeftColorYuvChromaticAdaptationReverted)
  {
    mcamLeftColorYuv = self->_mcamLeftColorYuv;
    if (mcamLeftColorYuv)
    {
      IOSurfaceFromCVPixelBuffer(mcamLeftColorYuv);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[VGCaptureData computeYuvHighResChromaticAdaptationReverted:chromaticAdaptationMatrix:](VGCaptureData, "computeYuvHighResChromaticAdaptationReverted:chromaticAdaptationMatrix:", v6, self->_anon_1c0);
      v7 = (IOSurface *)objc_claimAutoreleasedReturnValue();

      mcamLeftColorYuvChromaticAdaptationReverted = createCVPixelBufferFromIOSurface(v7);
      self->_mcamLeftColorYuvChromaticAdaptationReverted = mcamLeftColorYuvChromaticAdaptationReverted;

    }
    else
    {
      mcamLeftColorYuvChromaticAdaptationReverted = 0;
    }
  }
  __60__VGCaptureData_mcamLeftColorYuvChromaticAdaptationReverted__block_invoke();
  return mcamLeftColorYuvChromaticAdaptationReverted;
}

void __60__VGCaptureData_mcamLeftColorYuvChromaticAdaptationReverted__block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  VGLogVGCaptureData();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v0))
  {
    *(_WORD *)v1 = 0;
    _os_signpost_emit_with_name_impl(&dword_249CAD000, v0, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "mcamLeftColorYuvChromaticAdaptationReverted", (const char *)&unk_249D51699, v1, 2u);
  }

}

- (__CVBuffer)mcamLeftColorRGBChromaticAdaptationReverted
{
  NSObject *v3;
  __CVBuffer *mcamLeftColorRGBChromaticAdaptationReverted;
  __CVBuffer *v5;
  uint8_t v7[16];

  VGLogVGCaptureData();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)v7 = 0;
    _os_signpost_emit_with_name_impl(&dword_249CAD000, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "mcamLeftColorRGBChromaticAdaptationReverted", (const char *)&unk_249D51699, v7, 2u);
  }

  mcamLeftColorRGBChromaticAdaptationReverted = self->_mcamLeftColorRGBChromaticAdaptationReverted;
  if (!mcamLeftColorRGBChromaticAdaptationReverted)
  {
    if (-[VGCaptureData mcamLeftColorYuvChromaticAdaptationReverted](self, "mcamLeftColorYuvChromaticAdaptationReverted"))
    {
      mcamLeftColorRGBChromaticAdaptationReverted = vg::createARGBFromYCbCr(self->_mcamLeftColorYuvChromaticAdaptationReverted, v5);
      self->_mcamLeftColorRGBChromaticAdaptationReverted = mcamLeftColorRGBChromaticAdaptationReverted;
    }
    else
    {
      mcamLeftColorRGBChromaticAdaptationReverted = 0;
    }
  }
  __60__VGCaptureData_mcamLeftColorRGBChromaticAdaptationReverted__block_invoke();
  return mcamLeftColorRGBChromaticAdaptationReverted;
}

void __60__VGCaptureData_mcamLeftColorRGBChromaticAdaptationReverted__block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  VGLogVGCaptureData();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v0))
  {
    *(_WORD *)v1 = 0;
    _os_signpost_emit_with_name_impl(&dword_249CAD000, v0, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "mcamLeftColorRGBChromaticAdaptationReverted", (const char *)&unk_249D51699, v1, 2u);
  }

}

- (void)setMcamLeftDepth:(__CVBuffer *)a3
{
  __CVBuffer *mcamLeftDepth;

  mcamLeftDepth = self->_mcamLeftDepth;
  if (mcamLeftDepth)
    CVPixelBufferRelease(mcamLeftDepth);
  self->_mcamLeftDepth = a3;
  if (a3)
    CVPixelBufferRetain(a3);
}

- (void)dealloc
{
  __CVBuffer *depth;
  __CVBuffer *yuvRectified;
  __CVBuffer *rgbRectified;
  __CVBuffer *mcamLeftColorYuv;
  __CVBuffer *mcamLeftColorRGB;
  __CVBuffer *mcamLeftColorYuvChromaticAdaptationReverted;
  __CVBuffer *mcamLeftColorRGBChromaticAdaptationReverted;
  __CVBuffer *mcamLeftDepth;
  objc_super v11;

  depth = self->_depth;
  if (depth)
    CVPixelBufferRelease(depth);
  yuvRectified = self->_yuvRectified;
  if (yuvRectified)
    CVPixelBufferRelease(yuvRectified);
  rgbRectified = self->_rgbRectified;
  if (rgbRectified)
    CVPixelBufferRelease(rgbRectified);
  mcamLeftColorYuv = self->_mcamLeftColorYuv;
  if (mcamLeftColorYuv)
    CVPixelBufferRelease(mcamLeftColorYuv);
  mcamLeftColorRGB = self->_mcamLeftColorRGB;
  if (mcamLeftColorRGB)
    CVPixelBufferRelease(mcamLeftColorRGB);
  mcamLeftColorYuvChromaticAdaptationReverted = self->_mcamLeftColorYuvChromaticAdaptationReverted;
  if (mcamLeftColorYuvChromaticAdaptationReverted)
    CVPixelBufferRelease(mcamLeftColorYuvChromaticAdaptationReverted);
  mcamLeftColorRGBChromaticAdaptationReverted = self->_mcamLeftColorRGBChromaticAdaptationReverted;
  if (mcamLeftColorRGBChromaticAdaptationReverted)
    CVPixelBufferRelease(mcamLeftColorRGBChromaticAdaptationReverted);
  mcamLeftDepth = self->_mcamLeftDepth;
  if (mcamLeftDepth)
    CVPixelBufferRelease(mcamLeftDepth);
  v11.receiver = self;
  v11.super_class = (Class)VGCaptureData;
  -[VGCaptureData dealloc](&v11, sel_dealloc);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  __CVBuffer *mcamLeftColorYuv;
  __CVBuffer *mcamLeftDepth;
  IOSurface *mcamLeftYuvHighRes;
  IOSurface *mcamLeftYuvHighResUndistortionLut;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  +[VGCoderUtilities encodePixelBuffer:forKey:encoder:](VGCoderUtilities, "encodePixelBuffer:forKey:encoder:", self->_yuvRectified, CFSTR("yuvRectified"));
  +[VGCoderUtilities encodePixelBuffer:forKey:encoder:](VGCoderUtilities, "encodePixelBuffer:forKey:encoder:", self->_depth, CFSTR("depth"), v16);
  objc_msgSend(v16, "encodeBool:forKey:", self->_mirrored, CFSTR("mirrored"));
  objc_msgSend(v16, "vg_encodeSurface:forKey:", self->_yuvHighRes, CFSTR("yuvHighRes"));
  objc_msgSend(v16, "vg_encodeSurface:forKey:", self->_yuvHighResUndistortionLut, CFSTR("yuvHighResUndistortionLut"));
  +[VGCaptureData _matrix33ToData:](VGCaptureData, "_matrix33ToData:", *(double *)self->_anon_d0, *(double *)&self->_anon_d0[16], *(double *)&self->_anon_d0[32]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "encodeObject:forKey:", v4, CFSTR("videoIntrinsics"));

  +[VGCaptureData _matrix33ToData:](VGCaptureData, "_matrix33ToData:", *(double *)self->_anon_100, *(double *)&self->_anon_100[16], *(double *)&self->_anon_100[32]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "encodeObject:forKey:", v5, CFSTR("depthIntrinsics"));

  +[VGCaptureData _matrix33ToData:](VGCaptureData, "_matrix33ToData:", *(double *)self->_anon_130, *(double *)&self->_anon_130[16], *(double *)&self->_anon_130[32]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "encodeObject:forKey:", v6, CFSTR("chromaticAdaptationMatrix"));

  objc_msgSend(v16, "encodeObject:forKey:", self->_face, CFSTR("face"));
  objc_msgSend(v16, "encodeObject:forKey:", self->_allFaces, CFSTR("allFaces"));
  objc_msgSend(v16, "encodeObject:forKey:", self->_faceTrackingResult, CFSTR("faceTrackingResult"));
  objc_msgSend(v16, "encodeObject:forKey:", self->_skeleton, CFSTR("skeleton"));
  +[VGCaptureData _matrix44ToData:](VGCaptureData, "_matrix44ToData:", *(double *)self->_anon_1f0, *(double *)&self->_anon_1f0[16], *(double *)&self->_anon_1f0[32], *(double *)&self->_anon_1f0[48]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "encodeObject:forKey:", v7, CFSTR("cameraToDeviceTransform"));

  objc_msgSend(v16, "encodeInt64:forKey:", self->_timestamp.value, CFSTR("timestampValue"));
  objc_msgSend(v16, "encodeInt64:forKey:", self->_timestamp.epoch, CFSTR("timestampEpoch"));
  objc_msgSend(v16, "encodeInt32:forKey:", self->_timestamp.timescale, CFSTR("timestampTimeScale"));
  objc_msgSend(v16, "encodeInt64:forKey:", self->_timestamp.flags, CFSTR("timestampFlags"));
  mcamLeftColorYuv = self->_mcamLeftColorYuv;
  if (mcamLeftColorYuv)
    +[VGCoderUtilities encodePixelBuffer:forKey:encoder:](VGCoderUtilities, "encodePixelBuffer:forKey:encoder:", mcamLeftColorYuv, CFSTR("mcamLeftColorYuv"), v16);
  mcamLeftDepth = self->_mcamLeftDepth;
  if (mcamLeftDepth)
    +[VGCoderUtilities encodePixelBuffer:forKey:encoder:](VGCoderUtilities, "encodePixelBuffer:forKey:encoder:", mcamLeftDepth, CFSTR("mcamLeftDepth"), v16);
  mcamLeftYuvHighRes = self->_mcamLeftYuvHighRes;
  if (mcamLeftYuvHighRes)
    objc_msgSend(v16, "vg_encodeSurface:forKey:", mcamLeftYuvHighRes, CFSTR("mcamLeftYuvHighRes"));
  mcamLeftYuvHighResUndistortionLut = self->_mcamLeftYuvHighResUndistortionLut;
  if (mcamLeftYuvHighResUndistortionLut)
    objc_msgSend(v16, "vg_encodeSurface:forKey:", mcamLeftYuvHighResUndistortionLut, CFSTR("mcamLeftYuvHighResUndistortionLut"));
  +[VGCaptureData _matrix33ToData:](VGCaptureData, "_matrix33ToData:", *(double *)self->_anon_160, *(double *)&self->_anon_160[16], *(double *)&self->_anon_160[32]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "encodeObject:forKey:", v12, CFSTR("mcamLeftColorIntrinsics"));

  +[VGCaptureData _matrix33ToData:](VGCaptureData, "_matrix33ToData:", *(double *)self->_anon_190, *(double *)&self->_anon_190[16], *(double *)&self->_anon_190[32]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "encodeObject:forKey:", v13, CFSTR("mcamLeftDepthIntrinsics"));

  +[VGCaptureData _matrix33ToData:](VGCaptureData, "_matrix33ToData:", *(double *)self->_anon_1c0, *(double *)&self->_anon_1c0[16], *(double *)&self->_anon_1c0[32]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "encodeObject:forKey:", v14, CFSTR("mcamLeftChromaticAdaptationMatrix"));

  +[VGCaptureData _matrix44ToData:](VGCaptureData, "_matrix44ToData:", *(double *)&self[1].super.isa, *(double *)&self[1]._rgbRectified, *(double *)&self[1]._mcamLeftColorYuvChromaticAdaptationReverted, *(double *)&self[1]._yuvHighResChromaticAdaptationReverted);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "encodeObject:forKey:", v15, CFSTR("mcamLeftToDeviceTransform"));

  objc_msgSend(v16, "encodeInteger:forKey:", self->_enrollmentPhase, CFSTR("enrollmentPhase"));
}

- (VGCaptureData)initWithCoder:(id)a3
{
  id v4;
  VGCaptureData *v5;
  uint64_t v6;
  IOSurface *yuvHighRes;
  uint64_t v8;
  IOSurface *yuvHighResUndistortionLut;
  void *v10;
  void *v11;
  NSObject *v12;
  VGCaptureData *v13;
  int v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  NSObject *v20;
  NSObject *v21;
  int v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  int v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  uint64_t v33;
  uint64_t v34;
  __int128 v35;
  uint64_t v36;
  VGFaceMetadata *face;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  NSArray *allFaces;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  NSDictionary *faceTrackingResult;
  uint64_t v48;
  VGSkeleton *skeleton;
  _OWORD *v50;
  __int128 v51;
  __int128 v52;
  NSObject *v53;
  NSObject *v54;
  NSObject *v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  NSObject *v60;
  NSObject *v61;
  uint64_t v62;
  IOSurface *mcamLeftYuvHighRes;
  NSObject *v64;
  uint64_t v65;
  IOSurface *mcamLeftYuvHighResUndistortionLut;
  NSObject *v67;
  NSObject *v68;
  uint64_t v69;
  __int128 v70;
  int v71;
  int v72;
  uint64_t v73;
  uint64_t v74;
  int v75;
  uint64_t v76;
  NSObject *v77;
  uint64_t v78;
  __int128 v79;
  int v80;
  int v81;
  uint64_t v82;
  uint64_t v83;
  int v84;
  uint64_t v85;
  NSObject *v86;
  uint64_t v87;
  __int128 v88;
  int v89;
  int v90;
  uint64_t v91;
  uint64_t v92;
  int v93;
  uint64_t v94;
  __int128 v95;
  __int128 v96;
  NSObject *v97;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  NSObject *v103;
  uint64_t v104;
  NSObject *v105;
  uint8_t buf[8];
  objc_super v107;
  _QWORD v108[6];
  _QWORD v109[3];

  v109[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v107.receiver = self;
  v107.super_class = (Class)VGCaptureData;
  v5 = -[VGCaptureData init](&v107, sel_init);
  if (v5)
  {
    v5->_yuvRectified = +[VGCoderUtilities decodePixelBufferForKey:decoder:](VGCoderUtilities, "decodePixelBufferForKey:decoder:", CFSTR("yuvRectified"), v4);
    v5->_depth = +[VGCoderUtilities decodePixelBufferForKey:decoder:](VGCoderUtilities, "decodePixelBufferForKey:decoder:", CFSTR("depth"), v4);
    v5->_mirrored = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("mirrored"));
    objc_msgSend(v4, "vg_decodeSurfaceForKey:", CFSTR("yuvHighRes"));
    v6 = objc_claimAutoreleasedReturnValue();
    yuvHighRes = v5->_yuvHighRes;
    v5->_yuvHighRes = (IOSurface *)v6;

    objc_msgSend(v4, "vg_decodeSurfaceForKey:", CFSTR("yuvHighResUndistortionLut"));
    v8 = objc_claimAutoreleasedReturnValue();
    yuvHighResUndistortionLut = v5->_yuvHighResUndistortionLut;
    v5->_yuvHighResUndistortionLut = (IOSurface *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("videoIntrinsics"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (!v10 || (unint64_t)objc_msgSend(v10, "length") <= 0x23)
    {
      __VGLogSharedInstance();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_249CAD000, v12, OS_LOG_TYPE_ERROR, " Unable to deserialize videoIntrinsics ", buf, 2u);
      }
      v13 = 0;
      goto LABEL_81;
    }
    +[VGCaptureData _dataToMatrix33:](VGCaptureData, "_dataToMatrix33:", v11);
    *(_DWORD *)&v5->_anon_d0[8] = v14;
    *(_QWORD *)v5->_anon_d0 = v15;
    *(_DWORD *)&v5->_anon_d0[24] = v16;
    *(_QWORD *)&v5->_anon_d0[16] = v17;
    *(_DWORD *)&v5->_anon_d0[40] = v18;
    *(_QWORD *)&v5->_anon_d0[32] = v19;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("videoIntrinsics"));
    v20 = objc_claimAutoreleasedReturnValue();
    v12 = v20;
    if (!v20 || (unint64_t)-[NSObject length](v20, "length") <= 0x23)
    {
      __VGLogSharedInstance();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_249CAD000, v21, OS_LOG_TYPE_ERROR, " Unable to deserialize depthIntrinsics ", buf, 2u);
      }
      v13 = 0;
      goto LABEL_80;
    }
    +[VGCaptureData _dataToMatrix33:](VGCaptureData, "_dataToMatrix33:", v12);
    *(_DWORD *)&v5->_anon_100[8] = v22;
    *(_QWORD *)v5->_anon_100 = v23;
    *(_DWORD *)&v5->_anon_100[24] = v24;
    *(_QWORD *)&v5->_anon_100[16] = v25;
    *(_DWORD *)&v5->_anon_100[40] = v26;
    *(_QWORD *)&v5->_anon_100[32] = v27;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("chromaticAdaptationMatrix"));
    v105 = objc_claimAutoreleasedReturnValue();
    if (v105 && (unint64_t)-[NSObject length](v105, "length") >= 0x24)
    {
      +[VGCaptureData _dataToMatrix33:](VGCaptureData, "_dataToMatrix33:", v105);
      *(_DWORD *)&v5->_anon_130[8] = v28;
      *(_DWORD *)&v5->_anon_130[24] = v29;
      *(_QWORD *)v5->_anon_130 = v30;
      *(_QWORD *)&v5->_anon_130[16] = v31;
      *(_DWORD *)&v5->_anon_130[40] = v32;
      *(_QWORD *)&v5->_anon_130[32] = v33;
    }
    else
    {
      v34 = MEMORY[0x24BDAEDF8];
      v35 = *(_OWORD *)(MEMORY[0x24BDAEDF8] + 16);
      *(_OWORD *)v5->_anon_130 = *MEMORY[0x24BDAEDF8];
      *(_OWORD *)&v5->_anon_130[16] = v35;
      *(_OWORD *)&v5->_anon_130[32] = *(_OWORD *)(v34 + 32);
    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("face"));
    v36 = objc_claimAutoreleasedReturnValue();
    face = v5->_face;
    v5->_face = (VGFaceMetadata *)v36;

    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("allFaces")))
    {
      v38 = (void *)MEMORY[0x24BDBCF20];
      v109[0] = objc_opt_class();
      v109[1] = objc_opt_class();
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v109, 2);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "setWithArray:", v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v40, CFSTR("allFaces"));
      v41 = objc_claimAutoreleasedReturnValue();
      allFaces = v5->_allFaces;
      v5->_allFaces = (NSArray *)v41;

    }
    v43 = (void *)MEMORY[0x24BDBCF20];
    v108[0] = objc_opt_class();
    v108[1] = objc_opt_class();
    v108[2] = objc_opt_class();
    v108[3] = objc_opt_class();
    v108[4] = objc_opt_class();
    v108[5] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v108, 6);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setWithArray:", v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v45, CFSTR("faceTrackingResult"));
    v46 = objc_claimAutoreleasedReturnValue();
    faceTrackingResult = v5->_faceTrackingResult;
    v5->_faceTrackingResult = (NSDictionary *)v46;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("skeleton"));
    v48 = objc_claimAutoreleasedReturnValue();
    skeleton = v5->_skeleton;
    v5->_skeleton = (VGSkeleton *)v48;

    v50 = (_OWORD *)MEMORY[0x24BDAEE00];
    v51 = *(_OWORD *)(MEMORY[0x24BDAEE00] + 16);
    *(_OWORD *)v5->_anon_1f0 = *MEMORY[0x24BDAEE00];
    *(_OWORD *)&v5->_anon_1f0[16] = v51;
    v52 = v50[3];
    *(_OWORD *)&v5->_anon_1f0[32] = v50[2];
    *(_OWORD *)&v5->_anon_1f0[48] = v52;
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("cameraToDeviceTransform")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cameraToDeviceTransform"));
      v53 = objc_claimAutoreleasedReturnValue();
      v54 = v53;
      if (!v53 || (unint64_t)-[NSObject length](v53, "length") <= 0x3F)
      {
        __VGLogSharedInstance();
        v55 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_249CAD000, v55, OS_LOG_TYPE_ERROR, " Unable to deserialize cameraToDeviceTransform ", buf, 2u);
        }
LABEL_78:

        v13 = 0;
LABEL_79:
        v21 = v105;
LABEL_80:

LABEL_81:
        goto LABEL_82;
      }
      +[VGCaptureData _dataToMatrix44:](VGCaptureData, "_dataToMatrix44:", v54);
      *(_OWORD *)v5->_anon_1f0 = v56;
      *(_OWORD *)&v5->_anon_1f0[16] = v57;
      *(_OWORD *)&v5->_anon_1f0[32] = v58;
      *(_OWORD *)&v5->_anon_1f0[48] = v59;
    }
    else
    {
      __VGLogSharedInstance();
      v54 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_249CAD000, v54, OS_LOG_TYPE_INFO, " VGCaptureData doesn't have cameraToDeviceTransform. Set to identity. ", buf, 2u);
      }
    }

    v5->_timestamp.value = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("timestampValue"));
    v5->_timestamp.epoch = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("timestampEpoch"));
    v5->_timestamp.timescale = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("timestampTimeScale"));
    v5->_timestamp.flags = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("timestampFlags"));
    if (+[VGCoderUtilities hasPixelBufferForKey:decoder:](VGCoderUtilities, "hasPixelBufferForKey:decoder:", CFSTR("mcamLeftColorYuv"), v4))
    {
      v5->_mcamLeftColorYuv = +[VGCoderUtilities decodePixelBufferForKey:decoder:](VGCoderUtilities, "decodePixelBufferForKey:decoder:", CFSTR("mcamLeftColorYuv"), v4);
    }
    else
    {
      __VGLogSharedInstance();
      v60 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_249CAD000, v60, OS_LOG_TYPE_INFO, " VGCaptureData doesn't have mcamLeftColorYuv. Set to nil. ", buf, 2u);
      }

    }
    if (+[VGCoderUtilities hasPixelBufferForKey:decoder:](VGCoderUtilities, "hasPixelBufferForKey:decoder:", CFSTR("mcamLeftDepth"), v4, v5->_anon_100))
    {
      v5->_mcamLeftDepth = +[VGCoderUtilities decodePixelBufferForKey:decoder:](VGCoderUtilities, "decodePixelBufferForKey:decoder:", CFSTR("mcamLeftDepth"), v4);
    }
    else
    {
      __VGLogSharedInstance();
      v61 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_249CAD000, v61, OS_LOG_TYPE_INFO, " VGCaptureData doesn't have mcamLeftDepth. Set to nil. ", buf, 2u);
      }

    }
    objc_msgSend(v4, "vg_decodeSurfaceForKey:", CFSTR("mcamLeftYuvHighRes"));
    v62 = objc_claimAutoreleasedReturnValue();
    mcamLeftYuvHighRes = v5->_mcamLeftYuvHighRes;
    v5->_mcamLeftYuvHighRes = (IOSurface *)v62;

    if (!v5->_mcamLeftYuvHighRes)
    {
      __VGLogSharedInstance();
      v64 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_249CAD000, v64, OS_LOG_TYPE_INFO, " VGCaptureData doesn't have mcamLeftYuvHighRes. Set to nil. ", buf, 2u);
      }

    }
    objc_msgSend(v4, "vg_decodeSurfaceForKey:", CFSTR("mcamLeftYuvHighResUndistortionLut"));
    v65 = objc_claimAutoreleasedReturnValue();
    mcamLeftYuvHighResUndistortionLut = v5->_mcamLeftYuvHighResUndistortionLut;
    v5->_mcamLeftYuvHighResUndistortionLut = (IOSurface *)v65;

    if (!v5->_mcamLeftYuvHighResUndistortionLut)
    {
      __VGLogSharedInstance();
      v67 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v67, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_249CAD000, v67, OS_LOG_TYPE_INFO, " VGCaptureData doesn't have mcamLeftYuvHighResUndistortionLut. Set to nil. ", buf, 2u);
      }

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("mcamLeftColorIntrinsics")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mcamLeftColorIntrinsics"));
      v68 = objc_claimAutoreleasedReturnValue();
      v54 = v68;
      if (!v68 || (unint64_t)-[NSObject length](v68, "length") <= 0x23)
      {
        __VGLogSharedInstance();
        v55 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_249CAD000, v55, OS_LOG_TYPE_ERROR, " Unable to deserialize mcamLeftColorIntrinsics ", buf, 2u);
        }
        goto LABEL_78;
      }
      +[VGCaptureData _dataToMatrix33:](VGCaptureData, "_dataToMatrix33:", v54);
      *(_DWORD *)(v104 + 104) = v71;
      *(_DWORD *)(v104 + 120) = v72;
      *(_QWORD *)(v104 + 96) = v73;
      *(_QWORD *)(v104 + 112) = v74;
      *(_DWORD *)(v104 + 136) = v75;
      *(_QWORD *)(v104 + 128) = v76;
    }
    else
    {
      v69 = MEMORY[0x24BDAEDF8];
      v70 = *(_OWORD *)(MEMORY[0x24BDAEDF8] + 16);
      *(_OWORD *)v5->_anon_160 = *MEMORY[0x24BDAEDF8];
      *(_OWORD *)&v5->_anon_160[16] = v70;
      *(_OWORD *)&v5->_anon_160[32] = *(_OWORD *)(v69 + 32);
      __VGLogSharedInstance();
      v54 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_249CAD000, v54, OS_LOG_TYPE_INFO, " VGCaptureData doesn't have mcamLeftColorIntrinsics. Set to identity. ", buf, 2u);
      }
    }

    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("mcamLeftDepthIntrinsics")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mcamLeftDepthIntrinsics"));
      v77 = objc_claimAutoreleasedReturnValue();
      v54 = v77;
      if (!v77 || (unint64_t)-[NSObject length](v77, "length") <= 0x23)
      {
        __VGLogSharedInstance();
        v55 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_249CAD000, v55, OS_LOG_TYPE_ERROR, " Unable to deserialize mcamLeftDepthIntrinsics ", buf, 2u);
        }
        goto LABEL_78;
      }
      +[VGCaptureData _dataToMatrix33:](VGCaptureData, "_dataToMatrix33:", v54);
      *(_DWORD *)(v104 + 152) = v80;
      *(_DWORD *)(v104 + 168) = v81;
      *(_QWORD *)(v104 + 144) = v82;
      *(_QWORD *)(v104 + 160) = v83;
      *(_DWORD *)(v104 + 184) = v84;
      *(_QWORD *)(v104 + 176) = v85;
    }
    else
    {
      v78 = MEMORY[0x24BDAEDF8];
      v79 = *(_OWORD *)(MEMORY[0x24BDAEDF8] + 16);
      *(_OWORD *)v5->_anon_190 = *MEMORY[0x24BDAEDF8];
      *(_OWORD *)&v5->_anon_190[16] = v79;
      *(_OWORD *)&v5->_anon_190[32] = *(_OWORD *)(v78 + 32);
      __VGLogSharedInstance();
      v54 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_249CAD000, v54, OS_LOG_TYPE_INFO, " VGCaptureData doesn't have mcamLeftDepthIntrinsics. Set to identity. ", buf, 2u);
      }
    }

    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("mcamLeftChromaticAdaptationMatrix")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mcamLeftChromaticAdaptationMatrix"));
      v86 = objc_claimAutoreleasedReturnValue();
      v54 = v86;
      if (!v86 || (unint64_t)-[NSObject length](v86, "length") <= 0x23)
      {
        __VGLogSharedInstance();
        v55 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_249CAD000, v55, OS_LOG_TYPE_ERROR, " Unable to deserialize mcamLeftChromaticAdaptationMatrix ", buf, 2u);
        }
        goto LABEL_78;
      }
      +[VGCaptureData _dataToMatrix33:](VGCaptureData, "_dataToMatrix33:", v54);
      *(_DWORD *)(v104 + 200) = v89;
      *(_DWORD *)(v104 + 216) = v90;
      *(_QWORD *)(v104 + 192) = v91;
      *(_QWORD *)(v104 + 208) = v92;
      *(_DWORD *)(v104 + 232) = v93;
      *(_QWORD *)(v104 + 224) = v94;
    }
    else
    {
      v87 = MEMORY[0x24BDAEDF8];
      v88 = *(_OWORD *)(MEMORY[0x24BDAEDF8] + 16);
      *(_OWORD *)v5->_anon_1c0 = *MEMORY[0x24BDAEDF8];
      *(_OWORD *)&v5->_anon_1c0[16] = v88;
      *(_OWORD *)&v5->_anon_1c0[32] = *(_OWORD *)(v87 + 32);
      __VGLogSharedInstance();
      v54 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_249CAD000, v54, OS_LOG_TYPE_INFO, " VGCaptureData doesn't have mcamLeftChromaticAdaptationMatrix. Set to identity. ", buf, 2u);
      }
    }

    v95 = v50[1];
    *(_OWORD *)&v5[1].super.isa = *v50;
    *(_OWORD *)&v5[1]._rgbRectified = v95;
    v96 = v50[3];
    *(_OWORD *)&v5[1]._mcamLeftColorYuvChromaticAdaptationReverted = v50[2];
    *(_OWORD *)&v5[1]._yuvHighResChromaticAdaptationReverted = v96;
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("mcamLeftToDeviceTransform")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mcamLeftToDeviceTransform"));
      v97 = objc_claimAutoreleasedReturnValue();
      v54 = v97;
      if (!v97 || (unint64_t)-[NSObject length](v97, "length") <= 0x3F)
      {
        __VGLogSharedInstance();
        v55 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_249CAD000, v55, OS_LOG_TYPE_ERROR, " Unable to deserialize mcamLeftToDeviceTransform ", buf, 2u);
        }
        goto LABEL_78;
      }
      +[VGCaptureData _dataToMatrix44:](VGCaptureData, "_dataToMatrix44:", v54);
      *(_OWORD *)&v5[1].super.isa = v99;
      *(_OWORD *)&v5[1]._rgbRectified = v100;
      *(_OWORD *)&v5[1]._mcamLeftColorYuvChromaticAdaptationReverted = v101;
      *(_OWORD *)&v5[1]._yuvHighResChromaticAdaptationReverted = v102;
    }
    else
    {
      __VGLogSharedInstance();
      v54 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_249CAD000, v54, OS_LOG_TYPE_INFO, " VGCaptureData doesn't have mcamLeftToDeviceTransform. Set to identity. ", buf, 2u);
      }
    }

    v5->_enrollmentPhase = 0;
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("enrollmentPhase")))
    {
      v5->_enrollmentPhase = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("enrollmentPhase"));
    }
    else
    {
      __VGLogSharedInstance();
      v103 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v103, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_249CAD000, v103, OS_LOG_TYPE_INFO, " VGCaptureData doesn't have enrollmentPhase. Set to VGEnrollmentPhaseNone ", buf, 2u);
      }

    }
    v13 = v5;
    goto LABEL_79;
  }
  v13 = 0;
LABEL_82:

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unsigned __int8 *v5;
  uint32x4_t v6;
  uint32x4_t v7;
  uint32x4_t v8;
  BOOL v9;
  VGFaceMetadata *face;
  NSArray *allFaces;
  VGSkeleton *skeleton;
  uint32x4_t v14;
  uint32x4_t v15;
  uint32x4_t v16;
  CMTime v17;
  CMTime time1;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (unsigned __int8 *)v4;
    if (!checkEqualPixelBuffers(self->_yuvRectified, *((__CVBuffer **)v5 + 9)))
      goto LABEL_10;
    if (!checkEqualPixelBuffers(self->_depth, *((__CVBuffer **)v5 + 10)))
      goto LABEL_10;
    if (self->_mirrored != v5[8])
      goto LABEL_10;
    if (!checkEqualSurfaces(self->_yuvHighRes, *((IOSurface **)v5 + 11)))
      goto LABEL_10;
    if (!checkEqualSurfaces(self->_yuvHighResUndistortionLut, *((IOSurface **)v5 + 12)))
      goto LABEL_10;
    v6 = (uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f32(*(float32x4_t *)&self->_anon_d0[16], *((float32x4_t *)v5 + 14)), (int8x16_t)vceqq_f32(*(float32x4_t *)self->_anon_d0, *((float32x4_t *)v5 + 13))), (int8x16_t)vceqq_f32(*(float32x4_t *)&self->_anon_d0[32], *((float32x4_t *)v5 + 15)));
    v6.i32[3] = v6.i32[2];
    if ((vminvq_u32(v6) & 0x80000000) == 0)
      goto LABEL_10;
    v7 = (uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f32(*(float32x4_t *)&self->_anon_100[16], *((float32x4_t *)v5 + 17)), (int8x16_t)vceqq_f32(*(float32x4_t *)self->_anon_100, *((float32x4_t *)v5 + 16))), (int8x16_t)vceqq_f32(*(float32x4_t *)&self->_anon_100[32], *((float32x4_t *)v5 + 18)));
    v7.i32[3] = v7.i32[2];
    if ((vminvq_u32(v7) & 0x80000000) == 0)
      goto LABEL_10;
    v8 = (uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f32(*(float32x4_t *)&self->_anon_130[16], *((float32x4_t *)v5 + 20)), (int8x16_t)vceqq_f32(*(float32x4_t *)self->_anon_130, *((float32x4_t *)v5 + 19))), (int8x16_t)vceqq_f32(*(float32x4_t *)&self->_anon_130[32], *((float32x4_t *)v5 + 21)));
    v8.i32[3] = v8.i32[2];
    if ((vminvq_u32(v8) & 0x80000000) == 0)
      goto LABEL_10;
    face = self->_face;
    if ((unint64_t)face | *((_QWORD *)v5 + 13))
    {
      if (!-[VGFaceMetadata isEqual:](face, "isEqual:"))
        goto LABEL_10;
    }
    allFaces = self->_allFaces;
    if ((unint64_t)allFaces | *((_QWORD *)v5 + 14) && !-[NSArray isEqualToArray:](allFaces, "isEqualToArray:"))
      goto LABEL_10;
    skeleton = self->_skeleton;
    if ((unint64_t)skeleton | *((_QWORD *)v5 + 16) && !-[VGSkeleton isEqual:](skeleton, "isEqual:"))
      goto LABEL_10;
    if ((vminvq_u32((uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f32(*(float32x4_t *)&self->_anon_1f0[16], *((float32x4_t *)v5 + 32)), (int8x16_t)vceqq_f32(*(float32x4_t *)self->_anon_1f0, *((float32x4_t *)v5 + 31))), vandq_s8((int8x16_t)vceqq_f32(*(float32x4_t *)&self->_anon_1f0[32], *((float32x4_t *)v5 + 33)), (int8x16_t)vceqq_f32(*(float32x4_t *)&self->_anon_1f0[48], *((float32x4_t *)v5 + 34))))) & 0x80000000) == 0)goto LABEL_10;
    time1 = (CMTime)self->_timestamp;
    v17 = *(CMTime *)(v5 + 176);
    if (CMTimeCompare(&time1, &v17))
      goto LABEL_10;
    if (checkEqualPixelBuffers(self->_mcamLeftColorYuv, *((__CVBuffer **)v5 + 17))
      && checkEqualPixelBuffers(self->_mcamLeftDepth, *((__CVBuffer **)v5 + 18))
      && checkEqualSurfaces(self->_mcamLeftYuvHighRes, *((IOSurface **)v5 + 19))
      && checkEqualSurfaces(self->_mcamLeftYuvHighResUndistortionLut, *((IOSurface **)v5 + 20))
      && (v14 = (uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f32(*(float32x4_t *)&self->_anon_160[16], *((float32x4_t *)v5 + 23)), (int8x16_t)vceqq_f32(*(float32x4_t *)self->_anon_160, *((float32x4_t *)v5 + 22))), (int8x16_t)vceqq_f32(*(float32x4_t *)&self->_anon_160[32], *((float32x4_t *)v5 + 24))), v14.i32[3] = v14.i32[2], (vminvq_u32(v14) & 0x80000000) != 0)&& (v15 = (uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f32(*(float32x4_t *)&self->_anon_190[16], *((float32x4_t *)v5 + 26)), (int8x16_t)vceqq_f32(*(float32x4_t *)self->_anon_190, *((float32x4_t *)v5 + 25))), (int8x16_t)vceqq_f32(*(float32x4_t *)&self->_anon_190[32], *((float32x4_t *)v5 + 27))), v15.i32[3] = v15.i32[2], (vminvq_u32(v15) & 0x80000000) != 0)&& (v16 = (uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f32(*(float32x4_t *)&self->_anon_1c0[16], *((float32x4_t *)v5 + 29)), (int8x16_t)vceqq_f32(*(float32x4_t *)self->_anon_1c0, *((float32x4_t *)v5 + 28))), (int8x16_t)vceqq_f32(*(float32x4_t *)&self->_anon_1c0[32], *((float32x4_t *)v5 + 30))), v16.i32[3] = v16.i32[2],
          (vminvq_u32(v16) & 0x80000000) != 0)
      && (vminvq_u32((uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f32(*(float32x4_t *)&self[1]._rgbRectified, *((float32x4_t *)v5 + 36)), (int8x16_t)vceqq_f32(*(float32x4_t *)&self[1].super.isa, *((float32x4_t *)v5 + 35))), vandq_s8((int8x16_t)vceqq_f32(*(float32x4_t *)&self[1]._mcamLeftColorYuvChromaticAdaptationReverted, *((float32x4_t *)v5 + 37)), (int8x16_t)vceqq_f32(*(float32x4_t *)&self[1]._yuvHighResChromaticAdaptationReverted, *((float32x4_t *)v5 + 38))))) & 0x80000000) != 0)
    {
      v9 = self->_enrollmentPhase == *((_QWORD *)v5 + 21);
    }
    else
    {
LABEL_10:
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (__CVBuffer)yuvRectified
{
  return self->_yuvRectified;
}

- (__CVBuffer)depth
{
  return self->_depth;
}

- (BOOL)mirrored
{
  return self->_mirrored;
}

- (void)setMirrored:(BOOL)a3
{
  self->_mirrored = a3;
}

- (IOSurface)yuvHighRes
{
  return self->_yuvHighRes;
}

- (void)setYuvHighRes:(id)a3
{
  objc_storeStrong((id *)&self->_yuvHighRes, a3);
}

- (IOSurface)yuvHighResUndistortionLut
{
  return self->_yuvHighResUndistortionLut;
}

- (void)setYuvHighResUndistortionLut:(id)a3
{
  objc_storeStrong((id *)&self->_yuvHighResUndistortionLut, a3);
}

- (__n128)videoIntrinsics
{
  return a1[13];
}

- (__n128)setVideoIntrinsics:(__n128)a3
{
  result[13] = a2;
  result[14] = a3;
  result[15] = a4;
  return result;
}

- (__n128)depthIntrinsics
{
  return a1[16];
}

- (__n128)setDepthIntrinsics:(__n128)a3
{
  result[16] = a2;
  result[17] = a3;
  result[18] = a4;
  return result;
}

- (__n128)chromaticAdaptationMatrix
{
  return a1[19];
}

- (__n128)setChromaticAdaptationMatrix:(__n128)a3
{
  result[19] = a2;
  result[20] = a3;
  result[21] = a4;
  return result;
}

- (VGFaceMetadata)face
{
  return self->_face;
}

- (void)setFace:(id)a3
{
  objc_storeStrong((id *)&self->_face, a3);
}

- (NSArray)allFaces
{
  return self->_allFaces;
}

- (void)setAllFaces:(id)a3
{
  objc_storeStrong((id *)&self->_allFaces, a3);
}

- (NSDictionary)faceTrackingResult
{
  return self->_faceTrackingResult;
}

- (void)setFaceTrackingResult:(id)a3
{
  objc_storeStrong((id *)&self->_faceTrackingResult, a3);
}

- (VGSkeleton)skeleton
{
  return self->_skeleton;
}

- (void)setSkeleton:(id)a3
{
  objc_storeStrong((id *)&self->_skeleton, a3);
}

- (__n128)cameraToDeviceTransform
{
  return a1[31];
}

- (__n128)setCameraToDeviceTransform:(__n128)a3
{
  result[31] = a2;
  result[32] = a3;
  result[33] = a4;
  result[34] = a5;
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timestamp
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 176);
  return self;
}

- (void)setTimestamp:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_timestamp.epoch = a3->var3;
  *(_OWORD *)&self->_timestamp.value = v3;
}

- (__CVBuffer)mcamLeftColorYuv
{
  return self->_mcamLeftColorYuv;
}

- (__CVBuffer)mcamLeftDepth
{
  return self->_mcamLeftDepth;
}

- (IOSurface)mcamLeftYuvHighRes
{
  return self->_mcamLeftYuvHighRes;
}

- (void)setMcamLeftYuvHighRes:(id)a3
{
  objc_storeStrong((id *)&self->_mcamLeftYuvHighRes, a3);
}

- (IOSurface)mcamLeftYuvHighResUndistortionLut
{
  return self->_mcamLeftYuvHighResUndistortionLut;
}

- (void)setMcamLeftYuvHighResUndistortionLut:(id)a3
{
  objc_storeStrong((id *)&self->_mcamLeftYuvHighResUndistortionLut, a3);
}

- (__n128)mcamLeftColorIntrinsics
{
  return a1[22];
}

- (__n128)setMcamLeftColorIntrinsics:(__n128)a3
{
  result[22] = a2;
  result[23] = a3;
  result[24] = a4;
  return result;
}

- (__n128)mcamLeftDepthIntrinsics
{
  return a1[25];
}

- (__n128)setMcamLeftDepthIntrinsics:(__n128)a3
{
  result[25] = a2;
  result[26] = a3;
  result[27] = a4;
  return result;
}

- (__n128)mcamLeftChromaticAdaptationMatrix
{
  return a1[28];
}

- (__n128)setMcamLeftChromaticAdaptationMatrix:(__n128)a3
{
  result[28] = a2;
  result[29] = a3;
  result[30] = a4;
  return result;
}

- (__n128)mcamLeftToDeviceTransform
{
  return a1[35];
}

- (__n128)setMcamLeftToDeviceTransform:(__n128)a3
{
  result[35] = a2;
  result[36] = a3;
  result[37] = a4;
  result[38] = a5;
  return result;
}

- (unint64_t)enrollmentPhase
{
  return self->_enrollmentPhase;
}

- (void)setEnrollmentPhase:(unint64_t)a3
{
  self->_enrollmentPhase = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mcamLeftYuvHighResUndistortionLut, 0);
  objc_storeStrong((id *)&self->_mcamLeftYuvHighRes, 0);
  objc_storeStrong((id *)&self->_skeleton, 0);
  objc_storeStrong((id *)&self->_faceTrackingResult, 0);
  objc_storeStrong((id *)&self->_allFaces, 0);
  objc_storeStrong((id *)&self->_face, 0);
  objc_storeStrong((id *)&self->_yuvHighResUndistortionLut, 0);
  objc_storeStrong((id *)&self->_yuvHighRes, 0);
  objc_storeStrong((id *)&self->_mcamLeftFaceMetadata, 0);
  objc_storeStrong((id *)&self->_mcamLeftYuvHighResChromaticAdaptationReverted, 0);
  objc_storeStrong((id *)&self->_yuvHighResChromaticAdaptationReverted, 0);
}

@end
