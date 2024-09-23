@implementation STTelephonySubscriptionInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastKnownNetworkCountryCode, 0);
  objc_storeStrong((id *)&self->_operatorName, 0);
  objc_storeStrong((id *)&self->_SIMStatus, 0);
  objc_storeStrong((id *)&self->_shortSIMLabel, 0);
  objc_storeStrong((id *)&self->_SIMLabel, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (id)initWithSubscriptionInfo:(id)a1
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  objc_super v23;

  v3 = a2;
  if (a1)
  {
    v23.receiver = a1;
    v23.super_class = (Class)STTelephonySubscriptionInfo;
    a1 = objc_msgSendSuper2(&v23, sel_init);
    if (a1)
    {
      objc_msgSend(v3, "identifier");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "copy");
      v6 = (void *)*((_QWORD *)a1 + 1);
      *((_QWORD *)a1 + 1) = v5;

      objc_msgSend(v3, "SIMLabel");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "copy");
      v9 = (void *)*((_QWORD *)a1 + 2);
      *((_QWORD *)a1 + 2) = v8;

      objc_msgSend(v3, "shortSIMLabel");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "copy");
      v12 = (void *)*((_QWORD *)a1 + 3);
      *((_QWORD *)a1 + 3) = v11;

      objc_msgSend(v3, "SIMStatus");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "copy");
      v15 = (void *)*((_QWORD *)a1 + 4);
      *((_QWORD *)a1 + 4) = v14;

      *((_BYTE *)a1 + 40) = objc_msgSend(v3, "isHiddenSIM");
      *((_QWORD *)a1 + 6) = objc_msgSend(v3, "registrationStatus");
      *((_QWORD *)a1 + 7) = objc_msgSend(v3, "cellularRegistrationStatus");
      *((_QWORD *)a1 + 8) = objc_msgSend(v3, "dataConnectionType");
      *((_BYTE *)a1 + 72) = objc_msgSend(v3, "isPreferredForDataConnections");
      *((_BYTE *)a1 + 73) = objc_msgSend(v3, "isProvidingDataConnection");
      *((_BYTE *)a1 + 74) = objc_msgSend(v3, "isBootstrap");
      *((_BYTE *)a1 + 75) = objc_msgSend(v3, "isRegisteredWithoutCellular");
      *((_QWORD *)a1 + 10) = objc_msgSend(v3, "signalStrengthBars");
      *((_QWORD *)a1 + 11) = objc_msgSend(v3, "maxSignalStrengthBars");
      objc_msgSend(v3, "operatorName");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "copy");
      v18 = (void *)*((_QWORD *)a1 + 12);
      *((_QWORD *)a1 + 12) = v17;

      objc_msgSend(v3, "lastKnownNetworkCountryCode");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "copy");
      v21 = (void *)*((_QWORD *)a1 + 13);
      *((_QWORD *)a1 + 13) = v20;

      *((_QWORD *)a1 + 14) = objc_msgSend(v3, "callForwardingIndicator");
      *((_BYTE *)a1 + 120) = objc_msgSend(v3, "isNetworkReselectionNeeded");
      *((_QWORD *)a1 + 16) = objc_msgSend(v3, "registrationRejectionCauseCode");
    }
  }

  return a1;
}

- (unint64_t)dataConnectionType
{
  return self->_dataConnectionType;
}

- (unint64_t)signalStrengthBars
{
  return self->_signalStrengthBars;
}

- (NSString)shortSIMLabel
{
  return self->_shortSIMLabel;
}

- (unint64_t)registrationStatus
{
  return self->_registrationStatus;
}

- (int64_t)registrationRejectionCauseCode
{
  return self->_registrationRejectionCauseCode;
}

- (NSString)operatorName
{
  return self->_operatorName;
}

- (unint64_t)maxSignalStrengthBars
{
  return self->_maxSignalStrengthBars;
}

- (NSString)lastKnownNetworkCountryCode
{
  return self->_lastKnownNetworkCountryCode;
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

- (BOOL)isNetworkReselectionNeeded
{
  return self->_networkReselectionNeeded;
}

- (BOOL)isHiddenSIM
{
  return self->_hiddenSIM;
}

- (BOOL)isBootstrap
{
  return self->_bootstrap;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (unint64_t)cellularRegistrationStatus
{
  return self->_cellularRegistrationStatus;
}

- (unint64_t)callForwardingIndicator
{
  return self->_callForwardingIndicator;
}

- (NSString)SIMStatus
{
  return self->_SIMStatus;
}

- (NSString)SIMLabel
{
  return self->_SIMLabel;
}

- (STTelephonySubscriptionInfo)init
{
  return (STTelephonySubscriptionInfo *)-[STTelephonySubscriptionInfo initWithSubscriptionInfo:](self, 0);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[STTelephonySubscriptionInfo initWithSubscriptionInfo:](+[STMutableTelephonySubscriptionInfo allocWithZone:](STMutableTelephonySubscriptionInfo, "allocWithZone:", a3), self);
}

- (NSString)description
{
  return (NSString *)-[STTelephonySubscriptionInfo descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (NSString)debugDescription
{
  return (NSString *)-[STTelephonySubscriptionInfo debugDescriptionWithMultilinePrefix:](self, "debugDescriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[STTelephonySubscriptionInfo succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[STTelephonySubscriptionInfo SIMStatus](self, "SIMStatus");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v4, CFSTR("SIMStatus"));

  v5 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", -[STTelephonySubscriptionInfo isHiddenSIM](self, "isHiddenSIM"), CFSTR("hiddenSIM"), 1);
  STTelephonyRegistrationStatusDebugName(-[STTelephonySubscriptionInfo registrationStatus](self, "registrationStatus"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v6, CFSTR("registrationStatus"));

  STTelephonyRegistrationStatusDebugName(-[STTelephonySubscriptionInfo cellularRegistrationStatus](self, "cellularRegistrationStatus"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v7, CFSTR("cellularRegistrationStatus"));

  STTelephonyDataConnectionTypeDebugName(-[STTelephonySubscriptionInfo dataConnectionType](self, "dataConnectionType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v8, CFSTR("dataConnectionType"));

  v9 = (id)objc_msgSend(v3, "appendUnsignedInteger:withName:", -[STTelephonySubscriptionInfo signalStrengthBars](self, "signalStrengthBars"), CFSTR("signalStrengthBars"));
  v10 = (id)objc_msgSend(v3, "appendBool:withName:", -[STTelephonySubscriptionInfo isPreferredForDataConnections](self, "isPreferredForDataConnections"), CFSTR("isPreferredForDataConnections"));
  v11 = (id)objc_msgSend(v3, "appendBool:withName:", -[STTelephonySubscriptionInfo isProvidingDataConnection](self, "isProvidingDataConnection"), CFSTR("isProvidingDataConnection"));
  -[STTelephonySubscriptionInfo operatorName](self, "operatorName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v12, CFSTR("operatorName"));

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[STTelephonySubscriptionInfo descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  STTelephonySubscriptionInfo *v12;

  v4 = (void *)MEMORY[0x1E0D01748];
  v5 = a3;
  objc_msgSend(v4, "builderWithObject:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __69__STTelephonySubscriptionInfo_descriptionBuilderWithMultilinePrefix___block_invoke;
  v10[3] = &unk_1E8E17F10;
  v7 = v6;
  v11 = v7;
  v12 = self;
  objc_msgSend(v7, "appendBodySectionWithName:multilinePrefix:block:", 0, v5, v10);

  v8 = v7;
  return v8;
}

void __69__STTelephonySubscriptionInfo_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "SIMStatus");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendString:withName:", v3, CFSTR("SIMStatus"));

  v4 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:ifEqualTo:", objc_msgSend(*(id *)(a1 + 40), "isHiddenSIM"), CFSTR("hiddenSIM"), 1);
  v5 = *(void **)(a1 + 32);
  STTelephonyRegistrationStatusDebugName(objc_msgSend(*(id *)(a1 + 40), "registrationStatus"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendString:withName:", v6, CFSTR("registrationStatus"));

  v7 = *(void **)(a1 + 32);
  STTelephonyRegistrationStatusDebugName(objc_msgSend(*(id *)(a1 + 40), "cellularRegistrationStatus"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendString:withName:", v8, CFSTR("cellularRegistrationStatus"));

  v9 = *(void **)(a1 + 32);
  STTelephonyDataConnectionTypeDebugName(objc_msgSend(*(id *)(a1 + 40), "dataConnectionType"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendString:withName:", v10, CFSTR("dataConnectionType"));

  v11 = (id)objc_msgSend(*(id *)(a1 + 32), "appendUnsignedInteger:withName:", objc_msgSend(*(id *)(a1 + 40), "signalStrengthBars"), CFSTR("signalStrengthBars"));
  v12 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isPreferredForDataConnections"), CFSTR("isPreferredForDataConnections"));
  v13 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isProvidingDataConnection"), CFSTR("isProvidingDataConnection"));
  v14 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "operatorName");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "appendString:withName:", v15, CFSTR("operatorName"));

}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  STTelephonySubscriptionInfo *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  id (*v12)(uint64_t);
  void *v13;
  id v14;
  STTelephonySubscriptionInfo *v15;

  v3 = self;
  if (self)
  {
    v4 = (void *)MEMORY[0x1E0D01748];
    v5 = a3;
    objc_msgSend(v4, "builderWithObject:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setUseDebugDescription:", 1);
    v10 = MEMORY[0x1E0C809B0];
    v11 = 3221225472;
    v12 = __74__STTelephonySubscriptionInfo_debugDescriptionBuilderWithMultilinePrefix___block_invoke;
    v13 = &unk_1E8E17F10;
    v7 = v6;
    v14 = v7;
    v15 = v3;
    objc_msgSend(v7, "appendBodySectionWithName:multilinePrefix:block:", 0, v5, &v10);

    v3 = (STTelephonySubscriptionInfo *)v7;
  }
  -[STTelephonySubscriptionInfo build](v3, "build", a3, v10, v11, v12, v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __74__STTelephonySubscriptionInfo_debugDescriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendString:withName:", v3, CFSTR("identifier"));

  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "SIMLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:", v5, CFSTR("SIMLabel"));

  v6 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "shortSIMLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendString:withName:", v7, CFSTR("shortSIMLabel"));

  v8 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "SIMStatus");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendString:withName:", v9, CFSTR("SIMStatus"));

  v10 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:ifEqualTo:", objc_msgSend(*(id *)(a1 + 40), "isHiddenSIM"), CFSTR("hiddenSIM"), 1);
  v11 = *(void **)(a1 + 32);
  STTelephonyRegistrationStatusDebugName(objc_msgSend(*(id *)(a1 + 40), "registrationStatus"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "appendString:withName:", v12, CFSTR("registrationStatus"));

  v13 = *(void **)(a1 + 32);
  STTelephonyRegistrationStatusDebugName(objc_msgSend(*(id *)(a1 + 40), "cellularRegistrationStatus"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "appendString:withName:", v14, CFSTR("cellularRegistrationStatus"));

  v15 = *(void **)(a1 + 32);
  STTelephonyDataConnectionTypeDebugName(objc_msgSend(*(id *)(a1 + 40), "dataConnectionType"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "appendString:withName:", v16, CFSTR("dataConnectionType"));

  v17 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isPreferredForDataConnections"), CFSTR("isPreferredForDataConnections"));
  v18 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isProvidingDataConnection"), CFSTR("isProvidingDataConnection"));
  v19 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isBootstrap"), CFSTR("isBootstrap"));
  v20 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isRegisteredWithoutCellular"), CFSTR("isRegisteredWithoutCellular"));
  v21 = (id)objc_msgSend(*(id *)(a1 + 32), "appendUnsignedInteger:withName:", objc_msgSend(*(id *)(a1 + 40), "signalStrengthBars"), CFSTR("signalStrengthBars"));
  v22 = (id)objc_msgSend(*(id *)(a1 + 32), "appendUnsignedInteger:withName:", objc_msgSend(*(id *)(a1 + 40), "maxSignalStrengthBars"), CFSTR("maxSignalStrengthBars"));
  v23 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "operatorName");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "appendString:withName:", v24, CFSTR("operatorName"));

  v25 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "lastKnownNetworkCountryCode");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "appendString:withName:", v26, CFSTR("lastKnownNetworkCountryCode"));

  v27 = *(void **)(a1 + 32);
  STTelephonyCallForwardingIndicatorDebugName(objc_msgSend(*(id *)(a1 + 40), "callForwardingIndicator"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "appendString:withName:", v28, CFSTR("callForwardingIndicator"));

  v29 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isNetworkReselectionNeeded"), CFSTR("isNetworkReselectionNeeded"));
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendInteger:withName:", objc_msgSend(*(id *)(a1 + 40), "registrationRejectionCauseCode"), CFSTR("registrationRejectionCauseCode"));
}

@end
