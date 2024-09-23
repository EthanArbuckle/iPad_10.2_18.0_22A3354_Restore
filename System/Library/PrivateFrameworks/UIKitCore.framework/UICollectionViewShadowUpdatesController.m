@implementation UICollectionViewShadowUpdatesController

void __91___UICollectionViewShadowUpdatesController__findShadowUpdateForIdentifier_inShadowUpdates___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  void *v8;
  id v9;
  int v10;
  id v11;

  v7 = a2;
  v11 = v7;
  if (v7)
    v8 = (void *)*((_QWORD *)v7 + 11);
  else
    v8 = 0;
  v9 = v8;
  v10 = objc_msgSend(v9, "isEqual:", *(_QWORD *)(a1 + 32));

  if (v10)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

void __85___UICollectionViewShadowUpdatesController__findInsertShadowUpdateForFinalIndexPath___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD *v12;

  v12 = a2;
  if (!objc_msgSend(v12, "updateAction"))
  {
    objc_msgSend(*(id *)(a1 + 32), "updateMap");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionViewUpdateItem _indexPath](v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      v9 = (void *)v12[11];
    else
      v9 = 0;
    v10 = v9;
    objc_msgSend(v7, "finalIndexPathForIndexPath:startingAtUpdateWithIdentifier:", v8, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v11, "isEqual:", *(_QWORD *)(a1 + 40)))
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
      *a4 = 1;
    }

  }
}

@end
