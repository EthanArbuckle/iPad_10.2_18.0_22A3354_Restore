@implementation MBFile

+ (id)fileWithDomain:(id)a3 snapshotPath:(id)a4 relativePath:(id)a5
{
  return -[MBFile initWithDomain:snapshotPath:relativePath:]([MBFile alloc], "initWithDomain:snapshotPath:relativePath:", a3, a4, a5);
}

+ (id)fileWithDomain:(id)a3 relativePath:(id)a4
{
  return -[MBFile initWithDomain:snapshotPath:relativePath:]([MBFile alloc], "initWithDomain:snapshotPath:relativePath:", a3, 0, a4);
}

+ (id)fileWithDecoder:(id)a3 database:(id)a4
{
  return -[MBFile initWithDecoder:database:]([MBFile alloc], "initWithDecoder:database:", a3, a4);
}

- (MBFile)initWithDecoder:(id)a3
{
  -[MBFile doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (MBFile)initWithDecoder:(id)a3 database:(id)a4
{
  MBFile *v6;
  id v7;
  id v8;
  MBDomain *v9;
  int v10;
  NSMutableDictionary *v11;
  id v12;
  id v13;
  id v14;
  id v16;
  const __CFString *v17;
  id v18;
  uint64_t v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)MBFile;
  v6 = -[MBFile init](&v20, "init");
  if (!v6)
    return v6;
  v7 = objc_msgSend(a3, "decodeString");
  if (!v7)
  {
    v16 = objc_alloc((Class)MBException);
    v17 = CFSTR("Domain name missing from file record");
LABEL_20:
    v18 = objc_msgSend(v16, "initWithCode:format:", 11, v17, v19);
    goto LABEL_21;
  }
  v8 = v7;
  v6->_nonRedirectedDomain = (MBDomain *)objc_msgSend(a3, "decodeString");
  if ((MBIsValidRelativePath() & 1) == 0)
  {
    v16 = objc_alloc((Class)MBException);
    v17 = CFSTR("Invalid relative path in file record");
    goto LABEL_20;
  }
  v9 = (MBDomain *)objc_msgSend(objc_msgSend(a4, "domainManager"), "domainForName:", v8);
  v6->_domain = v9;
  if (!v9)
  {
    v18 = objc_msgSend(objc_alloc((Class)MBException), "initWithCode:format:", 11, CFSTR("Unknown domain name in file record: \"%@\"), v8);
LABEL_21:
    objc_exception_throw(v18);
  }
  v6->_snapshotID = (unint64_t)objc_msgSend(objc_msgSend(a4, "domainManager"), "redirectDomain:forRelativePath:", v6->_domain, v6->_nonRedirectedDomain);
  v6->_priority = (unint64_t)objc_msgSend(a3, "decodeString");
  v6->_target = (NSString *)objc_msgSend(a3, "decodeData");
  v6->_digest = (NSData *)objc_msgSend(a3, "decodeData");
  v6->_mbNode.mode = (unsigned __int16)objc_msgSend(a3, "decodeInt16");
  if (!-[MBFile isRegularFile](v6, "isRegularFile")
    && !-[MBFile isDirectory](v6, "isDirectory")
    && !-[MBFile isSymbolicLink](v6, "isSymbolicLink"))
  {
    v16 = objc_alloc((Class)MBException);
    v17 = CFSTR("File type missing from file record mode");
    goto LABEL_20;
  }
  if (-[MBFile isSymbolicLink](v6, "isSymbolicLink") && !v6->_priority)
  {
    v16 = objc_alloc((Class)MBException);
    v17 = CFSTR("Target required for symbolic links");
    goto LABEL_20;
  }
  v6->_mbNode.inode = (unint64_t)objc_msgSend(a3, "decodeInt64");
  v6->_mbNode.userID = objc_msgSend(a3, "decodeInt32");
  v6->_mbNode.groupID = objc_msgSend(a3, "decodeInt32");
  v6->_mbNode.modified = (int)objc_msgSend(a3, "decodeInt32");
  v6->_mbNode.statusChanged = (int)objc_msgSend(a3, "decodeInt32");
  v6->_mbNode.birth = (int)objc_msgSend(a3, "decodeInt32");
  v6->_mbNode.fileSize = (int64_t)objc_msgSend(a3, "decodeInt64");
  if (!-[MBFile isRegularFile](v6, "isRegularFile") && v6->_mbNode.fileSize)
  {
    v16 = objc_alloc((Class)MBException);
    v17 = CFSTR("Non-zero size for a file record which is not a regular file");
    goto LABEL_20;
  }
  BYTE4(v6->_mbNode.cloneID) = objc_msgSend(a3, "decodeInt8");
  v10 = objc_msgSend(a3, "decodeInt8");
  v11 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", v10);
  if (v10 >= 1)
  {
    while (1)
    {
      v12 = objc_msgSend(a3, "decodeString");
      if (!v12)
      {
        v16 = objc_alloc((Class)MBException);
        v17 = CFSTR("Null key for a file record extended attribute");
        goto LABEL_20;
      }
      v13 = v12;
      v14 = objc_msgSend(a3, "decodeData");
      if (!v14)
        break;
      -[NSMutableDictionary setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v14, v13);
      if (!--v10)
        goto LABEL_16;
    }
    v16 = objc_alloc((Class)MBException);
    v17 = CFSTR("Null value for a file record extended attribute");
    goto LABEL_20;
  }
LABEL_16:
  v6->_decryptedSize = (unint64_t)v11;
  return v6;
}

- (MBFile)initWithDomain:(id)a3 snapshotPath:(id)a4 relativePath:(id)a5
{
  MBFile *v9;
  objc_super v11;

  if (a4 && !objc_msgSend(a3, "volumeMountPoint"))
    sub_100088620();
  if (a3)
  {
    if (a5)
      goto LABEL_5;
  }
  else
  {
    +[NSException raise:format:](NSException, "raise:format:", NSInvalidArgumentException, CFSTR("Null domain"));
    if (a5)
      goto LABEL_5;
  }
  +[NSException raise:format:](NSException, "raise:format:", NSInvalidArgumentException, CFSTR("Null relative path"));
LABEL_5:
  v11.receiver = self;
  v11.super_class = (Class)MBFile;
  v9 = -[MBFile init](&v11, "init");
  if (v9)
  {
    v9->_snapshotID = (unint64_t)a3;
    v9->_nonRedirectedDomain = (MBDomain *)a5;
    v9->_decryptedSize = (unint64_t)&__NSDictionary0__struct;
    v9->_relativePath = (NSString *)a4;
  }
  return v9;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = *(void **)&self->_hasOverriddenModifiedDate;
  if (v3)
    free(v3);

  v4.receiver = self;
  v4.super_class = (Class)MBFile;
  -[MBFile dealloc](&v4, "dealloc");
}

- (NSString)description
{
  NSString *v3;

  if (objc_msgSend((id)self->_snapshotID, "hasRootPath"))
    v3 = -[MBFile absolutePath](self, "absolutePath");
  else
    v3 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@:%@"), objc_msgSend((id)self->_snapshotID, "name"), self->_nonRedirectedDomain);
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p; %@>"),
           objc_opt_class(self),
           self,
           v3);
}

- (NSString)debugDescription
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSString *v10;
  NSData *v11;
  NSData *v12;
  NSString *v13;
  NSString *v14;
  id v15;
  MBFileID *v16;
  uint64_t v17;

  v17 = objc_opt_class(self);
  v16 = -[MBFile fileID](self, "fileID");
  v15 = -[MBDomain name](-[MBFile domain](self, "domain"), "name");
  v14 = -[MBFile relativePath](self, "relativePath");
  v13 = -[MBFile target](self, "target");
  v12 = -[MBFile digest](self, "digest");
  v11 = -[MBFile encryptionKey](self, "encryptionKey");
  v10 = -[MBFile modeString](self, "modeString");
  v3 = -[MBFile inodeNumber](self, "inodeNumber");
  v4 = -[MBFile userID](self, "userID");
  v5 = -[MBFile groupID](self, "groupID");
  v6 = MBStringWithDate(-[MBFile lastModifiedDate](self, "lastModifiedDate"));
  v7 = MBStringWithDate(-[MBFile lastStatusChangeDate](self, "lastStatusChangeDate"));
  v8 = MBStringWithDate(-[MBFile birthDate](self, "birthDate"));
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: fileID=%@, domain=%@, relativePath=%@, target=%@, digest=%@, encryptionKey=%@, mode=%@, inodeNumber=%llu, userID=%u, groupID=%u, lastModified=%@, lastStatusChange=%@, birth=%@, size=%llu, protectionClass=%d, priority=%lld extendedAttributes=%@>"), v17, v16, v15, v14, v13, v12, v11, v10, v3, v4, v5, v6, v7, v8, -[MBFile size](self, "size"), -[MBFile protectionClass](self, "protectionClass"),
           -[MBFile priority](self, "priority"),
           MBStringWithDictionary(-[MBFile extendedAttributes](self, "extendedAttributes")));
}

- (MBFileID)fileID
{
  MBFileID *result;

  result = *(MBFileID **)&self->_mbNode.protectionClass;
  if (!result)
  {
    result = -[MBFileID initWithDomain:relativePath:]([MBFileID alloc], "initWithDomain:relativePath:", self->_snapshotID, self->_nonRedirectedDomain);
    *(_QWORD *)&self->_mbNode.protectionClass = result;
  }
  return result;
}

- (NSString)absolutePath
{
  NSString *result;
  void *snapshotID;
  NSString *relativePath;
  char *v7;

  result = (NSString *)self->_absolutePathFSR;
  if (!result)
  {
    snapshotID = (void *)self->_snapshotID;
    if (!snapshotID)
    {
      -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBFile.m"), 151, CFSTR("Null domain"));
      snapshotID = (void *)self->_snapshotID;
    }
    if (objc_msgSend(snapshotID, "isUninstalledAppDomain"))
      -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBFile.m"), 152, CFSTR("No absolute path for file record (uninstalled app): %@/%@"), objc_msgSend((id)self->_snapshotID, "name"), self->_nonRedirectedDomain);
    relativePath = self->_relativePath;
    v7 = (char *)objc_msgSend((id)self->_snapshotID, "rootPath");
    if (relativePath)
    {
      v7 = (char *)MBSnapshotPathFromLivePath(v7, self->_relativePath, objc_msgSend((id)self->_snapshotID, "volumeMountPoint"));
      self->_absolutePathFSR = v7;
    }
    result = (NSString *)objc_msgSend(v7, "stringByAppendingPathComponent:", self->_nonRedirectedDomain);
    self->_absolutePathFSR = (char *)result;
  }
  return result;
}

- (const)absolutePathFSR
{
  const __CFString *v4;
  const __CFString *v5;
  CFIndex MaximumSizeOfFileSystemRepresentation;
  char *v7;

  if (!*(_QWORD *)&self->_hasOverriddenModifiedDate)
  {
    v4 = -[MBFile absolutePath](self, "absolutePath");
    if (v4)
    {
      v5 = v4;
      MaximumSizeOfFileSystemRepresentation = CFStringGetMaximumSizeOfFileSystemRepresentation(v4);
      v7 = (char *)malloc_type_malloc(MaximumSizeOfFileSystemRepresentation, 0x7D6C621uLL);
      *(_QWORD *)&self->_hasOverriddenModifiedDate = v7;
      if (!CFStringGetFileSystemRepresentation(v5, v7, MaximumSizeOfFileSystemRepresentation))
        -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBFile.m"), 173, CFSTR("Getting absolute path file system representation failed"));
    }
  }
  return *(const char **)&self->_hasOverriddenModifiedDate;
}

- (NSString)livePath
{
  NSString *result;
  void *snapshotID;

  result = self->_absolutePath;
  if (!result)
  {
    snapshotID = (void *)self->_snapshotID;
    if (!snapshotID)
    {
      -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBFile.m"), 181, CFSTR("Null domain"));
      snapshotID = (void *)self->_snapshotID;
    }
    result = (NSString *)objc_msgSend(objc_msgSend(snapshotID, "rootPath"), "stringByAppendingPathComponent:", self->_nonRedirectedDomain);
    self->_absolutePath = result;
  }
  return result;
}

- (BOOL)isStatusChangedComparedToFile:(id)a3
{
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;

  if ((!-[MBFile isSymbolicLink](self, "isSymbolicLink")
     || -[NSString isEqualToString:](-[MBFile target](self, "target"), "isEqualToString:", objc_msgSend(a3, "target")))
    && (v5 = -[MBFile mode](self, "mode"), v5 == objc_msgSend(a3, "mode"))
    && (v6 = -[MBFile userID](self, "userID"), v6 == objc_msgSend(a3, "userID"))
    && (v7 = -[MBFile groupID](self, "groupID"), v7 == objc_msgSend(a3, "groupID"))
    && (v8 = -[MBFile protectionClass](self, "protectionClass"), v8 == objc_msgSend(a3, "protectionClass")))
  {
    return !-[NSDictionary isEqualToDictionary:](-[MBFile extendedAttributes](self, "extendedAttributes"), "isEqualToDictionary:", objc_msgSend(a3, "extendedAttributes"));
  }
  else
  {
    return 1;
  }
}

- (id)backupSymbolicLinkTarget
{
  id v4;
  void *v6;

  v6 = 0;
  if (!-[MBFile isSymbolicLink](self, "isSymbolicLink"))
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBFile.m"), 199, CFSTR("Not a symbolic link"));
  if (self->_priority)
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBFile.m"), 200, CFSTR("Symbolic link target already backed up"));
  v4 = +[MBFileOperation symbolicLinkTargetWithPathFSR:error:](MBFileOperation, "symbolicLinkTargetWithPathFSR:error:", -[MBFile absolutePathFSR](self, "absolutePathFSR"), &v6);
  self->_priority = (unint64_t)v4;
  if (v4)
    return 0;
  else
    return v6;
}

- (const)keybagUUID
{
  if (self->_encryptionKey >= (NSData *)2 && -[NSData length](self->_digest, "length") >= 0x10)
    return (const char *)-[NSData bytes](self->_digest, "bytes");
  else
    return 0;
}

- (void)encode:(id)a3
{
  void *decryptedSize;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  uint64_t v11;
  id v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  objc_msgSend(a3, "encodeString:", objc_msgSend((id)self->_snapshotID, "name"));
  objc_msgSend(a3, "encodeString:", self->_nonRedirectedDomain);
  objc_msgSend(a3, "encodeString:", self->_priority);
  objc_msgSend(a3, "encodeData:", self->_target);
  objc_msgSend(a3, "encodeData:", self->_digest);
  objc_msgSend(a3, "encodeInt16:", (__int16)self->_mbNode.mode);
  objc_msgSend(a3, "encodeInt64:", self->_mbNode.inode);
  objc_msgSend(a3, "encodeInt32:", self->_mbNode.userID);
  objc_msgSend(a3, "encodeInt32:", self->_mbNode.groupID);
  objc_msgSend(a3, "encodeInt32:", LODWORD(self->_mbNode.modified));
  objc_msgSend(a3, "encodeInt32:", LODWORD(self->_mbNode.statusChanged));
  objc_msgSend(a3, "encodeInt32:", LODWORD(self->_mbNode.birth));
  objc_msgSend(a3, "encodeInt64:", self->_mbNode.fileSize);
  objc_msgSend(a3, "encodeInt8:", SBYTE4(self->_mbNode.cloneID));
  if ((unint64_t)objc_msgSend((id)self->_decryptedSize, "count") >= 0x100)
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBFile.m"), 236, CFSTR("Too many extended attributes"));
  objc_msgSend(a3, "encodeInt8:", (char)objc_msgSend((id)self->_decryptedSize, "count"));
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  decryptedSize = (void *)self->_decryptedSize;
  v7 = objc_msgSend(decryptedSize, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(decryptedSize);
        v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        v12 = objc_msgSend((id)self->_decryptedSize, "objectForKeyedSubscript:", v11);
        objc_msgSend(a3, "encodeString:", v11);
        objc_msgSend(a3, "encodeData:", v12);
      }
      v8 = objc_msgSend(decryptedSize, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }
  objc_msgSend(a3, "encodeInt32:", sub_10007EEB0((uint64_t)&self->_mbNode));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v5;
  unint64_t priority;
  NSString *target;
  NSData *digest;
  $9837B257C983028F49B01CB2451A2DEB *p_mbNode;
  NSData *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint8_t buf[4];
  uint64_t v15;

  v5 = objc_autoreleasePoolPush();
  objc_msgSend(a3, "encodeObject:forKey:", self->_nonRedirectedDomain, CFSTR("RelativePath"));
  priority = self->_priority;
  if (priority)
    objc_msgSend(a3, "encodeObject:forKey:", priority, CFSTR("Target"));
  target = self->_target;
  if (target)
    objc_msgSend(a3, "encodeObject:forKey:", target, CFSTR("Digest"));
  digest = self->_digest;
  if (digest)
    objc_msgSend(a3, "encodeObject:forKey:", digest, CFSTR("EncryptionKey"));
  p_mbNode = &self->_mbNode;
  objc_msgSend(a3, "encodeInt32:forKey:", self->_mbNode.mode, CFSTR("Mode"));
  objc_msgSend(a3, "encodeInt64:forKey:", self->_mbNode.inode, CFSTR("InodeNumber"));
  objc_msgSend(a3, "encodeInt32:forKey:", self->_mbNode.userID, CFSTR("UserID"));
  objc_msgSend(a3, "encodeInt32:forKey:", self->_mbNode.groupID, CFSTR("GroupID"));
  objc_msgSend(a3, "encodeInt32:forKey:", LODWORD(self->_mbNode.modified), CFSTR("LastModified"));
  objc_msgSend(a3, "encodeInt32:forKey:", LODWORD(self->_mbNode.statusChanged), CFSTR("LastStatusChange"));
  objc_msgSend(a3, "encodeInt32:forKey:", LODWORD(self->_mbNode.birth), CFSTR("Birth"));
  objc_msgSend(a3, "encodeInt64:forKey:", self->_mbNode.fileSize, CFSTR("Size"));
  objc_msgSend(a3, "encodeInt32:forKey:", BYTE4(self->_mbNode.cloneID), CFSTR("ProtectionClass"));
  if (objc_msgSend((id)self->_decryptedSize, "count"))
  {
    v13 = 0;
    v10 = +[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", self->_decryptedSize, 200, 0, &v13);
    if (v10 || !v13)
    {
      if (v10)
        objc_msgSend(a3, "encodeObject:forKey:", v10, CFSTR("ExtendedAttributes"));
    }
    else
    {
      v12 = MBGetDefaultLog(0, v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v15 = v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to serialize extended attributes: %@", buf, 0xCu);
        _MBLog(CFSTR("ERROR"), "Failed to serialize extended attributes: %@", v13);
      }
    }
  }
  objc_msgSend(a3, "encodeInt32:forKey:", sub_10007EEB0((uint64_t)p_mbNode), CFSTR("Flags"));
  objc_autoreleasePoolPop(v5);
}

- (MBFile)initWithCoder:(id)a3
{
  MBFile *v4;
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v10;
  objc_super v11;
  uint8_t buf[4];
  uint64_t v13;

  v11.receiver = self;
  v11.super_class = (Class)MBFile;
  v4 = -[MBFile init](&v11, "init");
  if (v4)
  {
    v4->_nonRedirectedDomain = (MBDomain *)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("RelativePath"));
    v4->_priority = (unint64_t)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("Target"));
    v4->_target = (NSString *)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(NSData), CFSTR("Digest"));
    v4->_digest = (NSData *)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(NSData), CFSTR("EncryptionKey"));
    v4->_mbNode.mode = (unsigned __int16)objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("Mode"));
    v4->_mbNode.inode = (unint64_t)objc_msgSend(a3, "decodeInt64ForKey:", CFSTR("InodeNumber"));
    v4->_mbNode.userID = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("UserID"));
    v4->_mbNode.groupID = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("GroupID"));
    v4->_mbNode.modified = (int)objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("LastModified"));
    v4->_mbNode.statusChanged = (int)objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("LastStatusChange"));
    v4->_mbNode.birth = (int)objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("Birth"));
    v4->_mbNode.fileSize = (int64_t)objc_msgSend(a3, "decodeInt64ForKey:", CFSTR("Size"));
    BYTE4(v4->_mbNode.cloneID) = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("ProtectionClass"));
    v5 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(NSData), CFSTR("ExtendedAttributes"));
    if (v5)
    {
      v10 = 0;
      v6 = +[NSPropertyListSerialization propertyListWithData:options:format:error:](NSPropertyListSerialization, "propertyListWithData:options:format:error:", v5, 0, 0, &v10);
      if (!v10 || v6)
      {
        if (v6)
          v4->_decryptedSize = (unint64_t)v6;
      }
      else
      {
        v8 = MBGetDefaultLog(0, v7);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v13 = v10;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Failed to deserialize extended attributes: %@", buf, 0xCu);
          _MBLog(CFSTR("ERROR"), "Failed to deserialize extended attributes: %@", v10);
        }
      }
    }
    sub_10007EEB8((uint64_t)&v4->_mbNode, (int)objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("Flags")));
  }
  return v4;
}

- (void)setNonRedirectedDomain:(id)a3
{
  self->_domain = (MBDomain *)a3;
}

- (void)setDomain:(id)a3
{
  self->_snapshotID = (unint64_t)a3;
}

- (void)getNode:(id *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;

  *(_OWORD *)&a3->var0 = *(_OWORD *)&self->_mbNode.mode;
  v3 = *(_OWORD *)&self->_mbNode.birth;
  v4 = *(_OWORD *)&self->_mbNode.statusChanged;
  v5 = *(_OWORD *)&self->_mbNode.inode;
  a3->var11 = self->_mbNode.cloneID;
  *(_OWORD *)&a3->var7 = v4;
  *(_OWORD *)&a3->var9 = v5;
  *(_OWORD *)&a3->var5 = v3;
}

- (unsigned)type
{
  return self->_mbNode.mode & 0xF000;
}

- (NSString)itemID
{
  return -[MBFileID string](-[MBFile fileID](self, "fileID"), "string");
}

- (unint64_t)snapshotID
{
  return *(_QWORD *)&self->_committed;
}

- (void)setSnapshotID:(unint64_t)a3
{
  *(_QWORD *)&self->_committed = a3;
}

- (MBDomain)domain
{
  return (MBDomain *)self->_snapshotID;
}

- (MBDomain)nonRedirectedDomain
{
  return self->_domain;
}

- (NSString)relativePath
{
  return (NSString *)self->_nonRedirectedDomain;
}

- (NSString)snapshotPath
{
  return self->_relativePath;
}

- (BOOL)isCommitted
{
  return (BOOL)self->_livePath;
}

- (void)setCommitted:(BOOL)a3
{
  LOBYTE(self->_livePath) = a3;
}

- (BOOL)isDeleted
{
  return BYTE1(self->_livePath);
}

- (void)setDeleted:(BOOL)a3
{
  BYTE1(self->_livePath) = a3;
}

- (unint64_t)priority
{
  return (unint64_t)self->_snapshotPath;
}

- (void)setPriority:(unint64_t)a3
{
  self->_snapshotPath = (NSString *)a3;
}

- (NSString)target
{
  return (NSString *)self->_priority;
}

- (void)setTarget:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 176);
}

- (NSData)digest
{
  return (NSData *)self->_target;
}

- (void)setDigest:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 184);
}

- (unsigned)keybagID
{
  return HIDWORD(self->_livePath);
}

- (void)setKeybagID:(unsigned int)a3
{
  HIDWORD(self->_livePath) = a3;
}

- (NSData)encryptionKey
{
  return self->_digest;
}

- (void)setEncryptionKey:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 192);
}

- (unint64_t)encryptionKeyVersion
{
  return (unint64_t)self->_encryptionKey;
}

- (void)setEncryptionKeyVersion:(unint64_t)a3
{
  self->_encryptionKey = (NSData *)a3;
}

- (unint64_t)decryptedSize
{
  return self->_encryptionKeyVersion;
}

- (void)setDecryptedSize:(unint64_t)a3
{
  self->_encryptionKeyVersion = a3;
}

- (NSDictionary)extendedAttributes
{
  return (NSDictionary *)self->_decryptedSize;
}

- (void)setExtendedAttributes:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 216);
}

- (void)getStat:(stat *)a3
{
  $9837B257C983028F49B01CB2451A2DEB *p_mbNode;
  mode_t mode;
  __darwin_ino64_t inode;
  off_t fileSize;
  __darwin_time_t modified;
  __darwin_time_t birth;
  __darwin_time_t statusChanged;
  uint64_t v11;
  __uint32_t v12;
  unsigned int v13;

  *(_OWORD *)&a3->st_blksize = 0u;
  *(_OWORD *)a3->st_qspare = 0u;
  a3->st_birthtimespec = 0u;
  *(_OWORD *)&a3->st_size = 0u;
  a3->st_mtimespec = 0u;
  a3->st_ctimespec = 0u;
  *(_OWORD *)&a3->st_uid = 0u;
  a3->st_atimespec = 0u;
  *(_OWORD *)&a3->st_dev = 0u;
  mode = self->_mbNode.mode;
  p_mbNode = &self->_mbNode;
  fileSize = p_mbNode->fileSize;
  inode = p_mbNode->inode;
  birth = p_mbNode->birth;
  modified = p_mbNode->modified;
  statusChanged = p_mbNode->statusChanged;
  v11 = *(_QWORD *)&p_mbNode->userID;
  v12 = sub_10007EEB0((uint64_t)p_mbNode);
  a3->st_dev = 0;
  a3->st_mode = mode;
  a3->st_nlink = 0;
  a3->st_ino = inode;
  *(_QWORD *)&a3->st_uid = v11;
  a3->st_rdev = 0;
  *(_OWORD *)(&a3->st_rdev + 1) = v13;
  HIDWORD(a3->st_atimespec.tv_nsec) = 0;
  a3->st_mtimespec.tv_sec = modified;
  a3->st_mtimespec.tv_nsec = 0;
  a3->st_ctimespec.tv_sec = statusChanged;
  a3->st_ctimespec.tv_nsec = 0;
  a3->st_birthtimespec.tv_sec = birth;
  a3->st_birthtimespec.tv_nsec = 0;
  a3->st_size = fileSize;
  a3->st_blocks = 0;
  a3->st_blksize = 0;
  a3->st_flags = v12;
  *(_QWORD *)&a3->st_gen = 0;
  a3->st_qspare[0] = 0;
  a3->st_qspare[1] = 0;
}

- (void)setNode:(id *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;

  *(_OWORD *)&self->_mbNode.mode = *(_OWORD *)&a3->var0;
  v3 = *(_OWORD *)&a3->var5;
  v4 = *(_OWORD *)&a3->var7;
  v5 = *(_OWORD *)&a3->var9;
  self->_mbNode.cloneID = a3->var11;
  *(_OWORD *)&self->_mbNode.inode = v5;
  *(_OWORD *)&self->_mbNode.statusChanged = v4;
  *(_OWORD *)&self->_mbNode.birth = v3;
}

- (BOOL)hasFlags
{
  return self->_mbNode.flags != 0;
}

- (unsigned)mode
{
  return self->_mbNode.mode;
}

- (NSString)modeString
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%06o"), -[MBFile mode](self, "mode"));
}

- (NSString)typeString
{
  return (NSString *)sub_10007EFE8(self->_mbNode.mode);
}

- (unsigned)permissions
{
  return sub_10007EF4C(&self->_mbNode.mode);
}

- (BOOL)isRegularFile
{
  return sub_10007EF24(&self->_mbNode.mode);
}

- (BOOL)isDirectory
{
  return sub_10007EF10(&self->_mbNode.mode);
}

- (BOOL)isSymbolicLink
{
  return sub_10007EF38(&self->_mbNode.mode);
}

- (unsigned)userID
{
  return self->_mbNode.userID;
}

- (unsigned)groupID
{
  return self->_mbNode.groupID;
}

- (NSDate)lastModifiedDate
{
  return +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)self->_mbNode.modified);
}

- (int64_t)lastModified
{
  return self->_mbNode.modified;
}

- (void)setLastModified:(int64_t)a3
{
  LOBYTE(self->_fileID) = 1;
  self->_mbNode.modified = a3;
}

- (BOOL)hasOverriddenModifiedDate
{
  return (BOOL)self->_fileID;
}

- (NSDate)lastStatusChangeDate
{
  return +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)self->_mbNode.statusChanged);
}

- (int64_t)lastStatusChange
{
  return self->_mbNode.statusChanged;
}

- (NSDate)birthDate
{
  return +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)self->_mbNode.birth);
}

- (int64_t)birth
{
  return self->_mbNode.birth;
}

- (unint64_t)inodeNumber
{
  return self->_mbNode.inode;
}

- (unsigned)direntCount
{
  return self->_mbNode.direntCount;
}

- (unsigned)protectionClass
{
  return BYTE4(self->_mbNode.cloneID);
}

- (void)setProtectionClass:(unsigned __int8)a3
{
  BYTE4(self->_mbNode.cloneID) = a3;
}

- (int64_t)size
{
  return self->_mbNode.fileSize;
}

- (unint64_t)cloneID
{
  return *(_QWORD *)(&self->_mbNode.genCount + 1);
}

- (unsigned)genCount
{
  return self->_mbNode.genCount;
}

- (BOOL)isHardLink
{
  return BYTE5(self->_mbNode.cloneID) & 1;
}

- (BOOL)isFullClone
{
  return (BYTE5(self->_mbNode.cloneID) >> 1) & 1;
}

- (BOOL)isCompressed
{
  return sub_10007EEEC((uint64_t)&self->_mbNode);
}

- (BOOL)isDataless
{
  return sub_10007EEC8((uint64_t)&self->_mbNode);
}

- (BOOL)hasXattrs
{
  return (BYTE5(self->_mbNode.cloneID) >> 2) & 1;
}

@end
