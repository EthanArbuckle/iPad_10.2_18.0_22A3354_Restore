@implementation UARPTLVPersonalizationPayloadTagBackDeploy

- (UARPTLVPersonalizationPayloadTagBackDeploy)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UARPTLVPersonalizationPayloadTagBackDeploy;
  return -[UARPMetaDataTLVBackDeploy init](&v3, "init");
}

- (void)setTag:(id)a3
{
  id v4;
  UARPTLVPersonalizationPayloadTagBackDeploy *v5;
  id v6;
  void *v7;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = objc_msgSend(v4, "copy");
  v7 = *(void **)(&v5->super._tlvLength + 1);
  *(_QWORD *)(&v5->super._tlvLength + 1) = v6;

  objc_sync_exit(v5);
}

- (id)description
{
  id v3;
  id v4;
  NSString *v5;

  v3 = +[UARPTLVPersonalizationPayloadTagBackDeploy metaDataTableEntry](UARPTLVPersonalizationPayloadTagBackDeploy, "metaDataTableEntry");
  v4 = objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Name"));
  v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %@>"), v4, *(_QWORD *)(&self->super._tlvLength + 1));

  return v5;
}

+ (unsigned)tlvType
{
  return -2001563391;
}

- (id)generateTLV
{
  id v3;
  id v4;
  NSData *v5;
  int v7;
  int v8;

  v3 = objc_alloc_init((Class)NSMutableData);
  v8 = uarpHtonl(+[UARPTLVPersonalizationPayloadTagBackDeploy tlvType](UARPTLVPersonalizationPayloadTagBackDeploy, "tlvType"));
  objc_msgSend(v3, "appendBytes:length:", &v8, 4);
  v7 = uarpHtonl(4u);
  objc_msgSend(v3, "appendBytes:length:", &v7, 4);
  v4 = -[UARPTLVPersonalizationPayloadTagBackDeploy tlvValue](self, "tlvValue");
  objc_msgSend(v3, "appendData:", v4);

  v5 = +[NSData dataWithData:](NSData, "dataWithData:", v3);
  return v5;
}

- (id)tlvValue
{
  unsigned int v3;

  v3 = objc_msgSend(*(id *)(&self->super._tlvLength + 1), "tag");
  return objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", &v3, 4);
}

+ (id)metaDataTableEntry
{
  NSNumber *v2;
  NSDictionary *v3;
  _QWORD v5[2];
  _QWORD v6[2];

  v6[0] = CFSTR("Personalization Payload Tag");
  v5[0] = CFSTR("Name");
  v5[1] = CFSTR("Value");
  v2 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", +[UARPTLVPersonalizationPayloadTagBackDeploy tlvType](UARPTLVPersonalizationPayloadTagBackDeploy, "tlvType"));
  v6[1] = v2;
  v3 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v6, v5, 2);

  return v3;
}

+ (id)tlvFromPropertyListValue:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  char *v6;
  UARPTLVPersonalizationPayloadTagBackDeploy *v7;
  UARPAssetTagBackDeploy *v8;

  v3 = a3;
  v4 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
  {
    v5 = v3;
    if (objc_msgSend(v5, "length") == (id)4)
    {
      v6 = (char *)objc_msgSend(objc_retainAutorelease(v5), "UTF8String");
      v7 = objc_opt_new(UARPTLVPersonalizationPayloadTagBackDeploy);
      v8 = -[UARPAssetTagBackDeploy initWithChar1:char2:char3:char4:]([UARPAssetTagBackDeploy alloc], "initWithChar1:char2:char3:char4:", *v6, v6[1], v6[2], v6[3]);
      -[UARPTLVPersonalizationPayloadTagBackDeploy setTag:](v7, "setTag:", v8);

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)tlvWithLength:(unint64_t)a3 value:(void *)a4
{
  UARPTLVPersonalizationPayloadTagBackDeploy *v5;
  UARPAssetTagBackDeploy *v6;

  if (a3 == 4)
  {
    v5 = objc_opt_new(UARPTLVPersonalizationPayloadTagBackDeploy);
    v6 = -[UARPAssetTagBackDeploy initWithChar1:char2:char3:char4:]([UARPAssetTagBackDeploy alloc], "initWithChar1:char2:char3:char4:", *(char *)a4, *((char *)a4 + 1), *((char *)a4 + 2), *((char *)a4 + 3));
    -[UARPTLVPersonalizationPayloadTagBackDeploy setTag:](v5, "setTag:", v6);

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (UARPAssetTagBackDeploy)tag
{
  return (UARPAssetTagBackDeploy *)objc_getProperty(self, a2, 28, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)(&self->super._tlvLength + 1), 0);
}

@end
