@implementation PUPhotoEditPendingEditsRequest

- (PUPhotoEditPendingEditsRequest)initWithAdjustments:(id)a3 rootViewController:(id)a4
{
  id v7;
  id v8;
  PUPhotoEditPendingEditsRequest *v9;
  uint64_t v10;
  NSArray *adjustments;
  void *v13;
  void *v14;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  if (!objc_msgSend(v7, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPhotoEditPendingEditsRequest.m"), 42, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("adjustments.count"));

  }
  if (!+[PUPhotoEditPendingEditsRequest canPerformEditsWithRootViewController:](PUPhotoEditPendingEditsRequest, "canPerformEditsWithRootViewController:", v8))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPhotoEditPendingEditsRequest.m"), 43, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[PUPhotoEditPendingEditsRequest canPerformEditsWithRootViewController:rootViewController]"));

  }
  v15.receiver = self;
  v15.super_class = (Class)PUPhotoEditPendingEditsRequest;
  v9 = -[PUPhotoEditPendingEditsRequest init](&v15, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(v7, "copy");
    adjustments = v9->_adjustments;
    v9->_adjustments = (NSArray *)v10;

    objc_storeStrong((id *)&v9->_rootViewController, a4);
  }

  return v9;
}

- (void)submitWithCompletionHandler:(id)a3
{
  void (**v4)(id, _QWORD, id);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = (void (**)(id, _QWORD, id))a3;
  if (-[PUPhotoEditPendingEditsRequest state](self, "state"))
  {
    +[PUPhotoEditPendingEditsRequest errorWithCode:debugDescription:](PUPhotoEditPendingEditsRequest, "errorWithCode:debugDescription:", 4, CFSTR("Calling submit while state is not initial"));
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v4[2](v4, 0, v10);

LABEL_5:
    v6 = v10;
    goto LABEL_6;
  }
  -[PUPhotoEditPendingEditsRequest setState:](self, "setState:", 1);
  -[PUPhotoEditPendingEditsRequest setCompletionHandler:](self, "setCompletionHandler:", v4);

  -[PUPhotoEditPendingEditsRequest rootViewController](self, "rootViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "px_descendantViewControllerWithClass:", objc_opt_class());
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v10, "fulfillPendingEditsRequest:", self);
    goto LABEL_5;
  }
  -[PUPhotoEditPendingEditsRequest rootViewController](self, "rootViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "px_descendantViewControllerWithClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "actionsController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "performPendingEditsActionWithRequest:", self);
  }
  else
  {
    +[PUPhotoEditPendingEditsRequest errorWithCode:debugDescription:](PUPhotoEditPendingEditsRequest, "errorWithCode:debugDescription:", 1, CFSTR("Not in 1up"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotoEditPendingEditsRequest finishedWithSuccess:error:](self, "finishedWithSuccess:error:", 0, v9);
  }

  v6 = 0;
LABEL_6:

}

- (void)finishedWithSuccess:(BOOL)a3 error:(id)a4
{
  _BOOL8 v4;
  void *v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  id v8;

  v4 = a3;
  v8 = a4;
  if (-[PUPhotoEditPendingEditsRequest state](self, "state") == 1)
  {
    -[PUPhotoEditPendingEditsRequest setState:](self, "setState:", 2);
    -[PUPhotoEditPendingEditsRequest completionHandler](self, "completionHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[PUPhotoEditPendingEditsRequest completionHandler](self, "completionHandler");
      v7 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, _BOOL8, id))v7)[2](v7, v4, v8);

    }
  }

}

- (NSArray)adjustments
{
  return self->_adjustments;
}

- (UIViewController)rootViewController
{
  return self->_rootViewController;
}

- (void)setRootViewController:(id)a3
{
  objc_storeStrong((id *)&self->_rootViewController, a3);
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_rootViewController, 0);
  objc_storeStrong((id *)&self->_adjustments, 0);
}

+ (BOOL)canPerformEditsWithRootViewController:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "px_descendantViewControllerWithClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(v3, "px_descendantViewControllerWithClass:", objc_opt_class());
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7 != 0;
}

+ (id)errorWithCode:(int64_t)a3 debugDescription:(id)a4
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CB35C8];
  v11 = *MEMORY[0x1E0CB2938];
  v12[0] = a4;
  v6 = (void *)MEMORY[0x1E0C99D80];
  v7 = a4;
  objc_msgSend(v6, "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "errorWithDomain:code:userInfo:", CFSTR("PUPhotoEditPendingEditsRequestErrorDomain"), a3, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
