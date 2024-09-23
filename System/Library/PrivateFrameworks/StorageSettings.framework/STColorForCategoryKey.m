@implementation STColorForCategoryKey

void __STColorForCategoryKey_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[8];
  _QWORD v11[9];

  v11[8] = *MEMORY[0x24BDAC8D0];
  v10[0] = *MEMORY[0x24BEB1C98];
  objc_msgSend(MEMORY[0x24BDF6950], "systemPinkColor");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v0;
  v10[1] = *MEMORY[0x24BEB1CC8];
  objc_msgSend(MEMORY[0x24BDF6950], "systemYellowColor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v1;
  v10[2] = *MEMORY[0x24BEB1CC0];
  objc_msgSend(MEMORY[0x24BDF6950], "systemGreenColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v2;
  v10[3] = *MEMORY[0x24BEB1CA0];
  objc_msgSend(MEMORY[0x24BDF6950], "systemOrangeColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = v3;
  v10[4] = *MEMORY[0x24BEB1CB8];
  objc_msgSend(MEMORY[0x24BDF6950], "systemPurpleColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[4] = v4;
  v10[5] = *MEMORY[0x24BEB1CB0];
  objc_msgSend(MEMORY[0x24BDF6950], "systemBlueColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[5] = v5;
  v10[6] = *MEMORY[0x24BEB1CA8];
  objc_msgSend(MEMORY[0x24BDF6950], "systemTealColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[6] = v6;
  v10[7] = *MEMORY[0x24BEB1CD0];
  objc_msgSend(MEMORY[0x24BDF6950], "systemDarkMidGrayColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[7] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 8);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)STColorForCategoryKey_gCategoryColors;
  STColorForCategoryKey_gCategoryColors = v8;

}

@end
