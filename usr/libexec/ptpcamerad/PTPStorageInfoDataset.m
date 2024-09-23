@implementation PTPStorageInfoDataset

- (PTPStorageInfoDataset)init
{
  PTPStorageInfoDataset *v2;
  NSMutableData *v3;
  NSMutableData *content;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PTPStorageInfoDataset;
  v2 = -[PTPStorageInfoDataset init](&v6, "init");
  if (v2)
  {
    v3 = (NSMutableData *)objc_msgSend(objc_alloc((Class)NSMutableData), "initWithCapacity:", 28);
    content = v2->_content;
    v2->_content = v3;

    *(_WORD *)&v2->_dirty = 1;
  }
  return v2;
}

- (void)setContent:(id)a3
{
  id v5;
  id v6;
  char *v7;
  id v8;
  NSString *v9;
  NSString *storageDescription;
  id v11;
  NSString *v12;
  NSString *volumeLabel;
  const void *v14;

  objc_storeStrong((id *)&self->_content, a3);
  v5 = a3;
  v6 = -[NSMutableData bytes](self->_content, "bytes");
  v7 = (char *)-[NSMutableData length](self->_content, "length") + (_QWORD)v6;
  v14 = v6;
  self->_storageType = sub_100027364((unint64_t *)&v14, (unint64_t)v7);
  self->_filesystemType = sub_100027364((unint64_t *)&v14, (unint64_t)v7);
  self->_accessCapability = sub_100027364((unint64_t *)&v14, (unint64_t)v7);
  self->_maxCapacity = sub_1000273E0((unint64_t *)&v14, (unint64_t)v7);
  self->_freeSpaceInBytes = sub_1000273E0((unint64_t *)&v14, (unint64_t)v7);
  self->_freeSpaceInImages = sub_10002738C((unint64_t *)&v14, (unint64_t)v7);
  v8 = sub_1000274E0(&v14, (unint64_t)v7);
  v9 = (NSString *)objc_claimAutoreleasedReturnValue(v8);
  storageDescription = self->_storageDescription;
  self->_storageDescription = v9;

  v11 = sub_1000274E0(&v14, (unint64_t)v7);
  v12 = (NSString *)objc_claimAutoreleasedReturnValue(v11);
  volumeLabel = self->_volumeLabel;
  self->_volumeLabel = v12;

}

- (PTPStorageInfoDataset)initWithData:(id)a3
{
  id v4;
  PTPStorageInfoDataset *v5;
  id v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PTPStorageInfoDataset;
  v5 = -[PTPStorageInfoDataset init](&v8, "init");
  if (v5)
  {
    if ((unint64_t)objc_msgSend(v4, "length") < 0x1C)
    {

      v5 = 0;
    }
    else
    {
      v6 = objc_msgSend(v4, "mutableCopy");
      -[PTPStorageInfoDataset setContent:](v5, "setContent:", v6);

      v5->_readOnlyObject = 1;
    }
  }

  return v5;
}

- (PTPStorageInfoDataset)initWithMutableData:(id)a3
{
  id v4;
  PTPStorageInfoDataset *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PTPStorageInfoDataset;
  v5 = -[PTPStorageInfoDataset init](&v7, "init");
  if (v5)
  {
    if ((unint64_t)objc_msgSend(v4, "length") < 0x1C)
    {

      v5 = 0;
    }
    else
    {
      -[PTPStorageInfoDataset setContent:](v5, "setContent:", v4);
      v5->_readOnlyObject = 0;
    }
  }

  return v5;
}

- (void)updateContent
{
  NSUInteger v3;
  NSUInteger v4;
  uint64_t v5;
  uint64_t v6;
  _WORD *v7;

  v3 = -[NSString length](self->_storageDescription, "length");
  v4 = -[NSString length](self->_volumeLabel, "length");
  if (self->_dirty && !self->_readOnlyObject)
  {
    v5 = 2 * v4 + 2;
    v6 = 2 * v3 + 30;
    if (!v3)
      v6 = 28;
    if (!v4)
      v5 = 0;
    -[NSMutableData setLength:](self->_content, "setLength:", v5 + v6);
    v7 = -[NSMutableData mutableBytes](self->_content, "mutableBytes");
    sub_100027338(&v7, self->_storageType);
    sub_100027338(&v7, self->_filesystemType);
    sub_100027338(&v7, self->_accessCapability);
    sub_100027408((_QWORD **)&v7, self->_maxCapacity);
    sub_100027408((_QWORD **)&v7, self->_freeSpaceInBytes);
    sub_1000273B4((_DWORD **)&v7, self->_freeSpaceInImages);
    sub_100027514((_BYTE **)&v7, self->_storageDescription);
    sub_100027514((_BYTE **)&v7, self->_volumeLabel);
  }
}

- (NSMutableData)content
{
  -[PTPStorageInfoDataset updateContent](self, "updateContent");
  return self->_content;
}

- (id)description
{
  void *v3;
  __CFString *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  __CFString *v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithFormat:](NSMutableString, "stringWithFormat:", CFSTR("<PTPStorageInfoDataset %p>{\n  _storageType:        "), self));
  v4 = sub_100028710(self->_storageType);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@\n  _filesystemType:     "), v5);

  v6 = sub_100028768(self->_filesystemType);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@\n  _accessCapability:   "), v7);

  v8 = sub_1000287FC(self->_accessCapability);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@\n  _maxCapacity:        %llu\n  _freeSpaceInBytes:   %llu\n  _freeSpaceInImages:  %lu\n  _storageDescription: %@\n  _volumeLabel:        %@\n}"), v9, self->_maxCapacity, self->_freeSpaceInBytes, self->_freeSpaceInImages, self->_storageDescription, self->_volumeLabel);

  return v3;
}

- (unsigned)storageType
{
  return self->_storageType;
}

- (void)setStorageType:(unsigned __int16)a3
{
  self->_storageType = a3;
  self->_dirty = 1;
}

- (unsigned)filesystemType
{
  return self->_filesystemType;
}

- (void)setFilesystemType:(unsigned __int16)a3
{
  self->_filesystemType = a3;
  self->_dirty = 1;
}

- (unsigned)accessCapability
{
  return self->_accessCapability;
}

- (void)setAccessCapability:(unsigned __int16)a3
{
  self->_accessCapability = a3;
  self->_dirty = 1;
}

- (unint64_t)maxCapacity
{
  return self->_maxCapacity;
}

- (void)setMaxCapacity:(unint64_t)a3
{
  self->_maxCapacity = a3;
  self->_dirty = 1;
}

- (unint64_t)freeSpaceInBytes
{
  return self->_freeSpaceInBytes;
}

- (void)setFreeSpaceInBytes:(unint64_t)a3
{
  self->_freeSpaceInBytes = a3;
  self->_dirty = 1;
}

- (unsigned)freeSpaceInImages
{
  return self->_freeSpaceInImages;
}

- (void)setFreeSpaceInImages:(unsigned int)a3
{
  self->_freeSpaceInImages = a3;
  self->_dirty = 1;
}

- (NSString)storageDescription
{
  return self->_storageDescription;
}

- (void)setStorageDescription:(id)a3
{
  NSString *v5;
  NSString *v6;

  v5 = (NSString *)a3;
  if (self->_storageDescription != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_storageDescription, a3);
    v5 = v6;
    self->_dirty = 1;
  }

}

- (NSString)volumeLabel
{
  return self->_volumeLabel;
}

- (void)setVolumeLabel:(id)a3
{
  NSString *v5;
  NSString *v6;

  v5 = (NSString *)a3;
  if (self->_volumeLabel != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_volumeLabel, a3);
    v5 = v6;
    self->_dirty = 1;
  }

}

- (BOOL)dirty
{
  return self->_dirty;
}

- (void)setDirty:(BOOL)a3
{
  self->_dirty = a3;
}

- (BOOL)readOnlyObject
{
  return self->_readOnlyObject;
}

- (void)setReadOnlyObject:(BOOL)a3
{
  self->_readOnlyObject = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_volumeLabel, 0);
  objc_storeStrong((id *)&self->_storageDescription, 0);
}

@end
