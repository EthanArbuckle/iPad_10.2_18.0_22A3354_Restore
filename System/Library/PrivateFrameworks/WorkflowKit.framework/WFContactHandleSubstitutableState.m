@implementation WFContactHandleSubstitutableState

- (BOOL)reinterpretsStringsAsContactHandlesFromVariable:(BOOL)a3
{
  return !a3;
}

- (id)stringInterpretedAsContactHandle:(id)a3 allowsCustomHandles:(BOOL)a4
{
  _BOOL8 v4;
  objc_class *v5;
  id v6;
  void *v7;

  v4 = a4;
  v5 = (objc_class *)MEMORY[0x1E0D13E78];
  v6 = a3;
  v7 = (void *)objc_msgSend([v5 alloc], "initWithHandleString:allowsCustomHandles:", v6, v4);

  return v7;
}

- (id)valueItemClasses
{
  _QWORD v3[4];

  v3[3] = *MEMORY[0x1E0C80C00];
  v3[0] = objc_opt_class();
  v3[1] = objc_opt_class();
  v3[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
