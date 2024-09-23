@implementation STTelephonyStatusDomainSIMInfo

- (unint64_t)dataNetworkType
{
  return self->_dataNetworkType;
}

- (BOOL)isSIMPresent
{
  return self->_SIMPresent;
}

uint64_t __42__STTelephonyStatusDomainSIMInfo_isEqual___block_invoke_9(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "serviceDescription");
}

uint64_t __42__STTelephonyStatusDomainSIMInfo_isEqual___block_invoke_8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cellularServiceState");
}

uint64_t __42__STTelephonyStatusDomainSIMInfo_isEqual___block_invoke_7(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "serviceState");
}

uint64_t __42__STTelephonyStatusDomainSIMInfo_isEqual___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "maxSignalStrengthBars");
}

uint64_t __42__STTelephonyStatusDomainSIMInfo_isEqual___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "signalStrengthBars");
}

uint64_t __42__STTelephonyStatusDomainSIMInfo_isEqual___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "shortLabel");
}

uint64_t __42__STTelephonyStatusDomainSIMInfo_isEqual___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "label");
}

uint64_t __42__STTelephonyStatusDomainSIMInfo_isEqual___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "isBootstrap");
}

uint64_t __42__STTelephonyStatusDomainSIMInfo_isEqual___block_invoke_15(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "isCallForwardingEnabled");
}

uint64_t __42__STTelephonyStatusDomainSIMInfo_isEqual___block_invoke_14(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "isRegisteredWithoutCellular");
}

uint64_t __42__STTelephonyStatusDomainSIMInfo_isEqual___block_invoke_13(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "isPreferredForDataConnections");
}

uint64_t __42__STTelephonyStatusDomainSIMInfo_isEqual___block_invoke_12(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "isProvidingDataConnection");
}

uint64_t __42__STTelephonyStatusDomainSIMInfo_isEqual___block_invoke_11(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dataNetworkType");
}

uint64_t __42__STTelephonyStatusDomainSIMInfo_isEqual___block_invoke_10(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "secondaryServiceDescription");
}

uint64_t __42__STTelephonyStatusDomainSIMInfo_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "isSIMPresent");
}

- (unint64_t)signalStrengthBars
{
  return self->_signalStrengthBars;
}

- (NSString)shortLabel
{
  return self->_shortLabel;
}

- (unint64_t)serviceState
{
  return self->_serviceState;
}

- (NSString)serviceDescription
{
  return self->_serviceDescription;
}

- (NSString)secondaryServiceDescription
{
  return self->_secondaryServiceDescription;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[STTelephonyStatusDomainSIMInfo initWithSIMInfo:](+[STMutableTelephonyStatusDomainSIMInfo allocWithZone:](STMutableTelephonyStatusDomainSIMInfo, "allocWithZone:", a3), self);
}

- (unint64_t)maxSignalStrengthBars
{
  return self->_maxSignalStrengthBars;
}

- (NSString)label
{
  return self->_label;
}

- (BOOL)isRegisteredWithoutCellular
{
  return self->_registeredWithoutCellular;
}

- (BOOL)isProvidingDataConnection
{
  return self->_providingDataConnection;
}

- (BOOL)isPreferredForDataConnections
{
  return self->_preferredForDataConnections;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  _BOOL8 v6;
  uint64_t v7;
  id v8;
  id v9;
  _BOOL8 v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  unint64_t v19;
  id v20;
  id v21;
  unint64_t v22;
  id v23;
  id v24;
  unint64_t v25;
  id v26;
  id v27;
  unint64_t v28;
  id v29;
  id v30;
  void *v31;
  id v32;
  id v33;
  void *v34;
  id v35;
  id v36;
  unint64_t v37;
  id v38;
  id v39;
  _BOOL8 v40;
  id v41;
  id v42;
  _BOOL8 v43;
  id v44;
  id v45;
  _BOOL8 v46;
  id v47;
  id v48;
  _BOOL8 v49;
  id v50;
  id v51;
  _QWORD v53[4];
  id v54;
  _QWORD v55[4];
  id v56;
  _QWORD v57[4];
  id v58;
  _QWORD v59[4];
  id v60;
  _QWORD v61[4];
  id v62;
  _QWORD v63[4];
  id v64;
  _QWORD v65[4];
  id v66;
  _QWORD v67[4];
  id v68;
  _QWORD v69[4];
  id v70;
  _QWORD v71[4];
  id v72;
  _QWORD v73[4];
  id v74;
  _QWORD v75[4];
  id v76;
  _QWORD v77[4];
  id v78;
  _QWORD v79[4];
  id v80;
  _QWORD v81[4];
  id v82;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[STTelephonyStatusDomainSIMInfo isSIMPresent](self, "isSIMPresent");
  v7 = MEMORY[0x1E0C809B0];
  v81[0] = MEMORY[0x1E0C809B0];
  v81[1] = 3221225472;
  v81[2] = __42__STTelephonyStatusDomainSIMInfo_isEqual___block_invoke;
  v81[3] = &unk_1E91E4B28;
  v8 = v4;
  v82 = v8;
  v9 = (id)objc_msgSend(v5, "appendBool:counterpart:", v6, v81);
  v10 = -[STTelephonyStatusDomainSIMInfo isBootstrap](self, "isBootstrap");
  v79[0] = v7;
  v79[1] = 3221225472;
  v79[2] = __42__STTelephonyStatusDomainSIMInfo_isEqual___block_invoke_2;
  v79[3] = &unk_1E91E4B28;
  v11 = v8;
  v80 = v11;
  v12 = (id)objc_msgSend(v5, "appendBool:counterpart:", v10, v79);
  -[STTelephonyStatusDomainSIMInfo label](self, "label");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v77[0] = v7;
  v77[1] = 3221225472;
  v77[2] = __42__STTelephonyStatusDomainSIMInfo_isEqual___block_invoke_3;
  v77[3] = &unk_1E91E4B00;
  v14 = v11;
  v78 = v14;
  v15 = (id)objc_msgSend(v5, "appendString:counterpart:", v13, v77);

  -[STTelephonyStatusDomainSIMInfo shortLabel](self, "shortLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v75[0] = v7;
  v75[1] = 3221225472;
  v75[2] = __42__STTelephonyStatusDomainSIMInfo_isEqual___block_invoke_4;
  v75[3] = &unk_1E91E4B00;
  v17 = v14;
  v76 = v17;
  v18 = (id)objc_msgSend(v5, "appendString:counterpart:", v16, v75);

  v19 = -[STTelephonyStatusDomainSIMInfo signalStrengthBars](self, "signalStrengthBars");
  v73[0] = v7;
  v73[1] = 3221225472;
  v73[2] = __42__STTelephonyStatusDomainSIMInfo_isEqual___block_invoke_5;
  v73[3] = &unk_1E91E5108;
  v20 = v17;
  v74 = v20;
  v21 = (id)objc_msgSend(v5, "appendUnsignedInteger:counterpart:", v19, v73);
  v22 = -[STTelephonyStatusDomainSIMInfo maxSignalStrengthBars](self, "maxSignalStrengthBars");
  v71[0] = v7;
  v71[1] = 3221225472;
  v71[2] = __42__STTelephonyStatusDomainSIMInfo_isEqual___block_invoke_6;
  v71[3] = &unk_1E91E5108;
  v23 = v20;
  v72 = v23;
  v24 = (id)objc_msgSend(v5, "appendUnsignedInteger:counterpart:", v22, v71);
  v25 = -[STTelephonyStatusDomainSIMInfo serviceState](self, "serviceState");
  v69[0] = v7;
  v69[1] = 3221225472;
  v69[2] = __42__STTelephonyStatusDomainSIMInfo_isEqual___block_invoke_7;
  v69[3] = &unk_1E91E5108;
  v26 = v23;
  v70 = v26;
  v27 = (id)objc_msgSend(v5, "appendUnsignedInteger:counterpart:", v25, v69);
  v28 = -[STTelephonyStatusDomainSIMInfo cellularServiceState](self, "cellularServiceState");
  v67[0] = v7;
  v67[1] = 3221225472;
  v67[2] = __42__STTelephonyStatusDomainSIMInfo_isEqual___block_invoke_8;
  v67[3] = &unk_1E91E5108;
  v29 = v26;
  v68 = v29;
  v30 = (id)objc_msgSend(v5, "appendUnsignedInteger:counterpart:", v28, v67);
  -[STTelephonyStatusDomainSIMInfo serviceDescription](self, "serviceDescription");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v65[0] = v7;
  v65[1] = 3221225472;
  v65[2] = __42__STTelephonyStatusDomainSIMInfo_isEqual___block_invoke_9;
  v65[3] = &unk_1E91E4B00;
  v32 = v29;
  v66 = v32;
  v33 = (id)objc_msgSend(v5, "appendString:counterpart:", v31, v65);

  -[STTelephonyStatusDomainSIMInfo secondaryServiceDescription](self, "secondaryServiceDescription");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v63[0] = v7;
  v63[1] = 3221225472;
  v63[2] = __42__STTelephonyStatusDomainSIMInfo_isEqual___block_invoke_10;
  v63[3] = &unk_1E91E4B00;
  v35 = v32;
  v64 = v35;
  v36 = (id)objc_msgSend(v5, "appendString:counterpart:", v34, v63);

  v37 = -[STTelephonyStatusDomainSIMInfo dataNetworkType](self, "dataNetworkType");
  v61[0] = v7;
  v61[1] = 3221225472;
  v61[2] = __42__STTelephonyStatusDomainSIMInfo_isEqual___block_invoke_11;
  v61[3] = &unk_1E91E5108;
  v38 = v35;
  v62 = v38;
  v39 = (id)objc_msgSend(v5, "appendUnsignedInteger:counterpart:", v37, v61);
  v40 = -[STTelephonyStatusDomainSIMInfo isProvidingDataConnection](self, "isProvidingDataConnection");
  v59[0] = v7;
  v59[1] = 3221225472;
  v59[2] = __42__STTelephonyStatusDomainSIMInfo_isEqual___block_invoke_12;
  v59[3] = &unk_1E91E4B28;
  v41 = v38;
  v60 = v41;
  v42 = (id)objc_msgSend(v5, "appendBool:counterpart:", v40, v59);
  v43 = -[STTelephonyStatusDomainSIMInfo isPreferredForDataConnections](self, "isPreferredForDataConnections");
  v57[0] = v7;
  v57[1] = 3221225472;
  v57[2] = __42__STTelephonyStatusDomainSIMInfo_isEqual___block_invoke_13;
  v57[3] = &unk_1E91E4B28;
  v44 = v41;
  v58 = v44;
  v45 = (id)objc_msgSend(v5, "appendBool:counterpart:", v43, v57);
  v46 = -[STTelephonyStatusDomainSIMInfo isRegisteredWithoutCellular](self, "isRegisteredWithoutCellular");
  v55[0] = v7;
  v55[1] = 3221225472;
  v55[2] = __42__STTelephonyStatusDomainSIMInfo_isEqual___block_invoke_14;
  v55[3] = &unk_1E91E4B28;
  v47 = v44;
  v56 = v47;
  v48 = (id)objc_msgSend(v5, "appendBool:counterpart:", v46, v55);
  v49 = -[STTelephonyStatusDomainSIMInfo isCallForwardingEnabled](self, "isCallForwardingEnabled");
  v53[0] = v7;
  v53[1] = 3221225472;
  v53[2] = __42__STTelephonyStatusDomainSIMInfo_isEqual___block_invoke_15;
  v53[3] = &unk_1E91E4B28;
  v54 = v47;
  v50 = v47;
  v51 = (id)objc_msgSend(v5, "appendBool:counterpart:", v49, v53);
  LOBYTE(v47) = objc_msgSend(v5, "isEqual");

  return (char)v47;
}

- (BOOL)isCallForwardingEnabled
{
  return self->_callForwardingEnabled;
}

- (BOOL)isBootstrap
{
  return self->_bootstrap;
}

- (STTelephonyStatusDomainSIMInfo)init
{
  return (STTelephonyStatusDomainSIMInfo *)-[STTelephonyStatusDomainSIMInfo initWithSIMInfo:](self, 0);
}

- (id)initWithSIMPresent:(char)a3 bootstrap:(void *)a4 label:(void *)a5 shortLabel:(uint64_t)a6 signalStrengthBars:(uint64_t)a7 maxSignalStrengthBars:(uint64_t)a8 serviceState:(uint64_t)a9 cellularServiceState:(void *)a10 serviceDescription:(void *)a11 secondaryServiceDescription:(uint64_t)a12 dataNetworkType:(char)a13 providingDataConnection:(char)a14 preferredForDataConnections:(char)a15 registeredWithoutCellular:(char)a16 callForwardingEnabled:
{
  id v23;
  id v24;
  id v25;
  id v26;
  _BYTE *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  objc_super v37;

  v23 = a4;
  v24 = a5;
  v25 = a10;
  v26 = a11;
  if (a1)
  {
    v37.receiver = a1;
    v37.super_class = (Class)STTelephonyStatusDomainSIMInfo;
    v27 = objc_msgSendSuper2(&v37, sel_init);
    a1 = v27;
    if (v27)
    {
      v27[8] = a2;
      v27[9] = a3;
      v28 = objc_msgSend(v23, "copy");
      v29 = (void *)*((_QWORD *)a1 + 2);
      *((_QWORD *)a1 + 2) = v28;

      v30 = objc_msgSend(v24, "copy");
      v31 = (void *)*((_QWORD *)a1 + 3);
      *((_QWORD *)a1 + 3) = v30;

      *((_QWORD *)a1 + 4) = a6;
      *((_QWORD *)a1 + 5) = a7;
      *((_QWORD *)a1 + 6) = a8;
      *((_QWORD *)a1 + 7) = a9;
      v32 = objc_msgSend(v25, "copy");
      v33 = (void *)*((_QWORD *)a1 + 8);
      *((_QWORD *)a1 + 8) = v32;

      v34 = objc_msgSend(v26, "copy");
      v35 = (void *)*((_QWORD *)a1 + 9);
      *((_QWORD *)a1 + 9) = v34;

      *((_QWORD *)a1 + 10) = a12;
      *((_BYTE *)a1 + 88) = a13;
      *((_BYTE *)a1 + 89) = a14;
      *((_BYTE *)a1 + 90) = a15;
      *((_BYTE *)a1 + 91) = a16;
    }
  }

  return a1;
}

- (id)initWithSIMInfo:(void *)a1
{
  id v2;
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  char v8;
  char v9;
  char v10;
  char v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  char v18;
  char v19;

  v2 = a1;
  if (a1)
  {
    v3 = a2;
    v19 = objc_msgSend(v3, "isSIMPresent");
    v18 = objc_msgSend(v3, "isBootstrap");
    objc_msgSend(v3, "label");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "shortLabel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v3, "signalStrengthBars");
    v14 = objc_msgSend(v3, "maxSignalStrengthBars");
    v13 = objc_msgSend(v3, "serviceState");
    v4 = objc_msgSend(v3, "cellularServiceState");
    objc_msgSend(v3, "serviceDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "secondaryServiceDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v3, "dataNetworkType");
    v8 = objc_msgSend(v3, "isProvidingDataConnection");
    v9 = objc_msgSend(v3, "isPreferredForDataConnections");
    v10 = objc_msgSend(v3, "isRegisteredWithoutCellular");
    v11 = objc_msgSend(v3, "isCallForwardingEnabled");

    v2 = -[STTelephonyStatusDomainSIMInfo initWithSIMPresent:bootstrap:label:shortLabel:signalStrengthBars:maxSignalStrengthBars:serviceState:cellularServiceState:serviceDescription:secondaryServiceDescription:dataNetworkType:providingDataConnection:preferredForDataConnections:registeredWithoutCellular:callForwardingEnabled:](v2, v19, v18, v17, v16, v15, v14, v13, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  return v2;
}

- (unint64_t)cellularServiceState
{
  return self->_cellularServiceState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryServiceDescription, 0);
  objc_storeStrong((id *)&self->_serviceDescription, 0);
  objc_storeStrong((id *)&self->_shortLabel, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  unint64_t v23;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendBool:", -[STTelephonyStatusDomainSIMInfo isSIMPresent](self, "isSIMPresent"));
  v5 = (id)objc_msgSend(v3, "appendBool:", -[STTelephonyStatusDomainSIMInfo isBootstrap](self, "isBootstrap"));
  -[STTelephonyStatusDomainSIMInfo label](self, "label");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendString:", v6);

  -[STTelephonyStatusDomainSIMInfo shortLabel](self, "shortLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v3, "appendString:", v8);

  v10 = (id)objc_msgSend(v3, "appendUnsignedInteger:", -[STTelephonyStatusDomainSIMInfo signalStrengthBars](self, "signalStrengthBars"));
  v11 = (id)objc_msgSend(v3, "appendUnsignedInteger:", -[STTelephonyStatusDomainSIMInfo maxSignalStrengthBars](self, "maxSignalStrengthBars"));
  v12 = (id)objc_msgSend(v3, "appendUnsignedInteger:", -[STTelephonyStatusDomainSIMInfo serviceState](self, "serviceState"));
  v13 = (id)objc_msgSend(v3, "appendUnsignedInteger:", -[STTelephonyStatusDomainSIMInfo cellularServiceState](self, "cellularServiceState"));
  -[STTelephonyStatusDomainSIMInfo serviceDescription](self, "serviceDescription");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (id)objc_msgSend(v3, "appendString:", v14);

  -[STTelephonyStatusDomainSIMInfo secondaryServiceDescription](self, "secondaryServiceDescription");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (id)objc_msgSend(v3, "appendString:", v16);

  v18 = (id)objc_msgSend(v3, "appendUnsignedInteger:", -[STTelephonyStatusDomainSIMInfo dataNetworkType](self, "dataNetworkType"));
  v19 = (id)objc_msgSend(v3, "appendBool:", -[STTelephonyStatusDomainSIMInfo isProvidingDataConnection](self, "isProvidingDataConnection"));
  v20 = (id)objc_msgSend(v3, "appendBool:", -[STTelephonyStatusDomainSIMInfo isPreferredForDataConnections](self, "isPreferredForDataConnections"));
  v21 = (id)objc_msgSend(v3, "appendBool:", -[STTelephonyStatusDomainSIMInfo isRegisteredWithoutCellular](self, "isRegisteredWithoutCellular"));
  v22 = (id)objc_msgSend(v3, "appendBool:", -[STTelephonyStatusDomainSIMInfo isCallForwardingEnabled](self, "isCallForwardingEnabled"));
  v23 = objc_msgSend(v3, "hash");

  return v23;
}

- (NSString)description
{
  return (NSString *)-[STTelephonyStatusDomainSIMInfo descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[STTelephonyStatusDomainSIMInfo succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[STTelephonyStatusDomainSIMInfo descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[STTelephonyStatusDomainSIMInfo _descriptionBuilderWithMultilinePrefix:forDebug:](self, a3, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_descriptionBuilderWithMultilinePrefix:(uint64_t)a3 forDebug:
{
  id v3;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;
  id v11;

  v3 = a1;
  if (a1)
  {
    v5 = a2;
    objc_msgSend(v3, "succinctDescriptionBuilder");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setUseDebugDescription:", a3);
    objc_msgSend(v6, "setActiveMultilinePrefix:", v5);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __82__STTelephonyStatusDomainSIMInfo__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke;
    v9[3] = &unk_1E91E4AD8;
    v7 = v6;
    v10 = v7;
    v11 = v3;
    objc_msgSend(v7, "appendBodySectionWithName:multilinePrefix:block:", 0, v5, v9);

    v3 = v7;
  }
  return v3;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  return -[STTelephonyStatusDomainSIMInfo _descriptionBuilderWithMultilinePrefix:forDebug:](self, a3, 0);
}

id __82__STTelephonyStatusDomainSIMInfo__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  unint64_t v13;
  const __CFString *v14;
  id v15;
  void *v16;
  unint64_t v17;
  const __CFString *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  id v31;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isSIMPresent"), CFSTR("SIMPresent"));
  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isBootstrap"), CFSTR("bootstrap"));
  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v4, "appendObject:withName:", v5, CFSTR("label"));

  v7 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "shortLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v7, "appendObject:withName:", v8, CFSTR("shortLabel"));

  v10 = (id)objc_msgSend(*(id *)(a1 + 32), "appendUnsignedInteger:withName:", objc_msgSend(*(id *)(a1 + 40), "signalStrengthBars"), CFSTR("signalStrengthBars"));
  v11 = (id)objc_msgSend(*(id *)(a1 + 32), "appendUnsignedInteger:withName:", objc_msgSend(*(id *)(a1 + 40), "maxSignalStrengthBars"), CFSTR("maxSignalStrengthBars"));
  v12 = *(void **)(a1 + 32);
  v13 = objc_msgSend(*(id *)(a1 + 40), "serviceState") - 1;
  if (v13 > 2)
    v14 = CFSTR("No Service");
  else
    v14 = off_1E91E5220[v13];
  v15 = (id)objc_msgSend(v12, "appendObject:withName:", v14, CFSTR("serviceState"));
  v16 = *(void **)(a1 + 32);
  v17 = objc_msgSend(*(id *)(a1 + 40), "cellularServiceState") - 1;
  if (v17 > 2)
    v18 = CFSTR("No Service");
  else
    v18 = off_1E91E5220[v17];
  v19 = (id)objc_msgSend(v16, "appendObject:withName:", v18, CFSTR("cellularServiceState"));
  v20 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "serviceDescription");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (id)objc_msgSend(v20, "appendObject:withName:", v21, CFSTR("serviceDescription"));

  v23 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "secondaryServiceDescription");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (id)objc_msgSend(v23, "appendObject:withName:", v24, CFSTR("secondaryServiceDescription"));

  v26 = *(void **)(a1 + 32);
  STDescriptionForDataNetworkType(objc_msgSend(*(id *)(a1 + 40), "dataNetworkType"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (id)objc_msgSend(v26, "appendObject:withName:", v27, CFSTR("dataNetworkType"));

  v29 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isProvidingDataConnection"), CFSTR("providingDataConnection"));
  v30 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isPreferredForDataConnections"), CFSTR("preferredForDataConnections"));
  v31 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isRegisteredWithoutCellular"), CFSTR("registeredWithoutCellular"));
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isCallForwardingEnabled"), CFSTR("callForwardingEnabled"));
}

- (id)diffFromData:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    +[STTelephonyStatusDomainSIMInfoDiff diffFromInfo:toInfo:](STTelephonyStatusDomainSIMInfoDiff, "diffFromInfo:toInfo:", v4, self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)dataByApplyingDiff:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (objc_msgSend(v4, "isEmpty"))
    {
      v5 = (void *)-[STTelephonyStatusDomainSIMInfo copy](self, "copy");
    }
    else
    {
      v5 = (void *)-[STTelephonyStatusDomainSIMInfo mutableCopy](self, "mutableCopy");
      objc_msgSend(v4, "applyToMutableInfo:", v5);
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "encodeBool:forKey:", -[STTelephonyStatusDomainSIMInfo isSIMPresent](self, "isSIMPresent"), CFSTR("SIMPresent"));
  objc_msgSend(v8, "encodeBool:forKey:", -[STTelephonyStatusDomainSIMInfo isBootstrap](self, "isBootstrap"), CFSTR("bootstrap"));
  -[STTelephonyStatusDomainSIMInfo label](self, "label");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v4, CFSTR("label"));

  -[STTelephonyStatusDomainSIMInfo shortLabel](self, "shortLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v5, CFSTR("shortLabel"));

  objc_msgSend(v8, "encodeInteger:forKey:", -[STTelephonyStatusDomainSIMInfo signalStrengthBars](self, "signalStrengthBars"), CFSTR("signalStrengthBars"));
  objc_msgSend(v8, "encodeInteger:forKey:", -[STTelephonyStatusDomainSIMInfo maxSignalStrengthBars](self, "maxSignalStrengthBars"), CFSTR("maxSignalStrengthBars"));
  objc_msgSend(v8, "encodeInteger:forKey:", -[STTelephonyStatusDomainSIMInfo serviceState](self, "serviceState"), CFSTR("serviceState"));
  objc_msgSend(v8, "encodeInteger:forKey:", -[STTelephonyStatusDomainSIMInfo cellularServiceState](self, "cellularServiceState"), CFSTR("cellularServiceState"));
  -[STTelephonyStatusDomainSIMInfo serviceDescription](self, "serviceDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v6, CFSTR("serviceDescription"));

  -[STTelephonyStatusDomainSIMInfo secondaryServiceDescription](self, "secondaryServiceDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("secondaryServiceDescription"));

  objc_msgSend(v8, "encodeInteger:forKey:", -[STTelephonyStatusDomainSIMInfo dataNetworkType](self, "dataNetworkType"), CFSTR("dataNetworkType"));
  objc_msgSend(v8, "encodeBool:forKey:", -[STTelephonyStatusDomainSIMInfo isProvidingDataConnection](self, "isProvidingDataConnection"), CFSTR("providingDataConnection"));
  objc_msgSend(v8, "encodeBool:forKey:", -[STTelephonyStatusDomainSIMInfo isPreferredForDataConnections](self, "isPreferredForDataConnections"), CFSTR("preferredForDataConnections"));
  objc_msgSend(v8, "encodeBool:forKey:", -[STTelephonyStatusDomainSIMInfo isRegisteredWithoutCellular](self, "isRegisteredWithoutCellular"), CFSTR("registeredWithoutCellular"));
  objc_msgSend(v8, "encodeBool:forKey:", -[STTelephonyStatusDomainSIMInfo isCallForwardingEnabled](self, "isCallForwardingEnabled"), CFSTR("callForwardingEnabled"));

}

- (STTelephonyStatusDomainSIMInfo)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  char v9;
  char v10;
  char v11;
  char v12;
  STTelephonyStatusDomainSIMInfo *v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  char v19;
  char v20;

  v3 = a3;
  v20 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("SIMPresent"));
  v19 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("bootstrap"));
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("label"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("shortLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("signalStrengthBars"));
  v16 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("maxSignalStrengthBars"));
  v15 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("serviceState"));
  v5 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("cellularServiceState"));
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("serviceDescription"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("secondaryServiceDescription"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("dataNetworkType"));
  v9 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("providingDataConnection"));
  v10 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("preferredForDataConnections"));
  v11 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("registeredWithoutCellular"));
  v12 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("callForwardingEnabled"));

  v13 = (STTelephonyStatusDomainSIMInfo *)-[STTelephonyStatusDomainSIMInfo initWithSIMPresent:bootstrap:label:shortLabel:signalStrengthBars:maxSignalStrengthBars:serviceState:cellularServiceState:serviceDescription:secondaryServiceDescription:dataNetworkType:providingDataConnection:preferredForDataConnections:registeredWithoutCellular:callForwardingEnabled:](self, v20, v19, v18, v4, v17, v16, v15, v5, v6, v7, v8, v9, v10, v11, v12);
  return v13;
}

@end
