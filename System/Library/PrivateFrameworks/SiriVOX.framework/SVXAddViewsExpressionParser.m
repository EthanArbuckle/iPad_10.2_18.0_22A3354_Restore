@implementation SVXAddViewsExpressionParser

BOOL __98___SVXAddViewsExpressionParser__parseViews_addViews_aceViewByAceId_aceIdByParseableExpressionIds___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  _BOOL8 v5;

  objc_msgSend(a2, "aceId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "aceId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3 == v4;

  return v5;
}

void __52___SVXAddViewsExpressionParser_parseAddViews_reply___block_invoke(uint64_t a1, int a2, void *a3)
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  if (a2)
  {
    v5 = *(void **)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "aceViewByAceId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "aceViewIdByExpressionId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_parseViews:addViews:aceViewByAceId:aceIdByParseableExpressionIds:", v10, v6, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

@end
