@implementation UIImage(ICQUIAdditions)

+ (id)icqBundleImageNamed:()ICQUIAdditions
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD1488];
  v4 = a3;
  objc_msgSend(v3, "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD640], "imageNamed:inBundle:compatibleWithTraitCollection:", v4, v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)imageForTableUIWithType:()ICQUIAdditions
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v3 = (objc_class *)MEMORY[0x24BE51A90];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithType:", v4);

  objc_msgSend(MEMORY[0x24BE51AB0], "imageDescriptorNamed:", *MEMORY[0x24BE51AF0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "prepareImageForDescriptor:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x24BEBD640];
  v9 = objc_msgSend(v7, "CGImage");
  objc_msgSend(v7, "scale");
  objc_msgSend(v8, "imageWithCGImage:scale:orientation:", v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)imageWithType:()ICQUIAdditions size:
{
  objc_class *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v5 = (objc_class *)MEMORY[0x24BE51A90];
  v6 = a4;
  v7 = (void *)objc_msgSend([v5 alloc], "initWithType:", v6);

  v8 = objc_alloc(MEMORY[0x24BE51AB0]);
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "scale");
  v11 = (void *)objc_msgSend(v8, "initWithSize:scale:", a1, a1, v10 * 3.0);

  objc_msgSend(v7, "prepareImageForDescriptor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x24BEBD640];
  v14 = objc_msgSend(v12, "CGImage");
  objc_msgSend(v12, "scale");
  objc_msgSend(v13, "imageWithCGImage:scale:orientation:", v14, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

@end
