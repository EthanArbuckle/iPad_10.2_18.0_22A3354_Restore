@implementation WBSRetryableCKDatabaseOperation

- (CKDatabase)database
{
  os_unfair_lock_s *p_internalLock;
  CKDatabase *v4;

  p_internalLock = &self->super._internalLock;
  os_unfair_lock_lock(&self->super._internalLock);
  v4 = self->_database;
  os_unfair_lock_unlock(p_internalLock);
  return v4;
}

- (void)setDatabase:(id)a3
{
  CKDatabase *v4;
  CKDatabase *database;
  CKDatabase *v6;

  v4 = (CKDatabase *)a3;
  os_unfair_lock_lock(&self->super._internalLock);
  database = self->_database;
  self->_database = v4;
  v6 = v4;

  -[NSMutableSet addObject:](self->super._explicitlySetProperties, "addObject:", CFSTR("database"));
  os_unfair_lock_unlock(&self->super._internalLock);
}

- (void)_setUpOperation:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)WBSRetryableCKDatabaseOperation;
  -[WBSRetryableCKOperation _setUpOperation:](&v5, sel__setUpOperation_, v4);
  if (-[NSMutableSet containsObject:](self->super._explicitlySetProperties, "containsObject:", CFSTR("database")))objc_msgSend(v4, "setDatabase:", self->_database);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_database, 0);
}

@end
