@implementation SSOtherScreenSnapshotter

- (id)takeScreenshot
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  _QWORD v22[6];
  _QWORD v23[7];

  v23[6] = *MEMORY[0x24BDAC8D0];
  v22[0] = *MEMORY[0x24BDF8228];
  -[SSScreenSnapshotter screen](self, "screen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v3;
  v22[1] = *MEMORY[0x24BDF81F8];
  v4 = (void *)MEMORY[0x24BDD16E0];
  -[SSScreenSnapshotter screen](self, "screen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberWithInteger:", objc_msgSend(v6, "displayGamut"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x24BDF8200];
  v9 = MEMORY[0x24BDBD1C8];
  v23[1] = v7;
  v23[2] = MEMORY[0x24BDBD1C8];
  v10 = *MEMORY[0x24BDF8208];
  v22[2] = v8;
  v22[3] = v10;
  v11 = (void *)MEMORY[0x24BDD16E0];
  -[SSScreenSnapshotter screen](self, "screen");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "scale");
  objc_msgSend(v11, "numberWithDouble:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *MEMORY[0x24BDF8218];
  v23[3] = v13;
  v23[4] = &unk_24D073CE0;
  v15 = *MEMORY[0x24BDF8210];
  v22[4] = v14;
  v22[5] = v15;
  v23[5] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, v22, 6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)_UIRenderDisplay();
  v18 = objc_alloc(MEMORY[0x24BDF6AC8]);
  -[SSScreenSnapshotter screen](self, "screen");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "scale");
  v20 = (void *)objc_msgSend(v18, "_initWithIOSurface:scale:orientation:", v17, 0);

  return v20;
}

uint64_t __42__SSOtherScreenSnapshotter_takeScreenshot__block_invoke()
{
  return _UIRenderingBufferCreate();
}

@end
