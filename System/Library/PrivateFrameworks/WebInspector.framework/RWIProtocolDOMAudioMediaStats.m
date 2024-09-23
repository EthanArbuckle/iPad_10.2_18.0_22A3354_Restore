@implementation RWIProtocolDOMAudioMediaStats

- (RWIProtocolDOMAudioMediaStats)initWithBitrate:(int)a3 codec:(id)a4 humanReadableCodecString:(id)a5 numberOfChannels:(int)a6 sampleRate:(double)a7
{
  uint64_t v8;
  uint64_t v10;
  id v12;
  id v13;
  RWIProtocolDOMAudioMediaStats *v14;
  RWIProtocolDOMAudioMediaStats *v15;
  objc_super v17;

  v8 = *(_QWORD *)&a6;
  v10 = *(_QWORD *)&a3;
  v12 = a4;
  v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)RWIProtocolDOMAudioMediaStats;
  v14 = -[RWIProtocolJSONObject init](&v17, sel_init);
  if (v14)
  {
    if (!v12)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required property '%@' cannot be nil"), CFSTR("codec"));
    if (!v13)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required property '%@' cannot be nil"), CFSTR("humanReadableCodecString"));
    -[RWIProtocolDOMAudioMediaStats setBitrate:](v14, "setBitrate:", v10);
    -[RWIProtocolDOMAudioMediaStats setCodec:](v14, "setCodec:", v12);
    -[RWIProtocolDOMAudioMediaStats setHumanReadableCodecString:](v14, "setHumanReadableCodecString:", v13);
    -[RWIProtocolDOMAudioMediaStats setNumberOfChannels:](v14, "setNumberOfChannels:", v8);
    -[RWIProtocolDOMAudioMediaStats setSampleRate:](v14, "setSampleRate:", a7);
    v15 = v14;
  }

  return v14;
}

- (void)setBitrate:(int)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMAudioMediaStats;
  -[RWIProtocolJSONObject setInteger:forKey:](&v3, sel_setInteger_forKey_, *(_QWORD *)&a3, CFSTR("bitrate"));
}

- (int)bitrate
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMAudioMediaStats;
  return -[RWIProtocolJSONObject integerForKey:](&v3, sel_integerForKey_, CFSTR("bitrate"));
}

- (void)setCodec:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMAudioMediaStats;
  -[RWIProtocolJSONObject setString:forKey:](&v3, sel_setString_forKey_, a3, CFSTR("codec"));
}

- (NSString)codec
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMAudioMediaStats;
  -[RWIProtocolJSONObject stringForKey:](&v3, sel_stringForKey_, CFSTR("codec"));
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setHumanReadableCodecString:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMAudioMediaStats;
  -[RWIProtocolJSONObject setString:forKey:](&v3, sel_setString_forKey_, a3, CFSTR("humanReadableCodecString"));
}

- (NSString)humanReadableCodecString
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMAudioMediaStats;
  -[RWIProtocolJSONObject stringForKey:](&v3, sel_stringForKey_, CFSTR("humanReadableCodecString"));
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setNumberOfChannels:(int)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMAudioMediaStats;
  -[RWIProtocolJSONObject setInteger:forKey:](&v3, sel_setInteger_forKey_, *(_QWORD *)&a3, CFSTR("numberOfChannels"));
}

- (int)numberOfChannels
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMAudioMediaStats;
  return -[RWIProtocolJSONObject integerForKey:](&v3, sel_integerForKey_, CFSTR("numberOfChannels"));
}

- (void)setSampleRate:(double)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMAudioMediaStats;
  -[RWIProtocolJSONObject setDouble:forKey:](&v3, sel_setDouble_forKey_, CFSTR("sampleRate"), a3);
}

- (double)sampleRate
{
  double result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMAudioMediaStats;
  -[RWIProtocolJSONObject doubleForKey:](&v3, sel_doubleForKey_, CFSTR("sampleRate"));
  return result;
}

@end
