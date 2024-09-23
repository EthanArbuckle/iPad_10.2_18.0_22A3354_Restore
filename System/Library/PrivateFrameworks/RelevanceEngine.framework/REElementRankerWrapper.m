@implementation REElementRankerWrapper

void __45___REElementRankerWrapper_shouldHideElement___block_invoke(uint64_t a1)
{
  REMLElement *v2;
  void *v3;
  REMLElement *v4;
  id v5;

  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 16))();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = [REMLElement alloc];
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[REMLElement initWithIdentifier:featureMap:](v2, "initWithIdentifier:featureMap:", v3, v5);

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "shouldHideElement:", v4);
}

@end
