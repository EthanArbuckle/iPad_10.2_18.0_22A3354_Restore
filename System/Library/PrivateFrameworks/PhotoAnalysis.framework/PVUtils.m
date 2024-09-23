@implementation PVUtils

+ (id)faceprintFromFaceprintArchive:(id)a3 error:(id *)a4
{
  objc_class *v5;
  id v6;
  void *v7;

  v5 = (objc_class *)MEMORY[0x1E0CEDEE8];
  v6 = a3;
  v7 = (void *)objc_msgSend([v5 alloc], "initWithState:error:", v6, a4);

  return v7;
}

+ (id)selectRepresentativeFromFaceDescriptors:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  __int128 v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  id v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v26 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v32;
    *(_QWORD *)&v6 = 138412290;
    v25 = v6;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v32 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v9);
        v11 = (void *)MEMORY[0x1D1798448]();
        v12 = objc_msgSend(v10, "faceId");
        objc_msgSend(v10, "faceprint");
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = (void *)v13;
        if (v12 >= 1 && v13 != 0)
        {
          v30 = 0;
          +[PVUtils faceprintFromFaceprintArchive:error:](PVUtils, "faceprintFromFaceprintArchive:error:", v13, &v30);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v30;
          if (v16)
          {
            v18 = objc_alloc_init(MEMORY[0x1E0CEDEE0]);
            objc_msgSend(v18, "setFaceId:", v12);
            objc_msgSend(v18, "setFaceTorsoprint:", v16);
            objc_msgSend(v16, "faceprint");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "setFaceprint:", v19);

            objc_msgSend(v26, "addObject:", v18);
          }
          else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v25;
            v36 = v17;
            _os_log_error_impl(&dword_1CAC16000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to get VNFaceTorsoprint from faceprint data, error:%@", buf, 0xCu);
          }

        }
        objc_autoreleasePoolPop(v11);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
    }
    while (v7);
  }

  if (objc_msgSend(v26, "count"))
  {
    v29 = 0;
    objc_msgSend(MEMORY[0x1E0CEDE00], "representativenessForFaces:error:", v26, &v29);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v29;
    if (v21 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v36 = v21;
      _os_log_error_impl(&dword_1CAC16000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to get representativenessForFaces. Error: %@", buf, 0xCu);
    }
    if (objc_msgSend(v20, "count", v25))
    {
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __51__PVUtils_selectRepresentativeFromFaceDescriptors___block_invoke;
      v27[3] = &unk_1E851F4B8;
      v28 = v20;
      objc_msgSend(v4, "sortedArrayUsingComparator:", v27);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "lastObject");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v23 = 0;
    }

  }
  else
  {
    v23 = 0;
  }

  return v23;
}

uint64_t __51__PVUtils_selectRepresentativeFromFaceDescriptors___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;

  v5 = *(void **)(a1 + 32);
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a3;
  objc_msgSend(v6, "numberWithInteger:", objc_msgSend(a2, "faceId"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v8);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
    v11 = (void *)v9;
  else
    v11 = &unk_1E8540310;
  v12 = v11;

  v13 = *(void **)(a1 + 32);
  v14 = (void *)MEMORY[0x1E0CB37E8];
  v15 = objc_msgSend(v7, "faceId");

  objc_msgSend(v14, "numberWithInteger:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", v16);
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)v17;
  if (v17)
    v19 = (void *)v17;
  else
    v19 = &unk_1E8540310;
  v20 = v19;

  v21 = objc_msgSend(v12, "compare:", v20);
  return v21;
}

@end
