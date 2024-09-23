@implementation UARPMetaDataTLV

- (UARPMetaDataTLV)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UARPMetaDataTLV;
  return -[UARPMetaDataTLV init](&v3, sel_init);
}

- (UARPMetaDataTLV)initWithType:(unsigned int)a3 length:(unsigned int)a4 value:(void *)a5
{
  UARPMetaDataTLV *v8;
  UARPMetaDataTLV *v9;
  uint64_t v10;
  NSData *tlvValue;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)UARPMetaDataTLV;
  v8 = -[UARPMetaDataTLV init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_tlvType = a3;
    v8->_tlvLength = a4;
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", a5, a4);
    v10 = objc_claimAutoreleasedReturnValue();
    tlvValue = v9->_tlvValue;
    v9->_tlvValue = (NSData *)v10;

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
  UARPMetaDataTLV *v6;

  switch(a3)
  {
    case 0x88B29100:
      v5 = UARPTLVPersonalizationRequired;
      goto LABEL_41;
    case 0x88B29101:
      v5 = UARPTLVPersonalizationPayloadTag;
      goto LABEL_41;
    case 0x88B29102:
      v5 = UARPTLVPersonalizationSuperBinaryAssetID;
      goto LABEL_41;
    case 0x88B29103:
      v5 = UARPTLVPersonalizationManifestPrefix;
      goto LABEL_41;
    case 0x88B29104:
      v5 = UARPTLVPersonalizationBoardID;
      goto LABEL_41;
    case 0x88B29105:
      v5 = UARPTLVPersonalizationChipID;
      goto LABEL_41;
    case 0x88B29106:
      v5 = UARPTLVPersonalizationECID;
      goto LABEL_41;
    case 0x88B29107:
      v5 = UARPTLVPersonalizationNonce;
      goto LABEL_41;
    case 0x88B29108:
      v5 = UARPTLVPersonalizationNonceHash;
      goto LABEL_41;
    case 0x88B29109:
      v5 = UARPTLVPersonalizationSecurityDomain;
      goto LABEL_41;
    case 0x88B2910A:
      v5 = UARPTLVPersonalizationSecurityMode;
      goto LABEL_41;
    case 0x88B2910B:
      v5 = UARPTLVPersonalizationProductionMode;
      goto LABEL_41;
    case 0x88B2910C:
      v5 = UARPTLVPersonalizationChipEpoch;
      goto LABEL_41;
    case 0x88B2910D:
      v5 = UARPTLVPersonalizationEnableMixMatch;
      goto LABEL_41;
    case 0x88B2910E:
      v5 = UARPTLVPersonalizationSuperBinaryPayloadIndex;
      goto LABEL_41;
    case 0x88B2910F:
      v5 = UARPTLVPersonalizationChipRevision;
      goto LABEL_41;
    case 0x88B29110:
      v5 = UARPTLVPersonalizationFTABPayload;
      goto LABEL_41;
    case 0x88B29111:
      v5 = UARPTLVPersonalizationFTABSubfileTag;
      goto LABEL_41;
    case 0x88B29112:
      v5 = UARPTLVPersonalizationFTABSubfileLongname;
      goto LABEL_41;
    case 0x88B29113:
      v5 = UARPTLVPersonalizationFTABSubfileDigest;
      goto LABEL_41;
    case 0x88B29114:
      v5 = UARPTLVPersonalizationFTABSubfileHashAlgorithm;
      goto LABEL_41;
    case 0x88B29115:
      v5 = UARPTLVPersonalizationFTABSubfileESEC;
      goto LABEL_41;
    case 0x88B29116:
      v5 = UARPTLVPersonalizationFTABSubfileEPRO;
      goto LABEL_41;
    case 0x88B29117:
      v5 = UARPTLVPersonalizationFTABSubfileTrusted;
      goto LABEL_41;
    case 0x88B29118:
      v5 = UARPTLVPersonalizationSoCLiveNonce;
      goto LABEL_41;
    case 0x88B29121:
      v5 = UARPTLVPersonalizationPrefixNeedsLogicalUnitNumber;
      goto LABEL_41;
    case 0x88B29122:
      v5 = UARPTLVPersonalizationSuffixNeedsLogicalUnitNumber;
      goto LABEL_41;
    case 0x88B29125:
      v5 = UARPTLVPersonalizationLogicalUnitNumber;
      goto LABEL_41;
    case 0x88B29126:
      v5 = UARPTLVPersonalizationTicketNeedsLogicalUnitNumber;
      goto LABEL_41;
    case 0x88B29128:
      v5 = UARPTLVHostPersonalizationRequired;
      goto LABEL_41;
    case 0x88B29129:
      v5 = UARPTLVRequiredPersonalizationOption;
      goto LABEL_41;
    case 0x88B29130:
      v5 = UARPTLVPersonalizedManifest;
      goto LABEL_41;
    case 0x88B29131:
      v5 = UARPTLVPersonalizationLife;
      goto LABEL_41;
    case 0x88B29132:
      v5 = UARPTLVPersonalizationProvisioning;
      goto LABEL_41;
    case 0x88B29133:
      v5 = UARPTLVPersonalizationManifestEpoch;
      goto LABEL_41;
    case 0x88B29134:
      v5 = UARPTLVPersonalizationManifestSuffix;
      goto LABEL_41;
    case 0x88B29135:
      v5 = UARPTLVPersonalizationECIDData;
      goto LABEL_41;
    case 0x88B29136:
      v5 = UARPTLVPersonalizationFTABSubfileDigestFilename;
LABEL_41:
      -[__objc2_class tlvWithLength:value:](v5, "tlvWithLength:value:", a4, a5);
      v6 = (UARPMetaDataTLV *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v6 = -[UARPMetaDataTLV initWithType:length:value:]([UARPMetaDataTLV alloc], "initWithType:length:value:", *(_QWORD *)&a3, *(_QWORD *)&a4, a5);
      break;
  }
  return v6;
}

+ (id)tlvFromKey:(id)a3 value:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  uint64_t v16;
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
  +[UARPMetaDataTLV metaDataTable](UARPMetaDataTLV, "metaDataTable");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
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
        objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("Name"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v5, "caseInsensitiveCompare:", v13))
        {
          objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("Value"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "unsignedLongValue") + 2001563392;
          if (v15 <= 0x35 && ((0x3F036601FFFFFFuLL >> v15) & 1) != 0)
          {
            -[__objc2_class tlvFromPropertyListValue:](off_251CE4E80[v15]->isa, "tlvFromPropertyListValue:", v19);
            v16 = objc_claimAutoreleasedReturnValue();
            v17 = v9;
            v9 = (void *)v16;

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
    dispatch_once(&metaDataTable_once, &__block_literal_global_2);
  return (id)metaDataTable_table;
}

void __32__UARPMetaDataTLV_metaDataTable__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
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
  uint64_t v37;
  void *v38;
  id v39;

  v39 = (id)objc_opt_new();
  +[UARPTLVPersonalizationRequired metaDataTableEntry](UARPTLVPersonalizationRequired, "metaDataTableEntry");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "addObject:", v0);

  +[UARPTLVPersonalizationPayloadTag metaDataTableEntry](UARPTLVPersonalizationPayloadTag, "metaDataTableEntry");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "addObject:", v1);

  +[UARPTLVPersonalizationSuperBinaryAssetID metaDataTableEntry](UARPTLVPersonalizationSuperBinaryAssetID, "metaDataTableEntry");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "addObject:", v2);

  +[UARPTLVPersonalizationManifestPrefix metaDataTableEntry](UARPTLVPersonalizationManifestPrefix, "metaDataTableEntry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "addObject:", v3);

  +[UARPTLVPersonalizationBoardID metaDataTableEntry](UARPTLVPersonalizationBoardID, "metaDataTableEntry");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "addObject:", v4);

  +[UARPTLVPersonalizationChipID metaDataTableEntry](UARPTLVPersonalizationChipID, "metaDataTableEntry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "addObject:", v5);

  +[UARPTLVPersonalizationECID metaDataTableEntry](UARPTLVPersonalizationECID, "metaDataTableEntry");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "addObject:", v6);

  +[UARPTLVPersonalizationECIDData metaDataTableEntry](UARPTLVPersonalizationECIDData, "metaDataTableEntry");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "addObject:", v7);

  +[UARPTLVPersonalizationNonce metaDataTableEntry](UARPTLVPersonalizationNonce, "metaDataTableEntry");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "addObject:", v8);

  +[UARPTLVPersonalizationNonceHash metaDataTableEntry](UARPTLVPersonalizationNonceHash, "metaDataTableEntry");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "addObject:", v9);

  +[UARPTLVPersonalizationSecurityDomain metaDataTableEntry](UARPTLVPersonalizationSecurityDomain, "metaDataTableEntry");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "addObject:", v10);

  +[UARPTLVPersonalizationSecurityMode metaDataTableEntry](UARPTLVPersonalizationSecurityMode, "metaDataTableEntry");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "addObject:", v11);

  +[UARPTLVPersonalizationProductionMode metaDataTableEntry](UARPTLVPersonalizationProductionMode, "metaDataTableEntry");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "addObject:", v12);

  +[UARPTLVPersonalizationChipEpoch metaDataTableEntry](UARPTLVPersonalizationChipEpoch, "metaDataTableEntry");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "addObject:", v13);

  +[UARPTLVPersonalizationEnableMixMatch metaDataTableEntry](UARPTLVPersonalizationEnableMixMatch, "metaDataTableEntry");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "addObject:", v14);

  +[UARPTLVPersonalizationSuperBinaryPayloadIndex metaDataTableEntry](UARPTLVPersonalizationSuperBinaryPayloadIndex, "metaDataTableEntry");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "addObject:", v15);

  +[UARPTLVPersonalizationChipRevision metaDataTableEntry](UARPTLVPersonalizationChipRevision, "metaDataTableEntry");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "addObject:", v16);

  +[UARPTLVPersonalizationFTABSubfileTag metaDataTableEntry](UARPTLVPersonalizationFTABSubfileTag, "metaDataTableEntry");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "addObject:", v17);

  +[UARPTLVPersonalizationFTABSubfileLongname metaDataTableEntry](UARPTLVPersonalizationFTABSubfileLongname, "metaDataTableEntry");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "addObject:", v18);

  +[UARPTLVPersonalizationFTABSubfileDigest metaDataTableEntry](UARPTLVPersonalizationFTABSubfileDigest, "metaDataTableEntry");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "addObject:", v19);

  +[UARPTLVPersonalizationFTABSubfileHashAlgorithm metaDataTableEntry](UARPTLVPersonalizationFTABSubfileHashAlgorithm, "metaDataTableEntry");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "addObject:", v20);

  +[UARPTLVPersonalizationFTABSubfileESEC metaDataTableEntry](UARPTLVPersonalizationFTABSubfileESEC, "metaDataTableEntry");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "addObject:", v21);

  +[UARPTLVPersonalizationFTABSubfileEPRO metaDataTableEntry](UARPTLVPersonalizationFTABSubfileEPRO, "metaDataTableEntry");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "addObject:", v22);

  +[UARPTLVPersonalizationFTABSubfileTrusted metaDataTableEntry](UARPTLVPersonalizationFTABSubfileTrusted, "metaDataTableEntry");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "addObject:", v23);

  +[UARPTLVPersonalizationSoCLiveNonce metaDataTableEntry](UARPTLVPersonalizationSoCLiveNonce, "metaDataTableEntry");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "addObject:", v24);

  +[UARPTLVPersonalizationPrefixNeedsLogicalUnitNumber metaDataTableEntry](UARPTLVPersonalizationPrefixNeedsLogicalUnitNumber, "metaDataTableEntry");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "addObject:", v25);

  +[UARPTLVPersonalizationSuffixNeedsLogicalUnitNumber metaDataTableEntry](UARPTLVPersonalizationSuffixNeedsLogicalUnitNumber, "metaDataTableEntry");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "addObject:", v26);

  +[UARPTLVPersonalizationLogicalUnitNumber metaDataTableEntry](UARPTLVPersonalizationLogicalUnitNumber, "metaDataTableEntry");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "addObject:", v27);

  +[UARPTLVPersonalizationTicketNeedsLogicalUnitNumber metaDataTableEntry](UARPTLVPersonalizationTicketNeedsLogicalUnitNumber, "metaDataTableEntry");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "addObject:", v28);

  +[UARPTLVHostPersonalizationRequired metaDataTableEntry](UARPTLVHostPersonalizationRequired, "metaDataTableEntry");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "addObject:", v29);

  +[UARPTLVRequiredPersonalizationOption metaDataTableEntry](UARPTLVRequiredPersonalizationOption, "metaDataTableEntry");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "addObject:", v30);

  +[UARPTLVPersonalizationFTABPayload metaDataTableEntry](UARPTLVPersonalizationFTABPayload, "metaDataTableEntry");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "addObject:", v31);

  +[UARPTLVPersonalizedManifest metaDataTableEntry](UARPTLVPersonalizedManifest, "metaDataTableEntry");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "addObject:", v32);

  +[UARPTLVPersonalizationLife metaDataTableEntry](UARPTLVPersonalizationLife, "metaDataTableEntry");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "addObject:", v33);

  +[UARPTLVPersonalizationProvisioning metaDataTableEntry](UARPTLVPersonalizationProvisioning, "metaDataTableEntry");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "addObject:", v34);

  +[UARPTLVPersonalizationManifestEpoch metaDataTableEntry](UARPTLVPersonalizationManifestEpoch, "metaDataTableEntry");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "addObject:", v35);

  +[UARPTLVPersonalizationManifestSuffix metaDataTableEntry](UARPTLVPersonalizationManifestSuffix, "metaDataTableEntry");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "addObject:", v36);

  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v39);
  v37 = objc_claimAutoreleasedReturnValue();
  v38 = (void *)metaDataTable_table;
  metaDataTable_table = v37;

}

+ (id)tlvTypeName:(unsigned int)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
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
  +[UARPMetaDataTLV metaDataTable](UARPMetaDataTLV, "metaDataTable");
  obj = (id)objc_claimAutoreleasedReturnValue();
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
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("Value"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v3);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "isEqual:", v10);

        if ((v11 & 1) != 0)
        {
          objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("Name"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
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
  void *v4;
  int v6;
  int v7;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
  v7 = uarpHtonl(self->_tlvType);
  objc_msgSend(v3, "appendBytes:length:", &v7, 4);
  v6 = uarpHtonl(self->_tlvLength);
  objc_msgSend(v3, "appendBytes:length:", &v6, 4);
  objc_msgSend(v3, "appendData:", self->_tlvValue);
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithData:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

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
