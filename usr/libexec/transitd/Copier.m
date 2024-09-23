@implementation Copier

+ (id)sharedInstance
{
  pthread_once(&stru_10000C630, (void (*)(void))sub_100003FD4);
  return (id)qword_10000C648;
}

+ (id)inboxPath
{
  return CFSTR("Inbox");
}

+ (id)copierWithSourceURL:(id)a3 uniqueIdentifier:(id)a4 destURL:(id)a5 sandboxExtension:(id)a6 callbackTarget:(id)a7 selector:(SEL)a8 options:(int)a9
{
  uint64_t v10;

  LODWORD(v10) = a9;
  return -[Copier initWithSourceURL:uniqueIdentifier:destURL:sandboxExtension:callbackTarget:selector:options:]([Copier alloc], "initWithSourceURL:uniqueIdentifier:destURL:sandboxExtension:callbackTarget:selector:options:", a3, a4, a5, a6, a7, a8, v10);
}

- (Copier)initWithSourceURL:(id)a3 uniqueIdentifier:(id)a4 destURL:(id)a5 sandboxExtension:(id)a6 callbackTarget:(id)a7 selector:(SEL)a8 options:(int)a9
{
  Copier *v15;
  NSString *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)Copier;
  v15 = -[Copier init](&v18, "init");
  v15->_sourceURL = (NSURL *)objc_msgSend(a3, "copy");
  v15->_destURL = (NSURL *)objc_msgSend(a5, "copy");
  if (a4)
    v16 = (NSString *)objc_msgSend(a4, "copy");
  else
    v16 = 0;
  v15->_uniqueID = v16;
  v15->_sandboxExtension = (NSString *)objc_msgSend(a6, "copy");
  v15->_callbackTarget = a7;
  v15->_callbackSelector = a8;
  v15->_options = a9;
  return v15;
}

- (void)dealloc
{
  objc_super v3;

  -[Copier invalidate](self, "invalidate");
  self->_continue = 0;

  self->_thread = 0;
  self->_sourceURL = 0;

  self->_destURL = 0;
  self->_uniqueID = 0;

  self->_sandboxExtension = 0;
  self->_callbackTarget = 0;
  v3.receiver = self;
  v3.super_class = (Class)Copier;
  -[Copier dealloc](&v3, "dealloc");
}

- (BOOL)validateSourceURLForCopying:(id)a3 error:(id *)a4
{
  const char *v6;
  int v7;
  uint64_t v8;
  NSDictionary *v9;
  NSErrorDomain v10;
  uint64_t v11;
  NSError *v12;
  BOOL result;
  int v14;
  stat v15;

  if ((objc_msgSend(a3, "isFileURL") & 1) == 0)
  {
    if (a4)
    {
      v9 = +[NSDictionary dictionaryWithObject:forKey:](NSDictionary, "dictionaryWithObject:forKey:", objc_msgSend(a3, "path"), NSFilePathErrorKey);
      v10 = NSPOSIXErrorDomain;
      v11 = 9;
      goto LABEL_11;
    }
    return 0;
  }
  v6 = (const char *)objc_msgSend(objc_msgSend(a3, "path", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                         0,
                         0),
                       "cStringUsingEncoding:",
                       4);
  if (lstat(v6, &v15))
    goto LABEL_7;
  v7 = v15.st_mode & 0xF000;
  if (v7 != 0x4000 && v7 != 0x8000 && v7 != 40960)
  {
    if (a4)
    {
      v9 = +[NSDictionary dictionaryWithObject:forKey:](NSDictionary, "dictionaryWithObject:forKey:", objc_msgSend(a3, "path"), NSFilePathErrorKey);
      v10 = NSPOSIXErrorDomain;
      v11 = 22;
      goto LABEL_11;
    }
    return 0;
  }
  if (stat(v6, &v15))
  {
LABEL_7:
    if (a4)
    {
      v8 = *__error();
      v9 = +[NSDictionary dictionaryWithObject:forKey:](NSDictionary, "dictionaryWithObject:forKey:", objc_msgSend(a3, "path"), NSFilePathErrorKey);
      v10 = NSPOSIXErrorDomain;
      v11 = v8;
LABEL_11:
      v12 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v10, v11, v9);
      result = 0;
      *a4 = v12;
      return result;
    }
    return 0;
  }
  v14 = v15.st_mode & 0xF000;
  result = 1;
  if (v14 != 0x4000 && v14 != 0x8000)
  {
    if (a4)
    {
      v9 = +[NSDictionary dictionaryWithObject:forKey:](NSDictionary, "dictionaryWithObject:forKey:", objc_msgSend(a3, "path"), NSFilePathErrorKey);
      v10 = NSPOSIXErrorDomain;
      v11 = 20;
      goto LABEL_11;
    }
    return 0;
  }
  return result;
}

- (BOOL)validateSourceURLForMoving:(id)a3 error:(id *)a4
{
  _BOOL4 v6;
  uint64_t v7;
  NSDictionary *v8;
  NSErrorDomain v9;
  uint64_t v10;
  NSError *v11;
  stat v13;

  v6 = -[Copier validateSourceURLForCopying:error:](self, "validateSourceURLForCopying:error:");
  if (v6)
  {
    if (lstat((const char *)objc_msgSend(objc_msgSend(a3, "path", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                             0,
                             0,
                             0),
                           "cStringUsingEncoding:",
                           4),
           &v13))
    {
      if (a4)
      {
        v7 = *__error();
        v8 = +[NSDictionary dictionaryWithObject:forKey:](NSDictionary, "dictionaryWithObject:forKey:", objc_msgSend(a3, "path"), NSFilePathErrorKey);
        v9 = NSPOSIXErrorDomain;
        v10 = v7;
LABEL_9:
        v11 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v9, v10, v8);
        LOBYTE(v6) = 0;
        *a4 = v11;
        return v6;
      }
      goto LABEL_10;
    }
    if (v13.st_nlink != 1)
    {
      if (a4)
      {
        v8 = +[NSDictionary dictionaryWithObject:forKey:](NSDictionary, "dictionaryWithObject:forKey:", objc_msgSend(a3, "path"), NSFilePathErrorKey);
        v9 = NSPOSIXErrorDomain;
        v10 = 31;
        goto LABEL_9;
      }
LABEL_10:
      LOBYTE(v6) = 0;
      return v6;
    }
    LOBYTE(v6) = 1;
  }
  return v6;
}

- (BOOL)createDirectory:(id)a3 error:(id *)a4
{
  NSFileManager *v6;
  id v7;
  BOOL v8;
  id v9;
  id v10;
  BOOL v11;
  char v13;

  v6 = +[NSFileManager defaultManager](NSFileManager, "defaultManager");
  v7 = objc_msgSend(a3, "path");
  v13 = 0;
  if (-[NSFileManager fileExistsAtPath:isDirectory:](v6, "fileExistsAtPath:isDirectory:", v7, &v13))
    v8 = v13 == 0;
  else
    v8 = 1;
  if (!v8)
    return 1;
  v11 = 1;
  if (!-[NSFileManager createDirectoryAtPath:withIntermediateDirectories:attributes:error:](v6, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v7, 1, +[NSDictionary dictionaryWithObject:forKey:](NSDictionary, "dictionaryWithObject:forKey:", +[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:", 509), NSFilePosixPermissions), a4))
  {
    if (a4)
    {
      v9 = *a4;
      if (*a4)
      {
        v10 = objc_msgSend(objc_msgSend(*a4, "userInfo"), "mutableCopy");
        if (!v10)
          v10 = objc_alloc_init((Class)NSMutableDictionary);
        if (!objc_msgSend(v10, "valueForKey:", NSFilePathErrorKey))
          objc_msgSend(v10, "setValue:forKey:", objc_msgSend(a3, "path"), NSFilePathErrorKey);
        *a4 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", objc_msgSend(v9, "domain"), objc_msgSend(v9, "code"), v10);

      }
    }
    return 0;
  }
  return v11;
}

- (BOOL)fileName:(id)a3 inDirectory:(id)a4 hasUniqueIdentifier:(id)a5
{
  const char *v6;
  _BYTE *v7;
  ssize_t v8;
  _BYTE *v9;
  NSString *v10;
  char v11;
  _BYTE *v12;
  ssize_t v13;
  stat v15;
  uint64_t value;
  _BYTE v17[256];

  v6 = (const char *)objc_msgSend(objc_msgSend(a4, "stringByAppendingPathComponent:", a3), "fileSystemRepresentation");
  value = 0;
  memset(&v15, 0, sizeof(v15));
  if (getxattr(v6, "com.apple.mdt.modTime", &value, 8uLL, 0, 1) != 8
    || lstat(v6, &v15)
    || value != v15.st_mtimespec.tv_nsec + 1000000000 * v15.st_mtimespec.tv_sec)
  {
    goto LABEL_16;
  }
  v7 = v17;
  v8 = getxattr(v6, "com.apple.mdt.uniqueDocumentIdentifier", v17, 0xFFuLL, 0, 1);
  if (v8 > 0)
  {
    v9 = 0;
    goto LABEL_6;
  }
  if ((v8 & 0x8000000000000000) == 0
    || *__error() != 34
    || (v13 = getxattr(v6, "com.apple.mdt.uniqueDocumentIdentifier", 0, 0, 0, 1), v13 < 1))
  {
LABEL_16:
    LOBYTE(v12) = 0;
    return (char)v12;
  }
  v12 = malloc_type_malloc(v13 + 1, 0xA55A7777uLL);
  if (!v12)
    return (char)v12;
  v9 = v12;
  v8 = getxattr(v6, "com.apple.mdt.uniqueDocumentIdentifier", v17, 0xFFuLL, 0, 1);
  if (v8 < 1)
  {
    v11 = 0;
    goto LABEL_9;
  }
  v7 = v9;
LABEL_6:
  v7[v8] = 0;
  v10 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v7, 4, *(_OWORD *)&v15.st_dev, *(_OWORD *)&v15.st_uid, *(_OWORD *)&v15.st_atimespec);
  if (!v10 || -[NSString compare:](v10, "compare:", a5))
  {
    v11 = 0;
    LOBYTE(v12) = 0;
    if (!v9)
      return (char)v12;
  }
  else
  {
    v11 = 1;
    LOBYTE(v12) = 1;
    if (!v9)
      return (char)v12;
  }
LABEL_9:
  free(v9);
  LOBYTE(v12) = v11;
  return (char)v12;
}

- (BOOL)setUniqueIdentifier:(id)a3 forPath:(id)a4
{
  __darwin_time_t v6;
  const char *v7;
  const char *v8;
  const char *v9;
  const char *v10;
  size_t v11;
  BOOL v12;
  uint64_t v14;
  timeval v15;
  __darwin_time_t v16;
  int v17;

  v6 = (mach_absolute_time() / 0x3B9ACA00);
  v7 = (const char *)objc_msgSend(a4, "fileSystemRepresentation", 1000000000 * v6);
  if (!v7)
    return 0;
  v8 = v7;
  if (!a3)
  {
    v12 = 1;
    removexattr(v7, "com.apple.mdt.uniqueDocumentIdentifier", 1);
    removexattr(v8, "com.apple.mdt.modTime", 1);
    return v12;
  }
  v9 = (const char *)objc_msgSend(a3, "cStringUsingEncoding:", 4);
  if (!v9)
    return 0;
  v10 = v9;
  v11 = strlen(v9);
  if (setxattr(v8, "com.apple.mdt.uniqueDocumentIdentifier", v10, v11, 0, 1))
    return 0;
  if (setxattr(v8, "com.apple.mdt.modTime", &v14, 8uLL, 0, 1))
    return 0;
  v15.tv_sec = v6;
  v16 = v6;
  v15.tv_usec = 0;
  v17 = 0;
  return !utimes(v8, &v15);
}

- (BOOL)isCandidateFileName:(id)a3 forSourceFileName:(id)a4
{
  unsigned __int8 *v6;
  unsigned __int8 *v7;
  unsigned __int8 *v8;
  unsigned __int8 *v9;
  unsigned __int8 *v10;
  int v11;
  int v12;
  uint64_t v13;
  int v14;
  int v15;

  if (!a3)
    sub_100006078();
  if (!a4)
    sub_1000060A0();
  if ((objc_msgSend(a3, "isEqual:", a4) & 1) != 0)
  {
LABEL_4:
    LOBYTE(v6) = 1;
    return (char)v6;
  }
  v6 = (unsigned __int8 *)objc_msgSend(a4, "stringByDeletingPathExtension");
  if (v6)
  {
    v7 = v6;
    LODWORD(v6) = objc_msgSend(a3, "hasPrefix:", v6);
    if ((_DWORD)v6)
    {
      v6 = (unsigned __int8 *)objc_msgSend(objc_msgSend(a4, "pathExtension"), "fileSystemRepresentation");
      if (v6)
      {
        v8 = v6;
        v6 = (unsigned __int8 *)objc_msgSend(a3, "substringFromIndex:", objc_msgSend(v7, "length"));
        if (v6)
        {
          v9 = v6;
          v6 = (unsigned __int8 *)objc_msgSend(v6, "length");
          if (v6)
          {
            v6 = (unsigned __int8 *)objc_msgSend(v9, "fileSystemRepresentation");
            if (v6)
            {
              if (*v6 == 45)
              {
                v10 = v6 + 1;
                do
                {
                  v12 = *v10++;
                  v11 = v12;
                }
                while ((v12 - 58) > 0xFFFFFFF5);
                if (v11 == 46)
                {
                  v13 = 0;
                  do
                  {
                    v14 = v10[v13];
                    if (!v10[v13])
                      goto LABEL_4;
                    v15 = v8[v13];
                    if (!v8[v13])
                      goto LABEL_4;
                    ++v13;
                  }
                  while (v14 == v15);
                }
              }
              LOBYTE(v6) = 0;
            }
          }
        }
      }
    }
  }
  return (char)v6;
}

- (id)identicalDocumentInDirectory:(id)a3 sourceURL:(id)a4 uniqueIdentifier:(id)a5
{
  id v8;
  id v9;
  id result;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  _BYTE v21[128];

  v8 = objc_msgSend(objc_msgSend(a4, "path"), "lastPathComponent");
  v9 = objc_msgSend(a3, "path");
  v20 = 0;
  result = -[NSFileManager contentsOfDirectoryAtPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "contentsOfDirectoryAtPath:error:", v9, &v20);
  if (result)
  {
    v11 = result;
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    result = objc_msgSend(result, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    if (result)
    {
      v12 = result;
      v13 = *(_QWORD *)v17;
      while (2)
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v17 != v13)
            objc_enumerationMutation(v11);
          v15 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v14);
          if (-[Copier isCandidateFileName:forSourceFileName:](self, "isCandidateFileName:forSourceFileName:", v15, v8)
            && -[Copier fileName:inDirectory:hasUniqueIdentifier:](self, "fileName:inDirectory:hasUniqueIdentifier:", v15, v9, a5))
          {
            return +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", objc_msgSend(v9, "stringByAppendingPathComponent:", v15));
          }
          v14 = (char *)v14 + 1;
        }
        while (v12 != v14);
        result = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
        v12 = result;
        if (result)
          continue;
        break;
      }
    }
  }
  return result;
}

- (id)uniquePathInDirectory:(id)a3 sourceURL:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  NSString *v11;
  uint64_t v13;
  stat v14;

  v5 = objc_msgSend(objc_msgSend(a4, "path"), "lastPathComponent");
  v6 = objc_msgSend(a3, "path");
  v7 = objc_msgSend(v6, "stringByAppendingPathComponent:", v5);
  memset(&v14, 0, sizeof(v14));
  if (lstat((const char *)objc_msgSend(v7, "cStringUsingEncoding:", 4), &v14))
  {
LABEL_9:
    if (*__error() == 2)
      return +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v7);
  }
  else
  {
    v8 = 1;
    while ((_DWORD)v8 != 0x10000)
    {
      v9 = objc_msgSend(v5, "pathExtension");
      if (v9 && (v10 = v9, objc_msgSend(v9, "length")))
        v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%u.%@"), objc_msgSend(v5, "stringByDeletingPathExtension"), v8, v10);
      else
        v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%u"), v5, v8, v13);
      v7 = objc_msgSend(v6, "stringByAppendingPathComponent:", v11);
      v8 = (v8 + 1);
      if (lstat((const char *)objc_msgSend(v7, "cStringUsingEncoding:", 4), &v14))
        goto LABEL_9;
    }
  }
  return 0;
}

- (id)createTemporaryDirectory:(id *)a3
{
  const __CFUUID *v5;
  CFStringRef v6;
  id v7;
  NSURL *v8;

  v5 = CFUUIDCreate(0);
  v6 = CFUUIDCreateString(0, v5);
  v7 = objc_msgSend(objc_msgSend(-[NSArray objectAtIndex:](NSSearchPathForDirectoriesInDomains(NSApplicationSupportDirectory, 1uLL, 1), "objectAtIndex:", 0), "stringByAppendingPathComponent:", CFSTR("com.apple.mdt")), "stringByAppendingPathComponent:", v6);
  CFRelease(v6);
  CFRelease(v5);
  v8 = +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v7);
  if (-[Copier createDirectory:error:](self, "createDirectory:error:", v8, a3))
    return v8;
  else
    return 0;
}

- (BOOL)destroyTemporaryDirectory:(id)a3 error:(id *)a4
{
  return -[NSFileManager removeItemAtPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "removeItemAtPath:error:", objc_msgSend(a3, "path"), a4);
}

- (void)_copyThread:(id)a3
{
  id v4;
  NSFileManager *v5;
  NSString *sandboxExtension;
  uint64_t v7;
  NSURL *destURL;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  const char *v14;
  const char *v15;
  const char *v16;
  _copyfile_state *v17;
  uint64_t v18;
  int *v19;
  NSString *v20;
  void *v21;
  uint64_t v22;
  char v23;
  NSError *v24;

  v24 = 0;
  v23 = 0;
  v4 = objc_alloc_init((Class)NSAutoreleasePool);
  v5 = +[NSFileManager defaultManager](NSFileManager, "defaultManager");
  sandboxExtension = self->_sandboxExtension;
  if (sandboxExtension)
  {
    v7 = sandbox_extension_consume(-[NSString UTF8String](sandboxExtension, "UTF8String"));
    if (v7 < 0)
      NSLog(CFSTR("could not consume extension token!"));
  }
  else
  {
    v7 = -1;
  }
  if (!-[Copier validateSourceURLForCopying:error:](self, "validateSourceURLForCopying:error:", self->_sourceURL, &v24))
    goto LABEL_22;
  if (!self->_uniqueID
    || (destURL = -[Copier identicalDocumentInDirectory:sourceURL:uniqueIdentifier:](self, "identicalDocumentInDirectory:sourceURL:uniqueIdentifier:", self->_destURL, self->_sourceURL)) == 0)
  {
    if (-[NSFileManager fileExistsAtPath:isDirectory:](v5, "fileExistsAtPath:isDirectory:", -[NSURL path](self->_destURL, "path"), &v23))
    {
      if (!v23)
      {
        destURL = 0;
        v24 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 17, +[NSDictionary dictionaryWithObject:forKey:](NSDictionary, "dictionaryWithObject:forKey:", -[NSURL path](self->_destURL, "path"), NSFilePathErrorKey));
        goto LABEL_23;
      }
      goto LABEL_13;
    }
    destURL = self->_destURL;
    if ((self->_options & 1) == 0)
      goto LABEL_14;
    if (-[Copier createDirectory:error:](self, "createDirectory:error:", self->_destURL, &v24))
    {
LABEL_13:
      destURL = -[Copier uniquePathInDirectory:sourceURL:](self, "uniquePathInDirectory:sourceURL:", self->_destURL, self->_sourceURL);
LABEL_14:
      v9 = -[Copier createTemporaryDirectory:](self, "createTemporaryDirectory:", &v24);
      if (!v9)
        goto LABEL_23;
      v10 = v9;
      v11 = -[NSDictionary objectForKey:](-[NSFileManager attributesOfItemAtPath:error:](v5, "attributesOfItemAtPath:error:", -[NSURL path](self->_destURL, "path"), 0), "objectForKey:", NSFileProtectionKey);
      if (v11)
      {
        v22 = 0;
        if (!-[NSFileManager setAttributes:ofItemAtPath:error:](v5, "setAttributes:ofItemAtPath:error:", +[NSDictionary dictionaryWithObject:forKey:](NSDictionary, "dictionaryWithObject:forKey:", v11, NSFileProtectionKey), objc_msgSend(v10, "path"), &v22))
        {
          v12 = objc_msgSend(v10, "path");
          NSLog(CFSTR(" Setting NSFileProtection: %@ on the path: %@ failed with error: %@"), v11, v12, v22);
        }
      }
      v21 = v10;
      v13 = objc_msgSend(-[Copier uniquePathInDirectory:sourceURL:](self, "uniquePathInDirectory:sourceURL:", v10, self->_sourceURL), "path");
      v14 = -[NSString cStringUsingEncoding:](-[NSURL path](self->_sourceURL, "path"), "cStringUsingEncoding:", 4);
      v15 = (const char *)objc_msgSend(v13, "cStringUsingEncoding:", 4);
      if ((self->_options & 2) != 0)
      {
        if (!-[NSFileManager moveItemAtPath:toPath:error:](v5, "moveItemAtPath:toPath:error:", -[NSURL path](self->_sourceURL, "path"), v13, &v24))
        {
          v20 = -[NSURL path](self->_sourceURL, "path");
          NSLog(CFSTR("Move from SRC(%@ -> %@) to temp failed with error %@"), v20, v13, v24);
          destURL = 0;
          v18 = 5;
          goto LABEL_35;
        }
        if (!v11)
          goto LABEL_31;
        v22 = 0;
        if (-[NSFileManager setAttributes:ofItemAtPath:error:](v5, "setAttributes:ofItemAtPath:error:", +[NSDictionary dictionaryWithObject:forKey:](NSDictionary, "dictionaryWithObject:forKey:", v11, NSFileProtectionKey), v13, &v22))
        {
          v18 = 0;
        }
        else
        {
          NSLog(CFSTR(" Setting NSFileProtection: %@ on the path: %@ failed with error: %@"), v11, v13, v22);
          -[NSFileManager moveItemAtPath:toPath:error:](v5, "moveItemAtPath:toPath:error:", v13, -[NSURL path](self->_sourceURL, "path"), &v24);
          v18 = 1;
        }
      }
      else
      {
        v16 = v15;
        v17 = copyfile_state_alloc();
        copyfile_state_set(v17, 6u, sub_100003EF8);
        copyfile_state_set(v17, 7u, self);
        v18 = copyfile(v14, v16, v17, 0xC800Fu);
        copyfile_state_free(v17);
      }
      if (!(_DWORD)v18)
      {
LABEL_31:
        -[Copier setUniqueIdentifier:forPath:](self, "setUniqueIdentifier:forPath:", self->_uniqueID, v13);
        v18 = 0;
        if (!-[NSFileManager moveItemAtPath:toPath:error:](v5, "moveItemAtPath:toPath:error:", v13, -[NSURL path](destURL, "path"), &v24))destURL = 0;
      }
LABEL_35:
      NSLog(CFSTR("Operation completed with result=%d"), v18);
      -[Copier destroyTemporaryDirectory:error:](self, "destroyTemporaryDirectory:error:", v21, 0);
      goto LABEL_23;
    }
LABEL_22:
    destURL = 0;
  }
LABEL_23:
  objc_msgSend(self->_callbackTarget, "performSelector:withObject:withObject:", self->_callbackSelector, destURL, v24);
  if ((v7 & 0x8000000000000000) == 0 && (sandbox_extension_release(v7) & 0x80000000) != 0)
  {
    v19 = __error();
    NSLog(CFSTR("Could not release sandbox extension: %d"), *v19);
  }
  objc_msgSend(v4, "drain");
}

- (BOOL)startCopy
{
  NSThread *v3;

  self->_continue = 1;
  v3 = (NSThread *)objc_msgSend(objc_alloc((Class)NSThread), "initWithTarget:selector:object:", self, "_copyThread:", 0);
  self->_thread = v3;
  -[NSThread start](v3, "start");
  return self->_thread != 0;
}

- (void)cancelCopy
{
  self->_continue = 0;
}

- (void)invalidate
{
  id callbackTarget;

  callbackTarget = self->_callbackTarget;
  self->_callbackTarget = 0;

  -[NSThread cancel](self->_thread, "cancel");
}

@end
