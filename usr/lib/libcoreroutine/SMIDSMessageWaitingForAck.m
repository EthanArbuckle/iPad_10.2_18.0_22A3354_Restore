@implementation SMIDSMessageWaitingForAck

- (SMIDSMessageWaitingForAck)initWithIdentifier:(id)a3 destinations:(id)a4 message:(id)a5 pendingRetryCount:(int64_t)a6 messageSentDate:(id)a7 callback:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  SMIDSMessageWaitingForAck *v20;
  SMIDSMessageWaitingForAck *v21;
  uint64_t v22;
  id callback;
  SMIDSMessageWaitingForAck *v24;
  NSObject *v25;
  const char *v26;
  void *v27;
  NSObject *v29;
  id v30;
  objc_super v31;
  uint8_t buf[16];

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v30 = a7;
  v18 = a8;
  v19 = v18;
  if (!v15)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v25 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      goto LABEL_18;
    *(_WORD *)buf = 0;
    v26 = "Invalid parameter not satisfying: identifier";
LABEL_17:
    _os_log_error_impl(&dword_1D1A22000, v25, OS_LOG_TYPE_ERROR, v26, buf, 2u);
    goto LABEL_18;
  }
  if (!v16)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v25 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      goto LABEL_18;
    *(_WORD *)buf = 0;
    v26 = "Invalid parameter not satisfying: destinations";
    goto LABEL_17;
  }
  if (!v17)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v25 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      goto LABEL_18;
    *(_WORD *)buf = 0;
    v26 = "Invalid parameter not satisfying: message";
    goto LABEL_17;
  }
  if (a6 < 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v26 = "Invalid parameter not satisfying: pendingRetryCount >= 0";
      goto LABEL_17;
    }
LABEL_18:

    v24 = 0;
LABEL_19:
    v27 = v30;
    goto LABEL_20;
  }
  if (v18)
  {
    v31.receiver = self;
    v31.super_class = (Class)SMIDSMessageWaitingForAck;
    v20 = -[SMIDSMessageWaitingForAck init](&v31, sel_init);
    v21 = v20;
    if (v20)
    {
      objc_storeStrong((id *)&v20->_identifier, a3);
      objc_storeStrong((id *)&v21->_destinations, a4);
      objc_storeStrong((id *)&v21->_message, a5);
      v21->_pendingRetryCount = a6;
      v22 = MEMORY[0x1D8232094](v19);
      callback = v21->_callback;
      v21->_callback = (id)v22;

      objc_storeStrong((id *)&v21->_messageSentDate, a7);
    }
    self = v21;
    v24 = self;
    goto LABEL_19;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v29 = objc_claimAutoreleasedReturnValue();
  v27 = v30;
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D1A22000, v29, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: callback", buf, 2u);
  }

  v24 = 0;
LABEL_20:

  return v24;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSSet)destinations
{
  return self->_destinations;
}

- (void)setDestinations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (SMMessage)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
  objc_storeStrong((id *)&self->_message, a3);
}

- (int64_t)pendingRetryCount
{
  return self->_pendingRetryCount;
}

- (void)setPendingRetryCount:(int64_t)a3
{
  self->_pendingRetryCount = a3;
}

- (id)callback
{
  return self->_callback;
}

- (void)setCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSDate)messageSentDate
{
  return self->_messageSentDate;
}

- (void)setMessageSentDate:(id)a3
{
  objc_storeStrong((id *)&self->_messageSentDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageSentDate, 0);
  objc_storeStrong(&self->_callback, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_destinations, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
