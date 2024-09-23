@implementation UITextDataDetectedLinkInteractionHandler

uint64_t __79___UITextDataDetectedLinkInteractionHandler__defaultDataDetectorsPrimaryAction__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_setFallbackDriverStyle:", 1);
  return objc_msgSend(*(id *)(a1 + 32), "_presentMenuAtLocation:", *(double *)(a1 + 40), *(double *)(a1 + 48));
}

void __79___UITextDataDetectedLinkInteractionHandler__defaultDataDetectorsPrimaryAction__block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 48), "sharedController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performAction:inView:interactionDelegate:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 0);

}

@end
