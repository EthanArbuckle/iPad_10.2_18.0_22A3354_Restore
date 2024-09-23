@implementation UITextMenuLinkInteraction

void __111___UITextMenuLinkInteraction_contextMenuInteraction_willPerformPreviewActionForMenuWithConfiguration_animator___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = (void *)UIApp;
  objc_msgSend(*(id *)(a1 + 32), "interactionURL");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "openURL:withCompletionHandler:", v2, 0);

}

uint64_t __111___UITextMenuLinkInteraction_contextMenuInteraction_willPerformPreviewActionForMenuWithConfiguration_animator___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", *(_QWORD *)(a1 + 40), 0, 0);
}

@end
