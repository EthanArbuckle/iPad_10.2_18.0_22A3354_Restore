@implementation UIEditMenuPageButton

void __55___UIEditMenuPageButton__configureButtonWithGroupName___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;

  v16 = a2;
  objc_msgSend(v16, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "isHighlighted"))
  {
    objc_msgSend(*(id *)(a1 + 32), "menuHighlightBackgroundColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "background");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBackgroundColor:", v4);

    objc_msgSend(*(id *)(a1 + 32), "menuHighlightBackgroundEffect");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "background");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setVisualEffect:", v6);

    objc_msgSend(v3, "background");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = 0;
  }
  else
  {
    +[UIColor clearColor](UIColor, "clearColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "background");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setBackgroundColor:", v11);

    objc_msgSend(*(id *)(a1 + 32), "menuBackgroundEffect");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "background");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setVisualEffect:", v13);

    v15 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v3, "background");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = v15;
  }
  objc_msgSend(v8, "_setVisualEffectGroupName:", v10);

  objc_msgSend(v16, "setConfiguration:", v3);
}

@end
