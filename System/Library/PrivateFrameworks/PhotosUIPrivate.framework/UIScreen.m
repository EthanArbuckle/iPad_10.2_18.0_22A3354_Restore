@implementation UIScreen

- (id)pu_hardwareIdentifier
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v1 = a1;
  v11 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    objc_msgSend(a1, "displayConfiguration");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "hardwareIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "deviceName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v3)
    {
      v6 = v3;
    }
    else if (v4)
    {
      v6 = v4;
    }
    else
    {
      PLAirPlayGetLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v10 = v1;
        _os_log_impl(&dword_1AAB61000, v7, OS_LOG_TYPE_ERROR, "UIScreen had nil hardware identifier and nil name: %@", buf, 0xCu);
      }

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%p"), v1);
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    v1 = v6;

  }
  return v1;
}

@end
