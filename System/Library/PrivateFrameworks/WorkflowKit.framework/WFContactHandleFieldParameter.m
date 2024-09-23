@implementation WFContactHandleFieldParameter

- (Class)multipleStateClass
{
  return (Class)objc_opt_class();
}

- (id)supportedContactProperties
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("Email");
  v3[1] = CFSTR("Phone");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)allowsCustomHandles
{
  return self->super._allowsCustomHandles;
}

- (void)setAllowsCustomHandles:(BOOL)a3
{
  if (self->super._allowsCustomHandles != a3)
  {
    self->super._allowsCustomHandles = a3;
    -[WFParameter attributesDidChange](self, "attributesDidChange");
  }
}

@end
