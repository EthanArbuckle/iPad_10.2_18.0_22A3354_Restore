@implementation PKPaymentApplicationsArrayMatch

void __PKPaymentApplicationsArrayMatch_block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  id v21;

  v21 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsIndex:", a3) & 1) == 0)
  {
    v7 = *(id *)(a1 + 40);
    v8 = v21;
    objc_msgSend(v7, "applicationIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "applicationIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = v9;
    v12 = v10;
    if (v11 == v12)
    {

    }
    else
    {
      v13 = v12;
      if (!v11 || !v12)
      {

LABEL_12:
        goto LABEL_15;
      }
      v14 = objc_msgSend(v11, "isEqualToString:", v12);

      if ((v14 & 1) == 0)
        goto LABEL_12;
    }
    objc_msgSend(v7, "subcredentials");
    v15 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "subcredentials");
    v16 = objc_claimAutoreleasedReturnValue();
    if (v15 | v16)
    {
      v17 = (void *)v16;
      objc_msgSend((id)v15, "pk_setByApplyingBlock:", &__block_literal_global_487);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "pk_setByApplyingBlock:", &__block_literal_global_488);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v18, "isEqualToSet:", v19);

      if (!v20)
        goto LABEL_15;
    }
    else
    {

    }
    objc_msgSend(*(id *)(a1 + 32), "addIndex:", a3);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    *a4 = 1;
  }
LABEL_15:

}

@end
