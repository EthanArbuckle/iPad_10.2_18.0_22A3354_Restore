@implementation PLSortedAlbumListChangeNotification

- (PLSortedAlbumListChangeNotification)init
{

  return 0;
}

- (PLSortedAlbumListChangeNotification)initWithSortedAlbumList:(id)a3 albumListChangeNotification:(id)a4
{
  id v7;
  id v8;
  id *v9;
  PLSortedAlbumListChangeNotification *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PLSortedAlbumListChangeNotification;
  v9 = -[PLContainerChangeNotification _init](&v12, sel__init);
  v10 = (PLSortedAlbumListChangeNotification *)v9;
  if (v9)
  {
    objc_storeStrong(v9 + 12, a3);
    objc_storeStrong((id *)&v10->_backingNotification, a4);
  }

  return v10;
}

- (id)object
{
  return self->_albumList;
}

- (id)albumList
{
  return self->_albumList;
}

- (BOOL)shouldReload
{
  return 1;
}

- (BOOL)countDidChange
{
  return -[PLContainerChangeNotification countDidChange](self->_backingNotification, "countDidChange");
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x19AEC1554](self, a2);
  v4 = (void *)MEMORY[0x1E0CB37A0];
  v5 = objc_opt_class();
  -[PLSortedAlbumListChangeNotification object](self, "object");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %p> sorted album list: %p backing note: <%@: %p>"), v5, self, v6, objc_opt_class(), self->_backingNotification);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v3);
  return v7;
}

- (BOOL)_getOldSet:(id *)a3 newSet:(id *)a4
{
  return 0;
}

- (id)_changedObjects
{
  return -[PLContainerChangeNotification _changedObjects](self->_backingNotification, "_changedObjects");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backingNotification, 0);
  objc_storeStrong((id *)&self->_albumList, 0);
}

+ (id)notificationForDerivedObject:(id)a3 priorChangeState:(id)a4 forBackingObjectNotification:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v10 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v13 = 0;
  }
  else
  {
    v11 = v8;
    v12 = v10;
    if (v11)
    {
      objc_opt_class();
      objc_opt_isKindOfClass();
    }
    objc_opt_class();
    objc_opt_isKindOfClass();
    v13 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithSortedAlbumList:albumListChangeNotification:", v11, v12);

  }
  return v13;
}

@end
