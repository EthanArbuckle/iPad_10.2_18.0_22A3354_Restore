@implementation UIDocumentActivityDownloadOperation

void __44___UIDocumentActivityDownloadOperation_main__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[5];
  id v12;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 256));
  if (!WeakRetained)
  {
    +[_UIApplicationModalProgressController sharedInstance](_UIApplicationModalProgressController, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  +[_UIApplicationModalProgressController instanceForScene:](_UIApplicationModalProgressController, "instanceForScene:", WeakRetained);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  if (v5 != 6)
  {
LABEL_5:
    v7 = 0;
    goto LABEL_6;
  }
  objc_msgSend(WeakRetained, "keyWindow");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "rootViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_6:
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(a1 + 40);
  v10 = *(_QWORD *)(v8 + 248);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __44___UIDocumentActivityDownloadOperation_main__block_invoke_2;
  v11[3] = &unk_1E16B2218;
  v11[4] = v8;
  v12 = v9;
  objc_msgSend(v3, "displayForDownloadingURL:sourceViewController:completionHandler:", v10, v7, v11);

}

uint64_t __44___UIDocumentActivityDownloadOperation_main__block_invoke_2(uint64_t result, int a2)
{
  uint64_t v2;

  if (a2)
  {
    v2 = result;
    objc_msgSend(*(id *)(result + 32), "cancel");
    return objc_msgSend(*(id *)(v2 + 40), "cancel");
  }
  return result;
}

@end
