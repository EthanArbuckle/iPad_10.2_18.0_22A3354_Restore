@implementation CNContact(VoiceDial)

- (void)callNumberWithLabeledValue:()VoiceDial
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  id v17;

  objc_msgSend(a3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_alloc_init(MEMORY[0x24BEB4950]);
  v7 = objc_alloc(MEMORY[0x24BEB49D0]);
  objc_msgSend(v6, "telephonyProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithProvider:", v8);

  objc_msgSend(MEMORY[0x24BEB49E8], "normalizedHandleWithDestinationID:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setHandle:", v10);

  objc_msgSend(a1, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setContactIdentifier:", v11);

  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "URL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __51__CNContact_VoiceDial__callNumberWithLabeledValue___block_invoke;
  v16[3] = &unk_24F2ACA78;
  v16[4] = a1;
  v17 = v5;
  v15 = v5;
  objc_msgSend(v12, "openURL:options:completionHandler:", v13, v14, v16);

}

- (void)faceTimeEmailWithLabeledValue:()VoiceDial
{
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  id v16;

  objc_msgSend(a3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x24BEB4950]);
  v6 = objc_alloc(MEMORY[0x24BEB49D0]);
  objc_msgSend(v5, "faceTimeProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithProvider:", v7);

  objc_msgSend(MEMORY[0x24BEB49E8], "normalizedHandleWithDestinationID:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setHandle:", v9);

  objc_msgSend(a1, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setContactIdentifier:", v10);

  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "URL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __54__CNContact_VoiceDial__faceTimeEmailWithLabeledValue___block_invoke;
  v15[3] = &unk_24F2ACA78;
  v15[4] = a1;
  v16 = v4;
  v14 = v4;
  objc_msgSend(v11, "openURL:options:completionHandler:", v12, v13, v15);

}

@end
