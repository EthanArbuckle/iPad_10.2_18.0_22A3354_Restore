@implementation SMMadridMessageWaitingForAck

- (SMMadridMessageWaitingForAck)initWithIdentifier:(id)a3 messageType:(unint64_t)a4 messageSentDate:(id)a5 pendingRetryCount:(int64_t)a6 conversation:(id)a7 callback:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  SMMadridMessageWaitingForAck *v19;
  SMMadridMessageWaitingForAck *v20;
  uint64_t v21;
  id callback;
  SMMadridMessageWaitingForAck *v23;
  NSObject *v24;
  const char *v25;
  objc_super v27;
  uint8_t buf[16];

  v15 = a3;
  v16 = a5;
  v17 = a7;
  v18 = a8;
  if (!v15)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v24 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      goto LABEL_14;
    *(_WORD *)buf = 0;
    v25 = "Invalid parameter not satisfying: identifier";
LABEL_13:
    _os_log_error_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_ERROR, v25, buf, 2u);
    goto LABEL_14;
  }
  if (!v16)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v24 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      goto LABEL_14;
    *(_WORD *)buf = 0;
    v25 = "Invalid parameter not satisfying: messageSentDate";
    goto LABEL_13;
  }
  if (a6 < 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v25 = "Invalid parameter not satisfying: pendingRetryCount >= 0";
      goto LABEL_13;
    }
LABEL_14:

    v23 = 0;
    goto LABEL_15;
  }
  v27.receiver = self;
  v27.super_class = (Class)SMMadridMessageWaitingForAck;
  v19 = -[SMMadridMessageWaitingForAck init](&v27, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_identifier, a3);
    v20->_messageType = a4;
    v21 = objc_msgSend(v18, "copy");
    callback = v20->_callback;
    v20->_callback = (id)v21;

    objc_storeStrong((id *)&v20->_messageSentDate, a5);
    v20->_pendingRetryCount = a6;
    objc_storeStrong((id *)&v20->_conversation, a7);
  }
  self = v20;
  v23 = self;
LABEL_15:

  return v23;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (unint64_t)messageType
{
  return self->_messageType;
}

- (void)setMessageType:(unint64_t)a3
{
  self->_messageType = a3;
}

- (id)callback
{
  return self->_callback;
}

- (void)setCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSDate)messageSentDate
{
  return self->_messageSentDate;
}

- (void)setMessageSentDate:(id)a3
{
  objc_storeStrong((id *)&self->_messageSentDate, a3);
}

- (int64_t)pendingRetryCount
{
  return self->_pendingRetryCount;
}

- (void)setPendingRetryCount:(int64_t)a3
{
  self->_pendingRetryCount = a3;
}

- (SMConversation)conversation
{
  return self->_conversation;
}

- (void)setConversation:(id)a3
{
  objc_storeStrong((id *)&self->_conversation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conversation, 0);
  objc_storeStrong((id *)&self->_messageSentDate, 0);
  objc_storeStrong(&self->_callback, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
