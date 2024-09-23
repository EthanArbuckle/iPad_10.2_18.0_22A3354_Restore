@implementation WFEmailAddressSubstitutableState

- (BOOL)reinterpretsStringsAsContactHandlesFromVariable:(BOOL)a3
{
  return 1;
}

- (id)stringInterpretedAsContactHandle:(id)a3 allowsCustomHandles:(BOOL)a4
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0D13F58], "addressWithEmailAddress:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D13E78]), "initWithEmailAddress:", v4);

  return v5;
}

- (id)valueItemClasses
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v3[0] = objc_opt_class();
  v3[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
