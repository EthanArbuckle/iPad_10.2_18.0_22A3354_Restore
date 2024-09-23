@implementation QLCacheDeleteHandler

uint64_t __67__QLCacheDeleteHandler_setUpCacheDeleteWithThumbnailAdditionIndex___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v15;
  _QWORD v16[2];
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_VOLUME"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _log_2();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v18 = v5;
    v19 = 1024;
    v20 = a2;
    _os_log_impl(&dword_1D54AE000, v6, OS_LOG_TYPE_INFO, "#CacheDelete computing purgeable space on %@ with urgency %d", buf, 0x12u);
  }

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[QLCacheDeleteHandler dateBeforePurgingThumbnailsForUrgency:](QLCacheDeleteHandler, "dateBeforePurgingThumbnailsForUrgency:", a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(*(id *)(a1 + 32), "purgeableSpaceOnMountPoint:withUrgency:beforeDate:", v7, a2, v8);
  objc_msgSend((id)QLServerThreadInstance, "cacheThreadForVolume:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "purgeableSpaceOnMountPoint:withUrgency:beforeDate:", v7, a2, v8);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v11 + v9, CFSTR("CACHE_DELETE_VOLUME"), CFSTR("CACHE_DELETE_AMOUNT"), v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 2);
  v13 = objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)dateBeforePurgingThumbnailsForUrgency:(int)a3
{
  double v3;
  NSObject *v5;

  if ((a3 + 1) >= 6)
  {
    _log_2();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      +[QLCacheDeleteHandler dateBeforePurgingThumbnailsForUrgency:].cold.1(a3, v5);

    v3 = 978307200.0;
  }
  else
  {
    v3 = dbl_1D5500950[a3 + 1];
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (void)setUpCacheDeleteWithThumbnailAdditionIndex:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD aBlock[4];
  id v24;

  v3 = a3;
  v4 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __67__QLCacheDeleteHandler_setUpCacheDeleteWithThumbnailAdditionIndex___block_invoke;
  aBlock[3] = &unk_1E99D2B60;
  v5 = v3;
  v24 = v5;
  v6 = _Block_copy(aBlock);
  v21[0] = v4;
  v21[1] = 3221225472;
  v21[2] = __67__QLCacheDeleteHandler_setUpCacheDeleteWithThumbnailAdditionIndex___block_invoke_7;
  v21[3] = &unk_1E99D2B60;
  v7 = v5;
  v22 = v7;
  v8 = _Block_copy(v21);
  v19[0] = v4;
  v19[1] = 3221225472;
  v19[2] = __67__QLCacheDeleteHandler_setUpCacheDeleteWithThumbnailAdditionIndex___block_invoke_8;
  v19[3] = &unk_1E99D2B88;
  v20 = v7;
  v9 = v7;
  v15[0] = v4;
  v15[1] = 3221225472;
  v15[2] = __67__QLCacheDeleteHandler_setUpCacheDeleteWithThumbnailAdditionIndex___block_invoke_2;
  v15[3] = &unk_1E99D2BB0;
  v16 = v6;
  v17 = v8;
  v18 = _Block_copy(v19);
  v10 = setUpCacheDeleteWithThumbnailAdditionIndex__once;
  v11 = v18;
  v12 = v8;
  v13 = v6;
  if (v10 != -1)
    dispatch_once(&setUpCacheDeleteWithThumbnailAdditionIndex__once, v15);
  dispatch_get_global_queue(9, 0);
  v14 = objc_claimAutoreleasedReturnValue();
  xpc_set_event_stream_handler("com.apple.distnoted.matching", v14, &__block_literal_global_1);

}

uint64_t __67__QLCacheDeleteHandler_setUpCacheDeleteWithThumbnailAdditionIndex___block_invoke_7(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v15;
  _QWORD v16[2];
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_VOLUME"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _log_2();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v18 = v5;
    v19 = 1024;
    v20 = a2;
    _os_log_impl(&dword_1D54AE000, v6, OS_LOG_TYPE_INFO, "#CacheDelete purging on %@ with urgency %d", buf, 0x12u);
  }

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[QLCacheDeleteHandler dateBeforePurgingThumbnailsForUrgency:](QLCacheDeleteHandler, "dateBeforePurgingThumbnailsForUrgency:", a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)QLServerThreadInstance, "cacheThreadForVolume:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(*(id *)(a1 + 32), "purgeOnMountPoint:withUrgency:beforeDate:", v7, a2, v8);
  v11 = objc_msgSend(v9, "purgeOnMountPoint:withUrgency:beforeDate:", v7, a2, v8);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v11 + v10, CFSTR("CACHE_DELETE_VOLUME"), CFSTR("CACHE_DELETE_AMOUNT"), v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 2);
  v13 = objc_claimAutoreleasedReturnValue();

  return v13;
}

uint64_t __67__QLCacheDeleteHandler_setUpCacheDeleteWithThumbnailAdditionIndex___block_invoke_8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancelCacheDeletePurge");
}

uint64_t __67__QLCacheDeleteHandler_setUpCacheDeleteWithThumbnailAdditionIndex___block_invoke_2()
{
  return CacheDeleteRegisterInfoCallbacks();
}

void __67__QLCacheDeleteHandler_setUpCacheDeleteWithThumbnailAdditionIndex___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  const char *string;
  const char *v4;
  void *v5;
  void *v6;
  int v7;
  const char *v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  const char *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  string = xpc_dictionary_get_string(v2, "Name");
  v4 = xpc_dictionary_get_string(v2, (const char *)*MEMORY[0x1E0C81298]);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", string);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("EmptyingTrash")))
  {

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", string);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("DeleteImmediately"));

    if (!v7)
      goto LABEL_8;
  }
  v8 = xpc_dictionary_get_string(v2, "Object");
  _log_2();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 136315650;
    v14 = v4;
    v15 = 2080;
    v16 = string;
    v17 = 2080;
    v18 = v8;
    _os_log_impl(&dword_1D54AE000, v9, OS_LOG_TYPE_DEFAULT, "Got event: %s, name: %s, object_str: %s", (uint8_t *)&v13, 0x20u);
  }

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.finder.cacheDelete"));

  if (v11)
  {
    +[QLThumbnailAdditionIndex sharedInstance](QLThumbnailAdditionIndex, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "performDatabaseMaintenance");

    objc_msgSend((id)QLServerThreadInstance, "forEachCacheThread:", &__block_literal_global_26);
  }
LABEL_8:

}

void __67__QLCacheDeleteHandler_setUpCacheDeleteWithThumbnailAdditionIndex___block_invoke_24(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setShouldRemoveThumbnailsForDeletedFiles:", 1);
  objc_msgSend(v2, "forceCommit");
  objc_msgSend(v2, "setShouldRemoveThumbnailsForDeletedFiles:", 0);

}

+ (void)dateBeforePurgingThumbnailsForUrgency:(int)a1 .cold.1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1D54AE000, a2, OS_LOG_TYPE_ERROR, "Unhandled #CacheDelete urgency %d", (uint8_t *)v2, 8u);
}

@end
