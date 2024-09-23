@implementation BKLibraryManagedObjectContext

- (void)saveLibrary
{
  id v3;

  if (-[BKLibraryManagedObjectContext sessionContextType](self, "sessionContextType") == 5)
    -[BKLibraryManagedObjectContext setSaveContext:](self, "setSaveContext:", 2);
  v3 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryManagedObjectContext libraryManager](self, "libraryManager"));
  objc_msgSend(v3, "saveManagedObjectContext:", self);

}

- (BKLibraryManager)libraryManager
{
  return (BKLibraryManager *)objc_loadWeakRetained((id *)&self->_libraryManager);
}

- (void)setLibraryManager:(id)a3
{
  objc_storeWeak((id *)&self->_libraryManager, a3);
}

- (int)sessionContextType
{
  return self->_sessionContextType;
}

- (void)setSessionContextType:(int)a3
{
  self->_sessionContextType = a3;
}

- (int)saveContext
{
  return self->_saveContext;
}

- (void)setSaveContext:(int)a3
{
  self->_saveContext = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_libraryManager);
}

@end
