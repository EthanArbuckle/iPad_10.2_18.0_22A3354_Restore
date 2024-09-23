@implementation UITextInteractableItemCache

uint64_t __56___UITextInteractableItemCache_itemForAttachment_range___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  BOOL v9;
  uint64_t v10;
  id v11;
  int v12;
  void *v13;
  void *v14;
  id v15;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "attachment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  v7 = v5;
  v8 = v7;
  if (v6 == v7)
  {

LABEL_10:
    v13 = *(void **)(a1 + 40);
    objc_msgSend(v3, "range");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v13;
    v15 = v14;
    v6 = v15;
    if (v11 == v15)
    {
      v10 = 1;
    }
    else
    {
      v10 = 0;
      if (v11 && v15)
        v10 = objc_msgSend(v11, "isEqual:", v15);
    }

    goto LABEL_16;
  }
  if (v6)
    v9 = v7 == 0;
  else
    v9 = 1;
  if (!v9)
  {
    v12 = objc_msgSend(v6, "isEqual:", v7);

    if (!v12)
    {
      v10 = 0;
      goto LABEL_17;
    }
    goto LABEL_10;
  }
  v10 = 0;
  v11 = v7;
LABEL_16:

LABEL_17:
  return v10;
}

uint64_t __50___UITextInteractableItemCache_itemForLink_range___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  BOOL v9;
  uint64_t v10;
  id v11;
  int v12;
  void *v13;
  void *v14;
  id v15;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "link");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  v7 = v5;
  v8 = v7;
  if (v6 == v7)
  {

LABEL_10:
    v13 = *(void **)(a1 + 40);
    objc_msgSend(v3, "range");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v13;
    v15 = v14;
    v6 = v15;
    if (v11 == v15)
    {
      v10 = 1;
    }
    else
    {
      v10 = 0;
      if (v11 && v15)
        v10 = objc_msgSend(v11, "isEqual:", v15);
    }

    goto LABEL_16;
  }
  if (v6)
    v9 = v7 == 0;
  else
    v9 = 1;
  if (!v9)
  {
    v12 = objc_msgSend(v6, "isEqual:", v7);

    if (!v12)
    {
      v10 = 0;
      goto LABEL_17;
    }
    goto LABEL_10;
  }
  v10 = 0;
  v11 = v7;
LABEL_16:

LABEL_17:
  return v10;
}

uint64_t __49___UITextInteractableItemCache_itemForTag_range___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  BOOL v9;
  uint64_t v10;
  id v11;
  int v12;
  void *v13;
  void *v14;
  id v15;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "tag");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  v7 = v5;
  v8 = v7;
  if (v6 == v7)
  {

LABEL_10:
    v13 = *(void **)(a1 + 40);
    objc_msgSend(v3, "range");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v13;
    v15 = v14;
    v6 = v15;
    if (v11 == v15)
    {
      v10 = 1;
    }
    else
    {
      v10 = 0;
      if (v11 && v15)
        v10 = objc_msgSend(v11, "isEqual:", v15);
    }

    goto LABEL_16;
  }
  if (v6)
    v9 = v7 == 0;
  else
    v9 = 1;
  if (!v9)
  {
    v12 = objc_msgSend(v6, "isEqual:", v7);

    if (!v12)
    {
      v10 = 0;
      goto LABEL_17;
    }
    goto LABEL_10;
  }
  v10 = 0;
  v11 = v7;
LABEL_16:

LABEL_17:
  return v10;
}

uint64_t __59___UITextInteractableItemCache__cachedItemInSet_predicate___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  *a3 = result;
  return result;
}

@end
