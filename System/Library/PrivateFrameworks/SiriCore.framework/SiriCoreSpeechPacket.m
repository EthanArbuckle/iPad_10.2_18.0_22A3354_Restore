@implementation SiriCoreSpeechPacket

- (BOOL)siriCore_bufferingAllowedDuringActiveSession
{
  return 1;
}

- (BOOL)siriCore_isRetryable
{
  return 1;
}

- (BOOL)siriCore_isRestartable
{
  return 0;
}

- (BOOL)siriCore_isProvisional
{
  return 0;
}

- (id)siriCore_serializedAceDataError:(id *)a3
{
  return +[SiriCoreAceSerialization dataForSpeechPacket:error:](SiriCoreAceSerialization, "dataForSpeechPacket:error:", self, a3);
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v7.receiver = self;
  v7.super_class = (Class)SiriCoreSpeechPacket;
  -[SiriCoreSpeechPacket description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ packet number: %ld count: %ld"), v4, self->_packetNumber, -[NSArray count](self->_packets, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (id)siriCore_requestId
{
  return 0;
}

- (id)encodedClassName
{
  return (id)*MEMORY[0x24BE82438];
}

- (id)groupIdentifier
{
  return (id)*MEMORY[0x24BE82430];
}

- (BOOL)siriCore_supportedByLocalSession
{
  return 0;
}

- (BOOL)siriCore_supportedByRemoteLimitedSession
{
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[SiriCoreSpeechPacket packets](self, "packets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPackets:", v5);

  objc_msgSend(v4, "setPacketNumber:", -[SiriCoreSpeechPacket packetNumber](self, "packetNumber"));
  -[SiriCoreSpeechPacket refId](self, "refId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRefId:", v6);

  return v4;
}

- (NSString)aceId
{
  return self->_aceId;
}

- (void)setAceId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)refId
{
  return self->_refId;
}

- (void)setRefId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)packets
{
  return self->_packets;
}

- (void)setPackets:(id)a3
{
  objc_storeStrong((id *)&self->_packets, a3);
}

- (int64_t)packetNumber
{
  return self->_packetNumber;
}

- (void)setPacketNumber:(int64_t)a3
{
  self->_packetNumber = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_packets, 0);
  objc_storeStrong((id *)&self->_refId, 0);
  objc_storeStrong((id *)&self->_aceId, 0);
}

@end
