@implementation VKTestTileRequester

+ (unsigned)tileProviderIdentifier
{
  return *MEMORY[0x1E0D265A8] + 1;
}

- (void)start
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t i;
  _QWORD *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id obj;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  -[GEOTileRequester tileRequest](self, "tileRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "keyList");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v4)
  {
    v20 = *(_QWORD *)v27;
    do
    {
      v21 = v4;
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v27 != v20)
          objc_enumerationMutation(obj);
        v6 = *(_QWORD **)(*((_QWORD *)&v26 + 1) + 8 * i);
        GEOResourceDevResourcesPath();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "stringByAppendingPathComponent:", CFSTR("Tiles"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%u"), *(_DWORD *)((_BYTE *)v6 + 6) & 0x3F);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "stringByAppendingPathComponent:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%u"), ((*(_QWORD *)((char *)v6 + 1) >> 46) | (*(_DWORD *)((char *)v6 + 9) << 18)) & 0x3FFFFFF);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "stringByAppendingPathComponent:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%u"), *(_DWORD *)((_BYTE *)v6 + 10) & 0x3FFFFFF);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "stringByAppendingPathComponent:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%u"), *(unsigned __int16 *)((char *)v6 + 13) >> 2);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "stringByAppendingPathComponent:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "stringByAppendingPathExtension:", CFSTR("vmp4"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", v24);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[GEOTileRequester delegate](self, "delegate");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D275C0]), "initWithData:", v15);
          objc_msgSend(v16, "tileRequester:receivedData:tileEdition:tileSetDB:tileSet:etag:forKey:userInfo:", self, v17, 1, 1, 0, 0, *v6, v6[1], 0);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("VKTestTileRequesterDomain"), 42, 0);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "tileRequester:receivedError:forKey:", self, v17, *v6, v6[1]);
        }

      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v4);
  }

  -[GEOTileRequester delegate](self, "delegate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "tileRequesterFinished:", self);

}

@end
