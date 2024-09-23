@implementation WFEmailAddressFieldParameter

- (Class)multipleStateClass
{
  return (Class)objc_opt_class();
}

- (id)autocapitalizationType
{
  return (id)*MEMORY[0x1E0DC8320];
}

- (id)supportedContactProperties
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("Email");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)allowsCustomHandles
{
  return 0;
}

@end
