@implementation PUIImageOnDiskFormat

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addImageOptions, 0);
  objc_storeStrong((id *)&self->_destinationOptions, 0);
  objc_storeStrong((id *)&self->_typeIdentifier, 0);
  objc_storeStrong((id *)&self->_filenameExtension, 0);
}

- (PUIImageOnDiskFormat)initWithTypeIdentifier:(id)a3 filenameExtension:(id)a4 destinationOptions:(id)a5 addImageOptions:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  PUIImageOnDiskFormat *v15;
  uint64_t v16;
  NSString *filenameExtension;
  uint64_t v18;
  NSString *typeIdentifier;
  uint64_t v20;
  NSDictionary *destinationOptions;
  uint64_t v22;
  NSDictionary *addImageOptions;
  void *v25;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("typeIdentifier != ((void *)0)"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[PUIImageOnDiskFormat initWithTypeIdentifier:filenameExtension:destinationOptions:addImageOptions:].cold.1();
LABEL_11:
    objc_msgSend(objc_retainAutorelease(v25), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x244651080);
  }
  if (!v11)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("filenameExtension != ((void *)0)"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[PUIImageOnDiskFormat initWithTypeIdentifier:filenameExtension:destinationOptions:addImageOptions:].cold.2();
    goto LABEL_11;
  }
  v14 = v13;
  v15 = -[PUIImageOnDiskFormat init](self, "init");
  if (v15)
  {
    v16 = objc_msgSend(v11, "copy");
    filenameExtension = v15->_filenameExtension;
    v15->_filenameExtension = (NSString *)v16;

    v18 = objc_msgSend(v10, "copy");
    typeIdentifier = v15->_typeIdentifier;
    v15->_typeIdentifier = (NSString *)v18;

    v20 = objc_msgSend(v12, "copy");
    destinationOptions = v15->_destinationOptions;
    v15->_destinationOptions = (NSDictionary *)v20;

    v22 = objc_msgSend(v14, "copy");
    addImageOptions = v15->_addImageOptions;
    v15->_addImageOptions = (NSDictionary *)v22;

  }
  return v15;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[PUIImageOnDiskFormat initWithTypeIdentifier:filenameExtension:destinationOptions:addImageOptions:]([PUIImageOnDiskFormat alloc], "initWithTypeIdentifier:filenameExtension:destinationOptions:addImageOptions:", self->_typeIdentifier, self->_filenameExtension, self->_destinationOptions, self->_addImageOptions);
}

+ (id)atxWithBlockSize:(unsigned int)a3 twiddling:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  PUIImageOnDiskFormat *v9;
  _QWORD v11[4];
  _QWORD v12[5];

  v4 = a4;
  v12[4] = *MEMORY[0x24BDAC8D0];
  v12[0] = *MEMORY[0x24BDD92A8];
  v5 = *MEMORY[0x24BDD92A0];
  v11[0] = *MEMORY[0x24BDD93D8];
  v11[1] = v5;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", *(_QWORD *)&a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v6;
  v11[2] = *MEMORY[0x24BDD92B0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = *MEMORY[0x24BDD92B8];
  v12[2] = v7;
  v12[3] = MEMORY[0x24BDBD1C0];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, v11, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[PUIImageOnDiskFormat initWithTypeIdentifier:filenameExtension:destinationOptions:addImageOptions:]([PUIImageOnDiskFormat alloc], "initWithTypeIdentifier:filenameExtension:destinationOptions:addImageOptions:", CFSTR("com.apple.atx"), CFSTR("atx"), 0, v8);
  return v9;
}

+ (PUIImageOnDiskFormat)defaultATX
{
  return (PUIImageOnDiskFormat *)objc_msgSend(a1, "atxWithBlockSize:twiddling:", 68, 1);
}

+ (PUIImageOnDiskFormat)png
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  PUIImageOnDiskFormat *v6;
  void *v7;
  void *v8;
  void *v9;
  PUIImageOnDiskFormat *v10;
  uint64_t v12;
  void *v13;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BDD96A0];
  v15[0] = &unk_25156AEA0;
  v3 = *MEMORY[0x24BDD96B0];
  v14[0] = v2;
  v14[1] = v3;
  v12 = *MEMORY[0x24BDD96A8];
  v13 = &unk_25156AEB8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = [PUIImageOnDiskFormat alloc];
  v7 = (void *)*MEMORY[0x24BDF84F8];
  objc_msgSend((id)*MEMORY[0x24BDF84F8], "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "preferredFilenameExtension");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PUIImageOnDiskFormat initWithTypeIdentifier:filenameExtension:destinationOptions:addImageOptions:](v6, "initWithTypeIdentifier:filenameExtension:destinationOptions:addImageOptions:", v8, v9, 0, v5);

  return v10;
}

- (PUIImageOnDiskFormat)initWithTypeRecord:(id)a3 destinationOptions:(id)a4 addImageOptions:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  PUIImageOnDiskFormat *v13;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v10, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "preferredFilenameExtension");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[PUIImageOnDiskFormat initWithTypeIdentifier:filenameExtension:destinationOptions:addImageOptions:](self, "initWithTypeIdentifier:filenameExtension:destinationOptions:addImageOptions:", v11, v12, v9, v8);
  return v13;
}

- (id)resolveDestinationOptionsForImage:(CGImage *)a3
{
  void *v4;
  void *v5;
  void *v6;
  id result;
  void *v8;

  if (a3)
  {
    -[PUIImageOnDiskFormat destinationOptions](self, "destinationOptions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[PUIImageOnDiskFormat destinationOptions](self, "destinationOptions");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)objc_msgSend(v5, "mutableCopy");

      PUIResolveMaxPixelOption(v6);
    }
    else
    {
      v6 = 0;
    }
    return v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("image != ((void *)0)"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[PUIImageOnDiskFormat resolveDestinationOptionsForImage:].cold.1();
    objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
    result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (id)resolveAddImageOptionsForImage:(CGImage *)a3
{
  void *v4;
  void *v5;
  void *v6;
  id result;
  void *v8;

  if (a3)
  {
    -[PUIImageOnDiskFormat addImageOptions](self, "addImageOptions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[PUIImageOnDiskFormat addImageOptions](self, "addImageOptions");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)objc_msgSend(v5, "mutableCopy");

      PUIResolveMaxPixelOption(v6);
    }
    else
    {
      v6 = 0;
    }
    return v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("image != ((void *)0)"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[PUIImageOnDiskFormat resolveAddImageOptionsForImage:].cold.1();
    objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
    result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (id)formatByAppendingDestinationOptions:(id)a3 addImageOptions:(id)a4
{
  NSDictionary *v6;
  NSDictionary *destinationOptions;
  id v8;
  void *v9;
  NSDictionary *addImageOptions;
  void *v11;
  void *v12;

  v6 = (NSDictionary *)MEMORY[0x24BDBD1B8];
  if (self->_destinationOptions)
    destinationOptions = self->_destinationOptions;
  else
    destinationOptions = (NSDictionary *)MEMORY[0x24BDBD1B8];
  v8 = a4;
  -[NSDictionary bs_dictionaryByAddingEntriesFromDictionary:](destinationOptions, "bs_dictionaryByAddingEntriesFromDictionary:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_addImageOptions)
    addImageOptions = self->_addImageOptions;
  else
    addImageOptions = v6;
  -[NSDictionary bs_dictionaryByAddingEntriesFromDictionary:](addImageOptions, "bs_dictionaryByAddingEntriesFromDictionary:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithTypeIdentifier:filenameExtension:destinationOptions:addImageOptions:", self->_typeIdentifier, self->_filenameExtension, v9, v11);
  return v12;
}

- (NSString)filenameExtension
{
  return self->_filenameExtension;
}

- (NSString)typeIdentifier
{
  return self->_typeIdentifier;
}

- (NSDictionary)destinationOptions
{
  return self->_destinationOptions;
}

- (NSDictionary)addImageOptions
{
  return self->_addImageOptions;
}

- (void)initWithTypeIdentifier:filenameExtension:destinationOptions:addImageOptions:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1_0(&dword_24464E000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)initWithTypeIdentifier:filenameExtension:destinationOptions:addImageOptions:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1_0(&dword_24464E000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)resolveDestinationOptionsForImage:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1_0(&dword_24464E000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)resolveAddImageOptionsForImage:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1_0(&dword_24464E000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

@end
