@implementation PXCPLViewItemsFailingToUploadActionPerformer

- (void)performUserInteractionTask
{
  objc_class *v2;
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  __int128 v7;
  void (*v8)(uint64_t, int, void *);
  void *v9;
  __CFString *v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  PLUserStatusUIGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(v7) = 138543362;
    *(_QWORD *)((char *)&v7 + 4) = CFSTR("FailedToUploadItemsAlbum");
    _os_log_impl(&dword_1A6789000, v4, OS_LOG_TYPE_DEFAULT, "Will navigate to: %{public}@", (uint8_t *)&v7, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)&v7 = MEMORY[0x1E0C809B0];
  *((_QWORD *)&v7 + 1) = 3221225472;
  v8 = ___NavigateToCollection_block_invoke;
  v9 = &unk_1E5147B40;
  v10 = CFSTR("FailedToUploadItemsAlbum");
  v11 = v3;
  v6 = v3;
  objc_msgSend(v5, "px_navigateToCollectionSubtype:completionHandler:", 216, &v7);

}

@end
