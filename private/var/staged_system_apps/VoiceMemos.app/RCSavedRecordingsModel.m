@implementation RCSavedRecordingsModel

+ (id)_copyFileIntoImportFilesTemporaryDirectory:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSErrorUserInfoKey v17;
  void *v18;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastPathComponent"));
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v8 = RCRecordingsDirectoryURL();
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "URLByAppendingPathComponent:", CFSTR(".ImportFilesTemporaryDirectory")));

    objc_msgSend(v7, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v10, 1, 0, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "URLByAppendingPathComponent:", v6));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "rc_uniqueFileSystemURLWithPreferredURL:", v11));

    if (objc_msgSend(v7, "copyItemAtURL:toURL:error:", v5, v12, a4))
      v13 = v12;
    else
      v13 = 0;
    a4 = v13;

  }
  else if (a4)
  {
    v17 = NSURLErrorKey;
    v14 = v5;
    if (!v5)
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    v18 = v14;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1));
    *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSURLErrorDomain, -1000, v15));

    if (!v5)
    a4 = 0;
  }

  return a4;
}

+ (void)importFileWithURL:(id)a3 shouldUseMetadataTitle:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  id v31;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  v31 = 0;
  v10 = objc_msgSend(a1, "_copyFileIntoImportFilesTemporaryDirectory:error:", v8, &v31);
  v11 = v31;
  if (v10)
  {
    v12 = v10;

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[AVURLAsset assetWithURL:](AVURLAsset, "assetWithURL:", v12));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "rc_recordingMetadata"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("title")));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("date")));
    v23 = v13;
    if (v6 && v15)
    {
      v17 = v15;
    }
    else
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "lastPathComponent"));
      v17 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "stringByDeletingPathExtension"));

    }
    v19 = v16;
    if (!v16)
    {
      v30 = 0;
      objc_msgSend(v12, "getResourceValue:forKey:error:", &v30, NSURLCreationDateKey, 0);
      v19 = v30;
    }
    v20 = v19;
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100073D08;
    v24[3] = &unk_1001ACC58;
    v25 = v12;
    v26 = v17;
    v27 = v20;
    v8 = v25;
    v28 = v8;
    v29 = v9;
    v21 = v20;
    v22 = v17;
    +[RCSavedRecordingsModel determineImportabilityOfRecordingWithAudioURL:completionHandler:](RCSavedRecordingsModel, "determineImportabilityOfRecordingWithAudioURL:completionHandler:", v8, v24);

  }
  else
  {
    (*((void (**)(id, _QWORD, id))v9 + 2))(v9, 0, v11);
  }

}

@end
