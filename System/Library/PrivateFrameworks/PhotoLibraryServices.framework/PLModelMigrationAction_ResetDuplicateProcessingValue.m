@implementation PLModelMigrationAction_ResetDuplicateProcessingValue

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  id v5;
  PLGlobalValues *v6;
  void *v7;
  BOOL v8;

  v5 = a3;
  v6 = -[PLGlobalValues initWithManagedObjectContext:]([PLGlobalValues alloc], "initWithManagedObjectContext:", v5);
  -[PLModelMigrationActionCore pathManager](self, "pathManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = +[PLDuplicateDetector duplicateDetectorCompletedPerceptualHashProcessingWithManagedObjectContext:pathManager:](PLDuplicateDetector, "duplicateDetectorCompletedPerceptualHashProcessingWithManagedObjectContext:pathManager:", v5, v7);

  if (!v8)
    -[PLGlobalValues setLastInitialDuplicateDetectorProcessingCompletedToken:](v6, "setLastInitialDuplicateDetectorProcessingCompletedToken:", 0);
  -[PLModelMigrationActionCore finalizeProgress](self, "finalizeProgress");

  return 1;
}

@end
