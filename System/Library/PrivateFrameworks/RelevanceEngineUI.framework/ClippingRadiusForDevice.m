@implementation ClippingRadiusForDevice

void __ClippingRadiusForDevice_block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[2];
  _QWORD v6[3];

  v6[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDB8738], "metricsWithDevice:identitySizeClass:", a2, 3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = &unk_24CF7F8B0;
  v5[1] = &unk_24CF7F8C8;
  v6[0] = &unk_24CF7F8E0;
  v6[1] = &unk_24CF7F8E0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, v5, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v3, 3.0);
  ClippingRadiusForDevice__clippingRadius = v4;

}

@end
