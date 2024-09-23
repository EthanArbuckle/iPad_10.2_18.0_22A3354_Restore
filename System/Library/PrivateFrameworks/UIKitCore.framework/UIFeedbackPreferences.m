@implementation UIFeedbackPreferences

void __43___UIFeedbackPreferences_sharedPreferences__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)qword_1ECD7D900;
  qword_1ECD7D900 = (uint64_t)v1;

}

void __49___UIFeedbackPreferences__startObservingDefaults__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_defaultKeyForCategoryKey:type:", a2, a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "addObserver:forKeyPath:options:context:", *(_QWORD *)(a1 + 32), v4, 0, 0);

}

@end
