@implementation SBApplicationDropSessionGetDragItem

uint64_t __SBApplicationDropSessionGetDragItem_block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "itemProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "sbui_isIgnored") ^ 1;

  return v3;
}

uint64_t __SBApplicationDropSessionGetDragItem_block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "itemProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "canLoadObjectOfClass:", objc_opt_class());

  return v3;
}

@end
