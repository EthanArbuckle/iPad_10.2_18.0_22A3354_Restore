@implementation NSFileManager

- (BOOL)crl_grantUserWritePosixPermissionAtPath:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  unsigned __int8 v23;
  BOOL v24;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id *v31;
  id v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  id v38;
  id v39;
  _BYTE v40[128];

  v6 = a3;
  v39 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSFileManager attributesOfItemAtPath:error:](self, "attributesOfItemAtPath:error:", v6, &v39));
  v8 = v39;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "fileType"));
  if ((objc_msgSend(v9, "isEqualToString:", NSFileTypeDirectory) & 1) == 0
    && (objc_msgSend(v9, "isEqualToString:", NSFileTypeRegular) & 1) == 0
    && !objc_msgSend(v9, "isEqualToString:", NSFileTypeSymbolicLink))
  {
    v24 = 1;
    goto LABEL_27;
  }
  v31 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", (unint64_t)objc_msgSend(v7, "filePosixPermissions") | 0x80));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObject:forKey:](NSDictionary, "dictionaryWithObject:forKey:", v10, NSFilePosixPermissions));
  v38 = v8;
  v12 = -[NSFileManager setAttributes:ofItemAtPath:error:](self, "setAttributes:ofItemAtPath:error:", v11, v6, &v38);
  v13 = v38;

  if (v12)
  {
    if (!objc_msgSend(v9, "isEqualToString:", NSFileTypeDirectory))
    {
      v24 = 1;
LABEL_26:
      v8 = v13;
      goto LABEL_27;
    }
    v30 = v9;
    v14 = objc_autoreleasePoolPush();
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v33 = 0;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSFileManager contentsOfDirectoryAtPath:error:](self, "contentsOfDirectoryAtPath:error:", v6, &v33));
    v16 = v33;
    v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
    if (v17)
    {
      v18 = v17;
      v27 = v14;
      v28 = v13;
      v29 = v7;
      v19 = *(_QWORD *)v35;
      while (2)
      {
        v20 = 0;
        v21 = v16;
        do
        {
          if (*(_QWORD *)v35 != v19)
            objc_enumerationMutation(v15);
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByAppendingPathComponent:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)v20)));
          v32 = v21;
          v23 = -[NSFileManager crl_grantUserWritePosixPermissionAtPath:error:](self, "crl_grantUserWritePosixPermissionAtPath:error:", v22, &v32);
          v16 = v32;

          if ((v23 & 1) == 0)
          {
            v16 = v16;

            v24 = 0;
            v13 = v16;
            v7 = v29;
            goto LABEL_18;
          }
          v20 = (char *)v20 + 1;
          v21 = v16;
        }
        while (v18 != v20);
        v18 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
        if (v18)
          continue;
        break;
      }
      v24 = 1;
      v13 = v28;
      v7 = v29;
LABEL_18:
      v14 = v27;
    }
    else
    {
      v24 = 1;
    }

    objc_autoreleasePoolPop(v14);
    v9 = v30;
  }
  else
  {
    v24 = 0;
  }
  if (!v31 || v24)
    goto LABEL_26;
  if (v13)
  {
    v8 = objc_retainAutorelease(v13);
    v24 = 0;
    *v31 = v8;
  }
  else
  {
    v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSError crl_fileWriteUnknownErrorWithUserInfo:](NSError, "crl_fileWriteUnknownErrorWithUserInfo:", 0)));
    *v31 = v26;

    v24 = 0;
    v8 = 0;
  }
LABEL_27:

  return v24;
}

- (BOOL)crl_directoryExistsAt:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  NSFileManager *v9;
  uint64_t v10;
  uint64_t v11;
  NSString v12;
  char v13;
  uint64_t v15;

  v5 = type metadata accessor for URL(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = self;
  if ((URL.isFileURL.getter(v9) & 1) != 0)
  {
    HIBYTE(v15) = 0;
    URL.path.getter();
    v11 = v10;
    v12 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v11);
    LOBYTE(v11) = -[NSFileManager fileExistsAtPath:isDirectory:](v9, "fileExistsAtPath:isDirectory:", v12, (char *)&v15 + 7);

    v13 = v11 & HIBYTE(v15);
  }
  else
  {

    v13 = 0;
  }
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return v13;
}

@end
