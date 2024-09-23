@implementation SNSpeechPacket

- (SNSpeechPacket)init
{
  SNSpeechPacket *v2;
  SNSpeechPacketInternal *v3;
  SNSpeechPacketInternal *underlyingSpeechPacket;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SNSpeechPacket;
  v2 = -[SNSpeechPacket init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(SNSpeechPacketInternal);
    underlyingSpeechPacket = v2->_underlyingSpeechPacket;
    v2->_underlyingSpeechPacket = v3;

  }
  return v2;
}

- (NSString)aceId
{
  return -[SNSpeechPacketInternal internalAceId](self->_underlyingSpeechPacket, "internalAceId");
}

- (void)setAceId:(id)a3
{
  -[SNSpeechPacketInternal setInternalAceId:](self->_underlyingSpeechPacket, "setInternalAceId:", a3);
}

- (NSString)refId
{
  return -[SNSpeechPacketInternal internalRefId](self->_underlyingSpeechPacket, "internalRefId");
}

- (void)setRefId:(id)a3
{
  -[SNSpeechPacketInternal setInternalRefId:](self->_underlyingSpeechPacket, "setInternalRefId:", a3);
}

- (NSArray)packets
{
  return -[SNSpeechPacketInternal packets](self->_underlyingSpeechPacket, "packets");
}

- (void)setPackets:(id)a3
{
  -[SNSpeechPacketInternal setPackets:](self->_underlyingSpeechPacket, "setPackets:", a3);
}

- (int64_t)packetNumber
{
  return -[SNSpeechPacketInternal packetNumber](self->_underlyingSpeechPacket, "packetNumber");
}

- (void)setPacketNumber:(int64_t)a3
{
  -[SNSpeechPacketInternal setPacketNumber:](self->_underlyingSpeechPacket, "setPacketNumber:", a3);
}

- (id)serializedAceDataError:(id *)a3
{
  return -[SNSpeechPacketInternal serializedAceDataAndReturnError:](self->_underlyingSpeechPacket, "serializedAceDataAndReturnError:", a3);
}

- (BOOL)bufferingAllowedDuringActiveSession
{
  return -[SNSpeechPacketInternal bufferingAllowedDuringActiveSession](self->_underlyingSpeechPacket, "bufferingAllowedDuringActiveSession");
}

- (BOOL)isProvisional
{
  return -[SNSpeechPacketInternal isProvisional](self->_underlyingSpeechPacket, "isProvisional");
}

- (BOOL)isRestartable
{
  return -[SNSpeechPacketInternal isRestartable](self->_underlyingSpeechPacket, "isRestartable");
}

- (BOOL)isRetryable
{
  return -[SNSpeechPacketInternal isRetryable](self->_underlyingSpeechPacket, "isRetryable");
}

- (void)logDiagnostics
{
  -[SNSpeechPacketInternal logDiagnostics](self->_underlyingSpeechPacket, "logDiagnostics");
}

- (id)sessionRequestId
{
  return -[SNSpeechPacketInternal sessionRequestId](self->_underlyingSpeechPacket, "sessionRequestId");
}

- (void)setSessionRequestId:(id)a3
{
  -[SNSpeechPacketInternal setSessionRequestId:](self->_underlyingSpeechPacket, "setSessionRequestId:", a3);
}

- (BOOL)supportedByLocalSession
{
  return -[SNSpeechPacketInternal supportedByLocalSession](self->_underlyingSpeechPacket, "supportedByLocalSession");
}

- (BOOL)supportedByRemoteLimitedSession
{
  return -[SNSpeechPacketInternal supportedByRemoteLimitedSession](self->_underlyingSpeechPacket, "supportedByRemoteLimitedSession");
}

- (void)siriNetwork_invokeThunk
{
  -[SNSpeechPacketInternal siriNetwork_invokeThunk](self->_underlyingSpeechPacket, "siriNetwork_invokeThunk");
}

- (NSString)description
{
  void *v3;
  void *v4;
  int64_t v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v9.receiver = self;
  v9.super_class = (Class)SNSpeechPacket;
  -[SNSpeechPacket description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SNSpeechPacket packetNumber](self, "packetNumber");
  -[SNSpeechPacket packets](self, "packets");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ packet number: %ld count: %ld"), v4, v5, objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (SNSpeechPacketInternal)underlyingSpeechPacket
{
  return self->_underlyingSpeechPacket;
}

- (void)setUnderlyingSpeechPacket:(id)a3
{
  objc_storeStrong((id *)&self->_underlyingSpeechPacket, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingSpeechPacket, 0);
}

@end
