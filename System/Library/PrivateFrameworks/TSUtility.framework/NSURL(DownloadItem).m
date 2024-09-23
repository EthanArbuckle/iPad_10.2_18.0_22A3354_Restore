@implementation NSURL(DownloadItem)

- (id)downloadTaskDescription
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(a1, "absoluteString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("%@%@"), CFSTR("File:"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (uint64_t)totalBytesExpectedToBeDownloaded
{
  return 0;
}

+ (uint64_t)canHandleDownloadTask:()DownloadItem
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a3, "taskDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasPrefix:", CFSTR("File:"));

  return v4;
}

+ (void)downloadManager:()DownloadItem task:didFinishDownloadingToURL:
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  id v21;

  v7 = a5;
  v8 = a3;
  objc_msgSend(a4, "originalRequest");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "URL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "downloadInboxDirectory");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "lastPathComponent");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "URLByAppendingPathComponent:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "removeItemAtURL:error:", v13, 0);
  if ((objc_msgSend(v14, "linkItemAtURL:toURL:error:", v7, v13, 0) & 1) == 0)
  {
    v21 = 0;
    v15 = objc_msgSend(v14, "copyItemAtURL:toURL:error:", v7, v13, &v21);
    v20 = v21;
    if ((v15 & 1) == 0)
      TSULogErrorInFunction((uint64_t)"+[NSURL(DownloadItem) downloadManager:task:didFinishDownloadingToURL:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/NSURL_DownloadItem.m", 50, (uint64_t)CFSTR("Failed to move downloaded file from %@ to %@: %@"), v16, v17, v18, v19, (uint64_t)v7);

  }
}

@end
