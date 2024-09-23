@implementation KeychainCopyCurrentIdentity

void __KeychainCopyCurrentIdentity_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  __int128 v8;
  id v9;
  id v10;
  id v11[2];
  _QWORD block[4];
  id v13;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;

  v5 = a2;
  v6 = a3;
  v7 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __KeychainCopyCurrentIdentity_block_invoke_2;
  block[3] = &unk_1E553E430;
  v8 = *(_OWORD *)(a1 + 72);
  v16 = *(_OWORD *)(a1 + 56);
  v17 = v8;
  *(_OWORD *)v11 = *(_OWORD *)(a1 + 40);
  v13 = v5;
  v14 = v6;
  v9 = v11[0];
  v15 = *(_OWORD *)v11;
  v10 = v6;
  v11[0] = v5;
  dispatch_sync(v7, block);

}

intptr_t __KeychainCopyCurrentIdentity_block_invoke_2(intptr_t result)
{
  intptr_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  const void *SHA1;
  PCSCurrentIdentity *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 56) + 8) + 24))
  {
    v1 = result;
    objc_msgSend(*(id *)(result + 32), "persistentRef");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v2 || (v3 = *(_QWORD *)(v1 + 40), v2, v3))
    {
      v4 = *(void **)(v1 + 40);
      if (v4)
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 64) + 8) + 24) = v4;
      pcsLogObjForScope("ckks");
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v6 = *(_QWORD *)(v1 + 80);
        v7 = *(_QWORD *)(v1 + 40);
        *(_DWORD *)buf = 138543618;
        v17 = v6;
        v18 = 2114;
        v19 = v7;
        _os_log_impl(&dword_1A9508000, v5, OS_LOG_TYPE_DEFAULT, "Failed to get CKKS current service %{public}@: %{public}@", buf, 0x16u);
      }

    }
    objc_msgSend(*(id *)(v1 + 32), "persistentRef");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(*(id *)(v1 + 32), "persistentRef");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      SHA1 = (const void *)PCSIdentityCreateFromPersistentReferenceAndGetSHA1(v9, *(void **)(*(_QWORD *)(v1 + 88) + 40), 0);

      if (SHA1)
      {
        if ((_PCSIdentityHavePCSCKKSAttributes((uint64_t)SHA1) & 1) != 0)
        {
          v11 = [PCSCurrentIdentity alloc];
          objc_msgSend(*(id *)(v1 + 32), "currentItemPointerModificationTime");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = -[PCSCurrentIdentity initWithIdentity:currentItemPointerModificationTime:](v11, "initWithIdentity:currentItemPointerModificationTime:", SHA1, v12);
          v14 = *(_QWORD *)(*(_QWORD *)(v1 + 72) + 8);
          v15 = *(void **)(v14 + 40);
          *(_QWORD *)(v14 + 40) = v13;

        }
        else
        {
          _PCSError((const void **)(*(_QWORD *)(*(_QWORD *)(v1 + 64) + 8) + 24), 106, CFSTR("Identity missing CKKS attributes: %@"), SHA1);
        }
        CFRelease(SHA1);
      }
    }
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v1 + 48));
  }
  return result;
}

CFIndex __KeychainCopyCurrentIdentity_block_invoke_101(uint64_t a1)
{
  uint64_t v2;
  const void *v3;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = *(const void **)(v2 + 24);
  if (v3)
  {
    *(_QWORD *)(v2 + 24) = 0;
    CFRelease(v3);
    v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  }
  return _PCSError((const void **)(v2 + 24), 27, CFSTR("identity timed out fetching from local store"));
}

@end
