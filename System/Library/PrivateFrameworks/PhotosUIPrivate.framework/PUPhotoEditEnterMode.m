@implementation PUPhotoEditEnterMode

void __PUPhotoEditEnterMode_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "px_descendantViewControllerWithClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v2;
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void PUPhotoEditEnterMode(PUOneUpViewController *__strong, __strong dispatch_block_t)_block_invoke");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("PUPhotoEditAutomation.m"), 174, CFSTR("Expected a PUPhotoEditViewController to be available now. ppt_presentPhotoEditor could be presenting edit asynchronously now."));

    v2 = 0;
  }
  objc_msgSend(v2, "ppt_setEditIsReadyNotificationBlock:", *(_QWORD *)(a1 + 40));

}

@end
