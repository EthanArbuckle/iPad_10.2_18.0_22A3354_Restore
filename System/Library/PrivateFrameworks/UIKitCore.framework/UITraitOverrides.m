@implementation UITraitOverrides

id __62___UITraitOverrides__traitOverridesWillChange_withApplicator___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t *v4;
  void **v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void **v9;
  uint64_t v10;
  void *v11;

  v3 = a2;
  v4 = (uint64_t *)a1[5];
  v5 = (void **)v4[5];
  if ((void **)a1[4] == v5)
  {
    (*(void (**)(void))(a1[6] + 16))();
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (v5)
  {
    -[_UITraitOverrides _traitCollectionByApplyingOverridesToTraitCollection:](v5, v3);
    v6 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v7 = (void *)v6;

    v4 = (uint64_t *)a1[5];
    goto LABEL_7;
  }
  v7 = v3;
LABEL_7:
  -[UITraitCollection _traitCollectionByApplyingOverrides:defaultValueOverrides:](v7, v4[1], v4[2]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = *(void ***)(a1[5] + 48);
  if ((void **)a1[4] == v9)
  {
    (*(void (**)(void))(a1[6] + 16))();
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  if (v9)
  {
    -[_UITraitOverrides _traitCollectionByApplyingOverridesToTraitCollection:](v9, v8);
    v10 = objc_claimAutoreleasedReturnValue();
LABEL_11:
    v11 = (void *)v10;

    v8 = v11;
  }

  return v8;
}

id __71___UITraitOverrides__setOverrideTraitCollection_defaultValueOverrides___block_invoke(uint64_t a1, void *a2)
{
  return -[_UITraitOverrides _traitCollectionByApplyingAllOverridesToTraitCollection:withOverrides:defaultValueOverrides:](*(_QWORD *)(a1 + 32), a2, *(void **)(a1 + 40), *(void **)(a1 + 48));
}

uint64_t __54___UITraitOverrides__rawOverridesDescriptionMatching___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "lowercaseString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsString:", *(_QWORD *)(a1 + 32));

  return v4;
}

@end
