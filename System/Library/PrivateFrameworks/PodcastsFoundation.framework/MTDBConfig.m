@implementation MTDBConfig

- (id)databaseFileUrl
{
  return (id)objc_msgSend((id)objc_opt_class(), "libraryPath");
}

- (id)persistentStoreOptions
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", CFSTR("WAL"), CFSTR("journal_mode"), 0);
  v3 = objc_alloc(MEMORY[0x1E0C99D80]);
  v4 = *MEMORY[0x1E0C979E0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithObjectsAndKeys:", v2, v4, v5, *MEMORY[0x1E0C978D0], *MEMORY[0x1E0CB2AE0], *MEMORY[0x1E0C97940], MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0C97900], MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0C97978], 0);

  return v6;
}

- (id)managedObjectModel
{
  NSManagedObjectModel *model;
  NSManagedObjectModel *v4;
  NSManagedObjectModel *v5;

  model = self->_model;
  if (!model)
  {
    objc_msgSend((id)objc_opt_class(), "fetchManagedObjectModelFromDisk");
    v4 = (NSManagedObjectModel *)objc_claimAutoreleasedReturnValue();
    v5 = self->_model;
    self->_model = v4;

    model = self->_model;
  }
  return model;
}

- (NSManagedObjectModel)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
  objc_storeStrong((id *)&self->_model, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_model, 0);
}

@end
