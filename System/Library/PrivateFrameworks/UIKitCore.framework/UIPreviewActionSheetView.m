@implementation UIPreviewActionSheetView

void __48___UIPreviewActionSheetView__setupViewHierarchy__block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "_performActionForPreviewAction:interfaceAction:", *(_QWORD *)(a1 + 32), v4);

}

@end
