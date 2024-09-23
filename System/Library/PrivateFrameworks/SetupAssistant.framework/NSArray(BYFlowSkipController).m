@implementation NSArray(BYFlowSkipController)

- (id)by_actionsByRemovingAction:()BYFlowSkipController
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_msgSend(a1, "mutableCopy");
  objc_msgSend(v5, "removeObject:", v4);

  v6 = (void *)objc_msgSend(v5, "copy");
  return v6;
}

@end
