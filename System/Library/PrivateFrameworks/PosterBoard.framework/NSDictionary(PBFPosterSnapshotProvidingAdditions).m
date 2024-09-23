@implementation NSDictionary(PBFPosterSnapshotProvidingAdditions)

- (id)posterSnapshotForRequest:()PBFPosterSnapshotProvidingAdditions definition:error:
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = v9;
  v11 = 0;
  if (v8 && v9)
  {
    objc_msgSend(a1, "objectForKey:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "image");
    v11 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "error");
    v13 = objc_claimAutoreleasedReturnValue();
    if (!(v11 | v13))
    {
      v14 = (void *)MEMORY[0x1E0CB35C8];
      v17[0] = CFSTR("definition");
      v17[1] = CFSTR("request");
      v18[0] = v10;
      v18[1] = v8;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "pbf_generalErrorWithCode:userInfo:", 7, v15);
      v13 = objc_claimAutoreleasedReturnValue();

    }
    if (a5 && v13)
      *a5 = objc_retainAutorelease((id)v13);

  }
  return (id)v11;
}

- (void)purgeSnapshotsForRequest:()PBFPosterSnapshotProvidingAdditions
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(a3, "definitions", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(a1, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "cancel");

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (void)fetchPosterSnapshotForRequest:()PBFPosterSnapshotProvidingAdditions definition:completion:
{
  void (**v8)(id, void *, _QWORD);
  void *v9;
  uint64_t v10;

  if (a5)
  {
    v10 = 0;
    v8 = a5;
    objc_msgSend(a1, "posterSnapshotForRequest:definition:error:", a3, a4, &v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, v9, v10);

  }
}

- (uint64_t)prewarmSnapshotsForRequests:()PBFPosterSnapshotProvidingAdditions completion:
{
  uint64_t result;

  if (a4)
    return (*(uint64_t (**)(uint64_t, _QWORD))(a4 + 16))(a4, 0);
  return result;
}

@end
