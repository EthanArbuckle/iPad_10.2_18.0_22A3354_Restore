@implementation MBServiceRestoreFile

+ (id)restoreFile
{
  return objc_alloc_init(MBServiceRestoreFile);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MBServiceRestoreFile;
  -[MBServiceRestoreFile dealloc](&v3, "dealloc");
}

- (BOOL)isPending
{
  return self->_state == 0;
}

- (BOOL)didSucceed
{
  return self->_state == 1;
}

- (BOOL)wasDeleted
{
  return self->_state == 2;
}

- (BOOL)wasExcluded
{
  return self->_state == 3;
}

- (BOOL)didFail
{
  return self->_state == 4;
}

- (unint64_t)restoreID
{
  return self->_restoreID;
}

- (void)setRestoreID:(unint64_t)a3
{
  self->_restoreID = a3;
}

- (MBFileID)fileID
{
  return self->_fileID;
}

- (void)setFileID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (unint64_t)snapshotID
{
  return self->_snapshotID;
}

- (void)setSnapshotID:(unint64_t)a3
{
  self->_snapshotID = a3;
}

- (unint64_t)itemID
{
  return self->_itemID;
}

- (void)setItemID:(unint64_t)a3
{
  self->_itemID = a3;
}

- (int)state
{
  return self->_state;
}

- (void)setState:(int)a3
{
  self->_state = a3;
}

- (int64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(int64_t)a3
{
  self->_priority = a3;
}

@end
