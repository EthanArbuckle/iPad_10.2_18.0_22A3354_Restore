@implementation VTEventNearTrigger

- (id)_buildTitle
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[VTEvent timestampString](self, "timestampString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("Near Trigger : %@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_buildContent
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VTEventNearTrigger;
  -[VTEvent _buildTriggerContent](&v3, sel__buildTriggerContent);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_buildDetail
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTEvent _packAudioURLFromVTEventInfo:key:](self, "_packAudioURLFromVTEventInfo:key:", CFSTR("Audio Play"), CFSTR("captureFilePath"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  -[VTEvent _packStringContent:value:](self, "_packStringContent:value:", CFSTR("Type"), CFSTR("Near Triggered"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v5);

  v8.receiver = self;
  v8.super_class = (Class)VTEventNearTrigger;
  -[VTEvent _buildTriggerDetail](&v8, sel__buildTriggerDetail);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v6);

  return v3;
}

@end
