@implementation UICollectionViewListLayoutSection

void __94___UICollectionViewListLayoutSection__hasHeaderFooterBelowLastItemInSection_interactionState___block_invoke(_QWORD *a1, void *a2, double a3, uint64_t a4, uint64_t a5, _BYTE *a6)
{
  id v11;
  double v12;
  void *v13;
  void *v14;
  id *v15;

  if (a2)
  {
    if (a6)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a1[6], a1[4], CFSTR("_UICollectionViewListLayoutSection.m"), 1296, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("section != nil"));

    if (a6)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a1[6], a1[4], CFSTR("_UICollectionViewListLayoutSection.m"), 1297, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("stop != nil"));

LABEL_3:
  if (a3 > 0.0)
  {
    *a6 = 1;
    return;
  }
  v15 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = v15[33];
    if (objc_msgSend(v11, "_hasHeaderOrFirstItemStyledAsHeader"))
    {
      objc_msgSend(v15, "_paddingToBoundarySupplementaries");
    }
    else
    {
      if (a5 > 0)
        goto LABEL_11;
      if (!objc_msgSend(v11, "_hasFooter"))
        goto LABEL_12;
      objc_msgSend(v15, "contentInsets");
    }
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = v12 == 0.0;
LABEL_11:
    *a6 = 1;
LABEL_12:

    goto LABEL_13;
  }
  *a6 = 1;
LABEL_13:

}

@end
