@implementation PKSortedPaymentApplicationsByAID

uint64_t __PKSortedPaymentApplicationsByAID_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  int v15;
  uint64_t v16;
  BOOL v17;
  uint64_t v18;
  id v19;
  id v20;
  void *v21;
  int v22;
  uint64_t v23;
  BOOL v25;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "applicationIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "applicationIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applicationIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "caseInsensitiveCompare:", v9);
  if (!v10)
  {
    if ((objc_msgSend(v5, "supportsComboCard") & 1) == 0 && !objc_msgSend(v6, "supportsComboCard"))
    {
      v23 = 0;
      goto LABEL_24;
    }
    v16 = objc_msgSend(v5, "paymentType");
    v17 = v16 == objc_msgSend(v5, "auxiliaryPaymentType");
    goto LABEL_12;
  }
  v11 = v10;
  v12 = v8;
  v13 = v7;
  v14 = v13;
  if (v12 == v13)
  {

LABEL_11:
    v17 = *(_BYTE *)(a1 + 40) == 0;
LABEL_12:
    v18 = 1;
    goto LABEL_21;
  }
  if (!v13 || !v12)
  {

    goto LABEL_14;
  }
  v15 = objc_msgSend(v12, "isEqualToString:", v13);

  if (v15)
    goto LABEL_11;
LABEL_14:
  v19 = v9;
  v20 = v14;
  v21 = v20;
  if (v19 == v20)
  {

LABEL_20:
    v17 = *(_BYTE *)(a1 + 40) == 0;
    v18 = -1;
LABEL_21:
    if (v17)
      v23 = v18;
    else
      v23 = -v18;
    goto LABEL_24;
  }
  if (v14 && v19)
  {
    v22 = objc_msgSend(v19, "isEqualToString:", v20);

    if (!v22)
      goto LABEL_27;
    goto LABEL_20;
  }

LABEL_27:
  if (v11 != -1 || *(_BYTE *)(a1 + 40))
  {
    if (*(_BYTE *)(a1 + 40))
      v25 = 0;
    else
      v25 = v11 == 1;
    if (v25)
      v23 = -1;
    else
      v23 = v11;
  }
  else
  {
    v23 = 1;
  }
LABEL_24:

  return v23;
}

@end
