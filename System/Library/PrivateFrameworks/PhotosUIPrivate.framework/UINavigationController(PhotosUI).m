@implementation UINavigationController(PhotosUI)

- (BOOL)pu_popToViewControllerIfAllowed:()PhotosUI animated:forced:
{
  id v8;
  void *v9;
  char v10;
  id v11;
  _BOOL8 v12;
  NSObject *v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  _BYTE *v18;
  char v19;
  _BYTE buf[24];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  objc_msgSend(a1, "viewControllers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "containsObject:", v8);

  if ((v10 & 1) != 0)
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    LOBYTE(v21) = 1;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __84__UINavigationController_PhotosUI__pu_popToViewControllerIfAllowed_animated_forced___block_invoke;
    v16[3] = &unk_1E58AB9B8;
    v19 = a5;
    v18 = buf;
    v11 = v8;
    v17 = v11;
    objc_msgSend(a1, "pl_visitControllerHierarchyWithBlock:", v16);
    v12 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24) != 0;
    if (*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
      objc_msgSend(a1, "pu_popToViewController:animated:interactive:", v11, a4, 0);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    PLUIGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(a1, "viewControllers");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v8;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = a1;
      *(_WORD *)&buf[22] = 2112;
      v21 = v14;
      _os_log_impl(&dword_1AAB61000, v13, OS_LOG_TYPE_ERROR, "Trying to pop to a view controller %@ that isn't in the view controllers of %@: %@", buf, 0x20u);

    }
    v12 = 0;
  }

  return v12;
}

@end
