@implementation UIButtonBarItemGroupLayout

uint64_t __70___UIButtonBarItemGroupLayout__addConstraintsToActivate_toDeactivate___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "addConstraintsToActivate:toDeactivate:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __48___UIButtonBarItemGroupLayout__addLayoutGuides___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "addLayoutGuides:", *(_QWORD *)(a1 + 32));
}

uint64_t __47___UIButtonBarItemGroupLayout__addLayoutViews___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "addLayoutViews:", *(_QWORD *)(a1 + 32));
}

void __72___UIButtonBarItemGroupLayout_initWithLayoutMetrics_barButtonItemGroup___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "widthAnchor");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setGroupSizeGuide:", v4);

}

@end
