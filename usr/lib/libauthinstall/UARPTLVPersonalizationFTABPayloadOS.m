@implementation UARPTLVPersonalizationFTABPayloadOS

- (UARPTLVPersonalizationFTABPayloadOS)init
{
  UARPTLVPersonalizationFTABPayloadOS *v2;
  uint64_t v3;
  NSMutableArray *tlvs;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UARPTLVPersonalizationFTABPayloadOS;
  v2 = -[UARPMetaDataTLVOS init](&v6, sel_init);
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
  id v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;

  v4 = objc_retainAutorelease(a3);
  v5 = objc_msgSend(v4, "bytes");
  if (objc_msgSend(v4, "length"))
  {
    v6 = 0;
    do
    {
      if (v6 + 4 > objc_msgSend(v4, "length"))
        break;
      v7 = uarpHtonl(*(_DWORD *)(v5 + v6));
      v8 = v6 + 8;
      if (v6 + 8 > objc_msgSend(v4, "length"))
        break;
      v9 = uarpHtonl(*(_DWORD *)(v5 + v6 + 4));
      v6 = v8 + v9;
      if (v6 > objc_msgSend(v4, "length"))
        break;
      v10 = +[UARPMetaDataTLVOS tlvFromType:length:value:](UARPMetaDataTLVOS, "tlvFromType:length:value:", v7, v9, v5 + v8);
      if (!v10)
        break;
      v11 = v10;
      -[NSMutableArray addObject:](self->_tlvs, "addObject:", v10);

    }
    while (v6 < objc_msgSend(v4, "length"));
  }

}

- (id)description
{
  id v3;
  void *v4;
  id v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = +[UARPTLVPersonalizationFTABPayloadOS metaDataTableEntry](UARPTLVPersonalizationFTABPayloadOS, "metaDataTableEntry");
  v4 = (void *)objc_opt_new();
  v5 = (id)objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Name"));
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
  v11 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", v4);

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
  id v2;
  id v3;
  _QWORD v5[2];
  _QWORD v6[3];

  v6[2] = *MEMORY[0x24BDAC8D0];
  v6[0] = CFSTR("Personalization FTAB Payload");
  v5[0] = CFSTR("Name");
  v5[1] = CFSTR("Value");
  v2 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", +[UARPTLVPersonalizationFTABPayloadOS tlvType](UARPTLVPersonalizationFTABPayloadOS, "tlvType"));
  v6[1] = v2;
  v3 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, v5, 2);

  return v3;
}

+ (id)tlvFromPropertyListValue:(id)a3
{
  return 0;
}

+ (id)tlvWithLength:(unint64_t)a3 value:(void *)a4
{
  id v4;
  void *v5;

  v4 = (id)objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", a4, a3);
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
