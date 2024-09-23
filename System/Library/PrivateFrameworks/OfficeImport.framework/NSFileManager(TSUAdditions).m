@implementation NSFileManager(TSUAdditions)

- (uint64_t)tsu_linkOrCopyItemAtURL:()TSUAdditions toURL:error:
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v16;
  void *v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9)
      goto LABEL_4;
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[NSFileManager(TSUAdditions) tsu_linkOrCopyItemAtURL:toURL:error:]");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/NSFileManager_TSUAdditions.m");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v16, v17, 16, 0, "Invalid parameter not satisfying: %{public}s", "srcURL");

  +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  if (!v10)
  {
LABEL_3:
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[NSFileManager(TSUAdditions) tsu_linkOrCopyItemAtURL:toURL:error:]");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/NSFileManager_TSUAdditions.m");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 17, 0, "Invalid parameter not satisfying: %{public}s", "dstURL");

    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  }
LABEL_4:
  if (objc_msgSend(v8, "tsu_isOnAPFSVolume") && (objc_msgSend(v8, "tsu_isOnSameVolumeAs:", v10) & 1) != 0
    || (objc_msgSend(a1, "linkItemAtURL:toURL:error:", v8, v10, 0) & 1) == 0)
  {
    v18 = 0;
    v14 = objc_msgSend(a1, "copyItemAtURL:toURL:error:", v8, v10, &v18);
    v13 = v18;
    if (a5 && (v14 & 1) == 0)
    {
      v13 = objc_retainAutorelease(v13);
      v14 = 0;
      *a5 = v13;
    }
  }
  else
  {
    v13 = 0;
    v14 = 1;
  }

  return v14;
}

@end
