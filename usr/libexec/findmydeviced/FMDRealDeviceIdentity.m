@implementation FMDRealDeviceIdentity

+ (id)sharedInstance
{
  if (qword_100306848 != -1)
    dispatch_once(&qword_100306848, &stru_1002C4458);
  return (id)qword_100306840;
}

- (FMDRealDeviceIdentity)init
{
  FMDRealDeviceIdentity *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *reissueUCRTQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FMDRealDeviceIdentity;
  v2 = -[FMDRealDeviceIdentity init](&v6, "init");
  if (v2)
  {
    v3 = dispatch_queue_create("FMDReissueUCRTQueue", 0);
    reissueUCRTQueue = v2->_reissueUCRTQueue;
    v2->_reissueUCRTQueue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (void)attestSigningRequest:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init((Class)FMDDeviceIdentityFactory);
  objc_msgSend(v7, "baaIdentityAttestationForSigningRequest:completion:", v6, v5);

}

- (OS_dispatch_queue)reissueUCRTQueue
{
  return self->_reissueUCRTQueue;
}

- (void)setReissueUCRTQueue:(id)a3
{
  objc_storeStrong((id *)&self->_reissueUCRTQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reissueUCRTQueue, 0);
}

@end
