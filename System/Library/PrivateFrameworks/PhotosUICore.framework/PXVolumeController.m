@implementation PXVolumeController

- (PXVolumeController)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXVolumeController.m"), 21, CFSTR("%s is not available as initializer"), "-[PXVolumeController init]");

  abort();
}

- (PXVolumeController)initWithIsInSilentMode:(BOOL)a3
{
  PXVolumeController *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXVolumeController;
  result = -[PXVolumeController init](&v5, sel_init);
  if (result)
    result->_isInSilentMode = a3;
  return result;
}

- (void)performChanges:(id)a3
{
  id v5;
  void *v6;
  objc_super v7;

  v5 = a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXVolumeController.m"), 33, CFSTR("%s must be called on the main thread"), "-[PXVolumeController performChanges:]");

  }
  v7.receiver = self;
  v7.super_class = (Class)PXVolumeController;
  -[PXVolumeController performChanges:](&v7, sel_performChanges_, v5);

}

- (void)setIsInSilentMode:(BOOL)a3
{
  if (self->_isInSilentMode != a3)
  {
    self->_isInSilentMode = a3;
    -[PXVolumeController signalChange:](self, "signalChange:", 1);
  }
}

- (void)increaseVolume
{
  -[PXVolumeController signalChange:](self, "signalChange:", 2);
}

- (void)decreaseVolume
{
  -[PXVolumeController signalChange:](self, "signalChange:", 4);
}

- (BOOL)isInSilentMode
{
  return self->_isInSilentMode;
}

@end
