@implementation UIDocumentPickerRemoteViewController

void __63___UIDocumentPickerRemoteViewController__didSelectURLBookmark___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  _BYTE v11[24];
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    _UIDocumentLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8 = (void *)objc_opt_class();
      v9 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)v11 = 138412802;
      *(_QWORD *)&v11[4] = v8;
      *(_WORD *)&v11[12] = 2112;
      *(_QWORD *)&v11[14] = v9;
      *(_WORD *)&v11[22] = 2112;
      v12 = a3;
      v10 = v8;
      _os_log_error_impl(&dword_185066000, v6, OS_LOG_TYPE_ERROR, "%@: Error while resolving selected bookmark %@: %@", v11, 0x20u);

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "publicController", *(_OWORD *)v11, *(_QWORD *)&v11[16], v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_didSelectURL:", a2);

}

@end
