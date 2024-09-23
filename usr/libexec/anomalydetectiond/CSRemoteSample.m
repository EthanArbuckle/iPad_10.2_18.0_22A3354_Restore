@implementation CSRemoteSample

- (CSRemoteSample)initWithStruct:(const CSRemoteSample_Struct *)a3
{
  CSRemoteSample *result;
  __int128 v5;
  __int128 v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CSRemoteSample;
  result = -[CSRemoteSample init](&v7, "init");
  if (result)
  {
    v5 = *(_OWORD *)&a3->mode;
    v6 = *(_OWORD *)&a3->createdAtTimestamp;
    *(_OWORD *)&result->_c_struct.lastRealTriggerTimestamp = *(_OWORD *)&a3->lastRealTriggerTimestamp;
    *(_OWORD *)&result->_c_struct.createdAtTimestamp = v6;
    *(_OWORD *)&result->_c_struct.mode = v5;
  }
  return result;
}

- (unint64_t)timestamp
{
  return self->_c_struct.receivedAtTimestamp;
}

- (void)setTimestamp:(unint64_t)a3
{
  self->_c_struct.receivedAtTimestamp = a3;
}

- (CSRemoteSample_Struct)c_struct
{
  return &self->_c_struct;
}

@end
