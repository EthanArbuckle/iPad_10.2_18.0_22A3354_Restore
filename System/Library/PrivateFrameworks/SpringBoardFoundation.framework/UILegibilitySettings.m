@implementation UILegibilitySettings

void __76___UILegibilitySettings_SpringBoard__descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "primaryColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v2, "appendObject:withName:", v3, CFSTR("primaryColor"));

  v5 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "secondaryColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v5, "appendObject:withName:", v6, CFSTR("secondaryColor"));

  v8 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "shadowColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v8, "appendObject:withName:", v9, CFSTR("shadowColor"));

  v11 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "contentColor");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v11, "appendObject:withName:", v13, CFSTR("contentColor"));

}

@end
