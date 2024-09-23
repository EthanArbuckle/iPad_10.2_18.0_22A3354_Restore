@implementation XBLaunchInterfaceConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tabBarImageName, 0);
  objc_storeStrong((id *)&self->_toolbarImageName, 0);
  objc_storeStrong((id *)&self->_navigationBarImageName, 0);
  objc_storeStrong((id *)&self->_bars, 0);
  objc_storeStrong((id *)&self->_imageName, 0);
  objc_storeStrong((id *)&self->_colorName, 0);
}

- (XBLaunchInterfaceConfiguration)initWithCoder:(id)a3
{
  id v5;
  XBLaunchInterfaceConfiguration *v6;
  void *v7;
  uint64_t v8;
  NSString *colorName;
  void *v10;
  uint64_t v11;
  NSString *imageName;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSString *navigationBarImageName;
  void *v18;
  void *v19;
  uint64_t v20;
  NSString *toolbarImageName;
  void *v22;
  void *v23;
  uint64_t v24;
  NSString *tabBarImageName;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  NSArray *bars;
  void *v34;
  void *v35;
  void *v36;
  objc_super v37;

  v5 = a3;
  v37.receiver = self;
  v37.super_class = (Class)XBLaunchInterfaceConfiguration;
  v6 = -[XBLaunchInterfaceConfiguration init](&v37, sel_init);
  if (v6)
  {
    if ((objc_msgSend(v5, "allowsKeyedCoding") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("XBApplicationLaunchCompatibilityInfo.m"), 298, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[coder allowsKeyedCoding]"));

    }
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "colorName");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), v36);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "copy");
    colorName = v6->_colorName;
    v6->_colorName = (NSString *)v8;

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "imageName");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), v35);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "copy");
    imageName = v6->_imageName;
    v6->_imageName = (NSString *)v11;

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "imageRespectsSafeAreaInsets");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_imageRespectsSafeAreaInsets = objc_msgSend(v5, "decodeBoolForKey:", v13);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "navigationBarImageName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "copy");
    navigationBarImageName = v6->_navigationBarImageName;
    v6->_navigationBarImageName = (NSString *)v16;

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "toolbarImageName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "copy");
    toolbarImageName = v6->_toolbarImageName;
    v6->_toolbarImageName = (NSString *)v20;

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "tabBarImageName");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "copy");
    tabBarImageName = v6->_tabBarImageName;
    v6->_tabBarImageName = (NSString *)v24;

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "bars");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)MEMORY[0x24BDBCF20];
    v28 = objc_opt_class();
    objc_msgSend(v27, "setWithObjects:", v28, objc_opt_class(), 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v29, v26);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "copy");
    bars = v6->_bars;
    v6->_bars = (NSArray *)v31;

  }
  return v6;
}

- (XBLaunchInterfaceConfiguration)initWithConfigurationDictionary:(id)a3
{
  id v4;
  XBLaunchInterfaceConfiguration *v5;
  uint64_t v6;
  NSArray *bars;
  uint64_t v8;
  NSString *colorName;
  uint64_t v10;
  NSString *imageName;
  void *v12;
  void *v13;
  uint64_t v14;
  NSArray *v15;
  uint64_t v16;
  NSString *navigationBarImageName;
  void *v18;
  uint64_t v19;
  NSArray *v20;
  uint64_t v21;
  NSString *toolbarImageName;
  void *v23;
  uint64_t v24;
  NSArray *v25;
  uint64_t v26;
  NSString *tabBarImageName;
  objc_super v29;

  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)XBLaunchInterfaceConfiguration;
  v5 = -[XBLaunchInterfaceConfiguration init](&v29, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCE30], "array");
    v6 = objc_claimAutoreleasedReturnValue();
    bars = v5->_bars;
    v5->_bars = (NSArray *)v6;

    objc_msgSend(v4, "valueForKey:", CFSTR("UIColorName"));
    v8 = objc_claimAutoreleasedReturnValue();
    colorName = v5->_colorName;
    v5->_colorName = (NSString *)v8;

    objc_msgSend(v4, "valueForKey:", CFSTR("UIImageName"));
    v10 = objc_claimAutoreleasedReturnValue();
    imageName = v5->_imageName;
    v5->_imageName = (NSString *)v10;

    objc_msgSend(v4, "valueForKey:", CFSTR("UIImageRespectsSafeAreaInsets"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_imageRespectsSafeAreaInsets = objc_msgSend(v12, "BOOLValue");

    objc_msgSend(v4, "valueForKey:", CFSTR("UINavigationBar"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      -[NSArray arrayByAddingObject:](v5->_bars, "arrayByAddingObject:", CFSTR("UINavigationBar"));
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = v5->_bars;
      v5->_bars = (NSArray *)v14;

      objc_msgSend(v13, "valueForKey:", CFSTR("UIImageName"));
      v16 = objc_claimAutoreleasedReturnValue();
      navigationBarImageName = v5->_navigationBarImageName;
      v5->_navigationBarImageName = (NSString *)v16;

    }
    objc_msgSend(v4, "valueForKey:", CFSTR("UIToolbar"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      -[NSArray arrayByAddingObject:](v5->_bars, "arrayByAddingObject:", CFSTR("UIToolbar"));
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = v5->_bars;
      v5->_bars = (NSArray *)v19;

      objc_msgSend(v18, "valueForKey:", CFSTR("UIImageName"));
      v21 = objc_claimAutoreleasedReturnValue();
      toolbarImageName = v5->_toolbarImageName;
      v5->_toolbarImageName = (NSString *)v21;

    }
    objc_msgSend(v4, "valueForKey:", CFSTR("UITabBar"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      -[NSArray arrayByAddingObject:](v5->_bars, "arrayByAddingObject:", CFSTR("UITabBar"));
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = v5->_bars;
      v5->_bars = (NSArray *)v24;

      objc_msgSend(v23, "valueForKey:", CFSTR("UIImageName"));
      v26 = objc_claimAutoreleasedReturnValue();
      tabBarImageName = v5->_tabBarImageName;
      v5->_tabBarImageName = (NSString *)v26;

    }
  }

  return v5;
}

- (XBLaunchInterfaceConfiguration)initWithXPCDictionary:(id)a3
{
  id v4;
  XBLaunchInterfaceConfiguration *v5;
  uint64_t v6;
  NSString *colorName;
  uint64_t v8;
  NSString *imageName;
  uint64_t v10;
  NSString *navigationBarImageName;
  uint64_t v12;
  NSString *toolbarImageName;
  uint64_t v14;
  NSString *tabBarImageName;
  uint64_t v16;
  NSArray *bars;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)XBLaunchInterfaceConfiguration;
  v5 = -[XBLaunchInterfaceConfiguration init](&v19, sel_init);
  if (v5)
  {
    v6 = BSCreateDeserializedCFValueFromXPCDictionaryWithKey();
    colorName = v5->_colorName;
    v5->_colorName = (NSString *)v6;

    v8 = BSCreateDeserializedCFValueFromXPCDictionaryWithKey();
    imageName = v5->_imageName;
    v5->_imageName = (NSString *)v8;

    v5->_imageRespectsSafeAreaInsets = xpc_dictionary_get_BOOL(v4, "imageRespectsSafeAreaInsets");
    v10 = BSCreateDeserializedCFValueFromXPCDictionaryWithKey();
    navigationBarImageName = v5->_navigationBarImageName;
    v5->_navigationBarImageName = (NSString *)v10;

    v12 = BSCreateDeserializedCFValueFromXPCDictionaryWithKey();
    toolbarImageName = v5->_toolbarImageName;
    v5->_toolbarImageName = (NSString *)v12;

    v14 = BSCreateDeserializedCFValueFromXPCDictionaryWithKey();
    tabBarImageName = v5->_tabBarImageName;
    v5->_tabBarImageName = (NSString *)v14;

    v16 = BSCreateDeserializedCFValueFromXPCDictionaryWithKey();
    bars = v5->_bars;
    v5->_bars = (NSArray *)v16;

  }
  return v5;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  xpc_object_t xdict;

  xdict = a3;
  BSSerializeCFValueToXPCDictionaryWithKey();
  BSSerializeCFValueToXPCDictionaryWithKey();
  xpc_dictionary_set_BOOL(xdict, "imageRespectsSafeAreaInsets", self->_imageRespectsSafeAreaInsets);
  BSSerializeCFValueToXPCDictionaryWithKey();
  BSSerializeCFValueToXPCDictionaryWithKey();
  BSSerializeCFValueToXPCDictionaryWithKey();
  BSSerializeCFValueToXPCDictionaryWithKey();

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v5 = a3;
  if ((objc_msgSend(v5, "allowsKeyedCoding") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("XBApplicationLaunchCompatibilityInfo.m"), 319, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[coder allowsKeyedCoding]"));

  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "colorName");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", self->_colorName, v13);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "imageName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", self->_imageName, v6);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "imageRespectsSafeAreaInsets");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeBool:forKey:", self->_imageRespectsSafeAreaInsets, v7);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "navigationBarImageName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", self->_navigationBarImageName, v8);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "toolbarImageName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", self->_toolbarImageName, v9);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "tabBarImageName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", self->_tabBarImageName, v10);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "bars");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", self->_bars, v11);

}

- (NSString)description
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;

  objc_msgSend(MEMORY[0x24BE38380], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:withName:", self->_colorName, CFSTR("colorName"));
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", self->_imageName, CFSTR("imageName"));
  v6 = (id)objc_msgSend(v3, "appendBool:withName:", self->_imageRespectsSafeAreaInsets, CFSTR("imageRespectsSafeAreaInsets"));
  v7 = (id)objc_msgSend(v3, "appendObject:withName:", self->_navigationBarImageName, CFSTR("navigationBarImageName"));
  v8 = (id)objc_msgSend(v3, "appendObject:withName:", self->_toolbarImageName, CFSTR("toolbarImageName"));
  v9 = (id)objc_msgSend(v3, "appendObject:withName:", self->_tabBarImageName, CFSTR("tabBarImageName"));
  v10 = (id)objc_msgSend(v3, "appendObject:withName:", self->_bars, CFSTR("bars"));
  objc_msgSend(v3, "build");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v11;
}

- (NSString)colorName
{
  return self->_colorName;
}

- (NSString)imageName
{
  return self->_imageName;
}

- (BOOL)imageRespectsSafeAreaInsets
{
  return self->_imageRespectsSafeAreaInsets;
}

- (NSArray)bars
{
  return self->_bars;
}

- (NSString)navigationBarImageName
{
  return self->_navigationBarImageName;
}

- (NSString)toolbarImageName
{
  return self->_toolbarImageName;
}

- (NSString)tabBarImageName
{
  return self->_tabBarImageName;
}

@end
