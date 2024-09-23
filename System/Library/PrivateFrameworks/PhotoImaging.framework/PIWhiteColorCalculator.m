@implementation PIWhiteColorCalculator

uint64_t __50___PIWhiteColorCalculator__submitGERenderRequest___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __50___PIWhiteColorCalculator__submitGERenderRequest___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(a2, "filterNode:input:settings:", CFSTR("CIEdges"), a4, &unk_1E5058F80);
}

uint64_t __50___PIWhiteColorCalculator__submitGWRenderRequest___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __51___PIWhiteColorCalculator__computeGreenPercentage___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __125___PIWhiteColorCalculator__whitePointColorFromGrayEdgesImage_grayWorldImage_greenChannelPercentage_RAWCameraSpaceProperties___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  __int128 v8;
  _QWORD v9[5];
  id v10;
  __int128 v11;
  uint64_t v12;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __125___PIWhiteColorCalculator__whitePointColorFromGrayEdgesImage_grayWorldImage_greenChannelPercentage_RAWCameraSpaceProperties___block_invoke_2;
  v9[3] = &unk_1E50163E0;
  v12 = *(_QWORD *)(a1 + 64);
  v8 = *(_OWORD *)(a1 + 48);
  v9[4] = v4;
  v10 = v3;
  v6 = (id)v8;
  v11 = v8;
  v7 = v3;
  objc_msgSend(v4, "readBufferFromImage:withRGBAfBufferBlock:", v5, v9);

}

__n128 __125___PIWhiteColorCalculator__whitePointColorFromGrayEdgesImage_grayWorldImage_greenChannelPercentage_RAWCameraSpaceProperties___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  __n128 result;
  __int128 v5;
  __n128 v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;

  objc_msgSend(*(id *)(a1 + 32), "_computeWhitePointColorWithGrayEdgesBuffer:grayWorldBuffer:greenChannelPercentage:RAWCameraSpaceProperties:", *(_QWORD *)(a1 + 40), a2, *(_QWORD *)(a1 + 48), *(double *)(a1 + 64));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  *(_OWORD *)(v3 + 64) = v7;
  *(_OWORD *)(v3 + 80) = v8;
  *(_QWORD *)(v3 + 96) = v9;
  result = v6;
  *(_OWORD *)(v3 + 32) = v5;
  *(__n128 *)(v3 + 48) = v6;
  return result;
}

void __67___PIWhiteColorCalculator_calculateColorWithProperties_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  const CGFloat *Components;
  CGFloat v8;
  double v9;
  id obj;

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = *(id *)(v3 + 40);
  objc_msgSend(a2, "result:", &obj);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v3 + 40), obj);
  objc_msgSend(v4, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("color"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    Components = CGColorGetComponents((CGColorRef)v6);
    v8 = (*Components + Components[1] + Components[2]) * 0.25;
    objc_msgSend(*(id *)(a1 + 32), "doubleValue");
    if (v9 * v8 > 0.660000026)
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0x3FE3333340000000;
  }

}

void __67___PIWhiteColorCalculator_calculateColorWithProperties_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id obj;

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = *(id *)(v3 + 40);
  objc_msgSend(a2, "result:", &obj);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v3 + 40), obj);
  objc_msgSend(v4, "image");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

void __67___PIWhiteColorCalculator_calculateColorWithProperties_completion___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id obj;

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = *(id *)(v3 + 40);
  objc_msgSend(a2, "result:", &obj);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v3 + 40), obj);
  objc_msgSend(v4, "image");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

void __67___PIWhiteColorCalculator_calculateColorWithProperties_completion___block_invoke_4(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  const __CFString *v11;
  _OWORD v12[4];
  uint64_t v13;
  uint8_t buf[32];
  __int128 v15;
  __int128 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D522A0]), "initWithError:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
  }
  else
  {
    if (*MEMORY[0x1E0D52390] != -1)
      dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_253);
    v3 = *MEMORY[0x1E0D52398];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_DEBUG))
    {
      v9 = *(_QWORD *)(a1 + 32);
      v10 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
      if (*(_BYTE *)(a1 + 96))
        v11 = CFSTR("YES");
      else
        v11 = CFSTR("NO");
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v9;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v10;
      *(_WORD *)&buf[22] = 2112;
      *(_QWORD *)&buf[24] = v11;
      _os_log_debug_impl(&dword_1A6382000, v3, OS_LOG_TYPE_DEBUG, "Brightness is %@, greenChannelPercentage is %f, Sushi: %@", buf, 0x20u);
    }
    if (*(_BYTE *)(a1 + 96))
    {
      objc_msgSend(*(id *)(a1 + 40), "rawProperties");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "rawCameraSpaceProperties");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v5 = 0;
    }
    v17 = 0;
    v15 = 0u;
    v16 = 0u;
    memset(buf, 0, sizeof(buf));
    v6 = *(void **)(a1 + 48);
    if (v6)
      objc_msgSend(v6, "_whitePointColorFromGrayEdgesImage:grayWorldImage:greenChannelPercentage:RAWCameraSpaceProperties:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), v5, *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24));
    objc_msgSend(*(id *)(a1 + 32), "doubleValue");
    v17 = v7;
    v12[2] = v15;
    v12[3] = v16;
    v13 = v7;
    v12[0] = *(_OWORD *)buf;
    v12[1] = *(_OWORD *)&buf[16];
    objc_msgSend(MEMORY[0x1E0CB3B18], "pi_valueWithGrayColorResult:", v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D522A0]), "initWithResult:", v8);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

void __68___PIWhiteColorCalculator_readBufferFromImage_withRGBAfBufferBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  _QWORD *v24;
  __int128 v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD v31[5];
  id v32;

  v3 = a2;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x3032000000;
  v31[3] = __Block_byref_object_copy__5351;
  v31[4] = __Block_byref_object_dispose__5352;
  v32 = 0;
  objc_msgSend(v3, "buffer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "size");
  v7 = v6;

  objc_msgSend(MEMORY[0x1E0D520B0], "sharedFactory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bufferFactory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "buffer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "size");
  v13 = v12;
  objc_msgSend(MEMORY[0x1E0D52220], "RGBAf");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v9, "newStorageWithSize:format:", v11, v13, v14);

  v16 = (__int128 *)MEMORY[0x1E0D51ED0];
  v28 = *MEMORY[0x1E0D51ED0];
  v29 = v5;
  v30 = v7;
  objc_msgSend(MEMORY[0x1E0D52240], "regionWithRect:", &v28);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __68___PIWhiteColorCalculator_readBufferFromImage_withRGBAfBufferBlock___block_invoke_2;
  v21[3] = &unk_1E5016340;
  v18 = v3;
  v25 = *v16;
  v26 = v5;
  v27 = v7;
  v22 = v18;
  v24 = v31;
  v23 = *(id *)(a1 + 32);
  objc_msgSend(v15, "writeBufferInRegion:block:", v17, v21);

  objc_msgSend(MEMORY[0x1E0D520B0], "sharedFactory");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "bufferFactory");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "returnStorage:", v15);

  _Block_object_dispose(v31, 8);
}

void __68___PIWhiteColorCalculator_readBufferFromImage_withRGBAfBufferBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  vImagePixelCount v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  vImage_Buffer v12;
  vImage_Buffer src;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "buffer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "bytes");
  v7 = *(_QWORD *)(a1 + 72);
  v6 = *(_QWORD *)(a1 + 80);
  src.data = v5;
  src.height = v6;
  src.width = 4 * v7;
  objc_msgSend(*(id *)(a1 + 32), "buffer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  src.rowBytes = objc_msgSend(v8, "rowBytes");

  v12.rowBytes = objc_msgSend(v3, "rowBytes", objc_msgSend(v3, "bytes"), *(_QWORD *)(a1 + 80), 4 * *(_QWORD *)(a1 + 72));
  vImageConvert_Planar16FtoPlanarF(&src, &v12, 0);
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v3;
  v11 = v3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

@end
