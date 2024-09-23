@implementation VTEventAudioCorrupt

- (id)_buildTitle
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[VTEvent timestampString](self, "timestampString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("Audio Corrupt : %@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_buildContent
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTEventAudioCorrupt _packNumberFomVTEventInfo:key:format:](self, "_packNumberFomVTEventInfo:key:format:", CFSTR("Zeros Samples in Seconds"), CFSTR("zero-in-seconds"), CFSTR("%.2fs"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  return v3;
}

- (id)_buildDetail
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTEvent _packStringContent:value:](self, "_packStringContent:value:", CFSTR("Type"), CFSTR("Audio Corrupt"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  -[VTEventAudioCorrupt _packNumberFomVTEventInfo:key:format:](self, "_packNumberFomVTEventInfo:key:format:", CFSTR("Zeros Samples in Seconds"), CFSTR("zero-in-seconds"), CFSTR("%.2fs"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v5);

  -[VTEventAudioCorrupt _packNumberFomVTEventInfo:key:format:](self, "_packNumberFomVTEventInfo:key:format:", CFSTR("Num Zero Samples"), CFSTR("num-zero-samples"), CFSTR("%.0f"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v6);

  return v3;
}

@end
