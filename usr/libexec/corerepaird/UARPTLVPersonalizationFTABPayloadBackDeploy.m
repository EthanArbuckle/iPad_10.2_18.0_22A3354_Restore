@implementation UARPTLVPersonalizationFTABPayloadBackDeploy

- (UARPTLVPersonalizationFTABPayloadBackDeploy)init
{
  char *v2;
  NSMutableArray *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UARPTLVPersonalizationFTABPayloadBackDeploy;
  v2 = -[UARPMetaDataTLVBackDeploy init](&v6, "init");
  if (v2)
  {
    v3 = objc_opt_new(NSMutableArray);
    v4 = *(void **)(v2 + 28);
    *(_QWORD *)(v2 + 28) = v3;

  }
  return (UARPTLVPersonalizationFTABPayloadBackDeploy *)v2;
}

- (void)setTLVs:(id)a3
{
  id v4;
  char *v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;

  v4 = objc_retainAutorelease(a3);
  v5 = (char *)objc_msgSend(v4, "bytes");
  if (objc_msgSend(v4, "length"))
  {
    v6 = 0;
    do
    {
      if (v6 + 4 > (unint64_t)objc_msgSend(v4, "length"))
        break;
      v7 = uarpNtohl(*(_DWORD *)&v5[v6]);
      v8 = v6 + 8;
      if (v6 + 8 > (unint64_t)objc_msgSend(v4, "length"))
        break;
      v9 = uarpNtohl(*(_DWORD *)&v5[v6 + 4]);
      v6 = v8 + v9;
      if (v6 > (unint64_t)objc_msgSend(v4, "length"))
        break;
      v10 = +[UARPMetaDataTLVBackDeploy tlvFromType:length:value:](UARPMetaDataTLVBackDeploy, "tlvFromType:length:value:", v7, v9, &v5[v8]);
      if (!v10)
        break;
      v11 = v10;
      objc_msgSend(*(id *)(&self->super._tlvLength + 1), "addObject:", v10);

    }
    while (v6 < (unint64_t)objc_msgSend(v4, "length"));
  }

}

- (id)description
{
  id v3;
  NSMutableString *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  NSString *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v3 = +[UARPTLVPersonalizationFTABPayloadBackDeploy metaDataTableEntry](UARPTLVPersonalizationFTABPayloadBackDeploy, "metaDataTableEntry");
  v4 = objc_opt_new(NSMutableString);
  v5 = objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Name"));
  -[NSMutableString appendFormat:](v4, "appendFormat:", CFSTR("<%@: \r"), v5);

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = *(id *)(&self->super._tlvLength + 1);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
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
        -[NSMutableString appendFormat:](v4, "appendFormat:", CFSTR("        <%@>\r"), *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v10));
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  -[NSMutableString appendFormat:](v4, "appendFormat:", CFSTR("    >"));
  v11 = +[NSString stringWithString:](NSString, "stringWithString:", v4);

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
  NSNumber *v2;
  NSDictionary *v3;
  _QWORD v5[2];
  _QWORD v6[2];

  v6[0] = CFSTR("Personalization FTAB Payload");
  v5[0] = CFSTR("Name");
  v5[1] = CFSTR("Value");
  v2 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", +[UARPTLVPersonalizationFTABPayloadBackDeploy tlvType](UARPTLVPersonalizationFTABPayloadBackDeploy, "tlvType"));
  v6[1] = v2;
  v3 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v6, v5, 2);

  return v3;
}

+ (id)tlvFromPropertyListValue:(id)a3
{
  return 0;
}

+ (id)tlvWithLength:(unint64_t)a3 value:(void *)a4
{
  NSData *v4;
  UARPTLVPersonalizationFTABPayloadBackDeploy *v5;

  v4 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", a4, a3);
  v5 = objc_opt_new(UARPTLVPersonalizationFTABPayloadBackDeploy);
  -[UARPTLVPersonalizationFTABPayloadBackDeploy setTLVs:](v5, "setTLVs:", v4);

  return v5;
}

- (NSArray)tlvs
{
  return (NSArray *)objc_getProperty(self, a2, 28, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)(&self->super._tlvLength + 1), 0);
}

@end
