@implementation RBSAcquisitionCompletionAttribute(RBProcessState)

- (void)applyToAcquisitionContext:()RBProcessState
{
  unint64_t v4;
  id v5;

  v5 = a3;
  v4 = objc_msgSend(a1, "policy");
  if (v4 > objc_msgSend(v5, "acquisitionPolicy"))
    objc_msgSend(v5, "setAcquisitionPolicy:", v4);

}

@end
