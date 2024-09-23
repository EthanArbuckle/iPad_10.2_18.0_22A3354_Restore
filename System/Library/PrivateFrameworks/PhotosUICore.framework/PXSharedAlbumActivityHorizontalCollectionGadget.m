@implementation PXSharedAlbumActivityHorizontalCollectionGadget

void __105___PXSharedAlbumActivityHorizontalCollectionGadget_gadgetControllerFinishedUpdatingDataSourceWithChange___block_invoke(_QWORD *a1, unint64_t a2, _BYTE *a3)
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  _QWORD v11[4];

  if (a2 && a1[6] > a2)
  {
    v6 = (void *)a1[4];
    v11[0] = objc_msgSend(v6, "identifier");
    v11[1] = 0;
    v11[2] = a2;
    v11[3] = 0x7FFFFFFFFFFFFFFFLL;
    objc_msgSend(v6, "gadgetAtIndexPath:", v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)a1[4];
    v10[0] = objc_msgSend(v8, "identifier");
    v10[1] = 0;
    v10[2] = a2 - 1;
    v10[3] = 0x7FFFFFFFFFFFFFFFLL;
    objc_msgSend(v8, "gadgetAtIndexPath:", v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "gadgetType") == 4 && objc_msgSend(v9, "gadgetType") == 3)
    {
      *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = a2;
      *a3 = 1;
    }

  }
}

@end
