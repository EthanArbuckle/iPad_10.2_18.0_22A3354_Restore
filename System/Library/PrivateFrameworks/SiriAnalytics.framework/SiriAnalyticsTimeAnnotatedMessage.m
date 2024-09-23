@implementation SiriAnalyticsTimeAnnotatedMessage

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_messageUUID, 0);
  objc_storeStrong((id *)&self->_streamUUID, 0);
}

- (void)setTimestamp:(unint64_t)a3
{
  self->_timestamp = a3;
}

- (void)setStreamUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setMessageUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setMessage:(id)a3
{
  objc_storeStrong((id *)&self->_message, a3);
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSUUID)streamUUID
{
  return self->_streamUUID;
}

- (NSUUID)messageUUID
{
  return self->_messageUUID;
}

- (SISchemaTopLevelUnionType)message
{
  return self->_message;
}

@end
