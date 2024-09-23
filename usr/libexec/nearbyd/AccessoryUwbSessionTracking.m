@implementation AccessoryUwbSessionTracking

- (AccessoryUwbSessionTracking)initWithServiceRequest:(const void *)a3 startOptions:(const void *)a4 shareableConfigData:(id)a5 processName:(id)a6 accessoryConfigData:(const void *)a7 persistWhileDetached:(BOOL)a8
{
  id v15;
  id v16;
  AccessoryUwbSessionTracking *v17;
  AccessoryUwbSessionTracking *v18;
  AccessoryUwbSessionTracking *v19;
  id v20;
  id v21;
  _BOOL4 engaged;
  int scheduling_interval_usec_low;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  $B8AA82CD8D4AFFAE0D229AEE9D5E519E v27;
  __int128 v28;
  NSMutableSet *v29;
  FiRaSession *ptr;
  BOOL v32;
  objc_super v33;

  v15 = a5;
  v16 = a6;
  v33.receiver = self;
  v33.super_class = (Class)AccessoryUwbSessionTracking;
  v17 = -[AccessoryUwbSessionTracking init](&v33, "init");
  v18 = v17;
  v19 = v17;
  if (v17)
  {
    v32 = a8;
    v20 = v16;
    v21 = v15;
    engaged = v17->_serviceRequest.var0.__val_.range_enable_params.nbamms.mms_pkt_type.__engaged_;
    memcpy(&v17->_serviceRequest, a3, 0x1F8uLL);
    if (!engaged)
      v19->_serviceRequest.var0.__val_.range_enable_params.nbamms.mms_pkt_type.__engaged_ = 1;
    scheduling_interval_usec_low = LOBYTE(v19->_startOptions.var0.__val_.scheduling_interval_usec);
    v25 = *((_OWORD *)a4 + 1);
    v24 = *((_OWORD *)a4 + 2);
    *(_OWORD *)&v18->_serviceRequest.var0.__val_.range_enable_params.nbamms.mms_bch.var0.__null_state_ = *(_OWORD *)a4;
    *(_OWORD *)v18->_serviceRequest.var0.__val_.range_enable_params.nbamms.irk = v25;
    *(_OWORD *)&v18->_serviceRequest.var0.__val_.range_enable_params.nbamms.antenna_diversity_mask.var0.__null_state_ = v24;
    v26 = *((_OWORD *)a4 + 6);
    v28 = *((_OWORD *)a4 + 3);
    v27 = *(($B8AA82CD8D4AFFAE0D229AEE9D5E519E *)a4 + 4);
    *(_OWORD *)&v18->_startOptions.var0.__val_.peer.var0.__val_.bt_adv_address.var0.__val_.__elems_[2] = *((_OWORD *)a4 + 5);
    *(_OWORD *)&v18->_startOptions.var0.__val_.start_time_or_offset_usec = v26;
    *(_OWORD *)&v18->_startOptions.var0.__null_state_ = v28;
    *($B8AA82CD8D4AFFAE0D229AEE9D5E519E *)((char *)&v18->_startOptions.var0.__val_.peer.var0.__val_.uuid.var0 + 12) = v27;
    if (!scheduling_interval_usec_low)
      LOBYTE(v19->_startOptions.var0.__val_.scheduling_interval_usec) = 1;
    objc_storeStrong((id *)&v18->_startOptions.var0.__val_.secondary_scheduling_interval_usec, a5);
    objc_storeStrong((id *)&v18->_startOptions.var0.__val_.secondary_duty_cycle, a6);
    v15 = v21;
    v16 = v20;
    sub_10028B8A4((uint64_t)&v18->_shareableConfigData, (uint64_t)a7);
    v19->_startOptions.var0.__val_.secondary_scheduling_delay_usec.var0.__null_state_ = v32;
    v29 = objc_opt_new(NSMutableSet);
    ptr = v19->_rangingSession.__ptr_;
    v19->_rangingSession.__ptr_ = (FiRaSession *)v29;

    *(double *)&v19->_rangingSession.__cntrl_ = sub_10000883C();
    *(double *)&v19->_persistWhileDetached = sub_10000883C();
  }

  return v19;
}

- (void)stopRanging
{
  uint64_t conn_evt_trigger_desc;
  NSObject *v4;
  void *v5;

  conn_evt_trigger_desc = (uint64_t)self->_startOptions.var0.__val_.conn_evt_trigger_desc;
  if (conn_evt_trigger_desc)
  {
    sub_1002AE5BC(conn_evt_trigger_desc);
    sub_100180AF4(&self->_startOptions.var0.__val_.conn_evt_trigger_desc);
    *(double *)&self->_persistWhileDetached = sub_10000883C();
  }
  *(&self->_startOptions.var0.__val_.secondary_scheduling_delay_usec.var0.__null_state_ + 1) = 0;
  v4 = *(NSObject **)&self->_startOptions.__engaged_;
  if (v4)
  {
    dispatch_source_cancel(v4);
    v5 = *(void **)&self->_startOptions.__engaged_;
    *(_QWORD *)&self->_startOptions.__engaged_ = 0;

  }
}

- (void)rangingSession
{
  return &self->_startOptions.var0.__val_.conn_evt_trigger_desc;
}

- (void)setRangingSession:(void *)a3
{
  sub_100021C24(&self->_startOptions.var0.__val_.conn_evt_trigger_desc, (uint64_t *)a3);
  *(double *)&self->_persistWhileDetached = sub_10000883C();
}

- (void)serviceRequest
{
  if (!self->_serviceRequest.var0.__val_.range_enable_params.nbamms.mms_pkt_type.__engaged_)
    sub_10000BA44();
  return &self->_serviceRequest;
}

- (void)startOptions
{
  if (!LOBYTE(self->_startOptions.var0.__val_.scheduling_interval_usec))
    sub_10000BA44();
  return &self->_serviceRequest.var0.__val_.range_enable_params.nbamms.mms_bch;
}

- (NSData)shareableConfigData
{
  return (NSData *)self->_startOptions.var0.__val_.secondary_scheduling_interval_usec;
}

- (NSString)processName
{
  return (NSString *)self->_startOptions.var0.__val_.secondary_duty_cycle;
}

- (void)accessoryConfigData
{
  return &self->_shareableConfigData;
}

- (BOOL)persistWhileDetached
{
  return self->_startOptions.var0.__val_.secondary_scheduling_delay_usec.var0.__null_state_;
}

- (unsigned)rangingRetryCount
{
  return *(&self->_startOptions.var0.__val_.secondary_scheduling_delay_usec.var0.__null_state_ + 1);
}

- (void)setRangingRetryCount:(unsigned __int8)a3
{
  *(&self->_startOptions.var0.__val_.secondary_scheduling_delay_usec.var0.__null_state_ + 1) = a3;
}

- (OS_dispatch_source)rangingRetryTimer
{
  return *(OS_dispatch_source **)&self->_startOptions.__engaged_;
}

- (void)setRangingRetryTimer:(id)a3
{
  objc_storeStrong((id *)&self->_startOptions.__engaged_, a3);
}

- (NSMutableSet)interestedClients
{
  return (NSMutableSet *)self->_rangingSession.__ptr_;
}

- (double)initTime
{
  return *(double *)&self->_rangingSession.__cntrl_;
}

- (double)timeOfLatestSessionLifecycleChange
{
  return *(double *)&self->_persistWhileDetached;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rangingSession.__ptr_, 0);
  objc_storeStrong((id *)&self->_startOptions.__engaged_, 0);
  objc_storeStrong((id *)&self->_startOptions.var0.__val_.secondary_duty_cycle, 0);
  objc_storeStrong((id *)&self->_startOptions.var0.__val_.secondary_scheduling_interval_usec, 0);
  sub_10001AE68((uint64_t)&self->_startOptions.var0.__val_.conn_evt_trigger_desc);
}

- (id).cxx_construct
{
  *((_BYTE *)self + 8) = 0;
  *((_BYTE *)self + 512) = 0;
  *((_BYTE *)self + 520) = 0;
  *((_BYTE *)self + 632) = 0;
  *((_OWORD *)self + 40) = 0u;
  *((_BYTE *)self + 712) = 0;
  *((_BYTE *)self + 751) = 0;
  return self;
}

@end
