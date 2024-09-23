@implementation RMDummyData

- (RMDummyData)initWithPayload:(id *)a3
{
  RMDummyData *result;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)RMDummyData;
  result = -[RMDummyData init](&v8, sel_init);
  if (result)
  {
    v5 = *(_OWORD *)a3->var0.var0;
    v6 = *((_OWORD *)&a3->var0.var1 + 1);
    v7 = *((_OWORD *)&a3->var0.var1 + 2);
    *((_OWORD *)&result->_payload.var0.abstime + 3) = *((_OWORD *)&a3->var0.var1 + 3);
    *((_OWORD *)&result->_payload.var0.abstime + 2) = v7;
    *((_OWORD *)&result->_payload.var0.abstime + 1) = v6;
    *(_OWORD *)result->_payload.var0.data = v5;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeBytes:length:forKey:", &self->_payload, 64, CFSTR("DummyDataEncodingKey"));
}

- (RMDummyData)initWithCoder:(id)a3
{
  __int128 *v4;
  RMDummyData *v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  uint64_t v10;
  _OWORD v11[4];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v10 = 0;
  v4 = (__int128 *)objc_msgSend(objc_retainAutorelease(a3), "decodeBytesForKey:returnedLength:", CFSTR("DummyDataEncodingKey"), &v10);
  v5 = 0;
  if (v4 && v10 == 64)
  {
    v6 = *v4;
    v7 = v4[1];
    v8 = v4[3];
    v11[2] = v4[2];
    v11[3] = v8;
    v11[0] = v6;
    v11[1] = v7;
    self = -[RMDummyData initWithPayload:](self, "initWithPayload:", v11);
    v5 = self;
  }

  return v5;
}

- ($AE72BB7FA4D4C7C6B4FE5A9414CF8B1A)payload
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)(&self->var0.var1 + 3);
  *(_OWORD *)retstr->var0.var0 = *(_OWORD *)(&self->var0.var1 + 1);
  *((_OWORD *)&retstr->var0.var1 + 1) = v3;
  v4 = *(_OWORD *)(&self->var0.var1 + 7);
  *((_OWORD *)&retstr->var0.var1 + 2) = *(_OWORD *)(&self->var0.var1 + 5);
  *((_OWORD *)&retstr->var0.var1 + 3) = v4;
  return self;
}

@end
