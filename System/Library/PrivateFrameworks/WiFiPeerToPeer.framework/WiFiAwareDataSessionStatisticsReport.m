@implementation WiFiAwareDataSessionStatisticsReport

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WiFiAwareDataSessionStatisticsReport)initWithPeerAddress:(id)a3 infrastructureChannel:(id)a4 txCCAHistogram:(id)a5 rxRSSIHistogram:(id)a6 preferred2GChannelsCount:(id)a7 preferred5GChannelsCount:(id)a8 dfsChannelsCount:(id)a9 csaCount:(id)a10 quietIECount:(id)a11 txErrorCount:(id)a12 packetsOn2GCount:(id)a13 packetsNAVOn2GCount:(id)a14 packetsHOFOn2GCount:(id)a15 packetsOn5GCount:(id)a16 packetsOverridenOn5GCount:(id)a17 infraRelayOperationStatus:(BOOL)a18 infraRelayRequestersCount:(id)a19 txExpiredCount:(id)a20 txNoACKCount:(id)a21 txFailedCount:(id)a22 txNoResourcesCount:(id)a23 txIOErrorCount:(id)a24 txMemoryErrorCount:(id)a25 txChipModeErrorCount:(id)a26 txNoRemotePeerCount:(id)a27 txInternalErrorCount:(id)a28 txDroppedCount:(id)a29 txFirmwareFreePacketCount:(id)a30 txMaxRetriesCount:(id)a31 txForceLifetimeExpiredCount:(id)a32 channelSequenceMismatchOn5GCount:(id)a33 channelSequenceMismatchOn2GCount:(id)a34 infraScanCount:(id)a35 infraAssocCount:(id)a36 infraDisassocCount:(id)a37 countryCode:(id)a38 txConsecutiveErrorsHistogram:(id)a39 rxFWDelayHistogram:(id)a40 rxIPCDelayHistogram:(id)a41 txPacketExpiryHistogram:(id)a42
{
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  WiFiAwareDataSessionStatisticsReport *v55;
  WiFiAwareDataSessionStatisticsReport *v56;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  id v80;
  id v81;
  id v82;
  id v83;
  id v84;
  id v85;
  id v86;
  id v87;
  id v88;
  id v89;
  id v90;
  id v91;
  id v92;
  id v93;
  id v94;
  id v95;
  objc_super v96;

  v84 = a3;
  v59 = a4;
  v83 = a4;
  v60 = a5;
  v95 = a5;
  v61 = a6;
  v94 = a6;
  v62 = a7;
  v93 = a7;
  v63 = a8;
  v92 = a8;
  v91 = a9;
  v90 = a10;
  v89 = a11;
  v88 = a12;
  v87 = a13;
  v86 = a14;
  v85 = a15;
  v82 = a16;
  v81 = a17;
  v80 = a19;
  v79 = a20;
  v78 = a21;
  v77 = a22;
  v76 = a23;
  v75 = a24;
  v74 = a25;
  v73 = a26;
  v69 = a27;
  v68 = a28;
  v71 = a29;
  v72 = a30;
  v47 = a31;
  v48 = a32;
  v67 = a33;
  v66 = a34;
  v70 = a35;
  v49 = a36;
  v65 = a37;
  v50 = a38;
  v51 = a39;
  v52 = a40;
  v53 = a41;
  v54 = a42;
  v96.receiver = self;
  v96.super_class = (Class)WiFiAwareDataSessionStatisticsReport;
  v55 = -[WiFiAwareDataSessionStatisticsReport init](&v96, sel_init);
  v56 = v55;
  if (v55)
  {
    objc_storeStrong((id *)&v55->_peerAddress, a3);
    objc_storeStrong((id *)&v56->_infrastructureChannel, v59);
    objc_storeStrong((id *)&v56->_txCCAHistogram, v60);
    objc_storeStrong((id *)&v56->_rxRSSIHistogram, v61);
    objc_storeStrong((id *)&v56->_preferred2GChannelsCount, v62);
    objc_storeStrong((id *)&v56->_preferred5GChannelsCount, v63);
    objc_storeStrong((id *)&v56->_dfsChannelsCount, a9);
    objc_storeStrong((id *)&v56->_preferred2GChannelsCount, v62);
    objc_storeStrong((id *)&v56->_preferred5GChannelsCount, v63);
    objc_storeStrong((id *)&v56->_dfsChannelsCount, a9);
    objc_storeStrong((id *)&v56->_csaCount, a10);
    objc_storeStrong((id *)&v56->_quietIECount, a11);
    objc_storeStrong((id *)&v56->_txErrorCount, a12);
    objc_storeStrong((id *)&v56->_packetsOn2GCount, a13);
    objc_storeStrong((id *)&v56->_packetsNAVOn2GCount, a14);
    objc_storeStrong((id *)&v56->_packetsHOFOn2GCount, a15);
    objc_storeStrong((id *)&v56->_packetsOn5GCount, a16);
    objc_storeStrong((id *)&v56->_packetsOverridenOn5GCount, a17);
    v56->_infraRelayOperationStatus = a18;
    objc_storeStrong((id *)&v56->_infraRelayRequestersCount, a19);
    objc_storeStrong((id *)&v56->_txExpiredCount, a20);
    objc_storeStrong((id *)&v56->_txNoACKCount, a21);
    objc_storeStrong((id *)&v56->_txFailedCount, a22);
    objc_storeStrong((id *)&v56->_txNoResourcesCount, a23);
    objc_storeStrong((id *)&v56->_txIOErrorCount, a24);
    objc_storeStrong((id *)&v56->_txMemoryErrorCount, a25);
    objc_storeStrong((id *)&v56->_txChipModeErrorCount, a26);
    objc_storeStrong((id *)&v56->_txNoRemotePeerCount, a27);
    objc_storeStrong((id *)&v56->_txInternalErrorCount, a28);
    objc_storeStrong((id *)&v56->_txDroppedCount, a29);
    objc_storeStrong((id *)&v56->_txFirmwareFreePacketCount, a30);
    objc_storeStrong((id *)&v56->_txMaxRetriesCount, a31);
    objc_storeStrong((id *)&v56->_txForceLifetimeExpiredCount, a32);
    objc_storeStrong((id *)&v56->_channelSequenceMismatchOn5GCount, a33);
    objc_storeStrong((id *)&v56->_channelSequenceMismatchOn2GCount, a34);
    objc_storeStrong((id *)&v56->_infraScanCount, a35);
    objc_storeStrong((id *)&v56->_infraAssocCount, a36);
    objc_storeStrong((id *)&v56->_infraDisassocCount, a37);
    objc_storeStrong((id *)&v56->_countryCode, a38);
    objc_storeStrong((id *)&v56->_txConsecutiveErrorsHistogram, a39);
    objc_storeStrong((id *)&v56->_rxFWDelayHistogram, a40);
    objc_storeStrong((id *)&v56->_rxIPCDelayHistogram, a41);
    objc_storeStrong((id *)&v56->_txPacketExpiryHistogram, a42);
  }

  return v56;
}

- (WiFiAwareDataSessionStatisticsReport)initWithCoder:(id)a3
{
  id v4;
  WiFiAwareDataSessionStatisticsReport *v5;
  uint64_t v6;
  WiFiMACAddress *peerAddress;
  uint64_t v8;
  NSNumber *infrastructureChannel;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSArray *txCCAHistogram;
  uint64_t v15;
  NSArray *rxRSSIHistogram;
  uint64_t v17;
  NSNumber *preferred2GChannelsCount;
  uint64_t v19;
  NSNumber *preferred5GChannelsCount;
  uint64_t v21;
  NSNumber *dfsChannelsCount;
  uint64_t v23;
  NSNumber *csaCount;
  uint64_t v25;
  NSNumber *quietIECount;
  uint64_t v27;
  NSNumber *txErrorCount;
  uint64_t v29;
  NSNumber *packetsOn2GCount;
  uint64_t v31;
  NSNumber *packetsNAVOn2GCount;
  uint64_t v33;
  NSNumber *packetsHOFOn2GCount;
  uint64_t v35;
  NSNumber *packetsOn5GCount;
  uint64_t v37;
  NSNumber *packetsOverridenOn5GCount;
  uint64_t v39;
  NSNumber *infraRelayRequestersCount;
  uint64_t v41;
  NSNumber *txExpiredCount;
  uint64_t v43;
  NSNumber *txNoACKCount;
  uint64_t v45;
  NSNumber *txFailedCount;
  uint64_t v47;
  NSNumber *txNoResourcesCount;
  uint64_t v49;
  NSNumber *txIOErrorCount;
  uint64_t v51;
  NSNumber *txMemoryErrorCount;
  uint64_t v53;
  NSNumber *txChipModeErrorCount;
  uint64_t v55;
  NSNumber *txNoRemotePeerCount;
  uint64_t v57;
  NSNumber *txInternalErrorCount;
  uint64_t v59;
  NSNumber *txDroppedCount;
  uint64_t v61;
  NSNumber *txFirmwareFreePacketCount;
  uint64_t v63;
  NSNumber *txMaxRetriesCount;
  uint64_t v65;
  NSNumber *txForceLifetimeExpiredCount;
  uint64_t v67;
  NSNumber *channelSequenceMismatchOn5GCount;
  uint64_t v69;
  NSNumber *channelSequenceMismatchOn2GCount;
  uint64_t v71;
  NSNumber *infraScanCount;
  uint64_t v73;
  NSNumber *infraAssocCount;
  uint64_t v75;
  NSNumber *infraDisassocCount;
  uint64_t v77;
  NSString *countryCode;
  uint64_t v79;
  NSArray *txConsecutiveErrorsHistogram;
  uint64_t v81;
  NSArray *rxFWDelayHistogram;
  uint64_t v83;
  NSArray *rxIPCDelayHistogram;
  uint64_t v85;
  NSArray *txPacketExpiryHistogram;
  _QWORD v88[3];

  v88[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[WiFiAwareDataSessionStatisticsReport init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WiFiAwareDataSessionStatisticsReport.peerAddress"));
    v6 = objc_claimAutoreleasedReturnValue();
    peerAddress = v5->_peerAddress;
    v5->_peerAddress = (WiFiMACAddress *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WiFiAwareDataSessionStatisticsReport.infrastructureChannel"));
    v8 = objc_claimAutoreleasedReturnValue();
    infrastructureChannel = v5->_infrastructureChannel;
    v5->_infrastructureChannel = (NSNumber *)v8;

    v10 = (void *)MEMORY[0x1E0C99E60];
    v88[0] = objc_opt_class();
    v88[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v88, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setWithArray:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("WiFiAwareDataSessionStatisticsReport.txCCAHistogram"));
    v13 = objc_claimAutoreleasedReturnValue();
    txCCAHistogram = v5->_txCCAHistogram;
    v5->_txCCAHistogram = (NSArray *)v13;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("WiFiAwareDataSessionStatisticsReport.rxRSSIHistogram"));
    v15 = objc_claimAutoreleasedReturnValue();
    rxRSSIHistogram = v5->_rxRSSIHistogram;
    v5->_rxRSSIHistogram = (NSArray *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WiFiAwareDataSessionStatisticsReport.preferred2GChannelsCount"));
    v17 = objc_claimAutoreleasedReturnValue();
    preferred2GChannelsCount = v5->_preferred2GChannelsCount;
    v5->_preferred2GChannelsCount = (NSNumber *)v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WiFiAwareDataSessionStatisticsReport.preferred5GChannelsCount"));
    v19 = objc_claimAutoreleasedReturnValue();
    preferred5GChannelsCount = v5->_preferred5GChannelsCount;
    v5->_preferred5GChannelsCount = (NSNumber *)v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WiFiAwareDataSessionStatisticsReport.dfsChannelsCount"));
    v21 = objc_claimAutoreleasedReturnValue();
    dfsChannelsCount = v5->_dfsChannelsCount;
    v5->_dfsChannelsCount = (NSNumber *)v21;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WiFiAwareDataSessionStatisticsReport.csaCount"));
    v23 = objc_claimAutoreleasedReturnValue();
    csaCount = v5->_csaCount;
    v5->_csaCount = (NSNumber *)v23;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WiFiAwareDataSessionStatisticsReport.quietIECount"));
    v25 = objc_claimAutoreleasedReturnValue();
    quietIECount = v5->_quietIECount;
    v5->_quietIECount = (NSNumber *)v25;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WiFiAwareDataSessionStatisticsReport.txErrorCount"));
    v27 = objc_claimAutoreleasedReturnValue();
    txErrorCount = v5->_txErrorCount;
    v5->_txErrorCount = (NSNumber *)v27;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WiFiAwareDataSessionStatisticsReport.packetsOn2GCount"));
    v29 = objc_claimAutoreleasedReturnValue();
    packetsOn2GCount = v5->_packetsOn2GCount;
    v5->_packetsOn2GCount = (NSNumber *)v29;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WiFiAwareDataSessionStatisticsReport.packetsNAVOn2GCount"));
    v31 = objc_claimAutoreleasedReturnValue();
    packetsNAVOn2GCount = v5->_packetsNAVOn2GCount;
    v5->_packetsNAVOn2GCount = (NSNumber *)v31;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WiFiAwareDataSessionStatisticsReport.packetsHOFOn2GCount"));
    v33 = objc_claimAutoreleasedReturnValue();
    packetsHOFOn2GCount = v5->_packetsHOFOn2GCount;
    v5->_packetsHOFOn2GCount = (NSNumber *)v33;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WiFiAwareDataSessionStatisticsReport.packetsOn5GCount"));
    v35 = objc_claimAutoreleasedReturnValue();
    packetsOn5GCount = v5->_packetsOn5GCount;
    v5->_packetsOn5GCount = (NSNumber *)v35;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WiFiAwareDataSessionStatisticsReport.packetsOverridenOn5GCount"));
    v37 = objc_claimAutoreleasedReturnValue();
    packetsOverridenOn5GCount = v5->_packetsOverridenOn5GCount;
    v5->_packetsOverridenOn5GCount = (NSNumber *)v37;

    v5->_infraRelayOperationStatus = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("WiFiAwareDataSessionStatisticsReport.infraRelayOperationStatus"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WiFiAwareDataSessionStatisticsReport.infraRelayRequestersCount"));
    v39 = objc_claimAutoreleasedReturnValue();
    infraRelayRequestersCount = v5->_infraRelayRequestersCount;
    v5->_infraRelayRequestersCount = (NSNumber *)v39;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WiFiAwareDataSessionStatisticsReport.txExpiredCount"));
    v41 = objc_claimAutoreleasedReturnValue();
    txExpiredCount = v5->_txExpiredCount;
    v5->_txExpiredCount = (NSNumber *)v41;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WiFiAwareDataSessionStatisticsReport.txNoACKCount"));
    v43 = objc_claimAutoreleasedReturnValue();
    txNoACKCount = v5->_txNoACKCount;
    v5->_txNoACKCount = (NSNumber *)v43;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WiFiAwareDataSessionStatisticsReport.txFailedCount"));
    v45 = objc_claimAutoreleasedReturnValue();
    txFailedCount = v5->_txFailedCount;
    v5->_txFailedCount = (NSNumber *)v45;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WiFiAwareDataSessionStatisticsReport.txNoResourcesCount"));
    v47 = objc_claimAutoreleasedReturnValue();
    txNoResourcesCount = v5->_txNoResourcesCount;
    v5->_txNoResourcesCount = (NSNumber *)v47;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WiFiAwareDataSessionStatisticsReport.txIOErrorCount"));
    v49 = objc_claimAutoreleasedReturnValue();
    txIOErrorCount = v5->_txIOErrorCount;
    v5->_txIOErrorCount = (NSNumber *)v49;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WiFiAwareDataSessionStatisticsReport.txMemoryErrorCount"));
    v51 = objc_claimAutoreleasedReturnValue();
    txMemoryErrorCount = v5->_txMemoryErrorCount;
    v5->_txMemoryErrorCount = (NSNumber *)v51;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WiFiAwareDataSessionStatisticsReport.txChipModeErrorCount"));
    v53 = objc_claimAutoreleasedReturnValue();
    txChipModeErrorCount = v5->_txChipModeErrorCount;
    v5->_txChipModeErrorCount = (NSNumber *)v53;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WiFiAwareDataSessionStatisticsReport.txNoRemotePeerCount"));
    v55 = objc_claimAutoreleasedReturnValue();
    txNoRemotePeerCount = v5->_txNoRemotePeerCount;
    v5->_txNoRemotePeerCount = (NSNumber *)v55;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WiFiAwareDataSessionStatisticsReport.txInternalErrorCount"));
    v57 = objc_claimAutoreleasedReturnValue();
    txInternalErrorCount = v5->_txInternalErrorCount;
    v5->_txInternalErrorCount = (NSNumber *)v57;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WiFiAwareDataSessionStatisticsReport.txDroppedCount"));
    v59 = objc_claimAutoreleasedReturnValue();
    txDroppedCount = v5->_txDroppedCount;
    v5->_txDroppedCount = (NSNumber *)v59;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WiFiAwareDataSessionStatisticsReport.txFirmwareFreePacketCount"));
    v61 = objc_claimAutoreleasedReturnValue();
    txFirmwareFreePacketCount = v5->_txFirmwareFreePacketCount;
    v5->_txFirmwareFreePacketCount = (NSNumber *)v61;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WiFiAwareDataSessionStatisticsReport.txMaxRetriesCount"));
    v63 = objc_claimAutoreleasedReturnValue();
    txMaxRetriesCount = v5->_txMaxRetriesCount;
    v5->_txMaxRetriesCount = (NSNumber *)v63;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WiFiAwareDataSessionStatisticsReport.txForceLifetimeExpiredCount"));
    v65 = objc_claimAutoreleasedReturnValue();
    txForceLifetimeExpiredCount = v5->_txForceLifetimeExpiredCount;
    v5->_txForceLifetimeExpiredCount = (NSNumber *)v65;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WiFiAwareDataSessionStatisticsReport.channelSequenceMismatchOn5GCount"));
    v67 = objc_claimAutoreleasedReturnValue();
    channelSequenceMismatchOn5GCount = v5->_channelSequenceMismatchOn5GCount;
    v5->_channelSequenceMismatchOn5GCount = (NSNumber *)v67;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WiFiAwareDataSessionStatisticsReport.channelSequenceMismatchOn2GCount"));
    v69 = objc_claimAutoreleasedReturnValue();
    channelSequenceMismatchOn2GCount = v5->_channelSequenceMismatchOn2GCount;
    v5->_channelSequenceMismatchOn2GCount = (NSNumber *)v69;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WiFiAwareDataSessionStatisticsReport.infraScanCount"));
    v71 = objc_claimAutoreleasedReturnValue();
    infraScanCount = v5->_infraScanCount;
    v5->_infraScanCount = (NSNumber *)v71;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WiFiAwareDataSessionStatisticsReport.infraAssocCount"));
    v73 = objc_claimAutoreleasedReturnValue();
    infraAssocCount = v5->_infraAssocCount;
    v5->_infraAssocCount = (NSNumber *)v73;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WiFiAwareDataSessionStatisticsReport.infraDisassocCount"));
    v75 = objc_claimAutoreleasedReturnValue();
    infraDisassocCount = v5->_infraDisassocCount;
    v5->_infraDisassocCount = (NSNumber *)v75;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WiFiAwareDataSessionStatisticsReport.countryCode"));
    v77 = objc_claimAutoreleasedReturnValue();
    countryCode = v5->_countryCode;
    v5->_countryCode = (NSString *)v77;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("WiFiAwareDataSessionStatisticsReport.txConsecutiveErrorsHistogram"));
    v79 = objc_claimAutoreleasedReturnValue();
    txConsecutiveErrorsHistogram = v5->_txConsecutiveErrorsHistogram;
    v5->_txConsecutiveErrorsHistogram = (NSArray *)v79;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("WiFiAwareDataSessionStatisticsReport.rxFWDelayHistogram"));
    v81 = objc_claimAutoreleasedReturnValue();
    rxFWDelayHistogram = v5->_rxFWDelayHistogram;
    v5->_rxFWDelayHistogram = (NSArray *)v81;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("WiFiAwareDataSessionStatisticsReport.rxIPCDelayHistogram"));
    v83 = objc_claimAutoreleasedReturnValue();
    rxIPCDelayHistogram = v5->_rxIPCDelayHistogram;
    v5->_rxIPCDelayHistogram = (NSArray *)v83;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("WiFiAwareDataSessionStatisticsReport.txPacketExpiryHistogram"));
    v85 = objc_claimAutoreleasedReturnValue();
    txPacketExpiryHistogram = v5->_txPacketExpiryHistogram;
    v5->_txPacketExpiryHistogram = (NSArray *)v85;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;

  v4 = a3;
  -[WiFiAwareDataSessionStatisticsReport peerAddress](self, "peerAddress");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("WiFiAwareDataSessionStatisticsReport.peerAddress"));

  -[WiFiAwareDataSessionStatisticsReport infrastructureChannel](self, "infrastructureChannel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("WiFiAwareDataSessionStatisticsReport.infrastructureChannel"));

  -[WiFiAwareDataSessionStatisticsReport txCCAHistogram](self, "txCCAHistogram");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("WiFiAwareDataSessionStatisticsReport.txCCAHistogram"));

  -[WiFiAwareDataSessionStatisticsReport rxRSSIHistogram](self, "rxRSSIHistogram");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("WiFiAwareDataSessionStatisticsReport.rxRSSIHistogram"));

  -[WiFiAwareDataSessionStatisticsReport preferred2GChannelsCount](self, "preferred2GChannelsCount");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("WiFiAwareDataSessionStatisticsReport.preferred2GChannelsCount"));

  -[WiFiAwareDataSessionStatisticsReport preferred5GChannelsCount](self, "preferred5GChannelsCount");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("WiFiAwareDataSessionStatisticsReport.preferred5GChannelsCount"));

  -[WiFiAwareDataSessionStatisticsReport dfsChannelsCount](self, "dfsChannelsCount");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("WiFiAwareDataSessionStatisticsReport.dfsChannelsCount"));

  -[WiFiAwareDataSessionStatisticsReport csaCount](self, "csaCount");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("WiFiAwareDataSessionStatisticsReport.csaCount"));

  -[WiFiAwareDataSessionStatisticsReport quietIECount](self, "quietIECount");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("WiFiAwareDataSessionStatisticsReport.quietIECount"));

  -[WiFiAwareDataSessionStatisticsReport txErrorCount](self, "txErrorCount");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("WiFiAwareDataSessionStatisticsReport.txErrorCount"));

  -[WiFiAwareDataSessionStatisticsReport packetsOn2GCount](self, "packetsOn2GCount");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v15, CFSTR("WiFiAwareDataSessionStatisticsReport.packetsOn2GCount"));

  -[WiFiAwareDataSessionStatisticsReport packetsNAVOn2GCount](self, "packetsNAVOn2GCount");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v16, CFSTR("WiFiAwareDataSessionStatisticsReport.packetsNAVOn2GCount"));

  -[WiFiAwareDataSessionStatisticsReport packetsHOFOn2GCount](self, "packetsHOFOn2GCount");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v17, CFSTR("WiFiAwareDataSessionStatisticsReport.packetsHOFOn2GCount"));

  -[WiFiAwareDataSessionStatisticsReport packetsOn5GCount](self, "packetsOn5GCount");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v18, CFSTR("WiFiAwareDataSessionStatisticsReport.packetsOn5GCount"));

  -[WiFiAwareDataSessionStatisticsReport packetsOverridenOn5GCount](self, "packetsOverridenOn5GCount");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v19, CFSTR("WiFiAwareDataSessionStatisticsReport.packetsOverridenOn5GCount"));

  objc_msgSend(v4, "encodeBool:forKey:", -[WiFiAwareDataSessionStatisticsReport infraRelayOperationStatus](self, "infraRelayOperationStatus"), CFSTR("WiFiAwareDataSessionStatisticsReport.infraRelayOperationStatus"));
  -[WiFiAwareDataSessionStatisticsReport infraRelayRequestersCount](self, "infraRelayRequestersCount");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v20, CFSTR("WiFiAwareDataSessionStatisticsReport.infraRelayRequestersCount"));

  -[WiFiAwareDataSessionStatisticsReport txExpiredCount](self, "txExpiredCount");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v21, CFSTR("WiFiAwareDataSessionStatisticsReport.txExpiredCount"));

  -[WiFiAwareDataSessionStatisticsReport txNoACKCount](self, "txNoACKCount");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v22, CFSTR("WiFiAwareDataSessionStatisticsReport.txNoACKCount"));

  -[WiFiAwareDataSessionStatisticsReport txFailedCount](self, "txFailedCount");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v23, CFSTR("WiFiAwareDataSessionStatisticsReport.txFailedCount"));

  -[WiFiAwareDataSessionStatisticsReport txNoResourcesCount](self, "txNoResourcesCount");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v24, CFSTR("WiFiAwareDataSessionStatisticsReport.txNoResourcesCount"));

  -[WiFiAwareDataSessionStatisticsReport txIOErrorCount](self, "txIOErrorCount");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v25, CFSTR("WiFiAwareDataSessionStatisticsReport.txIOErrorCount"));

  -[WiFiAwareDataSessionStatisticsReport txMemoryErrorCount](self, "txMemoryErrorCount");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v26, CFSTR("WiFiAwareDataSessionStatisticsReport.txMemoryErrorCount"));

  -[WiFiAwareDataSessionStatisticsReport txChipModeErrorCount](self, "txChipModeErrorCount");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v27, CFSTR("WiFiAwareDataSessionStatisticsReport.txChipModeErrorCount"));

  -[WiFiAwareDataSessionStatisticsReport txNoRemotePeerCount](self, "txNoRemotePeerCount");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v28, CFSTR("WiFiAwareDataSessionStatisticsReport.txNoRemotePeerCount"));

  -[WiFiAwareDataSessionStatisticsReport txInternalErrorCount](self, "txInternalErrorCount");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v29, CFSTR("WiFiAwareDataSessionStatisticsReport.txInternalErrorCount"));

  -[WiFiAwareDataSessionStatisticsReport txDroppedCount](self, "txDroppedCount");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v30, CFSTR("WiFiAwareDataSessionStatisticsReport.txDroppedCount"));

  -[WiFiAwareDataSessionStatisticsReport txFirmwareFreePacketCount](self, "txFirmwareFreePacketCount");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v31, CFSTR("WiFiAwareDataSessionStatisticsReport.txFirmwareFreePacketCount"));

  -[WiFiAwareDataSessionStatisticsReport txMaxRetriesCount](self, "txMaxRetriesCount");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v32, CFSTR("WiFiAwareDataSessionStatisticsReport.txMaxRetriesCount"));

  -[WiFiAwareDataSessionStatisticsReport txForceLifetimeExpiredCount](self, "txForceLifetimeExpiredCount");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v33, CFSTR("WiFiAwareDataSessionStatisticsReport.txForceLifetimeExpiredCount"));

  -[WiFiAwareDataSessionStatisticsReport channelSequenceMismatchOn5GCount](self, "channelSequenceMismatchOn5GCount");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v34, CFSTR("WiFiAwareDataSessionStatisticsReport.channelSequenceMismatchOn5GCount"));

  -[WiFiAwareDataSessionStatisticsReport channelSequenceMismatchOn2GCount](self, "channelSequenceMismatchOn2GCount");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v35, CFSTR("WiFiAwareDataSessionStatisticsReport.channelSequenceMismatchOn2GCount"));

  -[WiFiAwareDataSessionStatisticsReport infraScanCount](self, "infraScanCount");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v36, CFSTR("WiFiAwareDataSessionStatisticsReport.infraScanCount"));

  -[WiFiAwareDataSessionStatisticsReport infraAssocCount](self, "infraAssocCount");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v37, CFSTR("WiFiAwareDataSessionStatisticsReport.infraAssocCount"));

  -[WiFiAwareDataSessionStatisticsReport infraDisassocCount](self, "infraDisassocCount");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v38, CFSTR("WiFiAwareDataSessionStatisticsReport.infraDisassocCount"));

  -[WiFiAwareDataSessionStatisticsReport countryCode](self, "countryCode");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v39, CFSTR("WiFiAwareDataSessionStatisticsReport.countryCode"));

  -[WiFiAwareDataSessionStatisticsReport txConsecutiveErrorsHistogram](self, "txConsecutiveErrorsHistogram");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v40, CFSTR("WiFiAwareDataSessionStatisticsReport.txConsecutiveErrorsHistogram"));

  -[WiFiAwareDataSessionStatisticsReport rxFWDelayHistogram](self, "rxFWDelayHistogram");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v41, CFSTR("WiFiAwareDataSessionStatisticsReport.rxFWDelayHistogram"));

  -[WiFiAwareDataSessionStatisticsReport rxIPCDelayHistogram](self, "rxIPCDelayHistogram");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v42, CFSTR("WiFiAwareDataSessionStatisticsReport.rxIPCDelayHistogram"));

  -[WiFiAwareDataSessionStatisticsReport txPacketExpiryHistogram](self, "txPacketExpiryHistogram");
  v43 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v43, CFSTR("WiFiAwareDataSessionStatisticsReport.txPacketExpiryHistogram"));

}

- (id)description
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v19 = (void *)MEMORY[0x1E0CB3940];
  -[WiFiAwareDataSessionStatisticsReport peerAddress](self, "peerAddress");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiAwareDataSessionStatisticsReport infrastructureChannel](self, "infrastructureChannel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiAwareDataSessionStatisticsReport preferred2GChannelsCount](self, "preferred2GChannelsCount");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiAwareDataSessionStatisticsReport preferred5GChannelsCount](self, "preferred5GChannelsCount");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiAwareDataSessionStatisticsReport dfsChannelsCount](self, "dfsChannelsCount");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiAwareDataSessionStatisticsReport csaCount](self, "csaCount");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiAwareDataSessionStatisticsReport quietIECount](self, "quietIECount");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiAwareDataSessionStatisticsReport txErrorCount](self, "txErrorCount");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiAwareDataSessionStatisticsReport packetsOn2GCount](self, "packetsOn2GCount");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiAwareDataSessionStatisticsReport packetsNAVOn2GCount](self, "packetsNAVOn2GCount");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiAwareDataSessionStatisticsReport packetsHOFOn2GCount](self, "packetsHOFOn2GCount");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiAwareDataSessionStatisticsReport packetsOn5GCount](self, "packetsOn5GCount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiAwareDataSessionStatisticsReport packetsOverridenOn5GCount](self, "packetsOverridenOn5GCount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[WiFiAwareDataSessionStatisticsReport infraRelayOperationStatus](self, "infraRelayOperationStatus");
  -[WiFiAwareDataSessionStatisticsReport infraRelayRequestersCount](self, "infraRelayRequestersCount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiAwareDataSessionStatisticsReport txCCAHistogram](self, "txCCAHistogram");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiAwareDataSessionStatisticsReport rxRSSIHistogram](self, "rxRSSIHistogram");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "stringWithFormat:", CFSTR("<WiFiAwareDataSessionStatisticsReport peerAddress=%@, infrastructureChannel=%@, preferred2GChannelsCount=%@, preferred5GChannelsCount=%@, dfsChannelsCount=%@, csaCount=%@, quietIECount=%@, txErrorCount=%@, packetsOn2GCount=%@, packetsNAVOn2GCount=%@, packetsHOFOn2GCount=%@, packetsOn5GCount=%@, packetsOverridenOn5GCount=%@>, infraRelayOperationStatus=%d, infraRelayRequestersCount=%@\ntxCCA=\n%@\nrxRSSI=%@\n"), v18, v17, v22, v16, v21, v15, v13, v12, v14, v11, v10, v3, v4, v5, v6, v7,
    v8);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (BOOL)isEqual:(id)a3
{
  WiFiAwareDataSessionStatisticsReport *v4;
  WiFiAwareDataSessionStatisticsReport *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _BOOL4 v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  int v28;
  int v29;
  int v30;
  int v31;
  BOOL v32;
  int v33;
  int v34;
  int v35;
  int v36;
  int v37;
  int v38;
  int v39;
  int v40;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  int v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  __int128 v143;
  uint64_t v144;
  uint64_t v145;
  int v146;
  __int128 v147;
  uint64_t v148;
  _BYTE v149[12];
  uint64_t v150;
  int v151;
  _QWORD v152[4];
  int v153;
  id v154;
  id v155;

  v4 = (WiFiAwareDataSessionStatisticsReport *)a3;
  if (self == v4)
  {
    v5 = 0;
LABEL_100:
    v32 = 1;
    goto LABEL_105;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[WiFiAwareDataSessionStatisticsReport peerAddress](self, "peerAddress");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WiFiAwareDataSessionStatisticsReport peerAddress](v5, "peerAddress");
    v154 = (id)objc_claimAutoreleasedReturnValue();
    v155 = v6;
    v153 = objc_msgSend(v6, "isEqual:", v154);
    if (v153)
    {
      -[WiFiAwareDataSessionStatisticsReport infrastructureChannel](self, "infrastructureChannel");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[WiFiAwareDataSessionStatisticsReport infrastructureChannel](v5, "infrastructureChannel");
      v141 = (void *)objc_claimAutoreleasedReturnValue();
      v142 = v8;
      if (objc_msgSend(v8, "isEqual:", v141))
      {
        -[WiFiAwareDataSessionStatisticsReport preferred2GChannelsCount](self, "preferred2GChannelsCount");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[WiFiAwareDataSessionStatisticsReport preferred2GChannelsCount](v5, "preferred2GChannelsCount");
        v139 = (void *)objc_claimAutoreleasedReturnValue();
        v140 = v9;
        if (objc_msgSend(v9, "isEqual:", v139))
        {
          -[WiFiAwareDataSessionStatisticsReport preferred5GChannelsCount](self, "preferred5GChannelsCount");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[WiFiAwareDataSessionStatisticsReport preferred5GChannelsCount](v5, "preferred5GChannelsCount");
          v138 = v10;
          v137 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v10, "isEqual:"))
          {
            -[WiFiAwareDataSessionStatisticsReport dfsChannelsCount](self, "dfsChannelsCount");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            -[WiFiAwareDataSessionStatisticsReport dfsChannelsCount](v5, "dfsChannelsCount");
            v136 = v11;
            v135 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v11, "isEqual:"))
            {
              -[WiFiAwareDataSessionStatisticsReport csaCount](self, "csaCount");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              -[WiFiAwareDataSessionStatisticsReport csaCount](v5, "csaCount");
              v134 = v12;
              v133 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v12, "isEqual:"))
              {
                -[WiFiAwareDataSessionStatisticsReport quietIECount](self, "quietIECount");
                v13 = (void *)objc_claimAutoreleasedReturnValue();
                -[WiFiAwareDataSessionStatisticsReport quietIECount](v5, "quietIECount");
                v132 = v13;
                v131 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v13, "isEqual:"))
                {
                  -[WiFiAwareDataSessionStatisticsReport txErrorCount](self, "txErrorCount");
                  v14 = (void *)objc_claimAutoreleasedReturnValue();
                  -[WiFiAwareDataSessionStatisticsReport txErrorCount](v5, "txErrorCount");
                  v129 = (void *)objc_claimAutoreleasedReturnValue();
                  v130 = v14;
                  if (objc_msgSend(v14, "isEqual:", v129))
                  {
                    -[WiFiAwareDataSessionStatisticsReport packetsOn2GCount](self, "packetsOn2GCount");
                    v15 = (void *)objc_claimAutoreleasedReturnValue();
                    -[WiFiAwareDataSessionStatisticsReport packetsOn2GCount](v5, "packetsOn2GCount");
                    v127 = (void *)objc_claimAutoreleasedReturnValue();
                    v128 = v15;
                    if (objc_msgSend(v15, "isEqual:", v127))
                    {
                      -[WiFiAwareDataSessionStatisticsReport packetsNAVOn2GCount](self, "packetsNAVOn2GCount");
                      v16 = (void *)objc_claimAutoreleasedReturnValue();
                      -[WiFiAwareDataSessionStatisticsReport packetsNAVOn2GCount](v5, "packetsNAVOn2GCount");
                      v125 = (void *)objc_claimAutoreleasedReturnValue();
                      v126 = v16;
                      if (objc_msgSend(v16, "isEqual:", v125))
                      {
                        -[WiFiAwareDataSessionStatisticsReport packetsHOFOn2GCount](self, "packetsHOFOn2GCount");
                        v17 = (void *)objc_claimAutoreleasedReturnValue();
                        -[WiFiAwareDataSessionStatisticsReport packetsHOFOn2GCount](v5, "packetsHOFOn2GCount");
                        v123 = (void *)objc_claimAutoreleasedReturnValue();
                        v124 = v17;
                        if (objc_msgSend(v17, "isEqual:", v123))
                        {
                          -[WiFiAwareDataSessionStatisticsReport packetsOn5GCount](self, "packetsOn5GCount");
                          v18 = (void *)objc_claimAutoreleasedReturnValue();
                          -[WiFiAwareDataSessionStatisticsReport packetsOn5GCount](v5, "packetsOn5GCount");
                          v121 = (void *)objc_claimAutoreleasedReturnValue();
                          v122 = v18;
                          if (objc_msgSend(v18, "isEqual:", v121))
                          {
                            -[WiFiAwareDataSessionStatisticsReport packetsOverridenOn5GCount](self, "packetsOverridenOn5GCount");
                            v19 = (void *)objc_claimAutoreleasedReturnValue();
                            -[WiFiAwareDataSessionStatisticsReport packetsOverridenOn5GCount](v5, "packetsOverridenOn5GCount");
                            v119 = (void *)objc_claimAutoreleasedReturnValue();
                            v120 = v19;
                            if (objc_msgSend(v19, "isEqual:", v119))
                            {
                              -[WiFiAwareDataSessionStatisticsReport txCCAHistogram](self, "txCCAHistogram");
                              v20 = (void *)objc_claimAutoreleasedReturnValue();
                              -[WiFiAwareDataSessionStatisticsReport txCCAHistogram](v5, "txCCAHistogram");
                              v117 = (void *)objc_claimAutoreleasedReturnValue();
                              v118 = v20;
                              if (objc_msgSend(v20, "isEqual:", v117))
                              {
                                -[WiFiAwareDataSessionStatisticsReport rxRSSIHistogram](self, "rxRSSIHistogram");
                                v21 = (void *)objc_claimAutoreleasedReturnValue();
                                -[WiFiAwareDataSessionStatisticsReport rxRSSIHistogram](v5, "rxRSSIHistogram");
                                v115 = (void *)objc_claimAutoreleasedReturnValue();
                                v116 = v21;
                                if (objc_msgSend(v21, "isEqual:", v115)
                                  && (v22 = -[WiFiAwareDataSessionStatisticsReport infraRelayOperationStatus](self, "infraRelayOperationStatus"), v22 == -[WiFiAwareDataSessionStatisticsReport infraRelayOperationStatus](v5, "infraRelayOperationStatus")))
                                {
                                  -[WiFiAwareDataSessionStatisticsReport infraRelayRequestersCount](self, "infraRelayRequestersCount");
                                  v42 = (void *)objc_claimAutoreleasedReturnValue();
                                  -[WiFiAwareDataSessionStatisticsReport infraRelayRequestersCount](v5, "infraRelayRequestersCount");
                                  v113 = (void *)objc_claimAutoreleasedReturnValue();
                                  v114 = v42;
                                  if (objc_msgSend(v42, "isEqual:", v113))
                                  {
                                    -[WiFiAwareDataSessionStatisticsReport txExpiredCount](self, "txExpiredCount");
                                    v43 = (void *)objc_claimAutoreleasedReturnValue();
                                    -[WiFiAwareDataSessionStatisticsReport txExpiredCount](v5, "txExpiredCount");
                                    v111 = (void *)objc_claimAutoreleasedReturnValue();
                                    v112 = v43;
                                    if (objc_msgSend(v43, "isEqual:", v111))
                                    {
                                      -[WiFiAwareDataSessionStatisticsReport txNoACKCount](self, "txNoACKCount");
                                      v44 = (void *)objc_claimAutoreleasedReturnValue();
                                      -[WiFiAwareDataSessionStatisticsReport txNoACKCount](v5, "txNoACKCount");
                                      v109 = (void *)objc_claimAutoreleasedReturnValue();
                                      v110 = v44;
                                      if (objc_msgSend(v44, "isEqual:", v109))
                                      {
                                        -[WiFiAwareDataSessionStatisticsReport txFailedCount](self, "txFailedCount");
                                        v45 = (void *)objc_claimAutoreleasedReturnValue();
                                        -[WiFiAwareDataSessionStatisticsReport txFailedCount](v5, "txFailedCount");
                                        v107 = (void *)objc_claimAutoreleasedReturnValue();
                                        v108 = v45;
                                        if (objc_msgSend(v45, "isEqual:", v107))
                                        {
                                          -[WiFiAwareDataSessionStatisticsReport txNoResourcesCount](self, "txNoResourcesCount");
                                          v46 = (void *)objc_claimAutoreleasedReturnValue();
                                          -[WiFiAwareDataSessionStatisticsReport txNoResourcesCount](v5, "txNoResourcesCount");
                                          v105 = (void *)objc_claimAutoreleasedReturnValue();
                                          v106 = v46;
                                          if (objc_msgSend(v46, "isEqual:", v105))
                                          {
                                            -[WiFiAwareDataSessionStatisticsReport txIOErrorCount](self, "txIOErrorCount");
                                            v47 = (void *)objc_claimAutoreleasedReturnValue();
                                            -[WiFiAwareDataSessionStatisticsReport txIOErrorCount](v5, "txIOErrorCount");
                                            v103 = (void *)objc_claimAutoreleasedReturnValue();
                                            v104 = v47;
                                            if (objc_msgSend(v47, "isEqual:", v103))
                                            {
                                              -[WiFiAwareDataSessionStatisticsReport txMemoryErrorCount](self, "txMemoryErrorCount");
                                              v48 = (void *)objc_claimAutoreleasedReturnValue();
                                              -[WiFiAwareDataSessionStatisticsReport txMemoryErrorCount](v5, "txMemoryErrorCount");
                                              v101 = (void *)objc_claimAutoreleasedReturnValue();
                                              v102 = v48;
                                              if (objc_msgSend(v48, "isEqual:", v101))
                                              {
                                                -[WiFiAwareDataSessionStatisticsReport txChipModeErrorCount](self, "txChipModeErrorCount");
                                                v49 = (void *)objc_claimAutoreleasedReturnValue();
                                                -[WiFiAwareDataSessionStatisticsReport txChipModeErrorCount](v5, "txChipModeErrorCount");
                                                v99 = (void *)objc_claimAutoreleasedReturnValue();
                                                v100 = v49;
                                                if (objc_msgSend(v49, "isEqual:", v99))
                                                {
                                                  -[WiFiAwareDataSessionStatisticsReport txNoRemotePeerCount](self, "txNoRemotePeerCount");
                                                  v50 = (void *)objc_claimAutoreleasedReturnValue();
                                                  -[WiFiAwareDataSessionStatisticsReport txNoRemotePeerCount](v5, "txNoRemotePeerCount");
                                                  v97 = (void *)objc_claimAutoreleasedReturnValue();
                                                  v98 = v50;
                                                  if (objc_msgSend(v50, "isEqual:", v97))
                                                  {
                                                    -[WiFiAwareDataSessionStatisticsReport txInternalErrorCount](self, "txInternalErrorCount");
                                                    v51 = (void *)objc_claimAutoreleasedReturnValue();
                                                    -[WiFiAwareDataSessionStatisticsReport txInternalErrorCount](v5, "txInternalErrorCount");
                                                    v95 = (void *)objc_claimAutoreleasedReturnValue();
                                                    v96 = v51;
                                                    if (objc_msgSend(v51, "isEqual:", v95))
                                                    {
                                                      -[WiFiAwareDataSessionStatisticsReport txDroppedCount](self, "txDroppedCount");
                                                      v52 = (void *)objc_claimAutoreleasedReturnValue();
                                                      -[WiFiAwareDataSessionStatisticsReport txDroppedCount](v5, "txDroppedCount");
                                                      v93 = (void *)objc_claimAutoreleasedReturnValue();
                                                      v94 = v52;
                                                      if (objc_msgSend(v52, "isEqual:", v93))
                                                      {
                                                        -[WiFiAwareDataSessionStatisticsReport txFirmwareFreePacketCount](self, "txFirmwareFreePacketCount");
                                                        v53 = (void *)objc_claimAutoreleasedReturnValue();
                                                        -[WiFiAwareDataSessionStatisticsReport txFirmwareFreePacketCount](v5, "txFirmwareFreePacketCount");
                                                        v91 = (void *)objc_claimAutoreleasedReturnValue();
                                                        v92 = v53;
                                                        if (objc_msgSend(v53, "isEqual:", v91))
                                                        {
                                                          -[WiFiAwareDataSessionStatisticsReport txMaxRetriesCount](self, "txMaxRetriesCount");
                                                          v54 = (void *)objc_claimAutoreleasedReturnValue();
                                                          -[WiFiAwareDataSessionStatisticsReport txMaxRetriesCount](v5, "txMaxRetriesCount");
                                                          v89 = (void *)objc_claimAutoreleasedReturnValue();
                                                          v90 = v54;
                                                          if (objc_msgSend(v54, "isEqual:", v89))
                                                          {
                                                            -[WiFiAwareDataSessionStatisticsReport txForceLifetimeExpiredCount](self, "txForceLifetimeExpiredCount");
                                                            v55 = (void *)objc_claimAutoreleasedReturnValue();
                                                            -[WiFiAwareDataSessionStatisticsReport txForceLifetimeExpiredCount](v5, "txForceLifetimeExpiredCount");
                                                            v87 = (void *)objc_claimAutoreleasedReturnValue();
                                                            v88 = v55;
                                                            if (objc_msgSend(v55, "isEqual:", v87))
                                                            {
                                                              -[WiFiAwareDataSessionStatisticsReport channelSequenceMismatchOn5GCount](self, "channelSequenceMismatchOn5GCount");
                                                              v56 = (void *)objc_claimAutoreleasedReturnValue();
                                                              -[WiFiAwareDataSessionStatisticsReport channelSequenceMismatchOn5GCount](v5, "channelSequenceMismatchOn5GCount");
                                                              v85 = (void *)objc_claimAutoreleasedReturnValue();
                                                              v86 = v56;
                                                              if (objc_msgSend(v56, "isEqual:", v85))
                                                              {
                                                                -[WiFiAwareDataSessionStatisticsReport channelSequenceMismatchOn2GCount](self, "channelSequenceMismatchOn2GCount");
                                                                v57 = (void *)objc_claimAutoreleasedReturnValue();
                                                                -[WiFiAwareDataSessionStatisticsReport channelSequenceMismatchOn2GCount](v5, "channelSequenceMismatchOn2GCount");
                                                                v83 = (void *)objc_claimAutoreleasedReturnValue();
                                                                v84 = v57;
                                                                if (objc_msgSend(v57, "isEqual:", v83))
                                                                {
                                                                  -[WiFiAwareDataSessionStatisticsReport infraScanCount](self, "infraScanCount");
                                                                  v58 = (void *)objc_claimAutoreleasedReturnValue();
                                                                  -[WiFiAwareDataSessionStatisticsReport infraScanCount](v5, "infraScanCount");
                                                                  v81 = (void *)objc_claimAutoreleasedReturnValue();
                                                                  v82 = v58;
                                                                  if (objc_msgSend(v58, "isEqual:", v81))
                                                                  {
                                                                    -[WiFiAwareDataSessionStatisticsReport infraAssocCount](self, "infraAssocCount");
                                                                    v59 = (void *)objc_claimAutoreleasedReturnValue();
                                                                    -[WiFiAwareDataSessionStatisticsReport infraAssocCount](v5, "infraAssocCount");
                                                                    v79 = (void *)objc_claimAutoreleasedReturnValue();
                                                                    v80 = v59;
                                                                    if (objc_msgSend(v59, "isEqual:", v79))
                                                                    {
                                                                      -[WiFiAwareDataSessionStatisticsReport infraDisassocCount](self, "infraDisassocCount");
                                                                      v60 = (void *)objc_claimAutoreleasedReturnValue();
                                                                      -[WiFiAwareDataSessionStatisticsReport infraDisassocCount](v5, "infraDisassocCount");
                                                                      v77 = (void *)objc_claimAutoreleasedReturnValue();
                                                                      v78 = v60;
                                                                      if (objc_msgSend(v60, "isEqual:", v77))
                                                                      {
                                                                        -[WiFiAwareDataSessionStatisticsReport countryCode](self, "countryCode");
                                                                        v61 = (void *)objc_claimAutoreleasedReturnValue();
                                                                        -[WiFiAwareDataSessionStatisticsReport countryCode](v5, "countryCode");
                                                                        v75 = (void *)objc_claimAutoreleasedReturnValue();
                                                                        v76 = v61;
                                                                        if (objc_msgSend(v61, "isEqual:", v75))
                                                                        {
                                                                          -[WiFiAwareDataSessionStatisticsReport txConsecutiveErrorsHistogram](self, "txConsecutiveErrorsHistogram");
                                                                          v62 = (void *)objc_claimAutoreleasedReturnValue();
                                                                          -[WiFiAwareDataSessionStatisticsReport txConsecutiveErrorsHistogram](v5, "txConsecutiveErrorsHistogram");
                                                                          v73 = (void *)objc_claimAutoreleasedReturnValue();
                                                                          v74 = v62;
                                                                          if (objc_msgSend(v62, "isEqual:", v73))
                                                                          {
                                                                            -[WiFiAwareDataSessionStatisticsReport rxFWDelayHistogram](self, "rxFWDelayHistogram");
                                                                            v63 = (void *)objc_claimAutoreleasedReturnValue();
                                                                            -[WiFiAwareDataSessionStatisticsReport rxFWDelayHistogram](v5, "rxFWDelayHistogram");
                                                                            v71 = (void *)objc_claimAutoreleasedReturnValue();
                                                                            v72 = v63;
                                                                            if (objc_msgSend(v63, "isEqual:", v71))
                                                                            {
                                                                              -[WiFiAwareDataSessionStatisticsReport rxIPCDelayHistogram](self, "rxIPCDelayHistogram");
                                                                              v64 = (void *)objc_claimAutoreleasedReturnValue();
                                                                              -[WiFiAwareDataSessionStatisticsReport rxIPCDelayHistogram](v5, "rxIPCDelayHistogram");
                                                                              v69 = (void *)objc_claimAutoreleasedReturnValue();
                                                                              v70 = v64;
                                                                              if (objc_msgSend(v64, "isEqual:", v69))
                                                                              {
                                                                                -[WiFiAwareDataSessionStatisticsReport txPacketExpiryHistogram](self, "txPacketExpiryHistogram");
                                                                                v65 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                -[WiFiAwareDataSessionStatisticsReport txPacketExpiryHistogram](v5, "txPacketExpiryHistogram");
                                                                                v66 = objc_claimAutoreleasedReturnValue();
                                                                                v68 = v65;
                                                                                v67 = objc_msgSend(v65, "isEqual:", v66);
                                                                                v7 = (void *)v66;
                                                                                v28 = 1;
                                                                                LODWORD(v152[3]) = 1;
                                                                                HIDWORD(v152[3]) = v67;
                                                                              }
                                                                              else
                                                                              {
                                                                                v28 = 0;
                                                                                v152[3] = 1;
                                                                              }
                                                                              v152[2] = 0x100000001;
                                                                              v152[1] = 0x100000001;
                                                                              v29 = 1;
                                                                              v152[0] = 0x100000001;
                                                                              v30 = 1;
                                                                              v31 = 1;
                                                                              v150 = 0x100000001;
                                                                              *(_DWORD *)&v149[8] = 1;
                                                                              *(_QWORD *)&v147 = 0x100000001;
                                                                              v148 = 0x100000001;
                                                                              *((_QWORD *)&v147 + 1) = 0x100000001;
                                                                              v145 = 0x100000001;
                                                                              v144 = 0x100000001;
                                                                              *((_QWORD *)&v143 + 1) = 0x100000001;
                                                                              *(_QWORD *)&v143 = 0x100000001;
                                                                              v146 = 1;
                                                                              *(_QWORD *)v149 = 0x100000001;
                                                                              v151 = 1;
                                                                              v23 = 1;
                                                                              v24 = 1;
                                                                              v25 = 1;
                                                                              v26 = 1;
                                                                              v27 = 1;
                                                                            }
                                                                            else
                                                                            {
                                                                              v27 = 0;
                                                                              v28 = 0;
                                                                              v152[3] = 1;
                                                                              v152[2] = 0x100000001;
                                                                              v152[1] = 0x100000001;
                                                                              v29 = 1;
                                                                              v152[0] = 0x100000001;
                                                                              v30 = 1;
                                                                              v31 = 1;
                                                                              v150 = 0x100000001;
                                                                              *(_DWORD *)&v149[8] = 1;
                                                                              *(_QWORD *)&v147 = 0x100000001;
                                                                              v148 = 0x100000001;
                                                                              *((_QWORD *)&v147 + 1) = 0x100000001;
                                                                              v145 = 0x100000001;
                                                                              v144 = 0x100000001;
                                                                              *((_QWORD *)&v143 + 1) = 0x100000001;
                                                                              *(_QWORD *)&v143 = 0x100000001;
                                                                              v146 = 1;
                                                                              *(_QWORD *)v149 = 0x100000001;
                                                                              v151 = 1;
                                                                              v23 = 1;
                                                                              v24 = 1;
                                                                              v25 = 1;
                                                                              v26 = 1;
                                                                            }
                                                                          }
                                                                          else
                                                                          {
                                                                            v26 = 0;
                                                                            v27 = 0;
                                                                            v28 = 0;
                                                                            v152[3] = 1;
                                                                            v152[2] = 0x100000001;
                                                                            v152[1] = 0x100000001;
                                                                            v29 = 1;
                                                                            v152[0] = 0x100000001;
                                                                            v30 = 1;
                                                                            v31 = 1;
                                                                            v150 = 0x100000001;
                                                                            *(_DWORD *)&v149[8] = 1;
                                                                            *(_QWORD *)&v147 = 0x100000001;
                                                                            v148 = 0x100000001;
                                                                            *((_QWORD *)&v147 + 1) = 0x100000001;
                                                                            v145 = 0x100000001;
                                                                            v144 = 0x100000001;
                                                                            *((_QWORD *)&v143 + 1) = 0x100000001;
                                                                            *(_QWORD *)&v143 = 0x100000001;
                                                                            v146 = 1;
                                                                            *(_QWORD *)v149 = 0x100000001;
                                                                            v151 = 1;
                                                                            v23 = 1;
                                                                            v24 = 1;
                                                                            v25 = 1;
                                                                          }
                                                                        }
                                                                        else
                                                                        {
                                                                          v25 = 0;
                                                                          v26 = 0;
                                                                          v27 = 0;
                                                                          v28 = 0;
                                                                          v152[3] = 1;
                                                                          v152[2] = 0x100000001;
                                                                          v152[1] = 0x100000001;
                                                                          v29 = 1;
                                                                          v152[0] = 0x100000001;
                                                                          v30 = 1;
                                                                          v31 = 1;
                                                                          v150 = 0x100000001;
                                                                          *(_DWORD *)&v149[8] = 1;
                                                                          *(_QWORD *)&v147 = 0x100000001;
                                                                          v148 = 0x100000001;
                                                                          *((_QWORD *)&v147 + 1) = 0x100000001;
                                                                          v145 = 0x100000001;
                                                                          v144 = 0x100000001;
                                                                          *((_QWORD *)&v143 + 1) = 0x100000001;
                                                                          *(_QWORD *)&v143 = 0x100000001;
                                                                          v146 = 1;
                                                                          *(_QWORD *)v149 = 0x100000001;
                                                                          v151 = 1;
                                                                          v23 = 1;
                                                                          v24 = 1;
                                                                        }
                                                                      }
                                                                      else
                                                                      {
                                                                        v24 = 0;
                                                                        v25 = 0;
                                                                        v26 = 0;
                                                                        v27 = 0;
                                                                        v28 = 0;
                                                                        v152[3] = 1;
                                                                        v152[2] = 0x100000001;
                                                                        v152[1] = 0x100000001;
                                                                        v29 = 1;
                                                                        v152[0] = 0x100000001;
                                                                        v30 = 1;
                                                                        v31 = 1;
                                                                        v150 = 0x100000001;
                                                                        *(_DWORD *)&v149[8] = 1;
                                                                        *(_QWORD *)&v147 = 0x100000001;
                                                                        v148 = 0x100000001;
                                                                        *((_QWORD *)&v147 + 1) = 0x100000001;
                                                                        v145 = 0x100000001;
                                                                        v144 = 0x100000001;
                                                                        *((_QWORD *)&v143 + 1) = 0x100000001;
                                                                        *(_QWORD *)&v143 = 0x100000001;
                                                                        v146 = 1;
                                                                        *(_QWORD *)v149 = 0x100000001;
                                                                        v151 = 1;
                                                                        v23 = 1;
                                                                      }
                                                                    }
                                                                    else
                                                                    {
                                                                      v23 = 0;
                                                                      v24 = 0;
                                                                      v25 = 0;
                                                                      v26 = 0;
                                                                      v27 = 0;
                                                                      v28 = 0;
                                                                      HIDWORD(v152[3]) = 0;
                                                                      LODWORD(v152[2]) = 1;
                                                                      *(_QWORD *)((char *)&v152[2] + 4) = 0x100000001;
                                                                      v152[1] = 0x100000001;
                                                                      v29 = 1;
                                                                      v152[0] = 0x100000001;
                                                                      v30 = 1;
                                                                      v31 = 1;
                                                                      v150 = 0x100000001;
                                                                      *(_DWORD *)&v149[8] = 1;
                                                                      *(_QWORD *)&v147 = 0x100000001;
                                                                      v148 = 0x100000001;
                                                                      *((_QWORD *)&v147 + 1) = 0x100000001;
                                                                      v145 = 0x100000001;
                                                                      v144 = 0x100000001;
                                                                      *((_QWORD *)&v143 + 1) = 0x100000001;
                                                                      *(_QWORD *)&v143 = 0x100000001;
                                                                      v146 = 1;
                                                                      *(_QWORD *)v149 = 0x100000001;
                                                                      v151 = 1;
                                                                    }
                                                                  }
                                                                  else
                                                                  {
                                                                    v23 = 0;
                                                                    v24 = 0;
                                                                    v25 = 0;
                                                                    v26 = 0;
                                                                    v27 = 0;
                                                                    v28 = 0;
                                                                    HIDWORD(v152[3]) = 0;
                                                                    LODWORD(v152[2]) = 1;
                                                                    *(_QWORD *)((char *)&v152[2] + 4) = 0x100000001;
                                                                    v152[1] = 0x100000001;
                                                                    v29 = 1;
                                                                    v30 = 1;
                                                                    v31 = 1;
                                                                    v151 = 0;
                                                                    v152[0] = 0x100000001;
                                                                    *(_DWORD *)&v149[8] = 1;
                                                                    *(_QWORD *)&v147 = 0x100000001;
                                                                    v148 = 0x100000001;
                                                                    *((_QWORD *)&v147 + 1) = 0x100000001;
                                                                    v145 = 0x100000001;
                                                                    v144 = 0x100000001;
                                                                    *((_QWORD *)&v143 + 1) = 0x100000001;
                                                                    *(_QWORD *)&v143 = 0x100000001;
                                                                    v146 = 1;
                                                                    *(_QWORD *)v149 = 0x100000001;
                                                                    v150 = 0x100000001;
                                                                  }
                                                                }
                                                                else
                                                                {
                                                                  v23 = 0;
                                                                  v24 = 0;
                                                                  v25 = 0;
                                                                  v26 = 0;
                                                                  v27 = 0;
                                                                  v28 = 0;
                                                                  HIDWORD(v152[3]) = 0;
                                                                  LODWORD(v152[2]) = 1;
                                                                  *(_QWORD *)((char *)&v152[2] + 4) = 0x100000001;
                                                                  v152[1] = 0x100000001;
                                                                  v29 = 1;
                                                                  v30 = 1;
                                                                  v31 = 1;
                                                                  v151 = 0;
                                                                  v152[0] = 0x100000001;
                                                                  v150 = 0x100000000;
                                                                  *(_DWORD *)&v149[8] = 1;
                                                                  *(_QWORD *)&v147 = 0x100000001;
                                                                  v148 = 0x100000001;
                                                                  *((_QWORD *)&v147 + 1) = 0x100000001;
                                                                  v145 = 0x100000001;
                                                                  v144 = 0x100000001;
                                                                  *((_QWORD *)&v143 + 1) = 0x100000001;
                                                                  *(_QWORD *)&v143 = 0x100000001;
                                                                  v146 = 1;
                                                                  *(_QWORD *)v149 = 0x100000001;
                                                                }
                                                              }
                                                              else
                                                              {
                                                                v23 = 0;
                                                                v24 = 0;
                                                                v25 = 0;
                                                                v26 = 0;
                                                                v27 = 0;
                                                                v28 = 0;
                                                                HIDWORD(v152[3]) = 0;
                                                                LODWORD(v152[2]) = 1;
                                                                *(_QWORD *)((char *)&v152[2] + 4) = 0x100000001;
                                                                v152[1] = 0x100000001;
                                                                v29 = 1;
                                                                v30 = 1;
                                                                v31 = 1;
                                                                v151 = 0;
                                                                v152[0] = 0x100000001;
                                                                v150 = 0x100000000;
                                                                *(_DWORD *)&v149[8] = 1;
                                                                *(_QWORD *)&v147 = 0x100000001;
                                                                v148 = 0x100000001;
                                                                *((_QWORD *)&v147 + 1) = 0x100000001;
                                                                v145 = 0x100000001;
                                                                v144 = 0x100000001;
                                                                *((_QWORD *)&v143 + 1) = 0x100000001;
                                                                *(_QWORD *)&v143 = 0x100000001;
                                                                v146 = 1;
                                                                *(_QWORD *)v149 = 1;
                                                              }
                                                            }
                                                            else
                                                            {
                                                              *(_QWORD *)v149 = 0;
                                                              v23 = 0;
                                                              v24 = 0;
                                                              v25 = 0;
                                                              v26 = 0;
                                                              v27 = 0;
                                                              v28 = 0;
                                                              HIDWORD(v152[3]) = 0;
                                                              LODWORD(v152[2]) = 1;
                                                              *(_QWORD *)((char *)&v152[2] + 4) = 0x100000001;
                                                              v152[1] = 0x100000001;
                                                              v29 = 1;
                                                              v30 = 1;
                                                              v31 = 1;
                                                              v151 = 0;
                                                              v152[0] = 0x100000001;
                                                              v150 = 0x100000000;
                                                              *(_DWORD *)&v149[8] = 1;
                                                              *(_QWORD *)&v147 = 0x100000001;
                                                              *((_QWORD *)&v147 + 1) = 0x100000001;
                                                              v145 = 0x100000001;
                                                              v144 = 0x100000001;
                                                              *((_QWORD *)&v143 + 1) = 0x100000001;
                                                              *(_QWORD *)&v143 = 0x100000001;
                                                              v146 = 1;
                                                              v148 = 0x100000001;
                                                            }
                                                          }
                                                          else
                                                          {
                                                            *(_QWORD *)v149 = 0;
                                                            v23 = 0;
                                                            v24 = 0;
                                                            v25 = 0;
                                                            v26 = 0;
                                                            v27 = 0;
                                                            v28 = 0;
                                                            HIDWORD(v152[3]) = 0;
                                                            LODWORD(v152[2]) = 1;
                                                            *(_QWORD *)((char *)&v152[2] + 4) = 0x100000001;
                                                            v152[1] = 0x100000001;
                                                            v29 = 1;
                                                            v30 = 1;
                                                            v31 = 1;
                                                            v151 = 0;
                                                            v152[0] = 0x100000001;
                                                            v150 = 0x100000000;
                                                            *(_DWORD *)&v149[8] = 1;
                                                            LODWORD(v147) = 1;
                                                            *(_QWORD *)((char *)&v147 + 4) = 0x100000001;
                                                            v148 = 0x100000000;
                                                            HIDWORD(v147) = 1;
                                                            v145 = 0x100000001;
                                                            v144 = 0x100000001;
                                                            *((_QWORD *)&v143 + 1) = 0x100000001;
                                                            *(_QWORD *)&v143 = 0x100000001;
                                                            v146 = 1;
                                                          }
                                                        }
                                                        else
                                                        {
                                                          *((_QWORD *)&v147 + 1) = 0x100000000;
                                                          *(_QWORD *)v149 = 0;
                                                          v23 = 0;
                                                          v24 = 0;
                                                          v25 = 0;
                                                          v26 = 0;
                                                          v27 = 0;
                                                          v28 = 0;
                                                          HIDWORD(v152[3]) = 0;
                                                          LODWORD(v152[2]) = 1;
                                                          *(_QWORD *)((char *)&v152[2] + 4) = 0x100000001;
                                                          v152[1] = 0x100000001;
                                                          v29 = 1;
                                                          v30 = 1;
                                                          v31 = 1;
                                                          v151 = 0;
                                                          v152[0] = 0x100000001;
                                                          v150 = 0x100000000;
                                                          *(_DWORD *)&v149[8] = 1;
                                                          *(_QWORD *)&v147 = 0x100000001;
                                                          v148 = 0x100000000;
                                                          v145 = 0x100000001;
                                                          v144 = 0x100000001;
                                                          *((_QWORD *)&v143 + 1) = 0x100000001;
                                                          *(_QWORD *)&v143 = 0x100000001;
                                                          v146 = 1;
                                                        }
                                                      }
                                                      else
                                                      {
                                                        v146 = 0;
                                                        *((_QWORD *)&v147 + 1) = 0x100000000;
                                                        *(_QWORD *)v149 = 0;
                                                        v23 = 0;
                                                        v24 = 0;
                                                        v25 = 0;
                                                        v26 = 0;
                                                        v27 = 0;
                                                        v28 = 0;
                                                        HIDWORD(v152[3]) = 0;
                                                        LODWORD(v152[2]) = 1;
                                                        *(_QWORD *)((char *)&v152[2] + 4) = 0x100000001;
                                                        v152[1] = 0x100000001;
                                                        v29 = 1;
                                                        v30 = 1;
                                                        v31 = 1;
                                                        v151 = 0;
                                                        v152[0] = 0x100000001;
                                                        v150 = 0x100000000;
                                                        *(_DWORD *)&v149[8] = 1;
                                                        *(_QWORD *)&v147 = 0x100000001;
                                                        v148 = 0x100000000;
                                                        v144 = 0x100000001;
                                                        *((_QWORD *)&v143 + 1) = 0x100000001;
                                                        *(_QWORD *)&v143 = 0x100000001;
                                                        v145 = 0x100000001;
                                                      }
                                                    }
                                                    else
                                                    {
                                                      v145 = 0x100000000;
                                                      v146 = 0;
                                                      *((_QWORD *)&v147 + 1) = 0x100000000;
                                                      *(_QWORD *)v149 = 0;
                                                      v23 = 0;
                                                      v24 = 0;
                                                      v25 = 0;
                                                      v26 = 0;
                                                      v27 = 0;
                                                      v28 = 0;
                                                      HIDWORD(v152[3]) = 0;
                                                      LODWORD(v152[2]) = 1;
                                                      *(_QWORD *)((char *)&v152[2] + 4) = 0x100000001;
                                                      v152[1] = 0x100000001;
                                                      v29 = 1;
                                                      v30 = 1;
                                                      v31 = 1;
                                                      v151 = 0;
                                                      v152[0] = 0x100000001;
                                                      v150 = 0x100000000;
                                                      *(_DWORD *)&v149[8] = 1;
                                                      *(_QWORD *)&v147 = 0x100000001;
                                                      v148 = 0x100000000;
                                                      *((_QWORD *)&v143 + 1) = 0x100000001;
                                                      *(_QWORD *)&v143 = 0x100000001;
                                                      v144 = 0x100000001;
                                                    }
                                                  }
                                                  else
                                                  {
                                                    v144 = 0x100000000;
                                                    v145 = 0x100000000;
                                                    v146 = 0;
                                                    *((_QWORD *)&v147 + 1) = 0x100000000;
                                                    *(_QWORD *)v149 = 0;
                                                    v23 = 0;
                                                    v24 = 0;
                                                    v25 = 0;
                                                    v26 = 0;
                                                    v27 = 0;
                                                    v28 = 0;
                                                    HIDWORD(v152[3]) = 0;
                                                    LODWORD(v152[2]) = 1;
                                                    *(_QWORD *)((char *)&v152[2] + 4) = 0x100000001;
                                                    v152[1] = 0x100000001;
                                                    v29 = 1;
                                                    v30 = 1;
                                                    v31 = 1;
                                                    v151 = 0;
                                                    v152[0] = 0x100000001;
                                                    v150 = 0x100000000;
                                                    *(_DWORD *)&v149[8] = 1;
                                                    *(_QWORD *)&v147 = 0x100000001;
                                                    v148 = 0x100000000;
                                                    *((_QWORD *)&v143 + 1) = 0x100000001;
                                                    *(_QWORD *)&v143 = 0x100000001;
                                                  }
                                                }
                                                else
                                                {
                                                  v144 = 0x100000000;
                                                  v145 = 0x100000000;
                                                  v146 = 0;
                                                  *((_QWORD *)&v147 + 1) = 0x100000000;
                                                  *(_QWORD *)v149 = 0;
                                                  v23 = 0;
                                                  v24 = 0;
                                                  v25 = 0;
                                                  v26 = 0;
                                                  v27 = 0;
                                                  v28 = 0;
                                                  HIDWORD(v152[3]) = 0;
                                                  LODWORD(v152[2]) = 1;
                                                  *(_QWORD *)((char *)&v152[2] + 4) = 0x100000001;
                                                  v152[1] = 0x100000001;
                                                  v29 = 1;
                                                  v30 = 1;
                                                  v31 = 1;
                                                  v151 = 0;
                                                  v152[0] = 0x100000001;
                                                  v150 = 0x100000000;
                                                  *(_DWORD *)&v149[8] = 1;
                                                  *(_QWORD *)&v147 = 0x100000001;
                                                  v148 = 0x100000000;
                                                  *((_QWORD *)&v143 + 1) = 0x100000001;
                                                  *(_QWORD *)&v143 = 1;
                                                }
                                              }
                                              else
                                              {
                                                *(_QWORD *)&v143 = 0;
                                                v144 = 0x100000000;
                                                v145 = 0x100000000;
                                                v146 = 0;
                                                *((_QWORD *)&v147 + 1) = 0x100000000;
                                                *(_QWORD *)v149 = 0;
                                                v23 = 0;
                                                v24 = 0;
                                                v25 = 0;
                                                v26 = 0;
                                                v27 = 0;
                                                v28 = 0;
                                                HIDWORD(v152[3]) = 0;
                                                LODWORD(v152[2]) = 1;
                                                *(_QWORD *)((char *)&v152[2] + 4) = 0x100000001;
                                                v152[1] = 0x100000001;
                                                v29 = 1;
                                                v30 = 1;
                                                v31 = 1;
                                                v151 = 0;
                                                v152[0] = 0x100000001;
                                                v150 = 0x100000000;
                                                *(_DWORD *)&v149[8] = 1;
                                                *(_QWORD *)&v147 = 0x100000001;
                                                v148 = 0x100000000;
                                                *((_QWORD *)&v143 + 1) = 0x100000001;
                                              }
                                            }
                                            else
                                            {
                                              *(_QWORD *)((char *)&v143 + 4) = 0;
                                              LODWORD(v143) = 0;
                                              v144 = 0x100000000;
                                              v145 = 0x100000000;
                                              v146 = 0;
                                              *((_QWORD *)&v147 + 1) = 0x100000000;
                                              *(_QWORD *)v149 = 0;
                                              v23 = 0;
                                              v24 = 0;
                                              v25 = 0;
                                              v26 = 0;
                                              v27 = 0;
                                              v28 = 0;
                                              HIDWORD(v152[3]) = 0;
                                              LODWORD(v152[2]) = 1;
                                              *(_QWORD *)((char *)&v152[2] + 4) = 0x100000001;
                                              v152[1] = 0x100000001;
                                              v29 = 1;
                                              v30 = 1;
                                              v31 = 1;
                                              v151 = 0;
                                              v152[0] = 0x100000001;
                                              v150 = 0x100000000;
                                              *(_DWORD *)&v149[8] = 1;
                                              *(_QWORD *)&v147 = 0x100000001;
                                              v148 = 0x100000000;
                                              HIDWORD(v143) = 1;
                                            }
                                          }
                                          else
                                          {
                                            v143 = 0uLL;
                                            v144 = 0x100000000;
                                            v145 = 0x100000000;
                                            v146 = 0;
                                            *((_QWORD *)&v147 + 1) = 0x100000000;
                                            *(_QWORD *)v149 = 0;
                                            v23 = 0;
                                            v24 = 0;
                                            v25 = 0;
                                            v26 = 0;
                                            v27 = 0;
                                            v28 = 0;
                                            HIDWORD(v152[3]) = 0;
                                            LODWORD(v152[2]) = 1;
                                            *(_QWORD *)((char *)&v152[2] + 4) = 0x100000001;
                                            v152[1] = 0x100000001;
                                            v29 = 1;
                                            v30 = 1;
                                            v31 = 1;
                                            v151 = 0;
                                            v152[0] = 0x100000001;
                                            v150 = 0x100000000;
                                            *(_DWORD *)&v149[8] = 1;
                                            *(_QWORD *)&v147 = 0x100000001;
                                            v148 = 0x100000000;
                                          }
                                        }
                                        else
                                        {
                                          v144 = 0;
                                          v143 = 0uLL;
                                          v145 = 0x100000000;
                                          v146 = 0;
                                          *((_QWORD *)&v147 + 1) = 0x100000000;
                                          *(_QWORD *)v149 = 0;
                                          v23 = 0;
                                          v24 = 0;
                                          v25 = 0;
                                          v26 = 0;
                                          v27 = 0;
                                          v28 = 0;
                                          HIDWORD(v152[3]) = 0;
                                          LODWORD(v152[2]) = 1;
                                          *(_QWORD *)((char *)&v152[2] + 4) = 0x100000001;
                                          v152[1] = 0x100000001;
                                          v29 = 1;
                                          v30 = 1;
                                          v31 = 1;
                                          v151 = 0;
                                          v152[0] = 0x100000001;
                                          v150 = 0x100000000;
                                          *(_DWORD *)&v149[8] = 1;
                                          *(_QWORD *)&v147 = 0x100000001;
                                          v148 = 0x100000000;
                                        }
                                      }
                                      else
                                      {
                                        v144 = 0;
                                        v145 = 0;
                                        v143 = 0uLL;
                                        v146 = 0;
                                        *((_QWORD *)&v147 + 1) = 0x100000000;
                                        *(_QWORD *)v149 = 0;
                                        v23 = 0;
                                        v24 = 0;
                                        v25 = 0;
                                        v26 = 0;
                                        v27 = 0;
                                        v28 = 0;
                                        HIDWORD(v152[3]) = 0;
                                        LODWORD(v152[2]) = 1;
                                        *(_QWORD *)((char *)&v152[2] + 4) = 0x100000001;
                                        v152[1] = 0x100000001;
                                        v29 = 1;
                                        v30 = 1;
                                        v31 = 1;
                                        v151 = 0;
                                        v152[0] = 0x100000001;
                                        v150 = 0x100000000;
                                        *(_DWORD *)&v149[8] = 1;
                                        *(_QWORD *)&v147 = 0x100000001;
                                        v148 = 0x100000000;
                                      }
                                    }
                                    else
                                    {
                                      *(_QWORD *)((char *)&v147 + 4) = 0;
                                      v144 = 0;
                                      v145 = 0;
                                      v143 = 0uLL;
                                      *(_QWORD *)v149 = 0;
                                      v23 = 0;
                                      v24 = 0;
                                      v25 = 0;
                                      v26 = 0;
                                      v27 = 0;
                                      v28 = 0;
                                      HIDWORD(v152[3]) = 0;
                                      LODWORD(v152[2]) = 1;
                                      *(_QWORD *)((char *)&v152[2] + 4) = 0x100000001;
                                      v152[1] = 0x100000001;
                                      v29 = 1;
                                      v30 = 1;
                                      v31 = 1;
                                      v151 = 0;
                                      v152[0] = 0x100000001;
                                      v150 = 0x100000000;
                                      *(_DWORD *)&v149[8] = 1;
                                      v146 = 0;
                                      LODWORD(v147) = 1;
                                      v148 = 0x100000000;
                                      HIDWORD(v147) = 1;
                                    }
                                  }
                                  else
                                  {
                                    v144 = 0;
                                    v145 = 0;
                                    v143 = 0uLL;
                                    v148 = 0x100000000;
                                    *(_QWORD *)v149 = 0;
                                    v23 = 0;
                                    v24 = 0;
                                    v25 = 0;
                                    v26 = 0;
                                    v27 = 0;
                                    v28 = 0;
                                    HIDWORD(v152[3]) = 0;
                                    LODWORD(v152[2]) = 1;
                                    *(_QWORD *)((char *)&v152[2] + 4) = 0x100000001;
                                    v152[1] = 0x100000001;
                                    v29 = 1;
                                    v30 = 1;
                                    v31 = 1;
                                    v151 = 0;
                                    v152[0] = 0x100000001;
                                    v150 = 0x100000000;
                                    *(_DWORD *)&v149[8] = 1;
                                    v146 = 0;
                                    v147 = 1uLL;
                                  }
                                }
                                else
                                {
                                  v148 = 0;
                                  v144 = 0;
                                  v145 = 0;
                                  v143 = 0uLL;
                                  *(_QWORD *)v149 = 0;
                                  v23 = 0;
                                  v24 = 0;
                                  v25 = 0;
                                  v26 = 0;
                                  v27 = 0;
                                  v28 = 0;
                                  HIDWORD(v152[3]) = 0;
                                  LODWORD(v152[2]) = 1;
                                  *(_QWORD *)((char *)&v152[2] + 4) = 0x100000001;
                                  v152[1] = 0x100000001;
                                  v29 = 1;
                                  v30 = 1;
                                  v31 = 1;
                                  v151 = 0;
                                  v152[0] = 0x100000001;
                                  v150 = 0x100000000;
                                  *(_DWORD *)&v149[8] = 1;
                                  v146 = 0;
                                  v147 = 1uLL;
                                }
                              }
                              else
                              {
                                v147 = 0uLL;
                                v148 = 0;
                                v144 = 0;
                                v145 = 0;
                                v143 = 0uLL;
                                v146 = 0;
                                *(_QWORD *)v149 = 0;
                                v23 = 0;
                                v24 = 0;
                                v25 = 0;
                                v26 = 0;
                                v27 = 0;
                                v28 = 0;
                                HIDWORD(v152[3]) = 0;
                                LODWORD(v152[2]) = 1;
                                *(_QWORD *)((char *)&v152[2] + 4) = 0x100000001;
                                v152[1] = 0x100000001;
                                v29 = 1;
                                v30 = 1;
                                v31 = 1;
                                v151 = 0;
                                v152[0] = 0x100000001;
                                v150 = 0x100000000;
                                *(_DWORD *)&v149[8] = 1;
                              }
                            }
                            else
                            {
                              v147 = 0uLL;
                              v148 = 0;
                              v144 = 0;
                              v145 = 0;
                              v143 = 0uLL;
                              v146 = 0;
                              memset(v149, 0, sizeof(v149));
                              v23 = 0;
                              v24 = 0;
                              v25 = 0;
                              v26 = 0;
                              v27 = 0;
                              v28 = 0;
                              HIDWORD(v152[3]) = 0;
                              LODWORD(v152[2]) = 1;
                              *(_QWORD *)((char *)&v152[2] + 4) = 0x100000001;
                              v152[1] = 0x100000001;
                              v29 = 1;
                              v30 = 1;
                              v31 = 1;
                              v151 = 0;
                              v152[0] = 0x100000001;
                              v150 = 0x100000000;
                            }
                          }
                          else
                          {
                            v150 = 0;
                            v147 = 0uLL;
                            v148 = 0;
                            v144 = 0;
                            v145 = 0;
                            v143 = 0uLL;
                            v146 = 0;
                            memset(v149, 0, sizeof(v149));
                            v23 = 0;
                            v24 = 0;
                            v25 = 0;
                            v26 = 0;
                            v27 = 0;
                            v28 = 0;
                            HIDWORD(v152[3]) = 0;
                            LODWORD(v152[2]) = 1;
                            *(_QWORD *)((char *)&v152[2] + 4) = 0x100000001;
                            v152[1] = 0x100000001;
                            v29 = 1;
                            v30 = 1;
                            v31 = 1;
                            v151 = 0;
                            v152[0] = 0x100000001;
                          }
                        }
                        else
                        {
                          v151 = 0;
                          v152[0] = 0x100000000;
                          v150 = 0;
                          v147 = 0uLL;
                          v148 = 0;
                          v144 = 0;
                          v145 = 0;
                          v143 = 0uLL;
                          v146 = 0;
                          memset(v149, 0, sizeof(v149));
                          v23 = 0;
                          v24 = 0;
                          v25 = 0;
                          v26 = 0;
                          v27 = 0;
                          v28 = 0;
                          v152[3] = 1;
                          v152[2] = 0x100000001;
                          v152[1] = 0x100000001;
                          v29 = 1;
                          v30 = 1;
                          v31 = 1;
                        }
                      }
                      else
                      {
                        v31 = 0;
                        v151 = 0;
                        v152[0] = 0x100000000;
                        v150 = 0;
                        v147 = 0uLL;
                        v148 = 0;
                        v144 = 0;
                        v145 = 0;
                        v143 = 0uLL;
                        v146 = 0;
                        memset(v149, 0, sizeof(v149));
                        v23 = 0;
                        v24 = 0;
                        v25 = 0;
                        v26 = 0;
                        v27 = 0;
                        v28 = 0;
                        v152[3] = 1;
                        v152[2] = 0x100000001;
                        v152[1] = 0x100000001;
                        v29 = 1;
                        v30 = 1;
                      }
                    }
                    else
                    {
                      v30 = 0;
                      v31 = 0;
                      v151 = 0;
                      v152[0] = 0x100000000;
                      v150 = 0;
                      v147 = 0uLL;
                      v148 = 0;
                      v144 = 0;
                      v145 = 0;
                      v143 = 0uLL;
                      v146 = 0;
                      memset(v149, 0, sizeof(v149));
                      v23 = 0;
                      v24 = 0;
                      v25 = 0;
                      v26 = 0;
                      v27 = 0;
                      v28 = 0;
                      HIDWORD(v152[3]) = 0;
                      LODWORD(v152[2]) = 1;
                      *(_QWORD *)((char *)&v152[2] + 4) = 0x100000001;
                      v152[1] = 0x100000001;
                      v29 = 1;
                    }
                  }
                  else
                  {
                    v152[0] = 0;
                    v30 = 0;
                    v31 = 0;
                    v150 = 0;
                    v147 = 0uLL;
                    v148 = 0;
                    v144 = 0;
                    v145 = 0;
                    v143 = 0uLL;
                    v146 = 0;
                    memset(v149, 0, sizeof(v149));
                    v151 = 0;
                    v23 = 0;
                    v24 = 0;
                    v25 = 0;
                    v26 = 0;
                    v27 = 0;
                    v28 = 0;
                    v152[3] = 1;
                    v152[2] = 0x100000001;
                    v152[1] = 0x100000001;
                    v29 = 1;
                  }
                }
                else
                {
                  v29 = 0;
                  v152[0] = 0;
                  v30 = 0;
                  v31 = 0;
                  v150 = 0;
                  v147 = 0uLL;
                  v148 = 0;
                  v144 = 0;
                  v145 = 0;
                  v143 = 0uLL;
                  v146 = 0;
                  memset(v149, 0, sizeof(v149));
                  v151 = 0;
                  v23 = 0;
                  v24 = 0;
                  v25 = 0;
                  v26 = 0;
                  v27 = 0;
                  v28 = 0;
                  HIDWORD(v152[3]) = 0;
                  LODWORD(v152[2]) = 1;
                  *(_QWORD *)((char *)&v152[2] + 4) = 0x100000001;
                  v152[1] = 0x100000001;
                }
              }
              else
              {
                *(_QWORD *)((char *)v152 + 4) = 0;
                v29 = 0;
                v30 = 0;
                v31 = 0;
                v151 = 0;
                LODWORD(v152[0]) = 0;
                v150 = 0;
                v147 = 0uLL;
                v148 = 0;
                v144 = 0;
                v145 = 0;
                v143 = 0uLL;
                v146 = 0;
                memset(v149, 0, sizeof(v149));
                v23 = 0;
                v24 = 0;
                v25 = 0;
                v26 = 0;
                v27 = 0;
                v28 = 0;
                HIDWORD(v152[3]) = 0;
                LODWORD(v152[2]) = 1;
                *(_QWORD *)((char *)&v152[2] + 4) = 0x100000001;
                HIDWORD(v152[1]) = 1;
              }
            }
            else
            {
              v152[1] = 0;
              v29 = 0;
              v152[0] = 0;
              v30 = 0;
              v31 = 0;
              v150 = 0;
              v147 = 0uLL;
              v148 = 0;
              v144 = 0;
              v145 = 0;
              v143 = 0uLL;
              v146 = 0;
              memset(v149, 0, sizeof(v149));
              v151 = 0;
              v23 = 0;
              v24 = 0;
              v25 = 0;
              v26 = 0;
              v27 = 0;
              v28 = 0;
              HIDWORD(v152[3]) = 0;
              *(_QWORD *)((char *)&v152[2] + 4) = 0x100000001;
              LODWORD(v152[2]) = 1;
            }
          }
          else
          {
            v29 = 0;
            v30 = 0;
            v31 = 0;
            v151 = 0;
            memset(v152, 0, 20);
            v150 = 0;
            v147 = 0uLL;
            v148 = 0;
            v144 = 0;
            v145 = 0;
            v143 = 0uLL;
            v146 = 0;
            memset(v149, 0, sizeof(v149));
            v23 = 0;
            v24 = 0;
            v25 = 0;
            v26 = 0;
            v27 = 0;
            v28 = 0;
            HIDWORD(v152[3]) = 0;
            *(_QWORD *)((char *)&v152[2] + 4) = 0x100000001;
          }
        }
        else
        {
          v29 = 0;
          memset(v152, 0, 24);
          v30 = 0;
          v31 = 0;
          v150 = 0;
          v147 = 0uLL;
          v148 = 0;
          v144 = 0;
          v145 = 0;
          v143 = 0uLL;
          v146 = 0;
          memset(v149, 0, sizeof(v149));
          v151 = 0;
          v23 = 0;
          v24 = 0;
          v25 = 0;
          v26 = 0;
          v27 = 0;
          v28 = 0;
          v152[3] = 1;
        }
      }
      else
      {
        v29 = 0;
        v30 = 0;
        v31 = 0;
        v151 = 0;
        memset(v152, 0, sizeof(v152));
        v150 = 0;
        v147 = 0uLL;
        v148 = 0;
        v144 = 0;
        v145 = 0;
        v143 = 0uLL;
        v146 = 0;
        memset(v149, 0, sizeof(v149));
        v23 = 0;
        v24 = 0;
        v25 = 0;
        v26 = 0;
        v27 = 0;
        v28 = 0;
      }
    }
    else
    {
      v25 = 0;
      v29 = 0;
      v30 = 0;
      v31 = 0;
      v151 = 0;
      memset(v152, 0, sizeof(v152));
      v150 = 0;
      v147 = 0uLL;
      v148 = 0;
      v144 = 0;
      v145 = 0;
      v143 = 0uLL;
      v146 = 0;
      memset(v149, 0, sizeof(v149));
      v23 = 0;
      v24 = 0;
      v26 = 0;
      v27 = 0;
      v28 = 0;
    }
    if (v28)
    {
      v33 = v23;
      v34 = v31;
      v35 = v24;
      v36 = v30;
      v37 = v25;
      v38 = v26;
      v39 = v29;
      v40 = v27;

      v27 = v40;
      v29 = v39;
      v26 = v38;
      v25 = v37;
      v30 = v36;
      v24 = v35;
      v31 = v34;
      v23 = v33;
    }
    if (v27)
    {

    }
    if (v26)
    {

      if (!v25)
        goto LABEL_30;
    }
    else if (!v25)
    {
LABEL_30:
      if (v24)
        goto LABEL_31;
      goto LABEL_35;
    }

    if (v24)
    {
LABEL_31:

      if (!v23)
      {
LABEL_37:
        if (v151)
        {

        }
        if ((_DWORD)v150)
        {

        }
        if (*(_DWORD *)&v149[4])
        {

        }
        if (*(_DWORD *)v149)
        {

        }
        if ((_DWORD)v148)
        {

        }
        if (DWORD2(v147))
        {

        }
        if (v146)
        {

        }
        if ((_DWORD)v145)
        {

        }
        if ((_DWORD)v144)
        {

        }
        if (DWORD1(v143))
        {

        }
        if ((_DWORD)v143)
        {

        }
        if (DWORD2(v143))
        {

        }
        if (HIDWORD(v143))
        {

        }
        if (HIDWORD(v144))
        {

        }
        if (HIDWORD(v145))
        {

        }
        if (DWORD1(v147))
        {

        }
        if (HIDWORD(v147))
        {

        }
        if (HIDWORD(v148))
        {

        }
        if ((_DWORD)v147)
        {

        }
        if (*(_DWORD *)&v149[8])
        {

        }
        if (HIDWORD(v150))
        {

        }
        if (LODWORD(v152[0]))
        {

          if (!v31)
            goto LABEL_81;
        }
        else if (!v31)
        {
LABEL_81:
          if (!v30)
            goto LABEL_83;
          goto LABEL_82;
        }

        if (!v30)
        {
LABEL_83:
          if (HIDWORD(v152[0]))
          {

          }
          if (v29)
          {

          }
          if (LODWORD(v152[1]))
          {

          }
          if (HIDWORD(v152[1]))
          {

          }
          if (LODWORD(v152[2]))
          {

          }
          if (HIDWORD(v152[2]))
          {

          }
          if (LODWORD(v152[3]))
          {

          }
          if (v153)
          {

          }
          if (!HIDWORD(v152[3]))
          {
            v32 = 0;
            goto LABEL_105;
          }
          goto LABEL_100;
        }
LABEL_82:

        goto LABEL_83;
      }
LABEL_36:

      goto LABEL_37;
    }
LABEL_35:
    if (!v23)
      goto LABEL_37;
    goto LABEL_36;
  }
  v32 = 0;
  v5 = 0;
LABEL_105:

  return v32;
}

- (WiFiMACAddress)peerAddress
{
  return self->_peerAddress;
}

- (NSNumber)infrastructureChannel
{
  return self->_infrastructureChannel;
}

- (NSArray)txCCAHistogram
{
  return self->_txCCAHistogram;
}

- (void)setTxCCAHistogram:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)rxRSSIHistogram
{
  return self->_rxRSSIHistogram;
}

- (void)setRxRSSIHistogram:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSArray)rxFWDelayHistogram
{
  return self->_rxFWDelayHistogram;
}

- (void)setRxFWDelayHistogram:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSArray)rxIPCDelayHistogram
{
  return self->_rxIPCDelayHistogram;
}

- (void)setRxIPCDelayHistogram:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSArray)txConsecutiveErrorsHistogram
{
  return self->_txConsecutiveErrorsHistogram;
}

- (void)setTxConsecutiveErrorsHistogram:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSArray)txPacketExpiryHistogram
{
  return self->_txPacketExpiryHistogram;
}

- (void)setTxPacketExpiryHistogram:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSNumber)preferred2GChannelsCount
{
  return self->_preferred2GChannelsCount;
}

- (void)setPreferred2GChannelsCount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSNumber)preferred5GChannelsCount
{
  return self->_preferred5GChannelsCount;
}

- (void)setPreferred5GChannelsCount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSNumber)dfsChannelsCount
{
  return self->_dfsChannelsCount;
}

- (void)setDfsChannelsCount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSNumber)csaCount
{
  return self->_csaCount;
}

- (void)setCsaCount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSNumber)quietIECount
{
  return self->_quietIECount;
}

- (void)setQuietIECount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSNumber)txErrorCount
{
  return self->_txErrorCount;
}

- (void)setTxErrorCount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSNumber)packetsOn2GCount
{
  return self->_packetsOn2GCount;
}

- (void)setPacketsOn2GCount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSNumber)packetsNAVOn2GCount
{
  return self->_packetsNAVOn2GCount;
}

- (void)setPacketsNAVOn2GCount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSNumber)packetsHOFOn2GCount
{
  return self->_packetsHOFOn2GCount;
}

- (void)setPacketsHOFOn2GCount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSNumber)packetsOverridenOn5GCount
{
  return self->_packetsOverridenOn5GCount;
}

- (void)setPacketsOverridenOn5GCount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSNumber)packetsOn5GCount
{
  return self->_packetsOn5GCount;
}

- (void)setPacketsOn5GCount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (BOOL)infraRelayOperationStatus
{
  return self->_infraRelayOperationStatus;
}

- (void)setInfraRelayOperationStatus:(BOOL)a3
{
  self->_infraRelayOperationStatus = a3;
}

- (NSNumber)infraRelayRequestersCount
{
  return self->_infraRelayRequestersCount;
}

- (void)setInfraRelayRequestersCount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (NSNumber)txExpiredCount
{
  return self->_txExpiredCount;
}

- (void)setTxExpiredCount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (NSNumber)txNoACKCount
{
  return self->_txNoACKCount;
}

- (void)setTxNoACKCount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (NSNumber)txFailedCount
{
  return self->_txFailedCount;
}

- (void)setTxFailedCount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (NSNumber)txNoResourcesCount
{
  return self->_txNoResourcesCount;
}

- (void)setTxNoResourcesCount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (NSNumber)txIOErrorCount
{
  return self->_txIOErrorCount;
}

- (void)setTxIOErrorCount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (NSNumber)txMemoryErrorCount
{
  return self->_txMemoryErrorCount;
}

- (void)setTxMemoryErrorCount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (NSNumber)txChipModeErrorCount
{
  return self->_txChipModeErrorCount;
}

- (void)setTxChipModeErrorCount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (NSNumber)txNoRemotePeerCount
{
  return self->_txNoRemotePeerCount;
}

- (void)setTxNoRemotePeerCount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (NSNumber)txInternalErrorCount
{
  return self->_txInternalErrorCount;
}

- (void)setTxInternalErrorCount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 240);
}

- (NSNumber)txDroppedCount
{
  return self->_txDroppedCount;
}

- (void)setTxDroppedCount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 248);
}

- (NSNumber)txFirmwareFreePacketCount
{
  return self->_txFirmwareFreePacketCount;
}

- (void)setTxFirmwareFreePacketCount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (NSNumber)txMaxRetriesCount
{
  return self->_txMaxRetriesCount;
}

- (void)setTxMaxRetriesCount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

- (NSNumber)txForceLifetimeExpiredCount
{
  return self->_txForceLifetimeExpiredCount;
}

- (void)setTxForceLifetimeExpiredCount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (NSNumber)channelSequenceMismatchOn5GCount
{
  return self->_channelSequenceMismatchOn5GCount;
}

- (void)setChannelSequenceMismatchOn5GCount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
}

- (NSNumber)channelSequenceMismatchOn2GCount
{
  return self->_channelSequenceMismatchOn2GCount;
}

- (void)setChannelSequenceMismatchOn2GCount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 288);
}

- (NSNumber)infraScanCount
{
  return self->_infraScanCount;
}

- (void)setInfraScanCount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 296);
}

- (NSNumber)infraAssocCount
{
  return self->_infraAssocCount;
}

- (void)setInfraAssocCount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 304);
}

- (NSNumber)infraDisassocCount
{
  return self->_infraDisassocCount;
}

- (void)setInfraDisassocCount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 312);
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_infraDisassocCount, 0);
  objc_storeStrong((id *)&self->_infraAssocCount, 0);
  objc_storeStrong((id *)&self->_infraScanCount, 0);
  objc_storeStrong((id *)&self->_channelSequenceMismatchOn2GCount, 0);
  objc_storeStrong((id *)&self->_channelSequenceMismatchOn5GCount, 0);
  objc_storeStrong((id *)&self->_txForceLifetimeExpiredCount, 0);
  objc_storeStrong((id *)&self->_txMaxRetriesCount, 0);
  objc_storeStrong((id *)&self->_txFirmwareFreePacketCount, 0);
  objc_storeStrong((id *)&self->_txDroppedCount, 0);
  objc_storeStrong((id *)&self->_txInternalErrorCount, 0);
  objc_storeStrong((id *)&self->_txNoRemotePeerCount, 0);
  objc_storeStrong((id *)&self->_txChipModeErrorCount, 0);
  objc_storeStrong((id *)&self->_txMemoryErrorCount, 0);
  objc_storeStrong((id *)&self->_txIOErrorCount, 0);
  objc_storeStrong((id *)&self->_txNoResourcesCount, 0);
  objc_storeStrong((id *)&self->_txFailedCount, 0);
  objc_storeStrong((id *)&self->_txNoACKCount, 0);
  objc_storeStrong((id *)&self->_txExpiredCount, 0);
  objc_storeStrong((id *)&self->_infraRelayRequestersCount, 0);
  objc_storeStrong((id *)&self->_packetsOn5GCount, 0);
  objc_storeStrong((id *)&self->_packetsOverridenOn5GCount, 0);
  objc_storeStrong((id *)&self->_packetsHOFOn2GCount, 0);
  objc_storeStrong((id *)&self->_packetsNAVOn2GCount, 0);
  objc_storeStrong((id *)&self->_packetsOn2GCount, 0);
  objc_storeStrong((id *)&self->_txErrorCount, 0);
  objc_storeStrong((id *)&self->_quietIECount, 0);
  objc_storeStrong((id *)&self->_csaCount, 0);
  objc_storeStrong((id *)&self->_dfsChannelsCount, 0);
  objc_storeStrong((id *)&self->_preferred5GChannelsCount, 0);
  objc_storeStrong((id *)&self->_preferred2GChannelsCount, 0);
  objc_storeStrong((id *)&self->_txPacketExpiryHistogram, 0);
  objc_storeStrong((id *)&self->_txConsecutiveErrorsHistogram, 0);
  objc_storeStrong((id *)&self->_rxIPCDelayHistogram, 0);
  objc_storeStrong((id *)&self->_rxFWDelayHistogram, 0);
  objc_storeStrong((id *)&self->_rxRSSIHistogram, 0);
  objc_storeStrong((id *)&self->_txCCAHistogram, 0);
  objc_storeStrong((id *)&self->_infrastructureChannel, 0);
  objc_storeStrong((id *)&self->_peerAddress, 0);
}

@end
