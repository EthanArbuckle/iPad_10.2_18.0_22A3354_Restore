@implementation NSString(WFVariableStringContent)

- (void)wf_getContentItemsWithContext:()WFVariableStringContent completionHandler:
{
  void *v5;
  void (**v6)(id, void *, _QWORD);
  void *v7;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0D13EC0];
  v6 = a4;
  objc_msgSend(v5, "itemWithObject:", a1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, v8, 0);

}

@end
