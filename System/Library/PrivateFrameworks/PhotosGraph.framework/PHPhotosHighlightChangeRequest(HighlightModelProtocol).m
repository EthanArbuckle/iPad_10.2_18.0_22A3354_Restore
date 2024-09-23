@implementation PHPhotosHighlightChangeRequest(HighlightModelProtocol)

- (uint64_t)clearCurations
{
  objc_msgSend(a1, "clearCurationWithType:", 1);
  return objc_msgSend(a1, "clearCurationWithType:", 2);
}

- (void)enumerateMomentChangeRequestsForUUIDs:()HighlightModelProtocol inPhotoLibrary:usingBlock:
{
  id v7;
  void (**v8)(id, void *, void *, _BYTE *);
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned __int8 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  objc_msgSend(a4, "librarySpecificFetchOptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("uuid IN %@"), v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPredicate:", v10);

  objc_msgSend(MEMORY[0x1E0CD13B8], "fetchMomentsWithOptions:", v9);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v21;
LABEL_3:
    v15 = 0;
    while (1)
    {
      if (*(_QWORD *)v21 != v14)
        objc_enumerationMutation(v11);
      v16 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v15);
      objc_msgSend(MEMORY[0x1E0CD1678], "changeRequestForMoment:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 0;
      objc_msgSend(v16, "uuid");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v8[2](v8, v17, v18, &v19);

      LODWORD(v18) = v19;
      if ((_DWORD)v18)
        break;
      if (v13 == ++v15)
      {
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        if (v13)
          goto LABEL_3;
        break;
      }
    }
  }

}

@end
