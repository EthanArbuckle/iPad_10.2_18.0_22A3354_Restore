@implementation CLPedestrianFenceSession

- (CLPedestrianFenceSession)initWithClient:(id)a3 identifier:(id)a4 atTime:(double)a5 atMonotonicTime:(double)a6
{
  CLPedestrianFenceSession *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CLPedestrianFenceSession;
  v10 = -[CLPedestrianFenceSession init](&v12, "init");
  if (v10)
  {
    v10->_client = (CLPedestrianFenceServiceClientProtocol *)a3;
    v10->_clientIdentifier = (NSString *)a4;
    v10->_fenceIDToIndex = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v10->_fenceMetadata = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v10->_sessionStartTimeSince1970 = a5;
    v10->_sessionStartTime = a6;
    v10->_numFences = 0;
  }
  return v10;
}

- (void)dealloc
{
  objc_super v3;

  self->_client = 0;
  self->_clientIdentifier = 0;

  self->_fenceIDToIndex = 0;
  self->_fenceMetadata = 0;
  v3.receiver = self;
  v3.super_class = (Class)CLPedestrianFenceSession;
  -[CLPedestrianFenceSession dealloc](&v3, "dealloc");
}

- (CLPedestrianFenceServiceClientProtocol)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void)setClientIdentifier:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (NSMutableDictionary)fenceIDToIndex
{
  return self->_fenceIDToIndex;
}

- (void)setFenceIDToIndex:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (NSMutableDictionary)fenceMetadata
{
  return self->_fenceMetadata;
}

- (void)setFenceMetadata:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

@end
