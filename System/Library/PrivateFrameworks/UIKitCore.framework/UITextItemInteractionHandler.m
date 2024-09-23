@implementation UITextItemInteractionHandler

id __57___UITextItemInteractionHandler_contextMenuConfiguration__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "menu");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = *(void **)(a1 + 40);
  v4 = v2;

  return v4;
}

id __57___UITextItemInteractionHandler_contextMenuConfiguration__block_invoke_2(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setView:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "frame");
  objc_msgSend(v2, "setPreferredContentSize:", v3, v4);
  return v2;
}

void __46___UITextItemInteractionHandler_primaryAction__block_invoke(uint64_t a1)
{
  void *v2;
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "item");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "preferredMenuExpression");

  if (v3 >= 2)
  {
    if (v3 != 2)
      return;
    objc_msgSend(*(id *)(a1 + 32), "item");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "editMenuInteraction");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_editMenuConfiguration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "presentEditMenuWithConfiguration:", v7);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "item");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contextMenuInteraction");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_setFallbackDriverStyle:", 1);

    objc_msgSend(*(id *)(a1 + 32), "item");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "contextMenuInteraction");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "item");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "location");
    objc_msgSend(v6, "_presentMenuAtLocation:");
  }

}

@end
