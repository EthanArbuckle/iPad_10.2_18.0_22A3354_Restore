@implementation NSFileManager

- (BOOL)be_doesFolderAtURL:(id)a3 containFileAtURL:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "isFileURL") && objc_msgSend(v5, "isFileURL"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "path"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByStandardizingPath"));

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringByResolvingSymlinksInPath"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "path"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringByStandardizingPath"));

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stringByResolvingSymlinksInPath"));
    v13 = objc_msgSend(v9, "hasPrefix:", v12);

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

@end
