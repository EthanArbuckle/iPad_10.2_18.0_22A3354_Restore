@implementation PPTemporalClusterStore

- (PPTemporalClusterStore)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PPTemporalClusterStore;
  return -[PPTemporalClusterStore init](&v3, sel_init);
}

- (BOOL)iterRankedTemporalClustersForStartDate:(id)a3 endDate:(id)a4 error:(id *)a5 block:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v15[4];
  id v16;

  v9 = a6;
  v10 = a4;
  v11 = a3;
  +[PPTemporalClusterClient sharedInstance](PPTemporalClusterClient, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __85__PPTemporalClusterStore_iterRankedTemporalClustersForStartDate_endDate_error_block___block_invoke;
  v15[3] = &unk_1E226C1F0;
  v16 = v9;
  v13 = v9;
  LOBYTE(a5) = objc_msgSend(v12, "rankedTemporalClustersForStartDate:endDate:error:handleBatch:", v11, v10, a5, v15);

  return (char)a5;
}

void __85__PPTemporalClusterStore_iterRankedTemporalClustersForStartDate_endDate_error_block___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = v5;
  if (!*a3)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v13;
LABEL_4:
      v11 = 0;
      while (1)
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32));
        if (*a3)
          break;
        if (v9 == ++v11)
        {
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
          if (v9)
            goto LABEL_4;
          break;
        }
      }
    }

  }
}

@end
