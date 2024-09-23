@implementation UIApplicationCoverSheetSceneSpecification

- (id)baseSceneComponentClassDictionary
{
  __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v3 = _UIStatusBarManagerWindowSceneComponentKey;
  v4[0] = objc_msgSend((id)objc_opt_class(), "_statusBarManagerClass");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)connectionHandlers
{
  void *v3;
  void *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend((id)UIApp, "_appAdoptsUISceneLifecycle") & 1) != 0)
    return MEMORY[0x1E0C9AA60];
  v3 = _Block_copy(&__block_literal_global_16);
  v5[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)disconnectionHandlers
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)uiSceneSessionRole
{
  return CFSTR("UIWindowSceneSessionTypeCoverSheet");
}

@end
