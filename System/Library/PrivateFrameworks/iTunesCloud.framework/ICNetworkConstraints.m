@implementation ICNetworkConstraints

- (BOOL)shouldAllowDataForCellularNetworkTypes
{
  return self->_cellularDataAllowedFallbackValue;
}

- (ICNetworkConstraints)init
{
  ICNetworkConstraints *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ICNetworkConstraints;
  result = -[ICNetworkConstraints init](&v3, sel_init);
  if (result)
  {
    *(_WORD *)&result->_dataAllowedFallbackValue = 257;
    result->_wiFiDataAllowedFallbackValue = 1;
  }
  return result;
}

- (ICNetworkConstraints)initWithBundleIdentifier:(id)a3
{
  id v4;
  ICNetworkConstraints *v5;
  uint64_t v6;
  const void *v7;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[ICNetworkConstraints init](self, "init");
  if (v5)
  {
    v6 = _CTServerConnectionCreateOnTargetQueue();
    if (v6)
    {
      v7 = (const void *)v6;
      _CTServerConnectionCopyCellularUsagePolicy();
      CFRelease(v7);
    }
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkTypeToSizeLimit, 0);
  objc_storeStrong((id *)&self->_networkTypeToDataAllowed, 0);
}

+ (id)constraintsForSystemApplicationType:(int64_t)a3
{
  void *v3;
  ICNetworkConstraints *v4;

  ICBundleIdentifierForSystemApplicationType(a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[ICNetworkConstraints initWithBundleIdentifier:]([ICNetworkConstraints alloc], "initWithBundleIdentifier:", v3);

  return v4;
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
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t wiFiDataAllowedFallbackValue;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSMutableDictionary *v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  NSMutableDictionary *v51;
  uint64_t v52;
  unint64_t v53;
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
  unint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
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
  uint64_t v94;
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
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  unint64_t v111;
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
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  unint64_t v127;
  unint64_t v128;
  unint64_t v129;
  unint64_t v130;

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
  v17 = v14 + v13;
  v118 = __ROR8__(v17, 32);
  v122 = v16 ^ __ROR8__(v15, 43);
  v110 = v16 ^ v11;
  v114 = v17 ^ __ROR8__(v13, 47);

  v126 = self->_dataAllowedFallbackValue | 0xC00000000000000;
  v18 = v126 & 0xFFFFFFFFFFFFFFLL | ((unint64_t)self->_cellularDataAllowedFallbackValue << 32);
  v19 = (v110 + v114) ^ __ROR8__(v114, 51);
  v20 = v118 + (v18 ^ v122);
  v21 = __ROR8__(v18 ^ v122, 48);
  v22 = (v20 ^ v21) + __ROR8__(v110 + v114, 32);
  v23 = v22 ^ __ROR8__(v20 ^ v21, 43);
  v24 = v20 + v19;
  v119 = __ROR8__(v24, 32);
  v123 = v23;
  v111 = v22 ^ v18;
  v115 = v24 ^ __ROR8__(v19, 47);
  wiFiDataAllowedFallbackValue = self->_wiFiDataAllowedFallbackValue;
  v26 = (v126 & 0xFF00000000000000) + 0x400000000000000;
  v127 = v26;
  if ((v26 & 0x400000000000000) != 0)
  {
    if ((v26 & 0x300000000000000) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _MSVHasher_SipHash_1_3_Append32(MSVHasherSipHash_1_3 *, uint32_t)");
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v102, "handleFailureInFunction:file:lineNumber:description:", v103, CFSTR("MSVHasher+SipHash.h"), 91, CFSTR("_MSVHasher_SipHash_1_3_Append32: invalid byte count detected [byteCount & 3]: %lld"), v127);

      v26 = v127;
    }
    v28 = v26 & 0xFFFFFFFFFFFFFFLL | (wiFiDataAllowedFallbackValue << 32);
    v29 = (v111 + v115) ^ __ROR8__(v115, 51);
    v30 = v119 + (v28 ^ v123);
    v31 = __ROR8__(v28 ^ v123, 48);
    v32 = (v30 ^ v31) + __ROR8__(v111 + v115, 32);
    v33 = v32 ^ __ROR8__(v30 ^ v31, 43);
    v34 = v30 + v29;
    v119 = __ROR8__(v34, 32);
    v123 = v33;
    v111 = v32 ^ v28;
    v115 = v34 ^ __ROR8__(v29, 47);
    v27 = v26 & 0xFF00000000000000;
  }
  else
  {
    if ((v26 & 0x7FFFFFFFFFFFFFFLL) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _MSVHasher_SipHash_1_3_Append32(MSVHasherSipHash_1_3 *, uint32_t)");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v96, "handleFailureInFunction:file:lineNumber:description:", v97, CFSTR("MSVHasher+SipHash.h"), 88, CFSTR("_MSVHasher_SipHash_1_3_Append32: invalid byte count detected [byteCount & 7, tail == 0]: %lld"), v127);

      v26 = v127;
    }
    v27 = v26 | wiFiDataAllowedFallbackValue;
  }
  v128 = v27 + 0x400000000000000;
  v35 = self->_networkTypeToDataAllowed;
  v36 = -[NSMutableDictionary hash](v35, "hash");
  v37 = v128;
  if ((v128 & 0x400000000000000) != 0)
  {
    if ((v128 & 0x300000000000000) != 0)
    {
      v109 = v36;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _MSVHasher_SipHash_1_3_Append64(MSVHasherSipHash_1_3 *, uint64_t)");
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v104, "handleFailureInFunction:file:lineNumber:description:", v105, CFSTR("MSVHasher+SipHash.h"), 105, CFSTR("_MSVHasher_SipHash_1_3_Append64: invalid byte count detected [byteCount & 3]: %lld"), v128);

      v36 = v109;
      v37 = v128;
    }
    v44 = v37 & 0xFFFFFFFFFFFFFFLL | (v36 << 32);
    v45 = (v111 + v115) ^ __ROR8__(v115, 51);
    v46 = v119 + (v44 ^ v123);
    v47 = __ROR8__(v44 ^ v123, 48);
    v48 = (v46 ^ v47) + __ROR8__(v111 + v115, 32);
    v49 = v48 ^ __ROR8__(v46 ^ v47, 43);
    v50 = v46 + v45;
    v120 = __ROR8__(v50, 32);
    v124 = v49;
    v112 = v48 ^ v44;
    v116 = v50 ^ __ROR8__(v45, 47);
    v37 = v37 & 0xFF00000000000000 | HIDWORD(v36);
  }
  else
  {
    if ((v128 & 0x7FFFFFFFFFFFFFFLL) != 0)
    {
      v108 = v36;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _MSVHasher_SipHash_1_3_Append64(MSVHasherSipHash_1_3 *, uint64_t)");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v98, "handleFailureInFunction:file:lineNumber:description:", v99, CFSTR("MSVHasher+SipHash.h"), 101, CFSTR("_MSVHasher_SipHash_1_3_Append64: invalid byte count detected [byteCount & 7, tail == 0]: %lld"), v128);

      v36 = v108;
      v37 = v128;
    }
    v38 = (v111 + v115) ^ __ROR8__(v115, 51);
    v39 = v119 + (v123 ^ v36);
    v40 = __ROR8__(v123 ^ v36, 48);
    v41 = (v39 ^ v40) + __ROR8__(v111 + v115, 32);
    v42 = v41 ^ __ROR8__(v39 ^ v40, 43);
    v43 = v39 + v38;
    v120 = __ROR8__(v43, 32);
    v124 = v42;
    v112 = v41 ^ v36;
    v116 = v43 ^ __ROR8__(v38, 47);
  }
  v129 = v37 + 0x800000000000000;

  v51 = self->_networkTypeToSizeLimit;
  v52 = -[NSMutableDictionary hash](v51, "hash");
  v53 = v129;
  if ((v129 & 0x400000000000000) != 0)
  {
    if ((v129 & 0x300000000000000) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _MSVHasher_SipHash_1_3_Append64(MSVHasherSipHash_1_3 *, uint64_t)");
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v106, "handleFailureInFunction:file:lineNumber:description:", v107, CFSTR("MSVHasher+SipHash.h"), 105, CFSTR("_MSVHasher_SipHash_1_3_Append64: invalid byte count detected [byteCount & 3]: %lld"), v129);

      v53 = v129;
    }
    v60 = v53 & 0xFFFFFFFFFFFFFFLL | (v52 << 32);
    v61 = (v112 + v116) ^ __ROR8__(v116, 51);
    v62 = v120 + (v60 ^ v124);
    v63 = __ROR8__(v60 ^ v124, 48);
    v64 = (v62 ^ v63) + __ROR8__(v112 + v116, 32);
    v65 = v64 ^ __ROR8__(v62 ^ v63, 43);
    v66 = v62 + v61;
    v121 = __ROR8__(v66, 32);
    v125 = v65;
    v113 = v64 ^ v60;
    v117 = v66 ^ __ROR8__(v61, 47);
    v53 = v53 & 0xFF00000000000000 | HIDWORD(v52);
  }
  else
  {
    if ((v129 & 0x7FFFFFFFFFFFFFFLL) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _MSVHasher_SipHash_1_3_Append64(MSVHasherSipHash_1_3 *, uint64_t)");
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v100, "handleFailureInFunction:file:lineNumber:description:", v101, CFSTR("MSVHasher+SipHash.h"), 101, CFSTR("_MSVHasher_SipHash_1_3_Append64: invalid byte count detected [byteCount & 7, tail == 0]: %lld"), v129);

      v53 = v129;
    }
    v54 = (v112 + v116) ^ __ROR8__(v116, 51);
    v55 = v120 + (v124 ^ v52);
    v56 = __ROR8__(v124 ^ v52, 48);
    v57 = (v55 ^ v56) + __ROR8__(v112 + v116, 32);
    v58 = v57 ^ __ROR8__(v55 ^ v56, 43);
    v59 = v55 + v54;
    v121 = __ROR8__(v59, 32);
    v125 = v58;
    v113 = v57 ^ v52;
    v117 = v59 ^ __ROR8__(v54, 47);
  }
  v130 = v53 + 0x800000000000000;

  v67 = (v113 + v117) ^ __ROR8__(v117, 51);
  v68 = v121 + (v125 ^ v130);
  v69 = __ROR8__(v125 ^ v130, 48);
  v70 = (v68 ^ v69) + __ROR8__(v113 + v117, 32);
  v71 = v70 ^ __ROR8__(v68 ^ v69, 43);
  v72 = v68 + v67;
  v73 = v72 ^ __ROR8__(v67, 47);
  v74 = (v70 ^ v130) + v73;
  v75 = v74 ^ __ROR8__(v73, 51);
  v76 = (__ROR8__(v72, 32) ^ 0xFFLL) + v71;
  v77 = __ROR8__(v71, 48);
  v78 = __ROR8__(v74, 32) + (v76 ^ v77);
  v79 = v78 ^ __ROR8__(v76 ^ v77, 43);
  v80 = v75 + v76;
  v81 = v80 ^ __ROR8__(v75, 47);
  v82 = v81 + v78;
  v83 = v82 ^ __ROR8__(v81, 51);
  v84 = __ROR8__(v80, 32) + v79;
  v85 = __ROR8__(v79, 48);
  v86 = __ROR8__(v82, 32) + (v84 ^ v85);
  v87 = v86 ^ __ROR8__(v84 ^ v85, 43);
  v88 = v83 + v84;
  v89 = v88 ^ __ROR8__(v83, 47);
  v90 = v89 + v86;
  v91 = v90 ^ __ROR8__(v89, 51);
  v92 = __ROR8__(v88, 32) + v87;
  v93 = __ROR8__(v87, 48);
  v94 = __ROR8__(v90, 32) + (v92 ^ v93);
  return (v91 + v92) ^ __ROR8__(v91, 47) ^ v94 ^ __ROR8__(v91 + v92, 32) ^ v94 ^ __ROR8__(v92 ^ v93, 43);
}

- (BOOL)isEqual:(id)a3
{
  ICNetworkConstraints *v4;
  ICNetworkConstraints *v5;
  ICNetworkConstraints *v6;
  NSMutableDictionary *networkTypeToDataAllowed;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  NSMutableDictionary *v10;
  int v11;
  char v12;
  NSMutableDictionary *networkTypeToSizeLimit;
  NSMutableDictionary *v15;
  NSMutableDictionary *v16;
  NSMutableDictionary *v17;

  v4 = (ICNetworkConstraints *)a3;
  if (self == v4)
  {
    v12 = 1;
    goto LABEL_12;
  }
  if (!-[ICNetworkConstraints isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
  {
    v12 = 0;
    goto LABEL_12;
  }
  v5 = v4;
  v6 = v5;
  if (!self->_dataAllowedFallbackValue == v5->_dataAllowedFallbackValue
    || !self->_cellularDataAllowedFallbackValue == v5->_cellularDataAllowedFallbackValue
    || !self->_wiFiDataAllowedFallbackValue == v5->_wiFiDataAllowedFallbackValue)
  {
    goto LABEL_8;
  }
  networkTypeToDataAllowed = self->_networkTypeToDataAllowed;
  v8 = v5->_networkTypeToDataAllowed;
  if (networkTypeToDataAllowed == v8)
  {

    goto LABEL_14;
  }
  v9 = v8;
  v10 = networkTypeToDataAllowed;
  v11 = -[NSMutableDictionary isEqual:](v10, "isEqual:", v9);

  if (v11)
  {
LABEL_14:
    networkTypeToSizeLimit = self->_networkTypeToSizeLimit;
    v15 = v6->_networkTypeToSizeLimit;
    v16 = networkTypeToSizeLimit;
    v17 = v16;
    if (v16 == v15)
      v12 = 1;
    else
      v12 = -[NSMutableDictionary isEqual:](v16, "isEqual:", v15);

    goto LABEL_9;
  }
LABEL_8:
  v12 = 0;
LABEL_9:

LABEL_12:
  return v12;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[ICNetworkConstraints _copyWithClass:zone:](self, "_copyWithClass:zone:", objc_opt_class(), a3);
}

- (BOOL)shouldAllowDataForNetworkType:(int64_t)a3
{
  NSMutableDictionary *networkTypeToDataAllowed;
  void *v6;
  void *v7;
  char v8;
  _BOOL4 wiFiDataAllowedFallbackValue;

  networkTypeToDataAllowed = self->_networkTypeToDataAllowed;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](networkTypeToDataAllowed, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = objc_msgSend(v7, "BOOLValue");
  }
  else if (self->_dataAllowedFallbackValue)
  {
    if ((unint64_t)(a3 - 1) > 0x1F2)
    {
      if ((unint64_t)(a3 - 1000) > 0x3E7)
      {
        v8 = 1;
        goto LABEL_11;
      }
      wiFiDataAllowedFallbackValue = self->_wiFiDataAllowedFallbackValue;
    }
    else
    {
      wiFiDataAllowedFallbackValue = self->_cellularDataAllowedFallbackValue;
    }
    v8 = wiFiDataAllowedFallbackValue;
  }
  else
  {
    v8 = 0;
  }
LABEL_11:

  return v8;
}

- (BOOL)shouldAllowDataForWiFiNetworkTypes
{
  return self->_wiFiDataAllowedFallbackValue;
}

- (id)sizeLimitForNetworkType:(int64_t)a3
{
  NSMutableDictionary *networkTypeToSizeLimit;
  void *v4;
  void *v5;

  networkTypeToSizeLimit = self->_networkTypeToSizeLimit;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](networkTypeToSizeLimit, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_copyWithClass:(Class)a3 zone:(_NSZone *)a4
{
  objc_class *v6;
  objc_class *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v6 = -[objc_class init](-[objc_class allocWithZone:](a3, "allocWithZone:", a4), "init");
  v7 = v6;
  if (v6)
  {
    *((_BYTE *)v6 + 8) = self->_dataAllowedFallbackValue;
    v8 = -[NSMutableDictionary copyWithZone:](self->_networkTypeToDataAllowed, "copyWithZone:", a4);
    v9 = (void *)*((_QWORD *)v7 + 2);
    *((_QWORD *)v7 + 2) = v8;

    v10 = -[NSMutableDictionary copyWithZone:](self->_networkTypeToSizeLimit, "copyWithZone:", a4);
    v11 = (void *)*((_QWORD *)v7 + 3);
    *((_QWORD *)v7 + 3) = v10;

    *((_BYTE *)v7 + 9) = self->_cellularDataAllowedFallbackValue;
    *((_BYTE *)v7 + 10) = self->_wiFiDataAllowedFallbackValue;
  }
  return v7;
}

+ (id)mediaTypeNetworkConstraintsFromURLBag:(id)a3
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  ICMutableNetworkConstraints *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  uint64_t v34;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "arrayForBagKey:", CFSTR("mobile-network-constraints"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!_NSIsNSArray())
  {
    v4 = 0;
    goto LABEL_62;
  }
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v36 = v3;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
  if (!v6)
    goto LABEL_60;
  v7 = v6;
  v8 = *(_QWORD *)v53;
  v40 = *(_QWORD *)v53;
  v37 = v5;
  do
  {
    v9 = 0;
    v41 = v7;
    do
    {
      if (*(_QWORD *)v53 != v8)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * v9);
      if (!_NSIsNSDictionary())
        goto LABEL_58;
      objc_msgSend(v10, "objectForKey:", CFSTR("kinds"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (!_NSIsNSArray() || !objc_msgSend(v11, "count"))
        goto LABEL_57;
      objc_msgSend(v10, "objectForKey:", CFSTR("enabled"));
      v12 = objc_claimAutoreleasedReturnValue();
      v42 = (void *)v12;
      v43 = v9;
      if (v12)
      {
        v13 = (void *)v12;
        if ((objc_opt_respondsToSelector() & 1) == 0 || (objc_msgSend(v13, "BOOLValue") & 1) == 0)
        {
          v16 = objc_alloc_init(ICMutableNetworkConstraints);
          -[ICMutableNetworkConstraints setShouldAllowDataForAllNetworkTypes:](v16, "setShouldAllowDataForAllNetworkTypes:", 0);
          goto LABEL_47;
        }
      }
      objc_msgSend(v10, "objectForKey:", CFSTR("size-limits"), v36);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = _NSIsNSDictionary();
      v16 = objc_alloc_init(ICMutableNetworkConstraints);
      if (!v15)
        goto LABEL_45;
      v38 = v14;
      v39 = v11;
      v50 = 0u;
      v51 = 0u;
      v48 = 0u;
      v49 = 0u;
      v17 = v14;
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v48, v57, 16);
      if (!v18)
        goto LABEL_44;
      v19 = v18;
      v20 = *(_QWORD *)v49;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v49 != v20)
            objc_enumerationMutation(v17);
          v22 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
          objc_msgSend(v17, "objectForKey:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (_NSIsNSString())
          {
            if ((objc_opt_respondsToSelector() & 1) != 0)
            {
              v24 = objc_msgSend(v23, "longLongValue");
              if (v24)
              {
                v25 = v24;
                v26 = v22;
                if ((objc_msgSend(v26, "isEqualToString:", CFSTR("2G")) & 1) != 0)
                {
                  v27 = 1;
                  goto LABEL_40;
                }
                if ((objc_msgSend(v26, "isEqualToString:", CFSTR("3G")) & 1) != 0)
                {
                  v27 = 2;
                  goto LABEL_40;
                }
                if ((objc_msgSend(v26, "isEqualToString:", CFSTR("4G")) & 1) != 0)
                {
                  v27 = 3;
                  goto LABEL_40;
                }
                if ((objc_msgSend(v26, "isEqualToString:", CFSTR("5G")) & 1) != 0)
                {
                  v27 = 4;
                  goto LABEL_40;
                }
                if ((objc_msgSend(v26, "isEqualToString:", CFSTR("6G")) & 1) != 0)
                {
                  v27 = 5;
                  goto LABEL_40;
                }
                if ((objc_msgSend(v26, "isEqualToString:", CFSTR("7G")) & 1) != 0)
                {
                  v27 = 6;
                  goto LABEL_40;
                }
                if ((objc_msgSend(v26, "isEqualToString:", CFSTR("8G")) & 1) != 0)
                {
                  v27 = 7;
                  goto LABEL_40;
                }
                if ((objc_msgSend(v26, "isEqualToString:", CFSTR("9G")) & 1) != 0)
                {
                  v27 = 8;
                  goto LABEL_40;
                }
                if (objc_msgSend(v26, "isEqualToString:", CFSTR("WiFi")))
                {
                  v27 = 1000;
LABEL_40:

                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v25);
                  v26 = (id)objc_claimAutoreleasedReturnValue();
                  -[ICMutableNetworkConstraints setSizeLimit:forNetworkType:](v16, "setSizeLimit:forNetworkType:", v26, v27);
                }

              }
            }
          }

        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v48, v57, 16);
      }
      while (v19);
LABEL_44:

      v5 = v37;
      v14 = v38;
      v11 = v39;
LABEL_45:

LABEL_47:
      v46 = 0u;
      v47 = 0u;
      v44 = 0u;
      v45 = 0u;
      v28 = v11;
      v29 = v11;
      v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v44, v56, 16);
      if (v30)
      {
        v31 = v30;
        v32 = *(_QWORD *)v45;
        do
        {
          for (j = 0; j != v31; ++j)
          {
            if (*(_QWORD *)v45 != v32)
              objc_enumerationMutation(v29);
            v34 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * j);
            if (_NSIsNSString())
              objc_msgSend(v4, "setObject:forKey:", v16, v34);
          }
          v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v44, v56, 16);
        }
        while (v31);
      }

      v8 = v40;
      v7 = v41;
      v9 = v43;
      v11 = v28;
LABEL_57:

LABEL_58:
      ++v9;
    }
    while (v9 != v7);
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
  }
  while (v7);
LABEL_60:

  v3 = v36;
LABEL_62:

  return v4;
}

@end
