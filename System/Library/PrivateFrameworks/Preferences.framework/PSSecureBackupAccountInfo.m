@implementation PSSecureBackupAccountInfo

void __PSSecureBackupAccountInfo_block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  if (!PSSecureBackupAccountInfo__secureBackup)
  {
    v2 = objc_alloc_init((Class)getSecureBackupClass());
    v3 = (void *)PSSecureBackupAccountInfo__secureBackup;
    PSSecureBackupAccountInfo__secureBackup = (uint64_t)v2;

  }
  v4 = (void *)PSSecureBackupAccountInfo__accountInfoDict;
  if (!PSSecureBackupAccountInfo__accountInfoDict || *(_BYTE *)(a1 + 48))
  {
    PSSecureBackupAccountInfo__accountInfoDict = 0;

    v13 = 0;
    objc_msgSend((id)PSSecureBackupAccountInfo__secureBackup, "getAccountInfoWithInfo:results:", 0, &v13);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = v13;
    v7 = v13;
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v5;

    objc_storeStrong((id *)&PSSecureBackupAccountInfo__accountInfoDict, v6);
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
      NSLog(CFSTR("Error loading account info: %@"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));

    v4 = (void *)PSSecureBackupAccountInfo__accountInfoDict;
  }
  v10 = objc_msgSend(v4, "copy");
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v10;

}

@end
