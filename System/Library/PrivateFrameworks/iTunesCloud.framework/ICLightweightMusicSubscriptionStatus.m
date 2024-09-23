@implementation ICLightweightMusicSubscriptionStatus

- (id)_initWithExtendedSubscriptionStatus:(id)a3
{
  id v4;
  ICLightweightMusicSubscriptionStatus *v5;
  void *v6;
  uint64_t v7;
  NSArray *eligibleOffers;
  uint64_t v9;
  NSDate *expirationDate;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ICLightweightMusicSubscriptionStatus;
  v5 = -[ICLightweightMusicSubscriptionStatus init](&v12, sel_init);
  if (v5)
  {
    v5->_statusType = objc_msgSend(v4, "statusType");
    v5->_reasonType = objc_msgSend(v4, "reasonType");
    objc_msgSend(v4, "eligibleOffers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    eligibleOffers = v5->_eligibleOffers;
    v5->_eligibleOffers = (NSArray *)v7;

    objc_msgSend(v4, "expirationDate");
    v9 = objc_claimAutoreleasedReturnValue();
    expirationDate = v5->_expirationDate;
    v5->_expirationDate = (NSDate *)v9;

  }
  return v5;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  objc_class *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int64_t statusType;
  int64_t reasonType;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int64_t v26;
  int64_t v27;
  uint64_t v28;
  int64_t v29;
  int64_t v30;
  int64_t v31;
  NSArray *v32;
  uint64_t v33;
  int64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  NSDate *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  int64_t v77;
  int64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  int64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;

  v3 = MSVHasherSharedSeed();
  v5 = v4;
  v6 = v3 ^ 0x736F6D6570736575;
  v7 = v4 ^ 0x646F72616E646F6DLL;
  v8 = v3 ^ 0x6C7967656E657261;
  v9 = (objc_class *)objc_opt_class();
  NSStringFromClass(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hash");
  v12 = v5 ^ 0x7465646279746573 ^ v11;
  v13 = (v6 + v7) ^ __ROR8__(v7, 51);
  v14 = v8 + v12;
  v15 = (v8 + v12) ^ __ROR8__(v12, 48);
  v16 = v15 + __ROR8__(v6 + v7, 32);
  v86 = __ROR8__(v14 + v13, 32);
  v90 = v16 ^ __ROR8__(v15, 43);
  v17 = v16 ^ v11;
  v81 = (v14 + v13) ^ __ROR8__(v13, 47);

  statusType = self->_statusType;
  reasonType = self->_reasonType;
  v20 = (v17 + v81) ^ __ROR8__(v81, 51);
  v21 = v86 + (v90 ^ statusType);
  v22 = __ROR8__(v90 ^ statusType, 48);
  v23 = (v21 ^ v22) + __ROR8__(v17 + v81, 32);
  v24 = v23 ^ __ROR8__(v21 ^ v22, 43);
  v25 = v21 + v20;
  v77 = v23 ^ statusType;
  v82 = v25 ^ __ROR8__(v20, 47);
  v26 = ((v23 ^ statusType) + v82) ^ __ROR8__(v82, 51);
  v27 = __ROR8__(v25, 32) + (v24 ^ reasonType);
  v28 = __ROR8__(v24 ^ reasonType, 48);
  v29 = (v27 ^ v28) + __ROR8__(v77 + v82, 32);
  v30 = v29 ^ __ROR8__(v27 ^ v28, 43);
  v31 = v27 + v26;
  v87 = __ROR8__(v31, 32);
  v91 = v30;
  v78 = v29 ^ reasonType;
  v83 = v31 ^ __ROR8__(v26, 47);
  v32 = self->_eligibleOffers;
  v33 = -[NSArray hash](v32, "hash");
  v34 = (v78 + v83) ^ __ROR8__(v83, 51);
  v35 = v87 + (v91 ^ v33);
  v36 = __ROR8__(v91 ^ v33, 48);
  v37 = (v35 ^ v36) + __ROR8__(v78 + v83, 32);
  v38 = v37 ^ __ROR8__(v35 ^ v36, 43);
  v39 = v35 + v34;
  v88 = __ROR8__(v39, 32);
  v92 = v38;
  v79 = v37 ^ v33;
  v84 = v39 ^ __ROR8__(v34, 47);

  v40 = self->_expirationDate;
  v41 = -[NSDate hash](v40, "hash");
  v42 = (v79 + v84) ^ __ROR8__(v84, 51);
  v43 = v88 + (v92 ^ v41);
  v44 = __ROR8__(v92 ^ v41, 48);
  v45 = (v43 ^ v44) + __ROR8__(v79 + v84, 32);
  v46 = v45 ^ __ROR8__(v43 ^ v44, 43);
  v47 = v43 + v42;
  v89 = __ROR8__(v47, 32);
  v93 = v46;
  v80 = v45 ^ v41;
  v85 = v47 ^ __ROR8__(v42, 47);

  v48 = (v80 + v85) ^ __ROR8__(v85, 51);
  v49 = v89 + (v93 ^ 0x2800000000000000);
  v50 = __ROR8__(v93 ^ 0x2800000000000000, 48);
  v51 = (v49 ^ v50) + __ROR8__(v80 + v85, 32);
  v52 = v51 ^ __ROR8__(v49 ^ v50, 43);
  v53 = v49 + v48;
  v54 = v53 ^ __ROR8__(v48, 47);
  v55 = (v51 ^ 0x2800000000000000) + v54;
  v56 = v55 ^ __ROR8__(v54, 51);
  v57 = (__ROR8__(v53, 32) ^ 0xFFLL) + v52;
  v58 = __ROR8__(v52, 48);
  v59 = __ROR8__(v55, 32) + (v57 ^ v58);
  v60 = v59 ^ __ROR8__(v57 ^ v58, 43);
  v61 = v56 + v57;
  v62 = v61 ^ __ROR8__(v56, 47);
  v63 = v62 + v59;
  v64 = v63 ^ __ROR8__(v62, 51);
  v65 = __ROR8__(v61, 32) + v60;
  v66 = __ROR8__(v60, 48);
  v67 = __ROR8__(v63, 32) + (v65 ^ v66);
  v68 = v67 ^ __ROR8__(v65 ^ v66, 43);
  v69 = v64 + v65;
  v70 = v69 ^ __ROR8__(v64, 47);
  v71 = v70 + v67;
  v72 = v71 ^ __ROR8__(v70, 51);
  v73 = __ROR8__(v69, 32) + v68;
  v74 = __ROR8__(v68, 48);
  v75 = __ROR8__(v71, 32) + (v73 ^ v74);
  return (v72 + v73) ^ __ROR8__(v72, 47) ^ v75 ^ __ROR8__(v72 + v73, 32) ^ v75 ^ __ROR8__(v73 ^ v74, 43);
}

- (BOOL)isEqual:(id)a3
{
  ICLightweightMusicSubscriptionStatus *v4;
  ICLightweightMusicSubscriptionStatus *v5;
  ICLightweightMusicSubscriptionStatus *v6;
  NSArray *eligibleOffers;
  NSArray *v8;
  NSArray *v9;
  NSArray *v10;
  int v11;
  char v12;
  NSDate *expirationDate;
  NSDate *v15;
  NSDate *v16;
  NSDate *v17;

  v4 = (ICLightweightMusicSubscriptionStatus *)a3;
  if (self == v4)
  {
    v12 = 1;
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v12 = 0;
    goto LABEL_11;
  }
  v5 = v4;
  v6 = v5;
  if (self->_statusType != v5->_statusType || self->_reasonType != v5->_reasonType)
    goto LABEL_7;
  eligibleOffers = self->_eligibleOffers;
  v8 = v5->_eligibleOffers;
  if (eligibleOffers == v8)
  {

    goto LABEL_13;
  }
  v9 = v8;
  v10 = eligibleOffers;
  v11 = -[NSArray isEqual:](v10, "isEqual:", v9);

  if (v11)
  {
LABEL_13:
    expirationDate = self->_expirationDate;
    v15 = v6->_expirationDate;
    v16 = expirationDate;
    v17 = v16;
    if (v16 == v15)
      v12 = 1;
    else
      v12 = -[NSDate isEqual:](v16, "isEqual:", v15);

    goto LABEL_8;
  }
LABEL_7:
  v12 = 0;
LABEL_8:

LABEL_11:
  return v12;
}

- (ICLightweightMusicSubscriptionStatus)initWithCoder:(id)a3
{
  id v4;
  ICLightweightMusicSubscriptionStatus *v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSArray *eligibleOffers;
  uint64_t v14;
  NSDate *expirationDate;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)ICLightweightMusicSubscriptionStatus;
  v5 = -[ICLightweightMusicSubscriptionStatus init](&v17, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("statusType"));
    if (v6 >= 4)
      v7 = 0;
    else
      v7 = v6;
    v5->_statusType = v7;
    v5->_reasonType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("reasonType"));
    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("eligibleOffers"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "copy");
    eligibleOffers = v5->_eligibleOffers;
    v5->_eligibleOffers = (NSArray *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("expirationDate"));
    v14 = objc_claimAutoreleasedReturnValue();
    expirationDate = v5->_expirationDate;
    v5->_expirationDate = (NSDate *)v14;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t statusType;
  id v5;

  statusType = self->_statusType;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", statusType, CFSTR("statusType"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_reasonType, CFSTR("reasonType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_eligibleOffers, CFSTR("eligibleOffers"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_expirationDate, CFSTR("expirationDate"));

}

- (id)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  unint64_t statusType;
  __CFString *v8;
  __CFString *v9;
  unint64_t reasonType;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  void *v14;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: %p"), v5, self);

  statusType = self->_statusType;
  if (statusType > 3)
    v8 = 0;
  else
    v8 = off_1E43914F0[statusType];
  v9 = v8;
  objc_msgSend(v6, "appendFormat:", CFSTR("; statusType = %@"), v9);
  reasonType = self->_reasonType;
  if (reasonType > 4)
    v11 = 0;
  else
    v11 = off_1E4391510[reasonType];
  v12 = v11;
  objc_msgSend(v6, "appendFormat:", CFSTR("; reasonType = %@"), v12);
  ICMusicSubscriptionStatusCapabilitiesGetDescription(-[ICLightweightMusicSubscriptionStatus capabilities](self, "capabilities"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("; capabilities = %@"), v13);
  if (-[NSArray count](self->_eligibleOffers, "count"))
  {
    -[NSArray componentsJoinedByString:](self->_eligibleOffers, "componentsJoinedByString:", CFSTR(","));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR("; eligibleOffers = [%@]"), v14);

  }
  objc_msgSend(v6, "appendString:", CFSTR(">"));

  return v6;
}

- (unint64_t)capabilities
{
  return +[ICMusicSubscriptionStatus _capabilitiesForStatusType:carrierBundlingStatusType:isMatchEnabled:](ICMusicSubscriptionStatus, "_capabilitiesForStatusType:carrierBundlingStatusType:isMatchEnabled:", self->_statusType, 0, 0);
}

- (BOOL)hasCapability:(unint64_t)a3
{
  return (a3 & ~-[ICLightweightMusicSubscriptionStatus capabilities](self, "capabilities")) == 0;
}

- (int64_t)statusType
{
  return self->_statusType;
}

- (int64_t)reasonType
{
  return self->_reasonType;
}

- (NSArray)eligibleOffers
{
  return self->_eligibleOffers;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_eligibleOffers, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
