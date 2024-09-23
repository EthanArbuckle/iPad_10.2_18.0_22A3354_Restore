@implementation VTEventPrepare

- (id)_buildTitle
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[VTEvent timestampString](self, "timestampString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("Prepare : %@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_buildContent
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTEventPrepare _packNumberFomVTEventInfo:key:format:](self, "_packNumberFomVTEventInfo:key:format:", CFSTR("Trigger Woke AP"), CFSTR("trigger-woke-ap"), CFSTR("%.0f"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  -[VTEventPrepare _packNumberFomVTEventInfo:key:format:](self, "_packNumberFomVTEventInfo:key:format:", CFSTR("VoiceTrigger Started"), CFSTR("trigger-start-time"), CFSTR("%.2fms"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v5);

  return v3;
}

- (id)_buildDetail
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTEventPrepare _packNumberFomVTEventInfo:key:format:](self, "_packNumberFomVTEventInfo:key:format:", CFSTR("Trigger Woke AP"), CFSTR("trigger-woke-ap"), CFSTR("%.0f"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  -[VTEventPrepare _packNumberFomVTEventInfo:key:format:](self, "_packNumberFomVTEventInfo:key:format:", CFSTR("VoiceTrigger Started"), CFSTR("trigger-start-time"), CFSTR("%.2fms"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v5);

  -[VTEventPrepare _packNumberFomVTEventInfo:key:format:](self, "_packNumberFomVTEventInfo:key:format:", CFSTR("Trigger Time"), CFSTR("trigger-time"), CFSTR("%.0f"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v6);

  -[VTEventPrepare _packNumberFomVTEventInfo:key:format:](self, "_packNumberFomVTEventInfo:key:format:", CFSTR("Current HostTime"), CFSTR("currentHostTime"), CFSTR("%.0f"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v7);

  return v3;
}

@end
