@implementation _ICQDeviceInfo

+ (id)templateKeyForPhotos:(unint64_t)a3 video:(unint64_t)a4
{
  id v6;
  void *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;

  v6 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v7 = v6;
  v8 = CFSTR("xp");
  if (a3 == 1)
    v8 = CFSTR("1p");
  if (a3)
    v9 = v8;
  else
    v9 = CFSTR("0p");
  objc_msgSend(v6, "appendString:", v9);
  v10 = CFSTR("xv");
  if (a4 == 1)
    v10 = CFSTR("1v");
  if (a4)
    v11 = v10;
  else
    v11 = CFSTR("0v");
  objc_msgSend(v7, "appendString:", v11);
  return v7;
}

+ (id)templateKeyForItemCount:(id)a3
{
  id v3;
  void *v4;
  const __CFString *v5;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    if (objc_msgSend(v3, "intValue"))
    {
      if (objc_msgSend(v4, "intValue") == 1)
        v5 = CFSTR("1i");
      else
        v5 = CFSTR("xi");
    }
    else
    {
      v5 = CFSTR("0i");
    }
  }
  else
  {
    v5 = CFSTR("default");
  }

  return (id)v5;
}

+ (id)wordsToReplaceForItemCount:(id)a3
{
  void *v3;
  void *v4;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
    return MEMORY[0x1E0C9AA70];
  v6 = CFSTR("%$ItemCount");
  +[_ICQHelperFunctions getStringFromNumber:](_ICQHelperFunctions, "getStringFromNumber:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (void)getInfoWithBundleId:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.mobileslideshow")))
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __49___ICQDeviceInfo_getInfoWithBundleId_completion___block_invoke;
    v8[3] = &unk_1E8B39A98;
    v9 = v5;
    v10 = v6;
    +[_ICQPhotosInfo getInfoWithCompletion:](_ICQPhotosInfo, "getInfoWithCompletion:", v8);

  }
  else
  {
    +[_ICQDeviceInfo defaultDeviceInfoWithBundleId:](_ICQDeviceInfo, "defaultDeviceInfoWithBundleId:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *, _QWORD))v6 + 2))(v6, v7, 0);

  }
}

+ (id)defaultDeviceInfoWithBundleId:(id)a3
{
  id v3;
  _ICQDeviceInfo *v4;
  id v5;

  v3 = a3;
  v4 = objc_alloc_init(_ICQDeviceInfo);
  -[_ICQDeviceInfo setBundleId:](v4, "setBundleId:", v3);

  -[_ICQDeviceInfo setKey:](v4, "setKey:", CFSTR("default"));
  v5 = objc_alloc_init(MEMORY[0x1E0C99D80]);
  -[_ICQDeviceInfo setWordsToReplace:](v4, "setWordsToReplace:", v5);

  return v4;
}

+ (id)getInfoWithBundleId:(id)a3
{
  id v3;
  dispatch_semaphore_t v4;
  NSObject *v5;
  dispatch_time_t v6;
  id v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *, void *);
  void *v13;
  NSObject *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v3 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__6;
  v20 = __Block_byref_object_dispose__6;
  v21 = 0;
  v4 = dispatch_semaphore_create(0);
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __38___ICQDeviceInfo_getInfoWithBundleId___block_invoke;
  v13 = &unk_1E8B39AC0;
  v15 = &v16;
  v5 = v4;
  v14 = v5;
  +[_ICQDeviceInfo getInfoWithBundleId:completion:](_ICQDeviceInfo, "getInfoWithBundleId:completion:", v3, &v10);
  v6 = dispatch_time(0, 1000000000);
  if (dispatch_semaphore_wait(v5, v6))
  {
    +[_ICQDeviceInfo defaultDeviceInfoWithBundleId:](_ICQDeviceInfo, "defaultDeviceInfoWithBundleId:", v3, v10, v11, v12, v13);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = (id)v17[5];
  }
  v8 = v7;

  _Block_object_dispose(&v16, 8);
  return v8;
}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
  objc_storeStrong((id *)&self->_key, a3);
}

- (NSDictionary)wordsToReplace
{
  return self->_wordsToReplace;
}

- (void)setWordsToReplace:(id)a3
{
  objc_storeStrong((id *)&self->_wordsToReplace, a3);
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
  objc_storeStrong((id *)&self->_bundleId, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleId, 0);
  objc_storeStrong((id *)&self->_wordsToReplace, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

@end
