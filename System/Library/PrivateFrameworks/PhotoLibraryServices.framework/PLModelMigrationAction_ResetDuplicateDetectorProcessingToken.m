@implementation PLModelMigrationAction_ResetDuplicateDetectorProcessingToken

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  int64_t v5;

  v5 = +[PLModelMigrationActionUtility resetDuplicateProcessingWithAction:managedObjectContext:error:](PLModelMigrationActionUtility, "resetDuplicateProcessingWithAction:managedObjectContext:error:", self, a3, a4);
  -[PLModelMigrationActionCore finalizeProgress](self, "finalizeProgress");
  return v5;
}

@end
