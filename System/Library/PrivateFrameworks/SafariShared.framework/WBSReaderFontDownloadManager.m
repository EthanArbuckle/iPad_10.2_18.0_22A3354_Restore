@implementation WBSReaderFontDownloadManager

+ (WBSReaderFontDownloadManager)sharedManager
{
  WBSReaderFontDownloadManager *v2;

  {
    v2 = (WBSReaderFontDownloadManager *)+[WBSReaderFontDownloadManager sharedManager]::sharedInstance;
  }
  else
  {
    v2 = objc_alloc_init(WBSReaderFontDownloadManager);
    +[WBSReaderFontDownloadManager sharedManager]::sharedInstance = (uint64_t)v2;
  }
  return v2;
}

- (WBSReaderFontDownloadManager)init
{
  WBSReaderFontDownloadManager *v2;
  uint64_t v3;
  NSMutableDictionary *fontFamilyToProgress;
  WBSReaderFontDownloadManager *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WBSReaderFontDownloadManager;
  v2 = -[WBSReaderFontDownloadManager init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    fontFamilyToProgress = v2->_fontFamilyToProgress;
    v2->_fontFamilyToProgress = (NSMutableDictionary *)v3;

    v5 = v2;
  }

  return v2;
}

- (BOOL)hasOngoingRequestForFont:(id)a3
{
  NSMutableDictionary *fontFamilyToProgress;
  void *v4;
  void *v5;

  fontFamilyToProgress = self->_fontFamilyToProgress;
  objc_msgSend(a3, "familyName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](fontFamilyToProgress, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(fontFamilyToProgress) = v5 != 0;

  return (char)fontFamilyToProgress;
}

- (double)downloadProgressForFont:(id)a3
{
  NSMutableDictionary *fontFamilyToProgress;
  void *v4;
  void *v5;
  double v6;
  double v7;

  fontFamilyToProgress = self->_fontFamilyToProgress;
  objc_msgSend(a3, "familyName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](fontFamilyToProgress, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValue");
  v7 = v6;

  return v7;
}

- (void)downloadFont:(id)a3
{
  id v4;
  void *v5;
  NSMutableDictionary *fontFamilyToProgress;
  void *v7;
  void *v8;
  const __CFDictionary *v9;
  CTFontDescriptorRef v10;
  const __CFArray *v11;
  _QWORD progressBlock[5];
  id v13;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    fontFamilyToProgress = self->_fontFamilyToProgress;
    objc_msgSend(v4, "familyName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](fontFamilyToProgress, "setObject:forKeyedSubscript:", &unk_1E4B87C28, v7);

    v14[0] = *MEMORY[0x1E0CA8300];
    objc_msgSend(v5, "familyName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14[1] = *MEMORY[0x1E0CA83D0];
    v15[0] = v8;
    v15[1] = &unk_1E4B87C40;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
    v9 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

    v10 = CTFontDescriptorCreateWithAttributes(v9);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v10);
    v11 = (const __CFArray *)objc_claimAutoreleasedReturnValue();
    CFRelease(v10);
    progressBlock[0] = MEMORY[0x1E0C809B0];
    progressBlock[1] = 3221225472;
    progressBlock[2] = __45__WBSReaderFontDownloadManager_downloadFont___block_invoke;
    progressBlock[3] = &unk_1E4B3E800;
    progressBlock[4] = self;
    v13 = v5;
    CTFontDescriptorMatchFontDescriptorsWithProgressHandler(v11, 0, progressBlock);

  }
}

uint64_t __45__WBSReaderFontDownloadManager_downloadFont___block_invoke(uint64_t a1, int a2, void *a3)
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[5];
  id v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[5];
  id v19;
  void *v20;
  _QWORD block[5];
  id v22;
  uint8_t buf[24];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  switch(a2)
  {
    case 0:
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __45__WBSReaderFontDownloadManager_downloadFont___block_invoke_2;
      block[3] = &unk_1E4B2B448;
      v4 = *(void **)(a1 + 40);
      block[4] = *(_QWORD *)(a1 + 32);
      v22 = v4;
      dispatch_async(MEMORY[0x1E0C80D38], block);

      break;
    case 1:
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __45__WBSReaderFontDownloadManager_downloadFont___block_invoke_4;
      v16[3] = &unk_1E4B2B448;
      v5 = *(void **)(a1 + 40);
      v16[4] = *(_QWORD *)(a1 + 32);
      v17 = v5;
      dispatch_async(MEMORY[0x1E0C80D38], v16);

      break;
    case 5:
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __45__WBSReaderFontDownloadManager_downloadFont___block_invoke_3;
      v18[3] = &unk_1E4B2B128;
      v6 = *(_QWORD *)(a1 + 32);
      v7 = *(void **)(a1 + 40);
      v20 = a3;
      v18[4] = v6;
      v19 = v7;
      dispatch_async(MEMORY[0x1E0C80D38], v18);

      break;
    case 8:
      objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0CA8250]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (id)WBS_LOG_CHANNEL_PREFIXReader();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(*(id *)(a1 + 40), "familyName");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "safari_privacyPreservingDescription");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        __45__WBSReaderFontDownloadManager_downloadFont___block_invoke_cold_1(v10, v11, buf, v9);
      }

      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __45__WBSReaderFontDownloadManager_downloadFont___block_invoke_18;
      v14[3] = &unk_1E4B2B448;
      v12 = *(void **)(a1 + 40);
      v14[4] = *(_QWORD *)(a1 + 32);
      v15 = v12;
      dispatch_async(MEMORY[0x1E0C80D38], v14);

      break;
    default:
      return 1;
  }
  return 1;
}

void __45__WBSReaderFontDownloadManager_downloadFont___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v6 = CFSTR("WBSReaderFontDownloadNotificationUserInfoKey");
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:userInfo:", CFSTR("WBSReaderFontDownloadDidBeginNotification"), v4, v5);

}

void __45__WBSReaderFontDownloadManager_downloadFont___block_invoke_3(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 48), "objectForKey:", *MEMORY[0x1E0CA8258]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValue");
  v4 = v3;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  objc_msgSend(*(id *)(a1 + 40), "familyName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, v7);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 40);
  v12 = CFSTR("WBSReaderFontDownloadNotificationUserInfoKey");
  v13[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "postNotificationName:object:userInfo:", CFSTR("WBSReaderFontDownloadProgressDidChangeNotification"), v10, v11);

}

void __45__WBSReaderFontDownloadManager_downloadFont___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  objc_msgSend(*(id *)(a1 + 40), "familyName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectForKey:", v3);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v8 = CFSTR("WBSReaderFontDownloadNotificationUserInfoKey");
  v9[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:userInfo:", CFSTR("WBSReaderFontDownloadDidFinishNotification"), v6, v7);

}

void __45__WBSReaderFontDownloadManager_downloadFont___block_invoke_18(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  objc_msgSend(*(id *)(a1 + 40), "familyName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectForKey:", v3);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v8 = CFSTR("WBSReaderFontDownloadNotificationUserInfoKey");
  v9[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:userInfo:", CFSTR("WBSReaderFontDownloadDidFailNotification"), v6, v7);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fontFamilyToProgress, 0);
}

void __45__WBSReaderFontDownloadManager_downloadFont___block_invoke_cold_1(void *a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543618;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(_QWORD *)(buf + 14) = a2;
  _os_log_error_impl(&dword_1A3D90000, log, OS_LOG_TYPE_ERROR, "Downloading %{public}@ failed: %{public}@", buf, 0x16u);

}

@end
