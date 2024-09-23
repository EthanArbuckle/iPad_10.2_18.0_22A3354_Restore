@implementation SDAirDropFileZipper

- (SDAirDropFileZipper)init
{
  return -[SDAirDropFileZipper initWithQueue:boundStreamSize:](self, "initWithQueue:boundStreamSize:", &_dispatch_main_q, 0x20000);
}

- (SDAirDropFileZipper)initWithQueue:(id)a3 boundStreamSize:(int64_t)a4
{
  id v7;
  SDAirDropFileZipper *v8;
  SDAirDropFileZipper *v9;
  NSString *bomPath;
  NSString *senderName;
  NSURL *tempFolder;
  NSURL *destination;
  NSArray *sourceFiles;
  OS_dispatch_source *progressTimer;
  NSString *zipCompressionType;
  NSString *unzipCompressionType;
  NSMutableArray *placeholderFiles;
  NSMutableArray *orderedRelativePaths;
  SDAirDropCompressor *compressionEngine;
  NSSet *skipReadableCheckFiles;
  NSMutableArray *v22;
  NSMutableArray *topLevelFiles;
  NSMutableDictionary *v24;
  NSMutableDictionary *alternateNames;
  NSMutableDictionary *v26;
  NSMutableDictionary *relativePathToFile;
  uint64_t v28;
  SDStatusMonitor *monitor;
  dispatch_queue_t v30;
  OS_dispatch_queue *zipQueue;
  objc_super v33;

  v7 = a3;
  v33.receiver = self;
  v33.super_class = (Class)SDAirDropFileZipper;
  v8 = -[SDAirDropFileZipper init](&v33, "init");
  v9 = v8;
  if (v8)
  {
    bomPath = v8->_bomPath;
    v8->_bomPath = 0;

    v9->_usePKZip = 0;
    v9->_clientPid = 0;
    v9->_bomCopier = 0;
    senderName = v9->_senderName;
    v9->_senderName = 0;

    tempFolder = v9->_tempFolder;
    v9->_tempFolder = 0;

    destination = v9->_destination;
    v9->_destination = 0;

    v9->_bomArchive = 0;
    v9->_readStream = 0;
    v9->_writeStream = 0;
    sourceFiles = v9->_sourceFiles;
    v9->_sourceFiles = 0;

    progressTimer = v9->_progressTimer;
    v9->_progressTimer = 0;

    zipCompressionType = v9->_zipCompressionType;
    v9->_zipCompressionType = 0;

    unzipCompressionType = v9->_unzipCompressionType;
    v9->_unzipCompressionType = 0;

    placeholderFiles = v9->_placeholderFiles;
    v9->_placeholderFiles = 0;

    orderedRelativePaths = v9->_orderedRelativePaths;
    v9->_orderedRelativePaths = 0;

    compressionEngine = v9->_compressionEngine;
    v9->_compressionEngine = 0;

    skipReadableCheckFiles = v9->_skipReadableCheckFiles;
    v9->_skipReadableCheckFiles = 0;

    v9->_fileCount = 0;
    v9->_totalBytes = 0;
    v9->_lastBytesCopied = 0;
    v9->_totalBytesCopied = 0;
    v9->_timeStarted = 0.0;
    v9->_lastProgress = 0.0;
    v22 = objc_opt_new(NSMutableArray);
    topLevelFiles = v9->_topLevelFiles;
    v9->_topLevelFiles = v22;

    v24 = objc_opt_new(NSMutableDictionary);
    alternateNames = v9->_alternateNames;
    v9->_alternateNames = v24;

    v26 = objc_opt_new(NSMutableDictionary);
    relativePathToFile = v9->_relativePathToFile;
    v9->_relativePathToFile = v26;

    v28 = objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
    monitor = v9->_monitor;
    v9->_monitor = (SDStatusMonitor *)v28;

    objc_storeStrong((id *)&v9->_queue, a3);
    v30 = dispatch_queue_create("com.apple.airdrop.zip", (dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent);
    zipQueue = v9->_zipQueue;
    v9->_zipQueue = (OS_dispatch_queue *)v30;

    v9->_boundStreamSize = a4;
  }

  return v9;
}

- (void)dealloc
{
  __CFReadStream *readStream;
  _BOMBom *bomArchive;
  __CFWriteStream *writeStream;
  NSString *bomPath;
  const std::__fs::filesystem::path *v7;
  std::error_code *v8;
  NSURL *tempFolder;
  objc_super v10;

  readStream = self->_readStream;
  if (readStream)
    CFRelease(readStream);
  bomArchive = self->_bomArchive;
  if (bomArchive)
    BOMBomFree(bomArchive, a2);
  writeStream = self->_writeStream;
  if (writeStream)
    CFRelease(writeStream);
  bomPath = self->_bomPath;
  if (bomPath)
  {
    v7 = -[NSString UTF8String](bomPath, "UTF8String");
    remove(v7, v8);
  }
  tempFolder = self->_tempFolder;
  if (tempFolder)
    sub_10019BB20(tempFolder);
  v10.receiver = self;
  v10.super_class = (Class)SDAirDropFileZipper;
  -[SDAirDropFileZipper dealloc](&v10, "dealloc");
}

- (void)notifyClientForEvent:(int64_t)a3 withProperty:(void *)a4
{
  NSObject *queue;
  _QWORD block[7];

  CFRetain(a4);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100132F04;
  block[3] = &unk_1007183D0;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_async(queue, block);
}

- (BOOL)isCompressor
{
  return self->_bomPath != 0;
}

- (BOOL)isDecompressor
{
  return !-[SDAirDropFileZipper isCompressor](self, "isCompressor");
}

- (int64_t)totalBytes
{
  return self->_totalBytes;
}

- (void)setTotalBytes:(id)a3
{
  self->_totalBytes = (int64_t)objc_msgSend(a3, "longLongValue");
}

- (void)setPlaceholderFiles:(id)a3 withCreationCompletionHandler:(id)a4
{
  id v6;
  NSMutableArray *v7;
  NSMutableArray *placeholderFiles;
  NSMutableArray *v9;
  NSMutableArray *orderedRelativePaths;
  NSMutableArray *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  id creationCompletionHandler;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v6 = a4;
  v7 = (NSMutableArray *)objc_msgSend(a3, "mutableCopy");
  placeholderFiles = self->_placeholderFiles;
  self->_placeholderFiles = v7;

  v9 = objc_opt_new(NSMutableArray);
  orderedRelativePaths = self->_orderedRelativePaths;
  self->_orderedRelativePaths = v9;

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v11 = self->_placeholderFiles;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v21;
    v15 = kSFOperationFileBomPathKey;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v21 != v14)
          objc_enumerationMutation(v11);
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v16), "objectForKeyedSubscript:", v15, (_QWORD)v20));
        if (v17)
          -[NSMutableArray addObject:](self->_orderedRelativePaths, "addObject:", v17);

        v16 = (char *)v16 + 1;
      }
      while (v13 != v16);
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v13);
  }

  v18 = objc_msgSend(v6, "copy");
  creationCompletionHandler = self->_creationCompletionHandler;
  self->_creationCompletionHandler = v18;

}

- (void)setDestination:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSURL *v9;
  NSURL *destination;
  int v11;
  void *v12;

  v4 = a3;
  v5 = airdrop_log(v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "path"));
    v11 = 138412290;
    v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "AirDrop destination set to %@", (uint8_t *)&v11, 0xCu);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "filePathURL"));
  v9 = (NSURL *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "URLByResolvingSymlinksInPath"));
  destination = self->_destination;
  self->_destination = v9;

}

- (NSURL)destination
{
  return self->_destination;
}

- (void)setReadStream:(__CFReadStream *)a3
{
  __CFReadStream *readStream;

  readStream = self->_readStream;
  if (readStream != a3)
  {
    if (readStream)
      CFRelease(readStream);
    self->_readStream = (__CFReadStream *)CFRetain(a3);
  }
}

- (__CFReadStream)copyReadStream
{
  __CFReadStream *result;

  result = self->_readStream;
  if (result)
    return (__CFReadStream *)CFRetain(result);
  return result;
}

- (id)timeRemaining:(int64_t)a3 timeNow:(double)a4
{
  float v4;

  v4 = (double)a3 / (a4 - self->_timeStarted);
  return +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", (int)(float)((float)(self->_totalBytes - a3) / v4));
}

- (void)notifyProgress:(int64_t)a3 force:(BOOL)a4
{
  CFAbsoluteTime Current;
  int64_t totalBytes;
  int64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *progressTimer;
  dispatch_time_t v16;
  NSMutableDictionary *v17;

  Current = CFAbsoluteTimeGetCurrent();
  if (a4 || Current > self->_lastProgress + 0.2)
  {
    totalBytes = self->_totalBytes;
    if (self->_totalBytesCopied + a3 <= totalBytes || totalBytes == 0)
      v10 = self->_totalBytesCopied + a3;
    else
      v10 = self->_totalBytes;
    if (v10 > self->_lastBytesCopied || -[SDStatusMonitor enableBugs](self->_monitor, "enableBugs"))
    {
      self->_lastProgress = Current;
      self->_lastBytesCopied = v10;
      v11 = -[NSMutableArray count](self->_topLevelFiles, "count");
      v17 = objc_opt_new(NSMutableDictionary);
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropFileZipper timeRemaining:timeNow:](self, "timeRemaining:timeNow:", v10, Current));
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v11));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v17, "setObject:forKeyedSubscript:", v13, kSFOperationFilesCopiedKey);

      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", v10));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v17, "setObject:forKeyedSubscript:", v14, kSFOperationBytesCopiedKey);

      -[NSMutableDictionary setObject:forKeyedSubscript:](v17, "setObject:forKeyedSubscript:", v12, kSFOperationTimeRemainingKey);
      -[SDAirDropFileZipper notifyClientForEvent:withProperty:](self, "notifyClientForEvent:withProperty:", 7, v17);

    }
  }
  else
  {
    progressTimer = self->_progressTimer;
    v16 = dispatch_time(0, 200000000);
    sub_10019AB78(progressTimer, v16);
  }
}

- (id)absoluteURLIfTopLevelFile:(const char *)a3 isDirectory:(BOOL)a4 base:(__CFURL *)a5
{
  size_t v8;
  const __CFURL *v9;
  const __CFURL *v10;
  const __CFURL *PathComponent;
  const __CFURL *v12;
  CFStringRef v13;
  CFStringRef v14;
  size_t v15;
  CFURLRef v16;

  v8 = strlen(a3);
  v9 = CFURLCreateFromFileSystemRepresentation(0, (const UInt8 *)a3, v8, a4);
  if (v9)
  {
    v10 = v9;
    PathComponent = CFURLCreateCopyDeletingLastPathComponent(0, v9);
    if (PathComponent)
    {
      v12 = PathComponent;
      v13 = CFURLCopyFileSystemPath(PathComponent, kCFURLPOSIXPathStyle);
      if (v13)
      {
        v14 = v13;
        if (CFEqual(v13, CFSTR(".")))
        {
          v15 = strlen(a3);
          v16 = CFURLCreateFromFileSystemRepresentationRelativeToBase(0, (const UInt8 *)a3, v15, a4, a5);
        }
        else
        {
          v16 = 0;
        }
        CFRelease(v14);
      }
      else
      {
        v16 = 0;
      }
      CFRelease(v12);
    }
    else
    {
      v16 = 0;
    }
    CFRelease(v10);
  }
  else
  {
    v16 = 0;
  }
  return v16;
}

- (BOOL)validFileName:(id)a3
{
  id v4;
  BOOL v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;
  NSMutableArray *obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v4 = a3;
  if (-[SDStatusMonitor enableBugs](self->_monitor, "enableBugs"))
  {
    v5 = 1;
  }
  else
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    obj = self->_placeholderFiles;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v20;
      v9 = kSFOperationFileNameKey;
      while (2)
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v20 != v8)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
          v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_alternateNames, "objectForKeyedSubscript:", v4));
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", v9));
          v14 = v13;
          if (v12 && objc_msgSend(v13, "isEqual:", v12))
          {

LABEL_16:
            v5 = 1;
            goto LABEL_17;
          }
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastPathComponent"));
          v16 = objc_msgSend(v14, "isEqual:", v15);

          if ((v16 & 1) != 0)
            goto LABEL_16;
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        v5 = 0;
        if (v7)
          continue;
        break;
      }
    }
    else
    {
      v5 = 0;
    }
LABEL_17:

  }
  return v5;
}

- (void)removeFileFromPlaceholderList:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  id v15;

  v15 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_alternateNames, "objectForKeyedSubscript:"));
  v5 = v4;
  if (v4)
    v6 = v4;
  else
    v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "lastPathComponent"));
  v7 = v6;

  v8 = -[NSMutableArray count](self->_placeholderFiles, "count");
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = kSFOperationFileNameKey;
    while (1)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_placeholderFiles, "objectAtIndexedSubscript:", v10));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", v11));
      v14 = objc_msgSend(v7, "isEqual:", v13);

      if ((v14 & 1) != 0)
        break;
      if (v9 == (id)++v10)
        goto LABEL_10;
    }
    -[NSMutableArray removeObjectAtIndex:](self->_placeholderFiles, "removeObjectAtIndex:", v10);
  }
LABEL_10:

}

- (id)fixedRelativePath:(const char *)a3
{
  const __CFString *v4;
  __CFString *v5;
  CFStringRef v6;

  v4 = CFStringCreateWithCString(0, a3, 0x8000100u);
  v5 = (__CFString *)v4;
  if (v4 && !CFStringHasPrefix(v4, CFSTR("./")) && !-[SDStatusMonitor enableBugs](self->_monitor, "enableBugs"))
  {
    v6 = CFStringCreateWithFormat(0, 0, CFSTR("%@%@"), CFSTR("./"), v5);
    CFRelease(v5);
    v5 = (__CFString *)v6;
  }
  return v5;
}

- (BOOL)pathExistsInPlaceholderInfo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v4 = a3;
  if (v4)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v5 = self->_placeholderFiles;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v16;
      v9 = kSFOperationFileBomPathKey;
      while (2)
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v16 != v8)
            objc_enumerationMutation(v5);
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i), "objectForKeyedSubscript:", v9, (_QWORD)v15));
          v12 = v11;
          if (v11 && (objc_msgSend(v11, "isEqual:", v4) & 1) != 0)
          {

            v13 = 1;
            goto LABEL_14;
          }

        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v7)
          continue;
        break;
      }
    }
    v13 = 0;
LABEL_14:

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)bomCopierCopyFileFinished:(const char *)a3 type:(int)a4 size:(int64_t)a5 operation:(int)a6
{
  id v9;
  void *v10;
  NSMutableDictionary *relativePathToFile;
  void *v12;

  if (!a6)
  {
    self->_totalBytesCopied += a5;
    if (-[SDAirDropFileZipper isCompressor](self, "isCompressor"))
    {
      v9 = (id)objc_claimAutoreleasedReturnValue(-[SDAirDropFileZipper absoluteURLIfTopLevelFile:isDirectory:base:](self, "absoluteURLIfTopLevelFile:isDirectory:base:", a3, a4 == 2, self->_destination));
      if (v9)
      {
        if ((-[NSMutableArray containsObject:](self->_topLevelFiles, "containsObject:", v9) & 1) == 0)
        {
          -[NSMutableArray addObject:](self->_topLevelFiles, "addObject:", v9);
          -[SDAirDropFileZipper notifyProgress:force:](self, "notifyProgress:force:", 0, 1);
        }
      }
      -[SDAirDropCompressor fileComplete](self->_compressionEngine, "fileComplete");
    }
    else
    {
      v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[SDAirDropFileZipper fixedRelativePath:](self, "fixedRelativePath:", a3)));
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:](NSURL, "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", objc_msgSend(v9, "UTF8String"), a4 == 2, self->_tempFolder));
      if (v10)
      {
        -[SDAirDropFileZipper quarantineFile:](self, "quarantineFile:", v10);
        if (-[SDAirDropFileZipper pathExistsInPlaceholderInfo:](self, "pathExistsInPlaceholderInfo:", v9))
        {
          if (-[SDAirDropFileZipper validFileName:](self, "validFileName:", v9))
          {
            if ((-[NSMutableArray containsObject:](self->_topLevelFiles, "containsObject:", v10) & 1) == 0)
            {
              -[NSMutableArray addObject:](self->_topLevelFiles, "addObject:", v10);
              relativePathToFile = self->_relativePathToFile;
              v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "relativePath"));
              -[NSMutableDictionary setObject:forKeyedSubscript:](relativePathToFile, "setObject:forKeyedSubscript:", v10, v12);

              -[SDAirDropFileZipper notifyProgress:force:](self, "notifyProgress:force:", 0, 1);
            }
            -[SDAirDropFileZipper removeFileFromPlaceholderList:](self, "removeFileFromPlaceholderList:", v9);
          }
        }
      }

    }
    -[SDAirDropFileZipper notifyProgress:force:](self, "notifyProgress:force:", 0, 0);
  }
}

- (void)bomCopierFatalFileError:(int)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, a3, 0));
  -[SDAirDropFileZipper notifyClientForEvent:withProperty:](self, "notifyClientForEvent:withProperty:", 10, v4);

}

- (void)bomCopierFatalError:(const char *)a3
{
  void *v4;
  void *v5;
  void *v6;
  NSErrorUserInfoKey v7;
  void *v8;

  v7 = NSLocalizedDescriptionKey;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", a3));
  v8 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v8, &v7, 1));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 5, v5));
  -[SDAirDropFileZipper notifyClientForEvent:withProperty:](self, "notifyClientForEvent:withProperty:", 10, v6);

}

- (int64_t)totalFileSize:(__CFURL *)a3
{
  int64_t v3;
  BOOL v4;
  CFNumberRef number;
  int64_t valuePtr;

  v3 = -1;
  number = 0;
  valuePtr = -1;
  if (CFURLCopyResourcePropertyForKey(a3, kCFURLTotalFileSizeKey, &number, 0))
    v4 = number == 0;
  else
    v4 = 1;
  if (!v4)
  {
    if (!CFNumberGetValue(number, kCFNumberSInt64Type, &valuePtr))
      valuePtr = -1;
    CFRelease(number);
    return valuePtr;
  }
  return v3;
}

- (__CFArray)copyReverseParentChain:(__CFURL *)a3 base:(__CFURL *)a4
{
  __CFArray *Mutable;
  CFURLRef PathComponent;
  CFURLRef v8;

  Mutable = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
  PathComponent = CFURLCreateCopyDeletingLastPathComponent(0, a3);
  if (CFEqual(a4, PathComponent))
  {
    v8 = PathComponent;
  }
  else
  {
    do
    {
      CFArrayAppendValue(Mutable, PathComponent);
      v8 = CFURLCreateCopyDeletingLastPathComponent(0, PathComponent);
      CFRelease(PathComponent);
      PathComponent = v8;
    }
    while (!CFEqual(a4, v8));
  }
  CFRelease(v8);
  return Mutable;
}

- (BOOL)addFile:(__CFURL *)a3 withBase:(__CFURL *)a4 toBom:(_BOMBom *)a5
{
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t inserted;
  BOOL v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  NSObject *v19;

  v8 = sub_10019B4C4(a3);
  if (!v8)
    return 0;
  v9 = v8;
  v10 = BOMFSObjectNewFromPath(v8, B_PATHONLY);
  if (v10)
  {
    v11 = v10;
    v12 = sub_10019AF1C(a3, a4);
    if (v12)
    {
      v13 = v12;
      BOMFSObjectSetPathName(v11, v12, 1);
      inserted = BOMBomInsertFSObject(a5, v11, 1);
      v15 = (_DWORD)inserted == 0;
      if ((_DWORD)inserted)
      {
        v16 = airdrop_log(inserted);
        v17 = objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          sub_100136664();

      }
      free(v13);
    }
    else
    {
      v15 = 0;
    }
    BOMFSObjectFree(v11);
  }
  else
  {
    v18 = airdrop_log(0);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      sub_100136604();

    v15 = 0;
  }
  free(v9);
  return v15;
}

- (void)addParentChain:(_BOMBom *)a3 file:(__CFURL *)a4 base:(__CFURL *)a5
{
  __CFArray *v8;
  CFIndex Count;
  unint64_t v10;

  v8 = -[SDAirDropFileZipper copyReverseParentChain:base:](self, "copyReverseParentChain:base:", a4, a5);
  Count = CFArrayGetCount(v8);
  if (Count >= 1)
  {
    v10 = Count + 1;
    do
    {
      -[SDAirDropFileZipper addFile:withBase:toBom:](self, "addFile:withBase:toBom:", CFArrayGetValueAtIndex(v8, v10 - 2), a5, a3);
      --v10;
    }
    while (v10 > 1);
  }
  CFRelease(v8);
}

- (BOOL)addFileURLToBom:(_BOMBom *)a3 file:(__CFURL *)a4 base:(__CFURL *)a5 propertyKeys:(id)a6 topLevel:(BOOL)a7
{
  _BOOL4 v7;
  const __CFArray *v12;
  id WeakRetained;
  void *v14;
  __int128 v15;
  char v16;
  _BOOL4 v17;
  const __CFURLEnumerator *v18;
  CFURLEnumeratorResult NextURL;
  id v20;
  uint64_t v21;
  _OWORD v23[2];

  v7 = a7;
  v12 = (const __CFArray *)a6;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (!WeakRetained)
    goto LABEL_17;
  v14 = WeakRetained;
  if (-[NSSet containsObject:](self->_skipReadableCheckFiles, "containsObject:", a4))
  {

    goto LABEL_5;
  }
  v15 = *(_OWORD *)&self->_auditToken.val[4];
  v23[0] = *(_OWORD *)self->_auditToken.val;
  v23[1] = v15;
  v16 = sub_10019B530(a4, v23);

  if ((v16 & 1) == 0)
  {
LABEL_17:
    LOBYTE(v17) = 0;
    goto LABEL_24;
  }
LABEL_5:
  if (v7)
    -[SDAirDropFileZipper addParentChain:file:base:](self, "addParentChain:file:base:", a3, a4, a5);
  v17 = -[SDAirDropFileZipper addFile:withBase:toBom:](self, "addFile:withBase:toBom:", a4, a5, a3);
  if (v17)
    ++self->_fileCount;
  if (sub_10019A9F0(a4))
  {
    *(_QWORD *)&v23[0] = 0;
    v18 = CFURLEnumeratorCreateForDirectoryURL(0, a4, 0, v12);
    while (1)
    {
      NextURL = CFURLEnumeratorGetNextURL(v18, (CFURLRef *)v23, 0);
      if (NextURL == kCFURLEnumeratorSuccess)
        -[SDAirDropFileZipper addFileURLToBom:file:base:propertyKeys:topLevel:](self, "addFileURLToBom:file:base:propertyKeys:topLevel:", a3, *(_QWORD *)&v23[0], a5, v12, 0);
      v20 = objc_loadWeakRetained((id *)&self->_delegate);
      if (NextURL == kCFURLEnumeratorEnd || !v20)
        break;

      if (NextURL == kCFURLEnumeratorError)
        goto LABEL_23;
    }

LABEL_23:
    CFRelease(v18);
  }
  else
  {
    v21 = -[SDAirDropFileZipper totalFileSize:](self, "totalFileSize:", a4);
    if (v21 >= 1)
      self->_totalBytes += v21;
    if ((unint64_t)v21 >> 33)
      self->_usePKZip = 1;
  }
LABEL_24:

  return v17;
}

- (id)URLFromFileInfo:(id)a3
{
  id v4;
  void *v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  Boolean v9;
  int Value;
  const __CFURL *v11;
  const __CFURL *v12;
  CFURLRef v13;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_12;
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", kSFOperationFileNameKey));

  v7 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", kSFOperationFileTypeKey));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", kSFOperationFileIsDirectoryKey));

  if (self->_shouldExtractMediaFromPhotosBundles)
  {
    v9 = 0;
  }
  else
  {
    if (v8)
      Value = CFBooleanGetValue((CFBooleanRef)v8);
    else
      Value = v7 ? UTTypeConformsTo(v7, kUTTypeDirectory) : 0;
    v9 = Value != 0;
  }
  v11 = CFURLCreateWithFileSystemPathRelativeToBase(0, v6, kCFURLPOSIXPathStyle, v9, (CFURLRef)self->_destination);
  if (v11)
  {
    v12 = v11;
    v13 = CFURLCopyAbsoluteURL(v11);
    CFRelease(v12);
  }
  else
  {
LABEL_12:
    v13 = 0;
  }

  return v13;
}

- (id)prettyNameBasedOnUUID:(id)a3
{
  unsigned int v3;
  _QWORD v5[2];

  v5[0] = 0;
  v5[1] = 0;
  objc_msgSend(a3, "getUUIDBytes:", v5);
  v3 = bswap32(LOWORD(v5[0]));
  return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("IMG_%04u"), (unsigned __int16)(HIWORD(v3)- 10000* ((unsigned __int16)((839 * (v3 >> 20)) >> 16) >> 3))));
}

- (BOOL)createPlaceholderFiles
{
  SDAirDropFileZipper *v2;
  NSMutableArray *placeholderFiles;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  const __CFURL *v10;
  BOOL v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  NSURL *destination;
  id v24;
  id v25;
  char v26;
  uint64_t v27;
  NSObject *v28;
  NSMutableDictionary *alternateNames;
  SDAirDropFileZipper *v30;
  NSObject *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  NSObject *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  NSObject *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  id v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint8_t v54;
  char v55[15];
  uint8_t v56;
  char v57[7];
  id v58;
  uint8_t buf[4];
  void *v60;
  __int16 v61;
  NSURL *v62;
  __int16 v63;
  void *v64;

  v2 = self;
  placeholderFiles = self->_placeholderFiles;
  if (placeholderFiles)
  {
    v49 = -[NSMutableArray count](placeholderFiles, "count");
    if (v49)
    {
      v4 = 0;
      v53 = kSFOperationFileNameKey;
      v51 = kSFOperationFileBomPathKey;
      while (1)
      {
        v5 = objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](v2->_placeholderFiles, "objectAtIndexedSubscript:", v4));
        v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", v53));
        v7 = v6;
        if (!v6)
          break;
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastPathComponent"));
        if (!objc_msgSend(v7, "isEqual:", v8)
          || (objc_msgSend(v7, "isEqual:", CFSTR(".")) & 1) != 0)
        {

LABEL_37:
          v39 = airdrop_log(objc_msgSend(objc_retainAutorelease(v7), "UTF8String"));
          v40 = objc_claimAutoreleasedReturnValue(v39);
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
            sub_100136780();
          goto LABEL_41;
        }
        v9 = objc_msgSend(v7, "isEqual:", CFSTR(".."));

        if ((v9 & 1) != 0)
          goto LABEL_37;
        v50 = v7;
        v10 = (const __CFURL *)objc_claimAutoreleasedReturnValue(-[SDAirDropFileZipper URLFromFileInfo:](v2, "URLFromFileInfo:", v5));
        while (v10)
        {
          v58 = 0;
          v11 = sub_10019BD64(v10, &v58);
          v12 = v58;
          v13 = v12;
          if (v11)
            goto LABEL_29;
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "domain"));
          if (!objc_msgSend(v14, "isEqual:", NSPOSIXErrorDomain))
          {

LABEL_24:
            v34 = airdrop_log(v16);
            v35 = objc_claimAutoreleasedReturnValue(v34);
            if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v60 = v13;
              _os_log_error_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "SDAirDropFileZipper: createPlaceholder %@", buf, 0xCu);
            }
LABEL_28:

LABEL_29:
            break;
          }
          v15 = objc_msgSend(v13, "code");

          if (v15 != (id)17)
            goto LABEL_24;
          v17 = (void *)objc_claimAutoreleasedReturnValue(-[__CFURL lastPathComponent](v10, "lastPathComponent"));
          if (!v17)
          {
            v36 = airdrop_log(0);
            v35 = objc_claimAutoreleasedReturnValue(v36);
            if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
              sub_1001367E0(&v54, v55, v35);
            goto LABEL_28;
          }
          v18 = v17;
          v19 = sub_10019BF98(v17);
          v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
          v21 = airdrop_log(v20);
          v22 = objc_claimAutoreleasedReturnValue(v21);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            destination = v2->_destination;
            *(_DWORD *)buf = 138412802;
            v60 = v18;
            v61 = 2112;
            v62 = destination;
            v63 = 2112;
            v64 = v20;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "SDAirDropFileZipper: Placeholder filename %@ already exists at destination: %@. Creating as new filename: %@", buf, 0x20u);
          }

          v24 = -[NSObject mutableCopy](v5, "mutableCopy");
          objc_msgSend(v24, "setObject:forKeyedSubscript:", v20, v53);
          v25 = objc_msgSend(v18, "isEqual:", v20);
          v26 = (char)v25;
          if ((v25 & 1) != 0)
          {
            v27 = airdrop_log(v25);
            v28 = objc_claimAutoreleasedReturnValue(v27);
            if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
              sub_100136814(&v56, v57, v28);

          }
          else
          {
            v52 = objc_claimAutoreleasedReturnValue(-[SDAirDropFileZipper URLFromFileInfo:](v2, "URLFromFileInfo:", v24));

            alternateNames = v2->_alternateNames;
            v30 = v2;
            v31 = v5;
            v32 = v4;
            v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectForKeyedSubscript:", v51));
            -[NSMutableDictionary setObject:forKeyedSubscript:](alternateNames, "setObject:forKeyedSubscript:", v20, v33);

            v4 = v32;
            v5 = v31;
            v2 = v30;
            -[NSMutableArray setObject:atIndexedSubscript:](v30->_placeholderFiles, "setObject:atIndexedSubscript:", v24, v4);
            v10 = (const __CFURL *)v52;
          }

          if ((v26 & 1) != 0)
            break;
        }

        if ((id)++v4 == v49)
          return 1;
      }
      v41 = airdrop_log(0);
      v40 = objc_claimAutoreleasedReturnValue(v41);
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        sub_10013671C(v4, v40, v42, v43, v44, v45, v46, v47);
LABEL_41:

    }
    else
    {
      v38 = airdrop_log(0);
      v5 = objc_claimAutoreleasedReturnValue(v38);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        sub_1001366F0();
    }
  }
  else
  {
    v37 = airdrop_log(0);
    v5 = objc_claimAutoreleasedReturnValue(v37);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1001366C4();
  }

  return 0;
}

- (void)removeUnusedPlaceholderFiles
{
  NSMutableArray *placeholderFiles;
  NSMutableArray *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  const __CFURL *v9;
  const __CFURL *v10;
  CFStringRef v11;
  const __CFString *v12;
  std::error_code *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  std::__fs::filesystem::path buffer[42];
  _BYTE v19[128];

  placeholderFiles = self->_placeholderFiles;
  if (placeholderFiles)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v4 = placeholderFiles;
    v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v15;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v15 != v7)
            objc_enumerationMutation(v4);
          v9 = (const __CFURL *)objc_claimAutoreleasedReturnValue(-[SDAirDropFileZipper URLFromFileInfo:](self, "URLFromFileInfo:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v8), (_QWORD)v14));
          v10 = v9;
          if (v9)
          {
            v11 = CFURLCopyFileSystemPath(v9, kCFURLPOSIXPathStyle);
            if (v11)
            {
              v12 = v11;
              bzero(buffer, 0x400uLL);
              if (CFStringGetCString(v12, (char *)buffer, 1024, 0x8000100u))
                remove(buffer, v13);
              CFRelease(v12);
            }
          }

          v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
      }
      while (v6);
    }

  }
}

- (id)conflictResolvedURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastPathComponent"));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "relativePath"));
    v7 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_alternateNames, "objectForKeyedSubscript:", v6));
    v8 = (void *)v7;
    if (v7)
      v9 = (void *)v7;
    else
      v9 = v5;
    v10 = v9;

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL URLByAppendingPathComponent:](self->_destination, "URLByAppendingPathComponent:", v10));
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)moveFile:(__CFURL *)a3 toDestination:(__CFURL *)a4
{
  BOOL v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  _BOOL4 v12;
  NSObject *v13;
  NSObject *v14;
  BOOL v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  id v23;
  id v24;

  v24 = 0;
  v6 = sub_10019C838(a3, a4, &v24);
  v7 = v24;
  v8 = v7;
  if (!v6)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "domain"));
    if (objc_msgSend(v9, "isEqual:", NSPOSIXErrorDomain))
    {
      v10 = objc_msgSend(v8, "code");

      if (v10 == (id)20)
      {
        v23 = 0;
        v12 = sub_10019BB74(a4, &v23);
        v13 = v23;
        v14 = v13;
        if (v12)
        {
          v22 = v13;
          v15 = sub_10019C838(a3, a4, (id *)&v22);
          v16 = v22;

          if (v15)
          {
LABEL_15:

            goto LABEL_16;
          }
          v18 = airdrop_log(v17);
          v19 = objc_claimAutoreleasedReturnValue(v18);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            sub_100136848();
        }
        else
        {
          v21 = airdrop_log(v13);
          v19 = objc_claimAutoreleasedReturnValue(v21);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            sub_1001368A8();
          v16 = v14;
        }

        goto LABEL_15;
      }
    }
    else
    {

    }
    v20 = airdrop_log(v11);
    v16 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_100136908();
    goto LABEL_15;
  }
LABEL_16:

}

- (void)moveFilesToDestination
{
  NSMutableArray *v3;
  NSMutableArray *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSMutableArray *v10;
  NSMutableArray *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  NSMutableArray *topLevelFiles;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];

  v3 = objc_opt_new(NSMutableArray);
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v4 = self->_orderedRelativePaths;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v24;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v24 != v7)
          objc_enumerationMutation(v4);
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_relativePathToFile, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)v8)));
        if (v9)
          -[NSMutableArray addObject:](v3, "addObject:", v9);

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v6);
  }

  v10 = objc_opt_new(NSMutableArray);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v11 = v3;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v20;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v20 != v14)
          objc_enumerationMutation(v11);
        v16 = *(id *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropFileZipper conflictResolvedURL:](self, "conflictResolvedURL:", v16, (_QWORD)v19));
        if (v17)
        {
          -[SDAirDropFileZipper moveFile:toDestination:](self, "moveFile:toDestination:", v16, v17);
          -[NSMutableArray addObject:](v10, "addObject:", v17);
        }

        v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v13);
  }

  topLevelFiles = self->_topLevelFiles;
  self->_topLevelFiles = v10;

}

- (int)bomCopierCopy:(id)a3 destination:(id)a4 options:(id)a5
{
  const __CFURL *v8;
  id v9;
  const __CFURL *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *zipQueue;
  NSObject *v15;
  int v16;
  _QWORD block[4];
  const __CFURL *v19;
  SDAirDropFileZipper *v20;
  NSObject *v21;

  v8 = (const __CFURL *)a4;
  v9 = a5;
  v10 = (const __CFURL *)a3;
  self->_bomCopier = (_BOMCopier *)BOMCopierNew();
  BOMCopierSetUserData();
  BOMCopierSetFileErrorHandler(self->_bomCopier, sub_100134EF8);
  BOMCopierSetFatalErrorHandler(self->_bomCopier, sub_100134F54);
  BOMCopierSetCopyFileUpdateHandler(self->_bomCopier, sub_100134FC4);
  BOMCopierSetFatalFileErrorHandler(self->_bomCopier, sub_100135004);
  BOMCopierSetCopyFileFinishedHandler(self->_bomCopier, sub_10013507C);
  BOMCopierSetFileConflictErrorHandler(self->_bomCopier, sub_1001350D8);
  v11 = sub_10019B4C4(v10);

  v12 = sub_10019B4C4(v8);
  if (self->_compressionEngine)
  {
    v13 = dispatch_group_create();
    dispatch_group_enter(v13);
    zipQueue = self->_zipQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100135124;
    block[3] = &unk_100715138;
    v19 = v8;
    v20 = self;
    v21 = v13;
    v15 = v13;
    dispatch_async(zipQueue, block);
    v16 = BOMCopierCopyWithOptions(self->_bomCopier, v11, v12, v9);
    dispatch_group_wait(v15, 0xFFFFFFFFFFFFFFFFLL);

    if (!v11)
      goto LABEL_4;
    goto LABEL_3;
  }
  v16 = BOMCopierCopyWithOptions(self->_bomCopier, v11, v12, v9);
  if (v11)
LABEL_3:
    free(v11);
LABEL_4:
  if (v12)
    free(v12);

  return v16;
}

- (void)allowProgressCircleToComplete
{
  CFAbsoluteTime v2;
  double v3;
  BOOL v4;
  double v5;

  v2 = CFAbsoluteTimeGetCurrent() - self->_timeStarted;
  v3 = (0.95 - v2) * 1000000.0;
  v4 = v2 < 0.45;
  v5 = 500000.0;
  if (v4)
    v5 = v3;
  usleep(v5);
}

- (void)startBomCopy:(id)a3 destination:(id)a4 options:(id)a5
{
  id v8;
  const __CFURL *v9;
  id v10;
  _BOOL8 v11;
  __int128 v12;
  NSMutableDictionary *v13;
  void *v14;
  double Current;
  NSObject *zipQueue;
  NSObject *v17;
  OS_dispatch_source *v18;
  OS_dispatch_source *progressTimer;
  _BOOL8 v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  id WeakRetained;
  id v33;
  uint64_t v34;
  NSObject *v35;
  id v36;
  NSMutableArray *topLevelFiles;
  uint64_t v38;
  NSObject *v39;
  _BOOL4 v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  NSErrorDomain v47;
  uint64_t v48;
  void *v49;
  NSObject *queue;
  _QWORD v51[5];
  _QWORD v52[5];
  _BYTE buf[32];

  v8 = a3;
  v9 = (const __CFURL *)a4;
  v10 = a5;
  v11 = -[SDAirDropFileZipper isDecompressor](self, "isDecompressor");
  if (v11
    && (v12 = *(_OWORD *)&self->_auditToken.val[4],
        *(_OWORD *)buf = *(_OWORD *)self->_auditToken.val,
        *(_OWORD *)&buf[16] = v12,
        v11 = sub_10019B5CC(v9))
    || self->_fileCount)
  {
    v13 = objc_opt_new(NSMutableDictionary);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", self->_totalBytes));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", v14, kSFOperationTotalBytesKey);

    -[SDAirDropFileZipper notifyClientForEvent:withProperty:](self, "notifyClientForEvent:withProperty:", 5, v13);
    Current = CFAbsoluteTimeGetCurrent();
    self->_timeStarted = Current;
    self->_lastProgress = Current + -0.2;
    zipQueue = self->_zipQueue;
    v52[0] = _NSConcreteStackBlock;
    v52[1] = 3221225472;
    v52[2] = sub_1001355D4;
    v52[3] = &unk_1007146D8;
    v52[4] = self;
    v17 = sub_10019AAD8(0, zipQueue, v52);
    v18 = (OS_dispatch_source *)objc_claimAutoreleasedReturnValue(v17);
    progressTimer = self->_progressTimer;
    self->_progressTimer = v18;

    dispatch_resume((dispatch_object_t)self->_progressTimer);
    if (-[SDAirDropFileZipper isDecompressor](self, "isDecompressor")
      && !(v20 = -[SDAirDropFileZipper createPlaceholderFiles](self, "createPlaceholderFiles")))
    {
      v30 = airdrop_log(v20);
      v31 = objc_claimAutoreleasedReturnValue(v30);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        sub_100136BE8();

    }
    else
    {
      if (-[SDAirDropFileZipper isDecompressor](self, "isDecompressor"))
        (*((void (**)(void))self->_creationCompletionHandler + 2))();
      v21 = -[SDAirDropFileZipper bomCopierCopy:destination:options:](self, "bomCopierCopy:destination:options:", v8, v9, v10);
      if ((_DWORD)v21)
        goto LABEL_18;
      if (-[SDAirDropFileZipper isDecompressor](self, "isDecompressor"))
      {
        -[SDAirDropFileZipper moveFilesToDestination](self, "moveFilesToDestination");
        -[SDAirDropFileZipper removeUnusedPlaceholderFiles](self, "removeUnusedPlaceholderFiles");
      }
    }
    v21 = 0;
LABEL_18:
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

    if (WeakRetained)
    {
      v33 = -[NSMutableArray count](self->_topLevelFiles, "count");
      if (v33)
      {
        self->_totalBytesCopied = self->_totalBytes;
        v34 = airdrop_log(v33);
        v35 = objc_claimAutoreleasedReturnValue(v34);
        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          v36 = -[NSMutableArray count](self->_topLevelFiles, "count");
          topLevelFiles = self->_topLevelFiles;
          *(_DWORD *)buf = 134218242;
          *(_QWORD *)&buf[4] = v36;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = topLevelFiles;
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "SDAirDropFileZipper: %lu files saved: %@", buf, 0x16u);
        }

        -[SDAirDropFileZipper notifyProgress:force:](self, "notifyProgress:force:", 0, 1);
        -[SDAirDropFileZipper allowProgressCircleToComplete](self, "allowProgressCircleToComplete");
        -[SDAirDropFileZipper notifyClientForEvent:withProperty:](self, "notifyClientForEvent:withProperty:", 9, self->_topLevelFiles);
      }
      else
      {
        v38 = airdrop_log(0);
        v39 = objc_claimAutoreleasedReturnValue(v38);
        v40 = os_log_type_enabled(v39, OS_LOG_TYPE_ERROR);
        if ((_DWORD)v21)
        {
          if (v40)
            sub_100136B84(v21, v39, v41, v42, v43, v44, v45, v46);

          v47 = NSPOSIXErrorDomain;
          v48 = (int)v21;
        }
        else
        {
          if (v40)
            sub_100136B58();

          v47 = NSPOSIXErrorDomain;
          v48 = 2;
        }
        v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v47, v48, 0));
        -[SDAirDropFileZipper notifyClientForEvent:withProperty:](self, "notifyClientForEvent:withProperty:", 10, v49);

      }
    }
    dispatch_source_cancel((dispatch_source_t)self->_progressTimer);
    queue = self->_queue;
    v51[0] = _NSConcreteStackBlock;
    v51[1] = 3221225472;
    v51[2] = sub_1001355E4;
    v51[3] = &unk_1007146D8;
    v51[4] = self;
    dispatch_async(queue, v51);
    goto LABEL_32;
  }
  v22 = airdrop_log(v11);
  v23 = objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    sub_100136C14((uint64_t)self, v23, v24, v25, v26, v27, v28, v29);

  v13 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 2, 0));
  -[SDAirDropFileZipper notifyClientForEvent:withProperty:](self, "notifyClientForEvent:withProperty:", 10, v13);
LABEL_32:

}

- (BOOL)initBomWithFiles
{
  NSString *bomPath;
  _BOMBom *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t inserted;
  uint64_t v8;
  NSObject *v9;
  BOOL v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  CFTypeRef v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  NSArray *v20;
  id v21;
  id v22;
  uint64_t v23;
  void *i;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  id WeakRetained;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t buf[16];
  _BYTE v44[128];
  CFStringRef v45;

  bomPath = self->_bomPath;
  if (bomPath)
  {
    v4 = (_BOMBom *)BOMBomNew(-[NSString UTF8String](bomPath, "UTF8String"));
    self->_bomArchive = v4;
    if (v4)
    {
      v5 = BOMFSObjectNewFromPath(".", B_PATHONLY);
      if (!v5)
      {
        v14 = airdrop_log(0);
        v15 = objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          sub_100136CEC();

        v10 = 0;
        goto LABEL_34;
      }
      v6 = v5;
      inserted = BOMBomInsertFSObject(self->_bomArchive, v5, 1);
      if ((_DWORD)inserted)
      {
        v8 = airdrop_log(inserted);
        v9 = objc_claimAutoreleasedReturnValue(v8);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          sub_100136DAC();
      }
      else
      {
        v45 = kCFURLTotalFileSizeKey;
        v9 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v45, 1));
        v16 = sub_10019ADCC((const __CFArray *)self->_sourceFiles);
        v17 = airdrop_log(v16);
        v18 = objc_claimAutoreleasedReturnValue(v17);
        v19 = v18;
        if (v16)
        {
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "SDAirDropFileZipper: start adding files to BOM", buf, 2u);
          }

          v41 = 0u;
          v42 = 0u;
          v39 = 0u;
          v40 = 0u;
          v20 = self->_sourceFiles;
          v21 = -[NSArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
          if (v21)
          {
            v22 = v21;
            v23 = *(_QWORD *)v40;
            do
            {
              for (i = 0; i != v22; i = (char *)i + 1)
              {
                if (*(_QWORD *)v40 != v23)
                  objc_enumerationMutation(v20);
                -[SDAirDropFileZipper addFileURLToBom:file:base:propertyKeys:topLevel:](self, "addFileURLToBom:file:base:propertyKeys:topLevel:", self->_bomArchive, *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)i), v16, v9, 1, (_QWORD)v39);
              }
              v22 = -[NSArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
            }
            while (v22);
          }

          v26 = airdrop_log(v25);
          v27 = objc_claimAutoreleasedReturnValue(v26);
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "SDAirDropFileZipper: done adding files to BOM", buf, 2u);
          }

          WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
          v10 = WeakRetained != 0;
          if (!WeakRetained)
          {
            v30 = airdrop_log(v29);
            v31 = objc_claimAutoreleasedReturnValue(v30);
            if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
              sub_100136D80();

          }
          CFRelease(v16);
          goto LABEL_33;
        }
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          sub_100136D18((uint64_t)&self->_sourceFiles, v19, v33, v34, v35, v36, v37, v38);

      }
      v10 = 0;
LABEL_33:

      BOMFSObjectFree(v6);
LABEL_34:
      BOMBomCommit(self->_bomArchive);
      return v10;
    }
    v13 = airdrop_log(0);
    v12 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_100136CC0();
  }
  else
  {
    v11 = airdrop_log(0);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_100136C94();
  }

  return 0;
}

- (id)temporaryBomPath
{
  CFURLRef v2;
  const __CFURL *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  const __CFURL *v7;
  const __CFURL *v8;
  const __CFURL *v9;
  const __CFURL *v10;
  __CFString *v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  NSObject *v17;

  v2 = sub_10019BC64(0, 65537);
  if (v2)
  {
    v3 = v2;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "UUIDString"));
    v6 = CFStringCreateWithFormat(0, 0, CFSTR("%@.bom"), v5);

    if (v6)
    {
      v7 = CFURLCreateWithFileSystemPathRelativeToBase(0, v6, kCFURLPOSIXPathStyle, 0, v3);
      if (v7)
      {
        v8 = v7;
        v9 = CFURLCopyAbsoluteURL(v7);
        if (v9)
        {
          v10 = v9;
          v11 = (__CFString *)CFURLCopyFileSystemPath(v9, kCFURLPOSIXPathStyle);
          CFRelease(v10);
        }
        else
        {
          v16 = airdrop_log(0);
          v17 = objc_claimAutoreleasedReturnValue(v16);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            sub_100136E30();

          v11 = 0;
        }
        CFRelease(v8);
      }
      else
      {
        v14 = airdrop_log(0);
        v15 = objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          sub_100136E04();

        v11 = 0;
      }
      CFRelease(v6);
    }
    else
    {
      v11 = 0;
    }
    CFRelease(v3);
  }
  else
  {
    v12 = airdrop_log(0);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_100136DD8();

    v11 = 0;
  }
  return v11;
}

- (void)zip
{
  NSString *v3;
  NSString *bomPath;
  NSObject *zipQueue;
  _QWORD block[5];

  v3 = (NSString *)objc_claimAutoreleasedReturnValue(-[SDAirDropFileZipper temporaryBomPath](self, "temporaryBomPath"));
  bomPath = self->_bomPath;
  self->_bomPath = v3;

  if (!self->_destination)
    CFStreamCreateBoundPair(0, &self->_readStream, &self->_writeStream, self->_boundStreamSize);
  zipQueue = self->_zipQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100135B80;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async(zipQueue, block);
}

- (void)unzip
{
  NSURL *destination;
  id v4;
  NSURL *v5;
  id v6;
  NSURL *tempFolder;
  uint64_t v8;
  NSObject *zipQueue;
  uint64_t v10;
  NSObject *v11;
  _QWORD v12[5];
  id v13;

  destination = self->_destination;
  v13 = 0;
  v4 = sub_10019B6D4(destination, &v13);
  v5 = (NSURL *)objc_claimAutoreleasedReturnValue(v4);
  v6 = v13;
  tempFolder = self->_tempFolder;
  self->_tempFolder = v5;

  if (self->_tempFolder)
  {
    zipQueue = self->_zipQueue;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1001360EC;
    v12[3] = &unk_1007146D8;
    v12[4] = self;
    dispatch_async(zipQueue, v12);
  }
  else
  {
    v10 = airdrop_log(v8);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_100136EB4();

    -[SDAirDropFileZipper notifyClientForEvent:withProperty:](self, "notifyClientForEvent:withProperty:", 10, v6);
  }

}

- (void)stop
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100136404;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async(queue, block);
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  $115C4C562B26FF47E01F9F4EA65B5887 *result;

  objc_copyStruct(retstr, &self->_auditToken, 32, 1, 0);
  return result;
}

- (void)setAuditToken:(id *)a3
{
  objc_copyStruct(&self->_auditToken, a3, 32, 1, 0);
}

- (int)clientPid
{
  return self->_clientPid;
}

- (void)setClientPid:(int)a3
{
  self->_clientPid = a3;
}

- (NSArray)sourceFiles
{
  return (NSArray *)objc_getProperty(self, a2, 224, 1);
}

- (void)setSourceFiles:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 224);
}

- (NSString)senderName
{
  return (NSString *)objc_getProperty(self, a2, 232, 1);
}

- (void)setSenderName:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 232);
}

- (NSString)unzipCompressionType
{
  return (NSString *)objc_getProperty(self, a2, 240, 1);
}

- (void)setUnzipCompressionType:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 240);
}

- (NSString)zipCompressionType
{
  return (NSString *)objc_getProperty(self, a2, 248, 1);
}

- (NSSet)skipReadableCheckFiles
{
  return (NSSet *)objc_getProperty(self, a2, 256, 1);
}

- (void)setSkipReadableCheckFiles:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 256);
}

- (BOOL)disableAdaptiveCompressionForZipping
{
  return self->_disableAdaptiveCompressionForZipping;
}

- (void)setDisableAdaptiveCompressionForZipping:(BOOL)a3
{
  self->_disableAdaptiveCompressionForZipping = a3;
}

- (BOOL)shouldExtractMediaFromPhotosBundles
{
  return self->_shouldExtractMediaFromPhotosBundles;
}

- (void)setShouldExtractMediaFromPhotosBundles:(BOOL)a3
{
  self->_shouldExtractMediaFromPhotosBundles = a3;
}

- (SDAirDropFileZipperDelegate)delegate
{
  return (SDAirDropFileZipperDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_skipReadableCheckFiles, 0);
  objc_storeStrong((id *)&self->_zipCompressionType, 0);
  objc_storeStrong((id *)&self->_unzipCompressionType, 0);
  objc_storeStrong((id *)&self->_senderName, 0);
  objc_storeStrong((id *)&self->_sourceFiles, 0);
  objc_storeStrong((id *)&self->_zipQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_creationCompletionHandler, 0);
  objc_storeStrong((id *)&self->_compressionEngine, 0);
  objc_storeStrong((id *)&self->_alternateNames, 0);
  objc_storeStrong((id *)&self->_progressTimer, 0);
  objc_storeStrong((id *)&self->_relativePathToFile, 0);
  objc_storeStrong((id *)&self->_orderedRelativePaths, 0);
  objc_storeStrong((id *)&self->_placeholderFiles, 0);
  objc_storeStrong((id *)&self->_topLevelFiles, 0);
  objc_storeStrong((id *)&self->_monitor, 0);
  objc_storeStrong((id *)&self->_destination, 0);
  objc_storeStrong((id *)&self->_bomPath, 0);
  objc_storeStrong((id *)&self->_tempFolder, 0);
}

@end
