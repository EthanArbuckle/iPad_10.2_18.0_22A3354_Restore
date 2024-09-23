@implementation PIVideoReframeMetadataExtractor

- (PIVideoReframeMetadataExtractor)init
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("init is not a valid initializer"), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (PIVideoReframeMetadataExtractor)initWithAVAsset:(id)a3
{
  id v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  AVAssetTrack *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  PIVideoReframeMetadataExtractor *v19;
  NSObject *v20;
  const char *v21;
  NSObject *v22;
  uint32_t v23;
  NSObject *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  id v30;
  objc_super v31;
  uint8_t v32[128];
  uint8_t buf[4];
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v31.receiver = self;
  v31.super_class = (Class)PIVideoReframeMetadataExtractor;
  v6 = -[PIVideoReframeMetadataExtractor init](&v31, sel_init);
  objc_storeStrong((id *)v6 + 1, a3);
  v7 = *((_QWORD *)v6 + 1);
  v30 = 0;
  objc_msgSend(MEMORY[0x1E0D52348], "firstEnabledVideoTrackInAsset:error:", v7, &v30);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v30;
  v10 = (void *)*((_QWORD *)v6 + 2);
  *((_QWORD *)v6 + 2) = v8;

  if (!*((_QWORD *)v6 + 2))
  {
    if (*MEMORY[0x1E0D52390] != -1)
      dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_19505);
    v20 = *MEMORY[0x1E0D52398];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_ERROR))
      goto LABEL_29;
    *(_DWORD *)buf = 138412290;
    v34 = v9;
    v21 = "Can't find enabled video track in asset: %@";
    v22 = v20;
    v23 = 12;
    goto LABEL_28;
  }
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  objc_msgSend(v5, "tracks");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v27;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v27 != v13)
          objc_enumerationMutation(v11);
        v15 = *(AVAssetTrack **)(*((_QWORD *)&v26 + 1) + 8 * i);
        if (isLivePhotoMetadataTrack(v15))
        {
          objc_storeStrong((id *)v6 + 3, v15);
          goto LABEL_12;
        }
      }
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
      if (v12)
        continue;
      break;
    }
  }
LABEL_12:

  if (!*((_QWORD *)v6 + 3))
  {
    if (*MEMORY[0x1E0D52390] != -1)
      dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_19505);
    v24 = *MEMORY[0x1E0D52398];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_ERROR))
      goto LABEL_29;
    *(_WORD *)buf = 0;
    v21 = "Asset does not contain Live Photo metadata track";
LABEL_27:
    v22 = v24;
    v23 = 2;
LABEL_28:
    _os_log_error_impl(&dword_1A6382000, v22, OS_LOG_TYPE_ERROR, v21, buf, v23);
LABEL_29:
    v19 = 0;
    goto LABEL_30;
  }
  *((_QWORD *)v6 + 5) = 0;
  *((_QWORD *)v6 + 6) = 0;
  *((_QWORD *)v6 + 4) = 0x3FF0000000000000;
  *(_OWORD *)(v6 + 56) = xmmword_1A64DDEE0;
  *((_QWORD *)v6 + 9) = 0x3FF0000000000000;
  objc_msgSend(MEMORY[0x1E0D52348], "encodedPixelSizeOfTrack:oriented:", *((_QWORD *)v6 + 2), 0);
  *((_QWORD *)v6 + 11) = 0;
  *((_QWORD *)v6 + 12) = 0;
  *((_QWORD *)v6 + 10) = 0x3FF0000000000000;
  *(_OWORD *)(v6 + 104) = xmmword_1A64DDEE0;
  *((double *)v6 + 15) = (double)v16;
  objc_msgSend(v6, "extractMetadata");
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)*((_QWORD *)v6 + 16);
  *((_QWORD *)v6 + 16) = v17;

  if (!objc_msgSend(*((id *)v6 + 16), "count"))
  {
    if (*MEMORY[0x1E0D52390] != -1)
      dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_19505);
    v24 = *MEMORY[0x1E0D52398];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_ERROR))
      goto LABEL_29;
    *(_WORD *)buf = 0;
    v21 = "Track does not contain V3 metadata";
    goto LABEL_27;
  }
  v19 = v6;
LABEL_30:

  return v19;
}

- (CGVector)centerMotionVectorFromMetadata:(const FigLivePhotoMetadata *)a3
{
  float64x2_t v3;
  double v4;
  CGVector result;

  if (a3->var0)
  {
    v3 = vsubq_f64(vaddq_f64(*(float64x2_t *)&self->pxlMetadataTransform.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&self->pxlMetadataTransform.c, *((float *)&a3->var1.var1 + 1)), *(float64x2_t *)&self->pxlMetadataTransform.a, *(float *)&a3->var1.var1)), vaddq_f64(*(float64x2_t *)&self->pxlMetadataTransform.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&self->pxlMetadataTransform.c, *(double *)(MEMORY[0x1E0C9D538] + 8)), *(float64x2_t *)&self->pxlMetadataTransform.a, *MEMORY[0x1E0C9D538])));
    v4 = v3.f64[1];
  }
  else
  {
    v3.f64[0] = 0.0;
    v4 = 0.0;
  }
  result.dx = v3.f64[0];
  result.dy = v4;
  return result;
}

- (CGVector)motionBlurVectorFromMetadata:(const FigLivePhotoMetadata *)a3
{
  float64x2_t v3;
  double v4;
  CGVector result;

  if (!a3->var0)
    __assert_rtn("-[PIVideoReframeMetadataExtractor motionBlurVectorFromMetadata:]", "PIVideoReframeMetadataExtractor.mm", 248, "v1");
  v3 = vsubq_f64(vaddq_f64(*(float64x2_t *)&self->pxlMetadataTransform.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&self->pxlMetadataTransform.c, a3->var1.var3), *(float64x2_t *)&self->pxlMetadataTransform.a, a3->var1.var2)), vaddq_f64(*(float64x2_t *)&self->pxlMetadataTransform.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&self->pxlMetadataTransform.c, *(double *)(MEMORY[0x1E0C9D538] + 8)), *(float64x2_t *)&self->pxlMetadataTransform.a, *MEMORY[0x1E0C9D538])));
  v4 = v3.f64[1];
  result.dx = v3.f64[0];
  result.dy = v4;
  return result;
}

- (double)trajectoryeHomographyFromMetadata:(double)a3 containsV3Metadata:(int32x4_t)a4
{
  int32x4_t *v8;
  uint64_t i64;
  _QWORD *v10;
  __int16 v11;
  double result;
  int32x4_t v13;

  if (*a7 >= 3u
    && (v8 = (int32x4_t *)&a7[8 * a7[11]],
        i64 = (uint64_t)v8[2 * vaddvq_s32(v8[3]) + 3].i64,
        v11 = *(_WORD *)(i64 + 16),
        v10 = (_QWORD *)(i64 + 16),
        (v11 & 1) != 0))
  {
    *a8 = 1;
    v13.i64[0] = *(_QWORD *)((char *)v10 + 4);
    a4.i64[0] = *(_QWORD *)((char *)v10 + 28);
    v13.i64[1] = v10[2];
    *(_QWORD *)&result = vuzp1q_s32(v13, a4).u64[0];
  }
  else
  {
    *a8 = 0;
    *(_QWORD *)&result = 1065353216;
  }
  return result;
}

- (id)extractMetadata
{
  AVAsset *asset;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  char v19;
  id v20;
  void *v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  id v26;
  void *v27;
  int v28;
  PIVideoReframeTimedMetadata *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  NSObject *v34;
  id v35;
  NSObject *v36;
  NSObject *v37;
  int v39;
  uint64_t v40;
  const char *v41;
  id v42;
  id v43;
  uint64_t v44;
  void *v45;
  id v46;
  id v47;
  id v48;
  char v49;
  __int128 v50;
  uint64_t v51;
  __int128 v52;
  uint64_t v53;
  int v54;
  id v55;
  uint8_t buf[16];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v45 = (void *)MEMORY[0x1A85BFFB8](self, a2);
  asset = self->_asset;
  v55 = 0;
  objc_msgSend(MEMORY[0x1E0C8AFD0], "assetReaderWithAsset:error:", asset, &v55);
  v47 = (id)objc_claimAutoreleasedReturnValue();
  v46 = v55;
  if (v46)
  {
    if (*MEMORY[0x1E0D52390] != -1)
      dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_19505);
    v4 = *MEMORY[0x1E0D52398];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v46;
      _os_log_error_impl(&dword_1A6382000, v4, OS_LOG_TYPE_ERROR, "Error creating asset reader: %@", buf, 0xCu);
    }
    v5 = 0;
  }
  else
  {
    v42 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C8B000]), "initWithTrack:outputSettings:", self->_mdataTrack, 0);
    if ((objc_msgSend(v47, "canAddOutput:") & 1) != 0)
    {
      objc_msgSend(v47, "addOutput:", v42);
      v48 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C8AFF0]), "initWithAssetReaderTrackOutput:", v42);
      if ((objc_msgSend(v47, "startReading") & 1) != 0)
      {
        v43 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 64);
        if (*MEMORY[0x1E0D52390] != -1)
          dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_19505);
        v6 = *MEMORY[0x1E0D52398];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A6382000, v6, OS_LOG_TYPE_DEFAULT, "Starting metadata extraction", buf, 2u);
        }
        v44 = *MEMORY[0x1E0D053E0];
        v7 = *MEMORY[0x1E0D053A8];
        v8 = 0.0;
        v41 = "0 && \"unexpected metadata identifier\";
        v9 = 0.0;
        do
        {
          v10 = (void *)MEMORY[0x1A85BFFB8]();
          objc_msgSend(v48, "nextTimedMetadataGroup");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = v11;
          if (v11)
          {
            objc_msgSend(v11, "items");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v13, "count") != 1)
              __assert_rtn("-[PIVideoReframeMetadataExtractor extractMetadata]", "PIVideoReframeMetadataExtractor.mm", 330, "mdataGroup.items.count == 1");

            objc_msgSend(v12, "items");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "firstObject");
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v15, "identifier");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v16, "isEqualToString:", v44);

            if ((v17 & 1) == 0)
            {
              v39 = 335;
              goto LABEL_50;
            }
            objc_msgSend(v15, "dataType");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v18, "isEqualToString:", v7);

            if ((v19 & 1) == 0)
            {
              v39 = 338;
              v41 = "0 && \"unexpected metadata data type\";
LABEL_50:
              __assert_rtn("-[PIVideoReframeMetadataExtractor extractMetadata]", "PIVideoReframeMetadataExtractor.mm", v39, v41);
            }
            v54 = 0;
            *(_QWORD *)buf = 0;
            objc_msgSend(v15, "dataValue");
            v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            objc_msgSend(v20, "bytes");
            objc_msgSend(v15, "dataValue");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "length");
            v22 = FigLivePhotoMetadataComputeDeserializationSize();

            if (v22)
              __assert_rtn("-[PIVideoReframeMetadataExtractor extractMetadata]", "PIVideoReframeMetadataExtractor.mm", 347, "err == noErr");
            MEMORY[0x1E0C80A78](v23);
            v25 = (char *)&v40 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
            objc_msgSend(v15, "dataValue");
            v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            objc_msgSend(v26, "bytes");
            objc_msgSend(v15, "dataValue");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "length");
            v28 = FigLivePhotoMetadataDeserializeIntoBuffer();

            if (v28)
              __assert_rtn("-[PIVideoReframeMetadataExtractor extractMetadata]", "PIVideoReframeMetadataExtractor.mm", 354, "err == noErr");
            v29 = objc_alloc_init(PIVideoReframeTimedMetadata);
            if (v15)
            {
              objc_msgSend(v15, "time");
            }
            else
            {
              v52 = 0uLL;
              v53 = 0;
            }
            v50 = v52;
            v51 = v53;
            -[PIVideoReframeTimedMetadata setTime:](v29, "setTime:", &v50);
            -[PIVideoReframeMetadataExtractor centerMotionVectorFromMetadata:](self, "centerMotionVectorFromMetadata:", v25);
            v31 = v30;
            v33 = v32;
            -[PIVideoReframeTimedMetadata setEstimatedCenterMotion:](v29, "setEstimatedCenterMotion:", v30 - v9, v32 - v8);
            -[PIVideoReframeMetadataExtractor motionBlurVectorFromMetadata:](self, "motionBlurVectorFromMetadata:", v25);
            -[PIVideoReframeTimedMetadata setEstimatedMotionBlur:](v29, "setEstimatedMotionBlur:");
            v49 = 0;
            -[PIVideoReframeMetadataExtractor trajectoryeHomographyFromMetadata:containsV3Metadata:](self, "trajectoryeHomographyFromMetadata:containsV3Metadata:", v25, &v49);
            -[PIVideoReframeTimedMetadata setTrajectoryHomography:](v29, "setTrajectoryHomography:");
            if (v49)
              objc_msgSend(v43, "addObject:", v29);

            v8 = v33;
            v9 = v31;
          }

          objc_autoreleasePoolPop(v10);
        }
        while (v12);
        if (*MEMORY[0x1E0D52390] != -1)
          dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_19505);
        v34 = *MEMORY[0x1E0D52398];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A6382000, v34, OS_LOG_TYPE_DEFAULT, "Finished metadata extraction", buf, 2u);
        }
        v35 = v43;
        v5 = (void *)objc_msgSend(v43, "copy");

      }
      else
      {
        if (*MEMORY[0x1E0D52390] != -1)
          dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_19505);
        v37 = *MEMORY[0x1E0D52398];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1A6382000, v37, OS_LOG_TYPE_ERROR, "Failed to start reading asset", buf, 2u);
        }
        v5 = 0;
      }

    }
    else
    {
      if (*MEMORY[0x1E0D52390] != -1)
        dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_19505);
      v36 = *MEMORY[0x1E0D52398];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1A6382000, v36, OS_LOG_TYPE_ERROR, "Can't add metadata output for asset", buf, 2u);
      }
      v5 = 0;
    }

  }
  objc_autoreleasePoolPop(v45);
  return v5;
}

- (NSArray)timedMetadataArray
{
  return self->timedMetadataArray;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->timedMetadataArray, 0);
  objc_storeStrong((id *)&self->_mdataTrack, 0);
  objc_storeStrong((id *)&self->_videoTrack, 0);
  objc_storeStrong((id *)&self->_asset, 0);
}

+ (BOOL)canProvideMetadataForAVAsset:(id)a3
{
  id v3;
  PIVideoReframeMetadataExtractor *v4;
  void *v5;
  BOOL v6;

  v3 = a3;
  v4 = -[PIVideoReframeMetadataExtractor initWithAVAsset:]([PIVideoReframeMetadataExtractor alloc], "initWithAVAsset:", v3);
  -[PIVideoReframeMetadataExtractor timedMetadataArray](v4, "timedMetadataArray");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5 != 0;

  return v6;
}

@end
