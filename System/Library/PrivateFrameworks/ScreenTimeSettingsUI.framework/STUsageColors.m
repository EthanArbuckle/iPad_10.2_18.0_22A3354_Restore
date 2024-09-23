@implementation STUsageColors

+ (NSArray)orderedUsageColors
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[4];

  v7[3] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBlueColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemTealColor", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemOrangeColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

+ (void)updateVibrancyStylingForView:(id)a3 withUsageColor:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  uint64_t v11;
  void *v12;
  char v13;
  void *v14;
  char v15;
  void *v16;
  int v17;
  id v18;

  v18 = a3;
  v5 = a4;
  v6 = (void *)MEMORY[0x24BE64070];
  objc_msgSend(v18, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_visualStylingProviderForRecipe:category:andUserInterfaceStyle:", 0, 3, objc_msgSend(v7, "userInterfaceStyle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBD4B8], "systemGrayColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v5, "isEqual:", v9);

  if ((v10 & 1) != 0)
  {
    v11 = 20;
LABEL_9:
    objc_msgSend(v8, "automaticallyUpdateView:withStyle:", v18, v11);
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBlueColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v5, "isEqual:", v12);

  if ((v13 & 1) != 0)
  {
    v11 = 21;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemTealColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v5, "isEqual:", v14);

  if ((v15 & 1) != 0)
  {
    v11 = 22;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemOrangeColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v5, "isEqual:", v16);

  if (v17)
  {
    v11 = 23;
    goto LABEL_9;
  }
LABEL_10:

}

@end
