@implementation OTAccountMetadataClassC

- (BOOL)hasPeerID
{
  return self->_peerID != 0;
}

- (int)icloudAccountState
{
  if ((*(_WORD *)&self->_has & 0x10) != 0)
    return self->_icloudAccountState;
  else
    return 0;
}

- (void)setIcloudAccountState:(int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_icloudAccountState = a3;
}

- (void)setHasIcloudAccountState:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasIcloudAccountState
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (id)icloudAccountStateAsString:(int)a3
{
  if (a3 >= 4)
    return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  else
    return *(&off_1002DBA90 + a3);
}

- (int)StringAsIcloudAccountState:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NO_ACCOUNT")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ACCOUNT_AVAILABLE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("ACCOUNT_AVAILABLE_UNUSED")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setEpoch:(int64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_epoch = a3;
}

- (void)setHasEpoch:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasEpoch
{
  return *(_WORD *)&self->_has & 1;
}

- (BOOL)hasAltDSID
{
  return self->_altDSID != 0;
}

- (int)trustState
{
  if ((*(_WORD *)&self->_has & 0x40) != 0)
    return self->_trustState;
  else
    return 0;
}

- (void)setTrustState:(int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_trustState = a3;
}

- (void)setHasTrustState:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasTrustState
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (id)trustStateAsString:(int)a3
{
  if (a3 >= 3)
    return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  else
    return *(&off_1002DBAB0 + a3);
}

- (int)StringAsTrustState:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNTRUSTED")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("TRUSTED")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setLastHealthCheckup:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_lastHealthCheckup = a3;
}

- (void)setHasLastHealthCheckup:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasLastHealthCheckup
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (int)attemptedJoin
{
  if ((*(_WORD *)&self->_has & 4) != 0)
    return self->_attemptedJoin;
  else
    return 0;
}

- (void)setAttemptedJoin:(int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_attemptedJoin = a3;
}

- (void)setHasAttemptedJoin:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasAttemptedJoin
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (id)attemptedJoinAsString:(int)a3
{
  if (a3 >= 3)
    return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  else
    return *(&off_1002DBAC8 + a3);
}

- (int)StringAsAttemptedJoin:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NOTATTEMPTED")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("ATTEMPTED")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)cdpState
{
  if ((*(_WORD *)&self->_has & 8) != 0)
    return self->_cdpState;
  else
    return 0;
}

- (void)setCdpState:(int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_cdpState = a3;
}

- (void)setHasCdpState:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasCdpState
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (id)cdpStateAsString:(int)a3
{
  if (a3 >= 3)
    return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  else
    return *(&off_1002DBAE0 + a3);
}

- (int)StringAsCdpState:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DISABLED")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("ENABLED")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasSyncingPolicy
{
  return self->_syncingPolicy != 0;
}

- (BOOL)hasVoucher
{
  return self->_voucher != 0;
}

- (BOOL)hasVoucherSignature
{
  return self->_voucherSignature != 0;
}

- (void)clearTlkSharesForVouchedIdentitys
{
  -[NSMutableArray removeAllObjects](self->_tlkSharesForVouchedIdentitys, "removeAllObjects");
}

- (void)addTlkSharesForVouchedIdentity:(id)a3
{
  id v4;
  NSMutableArray *tlkSharesForVouchedIdentitys;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  tlkSharesForVouchedIdentitys = self->_tlkSharesForVouchedIdentitys;
  v8 = v4;
  if (!tlkSharesForVouchedIdentitys)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_tlkSharesForVouchedIdentitys;
    self->_tlkSharesForVouchedIdentitys = v6;

    v4 = v8;
    tlkSharesForVouchedIdentitys = self->_tlkSharesForVouchedIdentitys;
  }
  -[NSMutableArray addObject:](tlkSharesForVouchedIdentitys, "addObject:", v4);

}

- (unint64_t)tlkSharesForVouchedIdentitysCount
{
  return (unint64_t)-[NSMutableArray count](self->_tlkSharesForVouchedIdentitys, "count");
}

- (id)tlkSharesForVouchedIdentityAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_tlkSharesForVouchedIdentitys, "objectAtIndex:", a3);
}

- (BOOL)hasSecureElementIdentity
{
  return self->_secureElementIdentity != 0;
}

- (void)setIsInheritedAccount:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_isInheritedAccount = a3;
}

- (void)setHasIsInheritedAccount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasIsInheritedAccount
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setWarmedEscrowCache:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_warmedEscrowCache = a3;
}

- (void)setHasWarmedEscrowCache:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasWarmedEscrowCache
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setWarnedTooManyPeers:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_warnedTooManyPeers = a3;
}

- (void)setHasWarnedTooManyPeers:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasWarnedTooManyPeers
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (int)sendingMetricsPermitted
{
  if ((*(_WORD *)&self->_has & 0x20) != 0)
    return self->_sendingMetricsPermitted;
  else
    return 0;
}

- (void)setSendingMetricsPermitted:(int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_sendingMetricsPermitted = a3;
}

- (void)setHasSendingMetricsPermitted:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasSendingMetricsPermitted
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (id)sendingMetricsPermittedAsString:(int)a3
{
  if (a3 >= 3)
    return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  else
    return *(&off_1002DBAF8 + a3);
}

- (int)StringAsSendingMetricsPermitted:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PERMITTED")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("NOTPERMITTED")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasOldPeerID
{
  return self->_oldPeerID != 0;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)OTAccountMetadataClassC;
  v3 = -[OTAccountMetadataClassC description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OTAccountMetadataClassC dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *peerID;
  __int16 has;
  uint64_t icloudAccountState;
  void *v8;
  void *v9;
  NSString *altDSID;
  __int16 v11;
  uint64_t trustState;
  void *v13;
  void *v14;
  uint64_t attemptedJoin;
  void *v16;
  uint64_t cdpState;
  void *v18;
  NSData *syncingPolicy;
  NSData *voucher;
  NSData *voucherSignature;
  NSMutableArray *tlkSharesForVouchedIdentitys;
  NSData *secureElementIdentity;
  __int16 v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t sendingMetricsPermitted;
  void *v29;
  NSString *oldPeerID;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = v3;
  peerID = self->_peerID;
  if (peerID)
    objc_msgSend(v3, "setObject:forKey:", peerID, CFSTR("peerID"));
  has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    icloudAccountState = self->_icloudAccountState;
    if (icloudAccountState >= 4)
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_icloudAccountState));
    else
      v8 = *(&off_1002DBA90 + icloudAccountState);
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("icloudAccountState"));

    has = (__int16)self->_has;
  }
  if ((has & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", self->_epoch));
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("epoch"));

  }
  altDSID = self->_altDSID;
  if (altDSID)
    objc_msgSend(v4, "setObject:forKey:", altDSID, CFSTR("altDSID"));
  v11 = (__int16)self->_has;
  if ((v11 & 0x40) != 0)
  {
    trustState = self->_trustState;
    if (trustState >= 3)
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_trustState));
    else
      v13 = *(&off_1002DBAB0 + trustState);
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("trustState"));

    v11 = (__int16)self->_has;
    if ((v11 & 2) == 0)
    {
LABEL_14:
      if ((v11 & 4) == 0)
        goto LABEL_15;
      goto LABEL_22;
    }
  }
  else if ((v11 & 2) == 0)
  {
    goto LABEL_14;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_lastHealthCheckup));
  objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("lastHealthCheckup"));

  v11 = (__int16)self->_has;
  if ((v11 & 4) == 0)
  {
LABEL_15:
    if ((v11 & 8) == 0)
      goto LABEL_30;
    goto LABEL_26;
  }
LABEL_22:
  attemptedJoin = self->_attemptedJoin;
  if (attemptedJoin >= 3)
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_attemptedJoin));
  else
    v16 = *(&off_1002DBAC8 + attemptedJoin);
  objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("attemptedJoin"));

  if ((*(_WORD *)&self->_has & 8) != 0)
  {
LABEL_26:
    cdpState = self->_cdpState;
    if (cdpState >= 3)
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_cdpState));
    else
      v18 = *(&off_1002DBAE0 + cdpState);
    objc_msgSend(v4, "setObject:forKey:", v18, CFSTR("cdpState"));

  }
LABEL_30:
  syncingPolicy = self->_syncingPolicy;
  if (syncingPolicy)
    objc_msgSend(v4, "setObject:forKey:", syncingPolicy, CFSTR("syncingPolicy"));
  voucher = self->_voucher;
  if (voucher)
    objc_msgSend(v4, "setObject:forKey:", voucher, CFSTR("voucher"));
  voucherSignature = self->_voucherSignature;
  if (voucherSignature)
    objc_msgSend(v4, "setObject:forKey:", voucherSignature, CFSTR("voucherSignature"));
  tlkSharesForVouchedIdentitys = self->_tlkSharesForVouchedIdentitys;
  if (tlkSharesForVouchedIdentitys)
    objc_msgSend(v4, "setObject:forKey:", tlkSharesForVouchedIdentitys, CFSTR("tlkSharesForVouchedIdentity"));
  secureElementIdentity = self->_secureElementIdentity;
  if (secureElementIdentity)
    objc_msgSend(v4, "setObject:forKey:", secureElementIdentity, CFSTR("secureElementIdentity"));
  v24 = (__int16)self->_has;
  if ((v24 & 0x80) != 0)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_isInheritedAccount));
    objc_msgSend(v4, "setObject:forKey:", v25, CFSTR("isInheritedAccount"));

    v24 = (__int16)self->_has;
    if ((v24 & 0x100) == 0)
    {
LABEL_42:
      if ((v24 & 0x200) == 0)
        goto LABEL_43;
LABEL_47:
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_warnedTooManyPeers));
      objc_msgSend(v4, "setObject:forKey:", v27, CFSTR("warnedTooManyPeers"));

      if ((*(_WORD *)&self->_has & 0x20) == 0)
        goto LABEL_52;
LABEL_48:
      sendingMetricsPermitted = self->_sendingMetricsPermitted;
      if (sendingMetricsPermitted >= 3)
        v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_sendingMetricsPermitted));
      else
        v29 = *(&off_1002DBAF8 + sendingMetricsPermitted);
      objc_msgSend(v4, "setObject:forKey:", v29, CFSTR("sendingMetricsPermitted"));

      goto LABEL_52;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_42;
  }
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_warmedEscrowCache));
  objc_msgSend(v4, "setObject:forKey:", v26, CFSTR("warmedEscrowCache"));

  v24 = (__int16)self->_has;
  if ((v24 & 0x200) != 0)
    goto LABEL_47;
LABEL_43:
  if ((v24 & 0x20) != 0)
    goto LABEL_48;
LABEL_52:
  oldPeerID = self->_oldPeerID;
  if (oldPeerID)
    objc_msgSend(v4, "setObject:forKey:", oldPeerID, CFSTR("oldPeerID"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  char **v5;
  char **v6;
  char v7;
  unsigned int v8;
  unint64_t v9;
  unint64_t v10;
  char v11;
  BOOL v12;
  int v13;
  uint64_t String;
  uint64_t v16;
  uint64_t v17;
  char v18;
  unsigned int v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  char v23;
  unsigned int v24;
  uint64_t v25;
  unint64_t v26;
  char v27;
  uint64_t v28;
  char v29;
  unsigned int v30;
  unint64_t v31;
  char v32;
  char v33;
  unsigned int v34;
  unint64_t v35;
  char v36;
  char v37;
  unsigned int v38;
  unint64_t v39;
  char v40;
  char v41;
  unsigned int v42;
  unint64_t v43;
  char v44;
  int v45;
  uint64_t Data;
  uint64_t v47;
  uint64_t v48;
  char **v49;
  char **v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  char v54;
  unsigned int v55;
  uint64_t v56;
  unint64_t v57;
  char v58;
  char v59;
  unsigned int v60;
  uint64_t v61;
  unint64_t v62;
  char v63;
  char v64;
  unsigned int v65;
  uint64_t v66;
  unint64_t v67;
  char v68;
  char v69;
  unsigned int v70;
  unint64_t v71;
  char v72;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  BOOL v77;
  uint64_t v78;

  if (*(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) < *(_QWORD *)((char *)a3
                                                                           + OBJC_IVAR___PBDataReader__length))
  {
    v5 = &selRef_clientOperationType;
    v6 = &selRef_clientOperationType;
    do
    {
      if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error))
        break;
      v7 = 0;
      v8 = 0;
      v9 = 0;
      while (1)
      {
        v10 = *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
        if (v10 == -1 || v10 >= *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
          break;
        v11 = *(_BYTE *)(*(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v10);
        *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v10 + 1;
        v9 |= (unint64_t)(v11 & 0x7F) << v7;
        if ((v11 & 0x80) == 0)
          goto LABEL_12;
        v7 += 7;
        v12 = v8++ >= 9;
        if (v12)
        {
          v9 = 0;
          v13 = *((unsigned __int8 *)a3 + OBJC_IVAR___PBDataReader__error);
          goto LABEL_14;
        }
      }
      *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_12:
      v13 = *((unsigned __int8 *)a3 + OBJC_IVAR___PBDataReader__error);
      if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error))
        v9 = 0;
LABEL_14:
      if (v13 || (v9 & 7) == 4)
        break;
      switch((v9 >> 3))
      {
        case 1u:
          String = PBReaderReadString(a3);
          v16 = objc_claimAutoreleasedReturnValue(String);
          v17 = *((int *)v5 + 899);
          goto LABEL_101;
        case 2u:
          v18 = 0;
          v19 = 0;
          v20 = 0;
          *(_WORD *)&self->PBCodable_opaque[*((int *)v6 + 900)] |= 0x10u;
          while (2)
          {
            v21 = *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            if (v21 == -1 || v21 >= *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }
            else
            {
              v22 = *(_BYTE *)(*(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v21);
              *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v21 + 1;
              v20 |= (unint64_t)(v22 & 0x7F) << v18;
              if (v22 < 0)
              {
                v18 += 7;
                v12 = v19++ >= 9;
                if (v12)
                {
                  LODWORD(v20) = 0;
                  goto LABEL_105;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error))
            LODWORD(v20) = 0;
LABEL_105:
          v75 = 40;
          goto LABEL_144;
        case 3u:
          v23 = 0;
          v24 = 0;
          v25 = 0;
          *(_WORD *)&self->PBCodable_opaque[*((int *)v6 + 900)] |= 1u;
          while (2)
          {
            v26 = *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            if (v26 == -1 || v26 >= *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }
            else
            {
              v27 = *(_BYTE *)(*(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v26);
              *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v26 + 1;
              v25 |= (unint64_t)(v27 & 0x7F) << v23;
              if (v27 < 0)
              {
                v23 += 7;
                v12 = v24++ >= 9;
                if (v12)
                {
                  v25 = 0;
                  goto LABEL_109;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error))
            v25 = 0;
LABEL_109:
          v76 = 8;
          goto LABEL_118;
        case 4u:
          v28 = PBReaderReadString(a3);
          v16 = objc_claimAutoreleasedReturnValue(v28);
          v17 = 24;
          goto LABEL_101;
        case 5u:
          v29 = 0;
          v30 = 0;
          v20 = 0;
          *(_WORD *)&self->PBCodable_opaque[*((int *)v6 + 900)] |= 0x40u;
          while (2)
          {
            v31 = *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            if (v31 == -1 || v31 >= *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }
            else
            {
              v32 = *(_BYTE *)(*(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v31);
              *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v31 + 1;
              v20 |= (unint64_t)(v32 & 0x7F) << v29;
              if (v32 < 0)
              {
                v29 += 7;
                v12 = v30++ >= 9;
                if (v12)
                {
                  LODWORD(v20) = 0;
                  goto LABEL_113;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error))
            LODWORD(v20) = 0;
LABEL_113:
          v75 = 96;
          goto LABEL_144;
        case 6u:
          v33 = 0;
          v34 = 0;
          v25 = 0;
          *(_WORD *)&self->PBCodable_opaque[*((int *)v6 + 900)] |= 2u;
          while (2)
          {
            v35 = *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            if (v35 == -1 || v35 >= *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }
            else
            {
              v36 = *(_BYTE *)(*(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v35);
              *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v35 + 1;
              v25 |= (unint64_t)(v36 & 0x7F) << v33;
              if (v36 < 0)
              {
                v33 += 7;
                v12 = v34++ >= 9;
                if (v12)
                {
                  v25 = 0;
                  goto LABEL_117;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error))
            v25 = 0;
LABEL_117:
          v76 = 16;
LABEL_118:
          *(_QWORD *)&self->PBCodable_opaque[v76] = v25;
          continue;
        case 7u:
          v37 = 0;
          v38 = 0;
          v20 = 0;
          *(_WORD *)&self->PBCodable_opaque[*((int *)v6 + 900)] |= 4u;
          while (2)
          {
            v39 = *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            if (v39 == -1 || v39 >= *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }
            else
            {
              v40 = *(_BYTE *)(*(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v39);
              *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v39 + 1;
              v20 |= (unint64_t)(v40 & 0x7F) << v37;
              if (v40 < 0)
              {
                v37 += 7;
                v12 = v38++ >= 9;
                if (v12)
                {
                  LODWORD(v20) = 0;
                  goto LABEL_122;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error))
            LODWORD(v20) = 0;
LABEL_122:
          v75 = 32;
          goto LABEL_144;
        case 8u:
          v41 = 0;
          v42 = 0;
          v20 = 0;
          *(_WORD *)&self->PBCodable_opaque[*((int *)v6 + 900)] |= 8u;
          while (2)
          {
            v43 = *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            if (v43 == -1 || v43 >= *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }
            else
            {
              v44 = *(_BYTE *)(*(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v43);
              *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v43 + 1;
              v20 |= (unint64_t)(v44 & 0x7F) << v41;
              if (v44 < 0)
              {
                v41 += 7;
                v12 = v42++ >= 9;
                if (v12)
                {
                  LODWORD(v20) = 0;
                  goto LABEL_126;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error))
            LODWORD(v20) = 0;
LABEL_126:
          v75 = 36;
          goto LABEL_144;
        case 0xBu:
          Data = PBReaderReadData(a3);
          v16 = objc_claimAutoreleasedReturnValue(Data);
          v17 = 80;
          goto LABEL_101;
        case 0xCu:
          v47 = PBReaderReadData(a3);
          v16 = objc_claimAutoreleasedReturnValue(v47);
          v17 = 104;
          goto LABEL_101;
        case 0xDu:
          v48 = PBReaderReadData(a3);
          v16 = objc_claimAutoreleasedReturnValue(v48);
          v17 = 112;
          goto LABEL_101;
        case 0xEu:
          v49 = v6;
          v50 = v5;
          v51 = PBReaderReadData(a3);
          v52 = (void *)objc_claimAutoreleasedReturnValue(v51);
          if (v52)
            -[OTAccountMetadataClassC addTlkSharesForVouchedIdentity:](self, "addTlkSharesForVouchedIdentity:", v52);

          v5 = v50;
          v6 = v49;
          continue;
        case 0xFu:
          v53 = PBReaderReadData(a3);
          v16 = objc_claimAutoreleasedReturnValue(v53);
          v17 = 64;
          goto LABEL_101;
        case 0x12u:
          v54 = 0;
          v55 = 0;
          v56 = 0;
          *(_WORD *)&self->PBCodable_opaque[*((int *)v6 + 900)] |= 0x80u;
          while (2)
          {
            v57 = *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            if (v57 == -1 || v57 >= *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }
            else
            {
              v58 = *(_BYTE *)(*(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v57);
              *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v57 + 1;
              v56 |= (unint64_t)(v58 & 0x7F) << v54;
              if (v58 < 0)
              {
                v54 += 7;
                v12 = v55++ >= 9;
                if (v12)
                {
                  v56 = 0;
                  goto LABEL_130;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error))
            v56 = 0;
LABEL_130:
          v77 = v56 != 0;
          v78 = 120;
          goto LABEL_139;
        case 0x13u:
          v59 = 0;
          v60 = 0;
          v61 = 0;
          *(_WORD *)&self->PBCodable_opaque[*((int *)v6 + 900)] |= 0x100u;
          while (2)
          {
            v62 = *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            if (v62 == -1 || v62 >= *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }
            else
            {
              v63 = *(_BYTE *)(*(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v62);
              *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v62 + 1;
              v61 |= (unint64_t)(v63 & 0x7F) << v59;
              if (v63 < 0)
              {
                v59 += 7;
                v12 = v60++ >= 9;
                if (v12)
                {
                  v61 = 0;
                  goto LABEL_134;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error))
            v61 = 0;
LABEL_134:
          v77 = v61 != 0;
          v78 = 121;
          goto LABEL_139;
        case 0x14u:
          v64 = 0;
          v65 = 0;
          v66 = 0;
          *(_WORD *)&self->PBCodable_opaque[*((int *)v6 + 900)] |= 0x200u;
          while (2)
          {
            v67 = *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            if (v67 == -1 || v67 >= *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }
            else
            {
              v68 = *(_BYTE *)(*(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v67);
              *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v67 + 1;
              v66 |= (unint64_t)(v68 & 0x7F) << v64;
              if (v68 < 0)
              {
                v64 += 7;
                v12 = v65++ >= 9;
                if (v12)
                {
                  v66 = 0;
                  goto LABEL_138;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error))
            v66 = 0;
LABEL_138:
          v77 = v66 != 0;
          v78 = 122;
LABEL_139:
          self->PBCodable_opaque[v78] = v77;
          continue;
        case 0x16u:
          v69 = 0;
          v70 = 0;
          v20 = 0;
          *(_WORD *)&self->PBCodable_opaque[*((int *)v6 + 900)] |= 0x20u;
          break;
        case 0x17u:
          v73 = PBReaderReadString(a3);
          v16 = objc_claimAutoreleasedReturnValue(v73);
          v17 = 48;
LABEL_101:
          v74 = *(void **)&self->PBCodable_opaque[v17];
          *(_QWORD *)&self->PBCodable_opaque[v17] = v16;

          continue;
        default:
          v45 = PBReaderSkipValueWithTag(a3);
          if (!v45)
            return v45;
          continue;
      }
      while (1)
      {
        v71 = *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
        if (v71 == -1 || v71 >= *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
          break;
        v72 = *(_BYTE *)(*(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v71);
        *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v71 + 1;
        v20 |= (unint64_t)(v72 & 0x7F) << v69;
        if ((v72 & 0x80) == 0)
          goto LABEL_141;
        v69 += 7;
        v12 = v70++ >= 9;
        if (v12)
        {
          LODWORD(v20) = 0;
          goto LABEL_143;
        }
      }
      *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_141:
      if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error))
        LODWORD(v20) = 0;
LABEL_143:
      v75 = 72;
LABEL_144:
      *(_DWORD *)&self->PBCodable_opaque[v75] = v20;
    }
    while (*(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) < *(_QWORD *)((char *)a3
                                                                                + OBJC_IVAR___PBDataReader__length));
  }
  LOBYTE(v45) = *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
  return v45;
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  NSString *peerID;
  __int16 has;
  NSString *altDSID;
  __int16 v9;
  NSData *syncingPolicy;
  NSData *voucher;
  NSData *voucherSignature;
  NSMutableArray *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  NSData *secureElementIdentity;
  __int16 v19;
  NSString *oldPeerID;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  v4 = a3;
  v5 = v4;
  peerID = self->_peerID;
  if (peerID)
    PBDataWriterWriteStringField(v4, peerID, 1);
  has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteInt32Field(v5, self->_icloudAccountState, 2);
    has = (__int16)self->_has;
  }
  if ((has & 1) != 0)
    PBDataWriterWriteInt64Field(v5, self->_epoch, 3);
  altDSID = self->_altDSID;
  if (altDSID)
    PBDataWriterWriteStringField(v5, altDSID, 4);
  v9 = (__int16)self->_has;
  if ((v9 & 0x40) != 0)
  {
    PBDataWriterWriteInt32Field(v5, self->_trustState, 5);
    v9 = (__int16)self->_has;
    if ((v9 & 2) == 0)
    {
LABEL_11:
      if ((v9 & 4) == 0)
        goto LABEL_12;
      goto LABEL_39;
    }
  }
  else if ((v9 & 2) == 0)
  {
    goto LABEL_11;
  }
  PBDataWriterWriteUint64Field(v5, self->_lastHealthCheckup, 6);
  v9 = (__int16)self->_has;
  if ((v9 & 4) == 0)
  {
LABEL_12:
    if ((v9 & 8) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
LABEL_39:
  PBDataWriterWriteInt32Field(v5, self->_attemptedJoin, 7);
  if ((*(_WORD *)&self->_has & 8) != 0)
LABEL_13:
    PBDataWriterWriteInt32Field(v5, self->_cdpState, 8);
LABEL_14:
  syncingPolicy = self->_syncingPolicy;
  if (syncingPolicy)
    PBDataWriterWriteDataField(v5, syncingPolicy, 11);
  voucher = self->_voucher;
  if (voucher)
    PBDataWriterWriteDataField(v5, voucher, 12);
  voucherSignature = self->_voucherSignature;
  if (voucherSignature)
    PBDataWriterWriteDataField(v5, voucherSignature, 13);
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v13 = self->_tlkSharesForVouchedIdentitys;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v16)
          objc_enumerationMutation(v13);
        PBDataWriterWriteDataField(v5, *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i), 14);
      }
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v15);
  }

  secureElementIdentity = self->_secureElementIdentity;
  if (secureElementIdentity)
    PBDataWriterWriteDataField(v5, secureElementIdentity, 15);
  v19 = (__int16)self->_has;
  if ((v19 & 0x80) != 0)
  {
    PBDataWriterWriteBOOLField(v5, self->_isInheritedAccount, 18);
    v19 = (__int16)self->_has;
    if ((v19 & 0x100) == 0)
    {
LABEL_31:
      if ((v19 & 0x200) == 0)
        goto LABEL_32;
      goto LABEL_43;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_31;
  }
  PBDataWriterWriteBOOLField(v5, self->_warmedEscrowCache, 19);
  v19 = (__int16)self->_has;
  if ((v19 & 0x200) == 0)
  {
LABEL_32:
    if ((v19 & 0x20) == 0)
      goto LABEL_34;
    goto LABEL_33;
  }
LABEL_43:
  PBDataWriterWriteBOOLField(v5, self->_warnedTooManyPeers, 20);
  if ((*(_WORD *)&self->_has & 0x20) != 0)
LABEL_33:
    PBDataWriterWriteInt32Field(v5, self->_sendingMetricsPermitted, 22);
LABEL_34:
  oldPeerID = self->_oldPeerID;
  if (oldPeerID)
    PBDataWriterWriteStringField(v5, oldPeerID, 23);

}

- (void)copyTo:(id)a3
{
  id v4;
  __int16 has;
  __int16 v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t i;
  void *v10;
  __int16 v11;
  void *v12;
  id v13;

  v4 = a3;
  v13 = v4;
  if (self->_peerID)
  {
    objc_msgSend(v4, "setPeerID:");
    v4 = v13;
  }
  has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    *((_DWORD *)v4 + 10) = self->_icloudAccountState;
    *((_WORD *)v4 + 62) |= 0x10u;
    has = (__int16)self->_has;
  }
  if ((has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = self->_epoch;
    *((_WORD *)v4 + 62) |= 1u;
  }
  if (self->_altDSID)
  {
    objc_msgSend(v13, "setAltDSID:");
    v4 = v13;
  }
  v6 = (__int16)self->_has;
  if ((v6 & 0x40) != 0)
  {
    *((_DWORD *)v4 + 24) = self->_trustState;
    *((_WORD *)v4 + 62) |= 0x40u;
    v6 = (__int16)self->_has;
    if ((v6 & 2) == 0)
    {
LABEL_11:
      if ((v6 & 4) == 0)
        goto LABEL_12;
      goto LABEL_36;
    }
  }
  else if ((v6 & 2) == 0)
  {
    goto LABEL_11;
  }
  *((_QWORD *)v4 + 2) = self->_lastHealthCheckup;
  *((_WORD *)v4 + 62) |= 2u;
  v6 = (__int16)self->_has;
  if ((v6 & 4) == 0)
  {
LABEL_12:
    if ((v6 & 8) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
LABEL_36:
  *((_DWORD *)v4 + 8) = self->_attemptedJoin;
  *((_WORD *)v4 + 62) |= 4u;
  if ((*(_WORD *)&self->_has & 8) != 0)
  {
LABEL_13:
    *((_DWORD *)v4 + 9) = self->_cdpState;
    *((_WORD *)v4 + 62) |= 8u;
  }
LABEL_14:
  if (self->_syncingPolicy)
    objc_msgSend(v13, "setSyncingPolicy:");
  if (self->_voucher)
    objc_msgSend(v13, "setVoucher:");
  if (self->_voucherSignature)
    objc_msgSend(v13, "setVoucherSignature:");
  if (-[OTAccountMetadataClassC tlkSharesForVouchedIdentitysCount](self, "tlkSharesForVouchedIdentitysCount"))
  {
    objc_msgSend(v13, "clearTlkSharesForVouchedIdentitys");
    v7 = -[OTAccountMetadataClassC tlkSharesForVouchedIdentitysCount](self, "tlkSharesForVouchedIdentitysCount");
    if (v7)
    {
      v8 = v7;
      for (i = 0; i != v8; ++i)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[OTAccountMetadataClassC tlkSharesForVouchedIdentityAtIndex:](self, "tlkSharesForVouchedIdentityAtIndex:", i));
        objc_msgSend(v13, "addTlkSharesForVouchedIdentity:", v10);

      }
    }
  }
  if (self->_secureElementIdentity)
    objc_msgSend(v13, "setSecureElementIdentity:");
  v11 = (__int16)self->_has;
  v12 = v13;
  if ((v11 & 0x80) != 0)
  {
    *((_BYTE *)v13 + 120) = self->_isInheritedAccount;
    *((_WORD *)v13 + 62) |= 0x80u;
    v11 = (__int16)self->_has;
    if ((v11 & 0x100) == 0)
    {
LABEL_28:
      if ((v11 & 0x200) == 0)
        goto LABEL_29;
      goto LABEL_40;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_28;
  }
  *((_BYTE *)v13 + 121) = self->_warmedEscrowCache;
  *((_WORD *)v13 + 62) |= 0x100u;
  v11 = (__int16)self->_has;
  if ((v11 & 0x200) == 0)
  {
LABEL_29:
    if ((v11 & 0x20) == 0)
      goto LABEL_31;
    goto LABEL_30;
  }
LABEL_40:
  *((_BYTE *)v13 + 122) = self->_warnedTooManyPeers;
  *((_WORD *)v13 + 62) |= 0x200u;
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
LABEL_30:
    *((_DWORD *)v13 + 18) = self->_sendingMetricsPermitted;
    *((_WORD *)v13 + 62) |= 0x20u;
  }
LABEL_31:
  if (self->_oldPeerID)
  {
    objc_msgSend(v13, "setOldPeerID:");
    v12 = v13;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  __int16 has;
  id v9;
  void *v10;
  __int16 v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  NSMutableArray *v18;
  id v19;
  id v20;
  uint64_t v21;
  void *i;
  id v23;
  id v24;
  void *v25;
  __int16 v26;
  id v27;
  void *v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_peerID, "copyWithZone:", a3);
  v7 = (void *)v5[7];
  v5[7] = v6;

  has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    *((_DWORD *)v5 + 10) = self->_icloudAccountState;
    *((_WORD *)v5 + 62) |= 0x10u;
    has = (__int16)self->_has;
  }
  if ((has & 1) != 0)
  {
    v5[1] = self->_epoch;
    *((_WORD *)v5 + 62) |= 1u;
  }
  v9 = -[NSString copyWithZone:](self->_altDSID, "copyWithZone:", a3);
  v10 = (void *)v5[3];
  v5[3] = v9;

  v11 = (__int16)self->_has;
  if ((v11 & 0x40) != 0)
  {
    *((_DWORD *)v5 + 24) = self->_trustState;
    *((_WORD *)v5 + 62) |= 0x40u;
    v11 = (__int16)self->_has;
    if ((v11 & 2) == 0)
    {
LABEL_7:
      if ((v11 & 4) == 0)
        goto LABEL_8;
      goto LABEL_25;
    }
  }
  else if ((v11 & 2) == 0)
  {
    goto LABEL_7;
  }
  v5[2] = self->_lastHealthCheckup;
  *((_WORD *)v5 + 62) |= 2u;
  v11 = (__int16)self->_has;
  if ((v11 & 4) == 0)
  {
LABEL_8:
    if ((v11 & 8) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_25:
  *((_DWORD *)v5 + 8) = self->_attemptedJoin;
  *((_WORD *)v5 + 62) |= 4u;
  if ((*(_WORD *)&self->_has & 8) != 0)
  {
LABEL_9:
    *((_DWORD *)v5 + 9) = self->_cdpState;
    *((_WORD *)v5 + 62) |= 8u;
  }
LABEL_10:
  v12 = -[NSData copyWithZone:](self->_syncingPolicy, "copyWithZone:", a3);
  v13 = (void *)v5[10];
  v5[10] = v12;

  v14 = -[NSData copyWithZone:](self->_voucher, "copyWithZone:", a3);
  v15 = (void *)v5[13];
  v5[13] = v14;

  v16 = -[NSData copyWithZone:](self->_voucherSignature, "copyWithZone:", a3);
  v17 = (void *)v5[14];
  v5[14] = v16;

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v18 = self->_tlkSharesForVouchedIdentitys;
  v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v20; i = (char *)i + 1)
      {
        if (*(_QWORD *)v31 != v21)
          objc_enumerationMutation(v18);
        v23 = objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)i), "copyWithZone:", a3, (_QWORD)v30);
        objc_msgSend(v5, "addTlkSharesForVouchedIdentity:", v23);

      }
      v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v20);
  }

  v24 = -[NSData copyWithZone:](self->_secureElementIdentity, "copyWithZone:", a3);
  v25 = (void *)v5[8];
  v5[8] = v24;

  v26 = (__int16)self->_has;
  if ((v26 & 0x80) != 0)
  {
    *((_BYTE *)v5 + 120) = self->_isInheritedAccount;
    *((_WORD *)v5 + 62) |= 0x80u;
    v26 = (__int16)self->_has;
    if ((v26 & 0x100) == 0)
    {
LABEL_19:
      if ((v26 & 0x200) == 0)
        goto LABEL_20;
LABEL_29:
      *((_BYTE *)v5 + 122) = self->_warnedTooManyPeers;
      *((_WORD *)v5 + 62) |= 0x200u;
      if ((*(_WORD *)&self->_has & 0x20) == 0)
        goto LABEL_22;
      goto LABEL_21;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_19;
  }
  *((_BYTE *)v5 + 121) = self->_warmedEscrowCache;
  *((_WORD *)v5 + 62) |= 0x100u;
  v26 = (__int16)self->_has;
  if ((v26 & 0x200) != 0)
    goto LABEL_29;
LABEL_20:
  if ((v26 & 0x20) != 0)
  {
LABEL_21:
    *((_DWORD *)v5 + 18) = self->_sendingMetricsPermitted;
    *((_WORD *)v5 + 62) |= 0x20u;
  }
LABEL_22:
  v27 = -[NSString copyWithZone:](self->_oldPeerID, "copyWithZone:", a3, (_QWORD)v30);
  v28 = (void *)v5[6];
  v5[6] = v27;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *peerID;
  __int16 has;
  __int16 v7;
  NSString *altDSID;
  NSData *syncingPolicy;
  NSData *voucher;
  NSData *voucherSignature;
  NSMutableArray *tlkSharesForVouchedIdentitys;
  NSData *secureElementIdentity;
  __int16 v14;
  __int16 v15;
  NSString *oldPeerID;
  unsigned __int8 v17;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self)))
    goto LABEL_78;
  peerID = self->_peerID;
  if ((unint64_t)peerID | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](peerID, "isEqual:"))
      goto LABEL_78;
  }
  has = (__int16)self->_has;
  v7 = *((_WORD *)v4 + 62);
  if ((has & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0 || self->_icloudAccountState != *((_DWORD *)v4 + 10))
      goto LABEL_78;
  }
  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_78;
  }
  if ((has & 1) != 0)
  {
    if ((v7 & 1) == 0 || self->_epoch != *((_QWORD *)v4 + 1))
      goto LABEL_78;
  }
  else if ((v7 & 1) != 0)
  {
    goto LABEL_78;
  }
  altDSID = self->_altDSID;
  if ((unint64_t)altDSID | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](altDSID, "isEqual:"))
      goto LABEL_78;
    has = (__int16)self->_has;
    v7 = *((_WORD *)v4 + 62);
  }
  if ((has & 0x40) != 0)
  {
    if ((v7 & 0x40) == 0 || self->_trustState != *((_DWORD *)v4 + 24))
      goto LABEL_78;
  }
  else if ((v7 & 0x40) != 0)
  {
    goto LABEL_78;
  }
  if ((has & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_lastHealthCheckup != *((_QWORD *)v4 + 2))
      goto LABEL_78;
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_78;
  }
  if ((has & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_attemptedJoin != *((_DWORD *)v4 + 8))
      goto LABEL_78;
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_78;
  }
  if ((has & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_cdpState != *((_DWORD *)v4 + 9))
      goto LABEL_78;
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_78;
  }
  syncingPolicy = self->_syncingPolicy;
  if ((unint64_t)syncingPolicy | *((_QWORD *)v4 + 10)
    && !-[NSData isEqual:](syncingPolicy, "isEqual:"))
  {
    goto LABEL_78;
  }
  voucher = self->_voucher;
  if ((unint64_t)voucher | *((_QWORD *)v4 + 13))
  {
    if (!-[NSData isEqual:](voucher, "isEqual:"))
      goto LABEL_78;
  }
  voucherSignature = self->_voucherSignature;
  if ((unint64_t)voucherSignature | *((_QWORD *)v4 + 14))
  {
    if (!-[NSData isEqual:](voucherSignature, "isEqual:"))
      goto LABEL_78;
  }
  tlkSharesForVouchedIdentitys = self->_tlkSharesForVouchedIdentitys;
  if ((unint64_t)tlkSharesForVouchedIdentitys | *((_QWORD *)v4 + 11))
  {
    if (!-[NSMutableArray isEqual:](tlkSharesForVouchedIdentitys, "isEqual:"))
      goto LABEL_78;
  }
  secureElementIdentity = self->_secureElementIdentity;
  if ((unint64_t)secureElementIdentity | *((_QWORD *)v4 + 8))
  {
    if (!-[NSData isEqual:](secureElementIdentity, "isEqual:"))
      goto LABEL_78;
  }
  v14 = (__int16)self->_has;
  v15 = *((_WORD *)v4 + 62);
  if ((v14 & 0x80) != 0)
  {
    if ((v15 & 0x80) == 0)
      goto LABEL_78;
    if (self->_isInheritedAccount)
    {
      if (!*((_BYTE *)v4 + 120))
        goto LABEL_78;
    }
    else if (*((_BYTE *)v4 + 120))
    {
      goto LABEL_78;
    }
  }
  else if ((v15 & 0x80) != 0)
  {
    goto LABEL_78;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 62) & 0x100) == 0)
      goto LABEL_78;
    if (self->_warmedEscrowCache)
    {
      if (!*((_BYTE *)v4 + 121))
        goto LABEL_78;
    }
    else if (*((_BYTE *)v4 + 121))
    {
      goto LABEL_78;
    }
  }
  else if ((*((_WORD *)v4 + 62) & 0x100) != 0)
  {
    goto LABEL_78;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 62) & 0x200) != 0)
    {
      if (self->_warnedTooManyPeers)
      {
        if (!*((_BYTE *)v4 + 122))
          goto LABEL_78;
        goto LABEL_71;
      }
      if (!*((_BYTE *)v4 + 122))
        goto LABEL_71;
    }
LABEL_78:
    v17 = 0;
    goto LABEL_79;
  }
  if ((*((_WORD *)v4 + 62) & 0x200) != 0)
    goto LABEL_78;
LABEL_71:
  if ((v14 & 0x20) != 0)
  {
    if ((v15 & 0x20) == 0 || self->_sendingMetricsPermitted != *((_DWORD *)v4 + 18))
      goto LABEL_78;
  }
  else if ((v15 & 0x20) != 0)
  {
    goto LABEL_78;
  }
  oldPeerID = self->_oldPeerID;
  if ((unint64_t)oldPeerID | *((_QWORD *)v4 + 6))
    v17 = -[NSString isEqual:](oldPeerID, "isEqual:");
  else
    v17 = 1;
LABEL_79:

  return v17;
}

- (unint64_t)hash
{
  __int16 has;
  __int16 v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  NSUInteger v20;
  uint64_t v21;
  uint64_t v22;
  NSUInteger v23;

  v23 = -[NSString hash](self->_peerID, "hash");
  has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    v22 = 2654435761 * self->_icloudAccountState;
    if ((has & 1) != 0)
      goto LABEL_3;
  }
  else
  {
    v22 = 0;
    if ((has & 1) != 0)
    {
LABEL_3:
      v21 = 2654435761 * self->_epoch;
      goto LABEL_6;
    }
  }
  v21 = 0;
LABEL_6:
  v20 = -[NSString hash](self->_altDSID, "hash");
  v4 = (__int16)self->_has;
  if ((v4 & 0x40) != 0)
  {
    v19 = 2654435761 * self->_trustState;
    if ((v4 & 2) != 0)
    {
LABEL_8:
      v5 = 2654435761u * self->_lastHealthCheckup;
      if ((v4 & 4) != 0)
        goto LABEL_9;
LABEL_13:
      v6 = 0;
      if ((v4 & 8) != 0)
        goto LABEL_10;
      goto LABEL_14;
    }
  }
  else
  {
    v19 = 0;
    if ((v4 & 2) != 0)
      goto LABEL_8;
  }
  v5 = 0;
  if ((v4 & 4) == 0)
    goto LABEL_13;
LABEL_9:
  v6 = 2654435761 * self->_attemptedJoin;
  if ((v4 & 8) != 0)
  {
LABEL_10:
    v7 = 2654435761 * self->_cdpState;
    goto LABEL_15;
  }
LABEL_14:
  v7 = 0;
LABEL_15:
  v8 = (unint64_t)-[NSData hash](self->_syncingPolicy, "hash");
  v9 = (unint64_t)-[NSData hash](self->_voucher, "hash");
  v10 = (unint64_t)-[NSData hash](self->_voucherSignature, "hash");
  v11 = (unint64_t)-[NSMutableArray hash](self->_tlkSharesForVouchedIdentitys, "hash");
  v12 = (unint64_t)-[NSData hash](self->_secureElementIdentity, "hash");
  v13 = (__int16)self->_has;
  if ((v13 & 0x80) != 0)
  {
    v14 = 2654435761 * self->_isInheritedAccount;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
    {
LABEL_17:
      v15 = 2654435761 * self->_warmedEscrowCache;
      if ((*(_WORD *)&self->_has & 0x200) != 0)
        goto LABEL_18;
LABEL_22:
      v16 = 0;
      if ((v13 & 0x20) != 0)
        goto LABEL_19;
LABEL_23:
      v17 = 0;
      return v22 ^ v23 ^ v21 ^ v20 ^ v19 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v14 ^ v15 ^ v16 ^ v17 ^ -[NSString hash](self->_oldPeerID, "hash");
    }
  }
  else
  {
    v14 = 0;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
      goto LABEL_17;
  }
  v15 = 0;
  if ((*(_WORD *)&self->_has & 0x200) == 0)
    goto LABEL_22;
LABEL_18:
  v16 = 2654435761 * self->_warnedTooManyPeers;
  if ((v13 & 0x20) == 0)
    goto LABEL_23;
LABEL_19:
  v17 = 2654435761 * self->_sendingMetricsPermitted;
  return v22 ^ v23 ^ v21 ^ v20 ^ v19 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v14 ^ v15 ^ v16 ^ v17 ^ -[NSString hash](self->_oldPeerID, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  __int16 v5;
  __int16 v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  __int16 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = a3;
  if (*((_QWORD *)v4 + 7))
    -[OTAccountMetadataClassC setPeerID:](self, "setPeerID:");
  v5 = *((_WORD *)v4 + 62);
  if ((v5 & 0x10) != 0)
  {
    self->_icloudAccountState = *((_DWORD *)v4 + 10);
    *(_WORD *)&self->_has |= 0x10u;
    v5 = *((_WORD *)v4 + 62);
  }
  if ((v5 & 1) != 0)
  {
    self->_epoch = *((_QWORD *)v4 + 1);
    *(_WORD *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 3))
    -[OTAccountMetadataClassC setAltDSID:](self, "setAltDSID:");
  v6 = *((_WORD *)v4 + 62);
  if ((v6 & 0x40) != 0)
  {
    self->_trustState = *((_DWORD *)v4 + 24);
    *(_WORD *)&self->_has |= 0x40u;
    v6 = *((_WORD *)v4 + 62);
    if ((v6 & 2) == 0)
    {
LABEL_11:
      if ((v6 & 4) == 0)
        goto LABEL_12;
      goto LABEL_39;
    }
  }
  else if ((v6 & 2) == 0)
  {
    goto LABEL_11;
  }
  self->_lastHealthCheckup = *((_QWORD *)v4 + 2);
  *(_WORD *)&self->_has |= 2u;
  v6 = *((_WORD *)v4 + 62);
  if ((v6 & 4) == 0)
  {
LABEL_12:
    if ((v6 & 8) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
LABEL_39:
  self->_attemptedJoin = *((_DWORD *)v4 + 8);
  *(_WORD *)&self->_has |= 4u;
  if ((*((_WORD *)v4 + 62) & 8) != 0)
  {
LABEL_13:
    self->_cdpState = *((_DWORD *)v4 + 9);
    *(_WORD *)&self->_has |= 8u;
  }
LABEL_14:
  if (*((_QWORD *)v4 + 10))
    -[OTAccountMetadataClassC setSyncingPolicy:](self, "setSyncingPolicy:");
  if (*((_QWORD *)v4 + 13))
    -[OTAccountMetadataClassC setVoucher:](self, "setVoucher:");
  if (*((_QWORD *)v4 + 14))
    -[OTAccountMetadataClassC setVoucherSignature:](self, "setVoucherSignature:");
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = *((id *)v4 + 11);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        -[OTAccountMetadataClassC addTlkSharesForVouchedIdentity:](self, "addTlkSharesForVouchedIdentity:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i), (_QWORD)v13);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

  if (*((_QWORD *)v4 + 8))
    -[OTAccountMetadataClassC setSecureElementIdentity:](self, "setSecureElementIdentity:");
  v12 = *((_WORD *)v4 + 62);
  if ((v12 & 0x80) != 0)
  {
    self->_isInheritedAccount = *((_BYTE *)v4 + 120);
    *(_WORD *)&self->_has |= 0x80u;
    v12 = *((_WORD *)v4 + 62);
    if ((v12 & 0x100) == 0)
    {
LABEL_31:
      if ((v12 & 0x200) == 0)
        goto LABEL_32;
      goto LABEL_43;
    }
  }
  else if ((*((_WORD *)v4 + 62) & 0x100) == 0)
  {
    goto LABEL_31;
  }
  self->_warmedEscrowCache = *((_BYTE *)v4 + 121);
  *(_WORD *)&self->_has |= 0x100u;
  v12 = *((_WORD *)v4 + 62);
  if ((v12 & 0x200) == 0)
  {
LABEL_32:
    if ((v12 & 0x20) == 0)
      goto LABEL_34;
    goto LABEL_33;
  }
LABEL_43:
  self->_warnedTooManyPeers = *((_BYTE *)v4 + 122);
  *(_WORD *)&self->_has |= 0x200u;
  if ((*((_WORD *)v4 + 62) & 0x20) != 0)
  {
LABEL_33:
    self->_sendingMetricsPermitted = *((_DWORD *)v4 + 18);
    *(_WORD *)&self->_has |= 0x20u;
  }
LABEL_34:
  if (*((_QWORD *)v4 + 6))
    -[OTAccountMetadataClassC setOldPeerID:](self, "setOldPeerID:");

}

- (NSString)peerID
{
  return self->_peerID;
}

- (void)setPeerID:(id)a3
{
  objc_storeStrong((id *)&self->_peerID, a3);
}

- (int64_t)epoch
{
  return self->_epoch;
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void)setAltDSID:(id)a3
{
  objc_storeStrong((id *)&self->_altDSID, a3);
}

- (unint64_t)lastHealthCheckup
{
  return self->_lastHealthCheckup;
}

- (NSData)syncingPolicy
{
  return self->_syncingPolicy;
}

- (void)setSyncingPolicy:(id)a3
{
  objc_storeStrong((id *)&self->_syncingPolicy, a3);
}

- (NSData)voucher
{
  return self->_voucher;
}

- (void)setVoucher:(id)a3
{
  objc_storeStrong((id *)&self->_voucher, a3);
}

- (NSData)voucherSignature
{
  return self->_voucherSignature;
}

- (void)setVoucherSignature:(id)a3
{
  objc_storeStrong((id *)&self->_voucherSignature, a3);
}

- (NSMutableArray)tlkSharesForVouchedIdentitys
{
  return self->_tlkSharesForVouchedIdentitys;
}

- (void)setTlkSharesForVouchedIdentitys:(id)a3
{
  objc_storeStrong((id *)&self->_tlkSharesForVouchedIdentitys, a3);
}

- (NSData)secureElementIdentity
{
  return self->_secureElementIdentity;
}

- (void)setSecureElementIdentity:(id)a3
{
  objc_storeStrong((id *)&self->_secureElementIdentity, a3);
}

- (BOOL)isInheritedAccount
{
  return self->_isInheritedAccount;
}

- (BOOL)warmedEscrowCache
{
  return self->_warmedEscrowCache;
}

- (BOOL)warnedTooManyPeers
{
  return self->_warnedTooManyPeers;
}

- (NSString)oldPeerID
{
  return self->_oldPeerID;
}

- (void)setOldPeerID:(id)a3
{
  objc_storeStrong((id *)&self->_oldPeerID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voucherSignature, 0);
  objc_storeStrong((id *)&self->_voucher, 0);
  objc_storeStrong((id *)&self->_tlkSharesForVouchedIdentitys, 0);
  objc_storeStrong((id *)&self->_syncingPolicy, 0);
  objc_storeStrong((id *)&self->_secureElementIdentity, 0);
  objc_storeStrong((id *)&self->_peerID, 0);
  objc_storeStrong((id *)&self->_oldPeerID, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
}

+ (Class)tlkSharesForVouchedIdentityType
{
  return (Class)objc_opt_class(NSData);
}

- (BOOL)saveToKeychainForContainer:(id)a3 contextID:(id)a4 personaAdapter:(id)a5 personaUniqueString:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  _QWORD v20[4];
  id v21;
  id v22;
  OTAccountMetadataClassC *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = sub_1000A1348;
  v29 = sub_1000A1358;
  v30 = 0;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1000A1360;
  v20[3] = &unk_1002DC950;
  v16 = v12;
  v21 = v16;
  v17 = v13;
  v22 = v17;
  v23 = self;
  v24 = &v25;
  objc_msgSend(v14, "performBlockWithPersonaIdentifier:block:", v15, v20);
  v18 = (void *)v26[5];
  if (a7 && v18)
    *a7 = objc_retainAutorelease(v18);

  _Block_object_dispose(&v25, 8);
  return v18 == 0;
}

- (void)setTPSyncingPolicy:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v6 = a3;
  if (v6)
  {
    v4 = objc_msgSend(objc_alloc((Class)NSKeyedArchiver), "initRequiringSecureCoding:", 1);
    objc_msgSend(v6, "encodeWithCoder:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "encodedData"));
    -[OTAccountMetadataClassC setSyncingPolicy:](self, "setSyncingPolicy:", v5);

  }
  else
  {
    -[OTAccountMetadataClassC setSyncingPolicy:](self, "setSyncingPolicy:", 0);
  }

}

- (id)getTPSyncingPolicy
{
  id v3;
  void *v4;
  id v5;
  id v6;

  v3 = objc_alloc((Class)NSKeyedUnarchiver);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[OTAccountMetadataClassC syncingPolicy](self, "syncingPolicy"));
  v5 = objc_msgSend(v3, "initForReadingFromData:error:", v4, 0);

  v6 = objc_msgSend(objc_alloc((Class)TPSyncingPolicy), "initWithCoder:", v5);
  objc_msgSend(v5, "finishDecoding");

  return v6;
}

- (void)setTLKSharesPairedWithVoucher:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v10);
        v12 = objc_alloc((Class)NSKeyedArchiver);
        v13 = objc_msgSend(v12, "initRequiringSecureCoding:", 1, (_QWORD)v15);
        objc_msgSend(v11, "encodeWithCoder:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "encodedData"));
        objc_msgSend(v5, "addObject:", v14);

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  -[OTAccountMetadataClassC setTlkSharesForVouchedIdentitys:](self, "setTlkSharesForVouchedIdentitys:", v5);
}

- (id)getTLKSharesPairedWithVoucher
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  CKKSTLKShare *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[OTAccountMetadataClassC tlkSharesForVouchedIdentitys](self, "tlkSharesForVouchedIdentitys", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = objc_msgSend(objc_alloc((Class)NSKeyedUnarchiver), "initForReadingFromData:error:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v8), 0);
        v10 = -[CKKSTLKShare initWithCoder:]([CKKSTLKShare alloc], "initWithCoder:", v9);
        objc_msgSend(v9, "finishDecoding");
        objc_msgSend(v3, "addObject:", v10);

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  return v3;
}

- (void)setOctagonSecureElementIdentity:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v8 = objc_alloc_init((Class)TPPBSecureElementIdentity);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "peerIdentifier"));
  objc_msgSend(v8, "setPeerIdentifier:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "peerData"));
  objc_msgSend(v8, "setPeerData:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "data"));
  -[OTAccountMetadataClassC setSecureElementIdentity:](self, "setSecureElementIdentity:", v7);

}

- (id)parsedSecureElementIdentity
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[OTAccountMetadataClassC secureElementIdentity](self, "secureElementIdentity"));
  v3 = v2;
  if (v2 && objc_msgSend(v2, "length"))
    v4 = objc_msgSend(objc_alloc((Class)TPPBSecureElementIdentity), "initWithData:", v3);
  else
    v4 = 0;

  return v4;
}

+ (BOOL)deleteFromKeychainForContainer:(id)a3 contextID:(id)a4 personaAdapter:(id)a5 personaUniqueString:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  int v17;
  uint64_t v18;
  void *v19;
  void *v20;
  _QWORD v22[4];
  id v23;
  id v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  int v29;
  NSErrorUserInfoKey v30;
  void *v31;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = -1;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1000A206C;
  v22[3] = &unk_1002EAC48;
  v15 = v11;
  v23 = v15;
  v16 = v12;
  v24 = v16;
  v25 = &v26;
  objc_msgSend(v13, "performBlockWithPersonaIdentifier:block:", v14, v22);
  v17 = *((_DWORD *)v27 + 6);
  v18 = v17;
  if (a7 && v17)
  {
    v30 = NSLocalizedDescriptionKey;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("SecItemDelete: %d"), v17));
    v31 = v19;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1));
    *a7 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSOSStatusErrorDomain, v18, v20));

  }
  _Block_object_dispose(&v26, 8);

  return (_DWORD)v18 == 0;
}

+ (id)loadFromKeychainForContainer:(id)a3 contextID:(id)a4 personaAdapter:(id)a5 personaUniqueString:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  id v26;
  uint64_t *v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = sub_1000A1348;
  v39 = sub_1000A1358;
  v40 = 0;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = sub_1000A1348;
  v33 = sub_1000A1358;
  v34 = 0;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1000A1C20;
  v22[3] = &unk_1002DC978;
  v15 = v11;
  v23 = v15;
  v16 = v12;
  v24 = v16;
  v27 = &v29;
  v28 = &v35;
  v17 = v13;
  v25 = v17;
  v18 = v14;
  v26 = v18;
  objc_msgSend(v17, "performBlockWithPersonaIdentifier:block:", v18, v22);
  if (a7)
  {
    v19 = (void *)v30[5];
    if (v19)
      *a7 = objc_retainAutorelease(v19);
  }
  v20 = (id)v36[5];

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v35, 8);

  return v20;
}

@end
