@implementation SiriCoreConnectionTCPInfoMetrics

- (SiriCoreConnectionTCPInfoMetrics)initWithInterfaceName:(id)a3 rttCurrent:(id)a4 rttSmoothed:(id)a5 rttVariance:(id)a6 rttBest:(id)a7 packetsSent:(id)a8 bytesSent:(id)a9 bytesRetransmitted:(id)a10 bytesUnacked:(id)a11 packetsReceived:(id)a12 bytesReceived:(id)a13 duplicateBytesReceived:(id)a14 outOfOrderBytesReceived:(id)a15 sendBufferBytes:(id)a16 sendBandwidth:(id)a17 synRetransmits:(id)a18 tfoSynDataAcked:(id)a19
{
  id v24;
  id v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  SiriCoreConnectionTCPInfoMetrics *v34;
  uint64_t v35;
  NSString *interfaceName;
  uint64_t v37;
  NSNumber *rttCurrent;
  uint64_t v39;
  NSNumber *rttSmoothed;
  uint64_t v41;
  NSNumber *rttVariance;
  uint64_t v43;
  NSNumber *rttBest;
  uint64_t v45;
  NSNumber *packetsSent;
  uint64_t v47;
  NSNumber *bytesSent;
  uint64_t v49;
  NSNumber *bytesRetransmitted;
  uint64_t v51;
  NSNumber *bytesUnacked;
  uint64_t v53;
  NSNumber *packetsReceived;
  uint64_t v55;
  NSNumber *bytesReceived;
  uint64_t v57;
  NSNumber *duplicateBytesReceived;
  uint64_t v59;
  NSNumber *outOfOrderBytesReceived;
  uint64_t v61;
  NSNumber *sendBufferBytes;
  uint64_t v63;
  NSNumber *sendBandwidth;
  uint64_t v65;
  NSNumber *synRetransmits;
  uint64_t v67;
  NSNumber *tfoSynDataAcked;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  id v78;
  objc_super v79;

  v24 = a3;
  v25 = a4;
  v78 = a5;
  v77 = a6;
  v76 = a7;
  v75 = a8;
  v74 = a9;
  v73 = a10;
  v26 = v25;
  v72 = a11;
  v71 = a12;
  v27 = a13;
  v28 = a14;
  v29 = a15;
  v30 = a16;
  v31 = a17;
  v32 = a18;
  v33 = a19;
  v79.receiver = self;
  v79.super_class = (Class)SiriCoreConnectionTCPInfoMetrics;
  v34 = -[SiriCoreConnectionTCPInfoMetrics init](&v79, sel_init);
  if (v34)
  {
    v35 = objc_msgSend(v24, "copy");
    interfaceName = v34->_interfaceName;
    v34->_interfaceName = (NSString *)v35;

    v37 = objc_msgSend(v26, "copy");
    rttCurrent = v34->_rttCurrent;
    v34->_rttCurrent = (NSNumber *)v37;

    v39 = objc_msgSend(v78, "copy");
    rttSmoothed = v34->_rttSmoothed;
    v34->_rttSmoothed = (NSNumber *)v39;

    v41 = objc_msgSend(v77, "copy");
    rttVariance = v34->_rttVariance;
    v34->_rttVariance = (NSNumber *)v41;

    v43 = objc_msgSend(v76, "copy");
    rttBest = v34->_rttBest;
    v34->_rttBest = (NSNumber *)v43;

    v45 = objc_msgSend(v75, "copy");
    packetsSent = v34->_packetsSent;
    v34->_packetsSent = (NSNumber *)v45;

    v47 = objc_msgSend(v74, "copy");
    bytesSent = v34->_bytesSent;
    v34->_bytesSent = (NSNumber *)v47;

    v49 = objc_msgSend(v73, "copy");
    bytesRetransmitted = v34->_bytesRetransmitted;
    v34->_bytesRetransmitted = (NSNumber *)v49;

    v51 = objc_msgSend(v72, "copy");
    bytesUnacked = v34->_bytesUnacked;
    v34->_bytesUnacked = (NSNumber *)v51;

    v53 = objc_msgSend(v71, "copy");
    packetsReceived = v34->_packetsReceived;
    v34->_packetsReceived = (NSNumber *)v53;

    v55 = objc_msgSend(v27, "copy");
    bytesReceived = v34->_bytesReceived;
    v34->_bytesReceived = (NSNumber *)v55;

    v57 = objc_msgSend(v28, "copy");
    duplicateBytesReceived = v34->_duplicateBytesReceived;
    v34->_duplicateBytesReceived = (NSNumber *)v57;

    v59 = objc_msgSend(v29, "copy");
    outOfOrderBytesReceived = v34->_outOfOrderBytesReceived;
    v34->_outOfOrderBytesReceived = (NSNumber *)v59;

    v61 = objc_msgSend(v30, "copy");
    sendBufferBytes = v34->_sendBufferBytes;
    v34->_sendBufferBytes = (NSNumber *)v61;

    v63 = objc_msgSend(v31, "copy");
    sendBandwidth = v34->_sendBandwidth;
    v34->_sendBandwidth = (NSNumber *)v63;

    v65 = objc_msgSend(v32, "copy");
    synRetransmits = v34->_synRetransmits;
    v34->_synRetransmits = (NSNumber *)v65;

    v67 = objc_msgSend(v33, "copy");
    tfoSynDataAcked = v34->_tfoSynDataAcked;
    v34->_tfoSynDataAcked = (NSNumber *)v67;

  }
  return v34;
}

- (SiriCoreConnectionTCPInfoMetrics)init
{

  return 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v7.receiver = self;
  v7.super_class = (Class)SiriCoreConnectionTCPInfoMetrics;
  -[SiriCoreConnectionTCPInfoMetrics description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ {interfaceName = %@, rttCurrent = %@, rttSmoothed = %@, rttVariance = %@, rttBest = %@, packetsSent = %@, bytesSent = %@, bytesRetransmitted = %@, bytesUnacked = %@, packetsReceived = %@, bytesReceived = %@, duplicateBytesReceived = %@, outOfOrderBytesReceived = %@, sendBufferBytes = %@, sendBandwidth = %@, synRetransmits = %@ tfoSynDataAcked = %@}"), v4, self->_interfaceName, self->_rttCurrent, self->_rttSmoothed, self->_rttVariance, self->_rttBest, self->_packetsSent, self->_bytesSent, self->_bytesRetransmitted, self->_bytesUnacked, self->_packetsReceived, self->_bytesReceived, self->_duplicateBytesReceived, self->_outOfOrderBytesReceived, self->_sendBufferBytes, self->_sendBandwidth,
    self->_synRetransmits,
    self->_tfoSynDataAcked);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSString)interfaceName
{
  return self->_interfaceName;
}

- (NSNumber)rttCurrent
{
  return self->_rttCurrent;
}

- (NSNumber)rttSmoothed
{
  return self->_rttSmoothed;
}

- (NSNumber)rttVariance
{
  return self->_rttVariance;
}

- (NSNumber)rttBest
{
  return self->_rttBest;
}

- (NSNumber)packetsSent
{
  return self->_packetsSent;
}

- (NSNumber)bytesSent
{
  return self->_bytesSent;
}

- (NSNumber)bytesRetransmitted
{
  return self->_bytesRetransmitted;
}

- (NSNumber)bytesUnacked
{
  return self->_bytesUnacked;
}

- (NSNumber)packetsReceived
{
  return self->_packetsReceived;
}

- (NSNumber)bytesReceived
{
  return self->_bytesReceived;
}

- (NSNumber)duplicateBytesReceived
{
  return self->_duplicateBytesReceived;
}

- (NSNumber)outOfOrderBytesReceived
{
  return self->_outOfOrderBytesReceived;
}

- (NSNumber)sendBufferBytes
{
  return self->_sendBufferBytes;
}

- (NSNumber)sendBandwidth
{
  return self->_sendBandwidth;
}

- (NSNumber)synRetransmits
{
  return self->_synRetransmits;
}

- (NSNumber)tfoSynDataAcked
{
  return self->_tfoSynDataAcked;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tfoSynDataAcked, 0);
  objc_storeStrong((id *)&self->_synRetransmits, 0);
  objc_storeStrong((id *)&self->_sendBandwidth, 0);
  objc_storeStrong((id *)&self->_sendBufferBytes, 0);
  objc_storeStrong((id *)&self->_outOfOrderBytesReceived, 0);
  objc_storeStrong((id *)&self->_duplicateBytesReceived, 0);
  objc_storeStrong((id *)&self->_bytesReceived, 0);
  objc_storeStrong((id *)&self->_packetsReceived, 0);
  objc_storeStrong((id *)&self->_bytesUnacked, 0);
  objc_storeStrong((id *)&self->_bytesRetransmitted, 0);
  objc_storeStrong((id *)&self->_bytesSent, 0);
  objc_storeStrong((id *)&self->_packetsSent, 0);
  objc_storeStrong((id *)&self->_rttBest, 0);
  objc_storeStrong((id *)&self->_rttVariance, 0);
  objc_storeStrong((id *)&self->_rttSmoothed, 0);
  objc_storeStrong((id *)&self->_rttCurrent, 0);
  objc_storeStrong((id *)&self->_interfaceName, 0);
}

@end
