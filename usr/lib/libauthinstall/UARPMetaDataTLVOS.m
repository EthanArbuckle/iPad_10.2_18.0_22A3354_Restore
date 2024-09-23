@implementation UARPMetaDataTLVOS

- (UARPMetaDataTLVOS)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UARPMetaDataTLVOS;
  return -[UARPMetaDataTLVOS init](&v3, sel_init);
}

- (UARPMetaDataTLVOS)initWithType:(unsigned int)a3 length:(unsigned int)a4 value:(void *)a5
{
  UARPMetaDataTLVOS *v8;
  UARPMetaDataTLVOS *v9;
  NSData *v10;
  NSData *tlvValue;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)UARPMetaDataTLVOS;
  v8 = -[UARPMetaDataTLVOS init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_tlvType = a3;
    v8->_tlvLength = a4;
    v10 = (NSData *)(id)objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", a5, a4);
    tlvValue = v9->_tlvValue;
    v9->_tlvValue = v10;

  }
  return v9;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<Type = 0x%08x, Length = 0x%08x>"), self->_tlvType, self->_tlvLength);
}

+ (id)tlvFromType:(unsigned int)a3 length:(unsigned int)a4 value:(void *)a5
{
  __objc2_class *v5;
  UARPMetaDataTLVOS *v6;

  switch(a3)
  {
    case 0x88B29100:
      v5 = UARPTLVPersonalizationRequiredOS;
      goto LABEL_41;
    case 0x88B29101:
      v5 = UARPTLVPersonalizationPayloadTagOS;
      goto LABEL_41;
    case 0x88B29102:
      v5 = UARPTLVPersonalizationSuperBinaryAssetIDOS;
      goto LABEL_41;
    case 0x88B29103:
      v5 = UARPTLVPersonalizationManifestPrefixOS;
      goto LABEL_41;
    case 0x88B29104:
      v5 = UARPTLVPersonalizationBoardIDOS;
      goto LABEL_41;
    case 0x88B29105:
      v5 = UARPTLVPersonalizationChipIDOS;
      goto LABEL_41;
    case 0x88B29106:
      v5 = UARPTLVPersonalizationECIDOS;
      goto LABEL_41;
    case 0x88B29107:
      v5 = UARPTLVPersonalizationNonceOS;
      goto LABEL_41;
    case 0x88B29108:
      v5 = UARPTLVPersonalizationNonceHashOS;
      goto LABEL_41;
    case 0x88B29109:
      v5 = UARPTLVPersonalizationSecurityDomainOS;
      goto LABEL_41;
    case 0x88B2910A:
      v5 = UARPTLVPersonalizationSecurityModeOS;
      goto LABEL_41;
    case 0x88B2910B:
      v5 = UARPTLVPersonalizationProductionModeOS;
      goto LABEL_41;
    case 0x88B2910C:
      v5 = UARPTLVPersonalizationChipEpochOS;
      goto LABEL_41;
    case 0x88B2910D:
      v5 = UARPTLVPersonalizationEnableMixMatchOS;
      goto LABEL_41;
    case 0x88B2910E:
      v5 = UARPTLVPersonalizationSuperBinaryPayloadIndexOS;
      goto LABEL_41;
    case 0x88B2910F:
      v5 = UARPTLVPersonalizationChipRevisionOS;
      goto LABEL_41;
    case 0x88B29110:
      v5 = UARPTLVPersonalizationFTABPayloadOS;
      goto LABEL_41;
    case 0x88B29111:
      v5 = UARPTLVPersonalizationFTABSubfileTagOS;
      goto LABEL_41;
    case 0x88B29112:
      v5 = UARPTLVPersonalizationFTABSubfileLongnameOS;
      goto LABEL_41;
    case 0x88B29113:
      v5 = UARPTLVPersonalizationFTABSubfileDigestOS;
      goto LABEL_41;
    case 0x88B29114:
      v5 = UARPTLVPersonalizationFTABSubfileHashAlgorithmOS;
      goto LABEL_41;
    case 0x88B29115:
      v5 = UARPTLVPersonalizationFTABSubfileESECOS;
      goto LABEL_41;
    case 0x88B29116:
      v5 = UARPTLVPersonalizationFTABSubfileEPROOS;
      goto LABEL_41;
    case 0x88B29117:
      v5 = UARPTLVPersonalizationFTABSubfileTrustedOS;
      goto LABEL_41;
    case 0x88B29118:
      v5 = UARPTLVPersonalizationSoCLiveNonceOS;
      goto LABEL_41;
    case 0x88B29121:
      v5 = UARPTLVPersonalizationPrefixNeedsLogicalUnitNumberOS;
      goto LABEL_41;
    case 0x88B29122:
      v5 = UARPTLVPersonalizationSuffixNeedsLogicalUnitNumberOS;
      goto LABEL_41;
    case 0x88B29125:
      v5 = UARPTLVPersonalizationLogicalUnitNumberOS;
      goto LABEL_41;
    case 0x88B29126:
      v5 = UARPTLVPersonalizationTicketNeedsLogicalUnitNumberOS;
      goto LABEL_41;
    case 0x88B29128:
      v5 = UARPTLVHostPersonalizationRequiredOS;
      goto LABEL_41;
    case 0x88B29129:
      v5 = UARPTLVRequiredPersonalizationOptionOS;
      goto LABEL_41;
    case 0x88B29130:
      v5 = UARPTLVPersonalizedManifestOS;
      goto LABEL_41;
    case 0x88B29131:
      v5 = UARPTLVPersonalizationLifeOS;
      goto LABEL_41;
    case 0x88B29132:
      v5 = UARPTLVPersonalizationProvisioningOS;
      goto LABEL_41;
    case 0x88B29133:
      v5 = UARPTLVPersonalizationManifestEpochOS;
      goto LABEL_41;
    case 0x88B29134:
      v5 = UARPTLVPersonalizationManifestSuffixOS;
      goto LABEL_41;
    case 0x88B29135:
      v5 = UARPTLVPersonalizationECIDDataOS;
      goto LABEL_41;
    case 0x88B29136:
      v5 = UARPTLVPersonalizationFTABSubfileDigestFilenameOS;
LABEL_41:
      v6 = (UARPMetaDataTLVOS *)(id)-[__objc2_class tlvWithLength:value:](v5, "tlvWithLength:value:", a4, a5);
      break;
    default:
      v6 = -[UARPMetaDataTLVOS initWithType:length:value:]([UARPMetaDataTLVOS alloc], "initWithType:length:value:", *(_QWORD *)&a3, *(_QWORD *)&a4, a5);
      break;
  }
  return v6;
}

+ (id)tlvFromKey:(id)a3 value:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  id v13;
  id v14;
  unsigned int v15;
  id v16;
  void *v17;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v19 = a4;
  v6 = +[UARPMetaDataTLVOS metaDataTable](UARPMetaDataTLVOS, "metaDataTable");
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        v13 = (id)objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("Name"));
        if (!objc_msgSend(v5, "caseInsensitiveCompare:", v13))
        {
          v14 = (id)objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("Value"));
          v15 = objc_msgSend(v14, "unsignedLongValue") + 2001563392;
          if (v15 <= 0x35 && ((0x3F036601FFFFFFuLL >> v15) & 1) != 0)
          {
            v16 = (id)-[__objc2_class tlvFromPropertyListValue:](*off_24C5FE120[v15], "tlvFromPropertyListValue:", v19);
            v17 = v9;
            v9 = v16;

          }
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)metaDataTable
{
  if (metaDataTable_once != -1)
    dispatch_once(&metaDataTable_once, &__block_literal_global_1);
  return (id)metaDataTable_table;
}

void __34__UARPMetaDataTLVOS_metaDataTable__block_invoke()
{
  void *v0;
  id v1;
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  void *v39;

  v0 = (void *)objc_opt_new();
  v1 = +[UARPTLVPersonalizationRequiredOS metaDataTableEntry](UARPTLVPersonalizationRequiredOS, "metaDataTableEntry");
  objc_msgSend(v0, "addObject:", v1);

  v2 = +[UARPTLVPersonalizationPayloadTagOS metaDataTableEntry](UARPTLVPersonalizationPayloadTagOS, "metaDataTableEntry");
  objc_msgSend(v0, "addObject:", v2);

  v3 = +[UARPTLVPersonalizationSuperBinaryAssetIDOS metaDataTableEntry](UARPTLVPersonalizationSuperBinaryAssetIDOS, "metaDataTableEntry");
  objc_msgSend(v0, "addObject:", v3);

  v4 = +[UARPTLVPersonalizationManifestPrefixOS metaDataTableEntry](UARPTLVPersonalizationManifestPrefixOS, "metaDataTableEntry");
  objc_msgSend(v0, "addObject:", v4);

  v5 = +[UARPTLVPersonalizationBoardIDOS metaDataTableEntry](UARPTLVPersonalizationBoardIDOS, "metaDataTableEntry");
  objc_msgSend(v0, "addObject:", v5);

  v6 = +[UARPTLVPersonalizationChipIDOS metaDataTableEntry](UARPTLVPersonalizationChipIDOS, "metaDataTableEntry");
  objc_msgSend(v0, "addObject:", v6);

  v7 = +[UARPTLVPersonalizationECIDOS metaDataTableEntry](UARPTLVPersonalizationECIDOS, "metaDataTableEntry");
  objc_msgSend(v0, "addObject:", v7);

  v8 = +[UARPTLVPersonalizationECIDDataOS metaDataTableEntry](UARPTLVPersonalizationECIDDataOS, "metaDataTableEntry");
  objc_msgSend(v0, "addObject:", v8);

  v9 = +[UARPTLVPersonalizationNonceOS metaDataTableEntry](UARPTLVPersonalizationNonceOS, "metaDataTableEntry");
  objc_msgSend(v0, "addObject:", v9);

  v10 = +[UARPTLVPersonalizationNonceHashOS metaDataTableEntry](UARPTLVPersonalizationNonceHashOS, "metaDataTableEntry");
  objc_msgSend(v0, "addObject:", v10);

  v11 = +[UARPTLVPersonalizationSecurityDomainOS metaDataTableEntry](UARPTLVPersonalizationSecurityDomainOS, "metaDataTableEntry");
  objc_msgSend(v0, "addObject:", v11);

  v12 = +[UARPTLVPersonalizationSecurityModeOS metaDataTableEntry](UARPTLVPersonalizationSecurityModeOS, "metaDataTableEntry");
  objc_msgSend(v0, "addObject:", v12);

  v13 = +[UARPTLVPersonalizationProductionModeOS metaDataTableEntry](UARPTLVPersonalizationProductionModeOS, "metaDataTableEntry");
  objc_msgSend(v0, "addObject:", v13);

  v14 = +[UARPTLVPersonalizationChipEpochOS metaDataTableEntry](UARPTLVPersonalizationChipEpochOS, "metaDataTableEntry");
  objc_msgSend(v0, "addObject:", v14);

  v15 = +[UARPTLVPersonalizationEnableMixMatchOS metaDataTableEntry](UARPTLVPersonalizationEnableMixMatchOS, "metaDataTableEntry");
  objc_msgSend(v0, "addObject:", v15);

  v16 = +[UARPTLVPersonalizationSuperBinaryPayloadIndexOS metaDataTableEntry](UARPTLVPersonalizationSuperBinaryPayloadIndexOS, "metaDataTableEntry");
  objc_msgSend(v0, "addObject:", v16);

  v17 = +[UARPTLVPersonalizationChipRevisionOS metaDataTableEntry](UARPTLVPersonalizationChipRevisionOS, "metaDataTableEntry");
  objc_msgSend(v0, "addObject:", v17);

  v18 = +[UARPTLVPersonalizationFTABSubfileTagOS metaDataTableEntry](UARPTLVPersonalizationFTABSubfileTagOS, "metaDataTableEntry");
  objc_msgSend(v0, "addObject:", v18);

  v19 = +[UARPTLVPersonalizationFTABSubfileLongnameOS metaDataTableEntry](UARPTLVPersonalizationFTABSubfileLongnameOS, "metaDataTableEntry");
  objc_msgSend(v0, "addObject:", v19);

  v20 = +[UARPTLVPersonalizationFTABSubfileDigestOS metaDataTableEntry](UARPTLVPersonalizationFTABSubfileDigestOS, "metaDataTableEntry");
  objc_msgSend(v0, "addObject:", v20);

  v21 = +[UARPTLVPersonalizationFTABSubfileHashAlgorithmOS metaDataTableEntry](UARPTLVPersonalizationFTABSubfileHashAlgorithmOS, "metaDataTableEntry");
  objc_msgSend(v0, "addObject:", v21);

  v22 = +[UARPTLVPersonalizationFTABSubfileESECOS metaDataTableEntry](UARPTLVPersonalizationFTABSubfileESECOS, "metaDataTableEntry");
  objc_msgSend(v0, "addObject:", v22);

  v23 = +[UARPTLVPersonalizationFTABSubfileEPROOS metaDataTableEntry](UARPTLVPersonalizationFTABSubfileEPROOS, "metaDataTableEntry");
  objc_msgSend(v0, "addObject:", v23);

  v24 = +[UARPTLVPersonalizationFTABSubfileTrustedOS metaDataTableEntry](UARPTLVPersonalizationFTABSubfileTrustedOS, "metaDataTableEntry");
  objc_msgSend(v0, "addObject:", v24);

  v25 = +[UARPTLVPersonalizationSoCLiveNonceOS metaDataTableEntry](UARPTLVPersonalizationSoCLiveNonceOS, "metaDataTableEntry");
  objc_msgSend(v0, "addObject:", v25);

  v26 = +[UARPTLVPersonalizationPrefixNeedsLogicalUnitNumberOS metaDataTableEntry](UARPTLVPersonalizationPrefixNeedsLogicalUnitNumberOS, "metaDataTableEntry");
  objc_msgSend(v0, "addObject:", v26);

  v27 = +[UARPTLVPersonalizationSuffixNeedsLogicalUnitNumberOS metaDataTableEntry](UARPTLVPersonalizationSuffixNeedsLogicalUnitNumberOS, "metaDataTableEntry");
  objc_msgSend(v0, "addObject:", v27);

  v28 = +[UARPTLVPersonalizationLogicalUnitNumberOS metaDataTableEntry](UARPTLVPersonalizationLogicalUnitNumberOS, "metaDataTableEntry");
  objc_msgSend(v0, "addObject:", v28);

  v29 = +[UARPTLVPersonalizationTicketNeedsLogicalUnitNumberOS metaDataTableEntry](UARPTLVPersonalizationTicketNeedsLogicalUnitNumberOS, "metaDataTableEntry");
  objc_msgSend(v0, "addObject:", v29);

  v30 = +[UARPTLVHostPersonalizationRequiredOS metaDataTableEntry](UARPTLVHostPersonalizationRequiredOS, "metaDataTableEntry");
  objc_msgSend(v0, "addObject:", v30);

  v31 = +[UARPTLVRequiredPersonalizationOptionOS metaDataTableEntry](UARPTLVRequiredPersonalizationOptionOS, "metaDataTableEntry");
  objc_msgSend(v0, "addObject:", v31);

  v32 = +[UARPTLVPersonalizationFTABPayloadOS metaDataTableEntry](UARPTLVPersonalizationFTABPayloadOS, "metaDataTableEntry");
  objc_msgSend(v0, "addObject:", v32);

  v33 = +[UARPTLVPersonalizedManifestOS metaDataTableEntry](UARPTLVPersonalizedManifestOS, "metaDataTableEntry");
  objc_msgSend(v0, "addObject:", v33);

  v34 = +[UARPTLVPersonalizationLifeOS metaDataTableEntry](UARPTLVPersonalizationLifeOS, "metaDataTableEntry");
  objc_msgSend(v0, "addObject:", v34);

  v35 = +[UARPTLVPersonalizationProvisioningOS metaDataTableEntry](UARPTLVPersonalizationProvisioningOS, "metaDataTableEntry");
  objc_msgSend(v0, "addObject:", v35);

  v36 = +[UARPTLVPersonalizationManifestEpochOS metaDataTableEntry](UARPTLVPersonalizationManifestEpochOS, "metaDataTableEntry");
  objc_msgSend(v0, "addObject:", v36);

  v37 = +[UARPTLVPersonalizationManifestSuffixOS metaDataTableEntry](UARPTLVPersonalizationManifestSuffixOS, "metaDataTableEntry");
  objc_msgSend(v0, "addObject:", v37);

  v38 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v0);
  v39 = (void *)metaDataTable_table;
  metaDataTable_table = (uint64_t)v38;

}

+ (id)tlvTypeName:(unsigned int)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  id v9;
  id v10;
  char v11;
  id v12;
  id obj;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v3 = *(_QWORD *)&a3;
  v20 = *MEMORY[0x24BDAC8D0];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  obj = +[UARPMetaDataTLVOS metaDataTable](UARPMetaDataTLVOS, "metaDataTable");
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        v9 = (id)objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("Value"));
        v10 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v3);
        v11 = objc_msgSend(v9, "isEqual:", v10);

        if ((v11 & 1) != 0)
        {
          v12 = (id)objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("Name"));
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v5)
        continue;
      break;
    }
  }
  v12 = 0;
LABEL_11:

  return v12;
}

- (id)generateTLV
{
  id v3;
  id v4;
  int v6;
  int v7;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
  v7 = uarpHtonl(self->_tlvType);
  objc_msgSend(v3, "appendBytes:length:", &v7, 4);
  v6 = uarpHtonl(self->_tlvLength);
  objc_msgSend(v3, "appendBytes:length:", &v6, 4);
  objc_msgSend(v3, "appendData:", self->_tlvValue);
  v4 = (id)objc_msgSend(MEMORY[0x24BDBCE50], "dataWithData:", v3);

  return v4;
}

- (id)tlvValue
{
  return self->_tlvValue;
}

+ (id)metaDataTableEntry
{
  return 0;
}

+ (id)tlvFromPropertyListValue:(id)a3
{
  return 0;
}

+ (id)tlvWithLength:(unint64_t)a3 value:(void *)a4
{
  return 0;
}

- (unsigned)tlvType
{
  return self->_tlvType;
}

- (unsigned)tlvLength
{
  return self->_tlvLength;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tlvValue, 0);
}

@end
