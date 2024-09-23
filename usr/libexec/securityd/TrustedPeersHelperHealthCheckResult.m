@implementation TrustedPeersHelperHealthCheckResult

- (TrustedPeersHelperHealthCheckResult)initWithPostRepairCFU:(BOOL)a3 postEscrowCFU:(BOOL)a4 resetOctagon:(BOOL)a5 leaveTrust:(BOOL)a6 reroll:(BOOL)a7 moveRequest:(id)a8 totalEscrowRecords:(unint64_t)a9 collectableEscrowRecords:(unint64_t)a10 collectedEscrowRecords:(unint64_t)a11 escrowRecordGarbageCollectionEnabled:(BOOL)a12 totalTlkShares:(unint64_t)a13 collectableTlkShares:(unint64_t)a14 collectedTlkShares:(unint64_t)a15 tlkShareGarbageCollectionEnabled:(BOOL)a16 totalPeers:(unint64_t)a17 trustedPeers:(unint64_t)a18 superfluousPeers:(unint64_t)a19 peersCleanedup:(unint64_t)a20 superfluousPeersCleanupEnabled:(BOOL)a21
{
  id v28;
  TrustedPeersHelperHealthCheckResult *v29;
  TrustedPeersHelperHealthCheckResult *v30;
  objc_super v32;

  v28 = a8;
  v32.receiver = self;
  v32.super_class = (Class)TrustedPeersHelperHealthCheckResult;
  v29 = -[TrustedPeersHelperHealthCheckResult init](&v32, "init");
  v30 = v29;
  if (v29)
  {
    v29->_postRepairCFU = a3;
    v29->_postEscrowCFU = a4;
    v29->_resetOctagon = a5;
    v29->_leaveTrust = a6;
    v29->_reroll = a7;
    objc_storeStrong((id *)&v29->_moveRequest, a8);
    v30->_totalEscrowRecords = a9;
    v30->_collectableEscrowRecords = a10;
    v30->_escrowRecordGarbageCollectionEnabled = a12;
    v30->_collectedEscrowRecords = a11;
    v30->_totalTlkShares = a13;
    v30->_collectableTlkShares = a14;
    v30->_collectedTlkShares = a15;
    v30->_tlkShareGarbageCollectionEnabled = a16;
    v30->_totalPeers = a17;
    v30->_trustedPeers = a18;
    v30->_superfluousPeers = a19;
    v30->_peersCleanedup = a20;
    v30->_superfluousPeersCleanupEnabled = a21;
  }

  return v30;
}

- (id)description
{
  const __CFString *v3;
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  unint64_t v9;
  unint64_t v10;
  const __CFString *v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  const __CFString *v16;
  void *v17;
  unint64_t v19;
  const __CFString *v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  void *v24;
  const __CFString *v25;
  const __CFString *v26;
  const __CFString *v27;
  const __CFString *v28;
  const __CFString *v29;

  if (-[TrustedPeersHelperHealthCheckResult postRepairCFU](self, "postRepairCFU"))
    v3 = CFSTR("true");
  else
    v3 = CFSTR("false");
  v29 = v3;
  if (-[TrustedPeersHelperHealthCheckResult postEscrowCFU](self, "postEscrowCFU"))
    v4 = CFSTR("true");
  else
    v4 = CFSTR("false");
  v28 = v4;
  if (-[TrustedPeersHelperHealthCheckResult resetOctagon](self, "resetOctagon"))
    v5 = CFSTR("true");
  else
    v5 = CFSTR("false");
  v27 = v5;
  if (-[TrustedPeersHelperHealthCheckResult leaveTrust](self, "leaveTrust"))
    v6 = CFSTR("true");
  else
    v6 = CFSTR("false");
  v26 = v6;
  if (-[TrustedPeersHelperHealthCheckResult reroll](self, "reroll"))
    v7 = CFSTR("true");
  else
    v7 = CFSTR("false");
  v25 = v7;
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[TrustedPeersHelperHealthCheckResult moveRequest](self, "moveRequest"));
  v23 = -[TrustedPeersHelperHealthCheckResult totalEscrowRecords](self, "totalEscrowRecords");
  v22 = -[TrustedPeersHelperHealthCheckResult collectableEscrowRecords](self, "collectableEscrowRecords");
  v21 = -[TrustedPeersHelperHealthCheckResult collectedEscrowRecords](self, "collectedEscrowRecords");
  if (-[TrustedPeersHelperHealthCheckResult escrowRecordGarbageCollectionEnabled](self, "escrowRecordGarbageCollectionEnabled"))
  {
    v8 = CFSTR("true");
  }
  else
  {
    v8 = CFSTR("false");
  }
  v20 = v8;
  v19 = -[TrustedPeersHelperHealthCheckResult totalTlkShares](self, "totalTlkShares");
  v9 = -[TrustedPeersHelperHealthCheckResult collectableTlkShares](self, "collectableTlkShares");
  v10 = -[TrustedPeersHelperHealthCheckResult collectedTlkShares](self, "collectedTlkShares");
  if (-[TrustedPeersHelperHealthCheckResult tlkShareGarbageCollectionEnabled](self, "tlkShareGarbageCollectionEnabled"))
    v11 = CFSTR("true");
  else
    v11 = CFSTR("false");
  v12 = -[TrustedPeersHelperHealthCheckResult totalPeers](self, "totalPeers");
  v13 = -[TrustedPeersHelperHealthCheckResult trustedPeers](self, "trustedPeers");
  v14 = -[TrustedPeersHelperHealthCheckResult superfluousPeers](self, "superfluousPeers");
  v15 = -[TrustedPeersHelperHealthCheckResult peersCleanedup](self, "peersCleanedup");
  if (-[TrustedPeersHelperHealthCheckResult superfluousPeersCleanupEnabled](self, "superfluousPeersCleanupEnabled"))
    v16 = CFSTR("true");
  else
    v16 = CFSTR("false");
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<HealthCheckResult: postRepairCFU: %@, postEscrowCFU: %@, resetOctagon: %@, leaveTrust: %@, reroll: %@, moveRequest? %@, totalEscrowRecords: %llu, collectableEscrowRecords: %llu, collectedEscrowRecords: %llu, escrowRecordGarbageCollectionEnabled: %@, totalTlkShares: %llu, collectableTlkShares: %llu, collectedTlkShares: %llu, tlkShareGarbageCollectionEnabled: %@, totalPeers: %llu, trustedPeers: %llu, superfluousPeers: %llu, peersCleanedup: %llu, superfluousPeersCleanupEnabled: %@>"), v29, v28, v27, v26, v25, v24, v23, v22, v21, v20, v19, v9, v10, v11, v12,
                    v13,
                    v14,
                    v15,
                    v16));

  return v17;
}

- (TrustedPeersHelperHealthCheckResult)initWithCoder:(id)a3
{
  id v4;
  TrustedPeersHelperHealthCheckResult *v5;
  id v6;
  uint64_t v7;
  OTEscrowMoveRequestContext *moveRequest;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TrustedPeersHelperHealthCheckResult;
  v5 = -[TrustedPeersHelperHealthCheckResult init](&v10, "init");
  if (v5)
  {
    v5->_postRepairCFU = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("postRepairCFU"));
    v5->_postEscrowCFU = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("postEscrowCFU"));
    v5->_resetOctagon = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("resetOctagon"));
    v5->_leaveTrust = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("leaveTrust"));
    v5->_reroll = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("reroll"));
    v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(OTEscrowMoveRequestContext), CFSTR("moveRequest"));
    v7 = objc_claimAutoreleasedReturnValue(v6);
    moveRequest = v5->_moveRequest;
    v5->_moveRequest = (OTEscrowMoveRequestContext *)v7;

    v5->_totalEscrowRecords = (unint64_t)objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("totalEscrowRecords"));
    v5->_collectableEscrowRecords = (unint64_t)objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("collectableEscrowRecords"));
    v5->_collectedEscrowRecords = (unint64_t)objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("collectedEscrowRecords"));
    v5->_escrowRecordGarbageCollectionEnabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("escrowRecordGarbageCollectionEnabled"));
    v5->_totalTlkShares = (unint64_t)objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("totalTlkShares"));
    v5->_collectableTlkShares = (unint64_t)objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("collectableTlkShares"));
    v5->_collectedTlkShares = (unint64_t)objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("collectedTlkShares"));
    v5->_tlkShareGarbageCollectionEnabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("tlkShareGarbageCollectionEnabled"));
    v5->_totalPeers = (unint64_t)objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("totalPeers"));
    v5->_trustedPeers = (unint64_t)objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("trustedPeers"));
    v5->_superfluousPeers = (unint64_t)objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("superfluousPeers"));
    v5->_peersCleanedup = (unint64_t)objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("peersCleanedup"));
    v5->_superfluousPeersCleanupEnabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("superfluousPeersCleanupEnabled"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeBool:forKey:", -[TrustedPeersHelperHealthCheckResult postRepairCFU](self, "postRepairCFU"), CFSTR("postRepairCFU"));
  objc_msgSend(v5, "encodeBool:forKey:", -[TrustedPeersHelperHealthCheckResult postEscrowCFU](self, "postEscrowCFU"), CFSTR("postEscrowCFU"));
  objc_msgSend(v5, "encodeBool:forKey:", -[TrustedPeersHelperHealthCheckResult resetOctagon](self, "resetOctagon"), CFSTR("resetOctagon"));
  objc_msgSend(v5, "encodeBool:forKey:", -[TrustedPeersHelperHealthCheckResult leaveTrust](self, "leaveTrust"), CFSTR("leaveTrust"));
  objc_msgSend(v5, "encodeBool:forKey:", -[TrustedPeersHelperHealthCheckResult reroll](self, "reroll"), CFSTR("reroll"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TrustedPeersHelperHealthCheckResult moveRequest](self, "moveRequest"));
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("moveRequest"));

  objc_msgSend(v5, "encodeInt64:forKey:", -[TrustedPeersHelperHealthCheckResult totalEscrowRecords](self, "totalEscrowRecords"), CFSTR("totalEscrowRecords"));
  objc_msgSend(v5, "encodeInt64:forKey:", -[TrustedPeersHelperHealthCheckResult collectableEscrowRecords](self, "collectableEscrowRecords"), CFSTR("collectableEscrowRecords"));
  objc_msgSend(v5, "encodeInt64:forKey:", -[TrustedPeersHelperHealthCheckResult collectedEscrowRecords](self, "collectedEscrowRecords"), CFSTR("collectedEscrowRecords"));
  objc_msgSend(v5, "encodeBool:forKey:", -[TrustedPeersHelperHealthCheckResult escrowRecordGarbageCollectionEnabled](self, "escrowRecordGarbageCollectionEnabled"), CFSTR("escrowRecordGarbageCollectionEnabled"));
  objc_msgSend(v5, "encodeInt64:forKey:", -[TrustedPeersHelperHealthCheckResult totalTlkShares](self, "totalTlkShares"), CFSTR("totalTlkShares"));
  objc_msgSend(v5, "encodeInt64:forKey:", -[TrustedPeersHelperHealthCheckResult collectableTlkShares](self, "collectableTlkShares"), CFSTR("collectableTlkShares"));
  objc_msgSend(v5, "encodeInt64:forKey:", -[TrustedPeersHelperHealthCheckResult collectedTlkShares](self, "collectedTlkShares"), CFSTR("collectedTlkShares"));
  objc_msgSend(v5, "encodeBool:forKey:", -[TrustedPeersHelperHealthCheckResult tlkShareGarbageCollectionEnabled](self, "tlkShareGarbageCollectionEnabled"), CFSTR("tlkShareGarbageCollectionEnabled"));
  objc_msgSend(v5, "encodeInt64:forKey:", -[TrustedPeersHelperHealthCheckResult totalPeers](self, "totalPeers"), CFSTR("totalPeers"));
  objc_msgSend(v5, "encodeInt64:forKey:", -[TrustedPeersHelperHealthCheckResult trustedPeers](self, "trustedPeers"), CFSTR("trustedPeers"));
  objc_msgSend(v5, "encodeInt64:forKey:", -[TrustedPeersHelperHealthCheckResult superfluousPeers](self, "superfluousPeers"), CFSTR("superfluousPeers"));
  objc_msgSend(v5, "encodeInt64:forKey:", -[TrustedPeersHelperHealthCheckResult peersCleanedup](self, "peersCleanedup"), CFSTR("peersCleanedup"));
  objc_msgSend(v5, "encodeBool:forKey:", -[TrustedPeersHelperHealthCheckResult superfluousPeersCleanupEnabled](self, "superfluousPeersCleanupEnabled"), CFSTR("superfluousPeersCleanupEnabled"));

}

- (id)dictionaryRepresentation
{
  id v3;
  void *v4;
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

  v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[TrustedPeersHelperHealthCheckResult postRepairCFU](self, "postRepairCFU")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("postRepairCFU"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[TrustedPeersHelperHealthCheckResult postEscrowCFU](self, "postEscrowCFU")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("postEscrowCFU"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[TrustedPeersHelperHealthCheckResult resetOctagon](self, "resetOctagon")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("resetOctagon"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[TrustedPeersHelperHealthCheckResult leaveTrust](self, "leaveTrust")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("leaveTrust"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[TrustedPeersHelperHealthCheckResult reroll](self, "reroll")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("reroll"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TrustedPeersHelperHealthCheckResult moveRequest](self, "moveRequest"));
  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[TrustedPeersHelperHealthCheckResult moveRequest](self, "moveRequest"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "dictionaryRepresentation"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("moveRequest"));

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", -[TrustedPeersHelperHealthCheckResult totalEscrowRecords](self, "totalEscrowRecords")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("totalEscrowRecords"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", -[TrustedPeersHelperHealthCheckResult collectableEscrowRecords](self, "collectableEscrowRecords")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("collectableEscrowRecords"));

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", -[TrustedPeersHelperHealthCheckResult collectedEscrowRecords](self, "collectedEscrowRecords")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("collectedEscrowRecords"));

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[TrustedPeersHelperHealthCheckResult escrowRecordGarbageCollectionEnabled](self, "escrowRecordGarbageCollectionEnabled")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("escrowRecordGarbageCollectionEnabled"));

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", -[TrustedPeersHelperHealthCheckResult totalTlkShares](self, "totalTlkShares")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("totalTlkShares"));

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", -[TrustedPeersHelperHealthCheckResult collectableTlkShares](self, "collectableTlkShares")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("collectableTlkShares"));

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", -[TrustedPeersHelperHealthCheckResult collectedTlkShares](self, "collectedTlkShares")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("collectedTlkShares"));

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[TrustedPeersHelperHealthCheckResult tlkShareGarbageCollectionEnabled](self, "tlkShareGarbageCollectionEnabled")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("tlkShareGarbageCollectionEnabled"));

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", -[TrustedPeersHelperHealthCheckResult totalPeers](self, "totalPeers")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("totalPeers"));

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", -[TrustedPeersHelperHealthCheckResult trustedPeers](self, "trustedPeers")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("trustedPeers"));

  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", -[TrustedPeersHelperHealthCheckResult superfluousPeers](self, "superfluousPeers")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("superfluousPeers"));

  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", -[TrustedPeersHelperHealthCheckResult peersCleanedup](self, "peersCleanedup")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("peersCleanedup"));

  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[TrustedPeersHelperHealthCheckResult superfluousPeersCleanupEnabled](self, "superfluousPeersCleanupEnabled")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("superfluousPeersCleanupEnabled"));

  return v3;
}

- (BOOL)postRepairCFU
{
  return self->_postRepairCFU;
}

- (void)setPostRepairCFU:(BOOL)a3
{
  self->_postRepairCFU = a3;
}

- (BOOL)postEscrowCFU
{
  return self->_postEscrowCFU;
}

- (void)setPostEscrowCFU:(BOOL)a3
{
  self->_postEscrowCFU = a3;
}

- (BOOL)resetOctagon
{
  return self->_resetOctagon;
}

- (void)setResetOctagon:(BOOL)a3
{
  self->_resetOctagon = a3;
}

- (BOOL)leaveTrust
{
  return self->_leaveTrust;
}

- (void)setLeaveTrust:(BOOL)a3
{
  self->_leaveTrust = a3;
}

- (BOOL)reroll
{
  return self->_reroll;
}

- (void)setReroll:(BOOL)a3
{
  self->_reroll = a3;
}

- (OTEscrowMoveRequestContext)moveRequest
{
  return (OTEscrowMoveRequestContext *)objc_getProperty(self, a2, 16, 1);
}

- (void)setMoveRequest:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (unint64_t)totalEscrowRecords
{
  return self->_totalEscrowRecords;
}

- (void)setTotalEscrowRecords:(unint64_t)a3
{
  self->_totalEscrowRecords = a3;
}

- (unint64_t)collectableEscrowRecords
{
  return self->_collectableEscrowRecords;
}

- (void)setCollectableEscrowRecords:(unint64_t)a3
{
  self->_collectableEscrowRecords = a3;
}

- (unint64_t)collectedEscrowRecords
{
  return self->_collectedEscrowRecords;
}

- (void)setCollectedEscrowRecords:(unint64_t)a3
{
  self->_collectedEscrowRecords = a3;
}

- (BOOL)escrowRecordGarbageCollectionEnabled
{
  return self->_escrowRecordGarbageCollectionEnabled;
}

- (void)setEscrowRecordGarbageCollectionEnabled:(BOOL)a3
{
  self->_escrowRecordGarbageCollectionEnabled = a3;
}

- (unint64_t)totalTlkShares
{
  return self->_totalTlkShares;
}

- (void)setTotalTlkShares:(unint64_t)a3
{
  self->_totalTlkShares = a3;
}

- (unint64_t)collectableTlkShares
{
  return self->_collectableTlkShares;
}

- (void)setCollectableTlkShares:(unint64_t)a3
{
  self->_collectableTlkShares = a3;
}

- (unint64_t)collectedTlkShares
{
  return self->_collectedTlkShares;
}

- (void)setCollectedTlkShares:(unint64_t)a3
{
  self->_collectedTlkShares = a3;
}

- (BOOL)tlkShareGarbageCollectionEnabled
{
  return self->_tlkShareGarbageCollectionEnabled;
}

- (void)setTlkShareGarbageCollectionEnabled:(BOOL)a3
{
  self->_tlkShareGarbageCollectionEnabled = a3;
}

- (unint64_t)totalPeers
{
  return self->_totalPeers;
}

- (void)setTotalPeers:(unint64_t)a3
{
  self->_totalPeers = a3;
}

- (unint64_t)trustedPeers
{
  return self->_trustedPeers;
}

- (void)setTrustedPeers:(unint64_t)a3
{
  self->_trustedPeers = a3;
}

- (unint64_t)superfluousPeers
{
  return self->_superfluousPeers;
}

- (void)setSuperfluousPeers:(unint64_t)a3
{
  self->_superfluousPeers = a3;
}

- (unint64_t)peersCleanedup
{
  return self->_peersCleanedup;
}

- (void)setPeersCleanedup:(unint64_t)a3
{
  self->_peersCleanedup = a3;
}

- (BOOL)superfluousPeersCleanupEnabled
{
  return self->_superfluousPeersCleanupEnabled;
}

- (void)setSuperfluousPeersCleanupEnabled:(BOOL)a3
{
  self->_superfluousPeersCleanupEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_moveRequest, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
