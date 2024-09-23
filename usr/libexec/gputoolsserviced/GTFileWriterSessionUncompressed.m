@implementation GTFileWriterSessionUncompressed

+ (id)sessionWithFileEntries:(id)a3 relativeToURL:(id)a4 options:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  id v13;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = objc_msgSend(objc_alloc((Class)a1), "initWithFileEntries:relativeToURL:options:error:", v12, v11, v10, a6);

  return v13;
}

- (GTFileWriterSessionUncompressed)initWithFileEntries:(id)a3 relativeToURL:(id)a4 options:(id)a5 error:(id *)a6
{
  id v11;
  id v12;
  id v13;
  GTFileWriterSessionUncompressed *v14;
  GTFileWriterSessionUncompressed *v15;
  os_log_t v16;
  OS_os_log *log;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  unsigned int v34;
  int v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  unsigned __int8 v40;
  id v41;
  unsigned int v42;
  int v43;
  int v44;
  uint64_t v45;
  const __CFString *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  GTFileWriterSessionUncompressed *v52;
  GTFileWriterSessionUncompressed *v54;
  id v55;
  id v56;
  id *v57;
  id v58;
  void *v59;
  id obj;
  uint64_t v61;
  objc_super v62;
  id v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _BYTE v68[128];
  NSErrorUserInfoKey v69;
  const __CFString *v70;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v62.receiver = self;
  v62.super_class = (Class)GTFileWriterSessionUncompressed;
  v14 = -[GTFileWriterSessionUncompressed init](&v62, "init");
  v15 = v14;
  if (!v14)
    goto LABEL_33;
  v57 = a6;
  v58 = v13;
  objc_storeStrong((id *)&v14->_fileEntries, a3);
  objc_storeStrong((id *)&v15->_baseURL, a4);
  v15->_currentFileIndex = 0;
  v15->_currentFileBytesWritten = 0;
  v15->_fd = -1;
  v16 = os_log_create("com.apple.gputools.transport", "FileWriterSession");
  log = v15->_log;
  v15->_log = (OS_os_log *)v16;

  v18 = v11;
  v19 = v12;
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  obj = v18;
  v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v68, 16);
  v59 = v19;
  if (!v20)
  {
    v22 = 0;
    v35 = 1;
    goto LABEL_30;
  }
  v21 = v20;
  v54 = v15;
  v55 = v12;
  v56 = v11;
  v22 = 0;
  v61 = *(_QWORD *)v65;
  do
  {
    v23 = 0;
    v24 = v22;
    do
    {
      if (*(_QWORD *)v65 != v61)
        objc_enumerationMutation(obj);
      v25 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * (_QWORD)v23);
      v26 = objc_autoreleasePoolPush();
      v63 = v24;
      v27 = v25;
      v28 = v19;
      v29 = objc_alloc((Class)NSURL);
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "path"));
      v31 = objc_msgSend(v29, "initFileURLWithPath:isDirectory:relativeToURL:", v30, 0, v28);

      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "URLByDeletingLastPathComponent"));
      v34 = objc_msgSend(v32, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v33, 1, 0, &v63);

      v35 = 0;
      if (v34)
      {
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "destination"));

        if (v36)
        {
          v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
          v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "path"));
          v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "destination"));
          v40 = objc_msgSend(v37, "createSymbolicLinkAtPath:withDestinationPath:error:", v38, v39, &v63);

          if ((v40 & 1) != 0)
            goto LABEL_10;
LABEL_22:
          v35 = 0;
LABEL_23:
          v19 = v59;
          goto LABEL_24;
        }
        v41 = objc_alloc_init((Class)NSData);
        v42 = objc_msgSend(v41, "writeToURL:options:error:", v31, 0, &v63);

        if (!v42)
          goto LABEL_19;
        v43 = open((const char *)objc_msgSend(objc_retainAutorelease(v31), "fileSystemRepresentation"), 1, 0);
        if (v43 < 0)
        {
          v47 = *__error();
          v69 = NSLocalizedDescriptionKey;
          v70 = CFSTR("Failed to open file for writing");
          v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v70, &v69, 1));
          v63 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, v47, v48));

          v19 = v59;
LABEL_19:
          v35 = 0;
          goto LABEL_24;
        }
        v44 = v43;
        if (ftruncate(v43, (off_t)objc_msgSend(v27, "fileSize")) < 0)
        {
          v49 = *__error();
          v69 = NSLocalizedDescriptionKey;
          v70 = CFSTR("Failed to resize file");
          v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v70, &v69, 1));
          v63 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, v49, v50));

          v19 = v59;
          close(v44);
          goto LABEL_19;
        }
        if (fsync(v44) < 0)
        {
          v45 = *__error();
          v69 = NSLocalizedDescriptionKey;
          v46 = CFSTR("Failed to flush file");
        }
        else
        {
          if ((close(v44) & 0x80000000) == 0)
          {
LABEL_10:
            v35 = 1;
            goto LABEL_23;
          }
          v45 = *__error();
          v69 = NSLocalizedDescriptionKey;
          v46 = CFSTR("Failed to close file");
        }
        v70 = v46;
        v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v70, &v69, 1));
        v63 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, v45, v51));

        goto LABEL_22;
      }
LABEL_24:

      v22 = v63;
      objc_autoreleasePoolPop(v26);
      if (!v35)
        goto LABEL_28;
      v23 = (char *)v23 + 1;
      v24 = v22;
    }
    while (v21 != v23);
    v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v68, 16);
  }
  while (v21);
  v35 = 1;
LABEL_28:
  v12 = v55;
  v11 = v56;
  v15 = v54;
LABEL_30:

  v13 = v58;
  if (v57)
    *v57 = objc_retainAutorelease(v22);

  if (v35)
LABEL_33:
    v52 = v15;
  else
    v52 = 0;

  return v52;
}

- (int)_openNextFile:(id *)a3
{
  unint64_t currentFileIndex;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  int v11;
  int v12;
  uint64_t v13;
  void *v14;
  NSErrorUserInfoKey v16;
  const __CFString *v17;
  NSErrorUserInfoKey v18;
  const __CFString *v19;

  currentFileIndex = self->_currentFileIndex;
  if (currentFileIndex >= -[NSArray count](self->_fileEntries, "count"))
  {
    if (!a3)
      return -1;
    v18 = NSLocalizedDescriptionKey;
    v19 = CFSTR("No more files to write to");
    v10 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1));
    *a3 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 2, v10));
    goto LABEL_8;
  }
  v6 = objc_alloc((Class)NSURL);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_fileEntries, "objectAtIndexedSubscript:", self->_currentFileIndex));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "path"));
  v9 = objc_msgSend(v6, "initFileURLWithPath:isDirectory:relativeToURL:", v8, 0, self->_baseURL);

  v10 = objc_retainAutorelease(v9);
  v11 = open((const char *)objc_msgSend(v10, "fileSystemRepresentation"), 1, 0);
  if (v11 < 0)
  {
    if (a3)
    {
      v13 = *__error();
      v16 = NSLocalizedDescriptionKey;
      v17 = CFSTR("Failed to open file for writing");
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1));
      *a3 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, v13, v14));

    }
LABEL_8:
    v12 = -1;
    goto LABEL_9;
  }
  v12 = v11;
LABEL_9:

  return v12;
}

- (void)writeFileData:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, id);
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;

  v6 = objc_retainAutorelease(a3);
  v7 = (void (**)(id, id))a4;
  v8 = v6;
  v9 = objc_msgSend(v8, "bytes");
  v10 = objc_msgSend(v8, "length");

  v12 = 0;
  -[GTFileWriterSessionUncompressed _writeUncompressedFileData:length:error:](self, "_writeUncompressedFileData:length:error:", v9, v10, &v12);
  v11 = v12;
  v7[2](v7, v11);

}

- (BOOL)_writeUncompressedFileData:(const char *)a3 length:(unint64_t)a4 error:(id *)a5
{
  unint64_t v9;
  unsigned int v10;
  int v11;
  unint64_t v12;
  void *v13;
  char *v14;
  uint64_t v15;
  ssize_t v16;
  unint64_t currentFileIndex;
  unint64_t v18;
  void *v19;
  id v20;
  _BOOL4 v21;
  uint64_t v22;
  void *v23;
  NSErrorUserInfoKey v25;
  const __CFString *v26;

  if (a4)
  {
    v9 = 0;
    while (1)
    {
      v10 = -[GTFileWriterSessionUncompressed _getCurrentFileDescriptor:](self, "_getCurrentFileDescriptor:", a5);
      if ((v10 & 0x80000000) != 0)
        break;
      v11 = v10;
      v12 = a4 - v9;
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_fileEntries, "objectAtIndexedSubscript:", self->_currentFileIndex));
      v14 = (char *)objc_msgSend(v13, "fileSize") - self->_currentFileBytesWritten;

      v15 = 0;
      if (a4 - v9 >= (unint64_t)v14)
        v12 = (unint64_t)v14;
      do
      {
        v16 = write(v11, &a3[v9 + v15], v12 - v15);
        if (v16 < 0)
          goto LABEL_14;
        v15 += v16;
      }
      while (v15 != v12);
      if ((v12 & 0x8000000000000000) != 0)
      {
LABEL_14:
        if (a5)
        {
          v22 = *__error();
          v25 = NSLocalizedDescriptionKey;
          v26 = CFSTR("Failed to write to file");
          v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1));
          *a5 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, v22, v23));

        }
        break;
      }
      currentFileIndex = self->_currentFileIndex;
      v18 = self->_currentFileBytesWritten + v12;
      self->_currentFileBytesWritten = v18;
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_fileEntries, "objectAtIndexedSubscript:", currentFileIndex));
      v20 = objc_msgSend(v19, "fileSize");

      if ((id)v18 == v20)
      {
        v21 = -[GTFileWriterSessionUncompressed _closeCurrentFileDescriptor:](self, "_closeCurrentFileDescriptor:", a5);
        if (!v21)
          return v21;
        ++self->_currentFileIndex;
        self->_currentFileBytesWritten = 0;
      }
      v9 += v12;
      if (v9 >= a4)
        goto LABEL_13;
    }
    LOBYTE(v21) = 0;
  }
  else
  {
LABEL_13:
    LOBYTE(v21) = 1;
  }
  return v21;
}

- (int)_getCurrentFileDescriptor:(id *)a3
{
  int result;

  result = self->_fd;
  if (result < 0)
  {
    result = -[GTFileWriterSessionUncompressed _openNextFile:](self, "_openNextFile:", a3);
    self->_fd = result;
  }
  return result;
}

- (BOOL)finish:(id *)a3
{
  NSURL *baseURL;
  NSArray *fileEntries;

  baseURL = self->_baseURL;
  self->_baseURL = 0;

  fileEntries = self->_fileEntries;
  self->_fileEntries = 0;

  self->_currentFileIndex = 0;
  self->_currentFileBytesWritten = 0;
  return -[GTFileWriterSessionUncompressed _closeCurrentFileDescriptor:](self, "_closeCurrentFileDescriptor:", a3);
}

- (BOOL)_closeCurrentFileDescriptor:(id *)a3
{
  int fd;
  NSErrorDomain v6;
  uint64_t v7;
  const __CFString **v8;
  NSErrorUserInfoKey *v9;
  void *v10;
  NSErrorUserInfoKey v11;
  const __CFString *v12;
  NSErrorUserInfoKey v13;
  const __CFString *v14;

  fd = self->_fd;
  if (fd < 0)
    return 1;
  self->_fd = -1;
  if (fsync(fd) < 0)
  {
    if (a3)
    {
      v6 = NSPOSIXErrorDomain;
      v7 = *__error();
      v13 = NSLocalizedDescriptionKey;
      v14 = CFSTR("Failed to flush file");
      v8 = &v14;
      v9 = &v13;
LABEL_9:
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v8, v9, 1));
      *a3 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v6, v7, v10));

    }
  }
  else
  {
    if ((close(fd) & 0x80000000) == 0)
      return 1;
    if (a3)
    {
      v6 = NSPOSIXErrorDomain;
      v7 = *__error();
      v11 = NSLocalizedDescriptionKey;
      v12 = CFSTR("Failed to close file");
      v8 = &v12;
      v9 = &v11;
      goto LABEL_9;
    }
  }
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_fileEntries, 0);
}

@end
