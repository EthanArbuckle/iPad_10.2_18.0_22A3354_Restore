@implementation RWIProtocolDebuggerProbeSample

- (RWIProtocolDebuggerProbeSample)initWithProbeId:(int)a3 sampleId:(int)a4 batchId:(int)a5 timestamp:(double)a6 payload:(id)a7
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v12;
  RWIProtocolDebuggerProbeSample *v13;
  RWIProtocolDebuggerProbeSample *v14;
  objc_super v16;

  v8 = *(_QWORD *)&a5;
  v9 = *(_QWORD *)&a4;
  v10 = *(_QWORD *)&a3;
  v12 = a7;
  v16.receiver = self;
  v16.super_class = (Class)RWIProtocolDebuggerProbeSample;
  v13 = -[RWIProtocolJSONObject init](&v16, sel_init);
  if (v13)
  {
    if (!v12)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required property '%@' cannot be nil"), CFSTR("payload"));
    -[RWIProtocolDebuggerProbeSample setProbeId:](v13, "setProbeId:", v10);
    -[RWIProtocolDebuggerProbeSample setSampleId:](v13, "setSampleId:", v9);
    -[RWIProtocolDebuggerProbeSample setBatchId:](v13, "setBatchId:", v8);
    -[RWIProtocolDebuggerProbeSample setTimestamp:](v13, "setTimestamp:", a6);
    -[RWIProtocolDebuggerProbeSample setPayload:](v13, "setPayload:", v12);
    v14 = v13;
  }

  return v13;
}

- (void)setProbeId:(int)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDebuggerProbeSample;
  -[RWIProtocolJSONObject setInteger:forKey:](&v3, sel_setInteger_forKey_, *(_QWORD *)&a3, CFSTR("probeId"));
}

- (int)probeId
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDebuggerProbeSample;
  return -[RWIProtocolJSONObject integerForKey:](&v3, sel_integerForKey_, CFSTR("probeId"));
}

- (void)setSampleId:(int)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDebuggerProbeSample;
  -[RWIProtocolJSONObject setInteger:forKey:](&v3, sel_setInteger_forKey_, *(_QWORD *)&a3, CFSTR("sampleId"));
}

- (int)sampleId
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDebuggerProbeSample;
  return -[RWIProtocolJSONObject integerForKey:](&v3, sel_integerForKey_, CFSTR("sampleId"));
}

- (void)setBatchId:(int)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDebuggerProbeSample;
  -[RWIProtocolJSONObject setInteger:forKey:](&v3, sel_setInteger_forKey_, *(_QWORD *)&a3, CFSTR("batchId"));
}

- (int)batchId
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDebuggerProbeSample;
  return -[RWIProtocolJSONObject integerForKey:](&v3, sel_integerForKey_, CFSTR("batchId"));
}

- (void)setTimestamp:(double)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDebuggerProbeSample;
  -[RWIProtocolJSONObject setDouble:forKey:](&v3, sel_setDouble_forKey_, CFSTR("timestamp"), a3);
}

- (double)timestamp
{
  double result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDebuggerProbeSample;
  -[RWIProtocolJSONObject doubleForKey:](&v3, sel_doubleForKey_, CFSTR("timestamp"));
  return result;
}

- (void)setPayload:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDebuggerProbeSample;
  -[RWIProtocolJSONObject setObject:forKey:](&v3, sel_setObject_forKey_, a3, CFSTR("payload"));
}

- (RWIProtocolRuntimeRemoteObject)payload
{
  void *v3;
  RWIProtocolRuntimeRemoteObject *v4;
  void *v5;
  _DWORD *v6;
  RWIProtocolRuntimeRemoteObject *v7;
  _DWORD *v8;
  _DWORD *v9;
  objc_super v11;
  _DWORD *v12;
  _DWORD *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)RWIProtocolDebuggerProbeSample;
  -[RWIProtocolJSONObject objectForKey:](&v14, sel_objectForKey_, CFSTR("payload"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = [RWIProtocolRuntimeRemoteObject alloc];
    v11.receiver = self;
    v11.super_class = (Class)RWIProtocolDebuggerProbeSample;
    -[RWIProtocolJSONObject objectForKey:](&v11, sel_objectForKey_, CFSTR("payload"));
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

@end
