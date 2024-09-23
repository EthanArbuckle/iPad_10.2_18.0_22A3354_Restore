@implementation NSFileManager(SFUtilityAdditions)

- (uint64_t)sfu_directoryUsage:()SFUtilityAdditions
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v4 = (void *)objc_msgSend(a1, "subpathsAtPath:");
  v5 = objc_msgSend(v4, "count");
  if (!v5)
    return 0;
  v6 = v5;
  v7 = 0;
  v8 = 0;
  v9 = *MEMORY[0x24BDD0D08];
  do
  {
    v10 = objc_msgSend((id)objc_msgSend(a3, "stringByAppendingPathComponent:", objc_msgSend(v4, "objectAtIndex:", v8)), "stringByResolvingSymlinksInPath");
    v11 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager"), "attributesOfItemAtPath:error:", v10, 0);
    if (v11)
    {
      v12 = (void *)objc_msgSend(v11, "objectForKey:", v9);
      if (v12)
        v7 += objc_msgSend(v12, "unsignedLongLongValue");
    }
    ++v8;
  }
  while (v6 != v8);
  return v7;
}

- (uint64_t)sfu_pathUsage:()SFUtilityAdditions
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  char v12;

  v12 = 0;
  if (!objc_msgSend(a1, "fileExistsAtPath:isDirectory:", a3, &v12))
    return 0;
  if (v12)
    return objc_msgSend(a1, "sfu_directoryUsage:", a3);
  v11 = 0;
  v6 = (void *)objc_msgSend(a1, "attributesOfItemAtPath:error:", a3, &v11);
  if (!v6)
  {
    v7 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[NSFileManager(SFUtilityAdditions) sfu_pathUsage:]");
    v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/sf/NSFileManager_SFUAdditions.m");
    v9 = objc_msgSend(v11, "code");
    v10 = objc_msgSend(v11, "domain");
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 56, 0, "Failed to get size of file at path: %@ error: %zd %{public}@ %@", a3, v9, v10, v11);
    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  }
  return objc_msgSend(v6, "fileSize");
}

- (uint64_t)sfup_setAttributes:()SFUtilityAdditions ofItemAtURL:recursively:error:shouldUpdateAttributesHandler:
{
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  uint64_t v28;
  uint64_t v29;
  id v30;
  char v31;
  id v32;
  char v33;
  id v34;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  id v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v40 = 0;
  v13 = (void *)MEMORY[0x22E2DDB58]();
  v14 = (void *)objc_msgSend(a1, "attributesOfItemAtPath:error:", objc_msgSend(a4, "path"), &v40);
  v15 = (void *)objc_msgSend(v14, "fileType");
  if (!v15)
    goto LABEL_28;
  v16 = v15;
  v17 = objc_msgSend(v15, "isEqualToString:", *MEMORY[0x24BDD0D48]);
  v18 = *MEMORY[0x24BDD0D40];
  if ((v17 & 1) == 0
    && (objc_msgSend(v16, "isEqualToString:", *MEMORY[0x24BDD0D40]) & 1) == 0
    && (objc_msgSend(v16, "isEqualToString:", *MEMORY[0x24BDD0D38]) & 1) == 0)
  {
    v29 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[NSFileManager(SFUtilityAdditions) sfup_setAttributes:ofItemAtURL:recursively:error:shouldUpdateAttributesHandler:]");
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v29, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/sf/NSFileManager_SFUAdditions.m"), 76, 0, "Unhandled type: %@", v16);
    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
LABEL_28:
    v20 = 0;
    goto LABEL_29;
  }
  if ((objc_msgSend(v16, "isEqualToString:", v18) & 1) != 0
    || objc_msgSend(v16, "isEqualToString:", *MEMORY[0x24BDD0D38]))
  {
    v19 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager"), "URLForDirectory:inDomain:appropriateForURL:create:error:", 9, 1, 0, 0, 0), "URLByAppendingPathComponent:isDirectory:", CFSTR("Inbox"), 1), "path"), "tsu_stringWithRealpath");
    if (v19
      && (objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "path"), "tsu_stringWithRealpath"), "tsu_isDescendantOfPath:", v19) & 1) != 0|| a7 && !(*(unsigned int (**)(uint64_t, void *))(a7 + 16))(a7, v14))
    {
      v20 = 1;
    }
    else
    {
      v20 = objc_msgSend(a1, "setAttributes:ofItemAtPath:error:", a3, objc_msgSend(a4, "path"), &v40);
    }
  }
  else
  {
    v20 = 0;
  }
  if (objc_msgSend(v16, "isEqualToString:", *MEMORY[0x24BDD0D38]))
    v21 = a5 == 0;
  else
    v21 = 1;
  if (v21)
    goto LABEL_29;
  v22 = (void *)objc_msgSend(a1, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", a4, 0, 0, &v40);
  if (!v22)
    goto LABEL_28;
  v23 = v22;
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
  if (!v24)
  {
    objc_autoreleasePoolPop(v13);
    return 1;
  }
  v25 = v24;
  v26 = *(_QWORD *)v37;
  do
  {
    for (i = 0; i != v25; ++i)
    {
      if (*(_QWORD *)v37 != v26)
        objc_enumerationMutation(v23);
      v28 = objc_msgSend(a1, "sfup_setAttributes:ofItemAtURL:recursively:error:shouldUpdateAttributesHandler:", a3, *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i), 1, &v40, a7);
    }
    v20 = v28;
    v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
  }
  while (v25);
LABEL_29:
  if ((v20 & 1) == 0 && v40)
    v30 = v40;
  objc_autoreleasePoolPop(v13);
  if (v40)
    v31 = v20;
  else
    v31 = 1;
  if ((v31 & 1) == 0)
    v32 = v40;
  if (a6)
    v33 = v20;
  else
    v33 = 1;
  if ((v33 & 1) == 0)
  {
    v34 = v40;
    if (!v40)
      v34 = (id)objc_msgSend(MEMORY[0x24BDD1540], "tsu_fileWriteUnknownErrorWithUserInfo:", 0);
    v20 = 0;
    *a6 = v34;
  }
  return v20;
}

- (uint64_t)sfu_setAttributes:()SFUtilityAdditions ofItemAtURL:recursively:error:
{
  int v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const __CFString *v13;

  v7 = a5;
  v9 = objc_msgSend(a1, "sfup_setAttributes:ofItemAtURL:recursively:error:shouldUpdateAttributesHandler:", a3, a4, a5, a6, 0);
  v10 = v9;
  if (a6 && (v9 & 1) == 0 && (objc_msgSend(*a6, "tsu_isNoSuchFileError") & 1) == 0)
  {
    v11 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[NSFileManager(SFUtilityAdditions) sfu_setAttributes:ofItemAtURL:recursively:error:]");
    v12 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/sf/NSFileManager_SFUAdditions.m");
    if (v7)
      v13 = CFSTR(" recursively");
    else
      v13 = &stru_24F3BFFF8;
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 131, 0, "Failed to%{public}@ change file attributes at %@: %zd %{public}@ %@", v13, a4, objc_msgSend(*a6, "code"), objc_msgSend(*a6, "domain"), *a6);
    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  }
  return v10;
}

@end
