@implementation SBWorkspaceDefaults

- (void)_bindAndRegisterDefaults
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "medusaDeviceSimulation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v3, CFSTR("SBMedusaDeviceSimulation"), &unk_1E203A9A8, 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "breadcrumbDisabled");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v4, CFSTR("SBNeverBreadcrumb"), MEMORY[0x1E0C9AAA0], 1);

}

@end
