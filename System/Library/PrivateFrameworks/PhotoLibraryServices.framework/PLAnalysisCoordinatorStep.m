@implementation PLAnalysisCoordinatorStep

- (PLAnalysisCoordinatorStep)initWithLibraryServicesManager:(id)a3 parentTaskID:(id)a4
{
  id v7;
  id v8;
  PLAnalysisCoordinatorStep *v9;
  PLAnalysisCoordinatorStep *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PLAnalysisCoordinatorStep;
  v9 = -[PLAnalysisCoordinatorStep init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_libraryServicesManager, a3);
    objc_storeStrong((id *)&v10->_parentTaskID, a4);
  }

  return v10;
}

- (PLLibraryServicesManager)libraryServicesManager
{
  return self->_libraryServicesManager;
}

- (NSString)parentTaskID
{
  return self->_parentTaskID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentTaskID, 0);
  objc_storeStrong((id *)&self->_libraryServicesManager, 0);
}

@end
