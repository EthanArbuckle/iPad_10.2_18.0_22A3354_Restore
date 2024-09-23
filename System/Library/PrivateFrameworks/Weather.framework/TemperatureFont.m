@implementation TemperatureFont

void __TemperatureFont_block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[3];
  _QWORD v14[4];

  v14[3] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDF6A78];
  v3 = *MEMORY[0x24BDC4CB8];
  v14[0] = *MEMORY[0x24BDC4CE0];
  v4 = *MEMORY[0x24BDC4DE0];
  v13[0] = v3;
  v13[1] = v4;
  v11 = *MEMORY[0x24BDC4D40];
  v12 = &unk_24DDB16C8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v5;
  v13[2] = *MEMORY[0x24BDC4DA8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *(double *)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fontDescriptorWithFontAttributes:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDF6A70], "fontWithDescriptor:size:", v8, 0.0);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)TemperatureFont_font;
  TemperatureFont_font = v9;

}

@end
