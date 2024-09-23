@implementation ActivitySystemImageName

void ___ActivitySystemImageName_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint8_t buf[4];
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CEC3F8], "_typeOfCurrentDevice");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)MEMORY[0x1E0D3A838];
  objc_msgSend(v0, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  objc_msgSend(v1, "symbolForTypeIdentifier:withResolutionStrategy:variantOptions:error:", v2, 1, 1, &v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v8;

  if (v4)
  {
    PLUIGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v10 = v0;
      v11 = 2112;
      v12 = v4;
      _os_log_impl(&dword_1AAB61000, v5, OS_LOG_TYPE_ERROR, "Error trying to retrieve symbol from device type (type: %{public}@): Error: %@", buf, 0x16u);
    }

  }
  objc_msgSend(v3, "name");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)_ActivitySystemImageName_imageName;
  _ActivitySystemImageName_imageName = v6;

}

@end
