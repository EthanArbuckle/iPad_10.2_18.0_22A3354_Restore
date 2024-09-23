@implementation CACElementActionsPresentationManager

+ (BOOL)canShowElementActionsForElement:(id)a3
{
  return +[CACElementActionsPresentationViewController canShowElementActionsForElement:](CACElementActionsPresentationViewController, "canShowElementActionsForElement:", a3);
}

- (void)showElementActionsForElement:(id)a3 usingPortraitUpRect:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  _QWORD v17[5];

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __89__CACElementActionsPresentationManager_showElementActionsForElement_usingPortraitUpRect___block_invoke;
  v17[3] = &unk_24F2ABD68;
  v17[4] = self;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __89__CACElementActionsPresentationManager_showElementActionsForElement_usingPortraitUpRect___block_invoke_2;
  v11[3] = &unk_24F2ABD90;
  v12 = v9;
  v13 = x;
  v14 = y;
  v15 = width;
  v16 = height;
  v10 = v9;
  -[CACSimpleContentViewManager showViewControllerWithCreationHandler:updateHandler:](self, "showViewControllerWithCreationHandler:updateHandler:", v17, v11);

}

CACElementActionsPresentationViewController *__89__CACElementActionsPresentationManager_showElementActionsForElement_usingPortraitUpRect___block_invoke(uint64_t a1)
{
  CACElementActionsPresentationViewController *v2;

  v2 = objc_alloc_init(CACElementActionsPresentationViewController);
  -[CACElementActionsPresentationViewController setElementActionsDelegate:](v2, "setElementActionsDelegate:", *(_QWORD *)(a1 + 32));
  return v2;
}

void __89__CACElementActionsPresentationManager_showElementActionsForElement_usingPortraitUpRect___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setElement:", v3);
  objc_msgSend(v4, "setSourceRect:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));

}

- (BOOL)isOverlay
{
  return 0;
}

- (void)elementActionsPresentationViewController:(id)a3 hideWithCompletion:(id)a4
{
  -[CACSimpleContentViewManager hideAnimated:completion:](self, "hideAnimated:completion:", 1, a4);
}

@end
