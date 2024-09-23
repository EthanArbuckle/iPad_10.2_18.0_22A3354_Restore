@implementation NSMutableArray(WFStack)

- (void)WF_push:()WFStack
{
  WFNodeWrapper *v4;

  v4 = -[WFNodeWrapper initWithNode:]([WFNodeWrapper alloc], "initWithNode:", a3);
  objc_msgSend(a1, "addObject:", v4);

}

- (uint64_t)WF_pop
{
  uint64_t v2;

  v2 = objc_msgSend((id)objc_msgSend(a1, "lastObject"), "node");
  objc_msgSend(a1, "removeLastObject");
  return v2;
}

@end
