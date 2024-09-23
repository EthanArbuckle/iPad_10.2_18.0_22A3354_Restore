@implementation UIBarCustomizationItem

void __51___UIBarCustomizationItem__sourceFrameInContainer___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void (**v5)(_QWORD, _QWORD);
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  id v20;
  CGRect v21;

  v20 = a2;
  objc_msgSend(v20, "sourceViewProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = v20;
  if (v3)
  {
    objc_msgSend(v20, "sourceViewProvider");
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v5)[2](v5, v20);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "window");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void *)v7;
      objc_msgSend(v6, "superview");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[_UIBarCustomizationCustomViewPortalSourceContainer sharedContainer](_UIBarCustomizationCustomViewPortalSourceContainer, "sharedContainer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9 != v10)
      {
        objc_msgSend(v6, "superview");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "frame");
        objc_msgSend(v11, "convertRect:toView:", *(_QWORD *)(a1 + 32));
        v13 = v12;
        v15 = v14;
        v17 = v16;
        v19 = v18;

        v21.origin.x = v13;
        v21.origin.y = v15;
        v21.size.width = v17;
        v21.size.height = v19;
        *(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32) = CGRectUnion(*(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 40)+ 8)+ 32), v21);
      }
    }

    v4 = v20;
  }

}

uint64_t __55___UIBarCustomizationItem__enumerateSubitemsWithBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
