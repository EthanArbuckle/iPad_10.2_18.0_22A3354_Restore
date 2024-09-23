@implementation MBServiceFileChange

+ (id)stringForType:(int)a3
{
  if (a3 > 3)
    return 0;
  else
    return off_1000D9390[a3];
}

+ (id)fileChange
{
  return objc_alloc_init(MBServiceFileChange);
}

+ (id)fileChangeWithFile:(id)a3 type:(int)a4
{
  uint64_t v4;
  MBServiceFileChange *v6;

  v4 = *(_QWORD *)&a4;
  v6 = objc_alloc_init(MBServiceFileChange);
  -[MBServiceFileChange setFileID:](v6, "setFileID:", objc_msgSend(a3, "fileID"));
  -[MBServiceFileChange setType:](v6, "setType:", v4);
  -[MBServiceFileChange setDomainName:](v6, "setDomainName:", objc_msgSend(objc_msgSend(a3, "domain"), "name"));
  -[MBServiceFileChange setRelativePath:](v6, "setRelativePath:", objc_msgSend(a3, "relativePath"));
  -[MBServiceFileChange setSize:](v6, "setSize:", objc_msgSend(a3, "size"));
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MBServiceFileChange;
  -[MBServiceFileChange dealloc](&v3, "dealloc");
}

- (BOOL)isUnmodified
{
  return self->_type == 0;
}

- (BOOL)isAdded
{
  return self->_type == 1;
}

- (BOOL)isModified
{
  return self->_type == 2;
}

- (BOOL)isDeleted
{
  return self->_type == 3;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5;

  v5 = objc_opt_class(self);
  if ((objc_opt_isKindOfClass(a3, v5) & 1) != 0)
    return objc_msgSend(a3, "isEqualToFileChange:", self);
  else
    return 0;
}

- (BOOL)isEqualToFileChange:(id)a3
{
  unsigned int v5;

  v5 = objc_msgSend(*((id *)a3 + 2), "isEqualToFileID:", self->_fileID);
  if (v5)
  {
    if (*((_DWORD *)a3 + 2) != self->_type)
      goto LABEL_8;
    v5 = objc_msgSend(*((id *)a3 + 3), "isEqualToString:", self->_domainName);
    if (v5)
    {
      v5 = objc_msgSend(*((id *)a3 + 4), "isEqualToString:", self->_relativePath);
      if (v5)
      {
        v5 = objc_msgSend(*((id *)a3 + 5), "isEqual:", self->_duplicateFileReference);
        if (v5)
        {
          if (*((_QWORD *)a3 + 6) == self->_size)
          {
            LOBYTE(v5) = *((_DWORD *)a3 + 3) == self->_result;
            return v5;
          }
LABEL_8:
          LOBYTE(v5) = 0;
        }
      }
    }
  }
  return v5;
}

- (NSString)typeString
{
  return (NSString *)+[MBServiceFileChange stringForType:](MBServiceFileChange, "stringForType:", self->_type);
}

- (id)description
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: fileID=\"%@\", type=%d, domain=\"%@\", relativePath=\"%@\", duplicateFileReference=%@, size=%llu, result=%d>"), objc_opt_class(self), self->_fileID, self->_type, self->_domainName, self->_relativePath, self->_duplicateFileReference, self->_size, self->_result);
}

- (MBFileID)fileID
{
  return self->_fileID;
}

- (void)setFileID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (int)type
{
  return self->_type;
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (NSString)domainName
{
  return self->_domainName;
}

- (void)setDomainName:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (NSString)relativePath
{
  return self->_relativePath;
}

- (void)setRelativePath:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (MBSFileReference)duplicateFileReference
{
  return self->_duplicateFileReference;
}

- (void)setDuplicateFileReference:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (int64_t)size
{
  return self->_size;
}

- (void)setSize:(int64_t)a3
{
  self->_size = a3;
}

- (int)result
{
  return self->_result;
}

- (void)setResult:(int)a3
{
  self->_result = a3;
}

@end
