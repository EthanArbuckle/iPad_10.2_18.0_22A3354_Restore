@implementation SSMainScreenSnapshotter

- (id)takeScreenshot
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v22;
  _QWORD v23[6];
  _QWORD v24[7];

  v24[6] = *MEMORY[0x24BDAC8D0];
  v23[0] = *MEMORY[0x24BDF8228];
  -[SSScreenSnapshotter screen](self, "screen");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v22;
  v23[1] = *MEMORY[0x24BDF81F8];
  v3 = (void *)MEMORY[0x24BDD16E0];
  -[SSScreenSnapshotter screen](self, "screen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithInteger:", objc_msgSend(v5, "displayGamut"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x24BDF8200];
  v8 = MEMORY[0x24BDBD1C8];
  v24[1] = v6;
  v24[2] = MEMORY[0x24BDBD1C8];
  v9 = *MEMORY[0x24BDF8208];
  v23[2] = v7;
  v23[3] = v9;
  v10 = (void *)MEMORY[0x24BDD16E0];
  -[SSScreenSnapshotter screen](self, "screen");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "scale");
  objc_msgSend(v10, "numberWithDouble:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v24[3] = v12;
  v23[4] = *MEMORY[0x24BDF8218];
  v13 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "numberWithInteger:", objc_msgSend(v14, "activeInterfaceOrientation"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v23[5] = *MEMORY[0x24BDF8210];
  v24[4] = v15;
  v24[5] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, v23, 6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)_UIRenderDisplay();
  v18 = objc_alloc(MEMORY[0x24BDF6AC8]);
  -[SSScreenSnapshotter screen](self, "screen");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "scale");
  v20 = (void *)objc_msgSend(v18, "_initWithIOSurface:scale:orientation:", v17, 0);

  return v20;
}

uint64_t __41__SSMainScreenSnapshotter_takeScreenshot__block_invoke()
{
  return _UIRenderingBufferCreate();
}

@end
