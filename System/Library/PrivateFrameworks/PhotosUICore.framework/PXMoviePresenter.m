@implementation PXMoviePresenter

- (PXMoviePresenter)initWithPresentingViewController:(id)a3
{
  id v4;
  PXMoviePresenter *v5;
  PXMoviePresenter *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PXMoviePresenter;
  v5 = -[PXMoviePresenter init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_presentingViewController, v4);

  return v6;
}

- (PXMoviePresenter)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXMoviePresenter.m"), 35, CFSTR("%s is not available as initializer"), "-[PXMoviePresenter init]");

  abort();
}

- (BOOL)presentMovieViewControllerForAssetCollection:(id)a3 keyAssetFetchResult:(id)a4 preferredTransitionType:(int64_t)a5
{
  return -[PXMoviePresenter presentMovieViewControllerForAssetCollection:keyAssetFetchResult:referencePersons:preferredTransitionType:](self, "presentMovieViewControllerForAssetCollection:keyAssetFetchResult:referencePersons:preferredTransitionType:", a3, a4, 0, a5);
}

- (BOOL)presentMovieViewControllerForAssetCollection:(id)a3 keyAssetFetchResult:(id)a4 referencePersons:(id)a5 preferredTransitionType:(int64_t)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  objc_class *v14;
  void *v15;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (objc_class *)objc_opt_class();
  NSStringFromClass(v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXMoviePresenter.m"), 43, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXMoviePresenter presentMovieViewControllerForAssetCollection:keyAssetFetchResult:referencePersons:preferredTransitionType:]", v15);

  abort();
}

- (UIViewController)presentingViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_presentingViewController);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presentingViewController);
}

+ (id)moviePresenterWithPresentingViewController:(id)a3
{
  id v3;
  PXStoryMoviePresenter *v4;

  v3 = a3;
  v4 = -[PXMoviePresenter initWithPresentingViewController:]([PXStoryMoviePresenter alloc], "initWithPresentingViewController:", v3);

  return v4;
}

@end
