@implementation PXPhotoStreamComposeServiceViewController

+ (void)initialize
{
  Class v3;

  v3 = NSClassFromString(CFSTR("PUPhotoStreamComposeServiceViewController"));
  if (v3)
    objc_msgSend(a1, "registerCanonicalClass:", v3);
}

+ (void)registerCanonicalClass:(Class)a3
{
  _canonicalClass = (uint64_t)a3;
}

+ (id)createCanonicalInstance
{
  return objc_alloc_init((Class)_canonicalClass);
}

- (void)setAssetsToShare:(id)a3
{
  id v5;
  void *v6;
  objc_class *v7;
  void *v8;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoStreamComposeServiceViewController.m"), 34, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXPhotoStreamComposeServiceViewController setAssetsToShare:]", v8);

  abort();
}

- (void)setSourcesToShare:(id)a3
{
  id v5;
  void *v6;
  objc_class *v7;
  void *v8;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoStreamComposeServiceViewController.m"), 38, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXPhotoStreamComposeServiceViewController setSourcesToShare:]", v8);

  abort();
}

- (PXPhotoStreamComposeServiceDelegate)delegate
{
  return (PXPhotoStreamComposeServiceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)shouldAllowAlbumPicking
{
  return self->_shouldAllowAlbumPicking;
}

- (void)setShouldAllowAlbumPicking:(BOOL)a3
{
  self->_shouldAllowAlbumPicking = a3;
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1176);
}

- (BOOL)addToExistingWorkflow
{
  return self->_addToExistingWorkflow;
}

- (void)setAddToExistingWorkflow:(BOOL)a3
{
  self->_addToExistingWorkflow = a3;
}

- (NSString)albumTitle
{
  return self->_albumTitle;
}

- (void)setAlbumTitle:(id)a3
{
  objc_storeStrong((id *)&self->_albumTitle, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_albumTitle, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
