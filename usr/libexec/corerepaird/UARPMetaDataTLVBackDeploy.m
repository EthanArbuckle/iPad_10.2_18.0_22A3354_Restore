@implementation UARPMetaDataTLVBackDeploy

- (UARPMetaDataTLVBackDeploy)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UARPMetaDataTLVBackDeploy;
  return -[UARPMetaDataTLVBackDeploy init](&v3, "init");
}

- (UARPMetaDataTLVBackDeploy)initWithType:(unsigned int)a3 length:(unsigned int)a4 value:(void *)a5
{
  UARPMetaDataTLVBackDeploy *v8;
  UARPMetaDataTLVBackDeploy *v9;
  NSData *v10;
  NSData *tlvValue;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)UARPMetaDataTLVBackDeploy;
  v8 = -[UARPMetaDataTLVBackDeploy init](&v13, "init");
  v9 = v8;
  if (v8)
  {
    v8->_tlvType = a3;
    v8->_tlvLength = a4;
    v10 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", a5, a4);
    tlvValue = v9->_tlvValue;
    v9->_tlvValue = v10;

  }
  return v9;
}

- (id)description
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<Type = 0x%08x, Length = 0x%08x>"), self->_tlvType, self->_tlvLength);
}

+ (id)tlvFromType:(unsigned int)a3 length:(unsigned int)a4 value:(void *)a5
{
  __objc2_class *v5;
  UARPMetaDataTLVBackDeploy *v6;

  switch(a3)
  {
    case 0x88B29100:
      v5 = UARPTLVPersonalizationRequiredBackDeploy;
      goto LABEL_41;
    case 0x88B29101:
      v5 = UARPTLVPersonalizationPayloadTagBackDeploy;
      goto LABEL_41;
    case 0x88B29102:
      v5 = UARPTLVPersonalizationSuperBinaryAssetIDBackDeploy;
      goto LABEL_41;
    case 0x88B29103:
      v5 = UARPTLVPersonalizationManifestPrefixBackDeploy;
      goto LABEL_41;
    case 0x88B29104:
      v5 = UARPTLVPersonalizationBoardIDBackDeploy;
      goto LABEL_41;
    case 0x88B29105:
      v5 = UARPTLVPersonalizationChipIDBackDeploy;
      goto LABEL_41;
    case 0x88B29106:
      v5 = UARPTLVPersonalizationECIDBackDeploy;
      goto LABEL_41;
    case 0x88B29107:
      v5 = UARPTLVPersonalizationNonceBackDeploy;
      goto LABEL_41;
    case 0x88B29108:
      v5 = UARPTLVPersonalizationNonceHashBackDeploy;
      goto LABEL_41;
    case 0x88B29109:
      v5 = UARPTLVPersonalizationSecurityDomainBackDeploy;
      goto LABEL_41;
    case 0x88B2910A:
      v5 = UARPTLVPersonalizationSecurityModeBackDeploy;
      goto LABEL_41;
    case 0x88B2910B:
      v5 = UARPTLVPersonalizationProductionModeBackDeploy;
      goto LABEL_41;
    case 0x88B2910C:
      v5 = UARPTLVPersonalizationChipEpochBackDeploy;
      goto LABEL_41;
    case 0x88B2910D:
      v5 = UARPTLVPersonalizationEnableMixMatchBackDeploy;
      goto LABEL_41;
    case 0x88B2910E:
      v5 = UARPTLVPersonalizationSuperBinaryPayloadIndexBackDeploy;
      goto LABEL_41;
    case 0x88B2910F:
      v5 = UARPTLVPersonalizationChipRevisionBackDeploy;
      goto LABEL_41;
    case 0x88B29110:
      v5 = UARPTLVPersonalizationFTABPayloadBackDeploy;
      goto LABEL_41;
    case 0x88B29111:
      v5 = UARPTLVPersonalizationFTABSubfileTagBackDeploy;
      goto LABEL_41;
    case 0x88B29112:
      v5 = UARPTLVPersonalizationFTABSubfileLongnameBackDeploy;
      goto LABEL_41;
    case 0x88B29113:
      v5 = UARPTLVPersonalizationFTABSubfileDigestBackDeploy;
      goto LABEL_41;
    case 0x88B29114:
      v5 = UARPTLVPersonalizationFTABSubfileHashAlgorithmBackDeploy;
      goto LABEL_41;
    case 0x88B29115:
      v5 = UARPTLVPersonalizationFTABSubfileESECBackDeploy;
      goto LABEL_41;
    case 0x88B29116:
      v5 = UARPTLVPersonalizationFTABSubfileEPROBackDeploy;
      goto LABEL_41;
    case 0x88B29117:
      v5 = UARPTLVPersonalizationFTABSubfileTrustedBackDeploy;
      goto LABEL_41;
    case 0x88B29118:
      v5 = UARPTLVPersonalizationSoCLiveNonceBackDeploy;
      goto LABEL_41;
    case 0x88B29121:
      v5 = UARPTLVPersonalizationPrefixNeedsLogicalUnitNumberBackDeploy;
      goto LABEL_41;
    case 0x88B29122:
      v5 = UARPTLVPersonalizationSuffixNeedsLogicalUnitNumberBackDeploy;
      goto LABEL_41;
    case 0x88B29125:
      v5 = UARPTLVPersonalizationLogicalUnitNumberBackDeploy;
      goto LABEL_41;
    case 0x88B29126:
      v5 = UARPTLVPersonalizationTicketNeedsLogicalUnitNumberBackDeploy;
      goto LABEL_41;
    case 0x88B29128:
      v5 = UARPTLVHostPersonalizationRequiredBackDeploy;
      goto LABEL_41;
    case 0x88B29129:
      v5 = UARPTLVRequiredPersonalizationOptionBackDeploy;
      goto LABEL_41;
    case 0x88B29130:
      v5 = UARPTLVPersonalizedManifestBackDeploy;
      goto LABEL_41;
    case 0x88B29131:
      v5 = UARPTLVPersonalizationLifeBackDeploy;
      goto LABEL_41;
    case 0x88B29132:
      v5 = UARPTLVPersonalizationProvisioningBackDeploy;
      goto LABEL_41;
    case 0x88B29133:
      v5 = UARPTLVPersonalizationManifestEpochBackDeploy;
      goto LABEL_41;
    case 0x88B29134:
      v5 = UARPTLVPersonalizationManifestSuffixBackDeploy;
      goto LABEL_41;
    case 0x88B29135:
      v5 = UARPTLVPersonalizationECIDDataBackDeploy;
      goto LABEL_41;
    case 0x88B29136:
      v5 = UARPTLVPersonalizationFTABSubfileDigestFilenameBackDeploy;
LABEL_41:
      v6 = (UARPMetaDataTLVBackDeploy *)-[__objc2_class tlvWithLength:value:](v5, "tlvWithLength:value:", a4, a5);
      break;
    default:
      v6 = -[UARPMetaDataTLVBackDeploy initWithType:length:value:]([UARPMetaDataTLVBackDeploy alloc], "initWithType:length:value:", *(_QWORD *)&a3, *(_QWORD *)&a4, a5);
      break;
  }
  return v6;
}

+ (id)tlvFromKey:(id)a3 value:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
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

  v5 = a3;
  v19 = a4;
  v6 = +[UARPMetaDataTLVBackDeploy metaDataTable](UARPMetaDataTLVBackDeploy, "metaDataTable");
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
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
        v13 = objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("Name"));
        if (!objc_msgSend(v5, "caseInsensitiveCompare:", v13))
        {
          v14 = objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("Value"));
          v15 = objc_msgSend(v14, "unsignedLongValue") + 2001563392;
          if (v15 <= 0x35 && ((0x3F036601FFFFFFuLL >> v15) & 1) != 0)
          {
            v16 = -[__objc2_class tlvFromPropertyListValue:](*off_100051830[v15], "tlvFromPropertyListValue:", v19);
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
  if (qword_1000668D0 != -1)
    dispatch_once(&qword_1000668D0, &stru_100051810);
  return (id)qword_1000668C8;
}

+ (id)tlvTypeName:(unsigned int)a3
{
  uint64_t v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  id v9;
  NSNumber *v10;
  unsigned __int8 v11;
  id v12;
  id obj;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v3 = *(_QWORD *)&a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  obj = +[UARPMetaDataTLVBackDeploy metaDataTable](UARPMetaDataTLVBackDeploy, "metaDataTable");
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        v9 = objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("Value"));
        v10 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v3);
        v11 = objc_msgSend(v9, "isEqual:", v10);

        if ((v11 & 1) != 0)
        {
          v12 = objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("Name"));
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
  NSData *v4;
  int v6;
  int v7;

  v3 = objc_alloc_init((Class)NSMutableData);
  v7 = uarpHtonl(self->_tlvType);
  objc_msgSend(v3, "appendBytes:length:", &v7, 4);
  v6 = uarpHtonl(self->_tlvLength);
  objc_msgSend(v3, "appendBytes:length:", &v6, 4);
  objc_msgSend(v3, "appendData:", self->_tlvValue);
  v4 = +[NSData dataWithData:](NSData, "dataWithData:", v3);

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
