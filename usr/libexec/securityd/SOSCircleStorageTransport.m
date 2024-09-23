@implementation SOSCircleStorageTransport

- (SOSCircleStorageTransport)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SOSCircleStorageTransport;
  return -[SOSCircleStorageTransport init](&v3, "init");
}

- (SOSCircleStorageTransport)initWithAccount:(id)a3
{
  id v4;
  SOSCircleStorageTransport *v5;
  SOSCircleStorageTransport *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SOSCircleStorageTransport;
  v5 = -[SOSCircleStorageTransport init](&v8, "init");
  v6 = v5;
  if (v5)
    -[SOSCircleStorageTransport setAccount:](v5, "setAccount:", v4);

  return v6;
}

- (int64_t)circleGetTypeID
{
  return 0;
}

- (int64_t)getTransportType
{
  return 0;
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
  return CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
}

- (__CFArray)handleCircleMessagesAndReturnHandledCopy:(__CFDictionary *)a3 err:(__CFError *)a4
{
  return CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
}

- (SOSAccount)account
{
  return self->account;
}

- (void)setAccount:(id)a3
{
  objc_storeStrong((id *)&self->account, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->account, 0);
}

@end
