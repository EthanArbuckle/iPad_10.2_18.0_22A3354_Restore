@implementation UIContextMenuDismissToWindowSceneActivationAnimation

uint64_t __86___UIContextMenuDismissToWindowSceneActivationAnimation_animateAlongsideScenePlatter___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
  return objc_msgSend(*(id *)(a1 + 32), "setHidesCollapsedSourceView:", 0);
}

uint64_t __86___UIContextMenuDismissToWindowSceneActivationAnimation_animateAlongsideScenePlatter___block_invoke_2(uint64_t a1)
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v6;
  void *v7;
  CGAffineTransform v9;
  CGAffineTransform v10;
  CGRect v11;
  CGRect v12;

  objc_msgSend(*(id *)(a1 + 32), "bounds");
  x = v11.origin.x;
  y = v11.origin.y;
  width = v11.size.width;
  height = v11.size.height;
  v6 = fmin(CGRectGetHeight(v11), 110.0);
  v12.origin.x = x;
  v12.origin.y = y;
  v12.size.width = width;
  v12.size.height = height;
  objc_msgSend(*(id *)(a1 + 32), "setBounds:", 0.0, 0.0, CGRectGetWidth(v12), v6);
  CGAffineTransformMakeScale(&v10, 0.2, 0.2);
  v7 = *(void **)(a1 + 32);
  v9 = v10;
  objc_msgSend(v7, "setTransform:", &v9);
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

@end
