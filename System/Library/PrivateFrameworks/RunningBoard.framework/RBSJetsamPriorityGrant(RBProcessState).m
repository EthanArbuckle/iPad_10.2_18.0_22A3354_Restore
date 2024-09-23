@implementation RBSJetsamPriorityGrant(RBProcessState)

- (uint64_t)isValidForContext:()RBProcessState withError:
{
  return objc_msgSend(MEMORY[0x24BE80B28], "allowedForPrimitiveAttributeForProcessTarget:withError:");
}

- (void)applyToProcessState:()RBProcessState attributePath:context:
{
  unint64_t v4;
  id v5;

  v5 = a3;
  v4 = objc_msgSend(a1, "band");
  if (v4 > objc_msgSend(v5, "explicitJetsamBand"))
    objc_msgSend(v5, "setExplicitJetsamBand:", v4);

}

@end
