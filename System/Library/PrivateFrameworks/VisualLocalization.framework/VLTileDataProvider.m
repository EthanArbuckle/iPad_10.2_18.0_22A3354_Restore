@implementation VLTileDataProvider

- (void)_disburseMetadataTileForKey:(uint64_t)a3 tileData:(void *)a4 error:(void *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t k;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  uint64_t v36;
  void (*v37)(uint64_t);
  void *v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t (*v53)(_QWORD *);
  void *v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t (*v61)(uint64_t, uint64_t);
  void (*v62)(uint64_t);
  id v63;
  _BYTE v64[128];
  _BYTE v65[128];
  uint8_t v66[128];
  uint8_t buf[4];
  int v68;
  __int16 v69;
  int v70;
  __int16 v71;
  int v72;
  __int16 v73;
  id v74;
  uint64_t v75;

  v75 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  v58 = 0;
  v59 = &v58;
  v60 = 0x3032000000;
  v61 = __Block_byref_object_copy_;
  v62 = __Block_byref_object_dispose_;
  v63 = 0;
  v10 = MEMORY[0x24BDAC760];
  v51 = MEMORY[0x24BDAC760];
  v52 = 3221225472;
  v53 = __65__VLTileDataProvider__disburseMetadataTileForKey_tileData_error___block_invoke;
  v54 = &unk_24CA9B870;
  v55 = a1;
  v56 = &v58;
  v57 = a3;
  geo_isolate_sync_data();
  if (objc_msgSend((id)v59[5], "count"))
  {
    if (v9)
    {
      if (qword_253E9A220 == -1)
      {
        v11 = _MergedGlobals_1;
        if (!os_log_type_enabled((os_log_t)_MergedGlobals_1, OS_LOG_TYPE_ERROR))
          goto LABEL_6;
      }
      else
      {
        dispatch_once(&qword_253E9A220, &__block_literal_global_1);
        v11 = _MergedGlobals_1;
        if (!os_log_type_enabled((os_log_t)_MergedGlobals_1, OS_LOG_TYPE_ERROR))
        {
LABEL_6:
          v49 = 0u;
          v50 = 0u;
          v47 = 0u;
          v48 = 0u;
          v15 = (id)v59[5];
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v47, v66, 16);
          if (v16)
          {
            v17 = *(_QWORD *)v48;
            do
            {
              for (i = 0; i != v16; ++i)
              {
                if (*(_QWORD *)v48 != v17)
                  objc_enumerationMutation(v15);
                (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * i) + 16))();
              }
              v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v47, v66, 16);
            }
            while (v16);
          }
          goto LABEL_28;
        }
      }
      v12 = *(unsigned int *)(a3 + 9);
      v13 = v12 | ((unint64_t)(*(unsigned __int16 *)(a3 + 13) | (*(unsigned __int8 *)(a3 + 15) << 16)) << 32);
      v14 = *(_QWORD *)(a3 + 1);
      *(_DWORD *)buf = 67175427;
      v68 = (v14 >> 40) & 0x3F;
      v69 = 1025;
      v70 = ((v14 >> 46) | ((_DWORD)v12 << 18)) & 0x3FFFFFF;
      v71 = 1025;
      v72 = (v13 >> 8) & 0x3FFFFFF;
      v73 = 2114;
      v74 = v9;
      _os_log_impl(&dword_210B26000, v11, OS_LOG_TYPE_ERROR, "Failed to load metadata tile %{private}i_%{private}i_%{private}i: %{public}@", buf, 0x1Eu);
      goto LABEL_6;
    }
    objc_msgSend(v8, "data");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
      v19 = (void *)MEMORY[0x24BDBCE50];
      objc_msgSend(v8, "fileURL");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = 0;
      objc_msgSend(v19, "dataWithContentsOfURL:options:error:", v20, 0, &v46);
      v15 = (id)objc_claimAutoreleasedReturnValue();
      v21 = v46;

      if (!v15)
      {
        v44 = 0u;
        v45 = 0u;
        v42 = 0u;
        v43 = 0u;
        v23 = (id)v59[5];
        v28 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v42, v65, 16);
        if (v28)
        {
          v29 = *(_QWORD *)v43;
          do
          {
            for (j = 0; j != v28; ++j)
            {
              if (*(_QWORD *)v43 != v29)
                objc_enumerationMutation(v23);
              (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * j) + 16))();
            }
            v28 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v42, v65, 16);
          }
          while (v28);
        }
        v15 = v21;
        goto LABEL_27;
      }

    }
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3D138]), "initWithData:", v15);
    v23 = v22;
    if (v22)
    {
      v35 = v10;
      v36 = 3221225472;
      v37 = __65__VLTileDataProvider__disburseMetadataTileForKey_tileData_error___block_invoke_11;
      v38 = &unk_24CA9B7D0;
      v39 = a1;
      v41 = a3;
      v40 = v22;
      geo_isolate_sync_data();

    }
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v24 = (id)v59[5];
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v31, v64, 16);
    if (v25)
    {
      v26 = *(_QWORD *)v32;
      do
      {
        for (k = 0; k != v25; ++k)
        {
          if (*(_QWORD *)v32 != v26)
            objc_enumerationMutation(v24);
          (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * k) + 16))(*(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * k));
        }
        v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v31, v64, 16);
      }
      while (v25);
    }

LABEL_27:
LABEL_28:

  }
  _Block_object_dispose(&v58, 8);

}

- (void)determineAvailabilityForCoordinate:(id *)a3 horizontalAccuracy:(double)a4 purpose:(int64_t)a5 callbackQueue:(id)a6 callback:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  $F24F406B2B787EFB06265DBA3D28CBD5 v19;
  double v20;
  int64_t v21;
  $F24F406B2B787EFB06265DBA3D28CBD5 v22;

  v12 = a6;
  v13 = a7;
  v22 = *a3;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __107__VLTileDataProvider_determineAvailabilityForCoordinate_horizontalAccuracy_purpose_callbackQueue_callback___block_invoke;
  v16[3] = &unk_24CA9B9D8;
  v16[4] = self;
  v17 = v12;
  v18 = v13;
  v19 = v22;
  v20 = a4;
  v21 = a5;
  v14 = v13;
  v15 = v12;
  -[VLTileDataProvider _fetchMetadataForCoordinate:completionHandler:](self, "_fetchMetadataForCoordinate:completionHandler:", &v22, v16);

}

- (void)_fetchMetadataForCoordinate:(id *)a3 completionHandler:(id)a4
{
  uint64_t v4;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  unsigned int v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  _QWORD block[4];
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  int v28;
  __int16 v29;
  int v30;
  char v31;
  uint64_t v32;
  int v33;
  __int16 v34;
  char v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  if (v7)
  {
    objc_msgSend(MEMORY[0x24BE3D020], "modernManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "activeTileGroup");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "activeTileSetForStyle:size:scale:", 70, 2, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = MEMORY[0x24BE3CA50];
      v12 = objc_msgSend(v10, "maximumZoomLevelInRect:", *MEMORY[0x24BE3CA50], *(double *)(MEMORY[0x24BE3CA50] + 8), *(double *)(MEMORY[0x24BE3CA50] + 16), *(double *)(MEMORY[0x24BE3CA50] + 24));
      GEOMapPointForCoordinate();
      v13 = (double)(1 << v12) / *(double *)(v11 + 16);
      LODWORD(v4) = vcvtmd_u64_f64(v14 * v13);
      v16 = vcvtmd_u64_f64(v15 * v13);
      v31 = *MEMORY[0x24BE3CB00] & 0x7F;
      v17 = *MEMORY[0x24BE3CAF8] & 0x3F | (unint64_t)(v4 << 46) | ((self->_maxSupportedFormatVersion << 6) | (unint64_t)(v12 << 40)) & 0x3F0000007FC0;
      v35 = 0;
      v34 = HIBYTE(v16) & 3;
      v33 = (v16 << 8) | (v4 >> 18);
      v32 = v17;
      if (qword_253E9A220 != -1)
        dispatch_once(&qword_253E9A220, &__block_literal_global_1);
      v18 = (id)_MergedGlobals_1;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%+.8f, %+.8f"), *(_QWORD *)&a3->var0, *(_QWORD *)&a3->var1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138478595;
        v24 = v19;
        v25 = 1025;
        v26 = v12 & 0x3F;
        v27 = 1025;
        v28 = v4 & 0x3FFFFFF;
        v29 = 1025;
        v30 = v16 & 0x3FFFFFF;
        _os_log_impl(&dword_210B26000, v18, OS_LOG_TYPE_DEBUG, "Coordinate %{private}@ maps to metadata tile %{private}i_%{private}i_%{private}i", buf, 0x1Eu);

      }
      -[VLTileDataProvider _fetchMetadataTile:completionHandler:](self, "_fetchMetadataTile:completionHandler:", &v31, v7);
    }
    else
    {
      dispatch_get_global_queue(21, 0);
      v20 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __68__VLTileDataProvider__fetchMetadataForCoordinate_completionHandler___block_invoke;
      block[3] = &unk_24CA9B7F8;
      v22 = v7;
      dispatch_async(v20, block);

    }
  }

}

- (void)_fetchMetadataTile:(uint64_t)a3 completionHandler:(void *)a4
{
  id v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  NSObject *v22;
  NSObject *v24;
  _QWORD v26[4];
  id v27[6];
  id v28;
  uint64_t *v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  char v41;
  id buf;
  __int16 v43;
  int v44;
  __int16 v45;
  int v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v38 = 0;
  v39 = &v38;
  v40 = 0x2020000000;
  v41 = 0;
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy_;
  v36 = __Block_byref_object_dispose_;
  v37 = 0;
  v7 = MEMORY[0x24BDAC760];
  v27[1] = (id)MEMORY[0x24BDAC760];
  v27[2] = (id)3221225472;
  v27[3] = __59__VLTileDataProvider__fetchMetadataTile_completionHandler___block_invoke;
  v27[4] = &unk_24CA9B820;
  v27[5] = a1;
  v29 = &v32;
  v30 = &v38;
  v31 = a3;
  v8 = v6;
  v28 = v8;
  geo_isolate_sync();
  if (v33[5])
  {
    if (qword_253E9A220 == -1)
    {
      v9 = _MergedGlobals_1;
      if (!os_log_type_enabled((os_log_t)_MergedGlobals_1, OS_LOG_TYPE_DEBUG))
      {
LABEL_5:
        (*((void (**)(id, uint64_t, _QWORD))v8 + 2))(v8, v33[5], 0);
        goto LABEL_6;
      }
    }
    else
    {
      dispatch_once(&qword_253E9A220, &__block_literal_global_1);
      v9 = _MergedGlobals_1;
      if (!os_log_type_enabled((os_log_t)_MergedGlobals_1, OS_LOG_TYPE_DEBUG))
        goto LABEL_5;
    }
    v10 = *(unsigned int *)(a3 + 9);
    v11 = v10 | ((unint64_t)(*(unsigned __int16 *)(a3 + 13) | (*(unsigned __int8 *)(a3 + 15) << 16)) << 32);
    v12 = *(_QWORD *)(a3 + 1);
    LODWORD(buf) = 67175169;
    HIDWORD(buf) = (v12 >> 40) & 0x3F;
    v43 = 1025;
    v44 = ((v12 >> 46) | ((_DWORD)v10 << 18)) & 0x3FFFFFF;
    v45 = 1025;
    v46 = (v11 >> 8) & 0x3FFFFFF;
    _os_log_impl(&dword_210B26000, v9, OS_LOG_TYPE_DEBUG, "Using cached metadata tile %{private}i_%{private}i_%{private}i", (uint8_t *)&buf, 0x14u);
    goto LABEL_5;
  }
  if (!*((_BYTE *)v39 + 24))
  {
    if (qword_253E9A220 == -1)
    {
      v24 = _MergedGlobals_1;
      if (!os_log_type_enabled((os_log_t)_MergedGlobals_1, OS_LOG_TYPE_INFO))
      {
LABEL_16:
        objc_initWeak(&buf, a1);
        v20 = (void *)a1[2];
        v19 = a1[3];
        dispatch_get_global_queue(21, 0);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v26[0] = v7;
        v26[1] = 3221225472;
        v26[2] = __59__VLTileDataProvider__fetchMetadataTile_completionHandler___block_invoke_15;
        v26[3] = &unk_24CA9B848;
        objc_copyWeak(v27, &buf);
        objc_msgSend(v20, "loadKey:priority:forClient:options:reason:callbackQ:beginNetwork:callback:", a3, 3221225469, v19, 3, 4, v21, 0, v26);

        objc_destroyWeak(v27);
        objc_destroyWeak(&buf);
        goto LABEL_6;
      }
    }
    else
    {
      dispatch_once(&qword_253E9A220, &__block_literal_global_1);
      v24 = _MergedGlobals_1;
      if (!os_log_type_enabled((os_log_t)_MergedGlobals_1, OS_LOG_TYPE_INFO))
        goto LABEL_16;
    }
    v16 = *(unsigned int *)(a3 + 9);
    v17 = v16 | ((unint64_t)(*(unsigned __int16 *)(a3 + 13) | (*(unsigned __int8 *)(a3 + 15) << 16)) << 32);
    v18 = *(_QWORD *)(a3 + 1);
    LODWORD(buf) = 67175169;
    HIDWORD(buf) = (v18 >> 40) & 0x3F;
    v43 = 1025;
    v44 = ((v18 >> 46) | ((_DWORD)v16 << 18)) & 0x3FFFFFF;
    v45 = 1025;
    v46 = (v17 >> 8) & 0x3FFFFFF;
    _os_log_impl(&dword_210B26000, v24, OS_LOG_TYPE_INFO, "Loading metadata tile %{private}i_%{private}i_%{private}i from GeoServices...", (uint8_t *)&buf, 0x14u);
    goto LABEL_16;
  }
  if (qword_253E9A220 == -1)
  {
    v22 = _MergedGlobals_1;
    if (!os_log_type_enabled((os_log_t)_MergedGlobals_1, OS_LOG_TYPE_DEBUG))
      goto LABEL_6;
LABEL_11:
    v13 = *(unsigned int *)(a3 + 9);
    v14 = v13 | ((unint64_t)(*(unsigned __int16 *)(a3 + 13) | (*(unsigned __int8 *)(a3 + 15) << 16)) << 32);
    v15 = *(_QWORD *)(a3 + 1);
    LODWORD(buf) = 67175169;
    HIDWORD(buf) = (v15 >> 40) & 0x3F;
    v43 = 1025;
    v44 = ((v15 >> 46) | ((_DWORD)v13 << 18)) & 0x3FFFFFF;
    v45 = 1025;
    v46 = (v14 >> 8) & 0x3FFFFFF;
    _os_log_impl(&dword_210B26000, v22, OS_LOG_TYPE_DEBUG, "Metadata tile %{private}i_%{private}i_%{private}i is already loading", (uint8_t *)&buf, 0x14u);
    goto LABEL_6;
  }
  dispatch_once(&qword_253E9A220, &__block_literal_global_1);
  v22 = _MergedGlobals_1;
  if (os_log_type_enabled((os_log_t)_MergedGlobals_1, OS_LOG_TYPE_DEBUG))
    goto LABEL_11;
LABEL_6:

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v38, 8);

}

void __59__VLTileDataProvider__fetchMetadataTile_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 168) && (v3 = GEOTileKeyEquals(), v2 = *(_QWORD *)(a1 + 32), v3))
  {
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v5 = *(id *)(v2 + 168);
    v6 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v5;

  }
  else
  {
    objc_msgSend(*(id *)(v2 + 144), "objectForKey:", *(_QWORD *)(a1 + 64));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(v9, "count") != 0;
    if (!v9)
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "setObject:forKey:");
    }
    v7 = (void *)objc_msgSend(*(id *)(a1 + 40), "copy");
    v8 = (void *)MEMORY[0x212BCF2AC]();
    objc_msgSend(v9, "addObject:", v8);

  }
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (VLTileDataProvider)initWithAuditToken:(id)a3 supportedFormatVersions:(id)a4
{
  id v6;
  id v7;
  VLTileDataProvider *v8;
  VLTileDataProvider *v9;
  VLTileDataProvider *v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)VLTileDataProvider;
  v8 = -[VLTileDataProvider init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    -[VLTileDataProvider _commonInitWithTileLoader:auditToken:supportedFormatVersions:](v8, "_commonInitWithTileLoader:auditToken:supportedFormatVersions:", 0, v6, v7);
    v10 = v9;
  }

  return v9;
}

- (void)_commonInitWithTileLoader:(id)a3 auditToken:(id)a4 supportedFormatVersions:(id)a5
{
  id v8;
  id v9;
  id v10;
  GEOTileLoader *v11;
  GEOTileLoader *tileLoader;
  NSString *v13;
  NSString *tileLoaderClientID;
  NSArray *v15;
  NSArray *supportedFormatVersions;
  NSArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  unsigned int v21;
  void *v22;
  unsigned int maxSupportedFormatVersion;
  geo_isolater *v24;
  geo_isolater *isolation;
  GEOTileKeyMap *v26;
  GEOTileKeyMap *pendingMetadataTiles;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_storeStrong((id *)&self->_auditToken, a4);
  if (v8)
  {
    v11 = (GEOTileLoader *)v8;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE3D090], "modernLoader");
    v11 = (GEOTileLoader *)objc_claimAutoreleasedReturnValue();
  }
  tileLoader = self->_tileLoader;
  self->_tileLoader = v11;

  GEOTileLoaderClientIdentifier();
  v13 = (NSString *)objc_claimAutoreleasedReturnValue();
  tileLoaderClientID = self->_tileLoaderClientID;
  self->_tileLoaderClientID = v13;

  -[GEOTileLoader openForClient:](self->_tileLoader, "openForClient:", self->_tileLoaderClientID);
  v15 = (NSArray *)objc_msgSend(v10, "copy");
  supportedFormatVersions = self->_supportedFormatVersions;
  self->_supportedFormatVersions = v15;

  self->_maxSupportedFormatVersion = 0;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v17 = self->_supportedFormatVersions;
  v18 = -[NSArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v18)
  {
    v19 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v29 != v19)
          objc_enumerationMutation(v17);
        v22 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        maxSupportedFormatVersion = self->_maxSupportedFormatVersion;
        if (maxSupportedFormatVersion > objc_msgSend(v22, "unsignedIntValue", (_QWORD)v28))
          v21 = self->_maxSupportedFormatVersion;
        else
          v21 = objc_msgSend(v22, "unsignedIntValue");
        self->_maxSupportedFormatVersion = v21;
      }
      v18 = -[NSArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v18);
  }

  v24 = (geo_isolater *)geo_isolater_create();
  isolation = self->_isolation;
  self->_isolation = v24;

  v26 = (GEOTileKeyMap *)objc_msgSend(objc_alloc(MEMORY[0x24BE3D088]), "initWithMapType:", 0);
  pendingMetadataTiles = self->_pendingMetadataTiles;
  self->_pendingMetadataTiles = v26;

}

void __107__VLTileDataProvider_determineAvailabilityForCoordinate_horizontalAccuracy_purpose_callbackQueue_callback___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  id *v9;
  double v10;
  void *v11;
  double v12;
  id v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  __int128 v19;
  unsigned int v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  char v29;
  double v30;
  uint64_t v31;
  unint64_t i;
  unsigned int v33;
  void *v34;
  void *v35;
  int v36;
  int v37;
  void *v38;
  id v39;
  unsigned int v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  NSObject *v45;
  const char *v46;
  uint64_t v47;
  NSObject *v48;
  int v49;
  unint64_t v50;
  unsigned int v51;
  int v52;
  uint64_t v53;
  NSObject *v54;
  char v55;
  NSObject *v56;
  NSObject *v57;
  const char *j;
  __int128 v59;
  char v60;
  void *v61;
  void *v62;
  void *v63;
  id obj;
  double v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  id v69;
  _QWORD v70[4];
  id v71;
  char v72;
  _QWORD block[4];
  id v74;
  id v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  uint8_t v80[4];
  double v81;
  uint8_t buf[4];
  double v83;
  uint64_t v84;

  v84 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = *(id *)(a1 + 32);
  v62 = v6;
  v63 = v7;
  v61 = v5;
  if (v6)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __107__VLTileDataProvider_determineAvailabilityForCoordinate_horizontalAccuracy_purpose_callbackQueue_callback___block_invoke_2;
    block[3] = &unk_24CA9B988;
    v8 = *(NSObject **)(a1 + 40);
    v75 = *(id *)(a1 + 48);
    v74 = v6;
    dispatch_async(v8, block);

    v9 = &v75;
    goto LABEL_89;
  }
  v10 = *(double *)(a1 + 72);
  v11 = (void *)*((_QWORD *)v7 + 23);
  v12 = *(double *)(a1 + 80);
  v13 = v5;
  v69 = v11;
  v65 = v12;
  if (v12 != 0.0 && objc_msgSend(v13, "purposeDenylistsCount"))
  {
    v14 = 0;
    do
    {
      if (v14 >= objc_msgSend(v13, "purposeDenylistsCount"))
        goto LABEL_15;
      v15 = objc_msgSend(v13, "purposeDenylistAtIndex:", v14) - 1;
      if (v15 < 3)
        v16 = v15 + 1;
      else
        v16 = 0;
      ++v14;
    }
    while (v16 != *(_QWORD *)&v12);
    if (qword_253E9A220 == -1)
    {
      v17 = _MergedGlobals_1;
      if (!os_log_type_enabled((os_log_t)_MergedGlobals_1, OS_LOG_TYPE_INFO))
      {
LABEL_14:
        v60 = 0;
        goto LABEL_16;
      }
    }
    else
    {
      dispatch_once(&qword_253E9A220, &__block_literal_global_1);
      v17 = _MergedGlobals_1;
      if (!os_log_type_enabled((os_log_t)_MergedGlobals_1, OS_LOG_TYPE_INFO))
        goto LABEL_14;
    }
    *(_DWORD *)buf = 134349056;
    v83 = v12;
    _os_log_impl(&dword_210B26000, v17, OS_LOG_TYPE_INFO, "Metadata denylist contains purpose %{public}llu", buf, 0xCu);
    goto LABEL_14;
  }
LABEL_15:
  v60 = 1;
LABEL_16:
  v78 = 0u;
  v79 = 0u;
  v76 = 0u;
  v77 = 0u;
  objc_msgSend(v13, "tiles");
  v68 = a1;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v76, buf, 16);
  if (!v18)
    goto LABEL_84;
  v66 = *(_QWORD *)v77;
  v20 = *MEMORY[0x24BE3CAF8];
  *(_QWORD *)&v19 = 134217984;
  v59 = v19;
  do
  {
    v21 = 0;
    v67 = v18;
    do
    {
      if (*(_QWORD *)v77 != v66)
        objc_enumerationMutation(obj);
      v22 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * v21);
      v23 = (void *)MEMORY[0x212BCF144]();
      objc_msgSend(v22, "coord");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      GEOMapPointForCoordinate();
      v26 = v25;
      v28 = v27;
      v29 = objc_msgSend(v24, "zoom");
      v30 = (double)(1 << v29) / *(double *)(MEMORY[0x24BE3CA50] + 16);
      if (objc_msgSend(v24, "x") != vcvtmd_u64_f64(v26 * v30)
        || objc_msgSend(v24, "y") != vcvtmd_u64_f64(v28 * v30))
      {
        v37 = 0;
        goto LABEL_36;
      }
      if (objc_msgSend(v22, "precisionIndexsCount") != 1)
      {
        v31 = objc_msgSend(v22, "precisionIndexsCount");
        if (v31 != objc_msgSend(v22, "buildIndexsCount"))
          goto LABEL_94;
      }
      for (i = 0; ; ++i)
      {
        if (i >= objc_msgSend(v22, "buildIndexsCount", v59))
        {
          v38 = 0;
          v39 = 0;
          goto LABEL_34;
        }
        v33 = objc_msgSend(v22, "buildIndexAtIndex:", i);
        if (objc_msgSend(v13, "buildsCount") <= (unint64_t)v33)
        {
          if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
            goto LABEL_93;
          *(_WORD *)v80 = 0;
          v57 = MEMORY[0x24BDACB70];
          j = "Assertion failed: buildIndex < metadata.buildsCount";
          goto LABEL_92;
        }
        objc_msgSend(v13, "buildAtIndex:");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v34, "dataOutputVersion") <= v20)
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend(v34, "dataFormatVersion"));
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = objc_msgSend(v69, "containsObject:", v35);

          if (v36)
            break;
        }

      }
      v39 = v34;
      v40 = objc_msgSend(v22, "precisionIndexAtIndex:", i);
      if (objc_msgSend(v13, "precisionsCount") <= (unint64_t)v40)
      {
        if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
          goto LABEL_93;
        *(_WORD *)v80 = 0;
        v57 = MEMORY[0x24BDACB70];
        for (j = "Assertion failed: precisionIndex < metadata.precisionsCount";
              ;
              j = "Assertion failed: tile.precisionIndexsCount == 1 || tile.precisionIndexsCount == tile.buildIndexsCount")
        {
LABEL_92:
          _os_log_fault_impl(&dword_210B26000, v57, OS_LOG_TYPE_FAULT, j, v80, 2u);
          do
          {
LABEL_93:
            __break(1u);
LABEL_94:
            ;
          }
          while (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT));
          *(_WORD *)v80 = 0;
          v57 = MEMORY[0x24BDACB70];
        }
      }
      objc_msgSend(v13, "precisionAtIndex:");
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v39)
        goto LABEL_34;
      if (v65 == 0.0)
        goto LABEL_61;
      if (!objc_msgSend(v22, "purposeDenylistsCount"))
      {
        if ((v60 & 1) == 0)
        {
          if (qword_253E9A220 == -1)
          {
            v47 = _MergedGlobals_1;
            if (!os_log_type_enabled((os_log_t)_MergedGlobals_1, OS_LOG_TYPE_INFO))
              goto LABEL_34;
          }
          else
          {
            dispatch_once(&qword_253E9A220, &__block_literal_global_1);
            v47 = _MergedGlobals_1;
            if (!os_log_type_enabled((os_log_t)_MergedGlobals_1, OS_LOG_TYPE_INFO))
              goto LABEL_34;
          }
          *(_DWORD *)v80 = 134349056;
          v81 = v65;
          v45 = v47;
          v46 = "Metadata tile denylist contains purpose %{public}llu, and data tile has no override denylist. This tile is not usable";
          goto LABEL_56;
        }
LABEL_61:
        if (v10 <= 0.0 || (*(_QWORD *)&v65 | 2) == 2 || (GEOConfigGetBOOL() & 1) != 0)
        {
          v37 = 1;
          goto LABEL_35;
        }
        v49 = uncertainty_limits;
        if (v10 > *(float *)&uncertainty_limits)
        {
          v49 = dword_254A77154;
          if (v10 > *(float *)&dword_254A77154)
            v49 = dword_254A77158;
        }
        v50 = 0;
        v51 = *(float *)&v49;
        while (v50 < objc_msgSend(v38, "precisionsCount"))
        {
          v52 = objc_msgSend(v38, "precisionsAtIndex:", v50++);
          v37 = 1;
          if (v52 == v51)
            goto LABEL_35;
        }
        if (qword_253E9A220 == -1)
        {
          v53 = _MergedGlobals_1;
          if (!os_log_type_enabled((os_log_t)_MergedGlobals_1, OS_LOG_TYPE_INFO))
            goto LABEL_34;
        }
        else
        {
          dispatch_once(&qword_253E9A220, &__block_literal_global_1);
          v53 = _MergedGlobals_1;
          if (!os_log_type_enabled((os_log_t)_MergedGlobals_1, OS_LOG_TYPE_INFO))
            goto LABEL_34;
        }
        *(_DWORD *)v80 = v59;
        v81 = v10;
        v45 = v53;
        v46 = "Metadata contains tile at this location, but only for lower-precision locations than the input (%.1f meter"
              "s). Considering VL to be unavailable at this location.";
LABEL_56:
        _os_log_impl(&dword_210B26000, v45, OS_LOG_TYPE_INFO, v46, v80, 0xCu);
        goto LABEL_34;
      }
      v41 = 0;
      do
      {
        if (v41 >= objc_msgSend(v22, "purposeDenylistsCount"))
        {
          if ((v60 & 1) != 0)
            goto LABEL_61;
          if (qword_253E9A220 == -1)
          {
            v48 = _MergedGlobals_1;
            if (!os_log_type_enabled((os_log_t)_MergedGlobals_1, OS_LOG_TYPE_INFO))
              goto LABEL_61;
          }
          else
          {
            dispatch_once(&qword_253E9A220, &__block_literal_global_1);
            v48 = _MergedGlobals_1;
            if (!os_log_type_enabled((os_log_t)_MergedGlobals_1, OS_LOG_TYPE_INFO))
              goto LABEL_61;
          }
          *(_DWORD *)v80 = 134349056;
          v81 = v65;
          _os_log_impl(&dword_210B26000, v48, OS_LOG_TYPE_INFO, "Data tile denylist does not contain purpose %{public}llu, even though metadata tile does. The tile is usable", v80, 0xCu);
          goto LABEL_61;
        }
        v42 = objc_msgSend(v22, "purposeDenylistAtIndex:", v41) - 1;
        if (v42 < 3)
          v43 = v42 + 1;
        else
          v43 = 0;
        ++v41;
      }
      while (v43 != *(_QWORD *)&v65);
      if (qword_253E9A220 == -1)
      {
        v44 = _MergedGlobals_1;
        if (!os_log_type_enabled((os_log_t)_MergedGlobals_1, OS_LOG_TYPE_INFO))
          goto LABEL_34;
        goto LABEL_51;
      }
      dispatch_once(&qword_253E9A220, &__block_literal_global_1);
      v44 = _MergedGlobals_1;
      if (os_log_type_enabled((os_log_t)_MergedGlobals_1, OS_LOG_TYPE_INFO))
      {
LABEL_51:
        *(_DWORD *)v80 = 134349056;
        v81 = v65;
        v45 = v44;
        v46 = "Data tile denylist contains purpose %{public}llu";
        goto LABEL_56;
      }
LABEL_34:
      v37 = 6;
LABEL_35:

LABEL_36:
      objc_autoreleasePoolPop(v23);
      if (v37 != 6 && v37)
      {

        v55 = 1;
        goto LABEL_88;
      }
      ++v21;
    }
    while (v21 != v67);
    v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v76, buf, 16);
  }
  while (v18);
LABEL_84:

  if (qword_253E9A220 == -1)
  {
    v54 = _MergedGlobals_1;
    if (os_log_type_enabled((os_log_t)_MergedGlobals_1, OS_LOG_TYPE_INFO))
      goto LABEL_86;
  }
  else
  {
    dispatch_once(&qword_253E9A220, &__block_literal_global_1);
    v54 = _MergedGlobals_1;
    if (os_log_type_enabled((os_log_t)_MergedGlobals_1, OS_LOG_TYPE_INFO))
    {
LABEL_86:
      *(_WORD *)v80 = 0;
      _os_log_impl(&dword_210B26000, v54, OS_LOG_TYPE_INFO, "Location is not supported/available", v80, 2u);
    }
  }
  v55 = 0;
LABEL_88:

  v70[0] = MEMORY[0x24BDAC760];
  v70[1] = 3221225472;
  v70[2] = __107__VLTileDataProvider_determineAvailabilityForCoordinate_horizontalAccuracy_purpose_callbackQueue_callback___block_invoke_3;
  v70[3] = &unk_24CA9B9B0;
  v9 = &v71;
  v56 = *(NSObject **)(v68 + 40);
  v71 = *(id *)(v68 + 48);
  v72 = v55;
  dispatch_async(v56, v70);
LABEL_89:

}

- (id).cxx_construct
{
  *((_QWORD *)self + 6) = (char *)self + 48;
  *((_QWORD *)self + 7) = (char *)self + 48;
  *((_QWORD *)self + 8) = 0;
  *((_QWORD *)self + 9) = (char *)self + 72;
  *((_QWORD *)self + 10) = (char *)self + 72;
  *((_QWORD *)self + 11) = 0;
  *((_QWORD *)self + 12) = (char *)self + 96;
  *((_QWORD *)self + 13) = (char *)self + 96;
  *((_QWORD *)self + 14) = 0;
  return self;
}

- (VLTileDataProvider)init
{
  VLTileDataProvider *result;

  result = (VLTileDataProvider *)objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (void)dealloc
{
  objc_super v3;

  -[GEOTileLoader cancelAllForClient:](self->_tileLoader, "cancelAllForClient:", self->_tileLoaderClientID);
  -[GEOTileLoader closeForClient:](self->_tileLoader, "closeForClient:", self->_tileLoaderClientID);
  v3.receiver = self;
  v3.super_class = (Class)VLTileDataProvider;
  -[VLTileDataProvider dealloc](&v3, sel_dealloc);
}

- (void)setShouldCacheMetadata:(BOOL)a3
{
  geo_isolate_sync_data();
}

void __45__VLTileDataProvider_setShouldCacheMetadata___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 176) = *(_BYTE *)(a1 + 40);
  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 176))
  {
    v2 = *(void **)(v1 + 168);
    *(_QWORD *)(v1 + 168) = 0;

  }
}

uint64_t __65__VLTileDataProvider__disburseMetadataTileForKey_tileData_error___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 144), "objectForKey:", a1[6]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[5] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  return objc_msgSend(*(id *)(a1[4] + 144), "removeObjectForKey:", a1[6]);
}

void __65__VLTileDataProvider__disburseMetadataTileForKey_tileData_error___block_invoke_11(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v1 + 176))
  {
    *(_OWORD *)(v1 + 152) = *(_OWORD *)*(_QWORD *)(a1 + 48);
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 168), *(id *)(a1 + 40));
  }
}

void __68__VLTileDataProvider__fetchMetadataForCoordinate_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  id v4;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = (void *)MEMORY[0x24BDD1540];
  GEOErrorDomain();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorWithDomain:code:userInfo:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v1 + 16))(v1, 0, v3);

}

- (void)_fetchMetadataForDataKey:(id *)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int maxSupportedFormatVersion;
  uint64_t v11;
  long double v12;
  unint64_t v13;
  long double v14;
  __int128 v15;
  NSObject *v16;
  int var0;
  int var1;
  int var2;
  NSObject *v20;
  NSObject *v21;
  _QWORD block[4];
  id v23;
  _BYTE buf[10];
  int v25;
  __int16 v26;
  int v27;
  __int16 v28;
  int v29;
  __int16 v30;
  int v31;
  __int16 v32;
  int v33;
  __int128 v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BE3D020], "modernManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "activeTileGroup");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "activeTileSetForStyle:size:scale:", 70, 2, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      maxSupportedFormatVersion = self->_maxSupportedFormatVersion;
      v11 = objc_msgSend(v9, "maximumZoomLevelInRect:", *MEMORY[0x24BE3CA50], *(double *)(MEMORY[0x24BE3CA50] + 8), *(double *)(MEMORY[0x24BE3CA50] + 16), *(double *)(MEMORY[0x24BE3CA50] + 24));
      v12 = ldexp(1.0, (int)v11 - a3->var0);
      v13 = (v12 * (double)a3->var1);
      v14 = v12 * (double)a3->var2;
      buf[0] = *MEMORY[0x24BE3CB00] & 0x7F;
      *(_QWORD *)&buf[1] = (*MEMORY[0x24BE3CAF8] & 0x3F | (maxSupportedFormatVersion << 6) | (unint64_t)(v11 << 40)) & 0x3F0000007FFFLL | ((unint64_t)v13 << 46);
      *((_QWORD *)&v15 + 1) = (v13 >> 18) | ((unint64_t)(v14 & 0x3FFFFFF) << 8);
      *(_QWORD *)&v15 = v13 << 46;
      *(_QWORD *)&v34 = *(_QWORD *)buf;
      *((_QWORD *)&v34 + 1) = v15 >> 56;
      if (qword_253E9A220 == -1)
      {
        v16 = _MergedGlobals_1;
        if (!os_log_type_enabled((os_log_t)_MergedGlobals_1, OS_LOG_TYPE_DEBUG))
        {
LABEL_6:
          -[VLTileDataProvider _fetchMetadataTile:completionHandler:](self, "_fetchMetadataTile:completionHandler:", &v34, v6);
LABEL_11:

          goto LABEL_12;
        }
      }
      else
      {
        dispatch_once(&qword_253E9A220, &__block_literal_global_1);
        v16 = _MergedGlobals_1;
        if (!os_log_type_enabled((os_log_t)_MergedGlobals_1, OS_LOG_TYPE_DEBUG))
          goto LABEL_6;
      }
      var0 = a3->var0;
      var1 = a3->var1;
      var2 = a3->var2;
      *(_DWORD *)buf = 67175937;
      *(_DWORD *)&buf[4] = var0;
      *(_WORD *)&buf[8] = 1025;
      v25 = var1;
      v26 = 1025;
      v27 = var2;
      v28 = 1025;
      v29 = (*(_QWORD *)((char *)&v34 + 1) >> 40) & 0x3F;
      v30 = 1025;
      v31 = ((*(_QWORD *)((char *)&v34 + 1) >> 46) | (*(_DWORD *)((char *)&v34 + 9) << 18)) & 0x3FFFFFF;
      v32 = 1025;
      v33 = ((*(unsigned int *)((char *)&v34 + 9) | ((unint64_t)(*(unsigned __int16 *)((char *)&v34 + 13) | (HIBYTE(v34) << 16)) << 32)) >> 8) & 0x3FFFFFF;
      _os_log_impl(&dword_210B26000, v16, OS_LOG_TYPE_DEBUG, "Data key %{private}i_%{private}i_%{private}i maps to metadata tile %{private}i_%{private}i_%{private}i", buf, 0x26u);
      goto LABEL_6;
    }
    if (qword_253E9A220 == -1)
    {
      v20 = _MergedGlobals_1;
      if (!os_log_type_enabled((os_log_t)_MergedGlobals_1, OS_LOG_TYPE_DEBUG))
      {
LABEL_10:
        dispatch_get_global_queue(21, 0);
        v21 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __65__VLTileDataProvider__fetchMetadataForDataKey_completionHandler___block_invoke;
        block[3] = &unk_24CA9B7F8;
        v23 = v6;
        dispatch_async(v21, block);

        goto LABEL_11;
      }
    }
    else
    {
      dispatch_once(&qword_253E9A220, &__block_literal_global_1);
      v20 = _MergedGlobals_1;
      if (!os_log_type_enabled((os_log_t)_MergedGlobals_1, OS_LOG_TYPE_DEBUG))
        goto LABEL_10;
    }
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_210B26000, v20, OS_LOG_TYPE_DEBUG, "No matching tileset found for VL_METADATA. Cannot fetch metadata.", buf, 2u);
    goto LABEL_10;
  }
LABEL_12:

}

void __65__VLTileDataProvider__fetchMetadataForDataKey_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  id v4;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = (void *)MEMORY[0x24BDD1540];
  GEOErrorDomain();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorWithDomain:code:userInfo:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v1 + 16))(v1, 0, v3);

}

void __59__VLTileDataProvider__fetchMetadataTile_completionHandler___block_invoke_15(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  id *v7;
  id v8;
  id v9;
  id WeakRetained;

  v7 = (id *)(a1 + 32);
  v8 = a5;
  v9 = a3;
  WeakRetained = objc_loadWeakRetained(v7);
  objc_msgSend(WeakRetained, "_disburseMetadataTileForKey:tileData:error:", a2, v9, v8);

}

- (id)fileURLForKey:(id *)a3 error:(id *)a4
{
  void *v7;
  NSObject *v8;
  int v9;
  int v10;
  int v11;
  int v12;
  void *v13;
  NSObject *v14;
  int var0;
  int var1;
  int var2;
  int var3;
  NSObject *v19;
  int v20;
  int v21;
  int v22;
  int v23;
  NSObject *v25;
  int v26;
  int v27;
  int v28;
  int v29;
  _QWORD v30[4];
  id v31;
  __int128 v32;
  id location[10];
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  char v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  char v41;
  uint64_t v42;
  uint64_t v43;
  void (*v44)(_QWORD *);
  void *v45;
  VLTileDataProvider *v46;
  uint64_t *v47;
  const $A3B2E143E1A03423F9FC703C010436DC *v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t (*v52)(uint64_t, uint64_t);
  void (*v53)(uint64_t);
  id v54;
  uint8_t v55[16];
  int v56;
  __int16 v57;
  int v58;
  uint8_t buf[8];
  uint8_t *v60;
  _BYTE v61[10];
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  v49 = 0;
  v50 = &v49;
  v51 = 0x3032000000;
  v52 = __Block_byref_object_copy_;
  v53 = __Block_byref_object_dispose_;
  v54 = 0;
  v7 = (void *)MEMORY[0x24BDAC760];
  v42 = MEMORY[0x24BDAC760];
  v43 = 3221225472;
  v44 = __42__VLTileDataProvider_fileURLForKey_error___block_invoke;
  v45 = &unk_24CA9B870;
  v47 = &v49;
  v48 = a3;
  v46 = self;
  geo_isolate_sync_data();
  if (!v50[5])
  {
    *(_QWORD *)buf = 0;
    v60 = buf;
    *(_QWORD *)v61 = 0x2020000000;
    v61[8] = 0;
    v38 = 0;
    v39 = &v38;
    v40 = 0x2020000000;
    v41 = 0;
    v34 = 0;
    v35 = &v34;
    v36 = 0x2020000000;
    v37 = 0;
    location[1] = v7;
    location[2] = (id)3221225472;
    location[3] = __42__VLTileDataProvider_fileURLForKey_error___block_invoke_17;
    location[4] = &unk_24CA9B898;
    location[5] = self;
    location[6] = buf;
    location[8] = &v34;
    location[9] = (id)a3;
    location[7] = &v38;
    geo_isolate_sync_data();
    if (*((_BYTE *)v39 + 24))
    {
      if (qword_253E9A220 == -1)
      {
        v14 = _MergedGlobals_1;
        if (!os_log_type_enabled((os_log_t)_MergedGlobals_1, OS_LOG_TYPE_DEBUG))
          goto LABEL_10;
      }
      else
      {
        dispatch_once(&qword_253E9A220, &__block_literal_global_1);
        v14 = _MergedGlobals_1;
        if (!os_log_type_enabled((os_log_t)_MergedGlobals_1, OS_LOG_TYPE_DEBUG))
        {
LABEL_10:
          if (a4)
            goto LABEL_17;
          goto LABEL_18;
        }
      }
      var0 = a3->var0;
      var1 = a3->var1;
      var2 = a3->var2;
      var3 = a3->var3;
      *(_DWORD *)v55 = 67175425;
      *(_DWORD *)&v55[4] = var0;
      *(_WORD *)&v55[8] = 1025;
      *(_DWORD *)&v55[10] = var1;
      *(_WORD *)&v55[14] = 1025;
      v56 = var2;
      v57 = 1025;
      v58 = var3;
      _os_log_impl(&dword_210B26000, v14, OS_LOG_TYPE_DEBUG, "Tile %{private}i_%{private}i_%{private}i:%{private}i has recently failed.", v55, 0x1Au);
      goto LABEL_10;
    }
    if (!*((_BYTE *)v35 + 24))
    {
      if (a4)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("VLLocalizationDataProviderErrorDomain"), 1, 0);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      if (!v60[24])
      {
        *($A3B2E143E1A03423F9FC703C010436DC *)v55 = *a3;
        objc_initWeak(location, self);
        v30[0] = v7;
        v30[1] = 3221225472;
        v30[2] = __42__VLTileDataProvider_fileURLForKey_error___block_invoke_18;
        v30[3] = &unk_24CA9B910;
        objc_copyWeak(&v31, location);
        v32 = *(_OWORD *)v55;
        -[VLTileDataProvider _fetchMetadataForDataKey:completionHandler:](self, "_fetchMetadataForDataKey:completionHandler:", a3, v30);
        objc_destroyWeak(&v31);
        objc_destroyWeak(location);
        goto LABEL_18;
      }
      if (qword_253E9A220 == -1)
      {
        v25 = _MergedGlobals_1;
        if (!os_log_type_enabled((os_log_t)_MergedGlobals_1, OS_LOG_TYPE_DEBUG))
          goto LABEL_18;
      }
      else
      {
        dispatch_once(&qword_253E9A220, &__block_literal_global_1);
        v25 = _MergedGlobals_1;
        if (!os_log_type_enabled((os_log_t)_MergedGlobals_1, OS_LOG_TYPE_DEBUG))
          goto LABEL_18;
      }
      v26 = a3->var0;
      v27 = a3->var1;
      v28 = a3->var2;
      v29 = a3->var3;
      *(_DWORD *)v55 = 67175425;
      *(_DWORD *)&v55[4] = v26;
      *(_WORD *)&v55[8] = 1025;
      *(_DWORD *)&v55[10] = v27;
      *(_WORD *)&v55[14] = 1025;
      v56 = v28;
      v57 = 1025;
      v58 = v29;
      _os_log_impl(&dword_210B26000, v25, OS_LOG_TYPE_DEBUG, "Tile %{private}i_%{private}i_%{private}i:%{private}i is already loading.", v55, 0x1Au);
      goto LABEL_18;
    }
    if (qword_253E9A220 == -1)
    {
      v19 = _MergedGlobals_1;
      if (!os_log_type_enabled((os_log_t)_MergedGlobals_1, OS_LOG_TYPE_DEBUG))
        goto LABEL_16;
    }
    else
    {
      dispatch_once(&qword_253E9A220, &__block_literal_global_1);
      v19 = _MergedGlobals_1;
      if (!os_log_type_enabled((os_log_t)_MergedGlobals_1, OS_LOG_TYPE_DEBUG))
      {
LABEL_16:
        if (a4)
        {
LABEL_17:
          objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("VLLocalizationDataProviderErrorDomain"), 2, 0);
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
LABEL_18:
        _Block_object_dispose(&v34, 8);
        _Block_object_dispose(&v38, 8);
        _Block_object_dispose(buf, 8);
        v13 = 0;
        goto LABEL_19;
      }
    }
    v20 = a3->var0;
    v21 = a3->var1;
    v22 = a3->var2;
    v23 = a3->var3;
    *(_DWORD *)v55 = 67175425;
    *(_DWORD *)&v55[4] = v20;
    *(_WORD *)&v55[8] = 1025;
    *(_DWORD *)&v55[10] = v21;
    *(_WORD *)&v55[14] = 1025;
    v56 = v22;
    v57 = 1025;
    v58 = v23;
    _os_log_impl(&dword_210B26000, v19, OS_LOG_TYPE_DEBUG, "Tile %{private}i_%{private}i_%{private}i:%{private}i is not supported/available.", v55, 0x1Au);
    goto LABEL_16;
  }
  if (qword_253E9A220 != -1)
  {
    dispatch_once(&qword_253E9A220, &__block_literal_global_1);
    v8 = _MergedGlobals_1;
    if (!os_log_type_enabled((os_log_t)_MergedGlobals_1, OS_LOG_TYPE_INFO))
      goto LABEL_5;
    goto LABEL_4;
  }
  v8 = _MergedGlobals_1;
  if (os_log_type_enabled((os_log_t)_MergedGlobals_1, OS_LOG_TYPE_INFO))
  {
LABEL_4:
    v9 = a3->var0;
    v10 = a3->var1;
    v11 = a3->var2;
    v12 = a3->var3;
    *(_DWORD *)buf = 67109888;
    *(_DWORD *)&buf[4] = v9;
    LOWORD(v60) = 1024;
    *(_DWORD *)((char *)&v60 + 2) = v10;
    HIWORD(v60) = 1024;
    *(_DWORD *)v61 = v11;
    *(_WORD *)&v61[4] = 1024;
    *(_DWORD *)&v61[6] = v12;
    _os_log_impl(&dword_210B26000, v8, OS_LOG_TYPE_INFO, "Returning cached track data: <z: %i, x: %i, y: %i, uncertainty: %i>", buf, 0x1Au);
  }
LABEL_5:
  objc_msgSend((id)v50[5], "fileURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_19:
  _Block_object_dispose(&v49, 8);

  return v13;
}

void __42__VLTileDataProvider_fileURLForKey_error___block_invoke(_QWORD *a1)
{
  _QWORD *v1;
  void *v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = (_QWORD *)a1[4];
  v2 = (void *)v1[17];
  if (v2)
  {
    v3 = (uint64_t *)a1[6];
    v5 = v1[15];
    v4 = v1[16];
    v7 = *v3;
    v6 = v3[1];
    if (v5 == v7 && v4 == v6)
      objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), v2);
  }
}

__n128 __42__VLTileDataProvider_fileURLForKey_error___block_invoke_17(_QWORD *a1)
{
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  __n128 *v4;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _QWORD *v14;
  _OWORD *v15;
  __n128 result;
  uint64_t v17;

  v1 = a1[4];
  v2 = (_QWORD *)(v1 + 48);
  v3 = *(_QWORD **)(v1 + 56);
  v4 = (__n128 *)a1[8];
  if (v3 == v2)
  {
LABEL_7:
    v3 = v2;
  }
  else
  {
    while (v3[2] != v4->n128_u64[0] || v3[3] != v4->n128_u64[1])
    {
      v3 = (_QWORD *)v3[1];
      if (v3 == v2)
        goto LABEL_7;
    }
  }
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = v3 != v2;
  v6 = a1[4];
  v7 = (_QWORD *)(v6 + 72);
  v8 = *(_QWORD **)(v6 + 80);
  if (v8 == v7)
  {
LABEL_14:
    v8 = v7;
  }
  else
  {
    while (v8[2] != v4->n128_u64[0] || v8[3] != v4->n128_u64[1])
    {
      v8 = (_QWORD *)v8[1];
      if (v8 == v7)
        goto LABEL_14;
    }
  }
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = v8 != v7;
  v10 = a1[4];
  v11 = (_QWORD *)(v10 + 96);
  v12 = *(_QWORD **)(v10 + 104);
  if (v12 == v11)
  {
LABEL_21:
    v12 = v11;
  }
  else
  {
    while (v12[2] != v4->n128_u64[0] || v12[3] != v4->n128_u64[1])
    {
      v12 = (_QWORD *)v12[1];
      if (v12 == v11)
        goto LABEL_21;
    }
  }
  *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = v12 != v11;
  if (!*(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24)
    && !*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24)
    && !*(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24))
  {
    v14 = (_QWORD *)a1[4];
    v15 = operator new(0x20uLL);
    result = *v4;
    v15[1] = *v4;
    v17 = v14[6];
    v14 += 6;
    *(_QWORD *)v15 = v17;
    *((_QWORD *)v15 + 1) = v14;
    *(_QWORD *)(v17 + 8) = v15;
    *v14 = v15;
    ++v14[2];
  }
  return result;
}

void __42__VLTileDataProvider_fileURLForKey_error___block_invoke_18(uint64_t a1, void *a2, void *a3)
{
  id *WeakRetained;
  id *v6;
  id v7;
  _QWORD *v8;
  id v9;
  void *v10;
  uint64_t v11;
  __int128 v12;
  uint64_t i;
  void *v14;
  void *v15;
  uint64_t v16;
  unint64_t v17;
  unsigned int v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  NSObject *v22;
  const char *v23;
  void *v24;
  char v25;
  unint64_t v26;
  unsigned int v27;
  unsigned int v28;
  uint64_t v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  int v34;
  unsigned int v35;
  id v36;
  int v37;
  unsigned int v38;
  int v39;
  int8x16_t v40;
  int8x16_t v41;
  NSObject *v42;
  int v43;
  int v44;
  int v45;
  int v46;
  NSObject *v47;
  int v48;
  int v49;
  int v50;
  id v51;
  NSObject *v52;
  NSObject *v53;
  const char *j;
  __int128 v55;
  __int8 v56;
  id *v57;
  unsigned int v58;
  id v59;
  _DWORD *v60;
  __int8 v61;
  id v62;
  id obj;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  void *context;
  id v68;
  unsigned int v69;
  char v70[8];
  int v71;
  char v72;
  _QWORD v73[5];
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  int8x16_t v79;
  uint8_t buf[4];
  _BYTE v81[10];
  _BYTE v82[6];
  __int16 v83;
  int v84;
  uint64_t v85;
  uint64_t *v86;
  uint64_t v87;
  char v88;
  uint64_t v89;
  int8x16x2_t v90;

  v89 = *MEMORY[0x24BDAC8D0];
  v59 = a2;
  v62 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (!WeakRetained)
    goto LABEL_79;
  if (v62)
  {
    v73[0] = MEMORY[0x24BDAC760];
    v73[1] = 3221225472;
    v73[2] = __42__VLTileDataProvider_fileURLForKey_error___block_invoke_2;
    v73[3] = &unk_24CA9B8C0;
    v73[4] = WeakRetained;
    v74 = *(_OWORD *)(a1 + 40);
    geo_isolate_sync_data();
    goto LABEL_79;
  }
  v57 = WeakRetained;
  v7 = WeakRetained[23];
  v8 = v73;
  v9 = v59;
  v68 = v7;
  v75 = 0u;
  v76 = 0u;
  v77 = 0u;
  v78 = 0u;
  objc_msgSend(v9, "tiles");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  obj = v10;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v75, &v85, 16);
  v60 = (_DWORD *)(a1 + 40);
  if (!v11)
    goto LABEL_67;
  v58 = 0;
  v56 = *MEMORY[0x24BE3CAF0] & 0x7F;
  v65 = *(_QWORD *)v76;
  v69 = *MEMORY[0x24BE3CAF8];
  *((_QWORD *)&v12 + 1) = 0xF0E0D0C0B0A1918;
  *(_QWORD *)&v12 = 67175425;
  v55 = v12;
  do
  {
    v64 = v11;
    for (i = 0; i != v64; ++i)
    {
      if (*(_QWORD *)v76 != v65)
        objc_enumerationMutation(obj);
      v14 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * i);
      context = (void *)MEMORY[0x212BCF144]();
      objc_msgSend(v14, "coord");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v15, "x") != *(_DWORD *)(a1 + 44)
        || objc_msgSend(v15, "y") != *(_DWORD *)(a1 + 48)
        || objc_msgSend(v15, "zoom") != *v60)
      {
        v39 = 1;
        goto LABEL_55;
      }
      v16 = objc_msgSend(v14, "precisionIndexsCount");
      if (v16 != objc_msgSend(v14, "buildIndexsCount"))
        goto LABEL_84;
      v17 = 0;
      v66 = 0;
      v61 = -1;
      while (v17 < objc_msgSend(v14, "buildIndexsCount", v55))
      {
        v18 = objc_msgSend(v14, "buildIndexAtIndex:", v17);
        if (objc_msgSend(v9, "buildsCount") <= (unint64_t)v18)
        {
          if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
            goto LABEL_83;
          *(_WORD *)buf = 0;
          v53 = MEMORY[0x24BDACB70];
          for (j = "Assertion failed: buildIndex < metadata.buildsCount";
                ;
                j = "Assertion failed: tile.precisionIndexsCount == tile.buildIndexsCount")
          {
            _os_log_fault_impl(&dword_210B26000, v53, OS_LOG_TYPE_FAULT, j, buf, 2u);
            do
            {
LABEL_83:
              __break(1u);
LABEL_84:
              ;
            }
            while (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT));
            *(_WORD *)buf = 0;
            v53 = MEMORY[0x24BDACB70];
          }
        }
        objc_msgSend(v9, "buildAtIndex:");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v19, "dataOutputVersion") <= v69)
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend(v19, "dataFormatVersion"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v68, "containsObject:", v24);

          if ((v25 & 1) != 0)
          {
            objc_msgSend(v9, "precisionAtIndex:", objc_msgSend(v14, "precisionIndexAtIndex:", v17));
            v20 = objc_claimAutoreleasedReturnValue();
            v26 = 0;
            v27 = -1;
            while (v26 < -[NSObject precisionsCount](v20, "precisionsCount"))
            {
              v28 = -[NSObject precisionsAtIndex:](v20, "precisionsAtIndex:", v26);
              if (v28 < v27 && v28 >= *(_DWORD *)(a1 + 52))
                v27 = v28;
              ++v26;
            }
            if (v27 == -1)
            {
              if (qword_253E9A220 != -1)
                dispatch_once(&qword_253E9A220, &__block_literal_global_1);
              v31 = (id)_MergedGlobals_1;
              if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
              {
                v33 = objc_msgSend(v19, "identifier");
                v34 = *(_DWORD *)(a1 + 52);
                *(_DWORD *)buf = 134283777;
                *(_QWORD *)v81 = v33;
                *(_WORD *)&v81[8] = 1025;
                *(_DWORD *)v82 = v34;
                _os_log_impl(&dword_210B26000, v31, OS_LOG_TYPE_DEBUG, "Build %{private}llu does not support the requested precision (%{private}i) or higher", buf, 0x12u);
              }
              goto LABEL_42;
            }
            if (v27 >= 0x100)
            {
              if (qword_253E9A220 != -1)
                dispatch_once(&qword_253E9A220, &__block_literal_global_1);
              v31 = (id)_MergedGlobals_1;
              if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
              {
                v32 = objc_msgSend(v19, "identifier");
                *(_DWORD *)buf = 134283777;
                *(_QWORD *)v81 = v32;
                *(_WORD *)&v81[8] = 1025;
                *(_DWORD *)v82 = v27;
                _os_log_impl(&dword_210B26000, v31, OS_LOG_TYPE_ERROR, "Build %{private}llu's best available precision (%{private}i) is larger than UINT8_MAX, which is unsupported", buf, 0x12u);
              }
LABEL_42:

              goto LABEL_35;
            }
            if (!v66
              || (v35 = objc_msgSend(v19, "dataFormatVersion"),
                  v35 > objc_msgSend(v66, "dataFormatVersion"))
              || (v37 = objc_msgSend(v19, "dataFormatVersion"),
                  v37 == objc_msgSend(v66, "dataFormatVersion"))
              && (v38 = objc_msgSend(v19, "dataOutputVersion"),
                  v38 > objc_msgSend(v66, "dataOutputVersion")))
            {
              v36 = v19;

              v61 = v27;
              v66 = v36;
            }
          }
          else
          {
            if (qword_253E9A220 != -1)
              dispatch_once(&qword_253E9A220, &__block_literal_global_1);
            v20 = (id)_MergedGlobals_1;
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
            {
              v30 = objc_msgSend(v19, "identifier");
              *(_DWORD *)buf = 134283521;
              *(_QWORD *)v81 = v30;
              v22 = v20;
              v23 = "Build %{private}llu's data format version is not supported by this client";
              goto LABEL_34;
            }
          }
        }
        else
        {
          if (qword_253E9A220 != -1)
            dispatch_once(&qword_253E9A220, &__block_literal_global_1);
          v20 = (id)_MergedGlobals_1;
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          {
            v21 = objc_msgSend(v19, "identifier");
            *(_DWORD *)buf = 134283521;
            *(_QWORD *)v81 = v21;
            v22 = v20;
            v23 = "Build %{private}llu's data output version is not supported by this client";
LABEL_34:
            _os_log_impl(&dword_210B26000, v22, OS_LOG_TYPE_DEBUG, v23, buf, 0xCu);
          }
        }
LABEL_35:

        ++v17;
      }
      LOBYTE(v8) = v66 != 0;
      if (v66)
      {
        v71 = objc_msgSend(v66, "routingKey");
        v72 = v72 & 0xC0 | objc_msgSend(v66, "dataOutputVersion") & 0x3F;
        v58 = objc_msgSend(v66, "dataFormatVersion");
        v40.i64[0] = objc_msgSend(v66, "identifier");
        v90.val[1] = vextq_s8(v40, v40, 0xFuLL);
        v90.val[1].i8[0] = v56;
        v90.val[1].i8[9] = v61;
        v41.i64[0] = *(_DWORD *)(a1 + 40) & 0x1F | (32 * (*(_DWORD *)(a1 + 44) & 0x1FFFFFu)) | ((unint64_t)(*(_DWORD *)(a1 + 48) & 0x1FFFFF) << 26);
        v90.val[0] = vextq_s8(v40, v41, 6uLL);
        v79 = vqtbl2q_s8(v90, (int8x16_t)xmmword_210BCAAB0);
        goto LABEL_63;
      }
      if (qword_253E9A220 == -1)
      {
        v42 = _MergedGlobals_1;
        if (os_log_type_enabled((os_log_t)_MergedGlobals_1, OS_LOG_TYPE_ERROR))
          goto LABEL_62;
      }
      else
      {
        dispatch_once(&qword_253E9A220, &__block_literal_global_1);
        v42 = _MergedGlobals_1;
        if (os_log_type_enabled((os_log_t)_MergedGlobals_1, OS_LOG_TYPE_ERROR))
        {
LABEL_62:
          v43 = *(_DWORD *)(a1 + 40);
          v44 = *(_DWORD *)(a1 + 44);
          v45 = *(_DWORD *)(a1 + 48);
          v46 = *(_DWORD *)(a1 + 52);
          *(_DWORD *)buf = v55;
          *(_DWORD *)v81 = v43;
          *(_WORD *)&v81[4] = 1025;
          *(_DWORD *)&v81[6] = v44;
          *(_WORD *)v82 = 1025;
          *(_DWORD *)&v82[2] = v45;
          v83 = 1025;
          v84 = v46;
          _os_log_impl(&dword_210B26000, v42, OS_LOG_TYPE_ERROR, "Metadata tile does not contain supported build for tile %{private}i_%{private}i_%{private}i: %{private}i", buf, 0x1Au);
        }
      }
LABEL_63:

      v39 = 0;
LABEL_55:

      objc_autoreleasePoolPop(context);
      if (!v39)
      {

        if ((v8 & 1) == 0)
          goto LABEL_78;
        v85 = 0;
        v86 = &v85;
        v87 = 0x2020000000;
        v88 = 0;
        geo_isolate_sync();
        if (*((_BYTE *)v86 + 24))
        {
          v51 = objc_loadWeakRetained(v57 + 1);
          objc_msgSend(v51, "dataProvider:didChangeFormatVersion:", v57, v58);

        }
        if (qword_253E9A220 == -1)
        {
          v52 = _MergedGlobals_1;
          if (os_log_type_enabled((os_log_t)_MergedGlobals_1, OS_LOG_TYPE_DEBUG))
            goto LABEL_76;
        }
        else
        {
          dispatch_once(&qword_253E9A220, &__block_literal_global_1);
          v52 = _MergedGlobals_1;
          if (os_log_type_enabled((os_log_t)_MergedGlobals_1, OS_LOG_TYPE_DEBUG))
          {
LABEL_76:
            LOWORD(v75) = 0;
            _os_log_impl(&dword_210B26000, v52, OS_LOG_TYPE_DEBUG, "Metadata supports requested data tile. Loading data tile.", (uint8_t *)&v75, 2u);
          }
        }
        v6 = v57;
        objc_msgSend(v57, "_fetchDataTile:originalKey:additionalInfo:", &v79, v60, v70, v55);
        _Block_object_dispose(&v85, 8);
        goto LABEL_79;
      }
    }
    v10 = obj;
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v75, &v85, 16);
  }
  while (v11);
LABEL_67:

  if (qword_253E9A220 == -1)
  {
    v47 = _MergedGlobals_1;
    if (os_log_type_enabled((os_log_t)_MergedGlobals_1, OS_LOG_TYPE_INFO))
      goto LABEL_69;
  }
  else
  {
    dispatch_once(&qword_253E9A220, &__block_literal_global_1);
    v47 = _MergedGlobals_1;
    if (os_log_type_enabled((os_log_t)_MergedGlobals_1, OS_LOG_TYPE_INFO))
    {
LABEL_69:
      v48 = *(_DWORD *)(a1 + 40);
      v49 = *(_DWORD *)(a1 + 44);
      v50 = *(_DWORD *)(a1 + 48);
      *(_DWORD *)buf = 67109632;
      *(_DWORD *)v81 = v48;
      *(_WORD *)&v81[4] = 1024;
      *(_DWORD *)&v81[6] = v49;
      *(_WORD *)v82 = 1024;
      *(_DWORD *)&v82[2] = v50;
      _os_log_impl(&dword_210B26000, v47, OS_LOG_TYPE_INFO, "Tile %i_%i_%i is not supported/available", buf, 0x14u);
    }
  }

LABEL_78:
  v6 = v57;
  geo_isolate_sync_data();
LABEL_79:

}

void __42__VLTileDataProvider_fileURLForKey_error___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  _OWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t *v8;
  uint64_t v9;

  std::list<VLLocalizationDataKey>::remove((_QWORD *)(*(_QWORD *)(a1 + 32) + 48), a1 + 40);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = operator new(0x20uLL);
  v3[1] = *(_OWORD *)(a1 + 40);
  v4 = *(_QWORD **)(v2 + 80);
  v5 = *(_QWORD *)(v2 + 88);
  *(_QWORD *)v3 = v2 + 72;
  *((_QWORD *)v3 + 1) = v4;
  *v4 = v3;
  *(_QWORD *)(v2 + 80) = v3;
  *(_QWORD *)(v2 + 88) = v5 + 1;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(_QWORD *)(v6 + 88);
  if (v7 >= 0x33)
  {
    do
    {
      v8 = *(uint64_t **)(v6 + 72);
      v9 = *v8;
      *(_QWORD *)(v9 + 8) = v8[1];
      *(_QWORD *)v8[1] = v9;
      *(_QWORD *)(v6 + 88) = v7 - 1;
      operator delete(v8);
      v6 = *(_QWORD *)(a1 + 32);
      v7 = *(_QWORD *)(v6 + 88);
    }
    while (v7 > 0x32);
  }
}

void __42__VLTileDataProvider_fileURLForKey_error___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  _OWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t *v8;
  uint64_t v9;

  std::list<VLLocalizationDataKey>::remove((_QWORD *)(*(_QWORD *)(a1 + 32) + 48), a1 + 40);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = operator new(0x20uLL);
  v3[1] = *(_OWORD *)(a1 + 40);
  v4 = *(_QWORD **)(v2 + 104);
  v5 = *(_QWORD *)(v2 + 112);
  *(_QWORD *)v3 = v2 + 96;
  *((_QWORD *)v3 + 1) = v4;
  *v4 = v3;
  *(_QWORD *)(v2 + 104) = v3;
  *(_QWORD *)(v2 + 112) = v5 + 1;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(_QWORD *)(v6 + 112);
  if (v7 >= 0x33)
  {
    do
    {
      v8 = *(uint64_t **)(v6 + 96);
      v9 = *v8;
      *(_QWORD *)(v9 + 8) = v8[1];
      *(_QWORD *)v8[1] = v9;
      *(_QWORD *)(v6 + 112) = v7 - 1;
      operator delete(v8);
      v6 = *(_QWORD *)(a1 + 32);
      v7 = *(_QWORD *)(v6 + 112);
    }
    while (v7 > 0x32);
  }
}

uint64_t __42__VLTileDataProvider_fileURLForKey_error___block_invoke_4(uint64_t result)
{
  int v1;

  v1 = *(_DWORD *)(result + 48);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = v1 != *(_DWORD *)(*(_QWORD *)(result + 32) + 196);
  *(_DWORD *)(*(_QWORD *)(result + 32) + 196) = v1;
  return result;
}

- (void)_fetchDataTile:(uint64_t)a3 originalKey:(_OWORD *)a4 additionalInfo:(uint64_t *)a5
{
  NSObject *v9;
  unint64_t v10;
  int v11;
  uint64_t v12;
  int v13;
  int v14;
  uint64_t v15;
  void *v16;
  qos_class_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  _QWORD v21[4];
  id v22;
  __int128 v23;
  id location;
  uint8_t buf[16];
  int v26;
  __int16 v27;
  int v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  int v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  if (qword_253E9A220 != -1)
  {
    dispatch_once(&qword_253E9A220, &__block_literal_global_1);
    v9 = _MergedGlobals_1;
    if (!os_log_type_enabled((os_log_t)_MergedGlobals_1, OS_LOG_TYPE_INFO))
      goto LABEL_4;
    goto LABEL_3;
  }
  v9 = _MergedGlobals_1;
  if (os_log_type_enabled((os_log_t)_MergedGlobals_1, OS_LOG_TYPE_INFO))
  {
LABEL_3:
    v10 = *(_QWORD *)(a3 + 4);
    v11 = *(unsigned __int8 *)(a3 + 3);
    v12 = *a5;
    v13 = *((_DWORD *)a5 + 2);
    v14 = (HIWORD(v10) | (*(_DWORD *)(a3 + 12) << 16)) & 0x3FFFFFF;
    *(_DWORD *)buf = 67175937;
    *(_DWORD *)&buf[4] = WORD1(v10) & 0x3F;
    *(_WORD *)&buf[8] = 1025;
    *(_DWORD *)&buf[10] = (v10 >> 22) & 0x3FFFFFF;
    *(_WORD *)&buf[14] = 1025;
    v26 = v14;
    v27 = 1025;
    v28 = v11;
    v29 = 2048;
    v30 = v12;
    v31 = 1024;
    v32 = v13;
    _os_log_impl(&dword_210B26000, v9, OS_LOG_TYPE_INFO, "Loading tile %{private}i_%{private}i_%{private}i:%{private}i [%llu:%i] from GeoServices...", buf, 0x2Au);
  }
LABEL_4:
  objc_initWeak(&location, a1);
  *(_OWORD *)buf = *a4;
  v16 = (void *)a1[2];
  v15 = a1[3];
  v17 = qos_class_self();
  v18 = a1[4];
  dispatch_get_global_queue(21, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __64__VLTileDataProvider__fetchDataTile_originalKey_additionalInfo___block_invoke;
  v21[3] = &unk_24CA9B960;
  objc_copyWeak(&v22, &location);
  v23 = *(_OWORD *)buf;
  LODWORD(v20) = v17;
  objc_msgSend(v16, "loadKey:additionalInfo:priority:forClient:options:reason:qos:signpostID:auditToken:callbackQ:beginNetwork:callback:", a3, a5, 3221225469, v15, 3, 4, v20, 0, v18, v19, 0, v21);

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
}

void __64__VLTileDataProvider__fetchDataTile_originalKey_additionalInfo___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  id v8;
  id v9;
  id WeakRetained;
  id v11;
  NSObject *v12;
  int v13;
  unint64_t v14;
  int v15;
  id v16;
  uint8_t buf[4];
  unsigned int v18;
  __int16 v19;
  int v20;
  __int16 v21;
  int v22;
  __int16 v23;
  int v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v11 = v9;
    v16 = v8;
    geo_isolate_sync_data();
    if (v11)
    {
      if (qword_253E9A220 != -1)
        dispatch_once(&qword_253E9A220, &__block_literal_global_1);
      v12 = _MergedGlobals_1;
      if (os_log_type_enabled((os_log_t)_MergedGlobals_1, OS_LOG_TYPE_ERROR))
      {
        v13 = *(_DWORD *)(a2 + 12);
        v14 = *(_QWORD *)(a2 + 4);
        v15 = *(unsigned __int8 *)(a2 + 3);
        *(_DWORD *)buf = 67175683;
        v18 = WORD1(v14) & 0x3F;
        v19 = 1025;
        v20 = (v14 >> 22) & 0x3FFFFFF;
        v21 = 1025;
        v22 = (HIWORD(v14) | (v13 << 16)) & 0x3FFFFFF;
        v23 = 1025;
        v24 = v15;
        v25 = 2114;
        v26 = v11;
        _os_log_impl(&dword_210B26000, v12, OS_LOG_TYPE_ERROR, "Tile failed to load: %{private}i_%{private}i_%{private}i:%{private}i: %{public}@", buf, 0x24u);
      }
      geo_isolate_sync_data();
    }

  }
}

void __64__VLTileDataProvider__fetchDataTile_originalKey_additionalInfo___block_invoke_2(uint64_t a1)
{
  _OWORD *v2;

  v2 = (_OWORD *)(a1 + 56);
  std::list<VLLocalizationDataKey>::remove((_QWORD *)(*(_QWORD *)(a1 + 32) + 48), a1 + 56);
  if (!*(_QWORD *)(a1 + 40))
  {
    *(_OWORD *)(*(_QWORD *)(a1 + 32) + 120) = *v2;
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 136), *(id *)(a1 + 48));
  }
}

void __64__VLTileDataProvider__fetchDataTile_originalKey_additionalInfo___block_invoke_20(uint64_t a1)
{
  uint64_t v2;
  _OWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t *v8;
  uint64_t v9;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = operator new(0x20uLL);
  v3[1] = *(_OWORD *)(a1 + 40);
  v4 = *(_QWORD **)(v2 + 80);
  v5 = *(_QWORD *)(v2 + 88);
  *(_QWORD *)v3 = v2 + 72;
  *((_QWORD *)v3 + 1) = v4;
  *v4 = v3;
  *(_QWORD *)(v2 + 80) = v3;
  *(_QWORD *)(v2 + 88) = v5 + 1;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(_QWORD *)(v6 + 88);
  if (v7 >= 0x33)
  {
    do
    {
      v8 = *(uint64_t **)(v6 + 72);
      v9 = *v8;
      *(_QWORD *)(v9 + 8) = v8[1];
      *(_QWORD *)v8[1] = v9;
      *(_QWORD *)(v6 + 88) = v7 - 1;
      operator delete(v8);
      v6 = *(_QWORD *)(a1 + 32);
      v7 = *(_QWORD *)(v6 + 88);
    }
    while (v7 > 0x32);
  }
}

uint64_t __107__VLTileDataProvider_determineAvailabilityForCoordinate_horizontalAccuracy_purpose_callbackQueue_callback___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

uint64_t __107__VLTileDataProvider_determineAvailabilityForCoordinate_horizontalAccuracy_purpose_callbackQueue_callback___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40), 0);
}

- (VLLocalizationDataProviderDelegate)delegate
{
  return (VLLocalizationDataProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)shouldCacheMetadata
{
  return self->_shouldCacheMetadata;
}

- (void).cxx_destruct
{
  VLTileDataProvider *next;
  _QWORD *prev;
  Class isa;
  VLTileDataProvider *delegate;
  VLTileDataProvider *v7;
  _QWORD *v8;
  Class v9;
  VLTileDataProvider *v10;
  VLTileDataProvider *v11;
  _QWORD *v12;
  Class v13;
  VLTileDataProvider *v14;

  objc_storeStrong((id *)&self->_supportedFormatVersions, 0);
  objc_storeStrong((id *)&self->_lastLoadedMetadata, 0);
  objc_storeStrong((id *)&self->_pendingMetadataTiles, 0);
  objc_storeStrong((id *)&self->_lastLoadedData, 0);
  if (self->_recentUnsupportedTiles.__size_alloc_.__value_)
  {
    prev = self->_recentUnsupportedTiles.__end_.__prev_;
    next = (VLTileDataProvider *)self->_recentUnsupportedTiles.__end_.__next_;
    isa = next->super.isa;
    *((_QWORD *)isa + 1) = prev[1];
    *(_QWORD *)prev[1] = isa;
    self->_recentUnsupportedTiles.__size_alloc_.__value_ = 0;
    if (next != (VLTileDataProvider *)&self->_recentUnsupportedTiles)
    {
      do
      {
        delegate = (VLTileDataProvider *)next->_delegate;
        operator delete(next);
        next = delegate;
      }
      while (delegate != (VLTileDataProvider *)&self->_recentUnsupportedTiles);
    }
  }
  if (self->_recentFailures.__size_alloc_.__value_)
  {
    v8 = self->_recentFailures.__end_.__prev_;
    v7 = (VLTileDataProvider *)self->_recentFailures.__end_.__next_;
    v9 = v7->super.isa;
    *((_QWORD *)v9 + 1) = v8[1];
    *(_QWORD *)v8[1] = v9;
    self->_recentFailures.__size_alloc_.__value_ = 0;
    if (v7 != (VLTileDataProvider *)&self->_recentFailures)
    {
      do
      {
        v10 = (VLTileDataProvider *)v7->_delegate;
        operator delete(v7);
        v7 = v10;
      }
      while (v10 != (VLTileDataProvider *)&self->_recentFailures);
    }
  }
  if (self->_loadingKeys.__size_alloc_.__value_)
  {
    v12 = self->_loadingKeys.__end_.__prev_;
    v11 = (VLTileDataProvider *)self->_loadingKeys.__end_.__next_;
    v13 = v11->super.isa;
    *((_QWORD *)v13 + 1) = v12[1];
    *(_QWORD *)v12[1] = v13;
    self->_loadingKeys.__size_alloc_.__value_ = 0;
    if (v11 != (VLTileDataProvider *)&self->_loadingKeys)
    {
      do
      {
        v14 = (VLTileDataProvider *)v11->_delegate;
        operator delete(v11);
        v11 = v14;
      }
      while (v14 != (VLTileDataProvider *)&self->_loadingKeys);
    }
  }
  objc_storeStrong((id *)&self->_isolation, 0);
  objc_storeStrong((id *)&self->_auditToken, 0);
  objc_storeStrong((id *)&self->_tileLoaderClientID, 0);
  objc_storeStrong((id *)&self->_tileLoader, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
