@implementation VUIHomeSharingMediaItem_iOS

+ (void)initialize
{
  if (initialize_onceToken_5 != -1)
    dispatch_once(&initialize_onceToken_5, &__block_literal_global_84);
}

- (VUIHomeSharingMediaItem_iOS)initWithMPMediaItem:(id)a3
{
  id v4;
  VUIHomeSharingMediaItem_iOS *v5;
  uint64_t v6;
  HSHomeSharingLibrary *homeSharingLibrary;
  void *v8;
  void *v9;
  uint64_t v10;
  NSString *keyBagFilePath;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)VUIHomeSharingMediaItem_iOS;
  v5 = -[VUILibraryMediaItem_iOS initWithMPMediaItem:](&v13, sel_initWithMPMediaItem_, v4);
  if (v5)
  {
    objc_msgSend(v4, "vui_homeSharingLibrary");
    v6 = objc_claimAutoreleasedReturnValue();
    homeSharingLibrary = v5->_homeSharingLibrary;
    v5->_homeSharingLibrary = (HSHomeSharingLibrary *)v6;

    -[HSHomeSharingLibrary uniqueIdentifier](v5->_homeSharingLibrary, "uniqueIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    HSLibraryCacheDirectoryForIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringByAppendingPathComponent:", CFSTR("Tokens"));
    v10 = objc_claimAutoreleasedReturnValue();
    keyBagFilePath = v5->_keyBagFilePath;
    v5->_keyBagFilePath = (NSString *)v10;

  }
  return v5;
}

- (id)imageLoader
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  +[VUIMediaLibraryManager defaultManager](VUIMediaLibraryManager, "defaultManager", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "homeShareMediaLibraries");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v9, "mediaLibrary");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[VUILibraryMediaItem_iOS mpMediaLibrary](self, "mpMediaLibrary");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v10, "isEqual:", v11);

          if (v12)
          {
            v13 = v9;
            goto LABEL_12;
          }
        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v6)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_12:

  return v13;
}

- (id)mediaItemURL
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  -[VUIHomeSharingMediaItem_iOS mediaItemURLInternal](self, "mediaItemURLInternal");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[VUILibraryMediaItem_iOS ml3Track](self, "ml3Track");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "valueForProperty:", *MEMORY[0x1E0D50D40]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3500], "punctuationCharacterSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByTrimmingCharactersInSet:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[VUILibraryMediaItem_iOS ml3Track](self, "ml3Track");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "valueForProperty:", *MEMORY[0x1E0D50E28]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(v9, "unsignedLongLongValue");
    v11 = (void *)MEMORY[0x1E0D335D0];
    -[VUIHomeSharingMediaItem_iOS homeSharingLibrary](self, "homeSharingLibrary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "requestWithDatabaseID:itemID:format:", objc_msgSend(v12, "databaseID"), v10, v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[VUIHomeSharingMediaItem_iOS homeSharingLibrary](self, "homeSharingLibrary");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "urlForRequest:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3998]), "initWithURL:resolvingAgainstBaseURL:", v15, 1);
    objc_msgSend(v16, "setScheme:", CFSTR("home-sharing"));
    objc_msgSend(v16, "URL");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIHomeSharingMediaItem_iOS setMediaItemURLInternal:](self, "setMediaItemURLInternal:", v17);

  }
  return -[VUIHomeSharingMediaItem_iOS mediaItemURLInternal](self, "mediaItemURLInternal");
}

- (BOOL)hasTrait:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DB1D98]) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DB1DA0]) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DB1D88]) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)VUIHomeSharingMediaItem_iOS;
    v5 = -[VUILibraryMediaItem_iOS hasTrait:](&v7, sel_hasTrait_, v4);
  }

  return v5;
}

- (id)mediaItemMetadataForProperty:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DB1B50]))
  {
    v5 = objc_alloc(MEMORY[0x1E0C99E98]);
    -[VUIHomeSharingMediaItem_iOS keyBagFilePath](self, "keyBagFilePath");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initFileURLWithPath:", v6);

  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)VUIHomeSharingMediaItem_iOS;
    -[VUILibraryMediaItem_iOS mediaItemMetadataForProperty:](&v9, sel_mediaItemMetadataForProperty_, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (void)prepareForLoadingWithCompletion:(id)a3
{
  id v3;
  objc_super v4;
  _QWORD v5[4];
  VUIHomeSharingMediaItem_iOS *v6;
  id v7;

  v5[1] = 3221225472;
  v5[2] = __63__VUIHomeSharingMediaItem_iOS_prepareForLoadingWithCompletion___block_invoke;
  v5[3] = &unk_1E9F9C5B0;
  v6 = self;
  v7 = a3;
  v4.receiver = v6;
  v4.super_class = (Class)VUIHomeSharingMediaItem_iOS;
  v5[0] = MEMORY[0x1E0C809B0];
  v3 = v7;
  -[VUILibraryMediaItem_iOS prepareForLoadingWithCompletion:](&v4, sel_prepareForLoadingWithCompletion_, v5);

}

- (void)cleanUpMediaItem
{
  objc_super v3;

  -[VUIHomeSharingMediaItem_iOS setLoadingContext:](self, "setLoadingContext:", -[VUIHomeSharingMediaItem_iOS loadingContext](self, "loadingContext") + 1);
  -[VUIHomeSharingMediaItem_iOS setMediaItemURLInternal:](self, "setMediaItemURLInternal:", 0);
  v3.receiver = self;
  v3.super_class = (Class)VUIHomeSharingMediaItem_iOS;
  -[VUILibraryMediaItem_iOS cleanUpMediaItem](&v3, sel_cleanUpMediaItem);
}

- (void)updateBookmarkWithSuggestedTime:(double)a3 forElapsedTime:(double)a4 duration:(double)a5 playbackOfMediaItemIsEnding:(BOOL)a6
{
  void *v8;
  void *v9;
  void *v10;
  id v11;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array", a6, a3, a4, a5);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 > 0.0)
  {
    objc_msgSend(v11, "addObject:", MEMORY[0x1E0C9AAB0]);
    objc_msgSend(v8, "addObject:", *MEMORY[0x1E0D50DF8]);
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3 * 1000.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObject:", v9);

  objc_msgSend(v8, "addObject:", *MEMORY[0x1E0D50C18]);
  -[VUILibraryMediaItem_iOS ml3Track](self, "ml3Track");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setValues:forProperties:async:withCompletionBlock:", v11, v8, 1, 0);

}

- (void)updatePlayCountForElapsedTime:(double)a3 duration:(double)a4
{
  double v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DB1960], "playedThresholdTimeForDuration:", a4);
  if (v6 <= a3)
  {
    -[VUILibraryMediaItem_iOS ml3Track](self, "ml3Track");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *MEMORY[0x1E0D50F50];
    objc_msgSend(v7, "valueForProperty:", *MEMORY[0x1E0D50F50]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "unsignedIntegerValue");

    -[VUILibraryMediaItem_iOS ml3Track](self, "ml3Track");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v10 + 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setValues:forProperties:async:withCompletionBlock:", v13, v14, 1, 0);

  }
}

- (BOOL)shouldRetryPlaybackForError:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  BOOL v8;
  uint8_t v10[16];

  v4 = a3;
  objc_msgSend(v4, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "isEqualToString:", CFSTR("TVPlaybackErrorDomain")))
  {

    goto LABEL_7;
  }
  v6 = objc_msgSend(v4, "code");

  if (v6 != 811)
  {
LABEL_7:
    v8 = 0;
    goto LABEL_8;
  }
  v7 = sLogObject_11;
  if (os_log_type_enabled((os_log_t)sLogObject_11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_1D96EE000, v7, OS_LOG_TYPE_DEFAULT, "Will retry playback and perform keybag sync", v10, 2u);
  }
  v8 = 1;
  -[VUIHomeSharingMediaItem_iOS setNeedsKeyBagSyncPriorToPlayback:](self, "setNeedsKeyBagSyncPriorToPlayback:", 1);
LABEL_8:

  return v8;
}

- (void)_fetchKeybagForDSID:(id)a3 isFamilyAccount:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  NSObject *v10;
  const __CFString *v11;
  uint64_t v12;
  id v13;
  void (**v14)(_QWORD);
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  void (**v25)(_QWORD);
  BOOL v26;
  _QWORD aBlock[4];
  id v28;
  uint8_t buf[4];
  const __CFString *v30;
  uint64_t v31;

  v6 = a4;
  v31 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = sLogObject_11;
  if (os_log_type_enabled((os_log_t)sLogObject_11, OS_LOG_TYPE_DEFAULT))
  {
    v11 = CFSTR("NO");
    if (v6)
      v11 = CFSTR("YES");
    *(_DWORD *)buf = 138412290;
    v30 = v11;
    _os_log_impl(&dword_1D96EE000, v10, OS_LOG_TYPE_DEFAULT, "Starting keybag fetch.  Is family account? %@", buf, 0xCu);
  }
  v12 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __78__VUIHomeSharingMediaItem_iOS__fetchKeybagForDSID_isFamilyAccount_completion___block_invoke;
  aBlock[3] = &unk_1E9F98E68;
  v13 = v9;
  v28 = v13;
  v14 = (void (**)(_QWORD))_Block_copy(aBlock);
  -[VUIHomeSharingMediaItem_iOS homeSharingLibrary](self, "homeSharingLibrary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "deviceGUID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v16, "length"))
  {
    if (os_log_type_enabled((os_log_t)sLogObject_11, OS_LOG_TYPE_ERROR))
      -[VUIHomeSharingMediaItem_iOS _fetchKeybagForDSID:isFamilyAccount:completion:].cold.1();
    goto LABEL_12;
  }
  v17 = objc_msgSend(v8, "unsignedLongLongValue");
  if (!v17)
  {
    if (os_log_type_enabled((os_log_t)sLogObject_11, OS_LOG_TYPE_ERROR))
      -[VUIHomeSharingMediaItem_iOS _fetchKeybagForDSID:isFamilyAccount:completion:].cold.2();
LABEL_12:
    v14[2](v14);
    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x1E0D335C0], "requestWithDSID:deviceGUID:", v17, v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIHomeSharingMediaItem_iOS keyBagFilePath](self, "keyBagFilePath");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIHomeSharingMediaItem_iOS homeSharingLibrary](self, "homeSharingLibrary");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v12;
  v22[1] = 3221225472;
  v22[2] = __78__VUIHomeSharingMediaItem_iOS__fetchKeybagForDSID_isFamilyAccount_completion___block_invoke_2;
  v22[3] = &unk_1E9F9F378;
  v23 = v19;
  v24 = v8;
  v26 = v6;
  v25 = v14;
  v21 = v19;
  objc_msgSend(v20, "sendRequest:withResponseHandler:", v18, v22);

LABEL_13:
}

- (BOOL)_loadingCancelled:(unint64_t)a3
{
  return -[VUIHomeSharingMediaItem_iOS loadingContext](self, "loadingContext") != a3;
}

- (HSHomeSharingLibrary)homeSharingLibrary
{
  return self->_homeSharingLibrary;
}

- (void)setHomeSharingLibrary:(id)a3
{
  objc_storeStrong((id *)&self->_homeSharingLibrary, a3);
}

- (NSURL)mediaItemURLInternal
{
  return self->_mediaItemURLInternal;
}

- (void)setMediaItemURLInternal:(id)a3
{
  objc_storeStrong((id *)&self->_mediaItemURLInternal, a3);
}

- (NSString)keyBagFilePath
{
  return self->_keyBagFilePath;
}

- (void)setKeyBagFilePath:(id)a3
{
  objc_storeStrong((id *)&self->_keyBagFilePath, a3);
}

- (BOOL)needsKeyBagSyncPriorToPlayback
{
  return self->_needsKeyBagSyncPriorToPlayback;
}

- (void)setNeedsKeyBagSyncPriorToPlayback:(BOOL)a3
{
  self->_needsKeyBagSyncPriorToPlayback = a3;
}

- (unint64_t)loadingContext
{
  return self->_loadingContext;
}

- (void)setLoadingContext:(unint64_t)a3
{
  self->_loadingContext = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyBagFilePath, 0);
  objc_storeStrong((id *)&self->_mediaItemURLInternal, 0);
  objc_storeStrong((id *)&self->_homeSharingLibrary, 0);
}

- (void)_fetchKeybagForDSID:isFamilyAccount:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_13();
  OUTLINED_FUNCTION_0_10(&dword_1D96EE000, v0, v1, "No device GUID exists", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_14();
}

- (void)_fetchKeybagForDSID:isFamilyAccount:completion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_13();
  OUTLINED_FUNCTION_0_10(&dword_1D96EE000, v0, v1, "DSID is 0", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_14();
}

@end
