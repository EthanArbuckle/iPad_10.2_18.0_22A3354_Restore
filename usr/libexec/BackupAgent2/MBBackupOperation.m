@implementation MBBackupOperation

+ (id)nameForType:(int)a3
{
  if (a3 > 4)
    return 0;
  else
    return *(&off_1000DA0D8 + a3);
}

+ (id)backupOperationWithType:(int)a3 domain:(id)a4 fileID:(id)a5 path:(id)a6 size:(unint64_t)a7
{
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  MBBackupOperation *v14;

  v10 = *(_QWORD *)&a3;
  v11 = a6;
  v12 = a5;
  v13 = a4;
  v14 = objc_alloc_init(MBBackupOperation);
  -[MBBackupOperation setType:](v14, "setType:", v10);
  -[MBBackupOperation setDomain:](v14, "setDomain:", v13);

  -[MBBackupOperation setFileID:](v14, "setFileID:", v12);
  -[MBBackupOperation setPath:](v14, "setPath:", v11);

  -[MBBackupOperation setSize:](v14, "setSize:", a7);
  return v14;
}

+ (id)backupOperationWithType:(int)a3 domain:(id)a4 fileID:(id)a5 path:(id)a6 size:(unint64_t)a7 flags:(unsigned __int8)a8
{
  uint64_t v8;
  void *v9;

  v8 = a8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "backupOperationWithType:domain:fileID:path:size:", *(_QWORD *)&a3, a4, a5, a6, a7));
  objc_msgSend(v9, "setFlags:", v8);
  return v9;
}

- (MBBackupOperation)initWithDecoder:(id)a3
{
  -[MBBackupOperation doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (MBBackupOperation)initWithDecoder:(id)a3 domainManager:(id)a4
{
  id v6;
  id v7;
  MBBackupOperation *v8;
  id v9;
  void *v10;
  uint64_t v11;
  MBDomain *domain;
  void *v13;
  MBFileID *v14;
  MBFileID *fileID;
  uint64_t v16;
  NSString *path;
  id v19;
  objc_super v20;

  v6 = a3;
  v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)MBBackupOperation;
  v8 = -[MBBackupOperation init](&v20, "init");
  if (v8)
  {
    v9 = objc_msgSend(v6, "decodeInt8");
    if (v9 >= 5)
    {
      v19 = objc_msgSend(objc_alloc((Class)MBException), "initWithCode:format:", 11, CFSTR("Invalid type: %d"), v9);
    }
    else
    {
      v8->_type = (int)v9;
      v8->_flags = objc_msgSend(v6, "decodeInt8");
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "decodeString"));
      if (v10
        && (v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "domainForName:", v10)),
            domain = v8->_domain,
            v8->_domain = (MBDomain *)v11,
            domain,
            !v8->_domain))
      {
        v19 = objc_msgSend(objc_alloc((Class)MBException), "initWithCode:format:", 11, CFSTR("Invalid domain name: %@"), v10);
      }
      else
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "decodeData"));
        if (!v13
          || (v14 = -[MBFileID initWithData:]([MBFileID alloc], "initWithData:", v13),
              fileID = v8->_fileID,
              v8->_fileID = v14,
              fileID,
              v8->_fileID))
        {
          v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "decodeString"));
          path = v8->_path;
          v8->_path = (NSString *)v16;

          v8->_size = (unint64_t)objc_msgSend(v6, "decodeInt64");
          goto LABEL_8;
        }
        v19 = objc_msgSend(objc_alloc((Class)MBException), "initWithCode:format:", 11, CFSTR("Invalid file ID data: %@"), v13);
      }
    }
    objc_exception_throw(v19);
  }
LABEL_8:

  return v8;
}

- (NSString)typeName
{
  return (NSString *)+[MBBackupOperation nameForType:](MBBackupOperation, "nameForType:", self->_type);
}

- (void)encode:(id)a3
{
  uint64_t type_low;
  void *v5;
  void *v6;
  id v7;

  type_low = SLOBYTE(self->_type);
  v7 = a3;
  objc_msgSend(v7, "encodeInt8:", type_low);
  objc_msgSend(v7, "encodeInt8:", (char)self->_flags);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MBDomain name](self->_domain, "name"));
  objc_msgSend(v7, "encodeString:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MBFileID data](self->_fileID, "data"));
  objc_msgSend(v7, "encodeData:", v6);

  objc_msgSend(v7, "encodeString:", self->_path);
  objc_msgSend(v7, "encodeInt64:", self->_size);

}

- (id)description
{
  uint64_t v3;
  void *v4;
  void *v5;

  v3 = objc_opt_class(self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MBBackupOperation typeName](self, "typeName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: type=%@, domain=%@, fileID=%@, path=%@, size=%llu, flags=0x%x>"), v3, v4, self->_domain, self->_fileID, self->_path, self->_size, self->_flags));

  return v5;
}

- (int)type
{
  return self->_type;
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (unsigned)flags
{
  return self->_flags;
}

- (void)setFlags:(unsigned __int8)a3
{
  self->_flags = a3;
}

- (MBDomain)domain
{
  return self->_domain;
}

- (void)setDomain:(id)a3
{
  objc_storeStrong((id *)&self->_domain, a3);
}

- (MBFileID)fileID
{
  return self->_fileID;
}

- (void)setFileID:(id)a3
{
  objc_storeStrong((id *)&self->_fileID, a3);
}

- (NSString)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
  objc_storeStrong((id *)&self->_path, a3);
}

- (unint64_t)size
{
  return self->_size;
}

- (void)setSize:(unint64_t)a3
{
  self->_size = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_fileID, 0);
  objc_storeStrong((id *)&self->_domain, 0);
}

@end
