@implementation PHAsset(PUPerspectiveTransform)

- (__n128)pu_vitalityPerspectiveTransform
{
  _OWORD *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  __int128 v8;
  _OWORD *v9;
  uint64_t v10;
  uint8_t *v11;
  __int128 v12;
  int *v13;
  int v14;
  NSObject *v15;
  __int128 v17;
  __int128 v18;
  _OWORD v19[2];
  int v20;
  uint64_t v21;
  uint8_t buf[16];
  __int128 v23;
  __int128 v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v2 = (_OWORD *)MEMORY[0x1E0C83FE8];
  v17 = *MEMORY[0x1E0C83FE8];
  if ((objc_msgSend(a1, "hasAdjustments") & 1) == 0)
  {
    objc_msgSend(a1, "originalImageProperties");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCF70]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0C89D58]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v21 = 0;
      objc_msgSend(v5, "getBytes:length:", &v21, 8);
      v6 = v21;
      if ((_DWORD)v21 == 1)
      {
        v20 = 0;
        memset(v19, 0, sizeof(v19));
        objc_msgSend(v5, "getBytes:range:", v19, HIDWORD(v21), 36);
        v7 = 0;
        v8 = v2[1];
        *(_OWORD *)buf = *v2;
        v23 = v8;
        v24 = v2[2];
        v9 = v19;
        do
        {
          v10 = 0;
          v11 = &buf[16 * v7];
          v12 = *(_OWORD *)v11;
          v13 = (int *)v9;
          do
          {
            v14 = *v13;
            v13 += 3;
            v18 = v12;
            *(_DWORD *)((unint64_t)&v18 & 0xFFFFFFFFFFFFFFF3 | (4 * (v10 & 3))) = v14;
            v12 = v18;
            ++v10;
          }
          while (v10 != 3);
          *((_DWORD *)v11 + 2) = DWORD2(v18);
          *(_QWORD *)v11 = v12;
          ++v7;
          v9 = (_OWORD *)((char *)v9 + 4);
        }
        while (v7 != 3);
        v17 = *(_OWORD *)buf;
      }
      else
      {
        PLLivePhotoPlaybackGetLog();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&buf[4] = v6;
          _os_log_impl(&dword_1AAB61000, v15, OS_LOG_TYPE_ERROR, "Encountered unknown AVStillImageProcessingHomography version %d. Unable to produce vitality transform.", buf, 8u);
        }

      }
    }

  }
  return (__n128)v17;
}

@end
