@implementation WLKFetchBaseURLWithCompletion

void __WLKFetchBaseURLWithCompletion_block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0DB1840], "app");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cachedURLForKey:", kBagKeyUVSearchUtsApiBaseURL);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    objc_msgSend(v5, "absoluteString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v3 + 16))(v3, v4, 0);

  }
}

@end
