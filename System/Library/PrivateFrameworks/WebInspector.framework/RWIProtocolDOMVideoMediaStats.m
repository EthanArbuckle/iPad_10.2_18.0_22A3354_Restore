@implementation RWIProtocolDOMVideoMediaStats

- (RWIProtocolDOMVideoMediaStats)initWithBitrate:(int)a3 codec:(id)a4 humanReadableCodecString:(id)a5 colorSpace:(id)a6 framerate:(double)a7 height:(int)a8 width:(int)a9
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v14;
  id v16;
  id v17;
  id v18;
  RWIProtocolDOMVideoMediaStats *v19;
  RWIProtocolDOMVideoMediaStats *v20;
  objc_super v22;

  v9 = *(_QWORD *)&a9;
  v10 = *(_QWORD *)&a8;
  v14 = *(_QWORD *)&a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v22.receiver = self;
  v22.super_class = (Class)RWIProtocolDOMVideoMediaStats;
  v19 = -[RWIProtocolJSONObject init](&v22, sel_init);
  if (v19)
  {
    if (!v16)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required property '%@' cannot be nil"), CFSTR("codec"));
    if (!v17)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required property '%@' cannot be nil"), CFSTR("humanReadableCodecString"));
    if (!v18)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required property '%@' cannot be nil"), CFSTR("colorSpace"));
    -[RWIProtocolDOMVideoMediaStats setBitrate:](v19, "setBitrate:", v14);
    -[RWIProtocolDOMVideoMediaStats setCodec:](v19, "setCodec:", v16);
    -[RWIProtocolDOMVideoMediaStats setHumanReadableCodecString:](v19, "setHumanReadableCodecString:", v17);
    -[RWIProtocolDOMVideoMediaStats setColorSpace:](v19, "setColorSpace:", v18);
    -[RWIProtocolDOMVideoMediaStats setFramerate:](v19, "setFramerate:", a7);
    -[RWIProtocolDOMVideoMediaStats setHeight:](v19, "setHeight:", v10);
    -[RWIProtocolDOMVideoMediaStats setWidth:](v19, "setWidth:", v9);
    v20 = v19;
  }

  return v19;
}

- (void)setBitrate:(int)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMVideoMediaStats;
  -[RWIProtocolJSONObject setInteger:forKey:](&v3, sel_setInteger_forKey_, *(_QWORD *)&a3, CFSTR("bitrate"));
}

- (int)bitrate
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMVideoMediaStats;
  return -[RWIProtocolJSONObject integerForKey:](&v3, sel_integerForKey_, CFSTR("bitrate"));
}

- (void)setCodec:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMVideoMediaStats;
  -[RWIProtocolJSONObject setString:forKey:](&v3, sel_setString_forKey_, a3, CFSTR("codec"));
}

- (NSString)codec
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMVideoMediaStats;
  -[RWIProtocolJSONObject stringForKey:](&v3, sel_stringForKey_, CFSTR("codec"));
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setHumanReadableCodecString:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMVideoMediaStats;
  -[RWIProtocolJSONObject setString:forKey:](&v3, sel_setString_forKey_, a3, CFSTR("humanReadableCodecString"));
}

- (NSString)humanReadableCodecString
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMVideoMediaStats;
  -[RWIProtocolJSONObject stringForKey:](&v3, sel_stringForKey_, CFSTR("humanReadableCodecString"));
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setColorSpace:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMVideoMediaStats;
  -[RWIProtocolJSONObject setObject:forKey:](&v3, sel_setObject_forKey_, a3, CFSTR("colorSpace"));
}

- (RWIProtocolDOMVideoColorSpace)colorSpace
{
  void *v3;
  RWIProtocolDOMVideoColorSpace *v4;
  void *v5;
  _DWORD *v6;
  RWIProtocolDOMVideoColorSpace *v7;
  _DWORD *v8;
  _DWORD *v9;
  objc_super v11;
  _DWORD *v12;
  _DWORD *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)RWIProtocolDOMVideoMediaStats;
  -[RWIProtocolJSONObject objectForKey:](&v14, sel_objectForKey_, CFSTR("colorSpace"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = [RWIProtocolDOMVideoColorSpace alloc];
    v11.receiver = self;
    v11.super_class = (Class)RWIProtocolDOMVideoMediaStats;
    -[RWIProtocolJSONObject objectForKey:](&v11, sel_objectForKey_, CFSTR("colorSpace"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "toJSONObject");
    v6 = v12;
    ++*v12;
    v13 = v6;
    v7 = -[RWIProtocolJSONObject initWithJSONObject:](v4, "initWithJSONObject:", &v13);
    v8 = v13;
    v13 = 0;
    if (v8)
    {
      if (*v8 == 1)
        WTF::JSONImpl::Value::operator delete();
      else
        --*v8;
    }
    v9 = v12;
    v12 = 0;
    if (v9)
    {
      if (*v9 == 1)
        WTF::JSONImpl::Value::operator delete();
      else
        --*v9;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)setFramerate:(double)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMVideoMediaStats;
  -[RWIProtocolJSONObject setDouble:forKey:](&v3, sel_setDouble_forKey_, CFSTR("framerate"), a3);
}

- (double)framerate
{
  double result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMVideoMediaStats;
  -[RWIProtocolJSONObject doubleForKey:](&v3, sel_doubleForKey_, CFSTR("framerate"));
  return result;
}

- (void)setHeight:(int)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMVideoMediaStats;
  -[RWIProtocolJSONObject setInteger:forKey:](&v3, sel_setInteger_forKey_, *(_QWORD *)&a3, CFSTR("height"));
}

- (int)height
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMVideoMediaStats;
  return -[RWIProtocolJSONObject integerForKey:](&v3, sel_integerForKey_, CFSTR("height"));
}

- (void)setWidth:(int)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMVideoMediaStats;
  -[RWIProtocolJSONObject setInteger:forKey:](&v3, sel_setInteger_forKey_, *(_QWORD *)&a3, CFSTR("width"));
}

- (int)width
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMVideoMediaStats;
  return -[RWIProtocolJSONObject integerForKey:](&v3, sel_integerForKey_, CFSTR("width"));
}

@end
