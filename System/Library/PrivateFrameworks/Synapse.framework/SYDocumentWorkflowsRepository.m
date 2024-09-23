@implementation SYDocumentWorkflowsRepository

- (SYDocumentWorkflowsRepository)init
{
  SYDocumentWorkflowsRepository *v2;
  SYDocumentWorkflowsDisabledDataStore *v3;
  SYDocumentWorkflowsDataStore *persistentStore;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SYDocumentWorkflowsRepository;
  v2 = -[SYDocumentWorkflowsRepository init](&v6, sel_init);
  if (v2)
  {
    +[SYDocumentWorkflowsCoreDataStore removePersistentStoreWithError:](SYDocumentWorkflowsCoreDataStore, "removePersistentStoreWithError:", 0);
    v3 = objc_alloc_init(SYDocumentWorkflowsDisabledDataStore);
    persistentStore = v2->_persistentStore;
    v2->_persistentStore = (SYDocumentWorkflowsDataStore *)v3;

  }
  return v2;
}

- (id)fetchUserActivityWithRelatedUniqueIdentifier:(id)a3 error:(id *)a4
{
  return (id)-[SYDocumentWorkflowsDataStore fetchUserActivityWithRelatedUniqueIdentifier:error:](self->_persistentStore, "fetchUserActivityWithRelatedUniqueIdentifier:error:", a3, a4);
}

- (BOOL)saveUserActivity:(id)a3 forRelatedUniqueIdentifier:(id)a4 sourceBundleIdentifier:(id)a5 error:(id *)a6
{
  return -[SYDocumentWorkflowsDataStore saveUserActivity:forRelatedUniqueIdentifier:sourceBundleIdentifier:error:](self->_persistentStore, "saveUserActivity:forRelatedUniqueIdentifier:sourceBundleIdentifier:error:", a3, a4, a5, a6);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistentStore, 0);
}

@end
