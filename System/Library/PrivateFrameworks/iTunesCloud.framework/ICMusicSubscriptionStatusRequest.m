@implementation ICMusicSubscriptionStatusRequest

- (id)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  unint64_t carrierBundleProvisioningStyle;
  __CFString *v8;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: %p"), v5, self);

  objc_msgSend(v6, "appendFormat:", CFSTR("; storeRequestContext = %@"), self->_storeRequestContext);
  if (self->_allowsFallbackToExpiredStatus)
    objc_msgSend(v6, "appendString:", CFSTR("; allowsFallbackToExpiredStatus = YES"));
  if (self->_allowsFallbackToStatusNeedingReload)
    objc_msgSend(v6, "appendString:", CFSTR("; allowsFallbackToStatusNeedingReload = YES"));
  carrierBundleProvisioningStyle = self->_carrierBundleProvisioningStyle;
  if (carrierBundleProvisioningStyle > 2)
    v8 = 0;
  else
    v8 = off_1E438CEC0[carrierBundleProvisioningStyle];
  objc_msgSend(v6, "appendFormat:", CFSTR("; carrierBundleProvisioningStyle = %@"), v8);
  if (self->_reason == 1)
    objc_msgSend(v6, "appendFormat:", CFSTR("; reason = %@"), CFSTR("deepLink"));
  if (self->_shouldIgnoreCache)
    objc_msgSend(v6, "appendString:", CFSTR("; shouldIgnoreCache = YES"));
  if (self->_shouldReturnLastKnownStatusOnly)
    objc_msgSend(v6, "appendString:", CFSTR("; shouldReturnLastKnownStatusOnly = YES"));
  if (self->_shouldBypassEnforcementOfPrivacyAcknowledgement)
    objc_msgSend(v6, "appendString:", CFSTR("; shouldBypassEnforcementOfPrivacyAcknowledgement = YES"));
  objc_msgSend(v6, "appendFormat:", CFSTR("; requestIdentifier = %@"), self->_requestIdentifier);
  objc_msgSend(v6, "appendString:", CFSTR(">"));
  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
  objc_storeStrong((id *)&self->_storeRequestContext, 0);
}

- (NSUUID)requestIdentifier
{
  return self->_requestIdentifier;
}

- (void)encodeWithCoder:(id)a3
{
  _BOOL8 allowsFallbackToExpiredStatus;
  id v5;

  allowsFallbackToExpiredStatus = self->_allowsFallbackToExpiredStatus;
  v5 = a3;
  objc_msgSend(v5, "encodeBool:forKey:", allowsFallbackToExpiredStatus, CFSTR("allowsFallbackToExpiredStatus"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_allowsFallbackToStatusNeedingReload, CFSTR("allowsFallbackToStatusNeedingReload"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_carrierBundleProvisioningStyle, CFSTR("carrierBundleProvisioningStyle"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_reason, CFSTR("reason"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_shouldIgnoreCache, CFSTR("shouldIgnoreCache"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_storeRequestContext, CFSTR("storeRequestContext"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_shouldReturnLastKnownStatusOnly, CFSTR("shouldReturnLastKnownStatusOnly"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_shouldBypassEnforcementOfPrivacyAcknowledgement, CFSTR("shouldBypassEnforcementOfPrivacyAcknowledgement"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_requestIdentifier, CFSTR("requestIdentifier"));

}

- (ICMusicSubscriptionStatusRequest)initWithStoreRequestContext:(id)a3
{
  id v4;
  char *v5;
  ICMusicSubscriptionStatusRequest *v6;
  uint64_t v7;
  ICStoreRequestContext *storeRequestContext;
  uint64_t v9;
  NSUUID *requestIdentifier;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ICMusicSubscriptionStatusRequest;
  v5 = -[ICMusicSubscriptionStatusRequest init](&v12, sel_init);
  v6 = (ICMusicSubscriptionStatusRequest *)v5;
  if (v5)
  {
    *(_WORD *)(v5 + 9) = 257;
    *((_QWORD *)v5 + 3) = 0;
    *((_QWORD *)v5 + 4) = 0;
    v7 = objc_msgSend(v4, "copy");
    storeRequestContext = v6->_storeRequestContext;
    v6->_storeRequestContext = (ICStoreRequestContext *)v7;

    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v9 = objc_claimAutoreleasedReturnValue();
    requestIdentifier = v6->_requestIdentifier;
    v6->_requestIdentifier = (NSUUID *)v9;

  }
  return v6;
}

- (void)setAllowsFallbackToStatusNeedingReload:(BOOL)a3
{
  self->_allowsFallbackToStatusNeedingReload = a3;
}

- (void)setAllowsFallbackToExpiredStatus:(BOOL)a3
{
  self->_allowsFallbackToExpiredStatus = a3;
}

- (void)setCarrierBundleProvisioningStyle:(int64_t)a3
{
  self->_carrierBundleProvisioningStyle = a3;
}

- (void)setShouldReturnLastKnownStatusOnly:(BOOL)a3
{
  self->_shouldReturnLastKnownStatusOnly = a3;
}

- (BOOL)shouldBypassEnforcementOfPrivacyAcknowledgement
{
  return self->_shouldBypassEnforcementOfPrivacyAcknowledgement;
}

- (ICStoreRequestContext)storeRequestContext
{
  return self->_storeRequestContext;
}

- (BOOL)shouldReturnLastKnownStatusOnly
{
  return self->_shouldReturnLastKnownStatusOnly;
}

- (BOOL)allowsFallbackToStatusNeedingReload
{
  return self->_allowsFallbackToStatusNeedingReload;
}

- (BOOL)allowsFallbackToExpiredStatus
{
  return self->_allowsFallbackToExpiredStatus;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithStoreRequestContext:", self->_storeRequestContext);
  if (result)
  {
    *((_BYTE *)result + 9) = self->_allowsFallbackToExpiredStatus;
    *((_BYTE *)result + 10) = self->_allowsFallbackToStatusNeedingReload;
    *((_QWORD *)result + 4) = self->_carrierBundleProvisioningStyle;
    *((_QWORD *)result + 3) = self->_reason;
    *((_BYTE *)result + 8) = self->_shouldIgnoreCache;
    *((_BYTE *)result + 11) = self->_shouldReturnLastKnownStatusOnly;
    *((_BYTE *)result + 12) = self->_shouldBypassEnforcementOfPrivacyAcknowledgement;
  }
  return result;
}

- (ICMusicSubscriptionStatusRequest)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  ICMusicSubscriptionStatusRequest *v6;
  uint64_t v7;
  NSUUID *requestIdentifier;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("storeRequestContext"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[ICMusicSubscriptionStatusRequest initWithStoreRequestContext:](self, "initWithStoreRequestContext:", v5);
  if (v6)
  {
    v6->_allowsFallbackToExpiredStatus = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("allowsFallbackToExpiredStatus"));
    v6->_allowsFallbackToStatusNeedingReload = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("allowsFallbackToStatusNeedingReload"));
    v6->_carrierBundleProvisioningStyle = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("carrierBundleProvisioningStyle"));
    v6->_reason = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("reason"));
    v6->_shouldIgnoreCache = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shouldIgnoreCache"));
    v6->_shouldReturnLastKnownStatusOnly = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shouldReturnLastKnownStatusOnly"));
    v6->_shouldBypassEnforcementOfPrivacyAcknowledgement = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shouldBypassEnforcementOfPrivacyAcknowledgement"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("requestIdentifier"));
    v7 = objc_claimAutoreleasedReturnValue();
    requestIdentifier = v6->_requestIdentifier;
    v6->_requestIdentifier = (NSUUID *)v7;

  }
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)shouldIgnoreCache
{
  return self->_shouldIgnoreCache;
}

- (void)setShouldIgnoreCache:(BOOL)a3
{
  self->_shouldIgnoreCache = a3;
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
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  ICStoreRequestContext *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t allowsFallbackToStatusNeedingReload;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  int64_t carrierBundleProvisioningStyle;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
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
  int64_t reason;
  unint64_t v52;
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
  uint64_t shouldIgnoreCache;
  unint64_t v67;
  unint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t shouldReturnLastKnownStatusOnly;
  unint64_t v77;
  unint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t shouldBypassEnforcementOfPrivacyAcknowledgement;
  unint64_t v87;
  unint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  unint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
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
  _BOOL8 v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  _BOOL8 v148;
  void *v149;
  void *v150;
  _BOOL8 v151;
  int64_t v152;
  int64_t v153;
  _BOOL8 v154;
  _BOOL8 v155;
  _BOOL8 v156;
  int64_t v157;
  int64_t v158;
  _BOOL8 v159;
  _BOOL8 v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  unint64_t v177;
  unint64_t v178;
  unint64_t v179;
  unint64_t v180;
  unint64_t v181;

  v3 = MSVHasherSharedSeed();
  v5 = v4;
  v6 = v3 ^ 0x736F6D6570736575;
  v7 = v4 ^ 0x646F72616E646F6DLL;
  v8 = v3 ^ 0x6C7967656E657261;
  v9 = (objc_class *)objc_opt_class();
  NSStringFromClass(v9);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hash");
  v12 = v5 ^ 0x7465646279746573 ^ v11;
  v13 = (v6 + v7) ^ __ROR8__(v7, 51);
  v14 = v8 + v12;
  v15 = (v8 + v12) ^ __ROR8__(v12, 48);
  v16 = v15 + __ROR8__(v6 + v7, 32);
  v168 = __ROR8__(v14 + v13, 32);
  v172 = v16 ^ __ROR8__(v15, 43);
  v17 = v16 ^ v11;
  v164 = (v14 + v13) ^ __ROR8__(v13, 47);

  v18 = self->_storeRequestContext;
  v19 = -[ICStoreRequestContext hash](v18, "hash");
  v20 = (v17 + v164) ^ __ROR8__(v164, 51);
  v21 = v168 + (v172 ^ v19);
  v22 = __ROR8__(v172 ^ v19, 48);
  v23 = (v21 ^ v22) + __ROR8__(v17 + v164, 32);
  v24 = v23 ^ __ROR8__(v21 ^ v22, 43);
  v25 = v21 + v20;
  v169 = __ROR8__(v25, 32);
  v173 = v24;
  v161 = v23 ^ v19;
  v165 = v25 ^ __ROR8__(v20, 47);

  v176 = (self->_allowsFallbackToExpiredStatus | 0x1000000000000000) + 0x400000000000000;
  allowsFallbackToStatusNeedingReload = self->_allowsFallbackToStatusNeedingReload;
  v27 = v176;
  if ((v176 & 0x400000000000000) != 0)
  {
    if ((v176 & 0x300000000000000) != 0)
    {
      v156 = self->_allowsFallbackToStatusNeedingReload;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v138 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _MSVHasher_SipHash_1_3_Append32(MSVHasherSipHash_1_3 *, uint32_t)");
      v139 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v138, "handleFailureInFunction:file:lineNumber:description:", v139, CFSTR("MSVHasher+SipHash.h"), 91, CFSTR("_MSVHasher_SipHash_1_3_Append32: invalid byte count detected [byteCount & 3]: %lld"), v176);

      allowsFallbackToStatusNeedingReload = v156;
      v27 = v176;
    }
    v29 = v27 & 0xFFFFFFFFFFFFFFLL | (allowsFallbackToStatusNeedingReload << 32);
    v30 = (v161 + v165) ^ __ROR8__(v165, 51);
    v31 = v169 + (v29 ^ v173);
    v32 = __ROR8__(v29 ^ v173, 48);
    v33 = (v31 ^ v32) + __ROR8__(v161 + v165, 32);
    v34 = v33 ^ __ROR8__(v31 ^ v32, 43);
    v35 = v31 + v30;
    v169 = __ROR8__(v35, 32);
    v173 = v34;
    v161 = v33 ^ v29;
    v165 = v35 ^ __ROR8__(v30, 47);
    v28 = v27 & 0xFF00000000000000;
  }
  else
  {
    if ((v176 & 0x7FFFFFFFFFFFFFFLL) != 0)
    {
      v151 = self->_allowsFallbackToStatusNeedingReload;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v125 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _MSVHasher_SipHash_1_3_Append32(MSVHasherSipHash_1_3 *, uint32_t)");
      v126 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v125, "handleFailureInFunction:file:lineNumber:description:", v126, CFSTR("MSVHasher+SipHash.h"), 88, CFSTR("_MSVHasher_SipHash_1_3_Append32: invalid byte count detected [byteCount & 7, tail == 0]: %lld"), v176);

      allowsFallbackToStatusNeedingReload = v151;
      v27 = v176;
    }
    v28 = v27 | allowsFallbackToStatusNeedingReload;
  }
  v177 = v28 + 0x400000000000000;
  carrierBundleProvisioningStyle = self->_carrierBundleProvisioningStyle;
  v37 = v177;
  if ((v177 & 0x400000000000000) != 0)
  {
    if ((v177 & 0x300000000000000) != 0)
    {
      v157 = self->_carrierBundleProvisioningStyle;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v140 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _MSVHasher_SipHash_1_3_Append64(MSVHasherSipHash_1_3 *, uint64_t)");
      v141 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v140, "handleFailureInFunction:file:lineNumber:description:", v141, CFSTR("MSVHasher+SipHash.h"), 105, CFSTR("_MSVHasher_SipHash_1_3_Append64: invalid byte count detected [byteCount & 3]: %lld"), v177);

      carrierBundleProvisioningStyle = v157;
      v37 = v177;
    }
    v44 = v37 & 0xFFFFFFFFFFFFFFLL | (carrierBundleProvisioningStyle << 32);
    v45 = (v161 + v165) ^ __ROR8__(v165, 51);
    v46 = v169 + (v44 ^ v173);
    v47 = __ROR8__(v44 ^ v173, 48);
    v48 = (v46 ^ v47) + __ROR8__(v161 + v165, 32);
    v49 = v48 ^ __ROR8__(v46 ^ v47, 43);
    v50 = v46 + v45;
    v170 = __ROR8__(v50, 32);
    v174 = v49;
    v162 = v48 ^ v44;
    v166 = v50 ^ __ROR8__(v45, 47);
    v37 = v37 & 0xFF00000000000000 | HIDWORD(carrierBundleProvisioningStyle);
  }
  else
  {
    if ((v177 & 0x7FFFFFFFFFFFFFFLL) != 0)
    {
      v152 = self->_carrierBundleProvisioningStyle;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v127 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _MSVHasher_SipHash_1_3_Append64(MSVHasherSipHash_1_3 *, uint64_t)");
      v128 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v127, "handleFailureInFunction:file:lineNumber:description:", v128, CFSTR("MSVHasher+SipHash.h"), 101, CFSTR("_MSVHasher_SipHash_1_3_Append64: invalid byte count detected [byteCount & 7, tail == 0]: %lld"), v177);

      carrierBundleProvisioningStyle = v152;
      v37 = v177;
    }
    v38 = (v161 + v165) ^ __ROR8__(v165, 51);
    v39 = v169 + (v173 ^ carrierBundleProvisioningStyle);
    v40 = __ROR8__(v173 ^ carrierBundleProvisioningStyle, 48);
    v41 = (v39 ^ v40) + __ROR8__(v161 + v165, 32);
    v42 = v41 ^ __ROR8__(v39 ^ v40, 43);
    v43 = v39 + v38;
    v170 = __ROR8__(v43, 32);
    v174 = v42;
    v162 = v41 ^ carrierBundleProvisioningStyle;
    v166 = v43 ^ __ROR8__(v38, 47);
  }
  reason = self->_reason;
  v52 = v37 + 0x800000000000000;
  v178 = v52;
  if ((v52 & 0x400000000000000) != 0)
  {
    if ((v52 & 0x300000000000000) != 0)
    {
      v158 = self->_reason;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v142 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _MSVHasher_SipHash_1_3_Append64(MSVHasherSipHash_1_3 *, uint64_t)");
      v143 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v142, "handleFailureInFunction:file:lineNumber:description:", v143, CFSTR("MSVHasher+SipHash.h"), 105, CFSTR("_MSVHasher_SipHash_1_3_Append64: invalid byte count detected [byteCount & 3]: %lld"), v178);

      reason = v158;
      v52 = v178;
    }
    v59 = v52 & 0xFFFFFFFFFFFFFFLL | (reason << 32);
    v60 = (v162 + v166) ^ __ROR8__(v166, 51);
    v61 = v170 + (v59 ^ v174);
    v62 = __ROR8__(v59 ^ v174, 48);
    v63 = (v61 ^ v62) + __ROR8__(v162 + v166, 32);
    v64 = v63 ^ __ROR8__(v61 ^ v62, 43);
    v65 = v61 + v60;
    v171 = __ROR8__(v65, 32);
    v175 = v64;
    v163 = v63 ^ v59;
    v167 = v65 ^ __ROR8__(v60, 47);
    v52 = v52 & 0xFF00000000000000 | HIDWORD(reason);
  }
  else
  {
    if ((v52 & 0x7FFFFFFFFFFFFFFLL) != 0)
    {
      v153 = self->_reason;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v129 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _MSVHasher_SipHash_1_3_Append64(MSVHasherSipHash_1_3 *, uint64_t)");
      v130 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v129, "handleFailureInFunction:file:lineNumber:description:", v130, CFSTR("MSVHasher+SipHash.h"), 101, CFSTR("_MSVHasher_SipHash_1_3_Append64: invalid byte count detected [byteCount & 7, tail == 0]: %lld"), v178);

      reason = v153;
      v52 = v178;
    }
    v53 = (v162 + v166) ^ __ROR8__(v166, 51);
    v54 = v170 + (v174 ^ reason);
    v55 = __ROR8__(v174 ^ reason, 48);
    v56 = (v54 ^ v55) + __ROR8__(v162 + v166, 32);
    v57 = v56 ^ __ROR8__(v54 ^ v55, 43);
    v58 = v54 + v53;
    v171 = __ROR8__(v58, 32);
    v175 = v57;
    v163 = v56 ^ reason;
    v167 = v58 ^ __ROR8__(v53, 47);
  }
  v179 = v52 + 0x800000000000000;
  shouldIgnoreCache = self->_shouldIgnoreCache;
  v67 = v179;
  if ((v179 & 0x400000000000000) != 0)
  {
    if ((v179 & 0x300000000000000) != 0)
    {
      v159 = self->_shouldIgnoreCache;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v144 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _MSVHasher_SipHash_1_3_Append32(MSVHasherSipHash_1_3 *, uint32_t)");
      v145 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v144, "handleFailureInFunction:file:lineNumber:description:", v145, CFSTR("MSVHasher+SipHash.h"), 91, CFSTR("_MSVHasher_SipHash_1_3_Append32: invalid byte count detected [byteCount & 3]: %lld"), v179);

      shouldIgnoreCache = v159;
      v67 = v179;
    }
    v69 = v67 & 0xFFFFFFFFFFFFFFLL | (shouldIgnoreCache << 32);
    v70 = (v163 + v167) ^ __ROR8__(v167, 51);
    v71 = v171 + (v69 ^ v175);
    v72 = __ROR8__(v69 ^ v175, 48);
    v73 = (v71 ^ v72) + __ROR8__(v163 + v167, 32);
    v74 = v73 ^ __ROR8__(v71 ^ v72, 43);
    v75 = v71 + v70;
    v171 = __ROR8__(v75, 32);
    v175 = v74;
    v163 = v73 ^ v69;
    v167 = v75 ^ __ROR8__(v70, 47);
    v68 = v67 & 0xFF00000000000000;
  }
  else
  {
    if ((v179 & 0x7FFFFFFFFFFFFFFLL) != 0)
    {
      v154 = self->_shouldIgnoreCache;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v131 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _MSVHasher_SipHash_1_3_Append32(MSVHasherSipHash_1_3 *, uint32_t)");
      v132 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v131, "handleFailureInFunction:file:lineNumber:description:", v132, CFSTR("MSVHasher+SipHash.h"), 88, CFSTR("_MSVHasher_SipHash_1_3_Append32: invalid byte count detected [byteCount & 7, tail == 0]: %lld"), v179);

      shouldIgnoreCache = v154;
      v67 = v179;
    }
    v68 = v67 | shouldIgnoreCache;
  }
  shouldReturnLastKnownStatusOnly = self->_shouldReturnLastKnownStatusOnly;
  v77 = v68 + 0x400000000000000;
  v180 = v77;
  if ((v77 & 0x400000000000000) != 0)
  {
    if ((v77 & 0x300000000000000) != 0)
    {
      v160 = self->_shouldReturnLastKnownStatusOnly;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v146 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _MSVHasher_SipHash_1_3_Append32(MSVHasherSipHash_1_3 *, uint32_t)");
      v147 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v146, "handleFailureInFunction:file:lineNumber:description:", v147, CFSTR("MSVHasher+SipHash.h"), 91, CFSTR("_MSVHasher_SipHash_1_3_Append32: invalid byte count detected [byteCount & 3]: %lld"), v180);

      shouldReturnLastKnownStatusOnly = v160;
      v77 = v180;
    }
    v79 = v77 & 0xFFFFFFFFFFFFFFLL | (shouldReturnLastKnownStatusOnly << 32);
    v80 = (v163 + v167) ^ __ROR8__(v167, 51);
    v81 = v171 + (v79 ^ v175);
    v82 = __ROR8__(v79 ^ v175, 48);
    v83 = (v81 ^ v82) + __ROR8__(v163 + v167, 32);
    v84 = v83 ^ __ROR8__(v81 ^ v82, 43);
    v85 = v81 + v80;
    v171 = __ROR8__(v85, 32);
    v175 = v84;
    v163 = v83 ^ v79;
    v167 = v85 ^ __ROR8__(v80, 47);
    v78 = v77 & 0xFF00000000000000;
  }
  else
  {
    if ((v77 & 0x7FFFFFFFFFFFFFFLL) != 0)
    {
      v155 = self->_shouldReturnLastKnownStatusOnly;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v133 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _MSVHasher_SipHash_1_3_Append32(MSVHasherSipHash_1_3 *, uint32_t)");
      v134 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v133, "handleFailureInFunction:file:lineNumber:description:", v134, CFSTR("MSVHasher+SipHash.h"), 88, CFSTR("_MSVHasher_SipHash_1_3_Append32: invalid byte count detected [byteCount & 7, tail == 0]: %lld"), v180);

      shouldReturnLastKnownStatusOnly = v155;
      v77 = v180;
    }
    v78 = v77 | shouldReturnLastKnownStatusOnly;
  }
  shouldBypassEnforcementOfPrivacyAcknowledgement = self->_shouldBypassEnforcementOfPrivacyAcknowledgement;
  v87 = v78 + 0x400000000000000;
  v181 = v87;
  if ((v87 & 0x400000000000000) != 0)
  {
    if ((v87 & 0x300000000000000) != 0)
    {
      v148 = self->_shouldBypassEnforcementOfPrivacyAcknowledgement;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v149 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _MSVHasher_SipHash_1_3_Append32(MSVHasherSipHash_1_3 *, uint32_t)");
      v150 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v149, "handleFailureInFunction:file:lineNumber:description:", v150, CFSTR("MSVHasher+SipHash.h"), 91, CFSTR("_MSVHasher_SipHash_1_3_Append32: invalid byte count detected [byteCount & 3]: %lld"), v181);

      shouldBypassEnforcementOfPrivacyAcknowledgement = v148;
      v87 = v181;
    }
    v89 = v87 & 0xFFFFFFFFFFFFFFLL | (shouldBypassEnforcementOfPrivacyAcknowledgement << 32);
    v90 = (v163 + v167) ^ __ROR8__(v167, 51);
    v91 = v171 + (v89 ^ v175);
    v92 = __ROR8__(v89 ^ v175, 48);
    v93 = (v91 ^ v92) + __ROR8__(v163 + v167, 32);
    v94 = v93 ^ __ROR8__(v91 ^ v92, 43);
    v95 = v91 + v90;
    v171 = __ROR8__(v95, 32);
    v175 = v94;
    v163 = v93 ^ v89;
    v167 = v95 ^ __ROR8__(v90, 47);
    v88 = v87 & 0xFF00000000000000;
  }
  else
  {
    if ((v87 & 0x7FFFFFFFFFFFFFFLL) != 0)
    {
      v135 = self->_shouldBypassEnforcementOfPrivacyAcknowledgement;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v136 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _MSVHasher_SipHash_1_3_Append32(MSVHasherSipHash_1_3 *, uint32_t)");
      v137 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v136, "handleFailureInFunction:file:lineNumber:description:", v137, CFSTR("MSVHasher+SipHash.h"), 88, CFSTR("_MSVHasher_SipHash_1_3_Append32: invalid byte count detected [byteCount & 7, tail == 0]: %lld"), v181);

      shouldBypassEnforcementOfPrivacyAcknowledgement = v135;
      v87 = v181;
    }
    v88 = v87 | shouldBypassEnforcementOfPrivacyAcknowledgement;
  }
  v96 = (v163 + v167) ^ __ROR8__(v167, 51);
  v97 = v171 + (v175 ^ (v88 + 0x400000000000000));
  v98 = __ROR8__(v175 ^ (v88 + 0x400000000000000), 48);
  v99 = (v97 ^ v98) + __ROR8__(v163 + v167, 32);
  v100 = v99 ^ __ROR8__(v97 ^ v98, 43);
  v101 = v97 + v96;
  v102 = v101 ^ __ROR8__(v96, 47);
  v103 = (v99 ^ (v88 + 0x400000000000000)) + v102;
  v104 = v103 ^ __ROR8__(v102, 51);
  v105 = (__ROR8__(v101, 32) ^ 0xFFLL) + v100;
  v106 = __ROR8__(v100, 48);
  v107 = __ROR8__(v103, 32) + (v105 ^ v106);
  v108 = v107 ^ __ROR8__(v105 ^ v106, 43);
  v109 = v104 + v105;
  v110 = v109 ^ __ROR8__(v104, 47);
  v111 = v110 + v107;
  v112 = v111 ^ __ROR8__(v110, 51);
  v113 = __ROR8__(v109, 32) + v108;
  v114 = __ROR8__(v108, 48);
  v115 = __ROR8__(v111, 32) + (v113 ^ v114);
  v116 = v115 ^ __ROR8__(v113 ^ v114, 43);
  v117 = v112 + v113;
  v118 = v117 ^ __ROR8__(v112, 47);
  v119 = v118 + v115;
  v120 = v119 ^ __ROR8__(v118, 51);
  v121 = __ROR8__(v117, 32) + v116;
  v122 = __ROR8__(v116, 48);
  v123 = __ROR8__(v119, 32) + (v121 ^ v122);
  return (v120 + v121) ^ __ROR8__(v120, 47) ^ v123 ^ __ROR8__(v120 + v121, 32) ^ v123 ^ __ROR8__(v121 ^ v122, 43);
}

- (BOOL)isEqual:(id)a3
{
  ICMusicSubscriptionStatusRequest *v4;
  ICMusicSubscriptionStatusRequest *v5;
  ICStoreRequestContext *storeRequestContext;
  ICStoreRequestContext *v7;
  ICStoreRequestContext *v8;
  ICStoreRequestContext *v9;
  _BOOL4 v10;
  BOOL v11;

  v4 = (ICMusicSubscriptionStatusRequest *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    if (-[ICMusicSubscriptionStatusRequest isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
    {
      v5 = v4;
      storeRequestContext = self->_storeRequestContext;
      v7 = v5->_storeRequestContext;
      if (storeRequestContext == v7)
      {

      }
      else
      {
        v8 = v7;
        v9 = storeRequestContext;
        v10 = -[ICStoreRequestContext isEqual:](v9, "isEqual:", v8);

        if (!v10)
          goto LABEL_16;
      }
      if (!self->_allowsFallbackToExpiredStatus != v5->_allowsFallbackToExpiredStatus
        && !self->_allowsFallbackToStatusNeedingReload != v5->_allowsFallbackToStatusNeedingReload
        && self->_carrierBundleProvisioningStyle == v5->_carrierBundleProvisioningStyle
        && self->_reason == v5->_reason
        && !self->_shouldIgnoreCache != v5->_shouldIgnoreCache
        && !self->_shouldReturnLastKnownStatusOnly != v5->_shouldReturnLastKnownStatusOnly)
      {
        v11 = !self->_shouldBypassEnforcementOfPrivacyAcknowledgement ^ v5->_shouldBypassEnforcementOfPrivacyAcknowledgement;
LABEL_17:

        goto LABEL_18;
      }
LABEL_16:
      v11 = 0;
      goto LABEL_17;
    }
    v11 = 0;
  }
LABEL_18:

  return v11;
}

- (void)setStoreRequestContext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int64_t)reason
{
  return self->_reason;
}

- (void)setReason:(int64_t)a3
{
  self->_reason = a3;
}

- (int64_t)carrierBundleProvisioningStyle
{
  return self->_carrierBundleProvisioningStyle;
}

- (void)setShouldBypassEnforcementOfPrivacyAcknowledgement:(BOOL)a3
{
  self->_shouldBypassEnforcementOfPrivacyAcknowledgement = a3;
}

@end
