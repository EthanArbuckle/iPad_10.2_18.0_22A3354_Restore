@implementation PBStreamWriter

+ (id)writeProtoBuffers:(id)a3 toFile:(id)a4
{
  id v5;
  id v6;
  void *v7;
  PBDataWriter *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  PBDataWriter *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *context;
  void *v23;
  id v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  id v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    v23 = v7;
    v24 = v6;
    context = (void *)MEMORY[0x1A85B6664]();
    v8 = objc_alloc_init(PBDataWriter);
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v9 = v5;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v27;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v27 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v13);
          v15 = (void *)MEMORY[0x1A85B6664](v10);
          v16 = objc_alloc_init(PBDataWriter);
          objc_msgSend(v14, "writeTo:", v16, context);
          -[PBDataWriter immutableData](v16, "immutableData");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[PBDataWriter writeProtoBuffer:](v8, "writeProtoBuffer:", v17);

          objc_autoreleasePoolPop(v15);
          ++v13;
        }
        while (v11 != v13);
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
        v11 = v10;
      }
      while (v10);
    }

    -[PBDataWriter immutableData](v8, "immutableData");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0;
    v6 = v24;
    objc_msgSend(v18, "writeToFile:options:error:", v24, 0, &v25);
    v19 = v25;

    objc_autoreleasePoolPop(context);
    v7 = v23;
    if (v19)
      objc_msgSend(v23, "removeItemAtPath:error:", v24, 0);
  }
  else
  {
    v30 = 0;
    objc_msgSend(v7, "removeItemAtPath:error:", v6, &v30);
    v19 = v30;
  }
  v20 = v19;

  return v20;
}

@end
