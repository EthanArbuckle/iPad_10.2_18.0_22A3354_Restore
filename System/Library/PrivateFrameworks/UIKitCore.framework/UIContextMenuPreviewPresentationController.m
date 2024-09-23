@implementation UIContextMenuPreviewPresentationController

void __83___UIContextMenuPreviewPresentationController__traitCollectionForChildEnvironment___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void (**v5)(_QWORD);
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void (**v16)(void);

  v16 = a2;
  v5 = a3;
  if (*(_QWORD *)(a1 + 32))
  {
    v16[2]();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "horizontalSizeClass");
    v8 = *(_QWORD *)(a1 + 32);

    if (v7 != v8)
    {
      v9 = *(_QWORD *)(a1 + 32);
      v5[2](v5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setHorizontalSizeClass:", v9);

    }
  }
  if (*(_QWORD *)(a1 + 40))
  {
    v16[2]();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "verticalSizeClass");
    v13 = *(_QWORD *)(a1 + 40);

    if (v12 != v13)
    {
      v14 = *(_QWORD *)(a1 + 40);
      v5[2](v5);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setVerticalSizeClass:", v14);

    }
  }

}

@end
