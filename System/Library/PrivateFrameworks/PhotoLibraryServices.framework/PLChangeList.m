@implementation PLChangeList

- (void)cleanupState
{
  NSMutableSet *inserted;
  NSMutableSet *updated;
  NSMutableSet *deleted;

  inserted = self->_inserted;
  self->_inserted = 0;

  updated = self->_updated;
  self->_updated = 0;

  deleted = self->_deleted;
  self->_deleted = 0;

}

- (NSMutableSet)inserted
{
  return self->_inserted;
}

- (void)setInserted:(id)a3
{
  objc_storeStrong((id *)&self->_inserted, a3);
}

- (NSMutableSet)updated
{
  return self->_updated;
}

- (void)setUpdated:(id)a3
{
  objc_storeStrong((id *)&self->_updated, a3);
}

- (NSMutableSet)deleted
{
  return self->_deleted;
}

- (void)setDeleted:(id)a3
{
  objc_storeStrong((id *)&self->_deleted, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deleted, 0);
  objc_storeStrong((id *)&self->_updated, 0);
  objc_storeStrong((id *)&self->_inserted, 0);
}

@end
