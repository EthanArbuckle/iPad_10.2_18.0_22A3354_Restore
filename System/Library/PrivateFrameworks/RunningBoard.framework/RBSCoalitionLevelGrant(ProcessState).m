@implementation RBSCoalitionLevelGrant(ProcessState)

- (void)applyToProcessState:()ProcessState attributePath:context:
{
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  id v7;

  v7 = a3;
  v4 = objc_msgSend(v7, "coalitionLevel");
  v5 = objc_msgSend(a1, "coalitionLevel");
  if (v4 <= v5)
    v6 = v5;
  else
    v6 = v4;
  objc_msgSend(v7, "setCoalitionLevel:", v6);

}

- (uint64_t)isValidForContext:()ProcessState withError:
{
  return objc_msgSend(MEMORY[0x24BE80B28], "allowedForPrimitiveAttributeForProcessTarget:withError:");
}

@end
