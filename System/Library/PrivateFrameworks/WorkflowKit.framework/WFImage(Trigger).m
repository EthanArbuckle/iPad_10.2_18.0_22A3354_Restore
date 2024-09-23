@implementation WFImage(Trigger)

+ (id)triggerDisplaySymbolNamed:()Trigger renderingMode:
{
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v5 = (void *)MEMORY[0x1E0DC7B80];
  v6 = a3;
  objc_msgSend(v5, "configurationWithPointSize:", 22.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC7B70], "systemImageNamed:configuration:renderingMode:", v6, v7, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)triggerDisplaySymbolNamed:()Trigger hierarchicalColors:
{
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v5 = (void *)MEMORY[0x1E0DC7B80];
  v6 = a3;
  objc_msgSend(v5, "configurationWithPointSize:hierarchicalColors:", a4, 22.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC7B70], "systemImageNamed:configuration:renderingMode:", v6, v7, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (uint64_t)triggerConfigurationSymbolNamed:()Trigger renderingMode:
{
  return objc_msgSend(a1, "triggerConfigurationSymbolNamed:renderingMode:pointSize:", 54.0);
}

+ (id)triggerConfigurationSymbolNamed:()Trigger renderingMode:pointSize:
{
  void *v7;
  id v8;
  void *v9;
  void *v10;

  v7 = (void *)MEMORY[0x1E0DC7B80];
  v8 = a4;
  objc_msgSend(v7, "configurationWithPointSize:", a1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC7B70], "systemImageNamed:configuration:renderingMode:", v8, v9, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)triggerConfigurationSymbolNamed:()Trigger hierarchicalColors:
{
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v5 = (void *)MEMORY[0x1E0DC7B80];
  v6 = a3;
  objc_msgSend(v5, "configurationWithPointSize:hierarchicalColors:", a4, 54.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC7B70], "systemImageNamed:configuration:renderingMode:", v6, v7, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
