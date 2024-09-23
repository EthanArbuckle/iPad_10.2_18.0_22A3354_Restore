@implementation PKCloudRecordAssetURL

- (PKCloudRecordAssetURL)initWithRecords:(id)a3
{
  id v4;
  PKCloudRecordAssetURL *v5;
  PKCloudRecordAssetURL *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  NSObject *v12;
  int v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  objc_super v18;
  uint8_t buf[4];
  NSObject *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PKCloudRecordAssetURL;
  v5 = -[PKCloudRecordObject initWithRecords:](&v18, sel_initWithRecords_, v4);
  v6 = v5;
  if (v5)
  {
    v5->_fd = -1;
    objc_msgSend(v4, "anyObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "recordType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("RemoteAsset"));

    if (v9)
    {
      objc_msgSend(v7, "objectForKey:", CFSTR("asset"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v10)
      {
        objc_msgSend(v10, "fileURL");
        v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v13 = open((const char *)-[NSObject fileSystemRepresentation](v12, "fileSystemRepresentation"), 4);
        if (v13 < 0)
        {
          PKLogFacilityTypeGetObject(9uLL);
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v20 = v12;
            _os_log_impl(&dword_18FC92000, v16, OS_LOG_TYPE_DEFAULT, "Error trying to open CloudKit remote asset file %@", buf, 0xCu);
          }

        }
        else
        {
          v6->_fd = v13;
        }
      }
      else
      {
        PKLogFacilityTypeGetObject(9uLL);
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v7, "recordID");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "recordName");
          v15 = objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v20 = v15;
          _os_log_impl(&dword_18FC92000, v12, OS_LOG_TYPE_DEFAULT, "There is no asset associated with recordName: %@.", buf, 0xCu);

        }
      }

    }
  }

  return v6;
}

- (void)dealloc
{
  int fd;
  objc_super v4;

  fd = self->_fd;
  if ((fd & 0x80000000) == 0)
    close(fd);
  v4.receiver = self;
  v4.super_class = (Class)PKCloudRecordAssetURL;
  -[PKCloudRecordAssetURL dealloc](&v4, sel_dealloc);
}

- (id)assetData
{
  int fd;
  off_t st_size;
  void *v6;
  void *v7;
  NSData *v8;
  NSData *data;
  NSObject *v10;
  uint8_t v11[16];
  stat v12;

  fd = self->_fd;
  if ((fd & 0x80000000) == 0 && !self->_data)
  {
    memset(&v12, 0, sizeof(v12));
    if (!fstat(fd, &v12))
    {
      st_size = v12.st_size;
      if ((v12.st_size & 0x8000000000000000) == 0)
      {
        if (v12.st_size)
        {
          v6 = mmap(0, v12.st_size, 1, 1, self->_fd, 0);
          if (v6 != (void *)-1)
          {
            v7 = v6;
            objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v6, st_size);
            v8 = (NSData *)objc_claimAutoreleasedReturnValue();
            data = self->_data;
            self->_data = v8;

            if (munmap(v7, st_size))
            {
              PKLogFacilityTypeGetObject(0);
              v10 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
              {
                *(_WORD *)v11 = 0;
                _os_log_fault_impl(&dword_18FC92000, v10, OS_LOG_TYPE_FAULT, "Failed to unmap file! Leaking mapping...", v11, 2u);
              }

              if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)v11 = 0;
                _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "Failed to unmap file! Leaking mapping...", v11, 2u);
              }

            }
          }
        }
      }
    }
  }
  return self->_data;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKCloudRecordAssetURL)initWithCoder:(id)a3
{
  id v4;
  PKCloudRecordAssetURL *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKCloudRecordAssetURL;
  v5 = -[PKCloudRecordObject initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeXPCObjectOfType:forKey:", MEMORY[0x1E0C81318], CFSTR("fd"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
      v5->_fd = xpc_fd_dup(v6);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  xpc_object_t v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKCloudRecordAssetURL;
  v4 = a3;
  -[PKCloudRecordObject encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  v5 = xpc_fd_create(self->_fd);
  objc_msgSend(v4, "encodeXPCObject:forKey:", v5, CFSTR("fd"), v6.receiver, v6.super_class);

}

- (int64_t)compare:(id)a3
{
  return -1;
}

- (id)descriptionWithItem:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = a3;
  -[PKCloudRecordAssetURL _descriptionWithIncludeItem:](self, "_descriptionWithIncludeItem:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8.receiver = self;
  v8.super_class = (Class)PKCloudRecordAssetURL;
  -[PKCloudRecordObject descriptionWithItem:](&v8, sel_descriptionWithItem_, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("\n%@"), v6);

  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  objc_super v6;

  -[PKCloudRecordAssetURL _descriptionWithIncludeItem:](self, "_descriptionWithIncludeItem:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6.receiver = self;
  v6.super_class = (Class)PKCloudRecordAssetURL;
  -[PKCloudRecordObject description](&v6, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n%@"), v4);

  return v3;
}

- (id)_descriptionWithIncludeItem:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
    objc_msgSend(v5, "appendFormat:", CFSTR("fd: %d"), self->_fd);
  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
}

@end
