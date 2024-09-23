@implementation ICSRadarHelper

+ (void)tapToRadarWithTitle:(id)a3 initialMessage:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v5 = (objc_class *)MEMORY[0x24BDD1808];
  v6 = a4;
  v7 = a3;
  v19 = objc_alloc_init(v5);
  objc_msgSend(v19, "setScheme:", CFSTR("tap-to-radar"));
  objc_msgSend(v19, "setHost:", CFSTR("new"));
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1838]), "initWithName:value:", CFSTR("ComponentName"), CFSTR("AppleAccount"));
  objc_msgSend(v8, "addObject:", v9);

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1838]), "initWithName:value:", CFSTR("ComponentVersion"), CFSTR("iOS"));
  objc_msgSend(v8, "addObject:", v10);

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1838]), "initWithName:value:", CFSTR("ComponentID"), CFSTR("511458"));
  objc_msgSend(v8, "addObject:", v11);

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1838]), "initWithName:value:", CFSTR("Classification"), CFSTR("Serious Bug"));
  objc_msgSend(v8, "addObject:", v12);

  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1838]), "initWithName:value:", CFSTR("Reproducibility"), CFSTR("I Didn't Try"));
  objc_msgSend(v8, "addObject:", v13);

  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1838]), "initWithName:value:", CFSTR("AutoDiagnostics"), CFSTR("phone"));
  objc_msgSend(v8, "addObject:", v14);

  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1838]), "initWithName:value:", CFSTR("Title"), v7);
  objc_msgSend(v8, "addObject:", v15);

  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1838]), "initWithName:value:", CFSTR("Description"), v6);
  objc_msgSend(v8, "addObject:", v16);

  objc_msgSend(v19, "setQueryItems:", v8);
  objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "URL");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "openURL:configuration:completionHandler:", v18, 0, 0);

}

@end
