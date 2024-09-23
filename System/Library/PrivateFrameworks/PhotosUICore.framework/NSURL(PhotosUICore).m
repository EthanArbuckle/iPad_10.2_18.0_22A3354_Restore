@implementation NSURL(PhotosUICore)

- (id)px_URLByAppendingPathComponentFollowedByCurrentDateAndTime:()PhotosUICore
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = (objc_class *)MEMORY[0x1E0CB3578];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  objc_msgSend(v6, "setDateFormat:", CFSTR("yyyy-MM-dd-HHmmss"));
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringFromDate:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), v5, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "URLByAppendingPathComponent:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)px_tempDirectoryFileURLWithSubdirectory:()PhotosUICore fileExtension:
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = (void *)MEMORY[0x1E0CB3A28];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "UUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "UUIDString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "px_tempDirectoryFileURLWithFileName:subdirectory:fileExtension:", v10, v8, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)px_tempDirectoryFileURLWithFileName:()PhotosUICore subdirectory:fileExtension:
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v7 = a3;
  v8 = a5;
  v9 = a4;
  NSTemporaryDirectory();
  v10 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v10, "stringByAppendingPathComponent:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v10) = objc_msgSend(v12, "fileExistsAtPath:isDirectory:", v11, 0);

  if ((v10 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v11, 1, 0, 0);

  }
  objc_msgSend(v11, "stringByAppendingPathComponent:", v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringByAppendingPathExtension:", v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (uint64_t)px_openCameraAppURL
{
  return objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("camera://configuration?capturemode=photo&capturedevice=back"));
}

@end
