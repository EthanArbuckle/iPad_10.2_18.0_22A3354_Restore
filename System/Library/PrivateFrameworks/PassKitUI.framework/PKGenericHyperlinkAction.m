@implementation PKGenericHyperlinkAction

void __PKGenericHyperlinkAction_block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void (*v4)(void);
  void *v5;
  int v6;
  id v7;

  v7 = a2;
  onboardingIdentifiersFromURL(v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v4 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    objc_msgSend(v7, "scheme");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(&unk_1E3FAE6B0, "containsObject:", v5);

    if (!v6)
    {
      navigateToURL(v7);
      goto LABEL_7;
    }
    v4 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v4();
LABEL_7:

}

@end
