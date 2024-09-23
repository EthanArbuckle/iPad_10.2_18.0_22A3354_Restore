@implementation UIPhysicalButtonMutableConfigurationSet

void __87___UIPhysicalButtonMutableConfigurationSet__unionWithConfigurationSet_acceptanceBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  BOOL v5;
  uint64_t v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "_configurationForButton:", a2);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_configurationForButton:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    v5 = 1;
  else
    v5 = v4 == 0;
  if (!v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "_setConfiguration:forButton:", v4, a2);
    v6 = *(_QWORD *)(a1 + 48);
    if (v6)
      (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v4);
  }

}

@end
