@implementation TVVisualEffectView

void __43___TVVisualEffectView_hostViewDisablements__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1650], "weakToStrongObjectsMapTable");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)hostViewDisablements_hostViewDisablements;
  hostViewDisablements_hostViewDisablements = v0;

}

@end
