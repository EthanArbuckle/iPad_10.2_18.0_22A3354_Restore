@implementation REKeywordTokenForString

void __REKeywordTokenForString_block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t i;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(&unk_24CFC1C70, "count"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v1 = objc_msgSend(&unk_24CFC1C70, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v1)
  {
    v2 = v1;
    v3 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v2; ++i)
      {
        if (*(_QWORD *)v10 != v3)
          objc_enumerationMutation(&unk_24CFC1C70);
        v5 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
        REDescriptionForTokenType(objc_msgSend(v5, "unsignedIntegerValue"));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v0, "setObject:forKeyedSubscript:", v5, v6);

      }
      v2 = objc_msgSend(&unk_24CFC1C70, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v2);
  }
  v7 = objc_msgSend(v0, "copy");
  v8 = (void *)REKeywordTokenForString_KeywordTokenMap;
  REKeywordTokenForString_KeywordTokenMap = v7;

}

@end
