@implementation PGFingerprintVersionHelper

+ (id)nameForFingerprintVersion:(int64_t)a3
{
  id result;

  result = 0;
  switch(a3)
  {
    case 201:
      result = CFSTR("memory-average-sceneprint-pca-256_DEPRECATED");
      break;
    case 202:
      result = CFSTR("memory-average-sceneprint-2048_DEPRECATED");
      break;
    case 203:
    case 204:
      result = CFSTR("MemoryAverage-Scene2048-MultiModal-V1.0_DEPRECATED");
      break;
    case 205:
    case 206:
      result = CFSTR("MemoryAverage-ScenePCA256-MultiModal-V1.0_DEPRECATED");
      break;
    case 207:
    case 209:
      result = CFSTR("MemoryAverage-Scene2048-MultiModal-V1.0-PersonaVectorPCA256_DEPRECATED");
      break;
    case 208:
    case 210:
      result = CFSTR("MemoryAverage-Scene2048-MultiModal-V1.0-PersonaVectorMultiModal-V1.0_DEPRECATED");
      break;
    case 211:
    case 213:
      result = CFSTR("MemoryAverage-ScenePCA256-MultiModal-V1.0-PersonaVectorPCA256_DEPRECATED");
      break;
    case 212:
    case 214:
      result = CFSTR("MemoryAverage-ScenePCA256-MultiModal-V1.0-PersonaVectorMultiModal-V1.0_DEPRECATED");
      break;
    case 215:
    case 216:
    case 217:
    case 218:
    case 219:
    case 220:
    case 221:
    case 222:
    case 223:
    case 224:
      return result;
    case 225:
      result = CFSTR("MemoryAverage-ScenePCA256-MultiModal-V2.0_DEPRECATED");
      break;
    case 226:
      result = CFSTR("MomentNode-MultiModalMusic-V1.0");
      break;
    case 227:
      result = CFSTR("MomentNode-MultiModalMusic-V2.0");
      break;
    case 228:
      result = CFSTR("MemoryNode-MultiModalMusic-V1.0");
      break;
    case 229:
      result = CFSTR("sceneprint-clip-768");
      break;
    default:
      switch(a3)
      {
        case 1:
          result = CFSTR("sceneprint-pca-256_DEPRECATED");
          break;
        case 2:
          result = CFSTR("sceneprint-2048_DEPRECATED");
          break;
        case 3:
          result = CFSTR("Asset-Scene2048-MultiModal-V1.0_DEPRECATED");
          break;
        case 4:
          result = CFSTR("Asset-Scene2048-LibrarySpecific-MultiModal-V1.0_DEPRECATED");
          break;
        case 5:
          result = CFSTR("Asset-ScenePCA256-MultiModal-V1.0_DEPRECATED");
          break;
        case 6:
          result = CFSTR("Asset-ScenePCA256-LibrarySpecific-MultiModal-V1.0_DEPRECATED");
          break;
        case 7:
          result = CFSTR("Asset-Scene2048-MultiModal-V1.0-PersonaVectorPCA256_DEPRECATED");
          break;
        case 8:
          result = CFSTR("Asset-Scene2048-MultiModal-V1.0-PersonaVectorMultiModal-V1.0_DEPRECATED");
          break;
        case 9:
          result = CFSTR("Asset-Scene2048-LibrarySpecific-MultiModal-V1.0-PersonaVectorPCA256_DEPRECATED");
          break;
        case 10:
          result = CFSTR("Asset-Scene2048-LibrarySpecific-MultiModal-V1.0-PersonaVectorMultiModal-V1.0_DEPRECATED");
          break;
        case 11:
        case 16:
        case 17:
        case 18:
        case 19:
        case 20:
        case 21:
        case 22:
        case 23:
        case 24:
          return result;
        case 12:
          result = CFSTR("Asset-ScenePCA256-MultiModal-V1.0-PersonaVectorPCA256_DEPRECATED");
          break;
        case 13:
          result = CFSTR("Asset-ScenePCA256-MultiModal-V1.0-PersonaVectorMultiModal-V1.0_DEPRECATED");
          break;
        case 14:
          result = CFSTR("Asset-ScenePCA256-LibrarySpecific-MultiModal-V1.0-PersonaVectorPCA256_DEPRECATED");
          break;
        case 15:
          result = CFSTR("Asset-ScenePCA256-LibrarySpecific-MultiModal-V1.0-PersonaVectorMultiModal-V1.0_DEPRECATED");
          break;
        case 25:
          result = CFSTR("Asset-ScenePCA256-MultiModal-V2.0_DEPRECATED");
          break;
        default:
          switch(a3)
          {
            case 'e':
              result = CFSTR("moment-average-sceneprint-pca-256_DEPRECATED");
              break;
            case 'f':
              result = CFSTR("moment-average-sceneprint-2048_DEPRECATED");
              break;
            case 'g':
              result = CFSTR("MomentAverage-Scene2048-MultiModal-V1.0_DEPRECATED");
              break;
            case 'h':
              result = CFSTR("MomentAverage-Scene2048-LibrarySpecific-MultiModal-V1.0_DEPRECATED");
              break;
            case 'i':
              result = CFSTR("MomentAverage-ScenePCA256-MultiModal-V1.0_DEPRECATED");
              break;
            case 'j':
              result = CFSTR("MomentAverage-ScenePCA256-LibrarySpecific-MultiModal-V1.0_DEPRECATED");
              break;
            case 'k':
              result = CFSTR("MomentAverage-Scene2048-MultiModal-V1.0-PersonaVectorPCA256_DEPRECATED");
              break;
            case 'l':
              result = CFSTR("MomentAverage-Scene2048-MultiModal-V1.0-PersonaVectorMultiModal-V1.0_DEPRECATED");
              break;
            case 'm':
              result = CFSTR("MomentAverage-Scene2048-LibrarySpecific-MultiModal-V1.0-PersonaVectorPCA256_DEPRECATED");
              break;
            case 'n':
              result = CFSTR("MomentAverage-Scene2048-LibrarySpecific-MultiModal-V1.0-PersonaVectorMultiModal-V1.0_DEPRECATED");
              break;
            case 'o':
              result = CFSTR("MomentAverage-ScenePCA256-MultiModal-V1.0-PersonaVectorPCA256_DEPRECATED");
              break;
            case 'p':
              result = CFSTR("MomentAverage-ScenePCA256-MultiModal-V1.0-PersonaVectorMultiModal-V1.0_DEPRECATED");
              break;
            case 'q':
              result = CFSTR("MomentAverage-ScenePCA256-LibrarySpecific-MultiModal-V1.0-PersonaVectorPCA256_DEPRECATED");
              break;
            case 'r':
              result = CFSTR("MomentAverage-ScenePCA256-LibrarySpecific-MultiModal-V1.0-PersonaVectorMultiModal-V1.0_DEPRECATED");
              break;
            case '}':
              result = CFSTR("MomentAverage-ScenePCA256-MultiModal-V2.0_DEPRECATED");
              break;
            default:
              return result;
          }
          break;
      }
      break;
  }
  return result;
}

+ (int64_t)fingerprintVersionForName:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if (v3)
  {
    if ((objc_msgSend(CFSTR("sceneprint-pca-256_DEPRECATED"), "isEqualToString:", v3) & 1) != 0)
    {
      v4 = 1;
    }
    else if ((objc_msgSend(CFSTR("sceneprint-2048_DEPRECATED"), "isEqualToString:", v3) & 1) != 0)
    {
      v4 = 2;
    }
    else if ((objc_msgSend(CFSTR("Asset-Scene2048-MultiModal-V1.0_DEPRECATED"), "isEqualToString:", v3) & 1) != 0)
    {
      v4 = 3;
    }
    else if ((objc_msgSend(CFSTR("Asset-Scene2048-LibrarySpecific-MultiModal-V1.0_DEPRECATED"), "isEqualToString:", v3) & 1) != 0)
    {
      v4 = 4;
    }
    else if ((objc_msgSend(CFSTR("Asset-ScenePCA256-MultiModal-V1.0_DEPRECATED"), "isEqualToString:", v3) & 1) != 0)
    {
      v4 = 5;
    }
    else if ((objc_msgSend(CFSTR("Asset-ScenePCA256-LibrarySpecific-MultiModal-V1.0_DEPRECATED"), "isEqualToString:", v3) & 1) != 0)
    {
      v4 = 6;
    }
    else if ((objc_msgSend(CFSTR("moment-average-sceneprint-pca-256_DEPRECATED"), "isEqualToString:", v3) & 1) != 0)
    {
      v4 = 101;
    }
    else if ((objc_msgSend(CFSTR("moment-average-sceneprint-2048_DEPRECATED"), "isEqualToString:", v3) & 1) != 0)
    {
      v4 = 102;
    }
    else if ((objc_msgSend(CFSTR("MomentAverage-Scene2048-MultiModal-V1.0_DEPRECATED"), "isEqualToString:", v3) & 1) != 0)
    {
      v4 = 103;
    }
    else if ((objc_msgSend(CFSTR("MomentAverage-Scene2048-LibrarySpecific-MultiModal-V1.0_DEPRECATED"), "isEqualToString:", v3) & 1) != 0)
    {
      v4 = 104;
    }
    else if ((objc_msgSend(CFSTR("MomentAverage-ScenePCA256-MultiModal-V1.0_DEPRECATED"), "isEqualToString:", v3) & 1) != 0)
    {
      v4 = 105;
    }
    else if ((objc_msgSend(CFSTR("MomentAverage-ScenePCA256-LibrarySpecific-MultiModal-V1.0_DEPRECATED"), "isEqualToString:", v3) & 1) != 0)
    {
      v4 = 106;
    }
    else if ((objc_msgSend(CFSTR("memory-average-sceneprint-pca-256_DEPRECATED"), "isEqualToString:", v3) & 1) != 0)
    {
      v4 = 201;
    }
    else if ((objc_msgSend(CFSTR("memory-average-sceneprint-2048_DEPRECATED"), "isEqualToString:", v3) & 1) != 0)
    {
      v4 = 202;
    }
    else if ((objc_msgSend(CFSTR("MemoryAverage-Scene2048-MultiModal-V1.0_DEPRECATED"), "isEqualToString:", v3) & 1) != 0)
    {
      v4 = 203;
    }
    else if ((objc_msgSend(CFSTR("MemoryAverage-Scene2048-MultiModal-V1.0_DEPRECATED"), "isEqualToString:", v3) & 1) != 0)
    {
      v4 = 204;
    }
    else if ((objc_msgSend(CFSTR("MemoryAverage-ScenePCA256-MultiModal-V1.0_DEPRECATED"), "isEqualToString:", v3) & 1) != 0)
    {
      v4 = 205;
    }
    else if ((objc_msgSend(CFSTR("MemoryAverage-ScenePCA256-MultiModal-V1.0_DEPRECATED"), "isEqualToString:", v3) & 1) != 0)
    {
      v4 = 206;
    }
    else if ((objc_msgSend(CFSTR("Asset-Scene2048-MultiModal-V1.0-PersonaVectorPCA256_DEPRECATED"), "isEqualToString:", v3) & 1) != 0)
    {
      v4 = 7;
    }
    else if ((objc_msgSend(CFSTR("Asset-Scene2048-MultiModal-V1.0-PersonaVectorMultiModal-V1.0_DEPRECATED"), "isEqualToString:", v3) & 1) != 0)
    {
      v4 = 8;
    }
    else if ((objc_msgSend(CFSTR("Asset-Scene2048-LibrarySpecific-MultiModal-V1.0-PersonaVectorPCA256_DEPRECATED"), "isEqualToString:", v3) & 1) != 0)
    {
      v4 = 9;
    }
    else if ((objc_msgSend(CFSTR("Asset-Scene2048-LibrarySpecific-MultiModal-V1.0-PersonaVectorMultiModal-V1.0_DEPRECATED"), "isEqualToString:", v3) & 1) != 0)
    {
      v4 = 10;
    }
    else if ((objc_msgSend(CFSTR("Asset-ScenePCA256-MultiModal-V1.0-PersonaVectorPCA256_DEPRECATED"), "isEqualToString:", v3) & 1) != 0)
    {
      v4 = 12;
    }
    else if ((objc_msgSend(CFSTR("Asset-ScenePCA256-MultiModal-V1.0-PersonaVectorMultiModal-V1.0_DEPRECATED"), "isEqualToString:", v3) & 1) != 0)
    {
      v4 = 13;
    }
    else if ((objc_msgSend(CFSTR("Asset-ScenePCA256-LibrarySpecific-MultiModal-V1.0-PersonaVectorPCA256_DEPRECATED"), "isEqualToString:", v3) & 1) != 0)
    {
      v4 = 14;
    }
    else if ((objc_msgSend(CFSTR("Asset-ScenePCA256-LibrarySpecific-MultiModal-V1.0-PersonaVectorMultiModal-V1.0_DEPRECATED"), "isEqualToString:", v3) & 1) != 0)
    {
      v4 = 15;
    }
    else if ((objc_msgSend(CFSTR("MomentAverage-Scene2048-MultiModal-V1.0-PersonaVectorPCA256_DEPRECATED"), "isEqualToString:", v3) & 1) != 0)
    {
      v4 = 107;
    }
    else if ((objc_msgSend(CFSTR("MomentAverage-Scene2048-MultiModal-V1.0-PersonaVectorMultiModal-V1.0_DEPRECATED"), "isEqualToString:", v3) & 1) != 0)
    {
      v4 = 108;
    }
    else if ((objc_msgSend(CFSTR("MomentAverage-Scene2048-LibrarySpecific-MultiModal-V1.0-PersonaVectorPCA256_DEPRECATED"), "isEqualToString:", v3) & 1) != 0)
    {
      v4 = 109;
    }
    else if ((objc_msgSend(CFSTR("MomentAverage-Scene2048-LibrarySpecific-MultiModal-V1.0-PersonaVectorMultiModal-V1.0_DEPRECATED"), "isEqualToString:", v3) & 1) != 0)
    {
      v4 = 110;
    }
    else if ((objc_msgSend(CFSTR("MomentAverage-ScenePCA256-MultiModal-V1.0-PersonaVectorPCA256_DEPRECATED"), "isEqualToString:", v3) & 1) != 0)
    {
      v4 = 111;
    }
    else if ((objc_msgSend(CFSTR("MomentAverage-ScenePCA256-MultiModal-V1.0-PersonaVectorMultiModal-V1.0_DEPRECATED"), "isEqualToString:", v3) & 1) != 0)
    {
      v4 = 112;
    }
    else if ((objc_msgSend(CFSTR("MomentAverage-ScenePCA256-LibrarySpecific-MultiModal-V1.0-PersonaVectorPCA256_DEPRECATED"), "isEqualToString:", v3) & 1) != 0)
    {
      v4 = 113;
    }
    else if ((objc_msgSend(CFSTR("MomentAverage-ScenePCA256-LibrarySpecific-MultiModal-V1.0-PersonaVectorMultiModal-V1.0_DEPRECATED"), "isEqualToString:", v3) & 1) != 0)
    {
      v4 = 114;
    }
    else if ((objc_msgSend(CFSTR("MemoryAverage-Scene2048-MultiModal-V1.0-PersonaVectorPCA256_DEPRECATED"), "isEqualToString:", v3) & 1) != 0)
    {
      v4 = 207;
    }
    else if ((objc_msgSend(CFSTR("MemoryAverage-Scene2048-MultiModal-V1.0-PersonaVectorMultiModal-V1.0_DEPRECATED"), "isEqualToString:", v3) & 1) != 0)
    {
      v4 = 208;
    }
    else if ((objc_msgSend(CFSTR("MemoryAverage-Scene2048-MultiModal-V1.0-PersonaVectorPCA256_DEPRECATED"), "isEqualToString:", v3) & 1) != 0)
    {
      v4 = 209;
    }
    else if ((objc_msgSend(CFSTR("MemoryAverage-Scene2048-MultiModal-V1.0-PersonaVectorMultiModal-V1.0_DEPRECATED"), "isEqualToString:", v3) & 1) != 0)
    {
      v4 = 210;
    }
    else if ((objc_msgSend(CFSTR("MemoryAverage-ScenePCA256-MultiModal-V1.0-PersonaVectorPCA256_DEPRECATED"), "isEqualToString:", v3) & 1) != 0)
    {
      v4 = 211;
    }
    else if ((objc_msgSend(CFSTR("MemoryAverage-ScenePCA256-MultiModal-V1.0-PersonaVectorMultiModal-V1.0_DEPRECATED"), "isEqualToString:", v3) & 1) != 0)
    {
      v4 = 212;
    }
    else if ((objc_msgSend(CFSTR("MemoryAverage-ScenePCA256-MultiModal-V1.0-PersonaVectorPCA256_DEPRECATED"), "isEqualToString:", v3) & 1) != 0)
    {
      v4 = 213;
    }
    else if ((objc_msgSend(CFSTR("MemoryAverage-ScenePCA256-MultiModal-V1.0-PersonaVectorMultiModal-V1.0_DEPRECATED"), "isEqualToString:", v3) & 1) != 0)
    {
      v4 = 214;
    }
    else if ((objc_msgSend(CFSTR("Asset-ScenePCA256-MultiModal-V2.0_DEPRECATED"), "isEqualToString:", v3) & 1) != 0)
    {
      v4 = 25;
    }
    else if ((objc_msgSend(CFSTR("MomentAverage-ScenePCA256-MultiModal-V2.0_DEPRECATED"), "isEqualToString:", v3) & 1) != 0)
    {
      v4 = 125;
    }
    else if ((objc_msgSend(CFSTR("MemoryAverage-ScenePCA256-MultiModal-V2.0_DEPRECATED"), "isEqualToString:", v3) & 1) != 0)
    {
      v4 = 225;
    }
    else if ((objc_msgSend(CFSTR("MomentNode-MultiModalMusic-V1.0"), "isEqualToString:", v3) & 1) != 0)
    {
      v4 = 226;
    }
    else if ((objc_msgSend(CFSTR("MomentNode-MultiModalMusic-V2.0"), "isEqualToString:", v3) & 1) != 0)
    {
      v4 = 227;
    }
    else if (objc_msgSend(CFSTR("sceneprint-clip-768"), "isEqualToString:", v3))
    {
      v4 = 229;
    }
    else
    {
      v4 = 0;
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)featureExtractorForFingerprintVersion:(int64_t)a3 withGraph:(id)a4 withTransformers:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  PGFeatureExtractorAssetCollectionAverage *v21;
  uint64_t v22;

  v10 = a4;
  v11 = a5;
  v12 = 0;
  v13 = 0;
  v14 = 0;
  switch(a3)
  {
    case 0:
      objc_msgSend(a1, "_generateError:errorCode:errorMessage:underlyingError:", a6, 2, CFSTR("Cannot produce feature extractor for PGFingerprintVersionUnknown."), 0);
      v15 = 0;
      goto LABEL_36;
    case 1:
LABEL_4:
      v12 = 0;
      v13 = 0;
      goto LABEL_23;
    case 2:
LABEL_5:
      v12 = 0;
      v13 = 0;
      goto LABEL_14;
    case 3:
LABEL_6:
      v12 = 0;
      goto LABEL_11;
    case 4:
LABEL_7:
      v12 = 0;
      v14 = 1;
      goto LABEL_16;
    case 5:
LABEL_8:
      v12 = 0;
      v14 = 2;
      goto LABEL_18;
    case 6:
LABEL_9:
      v12 = 0;
      goto LABEL_22;
    case 7:
LABEL_10:
      v12 = 1;
LABEL_11:
      v13 = 1;
      goto LABEL_14;
    case 8:
LABEL_12:
      v13 = 1;
      v12 = 2;
      goto LABEL_14;
    case 9:
LABEL_13:
      v13 = 2;
      v12 = 1;
LABEL_14:
      v14 = 1;
      break;
    case 10:
LABEL_15:
      v14 = 1;
      v12 = 2;
LABEL_16:
      v13 = 2;
      break;
    case 11:
    case 16:
    case 17:
    case 18:
    case 19:
    case 20:
    case 21:
    case 22:
    case 23:
    case 24:
      break;
    case 12:
LABEL_17:
      v14 = 2;
      v12 = 1;
LABEL_18:
      v13 = 1;
      break;
    case 13:
LABEL_19:
      v13 = 1;
      v12 = 2;
      goto LABEL_23;
    case 14:
LABEL_20:
      v13 = 2;
      v12 = 1;
      goto LABEL_23;
    case 15:
LABEL_21:
      v12 = 2;
LABEL_22:
      v13 = 2;
LABEL_23:
      v14 = 2;
      break;
    case 25:
LABEL_37:
      v12 = 0;
      v14 = 2;
      v13 = 3;
      break;
    default:
      v13 = 0;
      v14 = 0;
      switch(a3)
      {
        case 'e':
          goto LABEL_4;
        case 'f':
          goto LABEL_5;
        case 'g':
          goto LABEL_6;
        case 'h':
          goto LABEL_7;
        case 'i':
          goto LABEL_8;
        case 'j':
          goto LABEL_9;
        case 'k':
          goto LABEL_10;
        case 'l':
          goto LABEL_12;
        case 'm':
          goto LABEL_13;
        case 'n':
          goto LABEL_15;
        case 'o':
          goto LABEL_17;
        case 'p':
          goto LABEL_19;
        case 'q':
          goto LABEL_20;
        case 'r':
          goto LABEL_21;
        case 's':
        case 't':
        case 'u':
        case 'v':
        case 'w':
        case 'x':
        case 'y':
        case 'z':
        case '{':
        case '|':
          goto LABEL_24;
        case '}':
          goto LABEL_37;
        default:
          v13 = 0;
          v14 = 0;
          break;
      }
      break;
  }
LABEL_24:
  objc_msgSend(a1, "_assetPrintFeatureExtractorForAssetPrintType:transformers:error:", v14, v11, a6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    objc_msgSend(a1, "fetchOptionPropertySetForFingerprintVersion:", a3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_personaVectorFeatureExtractorForPersonaVectorType:fetchOptionPropertySet:graph:transformers:error:", v12, v17, v10, v11, a6);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      objc_msgSend(a1, "_multiModalFeatureExtractorForMutliModalType:assetFeatureExtractor:personaVectorFeatureExtractor:graph:transformers:error:", v13, v16, v18, v10, v11, a6);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        if (objc_msgSend(a1, "isMomentNodeFingerprintVersion:", a3))
        {
          objc_msgSend(a1, "_featureExtractor:withTransformers:", v15, v11);
          v19 = objc_claimAutoreleasedReturnValue();

          v15 = (void *)v19;
        }
        if ((objc_msgSend(a1, "isMomentFingerprintVersion:", a3) & 1) != 0
          || objc_msgSend(a1, "isMemoryFingerprintVersion:", a3))
        {
          objc_msgSend(a1, "nameForFingerprintVersion:", a3);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = -[PGFeatureExtractorAssetCollectionAverage initWithAssetFeatureExtractor:assetFetchOptionPropertySet:name:]([PGFeatureExtractorAssetCollectionAverage alloc], "initWithAssetFeatureExtractor:assetFetchOptionPropertySet:name:", v15, v17, v20);
          objc_msgSend(a1, "_featureExtractor:withTransformers:", v21, v11);
          v22 = objc_claimAutoreleasedReturnValue();

          v15 = (void *)v22;
        }
      }
    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

LABEL_36:
  return v15;
}

+ (id)fetchOptionPropertySetForFingerprintVersion:(int64_t)a3
{
  char v3;
  void *v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3 + 55;
  if ((unint64_t)(a3 - 201) <= 0x1C)
  {
    if (((1 << v3) & 0x11003FFC) != 0)
      goto LABEL_11;
    if (((1 << v3) & 3) != 0)
      goto LABEL_15;
  }
  if ((unint64_t)a3 <= 0x19)
  {
    if (((1 << a3) & 0x200F7F8) != 0)
      goto LABEL_11;
    if (((1 << a3) & 6) != 0)
    {
LABEL_15:
      v19 = *MEMORY[0x1E0CD1A60];
      v9 = (void *)MEMORY[0x1E0C99D20];
      v10 = &v19;
      v11 = 1;
      goto LABEL_12;
    }
  }
  v4 = 0;
  v5 = a3 - 101;
  if ((unint64_t)(a3 - 101) <= 0x18)
  {
    if (((1 << v5) & 0x1003FFC) == 0)
    {
      if (((1 << v5) & 3) == 0)
        return v4;
      goto LABEL_15;
    }
LABEL_11:
    v6 = *MEMORY[0x1E0CD1978];
    v13 = *MEMORY[0x1E0CD1A60];
    v14 = v6;
    v7 = *MEMORY[0x1E0CD19F0];
    v15 = *MEMORY[0x1E0CD1A80];
    v16 = v7;
    v8 = *MEMORY[0x1E0CD19D0];
    v17 = *MEMORY[0x1E0CD1938];
    v18 = v8;
    v9 = (void *)MEMORY[0x1E0C99D20];
    v10 = &v13;
    v11 = 6;
LABEL_12:
    objc_msgSend(v9, "arrayWithObjects:count:", v10, v11, v13, v14, v15, v16, v17, v18, v19, v20);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

+ (BOOL)isAssetFingerprintVersion:(int64_t)a3
{
  return ((unint64_t)(a3 - 201) > 0x1B || ((1 << (a3 + 55)) & 0xF003FFF) == 0)
      && ((unint64_t)(a3 - 101) > 0x18 || ((1 << (a3 - 101)) & 0x1003FFF) == 0)
      && a3 != 0;
}

+ (BOOL)isMomentFingerprintVersion:(int64_t)a3
{
  return ((unint64_t)(a3 - 101) < 0x19) & (0x1003FFFu >> (a3 - 101));
}

+ (BOOL)isMemoryFingerprintVersion:(int64_t)a3
{
  return ((unint64_t)(a3 - 201) < 0x19) & (0x1003FFFu >> (a3 + 55));
}

+ (BOOL)isMomentNodeFingerprintVersion:(int64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFELL) == 226;
}

+ (BOOL)isMemoryNodeFingerprintVersion:(int64_t)a3
{
  return a3 == 228;
}

+ (void)resetPreCalculatedFeatures
{
  +[PGFeatureExtractorPhotoLibraryAverage resetPreCalculatedFeatureVector](PGFeatureExtractorPhotoLibraryAverage, "resetPreCalculatedFeatureVector");
  +[PGFeatureExtractorPhotoLibrarySize resetPreCalculatedPhotoLibrarySize](PGFeatureExtractorPhotoLibrarySize, "resetPreCalculatedPhotoLibrarySize");
}

+ (id)_assetPrintFeatureExtractorForAssetPrintType:(int64_t)a3 transformers:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  id v9;
  __objc2_class *v10;
  void *v11;

  v7 = a4;
  switch(a3)
  {
    case 0:
      v8 = objc_alloc(MEMORY[0x1E0D42A10]);
      a1 = (id)objc_msgSend(v8, "initWithName:featureExtractors:", &stru_1E8436F28, MEMORY[0x1E0C9AA60]);
      break;
    case 1:
      objc_msgSend(a1, "_sceneprintFeatureExtractorInstance");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 2:
      v10 = PGFeatureExtractorPCAPrint;
      goto LABEL_6;
    case 3:
      v10 = PGFeatureExtractorCLIPprint;
LABEL_6:
      v9 = objc_alloc_init(v10);
LABEL_7:
      v11 = v9;
      objc_msgSend(a1, "_featureExtractor:withTransformers:", v9, v7);
      a1 = (id)objc_claimAutoreleasedReturnValue();

      break;
    default:
      break;
  }

  return a1;
}

+ (id)_multiModalFeatureExtractorForMutliModalType:(int64_t)a3 assetFeatureExtractor:(id)a4 personaVectorFeatureExtractor:(id)a5 graph:(id)a6 transformers:(id)a7 error:(id *)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  PGMyHomeFeatureExtractor *v19;
  PGMyWorkFeatureExtractor *v20;
  PGMobilityFeatureExtractor *v21;
  PGPartOfDayFeatureExtractor *v22;
  PGSeasonFeatureExtractor *v23;
  PGWeekendFeatureExtractor *v24;
  PGWeekdayFeatureExtractor *v25;
  PGPOIFeatureExtractor *v26;
  PGROIFeatureExtractor *v27;
  void *v28;
  PGFeatureExtractorFaceSize *v29;
  PGFeatureExtractorFaceQuality *v30;
  PGFeatureExtractorFaceSmileType *v31;
  PGFeatureExtractorFaceEyesState *v32;
  PGFeatureExtractorFaceAgeType *v33;
  void *v34;
  PGFeatureExtractorStandardAspectRatio *v35;
  PGFeatureExtractorLocale *v36;
  PGFeatureExtractorTaboo *v37;
  PGFeatureExtractorPotentialLandmark *v38;
  PGFeatureExtractorAssetPhotoLibrary *v39;
  PGFeatureExtractorPhotoLibrarySize *v40;
  PGFeatureExtractorAssetPhotoLibrary *v41;
  PGFeatureExtractorFacesFromAssetAverage *v42;
  void *v43;
  PGFeatureExtractorFacesFromAssetAverage *v44;
  PGFeatureExtractorGraphRelations *v45;
  void *v46;
  PGFeatureExtractorGraphRelations *v47;
  void *v48;
  id v49;
  const __CFString *v50;
  PGPartOfDayFeatureExtractor *v51;
  PGSeasonFeatureExtractor *v52;
  PGWeekendFeatureExtractor *v53;
  PGWeekdayFeatureExtractor *v54;
  PGPOIFeatureExtractor *v55;
  PGROIFeatureExtractor *v56;
  PGInfrequentCountryFeatureExtractor *v57;
  PGCityFeatureExtractor *v58;
  PGCelebratedHolidayFeatureExtractor *v59;
  void *v60;
  PGFeatureExtractorFaceSize *v61;
  PGFeatureExtractorFaceQuality *v62;
  PGFeatureExtractorFaceSmileType *v63;
  PGFeatureExtractorFaceEyesState *v64;
  PGFeatureExtractorFaceAgeType *v65;
  void *v66;
  PGFeatureExtractorLocale *v67;
  PGFeatureExtractorTaboo *v68;
  PGFeatureExtractorPotentialLandmark *v69;
  PGFeatureExtractorAssetPhotoLibrary *v70;
  PGFeatureExtractorPhotoLibrarySize *v71;
  PGFeatureExtractorAssetPhotoLibrary *v72;
  PGFeatureExtractorAssetSpecialPOI *v73;
  PGFeatureExtractorFacesFromAssetAverage *v74;
  void *v75;
  PGFeatureExtractorFacesFromAssetAverage *v76;
  PGFeatureExtractorGraphRelations *v77;
  void *v78;
  PGFeatureExtractorGraphRelations *v79;
  void *v80;
  void *v81;
  PGMyWorkFeatureExtractor *v82;
  PGROIFeatureExtractor *v83;
  PGInfrequentCountryFeatureExtractor *v84;
  PGInfrequentCityFeatureExtractor *v85;
  id v86;
  id v87;
  PGCelebratedHolidayFeatureExtractor *v88;
  id v89;
  PGFeatureExtractorMomentNodeSpecialPOI *v90;
  void *v91;
  void *v92;
  id v93;
  const __CFString *v94;
  PGMyHomeFeatureExtractor *v95;
  PGMyWorkFeatureExtractor *v96;
  PGMobilityFeatureExtractor *v97;
  PGPartOfDayFeatureExtractor *v98;
  PGSeasonFeatureExtractor *v99;
  PGWeekendFeatureExtractor *v100;
  PGWeekdayFeatureExtractor *v101;
  PGPOIFeatureExtractor *v102;
  PGROIFeatureExtractor *v103;
  void *v104;
  PGFeatureExtractorFaceSize *v105;
  PGFeatureExtractorFaceQuality *v106;
  PGFeatureExtractorFaceSmileType *v107;
  PGFeatureExtractorFaceEyesState *v108;
  PGFeatureExtractorFaceAgeType *v109;
  void *v110;
  PGFeatureExtractorStandardAspectRatio *v111;
  PGFeatureExtractorLocale *v112;
  PGFeatureExtractorTaboo *v113;
  PGFeatureExtractorPotentialLandmark *v114;
  PGFeatureExtractorAssetPhotoLibrary *v115;
  PGFeatureExtractorPhotoLibrarySize *v116;
  PGFeatureExtractorAssetPhotoLibrary *v117;
  PGFeatureExtractorFacesFromAssetAverage *v118;
  void *v119;
  PGFeatureExtractorFacesFromAssetAverage *v120;
  PGFeatureExtractorGraphRelations *v121;
  void *v122;
  PGFeatureExtractorGraphRelations *v123;
  PGMyWorkFeatureExtractor *v124;
  PGSocialGroupFeatureExtractor *v125;
  id v126;
  PGROIFeatureExtractor *v127;
  id v128;
  PGInfrequentCountryFeatureExtractor *v129;
  PGInfrequentCityFeatureExtractor *v130;
  PGFeatureExtractorMomentNodeSpecialPOI *v131;
  PGCelebratedHolidayMemoryNodeFeatureExtractor *v132;
  PGSceneMemoryNodeFeatureExtractor *v133;
  PGROIMemoryNodeFeatureExtractor *v134;
  PGCityMemoryNodeFeatureExtractor *v135;
  id v136;
  PGCountryMemoryNodeFeatureExtractor *v137;
  PGAOIMemoryNodeFeatureExtractor *v138;
  id v139;
  PGAudioMemoryNodeFeatureExtractor *v140;
  PGFeatureExtractorStandardAspectRatio *v142;
  PGFeatureExtractorAssetImportSource *v143;
  PGFeatureExtractorAssetImportSource *v144;
  PGFeatureExtractorAssetImportSource *v145;
  PGFeatureExtractorAssetFormat *v146;
  PGFeatureExtractorAssetFormat *v147;
  PGFeatureExtractorAssetFormat *v148;
  PGFeatureExtractorAssetResolution *v149;
  PGFeatureExtractorAssetResolution *v150;
  PGFeatureExtractorAssetResolution *v151;
  PGFeatureExtractorAssetSourceType *v152;
  PGFeatureExtractorAssetSourceType *v153;
  PGFeatureExtractorAssetSourceType *v154;
  PGFeatureExtractorAssetBurstSelectionType *v155;
  PGFeatureExtractorAssetBurstSelectionType *v156;
  PGFeatureExtractorAssetBurstSelectionType *v157;
  PGFeatureExtractorAssetMediaSubtype *v158;
  void *v159;
  PGFeatureExtractorAssetMediaSubtype *v160;
  void *v161;
  PGFeatureExtractorAssetMediaSubtype *v162;
  void *v163;
  PGFeatureExtractorAssetMediaType *v164;
  PGFeatureExtractorAssetMediaType *v165;
  PGFeatureExtractorAssetMediaType *v166;
  PGFeatureExtractorAssetPlaybackStyle *v167;
  PGFeatureExtractorAssetPlaybackStyle *v168;
  PGFeatureExtractorAssetPlaybackStyle *v169;
  PGFeatureExtractorLowLightScore *v170;
  PGFeatureExtractorLowLightScore *v171;
  PGFeatureExtractorLowLightScore *v172;
  PGFeatureExtractorPleasantCameraTiltScore *v173;
  PGFeatureExtractorPleasantCameraTiltScore *v174;
  PGFeatureExtractorPleasantCameraTiltScore *v175;
  PGFeatureExtractorIntrusiveObjectPresenceScore *v176;
  PGFeatureExtractorIntrusiveObjectPresenceScore *v177;
  PGFeatureExtractorIntrusiveObjectPresenceScore *v178;
  PGFeatureExtractorInterestingSubjectScore *v179;
  PGFeatureExtractorInterestingSubjectScore *v180;
  PGFeatureExtractorInterestingSubjectScore *v181;
  PGFeatureExtractorPleasantCompositionScore *v182;
  uint64_t v183;
  PGFeatureExtractorPleasantCompositionScore *v184;
  PGFeatureExtractorNoiseScore *v185;
  PGFeatureExtractorPleasantCompositionScore *v186;
  PGFeatureExtractorNoiseScore *v187;
  PGFeatureExtractorPleasantPostProcessingScore *v188;
  PGFeatureExtractorNoiseScore *v189;
  PGFeatureExtractorPleasantPostProcessingScore *v190;
  PGFeatureExtractorPleasantPerspectiveScore *v191;
  PGFeatureExtractorPleasantPostProcessingScore *v192;
  PGFeatureExtractorPleasantPerspectiveScore *v193;
  PGFeatureExtractorImmersivenessScore *v194;
  PGFeatureExtractorPleasantPerspectiveScore *v195;
  PGFeatureExtractorImmersivenessScore *v196;
  PGFeatureExtractorPleasantPatternScore *v197;
  PGFeatureExtractorImmersivenessScore *v198;
  PGFeatureExtractorPleasantPatternScore *v199;
  PGFeatureExtractorPleasantSymmetryScore *v200;
  PGFeatureExtractorPleasantPatternScore *v201;
  PGFeatureExtractorPleasantSymmetryScore *v202;
  PGFeatureExtractorLivelyColorScore *v203;
  PGFeatureExtractorPleasantSymmetryScore *v204;
  PGFeatureExtractorLivelyColorScore *v205;
  PGFeatureExtractorPleasantReflectionsScore *v206;
  PGFeatureExtractorLivelyColorScore *v207;
  PGFeatureExtractorPleasantReflectionsScore *v208;
  PGFeatureExtractorHarmoniousColorScore *v209;
  PGFeatureExtractorPleasantReflectionsScore *v210;
  PGFeatureExtractorHarmoniousColorScore *v211;
  PGFeatureExtractorSharplyFocusedSubjectScore *v212;
  PGFeatureExtractorHarmoniousColorScore *v213;
  PGFeatureExtractorSharplyFocusedSubjectScore *v214;
  PGFeatureExtractorWellTimedShotScore *v215;
  PGFeatureExtractorSharplyFocusedSubjectScore *v216;
  PGFeatureExtractorWellTimedShotScore *v217;
  PGFeatureExtractorWellChosenSubjectScore *v218;
  PGFeatureExtractorWellTimedShotScore *v219;
  PGFeatureExtractorWellChosenSubjectScore *v220;
  PGFeatureExtractorWellFramedSubjectScore *v221;
  PGFeatureExtractorWellChosenSubjectScore *v222;
  PGFeatureExtractorWellFramedSubjectScore *v223;
  PGFeatureExtractorPleasantLightingScore *v224;
  PGFeatureExtractorWellFramedSubjectScore *v225;
  PGFeatureExtractorPleasantLightingScore *v226;
  PGFeatureExtractorAestheticScore *v227;
  PGFeatureExtractorPleasantLightingScore *v228;
  PGFeatureExtractorAestheticScore *v229;
  PGFeatureExtractorFailureScore *v230;
  PGFeatureExtractorAestheticScore *v231;
  PGFeatureExtractorFailureScore *v232;
  PGFeatureExtractorTastefullyBlurredScore *v233;
  PGFeatureExtractorFailureScore *v234;
  PGFeatureExtractorTastefullyBlurredScore *v235;
  PGFeatureExtractorAutoplaySuggestionScore *v236;
  PGMobilityFeatureExtractor *v237;
  PGFeatureExtractorTastefullyBlurredScore *v238;
  PGFeatureExtractorAutoplaySuggestionScore *v239;
  PGFeatureExtractorViewCount *v240;
  PGMyWorkFeatureExtractor *v241;
  PGFeatureExtractorAutoplaySuggestionScore *v242;
  PGFeatureExtractorViewCount *v243;
  PGFeatureExtractorShareCount *v244;
  PGMyHomeFeatureExtractor *v245;
  PGFeatureExtractorViewCount *v246;
  PGFeatureExtractorShareCount *v247;
  PGFeatureExtractorPlayCount *v248;
  PGSceneFeatureExtractor *v249;
  PGFeatureExtractorShareCount *v250;
  PGFeatureExtractorPlayCount *v251;
  PGOverTheYearsMemoryNodeFeatureExtractor *v252;
  PGFeatureExtractorIsScreenRecording *v253;
  PGBabyFeatureExtractor *v254;
  PGFeatureExtractorPlayCount *v255;
  PGFeatureExtractorIsScreenRecording *v256;
  PGSocialGroupMemoryNodeFeatureExtractor *v257;
  PGFeatureExtractorImageAspectRatio *v258;
  PGInvariantPetFeatureExtractor *v259;
  PGFeatureExtractorIsScreenRecording *v260;
  PGFeatureExtractorImageAspectRatio *v261;
  PGChildMemoryNodeFeatureExtractor *v262;
  PGFeatureExtractorDurationInSecond *v263;
  PGBusinessCategoryFeatureExtractor *v264;
  PGFeatureExtractorImageAspectRatio *v265;
  PGFeatureExtractorDurationInSecond *v266;
  PGInvariantMyFriendMemoryNodeFeatureExtractor *v267;
  PGFeatureExtractorHasAdjustmentsScore *v268;
  PGPublicEventCategoryFeatureExtractor *v269;
  PGFeatureExtractorDurationInSecond *v270;
  PGFeatureExtractorHasAdjustmentsScore *v271;
  PGInvariantBrotherMemoryNodeFeatureExtractor *v272;
  PGFrequentLocationFeatureExtractor *v273;
  PGFeatureExtractorIsFavoriteScore *v274;
  PGInvariantDaughterFeatureExtractor *v275;
  PGFeatureExtractorHasAdjustmentsScore *v276;
  PGFeatureExtractorIsFavoriteScore *v277;
  PGInvariantSisterMemoryNodeFeatureExtractor *v278;
  PGSceneFeatureExtractor *v279;
  PGFeatureExtractorAudioClassification *v280;
  PGInvariantSonFeatureExtractor *v281;
  PGFeatureExtractorIsFavoriteScore *v282;
  PGFeatureExtractorAudioClassification *v283;
  PGInvariantSonMemoryNodeFeatureExtractor *v284;
  PGBabyFeatureExtractor *v285;
  PGFeatureExtractorBlurrinessScore *v286;
  PGInvariantFatherFeatureExtractor *v287;
  PGFeatureExtractorAudioClassification *v288;
  PGSceneFeatureExtractor *v289;
  PGFeatureExtractorBlurrinessScore *v290;
  PGInvariantDaughterMemoryNodeFeatureExtractor *v291;
  PGInvariantPetFeatureExtractor *v292;
  PGFeatureExtractorVideoScore *v293;
  PGInvariantMotherFeatureExtractor *v294;
  PGFeatureExtractorBlurrinessScore *v295;
  PGBabyFeatureExtractor *v296;
  PGFeatureExtractorVideoScore *v297;
  PGInvariantFatherMemoryNodeFeatureExtractor *v298;
  PGBusinessCategoryFeatureExtractor *v299;
  PGFeatureExtractorActivityScore *v300;
  PGInvariantSisterFeatureExtractor *v301;
  PGFeatureExtractorVideoScore *v302;
  PGInvariantPetFeatureExtractor *v303;
  PGFeatureExtractorActivityScore *v304;
  PGInvariantMotherMemoryNodeFeatureExtractor *v305;
  PGPublicEventCategoryFeatureExtractor *v306;
  PGFeatureExtractorFaceCountScore *v307;
  PGInvariantBrotherFeatureExtractor *v308;
  PGFeatureExtractorActivityScore *v309;
  PGBusinessCategoryFeatureExtractor *v310;
  PGFeatureExtractorFaceCountScore *v311;
  PGBabyMemoryNodeFeatureExtractor *v312;
  PGInvariantPartnerFeatureExtractor *v313;
  PGFeatureExtractorExposureScore *v314;
  PGInvariantPartnerFeatureExtractor *v315;
  PGFeatureExtractorFaceCountScore *v316;
  PGPublicEventCategoryFeatureExtractor *v317;
  PGFeatureExtractorExposureScore *v318;
  PGInvariantPetMemoryNodeFeatureExtractor *v319;
  PGInvariantCoworkerFeatureExtractor *v320;
  PGFeatureExtractorFrequentPeople *v321;
  PGInvariantCoworkerFeatureExtractor *v322;
  PGFeatureExtractorExposureScore *v323;
  PGMyHomeFeatureExtractor *v324;
  PGInvariantPartnerFeatureExtractor *v325;
  PGFeatureExtractorFrequentPeople *v326;
  PGInvariantPartnerBiologicalSexFemaleMemoryNodeFeatureExtractor *v327;
  PGInvariantFamilyFeatureExtractor *v328;
  PGFeatureExtractorCartesianLocation *v329;
  PGInvariantFamilyFeatureExtractor *v330;
  PGFeatureExtractorFrequentPeople *v331;
  PGSceneFeatureExtractor *v332;
  PGInvariantCoworkerFeatureExtractor *v333;
  PGFeatureExtractorCartesianLocation *v334;
  PGInvariantPartnerBiologicalSexMaleMemoryNodeFeatureExtractor *v335;
  PGPeopleFeatureExtractor *v336;
  uint64_t v337;
  PGPersonActivityMeaningFeatureExtractor *v338;
  PGFeatureExtractorCartesianLocation *v339;
  PGInvariantPetFeatureExtractor *v340;
  PGInvariantFamilyFeatureExtractor *v341;
  PGInvariantPartnerMemoryNodeFeatureExtractor *v342;
  PGMeaningFeatureExtractor *v343;
  void *v344;
  PGMeaningFeatureExtractor *v345;
  PGSocialGroupFeatureExtractor *v346;
  PGMeaningFeatureExtractor *v347;
  PGInvariantCoworkerMemoryNodeFeatureExtractor *v348;
  id v349;
  id v350;
  PGInvariantFamilyFeatureExtractor *v351;
  id v352;
  PGMyHomeFeatureExtractor *v353;
  PGInvariantFamilyMemoryNodeFeatureExtractor *v354;
  id v355;
  id v356;
  PGPersonActivityMeaningFeatureExtractor *v357;
  id v358;
  PGMeaningFeatureExtractor *v359;
  PGMeaningMemoryNodeFeatureExtractor *v360;
  id v361;
  id v362;
  PGMeaningFeatureExtractor *v363;
  id v364;
  id v365;
  id v366;
  id v367;
  id v368;
  id v369;
  id v370;
  id v371;
  id v372;
  _QWORD v373[25];
  _QWORD v374[8];
  _QWORD v375[13];
  _QWORD v376[57];
  _QWORD v377[5];
  _QWORD v378[28];
  _QWORD v379[56];
  _QWORD v380[5];
  _QWORD v381[20];
  _QWORD v382[56];
  _QWORD v383[5];
  _QWORD v384[18];
  _QWORD v385[4];

  v385[2] = *MEMORY[0x1E0C80C00];
  v372 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  switch(a3)
  {
    case 0:
      v17 = objc_alloc(MEMORY[0x1E0D42A10]);
      v385[0] = v372;
      v385[1] = v14;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v385, 2);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      a3 = objc_msgSend(v17, "initWithName:featureExtractors:", &stru_1E8436F28, v18);

      goto LABEL_19;
    case 1:
      if (!v15)
        goto LABEL_18;
      v347 = -[PGMeaningFeatureExtractor initWithVersion:error:]([PGMeaningFeatureExtractor alloc], "initWithVersion:error:", 1, a8);
      v384[0] = v347;
      v341 = -[PGInvariantFamilyFeatureExtractor initWithError:]([PGInvariantFamilyFeatureExtractor alloc], "initWithError:", a8);
      v384[1] = v341;
      v333 = -[PGInvariantCoworkerFeatureExtractor initWithError:]([PGInvariantCoworkerFeatureExtractor alloc], "initWithError:", a8);
      v384[2] = v333;
      v325 = -[PGInvariantPartnerFeatureExtractor initWithError:]([PGInvariantPartnerFeatureExtractor alloc], "initWithError:", a8);
      v384[3] = v325;
      v317 = -[PGPublicEventCategoryFeatureExtractor initWithVersion:error:]([PGPublicEventCategoryFeatureExtractor alloc], "initWithVersion:error:", 1, a8);
      v384[4] = v317;
      v310 = -[PGBusinessCategoryFeatureExtractor initWithVersion:error:]([PGBusinessCategoryFeatureExtractor alloc], "initWithVersion:error:", 1, a8);
      v384[5] = v310;
      v303 = -[PGInvariantPetFeatureExtractor initWithVersion:error:]([PGInvariantPetFeatureExtractor alloc], "initWithVersion:error:", 1, a8);
      v384[6] = v303;
      v296 = -[PGBabyFeatureExtractor initWithError:]([PGBabyFeatureExtractor alloc], "initWithError:", a8);
      v384[7] = v296;
      v289 = -[PGSceneFeatureExtractor initWithVersion:error:]([PGSceneFeatureExtractor alloc], "initWithVersion:error:", 1, a8);
      v384[8] = v289;
      v95 = -[PGMyHomeFeatureExtractor initWithError:]([PGMyHomeFeatureExtractor alloc], "initWithError:", a8);
      v384[9] = v95;
      v96 = -[PGMyWorkFeatureExtractor initWithError:]([PGMyWorkFeatureExtractor alloc], "initWithError:", a8);
      v384[10] = v96;
      v358 = v16;
      v97 = -[PGMobilityFeatureExtractor initWithError:]([PGMobilityFeatureExtractor alloc], "initWithError:", a8);
      v384[11] = v97;
      v364 = v14;
      v98 = -[PGPartOfDayFeatureExtractor initWithError:]([PGPartOfDayFeatureExtractor alloc], "initWithError:", a8);
      v384[12] = v98;
      v370 = a1;
      v99 = -[PGSeasonFeatureExtractor initWithError:]([PGSeasonFeatureExtractor alloc], "initWithError:", a8);
      v384[13] = v99;
      v100 = -[PGWeekendFeatureExtractor initWithError:]([PGWeekendFeatureExtractor alloc], "initWithError:", a8);
      v384[14] = v100;
      v101 = -[PGWeekdayFeatureExtractor initWithError:]([PGWeekdayFeatureExtractor alloc], "initWithError:", a8);
      v384[15] = v101;
      v352 = v15;
      v102 = -[PGPOIFeatureExtractor initWithVersion:error:]([PGPOIFeatureExtractor alloc], "initWithVersion:error:", 1, a8);
      v384[16] = v102;
      v103 = -[PGROIFeatureExtractor initWithError:]([PGROIFeatureExtractor alloc], "initWithError:", a8);
      v384[17] = v103;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v384, 18);
      v104 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v370, "_featureExtractors:withTransformers:", v104, v358);
      v344 = (void *)objc_claimAutoreleasedReturnValue();

      v105 = objc_alloc_init(PGFeatureExtractorFaceSize);
      v383[0] = v105;
      v106 = objc_alloc_init(PGFeatureExtractorFaceQuality);
      v383[1] = v106;
      v107 = objc_alloc_init(PGFeatureExtractorFaceSmileType);
      v383[2] = v107;
      v108 = objc_alloc_init(PGFeatureExtractorFaceEyesState);
      v383[3] = v108;
      v109 = objc_alloc_init(PGFeatureExtractorFaceAgeType);
      v383[4] = v109;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v383, 5);
      v110 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v370, "_featureExtractors:withTransformers:", v110, v358);
      v337 = objc_claimAutoreleasedReturnValue();

      v382[0] = v372;
      v334 = objc_alloc_init(PGFeatureExtractorCartesianLocation);
      v382[1] = v334;
      v326 = -[PGFeatureExtractorFrequentPeople initWithNumberOfFrequentPeopleToExtract:]([PGFeatureExtractorFrequentPeople alloc], "initWithNumberOfFrequentPeopleToExtract:", 25);
      v382[2] = v326;
      v318 = objc_alloc_init(PGFeatureExtractorExposureScore);
      v382[3] = v318;
      v311 = objc_alloc_init(PGFeatureExtractorFaceCountScore);
      v382[4] = v311;
      v304 = objc_alloc_init(PGFeatureExtractorActivityScore);
      v382[5] = v304;
      v297 = objc_alloc_init(PGFeatureExtractorVideoScore);
      v382[6] = v297;
      v290 = objc_alloc_init(PGFeatureExtractorBlurrinessScore);
      v382[7] = v290;
      v283 = objc_alloc_init(PGFeatureExtractorAudioClassification);
      v382[8] = v283;
      v277 = objc_alloc_init(PGFeatureExtractorIsFavoriteScore);
      v382[9] = v277;
      v271 = objc_alloc_init(PGFeatureExtractorHasAdjustmentsScore);
      v382[10] = v271;
      v266 = objc_alloc_init(PGFeatureExtractorDurationInSecond);
      v382[11] = v266;
      v261 = objc_alloc_init(PGFeatureExtractorImageAspectRatio);
      v382[12] = v261;
      v256 = objc_alloc_init(PGFeatureExtractorIsScreenRecording);
      v382[13] = v256;
      v251 = objc_alloc_init(PGFeatureExtractorPlayCount);
      v382[14] = v251;
      v247 = objc_alloc_init(PGFeatureExtractorShareCount);
      v382[15] = v247;
      v243 = objc_alloc_init(PGFeatureExtractorViewCount);
      v382[16] = v243;
      v239 = objc_alloc_init(PGFeatureExtractorAutoplaySuggestionScore);
      v382[17] = v239;
      v235 = objc_alloc_init(PGFeatureExtractorTastefullyBlurredScore);
      v382[18] = v235;
      v232 = objc_alloc_init(PGFeatureExtractorFailureScore);
      v382[19] = v232;
      v229 = objc_alloc_init(PGFeatureExtractorAestheticScore);
      v382[20] = v229;
      v226 = objc_alloc_init(PGFeatureExtractorPleasantLightingScore);
      v382[21] = v226;
      v223 = objc_alloc_init(PGFeatureExtractorWellFramedSubjectScore);
      v382[22] = v223;
      v220 = objc_alloc_init(PGFeatureExtractorWellChosenSubjectScore);
      v382[23] = v220;
      v217 = objc_alloc_init(PGFeatureExtractorWellTimedShotScore);
      v382[24] = v217;
      v214 = objc_alloc_init(PGFeatureExtractorSharplyFocusedSubjectScore);
      v382[25] = v214;
      v211 = objc_alloc_init(PGFeatureExtractorHarmoniousColorScore);
      v382[26] = v211;
      v208 = objc_alloc_init(PGFeatureExtractorPleasantReflectionsScore);
      v382[27] = v208;
      v205 = objc_alloc_init(PGFeatureExtractorLivelyColorScore);
      v382[28] = v205;
      v202 = objc_alloc_init(PGFeatureExtractorPleasantSymmetryScore);
      v382[29] = v202;
      v199 = objc_alloc_init(PGFeatureExtractorPleasantPatternScore);
      v382[30] = v199;
      v196 = objc_alloc_init(PGFeatureExtractorImmersivenessScore);
      v382[31] = v196;
      v193 = objc_alloc_init(PGFeatureExtractorPleasantPerspectiveScore);
      v382[32] = v193;
      v190 = objc_alloc_init(PGFeatureExtractorPleasantPostProcessingScore);
      v382[33] = v190;
      v187 = objc_alloc_init(PGFeatureExtractorNoiseScore);
      v382[34] = v187;
      v184 = objc_alloc_init(PGFeatureExtractorPleasantCompositionScore);
      v382[35] = v184;
      v181 = objc_alloc_init(PGFeatureExtractorInterestingSubjectScore);
      v382[36] = v181;
      v178 = objc_alloc_init(PGFeatureExtractorIntrusiveObjectPresenceScore);
      v382[37] = v178;
      v175 = objc_alloc_init(PGFeatureExtractorPleasantCameraTiltScore);
      v382[38] = v175;
      v172 = objc_alloc_init(PGFeatureExtractorLowLightScore);
      v382[39] = v172;
      v169 = objc_alloc_init(PGFeatureExtractorAssetPlaybackStyle);
      v382[40] = v169;
      v166 = objc_alloc_init(PGFeatureExtractorAssetMediaType);
      v382[41] = v166;
      v160 = objc_alloc_init(PGFeatureExtractorAssetMediaSubtype);
      v382[42] = v160;
      v157 = objc_alloc_init(PGFeatureExtractorAssetBurstSelectionType);
      v382[43] = v157;
      v154 = objc_alloc_init(PGFeatureExtractorAssetSourceType);
      v382[44] = v154;
      v151 = objc_alloc_init(PGFeatureExtractorAssetResolution);
      v382[45] = v151;
      v148 = objc_alloc_init(PGFeatureExtractorAssetFormat);
      v382[46] = v148;
      v145 = objc_alloc_init(PGFeatureExtractorAssetImportSource);
      v382[47] = v145;
      v111 = objc_alloc_init(PGFeatureExtractorStandardAspectRatio);
      v382[48] = v111;
      v112 = objc_alloc_init(PGFeatureExtractorLocale);
      v382[49] = v112;
      v113 = objc_alloc_init(PGFeatureExtractorTaboo);
      v382[50] = v113;
      v114 = objc_alloc_init(PGFeatureExtractorPotentialLandmark);
      v382[51] = v114;
      v115 = [PGFeatureExtractorAssetPhotoLibrary alloc];
      v116 = objc_alloc_init(PGFeatureExtractorPhotoLibrarySize);
      v117 = -[PGFeatureExtractorAssetPhotoLibrary initWithPhotoLibraryFeatureExtractor:](v115, "initWithPhotoLibraryFeatureExtractor:", v116);
      v382[52] = v117;
      v382[53] = v364;
      v118 = [PGFeatureExtractorFacesFromAssetAverage alloc];
      v119 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A10]), "initWithName:featureExtractors:", CFSTR("FacesAverage"), v337);
      v120 = -[PGFeatureExtractorFacesFromAssetAverage initWithFaceFeatureExtractor:name:](v118, "initWithFaceFeatureExtractor:name:", v119, CFSTR("FacesAverage"));
      v382[54] = v120;
      v121 = [PGFeatureExtractorGraphRelations alloc];
      v122 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A10]), "initWithName:featureExtractors:", CFSTR("GraphRelations"), v344);
      v123 = -[PGFeatureExtractorGraphRelations initWithGraph:featureExtractor:](v121, "initWithGraph:featureExtractor:", v352, v122);
      v382[55] = v123;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v382, 56);
      v163 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = v358;
      v14 = v364;

      v15 = v352;
      objc_msgSend(v370, "_featureExtractors:withTransformers:", v163, v358);
      v48 = (void *)objc_claimAutoreleasedReturnValue();

      v49 = objc_alloc(MEMORY[0x1E0D42A10]);
      v50 = CFSTR("MultiModal-V1.0");
      goto LABEL_11;
    case 2:
      if (!v15)
        goto LABEL_18;
      v343 = -[PGMeaningFeatureExtractor initWithVersion:error:]([PGMeaningFeatureExtractor alloc], "initWithVersion:error:", 1, a8);
      v381[0] = v343;
      v336 = -[PGPeopleFeatureExtractor initWithGraph:error:]([PGPeopleFeatureExtractor alloc], "initWithGraph:error:", v15, a8);
      v381[1] = v336;
      v328 = -[PGInvariantFamilyFeatureExtractor initWithError:]([PGInvariantFamilyFeatureExtractor alloc], "initWithError:", a8);
      v381[2] = v328;
      v320 = -[PGInvariantCoworkerFeatureExtractor initWithError:]([PGInvariantCoworkerFeatureExtractor alloc], "initWithError:", a8);
      v381[3] = v320;
      v313 = -[PGInvariantPartnerFeatureExtractor initWithError:]([PGInvariantPartnerFeatureExtractor alloc], "initWithError:", a8);
      v381[4] = v313;
      v306 = -[PGPublicEventCategoryFeatureExtractor initWithVersion:error:]([PGPublicEventCategoryFeatureExtractor alloc], "initWithVersion:error:", 1, a8);
      v381[5] = v306;
      v299 = -[PGBusinessCategoryFeatureExtractor initWithVersion:error:]([PGBusinessCategoryFeatureExtractor alloc], "initWithVersion:error:", 1, a8);
      v381[6] = v299;
      v292 = -[PGInvariantPetFeatureExtractor initWithVersion:error:]([PGInvariantPetFeatureExtractor alloc], "initWithVersion:error:", 1, a8);
      v381[7] = v292;
      v285 = -[PGBabyFeatureExtractor initWithError:]([PGBabyFeatureExtractor alloc], "initWithError:", a8);
      v381[8] = v285;
      v279 = -[PGSceneFeatureExtractor initWithVersion:error:]([PGSceneFeatureExtractor alloc], "initWithVersion:error:", 1, a8);
      v381[9] = v279;
      v273 = -[PGFrequentLocationFeatureExtractor initWithGraph:error:]([PGFrequentLocationFeatureExtractor alloc], "initWithGraph:error:", v15, a8);
      v381[10] = v273;
      v355 = v16;
      v19 = -[PGMyHomeFeatureExtractor initWithError:]([PGMyHomeFeatureExtractor alloc], "initWithError:", a8);
      v381[11] = v19;
      v367 = a1;
      v20 = -[PGMyWorkFeatureExtractor initWithError:]([PGMyWorkFeatureExtractor alloc], "initWithError:", a8);
      v381[12] = v20;
      v21 = -[PGMobilityFeatureExtractor initWithError:]([PGMobilityFeatureExtractor alloc], "initWithError:", a8);
      v381[13] = v21;
      v361 = v14;
      v22 = -[PGPartOfDayFeatureExtractor initWithError:]([PGPartOfDayFeatureExtractor alloc], "initWithError:", a8);
      v381[14] = v22;
      v23 = -[PGSeasonFeatureExtractor initWithError:]([PGSeasonFeatureExtractor alloc], "initWithError:", a8);
      v381[15] = v23;
      v24 = -[PGWeekendFeatureExtractor initWithError:]([PGWeekendFeatureExtractor alloc], "initWithError:", a8);
      v381[16] = v24;
      v25 = -[PGWeekdayFeatureExtractor initWithError:]([PGWeekdayFeatureExtractor alloc], "initWithError:", a8);
      v381[17] = v25;
      v349 = v15;
      v26 = -[PGPOIFeatureExtractor initWithVersion:error:]([PGPOIFeatureExtractor alloc], "initWithVersion:error:", 1, a8);
      v381[18] = v26;
      v27 = -[PGROIFeatureExtractor initWithError:]([PGROIFeatureExtractor alloc], "initWithError:", a8);
      v381[19] = v27;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v381, 20);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v367, "_featureExtractors:withTransformers:", v28, v355);
      v344 = (void *)objc_claimAutoreleasedReturnValue();

      v29 = objc_alloc_init(PGFeatureExtractorFaceSize);
      v380[0] = v29;
      v30 = objc_alloc_init(PGFeatureExtractorFaceQuality);
      v380[1] = v30;
      v31 = objc_alloc_init(PGFeatureExtractorFaceSmileType);
      v380[2] = v31;
      v32 = objc_alloc_init(PGFeatureExtractorFaceEyesState);
      v380[3] = v32;
      v33 = objc_alloc_init(PGFeatureExtractorFaceAgeType);
      v380[4] = v33;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v380, 5);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v367, "_featureExtractors:withTransformers:", v34, v355);
      v337 = objc_claimAutoreleasedReturnValue();

      v379[0] = v372;
      v329 = objc_alloc_init(PGFeatureExtractorCartesianLocation);
      v379[1] = v329;
      v321 = -[PGFeatureExtractorFrequentPeople initWithNumberOfFrequentPeopleToExtract:]([PGFeatureExtractorFrequentPeople alloc], "initWithNumberOfFrequentPeopleToExtract:", 25);
      v379[2] = v321;
      v314 = objc_alloc_init(PGFeatureExtractorExposureScore);
      v379[3] = v314;
      v307 = objc_alloc_init(PGFeatureExtractorFaceCountScore);
      v379[4] = v307;
      v300 = objc_alloc_init(PGFeatureExtractorActivityScore);
      v379[5] = v300;
      v293 = objc_alloc_init(PGFeatureExtractorVideoScore);
      v379[6] = v293;
      v286 = objc_alloc_init(PGFeatureExtractorBlurrinessScore);
      v379[7] = v286;
      v280 = objc_alloc_init(PGFeatureExtractorAudioClassification);
      v379[8] = v280;
      v274 = objc_alloc_init(PGFeatureExtractorIsFavoriteScore);
      v379[9] = v274;
      v268 = objc_alloc_init(PGFeatureExtractorHasAdjustmentsScore);
      v379[10] = v268;
      v263 = objc_alloc_init(PGFeatureExtractorDurationInSecond);
      v379[11] = v263;
      v258 = objc_alloc_init(PGFeatureExtractorImageAspectRatio);
      v379[12] = v258;
      v253 = objc_alloc_init(PGFeatureExtractorIsScreenRecording);
      v379[13] = v253;
      v248 = objc_alloc_init(PGFeatureExtractorPlayCount);
      v379[14] = v248;
      v244 = objc_alloc_init(PGFeatureExtractorShareCount);
      v379[15] = v244;
      v240 = objc_alloc_init(PGFeatureExtractorViewCount);
      v379[16] = v240;
      v236 = objc_alloc_init(PGFeatureExtractorAutoplaySuggestionScore);
      v379[17] = v236;
      v233 = objc_alloc_init(PGFeatureExtractorTastefullyBlurredScore);
      v379[18] = v233;
      v230 = objc_alloc_init(PGFeatureExtractorFailureScore);
      v379[19] = v230;
      v227 = objc_alloc_init(PGFeatureExtractorAestheticScore);
      v379[20] = v227;
      v224 = objc_alloc_init(PGFeatureExtractorPleasantLightingScore);
      v379[21] = v224;
      v221 = objc_alloc_init(PGFeatureExtractorWellFramedSubjectScore);
      v379[22] = v221;
      v218 = objc_alloc_init(PGFeatureExtractorWellChosenSubjectScore);
      v379[23] = v218;
      v215 = objc_alloc_init(PGFeatureExtractorWellTimedShotScore);
      v379[24] = v215;
      v212 = objc_alloc_init(PGFeatureExtractorSharplyFocusedSubjectScore);
      v379[25] = v212;
      v209 = objc_alloc_init(PGFeatureExtractorHarmoniousColorScore);
      v379[26] = v209;
      v206 = objc_alloc_init(PGFeatureExtractorPleasantReflectionsScore);
      v379[27] = v206;
      v203 = objc_alloc_init(PGFeatureExtractorLivelyColorScore);
      v379[28] = v203;
      v200 = objc_alloc_init(PGFeatureExtractorPleasantSymmetryScore);
      v379[29] = v200;
      v197 = objc_alloc_init(PGFeatureExtractorPleasantPatternScore);
      v379[30] = v197;
      v194 = objc_alloc_init(PGFeatureExtractorImmersivenessScore);
      v379[31] = v194;
      v191 = objc_alloc_init(PGFeatureExtractorPleasantPerspectiveScore);
      v379[32] = v191;
      v188 = objc_alloc_init(PGFeatureExtractorPleasantPostProcessingScore);
      v379[33] = v188;
      v185 = objc_alloc_init(PGFeatureExtractorNoiseScore);
      v379[34] = v185;
      v182 = objc_alloc_init(PGFeatureExtractorPleasantCompositionScore);
      v379[35] = v182;
      v179 = objc_alloc_init(PGFeatureExtractorInterestingSubjectScore);
      v379[36] = v179;
      v176 = objc_alloc_init(PGFeatureExtractorIntrusiveObjectPresenceScore);
      v379[37] = v176;
      v173 = objc_alloc_init(PGFeatureExtractorPleasantCameraTiltScore);
      v379[38] = v173;
      v170 = objc_alloc_init(PGFeatureExtractorLowLightScore);
      v379[39] = v170;
      v167 = objc_alloc_init(PGFeatureExtractorAssetPlaybackStyle);
      v379[40] = v167;
      v164 = objc_alloc_init(PGFeatureExtractorAssetMediaType);
      v379[41] = v164;
      v158 = objc_alloc_init(PGFeatureExtractorAssetMediaSubtype);
      v379[42] = v158;
      v155 = objc_alloc_init(PGFeatureExtractorAssetBurstSelectionType);
      v379[43] = v155;
      v152 = objc_alloc_init(PGFeatureExtractorAssetSourceType);
      v379[44] = v152;
      v149 = objc_alloc_init(PGFeatureExtractorAssetResolution);
      v379[45] = v149;
      v146 = objc_alloc_init(PGFeatureExtractorAssetFormat);
      v379[46] = v146;
      v143 = objc_alloc_init(PGFeatureExtractorAssetImportSource);
      v379[47] = v143;
      v35 = objc_alloc_init(PGFeatureExtractorStandardAspectRatio);
      v379[48] = v35;
      v36 = objc_alloc_init(PGFeatureExtractorLocale);
      v379[49] = v36;
      v37 = objc_alloc_init(PGFeatureExtractorTaboo);
      v379[50] = v37;
      v38 = objc_alloc_init(PGFeatureExtractorPotentialLandmark);
      v379[51] = v38;
      v39 = [PGFeatureExtractorAssetPhotoLibrary alloc];
      v40 = objc_alloc_init(PGFeatureExtractorPhotoLibrarySize);
      v41 = -[PGFeatureExtractorAssetPhotoLibrary initWithPhotoLibraryFeatureExtractor:](v39, "initWithPhotoLibraryFeatureExtractor:", v40);
      v379[52] = v41;
      v379[53] = v361;
      v42 = [PGFeatureExtractorFacesFromAssetAverage alloc];
      v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A10]), "initWithName:featureExtractors:", CFSTR("FacesAverage"), v337);
      v44 = -[PGFeatureExtractorFacesFromAssetAverage initWithFaceFeatureExtractor:name:](v42, "initWithFaceFeatureExtractor:name:", v43, CFSTR("FacesAverage"));
      v379[54] = v44;
      v45 = [PGFeatureExtractorGraphRelations alloc];
      v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A10]), "initWithName:featureExtractors:", CFSTR("GraphRelations"), v344);
      v47 = -[PGFeatureExtractorGraphRelations initWithGraph:featureExtractor:](v45, "initWithGraph:featureExtractor:", v349, v46);
      v379[55] = v47;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v379, 56);
      v161 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = v355;
      v14 = v361;

      v15 = v349;
      objc_msgSend(v367, "_featureExtractors:withTransformers:", v161, v355);
      v48 = (void *)objc_claimAutoreleasedReturnValue();

      v49 = objc_alloc(MEMORY[0x1E0D42A10]);
      v50 = CFSTR("LibrarySpecific-MultiModal-V1.0");
LABEL_11:
      a3 = objc_msgSend(v49, "initWithName:featureExtractors:", v50, v48);

      v81 = (void *)v337;
      goto LABEL_12;
    case 3:
      if (!v15)
        goto LABEL_18;
      v345 = -[PGMeaningFeatureExtractor initWithVersion:error:]([PGMeaningFeatureExtractor alloc], "initWithVersion:error:", 2, a8);
      v378[0] = v345;
      v338 = -[PGPersonActivityMeaningFeatureExtractor initWithVersion:error:]([PGPersonActivityMeaningFeatureExtractor alloc], "initWithVersion:error:", 1, a8);
      v378[1] = v338;
      v330 = -[PGInvariantFamilyFeatureExtractor initWithError:]([PGInvariantFamilyFeatureExtractor alloc], "initWithError:", a8);
      v378[2] = v330;
      v322 = -[PGInvariantCoworkerFeatureExtractor initWithError:]([PGInvariantCoworkerFeatureExtractor alloc], "initWithError:", a8);
      v378[3] = v322;
      v315 = -[PGInvariantPartnerFeatureExtractor initWithError:]([PGInvariantPartnerFeatureExtractor alloc], "initWithError:", a8);
      v378[4] = v315;
      v308 = -[PGInvariantBrotherFeatureExtractor initWithError:]([PGInvariantBrotherFeatureExtractor alloc], "initWithError:", a8);
      v378[5] = v308;
      v301 = -[PGInvariantSisterFeatureExtractor initWithError:]([PGInvariantSisterFeatureExtractor alloc], "initWithError:", a8);
      v378[6] = v301;
      v294 = -[PGInvariantMotherFeatureExtractor initWithError:]([PGInvariantMotherFeatureExtractor alloc], "initWithError:", a8);
      v378[7] = v294;
      v287 = -[PGInvariantFatherFeatureExtractor initWithError:]([PGInvariantFatherFeatureExtractor alloc], "initWithError:", a8);
      v378[8] = v287;
      v281 = -[PGInvariantSonFeatureExtractor initWithError:]([PGInvariantSonFeatureExtractor alloc], "initWithError:", a8);
      v378[9] = v281;
      v275 = -[PGInvariantDaughterFeatureExtractor initWithError:]([PGInvariantDaughterFeatureExtractor alloc], "initWithError:", a8);
      v378[10] = v275;
      v269 = -[PGPublicEventCategoryFeatureExtractor initWithVersion:error:]([PGPublicEventCategoryFeatureExtractor alloc], "initWithVersion:error:", 2, a8);
      v378[11] = v269;
      v264 = -[PGBusinessCategoryFeatureExtractor initWithVersion:error:]([PGBusinessCategoryFeatureExtractor alloc], "initWithVersion:error:", 2, a8);
      v378[12] = v264;
      v259 = -[PGInvariantPetFeatureExtractor initWithVersion:error:]([PGInvariantPetFeatureExtractor alloc], "initWithVersion:error:", 2, a8);
      v378[13] = v259;
      v254 = -[PGBabyFeatureExtractor initWithError:]([PGBabyFeatureExtractor alloc], "initWithError:", a8);
      v378[14] = v254;
      v249 = -[PGSceneFeatureExtractor initWithVersion:error:]([PGSceneFeatureExtractor alloc], "initWithVersion:error:", 2, a8);
      v378[15] = v249;
      v245 = -[PGMyHomeFeatureExtractor initWithError:]([PGMyHomeFeatureExtractor alloc], "initWithError:", a8);
      v378[16] = v245;
      v241 = -[PGMyWorkFeatureExtractor initWithError:]([PGMyWorkFeatureExtractor alloc], "initWithError:", a8);
      v378[17] = v241;
      v237 = -[PGMobilityFeatureExtractor initWithError:]([PGMobilityFeatureExtractor alloc], "initWithError:", a8);
      v378[18] = v237;
      v51 = -[PGPartOfDayFeatureExtractor initWithError:]([PGPartOfDayFeatureExtractor alloc], "initWithError:", a8);
      v378[19] = v51;
      v368 = a1;
      v52 = -[PGSeasonFeatureExtractor initWithError:]([PGSeasonFeatureExtractor alloc], "initWithError:", a8);
      v378[20] = v52;
      v53 = -[PGWeekendFeatureExtractor initWithError:]([PGWeekendFeatureExtractor alloc], "initWithError:", a8);
      v378[21] = v53;
      v362 = v14;
      v54 = -[PGWeekdayFeatureExtractor initWithError:]([PGWeekdayFeatureExtractor alloc], "initWithError:", a8);
      v378[22] = v54;
      v55 = -[PGPOIFeatureExtractor initWithVersion:error:]([PGPOIFeatureExtractor alloc], "initWithVersion:error:", 2, a8);
      v378[23] = v55;
      v56 = -[PGROIFeatureExtractor initWithError:]([PGROIFeatureExtractor alloc], "initWithError:", a8);
      v378[24] = v56;
      v356 = v16;
      v57 = -[PGInfrequentCountryFeatureExtractor initWithVersion:graph:error:]([PGInfrequentCountryFeatureExtractor alloc], "initWithVersion:graph:error:", 1, v15, a8);
      v378[25] = v57;
      v58 = -[PGCityFeatureExtractor initWithVersion:error:]([PGCityFeatureExtractor alloc], "initWithVersion:error:", 1, a8);
      v378[26] = v58;
      v350 = v15;
      v59 = -[PGCelebratedHolidayFeatureExtractor initWithVersion:error:]([PGCelebratedHolidayFeatureExtractor alloc], "initWithVersion:error:", 1, a8);
      v378[27] = v59;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v378, 28);
      v60 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v368, "_featureExtractors:withTransformers:", v60, v356);
      v344 = (void *)objc_claimAutoreleasedReturnValue();

      v61 = objc_alloc_init(PGFeatureExtractorFaceSize);
      v377[0] = v61;
      v62 = objc_alloc_init(PGFeatureExtractorFaceQuality);
      v377[1] = v62;
      v63 = objc_alloc_init(PGFeatureExtractorFaceSmileType);
      v377[2] = v63;
      v64 = objc_alloc_init(PGFeatureExtractorFaceEyesState);
      v377[3] = v64;
      v65 = objc_alloc_init(PGFeatureExtractorFaceAgeType);
      v377[4] = v65;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v377, 5);
      v66 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v368, "_featureExtractors:withTransformers:", v66, v356);
      v183 = objc_claimAutoreleasedReturnValue();

      v376[0] = v372;
      v339 = objc_alloc_init(PGFeatureExtractorCartesianLocation);
      v376[1] = v339;
      v331 = -[PGFeatureExtractorFrequentPeople initWithNumberOfFrequentPeopleToExtract:]([PGFeatureExtractorFrequentPeople alloc], "initWithNumberOfFrequentPeopleToExtract:", 25);
      v376[2] = v331;
      v323 = objc_alloc_init(PGFeatureExtractorExposureScore);
      v376[3] = v323;
      v316 = objc_alloc_init(PGFeatureExtractorFaceCountScore);
      v376[4] = v316;
      v309 = objc_alloc_init(PGFeatureExtractorActivityScore);
      v376[5] = v309;
      v302 = objc_alloc_init(PGFeatureExtractorVideoScore);
      v376[6] = v302;
      v295 = objc_alloc_init(PGFeatureExtractorBlurrinessScore);
      v376[7] = v295;
      v288 = objc_alloc_init(PGFeatureExtractorAudioClassification);
      v376[8] = v288;
      v282 = objc_alloc_init(PGFeatureExtractorIsFavoriteScore);
      v376[9] = v282;
      v276 = objc_alloc_init(PGFeatureExtractorHasAdjustmentsScore);
      v376[10] = v276;
      v270 = objc_alloc_init(PGFeatureExtractorDurationInSecond);
      v376[11] = v270;
      v265 = objc_alloc_init(PGFeatureExtractorImageAspectRatio);
      v376[12] = v265;
      v260 = objc_alloc_init(PGFeatureExtractorIsScreenRecording);
      v376[13] = v260;
      v255 = objc_alloc_init(PGFeatureExtractorPlayCount);
      v376[14] = v255;
      v250 = objc_alloc_init(PGFeatureExtractorShareCount);
      v376[15] = v250;
      v246 = objc_alloc_init(PGFeatureExtractorViewCount);
      v376[16] = v246;
      v242 = objc_alloc_init(PGFeatureExtractorAutoplaySuggestionScore);
      v376[17] = v242;
      v238 = objc_alloc_init(PGFeatureExtractorTastefullyBlurredScore);
      v376[18] = v238;
      v234 = objc_alloc_init(PGFeatureExtractorFailureScore);
      v376[19] = v234;
      v231 = objc_alloc_init(PGFeatureExtractorAestheticScore);
      v376[20] = v231;
      v228 = objc_alloc_init(PGFeatureExtractorPleasantLightingScore);
      v376[21] = v228;
      v225 = objc_alloc_init(PGFeatureExtractorWellFramedSubjectScore);
      v376[22] = v225;
      v222 = objc_alloc_init(PGFeatureExtractorWellChosenSubjectScore);
      v376[23] = v222;
      v219 = objc_alloc_init(PGFeatureExtractorWellTimedShotScore);
      v376[24] = v219;
      v216 = objc_alloc_init(PGFeatureExtractorSharplyFocusedSubjectScore);
      v376[25] = v216;
      v213 = objc_alloc_init(PGFeatureExtractorHarmoniousColorScore);
      v376[26] = v213;
      v210 = objc_alloc_init(PGFeatureExtractorPleasantReflectionsScore);
      v376[27] = v210;
      v207 = objc_alloc_init(PGFeatureExtractorLivelyColorScore);
      v376[28] = v207;
      v204 = objc_alloc_init(PGFeatureExtractorPleasantSymmetryScore);
      v376[29] = v204;
      v201 = objc_alloc_init(PGFeatureExtractorPleasantPatternScore);
      v376[30] = v201;
      v198 = objc_alloc_init(PGFeatureExtractorImmersivenessScore);
      v376[31] = v198;
      v195 = objc_alloc_init(PGFeatureExtractorPleasantPerspectiveScore);
      v376[32] = v195;
      v192 = objc_alloc_init(PGFeatureExtractorPleasantPostProcessingScore);
      v376[33] = v192;
      v189 = objc_alloc_init(PGFeatureExtractorNoiseScore);
      v376[34] = v189;
      v186 = objc_alloc_init(PGFeatureExtractorPleasantCompositionScore);
      v376[35] = v186;
      v180 = objc_alloc_init(PGFeatureExtractorInterestingSubjectScore);
      v376[36] = v180;
      v177 = objc_alloc_init(PGFeatureExtractorIntrusiveObjectPresenceScore);
      v376[37] = v177;
      v174 = objc_alloc_init(PGFeatureExtractorPleasantCameraTiltScore);
      v376[38] = v174;
      v171 = objc_alloc_init(PGFeatureExtractorLowLightScore);
      v376[39] = v171;
      v168 = objc_alloc_init(PGFeatureExtractorAssetPlaybackStyle);
      v376[40] = v168;
      v165 = objc_alloc_init(PGFeatureExtractorAssetMediaType);
      v376[41] = v165;
      v162 = objc_alloc_init(PGFeatureExtractorAssetMediaSubtype);
      v376[42] = v162;
      v156 = objc_alloc_init(PGFeatureExtractorAssetBurstSelectionType);
      v376[43] = v156;
      v153 = objc_alloc_init(PGFeatureExtractorAssetSourceType);
      v376[44] = v153;
      v150 = objc_alloc_init(PGFeatureExtractorAssetResolution);
      v376[45] = v150;
      v147 = objc_alloc_init(PGFeatureExtractorAssetFormat);
      v376[46] = v147;
      v144 = objc_alloc_init(PGFeatureExtractorAssetImportSource);
      v376[47] = v144;
      v142 = objc_alloc_init(PGFeatureExtractorStandardAspectRatio);
      v376[48] = v142;
      v67 = objc_alloc_init(PGFeatureExtractorLocale);
      v376[49] = v67;
      v68 = objc_alloc_init(PGFeatureExtractorTaboo);
      v376[50] = v68;
      v69 = objc_alloc_init(PGFeatureExtractorPotentialLandmark);
      v376[51] = v69;
      v70 = [PGFeatureExtractorAssetPhotoLibrary alloc];
      v71 = objc_alloc_init(PGFeatureExtractorPhotoLibrarySize);
      v72 = -[PGFeatureExtractorAssetPhotoLibrary initWithPhotoLibraryFeatureExtractor:](v70, "initWithPhotoLibraryFeatureExtractor:", v71);
      v376[52] = v72;
      v73 = -[PGFeatureExtractorAssetSpecialPOI initWithGraph:]([PGFeatureExtractorAssetSpecialPOI alloc], "initWithGraph:", v350);
      v376[53] = v73;
      v74 = [PGFeatureExtractorFacesFromAssetAverage alloc];
      v75 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A10]), "initWithName:featureExtractors:", CFSTR("FacesAverage"), v183);
      v76 = -[PGFeatureExtractorFacesFromAssetAverage initWithFaceFeatureExtractor:name:](v74, "initWithFaceFeatureExtractor:name:", v75, CFSTR("FacesAverage"));
      v376[54] = v76;
      v77 = [PGFeatureExtractorGraphRelations alloc];
      v78 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A10]), "initWithName:featureExtractors:", CFSTR("GraphRelations"), v344);
      v79 = -[PGFeatureExtractorGraphRelations initWithGraph:featureExtractor:](v77, "initWithGraph:featureExtractor:", v350, v78);
      v376[55] = v79;
      v376[56] = v362;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v376, 57);
      v159 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = v356;
      v14 = v362;

      v15 = v350;
      objc_msgSend(v368, "_featureExtractors:withTransformers:", v159, v356);
      v80 = (void *)objc_claimAutoreleasedReturnValue();

      a3 = objc_msgSend(objc_alloc(MEMORY[0x1E0D42A10]), "initWithName:featureExtractors:", CFSTR("MultiModal-V2.0"), v80);
      v81 = (void *)v183;
LABEL_12:

      goto LABEL_19;
    case 4:
      if (!v15)
        goto LABEL_18;
      v363 = -[PGMeaningFeatureExtractor initWithVersion:error:]([PGMeaningFeatureExtractor alloc], "initWithVersion:error:", 2, a8);
      v375[0] = v363;
      v357 = -[PGPersonActivityMeaningFeatureExtractor initWithVersion:error:]([PGPersonActivityMeaningFeatureExtractor alloc], "initWithVersion:error:", 1, a8);
      v375[1] = v357;
      v351 = -[PGInvariantFamilyFeatureExtractor initWithError:]([PGInvariantFamilyFeatureExtractor alloc], "initWithError:", a8);
      v375[2] = v351;
      v346 = -[PGSocialGroupFeatureExtractor initWithError:]([PGSocialGroupFeatureExtractor alloc], "initWithError:", a8);
      v375[3] = v346;
      v340 = -[PGInvariantPetFeatureExtractor initWithVersion:error:]([PGInvariantPetFeatureExtractor alloc], "initWithVersion:error:", 2, a8);
      v375[4] = v340;
      v332 = -[PGSceneFeatureExtractor initWithVersion:error:]([PGSceneFeatureExtractor alloc], "initWithVersion:error:", 4, a8);
      v375[5] = v332;
      v324 = -[PGMyHomeFeatureExtractor initWithError:]([PGMyHomeFeatureExtractor alloc], "initWithError:", a8);
      v375[6] = v324;
      v82 = -[PGMyWorkFeatureExtractor initWithError:]([PGMyWorkFeatureExtractor alloc], "initWithError:", a8);
      v375[7] = v82;
      v83 = -[PGROIFeatureExtractor initWithError:]([PGROIFeatureExtractor alloc], "initWithError:", a8);
      v375[8] = v83;
      v84 = -[PGInfrequentCountryFeatureExtractor initWithVersion:graph:error:]([PGInfrequentCountryFeatureExtractor alloc], "initWithVersion:graph:error:", 1, v15, a8);
      v375[9] = v84;
      v85 = -[PGInfrequentCityFeatureExtractor initWithVersion:graph:error:]([PGInfrequentCityFeatureExtractor alloc], "initWithVersion:graph:error:", 1, v15, a8);
      v375[10] = v85;
      v86 = v16;
      v87 = v14;
      v88 = -[PGCelebratedHolidayFeatureExtractor initWithVersion:error:]([PGCelebratedHolidayFeatureExtractor alloc], "initWithVersion:error:", 1, a8);
      v375[11] = v88;
      v369 = a1;
      v89 = v15;
      v90 = objc_alloc_init(PGFeatureExtractorMomentNodeSpecialPOI);
      v375[12] = v90;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v375, 13);
      v91 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = v89;
      v14 = v87;
      v16 = v86;

      objc_msgSend(v369, "_featureExtractors:withTransformers:", v91, v86);
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      v93 = objc_alloc(MEMORY[0x1E0D42A10]);
      v94 = CFSTR("MultiModal-MomentNode-Music-V1.0");
      goto LABEL_17;
    case 5:
      if (!v15)
        goto LABEL_18;
      v359 = -[PGMeaningFeatureExtractor initWithVersion:error:]([PGMeaningFeatureExtractor alloc], "initWithVersion:error:", 2, a8);
      v374[0] = v359;
      v353 = -[PGMyHomeFeatureExtractor initWithError:]([PGMyHomeFeatureExtractor alloc], "initWithError:", a8);
      v374[1] = v353;
      v124 = -[PGMyWorkFeatureExtractor initWithError:]([PGMyWorkFeatureExtractor alloc], "initWithError:", a8);
      v374[2] = v124;
      v365 = v14;
      v125 = -[PGSocialGroupFeatureExtractor initWithError:]([PGSocialGroupFeatureExtractor alloc], "initWithError:", a8);
      v374[3] = v125;
      v126 = v16;
      v127 = -[PGROIFeatureExtractor initWithError:]([PGROIFeatureExtractor alloc], "initWithError:", a8);
      v374[4] = v127;
      v128 = a1;
      v129 = -[PGInfrequentCountryFeatureExtractor initWithVersion:graph:error:]([PGInfrequentCountryFeatureExtractor alloc], "initWithVersion:graph:error:", 1, v15, a8);
      v374[5] = v129;
      v130 = -[PGInfrequentCityFeatureExtractor initWithVersion:graph:error:]([PGInfrequentCityFeatureExtractor alloc], "initWithVersion:graph:error:", 1, v15, a8);
      v374[6] = v130;
      v131 = objc_alloc_init(PGFeatureExtractorMomentNodeSpecialPOI);
      v374[7] = v131;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v374, 8);
      v91 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = v126;
      v14 = v365;

      objc_msgSend(v128, "_featureExtractors:withTransformers:", v91, v126);
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      v93 = objc_alloc(MEMORY[0x1E0D42A10]);
      v94 = CFSTR("MultiModal-MomentNode-Music-V2.0");
      goto LABEL_17;
    case 6:
      if (v15)
      {
        v360 = -[PGMeaningMemoryNodeFeatureExtractor initWithVersion:error:]([PGMeaningMemoryNodeFeatureExtractor alloc], "initWithVersion:error:", 2, a8);
        v373[0] = v360;
        v354 = -[PGInvariantFamilyMemoryNodeFeatureExtractor initWithError:]([PGInvariantFamilyMemoryNodeFeatureExtractor alloc], "initWithError:", a8);
        v373[1] = v354;
        v348 = -[PGInvariantCoworkerMemoryNodeFeatureExtractor initWithError:]([PGInvariantCoworkerMemoryNodeFeatureExtractor alloc], "initWithError:", a8);
        v373[2] = v348;
        v342 = -[PGInvariantPartnerMemoryNodeFeatureExtractor initWithError:]([PGInvariantPartnerMemoryNodeFeatureExtractor alloc], "initWithError:", a8);
        v373[3] = v342;
        v335 = -[PGInvariantPartnerBiologicalSexMaleMemoryNodeFeatureExtractor initWithError:]([PGInvariantPartnerBiologicalSexMaleMemoryNodeFeatureExtractor alloc], "initWithError:", a8);
        v373[4] = v335;
        v327 = -[PGInvariantPartnerBiologicalSexFemaleMemoryNodeFeatureExtractor initWithError:]([PGInvariantPartnerBiologicalSexFemaleMemoryNodeFeatureExtractor alloc], "initWithError:", a8);
        v373[5] = v327;
        v319 = -[PGInvariantPetMemoryNodeFeatureExtractor initWithVersion:error:]([PGInvariantPetMemoryNodeFeatureExtractor alloc], "initWithVersion:error:", 2, a8);
        v373[6] = v319;
        v312 = -[PGBabyMemoryNodeFeatureExtractor initWithError:]([PGBabyMemoryNodeFeatureExtractor alloc], "initWithError:", a8);
        v373[7] = v312;
        v305 = -[PGInvariantMotherMemoryNodeFeatureExtractor initWithError:]([PGInvariantMotherMemoryNodeFeatureExtractor alloc], "initWithError:", a8);
        v373[8] = v305;
        v298 = -[PGInvariantFatherMemoryNodeFeatureExtractor initWithError:]([PGInvariantFatherMemoryNodeFeatureExtractor alloc], "initWithError:", a8);
        v373[9] = v298;
        v291 = -[PGInvariantDaughterMemoryNodeFeatureExtractor initWithError:]([PGInvariantDaughterMemoryNodeFeatureExtractor alloc], "initWithError:", a8);
        v373[10] = v291;
        v284 = -[PGInvariantSonMemoryNodeFeatureExtractor initWithError:]([PGInvariantSonMemoryNodeFeatureExtractor alloc], "initWithError:", a8);
        v373[11] = v284;
        v278 = -[PGInvariantSisterMemoryNodeFeatureExtractor initWithError:]([PGInvariantSisterMemoryNodeFeatureExtractor alloc], "initWithError:", a8);
        v373[12] = v278;
        v272 = -[PGInvariantBrotherMemoryNodeFeatureExtractor initWithError:]([PGInvariantBrotherMemoryNodeFeatureExtractor alloc], "initWithError:", a8);
        v373[13] = v272;
        v267 = -[PGInvariantMyFriendMemoryNodeFeatureExtractor initWithError:]([PGInvariantMyFriendMemoryNodeFeatureExtractor alloc], "initWithError:", a8);
        v373[14] = v267;
        v262 = -[PGChildMemoryNodeFeatureExtractor initWithError:]([PGChildMemoryNodeFeatureExtractor alloc], "initWithError:", a8);
        v373[15] = v262;
        v257 = -[PGSocialGroupMemoryNodeFeatureExtractor initWithError:]([PGSocialGroupMemoryNodeFeatureExtractor alloc], "initWithError:", a8);
        v373[16] = v257;
        v252 = -[PGOverTheYearsMemoryNodeFeatureExtractor initWithVersion:error:]([PGOverTheYearsMemoryNodeFeatureExtractor alloc], "initWithVersion:error:", 1, a8);
        v373[17] = v252;
        v132 = -[PGCelebratedHolidayMemoryNodeFeatureExtractor initWithVersion:error:]([PGCelebratedHolidayMemoryNodeFeatureExtractor alloc], "initWithVersion:error:", 1, a8);
        v373[18] = v132;
        v366 = v14;
        v133 = -[PGSceneMemoryNodeFeatureExtractor initWithVersion:error:]([PGSceneMemoryNodeFeatureExtractor alloc], "initWithVersion:error:", 4, a8);
        v373[19] = v133;
        v134 = -[PGROIMemoryNodeFeatureExtractor initWithError:]([PGROIMemoryNodeFeatureExtractor alloc], "initWithError:", a8);
        v373[20] = v134;
        v135 = -[PGCityMemoryNodeFeatureExtractor initWithVersion:error:]([PGCityMemoryNodeFeatureExtractor alloc], "initWithVersion:error:", 1, a8);
        v373[21] = v135;
        v136 = v16;
        v137 = -[PGCountryMemoryNodeFeatureExtractor initWithVersion:graph:error:]([PGCountryMemoryNodeFeatureExtractor alloc], "initWithVersion:graph:error:", 1, v15, a8);
        v373[22] = v137;
        v138 = -[PGAOIMemoryNodeFeatureExtractor initWithError:]([PGAOIMemoryNodeFeatureExtractor alloc], "initWithError:", a8);
        v373[23] = v138;
        v371 = a1;
        v139 = v15;
        v140 = -[PGAudioMemoryNodeFeatureExtractor initWithVersion:error:]([PGAudioMemoryNodeFeatureExtractor alloc], "initWithVersion:error:", 1, a8);
        v373[24] = v140;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v373, 25);
        v91 = (void *)objc_claimAutoreleasedReturnValue();

        v15 = v139;
        v16 = v136;

        v14 = v366;
        objc_msgSend(v371, "_featureExtractors:withTransformers:", v91, v136);
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        v93 = objc_alloc(MEMORY[0x1E0D42A10]);
        v94 = CFSTR("MultiModal-MemoryNode-Music-V1.0");
LABEL_17:
        a3 = objc_msgSend(v93, "initWithName:featureExtractors:", v94, v92);

      }
      else
      {
LABEL_18:
        objc_msgSend(a1, "_generateError:errorCode:errorMessage:underlyingError:", a8, 0, CFSTR("Requested fingerprint version requires a valid PGGraph object."), 0);
        a3 = 0;
      }
LABEL_19:

      return (id)a3;
    default:
      goto LABEL_19;
  }
}

+ (id)_personaVectorFeatureExtractorForPersonaVectorType:(int64_t)a3 fetchOptionPropertySet:(id)a4 graph:(id)a5 transformers:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  PGFeatureExtractorPCAPrint *v16;
  PGMyWorkFeatureExtractor *v17;
  PGMobilityFeatureExtractor *v18;
  PGPartOfDayFeatureExtractor *v19;
  PGSeasonFeatureExtractor *v20;
  PGWeekendFeatureExtractor *v21;
  PGWeekdayFeatureExtractor *v22;
  PGPOIFeatureExtractor *v23;
  id v24;
  PGROIFeatureExtractor *v25;
  void *v26;
  PGFeatureExtractorAssetSourceType *v27;
  PGFeatureExtractorAssetResolution *v28;
  PGFeatureExtractorAssetFormat *v29;
  PGFeatureExtractorAssetImportSource *v30;
  PGFeatureExtractorStandardAspectRatio *v31;
  PGFeatureExtractorLocale *v32;
  PGFeatureExtractorTaboo *v33;
  PGFeatureExtractorPotentialLandmark *v34;
  PGFeatureExtractorGraphRelations *v35;
  void *v36;
  PGFeatureExtractorGraphRelations *v37;
  void *v38;
  void *v39;
  PGFeatureExtractorPhotoLibraryAverage *v40;
  void *v41;
  PGMyWorkFeatureExtractor *v42;
  PGMobilityFeatureExtractor *v43;
  PGPartOfDayFeatureExtractor *v44;
  PGSeasonFeatureExtractor *v45;
  PGWeekendFeatureExtractor *v46;
  PGWeekdayFeatureExtractor *v47;
  PGPOIFeatureExtractor *v48;
  id v49;
  PGROIFeatureExtractor *v50;
  void *v51;
  PGFeatureExtractorAssetSourceType *v52;
  PGFeatureExtractorAssetResolution *v53;
  PGFeatureExtractorAssetFormat *v54;
  PGFeatureExtractorAssetImportSource *v55;
  PGFeatureExtractorStandardAspectRatio *v56;
  PGFeatureExtractorLocale *v57;
  PGFeatureExtractorTaboo *v58;
  PGFeatureExtractorPotentialLandmark *v59;
  PGFeatureExtractorGraphRelations *v60;
  void *v61;
  PGFeatureExtractorGraphRelations *v62;
  void *v63;
  void *v64;
  PGFeatureExtractorPhotoLibraryAverage *v65;
  PGFeatureExtractorAssetBurstSelectionType *v67;
  PGFeatureExtractorAssetBurstSelectionType *v68;
  PGFeatureExtractorAssetMediaSubtype *v69;
  PGFeatureExtractorAssetMediaSubtype *v70;
  PGFeatureExtractorAssetMediaType *v71;
  PGFeatureExtractorAssetMediaType *v72;
  PGFeatureExtractorAssetPlaybackStyle *v73;
  PGFeatureExtractorAssetPlaybackStyle *v74;
  PGFeatureExtractorLowLightScore *v75;
  PGFeatureExtractorLowLightScore *v76;
  PGFeatureExtractorPleasantCameraTiltScore *v77;
  PGFeatureExtractorPleasantCameraTiltScore *v78;
  void *v79;
  void *v80;
  PGFeatureExtractorIntrusiveObjectPresenceScore *v81;
  PGFeatureExtractorIntrusiveObjectPresenceScore *v82;
  PGFeatureExtractorInterestingSubjectScore *v83;
  PGFeatureExtractorInterestingSubjectScore *v84;
  PGFeatureExtractorPleasantCompositionScore *v85;
  PGFeatureExtractorPleasantCompositionScore *v86;
  PGFeatureExtractorNoiseScore *v87;
  PGFeatureExtractorNoiseScore *v88;
  PGFeatureExtractorPleasantPostProcessingScore *v89;
  PGFeatureExtractorPleasantPostProcessingScore *v90;
  PGFeatureExtractorPleasantPerspectiveScore *v91;
  PGFeatureExtractorPleasantPerspectiveScore *v92;
  PGFeatureExtractorImmersivenessScore *v93;
  PGFeatureExtractorImmersivenessScore *v94;
  uint64_t v95;
  uint64_t v96;
  PGFeatureExtractorPleasantPatternScore *v97;
  PGFeatureExtractorPleasantPatternScore *v98;
  PGFeatureExtractorPleasantSymmetryScore *v99;
  PGFeatureExtractorPleasantSymmetryScore *v100;
  PGFeatureExtractorLivelyColorScore *v101;
  PGFeatureExtractorLivelyColorScore *v102;
  PGFeatureExtractorPleasantReflectionsScore *v103;
  PGFeatureExtractorPleasantReflectionsScore *v104;
  PGFeatureExtractorHarmoniousColorScore *v105;
  PGFeatureExtractorHarmoniousColorScore *v106;
  PGFeatureExtractorSharplyFocusedSubjectScore *v107;
  PGFeatureExtractorSharplyFocusedSubjectScore *v108;
  PGFeatureExtractorWellTimedShotScore *v109;
  PGFeatureExtractorWellTimedShotScore *v110;
  PGFeatureExtractorWellChosenSubjectScore *v111;
  PGFeatureExtractorWellChosenSubjectScore *v112;
  PGFeatureExtractorWellFramedSubjectScore *v113;
  PGFeatureExtractorWellFramedSubjectScore *v114;
  PGFeatureExtractorPleasantLightingScore *v115;
  PGFeatureExtractorPleasantLightingScore *v116;
  PGFeatureExtractorAestheticScore *v117;
  PGFeatureExtractorAestheticScore *v118;
  PGFeatureExtractorFailureScore *v119;
  PGFeatureExtractorFailureScore *v120;
  PGFeatureExtractorTastefullyBlurredScore *v121;
  PGFeatureExtractorTastefullyBlurredScore *v122;
  PGFeatureExtractorAutoplaySuggestionScore *v123;
  PGFeatureExtractorAutoplaySuggestionScore *v124;
  PGFeatureExtractorViewCount *v125;
  PGFeatureExtractorViewCount *v126;
  PGFeatureExtractorShareCount *v127;
  PGFeatureExtractorShareCount *v128;
  PGFeatureExtractorPlayCount *v129;
  PGFeatureExtractorPlayCount *v130;
  PGFeatureExtractorIsScreenRecording *v131;
  PGFeatureExtractorIsScreenRecording *v132;
  PGMyHomeFeatureExtractor *v133;
  PGFeatureExtractorImageAspectRatio *v134;
  PGFeatureExtractorImageAspectRatio *v135;
  PGFrequentLocationFeatureExtractor *v136;
  PGFeatureExtractorDurationInSecond *v137;
  PGMyHomeFeatureExtractor *v138;
  PGFeatureExtractorDurationInSecond *v139;
  PGSceneFeatureExtractor *v140;
  PGFeatureExtractorHasAdjustmentsScore *v141;
  PGSceneFeatureExtractor *v142;
  PGFeatureExtractorHasAdjustmentsScore *v143;
  PGBabyFeatureExtractor *v144;
  PGFeatureExtractorIsFavoriteScore *v145;
  PGBabyFeatureExtractor *v146;
  PGFeatureExtractorIsFavoriteScore *v147;
  PGInvariantPetFeatureExtractor *v148;
  PGFeatureExtractorAudioClassification *v149;
  PGInvariantPetFeatureExtractor *v150;
  PGFeatureExtractorAudioClassification *v151;
  PGBusinessCategoryFeatureExtractor *v152;
  PGFeatureExtractorBlurrinessScore *v153;
  PGBusinessCategoryFeatureExtractor *v154;
  PGFeatureExtractorBlurrinessScore *v155;
  PGPublicEventCategoryFeatureExtractor *v156;
  PGFeatureExtractorVideoScore *v157;
  PGPublicEventCategoryFeatureExtractor *v158;
  PGFeatureExtractorVideoScore *v159;
  PGInvariantPartnerFeatureExtractor *v160;
  PGFeatureExtractorActivityScore *v161;
  PGInvariantPartnerFeatureExtractor *v162;
  PGFeatureExtractorActivityScore *v163;
  PGInvariantCoworkerFeatureExtractor *v164;
  PGFeatureExtractorFaceCountScore *v165;
  PGInvariantCoworkerFeatureExtractor *v166;
  PGFeatureExtractorFaceCountScore *v167;
  PGInvariantFamilyFeatureExtractor *v168;
  PGFeatureExtractorExposureScore *v169;
  PGInvariantFamilyFeatureExtractor *v170;
  PGFeatureExtractorExposureScore *v171;
  PGPeopleFeatureExtractor *v172;
  PGFeatureExtractorFrequentPeople *v173;
  PGMeaningFeatureExtractor *v174;
  PGFeatureExtractorCartesianLocation *v175;
  PGMeaningFeatureExtractor *v176;
  PGFeatureExtractorCartesianLocation *v177;
  id v178;
  id v179;
  id v180;
  id v181;
  id v182;
  id v183;
  id v184;
  id v185;
  _QWORD v186[52];
  _QWORD v187[20];
  _QWORD v188[51];
  _QWORD v189[20];

  v189[18] = *MEMORY[0x1E0C80C00];
  v12 = a4;
  v13 = a5;
  v14 = a6;
  switch(a3)
  {
    case 0:
      v15 = objc_alloc(MEMORY[0x1E0D42A10]);
      a3 = objc_msgSend(v15, "initWithName:featureExtractors:", &stru_1E8436F28, MEMORY[0x1E0C9AA60]);
      break;
    case 1:
      v16 = objc_alloc_init(PGFeatureExtractorPCAPrint);
      objc_msgSend(a1, "_featureExtractor:withTransformers:", v16, v14);
      a3 = objc_claimAutoreleasedReturnValue();

      break;
    case 2:
      if (!v13)
        goto LABEL_9;
      v174 = -[PGMeaningFeatureExtractor initWithVersion:error:]([PGMeaningFeatureExtractor alloc], "initWithVersion:error:", 1, a7);
      v189[0] = v174;
      v170 = -[PGInvariantFamilyFeatureExtractor initWithError:]([PGInvariantFamilyFeatureExtractor alloc], "initWithError:", a7);
      v189[1] = v170;
      v166 = -[PGInvariantCoworkerFeatureExtractor initWithError:]([PGInvariantCoworkerFeatureExtractor alloc], "initWithError:", a7);
      v189[2] = v166;
      v162 = -[PGInvariantPartnerFeatureExtractor initWithError:]([PGInvariantPartnerFeatureExtractor alloc], "initWithError:", a7);
      v189[3] = v162;
      v158 = -[PGPublicEventCategoryFeatureExtractor initWithVersion:error:]([PGPublicEventCategoryFeatureExtractor alloc], "initWithVersion:error:", 1, a7);
      v189[4] = v158;
      v154 = -[PGBusinessCategoryFeatureExtractor initWithVersion:error:]([PGBusinessCategoryFeatureExtractor alloc], "initWithVersion:error:", 1, a7);
      v189[5] = v154;
      v150 = -[PGInvariantPetFeatureExtractor initWithVersion:error:]([PGInvariantPetFeatureExtractor alloc], "initWithVersion:error:", 1, a7);
      v189[6] = v150;
      v146 = -[PGBabyFeatureExtractor initWithError:]([PGBabyFeatureExtractor alloc], "initWithError:", a7);
      v189[7] = v146;
      v142 = -[PGSceneFeatureExtractor initWithVersion:error:]([PGSceneFeatureExtractor alloc], "initWithVersion:error:", 1, a7);
      v189[8] = v142;
      v138 = -[PGMyHomeFeatureExtractor initWithError:]([PGMyHomeFeatureExtractor alloc], "initWithError:", a7);
      v189[9] = v138;
      v180 = v12;
      v17 = -[PGMyWorkFeatureExtractor initWithError:]([PGMyWorkFeatureExtractor alloc], "initWithError:", a7);
      v189[10] = v17;
      v182 = v14;
      v18 = -[PGMobilityFeatureExtractor initWithError:]([PGMobilityFeatureExtractor alloc], "initWithError:", a7);
      v189[11] = v18;
      v19 = -[PGPartOfDayFeatureExtractor initWithError:]([PGPartOfDayFeatureExtractor alloc], "initWithError:", a7);
      v189[12] = v19;
      v20 = -[PGSeasonFeatureExtractor initWithError:]([PGSeasonFeatureExtractor alloc], "initWithError:", a7);
      v189[13] = v20;
      v21 = -[PGWeekendFeatureExtractor initWithError:]([PGWeekendFeatureExtractor alloc], "initWithError:", a7);
      v189[14] = v21;
      v22 = -[PGWeekdayFeatureExtractor initWithError:]([PGWeekdayFeatureExtractor alloc], "initWithError:", a7);
      v189[15] = v22;
      v184 = v13;
      v23 = -[PGPOIFeatureExtractor initWithVersion:error:]([PGPOIFeatureExtractor alloc], "initWithVersion:error:", 1, a7);
      v189[16] = v23;
      v24 = a1;
      v178 = a1;
      v25 = -[PGROIFeatureExtractor initWithError:]([PGROIFeatureExtractor alloc], "initWithError:", a7);
      v189[17] = v25;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v189, 18);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v24, "_featureExtractors:withTransformers:parentFeatureExtractorName:", v26, v182, CFSTR("PersonaVector"));
      v96 = objc_claimAutoreleasedReturnValue();

      v175 = objc_alloc_init(PGFeatureExtractorCartesianLocation);
      v188[0] = v175;
      v171 = objc_alloc_init(PGFeatureExtractorExposureScore);
      v188[1] = v171;
      v167 = objc_alloc_init(PGFeatureExtractorFaceCountScore);
      v188[2] = v167;
      v163 = objc_alloc_init(PGFeatureExtractorActivityScore);
      v188[3] = v163;
      v159 = objc_alloc_init(PGFeatureExtractorVideoScore);
      v188[4] = v159;
      v155 = objc_alloc_init(PGFeatureExtractorBlurrinessScore);
      v188[5] = v155;
      v151 = objc_alloc_init(PGFeatureExtractorAudioClassification);
      v188[6] = v151;
      v147 = objc_alloc_init(PGFeatureExtractorIsFavoriteScore);
      v188[7] = v147;
      v143 = objc_alloc_init(PGFeatureExtractorHasAdjustmentsScore);
      v188[8] = v143;
      v139 = objc_alloc_init(PGFeatureExtractorDurationInSecond);
      v188[9] = v139;
      v135 = objc_alloc_init(PGFeatureExtractorImageAspectRatio);
      v188[10] = v135;
      v132 = objc_alloc_init(PGFeatureExtractorIsScreenRecording);
      v188[11] = v132;
      v130 = objc_alloc_init(PGFeatureExtractorPlayCount);
      v188[12] = v130;
      v128 = objc_alloc_init(PGFeatureExtractorShareCount);
      v188[13] = v128;
      v126 = objc_alloc_init(PGFeatureExtractorViewCount);
      v188[14] = v126;
      v124 = objc_alloc_init(PGFeatureExtractorAutoplaySuggestionScore);
      v188[15] = v124;
      v122 = objc_alloc_init(PGFeatureExtractorTastefullyBlurredScore);
      v188[16] = v122;
      v120 = objc_alloc_init(PGFeatureExtractorFailureScore);
      v188[17] = v120;
      v118 = objc_alloc_init(PGFeatureExtractorAestheticScore);
      v188[18] = v118;
      v116 = objc_alloc_init(PGFeatureExtractorPleasantLightingScore);
      v188[19] = v116;
      v114 = objc_alloc_init(PGFeatureExtractorWellFramedSubjectScore);
      v188[20] = v114;
      v112 = objc_alloc_init(PGFeatureExtractorWellChosenSubjectScore);
      v188[21] = v112;
      v110 = objc_alloc_init(PGFeatureExtractorWellTimedShotScore);
      v188[22] = v110;
      v108 = objc_alloc_init(PGFeatureExtractorSharplyFocusedSubjectScore);
      v188[23] = v108;
      v106 = objc_alloc_init(PGFeatureExtractorHarmoniousColorScore);
      v188[24] = v106;
      v104 = objc_alloc_init(PGFeatureExtractorPleasantReflectionsScore);
      v188[25] = v104;
      v102 = objc_alloc_init(PGFeatureExtractorLivelyColorScore);
      v188[26] = v102;
      v100 = objc_alloc_init(PGFeatureExtractorPleasantSymmetryScore);
      v188[27] = v100;
      v98 = objc_alloc_init(PGFeatureExtractorPleasantPatternScore);
      v188[28] = v98;
      v94 = objc_alloc_init(PGFeatureExtractorImmersivenessScore);
      v188[29] = v94;
      v92 = objc_alloc_init(PGFeatureExtractorPleasantPerspectiveScore);
      v188[30] = v92;
      v90 = objc_alloc_init(PGFeatureExtractorPleasantPostProcessingScore);
      v188[31] = v90;
      v88 = objc_alloc_init(PGFeatureExtractorNoiseScore);
      v188[32] = v88;
      v86 = objc_alloc_init(PGFeatureExtractorPleasantCompositionScore);
      v188[33] = v86;
      v84 = objc_alloc_init(PGFeatureExtractorInterestingSubjectScore);
      v188[34] = v84;
      v82 = objc_alloc_init(PGFeatureExtractorIntrusiveObjectPresenceScore);
      v188[35] = v82;
      v78 = objc_alloc_init(PGFeatureExtractorPleasantCameraTiltScore);
      v188[36] = v78;
      v76 = objc_alloc_init(PGFeatureExtractorLowLightScore);
      v188[37] = v76;
      v74 = objc_alloc_init(PGFeatureExtractorAssetPlaybackStyle);
      v188[38] = v74;
      v72 = objc_alloc_init(PGFeatureExtractorAssetMediaType);
      v188[39] = v72;
      v70 = objc_alloc_init(PGFeatureExtractorAssetMediaSubtype);
      v188[40] = v70;
      v68 = objc_alloc_init(PGFeatureExtractorAssetBurstSelectionType);
      v188[41] = v68;
      v27 = objc_alloc_init(PGFeatureExtractorAssetSourceType);
      v188[42] = v27;
      v28 = objc_alloc_init(PGFeatureExtractorAssetResolution);
      v188[43] = v28;
      v29 = objc_alloc_init(PGFeatureExtractorAssetFormat);
      v188[44] = v29;
      v30 = objc_alloc_init(PGFeatureExtractorAssetImportSource);
      v188[45] = v30;
      v31 = objc_alloc_init(PGFeatureExtractorStandardAspectRatio);
      v188[46] = v31;
      v32 = objc_alloc_init(PGFeatureExtractorLocale);
      v188[47] = v32;
      v33 = objc_alloc_init(PGFeatureExtractorTaboo);
      v188[48] = v33;
      v34 = objc_alloc_init(PGFeatureExtractorPotentialLandmark);
      v188[49] = v34;
      v35 = [PGFeatureExtractorGraphRelations alloc];
      v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A10]), "initWithName:featureExtractors:", CFSTR("GraphRelations"), v96);
      v37 = -[PGFeatureExtractorGraphRelations initWithGraph:featureExtractor:](v35, "initWithGraph:featureExtractor:", v184, v36);
      v188[50] = v37;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v188, 51);
      v80 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = v182;
      v12 = v180;

      objc_msgSend(v178, "_featureExtractors:withTransformers:parentFeatureExtractorName:", v80, v182, CFSTR("PersonaVector"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A10]), "initWithName:featureExtractors:", CFSTR("PersonaVectorMultiModal-V1.0"), v38);
      v40 = -[PGFeatureExtractorPhotoLibraryAverage initWithAssetFeatureExtractor:assetFetchOptionPropertySet:]([PGFeatureExtractorPhotoLibraryAverage alloc], "initWithAssetFeatureExtractor:assetFetchOptionPropertySet:", v39, v180);
      a3 = -[PGFeatureExtractorAssetPhotoLibrary initWithPhotoLibraryFeatureExtractor:]([PGFeatureExtractorAssetPhotoLibrary alloc], "initWithPhotoLibraryFeatureExtractor:", v40);

      v13 = v184;
      v41 = (void *)v96;
      goto LABEL_8;
    case 3:
      if (v13)
      {
        v176 = -[PGMeaningFeatureExtractor initWithVersion:error:]([PGMeaningFeatureExtractor alloc], "initWithVersion:error:", 1, a7);
        v187[0] = v176;
        v172 = -[PGPeopleFeatureExtractor initWithGraph:error:]([PGPeopleFeatureExtractor alloc], "initWithGraph:error:", v13, a7);
        v187[1] = v172;
        v168 = -[PGInvariantFamilyFeatureExtractor initWithError:]([PGInvariantFamilyFeatureExtractor alloc], "initWithError:", a7);
        v187[2] = v168;
        v164 = -[PGInvariantCoworkerFeatureExtractor initWithError:]([PGInvariantCoworkerFeatureExtractor alloc], "initWithError:", a7);
        v187[3] = v164;
        v160 = -[PGInvariantPartnerFeatureExtractor initWithError:]([PGInvariantPartnerFeatureExtractor alloc], "initWithError:", a7);
        v187[4] = v160;
        v156 = -[PGPublicEventCategoryFeatureExtractor initWithVersion:error:]([PGPublicEventCategoryFeatureExtractor alloc], "initWithVersion:error:", 1, a7);
        v187[5] = v156;
        v152 = -[PGBusinessCategoryFeatureExtractor initWithVersion:error:]([PGBusinessCategoryFeatureExtractor alloc], "initWithVersion:error:", 1, a7);
        v187[6] = v152;
        v148 = -[PGInvariantPetFeatureExtractor initWithVersion:error:]([PGInvariantPetFeatureExtractor alloc], "initWithVersion:error:", 1, a7);
        v187[7] = v148;
        v144 = -[PGBabyFeatureExtractor initWithError:]([PGBabyFeatureExtractor alloc], "initWithError:", a7);
        v187[8] = v144;
        v140 = -[PGSceneFeatureExtractor initWithVersion:error:]([PGSceneFeatureExtractor alloc], "initWithVersion:error:", 1, a7);
        v187[9] = v140;
        v136 = -[PGFrequentLocationFeatureExtractor initWithGraph:error:]([PGFrequentLocationFeatureExtractor alloc], "initWithGraph:error:", v13, a7);
        v187[10] = v136;
        v133 = -[PGMyHomeFeatureExtractor initWithError:]([PGMyHomeFeatureExtractor alloc], "initWithError:", a7);
        v187[11] = v133;
        v42 = -[PGMyWorkFeatureExtractor initWithError:]([PGMyWorkFeatureExtractor alloc], "initWithError:", a7);
        v187[12] = v42;
        v43 = -[PGMobilityFeatureExtractor initWithError:]([PGMobilityFeatureExtractor alloc], "initWithError:", a7);
        v187[13] = v43;
        v44 = -[PGPartOfDayFeatureExtractor initWithError:]([PGPartOfDayFeatureExtractor alloc], "initWithError:", a7);
        v187[14] = v44;
        v45 = -[PGSeasonFeatureExtractor initWithError:]([PGSeasonFeatureExtractor alloc], "initWithError:", a7);
        v187[15] = v45;
        v181 = v12;
        v46 = -[PGWeekendFeatureExtractor initWithError:]([PGWeekendFeatureExtractor alloc], "initWithError:", a7);
        v187[16] = v46;
        v183 = v14;
        v47 = -[PGWeekdayFeatureExtractor initWithError:]([PGWeekdayFeatureExtractor alloc], "initWithError:", a7);
        v187[17] = v47;
        v185 = v13;
        v48 = -[PGPOIFeatureExtractor initWithVersion:error:]([PGPOIFeatureExtractor alloc], "initWithVersion:error:", 1, a7);
        v187[18] = v48;
        v49 = a1;
        v179 = a1;
        v50 = -[PGROIFeatureExtractor initWithError:]([PGROIFeatureExtractor alloc], "initWithError:", a7);
        v187[19] = v50;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v187, 20);
        v51 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v49, "_featureExtractors:withTransformers:parentFeatureExtractorName:", v51, v183, CFSTR("PersonaVector"));
        v95 = objc_claimAutoreleasedReturnValue();

        v177 = objc_alloc_init(PGFeatureExtractorCartesianLocation);
        v186[0] = v177;
        v173 = -[PGFeatureExtractorFrequentPeople initWithNumberOfFrequentPeopleToExtract:]([PGFeatureExtractorFrequentPeople alloc], "initWithNumberOfFrequentPeopleToExtract:", 25);
        v186[1] = v173;
        v169 = objc_alloc_init(PGFeatureExtractorExposureScore);
        v186[2] = v169;
        v165 = objc_alloc_init(PGFeatureExtractorFaceCountScore);
        v186[3] = v165;
        v161 = objc_alloc_init(PGFeatureExtractorActivityScore);
        v186[4] = v161;
        v157 = objc_alloc_init(PGFeatureExtractorVideoScore);
        v186[5] = v157;
        v153 = objc_alloc_init(PGFeatureExtractorBlurrinessScore);
        v186[6] = v153;
        v149 = objc_alloc_init(PGFeatureExtractorAudioClassification);
        v186[7] = v149;
        v145 = objc_alloc_init(PGFeatureExtractorIsFavoriteScore);
        v186[8] = v145;
        v141 = objc_alloc_init(PGFeatureExtractorHasAdjustmentsScore);
        v186[9] = v141;
        v137 = objc_alloc_init(PGFeatureExtractorDurationInSecond);
        v186[10] = v137;
        v134 = objc_alloc_init(PGFeatureExtractorImageAspectRatio);
        v186[11] = v134;
        v131 = objc_alloc_init(PGFeatureExtractorIsScreenRecording);
        v186[12] = v131;
        v129 = objc_alloc_init(PGFeatureExtractorPlayCount);
        v186[13] = v129;
        v127 = objc_alloc_init(PGFeatureExtractorShareCount);
        v186[14] = v127;
        v125 = objc_alloc_init(PGFeatureExtractorViewCount);
        v186[15] = v125;
        v123 = objc_alloc_init(PGFeatureExtractorAutoplaySuggestionScore);
        v186[16] = v123;
        v121 = objc_alloc_init(PGFeatureExtractorTastefullyBlurredScore);
        v186[17] = v121;
        v119 = objc_alloc_init(PGFeatureExtractorFailureScore);
        v186[18] = v119;
        v117 = objc_alloc_init(PGFeatureExtractorAestheticScore);
        v186[19] = v117;
        v115 = objc_alloc_init(PGFeatureExtractorPleasantLightingScore);
        v186[20] = v115;
        v113 = objc_alloc_init(PGFeatureExtractorWellFramedSubjectScore);
        v186[21] = v113;
        v111 = objc_alloc_init(PGFeatureExtractorWellChosenSubjectScore);
        v186[22] = v111;
        v109 = objc_alloc_init(PGFeatureExtractorWellTimedShotScore);
        v186[23] = v109;
        v107 = objc_alloc_init(PGFeatureExtractorSharplyFocusedSubjectScore);
        v186[24] = v107;
        v105 = objc_alloc_init(PGFeatureExtractorHarmoniousColorScore);
        v186[25] = v105;
        v103 = objc_alloc_init(PGFeatureExtractorPleasantReflectionsScore);
        v186[26] = v103;
        v101 = objc_alloc_init(PGFeatureExtractorLivelyColorScore);
        v186[27] = v101;
        v99 = objc_alloc_init(PGFeatureExtractorPleasantSymmetryScore);
        v186[28] = v99;
        v97 = objc_alloc_init(PGFeatureExtractorPleasantPatternScore);
        v186[29] = v97;
        v93 = objc_alloc_init(PGFeatureExtractorImmersivenessScore);
        v186[30] = v93;
        v91 = objc_alloc_init(PGFeatureExtractorPleasantPerspectiveScore);
        v186[31] = v91;
        v89 = objc_alloc_init(PGFeatureExtractorPleasantPostProcessingScore);
        v186[32] = v89;
        v87 = objc_alloc_init(PGFeatureExtractorNoiseScore);
        v186[33] = v87;
        v85 = objc_alloc_init(PGFeatureExtractorPleasantCompositionScore);
        v186[34] = v85;
        v83 = objc_alloc_init(PGFeatureExtractorInterestingSubjectScore);
        v186[35] = v83;
        v81 = objc_alloc_init(PGFeatureExtractorIntrusiveObjectPresenceScore);
        v186[36] = v81;
        v77 = objc_alloc_init(PGFeatureExtractorPleasantCameraTiltScore);
        v186[37] = v77;
        v75 = objc_alloc_init(PGFeatureExtractorLowLightScore);
        v186[38] = v75;
        v73 = objc_alloc_init(PGFeatureExtractorAssetPlaybackStyle);
        v186[39] = v73;
        v71 = objc_alloc_init(PGFeatureExtractorAssetMediaType);
        v186[40] = v71;
        v69 = objc_alloc_init(PGFeatureExtractorAssetMediaSubtype);
        v186[41] = v69;
        v67 = objc_alloc_init(PGFeatureExtractorAssetBurstSelectionType);
        v186[42] = v67;
        v52 = objc_alloc_init(PGFeatureExtractorAssetSourceType);
        v186[43] = v52;
        v53 = objc_alloc_init(PGFeatureExtractorAssetResolution);
        v186[44] = v53;
        v54 = objc_alloc_init(PGFeatureExtractorAssetFormat);
        v186[45] = v54;
        v55 = objc_alloc_init(PGFeatureExtractorAssetImportSource);
        v186[46] = v55;
        v56 = objc_alloc_init(PGFeatureExtractorStandardAspectRatio);
        v186[47] = v56;
        v57 = objc_alloc_init(PGFeatureExtractorLocale);
        v186[48] = v57;
        v58 = objc_alloc_init(PGFeatureExtractorTaboo);
        v186[49] = v58;
        v59 = objc_alloc_init(PGFeatureExtractorPotentialLandmark);
        v186[50] = v59;
        v60 = [PGFeatureExtractorGraphRelations alloc];
        v61 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A10]), "initWithName:featureExtractors:", CFSTR("GraphRelations"), v95);
        v62 = -[PGFeatureExtractorGraphRelations initWithGraph:featureExtractor:](v60, "initWithGraph:featureExtractor:", v185, v61);
        v186[51] = v62;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v186, 52);
        v79 = (void *)objc_claimAutoreleasedReturnValue();

        v14 = v183;
        v12 = v181;

        objc_msgSend(v179, "_featureExtractors:withTransformers:parentFeatureExtractorName:", v79, v183, CFSTR("PersonaVector"));
        v63 = (void *)objc_claimAutoreleasedReturnValue();

        v64 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A10]), "initWithName:featureExtractors:", CFSTR("PersonaVectorLibrarySpecificMultiModal-V1.0"), v63);
        v65 = -[PGFeatureExtractorPhotoLibraryAverage initWithAssetFeatureExtractor:assetFetchOptionPropertySet:]([PGFeatureExtractorPhotoLibraryAverage alloc], "initWithAssetFeatureExtractor:assetFetchOptionPropertySet:", v64, v181);
        a3 = -[PGFeatureExtractorAssetPhotoLibrary initWithPhotoLibraryFeatureExtractor:]([PGFeatureExtractorAssetPhotoLibrary alloc], "initWithPhotoLibraryFeatureExtractor:", v65);

        v13 = v185;
        v41 = (void *)v95;
LABEL_8:

      }
      else
      {
LABEL_9:
        objc_msgSend(a1, "_generateError:errorCode:errorMessage:underlyingError:", a7, 0, CFSTR("Requested fingerprint version requires a valid PGGraph object."), 0);
        a3 = 0;
      }
      break;
    default:
      break;
  }

  return (id)a3;
}

+ (id)_featureExtractors:(id)a3 withTransformers:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;

  v6 = a3;
  v7 = v6;
  if (a4)
  {
    objc_msgSend(a1, "_featureExtractors:withTransformers:parentFeatureExtractorName:", v6, a4, 0);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = v6;
  }
  v9 = v8;

  return v9;
}

+ (id)_featureExtractors:(id)a3 withTransformers:(id)a4 parentFeatureExtractorName:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v8, "count"));
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v12 = v8;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v20;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v20 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(a1, "_featureExtractor:withTransformers:parentFeatureExtractorName:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v16), v9, v10, (_QWORD)v19);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObject:", v17);

        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v14);
  }

  return v11;
}

+ (id)_featureExtractor:(id)a3 withTransformers:(id)a4
{
  return (id)objc_msgSend(a1, "_featureExtractor:withTransformers:parentFeatureExtractorName:", a3, a4, 0);
}

+ (id)_featureExtractor:(id)a3 withTransformers:(id)a4 parentFeatureExtractorName:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  char isKindOfClass;
  PGSequentialFeatureExtractor *v15;
  void *v16;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v7, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), v9, v10);
    v11 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v11;
  }
  if (v8
    && (objc_msgSend(v8, "featureTransformersForFeatureExtractorName:", v10),
        (v12 = objc_claimAutoreleasedReturnValue()) != 0)
    && (v13 = (void *)v12,
        objc_opt_class(),
        isKindOfClass = objc_opt_isKindOfClass(),
        v13,
        (isKindOfClass & 1) == 0))
  {
    objc_msgSend(v8, "featureTransformersForFeatureExtractorName:", v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[PGSequentialFeatureExtractor initWithFeatureExtractor:featureTransformers:]([PGSequentialFeatureExtractor alloc], "initWithFeatureExtractor:featureTransformers:", v7, v16);

  }
  else
  {
    v15 = (PGSequentialFeatureExtractor *)v7;
  }

  return v15;
}

+ (BOOL)_generateError:(id *)a3 errorCode:(int64_t)a4 errorMessage:(id)a5 underlyingError:(id)a6
{
  id v9;
  objc_class *v10;
  id v11;
  id v12;

  v9 = a6;
  if (a3)
  {
    v10 = (objc_class *)MEMORY[0x1E0C99E08];
    v11 = a5;
    v12 = objc_alloc_init(v10);
    objc_msgSend(v12, "setObject:forKey:", v11, *MEMORY[0x1E0CB2D50]);

    if (v9)
      objc_msgSend(v12, "setObject:forKey:", v9, *MEMORY[0x1E0CB3388]);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosGraph.PGFingerprintVersion"), a4, v12);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

  }
  return 0;
}

+ (id)_sceneprintFeatureExtractorInstance
{
  return objc_alloc_init(PGFeatureExtractorSceneprint);
}

@end
