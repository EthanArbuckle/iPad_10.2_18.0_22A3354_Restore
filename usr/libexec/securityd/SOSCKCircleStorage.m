@implementation SOSCKCircleStorage

- (SOSCKCircleStorage)init
{
  SOSCKCircleStorage *v2;
  SOSCKCircleStorage *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SOSCKCircleStorage;
  v2 = -[SOSCircleStorageTransport init](&v5, "init");
  v3 = v2;
  if (v2)
    sub_1001F33A8(v2);
  return v3;
}

- (SOSCKCircleStorage)initWithAccount:(id)a3
{
  id v4;
  SOSCKCircleStorage *v5;
  SOSCKCircleStorage *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SOSCKCircleStorage;
  v5 = -[SOSCircleStorageTransport init](&v8, "init");
  v6 = v5;
  if (v5)
    -[SOSCircleStorageTransport setAccount:](v5, "setAccount:", v4);

  return v6;
}

- (int64_t)getTransportType
{
  return 6;
}

- (BOOL)expireRetirementRecords:(__CFDictionary *)a3 err:(__CFError *)a4
{
  return 1;
}

- (BOOL)flushChanges:(__CFError *)a3
{
  return 1;
}

- (BOOL)postCircle:(__CFString *)a3 circleData:(__CFData *)a4 err:(__CFError *)a5
{
  return 1;
}

- (BOOL)postRetirement:(__CFString *)a3 peer:(__OpaqueSOSPeerInfo *)a4 err:(__CFError *)a5
{
  return 1;
}

- (__CFDictionary)handleRetirementMessages:(__CFDictionary *)a3 err:(__CFError *)a4
{
  return 0;
}

- (__CFArray)handleCircleMessagesAndReturnHandledCopy:(__CFDictionary *)a3 err:(__CFError *)a4
{
  return 0;
}

@end
