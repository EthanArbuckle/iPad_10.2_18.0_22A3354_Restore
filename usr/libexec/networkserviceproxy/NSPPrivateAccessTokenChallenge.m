@implementation NSPPrivateAccessTokenChallenge

+ (id)httpAuthenticationScheme
{
  return CFSTR("PrivateToken");
}

+ (id)challengeAttributeName
{
  return CFSTR("challenge");
}

+ (id)tokenKeyAttributeName
{
  return CFSTR("token-key");
}

+ (id)originNameKeyAttributeName
{
  return CFSTR("issuer-encap-key");
}

- (NSPPrivateAccessTokenChallenge)initWithData:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;
  unsigned __int16 *v9;
  uint64_t v10;
  uint64_t v11;
  unsigned __int16 *v12;
  NSPPrivateAccessTokenChallenge *v13;
  uint64_t v14;
  uint64_t v15;
  NSPPrivateAccessTokenChallenge *v16;
  uint64_t v17;
  NSObject *v18;
  const char *v19;
  NSObject *v20;
  uint32_t v21;
  _BOOL8 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  size_t v28;
  unint64_t v29;
  int v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  char *v35;
  void *v36;
  SEL v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  NSObject *v44;
  uint64_t v45;
  unsigned int v46;
  uint64_t v47;
  char *v48;
  char *v49;
  unsigned __int16 *v50;
  uint64_t v51;
  unsigned int v52;
  unint64_t v53;
  unint64_t v54;
  uint64_t v55;
  void *v56;
  SEL v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  _BOOL8 v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  const char *v67;
  NSObject *v68;
  uint32_t v69;
  uint64_t v70;
  unsigned int v71;
  const void *v72;
  unsigned int v73;
  size_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  NSObject *v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  int v85;
  void *v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  void *v90;
  SEL v91;
  SEL v92;
  id v93;
  void *v94;
  SEL v95;
  void *v96;
  void *v97;
  SEL v98;
  const char *v99;
  uint64_t v100;
  void *v101;
  unsigned int v102;
  void *v103;
  void *v104;
  void *v105;
  SEL v106;
  id Property;
  id v108;
  void *v109;
  SEL v110;
  uint64_t v111;
  uint64_t v112;
  objc_super v113;
  uint8_t buf[4];
  _QWORD v115[2];

  v4 = a3;
  v7 = v4;
  if (!v4)
  {
    v79 = nplog_obj(0, v5, v6);
    v80 = objc_claimAutoreleasedReturnValue(v79);
    if (os_log_type_enabled(v80, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v115[0] = "-[NSPPrivateAccessTokenChallenge initWithData:]";
      v81 = "%s called with null data";
      goto LABEL_83;
    }
LABEL_67:

    goto LABEL_16;
  }
  v8 = (unint64_t)objc_msgSend(v4, "length");
  v9 = (unsigned __int16 *)objc_msgSend(v7, "bytes");
  if (!v8)
  {
    v82 = nplog_obj(v9, v10, v11);
    v80 = objc_claimAutoreleasedReturnValue(v82);
    if (os_log_type_enabled(v80, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v115[0] = "-[NSPPrivateAccessTokenChallenge initWithData:]";
      v81 = "%s called with null remainingLength";
      goto LABEL_83;
    }
    goto LABEL_67;
  }
  v12 = v9;
  if (!v9)
  {
    v83 = nplog_obj(0, v10, v11);
    v80 = objc_claimAutoreleasedReturnValue(v83);
    if (!os_log_type_enabled(v80, OS_LOG_TYPE_FAULT))
      goto LABEL_67;
    *(_DWORD *)buf = 136315138;
    v115[0] = "-[NSPPrivateAccessTokenChallenge initWithData:]";
    v81 = "%s called with null cursor";
LABEL_83:
    _os_log_fault_impl((void *)&_mh_execute_header, v80, OS_LOG_TYPE_FAULT, v81, buf, 0xCu);
    goto LABEL_67;
  }
  v113.receiver = self;
  v113.super_class = (Class)NSPPrivateAccessTokenChallenge;
  v13 = -[NSPPrivateAccessTokenChallenge init](&v113, "init");
  if (!v13)
  {
    v84 = nplog_obj(0, v14, v15);
    self = (NSPPrivateAccessTokenChallenge *)objc_claimAutoreleasedReturnValue(v84);
    if (os_log_type_enabled(&self->super, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl((void *)&_mh_execute_header, &self->super, OS_LOG_TYPE_FAULT, "[super init] failed", buf, 2u);
    }
    goto LABEL_16;
  }
  v16 = v13;
  if (v8 <= 1)
  {
    v17 = nplog_obj(v13, v14, v15);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v19 = "Invalid challenge length";
LABEL_8:
      v20 = v18;
      v21 = 2;
LABEL_32:
      _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, v19, buf, v21);
      goto LABEL_14;
    }
    goto LABEL_14;
  }
  v13->_tokenType = bswap32(*v12) >> 16;
  v22 = -[NSPPrivateAccessTokenChallenge isSupportedTokenType](v13, "isSupportedTokenType");
  if (!v22)
  {
    v26 = nplog_obj(v22, v23, v24);
    v18 = objc_claimAutoreleasedReturnValue(v26);
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      goto LABEL_14;
    v46 = -[NSPPrivateAccessTokenChallenge tokenType](v16, "tokenType");
    *(_DWORD *)buf = 67109120;
    LODWORD(v115[0]) = v46;
    v19 = "Unsupported token type %u";
    goto LABEL_31;
  }
  if ((v8 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    v25 = nplog_obj(v22, v23, v24);
    v18 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v19 = "Invalid challenge length";
      goto LABEL_8;
    }
LABEL_14:

LABEL_15:
    self = v16;
LABEL_16:
    v16 = 0;
LABEL_17:

    goto LABEL_18;
  }
  v28 = bswap32(v12[1]) >> 16;
  v29 = v8 - 4;
  if (v8 - 4 < v28 || ((unsigned __int16)(v28 - 257) >> 8) != 255)
  {
    v43 = nplog_obj(v22, v23, v24);
    v44 = objc_claimAutoreleasedReturnValue(v43);
    if (!os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
LABEL_27:

      goto LABEL_15;
    }
    *(_DWORD *)buf = 67109120;
    LODWORD(v115[0]) = v28;
    v67 = "Invalid issuer name length %u";
    goto LABEL_48;
  }
  v30 = v28 + 1;
  v31 = malloc_type_calloc(1uLL, (v28 + 1), 0xB2A92CECuLL);
  if (!v31)
  {
    v45 = nplog_obj(0, v32, v33);
    v18 = objc_claimAutoreleasedReturnValue(v45);
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      goto LABEL_14;
    *(_DWORD *)buf = 67109120;
    LODWORD(v115[0]) = v30;
    v19 = "calloc of %u bytes failed";
    goto LABEL_31;
  }
  v34 = v31;
  v35 = (char *)(v12 + 2);
  memcpy(v31, v35, v28);
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v34));
  objc_setProperty_atomic(v16, v37, v36, 24);

  free(v34);
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[NSPPrivateAccessTokenChallenge issuerName](v16, "issuerName"));

  if (!v38)
  {
    v47 = nplog_obj(v39, v40, v41);
    v18 = objc_claimAutoreleasedReturnValue(v47);
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      goto LABEL_14;
    *(_WORD *)buf = 0;
    v19 = "Invalid origin name";
    goto LABEL_8;
  }
  if (v29 == v28)
  {
    v42 = nplog_obj(v39, v40, v41);
    v18 = objc_claimAutoreleasedReturnValue(v42);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v19 = "Invalid challenge length";
      goto LABEL_8;
    }
    goto LABEL_14;
  }
  v48 = &v35[v28];
  v49 = &v35[v28];
  v52 = *v49;
  v50 = (unsigned __int16 *)(v49 + 1);
  v51 = v52;
  v53 = v29 + ~v28;
  v54 = v53 - v52;
  if (v53 < v52)
  {
    v55 = nplog_obj(v39, v40, v41);
    v18 = objc_claimAutoreleasedReturnValue(v55);
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      goto LABEL_14;
    *(_DWORD *)buf = 67109376;
    LODWORD(v115[0]) = v51;
    WORD2(v115[0]) = 2048;
    *(_QWORD *)((char *)v115 + 6) = v53;
    v19 = "Invalid nonce length %u, cannot fit in %zu";
    v20 = v18;
    v21 = 18;
    goto LABEL_32;
  }
  if ((_DWORD)v51)
  {
    if ((_DWORD)v51 != 32)
    {
      v70 = nplog_obj(v39, v40, v41);
      v18 = objc_claimAutoreleasedReturnValue(v70);
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        goto LABEL_14;
      *(_DWORD *)buf = 67109120;
      LODWORD(v115[0]) = v51;
      v19 = "Invalid nonce length %u";
      goto LABEL_31;
    }
    v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v50, v51));
    objc_setProperty_atomic(v16, v57, v56, 32);

    v58 = (void *)objc_claimAutoreleasedReturnValue(-[NSPPrivateAccessTokenChallenge redemptionNonce](v16, "redemptionNonce"));
    if (!v58)
    {
      v76 = nplog_obj(v59, v60, v61);
      v18 = objc_claimAutoreleasedReturnValue(v76);
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        goto LABEL_14;
      *(_WORD *)buf = 0;
      v19 = "Invalid nonce";
      goto LABEL_8;
    }
    v50 = (unsigned __int16 *)(v48 + 33);
    v53 = v54;
  }
  v62 = -[NSPPrivateAccessTokenChallenge typeRequiresRedemptionNonce](v16, "typeRequiresRedemptionNonce");
  if (v62)
  {
    v65 = (void *)objc_claimAutoreleasedReturnValue(-[NSPPrivateAccessTokenChallenge redemptionNonce](v16, "redemptionNonce"));

    if (!v65)
    {
      v78 = nplog_obj(v62, v63, v64);
      v18 = objc_claimAutoreleasedReturnValue(v78);
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        goto LABEL_14;
      *(_WORD *)buf = 0;
      v19 = "Redemption nonce is required";
      goto LABEL_8;
    }
  }
  if (v53 <= 1)
  {
    v66 = nplog_obj(v62, v63, v64);
    v18 = objc_claimAutoreleasedReturnValue(v66);
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      goto LABEL_14;
    *(_WORD *)buf = 0;
    v19 = "Invalid challenge length";
    goto LABEL_8;
  }
  v73 = *v50;
  v72 = v50 + 1;
  v71 = v73;
  v74 = __rev16(v73);
  if (v53 - 2 < v74)
  {
    v75 = nplog_obj(v62, v63, v64);
    v44 = objc_claimAutoreleasedReturnValue(v75);
    if (!os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      goto LABEL_27;
    *(_DWORD *)buf = 67109376;
    LODWORD(v115[0]) = v74;
    WORD2(v115[0]) = 2048;
    *(_QWORD *)((char *)v115 + 6) = v53 - 2;
    v67 = "Invalid origin info length %u, cannot fit in %zu";
    v68 = v44;
    v69 = 18;
    goto LABEL_49;
  }
  if (v74 >= 0xA01)
  {
    v77 = nplog_obj(v62, v63, v64);
    v44 = objc_claimAutoreleasedReturnValue(v77);
    if (!os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      goto LABEL_27;
    *(_DWORD *)buf = 67109120;
    LODWORD(v115[0]) = v74;
    v67 = "Invalid origin info length %u";
LABEL_48:
    v68 = v44;
    v69 = 8;
LABEL_49:
    _os_log_error_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_ERROR, v67, buf, v69);
    goto LABEL_27;
  }
  if (v71)
  {
    v85 = v74 + 1;
    v86 = malloc_type_calloc(1uLL, (v74 + 1), 0xF9F8721BuLL);
    if (v86)
    {
      v89 = v86;
      memcpy(v86, v72, v74);
      v90 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v89));
      objc_setProperty_atomic(v16, v91, v90, 56);

      free(v89);
      v93 = objc_msgSend(objc_getProperty(v16, v92, 56, 1), "componentsSeparatedByString:", CFSTR(","));
      v94 = (void *)objc_claimAutoreleasedReturnValue(v93);
      objc_setProperty_atomic(v16, v95, v94, 48);

      v96 = (void *)objc_claimAutoreleasedReturnValue(-[NSPPrivateAccessTokenChallenge originNames](v16, "originNames"));
      v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v96, "firstObject"));
      objc_setProperty_atomic(v16, v98, v97, 40);

      goto LABEL_73;
    }
    v111 = nplog_obj(0, v87, v88);
    v18 = objc_claimAutoreleasedReturnValue(v111);
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      goto LABEL_14;
    *(_DWORD *)buf = 67109120;
    LODWORD(v115[0]) = v85;
    v19 = "calloc of %u bytes failed";
LABEL_31:
    v20 = v18;
    v21 = 8;
    goto LABEL_32;
  }
LABEL_73:
  if (-[NSPPrivateAccessTokenChallenge typeRequiresOriginName](v16, "typeRequiresOriginName")
    && !objc_getProperty(v16, v99, 56, 1))
  {
    v112 = nplog_obj(0, v99, v100);
    v18 = objc_claimAutoreleasedReturnValue(v112);
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      goto LABEL_14;
    *(_WORD *)buf = 0;
    v19 = "Origin name is required";
    goto LABEL_8;
  }
  objc_setProperty_atomic(v16, v99, v7, 16);
  if (os_variant_allows_internal_security_policies("com.apple.networkserviceproxy"))
  {
    v101 = (void *)objc_claimAutoreleasedReturnValue(-[NSPPrivateAccessTokenChallenge issuerName](v16, "issuerName"));
    v102 = objc_msgSend(v101, "containsString:", CFSTR(";"));

    if (v102)
    {
      v103 = (void *)objc_claimAutoreleasedReturnValue(-[NSPPrivateAccessTokenChallenge issuerName](v16, "issuerName"));
      v104 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v103, "componentsSeparatedByString:", CFSTR(";")));
      self = (NSPPrivateAccessTokenChallenge *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "firstObject"));

      LODWORD(v103) = -[NSPPrivateAccessTokenChallenge tokenType](v16, "tokenType");
      v105 = (void *)objc_claimAutoreleasedReturnValue(-[NSPPrivateAccessTokenChallenge redemptionNonce](v16, "redemptionNonce"));
      Property = objc_getProperty(v16, v106, 56, 1);
      v108 = sub_1000A8AF8(v103, self, v105, Property);
      v109 = (void *)objc_claimAutoreleasedReturnValue(v108);
      objc_setProperty_atomic(v16, v110, v109, 16);

      goto LABEL_17;
    }
  }
LABEL_18:

  return v16;
}

- (id)initRSABlindSignatureChallengeWithIssuerName:(id)a3 redemptionNonce:(id)a4 originNames:(id)a5
{
  NSPPrivateAccessTokenChallenge *v5;
  NSPPrivateAccessTokenChallenge *v6;
  uint64_t v8;
  NSObject *v9;
  int v10;
  const char *v11;

  v5 = self;
  if (a3)
  {
    v5 = sub_1000A95A0(&self->super, 2u, a3, a4, a5);
    v6 = v5;
  }
  else
  {
    v8 = nplog_obj(self, a2, 0);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      v10 = 136315138;
      v11 = "-[NSPPrivateAccessTokenChallenge initRSABlindSignatureChallengeWithIssuerName:redemptionNonce:originNames:]";
      _os_log_fault_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_FAULT, "%s called with null issuerName", (uint8_t *)&v10, 0xCu);
    }

    v6 = 0;
  }

  return v6;
}

- (id)initRateLimitedRSABlindSignatureChallengeWithIssuerName:(id)a3 redemptionNonce:(id)a4 originNames:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  NSPPrivateAccessTokenChallenge *v16;
  uint64_t v18;
  NSObject *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  const char *v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v13 = v10;
  if (!v8)
  {
    v18 = nplog_obj(v10, v11, v12);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
    {
      v23 = 136315138;
      v24 = "-[NSPPrivateAccessTokenChallenge initRateLimitedRSABlindSignatureChallengeWithIssuerName:redemptionNonce:originNames:]";
      v20 = "%s called with null issuerName";
      goto LABEL_13;
    }
LABEL_11:

    v16 = 0;
    goto LABEL_5;
  }
  if (!v9)
  {
    v21 = nplog_obj(v10, v11, v12);
    v19 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
    {
      v23 = 136315138;
      v24 = "-[NSPPrivateAccessTokenChallenge initRateLimitedRSABlindSignatureChallengeWithIssuerName:redemptionNonce:originNames:]";
      v20 = "%s called with null redemptionNonce";
      goto LABEL_13;
    }
    goto LABEL_11;
  }
  if (!objc_msgSend(v10, "count"))
  {
    v22 = nplog_obj(0, v14, v15);
    v19 = objc_claimAutoreleasedReturnValue(v22);
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      goto LABEL_11;
    v23 = 136315138;
    v24 = "-[NSPPrivateAccessTokenChallenge initRateLimitedRSABlindSignatureChallengeWithIssuerName:redemptionNonce:originNames:]";
    v20 = "%s called with null originNames.count";
LABEL_13:
    _os_log_fault_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_FAULT, v20, (uint8_t *)&v23, 0xCu);
    goto LABEL_11;
  }
  self = sub_1000A95A0(&self->super, 3u, v8, v9, v13);
  v16 = self;
LABEL_5:

  return v16;
}

- (BOOL)isSupportedTokenType
{
  return -[NSPPrivateAccessTokenChallenge tokenType](self, "tokenType") == 2
      || -[NSPPrivateAccessTokenChallenge tokenType](self, "tokenType") == 3;
}

- (BOOL)typeRequiresOriginName
{
  return -[NSPPrivateAccessTokenChallenge tokenType](self, "tokenType") == 3;
}

- (BOOL)typeRequiresRedemptionNonce
{
  return -[NSPPrivateAccessTokenChallenge tokenType](self, "tokenType") == 3;
}

- (BOOL)typeHasAllowedOriginList
{
  return -[NSPPrivateAccessTokenChallenge tokenType](self, "tokenType") == 2;
}

- (NSData)challengeData
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (unsigned)tokenType
{
  return self->_tokenType;
}

- (NSString)issuerName
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSData)redemptionNonce
{
  return (NSData *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)originName
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (NSArray)originNames
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originInfo, 0);
  objc_storeStrong((id *)&self->_originNames, 0);
  objc_storeStrong((id *)&self->_originName, 0);
  objc_storeStrong((id *)&self->_redemptionNonce, 0);
  objc_storeStrong((id *)&self->_issuerName, 0);
  objc_storeStrong((id *)&self->_challengeData, 0);
}

@end
