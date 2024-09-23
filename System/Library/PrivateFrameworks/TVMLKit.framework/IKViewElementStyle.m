@implementation IKViewElementStyle

uint64_t __56__IKViewElementStyle_TVMLKitAdditions__tv_textAlignment__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v1 = (void *)tv_textAlignment_sAlignmentKeysMap;
  tv_textAlignment_sAlignmentKeysMap = (uint64_t)v0;

  objc_msgSend((id)tv_textAlignment_sAlignmentKeysMap, "setObject:forKeyedSubscript:", &unk_24EBCD180, CFSTR("left"));
  objc_msgSend((id)tv_textAlignment_sAlignmentKeysMap, "setObject:forKeyedSubscript:", &unk_24EBCD198, CFSTR("center"));
  objc_msgSend((id)tv_textAlignment_sAlignmentKeysMap, "setObject:forKeyedSubscript:", &unk_24EBCD1B0, CFSTR("right"));
  objc_msgSend((id)tv_textAlignment_sAlignmentKeysMap, "setObject:forKeyedSubscript:", &unk_24EBCD1C8, CFSTR("justified"));
  return objc_msgSend((id)tv_textAlignment_sAlignmentKeysMap, "setObject:forKeyedSubscript:", &unk_24EBCD1E0, CFSTR("natural"));
}

uint64_t __52__IKViewElementStyle_TVMLKitAdditions__tv_alignment__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v1 = (void *)tv_alignment_sAlignmentKeysMap;
  tv_alignment_sAlignmentKeysMap = (uint64_t)v0;

  objc_msgSend((id)tv_alignment_sAlignmentKeysMap, "setObject:forKeyedSubscript:", &unk_24EBCD198, CFSTR("left"));
  objc_msgSend((id)tv_alignment_sAlignmentKeysMap, "setObject:forKeyedSubscript:", &unk_24EBCD1B0, CFSTR("center"));
  objc_msgSend((id)tv_alignment_sAlignmentKeysMap, "setObject:forKeyedSubscript:", &unk_24EBCD1C8, CFSTR("right"));
  objc_msgSend((id)tv_alignment_sAlignmentKeysMap, "setObject:forKeyedSubscript:", &unk_24EBCD1E0, CFSTR("leading"));
  return objc_msgSend((id)tv_alignment_sAlignmentKeysMap, "setObject:forKeyedSubscript:", &unk_24EBCD1F8, CFSTR("trailing"));
}

uint64_t __51__IKViewElementStyle_TVMLKitAdditions__tv_position__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v1 = (void *)tv_position_sPositionKeysMap;
  tv_position_sPositionKeysMap = (uint64_t)v0;

  objc_msgSend((id)tv_position_sPositionKeysMap, "setObject:forKeyedSubscript:", &unk_24EBCD198, CFSTR("center"));
  objc_msgSend((id)tv_position_sPositionKeysMap, "setObject:forKeyedSubscript:", &unk_24EBCD1B0, CFSTR("top"));
  objc_msgSend((id)tv_position_sPositionKeysMap, "setObject:forKeyedSubscript:", &unk_24EBCD1C8, CFSTR("bottom"));
  objc_msgSend((id)tv_position_sPositionKeysMap, "setObject:forKeyedSubscript:", &unk_24EBCD1E0, CFSTR("left"));
  objc_msgSend((id)tv_position_sPositionKeysMap, "setObject:forKeyedSubscript:", &unk_24EBCD1F8, CFSTR("right"));
  objc_msgSend((id)tv_position_sPositionKeysMap, "setObject:forKeyedSubscript:", &unk_24EBCD210, CFSTR("top-left"));
  objc_msgSend((id)tv_position_sPositionKeysMap, "setObject:forKeyedSubscript:", &unk_24EBCD228, CFSTR("top-right"));
  objc_msgSend((id)tv_position_sPositionKeysMap, "setObject:forKeyedSubscript:", &unk_24EBCD240, CFSTR("bottom-left"));
  objc_msgSend((id)tv_position_sPositionKeysMap, "setObject:forKeyedSubscript:", &unk_24EBCD258, CFSTR("bottom-right"));
  objc_msgSend((id)tv_position_sPositionKeysMap, "setObject:forKeyedSubscript:", &unk_24EBCD270, CFSTR("header"));
  objc_msgSend((id)tv_position_sPositionKeysMap, "setObject:forKeyedSubscript:", &unk_24EBCD288, CFSTR("footer"));
  objc_msgSend((id)tv_position_sPositionKeysMap, "setObject:forKeyedSubscript:", &unk_24EBCD2A0, CFSTR("leading"));
  objc_msgSend((id)tv_position_sPositionKeysMap, "setObject:forKeyedSubscript:", &unk_24EBCD2B8, CFSTR("trailing"));
  objc_msgSend((id)tv_position_sPositionKeysMap, "setObject:forKeyedSubscript:", &unk_24EBCD2D0, CFSTR("top-leading"));
  objc_msgSend((id)tv_position_sPositionKeysMap, "setObject:forKeyedSubscript:", &unk_24EBCD2E8, CFSTR("top-trailing"));
  objc_msgSend((id)tv_position_sPositionKeysMap, "setObject:forKeyedSubscript:", &unk_24EBCD300, CFSTR("bottom-leading"));
  return objc_msgSend((id)tv_position_sPositionKeysMap, "setObject:forKeyedSubscript:", &unk_24EBCD318, CFSTR("bottom-trailing"));
}

uint64_t __59__IKViewElementStyle_TVMLKitAdditions__tv_contentAlignment__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v1 = (void *)tv_contentAlignment_sAlignmentKeysMap;
  tv_contentAlignment_sAlignmentKeysMap = (uint64_t)v0;

  objc_msgSend((id)tv_contentAlignment_sAlignmentKeysMap, "setObject:forKeyedSubscript:", &unk_24EBCD198, CFSTR("top"));
  objc_msgSend((id)tv_contentAlignment_sAlignmentKeysMap, "setObject:forKeyedSubscript:", &unk_24EBCD1B0, CFSTR("center"));
  return objc_msgSend((id)tv_contentAlignment_sAlignmentKeysMap, "setObject:forKeyedSubscript:", &unk_24EBCD1C8, CFSTR("bottom"));
}

uint64_t __55__IKViewElementStyle_TVMLKitAdditions__tv_symbolWeight__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v1 = (void *)tv_symbolWeight_sSymbolWeightMap;
  tv_symbolWeight_sSymbolWeightMap = (uint64_t)v0;

  objc_msgSend((id)tv_symbolWeight_sSymbolWeightMap, "setObject:forKeyedSubscript:", &unk_24EBCD198, CFSTR("ultralight"));
  objc_msgSend((id)tv_symbolWeight_sSymbolWeightMap, "setObject:forKeyedSubscript:", &unk_24EBCD1B0, CFSTR("thin"));
  objc_msgSend((id)tv_symbolWeight_sSymbolWeightMap, "setObject:forKeyedSubscript:", &unk_24EBCD1C8, CFSTR("light"));
  objc_msgSend((id)tv_symbolWeight_sSymbolWeightMap, "setObject:forKeyedSubscript:", &unk_24EBCD1E0, CFSTR("regular"));
  objc_msgSend((id)tv_symbolWeight_sSymbolWeightMap, "setObject:forKeyedSubscript:", &unk_24EBCD1F8, CFSTR("medium"));
  objc_msgSend((id)tv_symbolWeight_sSymbolWeightMap, "setObject:forKeyedSubscript:", &unk_24EBCD210, CFSTR("semibold"));
  objc_msgSend((id)tv_symbolWeight_sSymbolWeightMap, "setObject:forKeyedSubscript:", &unk_24EBCD228, CFSTR("bold"));
  objc_msgSend((id)tv_symbolWeight_sSymbolWeightMap, "setObject:forKeyedSubscript:", &unk_24EBCD240, CFSTR("heavy"));
  return objc_msgSend((id)tv_symbolWeight_sSymbolWeightMap, "setObject:forKeyedSubscript:", &unk_24EBCD258, CFSTR("black"));
}

uint64_t __54__IKViewElementStyle_TVMLKitAdditions__tv_symbolScale__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v1 = (void *)tv_symbolScale_sSymbolScaleMap;
  tv_symbolScale_sSymbolScaleMap = (uint64_t)v0;

  objc_msgSend((id)tv_symbolScale_sSymbolScaleMap, "setObject:forKeyedSubscript:", &unk_24EBCD330, CFSTR("default"));
  objc_msgSend((id)tv_symbolScale_sSymbolScaleMap, "setObject:forKeyedSubscript:", &unk_24EBCD180, CFSTR("unspecified"));
  objc_msgSend((id)tv_symbolScale_sSymbolScaleMap, "setObject:forKeyedSubscript:", &unk_24EBCD198, CFSTR("small"));
  objc_msgSend((id)tv_symbolScale_sSymbolScaleMap, "setObject:forKeyedSubscript:", &unk_24EBCD1B0, CFSTR("medium"));
  return objc_msgSend((id)tv_symbolScale_sSymbolScaleMap, "setObject:forKeyedSubscript:", &unk_24EBCD1C8, CFSTR("large"));
}

uint64_t __58__IKViewElementStyle_TVMLKitAdditions__tv_symbolTextStyle__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v1 = (void *)tv_symbolTextStyle_sSymbolTextStyleMap;
  tv_symbolTextStyle_sSymbolTextStyleMap = (uint64_t)v0;

  objc_msgSend((id)tv_symbolTextStyle_sSymbolTextStyleMap, "setObject:forKeyedSubscript:", *MEMORY[0x24BDF7800], CFSTR("largetitle"));
  objc_msgSend((id)tv_symbolTextStyle_sSymbolTextStyleMap, "setObject:forKeyedSubscript:", *MEMORY[0x24BDF7848], CFSTR("title1"));
  objc_msgSend((id)tv_symbolTextStyle_sSymbolTextStyleMap, "setObject:forKeyedSubscript:", *MEMORY[0x24BDF7850], CFSTR("title2"));
  objc_msgSend((id)tv_symbolTextStyle_sSymbolTextStyleMap, "setObject:forKeyedSubscript:", *MEMORY[0x24BDF7858], CFSTR("title3"));
  objc_msgSend((id)tv_symbolTextStyle_sSymbolTextStyleMap, "setObject:forKeyedSubscript:", *MEMORY[0x24BDF77E8], CFSTR("headline"));
  objc_msgSend((id)tv_symbolTextStyle_sSymbolTextStyleMap, "setObject:forKeyedSubscript:", *MEMORY[0x24BDF7810], CFSTR("subheadline"));
  objc_msgSend((id)tv_symbolTextStyle_sSymbolTextStyleMap, "setObject:forKeyedSubscript:", *MEMORY[0x24BDF77B0], CFSTR("body"));
  objc_msgSend((id)tv_symbolTextStyle_sSymbolTextStyleMap, "setObject:forKeyedSubscript:", *MEMORY[0x24BDF77B8], CFSTR("callout"));
  objc_msgSend((id)tv_symbolTextStyle_sSymbolTextStyleMap, "setObject:forKeyedSubscript:", *MEMORY[0x24BDF77D0], CFSTR("footnote"));
  objc_msgSend((id)tv_symbolTextStyle_sSymbolTextStyleMap, "setObject:forKeyedSubscript:", *MEMORY[0x24BDF77C0], CFSTR("caption1"));
  return objc_msgSend((id)tv_symbolTextStyle_sSymbolTextStyleMap, "setObject:forKeyedSubscript:", *MEMORY[0x24BDF77C8], CFSTR("caption2"));
}

@end
