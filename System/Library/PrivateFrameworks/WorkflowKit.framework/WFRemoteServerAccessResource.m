@implementation WFRemoteServerAccessResource

- (WFRemoteServerAccessResource)init
{
  objc_class *v3;
  void *v4;
  void *v5;
  WFRemoteServerAccessResource *v6;
  WFRemoteServerAccessResource *v7;
  WFRemoteServerAccessResource *v8;
  objc_super v10;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v11 = CFSTR("WFResourceClass");
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v10.receiver = self;
  v10.super_class = (Class)WFRemoteServerAccessResource;
  v6 = -[WFAccessResource initWithDefinition:](&v10, sel_initWithDefinition_, v5);
  v7 = v6;
  if (v6)
    v8 = v6;

  return v7;
}

- (id)name
{
  return WFLocalizedString(CFSTR("Internet"));
}

- (id)icon
{
  return (id)objc_msgSend(MEMORY[0x1E0DC7B70], "workflowKitImageNamed:", CFSTR("Network"));
}

- (unint64_t)status
{
  return 4;
}

+ (BOOL)isSystemResource
{
  return 1;
}

@end
