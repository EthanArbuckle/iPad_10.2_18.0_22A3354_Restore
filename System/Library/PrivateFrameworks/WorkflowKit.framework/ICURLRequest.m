@implementation ICURLRequest

void __23___ICURLRequest_opener__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;

  v7 = (void *)MEMORY[0x1E0D13E18];
  v8 = a4;
  v9 = a3;
  v10 = a2;
  objc_msgSend(v7, "sharedContext");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "userInterface");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "openURL:withBundleIdentifier:userInterface:completionHandler:", v10, v9, v11, v8);

}

@end
