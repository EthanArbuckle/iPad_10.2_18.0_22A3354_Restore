@implementation PTPCameraItem

+ (id)UTTypeWithFilenameExtension:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = v3;
  if (qword_10005F4C0 == -1)
  {
    if (v3)
      goto LABEL_3;
LABEL_8:
    v5 = 0;
    goto LABEL_9;
  }
  dispatch_once(&qword_10005F4C0, &stru_100048D40);
  if (!v4)
    goto LABEL_8;
LABEL_3:
  os_unfair_lock_lock((os_unfair_lock_t)&unk_10005F4B8);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10005F4B0, "objectForKeyedSubscript:", v4));
  if (!v5)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UTType typeWithFilenameExtension:](UTType, "typeWithFilenameExtension:", v4));
    if (v5)
      objc_msgSend((id)qword_10005F4B0, "setObject:forKeyedSubscript:", v5, v4);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_10005F4B8);
LABEL_9:

  return v5;
}

- (NSString)name
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PTPCameraItem info](self, "info"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "filename"));

  return (NSString *)v3;
}

- (unint64_t)size
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PTPCameraItem info](self, "info"));
  v3 = objc_msgSend(v2, "objectCompressedSize64");

  return (unint64_t)v3;
}

- (PTPCameraItem)initWithStorageID:(unsigned int)a3 objHandle:(unsigned int)a4 parent:(id)a5 initiator:(id)a6
{
  id v10;
  id v11;
  PTPCameraItem *v12;
  PTPCameraItem *v13;
  objc_super v15;

  v10 = a5;
  v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)PTPCameraItem;
  v12 = -[PTPCameraItem init](&v15, "init");
  v13 = v12;
  if (v12)
  {
    v12->_type = 0;
    objc_storeWeak(&v12->_parent, v10);
    v13->_storageID = a3;
    v13->_objHandle = a4;
    objc_storeWeak((id *)&v13->_initiator, v11);
  }

  return v13;
}

- (BOOL)isInLocalCache
{
  return self->_storageID == 1819239276;
}

- (PTPCameraStorage)storage
{
  id WeakRetained;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_initiator);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "storageForStorageID:", self->_storageID));

  return (PTPCameraStorage *)v4;
}

- (unint64_t)unsignedIntegerValue
{
  return self->_objHandle;
}

- (NSString)mediaItemType
{
  return (NSString *)CFSTR("item");
}

- (BOOL)locked
{
  void *v3;
  BOOL v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PTPCameraItem storage](self, "storage"));
  if ((objc_msgSend(v3, "locked") & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PTPCameraItem info](self, "info"));
    v4 = objc_msgSend(v5, "protectionStatus") == 1;

  }
  return v4;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (id)parent
{
  return objc_loadWeakRetained(&self->_parent);
}

- (void)setParent:(id)a3
{
  objc_storeWeak(&self->_parent, a3);
}

- (unsigned)storageID
{
  return self->_storageID;
}

- (void)setStorageID:(unsigned int)a3
{
  self->_storageID = a3;
}

- (unsigned)objHandle
{
  return self->_objHandle;
}

- (void)setObjHandle:(unsigned int)a3
{
  self->_objHandle = a3;
}

- (id)info
{
  return self->_info;
}

- (void)setInfo:(id)a3
{
  objc_storeStrong(&self->_info, a3);
}

- (NSString)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (PTPInitiator)initiator
{
  return (PTPInitiator *)objc_loadWeakRetained((id *)&self->_initiator);
}

- (void)setInitiator:(id)a3
{
  objc_storeWeak((id *)&self->_initiator, a3);
}

- (unint64_t)parentIndex
{
  return self->_parentIndex;
}

- (NSMutableDictionary)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_metadata, a3);
}

- (NSString)fingerprint
{
  return self->_fingerprint;
}

- (void)setFingerprint:(id)a3
{
  objc_storeStrong((id *)&self->_fingerprint, a3);
}

- (NSString)exifCreationDateTime
{
  return self->_exifCreationDateTime;
}

- (void)setExifCreationDateTime:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)exifModificationDateTime
{
  return self->_exifModificationDateTime;
}

- (void)setExifModificationDateTime:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)exifModificationDate
{
  return self->_exifModificationDate;
}

- (void)setExifModificationDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)exifCreationDate
{
  return self->_exifCreationDate;
}

- (void)setExifCreationDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exifCreationDate, 0);
  objc_storeStrong((id *)&self->_exifModificationDate, 0);
  objc_storeStrong((id *)&self->_exifModificationDateTime, 0);
  objc_storeStrong((id *)&self->_exifCreationDateTime, 0);
  objc_storeStrong((id *)&self->_fingerprint, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_destroyWeak((id *)&self->_initiator);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong(&self->_info, 0);
  objc_destroyWeak(&self->_parent);
}

@end
