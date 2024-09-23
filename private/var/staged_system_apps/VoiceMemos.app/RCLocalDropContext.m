@implementation RCLocalDropContext

+ (id)dropContextWithFolderType:(int64_t)a3 folderUUID:(id)a4 folderIndexPath:(id)a5 payloadType:(int64_t)a6
{
  id v9;
  id v10;
  RCLocalDropContext *v11;

  v9 = a5;
  v10 = a4;
  v11 = objc_opt_new(RCLocalDropContext);
  -[RCLocalDropContext setFolderType:](v11, "setFolderType:", a3);
  -[RCLocalDropContext setFolderUUID:](v11, "setFolderUUID:", v10);

  -[RCLocalDropContext setFolderIndexPath:](v11, "setFolderIndexPath:", v9);
  -[RCLocalDropContext setPayloadType:](v11, "setPayloadType:", a6);
  return v11;
}

- (int64_t)folderType
{
  return self->_folderType;
}

- (void)setFolderType:(int64_t)a3
{
  self->_folderType = a3;
}

- (NSString)folderUUID
{
  return self->_folderUUID;
}

- (void)setFolderUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSIndexPath)folderIndexPath
{
  return self->_folderIndexPath;
}

- (void)setFolderIndexPath:(id)a3
{
  objc_storeStrong((id *)&self->_folderIndexPath, a3);
}

- (int64_t)payloadType
{
  return self->_payloadType;
}

- (void)setPayloadType:(int64_t)a3
{
  self->_payloadType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_folderIndexPath, 0);
  objc_storeStrong((id *)&self->_folderUUID, 0);
}

@end
