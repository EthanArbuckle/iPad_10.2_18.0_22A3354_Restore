@implementation UIView(GhostAdditions)

- (void)setFilterForUserInterface:()GhostAdditions
{
  void *v3;
  _QWORD *v4;
  void *v5;
  id v6;

  if (a3 == 1)
  {
    objc_msgSend(a1, "layer");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v3 = (void *)MEMORY[0x1E0CD2780];
    v4 = (_QWORD *)MEMORY[0x1E0CD2E98];
  }
  else
  {
    if (a3 != 2)
      return;
    objc_msgSend(a1, "layer");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v3 = (void *)MEMORY[0x1E0CD2780];
    v4 = (_QWORD *)MEMORY[0x1E0CD2EA0];
  }
  objc_msgSend(v3, "filterWithType:", *v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCompositingFilter:", v5);

}

@end
