@implementation SEEndPointConfiguration

- (SEEndPointConfiguration)init
{
  SEEndPointConfiguration *v2;
  NSObject *v3;
  uint8_t v5[16];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SEEndPointConfiguration;
  v2 = -[SEEndPointConfiguration init](&v6, sel_init);
  if (v2)
  {
    SESDefaultLogObject();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_20A048000, v3, OS_LOG_TYPE_DEBUG, "Init SEEndPointConfiguration with default values", v5, 2u);
    }

    -[SEEndPointConfiguration setEnabledOnWire:](v2, "setEnabledOnWire:", 1);
    -[SEEndPointConfiguration setEnabledOnContactless:](v2, "setEnabledOnContactless:", 1);
    -[SEEndPointConfiguration setStandardFlowAllowedOnWire:](v2, "setStandardFlowAllowedOnWire:", 0);
    -[SEEndPointConfiguration setStandardFlowAllowedOnContactless:](v2, "setStandardFlowAllowedOnContactless:", 1);
    -[SEEndPointConfiguration setFastFlowAllowedOnWire:](v2, "setFastFlowAllowedOnWire:", 0);
    -[SEEndPointConfiguration setFastFlowAllowedOnContactless:](v2, "setFastFlowAllowedOnContactless:", 0);
    -[SEEndPointConfiguration setExchangeAllowedOnWire:](v2, "setExchangeAllowedOnWire:", 1);
    -[SEEndPointConfiguration setExchangeAllowedInFastFlow:](v2, "setExchangeAllowedInFastFlow:", 0);
    -[SEEndPointConfiguration setAuthorizeEndPointAllowed:](v2, "setAuthorizeEndPointAllowed:", 0);
    -[SEEndPointConfiguration setAuthorizeEndPointWithAuthorizeAllowed:](v2, "setAuthorizeEndPointWithAuthorizeAllowed:", 0);
    -[SEEndPointConfiguration setSignAllowed:](v2, "setSignAllowed:", 0);
    -[SEEndPointConfiguration setExportEraseConfidentialMailBox:](v2, "setExportEraseConfidentialMailBox:", 0);
    -[SEEndPointConfiguration setCompressedKeysAllowed:](v2, "setCompressedKeysAllowed:", 0);
    -[SEEndPointConfiguration setConfidentialDataAllowed:](v2, "setConfidentialDataAllowed:", 0);
    -[SEEndPointConfiguration setServerIssuedKey:](v2, "setServerIssuedKey:", 0);
    -[SEEndPointConfiguration setFleetVehicle:](v2, "setFleetVehicle:", 0);
    -[SEEndPointConfiguration setNfcExpressOnlyInLPM:](v2, "setNfcExpressOnlyInLPM:", 0);
    -[SEEndPointConfiguration setTerminationNotPersisted:](v2, "setTerminationNotPersisted:", 0);
    -[SEEndPointConfiguration setLengthConfidentialMailBox:](v2, "setLengthConfidentialMailBox:", 0);
    -[SEEndPointConfiguration setOffsetConfidentialMailBox:](v2, "setOffsetConfidentialMailBox:", 0);
    -[SEEndPointConfiguration setLengthPrivateMailBox:](v2, "setLengthPrivateMailBox:", 0);
    -[SEEndPointConfiguration setOffsetPrivateMailBox:](v2, "setOffsetPrivateMailBox:", 0);
  }
  return v2;
}

+ (id)configurationWithOpt1:(unsigned __int8)a3 opt2:(unsigned __int8)a4
{
  unsigned int v4;
  NSObject *v5;
  void *v6;
  unsigned int v8;
  NSObject *v9;
  unsigned int v10;
  unsigned int v11;
  int v12;
  unsigned int v13;
  __int16 v14;
  unsigned int v15;
  uint64_t v16;

  v4 = a4;
  v16 = *MEMORY[0x24BDAC8D0];
  if ((a4 & 0x30) != 0)
  {
    SESDefaultLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v12 = 67109120;
      v13 = v4;
      _os_log_impl(&dword_20A048000, v5, OS_LOG_TYPE_ERROR, "Option group 2 value has some RFU bits set 0x%02X", (uint8_t *)&v12, 8u);
    }
    v6 = 0;
  }
  else
  {
    v8 = a3;
    v6 = (void *)objc_opt_new();
    if (!v6)
      return v6;
    SESDefaultLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v12 = 67109376;
      v13 = v8;
      v14 = 1024;
      v15 = v4;
      _os_log_impl(&dword_20A048000, v9, OS_LOG_TYPE_DEBUG, "Creating SEEndPointConfiguration with Opt1 %02X and Opt2 %02X", (uint8_t *)&v12, 0xEu);
    }

    objc_msgSend(v6, "setStandardFlowAllowedOnContactless:", v8 & 1);
    objc_msgSend(v6, "setFastFlowAllowedOnContactless:", (v8 >> 1) & 1);
    objc_msgSend(v6, "setStandardFlowAllowedOnWire:", (v8 >> 2) & 1);
    objc_msgSend(v6, "setFastFlowAllowedOnWire:", (v8 >> 3) & 1);
    objc_msgSend(v6, "setAuthorizeEndPointAllowed:", (v8 >> 4) & 1);
    objc_msgSend(v6, "setAuthorizeEndPointWithAuthorizeAllowed:", (v8 >> 5) & 1);
    objc_msgSend(v6, "setExchangeAllowedOnWire:", (v8 >> 6) & 1);
    objc_msgSend(v6, "setExchangeAllowedInFastFlow:", v8 >> 7);
    objc_msgSend(v6, "setSignAllowed:", v4 & 1);
    objc_msgSend(v6, "setExportEraseConfidentialMailBox:", (v4 >> 1) & 1);
    objc_msgSend(v6, "setServerIssuedKey:", (v4 >> 2) & 1);
    objc_msgSend(v6, "setFleetVehicle:", (v4 >> 3) & 1);
    objc_msgSend(v6, "setCompressedKeysAllowed:", (v4 >> 6) & 1);
    objc_msgSend(v6, "setConfidentialDataAllowed:", v4 >> 7);
    SESDefaultLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v10 = objc_msgSend(v6, "opt1");
      v11 = objc_msgSend(v6, "opt2");
      v12 = 67109376;
      v13 = v10;
      v14 = 1024;
      v15 = v11;
      _os_log_impl(&dword_20A048000, v5, OS_LOG_TYPE_INFO, "SEEndPointConfiguration created with Opt1 %02X and Opt2 %02X", (uint8_t *)&v12, 0xEu);
    }
  }

  return v6;
}

+ (id)homeDefaults
{
  void *v2;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setEnabledOnWire:", 1);
  objc_msgSend(v2, "setEnabledOnContactless:", 1);
  objc_msgSend(v2, "setStandardFlowAllowedOnWire:", 1);
  objc_msgSend(v2, "setStandardFlowAllowedOnContactless:", 1);
  objc_msgSend(v2, "setFastFlowAllowedOnWire:", 1);
  objc_msgSend(v2, "setFastFlowAllowedOnContactless:", 1);
  objc_msgSend(v2, "setExchangeAllowedOnWire:", 1);
  objc_msgSend(v2, "setExchangeAllowedInFastFlow:", 1);
  objc_msgSend(v2, "setAuthorizeEndPointAllowed:", 0);
  objc_msgSend(v2, "setAuthorizeEndPointWithAuthorizeAllowed:", 0);
  objc_msgSend(v2, "setSignAllowed:", 1);
  objc_msgSend(v2, "setExportEraseConfidentialMailBox:", 0);
  objc_msgSend(v2, "setConfidentialDataAllowed:", 1);
  return v2;
}

+ (id)lyonHomeDefaults
{
  void *v2;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setNfcExpressOnlyInLPM:", 0);
  objc_msgSend(v2, "setTerminationNotPersisted:", 1);
  objc_msgSend(v2, "setEnabledOnWire:", 0);
  objc_msgSend(v2, "setEnabledOnContactless:", 0);
  return v2;
}

+ (id)lyonHydraDefaults
{
  void *v2;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setNfcExpressOnlyInLPM:", 0);
  objc_msgSend(v2, "setTerminationNotPersisted:", 0);
  objc_msgSend(v2, "setEnabledOnWire:", 0);
  objc_msgSend(v2, "setEnabledOnContactless:", 0);
  return v2;
}

+ (id)hydraDefaults
{
  void *v2;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setEnabledOnWire:", 1);
  objc_msgSend(v2, "setEnabledOnContactless:", 1);
  objc_msgSend(v2, "setStandardFlowAllowedOnWire:", 1);
  objc_msgSend(v2, "setStandardFlowAllowedOnContactless:", 1);
  objc_msgSend(v2, "setFastFlowAllowedOnWire:", 1);
  objc_msgSend(v2, "setFastFlowAllowedOnContactless:", 1);
  objc_msgSend(v2, "setExchangeAllowedOnWire:", 1);
  objc_msgSend(v2, "setExchangeAllowedInFastFlow:", 1);
  objc_msgSend(v2, "setAuthorizeEndPointAllowed:", 0);
  objc_msgSend(v2, "setAuthorizeEndPointWithAuthorizeAllowed:", 0);
  objc_msgSend(v2, "setSignAllowed:", 1);
  objc_msgSend(v2, "setExportEraseConfidentialMailBox:", 0);
  objc_msgSend(v2, "setConfidentialDataAllowed:", 1);
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  void *v3;
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
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("{\n"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("\t\tenabledOnWire : %d\n"), -[SEEndPointConfiguration enabledOnWire](self, "enabledOnWire"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("\t\tenabledOnContactless : %d\n"), -[SEEndPointConfiguration enabledOnContactless](self, "enabledOnContactless"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("\t\tstandardFlowAllowedOnWire : %d\n"), -[SEEndPointConfiguration standardFlowAllowedOnWire](self, "standardFlowAllowedOnWire"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByAppendingString:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("\t\tstandardFlowAllowedOnContactless : %d\n"), -[SEEndPointConfiguration standardFlowAllowedOnContactless](self, "standardFlowAllowedOnContactless"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByAppendingString:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("\t\tfastFlowAllowedOnWire : %d\n"), -[SEEndPointConfiguration fastFlowAllowedOnWire](self, "fastFlowAllowedOnWire"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringByAppendingString:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("\t\tfastFlowAllowedOnContactless : %d\n"), -[SEEndPointConfiguration fastFlowAllowedOnContactless](self, "fastFlowAllowedOnContactless"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringByAppendingString:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("\t\texchangeAllowedOnWire : %d\n"), -[SEEndPointConfiguration exchangeAllowedOnWire](self, "exchangeAllowedOnWire"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringByAppendingString:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("\t\texchangeAllowedInFastFlow : %d\n"), -[SEEndPointConfiguration exchangeAllowedInFastFlow](self, "exchangeAllowedInFastFlow"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringByAppendingString:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("\t\tauthorizeEndPointAllowed : %d\n"), -[SEEndPointConfiguration authorizeEndPointAllowed](self, "authorizeEndPointAllowed"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "stringByAppendingString:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("\t\tauthorizeEndPointWithAuthorizeAllowed : %d\n"), -[SEEndPointConfiguration authorizeEndPointWithAuthorizeAllowed](self, "authorizeEndPointWithAuthorizeAllowed"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "stringByAppendingString:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("\t\tsignAllowed : %d\n"), -[SEEndPointConfiguration signAllowed](self, "signAllowed"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "stringByAppendingString:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("\t\texportEraseConfidentialMailBox : %d\n"), -[SEEndPointConfiguration exportEraseConfidentialMailBox](self, "exportEraseConfidentialMailBox"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "stringByAppendingString:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("\t\tcompressedKeysAllowed : %d\n"), -[SEEndPointConfiguration compressedKeysAllowed](self, "compressedKeysAllowed"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "stringByAppendingString:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("\t\tconfidentialDataAllowed : %d\n"), -[SEEndPointConfiguration confidentialDataAllowed](self, "confidentialDataAllowed"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "stringByAppendingString:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("\t\tserverIssuedKey : %d\n"), -[SEEndPointConfiguration serverIssuedKey](self, "serverIssuedKey"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "stringByAppendingString:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("\t\tfleetVehicle : %d\n"), -[SEEndPointConfiguration fleetVehicle](self, "fleetVehicle"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "stringByAppendingString:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("\t\tnfcExpressOnlyInLPM : %d\n"), -[SEEndPointConfiguration nfcExpressOnlyInLPM](self, "nfcExpressOnlyInLPM"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "stringByAppendingString:", v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("\t\tterminationNotPersisted : %d\n"), -[SEEndPointConfiguration terminationNotPersisted](self, "terminationNotPersisted"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "stringByAppendingString:", v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("\t\tlengthConfidentialMailBox : %d\n"), -[SEEndPointConfiguration lengthConfidentialMailBox](self, "lengthConfidentialMailBox"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "stringByAppendingString:", v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("\t\toffsetConfidentialMailBox : %d\n"), -[SEEndPointConfiguration offsetConfidentialMailBox](self, "offsetConfidentialMailBox"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "stringByAppendingString:", v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("\t\tlengthPrivateMailBox : %d\n"), -[SEEndPointConfiguration lengthPrivateMailBox](self, "lengthPrivateMailBox"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "stringByAppendingString:", v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("\t\toffsetPrivateMailBox : %d\n"), -[SEEndPointConfiguration offsetPrivateMailBox](self, "offsetPrivateMailBox"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "stringByAppendingString:", v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("\t}"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "stringByAppendingString:", v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  return v49;
}

- (SEEndPointConfiguration)initWithCoder:(id)a3
{
  id v4;
  SEEndPointConfiguration *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SEEndPointConfiguration;
  v5 = -[SEEndPointConfiguration init](&v7, sel_init);
  if (v5)
  {
    v5->_enabledOnWire = objc_msgSend(v4, "decodeIntForKey:", CFSTR("enabledOnWire")) != 0;
    v5->_enabledOnContactless = objc_msgSend(v4, "decodeIntForKey:", CFSTR("enabledOnContactless")) != 0;
    v5->_standardFlowAllowedOnWire = objc_msgSend(v4, "decodeIntForKey:", CFSTR("standardFlowAllowedOnWire")) != 0;
    v5->_standardFlowAllowedOnContactless = objc_msgSend(v4, "decodeIntForKey:", CFSTR("standardFlowAllowedOnContactless")) != 0;
    v5->_fastFlowAllowedOnWire = objc_msgSend(v4, "decodeIntForKey:", CFSTR("fastFlowAllowedOnWire")) != 0;
    v5->_fastFlowAllowedOnContactless = objc_msgSend(v4, "decodeIntForKey:", CFSTR("fastFlowAllowedOnContactless")) != 0;
    v5->_exchangeAllowedOnWire = objc_msgSend(v4, "decodeIntForKey:", CFSTR("exchangeAllowedOnWire")) != 0;
    v5->_exchangeAllowedInFastFlow = objc_msgSend(v4, "decodeIntForKey:", CFSTR("exchangeAllowedInFastFlow")) != 0;
    v5->_authorizeEndPointAllowed = objc_msgSend(v4, "decodeIntForKey:", CFSTR("authorizeEndPointAllowed")) != 0;
    v5->_authorizeEndPointWithAuthorizeAllowed = objc_msgSend(v4, "decodeIntForKey:", CFSTR("authorizeEndPointWithAuthorizeAllowed")) != 0;
    v5->_signAllowed = objc_msgSend(v4, "decodeIntForKey:", CFSTR("signAllowed")) != 0;
    v5->_exportEraseConfidentialMailBox = objc_msgSend(v4, "decodeIntForKey:", CFSTR("exportEraseConfidentialMailBox")) != 0;
    v5->_compressedKeysAllowed = objc_msgSend(v4, "decodeIntForKey:", CFSTR("compressedKeysAllowed")) != 0;
    v5->_confidentialDataAllowed = objc_msgSend(v4, "decodeIntForKey:", CFSTR("confidentialDataAllowed")) != 0;
    v5->_serverIssuedKey = objc_msgSend(v4, "decodeIntForKey:", CFSTR("serverIssuedKey")) != 0;
    v5->_fleetVehicle = objc_msgSend(v4, "decodeIntForKey:", CFSTR("fleetVehicle")) != 0;
    v5->_nfcExpressOnlyInLPM = objc_msgSend(v4, "decodeIntForKey:", CFSTR("nfcExpressOnlyInLPM")) != 0;
    v5->_terminationNotPersisted = objc_msgSend(v4, "decodeIntForKey:", CFSTR("terminationNotPersisted")) != 0;
    v5->_lengthConfidentialMailBox = objc_msgSend(v4, "decodeIntForKey:", CFSTR("lengthConfidentialMailBox"));
    v5->_offsetConfidentialMailBox = objc_msgSend(v4, "decodeIntForKey:", CFSTR("offsetConfidentialMailBox"));
    v5->_lengthPrivateMailBox = objc_msgSend(v4, "decodeIntForKey:", CFSTR("lengthPrivateMailBox"));
    v5->_offsetPrivateMailBox = objc_msgSend(v4, "decodeIntForKey:", CFSTR("offsetPrivateMailBox"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[SEEndPointConfiguration enabledOnWire](self, "enabledOnWire"), CFSTR("enabledOnWire"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[SEEndPointConfiguration enabledOnContactless](self, "enabledOnContactless"), CFSTR("enabledOnContactless"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[SEEndPointConfiguration standardFlowAllowedOnWire](self, "standardFlowAllowedOnWire"), CFSTR("standardFlowAllowedOnWire"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[SEEndPointConfiguration standardFlowAllowedOnContactless](self, "standardFlowAllowedOnContactless"), CFSTR("standardFlowAllowedOnContactless"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[SEEndPointConfiguration fastFlowAllowedOnWire](self, "fastFlowAllowedOnWire"), CFSTR("fastFlowAllowedOnWire"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[SEEndPointConfiguration fastFlowAllowedOnContactless](self, "fastFlowAllowedOnContactless"), CFSTR("fastFlowAllowedOnContactless"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[SEEndPointConfiguration exchangeAllowedOnWire](self, "exchangeAllowedOnWire"), CFSTR("exchangeAllowedOnWire"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[SEEndPointConfiguration exchangeAllowedInFastFlow](self, "exchangeAllowedInFastFlow"), CFSTR("exchangeAllowedInFastFlow"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[SEEndPointConfiguration authorizeEndPointAllowed](self, "authorizeEndPointAllowed"), CFSTR("authorizeEndPointAllowed"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[SEEndPointConfiguration authorizeEndPointWithAuthorizeAllowed](self, "authorizeEndPointWithAuthorizeAllowed"), CFSTR("authorizeEndPointWithAuthorizeAllowed"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[SEEndPointConfiguration signAllowed](self, "signAllowed"), CFSTR("signAllowed"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[SEEndPointConfiguration exportEraseConfidentialMailBox](self, "exportEraseConfidentialMailBox"), CFSTR("exportEraseConfidentialMailBox"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[SEEndPointConfiguration compressedKeysAllowed](self, "compressedKeysAllowed"), CFSTR("compressedKeysAllowed"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[SEEndPointConfiguration confidentialDataAllowed](self, "confidentialDataAllowed"), CFSTR("confidentialDataAllowed"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[SEEndPointConfiguration serverIssuedKey](self, "serverIssuedKey"), CFSTR("serverIssuedKey"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[SEEndPointConfiguration fleetVehicle](self, "fleetVehicle"), CFSTR("fleetVehicle"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[SEEndPointConfiguration nfcExpressOnlyInLPM](self, "nfcExpressOnlyInLPM"), CFSTR("nfcExpressOnlyInLPM"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[SEEndPointConfiguration terminationNotPersisted](self, "terminationNotPersisted"), CFSTR("terminationNotPersisted"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[SEEndPointConfiguration lengthConfidentialMailBox](self, "lengthConfidentialMailBox"), CFSTR("lengthConfidentialMailBox"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[SEEndPointConfiguration offsetConfidentialMailBox](self, "offsetConfidentialMailBox"), CFSTR("offsetConfidentialMailBox"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[SEEndPointConfiguration lengthPrivateMailBox](self, "lengthPrivateMailBox"), CFSTR("lengthPrivateMailBox"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[SEEndPointConfiguration offsetPrivateMailBox](self, "offsetPrivateMailBox"), CFSTR("offsetPrivateMailBox"));

}

- (unsigned)opt1
{
  unsigned __int8 v3;
  NSObject *v4;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = -[SEEndPointConfiguration standardFlowAllowedOnContactless](self, "standardFlowAllowedOnContactless");
  if (-[SEEndPointConfiguration fastFlowAllowedOnContactless](self, "fastFlowAllowedOnContactless"))
    v3 |= 2u;
  if (-[SEEndPointConfiguration standardFlowAllowedOnWire](self, "standardFlowAllowedOnWire"))
    v3 |= 4u;
  if (-[SEEndPointConfiguration fastFlowAllowedOnWire](self, "fastFlowAllowedOnWire"))
    v3 |= 8u;
  if (-[SEEndPointConfiguration authorizeEndPointAllowed](self, "authorizeEndPointAllowed"))
    v3 |= 0x10u;
  if (-[SEEndPointConfiguration authorizeEndPointWithAuthorizeAllowed](self, "authorizeEndPointWithAuthorizeAllowed"))
    v3 |= 0x20u;
  if (-[SEEndPointConfiguration exchangeAllowedOnWire](self, "exchangeAllowedOnWire"))
    v3 |= 0x40u;
  if (-[SEEndPointConfiguration exchangeAllowedInFastFlow](self, "exchangeAllowedInFastFlow"))
    v3 |= 0x80u;
  SESDefaultLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v6[0] = 67109120;
    v6[1] = v3;
    _os_log_impl(&dword_20A048000, v4, OS_LOG_TYPE_INFO, "Returning SEEndPointConfiguration Opt1 %02X", (uint8_t *)v6, 8u);
  }

  return v3;
}

- (unsigned)opt2
{
  unsigned __int8 v3;
  NSObject *v4;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = -[SEEndPointConfiguration signAllowed](self, "signAllowed");
  if (-[SEEndPointConfiguration exportEraseConfidentialMailBox](self, "exportEraseConfidentialMailBox"))
    v3 |= 2u;
  if (-[SEEndPointConfiguration serverIssuedKey](self, "serverIssuedKey"))
    v3 |= 4u;
  if (-[SEEndPointConfiguration fleetVehicle](self, "fleetVehicle"))
    v3 |= 8u;
  if (-[SEEndPointConfiguration compressedKeysAllowed](self, "compressedKeysAllowed"))
    v3 |= 0x40u;
  if (-[SEEndPointConfiguration confidentialDataAllowed](self, "confidentialDataAllowed"))
    v3 |= 0x80u;
  SESDefaultLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v6[0] = 67109120;
    v6[1] = v3;
    _os_log_impl(&dword_20A048000, v4, OS_LOG_TYPE_INFO, "Returning SEEndPointConfiguration Opt2 %02X", (uint8_t *)v6, 8u);
  }

  return v3;
}

- (unsigned)optA
{
  _BOOL4 v3;
  int v4;
  NSObject *v5;
  _DWORD v7[2];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = -[SEEndPointConfiguration nfcExpressOnlyInLPM](self, "nfcExpressOnlyInLPM");
  if (-[SEEndPointConfiguration terminationNotPersisted](self, "terminationNotPersisted"))
    v4 = v3 | 2;
  else
    v4 = v3;
  SESDefaultLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v7[0] = 67109120;
    v7[1] = v4;
    _os_log_impl(&dword_20A048000, v5, OS_LOG_TYPE_INFO, "Returning SEEndPointConfiguration OptA %02X", (uint8_t *)v7, 8u);
  }

  return v4;
}

- (BOOL)enabledOnWire
{
  return self->_enabledOnWire;
}

- (void)setEnabledOnWire:(BOOL)a3
{
  self->_enabledOnWire = a3;
}

- (BOOL)enabledOnContactless
{
  return self->_enabledOnContactless;
}

- (void)setEnabledOnContactless:(BOOL)a3
{
  self->_enabledOnContactless = a3;
}

- (BOOL)standardFlowAllowedOnWire
{
  return self->_standardFlowAllowedOnWire;
}

- (void)setStandardFlowAllowedOnWire:(BOOL)a3
{
  self->_standardFlowAllowedOnWire = a3;
}

- (BOOL)standardFlowAllowedOnContactless
{
  return self->_standardFlowAllowedOnContactless;
}

- (void)setStandardFlowAllowedOnContactless:(BOOL)a3
{
  self->_standardFlowAllowedOnContactless = a3;
}

- (BOOL)fastFlowAllowedOnWire
{
  return self->_fastFlowAllowedOnWire;
}

- (void)setFastFlowAllowedOnWire:(BOOL)a3
{
  self->_fastFlowAllowedOnWire = a3;
}

- (BOOL)fastFlowAllowedOnContactless
{
  return self->_fastFlowAllowedOnContactless;
}

- (void)setFastFlowAllowedOnContactless:(BOOL)a3
{
  self->_fastFlowAllowedOnContactless = a3;
}

- (BOOL)exchangeAllowedOnWire
{
  return self->_exchangeAllowedOnWire;
}

- (void)setExchangeAllowedOnWire:(BOOL)a3
{
  self->_exchangeAllowedOnWire = a3;
}

- (BOOL)exchangeAllowedInFastFlow
{
  return self->_exchangeAllowedInFastFlow;
}

- (void)setExchangeAllowedInFastFlow:(BOOL)a3
{
  self->_exchangeAllowedInFastFlow = a3;
}

- (BOOL)authorizeEndPointAllowed
{
  return self->_authorizeEndPointAllowed;
}

- (void)setAuthorizeEndPointAllowed:(BOOL)a3
{
  self->_authorizeEndPointAllowed = a3;
}

- (BOOL)authorizeEndPointWithAuthorizeAllowed
{
  return self->_authorizeEndPointWithAuthorizeAllowed;
}

- (void)setAuthorizeEndPointWithAuthorizeAllowed:(BOOL)a3
{
  self->_authorizeEndPointWithAuthorizeAllowed = a3;
}

- (BOOL)signAllowed
{
  return self->_signAllowed;
}

- (void)setSignAllowed:(BOOL)a3
{
  self->_signAllowed = a3;
}

- (BOOL)exportEraseConfidentialMailBox
{
  return self->_exportEraseConfidentialMailBox;
}

- (void)setExportEraseConfidentialMailBox:(BOOL)a3
{
  self->_exportEraseConfidentialMailBox = a3;
}

- (BOOL)serverIssuedKey
{
  return self->_serverIssuedKey;
}

- (void)setServerIssuedKey:(BOOL)a3
{
  self->_serverIssuedKey = a3;
}

- (BOOL)fleetVehicle
{
  return self->_fleetVehicle;
}

- (void)setFleetVehicle:(BOOL)a3
{
  self->_fleetVehicle = a3;
}

- (BOOL)compressedKeysAllowed
{
  return self->_compressedKeysAllowed;
}

- (void)setCompressedKeysAllowed:(BOOL)a3
{
  self->_compressedKeysAllowed = a3;
}

- (BOOL)confidentialDataAllowed
{
  return self->_confidentialDataAllowed;
}

- (void)setConfidentialDataAllowed:(BOOL)a3
{
  self->_confidentialDataAllowed = a3;
}

- (BOOL)nfcExpressOnlyInLPM
{
  return self->_nfcExpressOnlyInLPM;
}

- (void)setNfcExpressOnlyInLPM:(BOOL)a3
{
  self->_nfcExpressOnlyInLPM = a3;
}

- (BOOL)terminationNotPersisted
{
  return self->_terminationNotPersisted;
}

- (void)setTerminationNotPersisted:(BOOL)a3
{
  self->_terminationNotPersisted = a3;
}

- (unsigned)lengthConfidentialMailBox
{
  return self->_lengthConfidentialMailBox;
}

- (void)setLengthConfidentialMailBox:(unsigned __int16)a3
{
  self->_lengthConfidentialMailBox = a3;
}

- (unsigned)offsetConfidentialMailBox
{
  return self->_offsetConfidentialMailBox;
}

- (void)setOffsetConfidentialMailBox:(unsigned __int16)a3
{
  self->_offsetConfidentialMailBox = a3;
}

- (unsigned)lengthPrivateMailBox
{
  return self->_lengthPrivateMailBox;
}

- (void)setLengthPrivateMailBox:(unsigned __int16)a3
{
  self->_lengthPrivateMailBox = a3;
}

- (unsigned)offsetPrivateMailBox
{
  return self->_offsetPrivateMailBox;
}

- (void)setOffsetPrivateMailBox:(unsigned __int16)a3
{
  self->_offsetPrivateMailBox = a3;
}

@end
