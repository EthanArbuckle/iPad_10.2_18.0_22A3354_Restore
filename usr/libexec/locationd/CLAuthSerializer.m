@implementation CLAuthSerializer

- (id)encodeSYChangeForBackwardCompatibility:(id)a3 protocolVersion:(int64_t)a4
{
  uint64_t v6;

  v6 = objc_opt_class(CLCompanionSyncAuthObject, a2);
  if ((objc_opt_isKindOfClass(a3, v6) & 1) != 0)
    return -[CLAuthSerializer dataFromChange:](self, "dataFromChange:", a3);
  else
    return 0;
}

- (id)decodeChangeData:(id)a3 fromProtocolVersion:(int64_t)a4 ofType:(int64_t)a5
{
  return -[CLAuthSerializer changeFromData:ofType:](self, "changeFromData:ofType:", a3, a5);
}

- (id)dataFromChange:(id)a3
{
  uint64_t v4;

  v4 = objc_opt_class(CLCompanionSyncAuthObject, a2);
  if ((objc_opt_isKindOfClass(a3, v4) & 1) != 0)
    return objc_msgSend(a3, "data");
  else
    return 0;
}

- (id)changeFromData:(id)a3 ofType:(int64_t)a4
{
  return -[CLCompanionSyncAuthObject initWithData:]([CLCompanionSyncAuthObject alloc], "initWithData:", a3);
}

@end
