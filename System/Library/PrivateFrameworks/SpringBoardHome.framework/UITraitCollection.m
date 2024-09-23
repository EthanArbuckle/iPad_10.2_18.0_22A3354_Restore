@implementation UITraitCollection

void __75__UITraitCollection_SpringBoardHome__sbh_traitCollectionWithIconTintColor___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  objc_opt_self();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forTrait:", v2, v4);

}

void __81__UITraitCollection_SpringBoardHome__sbh_traitCollectionWithIconImageAppearance___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;

  v6 = a2;
  v3 = *(_QWORD *)(a1 + 32);
  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forTrait:", v3, v4);

  v5 = objc_msgSend(*(id *)(a1 + 40), "sbh_userInterfaceStyleForIconImageAppearance:", *(_QWORD *)(a1 + 32));
  if (v5)
    objc_msgSend(v6, "setUserInterfaceStyle:", v5);

}

void __89__UITraitCollection_SpringBoardHome__sbh_traitCollectionWithIconImageStyleConfiguration___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  objc_opt_self();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forTrait:", v2, v4);

}

void __108__UITraitCollection_SpringBoardHome__sbh_traitCollectionWithIconImageStyleConfiguration_userInterfaceStyle___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  v3 = objc_msgSend(*(id *)(a1 + 32), "configurationType");
  v4 = *(_QWORD *)(a1 + 32);
  objc_opt_self();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forTrait:", v4, v5);

  if ((unint64_t)(v3 - 1) < 2)
  {
    v6 = 1;
    goto LABEL_7;
  }
  if ((unint64_t)(v3 - 3) < 2)
  {
    v6 = 2;
LABEL_7:
    objc_msgSend(v8, "setUserInterfaceStyle:", v6);
    v7 = v8;
    goto LABEL_8;
  }
  v7 = v8;
  if (!v3)
  {
    v6 = *(_QWORD *)(a1 + 40);
    goto LABEL_7;
  }
LABEL_8:

}

void __90__UITraitCollection_SpringBoardHome__sbh_traitCollectionWithHomeScreenStyleConfiguration___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  unint64_t v5;
  id v6;

  v6 = a2;
  v3 = *(_QWORD *)(a1 + 32);
  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forTrait:", v3, v4);

  v5 = objc_msgSend(*(id *)(a1 + 32), "configurationType");
  if (v5 <= 4)
    objc_msgSend(v6, "setUserInterfaceStyle:", qword_1D0191008[v5]);

}

@end
