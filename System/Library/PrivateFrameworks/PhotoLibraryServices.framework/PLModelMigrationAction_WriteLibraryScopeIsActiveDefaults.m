@implementation PLModelMigrationAction_WriteLibraryScopeIsActiveDefaults

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  +[PLLibraryScope updateLibraryScopeActiveDefaultsWithManagedObjectContext:](PLLibraryScope, "updateLibraryScopeActiveDefaultsWithManagedObjectContext:", a3);
  -[PLModelMigrationActionCore finalizeProgress](self, "finalizeProgress");
  if (a4)
    *a4 = 0;
  return 1;
}

@end
