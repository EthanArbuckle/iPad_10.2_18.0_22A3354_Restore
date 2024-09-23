@implementation RWIProtocolRuntimeBasicBlock

- (RWIProtocolRuntimeBasicBlock)initWithStartOffset:(int)a3 endOffset:(int)a4 hasExecuted:(BOOL)a5 executionCount:(int)a6
{
  uint64_t v6;
  _BOOL8 v7;
  uint64_t v8;
  uint64_t v9;
  RWIProtocolRuntimeBasicBlock *v10;
  RWIProtocolRuntimeBasicBlock *v11;
  RWIProtocolRuntimeBasicBlock *v12;
  objc_super v14;

  v6 = *(_QWORD *)&a6;
  v7 = a5;
  v8 = *(_QWORD *)&a4;
  v9 = *(_QWORD *)&a3;
  v14.receiver = self;
  v14.super_class = (Class)RWIProtocolRuntimeBasicBlock;
  v10 = -[RWIProtocolJSONObject init](&v14, sel_init);
  v11 = v10;
  if (v10)
  {
    -[RWIProtocolRuntimeBasicBlock setStartOffset:](v10, "setStartOffset:", v9);
    -[RWIProtocolRuntimeBasicBlock setEndOffset:](v11, "setEndOffset:", v8);
    -[RWIProtocolRuntimeBasicBlock setHasExecuted:](v11, "setHasExecuted:", v7);
    -[RWIProtocolRuntimeBasicBlock setExecutionCount:](v11, "setExecutionCount:", v6);
    v12 = v11;
  }

  return v11;
}

- (void)setStartOffset:(int)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimeBasicBlock;
  -[RWIProtocolJSONObject setInteger:forKey:](&v3, sel_setInteger_forKey_, *(_QWORD *)&a3, CFSTR("startOffset"));
}

- (int)startOffset
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimeBasicBlock;
  return -[RWIProtocolJSONObject integerForKey:](&v3, sel_integerForKey_, CFSTR("startOffset"));
}

- (void)setEndOffset:(int)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimeBasicBlock;
  -[RWIProtocolJSONObject setInteger:forKey:](&v3, sel_setInteger_forKey_, *(_QWORD *)&a3, CFSTR("endOffset"));
}

- (int)endOffset
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimeBasicBlock;
  return -[RWIProtocolJSONObject integerForKey:](&v3, sel_integerForKey_, CFSTR("endOffset"));
}

- (void)setHasExecuted:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimeBasicBlock;
  -[RWIProtocolJSONObject setBool:forKey:](&v3, sel_setBool_forKey_, a3, CFSTR("hasExecuted"));
}

- (BOOL)hasExecuted
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimeBasicBlock;
  return -[RWIProtocolJSONObject BOOLForKey:](&v3, sel_BOOLForKey_, CFSTR("hasExecuted"));
}

- (void)setExecutionCount:(int)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimeBasicBlock;
  -[RWIProtocolJSONObject setInteger:forKey:](&v3, sel_setInteger_forKey_, *(_QWORD *)&a3, CFSTR("executionCount"));
}

- (int)executionCount
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimeBasicBlock;
  return -[RWIProtocolJSONObject integerForKey:](&v3, sel_integerForKey_, CFSTR("executionCount"));
}

@end
