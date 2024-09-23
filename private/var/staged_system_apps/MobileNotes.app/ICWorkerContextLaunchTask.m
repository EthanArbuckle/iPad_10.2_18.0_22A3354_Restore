@implementation ICWorkerContextLaunchTask

- (NSManagedObjectContext)workerContext
{
  NSManagedObjectContext *workerContext;
  void *v4;
  NSManagedObjectContext *v5;
  NSManagedObjectContext *v6;

  workerContext = self->_workerContext;
  if (!workerContext)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
    v5 = (NSManagedObjectContext *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "workerManagedObjectContext"));
    v6 = self->_workerContext;
    self->_workerContext = v5;

    workerContext = self->_workerContext;
  }
  return workerContext;
}

- (void)setWorkerContext:(id)a3
{
  objc_storeStrong((id *)&self->_workerContext, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workerContext, 0);
}

@end
