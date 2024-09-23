@implementation PKApplicationMessageNodeGroupBranch

- (id)_primaryRegistration
{
  uint64_t v1;
  void *v2;
  id *v3;
  id *v4;
  id v5;

  if (!a1)
    return 0;
  objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", 0);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)v1;
  if (v1 && (v3 = (id *)*(id *)(v1 + 40)) != 0)
  {
    v4 = v3;
    v5 = v3[1];

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

uint64_t __53__PKApplicationMessageNodeGroupBranch__sortWithDate___block_invoke(uint64_t a1, id *a2, void *a3)
{
  id *v5;
  id *v6;
  id v7;
  id *v8;
  id *v9;
  id v10;
  uint64_t v11;

  v5 = a3;
  if (a2)
  {
    v6 = (id *)a2[5];
    a2 = v6;
    if (v6)
    {
      v7 = v6[1];
      if (v5)
        goto LABEL_4;
LABEL_8:
      v9 = 0;
      goto LABEL_9;
    }
  }
  v7 = 0;
  if (!v5)
    goto LABEL_8;
LABEL_4:
  v8 = (id *)v5[5];
  v9 = v8;
  if (!v8)
  {
LABEL_9:
    v10 = 0;
    goto LABEL_6;
  }
  v10 = v8[1];
LABEL_6:
  v11 = PKApplicationMessageRegistrationComparison(v7, v10, *(void **)(a1 + 32));

  return v11;
}

- (PKApplicationMessageGroupDescriptor)group
{
  return self->_group;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_children, 0);
}

@end
