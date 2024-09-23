@implementation PXPeopleBootstrapFlowController

- (PXPeopleBootstrapFlowController)init
{
  -[PXPeopleBootstrapFlowController doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (void)commonInitWithContext:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_context, a3);
  v5 = a3;
  self->_viewControllerIndex = 0x7FFFFFFFFFFFFFFFLL;
  objc_msgSend(v5, "addObserver:forKeyPath:options:context:", self, CFSTR("nameSelection"), 0, 0);

}

- (PXPeopleBootstrapFlowController)initWithContext:(id)a3
{
  id v4;
  PXPeopleBootstrapFlowController *v5;
  PXPeopleBootstrapFlowController *v6;
  void *v7;
  void (**v8)(void);
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PXPeopleBootstrapFlowController;
  v5 = -[PXPeopleBootstrapFlowController init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    -[PXPeopleBootstrapFlowController commonInitWithContext:](v5, "commonInitWithContext:", v4);
    -[PXPeopleBootstrapFlowController computeViewControllersForBootstrapFlow](v6, "computeViewControllersForBootstrapFlow");
    objc_msgSend(v4, "onInitBlock");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v4, "onInitBlock");
      v8 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v8[2]();

    }
  }

  return v6;
}

- (id)initEmptyFlowWithContext:(id)a3
{
  id v4;
  PXPeopleBootstrapFlowController *v5;
  PXPeopleBootstrapFlowController *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PXPeopleBootstrapFlowController;
  v5 = -[PXPeopleBootstrapFlowController init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[PXPeopleBootstrapFlowController commonInitWithContext:](v5, "commonInitWithContext:", v4);

  return v6;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[PXPeopleBootstrapFlowController context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("nameSelection"));

  v4.receiver = self;
  v4.super_class = (Class)PXPeopleBootstrapFlowController;
  -[PXPeopleBootstrapFlowController dealloc](&v4, sel_dealloc);
}

- (BOOL)shouldPresentNaming
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  char v6;

  -[PXPeopleBootstrapFlowController context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sourcePerson");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "px_localizedName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (v5 && objc_msgSend(v2, "bootstrapType") != 1)
    v6 = 0;
  else
    v6 = objc_msgSend(v2, "wantsNaming");

  return v6;
}

- (BOOL)shouldPresentPostNaming
{
  void *v2;
  char v3;

  -[PXPeopleBootstrapFlowController context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "wantsPostNaming");

  return v3;
}

- (BOOL)hasNextViewController
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  BOOL v7;

  -[PXPeopleBootstrapFlowController viewControllers](self, "viewControllers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  v5 = -[PXPeopleBootstrapFlowController viewControllerIndex](self, "viewControllerIndex");
  v7 = v5 == 0x7FFFFFFFFFFFFFFFLL || v5 < v4 - 1;
  return v4 && v7;
}

- (PXPeopleFlowViewController)nextViewController
{
  unint64_t v3;
  unint64_t v4;
  void *v5;
  void *v6;

  if (-[PXPeopleBootstrapFlowController hasNextViewController](self, "hasNextViewController"))
  {
    v3 = -[PXPeopleBootstrapFlowController viewControllerIndex](self, "viewControllerIndex");
    if (v3 == 0x7FFFFFFFFFFFFFFFLL)
      v4 = 0;
    else
      v4 = v3 + 1;
    -[PXPeopleBootstrapFlowController setViewControllerIndex:](self, "setViewControllerIndex:", v4);
    -[PXPeopleBootstrapFlowController viewControllers](self, "viewControllers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndex:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return (PXPeopleFlowViewController *)v6;
}

- (BOOL)hasPreviousViewController
{
  unint64_t v2;
  BOOL v3;

  v2 = -[PXPeopleBootstrapFlowController viewControllerIndex](self, "viewControllerIndex");
  if (v2)
    v3 = v2 == 0x7FFFFFFFFFFFFFFFLL;
  else
    v3 = 1;
  return !v3;
}

- (PXPeopleFlowViewController)previousViewController
{
  unint64_t v3;
  void *v4;
  void *v5;

  if (-[PXPeopleBootstrapFlowController hasPreviousViewController](self, "hasPreviousViewController"))
  {
    v3 = -[PXPeopleBootstrapFlowController viewControllerIndex](self, "viewControllerIndex") - 1;
    -[PXPeopleBootstrapFlowController setViewControllerIndex:](self, "setViewControllerIndex:", v3);
    -[PXPeopleBootstrapFlowController viewControllers](self, "viewControllers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectAtIndex:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return (PXPeopleFlowViewController *)v5;
}

- (BOOL)wantsCancelButton
{
  unint64_t v3;
  void *v4;
  void *v5;

  v3 = -[PXPeopleBootstrapFlowController viewControllerIndex](self, "viewControllerIndex");
  -[PXPeopleBootstrapFlowController viewControllers](self, "viewControllers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndex:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "wantsCancelButton");
  return (char)v4;
}

- (void)done:(id)a3
{
  PXPeopleConfirmationInfo *v4;
  void *v5;
  void *v6;
  void *v7;
  PXPeopleConfirmationInfo *v8;

  v4 = [PXPeopleConfirmationInfo alloc];
  -[PXPeopleBootstrapFlowController context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PXPeopleConfirmationInfo initWithBootstrapContext:](v4, "initWithBootstrapContext:", v5);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:", CFSTR("PXPeopleConfirmationDidFinish"), v8);

  -[PXPeopleBootstrapFlowController bootstrapDelegate](self, "bootstrapDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bootstrapFlowController:didFinishWithSuccess:", self, 1);

}

- (void)cancel:(id)a3
{
  void *v4;
  void (**v5)(void);
  void *v6;
  id v7;

  -[PXPeopleBootstrapFlowController context](self, "context", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cancelBlock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v7, "cancelBlock");
    v5 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v5[2]();

  }
  -[PXPeopleBootstrapFlowController bootstrapDelegate](self, "bootstrapDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bootstrapFlowController:didFinishWithSuccess:", self, 0);

}

- (BOOL)shouldPresentConfirmationForPerson:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  PXPeopleSuggestionDataSource *v8;
  NSObject *v9;
  BOOL v10;
  PXPeopleSuggestionDataSource *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  int v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PXPeopleBootstrapFlowController context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "wantsMergeCandidateSuggestions") & 1) == 0)
  {
    PLUIGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v21 = 138412290;
      v22 = v5;
      _os_log_impl(&dword_1A6789000, v9, OS_LOG_TYPE_INFO, "People UI: Not creating bootstrap confirmation view controller; context doesn't want candidate suggestions for context: %@",
        (uint8_t *)&v21,
        0xCu);
    }

    +[PXPeopleUtilities shouldShowBootstrapForPerson:context:](PXPeopleUtilities, "shouldShowBootstrapForPerson:context:", v4, v5);
    goto LABEL_8;
  }
  if (!+[PXPeopleUtilities shouldShowBootstrapForPerson:context:](PXPeopleUtilities, "shouldShowBootstrapForPerson:context:", v4, v5))
  {
LABEL_8:
    v10 = 0;
    goto LABEL_15;
  }
  objc_msgSend(v5, "prefetchedDataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    v8 = v6;
  else
    v8 = -[PXPeopleSuggestionDataSource initWithFlowType:]([PXPeopleSuggestionDataSource alloc], "initWithFlowType:", 1);
  v11 = v8;

  v12 = (void *)MEMORY[0x1E0C99DE8];
  -[PXPeopleSuggestionDataSource fetchAndCacheMergeCandidatesForPerson:](v11, "fetchAndCacheMergeCandidatesForPerson:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "fetchedObjects");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "arrayWithArray:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "nameSelection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "person");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "removeObject:", v17);
  v18 = objc_msgSend(v15, "count");
  v10 = v18 != 0;
  if (!v18)
  {
    PLUIGetLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      v21 = 138412290;
      v22 = v5;
      _os_log_impl(&dword_1A6789000, v19, OS_LOG_TYPE_INFO, "People UI: Not creating bootstrap confirmation view controller; no merge candidates for context: %@",
        (uint8_t *)&v21,
        0xCu);
    }

  }
LABEL_15:

  return v10;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v7;

  v7 = a3;
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("nameSelection")))
    -[PXPeopleBootstrapFlowController recomputeViewControllersForChangeInKeyPath:](self, "recomputeViewControllersForChangeInKeyPath:", v7);

}

- (PXPeopleBootstrapFlowDelegate)bootstrapDelegate
{
  return self->_bootstrapDelegate;
}

- (void)setBootstrapDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_bootstrapDelegate, a3);
}

- (PXPeopleSuggestionManagerDataSource)bootstrapDataSource
{
  return self->_bootstrapDataSource;
}

- (void)setBootstrapDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_bootstrapDataSource, a3);
}

- (PXPeopleBootstrapContext)context
{
  return self->_context;
}

- (unint64_t)namingResultType
{
  return self->_namingResultType;
}

- (void)setNamingResultType:(unint64_t)a3
{
  self->_namingResultType = a3;
}

- (NSArray)viewControllers
{
  return self->_viewControllers;
}

- (void)setViewControllers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (unint64_t)viewControllerIndex
{
  return self->_viewControllerIndex;
}

- (void)setViewControllerIndex:(unint64_t)a3
{
  self->_viewControllerIndex = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewControllers, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_bootstrapDataSource, 0);
  objc_storeStrong((id *)&self->_bootstrapDelegate, 0);
}

@end
