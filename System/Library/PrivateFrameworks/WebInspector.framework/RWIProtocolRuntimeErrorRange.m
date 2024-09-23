@implementation RWIProtocolRuntimeErrorRange

- (RWIProtocolRuntimeErrorRange)initWithStartOffset:(int)a3 endOffset:(int)a4
{
  uint64_t v4;
  uint64_t v5;
  RWIProtocolRuntimeErrorRange *v6;
  RWIProtocolRuntimeErrorRange *v7;
  RWIProtocolRuntimeErrorRange *v8;
  objc_super v10;

  v4 = *(_QWORD *)&a4;
  v5 = *(_QWORD *)&a3;
  v10.receiver = self;
  v10.super_class = (Class)RWIProtocolRuntimeErrorRange;
  v6 = -[RWIProtocolJSONObject init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    -[RWIProtocolRuntimeErrorRange setStartOffset:](v6, "setStartOffset:", v5);
    -[RWIProtocolRuntimeErrorRange setEndOffset:](v7, "setEndOffset:", v4);
    v8 = v7;
  }

  return v7;
}

- (void)setStartOffset:(int)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimeErrorRange;
  -[RWIProtocolJSONObject setInteger:forKey:](&v3, sel_setInteger_forKey_, *(_QWORD *)&a3, CFSTR("startOffset"));
}

- (int)startOffset
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimeErrorRange;
  return -[RWIProtocolJSONObject integerForKey:](&v3, sel_integerForKey_, CFSTR("startOffset"));
}

- (void)setEndOffset:(int)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimeErrorRange;
  -[RWIProtocolJSONObject setInteger:forKey:](&v3, sel_setInteger_forKey_, *(_QWORD *)&a3, CFSTR("endOffset"));
}

- (int)endOffset
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimeErrorRange;
  return -[RWIProtocolJSONObject integerForKey:](&v3, sel_integerForKey_, CFSTR("endOffset"));
}

@end
