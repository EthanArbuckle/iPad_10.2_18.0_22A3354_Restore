@implementation PRProximitySingleThresholdDevice

- (PRProximitySingleThresholdDevice)init
{
  -[PRProximitySingleThresholdDevice doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (PRProximitySingleThresholdDevice)initWithPeer:(id)a3 andPeerModel:(id)a4 withError:(id *)a5
{
  id v9;
  id v10;
  id v11;
  os_log_t v12;
  void *v13;
  int64_t v14;
  int64_t v15;
  int64_t v16;
  int v17;
  int v18;
  NSObject *v19;
  NSObject *v20;
  SingleThresholdProx::Estimator *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  objc_super v26;
  uint8_t buf[4];
  int v28;
  uint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v26.receiver = self;
  v26.super_class = (Class)PRProximitySingleThresholdDevice;
  v11 = -[PRProximitySingleThresholdDevice init](&v26, sel_init);
  if (!v11)
  {
LABEL_12:
    a5 = (id *)v11;
    goto LABEL_15;
  }
  v12 = os_log_create("com.apple.Proximity", "SingleThreshold");
  v13 = (void *)*((_QWORD *)v11 + 1);
  *((_QWORD *)v11 + 1) = v12;

  objc_storeStrong((id *)v11 + 13, a3);
  objc_storeStrong((id *)v11 + 2, a4);
  *((_QWORD *)v11 + 9) = 0;
  *((_QWORD *)v11 + 11) = 0;
  *((_QWORD *)v11 + 12) = 0xBFF0000000000000;
  v14 = +[PRProximityDatabase getScannerDeviceModel](PRProximityDatabase, "getScannerDeviceModel");
  v15 = +[PRProximityDatabase getPRDeviceModelFromModelId:](PRProximityDatabase, "getPRDeviceModelFromModelId:", v10);
  if (v14 != 21)
  {
    v16 = v15;
    if (v15 != 21)
    {
      v17 = +[PRProximityDatabase getDeviceBtTxPowerFromModel:](PRProximityDatabase, "getDeviceBtTxPowerFromModel:", v15);
      v18 = +[PRProximityDatabase getDeviceBtRxOffsetFromModel:](PRProximityDatabase, "getDeviceBtRxOffsetFromModel:", v14);
      if (!v14)
      {
        v19 = *((_QWORD *)v11 + 1);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          v28 = v18;
          _os_log_impl(&dword_19BF46000, v19, OS_LOG_TYPE_DEFAULT, "Unknown scanning model; using default rx offset of %d.",
            buf,
            8u);
        }
      }
      if (!v16)
      {
        v20 = *((_QWORD *)v11 + 1);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          v28 = v17;
          _os_log_impl(&dword_19BF46000, v20, OS_LOG_TYPE_DEFAULT, "Unknown advertising model; using default tx power of %d.",
            buf,
            8u);
        }
      }
      v21 = (SingleThresholdProx::Estimator *)operator new();
      SingleThresholdProx::Estimator::Estimator(v21, (float)v17, v18);
      v22 = *((_QWORD *)v11 + 10);
      *((_QWORD *)v11 + 10) = v21;
      if (v22)
        std::default_delete<SingleThresholdProx::Estimator>::operator()[abi:ne180100]((uint64_t)v11 + 80, v22);
      goto LABEL_12;
    }
  }
  if (a5)
  {
    v23 = (void *)MEMORY[0x1E0CB35C8];
    v29 = *MEMORY[0x1E0CB2D50];
    v30[0] = CFSTR("Unknown error getting device model; prox unavailable");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "errorWithDomain:code:userInfo:", CFSTR("com.apple.Proximity.ErrorDomain"), 999, v24);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    a5 = 0;
  }
LABEL_15:

  return (PRProximitySingleThresholdDevice *)a5;
}

- (void)addSample:(BtProxData *)a3
{
  PRProximitySingleThresholdDevice *obj;

  obj = self;
  objc_sync_enter(obj);
  SingleThresholdProx::Estimator::addRSSISample((SingleThresholdProx::Estimator *)obj->_estimator.__ptr_.__value_, (int)a3->var1, a3->var2, a3->var0);
  if (a3->var0 > obj->_mostRecentSampleTime)
    obj->_mostRecentSampleTime = a3->var0;
  ++obj->_sampleCount;
  objc_sync_exit(obj);

}

- (BOOL)proxReady
{
  int64_t sampleCount;
  unsigned int v5;
  unint64_t v6;
  char v7;

  sampleCount = self->_sampleCount;
  if (sampleCount >= 2)
  {
    v5 = 0;
    v6 = 0xBFF0000000000000;
    v7 = 0;
    SingleThresholdProx::Estimator::getRangeMeasurement((uint64_t)self->_estimator.__ptr_.__value_, (uint64_t)&v5, self->_mostRecentSampleTime);
    if (v5 <= 3)
      self->_proximity = qword_19BF79F80[v5];
  }
  return sampleCount > 1;
}

- (int64_t)deviceProximity
{
  return self->_proximity;
}

- (NSUUID)peer
{
  return (NSUUID *)objc_getProperty(self, a2, 104, 1);
}

- (void).cxx_destruct
{
  Estimator *value;

  objc_storeStrong((id *)&self->_peer, 0);
  value = self->_estimator.__ptr_.__value_;
  self->_estimator.__ptr_.__value_ = 0;
  if (value)
    std::default_delete<SingleThresholdProx::Estimator>::operator()[abi:ne180100]((uint64_t)&self->_estimator, (uint64_t)value);
  std::deque<BtProxData>::~deque[abi:ne180100](&self->_samples.__map_.__first_);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_logger, 0);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *((_QWORD *)self + 10) = 0;
  return self;
}

@end
