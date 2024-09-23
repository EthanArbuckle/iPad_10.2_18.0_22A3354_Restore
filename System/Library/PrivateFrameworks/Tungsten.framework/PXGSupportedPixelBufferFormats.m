@implementation PXGSupportedPixelBufferFormats

void __PXGSupportedPixelBufferFormats_block_invoke()
{
  void *v0;
  void *v1;
  id v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  int v15;
  uint64_t v19;
  void *v20;
  id obj;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  _QWORD v35[5];

  v35[3] = *MEMORY[0x24BDAC8D0];
  if (PXGDeviceSupportsIOSurfaceCompression_onceToken[0] != -1)
    dispatch_once(PXGDeviceSupportsIOSurfaceCompression_onceToken, &__block_literal_global_378);
  if (PXGDeviceSupportsIOSurfaceCompression__supportsIOSurfaceCompression)
    v0 = &unk_251A7BC48;
  else
    v0 = (void *)MEMORY[0x24BDBD1A8];
  v35[0] = v0;
  v35[1] = &unk_251A7BC30;
  v35[2] = &unk_251A7BC60;
  v1 = (void *)MEMORY[0x24BDBCE30];
  v2 = v0;
  objc_msgSend(v1, "arrayWithObjects:count:", v35, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v5 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = v3;
  v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v23)
  {
    v22 = *(_QWORD *)v30;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v30 != v22)
          objc_enumerationMutation(obj);
        v24 = v6;
        v7 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v6);
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        v28 = 0u;
        v8 = v7;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v26;
          do
          {
            for (i = 0; i != v10; ++i)
            {
              if (*(_QWORD *)v26 != v11)
                objc_enumerationMutation(v8);
              v13 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
              v14 = objc_msgSend(v13, "unsignedIntValue");
              v15 = v14;
              if (PXGMetalPixelFormatForOSType(v14))
              {
LABEL_31:
                if ((objc_msgSend(v5, "containsObject:", v13) & 1) == 0)
                {
                  objc_msgSend(v4, "addObject:", v13);
                  objc_msgSend(v5, "addObject:", v13);
                }
                continue;
              }
              if (v15 <= 875704421)
              {
                if (v15 == 32 || v15 == 846624121)
                  goto LABEL_31;
              }
              else if (v15 == 875704422 || v15 == 2016686640 || v15 == 875704438)
              {
                goto LABEL_31;
              }
            }
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
          }
          while (v10);
        }

        v6 = v24 + 1;
      }
      while (v24 + 1 != v23);
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v23);
  }

  v19 = objc_msgSend(v4, "copy");
  v20 = (void *)PXGSupportedPixelBufferFormats_supported;
  PXGSupportedPixelBufferFormats_supported = v19;

}

@end
