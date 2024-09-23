@implementation MBRestoreDirectoryAnnotator

+ (NSString)backupAnnotationXattrKey
{
  return (NSString *)CFSTR("MBRestoreAnnotation");
}

+ (BOOL)isRestoredPath:(id)a3
{
  unsigned int v4;
  id v5;
  id v6;

  v4 = -[NSFileManager fileExistsAtPath:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "fileExistsAtPath:", a3);
  if (v4)
  {
    v5 = +[MBExtendedAttributes valueForKey:forPathFSR:error:](MBExtendedAttributes, "valueForKey:forPathFSR:error:", CFSTR("MBRestoreAnnotation"), objc_msgSend(a3, "fileSystemRepresentation"), 0);
    if (v5)
    {
      v6 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v5, 4);
      if ((objc_msgSend(v6, "isEqual:", CFSTR("NotRestored")) & 1) != 0)
        LOBYTE(v4) = 0;
      else
        LOBYTE(v4) = objc_msgSend(v6, "isEqual:", CFSTR("NotBackedUp")) ^ 1;
    }
    else
    {
      LOBYTE(v4) = 1;
    }
  }
  return v4;
}

+ (id)restoreDirectoryAnnotatorWithContext:(id)a3 persona:(id)a4 engineType:(int)a5 backupPolicy:(int64_t)a6 encrypted:(BOOL)a7
{
  return -[MBRestoreDirectoryAnnotator initWithContext:persona:engineType:backupPolicy:encrypted:]([MBRestoreDirectoryAnnotator alloc], "initWithContext:persona:engineType:backupPolicy:encrypted:", a3, a4, *(_QWORD *)&a5, a6, a7);
}

- (MBRestoreDirectoryAnnotator)initWithContext:(id)a3 persona:(id)a4 engineType:(int)a5 backupPolicy:(int64_t)a6 encrypted:(BOOL)a7
{
  MBRestoreDirectoryAnnotator *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)MBRestoreDirectoryAnnotator;
  v12 = -[MBRestoreDirectoryAnnotator init](&v14, "init");
  if (v12)
  {
    v12->_context = (MBSettingsContext *)a3;
    v12->_persona = (MBPersona *)a4;
    v12->_engineType = a5;
    v12->_backupPolicy = a6;
    v12->_encrypted = a7;
  }
  return v12;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MBRestoreDirectoryAnnotator;
  -[MBRestoreDirectoryAnnotator dealloc](&v3, "dealloc");
}

- (id)annotateDomains:(id)a3
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v14 != v7)
        objc_enumerationMutation(a3);
      v9 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v8);
      v10 = objc_autoreleasePoolPush();
      v11 = -[MBRestoreDirectoryAnnotator annotateDomain:](self, "annotateDomain:", v9);
      objc_autoreleasePoolPop(v10);
      if (v11)
        break;
      if (v6 == (id)++v8)
      {
        v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v6)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v11 = 0;
  }
  return v11;
}

- (id)annotateDomain:(id)a3
{
  id v5;
  int v6;
  uint64_t v7;
  NSObject *v8;
  id result;
  id v10;
  id v11;
  int engineType;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint8_t v33[128];
  uint8_t buf[4];
  id v35;

  v5 = objc_msgSend(a3, "isAppDomain");
  v6 = (int)v5;
  v8 = MBGetDefaultLog(v5, v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v35 = objc_msgSend(a3, "name");
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Annotating domain: %{public}@", buf, 0xCu);
    _MBLog(CFSTR("DEFAULT"), "Annotating domain: %{public}@", objc_msgSend(a3, "name"));
  }
  if ((objc_msgSend(a3, "isUninstalledAppDomain") & 1) != 0)
    return 0;
  v10 = +[NSMutableSet set](NSMutableSet, "set");
  if ((-[MBSettingsContext shouldRestoreSystemFiles](self->_context, "shouldRestoreSystemFiles") | v6) == 1)
  {
    objc_msgSend(v10, "unionSet:", objc_msgSend(a3, "relativePathsNotToBackup"));
    if (self->_backupPolicy == 1)
    {
      objc_msgSend(v10, "unionSet:", objc_msgSend(a3, "relativePathsNotToBackupToDrive"));
      v11 = objc_msgSend(a3, "relativePathsNotToBackupInMegaBackup");
    }
    else
    {
      engineType = self->_engineType;
      if ((engineType - 2) < 2)
      {
        v11 = objc_msgSend(a3, "relativePathsNotToBackupToService");
      }
      else
      {
        if (engineType != 4 && engineType != 1)
        {
          +[NSException raise:format:](NSException, "raise:format:", NSInvalidArgumentException, CFSTR("Unexpected engine type: %d"), self->_engineType);
LABEL_15:
          if (!self->_encrypted && self->_engineType != 4)
            objc_msgSend(v10, "unionSet:", objc_msgSend(a3, "relativePathsToOnlyBackupEncrypted"));
          objc_msgSend(v10, "mb_minusPathSet:", objc_msgSend(a3, "relativePathsToRemoveOnRestore"));
          goto LABEL_19;
        }
        v11 = objc_msgSend(a3, "relativePathsNotToBackupToDrive");
      }
    }
    objc_msgSend(v10, "unionSet:", v11);
    goto LABEL_15;
  }
LABEL_19:
  v13 = objc_msgSend(objc_msgSend(v10, "allObjects"), "sortedArrayUsingComparator:", &stru_1000DA2E8);
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v29;
LABEL_21:
    v17 = 0;
    while (1)
    {
      if (*(_QWORD *)v29 != v16)
        objc_enumerationMutation(v13);
      result = -[MBRestoreDirectoryAnnotator _annotateNotBackedUpDomain:relativePath:](self, "_annotateNotBackedUpDomain:relativePath:", a3, *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v17));
      if (result)
        break;
      if (v15 == (id)++v17)
      {
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
        if (v15)
          goto LABEL_21;
        goto LABEL_27;
      }
    }
  }
  else
  {
LABEL_27:
    v18 = +[NSMutableSet set](NSMutableSet, "set");
    if ((-[MBSettingsContext shouldRestoreSystemFiles](self->_context, "shouldRestoreSystemFiles") | v6) == 1)
    {
      objc_msgSend(v18, "unionSet:", objc_msgSend(a3, "relativePathsToBackupAndRestore"));
      objc_msgSend(v18, "unionSet:", objc_msgSend(a3, "relativePathsToRestoreOnly"));
      if ((self->_engineType & 0xFFFFFFFE) == 2)
        objc_msgSend(v18, "unionSet:", objc_msgSend(a3, "relativePathsToRestoreOnlyFromService"));
      v19 = objc_msgSend(a3, "relativePathsToRemoveOnRestore");
    }
    else
    {
      objc_msgSend(v18, "unionSet:", objc_msgSend(a3, "relativePathsOfSystemFilesToAlwaysRestore"));
      v19 = objc_msgSend(a3, "relativePathsOfSystemFilesToAlwaysRemoveOnRestore");
    }
    objc_msgSend(v18, "unionSet:", v19);
    objc_msgSend(v18, "unionSet:", objc_msgSend(a3, "relativePathsNotToRemoveIfNotRestored"));
    objc_msgSend(v18, "unionSet:", objc_msgSend(a3, "relativePathsToBackupToDriveAndStandardAccount"));
    objc_msgSend(v18, "mb_minusPathSet:", v10);
    v20 = objc_msgSend(objc_msgSend(v18, "allObjects"), "sortedArrayUsingComparator:", &stru_1000DA308);
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    result = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    if (result)
    {
      v21 = result;
      v22 = *(_QWORD *)v25;
LABEL_34:
      v23 = 0;
      while (1)
      {
        if (*(_QWORD *)v25 != v22)
          objc_enumerationMutation(v20);
        result = -[MBRestoreDirectoryAnnotator _annotateRestoredDomain:relativePath:](self, "_annotateRestoredDomain:relativePath:", a3, *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v23));
        if (result)
          break;
        if (v21 == (id)++v23)
        {
          v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
          result = 0;
          if (v21)
            goto LABEL_34;
          return result;
        }
      }
    }
  }
  return result;
}

- (id)_baseRestorePathForDomain:(id)a3
{
  unsigned int v5;
  MBPersona *persona;
  id v7;

  v5 = objc_msgSend(a3, "shouldRestoreToSharedVolume");
  persona = self->_persona;
  if (v5)
    v7 = -[MBPersona sharedIncompleteRestoreDirectory](persona, "sharedIncompleteRestoreDirectory");
  else
    v7 = -[MBPersona userIncompleteRestoreDirectory](persona, "userIncompleteRestoreDirectory");
  return objc_msgSend(v7, "stringByAppendingPathComponent:", objc_msgSend(a3, "rootPath"));
}

- (id)_annotateNotBackedUpDomain:(id)a3 relativePath:(id)a4
{
  return -[MBRestoreDirectoryAnnotator _makeEmptyAnnotationFileWithPath:value:](self, "_makeEmptyAnnotationFileWithPath:value:", objc_msgSend(-[MBRestoreDirectoryAnnotator _baseRestorePathForDomain:](self, "_baseRestorePathForDomain:", a3), "stringByAppendingPathComponent:", a4), CFSTR("NotBackedUp"));
}

- (id)_annotateRestoredDomain:(id)a3 relativePath:(id)a4
{
  id v7;
  NSDictionary *v8;
  id result;
  const __CFString *v10;
  uint64_t v11;

  v11 = 0;
  v7 = objc_msgSend(-[MBRestoreDirectoryAnnotator _baseRestorePathForDomain:](self, "_baseRestorePathForDomain:"), "stringByAppendingPathComponent:", a4);
  v8 = -[NSFileManager attributesOfItemAtPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "attributesOfItemAtPath:error:", v7, &v11);
  if (v8)
  {
    if (!-[NSString isEqualToString:](-[NSDictionary fileType](v8, "fileType"), "isEqualToString:", NSFileTypeDirectory))return 0;
    result = -[MBRestoreDirectoryAnnotator _annotatePath:value:](self, "_annotatePath:value:", v7, CFSTR("RestoreRoot"));
    if (!result)
      return 0;
  }
  else
  {
    if (+[MBError codeForNSError:](MBError, "codeForNSError:", v11) != 4)
    {
      if (+[MBError codeForNSError:](MBError, "codeForNSError:", v11) != 5)
        return +[MBError errorWithCode:error:path:format:](MBError, "errorWithCode:error:path:format:", 100, v11, v7, CFSTR("Error getting restored file attributes"));
      return 0;
    }
    if (objc_msgSend(a4, "mb_pathComponentExistsInSet:", objc_msgSend(a3, "relativePathsNotToRemoveIfNotRestored")))v10 = CFSTR("NotBackedUp");
    else
      v10 = CFSTR("NotRestored");
    result = -[MBRestoreDirectoryAnnotator _makeEmptyAnnotationFileWithPath:value:](self, "_makeEmptyAnnotationFileWithPath:value:", v7, v10);
    if (!result)
      return 0;
  }
  return result;
}

- (id)_annotatePath:(id)a3 value:(id)a4
{
  NSObject *v6;
  uint64_t v8;
  uint8_t buf[4];
  id v10;
  __int16 v11;
  id v12;

  v8 = 0;
  v6 = MBGetDefaultLog(self, a2);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v10 = a4;
    v11 = 2112;
    v12 = a3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Annotating with '%@': %@", buf, 0x16u);
    _MBLog(CFSTR("INFO"), "Annotating with '%@': %@", a4, a3);
  }
  if (+[MBExtendedAttributes setValue:forKey:forPathFSR:error:](MBExtendedAttributes, "setValue:forKey:forPathFSR:error:", objc_msgSend(a4, "dataUsingEncoding:", 4), CFSTR("MBRestoreAnnotation"), objc_msgSend(a3, "fileSystemRepresentation"), &v8))
  {
    return 0;
  }
  else
  {
    return +[MBError errorWithCode:error:format:](MBError, "errorWithCode:error:format:", 100, v8, CFSTR("Error setting %@ extended attribute"), a4);
  }
}

- (id)_makeAnnotatedIntermediatePaths:(id)a3
{
  id v5;
  NSDictionary *v6;
  id result;
  id v8;
  const __CFString *v9;
  id v10;

  v10 = 0;
  v5 = objc_msgSend(a3, "stringByDeletingLastPathComponent");
  v6 = -[NSFileManager attributesOfItemAtPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "attributesOfItemAtPath:error:", v5, &v10);
  result = 0;
  if (!v6)
  {
    if (+[MBError codeForNSError:](MBError, "codeForNSError:", v10) == 4)
    {
      result = -[MBRestoreDirectoryAnnotator _makeAnnotatedIntermediatePaths:](self, "_makeAnnotatedIntermediatePaths:", v5);
      v10 = result;
      if (result)
        return result;
      if (-[NSFileManager createDirectoryAtPath:withIntermediateDirectories:attributes:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v5, 0, 0, &v10))
      {
        return -[MBRestoreDirectoryAnnotator _annotatePath:value:](self, "_annotatePath:value:", v5, CFSTR("Intermediate"));
      }
      v8 = v10;
      v9 = CFSTR("Error creating annotated parent directory");
    }
    else
    {
      v8 = v10;
      v9 = CFSTR("Error getting restored file attributes");
    }
    return +[MBError errorWithCode:error:path:format:](MBError, "errorWithCode:error:path:format:", 100, v8, a3, v9);
  }
  return result;
}

- (id)_makeEmptyAnnotationFileWithPath:(id)a3 value:(id)a4
{
  id result;
  int v8;
  int v9;
  int *v10;
  uint64_t v11;
  NSObject *v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  id v16;

  result = -[MBRestoreDirectoryAnnotator _makeAnnotatedIntermediatePaths:](self, "_makeAnnotatedIntermediatePaths:");
  if (!result)
  {
    v8 = open((const char *)objc_msgSend(a3, "fileSystemRepresentation"), 1793, 420);
    if (v8 < 0)
    {
      v10 = __error();
      if (*v10 != 17)
      {
        v10 = __error();
        if (*v10 != 21)
          return +[MBError posixErrorWithCode:path:format:](MBError, "posixErrorWithCode:path:format:", 100, a3, CFSTR("Error creating empty annotation file"));
      }
      v12 = MBGetDefaultLog(v10, v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v14 = a4;
        v15 = 2112;
        v16 = a3;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Not creating %@ empty annotation file at path since it already exists: %@", buf, 0x16u);
        _MBLog(CFSTR("INFO"), "Not creating %@ empty annotation file at path since it already exists: %@", a4, a3);
      }
    }
    else
    {
      v9 = v8;
      result = -[MBRestoreDirectoryAnnotator _annotatePath:value:](self, "_annotatePath:value:", a3, a4);
      if (result)
        return result;
      close(v9);
    }
    return 0;
  }
  return result;
}

@end
