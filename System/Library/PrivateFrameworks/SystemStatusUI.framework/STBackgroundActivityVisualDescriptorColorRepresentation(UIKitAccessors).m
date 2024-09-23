@implementation STBackgroundActivityVisualDescriptorColorRepresentation(UIKitAccessors)

- (id)UIColor
{
  NSString *v2;
  NSString *v3;
  SEL v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v11;
  int v12;
  NSObject *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "systemColorName");
  v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
  {
    objc_msgSend(a1, "BSColor");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      -[NSObject UIColor](v6, "UIColor");
      v8 = objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        v5 = (void *)v8;
LABEL_14:

        goto LABEL_15;
      }
      STSystemStatusLogBundleLoading();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v12 = 138543362;
        v13 = v7;
        _os_log_error_impl(&dword_1CFE2E000, v11, OS_LOG_TYPE_ERROR, "Could not create a UIColor from customColor '%{public}@'", (uint8_t *)&v12, 0xCu);
      }

    }
LABEL_13:
    v5 = 0;
    goto LABEL_14;
  }
  v4 = NSSelectorFromString(v2);
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    STSystemStatusLogBundleLoading();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v12 = 138543362;
      v13 = v3;
      _os_log_error_impl(&dword_1CFE2E000, v9, OS_LOG_TYPE_ERROR, "UIColor does not implement a method for systemColorName '%{public}@'", (uint8_t *)&v12, 0xCu);
    }

    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x1E0DC3658], "performSelector:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
LABEL_11:
    STSystemStatusLogBundleLoading();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v12 = 138543362;
      v13 = v3;
      _os_log_error_impl(&dword_1CFE2E000, v7, OS_LOG_TYPE_ERROR, "UIColor does not return anything for systemColorName '%{public}@'", (uint8_t *)&v12, 0xCu);
    }
    goto LABEL_13;
  }
LABEL_15:

  return v5;
}

@end
