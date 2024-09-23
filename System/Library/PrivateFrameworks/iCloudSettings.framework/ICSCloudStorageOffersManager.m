@implementation ICSCloudStorageOffersManager

- (void)presentCloudStorageOffersPageFromNavigationController:(id)a3 requiredStorageThreshold:(id)a4 completionHandler:(id)a5
{
  id v8;
  objc_class *v9;
  id v10;
  PSCloudStorageOffersManager *v11;
  PSCloudStorageOffersManager *cloudStorageOffersManager;
  double v13;
  id v14;

  v14 = a4;
  v8 = a5;
  v9 = (objc_class *)MEMORY[0x24BE754C0];
  v10 = a3;
  v11 = (PSCloudStorageOffersManager *)objc_alloc_init(v9);
  cloudStorageOffersManager = self->_cloudStorageOffersManager;
  self->_cloudStorageOffersManager = v11;

  -[PSCloudStorageOffersManager setDelegate:](self->_cloudStorageOffersManager, "setDelegate:", self);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v14, "doubleValue");
    -[PSCloudStorageOffersManager setRequiredStorageThreshold:](self->_cloudStorageOffersManager, "setRequiredStorageThreshold:", (unint64_t)v13);
  }
  -[ICSCloudStorageOffersManager setCompletionHandler:](self, "setCompletionHandler:", v8);
  -[PSCloudStorageOffersManager beginFlowWithNavigationController:modally:](self->_cloudStorageOffersManager, "beginFlowWithNavigationController:modally:", v10, 1);

}

- (void)manager:(id)a3 loadDidFailWithError:(id)a4
{
  void (**completionHandler)(id, _QWORD, id);
  id v6;
  PSCloudStorageOffersManager *cloudStorageOffersManager;

  completionHandler = (void (**)(id, _QWORD, id))self->_completionHandler;
  if (completionHandler)
  {
    completionHandler[2](completionHandler, 0, a4);
    v6 = self->_completionHandler;
  }
  else
  {
    v6 = 0;
  }
  self->_completionHandler = 0;

  cloudStorageOffersManager = self->_cloudStorageOffersManager;
  self->_cloudStorageOffersManager = 0;

}

- (void)managerDidCancel:(id)a3
{
  void (**completionHandler)(id, uint64_t, _QWORD);
  id v5;
  PSCloudStorageOffersManager *cloudStorageOffersManager;

  completionHandler = (void (**)(id, uint64_t, _QWORD))self->_completionHandler;
  if (completionHandler)
  {
    completionHandler[2](completionHandler, 1, 0);
    v5 = self->_completionHandler;
  }
  else
  {
    v5 = 0;
  }
  self->_completionHandler = 0;

  cloudStorageOffersManager = self->_cloudStorageOffersManager;
  self->_cloudStorageOffersManager = 0;

}

- (void)manager:(id)a3 didCompleteWithError:(id)a4
{
  void (**completionHandler)(id, _QWORD, id);
  id v6;
  PSCloudStorageOffersManager *cloudStorageOffersManager;

  completionHandler = (void (**)(id, _QWORD, id))self->_completionHandler;
  if (completionHandler)
  {
    completionHandler[2](completionHandler, 0, a4);
    v6 = self->_completionHandler;
  }
  else
  {
    v6 = 0;
  }
  self->_completionHandler = 0;

  cloudStorageOffersManager = self->_cloudStorageOffersManager;
  self->_cloudStorageOffersManager = 0;

}

- (PSCloudStorageOffersManager)cloudStorageOffersManager
{
  return self->_cloudStorageOffersManager;
}

- (void)setCloudStorageOffersManager:(id)a3
{
  objc_storeStrong((id *)&self->_cloudStorageOffersManager, a3);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_cloudStorageOffersManager, 0);
}

@end
