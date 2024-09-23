@implementation UARPTLVPersonalizationFTABPayload

- (UARPTLVPersonalizationFTABPayload)init
{
  UARPTLVPersonalizationFTABPayload *v2;
  uint64_t v3;
  NSMutableArray *tlvs;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UARPTLVPersonalizationFTABPayload;
  v2 = -[UARPMetaDataTLV init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    tlvs = v2->_tlvs;
    v2->_tlvs = (NSMutableArray *)v3;

  }
  return v2;
}

- (void)setTLVs:(id)a3
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = objc_retainAutorelease(a3);
  v4 = objc_msgSend(v11, "bytes");
  if (objc_msgSend(v11, "length"))
  {
    v5 = 0;
    do
    {
      if (v5 + 4 > objc_msgSend(v11, "length"))
        break;
      v6 = uarpNtohl(*(_DWORD *)(v4 + v5));
      v7 = v5 + 8;
      if (v5 + 8 > objc_msgSend(v11, "length"))
        break;
      v8 = uarpNtohl(*(_DWORD *)(v4 + v5 + 4));
      v5 = v7 + v8;
      if (v5 > objc_msgSend(v11, "length"))
        break;
      +[UARPMetaDataTLV tlvFromType:length:value:](UARPMetaDataTLV, "tlvFromType:length:value:", v6, v8, v4 + v7);
      v9 = objc_claimAutoreleasedReturnValue();
      if (!v9)
        break;
      v10 = (void *)v9;
      -[NSMutableArray addObject:](self->_tlvs, "addObject:", v9);

    }
    while (v5 < objc_msgSend(v11, "length"));
  }

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  +[UARPTLVPersonalizationFTABPayload metaDataTableEntry](UARPTLVPersonalizationFTABPayload, "metaDataTableEntry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Name"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("<%@: \r"), v5);

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = self->_tlvs;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(v4, "appendFormat:", CFSTR("        <%@>\r"), *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10++));
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  objc_msgSend(v4, "appendFormat:", CFSTR("    >"));
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (unsigned)tlvType
{
  return -2001563376;
}

- (id)generateTLV
{
  return 0;
}

- (id)tlvValue
{
  return 0;
}

+ (id)metaDataTableEntry
{
  void *v2;
  void *v3;
  _QWORD v5[2];
  _QWORD v6[3];

  v6[2] = *MEMORY[0x24BDAC8D0];
  v6[0] = CFSTR("Personalization FTAB Payload");
  v5[0] = CFSTR("Name");
  v5[1] = CFSTR("Value");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", +[UARPTLVPersonalizationFTABPayload tlvType](UARPTLVPersonalizationFTABPayload, "tlvType"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v2;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, v5, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)tlvFromPropertyListValue:(id)a3
{
  return 0;
}

+ (id)tlvWithLength:(unint64_t)a3 value:(void *)a4
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", a4, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "setTLVs:", v4);

  return v5;
}

- (NSArray)tlvs
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tlvs, 0);
}

@end
