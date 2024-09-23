@implementation NSFileManager(SFUtilityAdditions)

- (uint64_t)directoryUsage:()SFUtilityAdditions
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

- (uint64_t)pathUsage:()SFUtilityAdditions
{
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;

  v11 = 0;
  if (!objc_msgSend(a1, "fileExistsAtPath:isDirectory:", a3, &v11))
    return 0;
  if (v11)
    return objc_msgSend(a1, "directoryUsage:", a3);
  v10 = 0;
  v6 = (void *)objc_msgSend(a1, "attributesOfItemAtPath:error:", a3, &v10);
  if (!v6)
  {
    v7 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[NSFileManager(SFUtilityAdditions) pathUsage:]");
    v9 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/NSFileManager_SFUAdditions.mm");
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, v9, 58, CFSTR("Failed to get size of file at path: %@ error: %@"), a3, v10);
  }
  return objc_msgSend(v6, "fileSize");
}

- (uint64_t)_setAttributes:()SFUtilityAdditions ofItemAtURL:recursively:error:shouldUpdateAttributesHandler:
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
  id v29;
  uint64_t v30;
  id v31;
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
  v13 = (void *)objc_opt_new();
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
    v29 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v30 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[NSFileManager(SFUtilityAdditions) _setAttributes:ofItemAtURL:recursively:error:shouldUpdateAttributesHandler:]");
    objc_msgSend(v29, "handleFailureInFunction:file:lineNumber:description:", v30, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/NSFileManager_SFUAdditions.mm"), 79, CFSTR("Unhandled type: %@"), v16);
    goto LABEL_28;
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
  {
LABEL_28:
    v20 = 0;
    goto LABEL_29;
  }
  v23 = v22;
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
  if (!v24)
  {
    v20 = 1;
    goto LABEL_32;
  }
  v25 = v24;
  v26 = *(_QWORD *)v37;
  do
  {
    for (i = 0; i != v25; ++i)
    {
      if (*(_QWORD *)v37 != v26)
        objc_enumerationMutation(v23);
      v28 = objc_msgSend(a1, "_setAttributes:ofItemAtURL:recursively:error:shouldUpdateAttributesHandler:", a3, *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i), 1, &v40, a7);
    }
    v20 = v28;
    v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
  }
  while (v25);
LABEL_29:
  if ((v20 & 1) == 0 && v40)
  {
    v31 = v40;
    v20 = 0;
  }
LABEL_32:
  objc_msgSend(v13, "drain");
  if ((v20 & 1) == 0 && v40)
    v32 = v40;
  if (a6)
    v33 = v20;
  else
    v33 = 1;
  if ((v33 & 1) == 0)
  {
    v34 = v40;
    if (!v40)
      v34 = (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD0B88], 512, 0);
    *a6 = v34;
  }
  return v20;
}

- (uint64_t)applyFileAttributesFromDocumentAtURL:()SFUtilityAdditions toDocumentAtURL:error:
{
  void *v8;
  void *v9;
  BOOL v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  int v19;
  id v20;
  id v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v36;
  void *v37;
  char v38;
  id v39;

  v39 = 0;
  if (a5)
    *a5 = 0;
  v8 = (void *)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v38 = 0;
  if (!a3
    || !a4
    || ((v9 = v8, objc_msgSend(v8, "fileExistsAtPath:isDirectory:", objc_msgSend(a3, "path"), &v38))
      ? (v10 = v38 == 0)
      : (v10 = 1),
        v10 || !objc_msgSend(v9, "fileExistsAtPath:isDirectory:", objc_msgSend(a4, "path"), &v38) || !v38))
  {
    v26 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v27 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[NSFileManager(SFUtilityAdditions) applyFileAttributesFromDocumentAtURL:toDocumentAtURL:error:]");
    objc_msgSend(v26, "handleFailureInFunction:file:lineNumber:description:", v27, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/NSFileManager_SFUAdditions.mm"), 165, CFSTR("Must provide non-nil source and destination document package URLs."));
    if (a5)
    {
      v28 = (void *)MEMORY[0x24BDD1540];
      v29 = *MEMORY[0x24BDD0B88];
      v30 = 4;
      goto LABEL_33;
    }
    return 0;
  }
  v11 = (void *)objc_msgSend(v9, "enumeratorAtPath:", objc_msgSend(a3, "path"));
  if (!v11
    || (v12 = v11,
        !objc_msgSend(v9, "setAttributes:ofItemAtPath:error:", objc_msgSend(v11, "directoryAttributes"), objc_msgSend(a4, "path"), &v39)))
  {
    v32 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v33 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[NSFileManager(SFUtilityAdditions) applyFileAttributesFromDocumentAtURL:toDocumentAtURL:error:]");
    v34 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/NSFileManager_SFUAdditions.mm");
    objc_msgSend(v32, "handleFailureInFunction:file:lineNumber:description:", v33, v34, 178, CFSTR("Could not copy top level attributes. %@"), v39);
    if (a5)
    {
      if (v39)
      {
        v31 = v39;
        goto LABEL_34;
      }
      v28 = (void *)MEMORY[0x24BDD1540];
      v29 = *MEMORY[0x24BDD0B88];
      v30 = 512;
LABEL_33:
      v31 = (id)objc_msgSend(v28, "errorWithDomain:code:userInfo:", v29, v30, 0);
LABEL_34:
      v15 = 0;
      *a5 = v31;
      return v15;
    }
    return 0;
  }
  v13 = objc_msgSend(v12, "nextObject");
  if (!v13)
    return 1;
  v14 = v13;
  LODWORD(v15) = 1;
  v36 = *MEMORY[0x24BDD0B88];
  v37 = v12;
  do
  {
    v16 = objc_msgSend((id)objc_msgSend(a4, "path"), "stringByAppendingPathComponent:", v14);
    v17 = objc_msgSend(v12, "fileAttributes");
    if (v17)
    {
      v18 = objc_msgSend(v9, "setAttributes:ofItemAtPath:error:", v17, v16, &v39);
      v19 = v18;
      if (a5 && (v18 & 1) == 0 && !*a5)
      {
        if (v39)
          v20 = v39;
        else
          v20 = (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", v36, 512, 0);
        *a5 = v20;
      }
      if ((v19 & 1) == 0)
      {
        v23 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
        v24 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[NSFileManager(SFUtilityAdditions) applyFileAttributesFromDocumentAtURL:toDocumentAtURL:error:]");
        v12 = v37;
        v25 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/NSFileManager_SFUAdditions.mm");
        objc_msgSend(v23, "handleFailureInFunction:file:lineNumber:description:", v24, v25, 202, CFSTR("Could not set attributes on item at path: %@ error: %@"), v16, v39);
      }
      v15 = v15 & v19;
    }
    else
    {
      if (a5)
        *a5 = objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", v36, 256, 0);
      v21 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
      v22 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[NSFileManager(SFUtilityAdditions) applyFileAttributesFromDocumentAtURL:toDocumentAtURL:error:]");
      objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", v22, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/NSFileManager_SFUAdditions.mm"), 212, CFSTR("Could not get file attributes for: %@"), objc_msgSend((id)objc_msgSend(a3, "path"), "stringByAppendingPathComponent:", v14));
      v15 = 0;
      v12 = v37;
    }
    v14 = objc_msgSend(v12, "nextObject");
  }
  while (v14);
  return v15;
}

- (uint64_t)setAttributes:()SFUtilityAdditions ofItemAtURL:recursively:error:
{
  int v7;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  const __CFString *v14;

  v7 = a5;
  v9 = objc_msgSend(a1, "_setAttributes:ofItemAtURL:recursively:error:shouldUpdateAttributesHandler:", a3, a4, a5, a6, 0);
  v10 = v9;
  if (a6 && (v9 & 1) == 0)
  {
    v11 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v12 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[NSFileManager(SFUtilityAdditions) setAttributes:ofItemAtURL:recursively:error:]");
    v13 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/NSFileManager_SFUAdditions.mm");
    v14 = &stru_24D61C228;
    if (v7)
      v14 = CFSTR(" recursively");
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, v13, 223, CFSTR("Failed to%@ change file attributes at %@: %@"), v14, a4, *a6);
  }
  return v10;
}

- (uint64_t)_changeFileProtectionAtURL:()SFUtilityAdditions fromProtection:toProtection:recursively:error:
{
  uint64_t v13;
  _QWORD v15[6];
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v16 = *MEMORY[0x24BDD0CF0];
  v17[0] = a5;
  v13 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __110__NSFileManager_SFUtilityAdditions___changeFileProtectionAtURL_fromProtection_toProtection_recursively_error___block_invoke;
  v15[3] = &unk_24D61B3A8;
  v15[4] = a5;
  v15[5] = a4;
  return objc_msgSend(a1, "_setAttributes:ofItemAtURL:recursively:error:shouldUpdateAttributesHandler:", v13, a3, a6, a7, v15);
}

- (uint64_t)changeFileProtectionAtURL:()SFUtilityAdditions fromProtection:toProtection:recursively:error:
{
  uint64_t result;
  id v11;
  uint64_t v12;
  uint64_t v13;
  const __CFString *v14;
  id v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  if (!a5)
  {
    v15 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v16 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[NSFileManager(SFUtilityAdditions) changeFileProtectionAtURL:fromProtection:toProtection:recursively:error:]");
    objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/NSFileManager_SFUAdditions.mm"), 240, CFSTR("No file protection specified."));
    if (a3)
      return 0;
LABEL_9:
    v17 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v18 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[NSFileManager(SFUtilityAdditions) changeFileProtectionAtURL:fromProtection:toProtection:recursively:error:]");
    objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/NSFileManager_SFUAdditions.mm"), 241, CFSTR("No URL specified."), v19, v20, v21);
    return 0;
  }
  if (!a3)
    goto LABEL_9;
  result = objc_msgSend(a1, "_changeFileProtectionAtURL:fromProtection:toProtection:recursively:error:", a3);
  if (a7 && (result & 1) == 0)
  {
    v11 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v12 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[NSFileManager(SFUtilityAdditions) changeFileProtectionAtURL:fromProtection:toProtection:recursively:error:]");
    v13 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/NSFileManager_SFUAdditions.mm");
    v14 = &stru_24D61C228;
    if (a6)
      v14 = CFSTR(" recursively");
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, v13, 250, CFSTR("Failed to %@ change file protection at %@: %@"), v14, a3, *a7);
    return 0;
  }
  return result;
}

- (uint64_t)changeFileProtectionAtURL:()SFUtilityAdditions toProtection:recursively:error:
{
  return objc_msgSend(a1, "changeFileProtectionAtURL:fromProtection:toProtection:recursively:error:", a3, 0, a4, a5, a6);
}

- (uint64_t)_fileProtection:()SFUtilityAdditions isGreaterThan:
{
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t result;

  v4 = *MEMORY[0x24BDD0CF8];
  if (a3)
    v5 = a3;
  else
    v5 = (void *)*MEMORY[0x24BDD0CF8];
  if (a4)
    v6 = a4;
  else
    v6 = (void *)*MEMORY[0x24BDD0CF8];
  v7 = *MEMORY[0x24BDD0CD0];
  if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BDD0CD0])
    && !objc_msgSend(v6, "isEqualToString:", v7))
  {
    return 1;
  }
  if ((objc_msgSend(v5, "isEqualToString:", v4) & 1) == 0 && (objc_msgSend(v6, "isEqualToString:", v4) & 1) != 0)
    return 1;
  result = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BDD0CD8]);
  if ((_DWORD)result)
  {
    result = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDD0CE0]);
    if ((_DWORD)result)
      return 1;
  }
  return result;
}

- (uint64_t)_fileProtectionAtURL:()SFUtilityAdditions recursively:passesTest:
{
  void *v9;
  void *v10;
  void *v11;
  uint64_t result;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  id v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v24 = 0;
  v9 = (void *)objc_msgSend(a1, "attributesOfItemAtPath:error:", objc_msgSend(a3, "path"), &v24);
  if (objc_msgSend(v24, "code") == 260)
    return 1;
  v10 = (void *)objc_msgSend(v9, "fileType");
  if (!v10)
    return 1;
  v11 = v10;
  if (objc_msgSend(v10, "isEqualToString:", *MEMORY[0x24BDD0D40]))
    return (*(uint64_t (**)(uint64_t, uint64_t))(a5 + 16))(a5, objc_msgSend(v9, "objectForKey:", *MEMORY[0x24BDD0CF0]));
  if (!objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BDD0D38]) || a4 == 0)
    return 1;
  v14 = (void *)objc_msgSend(a1, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", a3, 0, 0, 0);
  if (!v14)
    return 1;
  v15 = v14;
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (!v16)
    return 1;
  v17 = v16;
  v18 = *(_QWORD *)v21;
LABEL_12:
  v19 = 0;
  while (1)
  {
    if (*(_QWORD *)v21 != v18)
      objc_enumerationMutation(v15);
    result = objc_msgSend(a1, "_fileProtectionAtURL:recursively:passesTest:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v19), 1, a5);
    if (!(_DWORD)result)
      return result;
    if (v17 == ++v19)
    {
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      result = 1;
      if (v17)
        goto LABEL_12;
      return result;
    }
  }
}

- (uint64_t)hasAtLeastFileProtection:()SFUtilityAdditions atURL:recursively:
{
  _QWORD v6[6];

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __80__NSFileManager_SFUtilityAdditions__hasAtLeastFileProtection_atURL_recursively___block_invoke;
  v6[3] = &unk_24D61B3D0;
  v6[4] = a1;
  v6[5] = a3;
  return objc_msgSend(a1, "_fileProtectionAtURL:recursively:passesTest:", a4, a5, v6);
}

- (uint64_t)hasAtMostFileProtection:()SFUtilityAdditions atURL:recursively:
{
  _QWORD v6[6];

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __79__NSFileManager_SFUtilityAdditions__hasAtMostFileProtection_atURL_recursively___block_invoke;
  v6[3] = &unk_24D61B3D0;
  v6[4] = a1;
  v6[5] = a3;
  return objc_msgSend(a1, "_fileProtectionAtURL:recursively:passesTest:", a4, a5, v6);
}

- (uint64_t)_logFileProtectionAtURL:()SFUtilityAdditions recursively:indent:
{
  uint64_t result;
  void *v10;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  result = objc_msgSend((id)objc_msgSend(a1, "attributesOfItemAtPath:error:", objc_msgSend(a3, "path"), 0), "fileType");
  if (result)
  {
    v10 = (void *)result;
    result = objc_msgSend((id)result, "isEqualToString:", *MEMORY[0x24BDD0D40]);
    if ((result & 1) == 0)
    {
      result = objc_msgSend(v10, "isEqualToString:", *MEMORY[0x24BDD0D38]);
      if ((_DWORD)result && a4 != 0)
      {
        result = objc_msgSend(a1, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", a3, 0, 0, 0);
        if (result)
        {
          v12 = (void *)result;
          v13 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@/"), a5, objc_msgSend((id)objc_msgSend(a3, "path"), "lastPathComponent"));
          if (objc_msgSend(v12, "count") != 1)
            v13 = objc_msgSend(a5, "stringByAppendingString:", CFSTR("\t"));
          v19 = 0u;
          v20 = 0u;
          v17 = 0u;
          v18 = 0u;
          result = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
          if (result)
          {
            v14 = result;
            v15 = *(_QWORD *)v18;
            do
            {
              v16 = 0;
              do
              {
                if (*(_QWORD *)v18 != v15)
                  objc_enumerationMutation(v12);
                objc_msgSend(a1, "_logFileProtectionAtURL:recursively:indent:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v16++), 1, v13);
              }
              while (v14 != v16);
              result = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
              v14 = result;
            }
            while (result);
          }
        }
      }
    }
  }
  return result;
}

- (uint64_t)logFileProtectionAtURL:()SFUtilityAdditions recursively:
{
  return objc_msgSend(a1, "_logFileProtectionAtURL:recursively:indent:", a3, a4, &stru_24D61C228);
}

@end
