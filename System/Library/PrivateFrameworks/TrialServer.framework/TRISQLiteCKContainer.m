@implementation TRISQLiteCKContainer

- (TRISQLiteCKContainer)initWithContainerIdentifier:(id)a3 database:(id)a4
{
  id v7;
  id v8;
  TRISQLiteCKContainer *v9;
  TRISQLiteCKContainer *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TRISQLiteCKContainer;
  v9 = -[TRISQLiteCKContainer init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_containerIdentifier, a3);
    objc_storeStrong((id *)&v10->_database, a4);
    -[TRISQLiteCKDatabase setContainer:](v10->_database, "setContainer:", v10);
  }

  return v10;
}

- (CKDatabase)privateCloudDatabase
{
  return (CKDatabase *)self->_database;
}

- (CKDatabase)publicCloudDatabase
{
  return (CKDatabase *)self->_database;
}

- (CKDatabase)sharedCloudDatabase
{
  return (CKDatabase *)self->_database;
}

- (NSString)containerIdentifier
{
  return self->_containerIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerIdentifier, 0);
  objc_storeStrong((id *)&self->_database, 0);
}

@end
