@implementation UIResponder(WFBlockKeyCommand)

- (void)wf_handleBlockKeyCommand:()WFBlockKeyCommand
{
  void (**v3)(void);
  void (**v4)(void);

  objc_msgSend(a3, "block");
  v3 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    v3[2]();
    v3 = v4;
  }

}

@end
