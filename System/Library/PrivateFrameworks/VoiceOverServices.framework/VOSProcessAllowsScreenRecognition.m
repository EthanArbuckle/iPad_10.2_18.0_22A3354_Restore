@implementation VOSProcessAllowsScreenRecognition

void __VOSProcessAllowsScreenRecognition_block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[6];

  v6[5] = *MEMORY[0x24BDAC8D0];
  v0 = (void *)MEMORY[0x24BDBCF20];
  v1 = *MEMORY[0x24BE00540];
  v6[0] = *MEMORY[0x24BE00550];
  v6[1] = v1;
  v2 = *MEMORY[0x24BE00140];
  v6[2] = *MEMORY[0x24BE00548];
  v6[3] = v2;
  v6[4] = *MEMORY[0x24BE00440];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)VOSProcessAllowsScreenRecognition_UnsupportedApps;
  VOSProcessAllowsScreenRecognition_UnsupportedApps = v4;

}

@end
