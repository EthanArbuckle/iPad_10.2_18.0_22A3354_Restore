@implementation PLPairing

- (PLPairing)init
{
  PLPairing *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PLPairing;
  result = -[PLPairing init](&v3, sel_init);
  if (result)
    result->_lock._os_unfair_lock_opaque = 0;
  return result;
}

- (BOOL)processPairingForEntireLibraryInContext:(id)a3 error:(id *)a4
{
  id v7;
  os_unfair_lock_s *p_lock;
  id v9;
  char v10;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  uint64_t *v16;
  id *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  v7 = a3;
  if ((!MEMORY[0x19AEC0720]() || (PLIsAssetsd() & 1) == 0) && (PLIsReallyAssetsd() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPairing.m"), 89, CFSTR("%@: Only do pairing in server"), v13);

  }
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 1;
  p_lock = &self->_lock;
  os_unfair_lock_lock(p_lock);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __59__PLPairing_processPairingForEntireLibraryInContext_error___block_invoke;
  v14[3] = &unk_1E3675800;
  v16 = &v18;
  v9 = v7;
  v15 = v9;
  v17 = a4;
  objc_msgSend(v9, "performBlockAndWait:", v14);
  os_unfair_lock_unlock(p_lock);
  v10 = *((_BYTE *)v19 + 24);

  _Block_object_dispose(&v18, 8);
  return v10;
}

- (BOOL)processPairingForGroupIDs:(id)a3 inContext:(id)a4 deferredProcessingNeeded:(BOOL *)a5 error:(id *)a6
{
  id v11;
  id v12;
  os_unfair_lock_s *p_lock;
  BOOL v14;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  uint64_t *v21;
  BOOL *v22;
  id *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;

  v11 = a3;
  v12 = a4;
  if ((!MEMORY[0x19AEC0720]() || (PLIsAssetsd() & 1) == 0) && (PLIsReallyAssetsd() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPairing.m"), 118, CFSTR("%@: Only do pairing in server"), v17);

  }
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 1;
  if (v11 && !objc_msgSend(v11, "count"))
  {
    v14 = 1;
  }
  else
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(p_lock);
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __80__PLPairing_processPairingForGroupIDs_inContext_deferredProcessingNeeded_error___block_invoke;
    v18[3] = &unk_1E36756C0;
    v19 = v11;
    v21 = &v24;
    v20 = v12;
    v22 = a5;
    v23 = a6;
    objc_msgSend(v20, "performBlockAndWait:", v18);
    os_unfair_lock_unlock(p_lock);
    v14 = *((_BYTE *)v25 + 24) != 0;

  }
  _Block_object_dispose(&v24, 8);

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locatedInUsersPhotoLibrary, 0);
}

void __80__PLPairing_processPairingForGroupIDs_inContext_deferredProcessingNeeded_error___block_invoke(uint64_t a1)
{
  void *v2;
  PLLivePhotoPairingProcessor *v3;
  void *v4;
  uint64_t v5;
  BOOL v6;
  id v7;
  void *v8;
  PLCTMPairingProcessor *v9;
  void *v10;
  uint64_t v11;
  BOOL v12;
  id v13;
  _QWORD *v14;
  _QWORD *v15;
  id v16;
  id v17;

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", &unk_1E375F3A8);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
  {
    v3 = objc_alloc_init(PLLivePhotoPairingProcessor);
    -[PLLivePhotoPairingProcessor fetchRequestForSortedGroupIDs:](v3, "fetchRequestForSortedGroupIDs:", v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 40);
    v17 = 0;
    v6 = -[PLPairingProcessor processPairingForFetchRequest:inContext:error:](v3, "processPairingForFetchRequest:inContext:error:", v4, v5, &v17);
    v7 = v17;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v6;

  }
  else
  {
    v7 = 0;
  }
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", &unk_1E375F3C0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v8, "count"))
    {
      v9 = objc_alloc_init(PLCTMPairingProcessor);
      -[PLCTMPairingProcessor fetchRequestForSortedGroupIDs:](v9, "fetchRequestForSortedGroupIDs:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(a1 + 40);
      v16 = 0;
      v12 = -[PLPairingProcessor processPairingForFetchRequest:inContext:error:](v9, "processPairingForFetchRequest:inContext:error:", v10, v11, &v16);
      v13 = v16;
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v12;

      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
      {
        if (*(_QWORD *)(a1 + 56))
          **(_BYTE **)(a1 + 56) = -[PLCTMPairingProcessor deferredProcessingNeeded](v9, "deferredProcessingNeeded");
      }
      else
      {
        v15 = *(_QWORD **)(a1 + 64);
        if (v15)
          *v15 = objc_retainAutorelease(v13);
      }

    }
  }
  else
  {
    v14 = *(_QWORD **)(a1 + 64);
    if (v14)
      *v14 = objc_retainAutorelease(v7);
    v8 = v2;
  }

}

void __59__PLPairing_processPairingForEntireLibraryInContext_error___block_invoke(_QWORD *a1)
{
  PLLivePhotoPairingProcessor *v2;
  void *v3;
  uint64_t v4;
  BOOL v5;
  id v6;
  PLCTMPairingProcessor *v7;
  void *v8;
  uint64_t v9;
  BOOL v10;
  id v11;
  _QWORD *v12;
  _QWORD *v13;
  id v14;
  id v15;

  v2 = objc_alloc_init(PLLivePhotoPairingProcessor);
  -[PLLivePhotoPairingProcessor fetchRequestForLibrary](v2, "fetchRequestForLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = a1[4];
  v15 = 0;
  v5 = -[PLPairingProcessor processPairingForFetchRequest:inContext:error:](v2, "processPairingForFetchRequest:inContext:error:", v3, v4, &v15);
  v6 = v15;
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = v5;

  if (*(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24))
  {
    v7 = objc_alloc_init(PLCTMPairingProcessor);
    -[PLCTMPairingProcessor fetchRequestForLibrary](v7, "fetchRequestForLibrary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = a1[4];
    v14 = 0;
    v10 = -[PLPairingProcessor processPairingForFetchRequest:inContext:error:](v7, "processPairingForFetchRequest:inContext:error:", v8, v9, &v14);
    v11 = v14;
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = v10;

    if (!*(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24))
    {
      v12 = (_QWORD *)a1[6];
      if (v12)
        *v12 = objc_retainAutorelease(v11);
    }

  }
  else
  {
    v13 = (_QWORD *)a1[6];
    if (v13)
      *v13 = objc_retainAutorelease(v6);
  }

}

@end
