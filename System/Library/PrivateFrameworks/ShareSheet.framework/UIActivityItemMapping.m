@implementation UIActivityItemMapping

void __62___UIActivityItemMapping__addToActiveActivityViewControllers___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 5, 1);
  v1 = (void *)_activeActivityViewControllers;
  _activeActivityViewControllers = v0;

}

void __97___UIActivityItemMapping__itemProviderForActivityItem_typeIdentifier_thumbnailSize_activityType___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void (**v6)(id, id, _QWORD);
  void *v7;
  id v8;

  v3 = (void *)a1[7];
  v4 = (void *)a1[4];
  v5 = a1[5];
  v6 = a2;
  objc_msgSend(v3, "_activityViewControllerForActivityItem:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activityViewController:itemForActivityType:", v7, a1[6]);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v6[2](v6, v8, 0);
}

uint64_t __97___UIActivityItemMapping__itemProviderForActivityItem_typeIdentifier_thumbnailSize_activityType___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(a2 + 16))(a2, *(_QWORD *)(a1 + 32), 0);
}

void __97___UIActivityItemMapping__itemProviderForActivityItem_typeIdentifier_thumbnailSize_activityType___block_invoke_3(double *a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  double v4;
  double v5;
  void (**v6)(id, id, _QWORD);
  id v7;

  v2 = *((_QWORD *)a1 + 4);
  v3 = *((_QWORD *)a1 + 5);
  v4 = a1[6];
  v5 = a1[7];
  v6 = a2;
  +[_UIActivityItemMapping _thumbnailImageForActivityItem:thumbnailSize:activityType:](_UIActivityItemMapping, "_thumbnailImageForActivityItem:thumbnailSize:activityType:", v2, v3, v4, v5);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6[2](v6, v7, 0);

}

@end
