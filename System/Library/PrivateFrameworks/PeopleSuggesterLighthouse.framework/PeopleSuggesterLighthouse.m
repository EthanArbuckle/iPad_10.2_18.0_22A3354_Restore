BOOL PeoplePredictionDataTrialIdentifierReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
        break;
      if ((_DWORD)v17 == 2)
      {
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 24;
        goto LABEL_24;
      }
      if ((_DWORD)v17 == 1)
      {
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 16;
LABEL_24:
        v20 = *(void **)(a1 + v19);
        *(_QWORD *)(a1 + v19) = v18;

        goto LABEL_26;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_26:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    PBReaderReadString();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = 8;
    goto LABEL_24;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t PeoplePredictionDataFeatureReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  char v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  uint64_t result;
  PeoplePredictionDataFeatureValue *v24;
  char v25;
  unsigned int v26;
  uint64_t v27;
  unint64_t v28;
  char v29;
  char v30;
  unsigned int v31;
  uint64_t v32;
  unint64_t v33;
  char v34;
  char v35;
  unsigned int v36;
  uint64_t v37;
  unint64_t v38;
  char v39;
  char v40;
  unsigned int v41;
  uint64_t v42;
  unint64_t v43;
  char v44;
  uint64_t v45;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = (int *)MEMORY[0x24BE7AF30];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
        break;
      v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
      *(_QWORD *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      v14 = v9++ >= 9;
      if (v14)
      {
        v10 = 0;
        v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      v10 = 0;
LABEL_14:
    if (v15 || (v10 & 7) == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v10 >> 3))
    {
      case 1u:
        v17 = 0;
        v18 = 0;
        v19 = 0;
        *(_BYTE *)(a1 + 36) |= 8u;
        while (1)
        {
          v20 = *v3;
          v21 = *(_QWORD *)(a2 + v20);
          if (v21 == -1 || v21 >= *(_QWORD *)(a2 + *v4))
            break;
          v22 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v21);
          *(_QWORD *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0)
            goto LABEL_60;
          v17 += 7;
          v14 = v18++ >= 9;
          if (v14)
          {
            LODWORD(v19) = 0;
            goto LABEL_62;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_60:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v19) = 0;
LABEL_62:
        v45 = 20;
        goto LABEL_79;
      case 2u:
        v24 = objc_alloc_init(PeoplePredictionDataFeatureValue);
        objc_storeStrong((id *)(a1 + 24), v24);
        if (PBReaderPlaceMark() && (PeoplePredictionDataFeatureValueReadFrom((uint64_t)v24, a2) & 1) != 0)
        {
          PBReaderRecallMark();

LABEL_80:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }

        return 0;
      case 3u:
        v25 = 0;
        v26 = 0;
        v19 = 0;
        *(_BYTE *)(a1 + 36) |= 4u;
        while (2)
        {
          v27 = *v3;
          v28 = *(_QWORD *)(a2 + v27);
          if (v28 == -1 || v28 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v29 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v28);
            *(_QWORD *)(a2 + v27) = v28 + 1;
            v19 |= (unint64_t)(v29 & 0x7F) << v25;
            if (v29 < 0)
            {
              v25 += 7;
              v14 = v26++ >= 9;
              if (v14)
              {
                LODWORD(v19) = 0;
                goto LABEL_66;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v19) = 0;
LABEL_66:
        v45 = 16;
        goto LABEL_79;
      case 4u:
        v30 = 0;
        v31 = 0;
        v19 = 0;
        *(_BYTE *)(a1 + 36) |= 2u;
        while (2)
        {
          v32 = *v3;
          v33 = *(_QWORD *)(a2 + v32);
          if (v33 == -1 || v33 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v34 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v33);
            *(_QWORD *)(a2 + v32) = v33 + 1;
            v19 |= (unint64_t)(v34 & 0x7F) << v30;
            if (v34 < 0)
            {
              v30 += 7;
              v14 = v31++ >= 9;
              if (v14)
              {
                LODWORD(v19) = 0;
                goto LABEL_70;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v19) = 0;
LABEL_70:
        v45 = 12;
        goto LABEL_79;
      case 5u:
        v35 = 0;
        v36 = 0;
        v19 = 0;
        *(_BYTE *)(a1 + 36) |= 1u;
        while (2)
        {
          v37 = *v3;
          v38 = *(_QWORD *)(a2 + v37);
          if (v38 == -1 || v38 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v39 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v38);
            *(_QWORD *)(a2 + v37) = v38 + 1;
            v19 |= (unint64_t)(v39 & 0x7F) << v35;
            if (v39 < 0)
            {
              v35 += 7;
              v14 = v36++ >= 9;
              if (v14)
              {
                LODWORD(v19) = 0;
                goto LABEL_74;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v19) = 0;
LABEL_74:
        v45 = 8;
        goto LABEL_79;
      case 6u:
        v40 = 0;
        v41 = 0;
        v19 = 0;
        *(_BYTE *)(a1 + 36) |= 0x10u;
        while (2)
        {
          v42 = *v3;
          v43 = *(_QWORD *)(a2 + v42);
          if (v43 == -1 || v43 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v44 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v43);
            *(_QWORD *)(a2 + v42) = v43 + 1;
            v19 |= (unint64_t)(v44 & 0x7F) << v40;
            if (v44 < 0)
            {
              v40 += 7;
              v14 = v41++ >= 9;
              if (v14)
              {
                LODWORD(v19) = 0;
                goto LABEL_78;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v19) = 0;
LABEL_78:
        v45 = 32;
LABEL_79:
        *(_DWORD *)(a1 + v45) = v19;
        goto LABEL_80;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_80;
    }
  }
}

uint64_t PeoplePredictionDataMLSEShareEventReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  uint64_t v17;
  void *v18;
  uint64_t result;
  PeoplePredictionDataMLSEVirtualFeatureStore *v20;
  char v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = (int *)MEMORY[0x24BE7AF30];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
        break;
      v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
      *(_QWORD *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      v14 = v9++ >= 9;
      if (v14)
      {
        v10 = 0;
        v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      v10 = 0;
LABEL_14:
    if (v15 || (v10 & 7) == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v10 >> 3))
    {
      case 1u:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = *(void **)(a1 + 32);
        *(_QWORD *)(a1 + 32) = v17;

        goto LABEL_42;
      case 2u:
        v20 = objc_alloc_init(PeoplePredictionDataMLSEVirtualFeatureStore);
        objc_msgSend((id)a1, "addFeaturizedCandidate:", v20);
        if (!PBReaderPlaceMark()
          || (PeoplePredictionDataMLSEVirtualFeatureStoreReadFrom((uint64_t)v20, a2) & 1) == 0)
        {
          goto LABEL_44;
        }
        goto LABEL_37;
      case 3u:
        v20 = objc_alloc_init(PeoplePredictionDataTrialIdentifier);
        objc_storeStrong((id *)(a1 + 40), v20);
        if (!PBReaderPlaceMark() || !PeoplePredictionDataTrialIdentifierReadFrom((uint64_t)v20, a2))
          goto LABEL_44;
        goto LABEL_37;
      case 4u:
        v21 = 0;
        v22 = 0;
        v23 = 0;
        *(_BYTE *)(a1 + 48) |= 1u;
        while (2)
        {
          v24 = *v3;
          v25 = *(_QWORD *)(a2 + v24);
          if (v25 == -1 || v25 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v26 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v25);
            *(_QWORD *)(a2 + v24) = v25 + 1;
            v23 |= (unint64_t)(v26 & 0x7F) << v21;
            if (v26 < 0)
            {
              v21 += 7;
              v14 = v22++ >= 9;
              if (v14)
              {
                LODWORD(v23) = 0;
                goto LABEL_41;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v23) = 0;
LABEL_41:
        *(_DWORD *)(a1 + 8) = v23;
        goto LABEL_42;
      case 5u:
        v20 = objc_alloc_init(PeoplePredictionDataFeaturizationConfig);
        objc_storeStrong((id *)(a1 + 16), v20);
        if (PBReaderPlaceMark()
          && (PeoplePredictionDataFeaturizationConfigReadFrom((uint64_t)v20, a2) & 1) != 0)
        {
LABEL_37:
          PBReaderRecallMark();

LABEL_42:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }
LABEL_44:

        return 0;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_42;
    }
  }
}

uint64_t PeoplePredictionDataFeatureValueReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  int v16;
  char v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  uint64_t result;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  char v31;
  unsigned int v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  char v37;
  char v38;
  unsigned int v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  char v43;
  uint64_t v44;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        v13 = v12 + 1;
        if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
          break;
        v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v15 = v9++ >= 9;
        if (v15)
        {
          v10 = 0;
          v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v16 || (v10 & 7) == 4)
        break;
      switch((v10 >> 3))
      {
        case 1u:
          v18 = 0;
          v19 = 0;
          v20 = 0;
          *(_BYTE *)(a1 + 40) |= 2u;
          while (1)
          {
            v21 = *v3;
            v22 = *(_QWORD *)(a2 + v21);
            v23 = v22 + 1;
            if (v22 == -1 || v23 > *(_QWORD *)(a2 + *v4))
              break;
            v24 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v22);
            *(_QWORD *)(a2 + v21) = v23;
            v20 |= (unint64_t)(v24 & 0x7F) << v18;
            if ((v24 & 0x80) == 0)
              goto LABEL_47;
            v18 += 7;
            v15 = v19++ >= 9;
            if (v15)
            {
              LODWORD(v20) = 0;
              goto LABEL_49;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_47:
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v20) = 0;
LABEL_49:
          v44 = 16;
          goto LABEL_58;
        case 2u:
          *(_BYTE *)(a1 + 40) |= 1u;
          v26 = *v3;
          v27 = *(_QWORD *)(a2 + v26);
          if (v27 <= 0xFFFFFFFFFFFFFFF7 && v27 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v28 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v27);
            *(_QWORD *)(a2 + v26) = v27 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v28 = 0;
          }
          *(_QWORD *)(a1 + 8) = v28;
          continue;
        case 3u:
          PBReaderReadString();
          v29 = objc_claimAutoreleasedReturnValue();
          v30 = *(void **)(a1 + 24);
          *(_QWORD *)(a1 + 24) = v29;

          continue;
        case 4u:
          v31 = 0;
          v32 = 0;
          v33 = 0;
          *(_BYTE *)(a1 + 40) |= 8u;
          while (2)
          {
            v34 = *v3;
            v35 = *(_QWORD *)(a2 + v34);
            v36 = v35 + 1;
            if (v35 == -1 || v36 > *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v37 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v35);
              *(_QWORD *)(a2 + v34) = v36;
              v33 |= (unint64_t)(v37 & 0x7F) << v31;
              if (v37 < 0)
              {
                v31 += 7;
                v15 = v32++ >= 9;
                if (v15)
                {
                  v33 = 0;
                  goto LABEL_53;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v33 = 0;
LABEL_53:
          *(_BYTE *)(a1 + 36) = v33 != 0;
          continue;
        case 5u:
          v38 = 0;
          v39 = 0;
          v20 = 0;
          *(_BYTE *)(a1 + 40) |= 4u;
          break;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v40 = *v3;
        v41 = *(_QWORD *)(a2 + v40);
        v42 = v41 + 1;
        if (v41 == -1 || v42 > *(_QWORD *)(a2 + *v4))
          break;
        v43 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v41);
        *(_QWORD *)(a2 + v40) = v42;
        v20 |= (unint64_t)(v43 & 0x7F) << v38;
        if ((v43 & 0x80) == 0)
          goto LABEL_55;
        v38 += 7;
        v15 = v39++ >= 9;
        if (v15)
        {
          LODWORD(v20) = 0;
          goto LABEL_57;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_55:
      if (*(_BYTE *)(a2 + *v5))
        LODWORD(v20) = 0;
LABEL_57:
      v44 = 32;
LABEL_58:
      *(_DWORD *)(a1 + v44) = v20;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t PeoplePredictionDataMLSEVirtualFeatureStoreReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  unint64_t v17;
  char v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  uint64_t v24;
  void *v25;
  PeoplePredictionDataFeature *v26;
  uint64_t result;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      v17 = v10 >> 3;
      if ((v10 >> 3) == 4)
      {
        PBReaderReadString();
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = *(void **)(a1 + 8);
        *(_QWORD *)(a1 + 8) = v24;

      }
      else if ((_DWORD)v17 == 3)
      {
        v26 = objc_alloc_init(PeoplePredictionDataFeature);
        objc_msgSend((id)a1, "addFeatureVector:", v26);
        if (!PBReaderPlaceMark() || (PeoplePredictionDataFeatureReadFrom((uint64_t)v26, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();

      }
      else if ((_DWORD)v17 == 2)
      {
        v18 = 0;
        v19 = 0;
        v20 = 0;
        *(_BYTE *)(a1 + 28) |= 1u;
        while (1)
        {
          v21 = *v3;
          v22 = *(_QWORD *)(a2 + v21);
          if (v22 == -1 || v22 >= *(_QWORD *)(a2 + *v4))
            break;
          v23 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v22);
          *(_QWORD *)(a2 + v21) = v22 + 1;
          v20 |= (unint64_t)(v23 & 0x7F) << v18;
          if ((v23 & 0x80) == 0)
            goto LABEL_35;
          v18 += 7;
          v14 = v19++ >= 9;
          if (v14)
          {
            LODWORD(v20) = 0;
            goto LABEL_37;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_35:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v20) = 0;
LABEL_37:
        *(_DWORD *)(a1 + 24) = v20;
      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t PeoplePredictionDataFeaturizationConfigReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  uint64_t v17;
  void *v18;
  uint64_t result;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 1)
      {
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = *(void **)(a1 + 8);
        *(_QWORD *)(a1 + 8) = v17;

      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void type metadata accessor for BMMLSEDurableFeatureStorefeatureName(uint64_t a1)
{
  sub_24393E1AC(a1, &qword_2572D9D20);
}

#error "24392D4A4: too big function (funcsize=0)"

uint64_t sub_24393DC50()
{
  return 1;
}

uint64_t sub_24393DC5C(void *a1)
{
  id v1;
  void *v2;

  v1 = objc_msgSend(a1, sel_recipients);
  if (v1)
  {
    v2 = v1;
    sub_24393E124(0, &qword_2572D9D68);
    sub_24396FC14();

  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2572D9D48);
  sub_24393E05C();
  sub_24396FD88();
  swift_bridgeObjectRelease();
  return sub_24396FF80();
}

uint64_t sub_24393DD24()
{
  return sub_24394B3D4();
}

BOOL sub_24393DD44(void *a1)
{
  return objc_msgSend(a1, sel_mechanism) == (id)2
      || objc_msgSend(a1, sel_mechanism) == (id)3
      || objc_msgSend(a1, sel_mechanism) == (id)4;
}

BOOL sub_24393DDA4(void *a1)
{
  return objc_msgSend(a1, sel_mechanism) == (id)13;
}

uint64_t sub_24393DDC8(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = objc_msgSend(a1, sel_targetBundleId);
  if (!v1)
    return 0;
  v2 = v1;
  v3 = sub_24396FB60();

  return v3;
}

void sub_24393DE28()
{
  qword_2572DA2A8 = (uint64_t)&unk_25140FF68;
}

_QWORD *sub_24393DE3C@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

BOOL sub_24393DE4C(_DWORD *a1, _DWORD *a2)
{
  return *a1 == *a2;
}

void sub_24393DE60(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

_DWORD *sub_24393DE6C@<X0>(_DWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_DWORD *)a2 = *result;
  *(_BYTE *)(a2 + 4) = 0;
  return result;
}

void sub_24393DE7C(_DWORD *a1@<X8>)
{
  _DWORD *v1;

  *a1 = *v1;
}

unint64_t sub_24393DE88()
{
  unint64_t result;

  result = qword_2572D9D28;
  if (!qword_2572D9D28)
  {
    result = MEMORY[0x2494FDCE4](&unk_243971C80, &type metadata for ShareSheetLighthousePluginError);
    atomic_store(result, (unint64_t *)&qword_2572D9D28);
  }
  return result;
}

uint64_t sub_24393DECC()
{
  uint64_t v0;

  sub_24393DF0C(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(void **)(v0 + 32), *(_QWORD *)(v0 + 40), *(void **)(v0 + 48), *(_QWORD *)(v0 + 56), *(_QWORD *)(v0 + 64), *(_QWORD *)(v0 + 72), *(_QWORD *)(v0 + 80));
  return swift_deallocObject();
}

void sub_24393DF0C(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8, unint64_t a9)
{
  switch(a9 >> 61)
  {
    case 0uLL:
      sub_24393DFCC((uint64_t)a3);

      break;
    case 1uLL:

      break;
    case 2uLL:
    case 4uLL:
      swift_release();
      swift_release();
      break;
    case 3uLL:
      sub_24393DFCC((uint64_t)a3);
      swift_bridgeObjectRelease();
      break;
    default:
      return;
  }
}

uint64_t sub_24393DFCC(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2494FDCCC]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_24393E01C(unint64_t *a1, unint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v7;

  result = *a1;
  if (!result)
  {
    v7 = sub_24393E124(255, a2);
    result = MEMORY[0x2494FDCE4](a4, v7);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_24393E05C()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_2572D9D50;
  if (!qword_2572D9D50)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2572D9D58);
    v2 = sub_24393E01C((unint64_t *)&qword_2572D9D60, &qword_2572D9D68, 0x24BE1AF98, MEMORY[0x24BEE5BD8]);
    result = MEMORY[0x2494FDCE4](MEMORY[0x24BEE12A8], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_2572D9D50);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2494FDCD8](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_24393E124(uint64_t a1, unint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

void type metadata accessor for BMMLSEVirtualFeatureStoreFeaturefeatureName(uint64_t a1)
{
  sub_24393E1AC(a1, &qword_2572D9D70);
}

void type metadata accessor for _CDInteractionDirection(uint64_t a1)
{
  sub_24393E1AC(a1, &qword_2572D9D78);
}

void type metadata accessor for _CDInteractionMechanism(uint64_t a1)
{
  sub_24393E1AC(a1, &qword_2572D9D80);
}

void type metadata accessor for BMMLSELabeledDataStoreLabelingEvidenceType(uint64_t a1)
{
  sub_24393E1AC(a1, &qword_2572D9D88);
}

void sub_24393E1AC(uint64_t a1, unint64_t *a2)
{
  unint64_t ForeignTypeMetadata;
  uint64_t v4;

  if (!*a2)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4)
      atomic_store(ForeignTypeMetadata, a2);
  }
}

uint64_t ShadowEvaluationManager.init(config:executionManager:trialIdentifier:)@<X0>(void *__src@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, _QWORD *a4@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t result;

  memcpy(a4, __src, 0x158uLL);
  v7 = *a3;
  v8 = a3[1];
  sub_243946A44(a2, (uint64_t)(a4 + 43));
  if (v8)
  {
    v9 = objc_allocWithZone((Class)sub_24396FA70());
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v10 = sub_24396FA64();
    sub_24393E2E8(v7, v8);
    result = __swift_destroy_boxed_opaque_existential_1Tm(a2);
  }
  else
  {
    result = __swift_destroy_boxed_opaque_existential_1Tm(a2);
    v10 = 0;
  }
  a4[48] = v10;
  return result;
}

uint64_t sub_24393E2E8(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

Swift::OpaquePointer_optional __swiftcall ShadowEvaluationManager.attemptShadowEvaluation()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  _BOOL4 v19;
  uint8_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  NSObject *v26;
  os_log_type_t v27;
  uint8_t *v28;
  Swift::Bool v29;
  _QWORD *v30;
  NSObject *v31;
  os_log_type_t v32;
  id v33;
  uint8_t *v34;
  uint8_t *v35;
  uint64_t v36;
  _QWORD *v37;
  void *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD *v44;
  uint64_t v45;
  unint64_t v46;
  char v47;
  void *v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  char v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  id v57;
  uint64_t v58;
  char v59;
  char v60;
  unint64_t v61;
  uint64_t v62;
  _BOOL8 v63;
  uint64_t v64;
  char v65;
  unint64_t v66;
  char v67;
  char isUniquelyReferenced_nonNull_native;
  char v69;
  unint64_t v70;
  uint64_t v71;
  _BOOL8 v72;
  uint64_t v73;
  char v74;
  unint64_t v75;
  char v76;
  _QWORD *v77;
  unint64_t v78;
  _QWORD *v79;
  uint64_t v80;
  BOOL v81;
  uint64_t v82;
  uint64_t *v83;
  uint64_t v84;
  uint64_t *v85;
  uint64_t *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  uint64_t v91;
  id v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  id v96;
  uint8_t *v97;
  char *v98;
  uint64_t v99;
  uint64_t *v100;
  uint64_t v101;
  unint64_t v102;
  id v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106[50];
  Swift::OpaquePointer_optional result;

  v1 = v0;
  if (qword_2572D9D10 != -1)
LABEL_55:
    swift_once();
  v2 = sub_24396FAE8();
  __swift_project_value_buffer(v2, (uint64_t)qword_2572DA2B0);
  v3 = sub_24396FAD0();
  v4 = sub_24396FD04();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_243921000, v3, v4, "Starting shadowEvaluation", v5, 2u);
    MEMORY[0x2494FDD74](v5, -1, -1);
  }

  if (!MEMORY[0x24BE71988])
  {
    v26 = sub_24396FAD0();
    v27 = sub_24396FD10();
    if (os_log_type_enabled(v26, v27))
    {
      v28 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v28 = 0;
      _os_log_impl(&dword_243921000, v26, v27, "Scoring model class not available, shadow evaluation won't run", v28, 2u);
      MEMORY[0x2494FDD74](v28, -1, -1);
    }

    v30 = (_QWORD *)sub_24393EF08(MEMORY[0x24BEE4AF8]);
    goto LABEL_52;
  }
  v6 = sub_24396F920();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v91 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24396F8E4();
  v10 = objc_allocWithZone(MEMORY[0x24BE5F780]);
  v11 = (void *)sub_24396FB48();
  v12 = (void *)sub_24396F8F0();
  v13 = objc_msgSend(v10, sel_init_modelStoreRootURL_, v11, v12);

  v14 = objc_msgSend(v13, sel_listModelNames);
  if (!v14)
  {
    v31 = sub_24396FAD0();
    v32 = sub_24396FD10();
    if (os_log_type_enabled(v31, v32))
    {
      v33 = v13;
      v34 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v34 = 0;
      _os_log_impl(&dword_243921000, v31, v32, "Failed to get model name list from LCFModelStore", v34, 2u);
      v35 = v34;
      v13 = v33;
      MEMORY[0x2494FDD74](v35, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    v30 = 0;
LABEL_52:
    v90 = v30;
    goto LABEL_59;
  }
  v15 = v14;
  v103 = v13;
  v98 = v9;
  v99 = v7;
  v16 = sub_24396FC14();

  swift_bridgeObjectRetain_n();
  v17 = sub_24396FAD0();
  v18 = sub_24396FD04();
  v19 = os_log_type_enabled(v17, v18);
  v100 = &v91;
  v101 = v6;
  if (v19)
  {
    v102 = v1;
    v20 = (uint8_t *)swift_slowAlloc();
    v21 = swift_slowAlloc();
    v106[0] = v21;
    *(_DWORD *)v20 = 136315138;
    v97 = v20 + 4;
    v22 = swift_bridgeObjectRetain();
    v23 = MEMORY[0x2494FD450](v22, MEMORY[0x24BEE0D00]);
    v25 = v24;
    swift_bridgeObjectRelease();
    v104 = sub_2439420BC(v23, v25, v106);
    sub_24396FD94();
    swift_bridgeObjectRelease_n();
    v1 = v102;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_243921000, v17, v18, "modelNames for shadow evaluation: %s", v20, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2494FDD74](v21, -1, -1);
    MEMORY[0x2494FDD74](v20, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  v36 = swift_allocObject();
  *(_QWORD *)(v36 + 16) = MEMORY[0x24BEE4B00];
  sub_243941F9C(v1, (uint64_t)v106);
  v37 = (_QWORD *)swift_allocObject();
  memcpy(v37 + 2, v106, 0x188uLL);
  v38 = v103;
  v37[51] = v103;
  v37[52] = v16;
  v37[53] = v36;
  v39 = v38;
  swift_retain();
  sub_243940BB8(1, (uint64_t)sub_2439420AC, (uint64_t)v37);
  swift_release();
  swift_beginAccess();
  v40 = swift_bridgeObjectRetain();
  sub_243940E30(v40);
  swift_bridgeObjectRelease();
  v41 = sub_24396FAC4();
  v96 = v39;
  v97 = (uint8_t *)v36;
  swift_bridgeObjectRelease();
  v42 = *(_QWORD *)(v41 + 16);
  v95 = v41;
  if (!v42)
  {
    v30 = (_QWORD *)MEMORY[0x24BEE4B00];
    v43 = v101;
LABEL_51:
    swift_bridgeObjectRelease();

    (*(void (**)(char *, uint64_t))(v99 + 8))(v98, v43);
    swift_release();
    goto LABEL_52;
  }
  v1 = v41 + 32;
  v30 = (_QWORD *)MEMORY[0x24BEE4B00];
  v102 = (unint64_t)"oplesuggester.shadowEvaluation";
  v103 = (id)0x8000000243979F30;
  v43 = v101;
  while (1)
  {
    v45 = *(_QWORD *)v1;
    if (!*(_QWORD *)(*(_QWORD *)v1 + 16))
      goto LABEL_32;
    swift_bridgeObjectRetain();
    v46 = sub_243942698(0x6974736567677573, 0xEF6C65646F4D6E6FLL);
    if ((v47 & 1) != 0)
    {
      v48 = *(void **)(*(_QWORD *)(v45 + 56) + 8 * v46);
      objc_opt_self();
      if (swift_dynamicCastObjCClass())
      {
        v104 = 0;
        v105 = 0;
        v49 = v48;
        sub_24396FB54();

        v50 = v105;
        if (v105)
          break;
      }
    }
LABEL_31:
    swift_bridgeObjectRelease();
LABEL_32:
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v104 = (uint64_t)v30;
    v70 = sub_243942698(0xD000000000000010, (uint64_t)v103);
    v71 = v30[2];
    v72 = (v69 & 1) == 0;
    v73 = v71 + v72;
    if (__OFADD__(v71, v72))
    {
      __break(1u);
LABEL_54:
      __break(1u);
      goto LABEL_55;
    }
    v74 = v69;
    if (v30[3] >= v73)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) != 0)
      {
        v30 = (_QWORD *)v104;
        if ((v69 & 1) != 0)
          goto LABEL_17;
      }
      else
      {
        sub_243944C8C();
        v30 = (_QWORD *)v104;
        if ((v74 & 1) != 0)
          goto LABEL_17;
      }
    }
    else
    {
      sub_243942ABC(v73, isUniquelyReferenced_nonNull_native);
      v75 = sub_243942698(0xD000000000000010, v102 | 0x8000000000000000);
      if ((v74 & 1) != (v76 & 1))
        goto LABEL_58;
      v70 = v75;
      v30 = (_QWORD *)v104;
      if ((v74 & 1) != 0)
      {
LABEL_17:
        v44 = (_QWORD *)(v30[7] + 16 * v70);
        swift_bridgeObjectRelease();
        *v44 = 0x676E6968746F4ELL;
        v44[1] = 0xE700000000000000;
        goto LABEL_18;
      }
    }
    v30[(v70 >> 6) + 8] |= 1 << v70;
    v77 = (_QWORD *)(v30[6] + 16 * v70);
    v78 = v102 | 0x8000000000000000;
    *v77 = 0xD000000000000010;
    v77[1] = v78;
    v79 = (_QWORD *)(v30[7] + 16 * v70);
    *v79 = 0x676E6968746F4ELL;
    v79[1] = 0xE700000000000000;
    v80 = v30[2];
    v81 = __OFADD__(v80, 1);
    v82 = v80 + 1;
    if (v81)
      goto LABEL_54;
    v30[2] = v82;
LABEL_18:
    swift_bridgeObjectRelease();
    v1 += 8;
    if (!--v42)
      goto LABEL_51;
  }
  if (!*(_QWORD *)(v45 + 16)
    || (v51 = v104, v52 = sub_243942698(0x61746F745F72726DLL, 0xE90000000000006CLL), (v53 & 1) == 0))
  {
    swift_bridgeObjectRelease();
    goto LABEL_31;
  }
  v54 = *(id *)(*(_QWORD *)(v45 + 56) + 8 * v52);
  swift_bridgeObjectRelease();
  v104 = v51;
  v105 = v50;
  sub_24396FB90();
  v55 = v104;
  v56 = v105;
  v92 = v54;
  v57 = objc_msgSend(v54, sel_description);
  v93 = sub_24396FB60();
  v94 = v58;

  v59 = swift_isUniquelyReferenced_nonNull_native();
  v104 = (uint64_t)v30;
  v61 = sub_243942698(v55, v56);
  v62 = v30[2];
  v63 = (v60 & 1) == 0;
  v64 = v62 + v63;
  if (!__OFADD__(v62, v63))
  {
    v65 = v60;
    if (v30[3] >= v64)
    {
      if ((v59 & 1) != 0)
      {
        v30 = (_QWORD *)v104;
        if ((v60 & 1) == 0)
          goto LABEL_47;
      }
      else
      {
        sub_243944C8C();
        v30 = (_QWORD *)v104;
        if ((v65 & 1) == 0)
          goto LABEL_47;
      }
    }
    else
    {
      sub_243942ABC(v64, v59);
      v66 = sub_243942698(v55, v56);
      if ((v65 & 1) != (v67 & 1))
        goto LABEL_58;
      v61 = v66;
      v30 = (_QWORD *)v104;
      if ((v65 & 1) == 0)
      {
LABEL_47:
        v30[(v61 >> 6) + 8] |= 1 << v61;
        v85 = (uint64_t *)(v30[6] + 16 * v61);
        *v85 = v55;
        v85[1] = v56;
        v86 = (uint64_t *)(v30[7] + 16 * v61);
        v87 = v94;
        *v86 = v93;
        v86[1] = v87;
        v88 = v30[2];
        v81 = __OFADD__(v88, 1);
        v89 = v88 + 1;
        if (v81)
          goto LABEL_57;
        v30[2] = v89;
        swift_bridgeObjectRetain();
        goto LABEL_49;
      }
    }
    v83 = (uint64_t *)(v30[7] + 16 * v61);
    swift_bridgeObjectRelease();
    v84 = v94;
    *v83 = v93;
    v83[1] = v84;
LABEL_49:
    v43 = v101;

    swift_bridgeObjectRelease();
    goto LABEL_18;
  }
  __break(1u);
LABEL_57:
  __break(1u);
LABEL_58:
  v90 = (void *)sub_24396FFBC();
  __break(1u);
LABEL_59:
  result.value._rawValue = v90;
  result.is_nil = v29;
  return result;
}

unint64_t sub_24393EF08(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  _QWORD *v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2572D9DF8);
  v2 = (_QWORD *)sub_24396FF50();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (uint64_t *)(a1 + 56);
  while (1)
  {
    v5 = *(v4 - 3);
    v6 = *(v4 - 2);
    v8 = *(v4 - 1);
    v7 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    result = sub_243942698(v5, v6);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v11 = (uint64_t *)(v2[6] + 16 * result);
    *v11 = v5;
    v11[1] = v6;
    v12 = (_QWORD *)(v2[7] + 16 * result);
    *v12 = v8;
    v12[1] = v7;
    v13 = v2[2];
    v14 = __OFADD__(v13, 1);
    v15 = v13 + 1;
    if (v14)
      goto LABEL_11;
    v4 += 4;
    v2[2] = v15;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_24393F028(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  id *v4;
  char v5;
  id v6;
  unint64_t result;
  char v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2572D9E58);
  v2 = (_QWORD *)sub_24396FF50();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (id *)(a1 + 40);
  while (1)
  {
    v5 = *(_BYTE *)v4;
    v6 = *(v4 - 1);
    result = sub_2439426FC((uint64_t)v6);
    if ((v8 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(_QWORD *)(v2[6] + 8 * result) = v6;
    *(_BYTE *)(v2[7] + result) = v5;
    v9 = v2[2];
    v10 = __OFADD__(v9, 1);
    v11 = v9 + 1;
    if (v10)
      goto LABEL_11;
    v2[2] = v11;
    v4 += 2;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_24393F124(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  id v6;
  unint64_t result;
  char v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2572D9E30);
  v2 = (_QWORD *)sub_24396FF50();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (uint64_t *)(a1 + 40);
  while (1)
  {
    v5 = *v4;
    v6 = (id)*(v4 - 1);
    swift_bridgeObjectRetain();
    result = sub_24394272C((uint64_t)v6);
    if ((v8 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v9 = 8 * result;
    *(_QWORD *)(v2[6] + v9) = v6;
    *(_QWORD *)(v2[7] + v9) = v5;
    v10 = v2[2];
    v11 = __OFADD__(v10, 1);
    v12 = v10 + 1;
    if (v11)
      goto LABEL_11;
    v2[2] = v12;
    v4 += 2;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_24393F22C(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2572D9DE8);
  v2 = sub_24396FF50();
  v3 = (_QWORD *)v2;
  v4 = *(_QWORD *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  v5 = v2 + 64;
  v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_243946AB0(v6, (uint64_t)&v15, &qword_2572D9DF0);
    v7 = v15;
    v8 = v16;
    result = sub_243942698(v15, v16);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v11 = (uint64_t *)(v3[6] + 16 * result);
    *v11 = v7;
    v11[1] = v8;
    result = (unint64_t)sub_243946AA0(&v17, (_OWORD *)(v3[7] + 32 * result));
    v12 = v3[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v3[2] = v14;
    v6 += 48;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_24393F360(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t result;
  char v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2572D9DD0);
  v2 = sub_24396FF50();
  v3 = (_QWORD *)v2;
  v4 = *(_QWORD *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  v5 = v2 + 64;
  v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_243946AB0(v6, (uint64_t)&v13, &qword_2572D9DD8);
    v7 = v13;
    result = sub_243942778(v13);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(_QWORD *)(v3[6] + 8 * result) = v7;
    result = (unint64_t)sub_243946AA0(&v14, (_OWORD *)(v3[7] + 32 * result));
    v10 = v3[2];
    v11 = __OFADD__(v10, 1);
    v12 = v10 + 1;
    if (v11)
      goto LABEL_11;
    v3[2] = v12;
    v6 += 40;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_24393F48C(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t result;
  char v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2572D9DA8);
  v2 = (_QWORD *)sub_24396FF50();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (uint64_t *)(a1 + 40);
  while (1)
  {
    v5 = *(v4 - 1);
    v6 = *v4;
    v7 = v4[1];
    v8 = v4[2];
    v10 = v4[3];
    v9 = v4[4];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    result = sub_243942698(v5, v6);
    if ((v12 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v13 = (uint64_t *)(v2[6] + 16 * result);
    *v13 = v5;
    v13[1] = v6;
    v14 = (uint64_t *)(v2[7] + 32 * result);
    *v14 = v7;
    v14[1] = v8;
    v14[2] = v10;
    v14[3] = v9;
    v15 = v2[2];
    v16 = __OFADD__(v15, 1);
    v17 = v15 + 1;
    if (v16)
      goto LABEL_11;
    v2[2] = v17;
    v4 += 6;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_24393F5C8(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t result;
  char v9;
  uint64_t *v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2572D9DB0);
  v2 = (_QWORD *)sub_24396FF50();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (uint64_t *)(a1 + 48);
  while (1)
  {
    v5 = *(v4 - 2);
    v6 = *(v4 - 1);
    v7 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    result = sub_243942698(v5, v6);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v10 = (uint64_t *)(v2[6] + 16 * result);
    *v10 = v5;
    v10[1] = v6;
    *(_QWORD *)(v2[7] + 8 * result) = v7;
    v11 = v2[2];
    v12 = __OFADD__(v11, 1);
    v13 = v11 + 1;
    if (v12)
      goto LABEL_11;
    v2[2] = v13;
    v4 += 3;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_24393F6E0(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t result;
  char v9;
  uint64_t *v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2572D9DB8);
  v2 = (_QWORD *)sub_24396FF50();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (uint64_t *)(a1 + 48);
  while (1)
  {
    v5 = *(v4 - 2);
    v6 = *(v4 - 1);
    v7 = *v4;
    swift_bridgeObjectRetain();
    result = sub_243942698(v5, v6);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v10 = (uint64_t *)(v2[6] + 16 * result);
    *v10 = v5;
    v10[1] = v6;
    *(_QWORD *)(v2[7] + 8 * result) = v7;
    v11 = v2[2];
    v12 = __OFADD__(v11, 1);
    v13 = v11 + 1;
    if (v12)
      goto LABEL_11;
    v4 += 3;
    v2[2] = v13;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_24393F7F0(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  void **v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2572D9D90);
  v2 = (_QWORD *)sub_24396FF50();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (void **)(a1 + 48);
  while (1)
  {
    v5 = (uint64_t)*(v4 - 2);
    v6 = (uint64_t)*(v4 - 1);
    v7 = *v4;
    swift_bridgeObjectRetain();
    v8 = v7;
    result = sub_243942698(v5, v6);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v11 = (uint64_t *)(v2[6] + 16 * result);
    *v11 = v5;
    v11[1] = v6;
    *(_QWORD *)(v2[7] + 8 * result) = v8;
    v12 = v2[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v2[2] = v14;
    v4 += 3;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_24393F908(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;

  if (qword_2572D9D10 != -1)
    swift_once();
  v9 = sub_24396FAE8();
  __swift_project_value_buffer(v9, (uint64_t)qword_2572DA2B0);
  swift_bridgeObjectRetain();
  v10 = sub_24396FAD0();
  v11 = sub_24396FD04();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v12 = 134217984;
    sub_24396FD94();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_243921000, v10, v11, "Processing batch with %ld events", v12, 0xCu);
    MEMORY[0x2494FDD74](v12, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease();
  }
  swift_beginAccess();
  sub_24393FA8C(a1, a3, a4, (id *)(a5 + 16));
  return swift_endAccess();
}

uint64_t sub_24393FA8C(uint64_t result, void *a2, uint64_t a3, id *a4)
{
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  uint64_t *v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  void (*v22)(char *, char *, uint64_t);
  char *v23;
  uint64_t v24;
  char *v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  _QWORD *v32;
  uint64_t v33;
  NSObject *v34;
  os_log_type_t v35;
  uint64_t v36;
  _QWORD *v37;
  void *v38;
  void *v39;
  id v40;
  _QWORD *v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  int64_t v46;
  unint64_t v47;
  unint64_t v48;
  unint64_t v50;
  int64_t v51;
  uint64_t v52;
  uint64_t *v53;
  unint64_t v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  int v58;
  uint64_t v59;
  id v60;
  uint64_t v61;
  NSObject *v62;
  os_log_type_t v63;
  uint64_t v64;
  _QWORD *v65;
  _QWORD *v66;
  uint64_t v67;
  uint64_t v68;
  NSObject *v69;
  os_log_type_t v70;
  uint64_t v71;
  _QWORD *v72;
  id v73;
  id v74;
  id v75;
  void *v76;
  uint64_t v77;
  _QWORD *v78;
  void *v79;
  id v80;
  unint64_t v81;
  _QWORD *v82;
  _QWORD *v83;
  uint64_t v84;
  _QWORD *v85;
  id v86;
  char v87;
  uint64_t v88;
  uint64_t v89;
  id v90;
  char v91;
  uint64_t v92;
  char v93;
  char v94;
  uint64_t v95;
  _QWORD *v96;
  uint64_t v97;
  unint64_t v98;
  char v99;
  uint64_t *v100;
  _QWORD *v101;
  id v102;
  uint64_t v103;
  id v104;
  id v105;
  char isUniquelyReferenced_nonNull_native;
  _QWORD *v107;
  id *v108;
  char v109;
  id v110;
  unint64_t v111;
  _QWORD *v112;
  char *v113;
  id v114;
  _QWORD *v115;
  void *v116;
  _QWORD *v117;
  uint64_t v118;
  NSObject *v119;
  os_log_type_t v120;
  uint64_t v121;
  _QWORD *v122;
  _QWORD *v123;
  _QWORD v124[2];
  void *v125;
  uint64_t v126;
  uint64_t v127;
  id *v128;
  uint64_t v129;
  uint64_t (*v130)();
  uint64_t v131;
  id v132;
  id v133;
  id v134;
  uint64_t v135;
  id v136;
  id v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  char *v142;
  _QWORD *v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  __int128 v147;
  uint64_t v148;
  int64_t v149;
  uint64_t v150;
  id v151[2];
  _QWORD *aBlock[7];

  v128 = a4;
  aBlock[6] = *(_QWORD **)MEMORY[0x24BDAC8D0];
  v140 = *(_QWORD *)(a3 + 16);
  if (v140)
  {
    v5 = result;
    v139 = a3 + 32;
    v144 = sub_24396F920();
    v141 = *(_QWORD *)(v144 - 8);
    v7 = *(_QWORD *)(v141 + 64);
    v148 = v5 + 64;
    v124[1] = a3;
    v8 = swift_bridgeObjectRetain();
    v130 = 0;
    v135 = 0;
    v9 = 0;
    v131 = 0;
    *(_QWORD *)&v10 = 136315138;
    v147 = v10;
    v127 = MEMORY[0x24BEE4AD8] + 8;
    v146 = v5;
    v138 = v7;
    v125 = a2;
    while (1)
    {
      v145 = v9;
      v11 = (uint64_t *)(v139 + 16 * v9);
      v13 = *v11;
      v12 = v11[1];
      MEMORY[0x24BDAC7A8](v8);
      v14 = (v7 + 15) & 0xFFFFFFFFFFFFFFF0;
      v142 = (char *)v124 - v14;
      swift_bridgeObjectRetain();
      v15 = (void *)sub_24396FB48();
      v16 = objc_msgSend(a2, sel_getModelURL_, v15);

      v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2572D9E40);
      v18 = MEMORY[0x24BDAC7A8](v17);
      v20 = (char *)v124 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
      if (v16)
      {
        v143 = v124;
        MEMORY[0x24BDAC7A8](v18);
        sub_24396F8FC();

        v21 = v141;
        v22 = *(void (**)(char *, char *, uint64_t))(v141 + 32);
        v23 = (char *)v124 - v14;
        v24 = v144;
        v22(v20, v23, v144);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v21 + 56))(v20, 0, 1, v24);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48))(v20, 1, v24) != 1)
        {
          v25 = v142;
          v22(v142, v20, v144);
          v26 = (void *)sub_24396FB48();
          v27 = objc_msgSend(a2, sel_getModelConfig_, v26);

          v134 = v27;
          if (v27)
          {
            v28 = v27;
            v29 = (void *)sub_24396F8F0();
            v30 = (void *)objc_opt_self();
            aBlock[0] = 0;
            v31 = objc_msgSend(v30, sel_modelWithContentsOfURL_configuration_error_, v29, v28, aBlock);

            v136 = v31;
            if (v31)
            {
              v32 = aBlock[0];

              goto LABEL_17;
            }
            v115 = aBlock[0];
            v116 = (void *)sub_24396F8CC();

            swift_willThrow();
            v131 = 0;
          }
          else
          {
            v38 = (void *)sub_24396F8F0();
            v39 = (void *)objc_opt_self();
            aBlock[0] = 0;
            v40 = objc_msgSend(v39, sel_modelWithContentsOfURL_error_, v38, aBlock);

            v136 = v40;
            if (v40)
            {
              v41 = aBlock[0];
LABEL_17:
              sub_24396FA88();
              v132 = (id)sub_24396FA7C();
              v42 = objc_allocWithZone(MEMORY[0x24BE71988]);
              v133 = objc_msgSend(v42, sel_initWithCoreMLModel_, v136);
              v43 = 1 << *(_BYTE *)(v5 + 32);
              if (v43 < 64)
                v44 = ~(-1 << v43);
              else
                v44 = -1;
              v45 = v44 & *(_QWORD *)(v5 + 64);
              v149 = (unint64_t)(v43 + 63) >> 6;
              swift_bridgeObjectRetain();
              v46 = 0;
              while (1)
              {
                while (1)
                {
LABEL_23:
                  if (v45)
                  {
                    v47 = __clz(__rbit64(v45));
                    v45 &= v45 - 1;
                    v48 = v47 | (v46 << 6);
                  }
                  else
                  {
                    if (__OFADD__(v46++, 1))
                    {
                      __break(1u);
                      goto LABEL_91;
                    }
                    if (v46 >= v149)
                      goto LABEL_79;
                    v50 = *(_QWORD *)(v148 + 8 * v46);
                    if (!v50)
                    {
                      v51 = v46 + 1;
                      if (v46 + 1 >= v149)
                        goto LABEL_79;
                      v50 = *(_QWORD *)(v148 + 8 * v51);
                      if (!v50)
                      {
                        v51 = v46 + 2;
                        if (v46 + 2 >= v149)
                          goto LABEL_79;
                        v50 = *(_QWORD *)(v148 + 8 * v51);
                        if (!v50)
                        {
                          v51 = v46 + 3;
                          if (v46 + 3 >= v149)
                          {
LABEL_79:
                            v113 = v142;
                            v114 = v134;

                            swift_release();
                            v8 = (*(uint64_t (**)(char *, uint64_t))(v141 + 8))(v113, v144);
                            goto LABEL_4;
                          }
                          v50 = *(_QWORD *)(v148 + 8 * v51);
                          if (!v50)
                          {
                            while (1)
                            {
                              v46 = v51 + 1;
                              if (__OFADD__(v51, 1))
                                break;
                              if (v46 >= v149)
                                goto LABEL_79;
                              v50 = *(_QWORD *)(v148 + 8 * v46);
                              ++v51;
                              if (v50)
                                goto LABEL_35;
                            }
LABEL_91:
                            __break(1u);
LABEL_92:
                            __break(1u);
LABEL_93:
                            __break(1u);
LABEL_94:
                            __break(1u);
                          }
                        }
                      }
                      v46 = v51;
                    }
LABEL_35:
                    v45 = (v50 - 1) & v50;
                    v48 = __clz(__rbit64(v50)) + (v46 << 6);
                  }
                  v52 = *(_QWORD *)(v5 + 56);
                  v53 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v48);
                  v54 = v53[1];
                  v150 = *v53;
                  v55 = v52 + 24 * v48;
                  v56 = *(void **)(v55 + 8);
                  v57 = *(_QWORD *)(v55 + 16);
                  if (v56)
                    break;
                  v67 = qword_2572D9D10;
                  swift_bridgeObjectRetain();
                  swift_bridgeObjectRetain();
                  if (v67 != -1)
                    swift_once();
                  v68 = sub_24396FAE8();
                  __swift_project_value_buffer(v68, (uint64_t)qword_2572DA2B0);
                  swift_bridgeObjectRetain();
                  v69 = sub_24396FAD0();
                  v70 = sub_24396FD04();
                  if (os_log_type_enabled(v69, v70))
                  {
                    v71 = swift_slowAlloc();
                    v72 = (_QWORD *)swift_slowAlloc();
                    aBlock[0] = v72;
                    *(_DWORD *)v71 = v147;
                    swift_bridgeObjectRetain();
                    *(_QWORD *)(v71 + 4) = sub_2439420BC(v150, v54, (uint64_t *)aBlock);
                    swift_bridgeObjectRelease_n();
                    _os_log_impl(&dword_243921000, v69, v70, "Share event %s missing positive label, skipping", (uint8_t *)v71, 0xCu);
                    swift_arrayDestroy();
                    MEMORY[0x2494FDD74](v72, -1, -1);
                    MEMORY[0x2494FDD74](v71, -1, -1);
                    swift_bridgeObjectRelease();

                  }
                  else
                  {

                    swift_bridgeObjectRelease_n();
                    swift_bridgeObjectRelease();
                  }
                }
                v58 = *(_DWORD *)(v52 + 24 * v48);
                if ((v58 - 1) <= 2)
                  break;
                v59 = qword_2572D9D10;
                v60 = v56;
                swift_bridgeObjectRetain();
                swift_bridgeObjectRetain();
                if (v59 != -1)
                  swift_once();
                v61 = sub_24396FAE8();
                __swift_project_value_buffer(v61, (uint64_t)qword_2572DA2B0);
                swift_bridgeObjectRetain();
                v62 = sub_24396FAD0();
                v63 = sub_24396FD04();
                if (os_log_type_enabled(v62, v63))
                {
                  v64 = swift_slowAlloc();
                  v65 = (_QWORD *)swift_slowAlloc();
                  aBlock[0] = v65;
                  *(_DWORD *)v64 = v147;
                  swift_bridgeObjectRetain();
                  *(_QWORD *)(v64 + 4) = sub_2439420BC(v150, v54, (uint64_t *)aBlock);
                  swift_bridgeObjectRelease_n();
                  _os_log_impl(&dword_243921000, v62, v63, "Share event %s missing labeling evidence to engagement conversion", (uint8_t *)v64, 0xCu);
                  swift_arrayDestroy();
                  v66 = v65;
                  v5 = v146;
                  MEMORY[0x2494FDD74](v66, -1, -1);
                  MEMORY[0x2494FDD74](v64, -1, -1);
                  swift_bridgeObjectRelease();

                }
                else
                {

                  swift_bridgeObjectRelease_n();
                  swift_bridgeObjectRelease();
                }

              }
              v129 = qword_2439715C0[v58 - 1];
              v73 = objc_allocWithZone(MEMORY[0x24BE719A8]);
              v74 = v56;
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain();
              v75 = objc_msgSend(v73, sel_init);
              v76 = (void *)sub_24396FB48();
              objc_msgSend(v75, sel_setSessionID_, v76);

              v77 = swift_allocObject();
              *(_DWORD *)(v77 + 16) = v58;
              *(_QWORD *)(v77 + 24) = v56;
              *(_QWORD *)(v77 + 32) = v57;
              v137 = v74;
              swift_bridgeObjectRetain();
              sub_24393DFCC((uint64_t)v130);
              v78 = (_QWORD *)swift_allocObject();
              v78[2] = sub_24394774C;
              v78[3] = v77;
              v126 = v77;
              aBlock[4] = sub_243947764;
              aBlock[5] = v78;
              aBlock[0] = (_QWORD *)MEMORY[0x24BDAC760];
              aBlock[1] = (_QWORD *)1107296256;
              aBlock[2] = sub_243941090;
              aBlock[3] = &block_descriptor_24;
              v79 = _Block_copy(aBlock);
              swift_retain();
              swift_release();
              v130 = (uint64_t (*)())v75;
              v80 = objc_msgSend(v133, sel_scoreCandidates_predictionContext_, v79, v75);
              _Block_release(v79);
              LOBYTE(v79) = swift_isEscapingClosureAtFileLocation();
              swift_release();
              if ((v79 & 1) != 0)
                goto LABEL_93;
              sub_24393E124(0, &qword_2572D9E38);
              sub_24393E124(0, (unint64_t *)&qword_2572D9D38);
              sub_243947784();
              sub_24396FB18();

              v81 = swift_bridgeObjectRetain();
              sub_243947870(v81, (unint64_t)sub_243941110, 0);
              v83 = v82;
              swift_bridgeObjectRelease();
              aBlock[0] = v83;
              v84 = v131;
              sub_243946B54(aBlock);
              v131 = v84;
              if (v84)
              {
                result = swift_release();
                __break(1u);
                return result;
              }
              swift_bridgeObjectRelease();
              v85 = aBlock[0];
              v135 = aBlock[0][2];
              if (v135)
              {
                sub_24393E124(0, &qword_2572D9E50);
                v86 = (id)v85[4];
                v87 = sub_24396FD7C();

                v88 = 0;
                if ((v87 & 1) == 0)
                {
                  if (v135 == 1)
                    goto LABEL_61;
                  v89 = 6;
                  v88 = 1;
                  while (1)
                  {
                    v90 = (id)v85[v89];
                    v91 = sub_24396FD7C();

                    if ((v91 & 1) != 0)
                      break;
                    v92 = v88 + 1;
                    if (__OFADD__(v88, 1))
                      goto LABEL_92;
                    ++v88;
                    v89 += 2;
                    if (v92 == v135)
                      goto LABEL_61;
                  }
                }
                swift_release();
                v95 = v88 + 1;
                if (__OFADD__(v88, 1))
                  goto LABEL_94;
                if (v95 < 0)
                {
                  v93 = 0;
                  v94 = 0;
                }
                else
                {
                  v94 = 0;
                  if (v95 >= 255)
                    v93 = -1;
                  else
                    v93 = v88 + 1;
                }
              }
              else
              {
LABEL_61:
                swift_release();
                v93 = 0;
                v94 = 1;
              }
              v96 = *v128;
              v97 = *((_QWORD *)*v128 + 2);
              swift_bridgeObjectRetain();
              if (v97 && (v98 = sub_243942698(v150, v54), (v99 & 1) != 0))
              {
                v100 = (uint64_t *)(v96[7] + 24 * v98);
                v101 = (_QWORD *)v100[1];
                v129 = *v100;
                v102 = (id)v100[2];
                swift_bridgeObjectRetain();
                swift_bridgeObjectRetain();
              }
              else
              {
                v101 = (_QWORD *)MEMORY[0x24BEE4B08];
                v103 = MEMORY[0x24BEE4AF8];
                if ((MEMORY[0x24BEE4AF8] & 0xC000000000000000) != 0)
                {
                  v111 = MEMORY[0x24BEE4AF8];
                  if (sub_24396FF20())
                  {
                    sub_24396C9A8(v111);
                    v101 = v112;
                  }
                  v103 = v111;
                }
                v102 = (id)sub_24393F028(v103);
              }
              aBlock[0] = v101;
              swift_bridgeObjectRelease();
              v104 = v132;
              sub_2439657C8(v151, v104);

              if ((v94 & 1) == 0)
              {
                v105 = v104;
                isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
                v151[0] = v102;
                sub_243964E68(v93, v105, isUniquelyReferenced_nonNull_native);
                v102 = v151[0];

                swift_bridgeObjectRelease();
              }
              v107 = aBlock[0];
              v108 = v128;
              v109 = swift_isUniquelyReferenced_nonNull_native();
              v151[0] = *v108;
              *v108 = (id)0x8000000000000000;
              sub_243964D10(v129, (uint64_t)v107, (uint64_t)v102, v150, v54, v109);
              *v108 = v151[0];
              swift_bridgeObjectRelease();

              v110 = v137;
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              v130 = sub_24394774C;
              v135 = v126;
              a2 = v125;
              v5 = v146;
              goto LABEL_23;
            }
            v117 = aBlock[0];
            v116 = (void *)sub_24396F8CC();

            swift_willThrow();
            v131 = 0;
          }
          if (qword_2572D9D10 != -1)
            swift_once();
          v118 = sub_24396FAE8();
          __swift_project_value_buffer(v118, (uint64_t)qword_2572DA2B0);
          swift_bridgeObjectRetain();
          v119 = sub_24396FAD0();
          v120 = sub_24396FD10();
          if (os_log_type_enabled(v119, v120))
          {
            v121 = swift_slowAlloc();
            v122 = (_QWORD *)swift_slowAlloc();
            aBlock[0] = v122;
            *(_DWORD *)v121 = v147;
            swift_bridgeObjectRetain();
            *(_QWORD *)(v121 + 4) = sub_2439420BC(v13, v12, (uint64_t *)aBlock);
            swift_bridgeObjectRelease_n();
            _os_log_impl(&dword_243921000, v119, v120, "Error loading model %s", (uint8_t *)v121, 0xCu);
            swift_arrayDestroy();
            v123 = v122;
            v5 = v146;
            MEMORY[0x2494FDD74](v123, -1, -1);
            MEMORY[0x2494FDD74](v121, -1, -1);

          }
          else
          {

            swift_bridgeObjectRelease_n();
          }

          v8 = (*(uint64_t (**)(char *, uint64_t))(v141 + 8))(v25, v144);
          goto LABEL_4;
        }
      }
      else
      {
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v141 + 56))(v20, 1, 1, v144);
      }
      sub_2439476E0((uint64_t)v20);
      if (qword_2572D9D10 != -1)
        swift_once();
      v33 = sub_24396FAE8();
      __swift_project_value_buffer(v33, (uint64_t)qword_2572DA2B0);
      swift_bridgeObjectRetain();
      v34 = sub_24396FAD0();
      v35 = sub_24396FD10();
      if (os_log_type_enabled(v34, v35))
      {
        v36 = swift_slowAlloc();
        v37 = (_QWORD *)swift_slowAlloc();
        aBlock[0] = v37;
        *(_DWORD *)v36 = v147;
        swift_bridgeObjectRetain();
        *(_QWORD *)(v36 + 4) = sub_2439420BC(v13, v12, (uint64_t *)aBlock);
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_243921000, v34, v35, "URL missing for model %s", (uint8_t *)v36, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x2494FDD74](v37, -1, -1);
        MEMORY[0x2494FDD74](v36, -1, -1);

      }
      else
      {

        v8 = swift_bridgeObjectRelease_n();
      }
LABEL_4:
      v9 = v145 + 1;
      v7 = v138;
      if (v145 + 1 == v140)
      {
        swift_bridgeObjectRelease();
        return sub_24393DFCC((uint64_t)v130);
      }
    }
  }
  return result;
}

void sub_243940BB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD *v13;
  uint64_t v14;
  void *v15;
  _QWORD *v16;
  void *v17;
  id v18;
  _QWORD v19[6];
  _QWORD aBlock[50];

  v4 = v3;
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = sub_24396FB30();
  v9 = objc_msgSend((id)BiomeLibrary(), sel_MLSE);
  swift_unknownObjectRelease();
  v10 = objc_msgSend(v9, sel_ShareSheet);
  swift_unknownObjectRelease();
  v11 = objc_msgSend(v10, sel_LabeledDataStore);
  swift_unknownObjectRelease();
  v12 = objc_msgSend(v11, sel_publisher);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = v8;
  v13[3] = a2;
  v13[4] = a3;
  aBlock[4] = sub_2439475D8;
  aBlock[5] = v13;
  v14 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_243960CDC;
  aBlock[3] = &block_descriptor;
  v15 = _Block_copy(aBlock);
  swift_retain();
  swift_retain();
  swift_release();
  sub_243941F9C(v4, (uint64_t)aBlock);
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = v8;
  v16[3] = a1;
  v16[4] = a2;
  v16[5] = a3;
  memcpy(v16 + 6, aBlock, 0x188uLL);
  v19[4] = sub_2439476D0;
  v19[5] = v16;
  v19[0] = v14;
  v19[1] = 1107296256;
  v19[2] = sub_243941F10;
  v19[3] = &block_descriptor_15;
  v17 = _Block_copy(v19);
  swift_retain();
  swift_retain();
  swift_release();
  v18 = objc_msgSend(v12, sel_sinkWithCompletion_receiveInput_, v15, v17);
  _Block_release(v17);
  _Block_release(v15);
  swift_release();

}

uint64_t sub_243940E30(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t result;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int64_t v8;
  unint64_t v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v1 = a1;
  v2 = *(_QWORD *)(a1 + 16);
  result = MEMORY[0x24BEE4AF8];
  if (v2)
  {
    v20 = MEMORY[0x24BEE4AF8];
    sub_24396FEA8();
    result = sub_243947524(v1);
    v5 = result;
    v6 = 0;
    v7 = v1 + 64;
    v16 = v1 + 80;
    v17 = v4;
    v18 = v1;
    while ((v5 & 0x8000000000000000) == 0 && v5 < 1 << *(_BYTE *)(v1 + 32))
    {
      v9 = (unint64_t)v5 >> 6;
      if ((*(_QWORD *)(v7 + 8 * ((unint64_t)v5 >> 6)) & (1 << v5)) == 0)
        goto LABEL_22;
      if (*(_DWORD *)(v1 + 36) != v4)
        goto LABEL_23;
      v19 = v6;
      sub_24396FA04();
      MEMORY[0x24BDAC7A8]();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_24396F9E0();
      v10 = objc_allocWithZone((Class)sub_24396FAB8());
      sub_24396FAAC();
      v1 = v18;
      sub_24396FE90();
      sub_24396FEB4();
      sub_24396FEC0();
      result = sub_24396FE9C();
      v8 = 1 << *(_BYTE *)(v18 + 32);
      if (v5 >= v8)
        goto LABEL_24;
      v11 = *(_QWORD *)(v7 + 8 * v9);
      if ((v11 & (1 << v5)) == 0)
        goto LABEL_25;
      v4 = v17;
      if (*(_DWORD *)(v18 + 36) != v17)
        goto LABEL_26;
      v12 = v11 & (-2 << (v5 & 0x3F));
      if (v12)
      {
        v8 = __clz(__rbit64(v12)) | v5 & 0xFFFFFFFFFFFFFFC0;
      }
      else
      {
        v13 = v9 + 1;
        v14 = (unint64_t)(v8 + 63) >> 6;
        if (v9 + 1 < v14)
        {
          v15 = *(_QWORD *)(v7 + 8 * v13);
          if (v15)
          {
LABEL_18:
            v8 = __clz(__rbit64(v15)) + (v13 << 6);
          }
          else
          {
            while (v14 - 2 != v9)
            {
              v15 = *(_QWORD *)(v16 + 8 * v9++);
              if (v15)
              {
                v13 = v9 + 1;
                goto LABEL_18;
              }
            }
          }
        }
      }
      v6 = v19 + 1;
      v5 = v8;
      if (v19 + 1 == v2)
        return v20;
    }
    __break(1u);
LABEL_22:
    __break(1u);
LABEL_23:
    __break(1u);
LABEL_24:
    __break(1u);
LABEL_25:
    __break(1u);
LABEL_26:
    __break(1u);
  }
  return result;
}

id sub_243941090(uint64_t a1)
{
  void *v1;

  (*(void (**)(void))(a1 + 32))();
  sub_24393E124(0, &qword_2572D9E38);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2572D9E78);
  sub_243947784();
  v1 = (void *)sub_24396FB0C();
  swift_bridgeObjectRelease();
  return v1;
}

id sub_243941110@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  void *v3;
  void *v4;
  id v5;
  id result;
  uint64_t v7;

  v3 = *(void **)a1;
  v4 = *(void **)(a1 + 8);
  *a2 = *(_QWORD *)a1;
  v5 = v3;
  result = objc_msgSend(v4, sel_doubleValue);
  a2[1] = v7;
  return result;
}

void sub_24394114C(void *a1, uint64_t a2, void (*a3)(uint64_t))
{
  id v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  _QWORD *v11;
  id v12;
  uint64_t v13;
  id v14;
  uint64_t v15;

  v5 = objc_msgSend(a1, sel_error);
  if (v5)
  {
    v6 = v5;
    if (qword_2572D9D10 != -1)
      swift_once();
    v7 = sub_24396FAE8();
    __swift_project_value_buffer(v7, (uint64_t)qword_2572DA2B0);
    v14 = v6;
    v8 = sub_24396FAD0();
    v9 = sub_24396FD10();
    if (os_log_type_enabled(v8, v9))
    {
      v10 = (uint8_t *)swift_slowAlloc();
      v11 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v10 = 138412290;
      v12 = v14;
      v15 = _swift_stdlib_bridgeErrorToNSError();
      sub_24396FD94();
      *v11 = v15;

      _os_log_impl(&dword_243921000, v8, v9, "Error reading labelled data stream: %@", v10, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2572DA050);
      swift_arrayDestroy();
      MEMORY[0x2494FDD74](v11, -1, -1);
      MEMORY[0x2494FDD74](v10, -1, -1);

    }
    else
    {

    }
  }
  else
  {
    swift_beginAccess();
    if (*(_QWORD *)(*(_QWORD *)(a2 + 16) + 16))
    {
      v13 = swift_bridgeObjectRetain();
      a3(v13);
      swift_bridgeObjectRelease();
    }
  }
}

void sub_243941360(void *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t))
{
  uint64_t *v7;
  void *v8;

  v7 = (uint64_t *)(a2 + 16);
  v8 = (void *)MEMORY[0x2494FD924]();
  sub_2439413DC(a1, v7, a3, a4);
  objc_autoreleasePoolPop(v8);
}

void sub_2439413DC(void *a1, uint64_t *a2, uint64_t a3, void (*a4)(uint64_t))
{
  uint64_t v4;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  id v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  id v22;
  uint64_t v23;
  id v24;
  unint64_t v25;
  id v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  void *v31;
  id v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  id v36;
  void *v37;
  id v38;
  id v39;
  char v40;
  uint64_t v41;
  NSObject *v42;
  os_log_type_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  char v51;
  uint64_t v52;
  int v53;
  unint64_t v54;
  void *v55;
  id v56;
  id v57;
  void *v58;
  id v59;
  id v60;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v62;
  id v63;
  id v64;
  char v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  uint64_t v71;
  uint64_t v72;
  _QWORD *v73;
  uint64_t v74[7];
  uint64_t v75;

  v8 = objc_msgSend(a1, sel_eventBody);
  if (!v8)
    goto LABEL_10;
  v9 = v8;
  v10 = objc_msgSend(v8, sel_itemIdentifier);
  if (!v10)
  {

LABEL_10:
    if (qword_2572D9D10 != -1)
      swift_once();
    v17 = sub_24396FAE8();
    __swift_project_value_buffer(v17, (uint64_t)qword_2572DA2B0);
    v18 = a1;
    v19 = sub_24396FAD0();
    v20 = sub_24396FD04();
    if (os_log_type_enabled(v19, v20))
    {
      v21 = (uint8_t *)swift_slowAlloc();
      v73 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v21 = 138412290;
      v74[3] = (uint64_t)v18;
      v22 = v18;
      sub_24396FD94();
      *v73 = v18;

      _os_log_impl(&dword_243921000, v19, v20, "Event missing info %@", v21, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2572DA050);
      swift_arrayDestroy();
      MEMORY[0x2494FDD74](v73, -1, -1);
      MEMORY[0x2494FDD74](v21, -1, -1);

    }
    else
    {

    }
    return;
  }
  v11 = v10;
  sub_24396FB60();

  v12 = objc_msgSend(v9, sel_sharingEventUID);
  if (!v12)
  {

    swift_bridgeObjectRelease();
    goto LABEL_10;
  }
  v13 = v12;
  v67 = sub_24396FB60();
  v15 = v14;

  if ((objc_msgSend(v9, sel_hasIsPositiveLabeled) & 1) == 0)
  {

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return;
  }
  v68 = v15;
  swift_beginAccess();
  if (*(_QWORD *)(*a2 + 16))
  {
    swift_bridgeObjectRetain();
    sub_243942698(v67, v15);
    if ((v16 & 1) != 0)
    {
      swift_endAccess();
      swift_bridgeObjectRelease();
      goto LABEL_21;
    }
    swift_bridgeObjectRelease();
  }
  swift_endAccess();
  swift_beginAccess();
  if (*(_QWORD *)(*a2 + 16) == a3)
  {
    v23 = swift_bridgeObjectRetain();
    a4(v23);
    swift_bridgeObjectRelease();
    swift_beginAccess();
    if (*(_QWORD *)(*a2 + 16))
    {
      swift_isUniquelyReferenced_nonNull_native();
      v75 = *a2;
      *a2 = 0x8000000000000000;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2572D9E18);
      sub_24396FED8();
      *a2 = v75;
      swift_bridgeObjectRelease();
    }
    swift_endAccess();
  }
LABEL_21:
  v24 = objc_msgSend(v9, sel_featureVector);
  sub_24393E124(0, &qword_2572D9E08);
  v25 = sub_24396FC14();

  v66 = v4;
  if (v25 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_24396FF20();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  sub_24393E124(0, &qword_2572D9E10);
  v72 = sub_24396FB30();
  v26 = objc_msgSend(v9, sel_featureVector);
  v27 = sub_24396FC14();

  if (v27 >> 62)
  {
    swift_bridgeObjectRetain();
    v28 = sub_24396FF20();
    swift_bridgeObjectRelease();
    v69 = v9;
    if (v28)
      goto LABEL_25;
LABEL_42:
    swift_bridgeObjectRelease();
    swift_beginAccess();
    v48 = *a2;
    v49 = *(_QWORD *)(*a2 + 16);
    swift_bridgeObjectRetain();
    if (v49 && (v50 = sub_243942698(v67, v68), (v51 & 1) != 0))
    {
      v52 = *(_QWORD *)(v48 + 56) + 24 * v50;
      v53 = *(_DWORD *)v52;
      v55 = *(void **)(v52 + 8);
      v54 = *(_QWORD *)(v52 + 16);
      v56 = v55;
      swift_bridgeObjectRetain();
    }
    else
    {
      v53 = objc_msgSend(v9, sel_labelingEvidence, v66);
      v54 = sub_24393F124(MEMORY[0x24BEE4AF8]);
      v55 = 0;
    }
    swift_endAccess();
    swift_bridgeObjectRelease();
    v57 = objc_allocWithZone(MEMORY[0x24BE71980]);
    v58 = (void *)sub_24396FB48();
    swift_bridgeObjectRelease();
    v59 = objc_msgSend(v57, sel_initWithDomainId_derivedIntentId_bundleId_recipientsId_, v58, 0, 0, 0);

    v60 = v59;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v74[0] = v54;
    sub_243965110(v72, v60, isUniquelyReferenced_nonNull_native);
    v62 = v74[0];

    swift_bridgeObjectRelease();
    if ((objc_msgSend(v9, sel_isPositiveLabeled) & 1) != 0)
    {
      v63 = v60;

      v55 = v63;
    }
    swift_beginAccess();
    v64 = v55;
    swift_bridgeObjectRetain();
    v65 = swift_isUniquelyReferenced_nonNull_native();
    v75 = *a2;
    *a2 = 0x8000000000000000;
    sub_243964FA8(v53, (uint64_t)v55, v62, v67, v68, v65);
    *a2 = v75;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_endAccess();
    swift_bridgeObjectRelease();

    return;
  }
  v28 = *(_QWORD *)((v27 & 0xFFFFFFFFFFFFF8) + 0x10);
  v69 = v9;
  if (!v28)
    goto LABEL_42;
LABEL_25:
  if (v28 >= 1)
  {
    v29 = 0;
    v71 = v28;
    while (1)
    {
      if ((v27 & 0xC000000000000001) != 0)
        v30 = (id)MEMORY[0x2494FD69C](v29, v27);
      else
        v30 = *(id *)(v27 + 8 * v29 + 32);
      v31 = v30;
      objc_msgSend(v30, sel_featureName, v66);
      v32 = (id)BMMLSEVirtualFeatureStoreFeaturefeatureNameAsString();
      v33 = sub_24396FB60();
      v35 = v34;

      v36 = objc_msgSend(v31, sel_featureValue);
      if (!v36)
        goto LABEL_37;
      v37 = v36;
      v38 = sub_243941D04(v36);
      if (!v38)
        break;
      v39 = v38;
      v40 = swift_isUniquelyReferenced_nonNull_native();
      v74[0] = v72;
      sub_2439650FC((uint64_t)v39, v33, v35, v40);
      v72 = v74[0];

      v28 = v71;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
LABEL_29:
      if (v28 == ++v29)
        goto LABEL_42;
    }

LABEL_37:
    if (qword_2572D9D10 != -1)
      swift_once();
    v41 = sub_24396FAE8();
    __swift_project_value_buffer(v41, (uint64_t)qword_2572DA2B0);
    swift_bridgeObjectRetain();
    v42 = sub_24396FAD0();
    v43 = sub_24396FD04();
    if (os_log_type_enabled(v42, v43))
    {
      v44 = swift_slowAlloc();
      v45 = swift_slowAlloc();
      v74[0] = v45;
      *(_DWORD *)v44 = 136315138;
      swift_bridgeObjectRetain();
      *(_QWORD *)(v44 + 4) = sub_2439420BC(v33, v35, v74);
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_243921000, v42, v43, "Feature %s is missing a value", (uint8_t *)v44, 0xCu);
      swift_arrayDestroy();
      v46 = v45;
      v9 = v69;
      MEMORY[0x2494FDD74](v46, -1, -1);
      v47 = v44;
      v28 = v71;
      MEMORY[0x2494FDD74](v47, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }

    goto LABEL_29;
  }
  __break(1u);
}

id sub_243941D04(void *a1)
{
  void *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v11;
  id v12;
  void *v13;
  id v14;

  if (objc_msgSend(a1, sel_hasIntValue))
  {
    objc_msgSend(a1, sel_intValue);
    v2 = (void *)sub_24397001C();
    v3 = objc_msgSend(a1, sel_timeBucketValue);
    v4 = objc_allocWithZone(MEMORY[0x24BE0C528]);
    v5 = v2;
    v6 = 0;
LABEL_6:
    v7 = 0;
    goto LABEL_7;
  }
  if (objc_msgSend(a1, sel_hasDoubleValue) || objc_msgSend(a1, sel_hasDoubleValue))
  {
    objc_msgSend(a1, sel_doubleValue);
    v2 = (void *)sub_24396FC98();
    v3 = objc_msgSend(a1, sel_timeBucketValue);
    v4 = objc_allocWithZone(MEMORY[0x24BE0C528]);
    v5 = 0;
    v6 = v2;
    goto LABEL_6;
  }
  if (objc_msgSend(a1, sel_hasBoolValue))
  {
    objc_msgSend(a1, sel_BOOLValue);
    v2 = (void *)sub_24396FC68();
    v11 = objc_msgSend(a1, sel_timeBucketValue);
    v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE0C528]), sel_initWithIntValue_doubleValue_stringValue_BOOLValue_timeBucketValue_missingReason_, 0, 0, 0, v2, v11, 1);
    goto LABEL_8;
  }
  v12 = objc_msgSend(a1, sel_stringValue);
  if (!v12)
    return 0;
  v13 = v12;
  sub_24396FB60();

  v3 = objc_msgSend(a1, sel_timeBucketValue);
  v14 = objc_allocWithZone(MEMORY[0x24BE0C528]);
  v2 = (void *)sub_24396FB48();
  swift_bridgeObjectRelease();
  v4 = v14;
  v5 = 0;
  v6 = 0;
  v7 = v2;
LABEL_7:
  v8 = objc_msgSend(v4, sel_initWithIntValue_doubleValue_stringValue_BOOLValue_timeBucketValue_missingReason_, v5, v6, v7, 0, v3, 1);
LABEL_8:
  v9 = v8;

  return v9;
}

void sub_243941F10(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3();
  swift_release();

}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_243941F78()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_243941F9C(uint64_t a1, uint64_t a2)
{
  initializeWithCopy for ShadowEvaluationManager(a2, a1);
  return a2;
}

uint64_t sub_243941FD0()
{
  id *v0;

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)(v0 + 45));

  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2439420AC(uint64_t a1)
{
  uint64_t v1;

  return sub_24393F908(a1, v1 + 16, *(void **)(v1 + 408), *(_QWORD *)(v1 + 416), *(_QWORD *)(v1 + 424));
}

uint64_t sub_2439420BC(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_24394218C(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_243946B14((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = MEMORY[0x24BEE2520];
    v12[0] = a1;
    v12[1] = a2;
    v10 = *a3;
    if (*a3)
    {
      sub_243946B14((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v12);
  return v7;
}

uint64_t sub_24394218C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  _QWORD __src[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (_QWORD *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_24396FDA0();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_243942344(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0)
    goto LABEL_13;
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  v8 = sub_24396FE84();
  if (!v8)
  {
    sub_24396FF08();
    __break(1u);
LABEL_17:
    result = sub_24396FF5C();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return swift_unknownObjectRetain();
}

uint64_t sub_243942344(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_2439423D8(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_24394254C(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_24394254C(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_2439423D8(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  char v6;
  uint64_t result;

  if ((a2 & 0x1000000000000000) != 0)
    goto LABEL_10;
  if ((a2 & 0x2000000000000000) != 0)
    v2 = HIBYTE(a2) & 0xF;
  else
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  if (v2)
  {
    while (1)
    {
      v3 = sub_24394A218(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_24396FE54();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_24396FF08();
      __break(1u);
LABEL_10:
      v2 = sub_24396FB9C();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_24396FF5C();
    __break(1u);
LABEL_14:
    result = sub_24396FF08();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

uint64_t sub_24394254C(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2572D9E00);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[v8])
      memmove(v12, v13, v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_24396FF5C();
  __break(1u);
  return result;
}

unint64_t sub_243942698(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_24396FFF8();
  sub_24396FB84();
  v4 = sub_243970010();
  return sub_2439427C4(a1, a2, v4);
}

unint64_t sub_2439426FC(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_24396FD70();
  return sub_2439428A4(a1, v2);
}

unint64_t sub_24394272C(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_24396FD70();
  return sub_2439429AC(a1, v2, &qword_2572D9E38);
}

unint64_t sub_243942778(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_24396FD70();
  return sub_2439429AC(a1, v2, (unint64_t *)&qword_2572D9DE0);
}

unint64_t sub_2439427C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v9;
  _QWORD *v10;
  BOOL v11;
  uint64_t v12;
  _QWORD *v13;
  BOOL v14;

  v4 = v3 + 64;
  v5 = -1 << *(_BYTE *)(v3 + 32);
  v6 = a3 & ~v5;
  if (((*(_QWORD *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0)
  {
    v9 = *(_QWORD *)(v3 + 48);
    v10 = (_QWORD *)(v9 + 16 * v6);
    v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_24396FF8C() & 1) == 0)
    {
      v12 = ~v5;
      do
      {
        v6 = (v6 + 1) & v12;
        if (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
          break;
        v13 = (_QWORD *)(v9 + 16 * v6);
        v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_24396FF8C() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_2439428A4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t i;
  id v6;
  char v7;
  uint64_t v8;
  id v9;
  char v10;

  v3 = v2 + 64;
  v4 = -1 << *(_BYTE *)(v2 + 32);
  i = a2 & ~v4;
  if (((*(_QWORD *)(v2 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0)
  {
    sub_24396FA88();
    v6 = *(id *)(*(_QWORD *)(v2 + 48) + 8 * i);
    v7 = sub_24396FD7C();

    if ((v7 & 1) == 0)
    {
      v8 = ~v4;
      for (i = (i + 1) & v8; ((*(_QWORD *)(v3 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0; i = (i + 1) & v8)
      {
        v9 = *(id *)(*(_QWORD *)(v2 + 48) + 8 * i);
        v10 = sub_24396FD7C();

        if ((v10 & 1) != 0)
          break;
      }
    }
  }
  return i;
}

unint64_t sub_2439429AC(uint64_t a1, uint64_t a2, unint64_t *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t i;
  id v7;
  char v8;
  uint64_t v9;
  id v10;
  char v11;

  v4 = v3 + 64;
  v5 = -1 << *(_BYTE *)(v3 + 32);
  i = a2 & ~v5;
  if (((*(_QWORD *)(v3 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0)
  {
    sub_24393E124(0, a3);
    v7 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * i);
    v8 = sub_24396FD7C();

    if ((v8 & 1) == 0)
    {
      v9 = ~v5;
      for (i = (i + 1) & v9; ((*(_QWORD *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0; i = (i + 1) & v9)
      {
        v10 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * i);
        v11 = sub_24396FD7C();

        if ((v11 & 1) != 0)
          break;
      }
    }
  }
  return i;
}

uint64_t sub_243942ABC(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t result;
  int64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  unint64_t v21;
  unint64_t v22;
  int64_t v23;
  _QWORD *v24;
  unint64_t v25;
  int64_t v26;
  char v27;
  unint64_t v28;
  BOOL v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  int64_t v40;
  uint64_t v41;
  char v42;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2572D9DF8);
  v42 = a2;
  v6 = sub_24396FF44();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v41 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v39 = v2;
  v40 = (unint64_t)(v8 + 63) >> 6;
  v11 = v6 + 64;
  result = swift_retain();
  v13 = 0;
  while (1)
  {
    if (v10)
    {
      v21 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v22 = v21 | (v13 << 6);
      goto LABEL_31;
    }
    v23 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v23 >= v40)
      break;
    v24 = (_QWORD *)(v5 + 64);
    v25 = *(_QWORD *)(v41 + 8 * v23);
    ++v13;
    if (!v25)
    {
      v13 = v23 + 1;
      if (v23 + 1 >= v40)
        goto LABEL_33;
      v25 = *(_QWORD *)(v41 + 8 * v13);
      if (!v25)
      {
        v26 = v23 + 2;
        if (v26 >= v40)
        {
LABEL_33:
          swift_release();
          v3 = v39;
          if ((v42 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v25 = *(_QWORD *)(v41 + 8 * v26);
        if (!v25)
        {
          while (1)
          {
            v13 = v26 + 1;
            if (__OFADD__(v26, 1))
              goto LABEL_42;
            if (v13 >= v40)
              goto LABEL_33;
            v25 = *(_QWORD *)(v41 + 8 * v13);
            ++v26;
            if (v25)
              goto LABEL_30;
          }
        }
        v13 = v26;
      }
    }
LABEL_30:
    v10 = (v25 - 1) & v25;
    v22 = __clz(__rbit64(v25)) + (v13 << 6);
LABEL_31:
    v31 = 16 * v22;
    v32 = (uint64_t *)(*(_QWORD *)(v5 + 48) + v31);
    v34 = *v32;
    v33 = v32[1];
    v35 = (uint64_t *)(*(_QWORD *)(v5 + 56) + v31);
    v36 = *v35;
    v37 = v35[1];
    if ((v42 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_24396FFF8();
    sub_24396FB84();
    result = sub_243970010();
    v14 = -1 << *(_BYTE *)(v7 + 32);
    v15 = result & ~v14;
    v16 = v15 >> 6;
    if (((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v27 = 0;
      v28 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v28 && (v27 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v29 = v16 == v28;
        if (v16 == v28)
          v16 = 0;
        v27 |= v29;
        v30 = *(_QWORD *)(v11 + 8 * v16);
      }
      while (v30 == -1);
      v17 = __clz(__rbit64(~v30)) + (v16 << 6);
    }
    *(_QWORD *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    v18 = 16 * v17;
    v19 = (_QWORD *)(*(_QWORD *)(v7 + 48) + v18);
    *v19 = v34;
    v19[1] = v33;
    v20 = (_QWORD *)(*(_QWORD *)(v7 + 56) + v18);
    *v20 = v36;
    v20[1] = v37;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v39;
  v24 = (_QWORD *)(v5 + 64);
  if ((v42 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v38 = 1 << *(_BYTE *)(v5 + 32);
  if (v38 >= 64)
    bzero(v24, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v24 = -1 << v38;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_243942DE0(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t result;
  int64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  _QWORD *v23;
  unint64_t v24;
  int64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  int64_t v37;
  uint64_t v38;
  char v39;
  __int128 v40;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2572D9E60);
  v39 = a2;
  v6 = sub_24396FF44();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v38 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v36 = v2;
  v37 = (unint64_t)(v8 + 63) >> 6;
  v11 = v6 + 64;
  result = swift_retain();
  v13 = 0;
  while (1)
  {
    if (v10)
    {
      v20 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v21 = v20 | (v13 << 6);
      goto LABEL_31;
    }
    v22 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v37)
      break;
    v23 = (_QWORD *)(v5 + 64);
    v24 = *(_QWORD *)(v38 + 8 * v22);
    ++v13;
    if (!v24)
    {
      v13 = v22 + 1;
      if (v22 + 1 >= v37)
        goto LABEL_33;
      v24 = *(_QWORD *)(v38 + 8 * v13);
      if (!v24)
      {
        v25 = v22 + 2;
        if (v25 >= v37)
        {
LABEL_33:
          swift_release();
          v3 = v36;
          if ((v39 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v24 = *(_QWORD *)(v38 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            v13 = v25 + 1;
            if (__OFADD__(v25, 1))
              goto LABEL_42;
            if (v13 >= v37)
              goto LABEL_33;
            v24 = *(_QWORD *)(v38 + 8 * v13);
            ++v25;
            if (v24)
              goto LABEL_30;
          }
        }
        v13 = v25;
      }
    }
LABEL_30:
    v10 = (v24 - 1) & v24;
    v21 = __clz(__rbit64(v24)) + (v13 << 6);
LABEL_31:
    v30 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v21);
    v32 = *v30;
    v31 = v30[1];
    v33 = *(_QWORD *)(v5 + 56) + 24 * v21;
    v34 = *(_QWORD *)v33;
    v40 = *(_OWORD *)(v33 + 8);
    if ((v39 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_24396FFF8();
    sub_24396FB84();
    result = sub_243970010();
    v14 = -1 << *(_BYTE *)(v7 + 32);
    v15 = result & ~v14;
    v16 = v15 >> 6;
    if (((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v26 = 0;
      v27 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v28 = v16 == v27;
        if (v16 == v27)
          v16 = 0;
        v26 |= v28;
        v29 = *(_QWORD *)(v11 + 8 * v16);
      }
      while (v29 == -1);
      v17 = __clz(__rbit64(~v29)) + (v16 << 6);
    }
    *(_QWORD *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    v18 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v17);
    *v18 = v32;
    v18[1] = v31;
    v19 = *(_QWORD *)(v7 + 56) + 24 * v17;
    *(_QWORD *)v19 = v34;
    *(_OWORD *)(v19 + 8) = v40;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v36;
  v23 = (_QWORD *)(v5 + 64);
  if ((v39 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v35 = 1 << *(_BYTE *)(v5 + 32);
  if (v35 >= 64)
    bzero(v23, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v23 = -1 << v35;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_243943120(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  uint64_t v12;
  uint64_t result;
  int64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  _QWORD *v22;
  unint64_t v23;
  int64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  void *v29;
  char v30;
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2572D9E58);
  v6 = sub_24396FF44();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v33 = v2;
  v34 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v11 = (unint64_t)(v8 + 63) >> 6;
  v12 = v6 + 64;
  result = swift_retain();
  v14 = 0;
  while (1)
  {
    if (v10)
    {
      v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v20 = v19 | (v14 << 6);
      goto LABEL_31;
    }
    v21 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v11)
      break;
    v22 = (_QWORD *)(v5 + 64);
    v23 = *(_QWORD *)(v34 + 8 * v21);
    ++v14;
    if (!v23)
    {
      v14 = v21 + 1;
      if (v21 + 1 >= v11)
        goto LABEL_33;
      v23 = *(_QWORD *)(v34 + 8 * v14);
      if (!v23)
      {
        v24 = v21 + 2;
        if (v24 >= v11)
        {
LABEL_33:
          swift_release();
          v3 = v33;
          if ((a2 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v23 = *(_QWORD *)(v34 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            v14 = v24 + 1;
            if (__OFADD__(v24, 1))
              goto LABEL_42;
            if (v14 >= v11)
              goto LABEL_33;
            v23 = *(_QWORD *)(v34 + 8 * v14);
            ++v24;
            if (v23)
              goto LABEL_30;
          }
        }
        v14 = v24;
      }
    }
LABEL_30:
    v10 = (v23 - 1) & v23;
    v20 = __clz(__rbit64(v23)) + (v14 << 6);
LABEL_31:
    v29 = *(void **)(*(_QWORD *)(v5 + 48) + 8 * v20);
    v30 = *(_BYTE *)(*(_QWORD *)(v5 + 56) + v20);
    if ((a2 & 1) == 0)
      v31 = v29;
    result = sub_24396FD70();
    v15 = -1 << *(_BYTE *)(v7 + 32);
    v16 = result & ~v15;
    v17 = v16 >> 6;
    if (((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      v18 = __clz(__rbit64((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v25 = 0;
      v26 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v27 = v17 == v26;
        if (v17 == v26)
          v17 = 0;
        v25 |= v27;
        v28 = *(_QWORD *)(v12 + 8 * v17);
      }
      while (v28 == -1);
      v18 = __clz(__rbit64(~v28)) + (v17 << 6);
    }
    *(_QWORD *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    *(_QWORD *)(*(_QWORD *)(v7 + 48) + 8 * v18) = v29;
    *(_BYTE *)(*(_QWORD *)(v7 + 56) + v18) = v30;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v33;
  v22 = (_QWORD *)(v5 + 64);
  if ((a2 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v32 = 1 << *(_BYTE *)(v5 + 32);
  if (v32 >= 64)
    bzero(v22, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v22 = -1 << v32;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_2439433E4(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t result;
  int64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int v33;
  uint64_t v34;
  void *v35;
  id v36;
  uint64_t v37;
  int64_t v38;
  _QWORD *v39;
  uint64_t i;
  char v41;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2572D9E28);
  v41 = a2;
  v6 = sub_24396FF44();
  v7 = v6;
  if (*(_QWORD *)(v5 + 16))
  {
    v8 = 1 << *(_BYTE *)(v5 + 32);
    v39 = (_QWORD *)(v5 + 64);
    if (v8 < 64)
      v9 = ~(-1 << v8);
    else
      v9 = -1;
    v10 = v9 & *(_QWORD *)(v5 + 64);
    v38 = (unint64_t)(v8 + 63) >> 6;
    v11 = v6 + 64;
    result = swift_retain();
    v13 = 0;
    for (i = v5; ; v5 = i)
    {
      if (v10)
      {
        v20 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        v21 = v20 | (v13 << 6);
      }
      else
      {
        v22 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        if (v22 >= v38)
          goto LABEL_33;
        v23 = v39[v22];
        ++v13;
        if (!v23)
        {
          v13 = v22 + 1;
          if (v22 + 1 >= v38)
            goto LABEL_33;
          v23 = v39[v13];
          if (!v23)
          {
            v24 = v22 + 2;
            if (v24 >= v38)
            {
LABEL_33:
              swift_release();
              v3 = v2;
              if ((v41 & 1) != 0)
              {
                v37 = 1 << *(_BYTE *)(v5 + 32);
                if (v37 >= 64)
                  bzero(v39, ((unint64_t)(v37 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v39 = -1 << v37;
                *(_QWORD *)(v5 + 16) = 0;
              }
              break;
            }
            v23 = v39[v24];
            if (!v23)
            {
              while (1)
              {
                v13 = v24 + 1;
                if (__OFADD__(v24, 1))
                  goto LABEL_40;
                if (v13 >= v38)
                  goto LABEL_33;
                v23 = v39[v13];
                ++v24;
                if (v23)
                  goto LABEL_30;
              }
            }
            v13 = v24;
          }
        }
LABEL_30:
        v10 = (v23 - 1) & v23;
        v21 = __clz(__rbit64(v23)) + (v13 << 6);
      }
      v29 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v21);
      v31 = *v29;
      v30 = v29[1];
      v32 = *(_QWORD *)(v5 + 56) + 24 * v21;
      v33 = *(_DWORD *)v32;
      v35 = *(void **)(v32 + 8);
      v34 = *(_QWORD *)(v32 + 16);
      if ((v41 & 1) == 0)
      {
        v36 = v35;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
      }
      sub_24396FFF8();
      sub_24396FB84();
      result = sub_243970010();
      v14 = -1 << *(_BYTE *)(v7 + 32);
      v15 = result & ~v14;
      v16 = v15 >> 6;
      if (((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6))) != 0)
      {
        v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v25 = 0;
        v26 = (unint64_t)(63 - v14) >> 6;
        do
        {
          if (++v16 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_39;
          }
          v27 = v16 == v26;
          if (v16 == v26)
            v16 = 0;
          v25 |= v27;
          v28 = *(_QWORD *)(v11 + 8 * v16);
        }
        while (v28 == -1);
        v17 = __clz(__rbit64(~v28)) + (v16 << 6);
      }
      *(_QWORD *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
      v18 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v17);
      *v18 = v31;
      v18[1] = v30;
      v19 = *(_QWORD *)(v7 + 56) + 24 * v17;
      *(_DWORD *)v19 = v33;
      *(_QWORD *)(v19 + 8) = v35;
      *(_QWORD *)(v19 + 16) = v34;
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_24394370C(uint64_t a1, char a2)
{
  return sub_243944984(a1, a2, &qword_2572D9E20);
}

uint64_t sub_243943718(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  uint64_t v12;
  uint64_t result;
  int64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  _QWORD *v23;
  unint64_t v24;
  int64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2572D9E30);
  v6 = sub_24396FF44();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v35 = v2;
  v36 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v11 = (unint64_t)(v8 + 63) >> 6;
  v12 = v6 + 64;
  result = swift_retain();
  v14 = 0;
  while (1)
  {
    if (v10)
    {
      v20 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v21 = v20 | (v14 << 6);
      goto LABEL_31;
    }
    v22 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v11)
      break;
    v23 = (_QWORD *)(v5 + 64);
    v24 = *(_QWORD *)(v36 + 8 * v22);
    ++v14;
    if (!v24)
    {
      v14 = v22 + 1;
      if (v22 + 1 >= v11)
        goto LABEL_33;
      v24 = *(_QWORD *)(v36 + 8 * v14);
      if (!v24)
      {
        v25 = v22 + 2;
        if (v25 >= v11)
        {
LABEL_33:
          swift_release();
          v3 = v35;
          if ((a2 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v24 = *(_QWORD *)(v36 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            v14 = v25 + 1;
            if (__OFADD__(v25, 1))
              goto LABEL_42;
            if (v14 >= v11)
              goto LABEL_33;
            v24 = *(_QWORD *)(v36 + 8 * v14);
            ++v25;
            if (v24)
              goto LABEL_30;
          }
        }
        v14 = v25;
      }
    }
LABEL_30:
    v10 = (v24 - 1) & v24;
    v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_31:
    v30 = 8 * v21;
    v31 = *(void **)(*(_QWORD *)(v5 + 48) + v30);
    v32 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + v30);
    if ((a2 & 1) == 0)
    {
      v33 = v31;
      swift_bridgeObjectRetain();
    }
    result = sub_24396FD70();
    v15 = -1 << *(_BYTE *)(v7 + 32);
    v16 = result & ~v15;
    v17 = v16 >> 6;
    if (((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      v18 = __clz(__rbit64((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v26 = 0;
      v27 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v28 = v17 == v27;
        if (v17 == v27)
          v17 = 0;
        v26 |= v28;
        v29 = *(_QWORD *)(v12 + 8 * v17);
      }
      while (v29 == -1);
      v18 = __clz(__rbit64(~v29)) + (v17 << 6);
    }
    *(_QWORD *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    v19 = 8 * v18;
    *(_QWORD *)(*(_QWORD *)(v7 + 48) + v19) = v31;
    *(_QWORD *)(*(_QWORD *)(v7 + 56) + v19) = v32;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v35;
  v23 = (_QWORD *)(v5 + 64);
  if ((a2 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v34 = 1 << *(_BYTE *)(v5 + 32);
  if (v34 >= 64)
    bzero(v23, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v23 = -1 << v34;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_2439439EC(uint64_t a1, char a2)
{
  return sub_243943D18(a1, a2, &qword_2572D9DA0);
}

uint64_t sub_2439439F8(uint64_t a1, char a2)
{
  return sub_243943D18(a1, a2, &qword_2572D9D98);
}

uint64_t sub_243943A04(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t result;
  int64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  _QWORD *v22;
  unint64_t v23;
  int64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  int64_t v35;
  uint64_t v36;
  char v37;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2572D9DB8);
  v37 = a2;
  v6 = sub_24396FF44();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v36 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v34 = v2;
  v35 = (unint64_t)(v8 + 63) >> 6;
  v11 = v6 + 64;
  result = swift_retain();
  v13 = 0;
  while (1)
  {
    if (v10)
    {
      v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v35)
      break;
    v22 = (_QWORD *)(v5 + 64);
    v23 = *(_QWORD *)(v36 + 8 * v21);
    ++v13;
    if (!v23)
    {
      v13 = v21 + 1;
      if (v21 + 1 >= v35)
        goto LABEL_33;
      v23 = *(_QWORD *)(v36 + 8 * v13);
      if (!v23)
      {
        v24 = v21 + 2;
        if (v24 >= v35)
        {
LABEL_33:
          swift_release();
          v3 = v34;
          if ((v37 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v23 = *(_QWORD *)(v36 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            v13 = v24 + 1;
            if (__OFADD__(v24, 1))
              goto LABEL_42;
            if (v13 >= v35)
              goto LABEL_33;
            v23 = *(_QWORD *)(v36 + 8 * v13);
            ++v24;
            if (v23)
              goto LABEL_30;
          }
        }
        v13 = v24;
      }
    }
LABEL_30:
    v10 = (v23 - 1) & v23;
    v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    v29 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v20);
    v31 = *v29;
    v30 = v29[1];
    v32 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + 8 * v20);
    if ((v37 & 1) == 0)
      swift_bridgeObjectRetain();
    sub_24396FFF8();
    sub_24396FB84();
    result = sub_243970010();
    v14 = -1 << *(_BYTE *)(v7 + 32);
    v15 = result & ~v14;
    v16 = v15 >> 6;
    if (((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v25 = 0;
      v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v27 = v16 == v26;
        if (v16 == v26)
          v16 = 0;
        v25 |= v27;
        v28 = *(_QWORD *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(_QWORD *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    v18 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v17);
    *v18 = v31;
    v18[1] = v30;
    *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v17) = v32;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v34;
  v22 = (_QWORD *)(v5 + 64);
  if ((v37 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v33 = 1 << *(_BYTE *)(v5 + 32);
  if (v33 >= 64)
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v22 = -1 << v33;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_243943D0C(uint64_t a1, char a2)
{
  return sub_243943D18(a1, a2, &qword_2572D9DB0);
}

uint64_t sub_243943D18(uint64_t a1, char a2, uint64_t *a3)
{
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t result;
  int64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  _QWORD *v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  _QWORD *v23;
  unint64_t v24;
  int64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  int64_t v35;
  uint64_t v36;
  char v37;

  v4 = v3;
  v6 = *v3;
  __swift_instantiateConcreteTypeFromMangledName(a3);
  v37 = a2;
  v7 = sub_24396FF44();
  v8 = v7;
  if (!*(_QWORD *)(v6 + 16))
    goto LABEL_40;
  v9 = 1 << *(_BYTE *)(v6 + 32);
  v36 = v6 + 64;
  if (v9 < 64)
    v10 = ~(-1 << v9);
  else
    v10 = -1;
  v11 = v10 & *(_QWORD *)(v6 + 64);
  v35 = (unint64_t)(v9 + 63) >> 6;
  v12 = v7 + 64;
  result = swift_retain();
  v14 = 0;
  while (1)
  {
    if (v11)
    {
      v20 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      v21 = v20 | (v14 << 6);
      goto LABEL_31;
    }
    v22 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v35)
      break;
    v23 = (_QWORD *)(v6 + 64);
    v24 = *(_QWORD *)(v36 + 8 * v22);
    ++v14;
    if (!v24)
    {
      v14 = v22 + 1;
      if (v22 + 1 >= v35)
        goto LABEL_33;
      v24 = *(_QWORD *)(v36 + 8 * v14);
      if (!v24)
      {
        v25 = v22 + 2;
        if (v25 >= v35)
        {
LABEL_33:
          swift_release();
          if ((v37 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v24 = *(_QWORD *)(v36 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            v14 = v25 + 1;
            if (__OFADD__(v25, 1))
              goto LABEL_42;
            if (v14 >= v35)
              goto LABEL_33;
            v24 = *(_QWORD *)(v36 + 8 * v14);
            ++v25;
            if (v24)
              goto LABEL_30;
          }
        }
        v14 = v25;
      }
    }
LABEL_30:
    v11 = (v24 - 1) & v24;
    v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_31:
    v30 = (uint64_t *)(*(_QWORD *)(v6 + 48) + 16 * v21);
    v32 = *v30;
    v31 = v30[1];
    v33 = *(_QWORD *)(*(_QWORD *)(v6 + 56) + 8 * v21);
    if ((v37 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_24396FFF8();
    sub_24396FB84();
    result = sub_243970010();
    v15 = -1 << *(_BYTE *)(v8 + 32);
    v16 = result & ~v15;
    v17 = v16 >> 6;
    if (((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      v18 = __clz(__rbit64((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v26 = 0;
      v27 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v28 = v17 == v27;
        if (v17 == v27)
          v17 = 0;
        v26 |= v28;
        v29 = *(_QWORD *)(v12 + 8 * v17);
      }
      while (v29 == -1);
      v18 = __clz(__rbit64(~v29)) + (v17 << 6);
    }
    *(_QWORD *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    v19 = (_QWORD *)(*(_QWORD *)(v8 + 48) + 16 * v18);
    *v19 = v32;
    v19[1] = v31;
    *(_QWORD *)(*(_QWORD *)(v8 + 56) + 8 * v18) = v33;
    ++*(_QWORD *)(v8 + 16);
  }
  swift_release();
  v23 = (_QWORD *)(v6 + 64);
  if ((v37 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v34 = 1 << *(_BYTE *)(v6 + 32);
  if (v34 >= 64)
    bzero(v23, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v23 = -1 << v34;
  *(_QWORD *)(v6 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v4 = v8;
  return result;
}

uint64_t sub_243944028(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t result;
  int64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  int64_t v37;
  _QWORD *v38;
  uint64_t i;
  char v40;
  uint64_t v41;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2572D9DA8);
  v40 = a2;
  v6 = sub_24396FF44();
  v7 = v6;
  if (*(_QWORD *)(v5 + 16))
  {
    v8 = 1 << *(_BYTE *)(v5 + 32);
    v38 = (_QWORD *)(v5 + 64);
    if (v8 < 64)
      v9 = ~(-1 << v8);
    else
      v9 = -1;
    v10 = v9 & *(_QWORD *)(v5 + 64);
    v37 = (unint64_t)(v8 + 63) >> 6;
    v11 = v6 + 64;
    result = swift_retain();
    v13 = 0;
    for (i = v5; ; v5 = i)
    {
      if (v10)
      {
        v20 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        v21 = v20 | (v13 << 6);
      }
      else
      {
        v22 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        if (v22 >= v37)
          goto LABEL_33;
        v23 = v38[v22];
        ++v13;
        if (!v23)
        {
          v13 = v22 + 1;
          if (v22 + 1 >= v37)
            goto LABEL_33;
          v23 = v38[v13];
          if (!v23)
          {
            v24 = v22 + 2;
            if (v24 >= v37)
            {
LABEL_33:
              swift_release();
              v3 = v2;
              if ((v40 & 1) != 0)
              {
                v36 = 1 << *(_BYTE *)(v5 + 32);
                if (v36 >= 64)
                  bzero(v38, ((unint64_t)(v36 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v38 = -1 << v36;
                *(_QWORD *)(v5 + 16) = 0;
              }
              break;
            }
            v23 = v38[v24];
            if (!v23)
            {
              while (1)
              {
                v13 = v24 + 1;
                if (__OFADD__(v24, 1))
                  goto LABEL_40;
                if (v13 >= v37)
                  goto LABEL_33;
                v23 = v38[v13];
                ++v24;
                if (v23)
                  goto LABEL_30;
              }
            }
            v13 = v24;
          }
        }
LABEL_30:
        v10 = (v23 - 1) & v23;
        v21 = __clz(__rbit64(v23)) + (v13 << 6);
      }
      v29 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v21);
      v31 = *v29;
      v30 = v29[1];
      v32 = (uint64_t *)(*(_QWORD *)(v5 + 56) + 32 * v21);
      v33 = *v32;
      v34 = v32[1];
      v35 = v32[3];
      v41 = v32[2];
      if ((v40 & 1) == 0)
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
      }
      sub_24396FFF8();
      sub_24396FB84();
      result = sub_243970010();
      v14 = -1 << *(_BYTE *)(v7 + 32);
      v15 = result & ~v14;
      v16 = v15 >> 6;
      if (((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6))) != 0)
      {
        v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v25 = 0;
        v26 = (unint64_t)(63 - v14) >> 6;
        do
        {
          if (++v16 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_39;
          }
          v27 = v16 == v26;
          if (v16 == v26)
            v16 = 0;
          v25 |= v27;
          v28 = *(_QWORD *)(v11 + 8 * v16);
        }
        while (v28 == -1);
        v17 = __clz(__rbit64(~v28)) + (v16 << 6);
      }
      *(_QWORD *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
      v18 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v17);
      *v18 = v31;
      v18[1] = v30;
      v19 = (_QWORD *)(*(_QWORD *)(v7 + 56) + 32 * v17);
      *v19 = v33;
      v19[1] = v34;
      v19[2] = v41;
      v19[3] = v35;
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_243944350(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t result;
  int64_t v13;
  unint64_t v14;
  _QWORD *v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  _QWORD *v19;
  unint64_t v20;
  int64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  __int128 *v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  char v29;
  unint64_t v30;
  BOOL v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  int64_t v35;
  uint64_t v36;
  char v37;
  __int128 v38[2];

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2572D9DC8);
  v37 = a2;
  v6 = sub_24396FF44();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_41;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v36 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v34 = v2;
  v35 = (unint64_t)(v8 + 63) >> 6;
  v11 = v6 + 64;
  result = swift_retain();
  v13 = 0;
  while (1)
  {
    if (v10)
    {
      v16 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v17 = v16 | (v13 << 6);
      goto LABEL_22;
    }
    v18 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v18 >= v35)
      break;
    v19 = (_QWORD *)(v5 + 64);
    v20 = *(_QWORD *)(v36 + 8 * v18);
    ++v13;
    if (!v20)
    {
      v13 = v18 + 1;
      if (v18 + 1 >= v35)
        goto LABEL_34;
      v20 = *(_QWORD *)(v36 + 8 * v13);
      if (!v20)
      {
        v21 = v18 + 2;
        if (v21 >= v35)
        {
LABEL_34:
          swift_release();
          v3 = v34;
          if ((v37 & 1) == 0)
            goto LABEL_41;
          goto LABEL_37;
        }
        v20 = *(_QWORD *)(v36 + 8 * v21);
        if (!v20)
        {
          while (1)
          {
            v13 = v21 + 1;
            if (__OFADD__(v21, 1))
              goto LABEL_43;
            if (v13 >= v35)
              goto LABEL_34;
            v20 = *(_QWORD *)(v36 + 8 * v13);
            ++v21;
            if (v20)
              goto LABEL_21;
          }
        }
        v13 = v21;
      }
    }
LABEL_21:
    v10 = (v20 - 1) & v20;
    v17 = __clz(__rbit64(v20)) + (v13 << 6);
LABEL_22:
    v22 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v17);
    v24 = *v22;
    v23 = v22[1];
    v25 = (__int128 *)(*(_QWORD *)(v5 + 56) + 40 * v17);
    if ((v37 & 1) != 0)
    {
      sub_243946A88(v25, (uint64_t)v38);
    }
    else
    {
      sub_243946A44((uint64_t)v25, (uint64_t)v38);
      swift_bridgeObjectRetain();
    }
    sub_24396FFF8();
    sub_24396FB84();
    result = sub_243970010();
    v26 = -1 << *(_BYTE *)(v7 + 32);
    v27 = result & ~v26;
    v28 = v27 >> 6;
    if (((-1 << v27) & ~*(_QWORD *)(v11 + 8 * (v27 >> 6))) != 0)
    {
      v14 = __clz(__rbit64((-1 << v27) & ~*(_QWORD *)(v11 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v29 = 0;
      v30 = (unint64_t)(63 - v26) >> 6;
      do
      {
        if (++v28 == v30 && (v29 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        v31 = v28 == v30;
        if (v28 == v30)
          v28 = 0;
        v29 |= v31;
        v32 = *(_QWORD *)(v11 + 8 * v28);
      }
      while (v32 == -1);
      v14 = __clz(__rbit64(~v32)) + (v28 << 6);
    }
    *(_QWORD *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
    v15 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v14);
    *v15 = v24;
    v15[1] = v23;
    result = sub_243946A88(v38, *(_QWORD *)(v7 + 56) + 40 * v14);
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v34;
  v19 = (_QWORD *)(v5 + 64);
  if ((v37 & 1) == 0)
    goto LABEL_41;
LABEL_37:
  v33 = 1 << *(_BYTE *)(v5 + 32);
  if (v33 >= 64)
    bzero(v19, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v19 = -1 << v33;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_41:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_243944674(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  uint64_t v12;
  uint64_t result;
  int64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  _QWORD *v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  _QWORD *v23;
  unint64_t v24;
  int64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  char v37;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2572D9DC0);
  v37 = a2;
  v6 = sub_24396FF44();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v35 = v2;
  v36 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v11 = (unint64_t)(v8 + 63) >> 6;
  v12 = v6 + 64;
  result = swift_retain();
  v14 = 0;
  while (1)
  {
    if (v10)
    {
      v20 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v21 = v20 | (v14 << 6);
      goto LABEL_31;
    }
    v22 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v11)
      break;
    v23 = (_QWORD *)(v5 + 64);
    v24 = *(_QWORD *)(v36 + 8 * v22);
    ++v14;
    if (!v24)
    {
      v14 = v22 + 1;
      if (v22 + 1 >= v11)
        goto LABEL_33;
      v24 = *(_QWORD *)(v36 + 8 * v14);
      if (!v24)
      {
        v25 = v22 + 2;
        if (v25 >= v11)
        {
LABEL_33:
          swift_release();
          v3 = v35;
          if ((v37 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v24 = *(_QWORD *)(v36 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            v14 = v25 + 1;
            if (__OFADD__(v25, 1))
              goto LABEL_42;
            if (v14 >= v11)
              goto LABEL_33;
            v24 = *(_QWORD *)(v36 + 8 * v14);
            ++v25;
            if (v24)
              goto LABEL_30;
          }
        }
        v14 = v25;
      }
    }
LABEL_30:
    v10 = (v24 - 1) & v24;
    v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_31:
    v30 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v21);
    v32 = *v30;
    v31 = v30[1];
    v33 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + 8 * v21);
    if ((v37 & 1) == 0)
      swift_bridgeObjectRetain();
    sub_24396FFF8();
    sub_24396FB84();
    result = sub_243970010();
    v15 = -1 << *(_BYTE *)(v7 + 32);
    v16 = result & ~v15;
    v17 = v16 >> 6;
    if (((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      v18 = __clz(__rbit64((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v26 = 0;
      v27 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v28 = v17 == v27;
        if (v17 == v27)
          v17 = 0;
        v26 |= v28;
        v29 = *(_QWORD *)(v12 + 8 * v17);
      }
      while (v29 == -1);
      v18 = __clz(__rbit64(~v29)) + (v17 << 6);
    }
    *(_QWORD *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    v19 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v18);
    *v19 = v32;
    v19[1] = v31;
    *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v18) = v33;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v35;
  v23 = (_QWORD *)(v5 + 64);
  if ((v37 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v34 = 1 << *(_BYTE *)(v5 + 32);
  if (v34 >= 64)
    bzero(v23, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v23 = -1 << v34;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_243944978(uint64_t a1, char a2)
{
  return sub_243944984(a1, a2, &qword_2572D9D90);
}

uint64_t sub_243944984(uint64_t a1, char a2, uint64_t *a3)
{
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t result;
  int64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  _QWORD *v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  _QWORD *v23;
  unint64_t v24;
  int64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t *v36;
  int64_t v37;
  uint64_t v38;
  char v39;

  v4 = v3;
  v6 = *v3;
  __swift_instantiateConcreteTypeFromMangledName(a3);
  v39 = a2;
  v7 = sub_24396FF44();
  v8 = v7;
  if (!*(_QWORD *)(v6 + 16))
    goto LABEL_40;
  v9 = 1 << *(_BYTE *)(v6 + 32);
  v38 = v6 + 64;
  if (v9 < 64)
    v10 = ~(-1 << v9);
  else
    v10 = -1;
  v11 = v10 & *(_QWORD *)(v6 + 64);
  v36 = v3;
  v37 = (unint64_t)(v9 + 63) >> 6;
  v12 = v7 + 64;
  result = swift_retain();
  v14 = 0;
  while (1)
  {
    if (v11)
    {
      v20 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      v21 = v20 | (v14 << 6);
      goto LABEL_31;
    }
    v22 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v37)
      break;
    v23 = (_QWORD *)(v6 + 64);
    v24 = *(_QWORD *)(v38 + 8 * v22);
    ++v14;
    if (!v24)
    {
      v14 = v22 + 1;
      if (v22 + 1 >= v37)
        goto LABEL_33;
      v24 = *(_QWORD *)(v38 + 8 * v14);
      if (!v24)
      {
        v25 = v22 + 2;
        if (v25 >= v37)
        {
LABEL_33:
          swift_release();
          v4 = v36;
          if ((v39 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v24 = *(_QWORD *)(v38 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            v14 = v25 + 1;
            if (__OFADD__(v25, 1))
              goto LABEL_42;
            if (v14 >= v37)
              goto LABEL_33;
            v24 = *(_QWORD *)(v38 + 8 * v14);
            ++v25;
            if (v24)
              goto LABEL_30;
          }
        }
        v14 = v25;
      }
    }
LABEL_30:
    v11 = (v24 - 1) & v24;
    v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_31:
    v30 = (uint64_t *)(*(_QWORD *)(v6 + 48) + 16 * v21);
    v32 = *v30;
    v31 = v30[1];
    v33 = *(void **)(*(_QWORD *)(v6 + 56) + 8 * v21);
    if ((v39 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      v34 = v33;
    }
    sub_24396FFF8();
    sub_24396FB84();
    result = sub_243970010();
    v15 = -1 << *(_BYTE *)(v8 + 32);
    v16 = result & ~v15;
    v17 = v16 >> 6;
    if (((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      v18 = __clz(__rbit64((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v26 = 0;
      v27 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v28 = v17 == v27;
        if (v17 == v27)
          v17 = 0;
        v26 |= v28;
        v29 = *(_QWORD *)(v12 + 8 * v17);
      }
      while (v29 == -1);
      v18 = __clz(__rbit64(~v29)) + (v17 << 6);
    }
    *(_QWORD *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    v19 = (_QWORD *)(*(_QWORD *)(v8 + 48) + 16 * v18);
    *v19 = v32;
    v19[1] = v31;
    *(_QWORD *)(*(_QWORD *)(v8 + 56) + 8 * v18) = v33;
    ++*(_QWORD *)(v8 + 16);
  }
  swift_release();
  v4 = v36;
  v23 = (_QWORD *)(v6 + 64);
  if ((v39 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v35 = 1 << *(_BYTE *)(v6 + 32);
  if (v35 >= 64)
    bzero(v23, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v23 = -1 << v35;
  *(_QWORD *)(v6 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v4 = v8;
  return result;
}

void *sub_243944C8C()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  int64_t v25;
  unint64_t v26;
  int64_t v27;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2572D9DF8);
  v2 = *v0;
  v3 = sub_24396FF38();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v25 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v25 >= v13)
      goto LABEL_26;
    v26 = *(_QWORD *)(v6 + 8 * v25);
    ++v9;
    if (!v26)
    {
      v9 = v25 + 1;
      if (v25 + 1 >= v13)
        goto LABEL_26;
      v26 = *(_QWORD *)(v6 + 8 * v9);
      if (!v26)
        break;
    }
LABEL_25:
    v12 = (v26 - 1) & v26;
    v15 = __clz(__rbit64(v26)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + v16);
    v19 = *v17;
    v18 = v17[1];
    v20 = (uint64_t *)(*(_QWORD *)(v2 + 56) + v16);
    v21 = *v20;
    v22 = v20[1];
    v23 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v23 = v19;
    v23[1] = v18;
    v24 = (_QWORD *)(*(_QWORD *)(v4 + 56) + v16);
    *v24 = v21;
    v24[1] = v22;
    swift_bridgeObjectRetain();
    result = (void *)swift_bridgeObjectRetain();
  }
  v27 = v25 + 2;
  if (v27 >= v13)
    goto LABEL_26;
  v26 = *(_QWORD *)(v6 + 8 * v27);
  if (v26)
  {
    v9 = v27;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v27 + 1;
    if (__OFADD__(v27, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v26 = *(_QWORD *)(v6 + 8 * v9);
    ++v27;
    if (v26)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for ConfigManager(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

void destroy for ShadowEvaluationManager(id *a1)
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)(a1 + 43));

}

uint64_t initializeWithCopy for ShadowEvaluationManager(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  void (*v28)(uint64_t, uint64_t, uint64_t);
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v4 = *(void **)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  v31 = v4;
  v32 = *(void **)(a2 + 32);
  v33 = *(void **)(a2 + 40);
  *(_QWORD *)(a1 + 32) = v32;
  *(_QWORD *)(a1 + 40) = v33;
  v34 = *(void **)(a2 + 48);
  *(_QWORD *)(a1 + 48) = v34;
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  *(_WORD *)(a1 + 57) = *(_WORD *)(a2 + 57);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_BYTE *)(a1 + 72) = *(_BYTE *)(a2 + 72);
  *(_WORD *)(a1 + 73) = *(_WORD *)(a2 + 73);
  v5 = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = v5;
  v6 = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = v6;
  v7 = *(_QWORD *)(a2 + 120);
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 120) = v7;
  v8 = *(_QWORD *)(a2 + 136);
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  *(_QWORD *)(a1 + 136) = v8;
  v9 = *(_QWORD *)(a2 + 152);
  *(_QWORD *)(a1 + 144) = *(_QWORD *)(a2 + 144);
  *(_QWORD *)(a1 + 152) = v9;
  v10 = *(_QWORD *)(a2 + 168);
  *(_QWORD *)(a1 + 160) = *(_QWORD *)(a2 + 160);
  *(_QWORD *)(a1 + 168) = v10;
  v11 = *(_QWORD *)(a2 + 184);
  *(_QWORD *)(a1 + 176) = *(_QWORD *)(a2 + 176);
  *(_QWORD *)(a1 + 184) = v11;
  v12 = *(_QWORD *)(a2 + 200);
  *(_QWORD *)(a1 + 192) = *(_QWORD *)(a2 + 192);
  *(_QWORD *)(a1 + 200) = v12;
  v13 = *(_QWORD *)(a2 + 216);
  *(_QWORD *)(a1 + 208) = *(_QWORD *)(a2 + 208);
  *(_QWORD *)(a1 + 216) = v13;
  v14 = *(_QWORD *)(a2 + 232);
  *(_QWORD *)(a1 + 224) = *(_QWORD *)(a2 + 224);
  *(_QWORD *)(a1 + 232) = v14;
  v15 = *(_QWORD *)(a2 + 248);
  *(_QWORD *)(a1 + 240) = *(_QWORD *)(a2 + 240);
  *(_QWORD *)(a1 + 248) = v15;
  v16 = *(_QWORD *)(a2 + 264);
  *(_QWORD *)(a1 + 256) = *(_QWORD *)(a2 + 256);
  *(_QWORD *)(a1 + 264) = v16;
  *(_OWORD *)(a1 + 272) = *(_OWORD *)(a2 + 272);
  v17 = *(_QWORD *)(a2 + 296);
  *(_QWORD *)(a1 + 288) = *(_QWORD *)(a2 + 288);
  *(_QWORD *)(a1 + 296) = v17;
  *(_OWORD *)(a1 + 304) = *(_OWORD *)(a2 + 304);
  v18 = *(_QWORD *)(a2 + 328);
  *(_QWORD *)(a1 + 320) = *(_QWORD *)(a2 + 320);
  *(_QWORD *)(a1 + 328) = v18;
  *(_QWORD *)(a1 + 336) = *(_QWORD *)(a2 + 336);
  v29 = a2 + 344;
  v30 = a1 + 344;
  v19 = *(_OWORD *)(a2 + 368);
  *(_OWORD *)(a1 + 368) = v19;
  v20 = v19;
  v28 = **(void (***)(uint64_t, uint64_t, uint64_t))(v19 - 8);
  swift_bridgeObjectRetain();
  v21 = v31;
  v22 = v32;
  v23 = v33;
  v24 = v34;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v28(v30, v29, v20);
  v25 = *(void **)(a2 + 384);
  *(_QWORD *)(a1 + 384) = v25;
  v26 = v25;
  return a1;
}

uint64_t assignWithCopy for ShadowEvaluationManager(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = *(void **)(a2 + 24);
  v5 = *(void **)(a1 + 24);
  *(_QWORD *)(a1 + 24) = v4;
  v6 = v4;

  v7 = *(void **)(a2 + 32);
  v8 = *(void **)(a1 + 32);
  *(_QWORD *)(a1 + 32) = v7;
  v9 = v7;

  v10 = *(void **)(a2 + 40);
  v11 = *(void **)(a1 + 40);
  *(_QWORD *)(a1 + 40) = v10;
  v12 = v10;

  v13 = *(void **)(a2 + 48);
  v14 = *(void **)(a1 + 48);
  *(_QWORD *)(a1 + 48) = v13;
  v15 = v13;

  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  *(_BYTE *)(a1 + 57) = *(_BYTE *)(a2 + 57);
  *(_BYTE *)(a1 + 58) = *(_BYTE *)(a2 + 58);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_BYTE *)(a1 + 72) = *(_BYTE *)(a2 + 72);
  *(_BYTE *)(a1 + 73) = *(_BYTE *)(a2 + 73);
  *(_BYTE *)(a1 + 74) = *(_BYTE *)(a2 + 74);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  *(_QWORD *)(a1 + 136) = *(_QWORD *)(a2 + 136);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 144) = *(_QWORD *)(a2 + 144);
  *(_QWORD *)(a1 + 152) = *(_QWORD *)(a2 + 152);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 160) = *(_QWORD *)(a2 + 160);
  *(_QWORD *)(a1 + 168) = *(_QWORD *)(a2 + 168);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 176) = *(_QWORD *)(a2 + 176);
  *(_QWORD *)(a1 + 184) = *(_QWORD *)(a2 + 184);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 192) = *(_QWORD *)(a2 + 192);
  *(_QWORD *)(a1 + 200) = *(_QWORD *)(a2 + 200);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 208) = *(_QWORD *)(a2 + 208);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 216) = *(_QWORD *)(a2 + 216);
  *(_QWORD *)(a1 + 224) = *(_QWORD *)(a2 + 224);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 232) = *(_QWORD *)(a2 + 232);
  *(_QWORD *)(a1 + 240) = *(_QWORD *)(a2 + 240);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 248) = *(_QWORD *)(a2 + 248);
  *(_QWORD *)(a1 + 256) = *(_QWORD *)(a2 + 256);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 264) = *(_QWORD *)(a2 + 264);
  *(_QWORD *)(a1 + 272) = *(_QWORD *)(a2 + 272);
  *(_QWORD *)(a1 + 280) = *(_QWORD *)(a2 + 280);
  *(_QWORD *)(a1 + 288) = *(_QWORD *)(a2 + 288);
  *(_QWORD *)(a1 + 296) = *(_QWORD *)(a2 + 296);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 304) = *(_QWORD *)(a2 + 304);
  *(_QWORD *)(a1 + 312) = *(_QWORD *)(a2 + 312);
  *(_QWORD *)(a1 + 320) = *(_QWORD *)(a2 + 320);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 328) = *(_QWORD *)(a2 + 328);
  *(_QWORD *)(a1 + 336) = *(_QWORD *)(a2 + 336);
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 344), (uint64_t *)(a2 + 344));
  v16 = *(void **)(a1 + 384);
  v17 = *(void **)(a2 + 384);
  *(_QWORD *)(a1 + 384) = v17;
  v18 = v17;

  return a1;
}

uint64_t *__swift_assign_boxed_opaque_existential_1(uint64_t *result, uint64_t *a2)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE v11[24];

  if (result != a2)
  {
    v3 = result;
    v4 = result[3];
    v5 = a2[3];
    if (v4 == v5)
    {
      v9 = *(_QWORD *)(v4 - 8);
      if ((*(_BYTE *)(v9 + 82) & 2) != 0)
      {
        v10 = *a2;
        swift_retain();
        result = (uint64_t *)swift_release();
        *v3 = v10;
      }
      else
      {
        return (uint64_t *)(*(uint64_t (**)(uint64_t *, uint64_t *, uint64_t))(v9 + 24))(result, a2, result[3]);
      }
    }
    else
    {
      result[3] = v5;
      result[4] = a2[4];
      v6 = *(_QWORD *)(v4 - 8);
      v7 = *(_QWORD *)(v5 - 8);
      v8 = *(_DWORD *)(v7 + 80);
      if ((*(_BYTE *)(v6 + 82) & 2) != 0)
      {
        if ((v8 & 0x20000) != 0)
        {
          *result = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(result, a2, v5);
        }
        return (uint64_t *)swift_release();
      }
      else
      {
        (*(void (**)(_BYTE *, uint64_t *, uint64_t))(v6 + 32))(v11, result, v4);
        if ((v8 & 0x20000) != 0)
        {
          *v3 = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(v3, a2, v5);
        }
        return (uint64_t *)(*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v11, v4);
      }
    }
  }
  return result;
}

void *__swift_memcpy392_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x188uLL);
}

uint64_t assignWithTake for ShadowEvaluationManager(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  void *v21;
  uint64_t v22;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v4;
  swift_bridgeObjectRelease();
  v5 = *(void **)(a1 + 24);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);

  v6 = *(void **)(a1 + 32);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);

  v7 = *(void **)(a1 + 40);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);

  v8 = *(void **)(a1 + 48);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);

  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  *(_BYTE *)(a1 + 57) = *(_BYTE *)(a2 + 57);
  *(_BYTE *)(a1 + 58) = *(_BYTE *)(a2 + 58);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_BYTE *)(a1 + 72) = *(_BYTE *)(a2 + 72);
  *(_BYTE *)(a1 + 73) = *(_BYTE *)(a2 + 73);
  *(_BYTE *)(a1 + 74) = *(_BYTE *)(a2 + 74);
  v9 = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = v9;
  swift_bridgeObjectRelease();
  v10 = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = v10;
  swift_bridgeObjectRelease();
  v11 = *(_QWORD *)(a2 + 120);
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 120) = v11;
  swift_bridgeObjectRelease();
  v12 = *(_QWORD *)(a2 + 136);
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  *(_QWORD *)(a1 + 136) = v12;
  swift_bridgeObjectRelease();
  v13 = *(_QWORD *)(a2 + 152);
  *(_QWORD *)(a1 + 144) = *(_QWORD *)(a2 + 144);
  *(_QWORD *)(a1 + 152) = v13;
  swift_bridgeObjectRelease();
  v14 = *(_QWORD *)(a2 + 168);
  *(_QWORD *)(a1 + 160) = *(_QWORD *)(a2 + 160);
  *(_QWORD *)(a1 + 168) = v14;
  swift_bridgeObjectRelease();
  v15 = *(_QWORD *)(a2 + 184);
  *(_QWORD *)(a1 + 176) = *(_QWORD *)(a2 + 176);
  *(_QWORD *)(a1 + 184) = v15;
  swift_bridgeObjectRelease();
  v16 = *(_QWORD *)(a2 + 200);
  *(_QWORD *)(a1 + 192) = *(_QWORD *)(a2 + 192);
  *(_QWORD *)(a1 + 200) = v16;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 208) = *(_QWORD *)(a2 + 208);
  swift_bridgeObjectRelease();
  v17 = *(_QWORD *)(a2 + 224);
  *(_QWORD *)(a1 + 216) = *(_QWORD *)(a2 + 216);
  *(_QWORD *)(a1 + 224) = v17;
  swift_bridgeObjectRelease();
  v18 = *(_QWORD *)(a2 + 240);
  *(_QWORD *)(a1 + 232) = *(_QWORD *)(a2 + 232);
  *(_QWORD *)(a1 + 240) = v18;
  swift_bridgeObjectRelease();
  v19 = *(_QWORD *)(a2 + 256);
  *(_QWORD *)(a1 + 248) = *(_QWORD *)(a2 + 248);
  *(_QWORD *)(a1 + 256) = v19;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 264) = *(_QWORD *)(a2 + 264);
  *(_QWORD *)(a1 + 272) = *(_QWORD *)(a2 + 272);
  *(_OWORD *)(a1 + 280) = *(_OWORD *)(a2 + 280);
  *(_QWORD *)(a1 + 296) = *(_QWORD *)(a2 + 296);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 304) = *(_OWORD *)(a2 + 304);
  *(_QWORD *)(a1 + 320) = *(_QWORD *)(a2 + 320);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 328) = *(_QWORD *)(a2 + 328);
  *(_QWORD *)(a1 + 336) = *(_QWORD *)(a2 + 336);
  __swift_destroy_boxed_opaque_existential_1Tm(a1 + 344);
  v20 = *(_OWORD *)(a2 + 360);
  *(_OWORD *)(a1 + 344) = *(_OWORD *)(a2 + 344);
  *(_OWORD *)(a1 + 360) = v20;
  v21 = *(void **)(a1 + 384);
  v22 = *(_QWORD *)(a2 + 384);
  *(_QWORD *)(a1 + 376) = *(_QWORD *)(a2 + 376);
  *(_QWORD *)(a1 + 384) = v22;

  return a1;
}

uint64_t getEnumTagSinglePayload for ShadowEvaluationManager(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 392))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ShadowEvaluationManager(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 248) = 0u;
    *(_OWORD *)(result + 232) = 0u;
    *(_OWORD *)(result + 216) = 0u;
    *(_OWORD *)(result + 200) = 0u;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 360) = 0u;
    *(_OWORD *)(result + 344) = 0u;
    *(_OWORD *)(result + 328) = 0u;
    *(_OWORD *)(result + 312) = 0u;
    *(_OWORD *)(result + 296) = 0u;
    *(_OWORD *)(result + 280) = 0u;
    *(_OWORD *)(result + 264) = 0u;
    *(_OWORD *)(result + 376) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 392) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 16) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 392) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for ShadowEvaluationManager()
{
  return &type metadata for ShadowEvaluationManager;
}

void *sub_24394589C()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  __int128 v24;
  uint64_t v25;
  int64_t v26;
  unint64_t v27;
  int64_t v28;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2572D9E60);
  v2 = *v0;
  v3 = sub_24396FF38();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v26 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v26 >= v13)
      goto LABEL_26;
    v27 = *(_QWORD *)(v6 + 8 * v26);
    ++v9;
    if (!v27)
    {
      v9 = v26 + 1;
      if (v26 + 1 >= v13)
        goto LABEL_26;
      v27 = *(_QWORD *)(v6 + 8 * v9);
      if (!v27)
        break;
    }
LABEL_25:
    v12 = (v27 - 1) & v27;
    v15 = __clz(__rbit64(v27)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v19 = *v17;
    v18 = v17[1];
    v20 = 24 * v15;
    v21 = *(_QWORD *)(v2 + 56) + v20;
    v22 = *(_QWORD *)v21;
    v23 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    v24 = *(_OWORD *)(v21 + 8);
    *v23 = v19;
    v23[1] = v18;
    v25 = *(_QWORD *)(v4 + 56) + v20;
    *(_QWORD *)v25 = v22;
    *(_OWORD *)(v25 + 8) = v24;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    result = (void *)swift_bridgeObjectRetain();
  }
  v28 = v26 + 2;
  if (v28 >= v13)
    goto LABEL_26;
  v27 = *(_QWORD *)(v6 + 8 * v28);
  if (v27)
  {
    v9 = v28;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v28 + 1;
    if (__OFADD__(v28, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v27 = *(_QWORD *)(v6 + 8 * v9);
    ++v28;
    if (v27)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

id sub_243945A80()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  void *v16;
  char v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2572D9E58);
  v2 = *v0;
  v3 = sub_24396FF38();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (id)swift_release();
    *v1 = v4;
    return result;
  }
  result = (id)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v18 >= v13)
      goto LABEL_26;
    v19 = *(_QWORD *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      v9 = v18 + 1;
      if (v18 + 1 >= v13)
        goto LABEL_26;
      v19 = *(_QWORD *)(v6 + 8 * v9);
      if (!v19)
        break;
    }
LABEL_25:
    v12 = (v19 - 1) & v19;
    v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    v16 = *(void **)(*(_QWORD *)(v2 + 48) + 8 * v15);
    v17 = *(_BYTE *)(*(_QWORD *)(v2 + 56) + v15);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v15) = v16;
    *(_BYTE *)(*(_QWORD *)(v4 + 56) + v15) = v17;
    result = v16;
  }
  v20 = v18 + 2;
  if (v20 >= v13)
    goto LABEL_26;
  v19 = *(_QWORD *)(v6 + 8 * v20);
  if (v19)
  {
    v9 = v20;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v19 = *(_QWORD *)(v6 + 8 * v9);
    ++v20;
    if (v19)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_243945C20()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  void *v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  id v27;
  int64_t v28;
  unint64_t v29;
  int64_t v30;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2572D9E28);
  v2 = *v0;
  v3 = sub_24396FF38();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v28 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v28 >= v13)
      goto LABEL_26;
    v29 = *(_QWORD *)(v6 + 8 * v28);
    ++v9;
    if (!v29)
    {
      v9 = v28 + 1;
      if (v28 + 1 >= v13)
        goto LABEL_26;
      v29 = *(_QWORD *)(v6 + 8 * v9);
      if (!v29)
        break;
    }
LABEL_25:
    v12 = (v29 - 1) & v29;
    v15 = __clz(__rbit64(v29)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v18 = *v17;
    v19 = v17[1];
    v20 = 24 * v15;
    v21 = *(_QWORD *)(v2 + 56) + v20;
    v22 = *(_DWORD *)v21;
    v23 = *(void **)(v21 + 8);
    v24 = *(_QWORD *)(v21 + 16);
    v25 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v25 = v18;
    v25[1] = v19;
    v26 = *(_QWORD *)(v4 + 56) + v20;
    *(_DWORD *)v26 = v22;
    *(_QWORD *)(v26 + 8) = v23;
    *(_QWORD *)(v26 + 16) = v24;
    v27 = v23;
    swift_bridgeObjectRetain();
    result = (void *)swift_bridgeObjectRetain();
  }
  v30 = v28 + 2;
  if (v30 >= v13)
    goto LABEL_26;
  v29 = *(_QWORD *)(v6 + 8 * v30);
  if (v29)
  {
    v9 = v30;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v30 + 1;
    if (__OFADD__(v30, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v29 = *(_QWORD *)(v6 + 8 * v9);
    ++v30;
    if (v29)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

id sub_243945DF8()
{
  return sub_24394689C(&qword_2572D9E20);
}

void *sub_243945E04()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  id v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2572D9E30);
  v2 = *v0;
  v3 = sub_24396FF38();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v13)
      goto LABEL_26;
    v21 = *(_QWORD *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      v9 = v20 + 1;
      if (v20 + 1 >= v13)
        goto LABEL_26;
      v21 = *(_QWORD *)(v6 + 8 * v9);
      if (!v21)
        break;
    }
LABEL_25:
    v12 = (v21 - 1) & v21;
    v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    v16 = 8 * v15;
    v17 = *(void **)(*(_QWORD *)(v2 + 48) + v16);
    v18 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = v17;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v16) = v18;
    v19 = v17;
    result = (void *)swift_bridgeObjectRetain();
  }
  v22 = v20 + 2;
  if (v22 >= v13)
    goto LABEL_26;
  v21 = *(_QWORD *)(v6 + 8 * v22);
  if (v21)
  {
    v9 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v21 = *(_QWORD *)(v6 + 8 * v9);
    ++v22;
    if (v21)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_243945FAC()
{
  return sub_24394617C(&qword_2572D9DA0);
}

void *sub_243945FB8()
{
  return sub_24394617C(&qword_2572D9D98);
}

void *sub_243945FC4()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  int64_t v23;
  unint64_t v24;
  int64_t v25;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2572D9DB8);
  v2 = *v0;
  v3 = sub_24396FF38();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v23 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v23 >= v13)
      goto LABEL_26;
    v24 = *(_QWORD *)(v6 + 8 * v23);
    ++v9;
    if (!v24)
    {
      v9 = v23 + 1;
      if (v23 + 1 >= v13)
        goto LABEL_26;
      v24 = *(_QWORD *)(v6 + 8 * v9);
      if (!v24)
        break;
    }
LABEL_25:
    v12 = (v24 - 1) & v24;
    v15 = __clz(__rbit64(v24)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v19 = *v17;
    v18 = v17[1];
    v20 = 8 * v15;
    v21 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + v20);
    v22 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v22 = v19;
    v22[1] = v18;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v20) = v21;
    result = (void *)swift_bridgeObjectRetain();
  }
  v25 = v23 + 2;
  if (v25 >= v13)
    goto LABEL_26;
  v24 = *(_QWORD *)(v6 + 8 * v25);
  if (v24)
  {
    v9 = v25;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v25 + 1;
    if (__OFADD__(v25, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v24 = *(_QWORD *)(v6 + 8 * v9);
    ++v25;
    if (v24)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_243946170()
{
  return sub_24394617C(&qword_2572D9DB0);
}

void *sub_24394617C(uint64_t *a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *result;
  uint64_t v7;
  unint64_t v8;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  int64_t v23;
  unint64_t v24;
  int64_t v25;

  v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(a1);
  v3 = *v1;
  v4 = sub_24396FF38();
  v5 = v4;
  if (!*(_QWORD *)(v3 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v2 = v5;
    return result;
  }
  result = (void *)(v4 + 64);
  v7 = v3 + 64;
  v8 = (unint64_t)((1 << *(_BYTE *)(v5 + 32)) + 63) >> 6;
  if (v5 != v3 || (unint64_t)result >= v3 + 64 + 8 * v8)
    result = memmove(result, (const void *)(v3 + 64), 8 * v8);
  v10 = 0;
  *(_QWORD *)(v5 + 16) = *(_QWORD *)(v3 + 16);
  v11 = 1 << *(_BYTE *)(v3 + 32);
  v12 = -1;
  if (v11 < 64)
    v12 = ~(-1 << v11);
  v13 = v12 & *(_QWORD *)(v3 + 64);
  v14 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      v16 = v15 | (v10 << 6);
      goto LABEL_12;
    }
    v23 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v23 >= v14)
      goto LABEL_26;
    v24 = *(_QWORD *)(v7 + 8 * v23);
    ++v10;
    if (!v24)
    {
      v10 = v23 + 1;
      if (v23 + 1 >= v14)
        goto LABEL_26;
      v24 = *(_QWORD *)(v7 + 8 * v10);
      if (!v24)
        break;
    }
LABEL_25:
    v13 = (v24 - 1) & v24;
    v16 = __clz(__rbit64(v24)) + (v10 << 6);
LABEL_12:
    v17 = 16 * v16;
    v18 = (_QWORD *)(*(_QWORD *)(v3 + 48) + 16 * v16);
    v19 = v18[1];
    v20 = 8 * v16;
    v21 = *(_QWORD *)(*(_QWORD *)(v3 + 56) + v20);
    v22 = (_QWORD *)(*(_QWORD *)(v5 + 48) + v17);
    *v22 = *v18;
    v22[1] = v19;
    *(_QWORD *)(*(_QWORD *)(v5 + 56) + v20) = v21;
    swift_bridgeObjectRetain();
    result = (void *)swift_bridgeObjectRetain();
  }
  v25 = v23 + 2;
  if (v25 >= v14)
    goto LABEL_26;
  v24 = *(_QWORD *)(v7 + 8 * v25);
  if (v24)
  {
    v10 = v25;
    goto LABEL_25;
  }
  while (1)
  {
    v10 = v25 + 1;
    if (__OFADD__(v25, 1))
      break;
    if (v10 >= v14)
      goto LABEL_26;
    v24 = *(_QWORD *)(v7 + 8 * v10);
    ++v25;
    if (v24)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_243946328()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  _QWORD *v27;
  int64_t v28;
  unint64_t v29;
  int64_t v30;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2572D9DA8);
  v2 = *v0;
  v3 = sub_24396FF38();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v28 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v28 >= v13)
      goto LABEL_26;
    v29 = *(_QWORD *)(v6 + 8 * v28);
    ++v9;
    if (!v29)
    {
      v9 = v28 + 1;
      if (v28 + 1 >= v13)
        goto LABEL_26;
      v29 = *(_QWORD *)(v6 + 8 * v9);
      if (!v29)
        break;
    }
LABEL_25:
    v12 = (v29 - 1) & v29;
    v15 = __clz(__rbit64(v29)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v19 = *v17;
    v18 = v17[1];
    v20 = 32 * v15;
    v21 = (uint64_t *)(*(_QWORD *)(v2 + 56) + v20);
    v22 = *v21;
    v23 = v21[1];
    v24 = v21[2];
    v25 = v21[3];
    v26 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v26 = v19;
    v26[1] = v18;
    v27 = (_QWORD *)(*(_QWORD *)(v4 + 56) + v20);
    *v27 = v22;
    v27[1] = v23;
    v27[2] = v24;
    v27[3] = v25;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    result = (void *)swift_bridgeObjectRetain();
  }
  v30 = v28 + 2;
  if (v30 >= v13)
    goto LABEL_26;
  v29 = *(_QWORD *)(v6 + 8 * v30);
  if (v29)
  {
    v9 = v30;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v30 + 1;
    if (__OFADD__(v30, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v29 = *(_QWORD *)(v6 + 8 * v9);
    ++v30;
    if (v29)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_2439464FC()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;
  uint64_t *v25;
  __int128 v26[2];

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2572D9DC8);
  v2 = *v0;
  v3 = sub_24396FF38();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = (void *)swift_release();
LABEL_28:
    *v1 = v4;
    return result;
  }
  v25 = v1;
  result = (void *)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v22 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      v9 = v22 + 1;
      if (v22 + 1 >= v13)
        goto LABEL_26;
      v23 = *(_QWORD *)(v6 + 8 * v9);
      if (!v23)
        break;
    }
LABEL_25:
    v12 = (v23 - 1) & v23;
    v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v19 = *v17;
    v18 = v17[1];
    v20 = 40 * v15;
    sub_243946A44(*(_QWORD *)(v2 + 56) + 40 * v15, (uint64_t)v26);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = v19;
    v21[1] = v18;
    sub_243946A88(v26, *(_QWORD *)(v4 + 56) + v20);
    result = (void *)swift_bridgeObjectRetain();
  }
  v24 = v22 + 2;
  if (v24 >= v13)
  {
LABEL_26:
    result = (void *)swift_release();
    v1 = v25;
    goto LABEL_28;
  }
  v23 = *(_QWORD *)(v6 + 8 * v24);
  if (v23)
  {
    v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v24 + 1;
    if (__OFADD__(v24, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v9);
    ++v24;
    if (v23)
      goto LABEL_25;
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_2439466E4()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2572D9DC0);
  v2 = *v0;
  v3 = sub_24396FF38();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      v9 = v22 + 1;
      if (v22 + 1 >= v13)
        goto LABEL_26;
      v23 = *(_QWORD *)(v6 + 8 * v9);
      if (!v23)
        break;
    }
LABEL_25:
    v12 = (v23 - 1) & v23;
    v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (_QWORD *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v18 = v17[1];
    v19 = 8 * v15;
    v20 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + v19);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = *v17;
    v21[1] = v18;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v19) = v20;
    result = (void *)swift_bridgeObjectRetain();
  }
  v24 = v22 + 2;
  if (v24 >= v13)
    goto LABEL_26;
  v23 = *(_QWORD *)(v6 + 8 * v24);
  if (v23)
  {
    v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v24 + 1;
    if (__OFADD__(v24, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v9);
    ++v24;
    if (v23)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

id sub_243946890()
{
  return sub_24394689C(&qword_2572D9D90);
}

id sub_24394689C(uint64_t *a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id result;
  uint64_t v7;
  unint64_t v8;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  _QWORD *v22;
  int64_t v23;
  unint64_t v24;
  int64_t v25;

  v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(a1);
  v3 = *v1;
  v4 = sub_24396FF38();
  v5 = v4;
  if (!*(_QWORD *)(v3 + 16))
  {
LABEL_26:
    result = (id)swift_release();
    *v2 = v5;
    return result;
  }
  result = (id)(v4 + 64);
  v7 = v3 + 64;
  v8 = (unint64_t)((1 << *(_BYTE *)(v5 + 32)) + 63) >> 6;
  if (v5 != v3 || (unint64_t)result >= v3 + 64 + 8 * v8)
    result = memmove(result, (const void *)(v3 + 64), 8 * v8);
  v10 = 0;
  *(_QWORD *)(v5 + 16) = *(_QWORD *)(v3 + 16);
  v11 = 1 << *(_BYTE *)(v3 + 32);
  v12 = -1;
  if (v11 < 64)
    v12 = ~(-1 << v11);
  v13 = v12 & *(_QWORD *)(v3 + 64);
  v14 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      v16 = v15 | (v10 << 6);
      goto LABEL_12;
    }
    v23 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v23 >= v14)
      goto LABEL_26;
    v24 = *(_QWORD *)(v7 + 8 * v23);
    ++v10;
    if (!v24)
    {
      v10 = v23 + 1;
      if (v23 + 1 >= v14)
        goto LABEL_26;
      v24 = *(_QWORD *)(v7 + 8 * v10);
      if (!v24)
        break;
    }
LABEL_25:
    v13 = (v24 - 1) & v24;
    v16 = __clz(__rbit64(v24)) + (v10 << 6);
LABEL_12:
    v17 = 16 * v16;
    v18 = (_QWORD *)(*(_QWORD *)(v3 + 48) + 16 * v16);
    v19 = v18[1];
    v20 = 8 * v16;
    v21 = *(void **)(*(_QWORD *)(v3 + 56) + v20);
    v22 = (_QWORD *)(*(_QWORD *)(v5 + 48) + v17);
    *v22 = *v18;
    v22[1] = v19;
    *(_QWORD *)(*(_QWORD *)(v5 + 56) + v20) = v21;
    swift_bridgeObjectRetain();
    result = v21;
  }
  v25 = v23 + 2;
  if (v25 >= v14)
    goto LABEL_26;
  v24 = *(_QWORD *)(v7 + 8 * v25);
  if (v24)
  {
    v10 = v25;
    goto LABEL_25;
  }
  while (1)
  {
    v10 = v25 + 1;
    if (__OFADD__(v25, 1))
      break;
    if (v10 >= v14)
      goto LABEL_26;
    v24 = *(_QWORD *)(v7 + 8 * v10);
    ++v25;
    if (v24)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_243946A44(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_243946A88(__int128 *a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;

  v2 = *a1;
  v3 = a1[1];
  *(_QWORD *)(a2 + 32) = *((_QWORD *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

_OWORD *sub_243946AA0(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_243946AB0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t __swift_destroy_boxed_opaque_existential_1Tm(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_243946B14(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_243946B54(_QWORD **a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5[2];

  v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = (_QWORD *)sub_24395F488(v2);
  v3 = v2[2];
  v5[0] = (uint64_t)(v2 + 4);
  v5[1] = v3;
  result = sub_243946BBC(v5);
  *a1 = v2;
  return result;
}

uint64_t sub_243946BBC(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  unint64_t v13;
  uint64_t v14;
  double v15;
  double v16;
  double *v17;
  double v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  double *v28;
  double v29;
  uint64_t v30;
  double *v31;
  double v32;
  unint64_t v33;
  unint64_t v34;
  char *v35;
  char *v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  BOOL v48;
  unint64_t v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  BOOL v58;
  uint64_t v59;
  char v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  BOOL v65;
  uint64_t v66;
  uint64_t v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  unint64_t v76;
  char *v77;
  char *v78;
  uint64_t v79;
  char *v80;
  uint64_t v81;
  unint64_t v82;
  char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t i;
  double v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  char *v93;
  uint64_t v94;
  unint64_t v95;
  char *v96;
  uint64_t v97;
  uint64_t v98;
  char *v99;
  unint64_t v100;
  uint64_t *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  double *__dst;

  v3 = a1[1];
  result = sub_24396FF74();
  if (result >= v3)
  {
    if (v3 < 0)
      goto LABEL_137;
    if ((unint64_t)v3 >= 2)
    {
      v84 = *a1;
      v85 = *a1 + 8;
      v86 = -1;
      for (i = 1; i != v3; ++i)
      {
        v88 = *(double *)(v84 + 16 * i + 8);
        v89 = v86;
        v90 = v85;
        do
        {
          if (*(double *)v90 >= v88)
            break;
          if (!v84)
            goto LABEL_141;
          v91 = *(_QWORD *)(v90 + 8);
          *(_OWORD *)(v90 + 8) = *(_OWORD *)(v90 - 8);
          *(_QWORD *)(v90 - 8) = v91;
          *(double *)v90 = v88;
          v90 -= 16;
        }
        while (!__CFADD__(v89++, 1));
        v85 += 16;
        --v86;
      }
    }
    return result;
  }
  if (v3 >= 0)
    v5 = v3;
  else
    v5 = v3 + 1;
  if (v3 < -1)
    goto LABEL_146;
  v6 = result;
  v101 = a1;
  if (v3 < 2)
  {
    v9 = MEMORY[0x24BEE4AF8];
    __dst = (double *)(MEMORY[0x24BEE4AF8] + 32);
    if (v3 != 1)
    {
      v13 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
      v12 = (char *)MEMORY[0x24BEE4AF8];
LABEL_103:
      v93 = v12;
      v103 = v9;
      if (v13 >= 2)
      {
        v94 = *v101;
        do
        {
          v95 = v13 - 2;
          if (v13 < 2)
            goto LABEL_132;
          if (!v94)
            goto LABEL_145;
          v96 = v93;
          v97 = *(_QWORD *)&v93[16 * v95 + 32];
          v98 = *(_QWORD *)&v93[16 * v13 + 24];
          sub_24394729C((double *)(v94 + 16 * v97), (double *)(v94 + 16 * *(_QWORD *)&v93[16 * v13 + 16]), v94 + 16 * v98, __dst);
          if (v1)
            break;
          if (v98 < v97)
            goto LABEL_133;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v96 = sub_24395E8C0((uint64_t)v96);
          if (v95 >= *((_QWORD *)v96 + 2))
            goto LABEL_134;
          v99 = &v96[16 * v95 + 32];
          *(_QWORD *)v99 = v97;
          *((_QWORD *)v99 + 1) = v98;
          v100 = *((_QWORD *)v96 + 2);
          if (v13 > v100)
            goto LABEL_135;
          memmove(&v96[16 * v13 + 16], &v96[16 * v13 + 32], 16 * (v100 - v13));
          v93 = v96;
          *((_QWORD *)v96 + 2) = v100 - 1;
          v13 = v100 - 1;
        }
        while (v100 > 2);
      }
LABEL_93:
      swift_bridgeObjectRelease();
      *(_QWORD *)(v103 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
    v103 = MEMORY[0x24BEE4AF8];
  }
  else
  {
    v7 = v5 >> 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2572D9E70);
    v8 = sub_24396FC44();
    *(_QWORD *)(v8 + 16) = v7;
    v103 = v8;
    __dst = (double *)(v8 + 32);
  }
  v10 = 0;
  v11 = *a1;
  v102 = *a1 + 40;
  v12 = (char *)MEMORY[0x24BEE4AF8];
  v104 = v6;
  v105 = v3;
  v106 = v11;
  while (1)
  {
    v14 = v10++;
    if (v10 < v3)
    {
      v15 = *(double *)(v11 + 16 * v10 + 8);
      v16 = *(double *)(v11 + 16 * v14 + 8);
      v10 = v14 + 2;
      if (v14 + 2 < v3)
      {
        v17 = (double *)(v102 + 16 * v14);
        v18 = v15;
        while (1)
        {
          v19 = v18;
          v18 = *v17;
          if (v16 < v15 == v19 >= *v17)
            break;
          ++v10;
          v17 += 2;
          if (v3 == v10)
          {
            v10 = v3;
            break;
          }
        }
      }
      if (v16 < v15)
      {
        if (v10 < v14)
          goto LABEL_138;
        if (v14 < v10)
        {
          v20 = 16 * v10;
          v21 = 16 * v14;
          v22 = v10;
          v23 = v14;
          do
          {
            if (v23 != --v22)
            {
              if (!v11)
                goto LABEL_144;
              v24 = v11 + v20;
              v25 = *(_QWORD *)(v11 + v21);
              v26 = *(_QWORD *)(v11 + v21 + 8);
              *(_OWORD *)(v11 + v21) = *(_OWORD *)(v11 + v20 - 16);
              *(_QWORD *)(v24 - 16) = v25;
              *(_QWORD *)(v24 - 8) = v26;
            }
            ++v23;
            v20 -= 16;
            v21 += 16;
          }
          while (v23 < v22);
        }
      }
    }
    if (v10 >= v3)
      goto LABEL_46;
    if (__OFSUB__(v10, v14))
      goto LABEL_136;
    if (v10 - v14 >= v6)
      goto LABEL_46;
    v27 = v14 + v6;
    if (__OFADD__(v14, v6))
      goto LABEL_139;
    if (v27 >= v3)
      v27 = v3;
    if (v27 < v14)
      break;
    if (v10 != v27)
    {
      v28 = (double *)(v11 + 16 * v10);
      do
      {
        v29 = *(double *)(v11 + 16 * v10 + 8);
        v30 = v14;
        v31 = v28;
        do
        {
          if (*(v31 - 1) >= v29)
            break;
          if (!v11)
            goto LABEL_142;
          v32 = *v31;
          *(_OWORD *)v31 = *((_OWORD *)v31 - 1);
          *(v31 - 1) = v29;
          *(v31 - 2) = v32;
          v31 -= 2;
          ++v30;
        }
        while (v10 != v30);
        ++v10;
        v28 += 2;
      }
      while (v10 != v27);
      v10 = v27;
    }
LABEL_46:
    if (v10 < v14)
      goto LABEL_131;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v12 = sub_24395E678(0, *((_QWORD *)v12 + 2) + 1, 1, v12);
    v34 = *((_QWORD *)v12 + 2);
    v33 = *((_QWORD *)v12 + 3);
    v13 = v34 + 1;
    v11 = v106;
    if (v34 >= v33 >> 1)
    {
      v83 = sub_24395E678((char *)(v33 > 1), v34 + 1, 1, v12);
      v11 = v106;
      v12 = v83;
    }
    *((_QWORD *)v12 + 2) = v13;
    v35 = v12 + 32;
    v36 = &v12[16 * v34 + 32];
    *(_QWORD *)v36 = v14;
    *((_QWORD *)v36 + 1) = v10;
    if (v34)
    {
      while (1)
      {
        v37 = v13 - 1;
        if (v13 >= 4)
        {
          v42 = &v35[16 * v13];
          v43 = *((_QWORD *)v42 - 8);
          v44 = *((_QWORD *)v42 - 7);
          v48 = __OFSUB__(v44, v43);
          v45 = v44 - v43;
          if (v48)
            goto LABEL_120;
          v47 = *((_QWORD *)v42 - 6);
          v46 = *((_QWORD *)v42 - 5);
          v48 = __OFSUB__(v46, v47);
          v40 = v46 - v47;
          v41 = v48;
          if (v48)
            goto LABEL_121;
          v49 = v13 - 2;
          v50 = &v35[16 * v13 - 32];
          v52 = *(_QWORD *)v50;
          v51 = *((_QWORD *)v50 + 1);
          v48 = __OFSUB__(v51, v52);
          v53 = v51 - v52;
          if (v48)
            goto LABEL_123;
          v48 = __OFADD__(v40, v53);
          v54 = v40 + v53;
          if (v48)
            goto LABEL_126;
          if (v54 >= v45)
          {
            v72 = &v35[16 * v37];
            v74 = *(_QWORD *)v72;
            v73 = *((_QWORD *)v72 + 1);
            v48 = __OFSUB__(v73, v74);
            v75 = v73 - v74;
            if (v48)
              goto LABEL_130;
            v65 = v40 < v75;
            goto LABEL_83;
          }
        }
        else
        {
          if (v13 != 3)
          {
            v66 = *((_QWORD *)v12 + 4);
            v67 = *((_QWORD *)v12 + 5);
            v48 = __OFSUB__(v67, v66);
            v59 = v67 - v66;
            v60 = v48;
            goto LABEL_77;
          }
          v39 = *((_QWORD *)v12 + 4);
          v38 = *((_QWORD *)v12 + 5);
          v48 = __OFSUB__(v38, v39);
          v40 = v38 - v39;
          v41 = v48;
        }
        if ((v41 & 1) != 0)
          goto LABEL_122;
        v49 = v13 - 2;
        v55 = &v35[16 * v13 - 32];
        v57 = *(_QWORD *)v55;
        v56 = *((_QWORD *)v55 + 1);
        v58 = __OFSUB__(v56, v57);
        v59 = v56 - v57;
        v60 = v58;
        if (v58)
          goto LABEL_125;
        v61 = &v35[16 * v37];
        v63 = *(_QWORD *)v61;
        v62 = *((_QWORD *)v61 + 1);
        v48 = __OFSUB__(v62, v63);
        v64 = v62 - v63;
        if (v48)
          goto LABEL_128;
        if (__OFADD__(v59, v64))
          goto LABEL_129;
        if (v59 + v64 >= v40)
        {
          v65 = v40 < v64;
LABEL_83:
          if (v65)
            v37 = v49;
          goto LABEL_85;
        }
LABEL_77:
        if ((v60 & 1) != 0)
          goto LABEL_124;
        v68 = &v35[16 * v37];
        v70 = *(_QWORD *)v68;
        v69 = *((_QWORD *)v68 + 1);
        v48 = __OFSUB__(v69, v70);
        v71 = v69 - v70;
        if (v48)
          goto LABEL_127;
        if (v71 < v59)
          goto LABEL_15;
LABEL_85:
        v76 = v37 - 1;
        if (v37 - 1 >= v13)
        {
          __break(1u);
LABEL_117:
          __break(1u);
LABEL_118:
          __break(1u);
LABEL_119:
          __break(1u);
LABEL_120:
          __break(1u);
LABEL_121:
          __break(1u);
LABEL_122:
          __break(1u);
LABEL_123:
          __break(1u);
LABEL_124:
          __break(1u);
LABEL_125:
          __break(1u);
LABEL_126:
          __break(1u);
LABEL_127:
          __break(1u);
LABEL_128:
          __break(1u);
LABEL_129:
          __break(1u);
LABEL_130:
          __break(1u);
LABEL_131:
          __break(1u);
LABEL_132:
          __break(1u);
LABEL_133:
          __break(1u);
LABEL_134:
          __break(1u);
LABEL_135:
          __break(1u);
LABEL_136:
          __break(1u);
LABEL_137:
          __break(1u);
LABEL_138:
          __break(1u);
LABEL_139:
          __break(1u);
          goto LABEL_140;
        }
        if (!v11)
          goto LABEL_143;
        v77 = v12;
        v78 = &v35[16 * v76];
        v79 = *(_QWORD *)v78;
        v80 = &v35[16 * v37];
        v81 = *((_QWORD *)v80 + 1);
        sub_24394729C((double *)(v11 + 16 * *(_QWORD *)v78), (double *)(v11 + 16 * *(_QWORD *)v80), v11 + 16 * v81, __dst);
        if (v1)
          goto LABEL_93;
        if (v81 < v79)
          goto LABEL_117;
        if (v37 > *((_QWORD *)v77 + 2))
          goto LABEL_118;
        *(_QWORD *)v78 = v79;
        *(_QWORD *)&v35[16 * v76 + 8] = v81;
        v82 = *((_QWORD *)v77 + 2);
        if (v37 >= v82)
          goto LABEL_119;
        v12 = v77;
        v13 = v82 - 1;
        memmove(&v35[16 * v37], v80 + 16, 16 * (v82 - 1 - v37));
        *((_QWORD *)v77 + 2) = v82 - 1;
        v11 = v106;
        if (v82 <= 2)
          goto LABEL_15;
      }
    }
    v13 = 1;
LABEL_15:
    v6 = v104;
    v3 = v105;
    if (v10 >= v105)
    {
      v9 = v103;
      goto LABEL_103;
    }
  }
LABEL_140:
  __break(1u);
LABEL_141:
  __break(1u);
LABEL_142:
  __break(1u);
LABEL_143:
  __break(1u);
LABEL_144:
  __break(1u);
LABEL_145:
  __break(1u);
LABEL_146:
  result = sub_24396FF08();
  __break(1u);
  return result;
}

uint64_t sub_24394729C(double *__src, double *a2, unint64_t a3, double *__dst)
{
  double *v4;
  double *v6;
  double *v7;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double *v14;
  double *v15;
  double *v16;
  double *v17;
  double *v18;
  double *v19;
  double *v20;
  double *v21;
  uint64_t result;
  char *v23;
  double *v24;
  double *v25;

  v4 = __dst;
  v6 = a2;
  v7 = __src;
  v8 = (char *)a2 - (char *)__src;
  v9 = (char *)a2 - (char *)__src + 15;
  if ((char *)a2 - (char *)__src >= 0)
    v9 = (char *)a2 - (char *)__src;
  v10 = v9 >> 4;
  v11 = a3 - (_QWORD)a2;
  v12 = a3 - (_QWORD)a2 + 15;
  if ((uint64_t)(a3 - (_QWORD)a2) >= 0)
    v12 = a3 - (_QWORD)a2;
  v13 = v12 >> 4;
  v25 = __src;
  v24 = __dst;
  if (v10 >= v12 >> 4)
  {
    if (v11 >= -15)
    {
      if (__dst != a2 || &a2[2 * v13] <= __dst)
        memmove(__dst, a2, 16 * v13);
      v18 = &v4[2 * v13];
      v23 = (char *)v18;
      v25 = v6;
      if (v7 < v6 && v11 >= 16)
      {
        v19 = (double *)(a3 - 16);
        do
        {
          v20 = v19 + 2;
          if (*(v6 - 1) >= *(v18 - 1))
          {
            v23 = (char *)(v18 - 2);
            if (v20 < v18 || v19 >= v18 || v20 != v18)
              *(_OWORD *)v19 = *((_OWORD *)v18 - 1);
            v21 = v6;
            v18 -= 2;
            if (v6 <= v7)
              break;
          }
          else
          {
            v21 = v6 - 2;
            if (v20 != v6 || v19 >= v6)
              *(_OWORD *)v19 = *(_OWORD *)v21;
            v25 = v6 - 2;
            if (v21 <= v7)
              break;
          }
          v19 -= 2;
          v6 = v21;
        }
        while (v18 > v4);
      }
LABEL_44:
      sub_24395E770((void **)&v25, (const void **)&v24, &v23);
      return 1;
    }
  }
  else if (v8 >= -15)
  {
    if (__dst != __src || &__src[2 * v10] <= __dst)
      memmove(__dst, __src, 16 * v10);
    v14 = &v4[2 * v10];
    v23 = (char *)v14;
    if ((unint64_t)v6 < a3 && v8 >= 16)
    {
      v15 = v4;
      while (1)
      {
        if (v15[1] >= v6[1])
        {
          v4 = v15 + 2;
          v17 = v15;
          v16 = v6;
          if (v7 == v15)
          {
            v15 += 2;
            if (v7 < v4)
              goto LABEL_22;
          }
          else
          {
            v15 += 2;
          }
        }
        else
        {
          v16 = v6 + 2;
          v17 = v6;
          if (v7 == v6 && v7 < v16)
            goto LABEL_22;
        }
        *(_OWORD *)v7 = *(_OWORD *)v17;
LABEL_22:
        v7 += 2;
        if (v15 < v14)
        {
          v6 = v16;
          if ((unint64_t)v16 < a3)
            continue;
        }
        v24 = v4;
        v25 = v7;
        goto LABEL_44;
      }
    }
    goto LABEL_44;
  }
  result = sub_24396FF5C();
  __break(1u);
  return result;
}

uint64_t sub_243947524(uint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;
  unsigned int v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t *v9;
  unint64_t v10;

  v1 = *(_QWORD *)(a1 + 64);
  if (v1)
  {
    v2 = 0;
    return __clz(__rbit64(v1)) + v2;
  }
  v5 = *(_BYTE *)(a1 + 32);
  v6 = v5 & 0x3F;
  v3 = 1 << v5;
  if (v6 < 7)
    return v3;
  v1 = *(_QWORD *)(a1 + 72);
  if (v1)
  {
    v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 2)
    v7 = 2;
  v8 = v7 - 2;
  v9 = (unint64_t *)(a1 + 80);
  v2 = 64;
  while (v8)
  {
    v10 = *v9++;
    v1 = v10;
    --v8;
    v2 += 64;
    if (v10)
      return __clz(__rbit64(v1)) + v2;
  }
  return v3;
}

uint64_t sub_2439475AC()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

void sub_2439475D8(void *a1)
{
  uint64_t v1;

  sub_24394114C(a1, *(_QWORD *)(v1 + 16), *(void (**)(uint64_t))(v1 + 24));
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t sub_2439475FC()
{
  id *v0;

  swift_release();
  swift_release();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)(v0 + 49));

  return swift_deallocObject();
}

void sub_2439476D0(void *a1)
{
  uint64_t v1;

  sub_243941360(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(void (**)(uint64_t))(v1 + 32));
}

uint64_t sub_2439476E0(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2572D9E40);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_243947720()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_24394774C()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_243947754()
{
  return swift_deallocObject();
}

uint64_t sub_243947764()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

unint64_t sub_243947784()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2572D9E48;
  if (!qword_2572D9E48)
  {
    v1 = sub_24393E124(255, &qword_2572D9E38);
    result = MEMORY[0x2494FDCE4](MEMORY[0x24BEE5BD8], v1);
    atomic_store(result, (unint64_t *)&qword_2572D9E48);
  }
  return result;
}

unint64_t sub_2439477DC@<X0>(unint64_t result@<X0>, unint64_t a2@<X1>, unint64_t a3@<X2>, unint64_t *a4@<X8>)
{
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  if ((result & 0xC000000000000001) != 0)
  {
    v7 = sub_24396FEE4();
    v8 = 0;
    v9 = 0;
    v10 = 0;
    result = v7 | 0x8000000000000000;
  }
  else
  {
    v11 = -1;
    v12 = -1 << *(_BYTE *)(result + 32);
    v8 = result + 64;
    v9 = ~v12;
    v13 = -v12;
    if (v13 < 64)
      v11 = ~(-1 << v13);
    v10 = v11 & *(_QWORD *)(result + 64);
  }
  *a4 = result;
  a4[1] = v8;
  a4[2] = v9;
  a4[3] = 0;
  a4[4] = v10;
  a4[5] = a2;
  a4[6] = a3;
  return result;
}

void sub_243947870(unint64_t a1, unint64_t a2, unint64_t a3)
{
  uint64_t v6;
  _QWORD *v7;
  int64_t v8;
  uint64_t v9;
  unint64_t v10;
  _QWORD *v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  int64_t v20;
  uint64_t v21;
  _QWORD *v22;
  int64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  BOOL v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  __int128 v35;

  if ((a1 & 0xC000000000000001) == 0)
  {
    v6 = *(_QWORD *)(a1 + 16);
    if (v6 > 0)
      goto LABEL_3;
LABEL_7:
    v7 = (_QWORD *)MEMORY[0x24BEE4AF8];
    v10 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 24);
    goto LABEL_8;
  }
  v6 = sub_24396FDF4();
  if (v6 <= 0)
    goto LABEL_7;
LABEL_3:
  __swift_instantiateConcreteTypeFromMangledName(&qword_2572D9E68);
  v7 = (_QWORD *)swift_allocObject();
  v8 = _swift_stdlib_malloc_size(v7);
  v9 = v8 - 32;
  if (v8 < 32)
    v9 = v8 - 17;
  v10 = 2 * (v9 >> 4);
  v7[2] = v6;
  v7[3] = v10;
LABEL_8:
  sub_2439477DC(a1, a2, a3, (unint64_t *)&v35);
  if (v6 < 0)
  {
LABEL_41:
    __break(1u);
    goto LABEL_42;
  }
  v11 = v7 + 4;
  v12 = v10 >> 1;
  if (v6)
  {
    v12 -= v6;
    swift_bridgeObjectRetain();
    swift_retain();
    while (1)
    {
      sub_24395F4B0();
      if (!v13)
        goto LABEL_43;
      *v11 = v13;
      v11[1] = v14;
      v11 += 2;
      if (!--v6)
        goto LABEL_15;
    }
  }
  swift_bridgeObjectRetain();
  swift_retain();
LABEL_15:
  sub_24395F4B0();
  if (v15)
  {
    v17 = v15;
    v18 = v16;
    while (1)
    {
      if (!v12)
      {
        v19 = v7[3];
        if ((uint64_t)((v19 >> 1) + 0x4000000000000000) < 0)
          goto LABEL_40;
        v20 = v19 & 0xFFFFFFFFFFFFFFFELL;
        if (v20 <= 1)
          v21 = 1;
        else
          v21 = v20;
        __swift_instantiateConcreteTypeFromMangledName(&qword_2572D9E68);
        v22 = (_QWORD *)swift_allocObject();
        v23 = _swift_stdlib_malloc_size(v22);
        v24 = v23 - 32;
        if (v23 < 32)
          v24 = v23 - 17;
        v25 = v24 >> 4;
        v22[2] = v21;
        v22[3] = 2 * (v24 >> 4);
        v26 = (unint64_t)(v22 + 4);
        v27 = v7[3] >> 1;
        if (v7[2])
        {
          if (v22 != v7 || v26 >= (unint64_t)&v7[2 * v27 + 4])
            memmove(v22 + 4, v7 + 4, 16 * v27);
          v7[2] = 0;
        }
        v11 = (_QWORD *)(v26 + 16 * v27);
        v12 = (v25 & 0x7FFFFFFFFFFFFFFFLL) - v27;
        swift_release();
        v7 = v22;
      }
      v29 = __OFSUB__(v12--, 1);
      if (v29)
        break;
      *v11 = v17;
      v11[1] = v18;
      v11 += 2;
      sub_24395F4B0();
      v17 = v30;
      v18 = v31;
      if (!v30)
        goto LABEL_35;
    }
    __break(1u);
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
LABEL_35:
  sub_243947AF0();
  swift_release();
  v32 = v7[3];
  if (v32 >= 2)
  {
    v33 = v32 >> 1;
    v29 = __OFSUB__(v33, v12);
    v34 = v33 - v12;
    if (v29)
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return;
    }
    v7[2] = v34;
  }
}

uint64_t sub_243947AF0()
{
  return swift_release();
}

uint64_t destroy for ShadowEvaluationManager.EvaluationEvent()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *_s25PeopleSuggesterLighthouse23ShadowEvaluationManagerV15EvaluationEventVwCP_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for ShadowEvaluationManager.EvaluationEvent(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for ShadowEvaluationManager.EvaluationEvent(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ShadowEvaluationManager.EvaluationEvent(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 24))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ShadowEvaluationManager.EvaluationEvent(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 24) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 24) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for ShadowEvaluationManager.EvaluationEvent()
{
  return &type metadata for ShadowEvaluationManager.EvaluationEvent;
}

uint64_t destroy for ShadowEvaluationManager.LabeledEvaluationEvent(uint64_t a1)
{

  return swift_bridgeObjectRelease();
}

uint64_t _s25PeopleSuggesterLighthouse23ShadowEvaluationManagerV22LabeledEvaluationEventVwCP_0(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  v3 = *(void **)(a2 + 8);
  v4 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = v3;
  *(_QWORD *)(a1 + 16) = v4;
  v5 = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for ShadowEvaluationManager.LabeledEvaluationEvent(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  v4 = *(void **)(a1 + 8);
  v5 = *(void **)(a2 + 8);
  *(_QWORD *)(a1 + 8) = v5;
  v6 = v5;

  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for ShadowEvaluationManager.LabeledEvaluationEvent(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;

  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ShadowEvaluationManager.LabeledEvaluationEvent(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 24))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ShadowEvaluationManager.LabeledEvaluationEvent(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 24) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 16) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 24) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for ShadowEvaluationManager.LabeledEvaluationEvent()
{
  return &type metadata for ShadowEvaluationManager.LabeledEvaluationEvent;
}

id sub_243947E6C()
{
  id result;

  result = sub_243947E88();
  qword_2572D9E80 = (uint64_t)result;
  return result;
}

id sub_243947E88()
{
  id v0;
  void *v1;
  id v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;

  v0 = objc_allocWithZone(MEMORY[0x24BDBCF50]);
  v1 = (void *)sub_24396FB48();
  v2 = objc_msgSend(v0, sel_initWithSuiteName_, v1);

  if (v2)
  {
    if (qword_2572D9D10 != -1)
      swift_once();
    v3 = sub_24396FAE8();
    __swift_project_value_buffer(v3, (uint64_t)qword_2572DA2B0);
    v4 = sub_24396FAD0();
    v5 = sub_24396FD04();
    if (os_log_type_enabled(v4, v5))
    {
      v6 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_243921000, v4, v5, "Using custom user defaults suite", v6, 2u);
      MEMORY[0x2494FDD74](v6, -1, -1);
    }

    return v2;
  }
  else
  {
    if (qword_2572D9D10 != -1)
      swift_once();
    v8 = sub_24396FAE8();
    __swift_project_value_buffer(v8, (uint64_t)qword_2572DA2B0);
    v9 = sub_24396FAD0();
    v10 = sub_24396FD10();
    if (os_log_type_enabled(v9, v10))
    {
      v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_243921000, v9, v10, "Unable to use custom user defaults suite", v11, 2u);
      MEMORY[0x2494FDD74](v11, -1, -1);
    }

    return objc_msgSend((id)objc_opt_self(), sel_standardUserDefaults);
  }
}

id userDefaults.getter()
{
  if (qword_2572D9D08 != -1)
    swift_once();
  return (id)qword_2572D9E80;
}

uint64_t SubtaskName.description.getter()
{
  uint64_t v0;

  if (*(_BYTE *)(v0 + 4) == 1)
    __asm { BR              X9 }
  sub_24396FE48();
  swift_bridgeObjectRelease();
  sub_24396FF80();
  sub_24396FB90();
  swift_bridgeObjectRelease();
  sub_24396FB90();
  return 0x46657475706D6F63;
}

uint64_t ComputationState.description.getter()
{
  uint64_t v0;
  uint64_t result;

  result = 0x45746F4E6B736174;
  switch(*(_QWORD *)(v0 + 8))
  {
    case 0:
      return result;
    case 1:
      result = 0x726174536B736174;
      break;
    case 2:
      result = 0x706F74536B736174;
      break;
    case 3:
      result = 0x70696B536B736174;
      break;
    case 4:
      result = 0x706D6F436B736174;
      break;
    default:
      sub_24396FB90();
      result = 0x6F7272456B736174;
      break;
  }
  return result;
}

uint64_t NSUserDefaults.shouldCompute(_:)(int *a1)
{
  void *v1;
  int v2;
  char v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  int v13;
  void (*v14)(char *, uint64_t, uint64_t, uint64_t);
  double v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  uint8_t *v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  NSObject *v35;
  os_log_type_t v36;
  int v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  double v41;
  void (*v42)(char *, uint64_t);
  uint64_t v43;
  _QWORD v44[2];
  int v45;
  uint64_t v46;
  _QWORD *v47;
  double v48;
  __int128 v49;
  uint64_t v50;
  _OWORD v51[2];
  int v52;
  char v53;

  v2 = *a1;
  v3 = *((_BYTE *)a1 + 4);
  v52 = *a1;
  v53 = v3;
  SubtaskName.description.getter();
  v4 = (void *)sub_24396FB48();
  swift_bridgeObjectRelease();
  v5 = objc_msgSend(v1, sel_objectForKey_, v4);

  if (v5)
  {
    sub_24396FDB8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v51, 0, sizeof(v51));
  }
  sub_24394AD24((uint64_t)v51, (uint64_t)&v52);
  sub_24394AD6C((uint64_t)&v52, (uint64_t)&v49);
  if (!v50)
  {
    sub_24394ADB4((uint64_t)&v49, &qword_2572D9E88);
    if (qword_2572D9D10 != -1)
      swift_once();
    v16 = sub_24396FAE8();
    __swift_project_value_buffer(v16, (uint64_t)qword_2572DA2B0);
    v17 = sub_24396FAD0();
    v18 = sub_24396FD04();
    if (os_log_type_enabled(v17, v18))
    {
      v19 = (uint8_t *)swift_slowAlloc();
      v20 = swift_slowAlloc();
      *(_QWORD *)&v51[0] = v20;
      *(_DWORD *)v19 = 136315138;
      LODWORD(v49) = v2;
      BYTE4(v49) = v3;
      v21 = SubtaskName.description.getter();
      *(_QWORD *)&v49 = sub_2439420BC(v21, v22, (uint64_t *)v51);
      sub_24396FD94();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_243921000, v17, v18, "No Last Computation date for task %s. The task needs to be run.", v19, 0xCu);
      v23 = 1;
      swift_arrayDestroy();
      MEMORY[0x2494FDD74](v20, -1, -1);
      MEMORY[0x2494FDD74](v19, -1, -1);

      sub_24394ADB4((uint64_t)&v52, &qword_2572D9E88);
      return v23;
    }

LABEL_20:
    sub_24394ADB4((uint64_t)&v52, &qword_2572D9E88);
    return 1;
  }
  sub_243946AA0(&v49, v51);
  v6 = sub_24396FA04();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)v44 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_243946B14((uint64_t)v51, (uint64_t)&v49);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2572D9E90);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)v44 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = swift_dynamicCast();
  v14 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56);
  if (!v13)
  {
    v14(v12, 1, 1, v6);
    goto LABEL_14;
  }
  v14(v12, 0, 1, v6);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v12, 1, v6) == 1)
  {
LABEL_14:
    sub_24394ADB4((uint64_t)v12, &qword_2572D9E90);
    if (qword_2572D9D10 != -1)
      swift_once();
    v24 = sub_24396FAE8();
    __swift_project_value_buffer(v24, (uint64_t)qword_2572DA2B0);
    v25 = sub_24396FAD0();
    v26 = sub_24396FD04();
    if (os_log_type_enabled(v25, v26))
    {
      v27 = (uint8_t *)swift_slowAlloc();
      v28 = swift_slowAlloc();
      *(_QWORD *)&v49 = v28;
      *(_DWORD *)v27 = 136315138;
      LODWORD(v48) = v2;
      BYTE4(v48) = v3;
      v29 = SubtaskName.description.getter();
      v48 = COERCE_DOUBLE(sub_2439420BC(v29, v30, (uint64_t *)&v49));
      sub_24396FD94();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_243921000, v25, v26, "No Last Computation date for task %s. The task needs to be run.", v27, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2494FDD74](v28, -1, -1);
      MEMORY[0x2494FDD74](v27, -1, -1);
    }

    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v51);
    goto LABEL_20;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))((char *)v44 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v12, v6);
  sub_24396F9C8();
  if (v15 < -43200.0)
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))((char *)v44 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v51);
    sub_24394ADB4((uint64_t)&v52, &qword_2572D9E88);
    return 1;
  }
  if (qword_2572D9D10 != -1)
    swift_once();
  v32 = sub_24396FAE8();
  v33 = __swift_project_value_buffer(v32, (uint64_t)qword_2572DA2B0);
  v47 = v44;
  MEMORY[0x24BDAC7A8](v33);
  v34 = (char *)v44 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v34, v34, v6);
  v35 = sub_24396FAD0();
  v36 = sub_24396FD04();
  v37 = v36;
  if (os_log_type_enabled(v35, v36))
  {
    v38 = swift_slowAlloc();
    v46 = swift_slowAlloc();
    *(_QWORD *)&v49 = v46;
    *(_DWORD *)v38 = 136315650;
    v44[1] = v38 + 4;
    LODWORD(v48) = v2;
    BYTE4(v48) = v3;
    v45 = v37;
    v39 = SubtaskName.description.getter();
    v48 = COERCE_DOUBLE(sub_2439420BC(v39, v40, (uint64_t *)&v49));
    sub_24396FD94();
    swift_bridgeObjectRelease();
    *(_WORD *)(v38 + 12) = 2048;
    sub_24396F9C8();
    v48 = -v41;
    sub_24396FD94();
    v42 = *(void (**)(char *, uint64_t))(v7 + 8);
    v42(v34, v6);
    *(_WORD *)(v38 + 22) = 2048;
    v48 = 43200.0;
    sub_24396FD94();
    _os_log_impl(&dword_243921000, v35, (os_log_type_t)v45, "Task %s was run %f seconds ago, which is less than %f seconds ago. The task will not be run again this time.", (uint8_t *)v38, 0x20u);
    v43 = v46;
    swift_arrayDestroy();
    MEMORY[0x2494FDD74](v43, -1, -1);
    MEMORY[0x2494FDD74](v38, -1, -1);

  }
  else
  {

    v42 = *(void (**)(char *, uint64_t))(v7 + 8);
    v42(v34, v6);
  }
  v42(v9, v6);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v51);
  sub_24394ADB4((uint64_t)&v52, &qword_2572D9E88);
  return 0;
}

uint64_t NSUserDefaults.saveComputationDate(_:)(int *a1)
{
  void *v1;
  void *v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  void (*v19)(char *, uint64_t);
  uint64_t v20;
  uint64_t v21;
  char v22;
  void *v23;
  void *v24;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  int v29;
  uint64_t *v30;
  int v31;
  uint64_t v32;
  uint64_t v33;

  v2 = v1;
  v3 = *a1;
  v31 = *((unsigned __int8 *)a1 + 4);
  v4 = sub_24396FA04();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_QWORD *)(v5 + 64);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (v6 + 15) & 0xFFFFFFFFFFFFFFF0;
  v8 = (char *)&v26 - v7;
  sub_24396F9E0();
  if (qword_2572D9D10 != -1)
    swift_once();
  v9 = sub_24396FAE8();
  v10 = __swift_project_value_buffer(v9, (uint64_t)qword_2572DA2B0);
  v30 = &v26;
  MEMORY[0x24BDAC7A8](v10);
  (*(void (**)(char *, char *, uint64_t))(v5 + 16))((char *)&v26 - v7, (char *)&v26 - v7, v4);
  v11 = sub_24396FAD0();
  v12 = sub_24396FD04();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = swift_slowAlloc();
    v28 = v2;
    v14 = v13;
    v27 = swift_slowAlloc();
    v33 = v27;
    *(_DWORD *)v14 = 136315394;
    v29 = v3;
    LODWORD(v32) = v3;
    BYTE4(v32) = v31;
    v15 = SubtaskName.description.getter();
    v32 = sub_2439420BC(v15, v16, &v33);
    sub_24396FD94();
    swift_bridgeObjectRelease();
    *(_WORD *)(v14 + 12) = 2080;
    sub_24394ADF0();
    v17 = sub_24396FF80();
    v32 = sub_2439420BC(v17, v18, &v33);
    v3 = v29;
    sub_24396FD94();
    swift_bridgeObjectRelease();
    v19 = *(void (**)(char *, uint64_t))(v5 + 8);
    v19((char *)&v26 - v7, v4);
    _os_log_impl(&dword_243921000, v11, v12, "Task %s: Saving Last Computation date %s", (uint8_t *)v14, 0x16u);
    v20 = v27;
    swift_arrayDestroy();
    MEMORY[0x2494FDD74](v20, -1, -1);
    v21 = v14;
    v2 = v28;
    MEMORY[0x2494FDD74](v21, -1, -1);
  }
  else
  {
    v19 = *(void (**)(char *, uint64_t))(v5 + 8);
    v19((char *)&v26 - v7, v4);
  }

  v22 = v31;
  v23 = (void *)sub_24396F9A4();
  LODWORD(v33) = v3;
  BYTE4(v33) = v22;
  SubtaskName.description.getter();
  v24 = (void *)sub_24396FB48();
  swift_bridgeObjectRelease();
  objc_msgSend(v2, sel_setObject_forKey_, v23, v24);

  return ((uint64_t (*)(char *, uint64_t))v19)(v8, v4);
}

void NSUserDefaults.removeDate(forParameter:)()
{
  void *v0;
  id v1;

  SubtaskName.description.getter();
  v1 = (id)sub_24396FB48();
  swift_bridgeObjectRelease();
  objc_msgSend(v0, sel_removeObjectForKey_, v1);

}

uint64_t sub_243948E48@<X0>(int *a1@<X0>, uint64_t a2@<X8>)
{
  void *v2;
  int v4;
  char v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  void (*v14)(char *, uint64_t, uint64_t, uint64_t);
  __int128 v16;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;
  _DWORD v20[3];
  char v21;
  __int128 v22;
  uint64_t v23;
  _OWORD v24[2];
  _BYTE v25[32];

  v4 = *a1;
  v5 = *((_BYTE *)a1 + 4);
  LODWORD(v24[0]) = *a1;
  BYTE4(v24[0]) = v5;
  SubtaskName.description.getter();
  v6 = (void *)sub_24396FB48();
  swift_bridgeObjectRelease();
  v7 = objc_msgSend(v2, sel_objectForKey_, v6);

  if (v7)
  {
    sub_24396FDB8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v24, 0, sizeof(v24));
  }
  sub_24394AD24((uint64_t)v24, (uint64_t)v25);
  sub_24394AD6C((uint64_t)v25, (uint64_t)&v22);
  if (v23)
  {
    sub_243946AA0(&v22, v24);
    sub_243946B14((uint64_t)v24, (uint64_t)&v22);
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2572D9E90);
    MEMORY[0x24BDAC7A8](v8);
    v10 = (char *)v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
    v11 = sub_24396FA04();
    v12 = swift_dynamicCast();
    v13 = *(_QWORD *)(v11 - 8);
    v14 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56);
    if (v12)
    {
      v14(v10, 0, 1, v11);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v10, 1, v11) != 1)
      {
        __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v24);
        sub_24394ADB4((uint64_t)v25, &qword_2572D9E88);
        return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v13 + 32))(a2, v10, v11);
      }
    }
    else
    {
      v14(v10, 1, 1, v11);
    }
    sub_24394ADB4((uint64_t)v10, &qword_2572D9E90);
    *(_QWORD *)&v22 = 0;
    *((_QWORD *)&v22 + 1) = 0xE000000000000000;
    sub_24396FE48();
    swift_bridgeObjectRelease();
    *(_QWORD *)&v22 = 0xD00000000000001CLL;
    *((_QWORD *)&v22 + 1) = 0x800000024397A3B0;
    v20[2] = v4;
    v21 = v5;
    SubtaskName.description.getter();
    sub_24396FB90();
    swift_bridgeObjectRelease();
    sub_24396FB90();
    v18 = v22;
    sub_24393DE88();
    swift_allocError();
    *(_OWORD *)v19 = v18;
    *(_BYTE *)(v19 + 16) = 1;
    swift_willThrow();
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v24);
  }
  else
  {
    sub_24394ADB4((uint64_t)&v22, &qword_2572D9E88);
    *(_QWORD *)&v24[0] = 0;
    *((_QWORD *)&v24[0] + 1) = 0xE000000000000000;
    sub_24396FE48();
    swift_bridgeObjectRelease();
    *(_QWORD *)&v24[0] = 0xD00000000000001ELL;
    *((_QWORD *)&v24[0] + 1) = 0x800000024397A390;
    LODWORD(v22) = v4;
    BYTE4(v22) = v5;
    SubtaskName.description.getter();
    sub_24396FB90();
    swift_bridgeObjectRelease();
    sub_24396FB90();
    v16 = v24[0];
    sub_24393DE88();
    swift_allocError();
    *(_OWORD *)v17 = v16;
    *(_BYTE *)(v17 + 16) = 1;
    swift_willThrow();
  }
  return sub_24394ADB4((uint64_t)v25, &qword_2572D9E88);
}

uint64_t TrialIdentifier.task.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TrialIdentifier.treatment.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TrialIdentifier.deployment.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

void __swiftcall TrialIdentifier.init(task:treatment:deployment:)(PeopleSuggesterLighthouse::TrialIdentifier *__return_ptr retstr, Swift::String task, Swift::String treatment, Swift::String deployment)
{
  retstr->task = task;
  retstr->treatment = treatment;
  retstr->deployment = deployment;
}

void TrialIdentifier.saveAsJSON(at:)()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t inited;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unsigned __int8 *v12;
  unsigned __int8 *v13;
  int v14;
  unsigned int v15;
  uint64_t v16;
  unsigned __int8 *v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  id v29;
  void *v30;
  unsigned __int8 v31;
  void *v32;
  unsigned int v33;
  id v34;
  uint64_t v35;
  NSObject *v36;
  os_log_type_t v37;
  uint8_t *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  id v42;
  id v43;
  os_log_type_t v44;
  uint8_t *v45;
  _QWORD *v46;
  id v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  uint64_t v52;
  id v53;
  id v54;
  os_log_type_t v55;
  uint8_t *v56;
  _QWORD *v57;
  id v58;
  void *v59;
  uint64_t v60;
  unsigned __int8 *v61;
  unsigned int v62;
  uint64_t v63;
  uint64_t v64;
  unsigned __int8 *v65;
  unsigned int v66;
  uint64_t v67;
  unint64_t v68;
  id v69[27];

  v69[25] = *(id *)MEMORY[0x24BDAC8D0];
  v2 = *v0;
  v1 = v0[1];
  v4 = v0[2];
  v3 = v0[3];
  v6 = v0[4];
  v5 = v0[5];
  __swift_instantiateConcreteTypeFromMangledName(&qword_2572D9EA0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_243970F00;
  strcpy((char *)(inited + 32), "experimentId");
  *(_BYTE *)(inited + 45) = 0;
  *(_WORD *)(inited + 46) = -5120;
  v8 = MEMORY[0x24BEE0D00];
  *(_QWORD *)(inited + 48) = v2;
  *(_QWORD *)(inited + 56) = v1;
  *(_QWORD *)(inited + 72) = v8;
  *(_QWORD *)(inited + 80) = 0x6E656D7461657274;
  *(_QWORD *)(inited + 88) = 0xEB00000000644974;
  *(_QWORD *)(inited + 96) = v4;
  *(_QWORD *)(inited + 104) = v3;
  *(_QWORD *)(inited + 120) = v8;
  strcpy((char *)(inited + 128), "deploymentId");
  *(_BYTE *)(inited + 141) = 0;
  *(_WORD *)(inited + 142) = -5120;
  *(_QWORD *)(inited + 168) = __swift_instantiateConcreteTypeFromMangledName(&qword_2572D9EA8);
  v9 = HIBYTE(v5) & 0xF;
  v10 = v6 & 0xFFFFFFFFFFFFLL;
  if ((v5 & 0x2000000000000000) != 0)
    v11 = HIBYTE(v5) & 0xF;
  else
    v11 = v6 & 0xFFFFFFFFFFFFLL;
  if (!v11)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v21 = 0;
    LOBYTE(v20) = 1;
    goto LABEL_38;
  }
  if ((v5 & 0x1000000000000000) == 0)
  {
    if ((v5 & 0x2000000000000000) == 0)
    {
      if ((v6 & 0x1000000000000000) != 0)
        v12 = (unsigned __int8 *)((v5 & 0xFFFFFFFFFFFFFFFLL) + 32);
      else
        v12 = (unsigned __int8 *)sub_24396FE84();
      v13 = sub_24394A3D8(v12, v10, 10);
      v14 = (int)v13;
      LOBYTE(v9) = BYTE4(v13) & 1;
      goto LABEL_34;
    }
    v69[0] = (id)v6;
    v69[1] = (id)(v5 & 0xFFFFFFFFFFFFFFLL);
    if (v6 == 43)
    {
      if (v9)
      {
        if (v9 != 1)
        {
          v14 = (BYTE1(v6) - 48);
          if (v14 <= 9)
          {
            if (v9 == 2)
              goto LABEL_33;
            if ((BYTE2(v6) - 48) <= 9u)
            {
              v14 = 10 * v14 + (BYTE2(v6) - 48);
              v16 = v9 - 3;
              if (v9 != 3)
              {
                v17 = (unsigned __int8 *)v69 + 3;
                while (1)
                {
                  v18 = *v17 - 48;
                  if (v18 > 9)
                    goto LABEL_31;
                  v19 = 10 * v14;
                  if (v19 != (int)v19)
                    goto LABEL_31;
                  v14 = v19 + v18;
                  if (__OFADD__((_DWORD)v19, v18))
                    goto LABEL_31;
                  LOBYTE(v9) = 0;
                  ++v17;
                  if (!--v16)
                    goto LABEL_34;
                }
              }
              goto LABEL_33;
            }
          }
          goto LABEL_31;
        }
        goto LABEL_78;
      }
    }
    else
    {
      if (v6 != 45)
      {
        if (v9)
        {
          v14 = (v6 - 48);
          if (v14 <= 9)
          {
            if (v9 == 1)
              goto LABEL_33;
            if ((BYTE1(v6) - 48) <= 9u)
            {
              v14 = 10 * v14 + (BYTE1(v6) - 48);
              v60 = v9 - 2;
              if (v9 != 2)
              {
                v61 = (unsigned __int8 *)v69 + 2;
                while (1)
                {
                  v62 = *v61 - 48;
                  if (v62 > 9)
                    goto LABEL_31;
                  v63 = 10 * v14;
                  if (v63 != (int)v63)
                    goto LABEL_31;
                  v14 = v63 + v62;
                  if (__OFADD__((_DWORD)v63, v62))
                    goto LABEL_31;
                  LOBYTE(v9) = 0;
                  ++v61;
                  if (!--v60)
                    goto LABEL_34;
                }
              }
              goto LABEL_33;
            }
          }
        }
LABEL_31:
        v14 = 0;
        LOBYTE(v9) = 1;
        goto LABEL_34;
      }
      if (v9)
      {
        if (v9 != 1)
        {
          v15 = (BYTE1(v6) - 48);
          if (v15 <= 9)
          {
            if (v9 == 2)
            {
              LOBYTE(v9) = 0;
              v14 = -v15;
LABEL_34:
              LODWORD(v20) = v9 & 1;
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain();
              goto LABEL_35;
            }
            if ((BYTE2(v6) - 48) <= 9u)
            {
              v14 = -10 * v15 - (BYTE2(v6) - 48);
              v64 = v9 - 3;
              if (v9 != 3)
              {
                v65 = (unsigned __int8 *)v69 + 3;
                while (1)
                {
                  v66 = *v65 - 48;
                  if (v66 > 9)
                    goto LABEL_31;
                  v67 = 10 * v14;
                  if (v67 != (int)v67)
                    goto LABEL_31;
                  v14 = v67 - v66;
                  if (__OFSUB__((_DWORD)v67, v66))
                    goto LABEL_31;
                  LOBYTE(v9) = 0;
                  ++v65;
                  if (!--v64)
                    goto LABEL_34;
                }
              }
LABEL_33:
              LOBYTE(v9) = 0;
              goto LABEL_34;
            }
          }
          goto LABEL_31;
        }
LABEL_78:
        v14 = 0;
        goto LABEL_34;
      }
      __break(1u);
    }
    __break(1u);
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v68 = sub_24394A2F4(v6, v5, 10);
  swift_bridgeObjectRelease();
  v20 = HIDWORD(v68) & 1;
  v14 = v68;
LABEL_35:
  if ((_DWORD)v20)
    v21 = 0;
  else
    v21 = v14;
LABEL_38:
  *(_DWORD *)(inited + 144) = v21;
  *(_BYTE *)(inited + 148) = v20;
  sub_24393F22C(inited);
  v22 = (void *)objc_opt_self();
  v23 = (void *)sub_24396FB0C();
  swift_bridgeObjectRelease();
  v69[0] = 0;
  v24 = objc_msgSend(v22, sel_dataWithJSONObject_options_error_, v23, 1, v69);

  v25 = v69[0];
  if (v24)
  {
    v26 = sub_24396F92C();
    v28 = v27;

    v29 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
    sub_24396F914();
    v30 = (void *)sub_24396FB48();
    swift_bridgeObjectRelease();
    v31 = objc_msgSend(v29, sel_fileExistsAtPath_, v30);

    if ((v31 & 1) == 0)
    {
LABEL_42:
      sub_24396F938();
      if (qword_2572D9D10 != -1)
        swift_once();
      v35 = sub_24396FAE8();
      __swift_project_value_buffer(v35, (uint64_t)qword_2572DA2B0);
      v36 = sub_24396FAD0();
      v37 = sub_24396FCF8();
      if (os_log_type_enabled(v36, v37))
      {
        v38 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v38 = 0;
        _os_log_impl(&dword_243921000, v36, v37, "Saved Trial information successfully", v38, 2u);
        MEMORY[0x2494FDD74](v38, -1, -1);
      }

      sub_24394AE38(v26, v28);
      goto LABEL_58;
    }
    v32 = (void *)sub_24396F8F0();
    v69[0] = 0;
    v33 = objc_msgSend(v29, sel_removeItemAtURL_error_, v32, v69);

    if (v33)
    {
      v34 = v69[0];
      goto LABEL_42;
    }
    v50 = v69[0];
    v51 = (void *)sub_24396F8CC();

    swift_willThrow();
    if (qword_2572D9D10 != -1)
      swift_once();
    v52 = sub_24396FAE8();
    __swift_project_value_buffer(v52, (uint64_t)qword_2572DA2B0);
    v53 = v51;
    v54 = v51;
    v36 = sub_24396FAD0();
    v55 = sub_24396FD10();
    if (os_log_type_enabled(v36, v55))
    {
      v56 = (uint8_t *)swift_slowAlloc();
      v57 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v56 = 138412290;
      v58 = v51;
      v59 = (void *)_swift_stdlib_bridgeErrorToNSError();
      v69[0] = v59;
      sub_24396FD94();
      *v57 = v59;

      _os_log_impl(&dword_243921000, v36, v55, "Error writing JSON data to file: %@", v56, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2572DA050);
      swift_arrayDestroy();
      MEMORY[0x2494FDD74](v57, -1, -1);
      MEMORY[0x2494FDD74](v56, -1, -1);
      sub_24394AE38(v26, v28);

      return;
    }
    sub_24394AE38(v26, v28);

    v49 = v51;
  }
  else
  {
    v39 = v25;
    v40 = (void *)sub_24396F8CC();

    swift_willThrow();
    if (qword_2572D9D10 != -1)
      swift_once();
    v41 = sub_24396FAE8();
    __swift_project_value_buffer(v41, (uint64_t)qword_2572DA2B0);
    v42 = v40;
    v43 = v40;
    v36 = sub_24396FAD0();
    v44 = sub_24396FD10();
    if (os_log_type_enabled(v36, v44))
    {
      v45 = (uint8_t *)swift_slowAlloc();
      v46 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v45 = 138412290;
      v47 = v40;
      v48 = (void *)_swift_stdlib_bridgeErrorToNSError();
      v69[0] = v48;
      sub_24396FD94();
      *v46 = v48;

      _os_log_impl(&dword_243921000, v36, v44, "Error converting dictionary to JSON data: %@", v45, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2572DA050);
      swift_arrayDestroy();
      MEMORY[0x2494FDD74](v46, -1, -1);
      MEMORY[0x2494FDD74](v45, -1, -1);

      return;
    }

    v49 = v40;
  }

LABEL_58:
}

Swift::Void __swiftcall TrialIdentifier.saveToUserDefaults()()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t inited;
  void *v8;
  void *v9;
  void *v10;

  v2 = *v0;
  v1 = v0[1];
  v4 = v0[2];
  v3 = v0[3];
  v6 = v0[4];
  v5 = v0[5];
  __swift_instantiateConcreteTypeFromMangledName(&qword_2572D9EB0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_243970F00;
  *(_QWORD *)(inited + 32) = 1802723700;
  *(_QWORD *)(inited + 40) = 0xE400000000000000;
  *(_QWORD *)(inited + 48) = v2;
  *(_QWORD *)(inited + 56) = v1;
  *(_QWORD *)(inited + 64) = 0x6E656D7461657274;
  *(_QWORD *)(inited + 72) = 0xE900000000000074;
  *(_QWORD *)(inited + 80) = v4;
  *(_QWORD *)(inited + 88) = v3;
  *(_QWORD *)(inited + 96) = 0x656D796F6C706564;
  *(_QWORD *)(inited + 104) = 0xEA0000000000746ELL;
  *(_QWORD *)(inited + 112) = v6;
  *(_QWORD *)(inited + 120) = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_24393EF08(inited);
  if (qword_2572D9D08 != -1)
    swift_once();
  v8 = (void *)qword_2572D9E80;
  v9 = (void *)sub_24396FB0C();
  swift_bridgeObjectRelease();
  v10 = (void *)sub_24396FB48();
  objc_msgSend(v8, sel_setObject_forKey_, v9, v10);

}

double static TrialIdentifier.loadFromUserDefaults()@<D0>(_QWORD *a1@<X8>)
{
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  void *v6;
  void *v7;
  id v8;
  unint64_t v9;
  char v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  char v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  double result;
  NSObject *v25;
  os_log_type_t v26;
  uint8_t *v27;
  uint64_t v28;
  uint64_t v29;
  os_log_type_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  _OWORD v36[2];
  uint64_t v37[4];

  if (qword_2572D9D10 != -1)
    swift_once();
  v2 = sub_24396FAE8();
  __swift_project_value_buffer(v2, (uint64_t)qword_2572DA2B0);
  v3 = sub_24396FAD0();
  v4 = sub_24396FD04();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_243921000, v3, v4, "Loading Trial identifier from user defaults", v5, 2u);
    MEMORY[0x2494FDD74](v5, -1, -1);
  }

  if (qword_2572D9D08 != -1)
    swift_once();
  v6 = (void *)qword_2572D9E80;
  v7 = (void *)sub_24396FB48();
  v8 = objc_msgSend(v6, sel_objectForKey_, v7);

  if (v8)
  {
    sub_24396FDB8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v36, 0, sizeof(v36));
  }
  sub_24394AD24((uint64_t)v36, (uint64_t)v37);
  if (v37[3])
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2572D9EB8);
    if ((swift_dynamicCast() & 1) != 0)
    {
      if (*(_QWORD *)(v35 + 16))
      {
        v9 = sub_243942698(1802723700, 0xE400000000000000);
        if ((v10 & 1) != 0)
        {
          if (*(_QWORD *)(v35 + 16))
          {
            v11 = (uint64_t *)(*(_QWORD *)(v35 + 56) + 16 * v9);
            v13 = *v11;
            v12 = v11[1];
            swift_bridgeObjectRetain();
            v14 = sub_243942698(0x6E656D7461657274, 0xE900000000000074);
            if ((v15 & 1) != 0 && *(_QWORD *)(v35 + 16))
            {
              v16 = (uint64_t *)(*(_QWORD *)(v35 + 56) + 16 * v14);
              v18 = *v16;
              v17 = v16[1];
              swift_bridgeObjectRetain();
              v19 = sub_243942698(0x656D796F6C706564, 0xEA0000000000746ELL);
              if ((v20 & 1) != 0)
              {
                v21 = (uint64_t *)(*(_QWORD *)(v35 + 56) + 16 * v19);
                v23 = *v21;
                v22 = v21[1];
                swift_bridgeObjectRetain();
                swift_bridgeObjectRelease();
                *a1 = v13;
                a1[1] = v12;
                a1[2] = v18;
                a1[3] = v17;
                a1[4] = v23;
                a1[5] = v22;
                return result;
              }
              swift_bridgeObjectRelease();
            }
            swift_bridgeObjectRelease();
          }
        }
      }
      swift_bridgeObjectRetain();
      v25 = sub_24396FAD0();
      v30 = sub_24396FD10();
      if (!os_log_type_enabled(v25, v30))
      {

        swift_bridgeObjectRelease_n();
        goto LABEL_27;
      }
      v27 = (uint8_t *)swift_slowAlloc();
      v31 = swift_slowAlloc();
      v37[0] = v31;
      *(_DWORD *)v27 = 136315138;
      swift_bridgeObjectRetain();
      v32 = sub_24396FB24();
      v34 = v33;
      swift_bridgeObjectRelease();
      *(_QWORD *)&v36[0] = sub_2439420BC(v32, v34, v37);
      sub_24396FD94();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_243921000, v25, v30, "Missing fields in stored dictionary %s", v27, 0xCu);
      swift_arrayDestroy();
      v29 = v31;
      goto LABEL_25;
    }
  }
  else
  {
    sub_24394ADB4((uint64_t)v37, &qword_2572D9E88);
  }
  v25 = sub_24396FAD0();
  v26 = sub_24396FD10();
  if (os_log_type_enabled(v25, v26))
  {
    v27 = (uint8_t *)swift_slowAlloc();
    v28 = swift_slowAlloc();
    v37[0] = v28;
    *(_DWORD *)v27 = 136315138;
    *(_QWORD *)&v36[0] = sub_2439420BC(0x6564496C61697274, 0xEF7265696669746ELL, v37);
    sub_24396FD94();
    _os_log_impl(&dword_243921000, v25, v26, "No object for key %s in user defaults", v27, 0xCu);
    swift_arrayDestroy();
    v29 = v28;
LABEL_25:
    MEMORY[0x2494FDD74](v29, -1, -1);
    MEMORY[0x2494FDD74](v27, -1, -1);
  }

LABEL_27:
  result = 0.0;
  *((_OWORD *)a1 + 1) = 0u;
  *((_OWORD *)a1 + 2) = 0u;
  *(_OWORD *)a1 = 0u;
  return result;
}

_QWORD *sub_24394A218(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  size_t v5;

  if (a2 <= a1)
    v2 = a1;
  else
    v2 = a2;
  if (!v2)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_2572D9E00);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_24394A27C(unint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;

  v3 = a1;
  v4 = (unsigned __int16)a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    v10 = sub_24396FBD8();
    v11 = v10 + (v4 << 16);
    v12 = v10 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v13 = v11 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v13 = v12;
    return v13 | 4;
  }
  else
  {
    v5 = MEMORY[0x2494FD3E4](15, a1 >> 16);
    v6 = v5 + (v4 << 16);
    v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v8 = v7;
    return v8 | 8;
  }
}

uint64_t sub_24394A2F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unsigned __int8 *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unsigned __int8 *v11;
  uint64_t v13;
  uint64_t v14;

  v13 = a1;
  v14 = a2;
  swift_bridgeObjectRetain();
  v5 = sub_24396FBE4();
  v6 = v4;
  if ((v4 & 0x1000000000000000) == 0)
  {
    if ((v4 & 0x2000000000000000) == 0)
      goto LABEL_3;
LABEL_6:
    v8 = HIBYTE(v6) & 0xF;
    v13 = v5;
    v14 = v6 & 0xFFFFFFFFFFFFFFLL;
    v7 = (unsigned __int8 *)&v13;
    goto LABEL_7;
  }
  v5 = sub_24394A658();
  v10 = v9;
  swift_bridgeObjectRelease();
  v6 = v10;
  if ((v10 & 0x2000000000000000) != 0)
    goto LABEL_6;
LABEL_3:
  if ((v5 & 0x1000000000000000) != 0)
  {
    v7 = (unsigned __int8 *)((v6 & 0xFFFFFFFFFFFFFFFLL) + 32);
    v8 = v5 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    v7 = (unsigned __int8 *)sub_24396FE84();
  }
LABEL_7:
  v11 = sub_24394A3D8(v7, v8, a3);
  swift_bridgeObjectRelease();
  return v11 | ((((unint64_t)v11 >> 32) & 1) << 32);
}

unsigned __int8 *sub_24394A3D8(unsigned __int8 *result, uint64_t a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  unsigned __int8 v5;
  unsigned __int8 v6;
  unsigned __int8 v7;
  unsigned int v8;
  unsigned __int8 *v9;
  unsigned int v10;
  char v11;
  unsigned int v12;
  unsigned __int8 v13;
  uint64_t v14;
  unsigned __int8 v15;
  uint64_t v16;
  unsigned __int8 v17;
  unsigned __int8 v18;
  unsigned __int8 v19;
  unsigned __int8 *v20;
  unsigned int v21;
  char v22;
  uint64_t v23;
  unsigned __int8 v24;
  unsigned __int8 v25;
  unsigned __int8 v26;
  unsigned __int8 v27;
  unsigned int v28;
  unsigned int v29;
  char v30;
  uint64_t v31;
  unsigned __int8 v32;

  v3 = *result;
  if (v3 == 43)
  {
    if (a2 >= 1)
    {
      v16 = a2 - 1;
      if (a2 != 1)
      {
        v17 = a3 + 87;
        if (a3 > 10)
        {
          v18 = a3 + 55;
        }
        else
        {
          v17 = 97;
          v18 = 65;
        }
        if (a3 <= 10)
          v19 = a3 + 48;
        else
          v19 = 58;
        if (result)
        {
          v8 = 0;
          v20 = result + 1;
          do
          {
            v21 = *v20;
            if (v21 < 0x30 || v21 >= v19)
            {
              if (v21 < 0x41 || v21 >= v18)
              {
                v12 = 0;
                v13 = 1;
                if (v21 < 0x61 || v21 >= v17)
                  return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
                v22 = -87;
              }
              else
              {
                v22 = -55;
              }
            }
            else
            {
              v22 = -48;
            }
            v23 = (int)v8 * (uint64_t)(int)a3;
            if (v23 != (int)v23)
              goto LABEL_72;
            v24 = v21 + v22;
            v8 = v23 + v24;
            if (__OFADD__((_DWORD)v23, v24))
              goto LABEL_72;
            ++v20;
            --v16;
          }
          while (v16);
LABEL_48:
          v13 = 0;
          v12 = v8;
          return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
        }
        goto LABEL_71;
      }
LABEL_72:
      v12 = 0;
      v13 = 1;
      return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
    }
  }
  else
  {
    if (v3 != 45)
    {
      if (a2)
      {
        v25 = a3 + 87;
        if (a3 > 10)
        {
          v26 = a3 + 55;
        }
        else
        {
          v25 = 97;
          v26 = 65;
        }
        if (a3 <= 10)
          v27 = a3 + 48;
        else
          v27 = 58;
        if (result)
        {
          v28 = 0;
          do
          {
            v29 = *result;
            if (v29 < 0x30 || v29 >= v27)
            {
              if (v29 < 0x41 || v29 >= v26)
              {
                v12 = 0;
                v13 = 1;
                if (v29 < 0x61 || v29 >= v25)
                  return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
                v30 = -87;
              }
              else
              {
                v30 = -55;
              }
            }
            else
            {
              v30 = -48;
            }
            v31 = (int)v28 * (uint64_t)(int)a3;
            if (v31 != (int)v31)
              goto LABEL_72;
            v32 = v29 + v30;
            v28 = v31 + v32;
            if (__OFADD__((_DWORD)v31, v32))
              goto LABEL_72;
            ++result;
            --a2;
          }
          while (a2);
          v13 = 0;
          v12 = v28;
          return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
        }
        goto LABEL_71;
      }
      goto LABEL_72;
    }
    if (a2 >= 1)
    {
      v4 = a2 - 1;
      if (a2 != 1)
      {
        v5 = a3 + 87;
        if (a3 > 10)
        {
          v6 = a3 + 55;
        }
        else
        {
          v5 = 97;
          v6 = 65;
        }
        if (a3 <= 10)
          v7 = a3 + 48;
        else
          v7 = 58;
        if (result)
        {
          v8 = 0;
          v9 = result + 1;
          while (1)
          {
            v10 = *v9;
            if (v10 < 0x30 || v10 >= v7)
            {
              if (v10 < 0x41 || v10 >= v6)
              {
                v12 = 0;
                v13 = 1;
                if (v10 < 0x61 || v10 >= v5)
                  return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
                v11 = -87;
              }
              else
              {
                v11 = -55;
              }
            }
            else
            {
              v11 = -48;
            }
            v14 = (int)v8 * (uint64_t)(int)a3;
            if (v14 != (int)v14)
              goto LABEL_72;
            v15 = v10 + v11;
            v8 = v14 - v15;
            if (__OFSUB__((_DWORD)v14, v15))
              goto LABEL_72;
            ++v9;
            if (!--v4)
              goto LABEL_48;
          }
        }
LABEL_71:
        v12 = 0;
        v13 = 0;
        return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
      }
      goto LABEL_72;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_24394A658()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;

  v0 = sub_24396FBF0();
  v4 = sub_24394A6D4(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_24394A6D4(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  unint64_t v12;
  uint64_t v13;
  _QWORD v14[3];

  if ((a4 & 0x1000000000000000) != 0)
  {
    v9 = sub_24394A818(a1, a2, a3, a4);
    if (v9)
    {
      v10 = v9;
      v11 = sub_24394A218(v9, 0);
      v12 = sub_24394A904((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (v12 != v10)
      {
        __break(1u);
        goto LABEL_9;
      }
    }
    else
    {
      v11 = (_QWORD *)MEMORY[0x24BEE4AF8];
    }
    v13 = MEMORY[0x2494FD3A8](v11 + 4, v11[2]);
    swift_release();
    return v13;
  }
  else
  {
    if ((a4 & 0x2000000000000000) == 0)
    {
      if ((a3 & 0x1000000000000000) != 0)
LABEL_12:
        JUMPOUT(0x2494FD3A8);
LABEL_9:
      sub_24396FE84();
      goto LABEL_12;
    }
    v14[0] = a3;
    v14[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    return MEMORY[0x2494FD3A8]((char *)v14 + (a1 >> 16), (a2 >> 16) - (a1 >> 16));
  }
}

unint64_t sub_24394A818(unint64_t result, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;

  v7 = result;
  v8 = (a3 >> 59) & 1;
  if ((a4 & 0x1000000000000000) == 0)
    LOBYTE(v8) = 1;
  v9 = 4 << v8;
  if ((result & 0xC) == 4 << v8)
  {
    result = sub_24394A27C(result, a3, a4);
    v7 = result;
  }
  if ((a2 & 0xC) == v9)
  {
    result = sub_24394A27C(a2, a3, a4);
    a2 = result;
    if ((a4 & 0x1000000000000000) == 0)
      return (a2 >> 16) - (v7 >> 16);
  }
  else if ((a4 & 0x1000000000000000) == 0)
  {
    return (a2 >> 16) - (v7 >> 16);
  }
  v10 = HIBYTE(a4) & 0xF;
  if ((a4 & 0x2000000000000000) == 0)
    v10 = a3 & 0xFFFFFFFFFFFFLL;
  if (v10 < v7 >> 16)
  {
    __break(1u);
  }
  else if (v10 >= a2 >> 16)
  {
    return sub_24396FBC0();
  }
  __break(1u);
  return result;
}

unint64_t sub_24394A904(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
{
  _QWORD *v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  char v19;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v26;
  unint64_t v27;
  _QWORD v28[2];

  v9 = (_QWORD *)result;
  if (!a2)
    goto LABEL_5;
  if (!a3)
  {
    v12 = a4;
    v11 = 0;
    goto LABEL_33;
  }
  if (a3 < 0)
    goto LABEL_36;
  v10 = a5 >> 14;
  v27 = a4 >> 14;
  if (a4 >> 14 == a5 >> 14)
  {
LABEL_5:
    v11 = 0;
    v12 = a4;
LABEL_33:
    *v9 = a4;
    v9[1] = a5;
    v9[2] = a6;
    v9[3] = a7;
    v9[4] = v12;
    return v11;
  }
  v11 = 0;
  v14 = (a6 >> 59) & 1;
  if ((a7 & 0x1000000000000000) == 0)
    LOBYTE(v14) = 1;
  v15 = 4 << v14;
  v21 = (a7 & 0xFFFFFFFFFFFFFFFLL) + 32;
  v22 = a7 & 0xFFFFFFFFFFFFFFLL;
  v16 = HIBYTE(a7) & 0xF;
  if ((a7 & 0x2000000000000000) == 0)
    v16 = a6 & 0xFFFFFFFFFFFFLL;
  v23 = v16;
  v26 = a3 - 1;
  v12 = a4;
  while (1)
  {
    v17 = v12 & 0xC;
    result = v12;
    if (v17 == v15)
      result = sub_24394A27C(v12, a6, a7);
    if (result >> 14 < v27 || result >> 14 >= v10)
      break;
    if ((a7 & 0x1000000000000000) != 0)
    {
      result = sub_24396FBCC();
      v19 = result;
      if (v17 != v15)
        goto LABEL_23;
    }
    else
    {
      v18 = result >> 16;
      if ((a7 & 0x2000000000000000) != 0)
      {
        v28[0] = a6;
        v28[1] = v22;
        v19 = *((_BYTE *)v28 + v18);
        if (v17 != v15)
          goto LABEL_23;
      }
      else
      {
        result = v21;
        if ((a6 & 0x1000000000000000) == 0)
          result = sub_24396FE84();
        v19 = *(_BYTE *)(result + v18);
        if (v17 != v15)
        {
LABEL_23:
          if ((a7 & 0x1000000000000000) == 0)
            goto LABEL_24;
          goto LABEL_27;
        }
      }
    }
    result = sub_24394A27C(v12, a6, a7);
    v12 = result;
    if ((a7 & 0x1000000000000000) == 0)
    {
LABEL_24:
      v12 = (v12 & 0xFFFFFFFFFFFF0000) + 65540;
      goto LABEL_29;
    }
LABEL_27:
    if (v23 <= v12 >> 16)
      goto LABEL_35;
    v12 = sub_24396FBA8();
LABEL_29:
    *(_BYTE *)(a2 + v11) = v19;
    if (v26 == v11)
    {
      v11 = a3;
      goto LABEL_33;
    }
    ++v11;
    if (v10 == v12 >> 14)
      goto LABEL_33;
  }
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

uint64_t _s25PeopleSuggesterLighthouse15TrialIdentifierV2eeoiySbAC_ACtFZ_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t result;
  char v12;

  v2 = a1[2];
  v4 = a1[3];
  v3 = a1[4];
  v5 = a1[5];
  v6 = a2[2];
  v7 = a2[3];
  v8 = a2[4];
  v9 = a2[5];
  if (*a1 == *a2 && a1[1] == a2[1] || (v10 = sub_24396FF8C(), result = 0, (v10 & 1) != 0))
  {
    if (v2 == v6 && v4 == v7 || (v12 = sub_24396FF8C(), result = 0, (v12 & 1) != 0))
    {
      if (v3 == v8 && v5 == v9)
        return 1;
      else
        return sub_24396FF8C();
    }
  }
  return result;
}

uint64_t _s25PeopleSuggesterLighthouse16ComputationStateO2eeoiySbAC_ACtFZ_0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  char v6;

  v2 = *a1;
  v3 = a1[1];
  v4 = *a2;
  v5 = a2[1];
  switch(v3)
  {
    case 0uLL:
      if (v5)
        goto LABEL_13;
      v3 = 0;
      v6 = 1;
      break;
    case 1uLL:
      if (v5 != 1)
        goto LABEL_13;
      v3 = 1;
      v6 = 1;
      break;
    case 2uLL:
      if (v5 != 2)
        goto LABEL_13;
      v6 = 1;
      v3 = 2;
      break;
    case 3uLL:
      if (v5 != 3)
        goto LABEL_13;
      v6 = 1;
      v3 = 3;
      break;
    case 4uLL:
      if (v5 != 4)
        goto LABEL_13;
      v6 = 1;
      v3 = 4;
      break;
    default:
      if (v5 >= 5)
      {
        if (v2 == v4 && v3 == v5)
          v6 = 1;
        else
          v6 = sub_24396FF8C();
      }
      else
      {
LABEL_13:
        v6 = 0;
      }
      sub_24394B3AC(v4, v5);
      sub_24394B3AC(v2, v3);
      break;
  }
  sub_24394B3C0(v2, v3);
  sub_24394B3C0(v4, v5);
  return v6 & 1;
}

uint64_t sub_24394AD24(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2572D9E88);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24394AD6C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2572D9E88);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24394ADB4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_24394ADF0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2572D9E98;
  if (!qword_2572D9E98)
  {
    v1 = sub_24396FA04();
    result = MEMORY[0x2494FDCE4](MEMORY[0x24BDCE990], v1);
    atomic_store(result, (unint64_t *)&qword_2572D9E98);
  }
  return result;
}

uint64_t sub_24394AE38(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_release();
  }
  return swift_release();
}

uint64_t __swift_memcpy5_4(uint64_t result, int *a2)
{
  int v2;

  v2 = *a2;
  *(_BYTE *)(result + 4) = *((_BYTE *)a2 + 4);
  *(_DWORD *)result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for SubtaskName(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 5))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for SubtaskName(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_BYTE *)(result + 4) = 0;
    *(_DWORD *)result = a2 - 1;
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 5) = v3;
  return result;
}

uint64_t sub_24394AEE0(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 4))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_24394AF00(uint64_t result, int a2)
{
  if (a2)
  {
    *(_DWORD *)result = a2 - 1;
    *(_BYTE *)(result + 4) = 1;
  }
  else
  {
    *(_BYTE *)(result + 4) = 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for SubtaskName()
{
  return &type metadata for SubtaskName;
}

unint64_t destroy for ComputationState(uint64_t a1)
{
  unint64_t result;

  result = *(_QWORD *)(a1 + 8);
  if (result >= 0xFFFFFFFF)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t _s25PeopleSuggesterLighthouse16ComputationStateOwCP_0(uint64_t a1, uint64_t a2)
{
  unint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if (v3 < 0xFFFFFFFF)
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  else
  {
    *(_QWORD *)a1 = *(_QWORD *)a2;
    *(_QWORD *)(a1 + 8) = v3;
    swift_bridgeObjectRetain();
  }
  return a1;
}

_QWORD *assignWithCopy for ComputationState(_QWORD *a1, _QWORD *a2)
{
  unint64_t v4;

  v4 = a2[1];
  if (a1[1] < 0xFFFFFFFFuLL)
  {
    if (v4 >= 0xFFFFFFFF)
    {
      *a1 = *a2;
      a1[1] = a2[1];
      swift_bridgeObjectRetain();
      return a1;
    }
LABEL_7:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  if (v4 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t assignWithTake for ComputationState(uint64_t a1, uint64_t a2)
{
  unint64_t v4;

  if (*(_QWORD *)(a1 + 8) < 0xFFFFFFFFuLL)
    goto LABEL_5;
  v4 = *(_QWORD *)(a2 + 8);
  if (v4 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
LABEL_5:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ComputationState(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  unsigned int v4;
  unsigned int v5;

  if (!a2)
    return 0;
  if (a2 > 0x7FFFFFFA && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 2147483643);
  v3 = *(_QWORD *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 + 1;
  v5 = v3 - 4;
  if (v4 >= 6)
    return v5;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for ComputationState(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 >= 0x7FFFFFFB)
  {
    *(_QWORD *)result = 0;
    *(_QWORD *)(result + 8) = 0;
    *(_DWORD *)result = a2 - 2147483643;
    if (a3 >= 0x7FFFFFFB)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFB)
      *(_BYTE *)(result + 16) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = a2 + 4;
  }
  return result;
}

uint64_t sub_24394B148(uint64_t a1)
{
  unint64_t v1;

  v1 = *(_QWORD *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  return (v1 + 1);
}

_QWORD *sub_24394B160(_QWORD *result, int a2)
{
  if (a2 < 0)
  {
    *result = a2 ^ 0x80000000;
    result[1] = 0;
  }
  else if (a2)
  {
    result[1] = (a2 - 1);
  }
  return result;
}

ValueMetadata *type metadata accessor for ComputationState()
{
  return &type metadata for ComputationState;
}

uint64_t destroy for TrialIdentifier()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for TrialIdentifier(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for TrialIdentifier(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy48_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

_QWORD *assignWithTake for TrialIdentifier(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for TrialIdentifier(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 48))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for TrialIdentifier(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 48) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 48) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for TrialIdentifier()
{
  return &type metadata for TrialIdentifier;
}

uint64_t sub_24394B3AC(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >= 5)
    return swift_bridgeObjectRetain();
  return result;
}

uint64_t sub_24394B3C0(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >= 5)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t sub_24394B3D4()
{
  void *v0;
  id v1;
  id v2;
  id v3;
  id v4;
  uint64_t v5;

  v1 = objc_msgSend(v0, sel_domainIdentifier);
  if (v1)
  {

    v2 = objc_msgSend(v0, sel_domainIdentifier);
  }
  else
  {
    v3 = objc_msgSend(v0, sel_derivedIntentIdentifier);
    if (!v3)
      return 0;

    v2 = objc_msgSend(v0, sel_derivedIntentIdentifier);
  }
  v4 = v2;
  if (!v4)
    return 0;
  v5 = sub_24396FB60();

  return v5;
}

id sub_24394B48C(uint64_t a1, unint64_t a2)
{
  void *v2;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  id v14;
  uint64_t v15;
  id v17[2];

  v17[1] = *(id *)MEMORY[0x24BDAC8D0];
  v5 = sub_24396FC08();
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_14;
  }
  v6 = (void *)v5;
  v17[0] = 0;
  v7 = objc_msgSend(v2, sel_lh_queryInteractionsUsingPredicate_sortDescriptors_limit_error_, a1, v5, a2, v17);

  v8 = v17[0];
  if (!v7)
  {
    v14 = v17[0];
    sub_24396F8CC();

    goto LABEL_11;
  }
  a1 = sub_24396FC14();
  v9 = v8;

  if (*(_QWORD *)(a1 + 16) == a2)
  {
    if (qword_2572D9D10 == -1)
    {
LABEL_5:
      v10 = sub_24396FAE8();
      __swift_project_value_buffer(v10, (uint64_t)qword_2572DA2B0);
      v11 = sub_24396FAD0();
      v12 = sub_24396FD04();
      if (os_log_type_enabled(v11, v12))
      {
        v13 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)v13 = 134217984;
        v17[0] = (id)a2;
        sub_24396FD94();
        _os_log_impl(&dword_243921000, v11, v12, "interactionsFetchLimit=%lu reached while loading interactions from the store", v13, 0xCu);
        MEMORY[0x2494FDD74](v13, -1, -1);
      }

      goto LABEL_8;
    }
LABEL_14:
    swift_once();
    goto LABEL_5;
  }
LABEL_8:
  v14 = (id)sub_24394B6DC(a1);
  swift_bridgeObjectRelease();
  if (!v14)
  {
    sub_24393DE88();
    swift_allocError();
    *(_QWORD *)v15 = 0xD00000000000002ALL;
    *(_QWORD *)(v15 + 8) = 0x800000024397A3F0;
    *(_BYTE *)(v15 + 16) = 1;
LABEL_11:
    swift_willThrow();
  }
  return v14;
}

uint64_t sub_24394B6DC(uint64_t a1)
{
  uint64_t v2;
  uint64_t i;
  _BYTE v5[32];
  uint64_t v6;

  v6 = MEMORY[0x24BEE4AF8];
  v2 = *(_QWORD *)(a1 + 16);
  sub_24396FEA8();
  if (!v2)
    return v6;
  for (i = a1 + 32; ; i += 32)
  {
    sub_243946B14(i, (uint64_t)v5);
    sub_24393E124(0, &qword_2572DA0E0);
    if (!swift_dynamicCast())
      break;
    sub_24396FE90();
    sub_24396FEB4();
    sub_24396FEC0();
    sub_24396FE9C();
    if (!--v2)
      return v6;
  }
  swift_release();

  return 0;
}

uint64_t sub_24394B7F4()
{
  void *v0;
  id v1;
  id v2;
  void *v3;
  unint64_t v4;
  uint64_t v5;
  id v6;
  id v7;

  v1 = objc_msgSend(v0, sel_sender);

  v2 = objc_msgSend(v0, sel_recipients);
  v3 = v2;
  if (v1)
  {
    if (v2)
    {
      sub_24393E124(0, &qword_2572D9D68);
      v4 = sub_24396FC14();

    }
    else
    {
      v4 = MEMORY[0x24BEE4AF8];
    }
    v5 = sub_24396BA7C(v4);
    swift_bridgeObjectRelease();
    v6 = objc_msgSend(v0, sel_sender);
    swift_bridgeObjectRetain();
    v7 = v6;
    MEMORY[0x2494FD42C]();
    if (*(_QWORD *)(v5 + 16) >= *(_QWORD *)(v5 + 24) >> 1)
      sub_24396FC38();
    sub_24396FC50();
    sub_24396FC2C();
    swift_bridgeObjectRelease();

    __swift_instantiateConcreteTypeFromMangledName(&qword_2572D9EE0);
    sub_24394D310(&qword_2572D9EE8, &qword_2572D9EE0, MEMORY[0x24BEE4AB0]);
    sub_24396FC5C();
  }
  else
  {
    if (v2)
    {
      sub_24393E124(0, &qword_2572D9D68);
      sub_24396FC14();

    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_2572D9D48);
    sub_24394D310((unint64_t *)&qword_2572D9D50, &qword_2572D9D58, MEMORY[0x24BEE12A8]);
    sub_24396FD88();
  }
  swift_bridgeObjectRelease();
  return sub_24396FF80();
}

id sub_24394BA1C()
{
  void *v0;
  id result;
  void *v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  _QWORD *v16;

  result = objc_msgSend(v0, sel_attachments);
  if (result)
  {

    result = objc_msgSend(v0, sel_attachments);
    if (!result)
    {
LABEL_23:
      __break(1u);
      return result;
    }
    v2 = result;
    sub_24393E124(0, (unint64_t *)&qword_2572D9EF0);
    v3 = sub_24396FC14();

    if (v3 >> 62)
    {
      swift_bridgeObjectRetain();
      result = (id)sub_24396FF20();
      v4 = (uint64_t)result;
      if (result)
        goto LABEL_5;
    }
    else
    {
      v4 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
      result = (id)swift_bridgeObjectRetain();
      if (v4)
      {
LABEL_5:
        if (v4 >= 1)
        {
          v5 = 0;
          v6 = (_QWORD *)MEMORY[0x24BEE4AF8];
          do
          {
            if ((v3 & 0xC000000000000001) != 0)
              v7 = (id)MEMORY[0x2494FD69C](v5, v3);
            else
              v7 = *(id *)(v3 + 8 * v5 + 32);
            v8 = v7;
            v9 = objc_msgSend(v7, sel_photoSceneDescriptor);
            if (v9)
            {
              v10 = v9;
              v11 = sub_24396FB60();
              v13 = v12;

              if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
                v6 = sub_2439647D4(0, v6[2] + 1, 1, v6);
              v15 = v6[2];
              v14 = v6[3];
              if (v15 >= v14 >> 1)
                v6 = sub_2439647D4((_QWORD *)(v14 > 1), v15 + 1, 1, v6);
              v6[2] = v15 + 1;
              v16 = &v6[2 * v15];
              v16[4] = v11;
              v16[5] = v13;
            }
            else
            {

            }
            ++v5;
          }
          while (v4 != v5);
          goto LABEL_21;
        }
        __break(1u);
        goto LABEL_23;
      }
    }
    v6 = (_QWORD *)MEMORY[0x24BEE4AF8];
LABEL_21:
    swift_bridgeObjectRelease_n();
    sub_243967780((uint64_t)v6);
    swift_bridgeObjectRelease();
    sub_24396FCD4();
    swift_bridgeObjectRelease();
    return (id)sub_24396FF80();
  }
  return result;
}

uint64_t sub_24394BC68(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t i;
  uint64_t v4;
  _BOOL8 v5;
  BOOL v6;

  v2 = *(_QWORD *)(a2 + 16);
  if (!v2)
    return 0;
  if (*(_DWORD *)(a2 + 32) == (_DWORD)result)
    return 1;
  if (v2 == 1)
    return 0;
  for (i = 9; ; ++i)
  {
    v4 = i - 7;
    if (__OFADD__(i - 8, 1))
      break;
    v6 = *(_DWORD *)(a2 + 4 * i) == (_DWORD)result;
    v5 = v6;
    v6 = v6 || v4 == v2;
    if (v6)
      return v5;
  }
  __break(1u);
  return result;
}

uint64_t sub_24394BCCC(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_24394BEE0(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_24394BCE8(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_24394C03C(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_24394BD04(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_24394C198(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

uint64_t sub_24394BD20(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_24394C320(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_24394BD3C(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_24394C48C(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_24394BD58(char a1, int64_t a2, char a3, _QWORD *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = a4[2];
  if (v7 <= v8)
    v9 = a4[2];
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2572D9E68);
    v10 = (_QWORD *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 17;
    v10[2] = v8;
    v10[3] = 2 * (v12 >> 4);
  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  v13 = (unint64_t)(v10 + 4);
  v14 = (unint64_t)(a4 + 4);
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= v14 + 16 * v8)
      memmove(v10 + 4, a4 + 4, 16 * v8);
    a4[2] = 0;
    goto LABEL_30;
  }
  if (v14 >= v13 + 16 * v8 || v13 >= v14 + 16 * v8)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2572D9E70);
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_24396FF5C();
  __break(1u);
  return result;
}

uint64_t sub_24394BEE0(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2572D9EC8);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 29;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 2);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[4 * v8])
      memmove(v13, v14, 4 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[4 * v8] || v13 >= &v14[4 * v8])
  {
    memcpy(v13, v14, 4 * v8);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_24396FF5C();
  __break(1u);
  return result;
}

uint64_t sub_24394C03C(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2572D9EF8);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 29;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 2);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[4 * v8])
      memmove(v13, v14, 4 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[4 * v8] || v13 >= &v14[4 * v8])
  {
    memcpy(v13, v14, 4 * v8);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_24396FF5C();
  __break(1u);
  return result;
}

uint64_t sub_24394C198(char a1, int64_t a2, char a3, _QWORD *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = a4[2];
  if (v7 <= v8)
    v9 = a4[2];
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2572D9ED0);
    v10 = (_QWORD *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 25;
    v10[2] = v8;
    v10[3] = 2 * (v12 >> 3);
  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  v13 = (unint64_t)(v10 + 4);
  v14 = (unint64_t)(a4 + 4);
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= v14 + 8 * v8)
      memmove(v10 + 4, a4 + 4, 8 * v8);
    a4[2] = 0;
    goto LABEL_30;
  }
  if (v14 >= v13 + 8 * v8 || v13 >= v14 + 8 * v8)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2572D9ED8);
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_24396FF5C();
  __break(1u);
  return result;
}

uint64_t sub_24394C320(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2572DA0F0);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 1;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 5);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8])
      memmove(v13, v14, 32 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[32 * v8] || v13 >= &v14[32 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_24396FF5C();
  __break(1u);
  return result;
}

uint64_t sub_24394C48C(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2572DA030);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 17;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8])
      memmove(v13, v14, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_24396FF5C();
  __break(1u);
  return result;
}

id sub_24394C5F4(void *a1, uint64_t a2, uint64_t a3)
{
  int v5;
  id result;
  void *v7;
  unint64_t v8;
  double v9;
  double v10;
  id v11;
  id v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  const char *v17;
  unint64_t v18;
  uint64_t v19;
  int v20;
  unint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t v24;

  v5 = *(unsigned __int8 *)(a2 + 58);
  result = objc_msgSend(objc_allocWithZone((Class)PeoplePredictionDataFeatureValue), sel_init);
  if (result)
  {
    v7 = result;
    if (objc_msgSend(a1, sel_hasBoolValue))
    {
      objc_msgSend(v7, sel_setBoolValue_, objc_msgSend(a1, sel_BOOLValue));
      v8 = 1;
    }
    else
    {
      v8 = 0;
    }
    if (objc_msgSend(a1, sel_hasIntValue))
    {
      objc_msgSend(v7, sel_setIntValue_, sub_2439694C0((uint64_t)objc_msgSend(a1, sel_intValue), v5));
      ++v8;
    }
    if (objc_msgSend(a1, sel_hasDoubleValue))
    {
      objc_msgSend(a1, sel_doubleValue);
      v10 = v9;
      if ((objc_msgSend((id)objc_opt_self(), sel_isInternalDevice) & v5) == 1)
        v10 = round(v10 * 1000.0) / 1000.0;
      objc_msgSend(v7, sel_setDoubleValue_, v10);
      ++v8;
    }
    v11 = objc_msgSend(a1, sel_stringValue);
    if (v11)
    {

      v12 = objc_msgSend(a1, sel_stringValue);
      objc_msgSend(v7, sel_setStringValue_, v12);

      ++v8;
    }
    if (objc_msgSend(a1, sel_timeBucketValue))
    {
      objc_msgSend(v7, sel_setTimeBucketValue_, objc_msgSend(a1, sel_timeBucketValue));
      ++v8;
    }
    else if (!v8)
    {
      v24 = MEMORY[0x24BEE4AF8];
      sub_24394BCCC(0, 18, 0);
      v18 = *(_QWORD *)(v24 + 16);
      v19 = 0x20u;
      do
      {
        v20 = *(_DWORD *)((char *)&unk_251410550 + v19);
        v21 = *(_QWORD *)(v24 + 24);
        if (v18 >= v21 >> 1)
          sub_24394BCCC(v21 > 1, v18 + 1, 1);
        *(_QWORD *)(v24 + 16) = v18 + 1;
        *(_DWORD *)(v24 + 4 * v18 + 32) = v20;
        v19 += 4;
        ++v18;
      }
      while (v19 != 104);
      v22 = sub_24394BC68(a3, v24);
      swift_release();
      if ((v22 & 1) != 0)
        return v7;
      if (qword_2572D9D10 != -1)
        swift_once();
      v23 = sub_24396FAE8();
      __swift_project_value_buffer(v23, (uint64_t)qword_2572DA2B0);
      v14 = sub_24396FAD0();
      v15 = sub_24396FD1C();
      if (!os_log_type_enabled(v14, v15))
        goto LABEL_22;
      v16 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v16 = 67109120;
      sub_24396FD94();
      v17 = "All nil values found for feature %d";
      goto LABEL_21;
    }
    if (v8 < 2)
      return v7;
    if (qword_2572D9D10 != -1)
      swift_once();
    v13 = sub_24396FAE8();
    __swift_project_value_buffer(v13, (uint64_t)qword_2572DA2B0);
    v14 = sub_24396FAD0();
    v15 = sub_24396FD1C();
    if (!os_log_type_enabled(v14, v15))
    {
LABEL_22:

      return v7;
    }
    v16 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v16 = 67109120;
    sub_24396FD94();
    v17 = "Duplicate values found for feature %d";
LABEL_21:
    _os_log_impl(&dword_243921000, v14, v15, v17, v16, 8u);
    MEMORY[0x2494FDD74](v16, -1, -1);
    goto LABEL_22;
  }
  __break(1u);
  return result;
}

uint64_t sub_24394CA44()
{
  sub_24396FE48();
  type metadata accessor for BMMLSEVirtualFeatureStoreFeaturefeatureName(0);
  sub_24396FECC();
  sub_24396FB90();
  sub_24396FF80();
  sub_24396FB90();
  swift_bridgeObjectRelease();
  sub_24396FB90();
  return 0;
}

void sub_24394CB18(void **a1, const void *a2, void *a3)
{
  uint64_t v3;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  id v25;
  NSObject *v26;
  os_log_type_t v27;
  uint8_t *v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t __dst[44];
  uint64_t v33;

  v6 = *a1;
  v7 = objc_msgSend(objc_allocWithZone((Class)PeoplePredictionDataFeature), sel_init);
  if (!v7)
  {
    sub_24393DE88();
    swift_allocError();
    *(_QWORD *)v16 = 0xD00000000000002ALL;
    *(_QWORD *)(v16 + 8) = 0x800000024397A460;
    *(_BYTE *)(v16 + 16) = 1;
    swift_willThrow();
    return;
  }
  v8 = v7;
  v9 = objc_msgSend(v6, sel_featureName);
  objc_msgSend(v8, sel_setFeatureName_, v9);
  objc_msgSend(v8, sel_setFeatureItselfVersion_, objc_msgSend(v6, sel_featureItselfVersion));
  objc_msgSend(v8, sel_setFeatureFreshnessInHours_, objc_msgSend(v6, sel_featureFreshnessInHours));
  objc_msgSend(v8, sel_setEventVolumeToComputeFeature_, objc_msgSend(v6, sel_eventVolumeToComputeFeature));
  objc_msgSend(v8, sel_setTimeSpentToComputeFeature_, objc_msgSend(v6, sel_timeSpentToComputeFeature));
  v10 = objc_msgSend(v6, sel_featureValue);
  if (!v10)
  {
    if (qword_2572D9D10 != -1)
      swift_once();
    v17 = sub_24396FAE8();
    __swift_project_value_buffer(v17, (uint64_t)qword_2572DA2B0);
    v11 = v6;
    v18 = sub_24396FAD0();
    v19 = sub_24396FD10();
    if (os_log_type_enabled(v18, v19))
    {
      v20 = (uint8_t *)swift_slowAlloc();
      v21 = swift_slowAlloc();
      *(_DWORD *)v20 = 136315138;
      __dst[0] = v21;
      objc_msgSend(v11, sel_featureName);
      v22 = sub_24394CA44();
      v33 = sub_2439420BC(v22, v23, __dst);
      sub_24396FD94();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_243921000, v18, v19, "Missing feature value in biome event for %s", v20, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2494FDD74](v21, -1, -1);
      MEMORY[0x2494FDD74](v20, -1, -1);

      return;
    }

    goto LABEL_13;
  }
  v11 = v10;
  memcpy(__dst, a2, 0x158uLL);
  v12 = sub_24394C5F4(v11, (uint64_t)__dst, (uint64_t)v9);
  if (v3)
  {
LABEL_13:

    goto LABEL_14;
  }
  v13 = v12;
  if (!v12)
  {
    if (qword_2572D9D10 != -1)
      swift_once();
    v24 = sub_24396FAE8();
    __swift_project_value_buffer(v24, (uint64_t)qword_2572DA2B0);
    v25 = v6;
    v26 = sub_24396FAD0();
    v27 = sub_24396FD10();
    if (os_log_type_enabled(v26, v27))
    {
      v28 = (uint8_t *)swift_slowAlloc();
      v31 = swift_slowAlloc();
      __dst[0] = v31;
      *(_DWORD *)v28 = 136315138;
      objc_msgSend(v25, sel_featureName);
      v29 = sub_24394CA44();
      v33 = sub_2439420BC(v29, v30, __dst);
      sub_24396FD94();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_243921000, v26, v27, "Missing feature value for %s", v28, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2494FDD74](v31, -1, -1);
      MEMORY[0x2494FDD74](v28, -1, -1);

      return;
    }

LABEL_14:
    return;
  }
  objc_msgSend(v8, sel_setFeatureValue_, v12);
  v14 = objc_msgSend(a3, sel_featureVectors);
  if (v14)
  {
    v15 = v14;
    objc_msgSend(v14, sel_addObject_, v8);

  }
  else
  {
    __break(1u);
  }
}

id sub_24394D034(void *a1, const void *a2)
{
  uint64_t v2;
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE __dst[344];
  void *v18;

  memcpy(__dst, a2, sizeof(__dst));
  v4 = objc_msgSend(objc_allocWithZone((Class)PeoplePredictionDataMLSEVirtualFeatureStore), sel_init);
  if (v4)
  {
    objc_msgSend(v4, sel_setFeatureVersion_, objc_msgSend(a1, sel_featureVersion));
    v5 = objc_msgSend(a1, sel_deviceIdentifier);
    if (v5)
    {
      v6 = v5;
      objc_msgSend(v4, sel_setDeviceIdentifier_, v5);

    }
    sub_24393E124(0, &qword_2572DA070);
    v7 = (void *)MEMORY[0x2494FD588](MEMORY[0x24BEE4AF8]);
    objc_msgSend(v4, sel_setFeatureVectors_, v7);

    v8 = objc_msgSend(a1, sel_featureVector);
    sub_24393E124(0, &qword_2572D9EC0);
    v9 = sub_24396FC14();

    if (v9 >> 62)
      goto LABEL_18;
    v10 = *(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    for (; v10; v10 = sub_24396FF20())
    {
      v11 = 4;
      while (1)
      {
        v12 = (v9 & 0xC000000000000001) != 0
            ? (id)MEMORY[0x2494FD69C](v11 - 4, v9)
            : *(id *)(v9 + 8 * v11);
        v13 = v12;
        v14 = v11 - 3;
        if (__OFADD__(v11 - 4, 1))
          break;
        v18 = v12;
        sub_24394CB18(&v18, __dst, v4);
        if (v2)
        {

          swift_bridgeObjectRelease_n();
          return v4;
        }

        ++v11;
        if (v14 == v10)
          goto LABEL_13;
      }
      __break(1u);
LABEL_18:
      swift_bridgeObjectRetain();
    }
LABEL_13:
    swift_bridgeObjectRelease_n();
  }
  else
  {
    sub_24393DE88();
    swift_allocError();
    *(_QWORD *)v15 = 0xD000000000000031;
    *(_QWORD *)(v15 + 8) = 0x800000024397A420;
    *(_BYTE *)(v15 + 16) = 1;
    swift_willThrow();
  }
  return v4;
}

unint64_t sub_24394D2B8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2572D9D60;
  if (!qword_2572D9D60)
  {
    v1 = sub_24393E124(255, &qword_2572D9D68);
    result = MEMORY[0x2494FDCE4](MEMORY[0x24BEE5BD8], v1);
    atomic_store(result, (unint64_t *)&qword_2572D9D60);
  }
  return result;
}

uint64_t sub_24394D310(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;
  unint64_t v7;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v7 = sub_24394D2B8();
    result = MEMORY[0x2494FDCE4](a3, v6, &v7);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_24394D370(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_24394D3AC + 4 * byte_243971760[a1]))(0xD000000000000021, 0x800000024397AB50);
}

unint64_t sub_24394D3AC()
{
  return 0xD000000000000011;
}

uint64_t sub_24394D3D4()
{
  uint64_t v0;

  return v0 + 31;
}

id ConfigManager.streamDurableFeatureStore.getter()
{
  uint64_t v0;

  return *(id *)(v0 + 32);
}

id ConfigManager.streamVirtualFeatureStore.getter()
{
  uint64_t v0;

  return *(id *)(v0 + 40);
}

uint64_t ConfigManager.shouldHarvestData.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 56);
}

uint64_t ConfigManager.shouldSendMetrics.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 57);
}

uint64_t ConfigManager.shouldAttemptLocalTraining.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 72);
}

uint64_t ConfigManager.shouldAttemptModelMonitoring.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 73);
}

uint64_t ConfigManager.shouldAttemptShadowEvaluation.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 74);
}

void *ConfigManager.init(recipe:)@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  void *v4;
  id v5;
  id v6;
  _BYTE __src[344];

  v4 = (void *)objc_opt_self();
  v5 = objc_msgSend(v4, sel_lh_defaultDatabaseDirectory);
  if (!v5)
  {
    sub_24396FB60();
    v5 = (id)sub_24396FB48();
    swift_bridgeObjectRelease();
  }
  v6 = objc_msgSend(v4, sel_lh_storeWithDirectory_readOnly_, v5, 1);

  sub_24394D738(a1, v6, (uint64_t)__src);
  return memcpy(a2, __src, 0x158uLL);
}

uint64_t sub_24394D738@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  int64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  int v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
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
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  _QWORD *v56;
  unint64_t v57;
  unint64_t v58;
  int64_t v59;
  unint64_t v60;
  _QWORD *v61;
  int64_t v62;
  _QWORD *v63;
  unint64_t v64;
  unint64_t v65;
  int64_t v66;
  unint64_t v67;
  _QWORD *v68;
  int64_t v69;
  _QWORD *v70;
  unint64_t v71;
  unint64_t v72;
  int64_t v73;
  unint64_t v74;
  _QWORD *v75;
  int64_t v76;
  _QWORD *v77;
  unint64_t v78;
  unint64_t v79;
  int64_t v80;
  unint64_t v81;
  _QWORD *v82;
  int64_t v83;
  _QWORD *v84;
  unint64_t v85;
  unint64_t v86;
  int64_t v87;
  unint64_t v88;
  _QWORD *v89;
  int64_t v90;
  _QWORD *v91;
  unint64_t v92;
  unint64_t v93;
  int64_t v94;
  unint64_t v95;
  _QWORD *v96;
  int64_t v97;
  _QWORD *v98;
  double v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  double v106;
  uint64_t v107;
  uint64_t result;
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
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  char v134;
  char v135;
  char v136;
  uint64_t v137;
  uint64_t v138;
  char v139;
  char v140;
  char v141;
  id v142;
  id v143;
  id v144;
  id v145;
  uint64_t v147;

  v4 = qword_2572D9D00;
  v145 = a2;
  if (v4 != -1)
    goto LABEL_65;
  while (1)
  {
    v5 = qword_2572DA2A8;
    v6 = *(_QWORD *)(qword_2572DA2A8 + 16);
    v7 = MEMORY[0x24BEE4AF8];
    if (v6)
    {
      v147 = MEMORY[0x24BEE4AF8];
      swift_bridgeObjectRetain();
      sub_24394BCCC(0, v6, 0);
      v8 = 0;
      v7 = v147;
      v9 = *(_QWORD *)(v147 + 16);
      do
      {
        v10 = *(_DWORD *)(v5 + 4 * v8 + 32);
        v11 = *(_QWORD *)(v147 + 24);
        if (v9 >= v11 >> 1)
          sub_24394BCCC(v11 > 1, v9 + 1, 1);
        ++v8;
        *(_QWORD *)(v147 + 16) = v9 + 1;
        *(_DWORD *)(v147 + 4 * v9++ + 32) = v10;
      }
      while (v6 != v8);
      swift_bridgeObjectRelease();
    }
    v12 = sub_24394EBD8(a1, 0, v7);
    swift_bridgeObjectRelease();
    v13 = *(_QWORD *)(v12 + 16);
    if (v13)
    {
      swift_bridgeObjectRetain();
      v14 = 0;
      v15 = (char *)MEMORY[0x24BEE4AF8];
      do
      {
        v16 = *(_DWORD *)(v12 + 4 * v14 + 32);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v15 = sub_2439648E0(0, *((_QWORD *)v15 + 2) + 1, 1, v15);
        v18 = *((_QWORD *)v15 + 2);
        v17 = *((_QWORD *)v15 + 3);
        if (v18 >= v17 >> 1)
          v15 = sub_2439648E0((char *)(v17 > 1), v18 + 1, 1, v15);
        ++v14;
        *((_QWORD *)v15 + 2) = v18 + 1;
        *(_DWORD *)&v15[4 * v18 + 32] = v16;
      }
      while (v13 != v14);
      swift_bridgeObjectRelease();
    }
    else
    {
      v15 = (char *)MEMORY[0x24BEE4AF8];
    }
    swift_bridgeObjectRelease();
    v19 = *((_QWORD *)v15 + 2);
    if (!v19)
      break;
    v20 = 0;
    v21 = qword_2572DA2A8;
    v22 = MEMORY[0x24BEE4AF8];
    while (1)
    {
      if (v20 >= *((_QWORD *)v15 + 2))
      {
        __break(1u);
        goto LABEL_64;
      }
      v25 = *(_QWORD *)(v21 + 16);
      if (v25)
      {
        v26 = *(_DWORD *)&v15[4 * v20 + 32];
        if (*(_DWORD *)(v21 + 32) == v26)
          goto LABEL_28;
        if (v25 != 1)
        {
          if (*(_DWORD *)(v21 + 36) == v26)
          {
LABEL_28:
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
              sub_24394BCE8(0, *(_QWORD *)(v22 + 16) + 1, 1);
            v24 = *(_QWORD *)(v22 + 16);
            v23 = *(_QWORD *)(v22 + 24);
            if (v24 >= v23 >> 1)
              sub_24394BCE8(v23 > 1, v24 + 1, 1);
            *(_QWORD *)(v22 + 16) = v24 + 1;
            *(_DWORD *)(v22 + 4 * v24 + 32) = v26;
            goto LABEL_22;
          }
          if (v25 != 2)
            break;
        }
      }
LABEL_22:
      if (++v20 == v19)
      {
        swift_bridgeObjectRelease();
        goto LABEL_38;
      }
    }
    v27 = 10;
    while (1)
    {
      v28 = v27 - 7;
      if (__OFADD__(v27 - 8, 1))
        break;
      if (*(_DWORD *)(v21 + 4 * v27) == v26)
        goto LABEL_28;
      ++v27;
      if (v28 == v25)
        goto LABEL_22;
    }
LABEL_64:
    __break(1u);
LABEL_65:
    swift_once();
  }
  swift_bridgeObjectRelease();
  v22 = MEMORY[0x24BEE4AF8];
LABEL_38:
  v29 = objc_msgSend((id)BiomeLibrary(), sel_MLSE);
  swift_unknownObjectRelease();
  v30 = objc_msgSend(v29, sel_ShareSheet);
  swift_unknownObjectRelease();
  v144 = objc_msgSend(v30, sel_DurableFeatureStore);
  swift_unknownObjectRelease();
  v31 = objc_msgSend((id)BiomeLibrary(), sel_MLSE);
  swift_unknownObjectRelease();
  v32 = objc_msgSend(v31, sel_ShareSheet);
  swift_unknownObjectRelease();
  v143 = objc_msgSend(v32, sel_VirtualFeatureStore);
  swift_unknownObjectRelease();
  v33 = objc_msgSend((id)BiomeLibrary(), sel_MLSE);
  swift_unknownObjectRelease();
  v34 = objc_msgSend(v33, sel_ShareSheet);
  swift_unknownObjectRelease();
  v142 = objc_msgSend(v34, sel_Feedback);
  swift_unknownObjectRelease();
  v141 = sub_24394F060(a1, 1u, 1);
  v140 = sub_24394F060(a1, 2u, 1);
  v139 = sub_24394F060(a1, 3u, 1);
  v138 = sub_24394F428(a1, 4u, 10000);
  v137 = sub_24394F428(a1, 5u, 200);
  v136 = sub_24394F060(a1, 6u, 0);
  v135 = sub_24394F060(a1, 7u, 0);
  v134 = sub_24394F060(a1, 8u, 0);
  v35 = sub_24394F7D4(a1, 9u, 0xD000000000000024, 0x800000024397A490);
  v132 = v36;
  v133 = v35;
  v37 = sub_24394F7D4(a1, 0xAu, 0xD00000000000005DLL, 0x800000024397A4C0);
  v130 = v38;
  v131 = v37;
  v129 = sub_24394F7D4(a1, 0xBu, 825241136, 0xE400000000000000);
  v126 = v39;
  v40 = sub_24394F7D4(a1, 0xCu, 49, 0xE100000000000000);
  v122 = v41;
  v123 = v40;
  v42 = sub_24394F7D4(a1, 0xDu, 12341, 0xE200000000000000);
  v127 = v43;
  v128 = v42;
  v44 = sub_24394F7D4(a1, 0xEu, 55, 0xE100000000000000);
  v124 = v45;
  v125 = v44;
  v46 = sub_24394F7D4(a1, 0xFu, 49, 0xE100000000000000);
  v120 = v47;
  v121 = v46;
  v48 = sub_24394F7D4(a1, 0x10u, 0x6C3A7972616E6962, 0xEF6369747369676FLL);
  v118 = v49;
  v119 = v48;
  v50 = sub_24394F7D4(a1, 0x12u, 0x726F74636576, 0xE600000000000000);
  v116 = v51;
  v117 = v50;
  v52 = sub_24394F7D4(a1, 0x13u, 0xD000000000000012, 0x800000024397A520);
  v114 = v53;
  v115 = v52;
  v54 = sub_24394F7D4(a1, 0x14u, 0xD000000000000011, 0x800000024397A540);
  v112 = v55;
  v113 = v54;
  v56 = sub_2439647D4(0, 1, 1, MEMORY[0x24BEE4AF8]);
  v58 = v56[2];
  v57 = v56[3];
  v59 = v57 >> 1;
  v60 = v58 + 1;
  if (v57 >> 1 <= v58)
  {
    v56 = sub_2439647D4((_QWORD *)(v57 > 1), v58 + 1, 1, v56);
    v57 = v56[3];
    v59 = v57 >> 1;
  }
  v56[2] = v60;
  v61 = &v56[2 * v58];
  v61[4] = 0xD00000000000003DLL;
  v61[5] = 0x800000024397A560;
  v62 = v58 + 2;
  if (v59 < v62)
    v56 = sub_2439647D4((_QWORD *)(v57 > 1), v62, 1, v56);
  v56[2] = v62;
  v63 = &v56[2 * v60];
  v63[4] = 0xD000000000000040;
  v63[5] = 0x800000024397A5A0;
  v65 = v56[2];
  v64 = v56[3];
  v66 = v64 >> 1;
  v67 = v65 + 1;
  if (v64 >> 1 <= v65)
  {
    v56 = sub_2439647D4((_QWORD *)(v64 > 1), v65 + 1, 1, v56);
    v64 = v56[3];
    v66 = v64 >> 1;
  }
  v56[2] = v67;
  v68 = &v56[2 * v65];
  v68[4] = 0xD00000000000003FLL;
  v68[5] = 0x800000024397A5F0;
  v69 = v65 + 2;
  if (v66 < v69)
    v56 = sub_2439647D4((_QWORD *)(v64 > 1), v69, 1, v56);
  v56[2] = v69;
  v70 = &v56[2 * v67];
  v70[4] = 0xD000000000000042;
  v70[5] = 0x800000024397A630;
  v72 = v56[2];
  v71 = v56[3];
  v73 = v71 >> 1;
  v74 = v72 + 1;
  if (v71 >> 1 <= v72)
  {
    v56 = sub_2439647D4((_QWORD *)(v71 > 1), v72 + 1, 1, v56);
    v71 = v56[3];
    v73 = v71 >> 1;
  }
  v56[2] = v74;
  v75 = &v56[2 * v72];
  v75[4] = 0xD000000000000041;
  v75[5] = 0x800000024397A680;
  v76 = v72 + 2;
  if (v73 < v76)
    v56 = sub_2439647D4((_QWORD *)(v71 > 1), v76, 1, v56);
  v56[2] = v76;
  v77 = &v56[2 * v74];
  v77[4] = 0xD000000000000044;
  v77[5] = 0x800000024397A6D0;
  v79 = v56[2];
  v78 = v56[3];
  v80 = v78 >> 1;
  v81 = v79 + 1;
  if (v78 >> 1 <= v79)
  {
    v56 = sub_2439647D4((_QWORD *)(v78 > 1), v79 + 1, 1, v56);
    v78 = v56[3];
    v80 = v78 >> 1;
  }
  v56[2] = v81;
  v82 = &v56[2 * v79];
  v82[4] = 0xD000000000000043;
  v82[5] = 0x800000024397A720;
  v83 = v79 + 2;
  if (v80 < v83)
    v56 = sub_2439647D4((_QWORD *)(v78 > 1), v83, 1, v56);
  v56[2] = v83;
  v84 = &v56[2 * v81];
  v84[4] = 0xD000000000000046;
  v84[5] = 0x800000024397A770;
  v86 = v56[2];
  v85 = v56[3];
  v87 = v85 >> 1;
  v88 = v86 + 1;
  if (v85 >> 1 <= v86)
  {
    v56 = sub_2439647D4((_QWORD *)(v85 > 1), v86 + 1, 1, v56);
    v85 = v56[3];
    v87 = v85 >> 1;
  }
  v56[2] = v88;
  v89 = &v56[2 * v86];
  v89[4] = 0xD00000000000003DLL;
  v89[5] = 0x800000024397A7C0;
  v90 = v86 + 2;
  if (v87 < v90)
    v56 = sub_2439647D4((_QWORD *)(v85 > 1), v90, 1, v56);
  v56[2] = v90;
  v91 = &v56[2 * v88];
  v91[4] = 0xD000000000000040;
  v91[5] = 0x800000024397A800;
  v93 = v56[2];
  v92 = v56[3];
  v94 = v92 >> 1;
  v95 = v93 + 1;
  if (v92 >> 1 <= v93)
  {
    v56 = sub_2439647D4((_QWORD *)(v92 > 1), v93 + 1, 1, v56);
    v92 = v56[3];
    v94 = v92 >> 1;
  }
  v56[2] = v95;
  v96 = &v56[2 * v93];
  v96[4] = 0xD00000000000003FLL;
  v96[5] = 0x800000024397A850;
  v97 = v93 + 2;
  if (v94 < v97)
    v56 = sub_2439647D4((_QWORD *)(v92 > 1), v97, 1, v56);
  v56[2] = v97;
  v98 = &v56[2 * v95];
  v98[4] = 0xD000000000000042;
  v98[5] = 0x800000024397A890;
  v111 = sub_24394F428(a1, 0x15u, 1);
  v99 = sub_24394FC10(a1, 0x16u, 0.7);
  v110 = sub_24394F428(a1, 0x17u, 10);
  v109 = sub_24394F7D4(a1, 0x18u, 7500397, 0xE300000000000000);
  v101 = v100;
  v102 = sub_24394F428(a1, 0x19u, 1);
  v103 = sub_24394F7D4(a1, 0x1Au, 0x7247737961776C61, 0xEE00657461756461);
  v105 = v104;
  v106 = sub_24394FC10(a1, 0x1Bu, 0.05);
  v107 = sub_24394F428(a1, 0x1Cu, 5);

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(a3 + 16) = v22;
  *(_QWORD *)(a3 + 24) = v145;
  *(_QWORD *)(a3 + 32) = v144;
  *(_QWORD *)(a3 + 40) = v143;
  *(_QWORD *)(a3 + 48) = v142;
  *(_QWORD *)(a3 + 64) = v137;
  *(_QWORD *)(a3 + 80) = v133;
  *(_QWORD *)(a3 + 88) = v132;
  *(_QWORD *)(a3 + 96) = v131;
  *(_QWORD *)(a3 + 104) = v130;
  *(_QWORD *)(a3 + 112) = v129;
  *(_QWORD *)(a3 + 120) = v126;
  *(_QWORD *)(a3 + 128) = v123;
  *(_QWORD *)(a3 + 136) = v122;
  *(_QWORD *)a3 = 0x4072C00000000000;
  *(_QWORD *)(a3 + 8) = v138;
  *(_BYTE *)(a3 + 56) = v141 & 1;
  *(_BYTE *)(a3 + 57) = v140 & 1;
  *(_BYTE *)(a3 + 58) = v139 & 1;
  *(_BYTE *)(a3 + 72) = v136 & 1;
  *(_BYTE *)(a3 + 73) = v135 & 1;
  *(_BYTE *)(a3 + 74) = v134 & 1;
  *(_QWORD *)(a3 + 144) = v128;
  *(_QWORD *)(a3 + 152) = v127;
  *(_QWORD *)(a3 + 160) = v125;
  *(_QWORD *)(a3 + 168) = v124;
  *(_QWORD *)(a3 + 176) = v121;
  *(_QWORD *)(a3 + 184) = v120;
  *(_QWORD *)(a3 + 192) = v119;
  *(_QWORD *)(a3 + 200) = v118;
  *(_QWORD *)(a3 + 208) = v56;
  *(_QWORD *)(a3 + 216) = v117;
  *(_QWORD *)(a3 + 224) = v116;
  *(_QWORD *)(a3 + 232) = v115;
  *(_QWORD *)(a3 + 240) = v114;
  *(_QWORD *)(a3 + 248) = v113;
  *(_QWORD *)(a3 + 256) = v112;
  *(_QWORD *)(a3 + 264) = v111;
  *(double *)(a3 + 272) = v99;
  *(_QWORD *)(a3 + 280) = v110;
  *(_QWORD *)(a3 + 288) = v109;
  *(_QWORD *)(a3 + 296) = v101;
  *(_QWORD *)(a3 + 304) = v102;
  *(_QWORD *)(a3 + 312) = v103;
  *(_QWORD *)(a3 + 320) = v105;
  *(double *)(a3 + 328) = v106;
  *(_QWORD *)(a3 + 336) = v107;
  return result;
}

uint64_t destroy for ConfigManager(id *a1)
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for ConfigManager(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v3 = *(void **)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v3;
  v23 = v3;
  v24 = *(void **)(a2 + 32);
  v25 = *(void **)(a2 + 40);
  *(_QWORD *)(a1 + 32) = v24;
  *(_QWORD *)(a1 + 40) = v25;
  v26 = *(void **)(a2 + 48);
  *(_QWORD *)(a1 + 48) = v26;
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  *(_WORD *)(a1 + 57) = *(_WORD *)(a2 + 57);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_BYTE *)(a1 + 72) = *(_BYTE *)(a2 + 72);
  *(_WORD *)(a1 + 73) = *(_WORD *)(a2 + 73);
  v4 = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = v4;
  v5 = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = v5;
  v6 = *(_QWORD *)(a2 + 120);
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 120) = v6;
  v7 = *(_QWORD *)(a2 + 136);
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  *(_QWORD *)(a1 + 136) = v7;
  v8 = *(_QWORD *)(a2 + 152);
  *(_QWORD *)(a1 + 144) = *(_QWORD *)(a2 + 144);
  *(_QWORD *)(a1 + 152) = v8;
  v9 = *(_QWORD *)(a2 + 168);
  *(_QWORD *)(a1 + 160) = *(_QWORD *)(a2 + 160);
  *(_QWORD *)(a1 + 168) = v9;
  v10 = *(_QWORD *)(a2 + 184);
  *(_QWORD *)(a1 + 176) = *(_QWORD *)(a2 + 176);
  *(_QWORD *)(a1 + 184) = v10;
  v11 = *(_QWORD *)(a2 + 200);
  *(_QWORD *)(a1 + 192) = *(_QWORD *)(a2 + 192);
  *(_QWORD *)(a1 + 200) = v11;
  v12 = *(_QWORD *)(a2 + 216);
  *(_QWORD *)(a1 + 208) = *(_QWORD *)(a2 + 208);
  *(_QWORD *)(a1 + 216) = v12;
  v13 = *(_QWORD *)(a2 + 232);
  *(_QWORD *)(a1 + 224) = *(_QWORD *)(a2 + 224);
  *(_QWORD *)(a1 + 232) = v13;
  v14 = *(_QWORD *)(a2 + 248);
  *(_QWORD *)(a1 + 240) = *(_QWORD *)(a2 + 240);
  *(_QWORD *)(a1 + 248) = v14;
  v15 = *(_QWORD *)(a2 + 264);
  *(_QWORD *)(a1 + 256) = *(_QWORD *)(a2 + 256);
  *(_QWORD *)(a1 + 264) = v15;
  *(_OWORD *)(a1 + 272) = *(_OWORD *)(a2 + 272);
  v16 = *(_QWORD *)(a2 + 296);
  *(_QWORD *)(a1 + 288) = *(_QWORD *)(a2 + 288);
  *(_QWORD *)(a1 + 296) = v16;
  *(_OWORD *)(a1 + 304) = *(_OWORD *)(a2 + 304);
  v17 = *(_QWORD *)(a2 + 328);
  *(_QWORD *)(a1 + 320) = *(_QWORD *)(a2 + 320);
  *(_QWORD *)(a1 + 328) = v17;
  *(_QWORD *)(a1 + 336) = *(_QWORD *)(a2 + 336);
  swift_bridgeObjectRetain();
  v18 = v23;
  v19 = v24;
  v20 = v25;
  v21 = v26;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for ConfigManager(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = *(void **)(a2 + 24);
  v5 = *(void **)(a1 + 24);
  *(_QWORD *)(a1 + 24) = v4;
  v6 = v4;

  v7 = *(void **)(a2 + 32);
  v8 = *(void **)(a1 + 32);
  *(_QWORD *)(a1 + 32) = v7;
  v9 = v7;

  v10 = *(void **)(a2 + 40);
  v11 = *(void **)(a1 + 40);
  *(_QWORD *)(a1 + 40) = v10;
  v12 = v10;

  v13 = *(void **)(a2 + 48);
  v14 = *(void **)(a1 + 48);
  *(_QWORD *)(a1 + 48) = v13;
  v15 = v13;

  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  *(_BYTE *)(a1 + 57) = *(_BYTE *)(a2 + 57);
  *(_BYTE *)(a1 + 58) = *(_BYTE *)(a2 + 58);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_BYTE *)(a1 + 72) = *(_BYTE *)(a2 + 72);
  *(_BYTE *)(a1 + 73) = *(_BYTE *)(a2 + 73);
  *(_BYTE *)(a1 + 74) = *(_BYTE *)(a2 + 74);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  *(_QWORD *)(a1 + 136) = *(_QWORD *)(a2 + 136);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 144) = *(_QWORD *)(a2 + 144);
  *(_QWORD *)(a1 + 152) = *(_QWORD *)(a2 + 152);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 160) = *(_QWORD *)(a2 + 160);
  *(_QWORD *)(a1 + 168) = *(_QWORD *)(a2 + 168);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 176) = *(_QWORD *)(a2 + 176);
  *(_QWORD *)(a1 + 184) = *(_QWORD *)(a2 + 184);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 192) = *(_QWORD *)(a2 + 192);
  *(_QWORD *)(a1 + 200) = *(_QWORD *)(a2 + 200);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 208) = *(_QWORD *)(a2 + 208);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 216) = *(_QWORD *)(a2 + 216);
  *(_QWORD *)(a1 + 224) = *(_QWORD *)(a2 + 224);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 232) = *(_QWORD *)(a2 + 232);
  *(_QWORD *)(a1 + 240) = *(_QWORD *)(a2 + 240);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 248) = *(_QWORD *)(a2 + 248);
  *(_QWORD *)(a1 + 256) = *(_QWORD *)(a2 + 256);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 264) = *(_QWORD *)(a2 + 264);
  *(_QWORD *)(a1 + 272) = *(_QWORD *)(a2 + 272);
  *(_QWORD *)(a1 + 280) = *(_QWORD *)(a2 + 280);
  *(_QWORD *)(a1 + 288) = *(_QWORD *)(a2 + 288);
  *(_QWORD *)(a1 + 296) = *(_QWORD *)(a2 + 296);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 304) = *(_QWORD *)(a2 + 304);
  *(_QWORD *)(a1 + 312) = *(_QWORD *)(a2 + 312);
  *(_QWORD *)(a1 + 320) = *(_QWORD *)(a2 + 320);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 328) = *(_QWORD *)(a2 + 328);
  *(_QWORD *)(a1 + 336) = *(_QWORD *)(a2 + 336);
  return a1;
}

void *__swift_memcpy344_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x158uLL);
}

uint64_t assignWithTake for ConfigManager(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v4;
  swift_bridgeObjectRelease();
  v5 = *(void **)(a1 + 24);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);

  v6 = *(void **)(a1 + 32);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);

  v7 = *(void **)(a1 + 40);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);

  v8 = *(void **)(a1 + 48);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);

  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  *(_BYTE *)(a1 + 57) = *(_BYTE *)(a2 + 57);
  *(_BYTE *)(a1 + 58) = *(_BYTE *)(a2 + 58);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_BYTE *)(a1 + 72) = *(_BYTE *)(a2 + 72);
  *(_BYTE *)(a1 + 73) = *(_BYTE *)(a2 + 73);
  *(_BYTE *)(a1 + 74) = *(_BYTE *)(a2 + 74);
  v9 = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = v9;
  swift_bridgeObjectRelease();
  v10 = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = v10;
  swift_bridgeObjectRelease();
  v11 = *(_QWORD *)(a2 + 120);
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 120) = v11;
  swift_bridgeObjectRelease();
  v12 = *(_QWORD *)(a2 + 136);
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  *(_QWORD *)(a1 + 136) = v12;
  swift_bridgeObjectRelease();
  v13 = *(_QWORD *)(a2 + 152);
  *(_QWORD *)(a1 + 144) = *(_QWORD *)(a2 + 144);
  *(_QWORD *)(a1 + 152) = v13;
  swift_bridgeObjectRelease();
  v14 = *(_QWORD *)(a2 + 168);
  *(_QWORD *)(a1 + 160) = *(_QWORD *)(a2 + 160);
  *(_QWORD *)(a1 + 168) = v14;
  swift_bridgeObjectRelease();
  v15 = *(_QWORD *)(a2 + 184);
  *(_QWORD *)(a1 + 176) = *(_QWORD *)(a2 + 176);
  *(_QWORD *)(a1 + 184) = v15;
  swift_bridgeObjectRelease();
  v16 = *(_QWORD *)(a2 + 200);
  *(_QWORD *)(a1 + 192) = *(_QWORD *)(a2 + 192);
  *(_QWORD *)(a1 + 200) = v16;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 208) = *(_QWORD *)(a2 + 208);
  swift_bridgeObjectRelease();
  v17 = *(_QWORD *)(a2 + 224);
  *(_QWORD *)(a1 + 216) = *(_QWORD *)(a2 + 216);
  *(_QWORD *)(a1 + 224) = v17;
  swift_bridgeObjectRelease();
  v18 = *(_QWORD *)(a2 + 240);
  *(_QWORD *)(a1 + 232) = *(_QWORD *)(a2 + 232);
  *(_QWORD *)(a1 + 240) = v18;
  swift_bridgeObjectRelease();
  v19 = *(_QWORD *)(a2 + 256);
  *(_QWORD *)(a1 + 248) = *(_QWORD *)(a2 + 248);
  *(_QWORD *)(a1 + 256) = v19;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 264) = *(_QWORD *)(a2 + 264);
  *(_QWORD *)(a1 + 272) = *(_QWORD *)(a2 + 272);
  *(_OWORD *)(a1 + 280) = *(_OWORD *)(a2 + 280);
  *(_QWORD *)(a1 + 296) = *(_QWORD *)(a2 + 296);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 304) = *(_OWORD *)(a2 + 304);
  *(_QWORD *)(a1 + 320) = *(_QWORD *)(a2 + 320);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 328) = *(_QWORD *)(a2 + 328);
  *(_QWORD *)(a1 + 336) = *(_QWORD *)(a2 + 336);
  return a1;
}

uint64_t getEnumTagSinglePayload for ConfigManager(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 344))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ConfigManager(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 248) = 0u;
    *(_OWORD *)(result + 232) = 0u;
    *(_OWORD *)(result + 216) = 0u;
    *(_OWORD *)(result + 200) = 0u;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 328) = 0u;
    *(_OWORD *)(result + 312) = 0u;
    *(_OWORD *)(result + 296) = 0u;
    *(_OWORD *)(result + 280) = 0u;
    *(_OWORD *)(result + 264) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 344) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 16) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 344) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for ConfigManager()
{
  return &type metadata for ConfigManager;
}

uint64_t sub_24394EBD8(uint64_t a1, unsigned __int8 a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  NSObject *v23;
  os_log_type_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v34;
  uint64_t v35;

  if (a1)
  {
    v6 = sub_24394D370(a2);
    if (*(_QWORD *)(a1 + 16) && (v8 = sub_243942698(v6, v7), (v9 & 1) != 0))
    {
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8 * v8);
      swift_unknownObjectRetain();
    }
    else
    {
      v10 = 0;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = 0;
  }
  v35 = v10;
  swift_unknownObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2572D9F00);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2572D9F08);
  if (swift_dynamicCast())
  {
    a3 = v34;
    if (qword_2572D9D10 != -1)
      swift_once();
    v11 = sub_24396FAE8();
    __swift_project_value_buffer(v11, (uint64_t)qword_2572DA2B0);
    swift_bridgeObjectRetain_n();
    v12 = sub_24396FAD0();
    v13 = sub_24396FCF8();
    if (os_log_type_enabled(v12, v13))
    {
      v14 = swift_slowAlloc();
      v15 = swift_slowAlloc();
      v35 = v15;
      *(_DWORD *)v14 = 136315394;
      v16 = sub_24394D370(a2);
      sub_2439420BC(v16, v17, &v35);
      sub_24396FD94();
      swift_bridgeObjectRelease();
      *(_WORD *)(v14 + 12) = 2080;
      v18 = swift_bridgeObjectRetain();
      v19 = MEMORY[0x2494FD450](v18, MEMORY[0x24BEE3F88]);
      v21 = v20;
      swift_bridgeObjectRelease();
      sub_2439420BC(v19, v21, &v35);
      sub_24396FD94();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_243921000, v12, v13, "MLSE Recipe: Loaded from Trial configuration %s = %s", (uint8_t *)v14, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x2494FDD74](v15, -1, -1);
      MEMORY[0x2494FDD74](v14, -1, -1);
      swift_unknownObjectRelease();

    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_unknownObjectRelease();
    }
  }
  else
  {
    if (qword_2572D9D10 != -1)
      swift_once();
    v22 = sub_24396FAE8();
    __swift_project_value_buffer(v22, (uint64_t)qword_2572DA2B0);
    swift_bridgeObjectRetain_n();
    v23 = sub_24396FAD0();
    v24 = sub_24396FCF8();
    if (os_log_type_enabled(v23, v24))
    {
      v25 = swift_slowAlloc();
      v26 = swift_slowAlloc();
      v35 = v26;
      *(_DWORD *)v25 = 136315394;
      v27 = sub_24394D370(a2);
      sub_2439420BC(v27, v28, &v35);
      sub_24396FD94();
      swift_bridgeObjectRelease();
      *(_WORD *)(v25 + 12) = 2080;
      v29 = swift_bridgeObjectRetain();
      v30 = MEMORY[0x2494FD450](v29, MEMORY[0x24BEE3F88]);
      v32 = v31;
      swift_bridgeObjectRelease();
      sub_2439420BC(v30, v32, &v35);
      sub_24396FD94();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_243921000, v23, v24, "MLSE Recipe: No parameter provided. Default to %s = %s", (uint8_t *)v25, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x2494FDD74](v26, -1, -1);
      MEMORY[0x2494FDD74](v25, -1, -1);
      swift_unknownObjectRelease();

    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_unknownObjectRelease();
    }
    swift_bridgeObjectRetain();
  }
  return a3;
}

uint64_t sub_24394F060(uint64_t a1, unsigned __int8 a2, char a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v27;
  uint64_t v28;

  if (a1)
  {
    v6 = sub_24394D370(a2);
    if (*(_QWORD *)(a1 + 16) && (v8 = sub_243942698(v6, v7), (v9 & 1) != 0))
    {
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8 * v8);
      swift_unknownObjectRetain();
    }
    else
    {
      v10 = 0;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = 0;
  }
  v28 = v10;
  swift_unknownObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2572D9F00);
  if (!swift_dynamicCast())
  {
    if (qword_2572D9D10 != -1)
      swift_once();
    v21 = sub_24396FAE8();
    __swift_project_value_buffer(v21, (uint64_t)qword_2572DA2B0);
    v12 = sub_24396FAD0();
    v13 = sub_24396FCF8();
    if (os_log_type_enabled(v12, v13))
    {
      v14 = swift_slowAlloc();
      v15 = swift_slowAlloc();
      v28 = v15;
      *(_DWORD *)v14 = 136315394;
      v22 = sub_24394D370(a2);
      sub_2439420BC(v22, v23, &v28);
      sub_24396FD94();
      swift_bridgeObjectRelease();
      *(_WORD *)(v14 + 12) = 2080;
      if ((a3 & 1) != 0)
        v24 = 1702195828;
      else
        v24 = 0x65736C6166;
      if ((a3 & 1) != 0)
        v25 = 0xE400000000000000;
      else
        v25 = 0xE500000000000000;
      sub_2439420BC(v24, v25, &v28);
      sub_24396FD94();
      swift_bridgeObjectRelease();
      v20 = "MLSE Recipe: No parameter provided. Default to %s = %s";
      goto LABEL_29;
    }
LABEL_30:

    swift_unknownObjectRelease();
    return a3 & 1;
  }
  a3 = v27 & 1;
  if (qword_2572D9D10 != -1)
    swift_once();
  v11 = sub_24396FAE8();
  __swift_project_value_buffer(v11, (uint64_t)qword_2572DA2B0);
  v12 = sub_24396FAD0();
  v13 = sub_24396FCF8();
  if (!os_log_type_enabled(v12, v13))
    goto LABEL_30;
  v14 = swift_slowAlloc();
  v15 = swift_slowAlloc();
  v28 = v15;
  *(_DWORD *)v14 = 136315394;
  v16 = sub_24394D370(a2);
  sub_2439420BC(v16, v17, &v28);
  sub_24396FD94();
  swift_bridgeObjectRelease();
  *(_WORD *)(v14 + 12) = 2080;
  if ((v27 & 1) != 0)
    v18 = 1702195828;
  else
    v18 = 0x65736C6166;
  if ((v27 & 1) != 0)
    v19 = 0xE400000000000000;
  else
    v19 = 0xE500000000000000;
  sub_2439420BC(v18, v19, &v28);
  sub_24396FD94();
  swift_bridgeObjectRelease();
  v20 = "MLSE Recipe: Loaded from Trial configuration %s = %s";
LABEL_29:
  _os_log_impl(&dword_243921000, v12, v13, v20, (uint8_t *)v14, 0x16u);
  swift_arrayDestroy();
  MEMORY[0x2494FDD74](v15, -1, -1);
  MEMORY[0x2494FDD74](v14, -1, -1);
  swift_unknownObjectRelease();

  return a3 & 1;
}

uint64_t sub_24394F428(uint64_t a1, unsigned __int8 a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v27[2];
  uint64_t v28;

  if (a1)
  {
    v6 = sub_24394D370(a2);
    if (*(_QWORD *)(a1 + 16) && (v8 = sub_243942698(v6, v7), (v9 & 1) != 0))
    {
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8 * v8);
      swift_unknownObjectRetain();
    }
    else
    {
      v10 = 0;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = 0;
  }
  v28 = v10;
  swift_unknownObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2572D9F00);
  if (!swift_dynamicCast())
  {
    if (qword_2572D9D10 != -1)
      swift_once();
    v21 = sub_24396FAE8();
    __swift_project_value_buffer(v21, (uint64_t)qword_2572DA2B0);
    v12 = sub_24396FAD0();
    v13 = sub_24396FCF8();
    if (os_log_type_enabled(v12, v13))
    {
      v14 = swift_slowAlloc();
      v15 = swift_slowAlloc();
      v27[0] = v15;
      *(_DWORD *)v14 = 136315394;
      v22 = sub_24394D370(a2);
      v28 = sub_2439420BC(v22, v23, v27);
      sub_24396FD94();
      swift_bridgeObjectRelease();
      *(_WORD *)(v14 + 12) = 2080;
      v28 = a3;
      v24 = sub_24396FF80();
      v28 = sub_2439420BC(v24, v25, v27);
      sub_24396FD94();
      swift_bridgeObjectRelease();
      v20 = "MLSE Recipe: No parameter provided. Default to %s = %s";
      goto LABEL_17;
    }
LABEL_18:

    swift_unknownObjectRelease();
    return a3;
  }
  a3 = v27[0];
  if (qword_2572D9D10 != -1)
    swift_once();
  v11 = sub_24396FAE8();
  __swift_project_value_buffer(v11, (uint64_t)qword_2572DA2B0);
  v12 = sub_24396FAD0();
  v13 = sub_24396FCF8();
  if (!os_log_type_enabled(v12, v13))
    goto LABEL_18;
  v14 = swift_slowAlloc();
  v15 = swift_slowAlloc();
  v27[0] = v15;
  *(_DWORD *)v14 = 136315394;
  v16 = sub_24394D370(a2);
  v28 = sub_2439420BC(v16, v17, v27);
  sub_24396FD94();
  swift_bridgeObjectRelease();
  *(_WORD *)(v14 + 12) = 2080;
  v28 = a3;
  v18 = sub_24396FF80();
  v28 = sub_2439420BC(v18, v19, v27);
  sub_24396FD94();
  swift_bridgeObjectRelease();
  v20 = "MLSE Recipe: Loaded from Trial configuration %s = %s";
LABEL_17:
  _os_log_impl(&dword_243921000, v12, v13, v20, (uint8_t *)v14, 0x16u);
  swift_arrayDestroy();
  MEMORY[0x2494FDD74](v15, -1, -1);
  MEMORY[0x2494FDD74](v14, -1, -1);
  swift_unknownObjectRelease();

  return a3;
}

uint64_t sub_24394F7D4(uint64_t a1, unsigned __int8 a2, uint64_t a3, unint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  char v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  NSObject *v22;
  os_log_type_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v29[2];
  uint64_t v30;

  if (a1)
  {
    v8 = sub_24394D370(a2);
    if (*(_QWORD *)(a1 + 16) && (v10 = sub_243942698(v8, v9), (v11 & 1) != 0))
    {
      v12 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8 * v10);
      swift_unknownObjectRetain();
    }
    else
    {
      v12 = 0;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    v12 = 0;
  }
  v30 = v12;
  swift_unknownObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2572D9F00);
  if (swift_dynamicCast())
  {
    a3 = v29[0];
    v13 = v29[1];
    if (qword_2572D9D10 != -1)
      swift_once();
    v14 = sub_24396FAE8();
    __swift_project_value_buffer(v14, (uint64_t)qword_2572DA2B0);
    swift_bridgeObjectRetain_n();
    v15 = sub_24396FAD0();
    v16 = sub_24396FCF8();
    if (os_log_type_enabled(v15, v16))
    {
      v17 = swift_slowAlloc();
      v18 = swift_slowAlloc();
      v29[0] = v18;
      *(_DWORD *)v17 = 136315394;
      v19 = sub_24394D370(a2);
      v30 = sub_2439420BC(v19, v20, v29);
      sub_24396FD94();
      swift_bridgeObjectRelease();
      *(_WORD *)(v17 + 12) = 2080;
      swift_bridgeObjectRetain();
      v30 = sub_2439420BC(a3, v13, v29);
      sub_24396FD94();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_243921000, v15, v16, "MLSE Recipe: Loaded from Trial configuration %s = %s", (uint8_t *)v17, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x2494FDD74](v18, -1, -1);
      MEMORY[0x2494FDD74](v17, -1, -1);
      swift_unknownObjectRelease();

    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_unknownObjectRelease();
    }
  }
  else
  {
    if (qword_2572D9D10 != -1)
      swift_once();
    v21 = sub_24396FAE8();
    __swift_project_value_buffer(v21, (uint64_t)qword_2572DA2B0);
    swift_bridgeObjectRetain_n();
    v22 = sub_24396FAD0();
    v23 = sub_24396FCF8();
    if (os_log_type_enabled(v22, v23))
    {
      v24 = swift_slowAlloc();
      v25 = swift_slowAlloc();
      v29[0] = v25;
      *(_DWORD *)v24 = 136315394;
      v26 = sub_24394D370(a2);
      v30 = sub_2439420BC(v26, v27, v29);
      sub_24396FD94();
      swift_bridgeObjectRelease();
      *(_WORD *)(v24 + 12) = 2080;
      swift_bridgeObjectRetain();
      v30 = sub_2439420BC(a3, a4, v29);
      sub_24396FD94();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_243921000, v22, v23, "MLSE Recipe: No parameter provided. Default to %s = %s", (uint8_t *)v24, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x2494FDD74](v25, -1, -1);
      MEMORY[0x2494FDD74](v24, -1, -1);
      swift_unknownObjectRelease();

    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_unknownObjectRelease();
    }
    swift_bridgeObjectRetain();
  }
  return a3;
}

double sub_24394FC10(uint64_t a1, unsigned __int8 a2, double a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v27[2];
  uint64_t v28;

  if (a1)
  {
    v6 = sub_24394D370(a2);
    if (*(_QWORD *)(a1 + 16) && (v8 = sub_243942698(v6, v7), (v9 & 1) != 0))
    {
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8 * v8);
      swift_unknownObjectRetain();
    }
    else
    {
      v10 = 0;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = 0;
  }
  v28 = v10;
  swift_unknownObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2572D9F00);
  if (!swift_dynamicCast())
  {
    if (qword_2572D9D10 != -1)
      swift_once();
    v21 = sub_24396FAE8();
    __swift_project_value_buffer(v21, (uint64_t)qword_2572DA2B0);
    v12 = sub_24396FAD0();
    v13 = sub_24396FCF8();
    if (os_log_type_enabled(v12, v13))
    {
      v14 = swift_slowAlloc();
      v15 = swift_slowAlloc();
      v27[0] = v15;
      *(_DWORD *)v14 = 136315394;
      v22 = sub_24394D370(a2);
      v28 = sub_2439420BC(v22, v23, v27);
      sub_24396FD94();
      swift_bridgeObjectRelease();
      *(_WORD *)(v14 + 12) = 2080;
      v24 = sub_24396FCA4();
      v28 = sub_2439420BC(v24, v25, v27);
      sub_24396FD94();
      swift_bridgeObjectRelease();
      v20 = "MLSE Recipe: No parameter provided. Default to %s = %s";
      goto LABEL_17;
    }
LABEL_18:

    swift_unknownObjectRelease();
    return a3;
  }
  a3 = *(double *)v27;
  if (qword_2572D9D10 != -1)
    swift_once();
  v11 = sub_24396FAE8();
  __swift_project_value_buffer(v11, (uint64_t)qword_2572DA2B0);
  v12 = sub_24396FAD0();
  v13 = sub_24396FCF8();
  if (!os_log_type_enabled(v12, v13))
    goto LABEL_18;
  v14 = swift_slowAlloc();
  v15 = swift_slowAlloc();
  v27[0] = v15;
  *(_DWORD *)v14 = 136315394;
  v16 = sub_24394D370(a2);
  v28 = sub_2439420BC(v16, v17, v27);
  sub_24396FD94();
  swift_bridgeObjectRelease();
  *(_WORD *)(v14 + 12) = 2080;
  v18 = sub_24396FCA4();
  v28 = sub_2439420BC(v18, v19, v27);
  sub_24396FD94();
  swift_bridgeObjectRelease();
  v20 = "MLSE Recipe: Loaded from Trial configuration %s = %s";
LABEL_17:
  _os_log_impl(&dword_243921000, v12, v13, v20, (uint8_t *)v14, 0x16u);
  swift_arrayDestroy();
  MEMORY[0x2494FDD74](v15, -1, -1);
  MEMORY[0x2494FDD74](v14, -1, -1);
  swift_unknownObjectRelease();

  return a3;
}

uint64_t LocalTrainingManager.init(config:executionManager:)@<X0>(void *__src@<X0>, __int128 *a2@<X1>, void *a3@<X8>)
{
  memcpy(a3, __src, 0x158uLL);
  return sub_243946A88(a2, (uint64_t)a3 + 344);
}

Swift::Void __swiftcall LocalTrainingManager.attemptLocalTrain()()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  _QWORD *v3;
  void *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t *v8;
  unint64_t v9;
  void (*v10)(char *, char *, uint64_t);
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  unsigned int v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  id v25;
  uint64_t inited;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  uint64_t v49;
  unint64_t v50;
  void *v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char *v56;
  void (*v57)(char *, char *, uint64_t);
  uint64_t v58;
  char *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void (*v64)(char *, _QWORD, uint64_t, uint64_t);
  uint64_t v65;
  void *v66;
  NSObject *v67;
  char *v68;
  os_log_type_t v69;
  uint8_t *v70;
  void *v71;
  id v72;
  id v73;
  uint64_t v74;
  unint64_t v75;
  unint64_t v76;
  NSObject *v77;
  os_log_type_t v78;
  uint8_t *v79;
  uint64_t v80;
  uint64_t v81;
  NSObject *v82;
  os_log_type_t v83;
  uint8_t *v84;
  uint64_t v85;
  void (*v86)(char *, uint64_t);
  NSObject *v87;
  os_log_type_t v88;
  uint8_t *v89;
  void (*v90)(char *, uint64_t);
  os_log_type_t v91;
  uint8_t *v92;
  NSObject *v93;
  os_log_type_t v94;
  uint8_t *v95;
  uint64_t v96;
  uint64_t v97;
  void *v98;
  unsigned __int8 v99;
  void *v100;
  uint64_t v101;
  void *v102;
  void *v103;
  void *v104;
  NSObject *v105;
  os_log_type_t v106;
  uint8_t *v107;
  uint64_t v108;
  void *v109;
  void *v110;
  void *v111;
  NSObject *v112;
  os_log_type_t v113;
  uint8_t *v114;
  uint64_t v115;
  void (*v116)(char *, uint64_t);
  os_log_type_t v117;
  uint8_t *v118;
  uint64_t v119;
  id v120;
  id v121;
  char *v122;
  char *v123;
  char *v124;
  uint64_t v125;
  uint64_t v126;
  void *v127;
  unsigned int (*v128)(char *, uint64_t, uint64_t);
  uint64_t *v129;
  void (*v130)(char *, uint64_t, uint64_t, uint64_t);
  _QWORD *v131;
  uint64_t v132;
  uint64_t v133[36];

  v1 = v0;
  v2 = sub_24396F920();
  v3 = *(_QWORD **)(v2 - 8);
  v4 = (void *)v3[8];
  MEMORY[0x24BDAC7A8](v2);
  v5 = sub_24396F8E4();
  v127 = v4;
  MEMORY[0x24BDAC7A8](v5);
  v6 = (char *)&v119 - (((unint64_t)v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24396F8E4();
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2572D9E40);
  MEMORY[0x24BDAC7A8](v7);
  v129 = v8;
  v9 = ((unint64_t)v8 + 15) & 0xFFFFFFFFFFFFFFF0;
  v10 = (void (*)(char *, char *, uint64_t))v3[2];
  v123 = v6;
  v10((char *)&v119 - v9, v6, v2);
  v130 = (void (*)(char *, _QWORD, uint64_t, uint64_t))v3[7];
  v130((char *)&v119 - v9, 0, 1, v2);
  v11 = (void *)sub_24396FB48();
  v124 = v6;
  v12 = (void *)sub_24396F8F0();
  v131 = v3;
  v128 = (unsigned int (*)(char *, uint64_t, uint64_t))v3[6];
  v13 = 0;
  if (v128((char *)&v119 - v9, 1, v2) != 1)
  {
    v13 = (void *)sub_24396F8F0();
    ((void (*)(char *, uint64_t))v131[1])((char *)&v119 - v9, v2);
  }
  v14 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE5F780]), sel_init_modelStoreRootURL_originalEmptyModelURL_, v11, v12, v13);

  MEMORY[0x24BDAC7A8](v15);
  v130((char *)&v119 - v9, 1, 1, v2);
  v16 = (void *)sub_24396FB48();
  v17 = v128((char *)&v119 - v9, 1, v2);
  v126 = v2;
  if (v17 == 1)
  {
    v18 = 0;
  }
  else
  {
    v18 = (void *)sub_24396F8F0();
    ((void (*)(char *, uint64_t))v131[1])((char *)&v119 - v9, v2);
  }
  v19 = v127;
  v20 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE5F770]), sel_init_url_useSqlite_, v16, v18, 0);

  if (qword_2572D9D10 != -1)
    swift_once();
  v21 = sub_24396FAE8();
  v125 = __swift_project_value_buffer(v21, (uint64_t)qword_2572DA2B0);
  v22 = sub_24396FAD0();
  v23 = sub_24396FD04();
  if (os_log_type_enabled(v22, v23))
  {
    v24 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v24 = 0;
    _os_log_impl(&dword_243921000, v22, v23, "Starting local training", v24, 2u);
    MEMORY[0x2494FDD74](v24, -1, -1);
  }

  v25 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBFFD8]), sel_init);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2572D9F10);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2439717C0;
  v27 = (void *)objc_opt_self();
  v28 = objc_msgSend(v27, sel_learningRate);
  v30 = v1[14];
  v29 = v1[15];
  v31 = MEMORY[0x24BEE0D00];
  *(_QWORD *)(inited + 64) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(inited + 32) = v28;
  *(_QWORD *)(inited + 40) = v30;
  *(_QWORD *)(inited + 48) = v29;
  swift_bridgeObjectRetain();
  v32 = objc_msgSend(v27, sel_numClasses);
  v34 = v1[16];
  v33 = v1[17];
  *(_QWORD *)(inited + 104) = v31;
  *(_QWORD *)(inited + 72) = v32;
  *(_QWORD *)(inited + 80) = v34;
  *(_QWORD *)(inited + 88) = v33;
  swift_bridgeObjectRetain();
  v35 = objc_msgSend(v27, sel_numTrees);
  v37 = v1[18];
  v36 = v1[19];
  *(_QWORD *)(inited + 144) = v31;
  *(_QWORD *)(inited + 112) = v35;
  *(_QWORD *)(inited + 120) = v37;
  *(_QWORD *)(inited + 128) = v36;
  swift_bridgeObjectRetain();
  v38 = objc_msgSend(v27, sel_maxDepth);
  v40 = v1[20];
  v39 = v1[21];
  *(_QWORD *)(inited + 184) = v31;
  *(_QWORD *)(inited + 152) = v38;
  *(_QWORD *)(inited + 160) = v40;
  *(_QWORD *)(inited + 168) = v39;
  swift_bridgeObjectRetain();
  v41 = objc_msgSend(v27, sel_minChildWeight);
  v43 = v1[22];
  v42 = v1[23];
  *(_QWORD *)(inited + 224) = v31;
  *(_QWORD *)(inited + 192) = v41;
  *(_QWORD *)(inited + 200) = v43;
  *(_QWORD *)(inited + 208) = v42;
  swift_bridgeObjectRetain();
  v44 = objc_msgSend(v27, sel_objective);
  v46 = v1[24];
  v45 = v1[25];
  *(_QWORD *)(inited + 264) = v31;
  *(_QWORD *)(inited + 232) = v44;
  *(_QWORD *)(inited + 240) = v46;
  *(_QWORD *)(inited + 248) = v45;
  swift_bridgeObjectRetain();
  sub_24393F360(inited);
  objc_msgSend(v25, sel_setComputeUnits_, 0);
  sub_243951614();
  sub_243951650();
  v47 = (void *)sub_24396FB0C();
  swift_bridgeObjectRelease();
  objc_msgSend(v25, sel_setParameters_, v47);

  v48 = (void *)sub_24396FB48();
  objc_msgSend(v14, sel_deleteModel_, v48);

  MEMORY[0x24BDAC7A8](v49);
  v50 = ((unint64_t)v19 + 15) & 0xFFFFFFFFFFFFFFF0;
  v122 = (char *)&v119 - v50;
  v51 = (void *)sub_24396FB48();
  v127 = v14;
  v52 = objc_msgSend(v14, sel_getBaseModelURL_modelConfig_, v51, v25);

  v54 = MEMORY[0x24BDAC7A8](v53);
  v56 = (char *)&v119 - ((v55 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v52)
  {
    v121 = v20;
    MEMORY[0x24BDAC7A8](v54);
    v129 = &v119;
    sub_24396F8FC();

    v57 = (void (*)(char *, char *, uint64_t))v131[4];
    v58 = v126;
    v57(v56, (char *)&v119 - v50, v126);
    v130(v56, 0, 1, v58);
    v20 = v121;
    if (v128(v56, 1, v58) != 1)
    {
      v120 = v25;
      v59 = v122;
      v57(v122, v56, v58);
      v60 = (void *)sub_24396FC08();
      v61 = (void *)sub_24396FB48();
      v62 = (void *)sub_24396FB48();
      v63 = (void *)sub_24396FB48();
      v64 = (void (*)(char *, _QWORD, uint64_t, uint64_t))objc_msgSend(v20, sel_getMultiArrayFeatureVectors_vectorName_srcLabelName_destLabelName_option_, v60, v61, v62, v63, 4);

      if (!v64)
      {
        v87 = sub_24396FAD0();
        v88 = sub_24396FD10();
        if (os_log_type_enabled(v87, v88))
        {
          v89 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v89 = 0;
          _os_log_impl(&dword_243921000, v87, v88, "Failed to fetch feature vectors from LCFFeatureStore", v89, 2u);
          MEMORY[0x2494FDD74](v89, -1, -1);
        }

        v90 = (void (*)(char *, uint64_t))v131[1];
        v90(v122, v58);
        goto LABEL_53;
      }
      v65 = objc_opt_self();
      v66 = (void *)sub_24396F8F0();
      v130 = v64;
      LOBYTE(v65) = objc_msgSend((id)v65, sel_trainModel_destModelUrl_modelConfiguration_dataBatch_, v66, 0, v120, v64);

      v67 = sub_24396FAD0();
      v68 = v59;
      if ((v65 & 1) != 0)
      {
        v69 = sub_24396FCF8();
        if (os_log_type_enabled(v67, v69))
        {
          v70 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v70 = 0;
          _os_log_impl(&dword_243921000, v67, v69, "Successfully trained a local model", v70, 2u);
          MEMORY[0x2494FDD74](v70, -1, -1);
        }

        v71 = (void *)sub_24396F8F0();
        v72 = v120;
        v73 = objc_msgSend(v127, sel_storeModel_modelConfig_, v71, v120);

        if (!v73)
        {
          v93 = sub_24396FAD0();
          v94 = sub_24396FD10();
          if (os_log_type_enabled(v93, v94))
          {
            v95 = (uint8_t *)swift_slowAlloc();
            v96 = swift_slowAlloc();
            v133[0] = v96;
            *(_DWORD *)v95 = 136315138;
            v97 = v58;
            v132 = sub_2439420BC(0x6F6D6C6D2E4D544CLL, 0xEC000000636C6564, v133);
            sub_24396FD94();
            _os_log_impl(&dword_243921000, v93, v94, "Failed to retain the local model with name %s", v95, 0xCu);
            swift_arrayDestroy();
            MEMORY[0x2494FDD74](v96, -1, -1);
            MEMORY[0x2494FDD74](v95, -1, -1);

LABEL_42:
            swift_unknownObjectRelease();
            v116 = (void (*)(char *, uint64_t))v131[1];
            v116(v122, v97);
            v116(v123, v97);
            v116(v124, v97);
            return;
          }

          goto LABEL_51;
        }
        v74 = sub_24396FB60();
        v76 = v75;

        swift_bridgeObjectRetain();
        v77 = sub_24396FAD0();
        v78 = sub_24396FCF8();
        if (os_log_type_enabled(v77, v78))
        {
          v79 = (uint8_t *)swift_slowAlloc();
          v133[0] = swift_slowAlloc();
          v80 = v133[0];
          *(_DWORD *)v79 = 136315138;
          v68 = v122;
          v128 = (unsigned int (*)(char *, uint64_t, uint64_t))(v79 + 4);
          swift_bridgeObjectRetain();
          v132 = sub_2439420BC(v74, v76, v133);
          sub_24396FD94();
          swift_bridgeObjectRelease_n();
          _os_log_impl(&dword_243921000, v77, v78, "Successfully trained a local model with name %s", v79, 0xCu);
          swift_arrayDestroy();
          v81 = v80;
          v72 = v120;
          MEMORY[0x2494FDD74](v81, -1, -1);
          MEMORY[0x2494FDD74](v79, -1, -1);

        }
        else
        {

          swift_bridgeObjectRelease_n();
        }
        v58 = v126;
        v98 = (void *)sub_24396FB48();
        v99 = objc_msgSend(v127, sel_markModelTrained_, v98);

        if ((v99 & 1) != 0)
        {
          if (v1[39] == 0x7247737961776C61 && v1[40] == 0xEE00657461756461 || (sub_24396FF8C() & 1) != 0)
          {
            v100 = v127;
            sub_24395124C(v127, 0x69746375646F7270, 0xEF6C65646F4D6E6FLL);
            if (v101)
            {
              v102 = (void *)sub_24396FB48();
              swift_bridgeObjectRelease();
              v103 = (void *)sub_24396FB48();
              v104 = (void *)sub_24396FC68();
              objc_msgSend(v100, sel_setModelMetadata_key_value_, v102, v103, v104);

              v105 = sub_24396FAD0();
              v106 = sub_24396FCF8();
              if (os_log_type_enabled(v105, v106))
              {
                v107 = (uint8_t *)swift_slowAlloc();
                v108 = swift_slowAlloc();
                v133[0] = v108;
                *(_DWORD *)v107 = 136315138;
                v68 = v122;
                v132 = sub_2439420BC(0x6F6D6C6D2E4D544CLL, 0xEC000000636C6564, v133);
                v58 = v126;
                sub_24396FD94();
                _os_log_impl(&dword_243921000, v105, v106, "Successfully stripped previous production model with name %s from its production model status", v107, 0xCu);
                swift_arrayDestroy();
                MEMORY[0x2494FDD74](v108, -1, -1);
                MEMORY[0x2494FDD74](v107, -1, -1);
              }

              v100 = v127;
            }
            v109 = (void *)sub_24396FB48();
            v110 = (void *)sub_24396FB48();
            v111 = (void *)sub_24396FC68();
            objc_msgSend(v100, sel_setModelMetadata_key_value_, v109, v110, v111);

            v112 = sub_24396FAD0();
            v113 = sub_24396FCF8();
            if (os_log_type_enabled(v112, v113))
            {
              v114 = (uint8_t *)swift_slowAlloc();
              v115 = swift_slowAlloc();
              v133[0] = v115;
              *(_DWORD *)v114 = 136315138;
              v97 = v58;
              v132 = sub_2439420BC(0x6F6D6C6D2E4D544CLL, 0xEC000000636C6564, v133);
              sub_24396FD94();
              _os_log_impl(&dword_243921000, v112, v113, "Successfully set local model with name %s as the production model", v114, 0xCu);
              swift_arrayDestroy();
              MEMORY[0x2494FDD74](v115, -1, -1);
              MEMORY[0x2494FDD74](v114, -1, -1);

              goto LABEL_42;
            }

          }
          else
          {

          }
LABEL_51:
          swift_unknownObjectRelease();
          goto LABEL_52;
        }
        v67 = sub_24396FAD0();
        v117 = sub_24396FD10();
        if (os_log_type_enabled(v67, v117))
        {
          v118 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v118 = 0;
          _os_log_impl(&dword_243921000, v67, v117, "Failed to mark the LTM as trained", v118, 2u);
          MEMORY[0x2494FDD74](v118, -1, -1);
        }

        swift_unknownObjectRelease();
      }
      else
      {
        v91 = sub_24396FD10();
        if (os_log_type_enabled(v67, v91))
        {
          v92 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v92 = 0;
          _os_log_impl(&dword_243921000, v67, v91, "Failed to train a local model", v92, 2u);
          MEMORY[0x2494FDD74](v92, -1, -1);
        }

        swift_unknownObjectRelease();
      }

LABEL_52:
      v90 = (void (*)(char *, uint64_t))v131[1];
      v90(v68, v58);
LABEL_53:
      v90(v123, v58);
      v90(v124, v58);
      return;
    }
  }
  else
  {
    v58 = v126;
    v130((char *)&v119 - ((v55 + 15) & 0xFFFFFFFFFFFFFFF0), 1, 1, v126);
  }
  sub_2439476E0((uint64_t)v56);
  v82 = sub_24396FAD0();
  v83 = sub_24396FD10();
  if (os_log_type_enabled(v82, v83))
  {
    v84 = (uint8_t *)swift_slowAlloc();
    v85 = swift_slowAlloc();
    v133[0] = v85;
    *(_DWORD *)v84 = 136315138;
    v132 = sub_2439420BC(0x6F6D6C6D2E4D544CLL, 0xEC000000636C6564, v133);
    sub_24396FD94();
    _os_log_impl(&dword_243921000, v82, v83, "Failed to fetch the base model %s", v84, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2494FDD74](v85, -1, -1);
    MEMORY[0x2494FDD74](v84, -1, -1);
  }

  v86 = (void (*)(char *, uint64_t))v131[1];
  v86(v123, v58);
  v86(v124, v58);
}

void sub_24395124C(void *a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  id v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  int64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  void *v31;
  uint64_t v32;
  char v34;
  __int128 v35;
  _OWORD v36[2];
  uint64_t v37;
  uint64_t v38;
  __int128 v39;

  v4 = a1;
  v5 = objc_msgSend(a1, sel_listModelNames);
  if (v5)
  {
    v6 = sub_24396FC14();

    v28 = *(_QWORD *)(v6 + 16);
    if (!v28)
    {
LABEL_41:
      swift_bridgeObjectRelease();
      return;
    }
    v7 = 0;
    v29 = v6;
    v27 = v4;
LABEL_5:
    if (v7 < *(_QWORD *)(v6 + 16))
    {
      swift_bridgeObjectRetain();
      v8 = (void *)sub_24396FB48();
      swift_bridgeObjectRelease();
      v9 = objc_msgSend(v4, sel_getModelMetadata_, v8);

      if (!v9)
        goto LABEL_41;
      v10 = objc_msgSend(v9, sel_custom);
      if (!v10)
      {
        swift_bridgeObjectRelease();

        return;
      }
      v30 = v7 + 1;
      v31 = v9;
      v11 = sub_24396FB18();

      v12 = 0;
      v32 = v11 + 64;
      v13 = 1 << *(_BYTE *)(v11 + 32);
      if (v13 < 64)
        v14 = ~(-1 << v13);
      else
        v14 = -1;
      v15 = v14 & *(_QWORD *)(v11 + 64);
      v16 = (unint64_t)(v13 + 63) >> 6;
      while (!v15)
      {
        v22 = v12 + 1;
        if (__OFADD__(v12, 1))
        {
          __break(1u);
          goto LABEL_46;
        }
        if (v22 < v16)
        {
          v23 = *(_QWORD *)(v32 + 8 * v22);
          if (v23)
            goto LABEL_20;
          v24 = v12 + 2;
          ++v12;
          if (v22 + 1 < v16)
          {
            v23 = *(_QWORD *)(v32 + 8 * v24);
            if (v23)
              goto LABEL_23;
            v12 = v22 + 1;
            if (v22 + 2 < v16)
            {
              v23 = *(_QWORD *)(v32 + 8 * (v22 + 2));
              if (v23)
              {
                v22 += 2;
                goto LABEL_20;
              }
              v24 = v22 + 3;
              v12 = v22 + 2;
              if (v22 + 3 < v16)
              {
                v23 = *(_QWORD *)(v32 + 8 * v24);
                if (!v23)
                {
                  while (1)
                  {
                    v22 = v24 + 1;
                    if (__OFADD__(v24, 1))
                      goto LABEL_47;
                    if (v22 >= v16)
                    {
                      v12 = v16 - 1;
                      goto LABEL_34;
                    }
                    v23 = *(_QWORD *)(v32 + 8 * v22);
                    ++v24;
                    if (v23)
                      goto LABEL_20;
                  }
                }
LABEL_23:
                v22 = v24;
LABEL_20:
                v15 = (v23 - 1) & v23;
                v18 = __clz(__rbit64(v23)) + (v22 << 6);
                v12 = v22;
LABEL_16:
                v19 = *(_QWORD *)(v11 + 56);
                v20 = (_QWORD *)(*(_QWORD *)(v11 + 48) + 16 * v18);
                v21 = v20[1];
                *(_QWORD *)&v35 = *v20;
                *((_QWORD *)&v35 + 1) = v21;
                sub_243946B14(v19 + 32 * v18, (uint64_t)v36);
                swift_bridgeObjectRetain();
                goto LABEL_35;
              }
            }
          }
        }
LABEL_34:
        v15 = 0;
        memset(v36, 0, sizeof(v36));
        v35 = 0u;
LABEL_35:
        sub_243951F20((uint64_t)&v35, (uint64_t)&v37);
        v25 = v38;
        if (!v38)
        {

          swift_release();
          v4 = v27;
          v7 = v30;
          v6 = v29;
          if (v30 == v28)
            goto LABEL_41;
          goto LABEL_5;
        }
        v26 = v37;
        sub_243946AA0(&v39, &v35);
        if (swift_dynamicCast()
          && (v26 == a2 && v25 == a3 || (sub_24396FF8C() & 1) != 0)
          && (v34 & 1) != 0)
        {
          swift_bridgeObjectRelease();
          swift_release();

          return;
        }
        swift_bridgeObjectRelease();
      }
      v17 = __clz(__rbit64(v15));
      v15 &= v15 - 1;
      v18 = v17 | (v12 << 6);
      goto LABEL_16;
    }
LABEL_46:
    __break(1u);
LABEL_47:
    __break(1u);
  }
}

unint64_t sub_243951614()
{
  unint64_t result;

  result = qword_2572D9DE0;
  if (!qword_2572D9DE0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2572D9DE0);
  }
  return result;
}

unint64_t sub_243951650()
{
  unint64_t result;
  unint64_t v1;

  result = qword_2572D9F18;
  if (!qword_2572D9F18)
  {
    v1 = sub_243951614();
    result = MEMORY[0x2494FDCE4](MEMORY[0x24BEE5BD8], v1);
    atomic_store(result, (unint64_t *)&qword_2572D9F18);
  }
  return result;
}

uint64_t destroy for LocalTrainingManager(id *a1)
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)(a1 + 43));
}

uint64_t initializeWithCopy for LocalTrainingManager(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void (*v25)(uint64_t, uint64_t, uint64_t);
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v3 = *(void **)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v3;
  v28 = v3;
  v29 = *(void **)(a2 + 32);
  v30 = *(void **)(a2 + 40);
  *(_QWORD *)(a1 + 32) = v29;
  *(_QWORD *)(a1 + 40) = v30;
  v31 = *(void **)(a2 + 48);
  *(_QWORD *)(a1 + 48) = v31;
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  *(_WORD *)(a1 + 57) = *(_WORD *)(a2 + 57);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_BYTE *)(a1 + 72) = *(_BYTE *)(a2 + 72);
  *(_WORD *)(a1 + 73) = *(_WORD *)(a2 + 73);
  v4 = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = v4;
  v5 = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = v5;
  v6 = *(_QWORD *)(a2 + 120);
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 120) = v6;
  v7 = *(_QWORD *)(a2 + 136);
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  *(_QWORD *)(a1 + 136) = v7;
  v8 = *(_QWORD *)(a2 + 152);
  *(_QWORD *)(a1 + 144) = *(_QWORD *)(a2 + 144);
  *(_QWORD *)(a1 + 152) = v8;
  v9 = *(_QWORD *)(a2 + 168);
  *(_QWORD *)(a1 + 160) = *(_QWORD *)(a2 + 160);
  *(_QWORD *)(a1 + 168) = v9;
  v10 = *(_QWORD *)(a2 + 184);
  *(_QWORD *)(a1 + 176) = *(_QWORD *)(a2 + 176);
  *(_QWORD *)(a1 + 184) = v10;
  v11 = *(_QWORD *)(a2 + 200);
  *(_QWORD *)(a1 + 192) = *(_QWORD *)(a2 + 192);
  *(_QWORD *)(a1 + 200) = v11;
  v12 = *(_QWORD *)(a2 + 216);
  *(_QWORD *)(a1 + 208) = *(_QWORD *)(a2 + 208);
  *(_QWORD *)(a1 + 216) = v12;
  v13 = *(_QWORD *)(a2 + 232);
  *(_QWORD *)(a1 + 224) = *(_QWORD *)(a2 + 224);
  *(_QWORD *)(a1 + 232) = v13;
  v14 = *(_QWORD *)(a2 + 248);
  *(_QWORD *)(a1 + 240) = *(_QWORD *)(a2 + 240);
  *(_QWORD *)(a1 + 248) = v14;
  v15 = *(_QWORD *)(a2 + 264);
  *(_QWORD *)(a1 + 256) = *(_QWORD *)(a2 + 256);
  *(_QWORD *)(a1 + 264) = v15;
  *(_OWORD *)(a1 + 272) = *(_OWORD *)(a2 + 272);
  v16 = *(_QWORD *)(a2 + 296);
  *(_QWORD *)(a1 + 288) = *(_QWORD *)(a2 + 288);
  *(_QWORD *)(a1 + 296) = v16;
  *(_OWORD *)(a1 + 304) = *(_OWORD *)(a2 + 304);
  v17 = *(_QWORD *)(a2 + 328);
  *(_QWORD *)(a1 + 320) = *(_QWORD *)(a2 + 320);
  *(_QWORD *)(a1 + 328) = v17;
  *(_QWORD *)(a1 + 336) = *(_QWORD *)(a2 + 336);
  v26 = a2 + 344;
  v27 = a1 + 344;
  v18 = *(_OWORD *)(a2 + 368);
  *(_OWORD *)(a1 + 368) = v18;
  v19 = v18;
  v25 = **(void (***)(uint64_t, uint64_t, uint64_t))(v18 - 8);
  swift_bridgeObjectRetain();
  v20 = v28;
  v21 = v29;
  v22 = v30;
  v23 = v31;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v25(v27, v26, v19);
  return a1;
}

uint64_t assignWithCopy for LocalTrainingManager(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = *(void **)(a2 + 24);
  v5 = *(void **)(a1 + 24);
  *(_QWORD *)(a1 + 24) = v4;
  v6 = v4;

  v7 = *(void **)(a2 + 32);
  v8 = *(void **)(a1 + 32);
  *(_QWORD *)(a1 + 32) = v7;
  v9 = v7;

  v10 = *(void **)(a2 + 40);
  v11 = *(void **)(a1 + 40);
  *(_QWORD *)(a1 + 40) = v10;
  v12 = v10;

  v13 = *(void **)(a2 + 48);
  v14 = *(void **)(a1 + 48);
  *(_QWORD *)(a1 + 48) = v13;
  v15 = v13;

  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  *(_BYTE *)(a1 + 57) = *(_BYTE *)(a2 + 57);
  *(_BYTE *)(a1 + 58) = *(_BYTE *)(a2 + 58);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_BYTE *)(a1 + 72) = *(_BYTE *)(a2 + 72);
  *(_BYTE *)(a1 + 73) = *(_BYTE *)(a2 + 73);
  *(_BYTE *)(a1 + 74) = *(_BYTE *)(a2 + 74);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  *(_QWORD *)(a1 + 136) = *(_QWORD *)(a2 + 136);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 144) = *(_QWORD *)(a2 + 144);
  *(_QWORD *)(a1 + 152) = *(_QWORD *)(a2 + 152);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 160) = *(_QWORD *)(a2 + 160);
  *(_QWORD *)(a1 + 168) = *(_QWORD *)(a2 + 168);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 176) = *(_QWORD *)(a2 + 176);
  *(_QWORD *)(a1 + 184) = *(_QWORD *)(a2 + 184);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 192) = *(_QWORD *)(a2 + 192);
  *(_QWORD *)(a1 + 200) = *(_QWORD *)(a2 + 200);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 208) = *(_QWORD *)(a2 + 208);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 216) = *(_QWORD *)(a2 + 216);
  *(_QWORD *)(a1 + 224) = *(_QWORD *)(a2 + 224);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 232) = *(_QWORD *)(a2 + 232);
  *(_QWORD *)(a1 + 240) = *(_QWORD *)(a2 + 240);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 248) = *(_QWORD *)(a2 + 248);
  *(_QWORD *)(a1 + 256) = *(_QWORD *)(a2 + 256);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 264) = *(_QWORD *)(a2 + 264);
  *(_QWORD *)(a1 + 272) = *(_QWORD *)(a2 + 272);
  *(_QWORD *)(a1 + 280) = *(_QWORD *)(a2 + 280);
  *(_QWORD *)(a1 + 288) = *(_QWORD *)(a2 + 288);
  *(_QWORD *)(a1 + 296) = *(_QWORD *)(a2 + 296);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 304) = *(_QWORD *)(a2 + 304);
  *(_QWORD *)(a1 + 312) = *(_QWORD *)(a2 + 312);
  *(_QWORD *)(a1 + 320) = *(_QWORD *)(a2 + 320);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 328) = *(_QWORD *)(a2 + 328);
  *(_QWORD *)(a1 + 336) = *(_QWORD *)(a2 + 336);
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 344), (uint64_t *)(a2 + 344));
  return a1;
}

void *__swift_memcpy384_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x180uLL);
}

uint64_t assignWithTake for LocalTrainingManager(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v4;
  swift_bridgeObjectRelease();
  v5 = *(void **)(a1 + 24);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);

  v6 = *(void **)(a1 + 32);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);

  v7 = *(void **)(a1 + 40);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);

  v8 = *(void **)(a1 + 48);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);

  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  *(_BYTE *)(a1 + 57) = *(_BYTE *)(a2 + 57);
  *(_BYTE *)(a1 + 58) = *(_BYTE *)(a2 + 58);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_BYTE *)(a1 + 72) = *(_BYTE *)(a2 + 72);
  *(_BYTE *)(a1 + 73) = *(_BYTE *)(a2 + 73);
  *(_BYTE *)(a1 + 74) = *(_BYTE *)(a2 + 74);
  v9 = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = v9;
  swift_bridgeObjectRelease();
  v10 = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = v10;
  swift_bridgeObjectRelease();
  v11 = *(_QWORD *)(a2 + 120);
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 120) = v11;
  swift_bridgeObjectRelease();
  v12 = *(_QWORD *)(a2 + 136);
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  *(_QWORD *)(a1 + 136) = v12;
  swift_bridgeObjectRelease();
  v13 = *(_QWORD *)(a2 + 152);
  *(_QWORD *)(a1 + 144) = *(_QWORD *)(a2 + 144);
  *(_QWORD *)(a1 + 152) = v13;
  swift_bridgeObjectRelease();
  v14 = *(_QWORD *)(a2 + 168);
  *(_QWORD *)(a1 + 160) = *(_QWORD *)(a2 + 160);
  *(_QWORD *)(a1 + 168) = v14;
  swift_bridgeObjectRelease();
  v15 = *(_QWORD *)(a2 + 184);
  *(_QWORD *)(a1 + 176) = *(_QWORD *)(a2 + 176);
  *(_QWORD *)(a1 + 184) = v15;
  swift_bridgeObjectRelease();
  v16 = *(_QWORD *)(a2 + 200);
  *(_QWORD *)(a1 + 192) = *(_QWORD *)(a2 + 192);
  *(_QWORD *)(a1 + 200) = v16;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 208) = *(_QWORD *)(a2 + 208);
  swift_bridgeObjectRelease();
  v17 = *(_QWORD *)(a2 + 224);
  *(_QWORD *)(a1 + 216) = *(_QWORD *)(a2 + 216);
  *(_QWORD *)(a1 + 224) = v17;
  swift_bridgeObjectRelease();
  v18 = *(_QWORD *)(a2 + 240);
  *(_QWORD *)(a1 + 232) = *(_QWORD *)(a2 + 232);
  *(_QWORD *)(a1 + 240) = v18;
  swift_bridgeObjectRelease();
  v19 = *(_QWORD *)(a2 + 256);
  *(_QWORD *)(a1 + 248) = *(_QWORD *)(a2 + 248);
  *(_QWORD *)(a1 + 256) = v19;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 264) = *(_QWORD *)(a2 + 264);
  *(_QWORD *)(a1 + 272) = *(_QWORD *)(a2 + 272);
  *(_OWORD *)(a1 + 280) = *(_OWORD *)(a2 + 280);
  *(_QWORD *)(a1 + 296) = *(_QWORD *)(a2 + 296);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 304) = *(_OWORD *)(a2 + 304);
  *(_QWORD *)(a1 + 320) = *(_QWORD *)(a2 + 320);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 328) = *(_QWORD *)(a2 + 328);
  *(_QWORD *)(a1 + 336) = *(_QWORD *)(a2 + 336);
  __swift_destroy_boxed_opaque_existential_1Tm(a1 + 344);
  v20 = *(_OWORD *)(a2 + 360);
  *(_OWORD *)(a1 + 344) = *(_OWORD *)(a2 + 344);
  *(_OWORD *)(a1 + 360) = v20;
  *(_QWORD *)(a1 + 376) = *(_QWORD *)(a2 + 376);
  return a1;
}

uint64_t getEnumTagSinglePayload for LocalTrainingManager(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 384))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for LocalTrainingManager(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 376) = 0;
    *(_OWORD *)(result + 248) = 0u;
    *(_OWORD *)(result + 232) = 0u;
    *(_OWORD *)(result + 216) = 0u;
    *(_OWORD *)(result + 200) = 0u;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 360) = 0u;
    *(_OWORD *)(result + 344) = 0u;
    *(_OWORD *)(result + 328) = 0u;
    *(_OWORD *)(result + 312) = 0u;
    *(_OWORD *)(result + 296) = 0u;
    *(_OWORD *)(result + 280) = 0u;
    *(_OWORD *)(result + 264) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 384) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 16) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 384) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for LocalTrainingManager()
{
  return &type metadata for LocalTrainingManager;
}

uint64_t sub_243951F20(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2572D9F20);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t SynchronizedExecutionManager.init()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  _QWORD v9[2];

  v2 = sub_24396FD34();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_24396FD28();
  MEMORY[0x24BDAC7A8](v6);
  v7 = sub_24396FB00();
  MEMORY[0x24BDAC7A8](v7);
  sub_243952108();
  sub_24396FAF4();
  v9[1] = MEMORY[0x24BEE4AF8];
  sub_243952144();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2572D9F38);
  sub_24395218C();
  sub_24396FDC4();
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, *MEMORY[0x24BEE5750], v2);
  result = sub_24396FD4C();
  *(_QWORD *)a1 = result;
  *(_BYTE *)(a1 + 8) = 0;
  return result;
}

unint64_t sub_243952108()
{
  unint64_t result;

  result = qword_2572D9F28;
  if (!qword_2572D9F28)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2572D9F28);
  }
  return result;
}

unint64_t sub_243952144()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2572D9F30;
  if (!qword_2572D9F30)
  {
    v1 = sub_24396FD28();
    result = MEMORY[0x2494FDCE4](MEMORY[0x24BEE5698], v1);
    atomic_store(result, (unint64_t *)&qword_2572D9F30);
  }
  return result;
}

unint64_t sub_24395218C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2572D9F40;
  if (!qword_2572D9F40)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2572D9F38);
    result = MEMORY[0x2494FDCE4](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, (unint64_t *)&qword_2572D9F40);
  }
  return result;
}

Swift::Void __swiftcall SynchronizedExecutionManager.stop()()
{
  void **v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[6];

  v1 = *v0;
  v2 = swift_allocObject();
  *(_QWORD *)(v2 + 16) = v0;
  v3 = swift_allocObject();
  *(_QWORD *)(v3 + 16) = sub_2439523E8;
  *(_QWORD *)(v3 + 24) = v2;
  v6[4] = sub_243947764;
  v6[5] = v3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 1107296256;
  v6[2] = sub_243952400;
  v6[3] = &block_descriptor_0;
  v4 = _Block_copy(v6);
  v5 = v1;
  swift_retain();
  swift_release();
  dispatch_sync(v5, v4);

  _Block_release(v4);
  LOBYTE(v4) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  swift_release();
  if ((v4 & 1) != 0)
    __break(1u);
}

void sub_243952300(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;

  if (qword_2572D9D10 != -1)
    swift_once();
  v2 = sub_24396FAE8();
  __swift_project_value_buffer(v2, (uint64_t)qword_2572DA2B0);
  v3 = sub_24396FAD0();
  v4 = sub_24396FCF8();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_243921000, v3, v4, "Plugin received stop signal", v5, 2u);
    MEMORY[0x2494FDD74](v5, -1, -1);
  }

  *(_BYTE *)(a1 + 8) = 1;
}

uint64_t sub_2439523D8()
{
  return swift_deallocObject();
}

void sub_2439523E8()
{
  uint64_t v0;

  sub_243952300(*(_QWORD *)(v0 + 16));
}

uint64_t sub_2439523F0()
{
  return swift_deallocObject();
}

uint64_t sub_243952400(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

uint64_t SynchronizedExecutionManager.shouldStop.getter()
{
  unsigned __int8 v1;

  sub_24396FD40();
  return v1;
}

void sub_243952498(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 24);
}

uint64_t sub_2439524A4()
{
  unsigned __int8 v1;

  sub_24396FD40();
  return v1;
}

uint64_t dispatch thunk of ExecutionManager.shouldStop.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

ValueMetadata *type metadata accessor for IsTaskCancelledExecutionManager()
{
  return &type metadata for IsTaskCancelledExecutionManager;
}

uint64_t initializeBufferWithCopyOfBuffer for SynchronizedExecutionManager(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  v3 = *(void **)a2;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  v4 = v3;
  return a1;
}

void destroy for SynchronizedExecutionManager(id *a1)
{

}

uint64_t assignWithCopy for SynchronizedExecutionManager(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;

  v4 = *(void **)a2;
  v5 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v4;

  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  return a1;
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  *(_BYTE *)(result + 8) = *((_BYTE *)a2 + 8);
  *(_QWORD *)result = v2;
  return result;
}

uint64_t assignWithTake for SynchronizedExecutionManager(uint64_t a1, uint64_t a2)
{
  void *v4;

  v4 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;

  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  return a1;
}

uint64_t getEnumTagSinglePayload for SynchronizedExecutionManager(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 9))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SynchronizedExecutionManager(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_BYTE *)(result + 8) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 9) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 9) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for SynchronizedExecutionManager()
{
  return &type metadata for SynchronizedExecutionManager;
}

void sub_243952688(_BYTE *a1@<X8>)
{
  sub_243952498(a1);
}

uint64_t sub_2439526A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  __int128 v9[2];

  if (*(_QWORD *)(a1 + 24))
  {
    sub_243946A88((__int128 *)a1, (uint64_t)v9);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v8 = *v3;
    *v3 = 0x8000000000000000;
    sub_243965410(v9, a2, a3, isUniquelyReferenced_nonNull_native);
    *v3 = v8;
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  else
  {
    sub_24394ADB4(a1, (uint64_t *)&unk_2572D9FD0);
    sub_24395B940(a2, a3, (uint64_t)v9);
    swift_bridgeObjectRelease();
    return sub_24394ADB4((uint64_t)v9, (uint64_t *)&unk_2572D9FD0);
  }
}

uint64_t sub_243952774(uint64_t (*a1)(id *), uint64_t a2, unint64_t a3)
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v7;
  unint64_t v8;
  id v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  char v13;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  id v18;
  uint64_t v19;

  v4 = a3;
  v19 = MEMORY[0x24BEE4AF8];
  if (a3 >> 62)
    goto LABEL_18;
  v7 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (v7)
  {
    while (1)
    {
      v8 = 0;
      v16 = v4 & 0xFFFFFFFFFFFFFF8;
      v17 = v4 & 0xC000000000000001;
      v15 = v4;
      while (v17)
      {
        v9 = (id)MEMORY[0x2494FD69C](v8, v4);
LABEL_9:
        v10 = v9;
        v11 = v8 + 1;
        if (__OFADD__(v8, 1))
          goto LABEL_17;
        v18 = v9;
        v12 = a2;
        v13 = a1(&v18);
        if (v3)
        {
          swift_bridgeObjectRelease();

          swift_release();
          return v12;
        }
        if ((v13 & 1) != 0)
        {
          sub_24396FE90();
          sub_24396FEB4();
          v4 = v15;
          sub_24396FEC0();
          sub_24396FE9C();
        }
        else
        {

        }
        ++v8;
        if (v11 == v7)
        {
          v12 = v19;
          goto LABEL_20;
        }
      }
      if (v8 < *(_QWORD *)(v16 + 16))
        break;
      __break(1u);
LABEL_17:
      __break(1u);
LABEL_18:
      v7 = sub_24396FF20();
      if (!v7)
        goto LABEL_19;
    }
    v9 = *(id *)(v4 + 8 * v8 + 32);
    goto LABEL_9;
  }
LABEL_19:
  v12 = MEMORY[0x24BEE4AF8];
LABEL_20:
  swift_bridgeObjectRelease();
  return v12;
}

uint64_t DurableFeatureManager.init(config:executionManager:conversationSelection:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  __int128 v7;
  void *v8;
  id v9;
  uint64_t result;

  v7 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)a4 = *(_OWORD *)a1;
  *(_OWORD *)(a4 + 16) = v7;
  v8 = *(void **)(a1 + 32);
  memcpy((void *)(a4 + 40), (const void *)(a1 + 40), 0x130uLL);
  *(_QWORD *)(a4 + 32) = v8;
  sub_243946A44(a2, a4 + 344);
  *(_QWORD *)(a4 + 384) = a3;
  v9 = objc_msgSend(v8, sel_source);
  result = __swift_destroy_boxed_opaque_existential_1Tm(a2);
  *(_QWORD *)(a4 + 392) = v9;
  return result;
}

void DurableFeatureManager.init(config:executionManager:)(__int128 *a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  uint64_t v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  void *v34;
  void *v35;
  id v36;
  uint64_t v37;
  void *v38;
  void *v39;
  id v40;
  uint64_t v41;
  id v42;
  id v43;
  id v44;
  void *v45;
  id v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  id v50;
  uint64_t v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  void *v61;
  id v62;
  id v63;
  uint64_t v64;
  _OWORD __src[25];
  _BYTE v66[40];
  _BYTE __dst[272];
  __int128 v68;
  uint64_t v69;
  __int128 v70;
  uint64_t v71;

  v70 = *a1;
  v3 = (void *)*((_QWORD *)a1 + 3);
  v71 = *((_QWORD *)a1 + 2);
  v63 = v3;
  v64 = *((_QWORD *)a1 + 8);
  v69 = *((_QWORD *)a1 + 7);
  v58 = (void *)*((_QWORD *)a1 + 4);
  v68 = *(__int128 *)((char *)a1 + 40);
  memcpy(__dst, (char *)a1 + 72, sizeof(__dst));
  __swift_instantiateConcreteTypeFromMangledName(&qword_2572DA020);
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_243971880;
  v5 = sub_24393E124(0, (unint64_t *)&qword_2572D9D38);
  *(_QWORD *)(v4 + 32) = sub_24396FD64();
  *(_QWORD *)(v4 + 40) = sub_24396FD64();
  *(_QWORD *)(v4 + 48) = sub_24396FD64();
  sub_24396FC2C();
  v6 = v4;
  v61 = (void *)sub_24396FD64();
  v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_243971890;
  *(_QWORD *)(v7 + 32) = sub_24396FD64();
  *(_QWORD *)(v7 + 40) = sub_24396FD64();
  sub_24396FC2C();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2572DA0F0);
  v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_243970F70;
  v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_2572D9ED8);
  *(_QWORD *)(v8 + 56) = v54;
  *(_QWORD *)(v8 + 32) = &unk_2514105B8;
  v9 = (void *)sub_24396FB48();
  v10 = (void *)sub_24396FC08();
  swift_bridgeObjectRelease();
  v11 = (void *)objc_opt_self();
  v12 = objc_msgSend(v11, sel_predicateWithFormat_argumentArray_, v9, v10);

  v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_243970F70;
  v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_2572D9F48);
  v57 = v6;
  *(_QWORD *)(v13 + 56) = v56;
  *(_QWORD *)(v13 + 32) = v6;
  swift_bridgeObjectRetain();
  v14 = (void *)sub_24396FB48();
  v15 = (void *)sub_24396FC08();
  swift_bridgeObjectRelease();
  v16 = objc_msgSend(v11, sel_predicateWithFormat_argumentArray_, v14, v15);

  v17 = swift_allocObject();
  *(_OWORD *)(v17 + 16) = xmmword_243970F70;
  *(_QWORD *)(v17 + 56) = v5;
  *(_QWORD *)(v17 + 32) = v61;
  v62 = v61;
  v18 = (void *)sub_24396FB48();
  v19 = (void *)sub_24396FC08();
  swift_bridgeObjectRelease();
  v20 = objc_msgSend(v11, sel_predicateWithFormat_argumentArray_, v18, v19);

  v21 = swift_allocObject();
  *(_OWORD *)(v21 + 16) = xmmword_243971880;
  *(_QWORD *)(v21 + 32) = v12;
  *(_QWORD *)(v21 + 40) = v16;
  *(_QWORD *)(v21 + 48) = v20;
  *(_QWORD *)&__src[0] = v21;
  sub_24396FC2C();
  sub_24393E124(0, &qword_2572D9D30);
  v22 = v12;
  v23 = v16;
  v24 = v20;
  v25 = (void *)sub_24396FC08();
  swift_bridgeObjectRelease();
  v26 = (void *)objc_opt_self();
  v27 = objc_msgSend(v26, sel_andPredicateWithSubpredicates_, v25);

  if (v64 < 0)
  {
    __break(1u);
  }
  else
  {
    v52 = v27;
    v28 = objc_msgSend(v63, sel_lh_kMostRecentConversationsWithLimit_predicate_, v64, v27);
    v51 = sub_24396FCB0();

    v29 = swift_allocObject();
    *(_OWORD *)(v29 + 16) = xmmword_243970F70;
    *(_QWORD *)(v29 + 56) = v54;
    *(_QWORD *)(v29 + 32) = &unk_2514105B8;
    v55 = v22;
    v30 = (void *)sub_24396FB48();
    v53 = v24;
    v31 = (void *)sub_24396FC08();
    swift_bridgeObjectRelease();
    v32 = objc_msgSend(v11, sel_predicateWithFormat_argumentArray_, v30, v31);

    v33 = swift_allocObject();
    *(_OWORD *)(v33 + 16) = xmmword_243970F70;
    *(_QWORD *)(v33 + 56) = v56;
    *(_QWORD *)(v33 + 32) = v57;
    v34 = (void *)sub_24396FB48();
    v35 = (void *)sub_24396FC08();
    swift_bridgeObjectRelease();
    v36 = objc_msgSend(v11, sel_predicateWithFormat_argumentArray_, v34, v35);

    v37 = swift_allocObject();
    *(_OWORD *)(v37 + 16) = xmmword_243970F70;
    *(_QWORD *)(v37 + 56) = v56;
    *(_QWORD *)(v37 + 32) = v7;
    v38 = (void *)sub_24396FB48();
    v39 = (void *)sub_24396FC08();
    swift_bridgeObjectRelease();
    v40 = objc_msgSend(v11, sel_predicateWithFormat_argumentArray_, v38, v39);

    v41 = swift_allocObject();
    *(_OWORD *)(v41 + 16) = xmmword_243971880;
    *(_QWORD *)(v41 + 32) = v32;
    *(_QWORD *)(v41 + 40) = v36;
    *(_QWORD *)(v41 + 48) = v40;
    sub_24396FC2C();
    v42 = v32;
    v43 = v36;
    v44 = v40;
    v45 = (void *)sub_24396FC08();
    swift_bridgeObjectRelease();
    v46 = objc_msgSend(v26, sel_andPredicateWithSubpredicates_, v45);

    v47 = objc_msgSend(v63, sel_lh_kMostRecentConversationsWithLimit_predicate_, v64, v46);
    v48 = sub_24396FCB0();

    v49 = sub_243953154(v48, v51);
    sub_243946A44(a2, (uint64_t)v66);
    __src[0] = v70;
    *(_QWORD *)&__src[1] = v71;
    *((_QWORD *)&__src[1] + 1) = v63;
    *(_QWORD *)&__src[2] = v58;
    *(_OWORD *)((char *)&__src[2] + 8) = v68;
    *((_QWORD *)&__src[3] + 1) = v69;
    *(_QWORD *)&__src[4] = v64;
    memcpy((char *)&__src[4] + 8, __dst, 0x110uLL);
    sub_243946A44((uint64_t)v66, (uint64_t)&__src[21] + 8);
    *(_QWORD *)&__src[24] = v49;
    v50 = objc_msgSend(v58, sel_source);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v66);
    *((_QWORD *)&__src[24] + 1) = v50;
    memcpy(a3, __src, 0x190uLL);

    __swift_destroy_boxed_opaque_existential_1Tm(a2);
  }
}

uint64_t sub_243953154(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  int64_t v14;
  unint64_t v15;
  int64_t v16;
  uint64_t v17;
  uint64_t v18;

  v2 = result;
  v3 = 0;
  v18 = a2;
  v4 = result + 56;
  v5 = 1 << *(_BYTE *)(result + 32);
  v6 = -1;
  if (v5 < 64)
    v6 = ~(-1 << v5);
  v7 = v6 & *(_QWORD *)(result + 56);
  v8 = (unint64_t)(v5 + 63) >> 6;
  while (1)
  {
    if (v7)
    {
      v9 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      v10 = v9 | (v3 << 6);
      goto LABEL_5;
    }
    v14 = v3 + 1;
    if (__OFADD__(v3, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v14 >= v8)
      goto LABEL_23;
    v15 = *(_QWORD *)(v4 + 8 * v14);
    ++v3;
    if (!v15)
    {
      v3 = v14 + 1;
      if (v14 + 1 >= v8)
        goto LABEL_23;
      v15 = *(_QWORD *)(v4 + 8 * v3);
      if (!v15)
      {
        v3 = v14 + 2;
        if (v14 + 2 >= v8)
          goto LABEL_23;
        v15 = *(_QWORD *)(v4 + 8 * v3);
        if (!v15)
        {
          v3 = v14 + 3;
          if (v14 + 3 >= v8)
            goto LABEL_23;
          v15 = *(_QWORD *)(v4 + 8 * v3);
          if (!v15)
            break;
        }
      }
    }
LABEL_22:
    v7 = (v15 - 1) & v15;
    v10 = __clz(__rbit64(v15)) + (v3 << 6);
LABEL_5:
    v11 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v10);
    v12 = *v11;
    v13 = v11[1];
    swift_bridgeObjectRetain();
    sub_243965A4C(&v17, v12, v13);
    result = swift_bridgeObjectRelease();
  }
  v16 = v14 + 4;
  if (v16 >= v8)
  {
LABEL_23:
    swift_release();
    return v18;
  }
  v15 = *(_QWORD *)(v4 + 8 * v16);
  if (v15)
  {
    v3 = v16;
    goto LABEL_22;
  }
  while (1)
  {
    v3 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v3 >= v8)
      goto LABEL_23;
    v15 = *(_QWORD *)(v4 + 8 * v3);
    ++v16;
    if (v15)
      goto LABEL_22;
  }
LABEL_25:
  __break(1u);
  return result;
}

id sub_2439532D0(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9;
  void (*v10)(unint64_t);
  void *v11;
  id v12;
  id v13;

  if (!a4)
  {
    v9 = 0;
    v10 = (void (*)(unint64_t))sub_243954528;
    if ((a3 & 1) == 0)
      goto LABEL_3;
LABEL_5:
    sub_24395EE3C(a4);
    v10(a1);
    v11 = (void *)sub_24396FCE0();
    v12 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE0C4A0]), sel_initWithIntValue_doubleValue_stringValue_BOOLValue_histogramValue_, v11, 0, 0, 0, 0);
    goto LABEL_6;
  }
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = a4;
  *(_QWORD *)(v9 + 24) = a5;
  v10 = (void (*)(unint64_t))sub_24395EE34;
  if ((a3 & 1) != 0)
    goto LABEL_5;
LABEL_3:
  sub_24395EE3C(a4);
  sub_243953CB8(a1, (uint64_t (*)(_QWORD *))v10, v9);
  v11 = (void *)sub_24396FC98();
  v12 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE0C4A0]), sel_initWithIntValue_doubleValue_stringValue_BOOLValue_histogramValue_, 0, v11, 0, 0, 0);
LABEL_6:
  v13 = v12;
  swift_release();

  return v13;
}

uint64_t sub_243953408(unint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v2;
  uint64_t v3;

  v2 = sub_24395F8EC(a1, a2);
  v3 = *(_QWORD *)(sub_243960CE0(v2) + 16);
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t sub_24395344C(uint64_t a1)
{
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  double v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  _BYTE *v12;
  _BYTE *v13;
  _QWORD *v14;
  uint64_t v15;
  void (*v16)(_BYTE *, _BYTE *, uint64_t);
  void (*v17)(_BYTE *, uint64_t, uint64_t, uint64_t);
  uint64_t (*v18)(_BYTE *, uint64_t, uint64_t);
  uint64_t v19;
  uint64_t v20;
  id v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  _BYTE *v26;
  void (*v27)(_BYTE *, uint64_t);
  char v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  int64_t v48;
  uint64_t v49;
  unint64_t v50;
  uint64_t v51;
  unint64_t v52;
  unint64_t v53;
  uint64_t v54;
  _BYTE v55[12];
  int v56;
  unint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  uint64_t v62;
  _BYTE *v63;
  uint64_t v64;
  void (*v65)(_BYTE *, uint64_t, uint64_t, uint64_t);
  _BYTE *v66;
  unint64_t v67;
  unint64_t v68;
  unint64_t v69;

  if (a1 < 0 || (a1 & 0x4000000000000000) != 0)
  {
    v53 = swift_bridgeObjectRetain();
    v1 = (unint64_t)sub_24395BD3C(v53, (void (*)(_QWORD *, uint64_t, unint64_t))sub_24395EE4C);
    swift_bridgeObjectRelease();
  }
  else
  {
    v1 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain();
  }
  v69 = v1;
  sub_24395BC20((uint64_t *)&v69);
  v2 = v69;
  v3 = (v69 >> 62) & 1;
  if ((v69 & 0x8000000000000000) != 0)
    LODWORD(v3) = 1;
  v56 = v3;
  if ((v3 & 1) != 0)
  {
LABEL_85:
    swift_bridgeObjectRetain();
    v4 = sub_24396FF20();
    swift_release();
  }
  else
  {
    v4 = *(_QWORD *)(v69 + 16);
  }
  v59 = v4 - 1;
  if (v4 <= 1)
    return swift_release();
  v61 = 0;
  v6 = 0;
  v67 = v2;
  v68 = v2 & 0xC000000000000001;
  v57 = v2 + 32;
  v58 = v4;
  v7 = 0.0;
  while (v6 >= v59)
  {
    v60 = v6;
LABEL_29:
    v6 = v60;
    if (v60 < (uint64_t)v61)
    {
LABEL_77:
      __break(1u);
LABEL_78:
      __break(1u);
LABEL_79:
      __break(1u);
LABEL_80:
      __break(1u);
LABEL_81:
      __break(1u);
LABEL_82:
      __break(1u);
LABEL_83:
      __break(1u);
LABEL_84:
      __break(1u);
      goto LABEL_85;
    }
    v29 = v60 + 1;
    if (__OFADD__(v60, 1))
      goto LABEL_78;
    if (v56)
    {
      swift_retain();
      swift_bridgeObjectRetain();
      v30 = sub_24396FF20();
      swift_release();
      if (v30 < (uint64_t)v61)
        goto LABEL_79;
      swift_bridgeObjectRetain();
      v31 = sub_24396FF20();
      swift_release();
    }
    else
    {
      v32 = *(_QWORD *)(v2 + 16);
      swift_retain();
      if (v32 < v61)
        goto LABEL_79;
      v31 = *(_QWORD *)(v2 + 16);
    }
    if (v31 < v29)
      goto LABEL_80;
    if (v29 < 0)
      goto LABEL_81;
    if (v68)
    {
      if (v29 < v61)
        goto LABEL_82;
      if (v61 != v29)
      {
        sub_24393E124(0, &qword_2572DA0E0);
        v33 = v61;
        do
        {
          v34 = v33 + 1;
          sub_24396FE60();
          v33 = v34;
        }
        while (v29 != v34);
      }
    }
    if (v56)
    {
      swift_bridgeObjectRetain();
      sub_24396FF2C();
      v36 = v35;
      v38 = v37;
      v40 = v39;
      swift_release_n();
      v41 = v40 >> 1;
      if ((v40 & 1) == 0)
        goto LABEL_52;
    }
    else
    {
      v36 = v57;
      v38 = v61;
      v46 = (2 * v29) | 1;
      v41 = v46 >> 1;
      if ((v46 & 1) == 0)
      {
LABEL_52:
        v44 = v41 - v38;
        if (__OFSUB__(v41, v38))
          goto LABEL_83;
        if (!v44)
          goto LABEL_65;
        goto LABEL_54;
      }
    }
    sub_24396FFA4();
    swift_unknownObjectRetain_n();
    v42 = swift_dynamicCastClass();
    if (!v42)
    {
      swift_unknownObjectRelease();
      v42 = MEMORY[0x24BEE4AF8];
    }
    v43 = *(_QWORD *)(v42 + 16);
    swift_release();
    v44 = v41 - v38;
    if (__OFSUB__(v41, v38))
      goto LABEL_84;
    if (v43 == v44)
    {
      v45 = swift_dynamicCastClass();
      v6 = v60;
      if (v45)
        goto LABEL_66;
      swift_unknownObjectRelease();
LABEL_65:
      v45 = MEMORY[0x24BEE4AF8];
      goto LABEL_66;
    }
    swift_unknownObjectRelease();
    v6 = v60;
    if (!v44)
      goto LABEL_65;
LABEL_54:
    v47 = 8 * v44;
    if (v44 < 1)
    {
      v45 = MEMORY[0x24BEE4AF8];
      if (v38 == v41)
        goto LABEL_91;
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_2572DA020);
      v45 = swift_allocObject();
      v48 = _swift_stdlib_malloc_size((const void *)v45);
      v49 = v48 - 32;
      if (v48 < 32)
        v49 = v48 - 25;
      *(_QWORD *)(v45 + 16) = v44;
      *(_QWORD *)(v45 + 24) = (2 * (v49 >> 3)) | 1;
      if (v38 == v41)
        goto LABEL_91;
    }
    if (v44 < 0)
      goto LABEL_92;
    v50 = v36 + 8 * v38;
    if (v50 < v45 + 32 + v47 && v45 + 32 < v50 + v47)
      goto LABEL_92;
    sub_24393E124(0, &qword_2572DA0E0);
    swift_arrayInitWithCopy();
    v6 = v60;
LABEL_66:
    swift_unknownObjectRelease();
    if (v45 < 0 || (v45 & 0x4000000000000000) != 0)
    {
      swift_bridgeObjectRetain();
      v51 = sub_24396FF20();
      swift_release();
    }
    else
    {
      v51 = *(_QWORD *)(v45 + 16);
    }
    swift_release();
    v7 = v7 + (double)v51;
    v52 = v61 + 1;
    if (v6 < v4)
    {
      ++v61;
      if (v52 != v4)
        continue;
    }
    return swift_release();
  }
  while (1)
  {
    v62 = v6 + 1;
    if (v68)
    {
      v8 = (id)MEMORY[0x2494FD69C]();
    }
    else
    {
      if (v6 < -1)
      {
        __break(1u);
LABEL_75:
        __break(1u);
LABEL_76:
        __break(1u);
        goto LABEL_77;
      }
      if ((unint64_t)(v6 + 1) >= *(_QWORD *)(v2 + 16))
        goto LABEL_76;
      v8 = *(id *)(v2 + 8 * v6 + 40);
    }
    v9 = v8;
    v60 = v6;
    v10 = objc_msgSend(v8, sel_startDate);

    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2572D9E90);
    v66 = v55;
    v12 = *(_BYTE **)(*(_QWORD *)(v11 - 8) + 64);
    MEMORY[0x24BDAC7A8](v11);
    v13 = &v55[-((unint64_t)(v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
    if (!v10)
      break;
    v4 = sub_24396FA04();
    v14 = *(_QWORD **)(v4 - 8);
    v15 = v14[8];
    MEMORY[0x24BDAC7A8](v4);
    v2 = (v15 + 15) & 0xFFFFFFFFFFFFFFF0;
    sub_24396F9D4();

    v16 = (void (*)(_BYTE *, _BYTE *, uint64_t))v14[4];
    v16(&v55[-((unint64_t)(v12 + 15) & 0xFFFFFFFFFFFFFFF0)], &v55[-v2], v4);
    v17 = (void (*)(_BYTE *, uint64_t, uint64_t, uint64_t))v14[7];
    v17(&v55[-((unint64_t)(v12 + 15) & 0xFFFFFFFFFFFFFFF0)], 0, 1, v4);
    v18 = (uint64_t (*)(_BYTE *, uint64_t, uint64_t))v14[6];
    v19 = v18(&v55[-((unint64_t)(v12 + 15) & 0xFFFFFFFFFFFFFFF0)], 1, v4);
    if ((_DWORD)v19 == 1)
      goto LABEL_88;
    MEMORY[0x24BDAC7A8](v19);
    v63 = &v55[-v2];
    v64 = v20;
    v65 = v17;
    if (v68)
    {
      v21 = (id)MEMORY[0x2494FD69C](v61, v67);
    }
    else
    {
      if (v61 >= *(_QWORD *)(v67 + 16))
        goto LABEL_75;
      v21 = *(id *)(v57 + 8 * v61);
    }
    v22 = v21;
    v23 = objc_msgSend(v21, sel_startDate);

    v25 = MEMORY[0x24BDAC7A8](v24);
    v12 = &v55[-((unint64_t)(v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
    if (!v23)
      goto LABEL_89;
    MEMORY[0x24BDAC7A8](v25);
    sub_24396F9D4();

    v16(v12, &v55[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)], v4);
    v65(v12, 0, 1, v4);
    if (v18(v12, 1, v4) == 1)
      goto LABEL_90;
    v26 = v63;
    sub_24396F998();
    v27 = (void (*)(_BYTE *, uint64_t))v14[1];
    v27(v12, v4);
    sub_24396073C((unint64_t *)&qword_2572D9F58, MEMORY[0x24BDCE940]);
    v28 = sub_24396FB3C();
    v27(v26, v4);
    v27(v13, v4);
    v2 = v67;
    v4 = v58;
    if ((v28 & 1) != 0)
      goto LABEL_29;
    v6 = v62;
    if (v59 == v62)
    {
      v60 = v59;
      goto LABEL_29;
    }
  }
  v54 = sub_24396FA04();
  (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v54 - 8) + 56))(&v55[-((unint64_t)(v12 + 15) & 0xFFFFFFFFFFFFFFF0)], 1, 1, v54);
LABEL_88:
  __break(1u);
LABEL_89:
  v65(v12, 1, 1, v4);
LABEL_90:
  __break(1u);
LABEL_91:
  __break(1u);
  swift_release();
  __break(1u);
LABEL_92:
  result = sub_24396FF5C();
  __break(1u);
  return result;
}

uint64_t sub_243953CB8(uint64_t a1, uint64_t (*a2)(_QWORD *), uint64_t a3)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  double v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  char *v15;
  char *v16;
  _QWORD *v17;
  uint64_t v18;
  void (*v19)(char *, char *, uint64_t);
  void (*v20)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t (*v21)(char *, uint64_t, uint64_t);
  uint64_t v22;
  uint64_t v23;
  id v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  void (*v30)(char *, uint64_t);
  char v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  _QWORD *v47;
  unint64_t v48;
  uint64_t v49;
  int64_t v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;
  uint64_t result;
  unint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t (*v58)(_QWORD *);
  uint64_t v59;
  int v60;
  unint64_t v61;
  uint64_t v62;
  uint64_t v63;
  unint64_t v64;
  uint64_t v65;
  char *v66;
  uint64_t v67;
  void (*v68)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t *v69;
  unint64_t v70;
  unint64_t v71;
  unint64_t v72;

  v58 = a2;
  v59 = a3;
  if (a1 < 0 || (a1 & 0x4000000000000000) != 0)
  {
    v55 = swift_bridgeObjectRetain();
    v4 = (unint64_t)sub_24395BD3C(v55, (void (*)(_QWORD *, uint64_t, unint64_t))sub_24395EE4C);
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain();
  }
  v72 = v4;
  sub_24395BC20((uint64_t *)&v72);
  v5 = v72;
  v6 = (v72 >> 62) & 1;
  if ((v72 & 0x8000000000000000) != 0)
    LODWORD(v6) = 1;
  v60 = v6;
  if ((_DWORD)v6 == 1)
  {
LABEL_83:
    swift_bridgeObjectRetain();
    v7 = sub_24396FF20();
    swift_release();
    if (v7)
      goto LABEL_8;
    return swift_release();
  }
  v7 = *(_QWORD *)(v72 + 16);
  if (!v7)
    return swift_release();
LABEL_8:
  v62 = v7 - 1;
  if (v7 == 1)
    return swift_release();
  v57 = v7;
  if (v7 <= 0)
    return swift_release();
  v8 = 0;
  v9 = 0;
  v70 = v5;
  v71 = v5 & 0xC000000000000001;
  v61 = v5 + 32;
  v10 = 0.0;
  while (1)
  {
    v64 = v8;
    if (v9 < v62)
      break;
    v63 = v9;
LABEL_29:
    if (v63 < (uint64_t)v64)
    {
LABEL_75:
      __break(1u);
LABEL_76:
      __break(1u);
LABEL_77:
      __break(1u);
LABEL_78:
      __break(1u);
LABEL_79:
      __break(1u);
LABEL_80:
      __break(1u);
LABEL_81:
      __break(1u);
LABEL_82:
      __break(1u);
      goto LABEL_83;
    }
    v32 = v63 + 1;
    if (__OFADD__(v63, 1))
      goto LABEL_76;
    if (v60)
    {
      swift_retain();
      swift_bridgeObjectRetain();
      v33 = sub_24396FF20();
      swift_release();
      if (v33 < (uint64_t)v64)
        goto LABEL_77;
      swift_bridgeObjectRetain();
      v34 = sub_24396FF20();
      swift_release();
    }
    else
    {
      v35 = *(_QWORD *)(v5 + 16);
      swift_retain();
      if (v35 < v64)
        goto LABEL_77;
      v34 = *(_QWORD *)(v5 + 16);
    }
    if (v34 < v32)
      goto LABEL_78;
    if (v32 < 0)
      goto LABEL_79;
    if (v71)
    {
      if (v32 < v64)
        goto LABEL_80;
      if (v64 != v32)
      {
        sub_24393E124(0, &qword_2572DA0E0);
        v36 = v64;
        do
        {
          v37 = v36 + 1;
          sub_24396FE60();
          v36 = v37;
        }
        while (v32 != v37);
      }
    }
    if (v60)
    {
      swift_bridgeObjectRetain();
      sub_24396FF2C();
      v39 = v38;
      v3 = v40;
      v42 = v41;
      swift_release_n();
      v43 = v42 >> 1;
      if ((v42 & 1) == 0)
        goto LABEL_52;
    }
    else
    {
      v39 = v61;
      v3 = v64;
      v48 = (2 * v32) | 1;
      v43 = v48 >> 1;
      if ((v48 & 1) == 0)
      {
LABEL_52:
        v46 = v43 - v3;
        if (__OFSUB__(v43, v3))
          goto LABEL_81;
        if (v46)
          goto LABEL_54;
        goto LABEL_65;
      }
    }
    sub_24396FFA4();
    swift_unknownObjectRetain_n();
    v44 = swift_dynamicCastClass();
    if (!v44)
    {
      swift_unknownObjectRelease();
      v44 = MEMORY[0x24BEE4AF8];
    }
    v45 = *(_QWORD *)(v44 + 16);
    swift_release();
    v46 = v43 - v3;
    if (__OFSUB__(v43, v3))
      goto LABEL_82;
    if (v45 == v46)
    {
      v47 = (_QWORD *)swift_dynamicCastClass();
      v9 = v63;
      if (!v47)
      {
        swift_unknownObjectRelease();
        v47 = (_QWORD *)MEMORY[0x24BEE4AF8];
      }
      goto LABEL_67;
    }
    swift_unknownObjectRelease();
    if (v46)
    {
LABEL_54:
      v49 = v46;
      if (v46 < 1)
      {
        v47 = (_QWORD *)MEMORY[0x24BEE4AF8];
        if (v3 == v43)
          goto LABEL_90;
      }
      else
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_2572DA020);
        v47 = (_QWORD *)swift_allocObject();
        v50 = _swift_stdlib_malloc_size(v47);
        v51 = v50 - 32;
        if (v50 < 32)
          v51 = v50 - 25;
        v47[2] = v46;
        v47[3] = (2 * (v51 >> 3)) | 1;
        if (v3 == v43)
          goto LABEL_90;
      }
      if (v46 < 0)
        goto LABEL_91;
      v52 = v39 + 8 * v3;
      if (v52 < (unint64_t)&v47[v49 + 4] && (unint64_t)(v47 + 4) < v52 + v49 * 8)
        goto LABEL_91;
      sub_24393E124(0, &qword_2572DA0E0);
      swift_arrayInitWithCopy();
      goto LABEL_66;
    }
LABEL_65:
    v47 = (_QWORD *)MEMORY[0x24BEE4AF8];
LABEL_66:
    v9 = v63;
LABEL_67:
    swift_unknownObjectRelease();
    v53 = v58(v47);
    swift_release();
    v10 = v10 + (double)v53;
    if (v9 < v57)
    {
      v8 = v64 + 1;
      if (v64 + 1 != v57)
        continue;
    }
    return swift_release();
  }
  while (1)
  {
    v65 = v9 + 1;
    if (v71)
    {
      v11 = (id)MEMORY[0x2494FD69C]();
    }
    else
    {
      if (v9 < -1)
      {
        __break(1u);
LABEL_73:
        __break(1u);
LABEL_74:
        __break(1u);
        goto LABEL_75;
      }
      if ((unint64_t)(v9 + 1) >= *(_QWORD *)(v5 + 16))
        goto LABEL_74;
      v11 = *(id *)(v5 + 8 * v9 + 40);
    }
    v12 = v11;
    v63 = v9;
    v13 = objc_msgSend(v11, sel_startDate, v57);

    v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2572D9E90);
    v69 = &v57;
    v15 = *(char **)(*(_QWORD *)(v14 - 8) + 64);
    MEMORY[0x24BDAC7A8](v14);
    v16 = (char *)&v57 - ((unint64_t)(v15 + 15) & 0xFFFFFFFFFFFFFFF0);
    if (!v13)
      break;
    v3 = sub_24396FA04();
    v17 = *(_QWORD **)(v3 - 8);
    v18 = v17[8];
    MEMORY[0x24BDAC7A8](v3);
    v5 = (v18 + 15) & 0xFFFFFFFFFFFFFFF0;
    sub_24396F9D4();

    v19 = (void (*)(char *, char *, uint64_t))v17[4];
    v19((char *)&v57 - ((unint64_t)(v15 + 15) & 0xFFFFFFFFFFFFFFF0), (char *)&v57 - v5, v3);
    v20 = (void (*)(char *, uint64_t, uint64_t, uint64_t))v17[7];
    v20((char *)&v57 - ((unint64_t)(v15 + 15) & 0xFFFFFFFFFFFFFFF0), 0, 1, v3);
    v21 = (uint64_t (*)(char *, uint64_t, uint64_t))v17[6];
    v22 = v21((char *)&v57 - ((unint64_t)(v15 + 15) & 0xFFFFFFFFFFFFFFF0), 1, v3);
    if ((_DWORD)v22 == 1)
      goto LABEL_87;
    MEMORY[0x24BDAC7A8](v22);
    v66 = (char *)&v57 - v5;
    v67 = v23;
    v68 = v20;
    if (v71)
    {
      v24 = (id)MEMORY[0x2494FD69C](v64, v70);
    }
    else
    {
      if (v64 >= *(_QWORD *)(v70 + 16))
        goto LABEL_73;
      v24 = *(id *)(v61 + 8 * v64);
    }
    v25 = v24;
    v26 = objc_msgSend(v24, sel_startDate);

    v28 = MEMORY[0x24BDAC7A8](v27);
    v15 = (char *)&v57 - ((unint64_t)(v15 + 15) & 0xFFFFFFFFFFFFFFF0);
    if (!v26)
      goto LABEL_88;
    MEMORY[0x24BDAC7A8](v28);
    sub_24396F9D4();

    v19(v15, (char *)&v57 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0), v3);
    v68(v15, 0, 1, v3);
    if (v21(v15, 1, v3) == 1)
      goto LABEL_89;
    v29 = v66;
    sub_24396F998();
    v30 = (void (*)(char *, uint64_t))v17[1];
    v30(v15, v3);
    sub_24396073C((unint64_t *)&qword_2572D9F58, MEMORY[0x24BDCE940]);
    v31 = sub_24396FB3C();
    v30(v29, v3);
    v30(v16, v3);
    v5 = v70;
    if ((v31 & 1) != 0)
      goto LABEL_29;
    v9 = v65;
    if (v62 == v65)
    {
      v63 = v62;
      goto LABEL_29;
    }
  }
  v56 = sub_24396FA04();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v56 - 8) + 56))((char *)&v57 - ((unint64_t)(v15 + 15) & 0xFFFFFFFFFFFFFFF0), 1, 1, v56);
LABEL_87:
  __break(1u);
LABEL_88:
  v68(v15, 1, 1, v3);
LABEL_89:
  __break(1u);
LABEL_90:
  __break(1u);
  swift_release();
  __break(1u);
LABEL_91:
  result = sub_24396FF5C();
  __break(1u);
  return result;
}

uint64_t sub_243954528(unint64_t a1)
{
  uint64_t v2;

  if (!(a1 >> 62))
    return *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  v2 = sub_24396FF20();
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t sub_243954584(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  _QWORD v17[5];
  id v18[50];
  id v19[50];
  id v20[50];
  id v21[50];
  id v22[50];
  id v23[50];
  id v24[50];
  uint64_t v25;

  v3 = v1;
  v25 = MEMORY[0x24BEE4AF8];
  if (qword_2572D9D00 != -1)
    swift_once();
  if ((sub_24394BC68(a1, qword_2572DA2A8) & 1) == 0)
  {
    v6 = (id)BMMLSEDurableFeatureStorefeatureNameAsString();
    v7 = sub_24396FB60();
    v9 = v8;

    sub_24393DE88();
    swift_allocError();
    *(_QWORD *)v10 = v7;
    *(_QWORD *)(v10 + 8) = v9;
    *(_BYTE *)(v10 + 16) = 0;
    return swift_willThrow();
  }
  sub_24395EDB0(v3, (uint64_t)v24);
  sub_24395EDB0(v3, (uint64_t)v23);
  sub_24395EDB0(v3, (uint64_t)v22);
  sub_24395EDB0(v3, (uint64_t)v21);
  sub_24395EDB0(v3, (uint64_t)v20);
  sub_24395EDB0(v3, (uint64_t)v19);
  sub_24395EDB0(v3, (uint64_t)v18);
  sub_24392D4A4(v17, a1);
  if (v2)
  {
    sub_24395EDE4(v18);
    sub_24395EDE4(v19);
    sub_24395EDE4(v20);
    sub_24395EDE4(v21);
    sub_24395EDE4(v22);
    sub_24395EDE4(v23);
    sub_24395EDE4(v24);
    return swift_bridgeObjectRelease();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2572D9F50);
  if (swift_dynamicCast())
  {
    sub_24395EDE4(v18);
    sub_24395EDE4(v20);
    swift_bridgeObjectRelease();
    __asm { BR              X11 }
  }
  sub_24395EDE4(v19);
  sub_24395EDE4(v21);
  sub_24395EDE4(v22);
  sub_24395EDE4(v23);
  sub_24395EDE4(v24);
  if (!swift_dynamicCast())
  {
    sub_24395EDE4(v18);
    sub_24395EDE4(v20);
    swift_bridgeObjectRelease();
    sub_24393DE88();
    swift_allocError();
    *(_QWORD *)v12 = 0xD000000000000013;
    *(_QWORD *)(v12 + 8) = 0x800000024397AC40;
    *(_BYTE *)(v12 + 16) = 1;
    swift_willThrow();
    return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v17);
  }
  if (v15)
  {
    if (v15 != 1)
    {
      sub_24395EDE4(v20);
      swift_bridgeObjectRelease();
      v14 = sub_243959654((uint64_t)v18);
      sub_24395EDE4(v18);
      goto LABEL_17;
    }
    sub_24395EDE4(v18);
    v11 = 0;
  }
  else
  {
    sub_24395EDE4(v18);
    v11 = 1;
  }
  sub_243957DC0(v11, (uint64_t)v20, &v25, a1);
  v14 = v13;
  sub_24395EDE4(v20);
  swift_bridgeObjectRelease();
LABEL_17:
  swift_beginAccess();
  v25 = v14;
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v17);
  swift_beginAccess();
  return v25;
}

uint64_t sub_243954C14(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  id v7;
  uint64_t v8;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  char v28[40];
  uint64_t v29;

  sub_243946A44(a1, (uint64_t)v28);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2572D9F50);
  if (!swift_dynamicCast())
    goto LABEL_7;
  if (v27 >> 61)
  {
    sub_24393DF0C(v18, v20, v21, v22, v23, v24, v25, v26, v27);
LABEL_7:
    sub_24393DE88();
    swift_allocError();
    *(_OWORD *)v8 = xmmword_2439718A0;
    *(_BYTE *)(v8 + 16) = 1;
    swift_willThrow();
    return v3;
  }
  v3 = *(_QWORD *)(a2 + 24);
  v7 = sub_24394B48C((uint64_t)v23, *(_QWORD *)(a2 + 8));
  if (v4)
  {

  }
  else
  {
    v10 = (uint64_t)v7;
    sub_24396FC80();
    v11 = sub_2439532D0(v10, v18, v20 & 1, (uint64_t)v21, v22);
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2572DA020);
    v29 = swift_allocObject();
    *(_OWORD *)(v29 + 16) = xmmword_2439718B0;
    sub_24393E124(0, (unint64_t *)&qword_2572D9D38);
    v12 = v11;
    v13 = (void *)sub_24396FD64();
    v14 = objc_allocWithZone(MEMORY[0x24BE0C498]);
    v15 = (void *)sub_24396FB48();
    v16 = objc_msgSend(v14, sel_initWithFeatureEntryType_itemIdentifier_featureName_featureValue_featureVersion_, 1, v15, a3, v12, v13);

    v17 = v29;
    *(_QWORD *)(v29 + 32) = v16;
    v19 = v17;
    sub_24396FC2C();
    v3 = v19;

  }
  sub_24393DFCC((uint64_t)v21);
  return v3;
}

uint64_t sub_243954E88(uint64_t a1, _QWORD *a2, unsigned int a3)
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  _BYTE *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t result;
  _QWORD *v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t i;
  BOOL v25;
  int64_t v26;
  unint64_t v27;
  int64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t inited;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char v39;
  unint64_t v40;
  unint64_t v41;
  _QWORD *v42;
  _QWORD *v43;
  uint64_t v44;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v46;
  unint64_t *v47;
  int64_t v48;
  unint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  _QWORD *v55;
  BOOL v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  void *v60;
  unint64_t v61;
  uint64_t v62;
  unint64_t v63;
  int64_t v64;
  unint64_t v65;
  int64_t v66;
  uint64_t v67;
  unint64_t v68;
  unint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  id v74;
  id v75;
  double v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  _BYTE *v82;
  uint64_t v83;
  unint64_t v84;
  uint64_t v85;
  unint64_t v86;
  uint64_t v87;
  uint64_t v88;
  void (*v89)(unint64_t);
  void *v90;
  id v91;
  void *v92;
  double v93;
  void *v94;
  id v95;
  void *v96;
  void *v97;
  id v98;
  id v99;
  uint64_t v100;
  uint64_t v101;
  unint64_t v102;
  id v103;
  void *v104;
  id v105;
  id v106;
  id v107;
  void *v108;
  id v109;
  void *v110;
  id v111;
  id v112;
  _QWORD *v113;
  BOOL v114;
  uint64_t v115;
  unint64_t v116;
  uint64_t v117;
  uint64_t v118;
  _BYTE *v119;
  _BYTE v120[4];
  unsigned int v121;
  _QWORD *v122;
  uint64_t v123;
  unint64_t v124;
  _QWORD *v125;
  _QWORD *v126;
  unint64_t v127;
  int64_t v128;
  uint64_t v129;
  unint64_t v130;
  uint64_t v131;
  unint64_t v132;
  void *v133;
  unint64_t v134;
  int64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  __int128 v139;
  _BYTE *v140;
  unint64_t v141;
  unint64_t v142;
  unint64_t v143;
  uint64_t v144;
  uint64_t v145;
  unint64_t v146;
  unint64_t v147;
  uint64_t v148;
  void *v149;
  uint64_t v150;
  void *v151;
  uint64_t v152;
  uint64_t v153;
  unint64_t v154;
  unint64_t v155;
  _BYTE *v156;
  _QWORD v157[3];
  uint64_t v158;

  v126 = a2;
  sub_243946A44(a1, (uint64_t)v157);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2572D9F50);
  if (!swift_dynamicCast())
    goto LABEL_6;
  v6 = v4;
  v7 = (uint64_t)v149;
  v8 = v152;
  v9 = v153;
  v3 = v154;
  v10 = v156;
  if (v155 >> 61 != 3)
  {
    v119 = v156;
    sub_24393DF0C(v147, v148, v149, v150, v151, v152, v153, v154, v155);
LABEL_6:
    sub_24393DE88();
    swift_allocError();
    *(_OWORD *)v13 = xmmword_2439718A0;
    *(_BYTE *)(v13 + 16) = 1;
    swift_willThrow();
    return v3;
  }
  v137 = v150;
  v136 = v148;
  v132 = v147;
  v133 = v151;
  if ((v155 & 1) != 0)
  {
    v12 = MEMORY[0x24BEE4AF8];
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2572DA020);
    v11 = swift_allocObject();
    *(_OWORD *)(v11 + 16) = xmmword_2439718B0;
    *(_QWORD *)(v11 + 32) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithInteger_, v3);
    v147 = v11;
    sub_24396FC2C();
    v12 = v11;
  }
  v121 = a3;
  v138 = v7;
  v15 = (_QWORD *)MEMORY[0x24BEE4AF8];
  v16 = MEMORY[0x24BEE4AF8];
  if ((v9 & 1) == 0)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2572DA020);
    v17 = swift_allocObject();
    *(_OWORD *)(v17 + 16) = xmmword_2439718B0;
    *(_QWORD *)(v17 + 32) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithInteger_, v8);
    v147 = v17;
    sub_24396FC2C();
    v15 = (_QWORD *)MEMORY[0x24BEE4AF8];
    v16 = v17;
  }
  v157[0] = v15;
  v18 = v126[48];
  v158 = MEMORY[0x24BEE4B08];
  v19 = *(_QWORD *)(v18 + 56);
  v134 = v18 + 56;
  v20 = 1 << *(_BYTE *)(v18 + 32);
  v21 = -1;
  if (v20 < 64)
    v21 = ~(-1 << v20);
  v3 = v21 & v19;
  v135 = (unint64_t)(v20 + 63) >> 6;
  v143 = v18;
  swift_bridgeObjectRetain();
  v22 = 0;
  v130 = MEMORY[0x24BEE4B00];
  v139 = xmmword_243970F70;
  v125 = v15;
  v23 = v6;
  v140 = v10;
  v142 = v12;
  v141 = v16;
  if (!v3)
    goto LABEL_15;
LABEL_14:
  v144 = (v3 - 1) & v3;
  v145 = v22;
  for (i = __clz(__rbit64(v3)) | (v22 << 6); ; i = __clz(__rbit64(v27)) + (v26 << 6))
  {
    v29 = (uint64_t *)(*(_QWORD *)(v143 + 48) + 16 * i);
    v30 = *v29;
    v31 = v29[1];
    __swift_instantiateConcreteTypeFromMangledName(&qword_2572DA030);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = v139;
    *(_QWORD *)(inited + 32) = v30;
    v3 = inited + 32;
    *(_QWORD *)(inited + 40) = v31;
    v33 = v126[1];
    v34 = (void *)v126[3];
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v35 = sub_24396CD00(inited, v142, v141, 0, 0, 0, 1, v33, v34);
    if (v23)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_setDeallocating();
      swift_arrayDestroy();
      sub_24393DFCC(v138);
      swift_bridgeObjectRelease();
      swift_release();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v3;
    }
    v36 = v35;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_setDeallocating();
    swift_arrayDestroy();
    sub_24396FC80();
    if (v36 >> 62)
    {
      swift_bridgeObjectRetain();
      v37 = sub_24396FF20();
      swift_bridgeObjectRelease();
      if (!v37)
      {
LABEL_29:
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v10 = v140;
        goto LABEL_30;
      }
    }
    else if (!*(_QWORD *)((v36 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      goto LABEL_29;
    }
    v38 = v158;
    swift_bridgeObjectRetain();
    v39 = sub_243960DF8(v30, v31, v38);
    swift_bridgeObjectRelease();
    if ((v39 & 1) != 0)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRetain();
      sub_243965A4C((uint64_t *)&v147, v30, v31);
      swift_bridgeObjectRelease();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v125 = sub_2439647D4(0, v125[2] + 1, 1, v125);
      v41 = v125[2];
      v40 = v125[3];
      if (v41 >= v40 >> 1)
        v125 = sub_2439647D4((_QWORD *)(v40 > 1), v41 + 1, 1, v125);
      v42 = v125;
      v125[2] = v41 + 1;
      v43 = &v42[2 * v41];
      v43[4] = v30;
      v43[5] = v31;
    }
    v44 = sub_24396D8C4(v36, (char)v133);
    swift_bridgeObjectRelease();
    sub_24396FC80();
    v10 = v140;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v147 = v130;
    sub_24395EA8C(v44, (uint64_t)sub_24395F8B8, 0, isUniquelyReferenced_nonNull_native, &v147);
    v23 = 0;
    v130 = v147;
    swift_bridgeObjectRelease();
LABEL_30:
    v22 = v145;
    v3 = v144;
    if (v144)
      goto LABEL_14;
LABEL_15:
    v25 = __OFADD__(v22, 1);
    v26 = v22 + 1;
    if (v25)
      goto LABEL_152;
    if (v26 >= v135)
      goto LABEL_46;
    v27 = *(_QWORD *)(v134 + 8 * v26);
    if (!v27)
      break;
LABEL_25:
    v144 = (v27 - 1) & v27;
    v145 = v26;
  }
  v28 = v26 + 1;
  if (v26 + 1 >= v135)
    goto LABEL_46;
  v27 = *(_QWORD *)(v134 + 8 * v28);
  if (v27)
    goto LABEL_24;
  v28 = v26 + 2;
  if (v26 + 2 >= v135)
    goto LABEL_46;
  v27 = *(_QWORD *)(v134 + 8 * v28);
  if (v27)
    goto LABEL_24;
  v28 = v26 + 3;
  if (v26 + 3 >= v135)
    goto LABEL_46;
  v27 = *(_QWORD *)(v134 + 8 * v28);
  if (v27)
  {
LABEL_24:
    v26 = v28;
    goto LABEL_25;
  }
  while (1)
  {
    v26 = v28 + 1;
    if (__OFADD__(v28, 1))
      goto LABEL_155;
    if (v26 >= v135)
      break;
    v27 = *(_QWORD *)(v134 + 8 * v26);
    ++v28;
    if (v27)
      goto LABEL_25;
  }
LABEL_46:
  v145 = v23;
  v23 = v138;
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  v123 = v125[2];
  if (!v123)
  {
    swift_bridgeObjectRetain();
LABEL_145:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v3 = v157[0];
    if ((v157[0] & 0x8000000000000000) != 0 || (v157[0] & 0x4000000000000000) != 0)
      goto LABEL_156;
    v116 = v157[0] & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain_n();
LABEL_148:
    v147 = v116;
    v117 = v145;
    sub_24395BC98((uint64_t *)&v147, (uint64_t (*)(uint64_t))sub_24396078C, &qword_2572D9F98, 0x24BE0C498, (SEL *)&selRef_itemIdentifier);
    if (v117)
      goto LABEL_158;
    sub_24393DFCC(v23);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v3 = v147;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return v3;
  }
  v122 = v125 + 4;
  v127 = v130 + 64;
  swift_bridgeObjectRetain();
  v46 = 0;
  while (1)
  {
    if (v46 >= v125[2])
      goto LABEL_154;
    v47 = &v122[2 * v46];
    v49 = *v47;
    v48 = v47[1];
    swift_bridgeObjectRetain();
    v50 = v145;
    sub_24396FC80();
    v145 = v50;
    if (v50)
    {
      sub_24393DFCC(v23);
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v3;
    }
    v51 = v126[48];
    if (*(_QWORD *)(v51 + 16))
      break;
    swift_bridgeObjectRelease();
LABEL_49:
    if (++v46 == v123)
      goto LABEL_145;
  }
  v124 = v46;
  sub_24396FFF8();
  sub_24396FB84();
  v3 = (unint64_t)&v147;
  v52 = sub_243970010();
  v53 = -1 << *(_BYTE *)(v51 + 32);
  v54 = v52 & ~v53;
  if (((*(_QWORD *)(v51 + 56 + ((v54 >> 3) & 0xFFFFFFFFFFFFF8)) >> v54) & 1) == 0)
  {
LABEL_138:
    swift_bridgeObjectRelease();
LABEL_139:
    v23 = v138;
LABEL_140:
    v46 = v124;
    goto LABEL_49;
  }
  v3 = *(_QWORD *)(v51 + 48);
  v55 = (_QWORD *)(v3 + 16 * v54);
  v56 = *v55 == v49 && v55[1] == v48;
  if (!v56 && (sub_24396FF8C() & 1) == 0)
  {
    do
    {
      v54 = (v54 + 1) & ~v53;
      if (((*(_QWORD *)(v51 + 56 + ((v54 >> 3) & 0xFFFFFFFFFFFFF8)) >> v54) & 1) == 0)
        goto LABEL_138;
      v113 = (_QWORD *)(v3 + 16 * v54);
      v114 = *v113 == v49 && v113[1] == v48;
    }
    while (!v114 && (sub_24396FF8C() & 1) == 0);
  }
  v3 = MEMORY[0x24BEE4AF8];
  v147 = MEMORY[0x24BEE4AF8];
  v57 = 1 << *(_BYTE *)(v130 + 32);
  if (v57 < 64)
    v58 = ~(-1 << v57);
  else
    v58 = -1;
  v59 = v58 & *(_QWORD *)(v130 + 64);
  v128 = (unint64_t)(v57 + 63) >> 6;
  swift_bridgeObjectRetain();
  v60 = 0;
  v23 = v138;
  v135 = v48;
  v134 = v49;
  while (v59)
  {
    v61 = __clz(__rbit64(v59));
    v62 = (v59 - 1) & v59;
    v133 = v60;
    v63 = v61 | ((_QWORD)v60 << 6);
LABEL_78:
    v132 = v62;
    v67 = *(_QWORD *)(*(_QWORD *)(v130 + 48) + 16 * v63);
    v68 = *(_QWORD *)(*(_QWORD *)(v130 + 56) + 8 * v63);
    v146 = v3;
    v69 = *((_QWORD *)v10 + 2);
    v70 = swift_bridgeObjectRetain();
    v141 = v69;
    if (!v69)
      goto LABEL_63;
    v129 = v67;
    v131 = v70;
    v143 = v68;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    LODWORD(v142) = 0;
    v71 = 0;
    do
    {
      v144 = v71;
      v76 = *(double *)&v10[8 * v71 + 32];
      __swift_instantiateConcreteTypeFromMangledName(&qword_2572DA030);
      v77 = swift_initStackObject();
      *(_OWORD *)(v77 + 16) = v139;
      *(_QWORD *)(v77 + 32) = v49;
      *(_QWORD *)(v77 + 40) = v48;
      swift_bridgeObjectRetain();
      v78 = sub_243967780(v77);
      v79 = sub_24396FA04();
      v80 = *(_QWORD *)(v79 - 8);
      MEMORY[0x24BDAC7A8](v79);
      v82 = &v120[-((v81 + 15) & 0xFFFFFFFFFFFFFFF0)];
      v83 = sub_24396F9BC();
      MEMORY[0x24BDAC7A8](v83);
      v118 = v78;
      v119 = v82;
      v84 = v143;
      swift_bridgeObjectRetain();
      v85 = v145;
      v86 = sub_243952774(sub_243960194, (uint64_t)&v120[-32], v84);
      v145 = v85;
      (*(void (**)(_BYTE *, uint64_t))(v80 + 8))(v82, v79);
      swift_bridgeObjectRelease();
      swift_setDeallocating();
      swift_arrayDestroy();
      v23 = v138;
      if (v138)
      {
        v87 = swift_allocObject();
        v88 = v137;
        *(_QWORD *)(v87 + 16) = v23;
        *(_QWORD *)(v87 + 24) = v88;
        v89 = (void (*)(unint64_t))sub_243960798;
      }
      else
      {
        v87 = 0;
        v89 = (void (*)(unint64_t))sub_243954528;
      }
      sub_24395EE3C(v23);
      v48 = v135;
      v49 = v134;
      if ((v136 & 1) != 0)
      {
        v89(v86);
        v90 = (void *)sub_24396FCE0();
        v91 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE0C4A0]), sel_initWithIntValue_doubleValue_stringValue_BOOLValue_histogramValue_, v90, 0, 0, 0, 0);
      }
      else
      {
        sub_243953CB8(v86, (uint64_t (*)(_QWORD *))v89, v87);
        v90 = (void *)sub_24396FC98();
        v91 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE0C4A0]), sel_initWithIntValue_doubleValue_stringValue_BOOLValue_histogramValue_, 0, v90, 0, 0, 0);
      }
      v92 = v91;
      swift_bridgeObjectRelease();
      swift_release();

      if ((objc_msgSend(v92, sel_hasIntValue) & 1) == 0)
        goto LABEL_85;
      objc_msgSend(v92, sel_intValue);
      if ((v142 & 1) != 0
        || objc_msgSend(v92, sel_intValue)
        || objc_msgSend(v92, sel_BOOLValue))
      {
        sub_24393E124(0, &qword_2572D9F78);
        if (v76 == 86400.0)
        {
          v72 = 1;
          LODWORD(v142) = 1;
        }
        else
        {
          if (v76 == 604800.0)
          {
            LODWORD(v142) = 1;
LABEL_100:
            v72 = 2;
            goto LABEL_82;
          }
          if (v76 == 2592000.0)
          {
            LODWORD(v142) = 1;
            v72 = 3;
          }
          else
          {
            if (v76 != 7776000.0)
            {
              LODWORD(v142) = 1;
LABEL_109:
              if (v76 == 15552000.0)
                v72 = 5;
              else
                v72 = 0;
              goto LABEL_82;
            }
            LODWORD(v142) = 1;
            v72 = 4;
          }
        }
      }
      else
      {
        objc_msgSend(v92, sel_doubleValue);
        LODWORD(v142) = v93 > 0.0;
        sub_24393E124(0, &qword_2572D9F78);
        if (v76 == 86400.0)
        {
          v72 = 1;
        }
        else
        {
          if (v76 == 604800.0)
            goto LABEL_100;
          if (v76 == 2592000.0)
          {
            v72 = 3;
          }
          else
          {
            if (v76 != 7776000.0)
              goto LABEL_109;
            v72 = 4;
          }
        }
      }
LABEL_82:
      v73 = (void *)sub_24397001C();
      v74 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithInterval_value_, v72, v73);

      v75 = v74;
      MEMORY[0x2494FD42C]();
      if (*(_QWORD *)((v146 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v146 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
        sub_24396FC38();
      sub_24396FC50();
      sub_24396FC2C();

LABEL_85:
      v71 = v144 + 1;

      v10 = v140;
    }
    while (v141 != v71);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v142 & 1) == 0)
    {
LABEL_63:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_64;
    }
    v94 = (void *)sub_24396FC68();
    v95 = objc_allocWithZone(MEMORY[0x24BE0C4B0]);
    v96 = (void *)sub_24396FB48();
    swift_bridgeObjectRelease();
    sub_24393E124(0, &qword_2572D9F78);
    v97 = (void *)sub_24396FC08();
    swift_bridgeObjectRelease();
    v98 = objc_msgSend(v95, sel_initWithBucketName_hasEver_counts_, v96, v94, v97);

    v99 = v98;
    MEMORY[0x2494FD42C]();
    if (*(_QWORD *)((v147 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v147 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      sub_24396FC38();
    sub_24396FC50();
    sub_24396FC2C();

LABEL_64:
    v3 = MEMORY[0x24BEE4AF8];
    v60 = v133;
    v59 = v132;
  }
  v25 = __OFADD__(v60, 1);
  v64 = (int64_t)v60 + 1;
  if (v25)
  {
    __break(1u);
LABEL_152:
    __break(1u);
    goto LABEL_153;
  }
  if (v64 >= v128)
    goto LABEL_122;
  v65 = *(_QWORD *)(v127 + 8 * v64);
  if (v65)
    goto LABEL_77;
  v66 = v64 + 1;
  if (v64 + 1 >= v128)
    goto LABEL_122;
  v65 = *(_QWORD *)(v127 + 8 * v66);
  if (v65)
    goto LABEL_76;
  v66 = v64 + 2;
  if (v64 + 2 >= v128)
    goto LABEL_122;
  v65 = *(_QWORD *)(v127 + 8 * v66);
  if (v65)
    goto LABEL_76;
  v66 = v64 + 3;
  if (v64 + 3 < v128)
  {
    v65 = *(_QWORD *)(v127 + 8 * v66);
    if (!v65)
    {
      while (1)
      {
        v64 = v66 + 1;
        if (__OFADD__(v66, 1))
          break;
        if (v64 >= v128)
          goto LABEL_122;
        v65 = *(_QWORD *)(v127 + 8 * v64);
        ++v66;
        if (v65)
          goto LABEL_77;
      }
LABEL_153:
      __break(1u);
LABEL_154:
      __break(1u);
LABEL_155:
      __break(1u);
LABEL_156:
      swift_bridgeObjectRetain_n();
      v116 = (unint64_t)sub_24395BD3C(v3, (void (*)(_QWORD *, uint64_t, unint64_t))sub_24395F060);
      swift_bridgeObjectRelease();
      goto LABEL_148;
    }
LABEL_76:
    v64 = v66;
LABEL_77:
    v62 = (v65 - 1) & v65;
    v133 = (void *)v64;
    v63 = __clz(__rbit64(v65)) + (v64 << 6);
    goto LABEL_78;
  }
LABEL_122:
  swift_release();
  v3 = v147;
  if (v147 >> 62)
  {
    swift_bridgeObjectRetain();
    v115 = sub_24396FF20();
    swift_bridgeObjectRelease();
    if (v115 > 0)
      goto LABEL_124;
LABEL_142:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_140;
  }
  if (*(uint64_t *)((v147 & 0xFFFFFFFFFFFFF8) + 0x10) <= 0)
    goto LABEL_142;
LABEL_124:
  if ((v3 & 0x8000000000000000) != 0 || (v3 & 0x4000000000000000) != 0)
  {
    swift_bridgeObjectRetain_n();
    v100 = (uint64_t)sub_24395BD3C(v3, (void (*)(_QWORD *, uint64_t, unint64_t))sub_24395F274);
    swift_bridgeObjectRelease();
  }
  else
  {
    v100 = v3 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain_n();
  }
  v101 = v145;
  v146 = v100;
  sub_24395BC98((uint64_t *)&v146, (uint64_t (*)(uint64_t))sub_24395F49C, &qword_2572D9F80, 0x24BE0C4B0, (SEL *)&selRef_bucketName);
  if (!v101)
  {
    swift_bridgeObjectRelease();
    v102 = v146;
    swift_bridgeObjectRelease();
    v147 = v102;
    v103 = objc_allocWithZone(MEMORY[0x24BE0C4A8]);
    sub_24393E124(0, &qword_2572D9F80);
    v104 = (void *)sub_24396FC08();
    swift_release();
    v105 = objc_msgSend(v103, sel_initWithBucketList_, v104);

    v106 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE0C4A0]), sel_initWithIntValue_doubleValue_stringValue_BOOLValue_histogramValue_, 0, 0, 0, 0, v105);
    sub_24393E124(0, (unint64_t *)&qword_2572D9D38);
    v107 = v106;
    v108 = (void *)sub_24396FD64();
    v109 = objc_allocWithZone(MEMORY[0x24BE0C498]);
    v110 = (void *)sub_24396FB48();
    swift_bridgeObjectRelease();
    v111 = objc_msgSend(v109, sel_initWithFeatureEntryType_itemIdentifier_featureName_featureValue_featureVersion_, 1, v110, v121, v107, v108);

    v112 = v111;
    v3 = (unint64_t)v157;
    MEMORY[0x2494FD42C]();
    if (*(_QWORD *)((v157[0] & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v157[0] & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      sub_24396FC38();
    sub_24396FC50();
    sub_24396FC2C();

    v145 = 0;
    goto LABEL_139;
  }
  swift_release();
  __break(1u);
LABEL_158:
  result = swift_release();
  __break(1u);
  return result;
}

uint64_t sub_243956420(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  unint64_t v7;
  uint64_t isUniquelyReferenced_nonNull_native;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t result;
  unint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  unint64_t v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  _BOOL8 v34;
  uint64_t v35;
  unint64_t v36;
  char v37;
  uint64_t *v38;
  uint64_t *v39;
  uint64_t v40;
  BOOL v41;
  uint64_t v42;
  uint64_t *v43;
  unint64_t v44;
  _QWORD *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  unint64_t v51;
  unint64_t v52;
  int64_t v53;
  unint64_t v54;
  int64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  unint64_t v62;
  uint64_t v63;
  uint64_t v64;
  _QWORD *v65;
  BOOL v66;
  void *v67;
  id v68;
  void *v69;
  id v70;
  _QWORD *v71;
  BOOL v72;
  unsigned int v73;
  uint64_t v74;
  void *v75;
  void *v76;
  uint64_t *v77;
  id v78;
  unint64_t v79;
  uint64_t v80;
  uint64_t (*v81)(void *);
  int64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t *v86;
  uint64_t v87;
  void *v88;
  uint64_t v89;
  void *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  unint64_t v94;
  uint64_t v95[6];
  unint64_t v96;

  LODWORD(v4) = a3;
  sub_243946A44(a1, (uint64_t)v95);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2572D9F50);
  if (!swift_dynamicCast())
    goto LABEL_6;
  v7 = (unint64_t)v86;
  v6 = v87;
  isUniquelyReferenced_nonNull_native = v89;
  if (v94 >> 61 != 2)
  {
    sub_24393DF0C((uint64_t)v86, v87, v88, v89, v90, v91, v92, v93, v94);
LABEL_6:
    sub_24393DE88();
    swift_allocError();
    *(_OWORD *)v11 = xmmword_2439718A0;
    *(_BYTE *)(v11 + 16) = 1;
    return swift_willThrow();
  }
  v81 = (uint64_t (*)(void *))v88;
  v95[0] = MEMORY[0x24BEE4AF8];
  v9 = objc_msgSend((id)objc_opt_self(), sel_predicateWithValue_, 1);
  v10 = sub_24394B48C((uint64_t)v9, *(_QWORD *)(a2 + 8));
  if (v3)
  {

    swift_release();
    swift_release();
    return swift_bridgeObjectRelease();
  }
  v13 = (unint64_t)v10;
  sub_24396FC80();
  v14 = 0;
  v96 = sub_24393EF08(MEMORY[0x24BEE4AF8]);
  v82 = v13;
  if (v13 >> 62)
    goto LABEL_91;
  v15 = *(_QWORD *)((v13 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  while (1)
  {
    v74 = a2;
    v75 = v9;
    v73 = v4;
    v76 = (void *)isUniquelyReferenced_nonNull_native;
    v77 = v14;
    if (!v15)
    {
      isUniquelyReferenced_nonNull_native = v96;
      v16 = v82;
LABEL_44:
      swift_bridgeObjectRelease();
      sub_24396FC80();
      if (v77)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();

        swift_release();
        swift_release();
        return swift_bridgeObjectRelease();
      }
      v96 = isUniquelyReferenced_nonNull_native;
      v9 = v76;
      swift_retain();
      v44 = sub_24395FDE8(v16, v81);
      swift_bridgeObjectRelease();
      swift_release();
      swift_retain();
      v45 = sub_24395FC60(v44, (uint64_t (*)(id))v7);
      swift_bridgeObjectRelease();
      swift_release();
      v4 = sub_243967780((uint64_t)v45);
      swift_bridgeObjectRelease();
      sub_24396FC80();
      v14 = 0;
      v46 = v75;
      v84 = v4;
      v6 = 0;
      v81 = (uint64_t (*)(void *))(v96 + 64);
      v47 = 1 << *(_BYTE *)(v96 + 32);
      if (v47 < 64)
        v48 = ~(-1 << v47);
      else
        v48 = -1;
      v49 = v48 & *(_QWORD *)(v96 + 64);
      v82 = (unint64_t)(v47 + 63) >> 6;
      v50 = v74;
      while (1)
      {
        do
        {
          if (v49)
          {
            v51 = __clz(__rbit64(v49));
            v49 &= v49 - 1;
            v52 = v51 | (v6 << 6);
          }
          else
          {
            v53 = v6 + 1;
            isUniquelyReferenced_nonNull_native = v96;
            if (__OFADD__(v6, 1))
              goto LABEL_90;
            LODWORD(v4) = v84;
            if (v53 >= v82)
            {
LABEL_86:
              swift_release();
              swift_release();
              swift_bridgeObjectRelease();

              swift_release();
              return v95[0];
            }
            v54 = *((_QWORD *)v81 + v53);
            ++v6;
            if (!v54)
            {
              v6 = v53 + 1;
              if (v53 + 1 >= v82)
                goto LABEL_86;
              v54 = *((_QWORD *)v81 + v6);
              if (!v54)
              {
                v6 = v53 + 2;
                if (v53 + 2 >= v82)
                  goto LABEL_86;
                v54 = *((_QWORD *)v81 + v6);
                if (!v54)
                {
                  v55 = v53 + 3;
                  if (v55 >= v82)
                    goto LABEL_86;
                  v54 = *((_QWORD *)v81 + v55);
                  if (!v54)
                  {
                    while (1)
                    {
                      v6 = v55 + 1;
                      if (__OFADD__(v55, 1))
                        break;
                      if (v6 >= v82)
                        goto LABEL_86;
                      v54 = *((_QWORD *)v81 + v6);
                      ++v55;
                      if (v54)
                        goto LABEL_67;
                    }
                    __break(1u);
                    goto LABEL_93;
                  }
                  v6 = v55;
                }
              }
            }
LABEL_67:
            v49 = (v54 - 1) & v54;
            v52 = __clz(__rbit64(v54)) + (v6 << 6);
          }
          v56 = *(_QWORD *)(v50 + 384);
        }
        while (!*(_QWORD *)(v56 + 16));
        v57 = 16 * v52;
        v58 = (uint64_t *)(*(_QWORD *)(v96 + 48) + v57);
        v59 = *v58;
        a2 = v58[1];
        v60 = (uint64_t *)(*(_QWORD *)(v96 + 56) + v57);
        v7 = v60[1];
        v85 = *v60;
        sub_24396FFF8();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        sub_24396FB84();
        v61 = sub_243970010();
        v4 = -1 << *(_BYTE *)(v56 + 32);
        v62 = v61 & ~v4;
        v63 = v56 + 56;
        if (((*(_QWORD *)(v56 + 56 + ((v62 >> 3) & 0xFFFFFFFFFFFFF8)) >> v62) & 1) == 0)
          goto LABEL_50;
        v64 = *(_QWORD *)(v56 + 48);
        v65 = (_QWORD *)(v64 + 16 * v62);
        v66 = *v65 == v59 && v65[1] == a2;
        if (!v66 && (sub_24396FF8C() & 1) == 0)
          break;
LABEL_75:
        sub_243960DF8(v85, v7, v84);
        swift_bridgeObjectRelease();
        v67 = (void *)sub_24396FC68();
        v68 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE0C4A0]), sel_initWithIntValue_doubleValue_stringValue_BOOLValue_histogramValue_, 0, 0, 0, v67, 0);

        sub_24393E124(0, (unint64_t *)&qword_2572D9D38);
        v69 = (void *)sub_24396FD64();
        v70 = objc_allocWithZone(MEMORY[0x24BE0C498]);
        v4 = sub_24396FB48();
        swift_bridgeObjectRelease();
        objc_msgSend(v70, sel_initWithFeatureEntryType_itemIdentifier_featureName_featureValue_featureVersion_, 1, v4, v73, v68, v69);

        MEMORY[0x2494FD42C]();
        if (*(_QWORD *)((v95[0] & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v95[0] & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          sub_24396FC38();
        sub_24396FC50();
        sub_24396FC2C();
LABEL_51:
        v9 = v76;
        v14 = 0;
        v50 = v74;
        v46 = v75;
      }
      v4 = ~v4;
      while (1)
      {
        v62 = (v62 + 1) & v4;
        if (((*(_QWORD *)(v63 + ((v62 >> 3) & 0xFFFFFFFFFFFFF8)) >> v62) & 1) == 0)
          break;
        v71 = (_QWORD *)(v64 + 16 * v62);
        v72 = *v71 == v59 && v71[1] == a2;
        if (v72 || (sub_24396FF8C() & 1) != 0)
          goto LABEL_75;
      }
LABEL_50:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_51;
    }
    v9 = (id)v15;
    v16 = v82;
    a2 = 4;
    isUniquelyReferenced_nonNull_native = v96;
    v78 = v9;
    v79 = v7;
    v80 = v6;
LABEL_15:
    v18 = (v82 & 0xC000000000000001) != 0 ? (id)MEMORY[0x2494FD69C](a2 - 4, v16) : *(id *)(v16 + 8 * a2);
    v4 = (uint64_t)v18;
    if (!__OFADD__(a2 - 4, 1))
      break;
    __break(1u);
LABEL_88:
    __break(1u);
LABEL_89:
    __break(1u);
LABEL_90:
    __break(1u);
LABEL_91:
    swift_bridgeObjectRetain_n();
    v15 = sub_24396FF20();
    swift_bridgeObjectRelease();
  }
  v96 = a2 - 3;
  v14 = (uint64_t *)v6;
  ((void (*)(id))v7)(v18);
  v20 = v19;
  swift_bridgeObjectRelease();
  if (!v20)
    goto LABEL_13;
  v21 = objc_msgSend((id)v4, sel_domainIdentifier);
  if (v21)
  {

    v22 = objc_msgSend((id)v4, sel_domainIdentifier);
    if (v22)
      goto LABEL_25;
LABEL_13:

    v17 = (id)v96;
LABEL_14:
    ++a2;
    if (v17 == v9)
      goto LABEL_44;
    goto LABEL_15;
  }
  v14 = (uint64_t *)&selRef_initWithDomainId_derivedIntentId_bundleId_recipientsId_;
  v23 = objc_msgSend((id)v4, sel_derivedIntentIdentifier);
  if (!v23)
    goto LABEL_13;

  v22 = objc_msgSend((id)v4, sel_derivedIntentIdentifier);
  if (!v22)
    goto LABEL_13;
LABEL_25:

  v24 = objc_msgSend((id)v4, sel_domainIdentifier);
  if (v24)
  {

    v25 = objc_msgSend((id)v4, sel_domainIdentifier);
  }
  else
  {
    v26 = objc_msgSend((id)v4, sel_derivedIntentIdentifier);
    if (!v26)
      goto LABEL_93;

    v25 = objc_msgSend((id)v4, sel_derivedIntentIdentifier);
  }
  v27 = v25;
  if (v27)
  {
    v28 = sub_24396FB60();
    v30 = v29;

    v83 = ((uint64_t (*)(uint64_t))v7)(v4);
    if (!v31)
      goto LABEL_94;
    v9 = v31;
    v14 = (uint64_t *)isUniquelyReferenced_nonNull_native;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v86 = v14;
    v7 = sub_243942698(v28, v30);
    v33 = v14[2];
    v34 = (v32 & 1) == 0;
    v35 = v33 + v34;
    if (__OFADD__(v33, v34))
      goto LABEL_88;
    v6 = v32;
    if (v14[3] >= v35)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) != 0)
      {
        isUniquelyReferenced_nonNull_native = (uint64_t)v86;
        if ((v32 & 1) == 0)
          goto LABEL_35;
      }
      else
      {
        v14 = (uint64_t *)&v86;
        sub_243944C8C();
        isUniquelyReferenced_nonNull_native = (uint64_t)v86;
        if ((v6 & 1) == 0)
          goto LABEL_35;
      }
    }
    else
    {
      sub_243942ABC(v35, isUniquelyReferenced_nonNull_native);
      v14 = v86;
      v36 = sub_243942698(v28, v30);
      if ((v6 & 1) != (v37 & 1))
        goto LABEL_95;
      v7 = v36;
      isUniquelyReferenced_nonNull_native = (uint64_t)v86;
      if ((v6 & 1) == 0)
      {
LABEL_35:
        *(_QWORD *)(isUniquelyReferenced_nonNull_native + 8 * (v7 >> 6) + 64) |= 1 << v7;
        v38 = (uint64_t *)(*(_QWORD *)(isUniquelyReferenced_nonNull_native + 48) + 16 * v7);
        *v38 = v28;
        v38[1] = v30;
        v39 = (uint64_t *)(*(_QWORD *)(isUniquelyReferenced_nonNull_native + 56) + 16 * v7);
        *v39 = v83;
        v39[1] = (uint64_t)v9;
        v40 = *(_QWORD *)(isUniquelyReferenced_nonNull_native + 16);
        v41 = __OFADD__(v40, 1);
        v42 = v40 + 1;
        if (v41)
          goto LABEL_89;
        *(_QWORD *)(isUniquelyReferenced_nonNull_native + 16) = v42;
        swift_bridgeObjectRetain();
        goto LABEL_40;
      }
    }
    v43 = (uint64_t *)(*(_QWORD *)(isUniquelyReferenced_nonNull_native + 56) + 16 * v7);
    swift_bridgeObjectRelease();
    *v43 = v83;
    v43[1] = (uint64_t)v9;
LABEL_40:
    v7 = v79;
    v6 = v80;
    v9 = v78;
    v17 = (id)v96;

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v16 = v82;
    goto LABEL_14;
  }
LABEL_93:
  __break(1u);
LABEL_94:
  __break(1u);
LABEL_95:
  result = sub_24396FFBC();
  __break(1u);
  return result;
}

uint64_t sub_243956DAC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t result;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char v42;
  uint64_t v43;
  _BOOL8 v44;
  uint64_t v45;
  char v46;
  unint64_t v47;
  char v48;
  unint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  BOOL v52;
  uint64_t v53;
  char v54;
  uint64_t v55;
  char v56;
  unint64_t v57;
  uint64_t v58;
  _BOOL8 v59;
  uint64_t v60;
  char v61;
  unint64_t v62;
  char v63;
  _QWORD *v64;
  uint64_t *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  unint64_t v73;
  unint64_t v74;
  unint64_t v75;
  uint64_t v76;
  uint64_t *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  unint64_t v85;
  uint64_t v86;
  _QWORD *v87;
  BOOL v88;
  uint64_t v89;
  unint64_t v90;
  char v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  _QWORD *v97;
  BOOL v98;
  uint64_t v99;
  _QWORD *v100;
  void *v102;
  id v103;
  id v104;
  void *v105;
  void (*v106)(_QWORD *@<X8>);
  unint64_t (*v107)@<X0>(unint64_t *@<X8>);
  unint64_t v108;
  uint64_t (*v109)(id);
  uint64_t v110;
  void *v111;
  uint64_t v112;
  unsigned int v113;
  unint64_t v114;
  unint64_t v115;
  uint64_t (*v116)(void *);
  unint64_t v117;
  unint64_t v118;
  uint64_t v119;
  unint64_t v120;
  int64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  unint64_t v125;
  unint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  void *v132;
  uint64_t v133;
  void *v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  unint64_t v138;
  uint64_t v139[6];
  unint64_t v140;

  sub_243946A44(a1, (uint64_t)v139);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2572D9F50);
  if (!swift_dynamicCast())
    goto LABEL_6;
  v6 = v131;
  v8 = (unint64_t)v132;
  v7 = v133;
  if (v138 >> 61 != 4)
  {
    sub_24393DF0C(v129, v131, v132, v133, v134, v135, v136, v137, v138);
LABEL_6:
    sub_24393DE88();
    swift_allocError();
    *(_OWORD *)v11 = xmmword_2439718A0;
    *(_BYTE *)(v11 + 16) = 1;
    swift_willThrow();
    return a3;
  }
  v116 = (uint64_t (*)(void *))v129;
  v113 = a3;
  v139[0] = MEMORY[0x24BEE4AF8];
  v9 = (uint64_t)objc_msgSend((id)objc_opt_self(), sel_predicateWithValue_, 1);
  a3 = *(_QWORD *)(a2 + 24);
  v10 = sub_24394B48C(v9, *(_QWORD *)(a2 + 8));
  if (v3)
  {

    swift_release();
    swift_release();
    swift_bridgeObjectRelease();
    return a3;
  }
  v12 = (unint64_t)v10;
  v112 = a2;
  sub_24396FC80();
  v125 = sub_24393F48C(MEMORY[0x24BEE4AF8]);
  v119 = 0;
  if (v12 >> 62)
    goto LABEL_132;
  v14 = *(_QWORD *)((v12 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
LABEL_11:
  v117 = v6;
  v118 = v7;
  v111 = (void *)v9;
  v120 = v12;
  v140 = v14;
  if (v14)
  {
    if (v14 < 1)
      goto LABEL_134;
    v15 = 0;
    v126 = v12 & 0xC000000000000001;
    do
    {
      if (v126)
        v16 = (id)MEMORY[0x2494FD69C](v15, v12);
      else
        v16 = *(id *)(v12 + 8 * v15 + 32);
      v17 = v16;
      v18 = v8;
      v19 = ((uint64_t (*)(void))v8)();
      if (v20)
      {
        v21 = v20;
        v122 = v19;
        v22 = objc_msgSend(v17, sel_domainIdentifier);
        if (v22)
        {

          v23 = objc_msgSend(v17, sel_domainIdentifier);
        }
        else
        {
          v24 = objc_msgSend(v17, sel_derivedIntentIdentifier);
          if (!v24)
            goto LABEL_26;

          v23 = objc_msgSend(v17, sel_derivedIntentIdentifier);
        }
        v25 = v23;
        if (!v25)
        {
LABEL_26:

          swift_bridgeObjectRelease();
          goto LABEL_15;
        }
        v26 = sub_24396FB60();
        v28 = v27;

        v29 = sub_24394B7F4();
        v31 = v30;
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        v33 = v31;
        v12 = v120;
        v34 = v26;
        v7 = v118;
        sub_243965270(v122, v21, v29, v33, v34, v28, isUniquelyReferenced_nonNull_native);

        v6 = v117;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      else
      {

      }
LABEL_15:
      ++v15;
      v14 = v140;
      v8 = v18;
    }
    while (v140 != v15);
  }
  swift_bridgeObjectRelease();
  sub_24396FC80();
  v35 = v119;
  v109 = (uint64_t (*)(id))v8;
  v8 = sub_24393F5C8(MEMORY[0x24BEE4AF8]);
  if (v14)
  {
    v106 = 0;
    v107 = 0;
    v108 = v12 & 0xC000000000000001;
    v9 = 4;
    v119 = 0;
    while (1)
    {
      if (v108)
        v36 = (id)MEMORY[0x2494FD69C](v9 - 4, v12);
      else
        v36 = *(id *)(v12 + 8 * v9);
      v37 = v36;
      v12 = v9 - 3;
      if (__OFADD__(v9 - 4, 1))
      {
        __break(1u);
LABEL_126:
        __break(1u);
LABEL_127:
        __break(1u);
LABEL_128:
        __break(1u);
LABEL_129:
        __break(1u);
LABEL_130:
        __break(1u);
LABEL_131:
        __break(1u);
LABEL_132:
        swift_bridgeObjectRetain();
        v14 = sub_24396FF20();
        goto LABEL_11;
      }
      v123 = v109(v36);
      if (!v38)
        goto LABEL_30;
      v127 = v38;
      if ((v116(v37) & 1) == 0)
        break;
      v39 = sub_24394B7F4();
      v41 = v40;
      sub_24393DFCC((uint64_t)v107);
      v7 = swift_isUniquelyReferenced_nonNull_native();
      v6 = sub_243942698(v39, v41);
      v43 = *(_QWORD *)(v8 + 16);
      v44 = (v42 & 1) == 0;
      v45 = v43 + v44;
      if (__OFADD__(v43, v44))
        goto LABEL_127;
      v46 = v42;
      if (*(_QWORD *)(v8 + 24) >= v45)
      {
        if ((v7 & 1) == 0)
          sub_243946170();
      }
      else
      {
        sub_243943D0C(v45, v7);
        v47 = sub_243942698(v39, v41);
        if ((v46 & 1) != (v48 & 1))
          goto LABEL_135;
        v6 = v47;
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      if ((v46 & 1) == 0)
      {
        v49 = sub_24393F6E0(MEMORY[0x24BEE4AF8]);
        *(_QWORD *)(v8 + 8 * (v6 >> 6) + 64) |= 1 << v6;
        v50 = (uint64_t *)(*(_QWORD *)(v8 + 48) + 16 * v6);
        *v50 = v39;
        v50[1] = v41;
        *(_QWORD *)(*(_QWORD *)(v8 + 56) + 8 * v6) = v49;
        v51 = *(_QWORD *)(v8 + 16);
        v52 = __OFADD__(v51, 1);
        v53 = v51 + 1;
        if (v52)
          goto LABEL_130;
        *(_QWORD *)(v8 + 16) = v53;
        swift_bridgeObjectRetain();
      }
      v7 = *(_QWORD *)(v8 + 56);
      v114 = v8;
      swift_bridgeObjectRelease();
      v8 = 8 * v6;
      sub_24393DFCC((uint64_t)v106);
      v54 = swift_isUniquelyReferenced_nonNull_native();
      v130 = *(_QWORD *)(v7 + 8 * v6);
      v55 = v130;
      *(_QWORD *)(v7 + 8 * v6) = 0x8000000000000000;
      v57 = sub_243942698(v123, v127);
      v58 = *(_QWORD *)(v130 + 16);
      v59 = (v56 & 1) == 0;
      v60 = v58 + v59;
      if (__OFADD__(v58, v59))
        goto LABEL_128;
      v61 = v56;
      if (*(_QWORD *)(v130 + 24) >= v60)
      {
        if ((v54 & 1) == 0)
        {
          sub_243945FC4();
          v55 = v130;
        }
      }
      else
      {
        sub_243943A04(v60, v54);
        v55 = v130;
        v62 = sub_243942698(v123, v127);
        if ((v61 & 1) != (v63 & 1))
          goto LABEL_135;
        v57 = v62;
      }
      v14 = v140;
      *(_QWORD *)(v7 + v8) = v55;
      swift_bridgeObjectRelease();
      v64 = *(_QWORD **)(v7 + v8);
      if ((v61 & 1) != 0)
      {
        swift_bridgeObjectRetain();
        v6 = v117;
        v8 = v114;
      }
      else
      {
        v64[(v57 >> 6) + 8] |= 1 << v57;
        v65 = (uint64_t *)(v64[6] + 16 * v57);
        v6 = v127;
        *v65 = v123;
        v65[1] = v127;
        *(_QWORD *)(v64[7] + 8 * v57) = 0;
        v66 = v64[2];
        v67 = v66 + 1;
        v7 = __OFADD__(v66, 1);
        swift_bridgeObjectRetain();
        v8 = v114;
        if ((v7 & 1) != 0)
          goto LABEL_131;
        v64[2] = v67;
        swift_bridgeObjectRetain();
        v6 = v117;
      }
      v68 = v64[7];
      swift_bridgeObjectRelease();
      v69 = *(_QWORD *)(v68 + 8 * v57);
      v52 = __OFADD__(v69, 1);
      v70 = v69 + 1;
      v7 = v118;
      if (v52)
        goto LABEL_129;
      *(_QWORD *)(v68 + 8 * v57) = v70;
      swift_bridgeObjectRelease();

      swift_bridgeObjectRelease();
      v106 = sub_243957B1C;
      v107 = sub_243957AF0;
      v35 = 0;
LABEL_31:
      ++v9;
      v88 = v12 == v14;
      v12 = v120;
      if (v88)
        goto LABEL_63;
    }
    swift_bridgeObjectRelease();
LABEL_30:

    goto LABEL_31;
  }
  v106 = 0;
  v107 = 0;
LABEL_63:
  swift_bridgeObjectRelease();
  sub_24396FC80();
  v116 = (uint64_t (*)(void *))(v125 + 64);
  v71 = 1 << *(_BYTE *)(v125 + 32);
  if (v71 < 64)
    v72 = ~(-1 << v71);
  else
    v72 = -1;
  v6 = v72 & *(_QWORD *)(v125 + 64);
  v121 = (unint64_t)(v71 + 63) >> 6;
  swift_bridgeObjectRetain();
  v9 = 0;
  v115 = v8;
LABEL_68:
  while (v6)
  {
    v73 = __clz(__rbit64(v6));
    v6 &= v6 - 1;
    v74 = v73 | (v9 << 6);
LABEL_81:
    v7 = *(_QWORD *)(v112 + 384);
    if (*(_QWORD *)(v7 + 16))
    {
      v128 = v9;
      v140 = v6;
      v119 = v35;
      v77 = (uint64_t *)(*(_QWORD *)(v125 + 48) + 16 * v74);
      v79 = *v77;
      v78 = v77[1];
      v80 = (uint64_t *)(*(_QWORD *)(v125 + 56) + 32 * v74);
      v81 = v80[1];
      v110 = *v80;
      v82 = v80[3];
      v124 = v80[2];
      sub_24396FFF8();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_24396FB84();
      v83 = sub_243970010();
      v84 = -1 << *(_BYTE *)(v7 + 32);
      v85 = v83 & ~v84;
      v12 = v7 + 56;
      if (((*(_QWORD *)(v7 + 56 + ((v85 >> 3) & 0xFFFFFFFFFFFFF8)) >> v85) & 1) == 0)
        goto LABEL_67;
      v86 = *(_QWORD *)(v7 + 48);
      v87 = (_QWORD *)(v86 + 16 * v85);
      v88 = *v87 == v79 && v87[1] == v78;
      if (v88 || (sub_24396FF8C() & 1) != 0)
      {
        v6 = v140;
        v89 = v81;
LABEL_89:
        v9 = v128;
        goto LABEL_90;
      }
      v96 = ~v84;
      v7 = (v85 + 1) & ~v84;
      if (((*(_QWORD *)(v12 + ((v7 >> 3) & 0xFFFFFFFFFFFFF8)) >> v7) & 1) != 0)
      {
        v97 = (_QWORD *)(v86 + 16 * v7);
        v98 = *v97 == v79 && v97[1] == v78;
        v89 = v81;
        if (v98)
        {
          v6 = v140;
          goto LABEL_89;
        }
        v99 = v96;
        v9 = v128;
        if ((sub_24396FF8C() & 1) != 0)
        {
LABEL_108:
          v6 = v140;
        }
        else
        {
          while (1)
          {
            v7 = (v7 + 1) & v99;
            if (((*(_QWORD *)(v12 + ((v7 >> 3) & 0xFFFFFFFFFFFFF8)) >> v7) & 1) == 0)
            {
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              v35 = v119;
              v8 = v115;
              v6 = v140;
              goto LABEL_68;
            }
            v100 = (_QWORD *)(v86 + 16 * v7);
            if (*v100 == v79 && v100[1] == v78)
              break;
            if ((sub_24396FF8C() & 1) != 0)
              goto LABEL_108;
          }
          v6 = v140;
        }
LABEL_90:
        if (!*(_QWORD *)(v115 + 16))
          goto LABEL_95;
        swift_bridgeObjectRetain();
        v90 = sub_243942698(v124, v82);
        if ((v91 & 1) != 0)
        {
          v92 = *(_QWORD *)(*(_QWORD *)(v115 + 56) + 8 * v90);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRelease();
          v93 = sub_243957B24(v92);
          v95 = v94;
          swift_bridgeObjectRelease();
          if (!v95 || (swift_bridgeObjectRelease(), v110 == v93) && v95 == v89)
          {
LABEL_95:
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            goto LABEL_118;
          }
          sub_24396FF8C();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
        }
        else
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease_n();
        }
LABEL_118:
        v102 = (void *)sub_24396FC68();
        v103 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE0C4A0]), sel_initWithIntValue_doubleValue_stringValue_BOOLValue_histogramValue_, 0, 0, 0, v102, 0);

        sub_24393E124(0, (unint64_t *)&qword_2572D9D38);
        v12 = sub_24396FD64();
        v104 = objc_allocWithZone(MEMORY[0x24BE0C498]);
        v105 = (void *)sub_24396FB48();
        swift_bridgeObjectRelease();
        v7 = (unint64_t)objc_msgSend(v104, sel_initWithFeatureEntryType_itemIdentifier_featureName_featureValue_featureVersion_, 1, v105, v113, v103, v12);

        MEMORY[0x2494FD42C]();
        if (*(_QWORD *)((v139[0] & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v139[0] & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          sub_24396FC38();
        sub_24396FC50();
        sub_24396FC2C();
        v35 = v119;
        v8 = v115;
      }
      else
      {
LABEL_67:
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v35 = v119;
        v8 = v115;
        v6 = v140;
        v9 = v128;
      }
    }
  }
  v52 = __OFADD__(v9++, 1);
  if (v52)
    goto LABEL_126;
  v12 = v118;
  if (v9 >= v121)
  {
LABEL_124:
    swift_release();
    swift_release();
    swift_release();
    swift_bridgeObjectRelease();

    a3 = v139[0];
    swift_bridgeObjectRelease();
    sub_24393DFCC((uint64_t)v107);
    sub_24393DFCC((uint64_t)v106);
    return a3;
  }
  v75 = *((_QWORD *)v116 + v9);
  if (v75)
  {
LABEL_80:
    v6 = (v75 - 1) & v75;
    v74 = __clz(__rbit64(v75)) + (v9 << 6);
    goto LABEL_81;
  }
  v76 = v9 + 1;
  if (v9 + 1 >= v121)
    goto LABEL_124;
  v75 = *((_QWORD *)v116 + v76);
  if (v75)
    goto LABEL_79;
  v76 = v9 + 2;
  if (v9 + 2 >= v121)
    goto LABEL_124;
  v75 = *((_QWORD *)v116 + v76);
  if (v75)
    goto LABEL_79;
  v76 = v9 + 3;
  if (v9 + 3 >= v121)
    goto LABEL_124;
  v75 = *((_QWORD *)v116 + v76);
  if (v75)
  {
LABEL_79:
    v9 = v76;
    goto LABEL_80;
  }
  while (1)
  {
    v9 = v76 + 1;
    if (__OFADD__(v76, 1))
      break;
    if (v9 >= v121)
      goto LABEL_124;
    v75 = *((_QWORD *)v116 + v9);
    ++v76;
    if (v75)
      goto LABEL_80;
  }
  __break(1u);
LABEL_134:
  __break(1u);
LABEL_135:
  result = sub_24396FFBC();
  __break(1u);
  return result;
}

unint64_t sub_243957AF0@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result;

  result = sub_24393F6E0(MEMORY[0x24BEE4AF8]);
  *a1 = result;
  return result;
}

void sub_243957B1C(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

uint64_t sub_243957B24(uint64_t a1)
{
  uint64_t v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v2 = a1 + 64;
  v3 = *(_BYTE *)(a1 + 32);
  v4 = 1 << v3;
  v5 = -1;
  if (1 << v3 < 64)
    v5 = ~(-1 << (1 << v3));
  v6 = v5 & *(_QWORD *)(a1 + 64);
  if (v6)
  {
    v7 = 0;
    v8 = __clz(__rbit64(v6));
    v9 = (v6 - 1) & v6;
    v10 = (unint64_t)(v4 + 63) >> 6;
    while (2)
    {
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 16 * v8);
      v12 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8 * v8);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (v9)
      {
LABEL_6:
        v14 = __clz(__rbit64(v9));
        v9 &= v9 - 1;
        v15 = v14 | (v7 << 6);
        goto LABEL_7;
      }
      while (1)
      {
        v17 = v7 + 1;
        if (__OFADD__(v7, 1))
          break;
        if (v17 >= v10)
          goto LABEL_27;
        v18 = *(_QWORD *)(v2 + 8 * v17);
        ++v7;
        if (!v18)
        {
          v7 = v17 + 1;
          if (v17 + 1 >= v10)
            goto LABEL_27;
          v18 = *(_QWORD *)(v2 + 8 * v7);
          if (!v18)
          {
            v7 = v17 + 2;
            if (v17 + 2 >= v10)
              goto LABEL_27;
            v18 = *(_QWORD *)(v2 + 8 * v7);
            if (!v18)
            {
              v7 = v17 + 3;
              if (v17 + 3 >= v10)
                goto LABEL_27;
              v18 = *(_QWORD *)(v2 + 8 * v7);
              if (!v18)
              {
                v19 = v17 + 4;
                if (v19 >= v10)
                {
LABEL_27:
                  swift_release();
                  return v11;
                }
                v18 = *(_QWORD *)(v2 + 8 * v19);
                if (!v18)
                {
                  while (1)
                  {
                    v7 = v19 + 1;
                    if (__OFADD__(v19, 1))
                      break;
                    if (v7 >= v10)
                      goto LABEL_27;
                    v18 = *(_QWORD *)(v2 + 8 * v7);
                    ++v19;
                    if (v18)
                      goto LABEL_24;
                  }
                  __break(1u);
LABEL_44:
                  v21 = 0;
                  v22 = 6;
                  if (v10 > 6)
                    v22 = v10;
                  v23 = v22 - 6;
                  while (v23 != v21)
                  {
                    v20 = *(_QWORD *)(a1 + 112 + 8 * v21++);
                    if (v20)
                    {
                      v7 = v21 + 5;
                      goto LABEL_31;
                    }
                  }
                  return 0;
                }
                v7 = v19;
              }
            }
          }
        }
LABEL_24:
        v13 = v18 - 1;
        v9 = (v18 - 1) & v18;
        v15 = __clz(__rbit64(v18)) + (v7 << 6);
LABEL_7:
        v16 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8 * v15);
        if (v12 < v16)
        {
          v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 16 * v15);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRelease();
          v12 = v16;
          if (v9)
            goto LABEL_6;
        }
        else if (v9)
        {
          goto LABEL_6;
        }
      }
      __break(1u);
LABEL_38:
      if (v13 >= 9)
      {
        v20 = *(_QWORD *)(a1 + 96);
        if (v20)
        {
          v7 = 4;
        }
        else
        {
          v20 = *(_QWORD *)(a1 + 104);
          if (!v20)
            goto LABEL_44;
          v7 = 5;
        }
LABEL_31:
        v9 = (v20 - 1) & v20;
        v8 = __clz(__rbit64(v20)) + (v7 << 6);
        continue;
      }
      break;
    }
  }
  else
  {
    v13 = v3 & 0x3F;
    if (v13 > 6)
    {
      v10 = (unint64_t)(v4 + 63) >> 6;
      v20 = *(_QWORD *)(a1 + 72);
      if (v20)
      {
        v7 = 1;
        goto LABEL_31;
      }
      if (v13 >= 8)
      {
        v20 = *(_QWORD *)(a1 + 80);
        if (v20)
        {
          v7 = 2;
        }
        else
        {
          v20 = *(_QWORD *)(a1 + 88);
          if (!v20)
            goto LABEL_38;
          v7 = 3;
        }
        goto LABEL_31;
      }
    }
  }
  return 0;
}

void sub_243957DC0(uint64_t a1, uint64_t a2, _QWORD *a3, unsigned int a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  int64_t v12;
  unint64_t v13;
  unint64_t i;
  uint64_t v15;
  unint64_t v17;
  int64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t inited;
  void *v23;
  unint64_t v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  uint64_t v33;
  _QWORD *v35;
  uint64_t v36;
  int64_t v37;
  uint64_t v39;
  unint64_t v40;

  v5 = v4;
  v7 = *(_QWORD *)(a2 + 384);
  v8 = *(_QWORD *)(v7 + 56);
  v36 = v7 + 56;
  v9 = 1 << *(_BYTE *)(v7 + 32);
  v10 = -1;
  if (v9 < 64)
    v10 = ~(-1 << v9);
  v11 = v10 & v8;
  v37 = (unint64_t)(v9 + 63) >> 6;
  v39 = *(_QWORD *)(a2 + 384);
  swift_bridgeObjectRetain();
  v12 = 0;
  v35 = a3;
  if (v11)
    goto LABEL_6;
LABEL_9:
  if (!__OFADD__(v12++, 1))
  {
    if (v12 >= v37)
      goto LABEL_36;
    v17 = *(_QWORD *)(v36 + 8 * v12);
    if (v17)
    {
LABEL_19:
      v11 = (v17 - 1) & v17;
      for (i = __clz(__rbit64(v17)) + (v12 << 6); ; i = v13 | (v12 << 6))
      {
        v19 = (uint64_t *)(*(_QWORD *)(v39 + 48) + 16 * i);
        v20 = *v19;
        v21 = v19[1];
        swift_bridgeObjectRetain();
        sub_24396FC80();
        if (v5)
        {
          swift_bridgeObjectRelease();
          swift_release();
          return;
        }
        __swift_instantiateConcreteTypeFromMangledName(&qword_2572DA030);
        inited = swift_initStackObject();
        *(_OWORD *)(inited + 16) = xmmword_243970F70;
        *(_QWORD *)(inited + 32) = v20;
        *(_QWORD *)(inited + 40) = v21;
        v23 = *(void **)(a2 + 24);
        swift_bridgeObjectRetain();
        v24 = sub_24396CD00(inited, 0, 0, 0, 0, 0, 1, 1, v23);
        swift_setDeallocating();
        swift_arrayDestroy();
        if (v24 >> 62)
        {
          swift_bridgeObjectRetain();
          v15 = sub_24396FF20();
          swift_bridgeObjectRelease();
          if (!v15)
            goto LABEL_5;
        }
        else if (!*(_QWORD *)((v24 & 0xFFFFFFFFFFFFF8) + 0x10))
        {
LABEL_5:
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (!v11)
            goto LABEL_9;
          goto LABEL_6;
        }
        v40 = v11;
        if ((v24 & 0xC000000000000001) != 0)
        {
          v25 = (id)MEMORY[0x2494FD69C](0, v24);
        }
        else
        {
          if (!*(_QWORD *)((v24 & 0xFFFFFFFFFFFFF8) + 0x10))
          {
            __break(1u);
            goto LABEL_38;
          }
          v25 = *(id *)(v24 + 32);
        }
        v26 = v25;
        swift_bridgeObjectRelease();
        objc_msgSend(v26, sel_lh_isGroupChat);
        v27 = (void *)sub_24396FC68();
        v28 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE0C4A0]), sel_initWithIntValue_doubleValue_stringValue_BOOLValue_histogramValue_, 0, 0, 0, v27, 0);

        sub_24393E124(0, (unint64_t *)&qword_2572D9D38);
        v29 = v28;
        v30 = (void *)sub_24396FD64();
        v31 = objc_allocWithZone(MEMORY[0x24BE0C498]);
        v32 = (void *)sub_24396FB48();
        swift_bridgeObjectRelease();
        objc_msgSend(v31, sel_initWithFeatureEntryType_itemIdentifier_featureName_featureValue_featureVersion_, 2, v32, a4, v29, v30);

        v33 = swift_beginAccess();
        MEMORY[0x2494FD42C](v33);
        if (*(_QWORD *)((*v35 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*v35 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          sub_24396FC38();
        sub_24396FC50();
        sub_24396FC2C();
        swift_endAccess();

        v11 = v40;
        if (!v40)
          goto LABEL_9;
LABEL_6:
        v13 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
      }
    }
    v18 = v12 + 1;
    if (v12 + 1 >= v37)
      goto LABEL_36;
    v17 = *(_QWORD *)(v36 + 8 * v18);
    if (!v17)
    {
      v18 = v12 + 2;
      if (v12 + 2 >= v37)
        goto LABEL_36;
      v17 = *(_QWORD *)(v36 + 8 * v18);
      if (!v17)
      {
        v18 = v12 + 3;
        if (v12 + 3 < v37)
        {
          v17 = *(_QWORD *)(v36 + 8 * v18);
          if (v17)
            goto LABEL_18;
          while (1)
          {
            v12 = v18 + 1;
            if (__OFADD__(v18, 1))
              goto LABEL_39;
            if (v12 >= v37)
              break;
            v17 = *(_QWORD *)(v36 + 8 * v12);
            ++v18;
            if (v17)
              goto LABEL_19;
          }
        }
LABEL_36:
        swift_release();
        swift_beginAccess();
        swift_bridgeObjectRetain();
        return;
      }
    }
LABEL_18:
    v12 = v18;
    goto LABEL_19;
  }
LABEL_38:
  __break(1u);
LABEL_39:
  __break(1u);
}

uint64_t sub_243958254(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t result;
  uint64_t v25;
  int64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  int64_t v30;
  double v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  double v40;
  double v41;
  int64_t v42;
  unint64_t v43;
  int64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  int64_t v48;
  _QWORD *v49;
  unint64_t v50;
  unint64_t v51;
  int64_t v52;
  unint64_t v53;
  int64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t v57;
  __int128 v58;
  char v59;
  char v60;
  unint64_t v61;
  uint64_t v62;
  _BOOL8 v63;
  uint64_t v64;
  char v65;
  unint64_t v66;
  char v67;
  uint64_t v68;
  BOOL v69;
  uint64_t v70;
  int64_t v71;
  unint64_t v72;
  int64_t v73;
  unint64_t v74;
  int64_t v75;
  unint64_t v76;
  int64_t v77;
  uint64_t v78;
  uint64_t *v79;
  uint64_t v80;
  uint64_t v81;
  __int128 v82;
  double v83;
  double v84;
  char isUniquelyReferenced_nonNull_native;
  char v86;
  unint64_t v87;
  uint64_t v88;
  _BOOL8 v89;
  uint64_t v90;
  char v91;
  unint64_t v92;
  char v93;
  double v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  int v98;
  int64_t v99;
  unint64_t v100;
  void *v101;
  uint64_t v102;
  void *v103;
  uint64_t v104;
  id v105;
  void *v106;
  uint64_t v107;
  uint64_t v108;
  __int128 v109;
  uint64_t v110;
  uint64_t v111;
  void *v112;
  __int128 v113;
  __int128 v114[2];
  void *v115;
  __int128 v116;
  __int128 v117[2];
  __int128 v118;
  __int128 v119;
  __int128 v120;
  uint64_t v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  uint64_t v125;
  uint64_t v126;
  unint64_t v127;
  uint64_t v128;

  v4 = v3;
  sub_243946A44(a1, (uint64_t)&v118);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2572D9F50);
  if (!swift_dynamicCast())
    goto LABEL_6;
  v7 = v127;
  if (v127 >> 61 != 1)
  {
    sub_24393DF0C(v122, *((uint64_t *)&v122 + 1), (void *)v123, *((uint64_t *)&v123 + 1), (void *)v124, *((uint64_t *)&v124 + 1), v125, v126, v127);
LABEL_6:
    sub_24393DE88();
    swift_allocError();
    *(_OWORD *)v22 = xmmword_2439718A0;
    *(_BYTE *)(v22 + 16) = 1;
    swift_willThrow();
    return v4;
  }
  v98 = a3;
  v109 = v122;
  v8 = *(_QWORD *)(a2 + 384);
  v128 = v3;
  v9 = (void *)v123;
  v103 = (void *)v124;
  v104 = v126;
  v107 = *((_QWORD *)&v124 + 1);
  v108 = v125;
  v102 = *((_QWORD *)&v123 + 1);
  sub_24393E124(0, &qword_2572D9D30);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2572D9FF0);
  v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_243970F80;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2572D9FB0);
  *(_QWORD *)(v10 + 56) = v11;
  v12 = sub_2439601F0();
  *(_QWORD *)(v10 + 32) = v8;
  *(_QWORD *)(v10 + 96) = v11;
  *(_QWORD *)(v10 + 104) = v12;
  *(_QWORD *)(v10 + 64) = v12;
  *(_QWORD *)(v10 + 72) = v8;
  v110 = v8;
  swift_bridgeObjectRetain_n();
  v13 = (void *)sub_24396FCEC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2572DA020);
  v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_243971890;
  *(_QWORD *)(v14 + 32) = v9;
  *(_QWORD *)(v14 + 40) = v13;
  *(_QWORD *)&v122 = v14;
  sub_24396FC2C();
  v100 = v7;
  v101 = v9;
  v15 = v9;
  v4 = v102;
  sub_24396023C(v109, *((uint64_t *)&v109 + 1), v15, v102, v103, v107, v108, v104, v7);
  v16 = v13;
  v17 = (void *)sub_24396FC08();
  swift_bridgeObjectRelease();
  v18 = objc_msgSend((id)objc_opt_self(), sel_andPredicateWithSubpredicates_, v17);

  v19 = v18;
  v20 = v128;
  v21 = sub_24394B48C((uint64_t)v18, *(_QWORD *)(a2 + 8));
  if (v20)
  {

    sub_24393DF0C(v109, *((uint64_t *)&v109 + 1), v101, v102, v103, v107, v108, v104, v7);
    return v4;
  }
  v23 = (uint64_t)v21;
  sub_24396FC80();
  v106 = v19;
  swift_bridgeObjectRetain();
  v25 = sub_2439602FC(MEMORY[0x24BEE4B00], v110, v23, v109, BYTE8(v109) & 1, v98);
  v26 = 0;
  swift_bridgeObjectRelease();
  v105 = v16;
  swift_bridgeObjectRelease();
  v111 = v25 + 64;
  v27 = 1 << *(_BYTE *)(v25 + 32);
  v28 = -1;
  if (v27 < 64)
    v28 = ~(-1 << v27);
  v29 = v28 & *(_QWORD *)(v25 + 64);
  v30 = (unint64_t)(v27 + 63) >> 6;
  v128 = v25;
  swift_bridgeObjectRetain();
  v31 = 0.0;
  while (1)
  {
    if (v29)
    {
      v32 = __clz(__rbit64(v29));
      v29 &= v29 - 1;
      v33 = v32 | (v26 << 6);
      v34 = v128;
      goto LABEL_13;
    }
    v42 = v26 + 1;
    v34 = v128;
    if (__OFADD__(v26, 1))
    {
LABEL_98:
      __break(1u);
LABEL_99:
      __break(1u);
LABEL_100:
      __break(1u);
LABEL_101:
      __break(1u);
LABEL_102:
      __break(1u);
LABEL_103:
      __break(1u);
      goto LABEL_104;
    }
    if (v42 >= v30)
      goto LABEL_33;
    v43 = *(_QWORD *)(v111 + 8 * v42);
    ++v26;
    if (!v43)
    {
      v26 = v42 + 1;
      if (v42 + 1 >= v30)
        goto LABEL_33;
      v43 = *(_QWORD *)(v111 + 8 * v26);
      if (!v43)
      {
        v26 = v42 + 2;
        if (v42 + 2 >= v30)
          goto LABEL_33;
        v43 = *(_QWORD *)(v111 + 8 * v26);
        if (!v43)
        {
          v26 = v42 + 3;
          if (v42 + 3 >= v30)
            goto LABEL_33;
          v43 = *(_QWORD *)(v111 + 8 * v26);
          if (!v43)
          {
            v26 = v42 + 4;
            if (v42 + 4 >= v30)
              goto LABEL_33;
            v43 = *(_QWORD *)(v111 + 8 * v26);
            if (!v43)
              break;
          }
        }
      }
    }
LABEL_32:
    v29 = (v43 - 1) & v43;
    v33 = __clz(__rbit64(v43)) + (v26 << 6);
LABEL_13:
    v35 = *(_QWORD *)(v34 + 56);
    v36 = (uint64_t *)(*(_QWORD *)(v34 + 48) + 16 * v33);
    v38 = *v36;
    v37 = v36[1];
    sub_243946A44(v35 + 40 * v33, (uint64_t)&v123);
    *(_QWORD *)&v122 = v38;
    *((_QWORD *)&v122 + 1) = v37;
    v118 = v122;
    v119 = v123;
    v120 = v124;
    v121 = v125;
    v116 = v122;
    sub_243946A44((uint64_t)&v119, (uint64_t)v117);
    sub_243946A88(v117, (uint64_t)&v113);
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2572D9FC0);
    sub_24393E124(0, (unint64_t *)&qword_2572D9D38);
    swift_dynamicCast();
    v39 = v115;
    sub_24396FC8C();
    v41 = v40;

    v31 = v31 + v41;
    sub_24394ADB4((uint64_t)&v118, &qword_2572D9FC8);
  }
  v44 = v42 + 5;
  if (v44 >= v30)
    goto LABEL_33;
  v43 = *(_QWORD *)(v111 + 8 * v44);
  if (v43)
  {
    v26 = v44;
    goto LABEL_32;
  }
  while (1)
  {
    v26 = v44 + 1;
    if (__OFADD__(v44, 1))
      goto LABEL_105;
    if (v26 >= v30)
      break;
    v43 = *(_QWORD *)(v111 + 8 * v26);
    ++v44;
    if (v43)
      goto LABEL_32;
  }
LABEL_33:
  swift_release();
  v45 = 1 << *(_BYTE *)(v34 + 32);
  v46 = -1;
  if (v45 < 64)
    v46 = ~(-1 << v45);
  v47 = v46 & *(_QWORD *)(v34 + 64);
  v99 = (unint64_t)(v45 + 63) >> 6;
  if (v31 != 0.0)
  {
    swift_bridgeObjectRetain();
    v71 = 0;
    v49 = (_QWORD *)MEMORY[0x24BEE4B00];
    while (1)
    {
      if (v47)
      {
        v72 = __clz(__rbit64(v47));
        v47 &= v47 - 1;
        v73 = v71;
        v74 = v72 | (v71 << 6);
      }
      else
      {
        v75 = v71 + 1;
        if (__OFADD__(v71, 1))
          goto LABEL_103;
        if (v75 >= v99)
          goto LABEL_96;
        v76 = *(_QWORD *)(v111 + 8 * v75);
        v77 = v71 + 1;
        if (!v76)
        {
          v77 = v71 + 2;
          if (v71 + 2 >= v99)
            goto LABEL_96;
          v76 = *(_QWORD *)(v111 + 8 * v77);
          if (!v76)
          {
            v77 = v71 + 3;
            if (v71 + 3 >= v99)
              goto LABEL_96;
            v76 = *(_QWORD *)(v111 + 8 * v77);
            if (!v76)
            {
              v77 = v71 + 4;
              if (v71 + 4 >= v99)
                goto LABEL_96;
              v76 = *(_QWORD *)(v111 + 8 * v77);
              if (!v76)
              {
                v78 = v71 + 5;
                if (v71 + 5 >= v99)
                  goto LABEL_96;
                v76 = *(_QWORD *)(v111 + 8 * v78);
                if (!v76)
                {
                  while (1)
                  {
                    v77 = v78 + 1;
                    if (__OFADD__(v78, 1))
                      goto LABEL_106;
                    if (v77 >= v99)
                      break;
                    v76 = *(_QWORD *)(v111 + 8 * v77);
                    ++v78;
                    if (v76)
                      goto LABEL_86;
                  }
LABEL_96:
                  swift_release();
                  swift_bridgeObjectRelease();
                  v97 = sub_24396FC80();
                  MEMORY[0x24BDAC7A8](v97);
                  v4 = sub_24395FA4C((uint64_t)v49, (void (*)(uint64_t, uint64_t, double))sub_24396050C);

                  sub_24393DF0C(v109, *((uint64_t *)&v109 + 1), v101, v102, v103, v107, v108, v104, v100);
                  swift_bridgeObjectRelease();
                  return v4;
                }
                v77 = v71 + 5;
              }
            }
          }
        }
LABEL_86:
        v47 = (v76 - 1) & v76;
        v73 = v77;
        v74 = __clz(__rbit64(v76)) + (v77 << 6);
      }
      v79 = (uint64_t *)(*(_QWORD *)(v34 + 48) + 16 * v74);
      v80 = *v79;
      v81 = v79[1];
      sub_243946A44(*(_QWORD *)(v34 + 56) + 40 * v74, (uint64_t)&v123);
      *(_QWORD *)&v122 = v80;
      *((_QWORD *)&v122 + 1) = v81;
      v118 = v122;
      v119 = v123;
      v120 = v124;
      v121 = v125;
      v82 = v122;
      v116 = v122;
      sub_243946A44((uint64_t)&v119, (uint64_t)v117);
      v113 = v82;
      sub_243946A44((uint64_t)&v119, (uint64_t)v114);
      sub_243946A88(v114, (uint64_t)&v115);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      __swift_instantiateConcreteTypeFromMangledName(&qword_2572D9FC0);
      sub_24393E124(0, (unint64_t *)&qword_2572D9D38);
      swift_dynamicCast();
      sub_24396FC8C();
      v84 = v83;

      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *(_QWORD *)&v113 = v49;
      v87 = sub_243942698(v82, *((uint64_t *)&v82 + 1));
      v88 = v49[2];
      v89 = (v86 & 1) == 0;
      v90 = v88 + v89;
      if (__OFADD__(v88, v89))
        goto LABEL_99;
      v91 = v86;
      if (v49[3] >= v90)
      {
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
          sub_2439466E4();
      }
      else
      {
        sub_243944674(v90, isUniquelyReferenced_nonNull_native);
        v92 = sub_243942698(v82, *((uint64_t *)&v82 + 1));
        if ((v91 & 1) != (v93 & 1))
          goto LABEL_107;
        v87 = v92;
      }
      v34 = v128;
      v49 = (_QWORD *)v113;
      v94 = v84 / v31;
      if ((v91 & 1) != 0)
      {
        *(double *)(*(_QWORD *)(v113 + 56) + 8 * v87) = v94;
      }
      else
      {
        *(_QWORD *)(v113 + 8 * (v87 >> 6) + 64) |= 1 << v87;
        *(_OWORD *)(v49[6] + 16 * v87) = v82;
        *(double *)(v49[7] + 8 * v87) = v94;
        v95 = v49[2];
        v69 = __OFADD__(v95, 1);
        v96 = v95 + 1;
        if (v69)
          goto LABEL_102;
        v49[2] = v96;
        swift_bridgeObjectRetain();
      }
      v16 = v105;
      v19 = v106;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v117);
      sub_24394ADB4((uint64_t)&v118, &qword_2572D9FC8);
      v71 = v73;
    }
  }
  swift_bridgeObjectRetain();
  v48 = 0;
  v49 = (_QWORD *)MEMORY[0x24BEE4B00];
  while (2)
  {
    if (v47)
    {
      v50 = __clz(__rbit64(v47));
      v47 &= v47 - 1;
      v51 = v50 | (v48 << 6);
LABEL_57:
      v55 = (uint64_t *)(*(_QWORD *)(v34 + 48) + 16 * v51);
      v56 = *v55;
      v57 = v55[1];
      sub_243946A44(*(_QWORD *)(v34 + 56) + 40 * v51, (uint64_t)&v123);
      *(_QWORD *)&v122 = v56;
      *((_QWORD *)&v122 + 1) = v57;
      v118 = v122;
      v119 = v123;
      v120 = v124;
      v121 = v125;
      v58 = v122;
      v116 = v122;
      sub_243946A44((uint64_t)&v119, (uint64_t)v117);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v59 = swift_isUniquelyReferenced_nonNull_native();
      *(_QWORD *)&v113 = v49;
      v61 = sub_243942698(v58, *((uint64_t *)&v58 + 1));
      v62 = v49[2];
      v63 = (v60 & 1) == 0;
      v64 = v62 + v63;
      if (__OFADD__(v62, v63))
      {
        __break(1u);
        goto LABEL_98;
      }
      v65 = v60;
      if (v49[3] >= v64)
      {
        if ((v59 & 1) == 0)
          sub_2439466E4();
      }
      else
      {
        sub_243944674(v64, v59);
        v66 = sub_243942698(v58, *((uint64_t *)&v58 + 1));
        if ((v65 & 1) != (v67 & 1))
          goto LABEL_107;
        v61 = v66;
      }
      v16 = v105;
      v49 = (_QWORD *)v113;
      if ((v65 & 1) != 0)
      {
        *(_QWORD *)(*(_QWORD *)(v113 + 56) + 8 * v61) = 0;
      }
      else
      {
        *(_QWORD *)(v113 + 8 * (v61 >> 6) + 64) |= 1 << v61;
        *(_OWORD *)(v49[6] + 16 * v61) = v58;
        *(_QWORD *)(v49[7] + 8 * v61) = 0;
        v68 = v49[2];
        v69 = __OFADD__(v68, 1);
        v70 = v68 + 1;
        if (v69)
          goto LABEL_100;
        v49[2] = v70;
        swift_bridgeObjectRetain();
      }
      v19 = v106;
      v34 = v128;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v117);
      sub_24394ADB4((uint64_t)&v118, &qword_2572D9FC8);
      continue;
    }
    break;
  }
  v52 = v48 + 1;
  if (__OFADD__(v48, 1))
    goto LABEL_101;
  if (v52 >= v99)
    goto LABEL_96;
  v53 = *(_QWORD *)(v111 + 8 * v52);
  ++v48;
  if (v53)
    goto LABEL_56;
  v48 = v52 + 1;
  if (v52 + 1 >= v99)
    goto LABEL_96;
  v53 = *(_QWORD *)(v111 + 8 * v48);
  if (v53)
    goto LABEL_56;
  v48 = v52 + 2;
  if (v52 + 2 >= v99)
    goto LABEL_96;
  v53 = *(_QWORD *)(v111 + 8 * v48);
  if (v53)
    goto LABEL_56;
  v48 = v52 + 3;
  if (v52 + 3 >= v99)
    goto LABEL_96;
  v53 = *(_QWORD *)(v111 + 8 * v48);
  if (v53)
  {
LABEL_56:
    v47 = (v53 - 1) & v53;
    v51 = __clz(__rbit64(v53)) + (v48 << 6);
    goto LABEL_57;
  }
  v54 = v52 + 4;
  if (v54 >= v99)
    goto LABEL_96;
  v53 = *(_QWORD *)(v111 + 8 * v54);
  if (v53)
  {
    v48 = v54;
    goto LABEL_56;
  }
  while (1)
  {
    v48 = v54 + 1;
    if (__OFADD__(v54, 1))
      break;
    if (v48 >= v99)
      goto LABEL_96;
    v53 = *(_QWORD *)(v111 + 8 * v48);
    ++v54;
    if (v53)
      goto LABEL_56;
  }
LABEL_104:
  __break(1u);
LABEL_105:
  __break(1u);
LABEL_106:
  __break(1u);
LABEL_107:
  result = sub_24396FFBC();
  __break(1u);
  return result;
}

void sub_243958FAC(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, char a5, int a6)
{
  uint64_t v6;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  id v14;
  void *v15;
  unsigned int v16;
  uint64_t v17;
  _QWORD *v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  int v23;
  uint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  uint8_t *v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  __int128 v31;
  uint64_t v32;
  _OWORD v33[2];
  _BYTE v34[32];
  __int128 v35;
  unsigned int v36[6];
  uint64_t v37;
  _QWORD v38[4];
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  int v46;

  v9 = *a2;
  v10 = a2[1];
  sub_24396FC80();
  if (!v6)
  {
    v46 = a6;
    swift_bridgeObjectRetain();
    v11 = swift_bridgeObjectRetain();
    v12 = sub_24395FF6C(v11, v9, v10);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((a5 & 1) != 0)
    {
      if (v12 >> 62)
        sub_24396FF20();
      v13 = (void *)sub_24396FCE0();
      v14 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE0C4A0]), sel_initWithIntValue_doubleValue_stringValue_BOOLValue_histogramValue_, v13, 0, 0, 0, 0);
    }
    else
    {
      sub_24395344C(v12);
      v13 = (void *)sub_24396FC98();
      v14 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE0C4A0]), sel_initWithIntValue_doubleValue_stringValue_BOOLValue_histogramValue_, 0, v13, 0, 0, 0);
    }
    v15 = v14;
    swift_bridgeObjectRelease();

    v35 = xmmword_243970F80;
    v16 = objc_msgSend(v15, sel_intValue);
    v37 = MEMORY[0x24BEE44F0];
    v36[0] = v16;
    objc_msgSend(v15, sel_doubleValue);
    v38[3] = MEMORY[0x24BEE13C8];
    v38[0] = v17;
    sub_243946B14((uint64_t)v36, (uint64_t)v34);
    sub_243946B14((uint64_t)v34, (uint64_t)&v31);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v34);
    if (v32)
    {
      sub_243946AA0(&v31, v33);
      sub_243946AA0(v33, &v31);
      v18 = (_QWORD *)MEMORY[0x24BEE4AF8];
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v18 = sub_2439649EC(0, v18[2] + 1, 1, v18);
      v20 = v18[2];
      v19 = v18[3];
      if (v20 >= v19 >> 1)
        v18 = sub_2439649EC((_QWORD *)(v19 > 1), v20 + 1, 1, v18);
      v18[2] = v20 + 1;
      sub_243946AA0(&v31, &v18[4 * v20 + 4]);
    }
    else
    {
      sub_24394ADB4((uint64_t)&v31, &qword_2572D9E88);
      v18 = (_QWORD *)MEMORY[0x24BEE4AF8];
    }
    sub_243946B14((uint64_t)v38, (uint64_t)v34);
    sub_243946B14((uint64_t)v34, (uint64_t)&v31);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v34);
    if (v32)
    {
      sub_243946AA0(&v31, v33);
      sub_243946AA0(v33, &v31);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v18 = sub_2439649EC(0, v18[2] + 1, 1, v18);
      v22 = v18[2];
      v21 = v18[3];
      if (v22 >= v21 >> 1)
        v18 = sub_2439649EC((_QWORD *)(v21 > 1), v22 + 1, 1, v18);
      v18[2] = v22 + 1;
      sub_243946AA0(&v31, &v18[4 * v22 + 4]);
    }
    else
    {
      sub_24394ADB4((uint64_t)&v31, &qword_2572D9E88);
    }
    swift_arrayDestroy();
    if (v18[2])
    {
      sub_243946B14((uint64_t)(v18 + 4), (uint64_t)&v39);
    }
    else
    {
      v39 = 0u;
      v40 = 0u;
    }
    v23 = v46;
    swift_bridgeObjectRelease();
    if (*((_QWORD *)&v40 + 1))
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_2572D9FC0);
      if ((swift_dynamicCast() & 1) != 0)
      {
        if (*((_QWORD *)&v42 + 1))
        {
          sub_243946A88(&v41, (uint64_t)&v44);
          sub_243946A44((uint64_t)&v44, (uint64_t)&v41);
          swift_bridgeObjectRetain();
          sub_2439526A0((uint64_t)&v41, v9, v10);

          __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v44);
          return;
        }
      }
      else
      {
        v43 = 0;
        v41 = 0u;
        v42 = 0u;
      }
    }
    else
    {
      sub_24394ADB4((uint64_t)&v39, &qword_2572D9E88);
      v41 = 0u;
      v42 = 0u;
      v43 = 0;
    }
    sub_24394ADB4((uint64_t)&v41, (uint64_t *)&unk_2572D9FD0);
    if (qword_2572D9D10 != -1)
      swift_once();
    v24 = sub_24396FAE8();
    __swift_project_value_buffer(v24, (uint64_t)qword_2572DA2B0);
    v25 = sub_24396FAD0();
    v26 = sub_24396FD10();
    if (os_log_type_enabled(v25, v26))
    {
      v27 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v27 = 67109120;
      LODWORD(v44) = v23;
      sub_24396FD94();
      _os_log_impl(&dword_243921000, v25, v26, "Both double and int values are null in computation of %d", v27, 8u);
      MEMORY[0x2494FDD74](v27, -1, -1);
    }

    v44 = 0;
    v45 = 0xE000000000000000;
    sub_24396FE48();
    sub_24396FB90();
    LODWORD(v41) = v23;
    type metadata accessor for BMMLSEDurableFeatureStorefeatureName(0);
    sub_24396FECC();
    v28 = v44;
    v29 = v45;
    sub_24393DE88();
    swift_allocError();
    *(_QWORD *)v30 = v28;
    *(_QWORD *)(v30 + 8) = v29;
    *(_BYTE *)(v30 + 16) = 1;
    swift_willThrow();

  }
}

id sub_243959554(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  v4 = (void *)sub_24396FC98();
  v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE0C4A0]), sel_initWithIntValue_doubleValue_stringValue_BOOLValue_histogramValue_, 0, v4, 0, 0, 0);

  sub_24393E124(0, (unint64_t *)&qword_2572D9D38);
  v6 = (void *)sub_24396FD64();
  v7 = objc_allocWithZone(MEMORY[0x24BE0C498]);
  swift_bridgeObjectRetain();
  v8 = (void *)sub_24396FB48();
  swift_bridgeObjectRelease();
  v9 = objc_msgSend(v7, sel_initWithFeatureEntryType_itemIdentifier_featureName_featureValue_featureVersion_, 2, v8, a3, v5, v6);

  return v9;
}

uint64_t sub_243959654(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  _QWORD *v9;
  void *v10;
  id v11;
  uint64_t v12;
  _QWORD v14[6];
  _QWORD aBlock[50];

  v2 = swift_allocObject();
  *(_QWORD *)(v2 + 16) = MEMORY[0x24BEE4AF8];
  v3 = swift_allocObject();
  *(_QWORD *)(v3 + 16) = MEMORY[0x24BEE4B08];
  v4 = objc_msgSend((id)BiomeLibrary(), sel_ShareSheet);
  swift_unknownObjectRelease();
  v5 = objc_msgSend(v4, sel_SuggestLessFeedback);
  swift_unknownObjectRelease();
  v6 = objc_msgSend(v5, sel_publisher);

  aBlock[4] = nullsub_1;
  aBlock[5] = 0;
  v7 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_243960CDC;
  aBlock[3] = &block_descriptor_1;
  v8 = _Block_copy(aBlock);
  sub_24395EDB0(a1, (uint64_t)aBlock);
  v9 = (_QWORD *)swift_allocObject();
  v9[2] = v3;
  memcpy(v9 + 3, aBlock, 0x190uLL);
  v9[53] = v2;
  v14[4] = sub_24396062C;
  v14[5] = v9;
  v14[0] = v7;
  v14[1] = 1107296256;
  v14[2] = sub_243941F10;
  v14[3] = &block_descriptor_16;
  v10 = _Block_copy(v14);
  swift_retain();
  swift_retain();
  swift_release();
  v11 = objc_msgSend(v6, sel_sinkWithCompletion_receiveInput_, v8, v10);
  _Block_release(v10);
  _Block_release(v8);

  swift_beginAccess();
  v12 = *(_QWORD *)(v2 + 16);
  swift_bridgeObjectRetain();
  swift_release();
  swift_release();
  return v12;
}

void sub_2439598A8(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  NSObject *v7;
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  os_log_type_t v16;
  uint8_t *v17;
  char v18;
  _QWORD *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  uint64_t v27;
  NSObject *v28;
  os_log_type_t v29;
  uint8_t *v30;
  NSObject *v31;
  uint64_t v32;
  id v33[50];

  v7 = objc_msgSend(a1, sel_eventBody);
  if (v7)
  {
    v31 = v7;
    v8 = -[NSObject conversationIdentifier](v7, sel_conversationIdentifier);
    if (v8
      || (v8 = -[NSObject derivedIntentIdentifier](v31, sel_derivedIntentIdentifier)) != 0)
    {
      v9 = (uint64_t *)(a2 + 16);
      v10 = sub_24396FB60();
      v12 = v11;

      swift_beginAccess();
      v13 = *v9;
      swift_bridgeObjectRetain();
      v14 = sub_243960DF8(v10, v12, v13);
      swift_bridgeObjectRelease();
      sub_24395EDB0(a3, (uint64_t)v33);
      if ((v14 & 1) != 0)
      {
        sub_24395EDE4(v33);
      }
      else
      {
        v18 = sub_243960DF8(v10, v12, (uint64_t)v33[48]);
        sub_24395EDE4(v33);
        if ((v18 & 1) != 0)
        {
          v19 = (_QWORD *)(a4 + 16);
          swift_bridgeObjectRetain();
          v20 = (void *)sub_24396FC98();
          v21 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE0C4A0]), sel_initWithIntValue_doubleValue_stringValue_BOOLValue_histogramValue_, 0, v20, 0, 0, 0);

          sub_24393E124(0, (unint64_t *)&qword_2572D9D38);
          v22 = (void *)sub_24396FD64();
          v23 = objc_allocWithZone(MEMORY[0x24BE0C498]);
          v24 = (void *)sub_24396FB48();
          swift_bridgeObjectRelease();
          v25 = objc_msgSend(v23, sel_initWithFeatureEntryType_itemIdentifier_featureName_featureValue_featureVersion_, 2, v24, 480, v21, v22);

          swift_beginAccess();
          sub_243965A4C(&v32, v10, v12);
          swift_endAccess();
          swift_bridgeObjectRelease();
          swift_beginAccess();
          v26 = v25;
          MEMORY[0x2494FD42C]();
          if (*(_QWORD *)((*v19 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*v19 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
            sub_24396FC38();
          sub_24396FC50();
          sub_24396FC2C();
          swift_endAccess();

          goto LABEL_15;
        }
      }
      swift_bridgeObjectRelease();
LABEL_15:

      return;
    }
    if (qword_2572D9D10 != -1)
      swift_once();
    v27 = sub_24396FAE8();
    __swift_project_value_buffer(v27, (uint64_t)qword_2572DA2B0);
    v28 = sub_24396FAD0();
    v29 = sub_24396FD10();
    if (os_log_type_enabled(v28, v29))
    {
      v30 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v30 = 0;
      _os_log_impl(&dword_243921000, v28, v29, "Suggest less computation: could not find valid candidate identifier", v30, 2u);
      MEMORY[0x2494FDD74](v30, -1, -1);
    }

  }
  else
  {
    if (qword_2572D9D10 != -1)
      swift_once();
    v15 = sub_24396FAE8();
    __swift_project_value_buffer(v15, (uint64_t)qword_2572DA2B0);
    v31 = sub_24396FAD0();
    v16 = sub_24396FD10();
    if (os_log_type_enabled(v31, v16))
    {
      v17 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_243921000, v31, v16, "Suggest less computation: incorrect feedback in stream", v17, 2u);
      MEMORY[0x2494FDD74](v17, -1, -1);
    }
  }

}

void sub_243959CE8(uint64_t a1)
{
  uint64_t v1;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(char *, uint64_t, uint64_t);
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  _QWORD v21[2];
  uint64_t aBlock[6];

  v3 = objc_msgSend(*(id *)(v1 + 32), sel_pruner);
  v4 = sub_24396FA04();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_QWORD *)(v5 + 64);
  MEMORY[0x24BDAC7A8](v4);
  v7 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v7((char *)v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v4);
  v8 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v9 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v9 + v8, (char *)v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = sub_24396069C;
  *(_QWORD *)(v10 + 24) = v9;
  aBlock[4] = (uint64_t)sub_243960718;
  aBlock[5] = v10;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_24395A054;
  aBlock[3] = (uint64_t)&block_descriptor_25;
  v11 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  objc_msgSend(v3, sel_deleteEventsPassingTest_, v11);

  _Block_release(v11);
  LOBYTE(v11) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  if ((v11 & 1) != 0)
  {
    __break(1u);
  }
  else if (qword_2572D9D10 == -1)
  {
    goto LABEL_3;
  }
  swift_once();
LABEL_3:
  v12 = sub_24396FAE8();
  v13 = __swift_project_value_buffer(v12, (uint64_t)qword_2572DA2B0);
  MEMORY[0x24BDAC7A8](v13);
  v14 = (char *)v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7(v14, a1, v4);
  v15 = sub_24396FAD0();
  v16 = sub_24396FD04();
  if (os_log_type_enabled(v15, v16))
  {
    v17 = (uint8_t *)swift_slowAlloc();
    v18 = swift_slowAlloc();
    aBlock[0] = v18;
    *(_DWORD *)v17 = 136315138;
    v21[0] = v9;
    sub_24396073C((unint64_t *)&qword_2572D9E98, MEMORY[0x24BDCE990]);
    v19 = sub_24396FF80();
    v21[1] = sub_2439420BC(v19, v20, aBlock);
    sub_24396FD94();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v14, v4);
    _os_log_impl(&dword_243921000, v15, v16, "Successfully deleted features older than %s", v17, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2494FDD74](v18, -1, -1);
    MEMORY[0x2494FDD74](v17, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v5 + 8))(v14, v4);
  }
  swift_release();

}

uint64_t sub_24395A054(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t (*v5)(void *, uint64_t);
  id v6;

  v5 = *(uint64_t (**)(void *, uint64_t))(a1 + 32);
  v6 = a2;
  LOBYTE(a3) = v5(a2, a3);

  return a3 & 1;
}

Swift::Void __swiftcall DurableFeatureManager.computeFeaturesAndSendToBiome()()
{
  uint64_t v0;

  sub_24395A0B0(*(_QWORD *)(v0 + 16));
}

uint64_t sub_24395A0B0(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *v2;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  _QWORD *v14;
  NSObject *v15;
  int v16;
  uint8_t *v17;
  uint64_t v18;
  uint64_t v19;
  int64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  int v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  os_log_type_t v32;
  uint8_t *v33;
  uint64_t v34;
  os_log_type_t v35;
  _QWORD *v36;
  uint64_t v37;
  int64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  int v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  void *v51;
  void *v52;
  NSObject *v53;
  os_log_type_t v54;
  uint8_t *v55;
  uint64_t v57;
  unint64_t v58;
  unint64_t v59;
  uint64_t v60;
  uint64_t v61;
  int v62;
  _QWORD *v63;
  const char *v64;
  _QWORD *v65;
  uint64_t v66;
  uint64_t v67[2];
  uint64_t v68;
  _OWORD v69[2];

  v2 = v1;
  if (qword_2572D9D08 != -1)
    swift_once();
  v4 = (void *)qword_2572D9E80;
  v5 = (void *)sub_24396FB48();
  v6 = objc_msgSend(v4, sel_objectForKey_, v5);

  v64 = "beginDurableFeatureComputation";
  if (v6)
  {
    sub_24396FDB8();
    swift_unknownObjectRelease();
    sub_24394ADB4((uint64_t)v69, &qword_2572D9E88);
  }
  else
  {
    memset(v69, 0, sizeof(v69));
    sub_24394ADB4((uint64_t)v69, &qword_2572D9E88);
    LODWORD(v69[0]) = 4;
    BYTE4(v69[0]) = 1;
    NSUserDefaults.saveComputationDate(_:)((int *)v69);
    LODWORD(v69[0]) = 5;
    BYTE4(v69[0]) = 1;
    NSUserDefaults.saveComputationDate(_:)((int *)v69);
  }
  v68 = MEMORY[0x24BEE4AF8];
  v7 = *(_QWORD *)(a1 + 16);
  if (v7)
  {
    v65 = v2 + 43;
    swift_bridgeObjectRetain();
    v8 = 0;
    while (1)
    {
      v9 = *(unsigned int *)(a1 + 4 * v8 + 32);
      LODWORD(v69[0]) = *(_DWORD *)(a1 + 4 * v8 + 32);
      BYTE4(v69[0]) = 0;
      if ((NSUserDefaults.shouldCompute(_:)((int *)v69) & 1) != 0)
      {
        v11 = v2[46];
        v10 = v2[47];
        __swift_project_boxed_opaque_existential_1(v65, v11);
        if (((*(uint64_t (**)(uint64_t, uint64_t))(v10 + 8))(v11, v10) & 1) != 0)
        {
          swift_bridgeObjectRelease();
          if (qword_2572D9D10 != -1)
            swift_once();
          v34 = sub_24396FAE8();
          __swift_project_value_buffer(v34, (uint64_t)qword_2572DA2B0);
          v31 = sub_24396FAD0();
          v35 = sub_24396FCF8();
          if (os_log_type_enabled(v31, v35))
          {
            v33 = (uint8_t *)swift_slowAlloc();
            v36 = (_QWORD *)swift_slowAlloc();
            v67[0] = (uint64_t)v36;
            *(_DWORD *)v33 = 136315138;
            swift_beginAccess();
            v37 = v68;
            v38 = *(_QWORD *)(v68 + 16);
            v39 = MEMORY[0x24BEE4AF8];
            if (v38)
            {
              v65 = v36;
              v66 = MEMORY[0x24BEE4AF8];
              swift_bridgeObjectRetain();
              sub_24394BCCC(0, v38, 0);
              v40 = 0;
              v39 = v66;
              v41 = *(_QWORD *)(v66 + 16);
              do
              {
                v42 = *(_DWORD *)(v37 + 4 * v40 + 32);
                v66 = v39;
                v43 = *(_QWORD *)(v39 + 24);
                if (v41 >= v43 >> 1)
                {
                  sub_24394BCCC(v43 > 1, v41 + 1, 1);
                  v39 = v66;
                }
                ++v40;
                *(_QWORD *)(v39 + 16) = v41 + 1;
                *(_DWORD *)(v39 + 4 * v41++ + 32) = v42;
              }
              while (v38 != v40);
              swift_bridgeObjectRelease();
              v36 = v65;
            }
            v57 = MEMORY[0x2494FD450](v39, MEMORY[0x24BEE3F88]);
            v59 = v58;
            swift_bridgeObjectRelease();
            v66 = sub_2439420BC(v57, v59, v67);
            sub_24396FD94();
            swift_bridgeObjectRelease();
            _os_log_impl(&dword_243921000, v31, v35, "Plugin halted while computing durable features. Completed features: %s", v33, 0xCu);
            swift_arrayDestroy();
            MEMORY[0x2494FDD74](v36, -1, -1);
LABEL_43:
            MEMORY[0x2494FDD74](v33, -1, -1);
          }
          goto LABEL_44;
        }
        v12 = (void *)MEMORY[0x2494FD924]();
        sub_24395B2B4((unint64_t)v2, v9, &v68);
        objc_autoreleasePoolPop(v12);
      }
      if (v7 == ++v8)
      {
        swift_bridgeObjectRelease();
        break;
      }
    }
  }
  if (qword_2572D9D10 != -1)
    swift_once();
  v13 = sub_24396FAE8();
  v14 = (_QWORD *)__swift_project_value_buffer(v13, (uint64_t)qword_2572DA2B0);
  v15 = sub_24396FAD0();
  v16 = sub_24396FCF8();
  if (os_log_type_enabled(v15, (os_log_type_t)v16))
  {
    v63 = v2;
    v17 = (uint8_t *)swift_slowAlloc();
    v18 = swift_slowAlloc();
    v67[0] = v18;
    *(_DWORD *)v17 = 136315138;
    swift_beginAccess();
    v19 = v68;
    v20 = *(_QWORD *)(v68 + 16);
    v21 = MEMORY[0x24BEE4AF8];
    if (v20)
    {
      v61 = v18;
      v62 = v16;
      v65 = v14;
      v66 = MEMORY[0x24BEE4AF8];
      swift_bridgeObjectRetain();
      sub_24394BCCC(0, v20, 0);
      v22 = 0;
      v21 = v66;
      v23 = *(_QWORD *)(v66 + 16);
      do
      {
        v24 = *(_DWORD *)(v19 + 4 * v22 + 32);
        v66 = v21;
        v25 = *(_QWORD *)(v21 + 24);
        if (v23 >= v25 >> 1)
        {
          sub_24394BCCC(v25 > 1, v23 + 1, 1);
          v21 = v66;
        }
        ++v22;
        *(_QWORD *)(v21 + 16) = v23 + 1;
        *(_DWORD *)(v21 + 4 * v23++ + 32) = v24;
      }
      while (v20 != v22);
      swift_bridgeObjectRelease();
      v14 = v65;
      LOBYTE(v16) = v62;
      v18 = v61;
    }
    v26 = MEMORY[0x2494FD450](v21, MEMORY[0x24BEE3F88]);
    v28 = v27;
    swift_bridgeObjectRelease();
    v66 = sub_2439420BC(v26, v28, v67);
    sub_24396FD94();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_243921000, v15, (os_log_type_t)v16, "Plugin finished sending durable features to Biome. Stored features: %s", v17, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2494FDD74](v18, -1, -1);
    MEMORY[0x2494FDD74](v17, -1, -1);

    v2 = v63;
  }
  else
  {

  }
  LODWORD(v67[0]) = 3;
  BYTE4(v67[0]) = 1;
  if ((NSUserDefaults.shouldCompute(_:)((int *)v67) & 1) == 0)
    return swift_bridgeObjectRelease();
  v29 = v2[46];
  v30 = v2[47];
  __swift_project_boxed_opaque_existential_1(v2 + 43, v29);
  if (((*(uint64_t (**)(uint64_t, uint64_t))(v30 + 8))(v29, v30) & 1) != 0)
  {
    v31 = sub_24396FAD0();
    v32 = sub_24396FCF8();
    if (os_log_type_enabled(v31, v32))
    {
      v33 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v33 = 0;
      _os_log_impl(&dword_243921000, v31, v32, "Subtask cancelled before pruning the Durable Feature Store.", v33, 2u);
      goto LABEL_43;
    }
LABEL_44:

    return swift_bridgeObjectRelease();
  }
  v65 = v14;
  v44 = sub_24396FA04();
  v45 = *(_QWORD *)(v44 - 8);
  MEMORY[0x24BDAC7A8](v44);
  v47 = (char *)&v60 - ((v46 + 15) & 0xFFFFFFFFFFFFFFF0);
  v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_2572D9E90);
  MEMORY[0x24BDAC7A8](v48);
  v50 = (char *)&v60 - ((v49 + 15) & 0xFFFFFFFFFFFFFFF0);
  LODWORD(v67[0]) = 4;
  BYTE4(v67[0]) = 1;
  sub_243948E48((int *)v67, (uint64_t)v50);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v45 + 56))(v50, 0, 1, v44);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v45 + 48))(v50, 1, v44) == 1)
  {
    sub_24394ADB4((uint64_t)v50, &qword_2572D9E90);
    sub_24396F944();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v45 + 32))(v47, v50, v44);
  }
  sub_243959CE8((uint64_t)v47);
  v51 = (void *)qword_2572D9E80;
  v52 = (void *)sub_24396FB48();
  objc_msgSend(v51, sel_removeObjectForKey_, v52);

  LODWORD(v67[0]) = 3;
  BYTE4(v67[0]) = 1;
  NSUserDefaults.saveComputationDate(_:)((int *)v67);
  v53 = sub_24396FAD0();
  v54 = sub_24396FCF8();
  if (os_log_type_enabled(v53, v54))
  {
    v55 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v55 = 0;
    _os_log_impl(&dword_243921000, v53, v54, "Successfully deleted old durable features", v55, 2u);
    MEMORY[0x2494FDD74](v55, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v45 + 8))(v47, v44);
  return swift_bridgeObjectRelease();
}

void destroy for DurableFeatureManager(id *a1)
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)(a1 + 43));
  swift_bridgeObjectRelease();

}

uint64_t initializeWithCopy for DurableFeatureManager(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  void *v26;
  id v27;
  void (*v29)(uint64_t, uint64_t, uint64_t);
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v4 = *(void **)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  v32 = v4;
  v33 = *(void **)(a2 + 32);
  v34 = *(void **)(a2 + 40);
  *(_QWORD *)(a1 + 32) = v33;
  *(_QWORD *)(a1 + 40) = v34;
  v35 = *(void **)(a2 + 48);
  *(_QWORD *)(a1 + 48) = v35;
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  *(_WORD *)(a1 + 57) = *(_WORD *)(a2 + 57);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_BYTE *)(a1 + 72) = *(_BYTE *)(a2 + 72);
  *(_WORD *)(a1 + 73) = *(_WORD *)(a2 + 73);
  v5 = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = v5;
  v6 = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = v6;
  v7 = *(_QWORD *)(a2 + 120);
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 120) = v7;
  v8 = *(_QWORD *)(a2 + 136);
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  *(_QWORD *)(a1 + 136) = v8;
  v9 = *(_QWORD *)(a2 + 152);
  *(_QWORD *)(a1 + 144) = *(_QWORD *)(a2 + 144);
  *(_QWORD *)(a1 + 152) = v9;
  v10 = *(_QWORD *)(a2 + 168);
  *(_QWORD *)(a1 + 160) = *(_QWORD *)(a2 + 160);
  *(_QWORD *)(a1 + 168) = v10;
  v11 = *(_QWORD *)(a2 + 184);
  *(_QWORD *)(a1 + 176) = *(_QWORD *)(a2 + 176);
  *(_QWORD *)(a1 + 184) = v11;
  v12 = *(_QWORD *)(a2 + 200);
  *(_QWORD *)(a1 + 192) = *(_QWORD *)(a2 + 192);
  *(_QWORD *)(a1 + 200) = v12;
  v13 = *(_QWORD *)(a2 + 216);
  *(_QWORD *)(a1 + 208) = *(_QWORD *)(a2 + 208);
  *(_QWORD *)(a1 + 216) = v13;
  v14 = *(_QWORD *)(a2 + 232);
  *(_QWORD *)(a1 + 224) = *(_QWORD *)(a2 + 224);
  *(_QWORD *)(a1 + 232) = v14;
  v15 = *(_QWORD *)(a2 + 248);
  *(_QWORD *)(a1 + 240) = *(_QWORD *)(a2 + 240);
  *(_QWORD *)(a1 + 248) = v15;
  v16 = *(_QWORD *)(a2 + 264);
  *(_QWORD *)(a1 + 256) = *(_QWORD *)(a2 + 256);
  *(_QWORD *)(a1 + 264) = v16;
  *(_OWORD *)(a1 + 272) = *(_OWORD *)(a2 + 272);
  v17 = *(_QWORD *)(a2 + 296);
  *(_QWORD *)(a1 + 288) = *(_QWORD *)(a2 + 288);
  *(_QWORD *)(a1 + 296) = v17;
  *(_OWORD *)(a1 + 304) = *(_OWORD *)(a2 + 304);
  v18 = *(_QWORD *)(a2 + 328);
  *(_QWORD *)(a1 + 320) = *(_QWORD *)(a2 + 320);
  *(_QWORD *)(a1 + 328) = v18;
  *(_QWORD *)(a1 + 336) = *(_QWORD *)(a2 + 336);
  v30 = a2 + 344;
  v31 = a1 + 344;
  v19 = *(_OWORD *)(a2 + 368);
  *(_OWORD *)(a1 + 368) = v19;
  v20 = v19;
  v29 = **(void (***)(uint64_t, uint64_t, uint64_t))(v19 - 8);
  swift_bridgeObjectRetain();
  v21 = v32;
  v22 = v33;
  v23 = v34;
  v24 = v35;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v29(v31, v30, v20);
  v25 = *(_QWORD *)(a2 + 384);
  v26 = *(void **)(a2 + 392);
  *(_QWORD *)(a1 + 384) = v25;
  *(_QWORD *)(a1 + 392) = v26;
  swift_bridgeObjectRetain();
  v27 = v26;
  return a1;
}

uint64_t assignWithCopy for DurableFeatureManager(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = *(void **)(a2 + 24);
  v5 = *(void **)(a1 + 24);
  *(_QWORD *)(a1 + 24) = v4;
  v6 = v4;

  v7 = *(void **)(a2 + 32);
  v8 = *(void **)(a1 + 32);
  *(_QWORD *)(a1 + 32) = v7;
  v9 = v7;

  v10 = *(void **)(a2 + 40);
  v11 = *(void **)(a1 + 40);
  *(_QWORD *)(a1 + 40) = v10;
  v12 = v10;

  v13 = *(void **)(a2 + 48);
  v14 = *(void **)(a1 + 48);
  *(_QWORD *)(a1 + 48) = v13;
  v15 = v13;

  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  *(_BYTE *)(a1 + 57) = *(_BYTE *)(a2 + 57);
  *(_BYTE *)(a1 + 58) = *(_BYTE *)(a2 + 58);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_BYTE *)(a1 + 72) = *(_BYTE *)(a2 + 72);
  *(_BYTE *)(a1 + 73) = *(_BYTE *)(a2 + 73);
  *(_BYTE *)(a1 + 74) = *(_BYTE *)(a2 + 74);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  *(_QWORD *)(a1 + 136) = *(_QWORD *)(a2 + 136);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 144) = *(_QWORD *)(a2 + 144);
  *(_QWORD *)(a1 + 152) = *(_QWORD *)(a2 + 152);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 160) = *(_QWORD *)(a2 + 160);
  *(_QWORD *)(a1 + 168) = *(_QWORD *)(a2 + 168);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 176) = *(_QWORD *)(a2 + 176);
  *(_QWORD *)(a1 + 184) = *(_QWORD *)(a2 + 184);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 192) = *(_QWORD *)(a2 + 192);
  *(_QWORD *)(a1 + 200) = *(_QWORD *)(a2 + 200);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 208) = *(_QWORD *)(a2 + 208);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 216) = *(_QWORD *)(a2 + 216);
  *(_QWORD *)(a1 + 224) = *(_QWORD *)(a2 + 224);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 232) = *(_QWORD *)(a2 + 232);
  *(_QWORD *)(a1 + 240) = *(_QWORD *)(a2 + 240);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 248) = *(_QWORD *)(a2 + 248);
  *(_QWORD *)(a1 + 256) = *(_QWORD *)(a2 + 256);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 264) = *(_QWORD *)(a2 + 264);
  *(_QWORD *)(a1 + 272) = *(_QWORD *)(a2 + 272);
  *(_QWORD *)(a1 + 280) = *(_QWORD *)(a2 + 280);
  *(_QWORD *)(a1 + 288) = *(_QWORD *)(a2 + 288);
  *(_QWORD *)(a1 + 296) = *(_QWORD *)(a2 + 296);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 304) = *(_QWORD *)(a2 + 304);
  *(_QWORD *)(a1 + 312) = *(_QWORD *)(a2 + 312);
  *(_QWORD *)(a1 + 320) = *(_QWORD *)(a2 + 320);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 328) = *(_QWORD *)(a2 + 328);
  *(_QWORD *)(a1 + 336) = *(_QWORD *)(a2 + 336);
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 344), (uint64_t *)(a2 + 344));
  *(_QWORD *)(a1 + 384) = *(_QWORD *)(a2 + 384);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v16 = *(void **)(a2 + 392);
  v17 = *(void **)(a1 + 392);
  *(_QWORD *)(a1 + 392) = v16;
  v18 = v16;

  return a1;
}

void *__swift_memcpy400_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x190uLL);
}

uint64_t assignWithTake for DurableFeatureManager(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  uint64_t v21;
  void *v22;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v4;
  swift_bridgeObjectRelease();
  v5 = *(void **)(a1 + 24);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);

  v6 = *(void **)(a1 + 32);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);

  v7 = *(void **)(a1 + 40);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);

  v8 = *(void **)(a1 + 48);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);

  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  *(_BYTE *)(a1 + 57) = *(_BYTE *)(a2 + 57);
  *(_BYTE *)(a1 + 58) = *(_BYTE *)(a2 + 58);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_BYTE *)(a1 + 72) = *(_BYTE *)(a2 + 72);
  *(_BYTE *)(a1 + 73) = *(_BYTE *)(a2 + 73);
  *(_BYTE *)(a1 + 74) = *(_BYTE *)(a2 + 74);
  v9 = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = v9;
  swift_bridgeObjectRelease();
  v10 = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = v10;
  swift_bridgeObjectRelease();
  v11 = *(_QWORD *)(a2 + 120);
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 120) = v11;
  swift_bridgeObjectRelease();
  v12 = *(_QWORD *)(a2 + 136);
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  *(_QWORD *)(a1 + 136) = v12;
  swift_bridgeObjectRelease();
  v13 = *(_QWORD *)(a2 + 152);
  *(_QWORD *)(a1 + 144) = *(_QWORD *)(a2 + 144);
  *(_QWORD *)(a1 + 152) = v13;
  swift_bridgeObjectRelease();
  v14 = *(_QWORD *)(a2 + 168);
  *(_QWORD *)(a1 + 160) = *(_QWORD *)(a2 + 160);
  *(_QWORD *)(a1 + 168) = v14;
  swift_bridgeObjectRelease();
  v15 = *(_QWORD *)(a2 + 184);
  *(_QWORD *)(a1 + 176) = *(_QWORD *)(a2 + 176);
  *(_QWORD *)(a1 + 184) = v15;
  swift_bridgeObjectRelease();
  v16 = *(_QWORD *)(a2 + 200);
  *(_QWORD *)(a1 + 192) = *(_QWORD *)(a2 + 192);
  *(_QWORD *)(a1 + 200) = v16;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 208) = *(_QWORD *)(a2 + 208);
  swift_bridgeObjectRelease();
  v17 = *(_QWORD *)(a2 + 224);
  *(_QWORD *)(a1 + 216) = *(_QWORD *)(a2 + 216);
  *(_QWORD *)(a1 + 224) = v17;
  swift_bridgeObjectRelease();
  v18 = *(_QWORD *)(a2 + 240);
  *(_QWORD *)(a1 + 232) = *(_QWORD *)(a2 + 232);
  *(_QWORD *)(a1 + 240) = v18;
  swift_bridgeObjectRelease();
  v19 = *(_QWORD *)(a2 + 256);
  *(_QWORD *)(a1 + 248) = *(_QWORD *)(a2 + 248);
  *(_QWORD *)(a1 + 256) = v19;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 264) = *(_QWORD *)(a2 + 264);
  *(_QWORD *)(a1 + 272) = *(_QWORD *)(a2 + 272);
  *(_OWORD *)(a1 + 280) = *(_OWORD *)(a2 + 280);
  *(_QWORD *)(a1 + 296) = *(_QWORD *)(a2 + 296);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 304) = *(_OWORD *)(a2 + 304);
  *(_QWORD *)(a1 + 320) = *(_QWORD *)(a2 + 320);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 328) = *(_QWORD *)(a2 + 328);
  *(_QWORD *)(a1 + 336) = *(_QWORD *)(a2 + 336);
  __swift_destroy_boxed_opaque_existential_1Tm(a1 + 344);
  v20 = *(_OWORD *)(a2 + 360);
  *(_OWORD *)(a1 + 344) = *(_OWORD *)(a2 + 344);
  *(_OWORD *)(a1 + 360) = v20;
  v21 = *(_QWORD *)(a2 + 384);
  *(_QWORD *)(a1 + 376) = *(_QWORD *)(a2 + 376);
  *(_QWORD *)(a1 + 384) = v21;
  swift_bridgeObjectRelease();
  v22 = *(void **)(a1 + 392);
  *(_QWORD *)(a1 + 392) = *(_QWORD *)(a2 + 392);

  return a1;
}

uint64_t getEnumTagSinglePayload for DurableFeatureManager(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 400))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for DurableFeatureManager(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 392) = 0;
    *(_OWORD *)(result + 248) = 0u;
    *(_OWORD *)(result + 232) = 0u;
    *(_OWORD *)(result + 216) = 0u;
    *(_OWORD *)(result + 200) = 0u;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 376) = 0u;
    *(_OWORD *)(result + 360) = 0u;
    *(_OWORD *)(result + 344) = 0u;
    *(_OWORD *)(result + 328) = 0u;
    *(_OWORD *)(result + 312) = 0u;
    *(_OWORD *)(result + 296) = 0u;
    *(_OWORD *)(result + 280) = 0u;
    *(_OWORD *)(result + 264) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 400) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 16) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 400) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for DurableFeatureManager()
{
  return &type metadata for DurableFeatureManager;
}

void sub_24395B2B4(unint64_t a1, uint64_t a2, _QWORD *a3)
{
  void *v3;
  double v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  unint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  NSObject *v16;
  os_log_type_t v17;
  uint64_t v18;
  _QWORD *v19;
  id v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  double v24;
  uint64_t v25;
  void *v26;
  id v27;
  void *v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t isUniquelyReferenced_nonNull_native;
  unint64_t v32;
  unint64_t v33;
  int v34;
  double v35;
  double v36;
  uint64_t v37;
  NSObject *v38;
  os_log_type_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  int v43;
  void *v44;
  uint64_t v45;
  void (*v46)(char *, uint64_t);
  uint64_t v47;
  double v48;
  uint64_t v49;
  uint64_t v50;
  int v51;
  char *v52;
  int v53;
  unint64_t v54;
  unint64_t v55;

  v8 = sub_24396FA04();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(_QWORD *)(v9 + 64);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v48 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24396F9F8();
  v12 = sub_243954584(a2);
  if (v3)
  {
    (*(void (**)(char *, uint64_t))(v9 + 8))((char *)&v48 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v8);
    if (qword_2572D9D10 != -1)
      swift_once();
    v13 = sub_24396FAE8();
    __swift_project_value_buffer(v13, (uint64_t)qword_2572DA2B0);
    v14 = v3;
    v15 = v3;
    v16 = sub_24396FAD0();
    v17 = sub_24396FD10();
    if (os_log_type_enabled(v16, v17))
    {
      v18 = swift_slowAlloc();
      v19 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v18 = 67109378;
      LODWORD(v54) = a2;
      sub_24396FD94();
      *(_WORD *)(v18 + 8) = 2112;
      v20 = v3;
      v21 = _swift_stdlib_bridgeErrorToNSError();
      v54 = v21;
      sub_24396FD94();
      *v19 = v21;

      _os_log_impl(&dword_243921000, v16, v17, "Failed to compute and send to Biome feature %d. Error: %@", (uint8_t *)v18, 0x12u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2572DA050);
      swift_arrayDestroy();
      MEMORY[0x2494FDD74](v19, -1, -1);
      MEMORY[0x2494FDD74](v18, -1, -1);

    }
    else
    {

    }
    return;
  }
  v22 = v12;
  v48 = *(double *)&a3;
  v49 = v9;
  v52 = (char *)&v48 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v51 = a2;
  v50 = v8;
  if (v12 >> 62)
  {
    swift_bridgeObjectRetain();
    v23 = sub_24396FF20();
    if (!v23)
      goto LABEL_16;
  }
  else
  {
    v23 = *(_QWORD *)((v12 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (!v23)
      goto LABEL_16;
  }
  if (v23 < 1)
  {
    __break(1u);
LABEL_31:
    v48 = v24;
    swift_once();
    v24 = v48;
    goto LABEL_22;
  }
  v25 = 0;
  v26 = *(void **)(a1 + 392);
  do
  {
    if ((v22 & 0xC000000000000001) != 0)
      v27 = (id)MEMORY[0x2494FD69C](v25, v22);
    else
      v27 = *(id *)(v22 + 8 * v25 + 32);
    v28 = v27;
    ++v25;
    objc_msgSend(v26, sel_sendEvent_, v27, *(_QWORD *)&v48);

  }
  while (v23 != v25);
LABEL_16:
  swift_bridgeObjectRelease_n();
  v29 = *(uint64_t **)&v48;
  v30 = **(_QWORD **)&v48;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *v29 = v30;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    isUniquelyReferenced_nonNull_native = (uint64_t)sub_2439648E0(0, *(_QWORD *)(v30 + 16) + 1, 1, (char *)v30);
    v30 = isUniquelyReferenced_nonNull_native;
    *v29 = isUniquelyReferenced_nonNull_native;
  }
  v33 = *(_QWORD *)(v30 + 16);
  v32 = *(_QWORD *)(v30 + 24);
  if (v33 >= v32 >> 1)
  {
    isUniquelyReferenced_nonNull_native = (uint64_t)sub_2439648E0((char *)(v32 > 1), v33 + 1, 1, (char *)v30);
    v30 = isUniquelyReferenced_nonNull_native;
  }
  *(_QWORD *)(v30 + 16) = v33 + 1;
  v34 = v51;
  *(_DWORD *)(v30 + 4 * v33 + 32) = v51;
  *v29 = v30;
  MEMORY[0x24BDAC7A8](isUniquelyReferenced_nonNull_native);
  v11 = (char *)&v48 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24396F9F8();
  sub_24396F98C();
  v4 = v35;
  v23 = 0x2572D9000uLL;
  a1 = 0x2572D9000uLL;
  if ((objc_msgSend((id)objc_opt_self(), sel_isInternalDevice) & 1) == 0)
    goto LABEL_27;
  v24 = 1000.0;
  if (qword_2572D9D10 != -1)
    goto LABEL_31;
LABEL_22:
  v36 = v4 * v24;
  v37 = sub_24396FAE8();
  __swift_project_value_buffer(v37, (uint64_t)qword_2572DA2B0);
  v38 = sub_24396FAD0();
  v39 = sub_24396FD04();
  if (os_log_type_enabled(v38, v39))
  {
    v40 = swift_slowAlloc();
    *(_DWORD *)v40 = 134218240;
    v54 = *(_QWORD *)&v36;
    sub_24396FD94();
    *(_WORD *)(v40 + 12) = 1024;
    LODWORD(v54) = v51;
    sub_24396FD94();
    _os_log_impl(&dword_243921000, v38, v39, "Computation Time: %f ms for feature %d", (uint8_t *)v40, 0x12u);
    MEMORY[0x2494FDD74](v40, -1, -1);
  }

  if (*(_QWORD *)(v23 + 3336) != -1)
    swift_once();
  v41 = *(void **)(a1 + 3712);
  v42 = (void *)sub_24396FC98();
  v54 = 0;
  v55 = 0xE000000000000000;
  sub_24396FE48();
  swift_bridgeObjectRelease();
  v54 = 0xD000000000000010;
  v55 = 0x800000024397AC20;
  v43 = v51;
  v53 = v51;
  sub_24396FF80();
  sub_24396FB90();
  swift_bridgeObjectRelease();
  sub_24396FB90();
  v44 = (void *)sub_24396FB48();
  swift_bridgeObjectRelease();
  objc_msgSend(v41, sel_setValue_forKey_, v42, v44);

  v34 = v43;
LABEL_27:
  v45 = v49;
  if (qword_2572D9D08 != -1)
    swift_once();
  LODWORD(v54) = v34;
  BYTE4(v54) = 0;
  NSUserDefaults.saveComputationDate(_:)((int *)&v54);
  v46 = *(void (**)(char *, uint64_t))(v45 + 8);
  v47 = v50;
  v46(v11, v50);
  v46(v52, v47);
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

double sub_24395B940@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t *v3;
  uint64_t *v4;
  unint64_t v8;
  char v9;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v11;
  double result;
  uint64_t v13;

  v4 = v3;
  swift_bridgeObjectRetain();
  v8 = sub_243942698(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if ((a2 & 1) != 0)
  {
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v11 = *v4;
    v13 = *v4;
    *v4 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_2439464FC();
      v11 = v13;
    }
    swift_bridgeObjectRelease();
    sub_243946A88((__int128 *)(*(_QWORD *)(v11 + 56) + 40 * v8), a3);
    sub_24395BA38(v8, v11);
    *v4 = v11;
    swift_bridgeObjectRelease();
  }
  else
  {
    *(_QWORD *)(a3 + 32) = 0;
    result = 0.0;
    *(_OWORD *)a3 = 0u;
    *(_OWORD *)(a3 + 16) = 0u;
  }
  return result;
}

unint64_t sub_24395BA38(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  _OWORD *v14;
  _OWORD *v15;
  uint64_t v16;
  unint64_t v17;
  __int128 *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_24396FDD0();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        sub_24396FFF8();
        swift_bridgeObjectRetain();
        sub_24396FB84();
        v11 = sub_243970010();
        result = swift_bridgeObjectRelease();
        v12 = v11 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v12 < v8)
            goto LABEL_5;
        }
        else if (v12 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v12)
        {
LABEL_11:
          v13 = *(_QWORD *)(a2 + 48);
          v14 = (_OWORD *)(v13 + 16 * v3);
          v15 = (_OWORD *)(v13 + 16 * v6);
          if (v3 != v6 || v14 >= v15 + 1)
            *v14 = *v15;
          v16 = *(_QWORD *)(a2 + 56);
          v17 = v16 + 40 * v3;
          v18 = (__int128 *)(v16 + 40 * v6);
          if (v3 != v6 || (v3 = v6, v17 >= (unint64_t)v18 + 40))
          {
            v9 = *v18;
            v10 = v18[1];
            *(_QWORD *)(v17 + 32) = *((_QWORD *)v18 + 4);
            *(_OWORD *)v17 = v9;
            *(_OWORD *)(v17 + 16) = v10;
            v3 = v6;
          }
        }
LABEL_5:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v19 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v20 = *v19;
    v21 = (-1 << v3) - 1;
  }
  else
  {
    v19 = (uint64_t *)(v4 + 8 * (result >> 6));
    v21 = *v19;
    v20 = (-1 << result) - 1;
  }
  *v19 = v21 & v20;
  v22 = *(_QWORD *)(a2 + 16);
  v23 = __OFSUB__(v22, 1);
  v24 = v22 - 1;
  if (v23)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v24;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_24395BC20(uint64_t *a1)
{
  uint64_t v2;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v4;
  uint64_t v6[2];

  v2 = *a1;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *a1 = v2;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    sub_24395F49C();
  v4 = *(_QWORD *)(v2 + 16);
  v6[0] = v2 + 32;
  v6[1] = v4;
  sub_24395BE3C(v6);
  return sub_24396FE9C();
}

uint64_t sub_24395BC98(uint64_t *a1, uint64_t (*a2)(uint64_t), unint64_t *a3, uint64_t a4, SEL *a5)
{
  uint64_t v10;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v12;
  uint64_t v14[2];

  v10 = *a1;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *a1 = v10;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v10 = a2(v10);
    *a1 = v10;
  }
  v12 = *(_QWORD *)(v10 + 16);
  v14[0] = v10 + 32;
  v14[1] = v12;
  sub_24395CC14(v14, a3, a4, a5);
  return sub_24396FE9C();
}

_QWORD *sub_24395BD3C(unint64_t a1, void (*a2)(_QWORD *, uint64_t, unint64_t))
{
  uint64_t v4;
  _QWORD *v5;
  int64_t v6;
  uint64_t v7;
  void (*v8)(_QWORD *, uint64_t, unint64_t);

  if (a1 >> 62)
    goto LABEL_10;
  v4 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v4)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  while (1)
  {
    if (v4 <= 0)
    {
      v5 = (_QWORD *)MEMORY[0x24BEE4AF8];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_2572DA020);
      v5 = (_QWORD *)swift_allocObject();
      v6 = _swift_stdlib_malloc_size(v5);
      v7 = v6 - 32;
      if (v6 < 32)
        v7 = v6 - 25;
      v5[2] = v4;
      v5[3] = (2 * (v7 >> 3)) | 1;
    }
    swift_bridgeObjectRetain();
    a2(v5 + 4, v4, a1);
    a2 = v8;
    swift_bridgeObjectRelease();
    if (a2 == (void (*)(_QWORD *, uint64_t, unint64_t))v4)
      break;
    __break(1u);
LABEL_10:
    swift_bridgeObjectRetain();
    v4 = sub_24396FF20();
    swift_bridgeObjectRelease();
    if (!v4)
      return (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  return v5;
}

void sub_24395BE3C(uint64_t *a1)
{
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  _QWORD *v21;
  _QWORD *v22;
  uint64_t *v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  char *v29;
  id v30;
  void (*v31)(uint64_t, id);
  id *v32;
  void *v33;
  id v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  char *v40;
  id v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  char *v47;
  id v48;
  int v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  char *v57;
  void **v58;
  char *v59;
  void **v60;
  void *v61;
  void **v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  _QWORD *v66;
  uint64_t v67;
  unsigned int (*v68)(char *, uint64_t, uint64_t);
  uint64_t v69;
  unint64_t v70;
  void (*v71)(char *, _QWORD, uint64_t, uint64_t);
  char *v72;
  char v73;
  void (*v74)(char *, uint64_t);
  void **v75;
  void *v76;
  unint64_t v77;
  unint64_t v78;
  uint64_t v79;
  char *v80;
  unint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  char v85;
  unint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  BOOL v92;
  unint64_t v93;
  uint64_t *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t *v99;
  uint64_t v100;
  uint64_t v101;
  BOOL v102;
  uint64_t v103;
  char v104;
  uint64_t *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  BOOL v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t *v120;
  uint64_t v121;
  char *v122;
  uint64_t v123;
  unint64_t *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t *v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  char *v132;
  char *v133;
  uint64_t *v134;
  uint64_t v135;
  char **v136;
  uint64_t v137;
  void **v138;
  uint64_t v139;
  uint64_t *v140;
  void **v141;
  char *v142;
  uint64_t *v143;
  uint64_t *v144;
  uint64_t *v145;
  id v146;
  id v147;
  uint64_t v148;

  v6 = v1;
  v8 = a1[1];
  v9 = sub_24396FF74();
  if (v9 >= v8)
  {
    if (v8 < 0)
      goto LABEL_145;
    if (v8)
      sub_24395D5A8(0, v8, 1, a1);
    return;
  }
  if (v8 >= 0)
    v10 = v8;
  else
    v10 = v8 + 1;
  if (v8 < -1)
    goto LABEL_165;
  v131 = v9;
  v137 = v1;
  v128 = a1;
  if (v8 < 2)
  {
    v5 = (char *)MEMORY[0x24BEE4AF8];
    v148 = MEMORY[0x24BEE4AF8];
    v136 = (char **)((MEMORY[0x24BEE4AF8] & 0xFFFFFFFFFFFFFF8) + 32);
    if (v8 != 1)
    {
      v16 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
LABEL_111:
      if (v16 >= 2)
      {
        v6 = *v128;
        do
        {
          v8 = v16 - 2;
          if (v16 < 2)
            goto LABEL_140;
          if (!v6)
            goto LABEL_160;
          v2 = *(_QWORD *)&v5[16 * v8 + 32];
          v3 = *(_QWORD *)&v5[16 * v16 + 24];
          v123 = v137;
          sub_24395DA90((id *)(v6 + 8 * v2), (id *)(v6 + 8 * *(_QWORD *)&v5[16 * v16 + 16]), (id *)(v6 + 8 * v3), v136);
          v137 = v123;
          if (v123)
            break;
          if (v3 < (uint64_t)v2)
            goto LABEL_141;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v5 = sub_24395E8C0((uint64_t)v5);
          if ((unint64_t)v8 >= *((_QWORD *)v5 + 2))
            goto LABEL_142;
          v124 = (unint64_t *)&v5[16 * v8 + 32];
          *v124 = v2;
          v124[1] = v3;
          v8 = *((_QWORD *)v5 + 2);
          if (v16 > v8)
            goto LABEL_143;
          v2 = v8 - 1;
          memmove(&v5[16 * v16 + 16], &v5[16 * v16 + 32], 16 * (v8 - v16));
          *((_QWORD *)v5 + 2) = v8 - 1;
          v16 = v8 - 1;
        }
        while ((unint64_t)v8 > 2);
      }
LABEL_122:
      swift_bridgeObjectRelease();
      *(_QWORD *)((v148 & 0xFFFFFFFFFFFFF8) + 0x10) = 0;
      sub_24396FC2C();
      swift_bridgeObjectRelease();
      return;
    }
  }
  else
  {
    v11 = v10 >> 1;
    sub_24393E124(0, &qword_2572DA0E0);
    v12 = sub_24396FC44();
    *(_QWORD *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10) = v11;
    v136 = (char **)((v12 & 0xFFFFFFFFFFFFFF8) + 32);
    v148 = v12;
  }
  v13 = 0;
  v14 = *a1;
  v15 = *a1 + 16;
  v129 = *a1 - 8;
  v130 = v15;
  v5 = (char *)MEMORY[0x24BEE4AF8];
  v134 = (uint64_t *)v8;
  v139 = v14;
  while (1)
  {
    v6 = v13 + 1;
    v135 = v13;
    if (v13 + 1 < v8)
    {
      v17 = *(void **)(v14 + 8 * v6);
      v18 = *(void **)(v14 + 8 * v13);
      v141 = v17;
      v2 = v18;
      v3 = (uint64_t)objc_msgSend((id)v2, sel_startDate);
      v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_2572D9E90);
      v140 = &v127;
      MEMORY[0x24BDAC7A8](v19);
      v147 = v20;
      v8 = (uint64_t)&v127 - (((unint64_t)v20 + 15) & 0xFFFFFFFFFFFFFFF0);
      if (!v3)
        goto LABEL_161;
      v132 = v5;
      v21 = (_QWORD *)sub_24396FA04();
      v22 = (_QWORD *)*(v21 - 1);
      MEMORY[0x24BDAC7A8](v21);
      v144 = v23;
      v24 = (char *)&v127 - (((unint64_t)v23 + 15) & 0xFFFFFFFFFFFFFFF0);
      sub_24396F9D4();

      v143 = (uint64_t *)v22[4];
      ((void (*)(uint64_t, char *, _QWORD *))v143)(v8, v24, v21);
      v145 = (uint64_t *)v22[7];
      ((void (*)(uint64_t, _QWORD, uint64_t, _QWORD *))v145)(v8, 0, 1, v21);
      v142 = (char *)v22[6];
      if (((unsigned int (*)(uint64_t, uint64_t, _QWORD *))v142)(v8, 1, v21) == 1)
        goto LABEL_162;
      v146 = v21;
      v4 = (uint64_t)objc_msgSend(v141, sel_startDate);
      v25 = MEMORY[0x24BDAC7A8](v4);
      v3 = (uint64_t)&v127 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
      if (!v25)
        goto LABEL_163;
      MEMORY[0x24BDAC7A8](v25);
      v28 = (char *)&v127 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
      sub_24396F9D4();

      v29 = v28;
      v30 = v146;
      ((void (*)(uint64_t, char *, id))v143)(v3, v29, v146);
      ((void (*)(uint64_t, _QWORD, uint64_t, id))v145)(v3, 0, 1, v30);
      if (((unsigned int (*)(uint64_t, uint64_t, id))v142)(v3, 1, v30) == 1)
        goto LABEL_164;
      LODWORD(v138) = sub_24396F9B0();
      v31 = (void (*)(uint64_t, id))v22[1];
      v31(v3, v30);
      v133 = (char *)v31;
      v31(v8, v30);

      v8 = (uint64_t)v134;
      v13 = v135;
      v6 = v135 + 2;
      if (v135 + 2 < (uint64_t)v134)
      {
        v32 = (id *)(v130 + 8 * v135);
        while (1)
        {
          v140 = (uint64_t *)v6;
          v33 = *(v32 - 1);
          v34 = *v32;
          v35 = v33;
          v4 = (uint64_t)objc_msgSend(v35, sel_startDate);
          v8 = (uint64_t)&v127;
          v36 = MEMORY[0x24BDAC7A8](v4);
          v3 = (uint64_t)&v127 - ((v37 + 15) & 0xFFFFFFFFFFFFFFF0);
          if (!v36)
            goto LABEL_155;
          MEMORY[0x24BDAC7A8](v36);
          v39 = (char *)&v127 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0);
          sub_24396F9D4();

          v40 = v39;
          v41 = v146;
          ((void (*)(uint64_t, char *, id))v143)(v3, v40, v146);
          ((void (*)(uint64_t, _QWORD, uint64_t, id))v145)(v3, 0, 1, v41);
          if (((unsigned int (*)(uint64_t, uint64_t, id))v142)(v3, 1, v41) == 1)
            goto LABEL_156;
          v141 = (void **)v35;
          v2 = (unint64_t)v34;
          v42 = objc_msgSend(v34, sel_startDate);
          v43 = MEMORY[0x24BDAC7A8](v42);
          v4 = (uint64_t)&v127 - ((v44 + 15) & 0xFFFFFFFFFFFFFFF0);
          if (!v43)
            goto LABEL_157;
          MEMORY[0x24BDAC7A8](v43);
          v46 = (char *)&v127 - ((v45 + 15) & 0xFFFFFFFFFFFFFFF0);
          sub_24396F9D4();

          v47 = v46;
          v48 = v146;
          ((void (*)(uint64_t, char *, id))v143)(v4, v47, v146);
          ((void (*)(uint64_t, _QWORD, uint64_t, id))v145)(v4, 0, 1, v48);
          if (((unsigned int (*)(uint64_t, uint64_t, id))v142)(v4, 1, v48) == 1)
            goto LABEL_158;
          v49 = sub_24396F9B0();
          v50 = v4;
          v4 = (uint64_t)v133;
          ((void (*)(uint64_t, id))v133)(v50, v48);
          ((void (*)(uint64_t, id))v4)(v3, v48);

          v14 = v139;
          if (((v138 ^ v49) & 1) != 0)
            break;
          v6 = (uint64_t)v140 + 1;
          ++v32;
          v8 = (uint64_t)v134;
          if (v134 == (uint64_t *)((char *)v140 + 1))
          {
            v6 = (uint64_t)v134;
            goto LABEL_30;
          }
        }
        v8 = (uint64_t)v134;
        v6 = (uint64_t)v140;
LABEL_30:
        v13 = v135;
      }
      v5 = v132;
      if ((v138 & 1) != 0)
      {
        if (v6 < v13)
          goto LABEL_146;
        if (v13 < v6)
        {
          v51 = (uint64_t *)(v129 + 8 * v6);
          v52 = v13;
          v53 = v6;
          v54 = v52;
          v55 = (uint64_t *)(v14 + 8 * v52);
          do
          {
            if (v54 != --v53)
            {
              if (!v14)
                goto LABEL_159;
              v56 = *v55;
              *v55 = *v51;
              *v51 = v56;
            }
            ++v54;
            --v51;
            ++v55;
          }
          while (v54 < v53);
          v13 = v135;
        }
      }
    }
    if (v6 >= v8)
      goto LABEL_61;
    if (__OFSUB__(v6, v13))
      goto LABEL_144;
    if (v6 - v13 >= v131)
    {
      v13 = v135;
      goto LABEL_61;
    }
    v57 = (char *)(v135 + v131);
    if (__OFADD__(v135, v131))
      goto LABEL_147;
    v13 = v135;
    if ((uint64_t)v57 >= v8)
      v57 = (char *)v8;
    if ((uint64_t)v57 < v135)
      break;
    if ((char *)v6 != v57)
    {
      v132 = v5;
      v133 = v57;
      v58 = (void **)(v129 + 8 * v6);
      do
      {
        v61 = *(void **)(v14 + 8 * v6);
        v62 = v58;
        v140 = (uint64_t *)v6;
        v138 = v58;
        while (1)
        {
          v141 = v62;
          v142 = (char *)v13;
          v63 = *v62;
          v147 = v61;
          v146 = v63;
          v4 = (uint64_t)objc_msgSend(v146, sel_startDate);
          v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_2572D9E90);
          v145 = &v127;
          v65 = *(_QWORD *)(*(_QWORD *)(v64 - 8) + 64);
          MEMORY[0x24BDAC7A8](v64);
          v2 = (unint64_t)&v127 - ((v65 + 15) & 0xFFFFFFFFFFFFFFF0);
          if (!v4)
            goto LABEL_151;
          v3 = sub_24396FA04();
          v66 = *(_QWORD **)(v3 - 8);
          v67 = v66[8];
          MEMORY[0x24BDAC7A8](v3);
          sub_24396F9D4();

          v8 = v66[4];
          ((void (*)(char *, char *, uint64_t))v8)((char *)&v127 - ((v65 + 15) & 0xFFFFFFFFFFFFFFF0), (char *)&v127 - ((v67 + 15) & 0xFFFFFFFFFFFFFFF0), v3);
          v6 = v66[7];
          ((void (*)(char *, _QWORD, uint64_t, uint64_t))v6)((char *)&v127 - ((v65 + 15) & 0xFFFFFFFFFFFFFFF0), 0, 1, v3);
          v68 = (unsigned int (*)(char *, uint64_t, uint64_t))v66[6];
          if (v68((char *)&v127 - ((v65 + 15) & 0xFFFFFFFFFFFFFFF0), 1, v3) == 1)
            goto LABEL_152;
          v4 = (uint64_t)objc_msgSend(v147, sel_startDate);
          v144 = &v127;
          v69 = MEMORY[0x24BDAC7A8](v4);
          v5 = (char *)&v127 - ((v65 + 15) & 0xFFFFFFFFFFFFFFF0);
          if (!v69)
            goto LABEL_149;
          v143 = &v127;
          MEMORY[0x24BDAC7A8](v69);
          v70 = (v67 + 15) & 0xFFFFFFFFFFFFFFF0;
          v71 = (void (*)(char *, _QWORD, uint64_t, uint64_t))v6;
          v72 = (char *)&v127 - v70;
          sub_24396F9D4();

          ((void (*)(char *, char *, uint64_t))v8)(v5, v72, v3);
          v71(v5, 0, 1, v3);
          if (v68(v5, 1, v3) == 1)
            goto LABEL_150;
          v73 = sub_24396F9B0();
          v74 = (void (*)(char *, uint64_t))v66[1];
          v74(v5, v3);
          v74((char *)v2, v3);

          v14 = v139;
          if ((v73 & 1) == 0)
            break;
          v60 = v138;
          if (!v139)
            goto LABEL_153;
          v59 = (char *)v140;
          v75 = v141;
          v76 = *v141;
          v61 = v141[1];
          *v141 = v61;
          v75[1] = v76;
          v62 = v75 - 1;
          v13 = (uint64_t)(v142 + 1);
          if (v59 == v142 + 1)
            goto LABEL_50;
        }
        v59 = (char *)v140;
        v60 = v138;
LABEL_50:
        v6 = (uint64_t)(v59 + 1);
        v58 = v60 + 1;
        v13 = v135;
      }
      while ((char *)v6 != v133);
      v5 = v132;
      v6 = (uint64_t)v133;
      if ((uint64_t)v133 < v135)
        goto LABEL_139;
      goto LABEL_62;
    }
LABEL_61:
    if (v6 < v13)
      goto LABEL_139;
LABEL_62:
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v5 = sub_24395E678(0, *((_QWORD *)v5 + 2) + 1, 1, v5);
    v78 = *((_QWORD *)v5 + 2);
    v77 = *((_QWORD *)v5 + 3);
    v16 = v78 + 1;
    v79 = v135;
    v140 = (uint64_t *)v6;
    if (v78 >= v77 >> 1)
    {
      v122 = sub_24395E678((char *)(v77 > 1), v78 + 1, 1, v5);
      v79 = v135;
      v5 = v122;
    }
    *((_QWORD *)v5 + 2) = v16;
    v6 = (uint64_t)(v5 + 32);
    v80 = &v5[16 * v78 + 32];
    *(_QWORD *)v80 = v79;
    *((_QWORD *)v80 + 1) = v140;
    if (v78)
    {
      while (1)
      {
        v81 = v16 - 1;
        if (v16 >= 4)
        {
          v86 = v6 + 16 * v16;
          v87 = *(_QWORD *)(v86 - 64);
          v88 = *(_QWORD *)(v86 - 56);
          v92 = __OFSUB__(v88, v87);
          v89 = v88 - v87;
          if (v92)
            goto LABEL_128;
          v91 = *(_QWORD *)(v86 - 48);
          v90 = *(_QWORD *)(v86 - 40);
          v92 = __OFSUB__(v90, v91);
          v84 = v90 - v91;
          v85 = v92;
          if (v92)
            goto LABEL_129;
          v93 = v16 - 2;
          v94 = (uint64_t *)(v6 + 16 * (v16 - 2));
          v96 = *v94;
          v95 = v94[1];
          v92 = __OFSUB__(v95, v96);
          v97 = v95 - v96;
          if (v92)
            goto LABEL_131;
          v92 = __OFADD__(v84, v97);
          v98 = v84 + v97;
          if (v92)
            goto LABEL_134;
          if (v98 >= v89)
          {
            v116 = (uint64_t *)(v6 + 16 * v81);
            v118 = *v116;
            v117 = v116[1];
            v92 = __OFSUB__(v117, v118);
            v119 = v117 - v118;
            if (v92)
              goto LABEL_138;
            v109 = v84 < v119;
            goto LABEL_98;
          }
        }
        else
        {
          if (v16 != 3)
          {
            v110 = *((_QWORD *)v5 + 4);
            v111 = *((_QWORD *)v5 + 5);
            v92 = __OFSUB__(v111, v110);
            v103 = v111 - v110;
            v104 = v92;
            goto LABEL_92;
          }
          v83 = *((_QWORD *)v5 + 4);
          v82 = *((_QWORD *)v5 + 5);
          v92 = __OFSUB__(v82, v83);
          v84 = v82 - v83;
          v85 = v92;
        }
        if ((v85 & 1) != 0)
          goto LABEL_130;
        v93 = v16 - 2;
        v99 = (uint64_t *)(v6 + 16 * (v16 - 2));
        v101 = *v99;
        v100 = v99[1];
        v102 = __OFSUB__(v100, v101);
        v103 = v100 - v101;
        v104 = v102;
        if (v102)
          goto LABEL_133;
        v105 = (uint64_t *)(v6 + 16 * v81);
        v107 = *v105;
        v106 = v105[1];
        v92 = __OFSUB__(v106, v107);
        v108 = v106 - v107;
        if (v92)
          goto LABEL_136;
        if (__OFADD__(v103, v108))
          goto LABEL_137;
        if (v103 + v108 >= v84)
        {
          v109 = v84 < v108;
LABEL_98:
          if (v109)
            v81 = v93;
          goto LABEL_100;
        }
LABEL_92:
        if ((v104 & 1) != 0)
          goto LABEL_132;
        v112 = (uint64_t *)(v6 + 16 * v81);
        v114 = *v112;
        v113 = v112[1];
        v92 = __OFSUB__(v113, v114);
        v115 = v113 - v114;
        if (v92)
          goto LABEL_135;
        if (v115 < v103)
          goto LABEL_14;
LABEL_100:
        v2 = v81 - 1;
        if (v81 - 1 >= v16)
        {
          __break(1u);
LABEL_125:
          __break(1u);
LABEL_126:
          __break(1u);
LABEL_127:
          __break(1u);
LABEL_128:
          __break(1u);
LABEL_129:
          __break(1u);
LABEL_130:
          __break(1u);
LABEL_131:
          __break(1u);
LABEL_132:
          __break(1u);
LABEL_133:
          __break(1u);
LABEL_134:
          __break(1u);
LABEL_135:
          __break(1u);
LABEL_136:
          __break(1u);
LABEL_137:
          __break(1u);
LABEL_138:
          __break(1u);
LABEL_139:
          __break(1u);
LABEL_140:
          __break(1u);
LABEL_141:
          __break(1u);
LABEL_142:
          __break(1u);
LABEL_143:
          __break(1u);
LABEL_144:
          __break(1u);
LABEL_145:
          __break(1u);
LABEL_146:
          __break(1u);
LABEL_147:
          __break(1u);
          goto LABEL_148;
        }
        if (!v14)
          goto LABEL_154;
        v120 = (uint64_t *)(v6 + 16 * v2);
        v3 = *v120;
        v8 = v6 + 16 * v81;
        v4 = *(_QWORD *)(v8 + 8);
        v121 = v137;
        sub_24395DA90((id *)(v14 + 8 * *v120), (id *)(v14 + 8 * *(_QWORD *)v8), (id *)(v14 + 8 * v4), v136);
        v137 = v121;
        if (v121)
          goto LABEL_122;
        if (v4 < v3)
          goto LABEL_125;
        if (v81 > *((_QWORD *)v5 + 2))
          goto LABEL_126;
        *v120 = v3;
        *(_QWORD *)(v6 + 16 * v2 + 8) = v4;
        v2 = *((_QWORD *)v5 + 2);
        if (v81 >= v2)
          goto LABEL_127;
        v16 = v2 - 1;
        memmove((void *)(v6 + 16 * v81), (const void *)(v8 + 16), 16 * (v2 - 1 - v81));
        *((_QWORD *)v5 + 2) = v2 - 1;
        if (v2 <= 2)
          goto LABEL_14;
      }
    }
    v16 = 1;
LABEL_14:
    v8 = (uint64_t)v134;
    v13 = (uint64_t)v140;
    if ((uint64_t)v140 >= (uint64_t)v134)
      goto LABEL_111;
  }
LABEL_148:
  __break(1u);
LABEL_149:
  ((void (*)(char *, uint64_t, uint64_t, uint64_t))v6)(v5, 1, 1, v3);
LABEL_150:
  __break(1u);
LABEL_151:
  v125 = sub_24396FA04();
  (*(void (**)(unint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v125 - 8) + 56))(v2, 1, 1, v125);
LABEL_152:
  __break(1u);
LABEL_153:
  __break(1u);
LABEL_154:
  __break(1u);
LABEL_155:
  ((void (*)(uint64_t, uint64_t, uint64_t, id))v145)(v3, 1, 1, v146);
LABEL_156:
  __break(1u);
LABEL_157:
  ((void (*)(uint64_t, uint64_t, uint64_t, id))v145)(v4, 1, 1, v146);
LABEL_158:
  __break(1u);
LABEL_159:
  __break(1u);
LABEL_160:
  __break(1u);
LABEL_161:
  v126 = sub_24396FA04();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v126 - 8) + 56))(v8, 1, 1, v126);
LABEL_162:
  __break(1u);
LABEL_163:
  ((void (*)(uint64_t, uint64_t, uint64_t, id))v145)(v3, 1, 1, v146);
LABEL_164:
  __break(1u);
LABEL_165:
  sub_24396FF08();
  __break(1u);
}

char *sub_24395CC14(uint64_t *a1, unint64_t *a2, uint64_t a3, SEL *a4)
{
  uint64_t v4;
  uint64_t v7;
  char *result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  void *v18;
  SEL *v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  BOOL v32;
  id *v33;
  int v34;
  void *v35;
  id v36;
  id v37;
  id v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  void *v58;
  id v59;
  id v60;
  id v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  id v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  char v72;
  void *v73;
  char *v74;
  unint64_t v75;
  unint64_t v76;
  char *v77;
  char *v78;
  unint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  char v83;
  char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  BOOL v90;
  unint64_t v91;
  char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  char *v97;
  uint64_t v98;
  uint64_t v99;
  BOOL v100;
  uint64_t v101;
  char v102;
  char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  BOOL v107;
  uint64_t v108;
  uint64_t v109;
  char *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  char *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  unint64_t v118;
  SEL *v119;
  char *v120;
  char *v121;
  char *v122;
  uint64_t v123;
  char *v124;
  unint64_t v125;
  char *v126;
  uint64_t v127;
  unint64_t v128;
  char *v129;
  uint64_t v130;
  unint64_t v131;
  char *v132;
  uint64_t v133;
  uint64_t v134;
  char *v135;
  unint64_t v136;
  uint64_t v137;
  uint64_t v138;
  char *v139;
  char *v140;
  char *v141;
  char *v143;
  uint64_t v144;
  uint64_t v145;
  int v146;
  uint64_t v147;
  void **v148;
  uint64_t v149;
  SEL *v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;

  v7 = a1[1];
  result = (char *)sub_24396FF74();
  if ((uint64_t)result >= v7)
  {
    if (v7 < 0)
      goto LABEL_158;
    if (v7)
      return sub_24395D8E4(0, (char *)v7, (char *)1, a1, a4);
  }
  else
  {
    if (v7 >= 0)
      v9 = v7;
    else
      v9 = v7 + 1;
    if (v7 < -1)
    {
LABEL_172:
      result = (char *)sub_24396FF08();
      __break(1u);
    }
    else
    {
      v139 = result;
      v145 = v7;
      v149 = v4;
      if (v7 >= 2)
      {
        v10 = v9 >> 1;
        sub_24393E124(0, a2);
        v11 = sub_24396FC44();
        *(_QWORD *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10) = v10;
        v148 = (void **)((v11 & 0xFFFFFFFFFFFFFF8) + 32);
        v155 = v11;
LABEL_12:
        v13 = 0;
        v14 = *a1;
        v137 = *a1 + 16;
        v138 = *a1 - 8;
        v12 = (char *)MEMORY[0x24BEE4AF8];
        v150 = a4;
        v15 = v145;
        v151 = *a1;
        while (1)
        {
          v17 = v13 + 1;
          v144 = v13;
          if (v13 + 1 >= v15)
            goto LABEL_49;
          v140 = v12;
          v18 = *(void **)(v14 + 8 * v13);
          v19 = a4;
          v20 = *(id *)(v14 + 8 * v17);
          v21 = v18;
          v22 = objc_msgSend(v20, *v19);
          if (!v22)
            goto LABEL_170;
          v23 = v22;
          v24 = sub_24396FB60();
          v26 = v25;

          v27 = objc_msgSend(v21, *v19);
          if (!v27)
          {
LABEL_171:
            __break(1u);
            goto LABEL_172;
          }
          v28 = v27;
          v29 = sub_24396FB60();
          v31 = v30;

          v32 = v24 == v29 && v26 == v31;
          v13 = v144;
          if (v32)
            v146 = 0;
          else
            v146 = sub_24396FF8C();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();

          v17 = v144 + 2;
          if (v144 + 2 >= v145)
            goto LABEL_40;
          v33 = (id *)(v137 + 8 * v144);
          while (1)
          {
            v152 = v17;
            v35 = *(v33 - 1);
            v36 = *v33;
            v37 = v35;
            v38 = objc_msgSend(v36, *v150);
            if (!v38)
              goto LABEL_166;
            v39 = v38;
            v40 = sub_24396FB60();
            v42 = v41;

            v43 = objc_msgSend(v37, *v150);
            if (!v43)
              goto LABEL_167;
            v44 = v43;
            v45 = sub_24396FB60();
            v47 = v46;

            if (v40 == v45 && v42 == v47)
            {

              swift_bridgeObjectRelease_n();
              if ((v146 & 1) != 0)
              {
                a4 = v150;
                v14 = v151;
                v12 = v140;
                v17 = v152;
                v13 = v144;
                goto LABEL_41;
              }
              goto LABEL_27;
            }
            v34 = sub_24396FF8C();

            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            if (((v146 ^ v34) & 1) != 0)
              break;
LABEL_27:
            v17 = v152 + 1;
            ++v33;
            if (v145 == v152 + 1)
            {
              v17 = v145;
              goto LABEL_39;
            }
          }
          v17 = v152;
LABEL_39:
          v13 = v144;
LABEL_40:
          a4 = v150;
          v14 = v151;
          v12 = v140;
          if ((v146 & 1) != 0)
          {
LABEL_41:
            if (v17 < v13)
              goto LABEL_159;
            if (v13 < v17)
            {
              v49 = (uint64_t *)(v138 + 8 * v17);
              v50 = v17;
              v51 = v13;
              v52 = (uint64_t *)(v14 + 8 * v13);
              do
              {
                if (v51 != --v50)
                {
                  if (!v14)
                    goto LABEL_168;
                  v53 = *v52;
                  *v52 = *v49;
                  *v49 = v53;
                }
                ++v51;
                --v49;
                ++v52;
              }
              while (v51 < v50);
            }
          }
LABEL_49:
          if (v17 < v145)
          {
            if (__OFSUB__(v17, v13))
              goto LABEL_157;
            if (v17 - v13 < (uint64_t)v139)
            {
              if (__OFADD__(v13, v139))
                goto LABEL_160;
              v54 = (char *)v145;
              if ((uint64_t)&v139[v13] < v145)
                v54 = &v139[v13];
              if ((uint64_t)v54 >= v13)
              {
                if ((char *)v17 != v54)
                {
                  v141 = v12;
                  v55 = v138 + 8 * v17;
                  v143 = v54;
                  do
                  {
                    v57 = *(void **)(v14 + 8 * v17);
                    v147 = v55;
                    v153 = v17;
                    while (1)
                    {
                      v58 = *(void **)v55;
                      v59 = v57;
                      v60 = v58;
                      v61 = objc_msgSend(v59, *a4);
                      if (!v61)
                        goto LABEL_163;
                      v62 = v61;
                      v63 = sub_24396FB60();
                      v65 = v64;

                      v66 = objc_msgSend(v60, *a4);
                      if (!v66)
                        goto LABEL_162;
                      v67 = v66;
                      v68 = sub_24396FB60();
                      v70 = v69;

                      if (v63 == v68 && v65 == v70)
                        break;
                      v72 = sub_24396FF8C();

                      swift_bridgeObjectRelease();
                      swift_bridgeObjectRelease();
                      if ((v72 & 1) == 0)
                        goto LABEL_59;
                      a4 = v150;
                      v14 = v151;
                      v56 = v153;
                      if (!v151)
                        goto LABEL_164;
                      v73 = *(void **)v55;
                      v57 = *(void **)(v55 + 8);
                      *(_QWORD *)v55 = v57;
                      *(_QWORD *)(v55 + 8) = v73;
                      v55 -= 8;
                      if (v153 == ++v13)
                        goto LABEL_60;
                    }

                    swift_bridgeObjectRelease_n();
LABEL_59:
                    a4 = v150;
                    v14 = v151;
                    v56 = v153;
LABEL_60:
                    v17 = v56 + 1;
                    v55 = v147 + 8;
                    v13 = v144;
                  }
                  while ((char *)v17 != v143);
                  v17 = (uint64_t)v143;
                  v12 = v141;
                }
                goto LABEL_73;
              }
LABEL_161:
              __break(1u);
LABEL_162:
              __break(1u);
LABEL_163:
              __break(1u);
LABEL_164:
              __break(1u);
LABEL_165:
              __break(1u);
LABEL_166:
              __break(1u);
LABEL_167:
              __break(1u);
LABEL_168:
              __break(1u);
LABEL_169:
              __break(1u);
LABEL_170:
              __break(1u);
              goto LABEL_171;
            }
          }
LABEL_73:
          if (v17 < v13)
            goto LABEL_152;
          v74 = v12;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) != 0)
            v12 = v74;
          else
            v12 = sub_24395E678(0, *((_QWORD *)v74 + 2) + 1, 1, v74);
          v76 = *((_QWORD *)v12 + 2);
          v75 = *((_QWORD *)v12 + 3);
          v16 = v76 + 1;
          v14 = v151;
          if (v76 >= v75 >> 1)
          {
            v129 = sub_24395E678((char *)(v75 > 1), v76 + 1, 1, v12);
            v14 = v151;
            v12 = v129;
          }
          *((_QWORD *)v12 + 2) = v16;
          v77 = v12 + 32;
          v78 = &v12[16 * v76 + 32];
          *(_QWORD *)v78 = v144;
          *((_QWORD *)v78 + 1) = v17;
          v154 = v17;
          if (v76)
          {
            while (2)
            {
              v79 = v16 - 1;
              if (v16 >= 4)
              {
                v84 = &v77[16 * v16];
                v85 = *((_QWORD *)v84 - 8);
                v86 = *((_QWORD *)v84 - 7);
                v90 = __OFSUB__(v86, v85);
                v87 = v86 - v85;
                if (v90)
                  goto LABEL_141;
                v89 = *((_QWORD *)v84 - 6);
                v88 = *((_QWORD *)v84 - 5);
                v90 = __OFSUB__(v88, v89);
                v82 = v88 - v89;
                v83 = v90;
                if (v90)
                  goto LABEL_142;
                v91 = v16 - 2;
                v92 = &v77[16 * v16 - 32];
                v94 = *(_QWORD *)v92;
                v93 = *((_QWORD *)v92 + 1);
                v90 = __OFSUB__(v93, v94);
                v95 = v93 - v94;
                if (v90)
                  goto LABEL_144;
                v90 = __OFADD__(v82, v95);
                v96 = v82 + v95;
                if (v90)
                  goto LABEL_147;
                if (v96 >= v87)
                {
                  v114 = &v77[16 * v79];
                  v116 = *(_QWORD *)v114;
                  v115 = *((_QWORD *)v114 + 1);
                  v90 = __OFSUB__(v115, v116);
                  v117 = v115 - v116;
                  if (v90)
                    goto LABEL_151;
                  v107 = v82 < v117;
                }
                else
                {
LABEL_92:
                  if ((v83 & 1) != 0)
                    goto LABEL_143;
                  v91 = v16 - 2;
                  v97 = &v77[16 * v16 - 32];
                  v99 = *(_QWORD *)v97;
                  v98 = *((_QWORD *)v97 + 1);
                  v100 = __OFSUB__(v98, v99);
                  v101 = v98 - v99;
                  v102 = v100;
                  if (v100)
                    goto LABEL_146;
                  v103 = &v77[16 * v79];
                  v105 = *(_QWORD *)v103;
                  v104 = *((_QWORD *)v103 + 1);
                  v90 = __OFSUB__(v104, v105);
                  v106 = v104 - v105;
                  if (v90)
                    goto LABEL_149;
                  if (__OFADD__(v101, v106))
                    goto LABEL_150;
                  if (v101 + v106 < v82)
                    goto LABEL_104;
                  v107 = v82 < v106;
                }
                if (v107)
                  v79 = v91;
              }
              else
              {
                if (v16 == 3)
                {
                  v81 = *((_QWORD *)v12 + 4);
                  v80 = *((_QWORD *)v12 + 5);
                  v90 = __OFSUB__(v80, v81);
                  v82 = v80 - v81;
                  v83 = v90;
                  goto LABEL_92;
                }
                v108 = *((_QWORD *)v12 + 4);
                v109 = *((_QWORD *)v12 + 5);
                v90 = __OFSUB__(v109, v108);
                v101 = v109 - v108;
                v102 = v90;
LABEL_104:
                if ((v102 & 1) != 0)
                  goto LABEL_145;
                v110 = &v77[16 * v79];
                v112 = *(_QWORD *)v110;
                v111 = *((_QWORD *)v110 + 1);
                v90 = __OFSUB__(v111, v112);
                v113 = v111 - v112;
                if (v90)
                  goto LABEL_148;
                if (v113 < v101)
                  goto LABEL_14;
              }
              v118 = v79 - 1;
              if (v79 - 1 >= v16)
              {
                __break(1u);
LABEL_138:
                __break(1u);
LABEL_139:
                __break(1u);
LABEL_140:
                __break(1u);
LABEL_141:
                __break(1u);
LABEL_142:
                __break(1u);
LABEL_143:
                __break(1u);
LABEL_144:
                __break(1u);
LABEL_145:
                __break(1u);
LABEL_146:
                __break(1u);
LABEL_147:
                __break(1u);
LABEL_148:
                __break(1u);
LABEL_149:
                __break(1u);
LABEL_150:
                __break(1u);
LABEL_151:
                __break(1u);
LABEL_152:
                __break(1u);
LABEL_153:
                __break(1u);
LABEL_154:
                __break(1u);
LABEL_155:
                __break(1u);
LABEL_156:
                __break(1u);
LABEL_157:
                __break(1u);
LABEL_158:
                __break(1u);
LABEL_159:
                __break(1u);
LABEL_160:
                __break(1u);
                goto LABEL_161;
              }
              if (!v14)
                goto LABEL_165;
              v119 = a4;
              v120 = v12;
              v121 = v77;
              v122 = &v77[16 * v118];
              v123 = *(_QWORD *)v122;
              v124 = v121;
              v125 = v79;
              v126 = &v121[16 * v79];
              v127 = *((_QWORD *)v126 + 1);
              sub_24395E238((id *)(v14 + 8 * *(_QWORD *)v122), (id *)(v14 + 8 * *(_QWORD *)v126), (id *)(v14 + 8 * v127), v148, v119);
              if (v149)
                goto LABEL_135;
              if (v127 < v123)
                goto LABEL_138;
              if (v125 > *((_QWORD *)v120 + 2))
                goto LABEL_139;
              *(_QWORD *)v122 = v123;
              *(_QWORD *)&v124[16 * v118 + 8] = v127;
              v128 = *((_QWORD *)v120 + 2);
              if (v125 >= v128)
                goto LABEL_140;
              v77 = v124;
              v149 = 0;
              v16 = v128 - 1;
              memmove(v126, v126 + 16, 16 * (v128 - 1 - v125));
              v12 = v120;
              *((_QWORD *)v120 + 2) = v128 - 1;
              v14 = v151;
              a4 = v119;
              if (v128 <= 2)
                goto LABEL_14;
              continue;
            }
          }
          v16 = 1;
LABEL_14:
          v15 = v145;
          v13 = v154;
          if (v154 >= v145)
            goto LABEL_124;
        }
      }
      v12 = (char *)MEMORY[0x24BEE4AF8];
      v155 = MEMORY[0x24BEE4AF8];
      v148 = (void **)((MEMORY[0x24BEE4AF8] & 0xFFFFFFFFFFFFFF8) + 32);
      if (v7 == 1)
        goto LABEL_12;
      v16 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
LABEL_124:
      if (v16 >= 2)
      {
        v130 = *a1;
        do
        {
          v131 = v16 - 2;
          if (v16 < 2)
            goto LABEL_153;
          if (!v130)
            goto LABEL_169;
          v132 = v12;
          v133 = *(_QWORD *)&v12[16 * v131 + 32];
          v134 = *(_QWORD *)&v12[16 * v16 + 24];
          sub_24395E238((id *)(v130 + 8 * v133), (id *)(v130 + 8 * *(_QWORD *)&v12[16 * v16 + 16]), (id *)(v130 + 8 * v134), v148, a4);
          if (v149)
            break;
          if (v134 < v133)
            goto LABEL_154;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v132 = sub_24395E8C0((uint64_t)v132);
          if (v131 >= *((_QWORD *)v132 + 2))
            goto LABEL_155;
          v135 = &v132[16 * v131 + 32];
          *(_QWORD *)v135 = v133;
          *((_QWORD *)v135 + 1) = v134;
          v136 = *((_QWORD *)v132 + 2);
          if (v16 > v136)
            goto LABEL_156;
          memmove(&v132[16 * v16 + 16], &v132[16 * v16 + 32], 16 * (v136 - v16));
          v12 = v132;
          *((_QWORD *)v132 + 2) = v136 - 1;
          v16 = v136 - 1;
        }
        while (v136 > 2);
      }
LABEL_135:
      swift_bridgeObjectRelease();
      *(_QWORD *)((v155 & 0xFFFFFFFFFFFFF8) + 0x10) = 0;
      sub_24396FC2C();
      return (char *)swift_bridgeObjectRelease();
    }
  }
  return result;
}

void sub_24395D5A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void **v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  _QWORD *v16;
  uint64_t v17;
  void (*v18)(char *, char *, uint64_t);
  void (*v19)(char *, uint64_t, uint64_t, uint64_t);
  unsigned int (*v20)(char *, uint64_t, uint64_t);
  id v21;
  uint64_t v22;
  char v23;
  void (*v24)(char *, uint64_t);
  uint64_t v25;
  void **v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  id v38;
  void **v39;
  void (*v40)(char *, uint64_t, uint64_t, uint64_t);
  id v41;

  v30 = a2;
  v31 = a1;
  if (a3 != a2)
  {
    v5 = a3;
    v33 = *a4;
    v6 = v33 + 8 * a3 - 8;
LABEL_5:
    v7 = *(void **)(v33 + 8 * v5);
    v34 = v5;
    v35 = v31;
    v32 = v6;
    v8 = (void **)v6;
    while (1)
    {
      v9 = *v8;
      v41 = v7;
      v10 = v9;
      v11 = objc_msgSend(v10, sel_startDate);
      v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2572D9E90);
      v13 = *(char **)(*(_QWORD *)(v12 - 8) + 64);
      MEMORY[0x24BDAC7A8](v12);
      v15 = (char *)&v29 - ((unint64_t)(v13 + 15) & 0xFFFFFFFFFFFFFFF0);
      if (!v11)
        break;
      v37 = v14;
      v38 = v10;
      v39 = v8;
      v4 = sub_24396FA04();
      v16 = *(_QWORD **)(v4 - 8);
      v17 = v16[8];
      MEMORY[0x24BDAC7A8](v4);
      sub_24396F9D4();

      v18 = (void (*)(char *, char *, uint64_t))v16[4];
      v18((char *)&v29 - ((unint64_t)(v13 + 15) & 0xFFFFFFFFFFFFFFF0), (char *)&v29 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
      v19 = (void (*)(char *, uint64_t, uint64_t, uint64_t))v16[7];
      v19((char *)&v29 - ((unint64_t)(v13 + 15) & 0xFFFFFFFFFFFFFFF0), 0, 1, v4);
      v20 = (unsigned int (*)(char *, uint64_t, uint64_t))v16[6];
      if (v20((char *)&v29 - ((unint64_t)(v13 + 15) & 0xFFFFFFFFFFFFFFF0), 1, v4) == 1)
        goto LABEL_15;
      v40 = v19;
      v21 = objc_msgSend(v41, sel_startDate);
      v22 = MEMORY[0x24BDAC7A8](v21);
      v13 = (char *)&v29 - ((unint64_t)(v13 + 15) & 0xFFFFFFFFFFFFFFF0);
      if (!v22)
        goto LABEL_16;
      v36 = &v29;
      MEMORY[0x24BDAC7A8](v22);
      sub_24396F9D4();

      v18(v13, (char *)&v29 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
      v40(v13, 0, 1, v4);
      if (v20(v13, 1, v4) == 1)
        goto LABEL_17;
      v23 = sub_24396F9B0();
      v24 = (void (*)(char *, uint64_t))v16[1];
      v24(v13, v4);
      v24(v15, v4);

      v25 = v34;
      v26 = v39;
      if ((v23 & 1) != 0)
      {
        if (!v33)
          goto LABEL_18;
        v27 = *v39;
        v7 = v39[1];
        *v39 = v7;
        v26[1] = v27;
        v8 = v26 - 1;
        if (v25 != ++v35)
          continue;
      }
      v5 = v25 + 1;
      v6 = v32 + 8;
      if (v5 == v30)
        return;
      goto LABEL_5;
    }
    v28 = sub_24396FA04();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v28 - 8) + 56))((char *)&v29 - ((unint64_t)(v13 + 15) & 0xFFFFFFFFFFFFFFF0), 1, 1, v28);
LABEL_15:
    __break(1u);
LABEL_16:
    v40(v13, 1, 1, v4);
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
  }
}

char *sub_24395D8E4(char *result, char *a2, char *a3, uint64_t *a4, SEL *a5)
{
  char *v6;
  uint64_t v7;
  char *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  SEL *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v23;
  void *v24;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  char *v30;

  v26 = result;
  if (a3 != a2)
  {
    v6 = a3;
    v28 = *a4;
    v7 = *a4 + 8 * (_QWORD)a3 - 8;
LABEL_6:
    v9 = *(void **)(v28 + 8 * (_QWORD)v6);
    v30 = v26;
    v27 = v7;
    v29 = v6;
    while (1)
    {
      v10 = *(void **)v7;
      v11 = v9;
      v12 = v10;
      result = (char *)objc_msgSend(v11, *a5);
      if (!result)
        break;
      v13 = result;
      v14 = sub_24396FB60();
      v16 = v15;

      result = (char *)objc_msgSend(v12, *a5);
      if (!result)
        goto LABEL_18;
      v17 = result;
      v18 = a5;
      v19 = sub_24396FB60();
      v21 = v20;

      if (v14 == v19 && v16 == v21)
      {

        result = (char *)swift_bridgeObjectRelease_n();
        a5 = v18;
        v8 = v29;
LABEL_5:
        v6 = v8 + 1;
        v7 = v27 + 8;
        if (v6 == a2)
          return result;
        goto LABEL_6;
      }
      v23 = sub_24396FF8C();

      swift_bridgeObjectRelease();
      result = (char *)swift_bridgeObjectRelease();
      a5 = v18;
      v8 = v29;
      if ((v23 & 1) != 0)
      {
        if (!v28)
          goto LABEL_19;
        v24 = *(void **)v7;
        v9 = *(void **)(v7 + 8);
        *(_QWORD *)v7 = v9;
        *(_QWORD *)(v7 + 8) = v24;
        v7 -= 8;
        if (v29 != ++v30)
          continue;
      }
      goto LABEL_5;
    }
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
  }
  return result;
}

uint64_t sub_24395DA90(id *__src, id *a2, id *a3, char **__dst)
{
  char *v4;
  char *v5;
  char **v6;
  id *v7;
  id *v8;
  int64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  id v16;
  uint64_t v17;
  char *v18;
  _QWORD *v19;
  uint64_t v20;
  void (*v21)(char *, _QWORD, uint64_t, char *);
  unsigned int (*v22)(char *, uint64_t, char *);
  id v23;
  uint64_t v24;
  char v25;
  void (*v26)(char *, char *);
  id *v27;
  id *v28;
  char **v29;
  id *v30;
  char **v31;
  id *v32;
  void *v33;
  void *v34;
  id v35;
  uint64_t v36;
  _QWORD *v37;
  uint64_t v38;
  void (*v39)(char *, char *, char *);
  _QWORD *v40;
  unsigned int (*v41)(char *, uint64_t, char *);
  id v42;
  uint64_t v43;
  char *v44;
  char *v45;
  char v46;
  void (*v47)(char *, char *);
  char **v48;
  id *v49;
  char **v50;
  id *v51;
  id *v52;
  uint64_t result;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char **v57;
  id *v58;
  char **v59;
  id *v60;
  uint64_t *v61;
  uint64_t *v62;
  id v63;
  char *v64;
  char *v65;
  id v66;
  id *v67;
  char **v68;
  id *v69;
  char **v70;
  char **v71;
  id *v72;

  v6 = __dst;
  v7 = a2;
  v8 = __src;
  v9 = (char *)a2 - (char *)__src;
  v10 = (char *)a2 - (char *)__src + 7;
  if ((char *)a2 - (char *)__src >= 0)
    v10 = (char *)a2 - (char *)__src;
  v11 = v10 >> 3;
  v60 = a3;
  v12 = (char *)a3 - (char *)a2;
  v13 = (char *)a3 - (char *)a2 + 7;
  if ((char *)a3 - (char *)a2 >= 0)
    v13 = (char *)a3 - (char *)a2;
  v14 = v13 >> 3;
  v72 = __src;
  v71 = __dst;
  if (v11 >= v13 >> 3)
  {
    if (v12 >= -7)
    {
      if (__dst != (char **)a2 || &a2[v14] <= (id *)__dst)
        memmove(__dst, a2, 8 * v14);
      v31 = &v6[v14];
      v70 = v31;
      v72 = v7;
      if (v8 < v7 && v12 >= 8)
      {
        v65 = (char *)(v60 - 1);
        v32 = v7;
        v67 = v8;
        v68 = v6;
        do
        {
          v69 = v7;
          v64 = (char *)v31;
          v33 = *(v31 - 1);
          v34 = *(v32 - 1);
          v57 = v31 - 1;
          v58 = v32 - 1;
          v66 = v33;
          v63 = v34;
          v35 = objc_msgSend(v63, sel_startDate);
          v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_2572D9E90);
          v62 = &v56;
          v15 = *(char **)(*(_QWORD *)(v36 - 8) + 64);
          MEMORY[0x24BDAC7A8](v36);
          v4 = (char *)&v56 - ((unint64_t)(v15 + 15) & 0xFFFFFFFFFFFFFFF0);
          if (!v35)
            goto LABEL_55;
          v5 = (char *)sub_24396FA04();
          v37 = (_QWORD *)*((_QWORD *)v5 - 1);
          v38 = v37[8];
          MEMORY[0x24BDAC7A8](v5);
          sub_24396F9D4();

          v39 = (void (*)(char *, char *, char *))v37[4];
          v39((char *)&v56 - ((unint64_t)(v15 + 15) & 0xFFFFFFFFFFFFFFF0), (char *)&v56 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0), v5);
          v40 = (_QWORD *)v37[7];
          ((void (*)(char *, _QWORD, uint64_t, char *))v40)((char *)&v56 - ((unint64_t)(v15 + 15) & 0xFFFFFFFFFFFFFFF0), 0, 1, v5);
          v41 = (unsigned int (*)(char *, uint64_t, char *))v37[6];
          if (v41((char *)&v56 - ((unint64_t)(v15 + 15) & 0xFFFFFFFFFFFFFFF0), 1, v5) == 1)
            goto LABEL_56;
          v61 = v40;
          v42 = objc_msgSend(v66, sel_startDate);
          v60 = (id *)&v56;
          v43 = MEMORY[0x24BDAC7A8](v42);
          v15 = (char *)&v56 - ((unint64_t)(v15 + 15) & 0xFFFFFFFFFFFFFFF0);
          if (!v43)
            goto LABEL_57;
          v59 = (char **)&v56;
          MEMORY[0x24BDAC7A8](v43);
          sub_24396F9D4();

          v39(v15, (char *)&v56 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0), v5);
          ((void (*)(char *, _QWORD, uint64_t, char *))v61)(v15, 0, 1, v5);
          if (v41(v15, 1, v5) == 1)
            goto LABEL_58;
          v44 = v65;
          v45 = v65 + 8;
          v46 = sub_24396F9B0();
          v47 = (void (*)(char *, char *))v37[1];
          v47(v15, v5);
          v47(v4, v5);

          if ((v46 & 1) != 0)
          {
            v48 = v68;
            v49 = v67;
            v31 = (char **)v64;
            v32 = v58;
            if (v45 != (char *)v69 || v44 >= (char *)v69)
              *(_QWORD *)v44 = *v58;
            v72 = v32;
            if (v32 <= v49)
              break;
          }
          else
          {
            v50 = v57;
            v70 = v57;
            v51 = v67;
            v48 = v68;
            v52 = v69;
            if (v45 < v64 || v44 >= v64 || v45 != v64)
              *(_QWORD *)v44 = *v57;
            v32 = v52;
            v31 = v50;
            if (v32 <= v51)
              break;
          }
          v65 -= 8;
          v7 = v32;
        }
        while (v31 > v48);
      }
LABEL_50:
      sub_24395E818((void **)&v72, (const void **)&v71, &v70);
      return 1;
    }
  }
  else if (v9 >= -7)
  {
    if (__dst != (char **)__src || &__src[v11] <= (id *)__dst)
      memmove(__dst, __src, 8 * v11);
    v59 = &v6[v11];
    v70 = v59;
    if (v7 < v60 && v9 >= 8)
    {
      while (1)
      {
        v67 = v8;
        v68 = v6;
        v69 = v7;
        v15 = *v6;
        v66 = *v7;
        v65 = v15;
        v16 = objc_msgSend(v65, sel_startDate);
        v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2572D9E90);
        v64 = (char *)&v56;
        v18 = *(char **)(*(_QWORD *)(v17 - 8) + 64);
        MEMORY[0x24BDAC7A8](v17);
        v5 = (char *)&v56 - ((unint64_t)(v18 + 15) & 0xFFFFFFFFFFFFFFF0);
        if (!v16)
          break;
        v15 = (char *)sub_24396FA04();
        v19 = (_QWORD *)*((_QWORD *)v15 - 1);
        v20 = v19[8];
        MEMORY[0x24BDAC7A8](v15);
        sub_24396F9D4();

        v4 = (char *)v19[4];
        ((void (*)(char *, char *, char *))v4)((char *)&v56 - ((unint64_t)(v18 + 15) & 0xFFFFFFFFFFFFFFF0), (char *)&v56 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0), v15);
        v21 = (void (*)(char *, _QWORD, uint64_t, char *))v19[7];
        v21((char *)&v56 - ((unint64_t)(v18 + 15) & 0xFFFFFFFFFFFFFFF0), 0, 1, v15);
        v22 = (unsigned int (*)(char *, uint64_t, char *))v19[6];
        if (v22((char *)&v56 - ((unint64_t)(v18 + 15) & 0xFFFFFFFFFFFFFFF0), 1, v15) == 1)
          goto LABEL_52;
        v63 = v21;
        v23 = objc_msgSend(v66, sel_startDate);
        v62 = &v56;
        v24 = MEMORY[0x24BDAC7A8](v23);
        v18 = (char *)&v56 - ((unint64_t)(v18 + 15) & 0xFFFFFFFFFFFFFFF0);
        if (!v24)
          goto LABEL_53;
        v61 = &v56;
        MEMORY[0x24BDAC7A8](v24);
        sub_24396F9D4();

        ((void (*)(char *, char *, char *))v4)(v18, (char *)&v56 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0), v15);
        ((void (*)(char *, _QWORD, uint64_t, char *))v63)(v18, 0, 1, v15);
        if (v22(v18, 1, v15) == 1)
          goto LABEL_54;
        v25 = sub_24396F9B0();
        v26 = (void (*)(char *, char *))v19[1];
        v26(v18, v15);
        v26(v5, v15);

        if ((v25 & 1) != 0)
        {
          v6 = v68;
          v27 = v69 + 1;
          v28 = v67;
          if (v67 < v69 || v67 >= v27 || v67 != v69)
            *v67 = *v69;
        }
        else
        {
          v28 = v67;
          v29 = v68;
          v30 = v69;
          if (v67 != (id *)v68)
            *v67 = *v68;
          v6 = v29 + 1;
          v71 = v6;
          v27 = v30;
        }
        v8 = v28 + 1;
        v72 = v8;
        if (v6 < v59)
        {
          v7 = v27;
          if (v27 < v60)
            continue;
        }
        goto LABEL_50;
      }
      v54 = sub_24396FA04();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v54 - 8) + 56))((char *)&v56 - ((unint64_t)(v18 + 15) & 0xFFFFFFFFFFFFFFF0), 1, 1, v54);
LABEL_52:
      __break(1u);
LABEL_53:
      ((void (*)(char *, uint64_t, uint64_t, char *))v63)(v18, 1, 1, v15);
LABEL_54:
      __break(1u);
LABEL_55:
      v55 = sub_24396FA04();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v55 - 8) + 56))(v4, 1, 1, v55);
LABEL_56:
      __break(1u);
LABEL_57:
      ((void (*)(char *, uint64_t, uint64_t, char *))v61)(v15, 1, 1, v5);
LABEL_58:
      __break(1u);
      goto LABEL_59;
    }
    goto LABEL_50;
  }
LABEL_59:
  result = sub_24396FF5C();
  __break(1u);
  return result;
}

uint64_t sub_24395E238(id *__src, id *a2, id *a3, void **__dst, SEL *a5)
{
  id *v6;
  id *v7;
  id *v8;
  int64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  SEL *v15;
  void **v16;
  id *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v32;
  id *v33;
  void **v34;
  id *v35;
  SEL *v36;
  char *v37;
  id *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  id v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  id v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char v55;
  id *v56;
  unint64_t v57;
  uint64_t result;
  char *v59;
  char *v61;
  void **v62;
  id *v63;
  void **v64;
  id *v65;
  id *v66;
  id *v67;
  char *v68;
  void **v69;
  id *v70;

  v6 = a3;
  v7 = a2;
  v8 = __src;
  v9 = (char *)a2 - (char *)__src;
  v10 = (char *)a2 - (char *)__src + 7;
  if ((char *)a2 - (char *)__src >= 0)
    v10 = (char *)a2 - (char *)__src;
  v11 = v10 >> 3;
  v12 = (char *)a3 - (char *)a2;
  v13 = (char *)a3 - (char *)a2 + 7;
  if ((char *)a3 - (char *)a2 >= 0)
    v13 = (char *)a3 - (char *)a2;
  v14 = v13 >> 3;
  v70 = __src;
  v69 = __dst;
  if (v11 < v13 >> 3)
  {
    if (v9 < -7)
      goto LABEL_61;
    if (__dst != __src || &__src[v11] <= __dst)
      memmove(__dst, __src, 8 * v11);
    v62 = &__dst[v11];
    v68 = (char *)v62;
    v15 = a5;
    if (v7 < v6 && v9 >= 8)
    {
      v16 = __dst;
      v66 = v6;
      while (1)
      {
        v64 = v8;
        v17 = v7;
        v18 = *v16;
        v19 = *v7;
        v20 = v18;
        v21 = objc_msgSend(v19, *v15);
        if (!v21)
          goto LABEL_59;
        v22 = v21;
        v23 = sub_24396FB60();
        v25 = v24;

        v26 = objc_msgSend(v20, *v15);
        if (!v26)
          goto LABEL_60;
        v27 = v26;
        v28 = sub_24396FB60();
        v30 = v29;

        if (v23 == v28 && v25 == v30)
          break;
        v32 = sub_24396FF8C();

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v32 & 1) == 0)
          goto LABEL_25;
        v33 = v17 + 1;
        v34 = v64;
        v35 = v66;
        v15 = a5;
        if (v64 < v17 || v64 >= v33 || v64 != v17)
          *v64 = *v17;
LABEL_28:
        v8 = v34 + 1;
        if (v16 < v62)
        {
          v7 = v33;
          if (v33 < v35)
            continue;
        }
        v70 = v8;
        goto LABEL_56;
      }

      swift_bridgeObjectRelease_n();
LABEL_25:
      v34 = v64;
      v35 = v66;
      v15 = a5;
      if (v64 != v16)
        *v64 = *v16;
      v69 = ++v16;
      v33 = v17;
      goto LABEL_28;
    }
LABEL_56:
    sub_24395E818((void **)&v70, (const void **)&v69, &v68);
    return 1;
  }
  if (v12 < -7)
    goto LABEL_61;
  v36 = a5;
  if (__dst != a2 || &a2[v14] <= __dst)
    memmove(__dst, a2, 8 * v14);
  v59 = (char *)__dst;
  v37 = (char *)&__dst[v14];
  v68 = v37;
  v70 = v7;
  if (v8 >= v7 || v12 < 8)
    goto LABEL_56;
  v38 = v7;
  v65 = v8;
  while (1)
  {
    v61 = v37;
    v63 = v7;
    v67 = v6;
    v40 = (void *)*((_QWORD *)v37 - 1);
    v37 -= 8;
    v39 = v40;
    v41 = *--v38;
    v42 = v39;
    v43 = v41;
    v44 = objc_msgSend(v42, *v36);
    if (!v44)
      break;
    v45 = v44;
    v46 = sub_24396FB60();
    v48 = v47;

    v49 = objc_msgSend(v43, *v36);
    if (!v49)
      goto LABEL_58;
    v50 = v49;
    v51 = sub_24396FB60();
    v53 = v52;

    if (v46 == v51 && v48 == v53)
    {

      swift_bridgeObjectRelease_n();
      v56 = v67;
      v6 = v67 - 1;
LABEL_50:
      v36 = a5;
      v38 = v63;
      v57 = (unint64_t)v65;
      v68 = v37;
      if (v56 < (id *)v61 || v6 >= (id *)v61 || v56 != (id *)v61)
        *v6 = *(id *)v37;
      goto LABEL_54;
    }
    v55 = sub_24396FF8C();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v56 = v67;
    v6 = v67 - 1;
    if ((v55 & 1) == 0)
      goto LABEL_50;
    v57 = (unint64_t)v65;
    v36 = a5;
    v37 = v61;
    if (v67 != v63 || v6 >= v63)
      *v6 = *v38;
    v70 = v38;
LABEL_54:
    if ((unint64_t)v38 > v57)
    {
      v7 = v38;
      if (v37 > v59)
        continue;
    }
    goto LABEL_56;
  }
  __break(1u);
LABEL_58:
  __break(1u);
LABEL_59:
  __break(1u);
LABEL_60:
  __break(1u);
LABEL_61:
  result = sub_24396FF5C();
  __break(1u);
  return result;
}

char *sub_24395E678(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2572D9F70);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 17;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8])
      memmove(v13, v14, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_24395E770(void **a1, const void **a2, _QWORD *a3)
{
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *result;
  uint64_t v7;

  v3 = (char *)*a2;
  v4 = *a3 - (_QWORD)v3;
  v5 = v4 + 15;
  if (v4 >= 0)
    v5 = *a3 - (_QWORD)v3;
  if (v4 <= -16)
  {
    result = (char *)sub_24396FF5C();
    __break(1u);
  }
  else
  {
    result = (char *)*a1;
    v7 = v5 >> 4;
    if (result != v3 || result >= &v3[16 * v7])
      return (char *)memmove(result, v3, 16 * v7);
  }
  return result;
}

char *sub_24395E818(void **a1, const void **a2, _QWORD *a3)
{
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *result;
  uint64_t v7;

  v3 = (char *)*a2;
  v4 = *a3 - (_QWORD)v3;
  v5 = v4 + 7;
  if (v4 >= 0)
    v5 = *a3 - (_QWORD)v3;
  if (v4 <= -8)
  {
    result = (char *)sub_24396FF5C();
    __break(1u);
  }
  else
  {
    result = (char *)*a1;
    v7 = v5 >> 3;
    if (result != v3 || result >= &v3[8 * v7])
      return (char *)memmove(result, v3, 8 * v7);
  }
  return result;
}

char *sub_24395E8C0(uint64_t a1)
{
  return sub_24395E678(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_24395E8D4(unint64_t a1)
{
  unint64_t *v1;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int isUniquelyReferenced_nonNull_bridgeObject;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;

  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v3 = sub_24396FF20();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v4 = *v1;
  if (*v1 >> 62)
  {
    swift_bridgeObjectRetain();
    v5 = sub_24396FF20();
    swift_bridgeObjectRelease();
    v6 = v5 + v3;
    if (!__OFADD__(v5, v3))
      goto LABEL_5;
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v5 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  v6 = v5 + v3;
  if (__OFADD__(v5, v3))
    goto LABEL_23;
LABEL_5:
  v4 = *v1;
  isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *v1 = v4;
  v5 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v4 & 0x8000000000000000) == 0 && (v4 & 0x4000000000000000) == 0)
  {
    v8 = v4 & 0xFFFFFFFFFFFFFF8;
    if (v6 <= *(_QWORD *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      goto LABEL_15;
    v5 = 1;
  }
  if (v4 >> 62)
    goto LABEL_25;
  v9 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    if (v9 <= v6)
      v9 = v6;
    swift_bridgeObjectRetain();
    v4 = MEMORY[0x2494FD6A8](v5, v9, 1, v4);
    swift_bridgeObjectRelease();
    *v1 = v4;
    v8 = v4 & 0xFFFFFFFFFFFFFF8;
LABEL_15:
    result = sub_24395EE4C(v8 + 8 * *(_QWORD *)(v8 + 16) + 32, (*(_QWORD *)(v8 + 24) >> 1) - *(_QWORD *)(v8 + 16), a1);
    if (v11 >= v3)
      break;
LABEL_24:
    __break(1u);
LABEL_25:
    swift_bridgeObjectRetain();
    v9 = sub_24396FF20();
    swift_bridgeObjectRelease();
  }
  if (v11 < 1)
    goto LABEL_19;
  v12 = *(_QWORD *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  v13 = __OFADD__(v12, v11);
  v14 = v12 + v11;
  if (!v13)
  {
    *(_QWORD *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10) = v14;
LABEL_19:
    swift_bridgeObjectRelease();
    return sub_24396FC2C();
  }
  __break(1u);
  return result;
}

uint64_t sub_24395EA8C(uint64_t a1, uint64_t a2, uint64_t a3, char a4, _QWORD *a5)
{
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  char v14;
  unint64_t v15;
  uint64_t v16;
  _BOOL8 v17;
  uint64_t v18;
  char v19;
  unint64_t v20;
  char v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  _QWORD *v39;
  unint64_t v40;
  char v41;
  uint64_t v42;
  _BOOL8 v43;
  uint64_t v44;
  char v45;
  char v46;
  _QWORD *v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t result;
  uint64_t v52;
  uint64_t v53;

  swift_bridgeObjectRetain();
  swift_retain();
  v7 = sub_24395F728();
  if (!v8)
    goto LABEL_23;
  v10 = v7;
  v11 = v8;
  v12 = v9;
  v13 = (_QWORD *)*a5;
  v15 = sub_243942698(v7, v8);
  v16 = v13[2];
  v17 = (v14 & 1) == 0;
  v18 = v16 + v17;
  if (__OFADD__(v16, v17))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  v19 = v14;
  if (v13[3] >= v18)
  {
    if ((a4 & 1) != 0)
    {
      v22 = (_QWORD *)*a5;
      if ((v14 & 1) != 0)
        goto LABEL_9;
    }
    else
    {
      sub_243945FB8();
      v22 = (_QWORD *)*a5;
      if ((v19 & 1) != 0)
        goto LABEL_9;
    }
LABEL_11:
    v22[(v15 >> 6) + 8] |= 1 << v15;
    v25 = (uint64_t *)(v22[6] + 16 * v15);
    *v25 = v10;
    v25[1] = v11;
    *(_QWORD *)(v22[7] + 8 * v15) = v12;
    v26 = v22[2];
    v27 = __OFADD__(v26, 1);
    v28 = v26 + 1;
    if (v27)
    {
LABEL_25:
      __break(1u);
      goto LABEL_26;
    }
    v22[2] = v28;
LABEL_13:
    v29 = sub_24395F728();
    if (v30)
    {
      v32 = v29;
      v33 = v30;
      v34 = v31;
      do
      {
        v39 = (_QWORD *)*a5;
        v40 = sub_243942698(v32, v33);
        v42 = v39[2];
        v43 = (v41 & 1) == 0;
        v27 = __OFADD__(v42, v43);
        v44 = v42 + v43;
        if (v27)
          goto LABEL_24;
        v45 = v41;
        if (v39[3] < v44)
        {
          sub_2439439F8(v44, 1);
          v40 = sub_243942698(v32, v33);
          if ((v45 & 1) != (v46 & 1))
            goto LABEL_26;
        }
        v47 = (_QWORD *)*a5;
        if ((v45 & 1) != 0)
        {
          v35 = 8 * v40;
          v53 = *(_QWORD *)(v47[7] + 8 * v40);
          swift_bridgeObjectRetain();
          sub_24395E8D4(v34);
          swift_bridgeObjectRelease();
          v36 = v47[7];
          swift_bridgeObjectRelease();
          *(_QWORD *)(v36 + v35) = v53;
        }
        else
        {
          v47[(v40 >> 6) + 8] |= 1 << v40;
          v48 = (uint64_t *)(v47[6] + 16 * v40);
          *v48 = v32;
          v48[1] = v33;
          *(_QWORD *)(v47[7] + 8 * v40) = v34;
          v49 = v47[2];
          v27 = __OFADD__(v49, 1);
          v50 = v49 + 1;
          if (v27)
            goto LABEL_25;
          v47[2] = v50;
        }
        v32 = sub_24395F728();
        v33 = v37;
        v34 = v38;
      }
      while (v37);
    }
LABEL_23:
    swift_release();
    swift_bridgeObjectRelease();
    sub_243947AF0();
    return swift_release();
  }
  sub_2439439F8(v18, a4 & 1);
  v20 = sub_243942698(v10, v11);
  if ((v19 & 1) == (v21 & 1))
  {
    v15 = v20;
    v22 = (_QWORD *)*a5;
    if ((v19 & 1) == 0)
      goto LABEL_11;
LABEL_9:
    v23 = 8 * v15;
    v52 = *(_QWORD *)(v22[7] + v23);
    swift_bridgeObjectRetain();
    sub_24395E8D4(v12);
    swift_bridgeObjectRelease();
    v24 = v22[7];
    swift_bridgeObjectRelease();
    *(_QWORD *)(v24 + v23) = v52;
    goto LABEL_13;
  }
LABEL_26:
  result = sub_24396FFBC();
  __break(1u);
  return result;
}

uint64_t sub_24395EDB0(uint64_t a1, uint64_t a2)
{
  initializeWithCopy for DurableFeatureManager(a2, a1);
  return a2;
}

id *sub_24395EDE4(id *a1)
{
  destroy for DurableFeatureManager(a1);
  return a1;
}

uint64_t sub_24395EE10()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_24395EE34(unint64_t a1)
{
  uint64_t v1;

  return sub_243953408(a1, *(uint64_t (**)(void))(v1 + 16));
}

uint64_t sub_24395EE3C(uint64_t result)
{
  if (result)
    return swift_retain();
  return result;
}

uint64_t sub_24395EE4C(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t i;
  uint64_t (*v12)();
  id *v13;
  id v14;
  uint64_t result;
  uint64_t (*v16[4])();

  v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    v7 = sub_24396FF20();
    swift_bridgeObjectRelease();
    if (!v7)
      return a3;
  }
  else
  {
    v7 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v7)
      return a3;
  }
  if (!a1)
    goto LABEL_19;
  v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    swift_bridgeObjectRetain();
    v10 = sub_24396FF20();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_2439601B0(&qword_2572D9F68, &qword_2572D9F60);
        swift_bridgeObjectRetain();
        for (i = 0; i != v7; ++i)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_2572D9F60);
          v12 = sub_2439675D0(v16, i, a3);
          v14 = *v13;
          ((void (*)(uint64_t (**)(), _QWORD))v12)(v16, 0);
          *(_QWORD *)(a1 + 8 * i) = v14;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v9 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    sub_24393E124(0, &qword_2572DA0E0);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  result = sub_24396FF5C();
  __break(1u);
  return result;
}

uint64_t sub_24395F060(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t i;
  uint64_t (*v12)();
  id *v13;
  id v14;
  uint64_t result;
  uint64_t (*v16[4])();

  v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    v7 = sub_24396FF20();
    swift_bridgeObjectRelease();
    if (!v7)
      return a3;
  }
  else
  {
    v7 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v7)
      return a3;
  }
  if (!a1)
    goto LABEL_19;
  v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    swift_bridgeObjectRetain();
    v10 = sub_24396FF20();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_2439601B0(&qword_2572D9FA8, &qword_2572D9FA0);
        swift_bridgeObjectRetain();
        for (i = 0; i != v7; ++i)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_2572D9FA0);
          v12 = sub_2439675D0(v16, i, a3);
          v14 = *v13;
          ((void (*)(uint64_t (**)(), _QWORD))v12)(v16, 0);
          *(_QWORD *)(a1 + 8 * i) = v14;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v9 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    sub_24393E124(0, &qword_2572D9F98);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  result = sub_24396FF5C();
  __break(1u);
  return result;
}

uint64_t sub_24395F274(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t i;
  uint64_t (*v12)();
  id *v13;
  id v14;
  uint64_t result;
  void (*v16[4])(id *);

  v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    v7 = sub_24396FF20();
    swift_bridgeObjectRelease();
    if (!v7)
      return a3;
  }
  else
  {
    v7 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v7)
      return a3;
  }
  if (!a1)
    goto LABEL_19;
  v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    swift_bridgeObjectRetain();
    v10 = sub_24396FF20();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_2439601B0(&qword_2572D9F90, &qword_2572D9F88);
        swift_bridgeObjectRetain();
        for (i = 0; i != v7; ++i)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_2572D9F88);
          v12 = sub_243967628(v16, i, a3);
          v14 = *v13;
          ((void (*)(void (**)(id *), _QWORD))v12)(v16, 0);
          *(_QWORD *)(a1 + 8 * i) = v14;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v9 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    sub_24393E124(0, &qword_2572D9F80);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  result = sub_24396FF5C();
  __break(1u);
  return result;
}

uint64_t sub_24395F488(_QWORD *a1)
{
  return sub_24394BD58(0, a1[2], 0, a1);
}

void sub_24395F49C()
{
  JUMPOUT(0x2494FD798);
}

void sub_24395F4B0()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  unint64_t v3;
  int64_t v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void (*v11)(uint64_t *__return_ptr, _QWORD *);
  uint64_t v12;
  uint64_t v13;
  int64_t v14;
  int64_t v15;
  uint64_t v16;
  unint64_t v17;
  int64_t v18;
  int64_t v19;
  uint64_t v20;
  _QWORD v21[2];

  v1 = v0;
  v2 = *v0;
  if ((*v0 & 0x8000000000000000) != 0)
  {
    if (sub_24396FEFC())
    {
      v13 = v12;
      sub_24393E124(0, &qword_2572D9E38);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      v7 = (void *)v21[0];
      swift_unknownObjectRelease();
      v20 = v13;
      sub_24393E124(0, (unint64_t *)&qword_2572D9D38);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      v8 = (void *)v21[0];
      swift_unknownObjectRelease();
      if (v21[0])
        goto LABEL_6;
    }
    return;
  }
  v4 = v0[3];
  v3 = v1[4];
  if (v3)
  {
    v5 = (v3 - 1) & v3;
    v6 = __clz(__rbit64(v3)) | (v4 << 6);
LABEL_4:
    v7 = *(void **)(*(_QWORD *)(v2 + 48) + 8 * v6);
    v8 = *(void **)(*(_QWORD *)(v2 + 56) + 8 * v6);
    v9 = v7;
    v10 = v8;
    goto LABEL_5;
  }
  v14 = v4 + 1;
  if (__OFADD__(v4, 1))
  {
    __break(1u);
    return;
  }
  v15 = (unint64_t)(v1[2] + 64) >> 6;
  if (v14 >= v15)
  {
    v8 = 0;
    v7 = 0;
    v5 = 0;
    goto LABEL_5;
  }
  v16 = v1[1];
  v17 = *(_QWORD *)(v16 + 8 * v14);
  if (v17)
  {
LABEL_13:
    v5 = (v17 - 1) & v17;
    v6 = __clz(__rbit64(v17)) + (v14 << 6);
    v4 = v14;
    goto LABEL_4;
  }
  v18 = v4 + 2;
  if (v4 + 2 >= v15)
    goto LABEL_29;
  v17 = *(_QWORD *)(v16 + 8 * v18);
  if (v17)
  {
LABEL_17:
    v14 = v18;
    goto LABEL_13;
  }
  if (v4 + 3 >= v15)
    goto LABEL_30;
  v17 = *(_QWORD *)(v16 + 8 * (v4 + 3));
  if (v17)
  {
    v14 = v4 + 3;
    goto LABEL_13;
  }
  v18 = v4 + 4;
  if (v4 + 4 < v15)
  {
    v17 = *(_QWORD *)(v16 + 8 * v18);
    if (v17)
      goto LABEL_17;
    v14 = v4 + 5;
    if (v4 + 5 < v15)
    {
      v17 = *(_QWORD *)(v16 + 8 * v14);
      if (v17)
        goto LABEL_13;
      v14 = v15 - 1;
      v19 = v4 + 6;
      while (v15 != v19)
      {
        v17 = *(_QWORD *)(v16 + 8 * v19++);
        if (v17)
        {
          v14 = v19 - 1;
          goto LABEL_13;
        }
      }
LABEL_29:
      v8 = 0;
      v7 = 0;
      v5 = 0;
      v4 = v14;
      goto LABEL_5;
    }
LABEL_30:
    v8 = 0;
    v7 = 0;
    v5 = 0;
    v4 = v18;
    goto LABEL_5;
  }
  v8 = 0;
  v7 = 0;
  v5 = 0;
  v4 += 3;
LABEL_5:
  v1[3] = v4;
  v1[4] = v5;
  if (v7)
  {
LABEL_6:
    v11 = (void (*)(uint64_t *__return_ptr, _QWORD *))v1[5];
    v21[0] = v7;
    v21[1] = v8;
    v11(&v20, v21);

  }
}

uint64_t sub_24395F728()
{
  uint64_t *v0;
  uint64_t v1;
  unint64_t v2;
  int64_t v3;
  int64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t *__return_ptr, _QWORD *);
  uint64_t result;
  int64_t v13;
  int64_t v14;
  uint64_t v15;
  unint64_t v16;
  int64_t v17;
  int64_t v18;
  uint64_t v19;
  _QWORD v20[3];

  v1 = *v0;
  v3 = v0[3];
  v2 = v0[4];
  v4 = v3;
  if (v2)
  {
    v5 = (v2 - 1) & v2;
    v6 = __clz(__rbit64(v2)) | (v3 << 6);
LABEL_3:
    v7 = (uint64_t *)(*(_QWORD *)(v1 + 48) + 16 * v6);
    v8 = *v7;
    v9 = v7[1];
    v10 = *(_QWORD *)(*(_QWORD *)(v1 + 56) + 8 * v6);
    v0[3] = v4;
    v0[4] = v5;
    v11 = (void (*)(uint64_t *__return_ptr, _QWORD *))v0[5];
    v20[0] = v8;
    v20[1] = v9;
    v20[2] = v10;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v11(&v19, v20);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return v19;
  }
  v13 = v3 + 1;
  if (__OFADD__(v3, 1))
  {
    __break(1u);
  }
  else
  {
    v14 = (unint64_t)(v0[2] + 64) >> 6;
    if (v13 < v14)
    {
      v15 = v0[1];
      v16 = *(_QWORD *)(v15 + 8 * v13);
      if (v16)
      {
LABEL_7:
        v5 = (v16 - 1) & v16;
        v6 = __clz(__rbit64(v16)) + (v13 << 6);
        v4 = v13;
        goto LABEL_3;
      }
      v17 = v3 + 2;
      v4 = v3 + 1;
      if (v3 + 2 < v14)
      {
        v16 = *(_QWORD *)(v15 + 8 * v17);
        if (v16)
        {
LABEL_10:
          v13 = v17;
          goto LABEL_7;
        }
        v4 = v3 + 2;
        if (v3 + 3 < v14)
        {
          v16 = *(_QWORD *)(v15 + 8 * (v3 + 3));
          if (v16)
          {
            v13 = v3 + 3;
            goto LABEL_7;
          }
          v17 = v3 + 4;
          v4 = v3 + 3;
          if (v3 + 4 < v14)
          {
            v16 = *(_QWORD *)(v15 + 8 * v17);
            if (v16)
              goto LABEL_10;
            v13 = v3 + 5;
            v4 = v3 + 4;
            if (v3 + 5 < v14)
            {
              v16 = *(_QWORD *)(v15 + 8 * v13);
              if (v16)
                goto LABEL_7;
              v4 = v14 - 1;
              v18 = v3 + 6;
              while (v14 != v18)
              {
                v16 = *(_QWORD *)(v15 + 8 * v18++);
                if (v16)
                {
                  v13 = v18 - 1;
                  goto LABEL_7;
                }
              }
            }
          }
        }
      }
    }
    result = 0;
    v0[3] = v4;
    v0[4] = 0;
  }
  return result;
}

uint64_t sub_24395F8B8@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  v2 = a1[1];
  v3 = a1[2];
  *a2 = *a1;
  a2[1] = v2;
  a2[2] = v3;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t sub_24395F8EC(unint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v13;

  if (a1 >> 62)
    goto LABEL_15;
  v3 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    v4 = MEMORY[0x24BEE4AF8];
    if (!v3)
      return v4;
    v13 = MEMORY[0x24BEE4AF8];
    result = sub_24394BD04(0, v3 & ~(v3 >> 63), 0);
    if (v3 < 0)
      break;
    v6 = 0;
    v4 = v13;
    while (v3 != v6)
    {
      if ((a1 & 0xC000000000000001) != 0)
        v7 = (id)MEMORY[0x2494FD69C](v6, a1);
      else
        v7 = *(id *)(a1 + 8 * v6 + 32);
      v8 = v7;
      v9 = a2();

      v11 = *(_QWORD *)(v13 + 16);
      v10 = *(_QWORD *)(v13 + 24);
      if (v11 >= v10 >> 1)
        sub_24394BD04(v10 > 1, v11 + 1, 1);
      ++v6;
      *(_QWORD *)(v13 + 16) = v11 + 1;
      *(_QWORD *)(v13 + 8 * v11 + 32) = v9;
      if (v3 == v6)
        return v4;
    }
    __break(1u);
LABEL_15:
    swift_bridgeObjectRetain();
    v3 = sub_24396FF20();
    swift_bridgeObjectRelease();
  }
  __break(1u);
  return result;
}

uint64_t sub_24395FA4C(uint64_t a1, void (*a2)(uint64_t, uint64_t, double))
{
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  int64_t v10;
  unint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v22;
  uint64_t v23;

  v3 = *(_QWORD *)(a1 + 16);
  result = MEMORY[0x24BEE4AF8];
  if (v3)
  {
    v23 = MEMORY[0x24BEE4AF8];
    sub_24396FEA8();
    result = sub_243947524(a1);
    v5 = result;
    v7 = v6;
    v8 = 0;
    v9 = a1 + 64;
    while ((v5 & 0x8000000000000000) == 0 && v5 < 1 << *(_BYTE *)(a1 + 32))
    {
      v11 = (unint64_t)v5 >> 6;
      if ((*(_QWORD *)(v9 + 8 * ((unint64_t)v5 >> 6)) & (1 << v5)) == 0)
        goto LABEL_22;
      if (*(_DWORD *)(a1 + 36) != v7)
        goto LABEL_23;
      v22 = v8;
      v12 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * v5);
      v13 = *v12;
      v14 = v12[1];
      v15 = *(double *)(*(_QWORD *)(a1 + 56) + 8 * v5);
      swift_bridgeObjectRetain();
      a2(v13, v14, v15);
      swift_bridgeObjectRelease();
      sub_24396FE90();
      sub_24396FEB4();
      sub_24396FEC0();
      result = sub_24396FE9C();
      v10 = 1 << *(_BYTE *)(a1 + 32);
      if (v5 >= v10)
        goto LABEL_24;
      v16 = *(_QWORD *)(v9 + 8 * v11);
      if ((v16 & (1 << v5)) == 0)
        goto LABEL_25;
      if (*(_DWORD *)(a1 + 36) != v7)
        goto LABEL_26;
      v17 = v16 & (-2 << (v5 & 0x3F));
      if (v17)
      {
        v10 = __clz(__rbit64(v17)) | v5 & 0xFFFFFFFFFFFFFFC0;
      }
      else
      {
        v18 = v11 + 1;
        v19 = (unint64_t)(v10 + 63) >> 6;
        if (v11 + 1 < v19)
        {
          v20 = *(_QWORD *)(v9 + 8 * v18);
          if (v20)
          {
LABEL_18:
            v10 = __clz(__rbit64(v20)) + (v18 << 6);
          }
          else
          {
            while (v19 - 2 != v11)
            {
              v20 = *(_QWORD *)(a1 + 80 + 8 * v11++);
              if (v20)
              {
                v18 = v11 + 1;
                goto LABEL_18;
              }
            }
          }
        }
      }
      v8 = v22 + 1;
      v5 = v10;
      if (v22 + 1 == v3)
        return v23;
    }
    __break(1u);
LABEL_22:
    __break(1u);
LABEL_23:
    __break(1u);
LABEL_24:
    __break(1u);
LABEL_25:
    __break(1u);
LABEL_26:
    __break(1u);
  }
  return result;
}

_QWORD *sub_24395FC60(unint64_t a1, uint64_t (*a2)(id))
{
  unint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  _QWORD *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v16;
  unint64_t v17;

  v2 = a1;
  if (a1 >> 62)
    goto LABEL_16;
  v3 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v3; v3 = sub_24396FF20())
  {
    v17 = v2 & 0xC000000000000001;
    v4 = (_QWORD *)MEMORY[0x24BEE4AF8];
    v5 = 4;
    v16 = v2;
    while (1)
    {
      v7 = v17 ? (id)MEMORY[0x2494FD69C](v5 - 4, v2) : *(id *)(v2 + 8 * v5);
      v8 = v7;
      v9 = v5 - 3;
      if (__OFADD__(v5 - 4, 1))
        break;
      v10 = a2(v7);
      v12 = v11;

      if (v12)
      {
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v4 = sub_2439647D4(0, v4[2] + 1, 1, v4);
        v14 = v4[2];
        v13 = v4[3];
        if (v14 >= v13 >> 1)
          v4 = sub_2439647D4((_QWORD *)(v13 > 1), v14 + 1, 1, v4);
        v4[2] = v14 + 1;
        v6 = &v4[2 * v14];
        v6[4] = v10;
        v6[5] = v12;
        v2 = v16;
      }
      ++v5;
      if (v9 == v3)
        goto LABEL_18;
    }
    __break(1u);
LABEL_16:
    swift_bridgeObjectRetain();
  }
  v4 = (_QWORD *)MEMORY[0x24BEE4AF8];
LABEL_18:
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_24395FDE8(unint64_t a1, uint64_t (*a2)(void *))
{
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  unint64_t v9;
  unint64_t v11;
  uint64_t v12;
  uint64_t v14;

  v2 = a1;
  v14 = MEMORY[0x24BEE4AF8];
  if (a1 >> 62)
    goto LABEL_18;
  v12 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (v12)
  {
    while (1)
    {
      v11 = v2;
      v3 = 0;
      v4 = v2 & 0xC000000000000001;
      v5 = v2 & 0xFFFFFFFFFFFFFF8;
      v6 = v12;
      while (v4)
      {
        v7 = (id)MEMORY[0x2494FD69C](v3, v2);
LABEL_9:
        v8 = v7;
        v9 = v3 + 1;
        if (__OFADD__(v3, 1))
          goto LABEL_17;
        if (objc_msgSend(v7, sel_mechanism) == (id)13 && (a2(v8) & 1) != 0)
        {
          sub_24396FE90();
          sub_24396FEB4();
          v2 = v11;
          v6 = v12;
          sub_24396FEC0();
          sub_24396FE9C();
        }
        else
        {

        }
        ++v3;
        if (v9 == v6)
          return v14;
      }
      if (v3 < *(_QWORD *)(v5 + 16))
        break;
      __break(1u);
LABEL_17:
      __break(1u);
LABEL_18:
      v12 = sub_24396FF20();
      if (!v12)
        return MEMORY[0x24BEE4AF8];
    }
    v7 = *(id *)(v2 + 8 * v3 + 32);
    goto LABEL_9;
  }
  return MEMORY[0x24BEE4AF8];
}

uint64_t sub_24395FF6C(unint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  char **v6;
  id v7;
  void *v8;
  unint64_t v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  char **v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  unint64_t v21;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;

  v3 = a1;
  v26 = MEMORY[0x24BEE4AF8];
  if (a1 >> 62)
    goto LABEL_26;
  v4 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (v4)
  {
    while (1)
    {
      v21 = v3;
      v5 = 0;
      v24 = v3 & 0xFFFFFFFFFFFFFF8;
      v25 = v3 & 0xC000000000000001;
      v6 = &selRef_initWithDomainId_derivedIntentId_bundleId_recipientsId_;
      while (v25)
      {
        v7 = (id)MEMORY[0x2494FD69C](v5, v3);
LABEL_9:
        v8 = v7;
        v9 = v5 + 1;
        if (__OFADD__(v5, 1))
          goto LABEL_25;
        v10 = objc_msgSend(v7, v6[28]);
        if (v10)
        {

          v11 = objc_msgSend(v8, v6[28]);
        }
        else
        {
          v12 = objc_msgSend(v8, sel_derivedIntentIdentifier);
          if (!v12)
            goto LABEL_4;

          v11 = objc_msgSend(v8, sel_derivedIntentIdentifier);
        }
        v13 = v11;
        if (v13)
        {
          v14 = v4;
          v15 = v6;
          v16 = sub_24396FB60();
          v18 = v17;

          if (v16 == a2 && v18 == a3)
          {
            swift_bridgeObjectRelease();
            goto LABEL_19;
          }
          v19 = sub_24396FF8C();
          swift_bridgeObjectRelease();
          if ((v19 & 1) != 0)
          {
LABEL_19:
            sub_24396FE90();
            sub_24396FEB4();
            sub_24396FEC0();
            sub_24396FE9C();
          }
          else
          {

          }
          v6 = v15;
          v4 = v14;
          v3 = v21;
          goto LABEL_5;
        }
LABEL_4:

LABEL_5:
        ++v5;
        if (v9 == v4)
          return v26;
      }
      if (v5 < *(_QWORD *)(v24 + 16))
        break;
      __break(1u);
LABEL_25:
      __break(1u);
LABEL_26:
      v4 = sub_24396FF20();
      if (!v4)
        return MEMORY[0x24BEE4AF8];
    }
    v7 = *(id *)(v3 + 8 * v5 + 32);
    goto LABEL_9;
  }
  return MEMORY[0x24BEE4AF8];
}

uint64_t sub_243960194(id *a1)
{
  uint64_t v1;

  return sub_24396C00C(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24)) & 1;
}

uint64_t sub_2439601B0(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x2494FDCE4](MEMORY[0x24BEE12E0], v4);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_2439601F0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2572D9FB8;
  if (!qword_2572D9FB8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2572D9FB0);
    result = MEMORY[0x2494FDCE4](MEMORY[0x24BDCFCF8], v1);
    atomic_store(result, (unint64_t *)&qword_2572D9FB8);
  }
  return result;
}

id sub_24396023C(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8, unint64_t a9)
{
  id result;

  switch(a9 >> 61)
  {
    case 0uLL:
      sub_24395EE3C((uint64_t)a3);
      result = a5;
      break;
    case 1uLL:
      result = a3;
      break;
    case 2uLL:
    case 4uLL:
      swift_retain();
      result = (id)swift_retain();
      break;
    case 3uLL:
      sub_24395EE3C((uint64_t)a3);
      result = (id)swift_bridgeObjectRetain();
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_2439602FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, int a6)
{
  uint64_t v6;
  char v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t result;
  int64_t v16;
  unint64_t v17;
  unint64_t i;
  unint64_t v20;
  int64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  int64_t v25;
  uint64_t v26[2];
  uint64_t v27;

  v27 = a1;
  v11 = a5 & 1;
  v24 = a2 + 56;
  v12 = 1 << *(_BYTE *)(a2 + 32);
  v13 = -1;
  if (v12 < 64)
    v13 = ~(-1 << v12);
  v14 = v13 & *(_QWORD *)(a2 + 56);
  v25 = (unint64_t)(v12 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v16 = 0;
  if (!v14)
    goto LABEL_5;
LABEL_4:
  v17 = __clz(__rbit64(v14));
  v14 &= v14 - 1;
  for (i = v17 | (v16 << 6); ; i = __clz(__rbit64(v20)) + (v16 << 6))
  {
    v22 = (uint64_t *)(*(_QWORD *)(a2 + 48) + 16 * i);
    v23 = v22[1];
    v26[0] = *v22;
    v26[1] = v23;
    swift_bridgeObjectRetain();
    sub_243958FAC((uint64_t)&v27, v26, a3, a4, v11, a6);
    if (v6)
    {
      swift_release();
      swift_bridgeObjectRelease();
      return swift_bridgeObjectRelease();
    }
    result = swift_bridgeObjectRelease();
    if (v14)
      goto LABEL_4;
LABEL_5:
    if (__OFADD__(v16++, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v16 >= v25)
      goto LABEL_26;
    v20 = *(_QWORD *)(v24 + 8 * v16);
    if (!v20)
      break;
LABEL_17:
    v14 = (v20 - 1) & v20;
  }
  v21 = v16 + 1;
  if (v16 + 1 >= v25)
    goto LABEL_26;
  v20 = *(_QWORD *)(v24 + 8 * v21);
  if (v20)
    goto LABEL_16;
  v21 = v16 + 2;
  if (v16 + 2 >= v25)
    goto LABEL_26;
  v20 = *(_QWORD *)(v24 + 8 * v21);
  if (v20)
    goto LABEL_16;
  v21 = v16 + 3;
  if (v16 + 3 >= v25)
    goto LABEL_26;
  v20 = *(_QWORD *)(v24 + 8 * v21);
  if (v20)
    goto LABEL_16;
  v21 = v16 + 4;
  if (v16 + 4 >= v25)
  {
LABEL_26:
    swift_release();
    return v27;
  }
  v20 = *(_QWORD *)(v24 + 8 * v21);
  if (v20)
  {
LABEL_16:
    v16 = v21;
    goto LABEL_17;
  }
  while (1)
  {
    v16 = v21 + 1;
    if (__OFADD__(v21, 1))
      break;
    if (v16 >= v25)
      goto LABEL_26;
    v20 = *(_QWORD *)(v24 + 8 * v16);
    ++v21;
    if (v20)
      goto LABEL_17;
  }
LABEL_28:
  __break(1u);
  return result;
}

id sub_24396050C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_243959554(a1, a2, *(unsigned int *)(v2 + 16));
}

uint64_t sub_243960514()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

uint64_t sub_243960550()
{
  id *v0;

  swift_release();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)(v0 + 46));
  swift_bridgeObjectRelease();

  swift_release();
  return swift_deallocObject();
}

void sub_24396062C(void *a1)
{
  uint64_t v1;

  sub_2439598A8(a1, *(_QWORD *)(v1 + 16), v1 + 24, *(_QWORD *)(v1 + 424));
}

uint64_t sub_24396063C()
{
  uint64_t v0;
  uint64_t v1;

  v1 = sub_24396FA04();
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

BOOL sub_24396069C(void *a1)
{
  double v2;
  double v3;
  double v4;

  sub_24396FA04();
  if (!a1)
    return 0;
  objc_msgSend(a1, sel_timestamp);
  v3 = v2;
  sub_24396F950();
  return v3 < v4;
}

uint64_t sub_243960708()
{
  return swift_deallocObject();
}

uint64_t sub_243960718()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))() & 1;
}

uint64_t sub_24396073C(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = sub_24396FA04();
    result = MEMORY[0x2494FDCE4](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t ModelMonitoringManager.init(config:executionManager:)@<X0>(void *__src@<X0>, __int128 *a2@<X1>, void *a3@<X8>)
{
  memcpy(a3, __src, 0x158uLL);
  return sub_243946A88(a2, (uint64_t)a3 + 344);
}

Swift::OpaquePointer_optional __swiftcall ModelMonitoringManager.attemptModelMonitoring()()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint8_t *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  Swift::Bool v17;
  void *v18;
  uint64_t v19;
  Swift::OpaquePointer_optional result;

  if (qword_2572D9D10 != -1)
    swift_once();
  v0 = sub_24396FAE8();
  __swift_project_value_buffer(v0, (uint64_t)qword_2572DA2B0);
  v1 = sub_24396FAD0();
  v2 = sub_24396FD04();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_243921000, v1, v2, "Starting model monitoring - feature-label correlation", v3, 2u);
    MEMORY[0x2494FDD74](v3, -1, -1);
  }

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2572D9E40);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_24396F920();
  v8 = *(_QWORD *)(v7 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56))(v6, 1, 1, v7);
  v9 = (void *)sub_24396FB48();
  v10 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) != 1)
  {
    v10 = (void *)sub_24396F8F0();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v6, v7);
  }
  v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE5F770]), sel_init_url_useSqlite_, v9, v10, 0);

  v12 = (void *)objc_opt_self();
  v13 = (void *)sub_24396FC08();
  v14 = (void *)sub_24396FB48();
  v15 = objc_msgSend(v12, sel_analyzeFeatureImportanceWithFeatureStore_featureNames_labelName_, v11, v13, v14);

  if (v15)
  {
    sub_243960A5C();
    v16 = sub_24396FB18();

    v15 = (id)sub_243960A98(v16);
    swift_bridgeObjectRelease();
  }

  v18 = v15;
  result.value._rawValue = v18;
  result.is_nil = v17;
  return result;
}

unint64_t sub_243960A5C()
{
  unint64_t result;

  result = qword_2572D9D38;
  if (!qword_2572D9D38)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2572D9D38);
  }
  return result;
}

uint64_t sub_243960A98(uint64_t a1)
{
  uint64_t result;
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t i;
  int64_t v12;
  unint64_t v13;
  int64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t *v26;
  uint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t v30;
  int64_t v31;
  uint64_t v32;
  _QWORD *v33;
  uint64_t v34;
  int64_t v35;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2572D9DF8);
  result = sub_24396FF38();
  v3 = 0;
  v33 = (_QWORD *)result;
  v34 = a1;
  v6 = *(_QWORD *)(a1 + 64);
  v5 = a1 + 64;
  v4 = v6;
  v7 = 1 << *(_BYTE *)(v5 - 32);
  v8 = -1;
  if (v7 < 64)
    v8 = ~(-1 << v7);
  v9 = v8 & v4;
  v30 = v5;
  v31 = (unint64_t)(v7 + 63) >> 6;
  v32 = result + 64;
  if ((v8 & v4) == 0)
    goto LABEL_5;
LABEL_4:
  v10 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  v35 = v3;
  for (i = v10 | (v3 << 6); ; i = __clz(__rbit64(v13)) + (v14 << 6))
  {
    v16 = (uint64_t *)(*(_QWORD *)(v34 + 48) + 16 * i);
    v17 = *v16;
    v18 = v16[1];
    v19 = *(void **)(*(_QWORD *)(v34 + 56) + 8 * i);
    swift_bridgeObjectRetain();
    v20 = v19;
    v21 = objc_msgSend(v20, sel_stringValue);
    v22 = sub_24396FB60();
    v24 = v23;

    result = (uint64_t)v33;
    *(_QWORD *)(v32 + ((i >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << i;
    v25 = (_QWORD *)(v33[6] + 16 * i);
    *v25 = v17;
    v25[1] = v18;
    v26 = (uint64_t *)(v33[7] + 16 * i);
    *v26 = v22;
    v26[1] = v24;
    v27 = v33[2];
    v28 = __OFADD__(v27, 1);
    v29 = v27 + 1;
    if (v28)
    {
      __break(1u);
LABEL_24:
      __break(1u);
      goto LABEL_25;
    }
    v33[2] = v29;
    v3 = v35;
    if (v9)
      goto LABEL_4;
LABEL_5:
    v12 = v3 + 1;
    if (__OFADD__(v3, 1))
      goto LABEL_24;
    if (v12 >= v31)
      return result;
    v13 = *(_QWORD *)(v30 + 8 * v12);
    v14 = v3 + 1;
    if (!v13)
    {
      v14 = v3 + 2;
      if (v3 + 2 >= v31)
        return result;
      v13 = *(_QWORD *)(v30 + 8 * v14);
      if (!v13)
      {
        v14 = v3 + 3;
        if (v3 + 3 >= v31)
          return result;
        v13 = *(_QWORD *)(v30 + 8 * v14);
        if (!v13)
          break;
      }
    }
LABEL_18:
    v9 = (v13 - 1) & v13;
    v35 = v14;
  }
  v15 = v3 + 4;
  if (v3 + 4 >= v31)
    return result;
  v13 = *(_QWORD *)(v30 + 8 * v15);
  if (v13)
  {
    v14 = v3 + 4;
    goto LABEL_18;
  }
  while (1)
  {
    v14 = v15 + 1;
    if (__OFADD__(v15, 1))
      break;
    if (v14 >= v31)
      return result;
    v13 = *(_QWORD *)(v30 + 8 * v14);
    ++v15;
    if (v13)
      goto LABEL_18;
  }
LABEL_25:
  __break(1u);
  return result;
}

ValueMetadata *type metadata accessor for ModelMonitoringManager()
{
  return &type metadata for ModelMonitoringManager;
}

uint64_t sub_243960CE0(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  result = sub_24396FCBC();
  v3 = 0;
  v12 = result;
  while (1)
  {
LABEL_6:
    v9 = *(_QWORD *)(a1 + 16);
    if (v3 == v9)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v12;
    }
    if (v3 >= v9)
      break;
    v10 = *(_QWORD *)(a1 + 32 + 8 * v3);
    swift_bridgeObjectRetain();
    result = swift_bridgeObjectRelease();
    ++v3;
    if (v10)
    {
      v4 = *(_QWORD *)(v10 + 16);
      if (v4)
      {
        v5 = 0;
        v6 = (uint64_t *)(v10 + 40);
        while (v5 < v4)
        {
          ++v5;
          v8 = *(v6 - 1);
          v7 = *v6;
          swift_bridgeObjectRetain();
          sub_243965A4C(&v11, v8, v7);
          result = swift_bridgeObjectRelease();
          v4 = *(_QWORD *)(v10 + 16);
          v6 += 2;
          if (v5 == v4)
            goto LABEL_6;
        }
        __break(1u);
        break;
      }
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_243960DF8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  BOOL v12;
  uint64_t result;
  uint64_t v14;
  unint64_t v15;
  _QWORD *v16;
  BOOL v17;

  if (*(_QWORD *)(a3 + 16))
  {
    sub_24396FFF8();
    sub_24396FB84();
    v6 = sub_243970010();
    v7 = -1 << *(_BYTE *)(a3 + 32);
    v8 = v6 & ~v7;
    v9 = a3 + 56;
    if (((*(_QWORD *)(a3 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) != 0)
    {
      v10 = *(_QWORD *)(a3 + 48);
      v11 = (_QWORD *)(v10 + 16 * v8);
      v12 = *v11 == a1 && v11[1] == a2;
      if (v12 || (sub_24396FF8C() & 1) != 0)
        return 1;
      v14 = ~v7;
      v15 = (v8 + 1) & v14;
      if (((*(_QWORD *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFF8)) >> v15) & 1) != 0)
      {
        while (1)
        {
          v16 = (_QWORD *)(v10 + 16 * v15);
          v17 = *v16 == a1 && v16[1] == a2;
          if (v17 || (sub_24396FF8C() & 1) != 0)
            break;
          result = 0;
          v15 = (v15 + 1) & v14;
          if (((*(_QWORD *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFF8)) >> v15) & 1) == 0)
            return result;
        }
        return 1;
      }
    }
  }
  return 0;
}

BOOL sub_243960F2C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_243960F40()
{
  sub_24396FFF8();
  sub_243970004();
  return sub_243970010();
}

uint64_t sub_243960F84()
{
  return sub_243970004();
}

uint64_t sub_243960FAC()
{
  sub_24396FFF8();
  sub_243970004();
  return sub_243970010();
}

PeopleSuggesterLighthouse::FeaturizationConfig __swiftcall FeaturizationConfig.init(identifier:)(PeopleSuggesterLighthouse::FeaturizationConfig identifier)
{
  PeopleSuggesterLighthouse::FeaturizationConfig *v1;

  *v1 = identifier;
  return identifier;
}

uint64_t sub_243960FF4()
{
  sub_24396FFF8();
  sub_243970004();
  return sub_243970010();
}

uint64_t sub_243961034()
{
  return sub_243970004();
}

uint64_t sub_243961058()
{
  sub_24396FFF8();
  sub_243970004();
  return sub_243970010();
}

uint64_t DataHarvestingManager.init(config:executionManager:readerName:)@<X0>(void *__src@<X0>, __int128 *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, _QWORD *a5@<X8>)
{
  uint64_t result;

  memcpy(a5, __src, 0x158uLL);
  result = sub_243946A88(a2, (uint64_t)(a5 + 43));
  a5[48] = a3;
  a5[49] = a4;
  return result;
}

void sub_2439610F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;

  swift_beginAccess();
  *(_QWORD *)(a3 + 16) = a2;
  swift_unknownObjectRelease();
  v5 = qword_2572D9D10;
  swift_unknownObjectRetain();
  if (v5 != -1)
    swift_once();
  v6 = sub_24396FAE8();
  __swift_project_value_buffer(v6, (uint64_t)qword_2572DA2B0);
  v7 = sub_24396FAD0();
  v8 = sub_24396FD04();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_243921000, v7, v8, "Finished reading feedback stream", v9, 2u);
    MEMORY[0x2494FDD74](v9, -1, -1);
  }

}

void sub_2439611F8(uint64_t a1, void *a2, uint64_t a3)
{
  void (*v5)(id, uint64_t);
  id v6;

  v5 = *(void (**)(id, uint64_t))(a1 + 32);
  swift_retain();
  v6 = a2;
  swift_unknownObjectRetain();
  v5(v6, a3);
  swift_release();
  swift_unknownObjectRelease();

}

void sub_243961268(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v12;
  os_log_type_t v13;
  uint8_t *v14;
  NSObject *oslog;
  uint64_t v16;

  v3 = objc_msgSend(a1, sel_eventBody);
  if (v3)
  {
    v4 = v3;
    v5 = objc_msgSend(v3, sel_identifier);
    if (v5)
    {
      v6 = v5;
      v7 = sub_24396FB60();
      v9 = v8;

      swift_beginAccess();
      v10 = v4;
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v16 = *(_QWORD *)(a2 + 16);
      *(_QWORD *)(a2 + 16) = 0x8000000000000000;
      sub_243965544((uint64_t)v10, v7, v9, isUniquelyReferenced_nonNull_native, (void (*)(void))sub_243946890, (void (*)(void))sub_243944978);
      *(_QWORD *)(a2 + 16) = v16;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_endAccess();

      return;
    }

  }
  if (qword_2572D9D10 != -1)
    swift_once();
  v12 = sub_24396FAE8();
  __swift_project_value_buffer(v12, (uint64_t)qword_2572DA2B0);
  oslog = sub_24396FAD0();
  v13 = sub_24396FD10();
  if (os_log_type_enabled(oslog, v13))
  {
    v14 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v14 = 0;
    _os_log_impl(&dword_243921000, oslog, v13, "Invalid event in feedback stream", v14, 2u);
    MEMORY[0x2494FDD74](v14, -1, -1);
  }

}

uint64_t DataHarvestingManager.harvest(appendingTrialIdentifier:appendingFeaturizationConfig:inTests:)(uint64_t a1, uint64_t *a2, char a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  void *v24;
  _QWORD *v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v30;
  uint64_t v31;
  id v32;
  _QWORD aBlock[6];
  _QWORD __src[50];
  uint64_t v35;
  uint64_t v36[7];

  v4 = v3;
  sub_243968B58(a1, (uint64_t)v36, (uint64_t *)&unk_2572D9FE0);
  v8 = *a2;
  v7 = a2[1];
  sub_24396FAA0();
  swift_allocObject();
  sub_24396FA94();
  v9 = objc_msgSend((id)BiomeLibrary(), sel_MLSE);
  swift_unknownObjectRelease();
  v10 = objc_msgSend(v9, sel_ShareSheet);
  swift_unknownObjectRelease();
  v32 = objc_msgSend(v10, sel_Feedback);
  swift_unknownObjectRelease();
  v35 = 0;
  v31 = sub_243967AE0(v32, &v35);
  v11 = swift_allocObject();
  v12 = MEMORY[0x24BEE4AF8];
  v13 = v11;
  *(_QWORD *)(v11 + 16) = MEMORY[0x24BEE4AF8];
  v14 = (uint64_t *)(v11 + 16);
  v15 = swift_allocObject();
  *(_QWORD *)(v15 + 16) = 0;
  *(_BYTE *)(v15 + 24) = 1;
  v16 = swift_allocObject();
  *(_QWORD *)(v16 + 16) = MEMORY[0x24BEE4B08];
  v30 = v4;
  sub_243967D10(v4, (uint64_t)__src);
  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = v16;
  *(_BYTE *)(v17 + 24) = a3;
  *(_QWORD *)(v17 + 32) = v13;
  memcpy((void *)(v17 + 40), __src, 0x190uLL);
  sub_243968B58((uint64_t)v36, v17 + 440, (uint64_t *)&unk_2572D9FE0);
  *(_QWORD *)(v17 + 488) = v8;
  *(_QWORD *)(v17 + 496) = v7;
  v18 = swift_allocObject();
  *(_QWORD *)(v18 + 16) = v12;
  swift_retain();
  swift_retain();
  sub_243967E58(v36);
  swift_bridgeObjectRetain();
  v19 = objc_msgSend((id)BiomeLibrary(), sel_MLSE);
  swift_unknownObjectRelease();
  v20 = objc_msgSend(v19, sel_ShareSheet);
  swift_unknownObjectRelease();
  v21 = objc_msgSend(v20, sel_VirtualFeatureStore);
  swift_unknownObjectRelease();
  v22 = objc_msgSend(v21, sel_publisher);
  __src[4] = sub_243962388;
  __src[5] = 0;
  v23 = MEMORY[0x24BDAC760];
  __src[0] = MEMORY[0x24BDAC760];
  __src[1] = 1107296256;
  __src[2] = sub_243960CDC;
  __src[3] = &block_descriptor_2;
  v24 = _Block_copy(__src);
  sub_243967D10(v4, (uint64_t)__src);
  v25 = (_QWORD *)swift_allocObject();
  memcpy(v25 + 2, __src, 0x190uLL);
  v25[52] = v18;
  v25[53] = v31;
  v25[54] = sub_243967E3C;
  v25[55] = v17;
  v25[56] = v15;
  aBlock[4] = sub_243967FC4;
  aBlock[5] = v25;
  aBlock[0] = v23;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_243963834;
  aBlock[3] = &block_descriptor_18;
  v26 = _Block_copy(aBlock);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_release();
  v27 = objc_msgSend(v22, sel_sinkWithCompletion_shouldContinue_, v24, v26);

  swift_release();
  _Block_release(v26);
  _Block_release(v24);

  swift_beginAccess();
  v28 = *v14;
  swift_bridgeObjectRetain();
  swift_release();
  swift_release();
  sub_243961890((uint64_t *)(v15 + 16), v30);
  swift_release();

  swift_release();
  swift_release();
  swift_unknownObjectRelease();
  return v28;
}

void sub_243961890(uint64_t *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  _QWORD aBlock[6];

  swift_beginAccess();
  if ((a1[1] & 1) == 0)
  {
    v4 = *a1;
    if (qword_2572D9D10 != -1)
      swift_once();
    v5 = sub_24396FAE8();
    __swift_project_value_buffer(v5, (uint64_t)qword_2572DA2B0);
    v6 = sub_24396FAD0();
    v7 = sub_24396FCF8();
    if (os_log_type_enabled(v6, v7))
    {
      v8 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_243921000, v6, v7, "Pruning events from Virtual Feature Store", v8, 2u);
      MEMORY[0x2494FDD74](v8, -1, -1);
    }

    v9 = objc_msgSend(*(id *)(a2 + 40), sel_pruner);
    v10 = swift_allocObject();
    *(_QWORD *)(v10 + 16) = v4;
    v11 = swift_allocObject();
    *(_QWORD *)(v11 + 16) = sub_243968934;
    *(_QWORD *)(v11 + 24) = v10;
    aBlock[4] = sub_243960718;
    aBlock[5] = v11;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_24395A054;
    aBlock[3] = &block_descriptor_30;
    v12 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(v9, sel_deleteEventsPassingTest_, v12);

    _Block_release(v12);
    LOBYTE(v9) = swift_isEscapingClosureAtFileLocation();
    swift_release();
    if ((v9 & 1) != 0)
    {
      __break(1u);
    }
    else
    {
      v13 = sub_24396FAD0();
      v14 = sub_24396FCF8();
      if (os_log_type_enabled(v13, v14))
      {
        v15 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)v15 = 134217984;
        aBlock[0] = v4;
        sub_24396FD94();
        _os_log_impl(&dword_243921000, v13, v14, "Pruned all events older than %f from Virtual Feature Store", v15, 0xCu);
        MEMORY[0x2494FDD74](v15, -1, -1);
      }
      swift_release();

    }
  }
}

void sub_243961B3C(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  _QWORD *v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  NSObject *v24;
  os_log_type_t v25;
  uint8_t *v26;
  uint64_t v27;
  uint8_t *v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD **v31;
  void **v32;
  uint64_t v33;
  void *v34;
  _QWORD *v35;
  id v36;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  char v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46[6];
  uint64_t v47[2];
  _QWORD v48[2];
  char v49;
  uint64_t v50;
  char v51;

  sub_243968B58(a1, (uint64_t)v48, &qword_2572DA058);
  if ((v51 & 1) != 0)
  {
    if (qword_2572D9D10 != -1)
      swift_once();
    v14 = sub_24396FAE8();
    __swift_project_value_buffer(v14, (uint64_t)qword_2572DA2B0);
    v15 = sub_24396FAD0();
    v16 = sub_24396FD10();
    if (os_log_type_enabled(v15, v16))
    {
      v17 = (uint8_t *)swift_slowAlloc();
      v18 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v17 = 138412290;
      sub_243968B9C();
      swift_allocError();
      v46[0] = _swift_stdlib_bridgeErrorToNSError();
      sub_24396FD94();
      *v18 = v46[0];
      _os_log_impl(&dword_243921000, v15, v16, "Finalizing batch failed %@", v17, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2572DA050);
      swift_arrayDestroy();
      MEMORY[0x2494FDD74](v18, -1, -1);
      MEMORY[0x2494FDD74](v17, -1, -1);
    }
  }
  else
  {
    v42 = a6;
    v43 = a7;
    v19 = v48[0];
    v20 = v48[1];
    v41 = v49;
    v44 = a8;
    v45 = v50;
    swift_beginAccess();
    v21 = *(_QWORD *)(a2 + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v22 = sub_243960DF8(v19, v20, v21);
    swift_bridgeObjectRelease();
    if ((v22 & 1) != 0)
    {
      if (qword_2572D9D10 != -1)
        swift_once();
      v23 = sub_24396FAE8();
      __swift_project_value_buffer(v23, (uint64_t)qword_2572DA2B0);
      swift_bridgeObjectRetain_n();
      v24 = sub_24396FAD0();
      v25 = sub_24396FD1C();
      if (os_log_type_enabled(v24, v25))
      {
        v40 = a4;
        v26 = (uint8_t *)swift_slowAlloc();
        v27 = swift_slowAlloc();
        v46[0] = v27;
        *(_DWORD *)v26 = 136315138;
        swift_bridgeObjectRetain();
        v47[0] = sub_2439420BC(v19, v20, v46);
        sub_24396FD94();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_243921000, v24, v25, "VFS stream contains events with overlapping session ID %s", v26, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x2494FDD74](v27, -1, -1);
        v28 = v26;
        a4 = v40;
        MEMORY[0x2494FDD74](v28, -1, -1);

      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
    }
    swift_beginAccess();
    sub_243965A4C(v47, v19, v20);
    swift_endAccess();
    swift_bridgeObjectRelease();
    v29 = v45;
    if ((a3 & 1) != 0)
    {
      v30 = *(_QWORD *)(v45 + 16);
      if (v30)
      {
        v31 = (_QWORD **)(a4 + 16);
        swift_bridgeObjectRetain();
        v32 = (void **)(v45 + 40);
        do
        {
          v33 = *((unsigned __int8 *)v32 - 8);
          v34 = *v32;
          swift_beginAccess();
          v35 = *v31;
          v36 = v34;
          isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          *v31 = v35;
          if ((isUniquelyReferenced_nonNull_native & 1) == 0)
          {
            v35 = sub_243964AF8(0, v35[2] + 1, 1, v35);
            *v31 = v35;
          }
          v39 = v35[2];
          v38 = v35[3];
          if (v39 >= v38 >> 1)
          {
            v35 = sub_243964AF8((_QWORD *)(v38 > 1), v39 + 1, 1, v35);
            *v31 = v35;
          }
          v35[2] = v39 + 1;
          v35[v39 + 4] = v33 + 1;
          swift_endAccess();

          v32 += 2;
          --v30;
        }
        while (v30);
        v29 = v45;
        swift_bridgeObjectRelease();
      }
    }
    sub_243968B58(v42, (uint64_t)v46, (uint64_t *)&unk_2572D9FE0);
    v47[0] = v43;
    v47[1] = v44;
    v15 = sub_243962034(v19, v20, v41, v29, v46, (uint64_t)v47);
    sub_24396227C((uint64_t)v15);
  }

}

id sub_243962034(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t *a5, uint64_t a6)
{
  const void *v6;
  const void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id result;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  uint64_t v24;
  void **v25;
  char v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;

  v7 = v6;
  v9 = *a5;
  v8 = (void *)a5[1];
  v11 = a5[2];
  v10 = a5[3];
  v12 = a5[4];
  v13 = *(_QWORD *)(a6 + 8);
  v29 = a5[5];
  result = objc_msgSend(objc_allocWithZone((Class)PeoplePredictionDataMLSEShareEvent), sel_init);
  if (result)
  {
    v15 = result;
    v16 = (void *)sub_24396FB48();
    objc_msgSend(v15, sel_setSessionId_, v16);

    sub_24393E124(0, &qword_2572DA070);
    v17 = (void *)MEMORY[0x2494FD588](MEMORY[0x24BEE4AF8]);
    objc_msgSend(v15, sel_setFeaturizedCandidates_, v17);

    if (v8)
    {
      v32 = v9;
      v33 = v8;
      v34 = v11;
      v35 = v10;
      v36 = v12;
      v37 = v29;
      v18 = sub_243964198();
      if (v18)
      {
        v19 = v18;
        objc_msgSend(v15, sel_setTrialIdentifier_, v18);

      }
    }
    objc_msgSend(v15, sel_setEngagementType_, dword_243971B0C[a3]);
    if (v13)
    {
      v20 = objc_allocWithZone((Class)PeoplePredictionDataFeaturizationConfig);
      swift_bridgeObjectRetain();
      v21 = objc_msgSend(v20, sel_init);
      if (!v21)
      {
        swift_bridgeObjectRelease();
        v24 = *(_QWORD *)(a4 + 16);
        if (v24)
        {
LABEL_9:
          swift_bridgeObjectRetain();
          v25 = (void **)(a4 + 40);
          do
          {
            v26 = *((_BYTE *)v25 - 8);
            v27 = *v25;
            v25 += 2;
            LOBYTE(v32) = v26;
            v33 = v27;
            v28 = v27;
            sub_2439642CC((unsigned __int8 *)&v32, v7, v15);

            --v24;
          }
          while (v24);
          swift_bridgeObjectRelease();
        }
        return v15;
      }
      v22 = v21;
      v23 = (void *)sub_24396FB48();
      objc_msgSend(v22, sel_setIdentifier_, v23);
      swift_bridgeObjectRelease();

      objc_msgSend(v15, sel_setFeaturizationConfig_, v22);
    }
    v24 = *(_QWORD *)(a4 + 16);
    if (v24)
      goto LABEL_9;
    return v15;
  }
  __break(1u);
  return result;
}

void sub_24396227C(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  os_log_type_t v4;
  uint8_t *v5;
  NSObject *oslog;

  v2 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  if (v2)
  {
    oslog = v2;
    -[NSObject logMessage:](v2, sel_logMessage_, a1);
  }
  else
  {
    if (qword_2572D9D10 != -1)
      swift_once();
    v3 = sub_24396FAE8();
    __swift_project_value_buffer(v3, (uint64_t)qword_2572DA2B0);
    oslog = sub_24396FAD0();
    v4 = sub_24396FD1C();
    if (os_log_type_enabled(oslog, v4))
    {
      v5 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_243921000, oslog, v4, "Unable to get PETEventTracker2", v5, 2u);
      MEMORY[0x2494FDD74](v5, -1, -1);
    }
  }

}

void sub_243962388(void *a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  _QWORD *v8;
  NSObject *v9;
  uint64_t v10;
  os_log_type_t v11;
  uint8_t *v12;
  NSObject *v13;
  uint64_t v14;

  if (objc_msgSend(a1, sel_state) == (id)1)
  {
    v2 = objc_msgSend(a1, sel_error);
    if (v2)
    {
      v3 = v2;
      if (qword_2572D9D10 != -1)
        swift_once();
      v4 = sub_24396FAE8();
      __swift_project_value_buffer(v4, (uint64_t)qword_2572DA2B0);
      v13 = v3;
      v5 = sub_24396FAD0();
      v6 = sub_24396FD1C();
      if (os_log_type_enabled(v5, v6))
      {
        v7 = (uint8_t *)swift_slowAlloc();
        v8 = (_QWORD *)swift_slowAlloc();
        *(_DWORD *)v7 = 138412290;
        v9 = v13;
        v14 = _swift_stdlib_bridgeErrorToNSError();
        sub_24396FD94();
        *v8 = v14;

        _os_log_impl(&dword_243921000, v5, v6, "%@", v7, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_2572DA050);
        swift_arrayDestroy();
        MEMORY[0x2494FDD74](v8, -1, -1);
        MEMORY[0x2494FDD74](v7, -1, -1);

        return;
      }

    }
    else
    {
      if (qword_2572D9D10 != -1)
        swift_once();
      v10 = sub_24396FAE8();
      __swift_project_value_buffer(v10, (uint64_t)qword_2572DA2B0);
      v13 = sub_24396FAD0();
      v11 = sub_24396FD1C();
      if (os_log_type_enabled(v13, v11))
      {
        v12 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v12 = 0;
        _os_log_impl(&dword_243921000, v13, v11, "virtual feature stream reading error", v12, 2u);
        MEMORY[0x2494FDD74](v12, -1, -1);
      }
    }

  }
}

BOOL sub_243962618(void *a1, _QWORD *a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t *), uint64_t a6, uint64_t a7)
{
  __objc2_ivar *v13;
  id v14;
  void *v15;
  char **v16;
  id v17;
  void *v18;
  uint64_t *v19;
  char **v20;
  char **v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  __objc2_ivar *v25;
  __objc2_ivar *v26;
  id v27;
  void *v28;
  id v29;
  uint64_t v30;
  char **v31;
  uint64_t v32;
  NSObject *v33;
  os_log_type_t v34;
  uint8_t *v35;
  _QWORD *v36;
  uint64_t v37;
  uint64_t v38;
  char v39;
  char v40;
  unint64_t v41;
  char v42;
  id v43;
  unint64_t v44;
  uint64_t v45;
  unint64_t v46;
  NSObject *v47;
  os_log_type_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  id v53;
  _QWORD *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void (*v61)(uint64_t *);
  uint64_t v62[3];

  v13 = &stru_251418000;
  v14 = objc_msgSend(a1, sel_eventBody);
  if (v14)
  {
    v15 = v14;
    v61 = a5;
    v16 = &selRef_initWithDomainId_derivedIntentId_bundleId_recipientsId_;
    v17 = objc_msgSend(v14, sel_shareSessionIdentifier);
    if (v17)
    {
      v18 = v17;
      v59 = a7;
      v19 = (uint64_t *)(a3 + 16);
      v60 = sub_24396FB60();
      v21 = v20;

      swift_beginAccess();
      v22 = *v19;
      if ((unint64_t)*v19 >> 62)
      {
        swift_bridgeObjectRetain();
        v23 = sub_24396FF20();
        if (v23)
        {
LABEL_5:
          v24 = v23 - 1;
          if (__OFSUB__(v23, 1))
          {
            __break(1u);
          }
          else if ((v22 & 0xC000000000000001) == 0)
          {
            if ((v24 & 0x8000000000000000) != 0)
            {
              __break(1u);
            }
            else if (v24 < *(_QWORD *)((v22 & 0xFFFFFFFFFFFFF8) + 0x10))
            {
              v25 = (__objc2_ivar *)*(id *)(v22 + 8 * v24 + 32);
              goto LABEL_10;
            }
            __break(1u);
            goto LABEL_48;
          }
          v25 = (__objc2_ivar *)MEMORY[0x2494FD69C](v24, v22);
LABEL_10:
          v26 = v25;
          swift_bridgeObjectRelease();
          v27 = -[__objc2_ivar eventBody](v26, sel_eventBody);
          if (!v27)
          {
            swift_bridgeObjectRelease();

            goto LABEL_40;
          }
          v28 = v27;
          v13 = v26;
          v29 = objc_msgSend(v27, sel_shareSessionIdentifier);

          if (!v29)
          {
            swift_bridgeObjectRelease();

            goto LABEL_40;
          }
          v30 = sub_24396FB60();
          v16 = v31;

          if (v60 == v30 && v21 == v16)
          {

            swift_bridgeObjectRelease_n();
LABEL_40:
            swift_beginAccess();
            v53 = a1;
            MEMORY[0x2494FD42C]();
            if (*(_QWORD *)((*v19 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*v19 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
              sub_24396FC38();
            sub_24396FC50();
            sub_24396FC2C();
            swift_endAccess();
            v54 = a2 + 43;
            v56 = a2[46];
            v55 = a2[47];
            __swift_project_boxed_opaque_existential_1(v54, v56);
            v39 = (*(uint64_t (**)(uint64_t, uint64_t))(v55 + 8))(v56, v55);

            return (v39 & 1) == 0;
          }
          v23 = v30;
          v40 = sub_24396FF8C();
          swift_bridgeObjectRelease();
          if ((v40 & 1) != 0)
          {

LABEL_39:
            swift_bridgeObjectRelease();
            goto LABEL_40;
          }
          if (*(_QWORD *)(a4 + 16))
          {
            swift_bridgeObjectRetain();
            v41 = sub_243942698(v23, (uint64_t)v16);
            if ((v42 & 1) != 0)
            {
              v43 = *(id *)(*(_QWORD *)(a4 + 56) + 8 * v41);
              swift_bridgeObjectRelease_n();
              swift_beginAccess();
              v44 = swift_bridgeObjectRetain();
              sub_243962D00(v44, v43, v61);

              swift_bridgeObjectRelease();
              goto LABEL_35;
            }
            swift_bridgeObjectRelease();
          }
          if (qword_2572D9D10 == -1)
          {
LABEL_30:
            v45 = sub_24396FAE8();
            __swift_project_value_buffer(v45, (uint64_t)qword_2572DA2B0);
            swift_retain_n();
            v46 = (unint64_t)v16;
            swift_bridgeObjectRetain();
            v47 = sub_24396FAD0();
            v48 = sub_24396FD1C();
            if (os_log_type_enabled(v47, v48))
            {
              v49 = swift_slowAlloc();
              v58 = swift_slowAlloc();
              v62[0] = v58;
              *(_DWORD *)v49 = 136315394;
              swift_bridgeObjectRetain();
              sub_2439420BC(v23, v46, v62);
              sub_24396FD94();
              swift_bridgeObjectRelease_n();
              *(_WORD *)(v49 + 12) = 2048;
              swift_beginAccess();
              if ((unint64_t)*v19 >> 62)
              {
                swift_bridgeObjectRetain();
                sub_24396FF20();
                swift_release();
                swift_bridgeObjectRelease();
              }
              else
              {
                swift_release();
              }
              v50 = v59;
              sub_24396FD94();
              swift_release();
              _os_log_impl(&dword_243921000, v47, v48, "Missing feedback: %s, batch size %ld", (uint8_t *)v49, 0x16u);
              swift_arrayDestroy();
              MEMORY[0x2494FDD74](v58, -1, -1);
              MEMORY[0x2494FDD74](v49, -1, -1);

              goto LABEL_36;
            }

            swift_bridgeObjectRelease_n();
            swift_release_n();
LABEL_35:
            v50 = v59;
LABEL_36:
            swift_beginAccess();
            *v19 = MEMORY[0x24BEE4AF8];
            swift_bridgeObjectRelease();
            -[__objc2_ivar timestamp](v13, sel_timestamp);
            v52 = v51;

            swift_beginAccess();
            *(_QWORD *)(v50 + 16) = v52;
            *(_BYTE *)(v50 + 24) = 0;
            goto LABEL_40;
          }
LABEL_48:
          swift_once();
          goto LABEL_30;
        }
      }
      else
      {
        v23 = *(_QWORD *)((v22 & 0xFFFFFFFFFFFFF8) + 0x10);
        swift_bridgeObjectRetain();
        if (v23)
          goto LABEL_5;
      }
      swift_bridgeObjectRelease();
      goto LABEL_39;
    }

  }
  if (qword_2572D9D10 != -1)
    swift_once();
  v32 = sub_24396FAE8();
  __swift_project_value_buffer(v32, (uint64_t)qword_2572DA2B0);
  v33 = sub_24396FAD0();
  v34 = sub_24396FD10();
  if (os_log_type_enabled(v33, v34))
  {
    v35 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v35 = 0;
    _os_log_impl(&dword_243921000, v33, v34, "Skipping invalid virtual feature store event", v35, 2u);
    MEMORY[0x2494FDD74](v35, -1, -1);
  }

  v36 = a2 + 43;
  v38 = a2[46];
  v37 = a2[47];
  __swift_project_boxed_opaque_existential_1(v36, v38);
  v39 = (*(uint64_t (**)(uint64_t, uint64_t))(v37 + 8))(v38, v37);
  return (v39 & 1) == 0;
}

void sub_243962D00(unint64_t a1, void *a2, void (*a3)(uint64_t *))
{
  double *v3;
  unint64_t v4;
  double *v5;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  double v25;
  double v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  char **v31;
  id v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  id v37;
  char **v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  _QWORD *v44;
  uint64_t v45;
  unint64_t v46;
  _QWORD *v47;
  unsigned int v48;
  uint64_t v49;
  id v50;
  void *v51;
  id v52;
  id v53;
  id v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  id v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  char v64;
  char v65;
  id v66;
  unint64_t v67;
  unint64_t v68;
  _QWORD *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  id v73;
  void *v74;
  id v75;
  id v76;
  id v77;
  void *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  unsigned int v82;
  char v83;
  id v84;
  unint64_t v85;
  unint64_t v86;
  _QWORD *v87;
  id v88;
  void *v89;
  id v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  unint64_t v97;
  unint64_t v98;
  unint64_t v99;
  id v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  _QWORD *v106;
  char v107;

  v5 = v3;
  v7 = (uint64_t)a2;
  if (!sub_243963884())
  {
    v103 = MEMORY[0x24BEE4AF8];
    if (a1 >> 62)
    {
      swift_bridgeObjectRetain();
      v18 = sub_24396FF20();
      if (v18)
        goto LABEL_9;
    }
    else
    {
      v18 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (v18)
      {
LABEL_9:
        if (v18 < 1)
        {
          __break(1u);
          goto LABEL_80;
        }
        v19 = 0;
        v20 = a1 & 0xC000000000000001;
        do
        {
          if (v20)
            v21 = (id)MEMORY[0x2494FD69C](v19, a1);
          else
            v21 = *(id *)(a1 + 8 * v19 + 32);
          v22 = v21;
          v23 = objc_msgSend(v21, sel_eventBody);

          if (v23)
          {
            MEMORY[0x2494FD42C]();
            if (*(_QWORD *)((v103 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v103 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
              sub_24396FC38();
            sub_24396FC50();
            v7 = (uint64_t)&v103;
            sub_24396FC2C();
          }
          ++v19;
        }
        while (v18 != v19);
        swift_bridgeObjectRelease();
        v4 = v103;
        if (objc_msgSend(a2, sel_engagementType) != 1)
        {
          if (v20)
          {
            swift_bridgeObjectRetain();
            v24 = (id)MEMORY[0x2494FD69C](0, a1);
            swift_bridgeObjectRelease();
LABEL_23:
            objc_msgSend(v24, sel_timestamp);
            v26 = v25;

            v27 = (unint64_t)sub_2439639B8(a2, v26, *v5);
            if (!v27)
            {
              v47 = (_QWORD *)MEMORY[0x24BEE4AF8];
              goto LABEL_111;
            }
            v7 = v27;
            v98 = v4;
            if (!(v27 >> 62))
            {
              v28 = *(_QWORD *)((v27 & 0xFFFFFFFFFFFFFF8) + 0x10);
              swift_bridgeObjectRetain();
              if (v28)
                goto LABEL_26;
LABEL_86:
              v30 = (_QWORD *)MEMORY[0x24BEE4AF8];
LABEL_87:
              swift_bridgeObjectRelease_n();
              v70 = sub_243967780((uint64_t)v30);
              swift_bridgeObjectRelease();
              if (v98 >> 62)
              {
                swift_bridgeObjectRetain();
                v71 = sub_24396FF20();
                if (v71)
                  goto LABEL_89;
              }
              else
              {
                v71 = *(_QWORD *)((v98 & 0xFFFFFFFFFFFFF8) + 0x10);
                swift_bridgeObjectRetain();
                if (v71)
                {
LABEL_89:
                  if (v71 < 1)
                  {
LABEL_129:
                    __break(1u);
                    return;
                  }
                  v72 = 0;
                  v47 = (_QWORD *)MEMORY[0x24BEE4AF8];
                  while (1)
                  {
                    if ((v98 & 0xC000000000000001) != 0)
                      v73 = (id)MEMORY[0x2494FD69C](v72, v98);
                    else
                      v73 = *(id *)(v98 + 8 * v72 + 32);
                    v74 = v73;
                    v75 = a2;
                    v76 = v74;
                    swift_bridgeObjectRetain();
                    v77 = objc_msgSend(v76, sel_itemIdentifier);
                    if (v77)
                    {
                      v78 = v77;
                      v79 = sub_24396FB60();
                      v81 = v80;

                      LOBYTE(v78) = sub_243960DF8(v79, v81, v70);
                      swift_bridgeObjectRelease();
                      swift_bridgeObjectRelease();
                      if ((v78 & 1) != 0)
                      {
                        v82 = objc_msgSend(v75, sel_engagementType);

                        if (v82 == 6)
                          v83 = 1;
                        else
                          v83 = 2;
                        goto LABEL_101;
                      }
                    }
                    else
                    {
                      swift_bridgeObjectRelease();
                    }

                    v83 = 3;
LABEL_101:
                    v84 = v76;
                    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
                      v47 = sub_243964C04(0, v47[2] + 1, 1, v47);
                    v86 = v47[2];
                    v85 = v47[3];
                    if (v86 >= v85 >> 1)
                      v47 = sub_243964C04((_QWORD *)(v85 > 1), v86 + 1, 1, v47);
                    ++v72;
                    v47[2] = v86 + 1;
                    v87 = &v47[2 * v86];
                    *((_BYTE *)v87 + 32) = v83;
                    v87[5] = v84;

                    if (v71 == v72)
                      goto LABEL_109;
                  }
                }
              }
              v47 = (_QWORD *)MEMORY[0x24BEE4AF8];
LABEL_109:
              swift_bridgeObjectRelease();
              v4 = v98;
              goto LABEL_110;
            }
LABEL_85:
            swift_bridgeObjectRetain();
            v28 = sub_24396FF20();
            if (v28)
            {
LABEL_26:
              if (v28 >= 1)
              {
                v29 = 0;
                v30 = (_QWORD *)MEMORY[0x24BEE4AF8];
                v31 = &selRef_initWithDomainId_derivedIntentId_bundleId_recipientsId_;
                while (1)
                {
                  if ((v7 & 0xC000000000000001) != 0)
                    v32 = (id)MEMORY[0x2494FD69C](v29, v7);
                  else
                    v32 = *(id *)(v7 + 8 * v29 + 32);
                  v33 = v32;
                  v34 = objc_msgSend(v32, sel_domainIdentifier);
                  if (v34)
                  {

                    v35 = objc_msgSend(v33, sel_domainIdentifier);
                  }
                  else
                  {
                    v36 = objc_msgSend(v33, v31[29]);
                    if (!v36)
                      goto LABEL_28;

                    v35 = objc_msgSend(v33, v31[29]);
                  }
                  v37 = v35;
                  if (v37)
                  {
                    v38 = v31;
                    v39 = sub_24396FB60();
                    v41 = v40;

                    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
                      v30 = sub_2439647D4(0, v30[2] + 1, 1, v30);
                    v43 = v30[2];
                    v42 = v30[3];
                    if (v43 >= v42 >> 1)
                      v30 = sub_2439647D4((_QWORD *)(v42 > 1), v43 + 1, 1, v30);
                    v30[2] = v43 + 1;
                    v44 = &v30[2 * v43];
                    v44[4] = v39;
                    v44[5] = v41;
                    v31 = v38;
                    goto LABEL_29;
                  }
LABEL_28:

LABEL_29:
                  if (v28 == ++v29)
                    goto LABEL_87;
                }
              }
              goto LABEL_128;
            }
            goto LABEL_86;
          }
          if (*(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10))
          {
            v24 = *(id *)(a1 + 32);
            goto LABEL_23;
          }
          __break(1u);
LABEL_84:
          __break(1u);
          goto LABEL_85;
        }
LABEL_49:
        if (!(v4 >> 62))
        {
          v7 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
          swift_bridgeObjectRetain();
          if (v7)
          {
LABEL_51:
            if (v7 < 1)
              goto LABEL_84;
            v49 = 0;
            v97 = v4 & 0xC000000000000001;
            v47 = (_QWORD *)MEMORY[0x24BEE4AF8];
            v99 = v4;
            while (1)
            {
              v50 = v97 ? (id)MEMORY[0x2494FD69C](v49, v4) : *(id *)(v4 + 8 * v49 + 32);
              v51 = v50;
              v52 = a2;
              v53 = v51;
              v54 = objc_msgSend(v53, sel_itemIdentifier);
              if (v54)
              {
                v55 = v54;
                v56 = sub_24396FB60();
                v58 = v57;

              }
              else
              {
                v56 = 0;
                v58 = 0;
              }
              v59 = objc_msgSend(v52, sel_engagementIdentifier);
              if (!v59)
                break;
              v60 = v59;
              v61 = sub_24396FB60();
              v63 = v62;

              if (v58)
              {
                if (v63)
                {
                  if (v56 == v61 && v58 == v63)
                  {
                    swift_bridgeObjectRelease();
                    swift_bridgeObjectRelease();
LABEL_67:

                  }
                  else
                  {
                    v65 = sub_24396FF8C();
                    swift_bridgeObjectRelease();
                    swift_bridgeObjectRelease();

                    if ((v65 & 1) == 0)
                    {
                      v64 = 3;
                      goto LABEL_72;
                    }
                  }
LABEL_71:
                  v64 = 0;
                  goto LABEL_72;
                }
                goto LABEL_66;
              }

              if (!v63)
                goto LABEL_71;
              swift_bridgeObjectRelease();
              v64 = 3;
LABEL_72:
              v66 = v53;
              if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
                v47 = sub_243964C04(0, v47[2] + 1, 1, v47);
              v68 = v47[2];
              v67 = v47[3];
              if (v68 >= v67 >> 1)
                v47 = sub_243964C04((_QWORD *)(v67 > 1), v68 + 1, 1, v47);
              ++v49;
              v47[2] = v68 + 1;
              v69 = &v47[2 * v68];
              *((_BYTE *)v69 + 32) = v64;
              v69[5] = v66;

              v4 = v99;
              if (v7 == v49)
                goto LABEL_110;
            }
            if (!v58)
              goto LABEL_67;
LABEL_66:
            swift_bridgeObjectRelease();

            v64 = 3;
            goto LABEL_72;
          }
LABEL_81:
          v47 = (_QWORD *)MEMORY[0x24BEE4AF8];
LABEL_110:
          swift_bridgeObjectRelease();
LABEL_111:
          if (v4 >> 62)
          {
            swift_bridgeObjectRetain();
            v95 = sub_24396FF20();
            swift_bridgeObjectRelease();
            if (!v95)
              goto LABEL_122;
          }
          else if (!*(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10))
          {
            goto LABEL_122;
          }
          if ((v4 & 0xC000000000000001) != 0)
          {
            v88 = (id)MEMORY[0x2494FD69C](0, v4);
          }
          else
          {
            if (!*(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10))
            {
              __break(1u);
LABEL_128:
              __break(1u);
              goto LABEL_129;
            }
            v88 = *(id *)(v4 + 32);
          }
          v89 = v88;
          swift_bridgeObjectRelease();
          v90 = objc_msgSend(v89, sel_shareSessionIdentifier);

          if (!v90)
          {
LABEL_123:
            swift_bridgeObjectRelease();
            return;
          }
          v91 = sub_24396FB60();
          v93 = v92;

          if (v47[2])
          {
            LODWORD(v94) = objc_msgSend(a2, sel_engagementType) - 1;
            v103 = v91;
            v104 = v93;
            if (v94 >= 7)
              v94 = 7;
            else
              v94 = v94;
            v105 = v94;
            v106 = v47;
            v107 = 0;
            a3(&v103);
          }
LABEL_122:
          swift_bridgeObjectRelease();
          goto LABEL_123;
        }
LABEL_80:
        swift_bridgeObjectRetain();
        v7 = sub_24396FF20();
        if (v7)
          goto LABEL_51;
        goto LABEL_81;
      }
    }
    swift_bridgeObjectRelease();
    v48 = objc_msgSend(a2, sel_engagementType);
    v4 = MEMORY[0x24BEE4AF8];
    v47 = (_QWORD *)MEMORY[0x24BEE4AF8];
    if (v48 != 1)
      goto LABEL_111;
    goto LABEL_49;
  }
  if (qword_2572D9D10 != -1)
    swift_once();
  v8 = sub_24396FAE8();
  __swift_project_value_buffer(v8, (uint64_t)qword_2572DA2B0);
  v101 = a2;
  v9 = sub_24396FAD0();
  v10 = sub_24396FD04();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc();
    v12 = swift_slowAlloc();
    v102 = v12;
    *(_DWORD *)v11 = 136315138;
    v13 = objc_msgSend(v101, sel_identifier);
    if (v13)
    {
      v14 = v13;
      v15 = sub_24396FB60();
      v17 = v16;

    }
    else
    {
      v15 = 0;
      v17 = 0;
    }
    v103 = v15;
    v104 = v17;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2572DA028);
    v45 = sub_24396FB6C();
    v103 = sub_2439420BC(v45, v46, &v102);
    sub_24396FD94();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_243921000, v9, v10, "skipping due to timeout on %s", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2494FDD74](v12, -1, -1);
    MEMORY[0x2494FDD74](v11, -1, -1);

  }
  else
  {

  }
}

uint64_t sub_243963834(uint64_t a1, void *a2)
{
  uint64_t (*v3)(void);
  id v4;

  v3 = *(uint64_t (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  LOBYTE(v3) = v3();
  swift_release();

  return v3 & 1;
}

BOOL sub_243963884()
{
  void *v0;
  id v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  unsigned int v8;
  _BOOL8 v9;
  BOOL v10;

  v1 = objc_msgSend(v0, sel_timeouts);
  sub_24393E124(0, &qword_2572DA048);
  v2 = sub_24396FC14();

  if (v2 >> 62)
    goto LABEL_15;
  v3 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v3; v3 = sub_24396FF20())
  {
    v4 = 4;
    while (1)
    {
      v5 = (v2 & 0xC000000000000001) != 0 ? (id)MEMORY[0x2494FD69C](v4 - 4, v2) : *(id *)(v2 + 8 * v4);
      v6 = v5;
      v7 = v4 - 3;
      if (__OFADD__(v4 - 4, 1))
        break;
      v8 = objc_msgSend(v5, sel_occurrence);

      v10 = v8 == 1;
      v9 = v8 == 1;
      ++v4;
      v10 = v10 || v7 == v3;
      if (v10)
        goto LABEL_17;
    }
    __break(1u);
LABEL_15:
    swift_bridgeObjectRetain();
  }
  v9 = 0;
LABEL_17:
  swift_bridgeObjectRelease_n();
  return v9;
}

id sub_2439639B8(void *a1, double a2, double a3)
{
  uint64_t v3;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  NSObject *v26;
  os_log_type_t v27;
  uint8_t *v28;
  void *v29;
  uint8_t *v30;
  id v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  void *v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  id v40;
  id v42;
  uint64_t v43;
  id v44[51];

  if (qword_2572D9D10 != -1)
    swift_once();
  v7 = sub_24396FAE8();
  __swift_project_value_buffer(v7, (uint64_t)qword_2572DA2B0);
  v43 = v3;
  sub_243967D10(v3, (uint64_t)v44);
  v8 = sub_24396FAD0();
  v9 = sub_24396FD04();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v10 = 134217984;
    sub_24396FD94();
    sub_243968874(v44);
    _os_log_impl(&dword_243921000, v8, v9, "Loading all interactions from inference to inference + %f s", v10, 0xCu);
    MEMORY[0x2494FDD74](v10, -1, -1);
  }
  else
  {
    sub_243968874(v44);
  }

  v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBCE60]), sel_initWithTimeIntervalSinceReferenceDate_, a2);
  v12 = objc_msgSend(v11, sel_dateByAddingTimeInterval_, a3);
  sub_24393E124(0, &qword_2572D9D30);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2572D9FF0);
  v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_243970F00;
  v14 = sub_24393E124(0, &qword_2572D9D40);
  *(_QWORD *)(v13 + 56) = v14;
  v15 = sub_2439688A0((unint64_t *)&unk_2572DA000, &qword_2572D9D40);
  *(_QWORD *)(v13 + 32) = v11;
  *(_QWORD *)(v13 + 96) = v14;
  *(_QWORD *)(v13 + 104) = v15;
  *(_QWORD *)(v13 + 64) = v15;
  *(_QWORD *)(v13 + 72) = v12;
  v16 = objc_allocWithZone(MEMORY[0x24BDD16E0]);
  v17 = v11;
  v18 = v12;
  v19 = objc_msgSend(v16, sel_initWithInteger_, 1);
  *(_QWORD *)(v13 + 136) = sub_24393E124(0, (unint64_t *)&qword_2572D9D38);
  *(_QWORD *)(v13 + 144) = sub_2439688A0(&qword_2572DA010, (unint64_t *)&qword_2572D9D38);
  *(_QWORD *)(v13 + 112) = v19;
  v20 = (id)sub_24396FCEC();
  if (objc_msgSend(a1, sel_engagementType) == 6
    && (v21 = objc_msgSend(a1, sel_engagementIdentifier)) != 0)
  {
    v22 = v21;
    v23 = sub_24396FB60();
    v25 = v24;

    swift_bridgeObjectRetain_n();
    v26 = sub_24396FAD0();
    v27 = sub_24396FD04();
    if (os_log_type_enabled(v26, v27))
    {
      v42 = v17;
      v28 = (uint8_t *)swift_slowAlloc();
      v29 = (void *)swift_slowAlloc();
      v44[0] = v29;
      *(_DWORD *)v28 = 136315138;
      swift_bridgeObjectRetain();
      sub_2439420BC(v23, v25, (uint64_t *)v44);
      sub_24396FD94();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_243921000, v26, v27, "Selecting interactions associated with %s in the Sharesheet", v28, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2494FDD74](v29, -1, -1);
      v30 = v28;
      v17 = v42;
      MEMORY[0x2494FDD74](v30, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    v32 = v18;
    v33 = swift_allocObject();
    *(_OWORD *)(v33 + 16) = xmmword_243970F80;
    v34 = MEMORY[0x24BEE0D00];
    *(_QWORD *)(v33 + 56) = MEMORY[0x24BEE0D00];
    v35 = sub_2439688E0();
    *(_QWORD *)(v33 + 32) = v23;
    *(_QWORD *)(v33 + 40) = v25;
    *(_QWORD *)(v33 + 96) = v34;
    *(_QWORD *)(v33 + 104) = v35;
    *(_QWORD *)(v33 + 64) = v35;
    *(_QWORD *)(v33 + 72) = v23;
    *(_QWORD *)(v33 + 80) = v25;
    swift_bridgeObjectRetain();
    v36 = (void *)sub_24396FCEC();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2572DA020);
    v37 = swift_allocObject();
    *(_OWORD *)(v37 + 16) = xmmword_243971890;
    *(_QWORD *)(v37 + 32) = v20;
    *(_QWORD *)(v37 + 40) = v36;
    v44[0] = (id)v37;
    sub_24396FC2C();
    v38 = v36;
    v39 = sub_24396FC08();
    swift_bridgeObjectRelease();
    v31 = objc_msgSend((id)objc_opt_self(), sel_andPredicateWithSubpredicates_, v39);

    v20 = (id)v39;
  }
  else
  {
    v31 = v20;
    v32 = v18;
  }

  v40 = sub_24394B48C((uint64_t)v31, *(_QWORD *)(v43 + 8));
  return v40;
}

uint64_t DataHarvestingManager.fetchInteractionsForTests(from:timeWindow:feedback:)(void *a1, double a2, double a3)
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;

  v3 = (unint64_t)sub_2439639B8(a1, a2, a3);
  v4 = v3;
  if (v3)
  {
    v5 = v3 & 0xFFFFFFFFFFFFFF8;
    if (v3 >> 62)
    {
      v9 = sub_24396FF14();
      swift_bridgeObjectRelease();
      return v9;
    }
    else
    {
      swift_bridgeObjectRetain();
      sub_24396FF98();
      if (swift_dynamicCastMetatype() || (v7 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10)) == 0)
      {
LABEL_4:
        swift_bridgeObjectRelease();
      }
      else
      {
        v8 = (_QWORD *)(v5 + 32);
        while (*v8)
        {
          ++v8;
          if (!--v7)
            goto LABEL_4;
        }
        swift_bridgeObjectRelease();
        return v5 | 1;
      }
    }
  }
  return v4;
}

Swift::Void __swiftcall DataHarvestingManager.pruneVirtualFeatureStore()()
{
  uint64_t v0;
  id v1;
  void *v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  _QWORD v7[6];

  v1 = objc_msgSend(*(id *)(v0 + 40), sel_pruner);
  v7[4] = sub_24393DC50;
  v7[5] = 0;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 1107296256;
  v7[2] = sub_24395A054;
  v7[3] = &block_descriptor_21;
  v2 = _Block_copy(v7);
  swift_release();
  objc_msgSend(v1, sel_deleteEventsPassingTest_, v2);

  _Block_release(v2);
  if ((swift_isEscapingClosureAtFileLocation() & 1) != 0)
  {
    __break(1u);
  }
  else if (qword_2572D9D10 == -1)
  {
    goto LABEL_3;
  }
  swift_once();
LABEL_3:
  v3 = sub_24396FAE8();
  __swift_project_value_buffer(v3, (uint64_t)qword_2572DA2B0);
  v4 = sub_24396FAD0();
  v5 = sub_24396FCF8();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_243921000, v4, v5, "Pruned all events from the Virtual Feature Store", v6, 2u);
    MEMORY[0x2494FDD74](v6, -1, -1);
  }

}

id sub_243964198()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  id v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;

  v2 = *(_QWORD *)(v0 + 32);
  v1 = *(_QWORD *)(v0 + 40);
  v3 = objc_msgSend(objc_allocWithZone((Class)PeoplePredictionDataTrialIdentifier), sel_init);
  v4 = v3;
  if (v3)
  {
    v5 = v3;
    v6 = (void *)sub_24396FB48();
    objc_msgSend(v5, sel_setTask_, v6);

    v7 = v5;
    v8 = (void *)sub_24396FB48();
    objc_msgSend(v7, sel_setTreatment_, v8);

    v9 = v7;
    swift_bridgeObjectRetain();
    sub_24396FBE4();
    v10 = (void *)sub_24396FB48();
    swift_bridgeObjectRelease();
    objc_msgSend(v9, sel_setDeployment_, v10, v2, v1);

  }
  return v4;
}

void sub_2439642CC(unsigned __int8 *a1, const void *a2, void *a3)
{
  void *v3;
  int v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  os_log_type_t v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  os_log_type_t v27;
  uint8_t *v28;
  uint64_t v29;
  NSObject *v30;
  os_log_type_t v31;
  uint8_t *v32;
  void *v33;
  id v34;
  void *v35;
  id v36;
  void *v37;
  id v38;
  _QWORD *v39;
  _QWORD v40[43];
  _QWORD __dst[44];
  int v42;

  v6 = *a1;
  v7 = (void *)*((_QWORD *)a1 + 1);
  v8 = objc_msgSend(objc_allocWithZone((Class)PeoplePredictionDataFeatureValue), sel_init);
  if (!v8)
  {
    if (qword_2572D9D10 != -1)
      swift_once();
    v26 = sub_24396FAE8();
    __swift_project_value_buffer(v26, (uint64_t)qword_2572DA2B0);
    v9 = sub_24396FAD0();
    v27 = sub_24396FD1C();
    if (os_log_type_enabled(v9, v27))
    {
      v28 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v28 = 0;
      MEMORY[0x2494FDD74](v28, -1, -1);
    }
    goto LABEL_21;
  }
  v9 = v8;
  v10 = objc_msgSend(objc_allocWithZone((Class)PeoplePredictionDataFeature), sel_init);
  if (!v10)
  {
    if (qword_2572D9D10 != -1)
      swift_once();
    v29 = sub_24396FAE8();
    __swift_project_value_buffer(v29, (uint64_t)qword_2572DA2B0);
    v30 = sub_24396FAD0();
    v31 = sub_24396FD1C();
    if (os_log_type_enabled(v30, v31))
    {
      v32 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v32 = 0;
      MEMORY[0x2494FDD74](v32, -1, -1);

      return;
    }

    goto LABEL_21;
  }
  v11 = v10;
  -[NSObject setIntValue:](v9, sel_setIntValue_, (v6 + 1));
  objc_msgSend(v11, sel_setFeatureValue_, v9);
  objc_msgSend(v11, sel_setFeatureName_, 386);
  memcpy(__dst, a2, 0x158uLL);
  memcpy(v40, a2, sizeof(v40));
  sub_243968BE0(__dst);
  v12 = sub_24394D034(v7, v40);
  if (!v3)
  {
    v33 = v12;
    sub_243968D04(__dst);
    v34 = objc_msgSend(v33, sel_featureVectors);
    if (v34)
    {
      v35 = v34;
      objc_msgSend(v34, sel_addObject_, v11);

      v36 = objc_msgSend(a3, sel_featurizedCandidates);
      if (v36)
      {
        v37 = v36;
        v38 = v33;
        objc_msgSend(v37, sel_addObject_, v38);

LABEL_21:
        return;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    return;
  }
  sub_243968D04(__dst);
  if (qword_2572D9D10 != -1)
    swift_once();
  v13 = sub_24396FAE8();
  __swift_project_value_buffer(v13, (uint64_t)qword_2572DA2B0);
  v14 = v7;
  v15 = v3;
  v16 = v14;
  v17 = v3;
  v18 = sub_24396FAD0();
  v19 = sub_24396FD1C();
  v20 = v19;
  if (os_log_type_enabled(v18, v19))
  {
    v21 = swift_slowAlloc();
    v42 = v20;
    v22 = v21;
    v39 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v22 = 138478083;
    v40[0] = v16;
    v23 = v16;
    sub_24396FD94();
    *v39 = v16;

    *(_WORD *)(v22 + 12) = 2112;
    v24 = v3;
    v25 = _swift_stdlib_bridgeErrorToNSError();
    v40[0] = v25;
    sub_24396FD94();
    v39[1] = v25;

    _os_log_impl(&dword_243921000, v18, (os_log_type_t)v42, "Error while translating biomeFormat to petFormat %{private}@. Error %@", (uint8_t *)v22, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2572DA050);
    swift_arrayDestroy();
    MEMORY[0x2494FDD74](v39, -1, -1);
    MEMORY[0x2494FDD74](v22, -1, -1);

  }
  else
  {

  }
}

_QWORD *sub_2439647D4(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;
  _QWORD *v13;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = a4[3];
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = a4[2];
    if (v7 <= v8)
      v9 = a4[2];
    else
      v9 = v7;
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_2572DA030);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 - 17;
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      v13 = v10 + 4;
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v13 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4])
          memmove(v13, a4 + 4, 16 * v8);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_243967814(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

char *sub_2439648E0(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = *((_QWORD *)a4 + 3);
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = *((_QWORD *)a4 + 2);
    if (v7 <= v8)
      v9 = *((_QWORD *)a4 + 2);
    else
      v9 = v7;
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_2572D9EF8);
      v10 = (char *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 - 29;
      *((_QWORD *)v10 + 2) = v8;
      *((_QWORD *)v10 + 3) = 2 * (v12 >> 2);
      v13 = v10 + 32;
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v10 = (char *)MEMORY[0x24BEE4AF8];
      v13 = (char *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[4 * v8 + 32])
          memmove(v13, a4 + 32, 4 * v8);
        *((_QWORD *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    sub_243967904(0, v8, v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

_QWORD *sub_2439649EC(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;
  _QWORD *v13;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = a4[3];
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = a4[2];
    if (v7 <= v8)
      v9 = a4[2];
    else
      v9 = v7;
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2572DA0F0);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 - 1;
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 5);
      v13 = v10 + 4;
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v13 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[4 * v8 + 4])
          memmove(v13, a4 + 4, 32 * v8);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_2439679EC(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

_QWORD *sub_243964AF8(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;
  _QWORD *v13;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = a4[3];
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = a4[2];
    if (v7 <= v8)
      v9 = a4[2];
    else
      v9 = v7;
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_2572DA068);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 - 25;
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 3);
      v13 = v10 + 4;
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v13 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[v8 + 4])
          memmove(v13, a4 + 4, 8 * v8);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_243968980(0, v8, (char *)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

_QWORD *sub_243964C04(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;
  _QWORD *v13;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = a4[3];
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = a4[2];
    if (v7 <= v8)
      v9 = a4[2];
    else
      v9 = v7;
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_2572DA038);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 - 17;
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      v13 = v10 + 4;
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v13 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4])
          memmove(v13, a4 + 4, 16 * v8);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_243968A68(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_243964D10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  _QWORD *v6;
  _QWORD **v7;
  _QWORD *v14;
  char v15;
  unint64_t v16;
  uint64_t v17;
  _BOOL8 v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t *v23;
  uint64_t result;
  unint64_t v25;
  char v26;

  v7 = (_QWORD **)v6;
  v14 = (_QWORD *)*v6;
  v16 = sub_243942698(a4, a5);
  v17 = v14[2];
  v18 = (v15 & 1) == 0;
  v19 = v17 + v18;
  if (__OFADD__(v17, v18))
  {
    __break(1u);
  }
  else
  {
    v20 = v15;
    v21 = v14[3];
    if (v21 >= v19 && (a6 & 1) != 0)
    {
LABEL_7:
      v22 = *v7;
      if ((v20 & 1) != 0)
      {
LABEL_8:
        v23 = (uint64_t *)(v22[7] + 24 * v16);
        swift_bridgeObjectRelease();
        result = swift_bridgeObjectRelease();
        *v23 = a1;
        v23[1] = a2;
        v23[2] = a3;
        return result;
      }
      goto LABEL_11;
    }
    if (v21 >= v19 && (a6 & 1) == 0)
    {
      sub_24394589C();
      goto LABEL_7;
    }
    sub_243942DE0(v19, a6 & 1);
    v25 = sub_243942698(a4, a5);
    if ((v20 & 1) == (v26 & 1))
    {
      v16 = v25;
      v22 = *v7;
      if ((v20 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      sub_2439656B4(v16, a4, a5, a1, a2, a3, v22);
      return swift_bridgeObjectRetain();
    }
  }
  result = sub_24396FFBC();
  __break(1u);
  return result;
}

id sub_243964E68(char a1, void *a2, char a3)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v7;
  char v8;
  unint64_t v9;
  uint64_t v10;
  _BOOL8 v11;
  id result;
  char v13;
  uint64_t v14;
  _QWORD *v15;
  char v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v19;

  v4 = v3;
  v7 = *v3;
  v9 = sub_2439426FC((uint64_t)a2);
  v10 = *(_QWORD *)(v7 + 16);
  v11 = (v8 & 1) == 0;
  result = (id)(v10 + v11);
  if (__OFADD__(v10, v11))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v13 = v8;
  v14 = *(_QWORD *)(v7 + 24);
  if (v14 >= (uint64_t)result && (a3 & 1) != 0)
    goto LABEL_7;
  if (v14 >= (uint64_t)result && (a3 & 1) == 0)
  {
    result = sub_243945A80();
LABEL_7:
    v15 = (_QWORD *)*v4;
    if ((v13 & 1) != 0)
    {
LABEL_8:
      *(_BYTE *)(v15[7] + v9) = a1;
      return result;
    }
LABEL_11:
    v15[(v9 >> 6) + 8] |= 1 << v9;
    *(_QWORD *)(v15[6] + 8 * v9) = a2;
    *(_BYTE *)(v15[7] + v9) = a1;
    v17 = v15[2];
    v18 = __OFADD__(v17, 1);
    v19 = v17 + 1;
    if (!v18)
    {
      v15[2] = v19;
      return a2;
    }
    goto LABEL_14;
  }
  sub_243943120((uint64_t)result, a3 & 1);
  result = (id)sub_2439426FC((uint64_t)a2);
  if ((v13 & 1) == (v16 & 1))
  {
    v9 = (unint64_t)result;
    v15 = (_QWORD *)*v4;
    if ((v13 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  sub_24396FA88();
  result = (id)sub_24396FFBC();
  __break(1u);
  return result;
}

void sub_243964FA8(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  _QWORD *v6;
  _QWORD **v7;
  _QWORD *v14;
  char v15;
  unint64_t v16;
  uint64_t v17;
  _BOOL8 v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  void *v24;
  unint64_t v25;
  char v26;

  v7 = (_QWORD **)v6;
  v14 = (_QWORD *)*v6;
  v16 = sub_243942698(a4, a5);
  v17 = v14[2];
  v18 = (v15 & 1) == 0;
  v19 = v17 + v18;
  if (__OFADD__(v17, v18))
  {
    __break(1u);
  }
  else
  {
    v20 = v15;
    v21 = v14[3];
    if (v21 >= v19 && (a6 & 1) != 0)
    {
LABEL_7:
      v22 = *v7;
      if ((v20 & 1) != 0)
      {
LABEL_8:
        v23 = v22[7] + 24 * v16;
        v24 = *(void **)(v23 + 8);
        swift_bridgeObjectRelease();

        *(_DWORD *)v23 = a1;
        *(_QWORD *)(v23 + 8) = a2;
        *(_QWORD *)(v23 + 16) = a3;
        return;
      }
      goto LABEL_11;
    }
    if (v21 >= v19 && (a6 & 1) == 0)
    {
      sub_243945C20();
      goto LABEL_7;
    }
    sub_2439433E4(v19, a6 & 1);
    v25 = sub_243942698(a4, a5);
    if ((v20 & 1) == (v26 & 1))
    {
      v16 = v25;
      v22 = *v7;
      if ((v20 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      sub_243965708(v16, a4, a5, a1, a2, a3, v22);
      swift_bridgeObjectRetain();
      return;
    }
  }
  sub_24396FFBC();
  __break(1u);
}

void sub_2439650FC(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  sub_243965544(a1, a2, a3, a4, (void (*)(void))sub_243945DF8, (void (*)(void))sub_24394370C);
}

id sub_243965110(uint64_t a1, void *a2, char a3)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v7;
  char v8;
  unint64_t v9;
  uint64_t v10;
  _BOOL8 v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  id result;
  unint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;

  v4 = v3;
  v7 = *v3;
  v9 = sub_24394272C((uint64_t)a2);
  v10 = *(_QWORD *)(v7 + 16);
  v11 = (v8 & 1) == 0;
  v12 = v10 + v11;
  if (__OFADD__(v10, v11))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v13 = v8;
  v14 = *(_QWORD *)(v7 + 24);
  if (v14 >= v12 && (a3 & 1) != 0)
    goto LABEL_7;
  if (v14 >= v12 && (a3 & 1) == 0)
  {
    sub_243945E04();
LABEL_7:
    v15 = (_QWORD *)*v4;
    if ((v13 & 1) != 0)
    {
LABEL_8:
      v16 = v15[7];
      result = (id)swift_bridgeObjectRelease();
      *(_QWORD *)(v16 + 8 * v9) = a1;
      return result;
    }
LABEL_11:
    v15[(v9 >> 6) + 8] |= 1 << v9;
    v20 = 8 * v9;
    *(_QWORD *)(v15[6] + v20) = a2;
    *(_QWORD *)(v15[7] + v20) = a1;
    v21 = v15[2];
    v22 = __OFADD__(v21, 1);
    v23 = v21 + 1;
    if (!v22)
    {
      v15[2] = v23;
      return a2;
    }
    goto LABEL_14;
  }
  sub_243943718(v12, a3 & 1);
  v18 = sub_24394272C((uint64_t)a2);
  if ((v13 & 1) == (v19 & 1))
  {
    v9 = v18;
    v15 = (_QWORD *)*v4;
    if ((v13 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  sub_24393E124(0, &qword_2572D9E38);
  result = (id)sub_24396FFBC();
  __break(1u);
  return result;
}

uint64_t sub_243965270(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7)
{
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v15;
  char v16;
  unint64_t v17;
  uint64_t v18;
  _BOOL8 v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  uint64_t result;
  unint64_t v26;
  char v27;
  uint64_t *v28;
  _QWORD *v29;
  uint64_t v30;
  BOOL v31;
  uint64_t v32;

  v8 = v7;
  v15 = *v7;
  v17 = sub_243942698(a5, a6);
  v18 = *(_QWORD *)(v15 + 16);
  v19 = (v16 & 1) == 0;
  v20 = v18 + v19;
  if (__OFADD__(v18, v19))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v21 = v16;
  v22 = *(_QWORD *)(v15 + 24);
  if (v22 >= v20 && (a7 & 1) != 0)
    goto LABEL_7;
  if (v22 >= v20 && (a7 & 1) == 0)
  {
    sub_243946328();
LABEL_7:
    v23 = (_QWORD *)*v8;
    if ((v21 & 1) != 0)
    {
LABEL_8:
      v24 = (_QWORD *)(v23[7] + 32 * v17);
      swift_bridgeObjectRelease();
      result = swift_bridgeObjectRelease();
      *v24 = a1;
      v24[1] = a2;
      v24[2] = a3;
      v24[3] = a4;
      return result;
    }
LABEL_11:
    v23[(v17 >> 6) + 8] |= 1 << v17;
    v28 = (uint64_t *)(v23[6] + 16 * v17);
    *v28 = a5;
    v28[1] = a6;
    v29 = (_QWORD *)(v23[7] + 32 * v17);
    *v29 = a1;
    v29[1] = a2;
    v29[2] = a3;
    v29[3] = a4;
    v30 = v23[2];
    v31 = __OFADD__(v30, 1);
    v32 = v30 + 1;
    if (!v31)
    {
      v23[2] = v32;
      return swift_bridgeObjectRetain();
    }
    goto LABEL_14;
  }
  sub_243944028(v20, a7 & 1);
  v26 = sub_243942698(a5, a6);
  if ((v21 & 1) == (v27 & 1))
  {
    v17 = v26;
    v23 = (_QWORD *)*v8;
    if ((v21 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = sub_24396FFBC();
  __break(1u);
  return result;
}

uint64_t sub_243965410(__int128 *a1, uint64_t a2, uint64_t a3, char a4)
{
  _QWORD *v4;
  _QWORD **v5;
  _QWORD *v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t result;
  unint64_t v21;
  char v22;

  v5 = (_QWORD **)v4;
  v10 = (_QWORD *)*v4;
  v12 = sub_243942698(a2, a3);
  v13 = v10[2];
  v14 = (v11 & 1) == 0;
  v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
  }
  else
  {
    v16 = v11;
    v17 = v10[3];
    if (v17 >= v15 && (a4 & 1) != 0)
    {
LABEL_7:
      v18 = *v5;
      if ((v16 & 1) != 0)
      {
LABEL_8:
        v19 = v18[7] + 40 * v12;
        __swift_destroy_boxed_opaque_existential_1Tm(v19);
        return sub_243946A88(a1, v19);
      }
      goto LABEL_11;
    }
    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_2439464FC();
      goto LABEL_7;
    }
    sub_243944350(v15, a4 & 1);
    v21 = sub_243942698(a2, a3);
    if ((v16 & 1) == (v22 & 1))
    {
      v12 = v21;
      v18 = *v5;
      if ((v16 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      sub_24396575C(v12, a2, a3, a1, v18);
      return swift_bridgeObjectRetain();
    }
  }
  result = sub_24396FFBC();
  __break(1u);
  return result;
}

void sub_243965544(uint64_t a1, uint64_t a2, uint64_t a3, char a4, void (*a5)(void), void (*a6)(void))
{
  _QWORD *v6;
  _QWORD *v9;
  uint64_t v14;
  char v15;
  unint64_t v16;
  uint64_t v17;
  _BOOL8 v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  uint64_t *v26;
  uint64_t v27;
  BOOL v28;
  uint64_t v29;

  v9 = v6;
  v14 = *v6;
  v16 = sub_243942698(a2, a3);
  v17 = *(_QWORD *)(v14 + 16);
  v18 = (v15 & 1) == 0;
  v19 = v17 + v18;
  if (__OFADD__(v17, v18))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v20 = v15;
  v21 = *(_QWORD *)(v14 + 24);
  if (v21 >= v19 && (a4 & 1) != 0)
    goto LABEL_7;
  if (v21 >= v19 && (a4 & 1) == 0)
  {
    a5();
LABEL_7:
    v22 = (_QWORD *)*v9;
    if ((v20 & 1) != 0)
    {
LABEL_8:
      v23 = v22[7];

      *(_QWORD *)(v23 + 8 * v16) = a1;
      return;
    }
LABEL_11:
    v22[(v16 >> 6) + 8] |= 1 << v16;
    v26 = (uint64_t *)(v22[6] + 16 * v16);
    *v26 = a2;
    v26[1] = a3;
    *(_QWORD *)(v22[7] + 8 * v16) = a1;
    v27 = v22[2];
    v28 = __OFADD__(v27, 1);
    v29 = v27 + 1;
    if (!v28)
    {
      v22[2] = v29;
      swift_bridgeObjectRetain();
      return;
    }
    goto LABEL_14;
  }
  a6();
  v24 = sub_243942698(a2, a3);
  if ((v20 & 1) == (v25 & 1))
  {
    v16 = v24;
    v22 = (_QWORD *)*v9;
    if ((v20 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  sub_24396FFBC();
  __break(1u);
}

unint64_t sub_2439656B4(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _QWORD *a7)
{
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;

  a7[(result >> 6) + 8] |= 1 << result;
  v7 = (_QWORD *)(a7[6] + 16 * result);
  *v7 = a2;
  v7[1] = a3;
  v8 = (_QWORD *)(a7[7] + 24 * result);
  *v8 = a4;
  v8[1] = a5;
  v8[2] = a6;
  v9 = a7[2];
  v10 = __OFADD__(v9, 1);
  v11 = v9 + 1;
  if (v10)
    __break(1u);
  else
    a7[2] = v11;
  return result;
}

unint64_t sub_243965708(unint64_t result, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, _QWORD *a7)
{
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;

  a7[(result >> 6) + 8] |= 1 << result;
  v7 = (_QWORD *)(a7[6] + 16 * result);
  *v7 = a2;
  v7[1] = a3;
  v8 = a7[7] + 24 * result;
  *(_DWORD *)v8 = a4;
  *(_QWORD *)(v8 + 8) = a5;
  *(_QWORD *)(v8 + 16) = a6;
  v9 = a7[2];
  v10 = __OFADD__(v9, 1);
  v11 = v9 + 1;
  if (v10)
    __break(1u);
  else
    a7[2] = v11;
  return result;
}

uint64_t sub_24396575C(unint64_t a1, uint64_t a2, uint64_t a3, __int128 *a4, _QWORD *a5)
{
  _QWORD *v6;
  uint64_t result;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;

  a5[(a1 >> 6) + 8] |= 1 << a1;
  v6 = (_QWORD *)(a5[6] + 16 * a1);
  *v6 = a2;
  v6[1] = a3;
  result = sub_243946A88(a4, a5[7] + 40 * a1);
  v8 = a5[2];
  v9 = __OFADD__(v8, 1);
  v10 = v8 + 1;
  if (v9)
    __break(1u);
  else
    a5[2] = v10;
  return result;
}

uint64_t sub_2439657C8(_QWORD *a1, void *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  id v14;
  char v15;
  uint64_t v16;
  id v17;
  char v18;
  void *v19;
  id v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  id v24;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v3 = v2;
  v6 = *v2;
  if ((*v2 & 0xC000000000000001) != 0)
  {
    if (v6 < 0)
      v7 = *v2;
    else
      v7 = v6 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain();
    v8 = a2;
    v9 = sub_24396FE00();

    if (v9)
    {
      swift_bridgeObjectRelease();

      sub_24396FA88();
      swift_unknownObjectRetain();
      swift_dynamicCast();
      *a1 = v28;
      swift_unknownObjectRelease();
      return 0;
    }
    result = sub_24396FDF4();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    v21 = sub_243965E9C(v7, result + 1);
    v29 = v21;
    v22 = *(_QWORD *)(v21 + 16);
    if (*(_QWORD *)(v21 + 24) <= v22)
    {
      v26 = v22 + 1;
      v27 = v8;
      sub_243966578(v26, &qword_2572DA100);
      v23 = v29;
    }
    else
    {
      v23 = v21;
      v24 = v8;
    }
    sub_243966810((uint64_t)v8, v23);
    *v3 = v23;
  }
  else
  {
    swift_bridgeObjectRetain();
    v11 = sub_24396FD70();
    v12 = -1 << *(_BYTE *)(v6 + 32);
    v13 = v11 & ~v12;
    if (((*(_QWORD *)(v6 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFF8)) >> v13) & 1) != 0)
    {
      sub_24396FA88();
      v14 = *(id *)(*(_QWORD *)(v6 + 48) + 8 * v13);
      v15 = sub_24396FD7C();

      if ((v15 & 1) != 0)
      {
LABEL_12:

        swift_bridgeObjectRelease();
        v19 = *(void **)(*(_QWORD *)(*v2 + 48) + 8 * v13);
        *a1 = v19;
        v20 = v19;
        return 0;
      }
      v16 = ~v12;
      while (1)
      {
        v13 = (v13 + 1) & v16;
        if (((*(_QWORD *)(v6 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFF8)) >> v13) & 1) == 0)
          break;
        v17 = *(id *)(*(_QWORD *)(v6 + 48) + 8 * v13);
        v18 = sub_24396FD7C();

        if ((v18 & 1) != 0)
          goto LABEL_12;
      }
    }
    swift_bridgeObjectRelease();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v30 = *v2;
    *v2 = 0x8000000000000000;
    v8 = a2;
    sub_243966890((uint64_t)v8, v13, isUniquelyReferenced_nonNull_native);
    *v2 = v30;
  }
  swift_bridgeObjectRelease();
  *a1 = v8;
  return 1;
}

uint64_t sub_243965A4C(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  BOOL v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v17;
  _QWORD *v18;
  BOOL v19;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v21;

  v7 = *v3;
  sub_24396FFF8();
  swift_bridgeObjectRetain();
  sub_24396FB84();
  v8 = sub_243970010();
  v9 = -1 << *(_BYTE *)(v7 + 32);
  v10 = v8 & ~v9;
  if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v11 = *(_QWORD *)(v7 + 48);
    v12 = (_QWORD *)(v11 + 16 * v10);
    v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_24396FF8C() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v14 = (uint64_t *)(*(_QWORD *)(*v3 + 48) + 16 * v10);
      v15 = v14[1];
      *a1 = *v14;
      a1[1] = v15;
      swift_bridgeObjectRetain();
      return 0;
    }
    v17 = ~v9;
    while (1)
    {
      v10 = (v10 + 1) & v17;
      if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) == 0)
        break;
      v18 = (_QWORD *)(v11 + 16 * v10);
      v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (sub_24396FF8C() & 1) != 0)
        goto LABEL_7;
    }
  }
  swift_bridgeObjectRelease();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v21 = *v3;
  *v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_243966A24(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_243965BF8(_QWORD *a1, void *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  id v14;
  char v15;
  uint64_t v16;
  id v17;
  char v18;
  void *v19;
  id v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  id v24;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v3 = v2;
  v6 = *v2;
  if ((*v2 & 0xC000000000000001) != 0)
  {
    if (v6 < 0)
      v7 = *v2;
    else
      v7 = v6 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain();
    v8 = a2;
    v9 = sub_24396FE00();

    if (v9)
    {
      swift_bridgeObjectRelease();

      sub_24393E124(0, &qword_2572DA0E0);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      *a1 = v28;
      swift_unknownObjectRelease();
      return 0;
    }
    result = sub_24396FDF4();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    v21 = sub_243966094(v7, result + 1);
    v29 = v21;
    v22 = *(_QWORD *)(v21 + 16);
    if (*(_QWORD *)(v21 + 24) <= v22)
    {
      v26 = v22 + 1;
      v27 = v8;
      sub_243966578(v26, &qword_2572DA0E8);
      v23 = v29;
    }
    else
    {
      v23 = v21;
      v24 = v8;
    }
    sub_243966810((uint64_t)v8, v23);
    *v3 = v23;
  }
  else
  {
    swift_bridgeObjectRetain();
    v11 = sub_24396FD70();
    v12 = -1 << *(_BYTE *)(v6 + 32);
    v13 = v11 & ~v12;
    if (((*(_QWORD *)(v6 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFF8)) >> v13) & 1) != 0)
    {
      sub_24393E124(0, &qword_2572DA0E0);
      v14 = *(id *)(*(_QWORD *)(v6 + 48) + 8 * v13);
      v15 = sub_24396FD7C();

      if ((v15 & 1) != 0)
      {
LABEL_12:

        swift_bridgeObjectRelease();
        v19 = *(void **)(*(_QWORD *)(*v2 + 48) + 8 * v13);
        *a1 = v19;
        v20 = v19;
        return 0;
      }
      v16 = ~v12;
      while (1)
      {
        v13 = (v13 + 1) & v16;
        if (((*(_QWORD *)(v6 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFF8)) >> v13) & 1) == 0)
          break;
        v17 = *(id *)(*(_QWORD *)(v6 + 48) + 8 * v13);
        v18 = sub_24396FD7C();

        if ((v18 & 1) != 0)
          goto LABEL_12;
      }
    }
    swift_bridgeObjectRelease();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v30 = *v2;
    *v2 = 0x8000000000000000;
    v8 = a2;
    sub_243966BBC((uint64_t)v8, v13, isUniquelyReferenced_nonNull_native);
    *v2 = v30;
  }
  swift_bridgeObjectRelease();
  *a1 = v8;
  return 1;
}

uint64_t sub_243965E9C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  char v10;
  unint64_t v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2572DA100);
    v2 = sub_24396FE30();
    v15 = v2;
    sub_24396FDE8();
    if (sub_24396FE0C())
    {
      sub_24396FA88();
      do
      {
        swift_dynamicCast();
        v2 = v15;
        v9 = *(_QWORD *)(v15 + 16);
        if (*(_QWORD *)(v15 + 24) <= v9)
        {
          sub_243966578(v9 + 1, &qword_2572DA100);
          v2 = v15;
        }
        result = sub_24396FD70();
        v4 = v2 + 56;
        v5 = -1 << *(_BYTE *)(v2 + 32);
        v6 = result & ~v5;
        v7 = v6 >> 6;
        if (((-1 << v6) & ~*(_QWORD *)(v2 + 56 + 8 * (v6 >> 6))) != 0)
        {
          v8 = __clz(__rbit64((-1 << v6) & ~*(_QWORD *)(v2 + 56 + 8 * (v6 >> 6)))) | v6 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          v10 = 0;
          v11 = (unint64_t)(63 - v5) >> 6;
          do
          {
            if (++v7 == v11 && (v10 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            v12 = v7 == v11;
            if (v7 == v11)
              v7 = 0;
            v10 |= v12;
            v13 = *(_QWORD *)(v4 + 8 * v7);
          }
          while (v13 == -1);
          v8 = __clz(__rbit64(~v13)) + (v7 << 6);
        }
        *(_QWORD *)(v4 + ((v8 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v8;
        *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v8) = v14;
        ++*(_QWORD *)(v2 + 16);
      }
      while (sub_24396FE0C());
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return MEMORY[0x24BEE4B08];
  }
  return v2;
}

uint64_t sub_243966094(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  char v10;
  unint64_t v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2572DA0E8);
    v2 = sub_24396FE30();
    v15 = v2;
    sub_24396FDE8();
    if (sub_24396FE0C())
    {
      sub_24393E124(0, &qword_2572DA0E0);
      do
      {
        swift_dynamicCast();
        v2 = v15;
        v9 = *(_QWORD *)(v15 + 16);
        if (*(_QWORD *)(v15 + 24) <= v9)
        {
          sub_243966578(v9 + 1, &qword_2572DA0E8);
          v2 = v15;
        }
        result = sub_24396FD70();
        v4 = v2 + 56;
        v5 = -1 << *(_BYTE *)(v2 + 32);
        v6 = result & ~v5;
        v7 = v6 >> 6;
        if (((-1 << v6) & ~*(_QWORD *)(v2 + 56 + 8 * (v6 >> 6))) != 0)
        {
          v8 = __clz(__rbit64((-1 << v6) & ~*(_QWORD *)(v2 + 56 + 8 * (v6 >> 6)))) | v6 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          v10 = 0;
          v11 = (unint64_t)(63 - v5) >> 6;
          do
          {
            if (++v7 == v11 && (v10 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            v12 = v7 == v11;
            if (v7 == v11)
              v7 = 0;
            v10 |= v12;
            v13 = *(_QWORD *)(v4 + 8 * v7);
          }
          while (v13 == -1);
          v8 = __clz(__rbit64(~v13)) + (v7 << 6);
        }
        *(_QWORD *)(v4 + ((v8 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v8;
        *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v8) = v14;
        ++*(_QWORD *)(v2 + 16);
      }
      while (sub_24396FE0C());
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return MEMORY[0x24BEE4B08];
  }
  return v2;
}

uint64_t sub_24396629C()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t result;
  int64_t v11;
  unint64_t v12;
  _QWORD *v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2572DA040);
  v3 = sub_24396FE24();
  v4 = v3;
  if (*(_QWORD *)(v2 + 16))
  {
    v5 = 1 << *(_BYTE *)(v2 + 32);
    v30 = (_QWORD *)(v2 + 56);
    if (v5 < 64)
      v6 = ~(-1 << v5);
    else
      v6 = -1;
    v7 = v6 & *(_QWORD *)(v2 + 56);
    v8 = (unint64_t)(v5 + 63) >> 6;
    v9 = v3 + 56;
    result = swift_retain();
    v11 = 0;
    while (1)
    {
      if (v7)
      {
        v14 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        v15 = v14 | (v11 << 6);
      }
      else
      {
        v16 = v11 + 1;
        if (__OFADD__(v11, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v8)
          goto LABEL_33;
        v17 = v30[v16];
        ++v11;
        if (!v17)
        {
          v11 = v16 + 1;
          if (v16 + 1 >= v8)
            goto LABEL_33;
          v17 = v30[v11];
          if (!v17)
          {
            v11 = v16 + 2;
            if (v16 + 2 >= v8)
              goto LABEL_33;
            v17 = v30[v11];
            if (!v17)
            {
              v18 = v16 + 3;
              if (v18 >= v8)
              {
LABEL_33:
                swift_release();
                v1 = v0;
                v29 = 1 << *(_BYTE *)(v2 + 32);
                if (v29 > 63)
                  bzero(v30, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v30 = -1 << v29;
                *(_QWORD *)(v2 + 16) = 0;
                break;
              }
              v17 = v30[v18];
              if (!v17)
              {
                while (1)
                {
                  v11 = v18 + 1;
                  if (__OFADD__(v18, 1))
                    goto LABEL_39;
                  if (v11 >= v8)
                    goto LABEL_33;
                  v17 = v30[v11];
                  ++v18;
                  if (v17)
                    goto LABEL_23;
                }
              }
              v11 = v18;
            }
          }
        }
LABEL_23:
        v7 = (v17 - 1) & v17;
        v15 = __clz(__rbit64(v17)) + (v11 << 6);
      }
      v19 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
      v20 = *v19;
      v21 = v19[1];
      sub_24396FFF8();
      sub_24396FB84();
      result = sub_243970010();
      v22 = -1 << *(_BYTE *)(v4 + 32);
      v23 = result & ~v22;
      v24 = v23 >> 6;
      if (((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6))) != 0)
      {
        v12 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v25 = 0;
        v26 = (unint64_t)(63 - v22) >> 6;
        do
        {
          if (++v24 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          v27 = v24 == v26;
          if (v24 == v26)
            v24 = 0;
          v25 |= v27;
          v28 = *(_QWORD *)(v9 + 8 * v24);
        }
        while (v28 == -1);
        v12 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(_QWORD *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      v13 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 16 * v12);
      *v13 = v20;
      v13[1] = v21;
      ++*(_QWORD *)(v4 + 16);
    }
  }
  result = swift_release();
  *v1 = v4;
  return result;
}

uint64_t sub_243966578(uint64_t a1, uint64_t *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  uint64_t v12;
  uint64_t result;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;

  v3 = v2;
  v4 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(a2);
  v5 = sub_24396FE24();
  v6 = v5;
  if (*(_QWORD *)(v4 + 16))
  {
    v30 = v2;
    v7 = 1 << *(_BYTE *)(v4 + 32);
    v8 = (_QWORD *)(v4 + 56);
    if (v7 < 64)
      v9 = ~(-1 << v7);
    else
      v9 = -1;
    v10 = v9 & *(_QWORD *)(v4 + 56);
    v11 = (unint64_t)(v7 + 63) >> 6;
    v12 = v5 + 56;
    result = swift_retain();
    v14 = 0;
    while (1)
    {
      if (v10)
      {
        v16 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        v17 = v16 | (v14 << 6);
      }
      else
      {
        v18 = v14 + 1;
        if (__OFADD__(v14, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v18 >= v11)
          goto LABEL_33;
        v19 = v8[v18];
        ++v14;
        if (!v19)
        {
          v14 = v18 + 1;
          if (v18 + 1 >= v11)
            goto LABEL_33;
          v19 = v8[v14];
          if (!v19)
          {
            v14 = v18 + 2;
            if (v18 + 2 >= v11)
              goto LABEL_33;
            v19 = v8[v14];
            if (!v19)
            {
              v20 = v18 + 3;
              if (v20 >= v11)
              {
LABEL_33:
                swift_release();
                v3 = v30;
                v29 = 1 << *(_BYTE *)(v4 + 32);
                if (v29 > 63)
                  bzero((void *)(v4 + 56), ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v8 = -1 << v29;
                *(_QWORD *)(v4 + 16) = 0;
                break;
              }
              v19 = v8[v20];
              if (!v19)
              {
                while (1)
                {
                  v14 = v20 + 1;
                  if (__OFADD__(v20, 1))
                    goto LABEL_39;
                  if (v14 >= v11)
                    goto LABEL_33;
                  v19 = v8[v14];
                  ++v20;
                  if (v19)
                    goto LABEL_23;
                }
              }
              v14 = v20;
            }
          }
        }
LABEL_23:
        v10 = (v19 - 1) & v19;
        v17 = __clz(__rbit64(v19)) + (v14 << 6);
      }
      v21 = *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v17);
      result = sub_24396FD70();
      v22 = -1 << *(_BYTE *)(v6 + 32);
      v23 = result & ~v22;
      v24 = v23 >> 6;
      if (((-1 << v23) & ~*(_QWORD *)(v12 + 8 * (v23 >> 6))) != 0)
      {
        v15 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v12 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v25 = 0;
        v26 = (unint64_t)(63 - v22) >> 6;
        do
        {
          if (++v24 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          v27 = v24 == v26;
          if (v24 == v26)
            v24 = 0;
          v25 |= v27;
          v28 = *(_QWORD *)(v12 + 8 * v24);
        }
        while (v28 == -1);
        v15 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(_QWORD *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
      *(_QWORD *)(*(_QWORD *)(v6 + 48) + 8 * v15) = v21;
      ++*(_QWORD *)(v6 + 16);
    }
  }
  result = swift_release();
  *v3 = v6;
  return result;
}

unint64_t sub_243966810(uint64_t a1, uint64_t a2)
{
  unint64_t result;

  sub_24396FD70();
  result = sub_24396FDDC();
  *(_QWORD *)(a2 + 56 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
  *(_QWORD *)(*(_QWORD *)(a2 + 48) + 8 * result) = a1;
  ++*(_QWORD *)(a2 + 16);
  return result;
}

void sub_243966890(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t *v3;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  char v13;
  uint64_t v14;
  id v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  BOOL v19;
  uint64_t v20;

  v6 = *(_QWORD *)(*v3 + 16);
  v7 = *(_QWORD *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0)
    goto LABEL_14;
  v8 = v6 + 1;
  if ((a3 & 1) != 0)
  {
    sub_243966578(v8, &qword_2572DA100);
  }
  else
  {
    if (v7 > v6)
    {
      sub_243966F10(&qword_2572DA100);
      goto LABEL_14;
    }
    sub_24396735C(v8, &qword_2572DA100);
  }
  v9 = *v3;
  v10 = sub_24396FD70();
  v11 = -1 << *(_BYTE *)(v9 + 32);
  a2 = v10 & ~v11;
  if (((*(_QWORD *)(v9 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    sub_24396FA88();
    v12 = *(id *)(*(_QWORD *)(v9 + 48) + 8 * a2);
    v13 = sub_24396FD7C();

    if ((v13 & 1) != 0)
    {
LABEL_13:
      sub_24396FFB0();
      __break(1u);
    }
    else
    {
      v14 = ~v11;
      while (1)
      {
        a2 = (a2 + 1) & v14;
        if (((*(_QWORD *)(v9 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) == 0)
          break;
        v15 = *(id *)(*(_QWORD *)(v9 + 48) + 8 * a2);
        v16 = sub_24396FD7C();

        if ((v16 & 1) != 0)
          goto LABEL_13;
      }
    }
  }
LABEL_14:
  v17 = *v3;
  *(_QWORD *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(_QWORD *)(*(_QWORD *)(v17 + 48) + 8 * a2) = a1;
  v18 = *(_QWORD *)(v17 + 16);
  v19 = __OFADD__(v18, 1);
  v20 = v18 + 1;
  if (v19)
    __break(1u);
  else
    *(_QWORD *)(v17 + 16) = v20;
}

uint64_t sub_243966A24(uint64_t result, uint64_t a2, unint64_t a3, char a4)
{
  uint64_t *v4;
  uint64_t *v5;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  BOOL v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;

  v5 = v4;
  v8 = result;
  v9 = *(_QWORD *)(*v4 + 16);
  v10 = *(_QWORD *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0)
    goto LABEL_22;
  if ((a4 & 1) != 0)
  {
    sub_24396629C();
  }
  else
  {
    if (v10 > v9)
    {
      result = (uint64_t)sub_243966D60();
      goto LABEL_22;
    }
    sub_2439670B0();
  }
  v11 = *v4;
  sub_24396FFF8();
  sub_24396FB84();
  result = sub_243970010();
  v12 = -1 << *(_BYTE *)(v11 + 32);
  a3 = result & ~v12;
  v13 = v11 + 56;
  if (((*(_QWORD *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) != 0)
  {
    v14 = *(_QWORD *)(v11 + 48);
    v15 = (_QWORD *)(v14 + 16 * a3);
    v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (result = sub_24396FF8C(), (result & 1) != 0))
    {
LABEL_21:
      result = sub_24396FFB0();
      __break(1u);
    }
    else
    {
      v17 = ~v12;
      while (1)
      {
        a3 = (a3 + 1) & v17;
        if (((*(_QWORD *)(v13 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) == 0)
          break;
        v18 = (_QWORD *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          result = sub_24396FF8C();
          if ((result & 1) == 0)
            continue;
        }
        goto LABEL_21;
      }
    }
  }
LABEL_22:
  v20 = *v5;
  *(_QWORD *)(*v5 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  v21 = (uint64_t *)(*(_QWORD *)(v20 + 48) + 16 * a3);
  *v21 = v8;
  v21[1] = a2;
  v22 = *(_QWORD *)(v20 + 16);
  v23 = __OFADD__(v22, 1);
  v24 = v22 + 1;
  if (v23)
    __break(1u);
  else
    *(_QWORD *)(v20 + 16) = v24;
  return result;
}

void sub_243966BBC(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t *v3;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  char v13;
  uint64_t v14;
  id v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  BOOL v19;
  uint64_t v20;

  v6 = *(_QWORD *)(*v3 + 16);
  v7 = *(_QWORD *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0)
    goto LABEL_14;
  v8 = v6 + 1;
  if ((a3 & 1) != 0)
  {
    sub_243966578(v8, &qword_2572DA0E8);
  }
  else
  {
    if (v7 > v6)
    {
      sub_243966F10(&qword_2572DA0E8);
      goto LABEL_14;
    }
    sub_24396735C(v8, &qword_2572DA0E8);
  }
  v9 = *v3;
  v10 = sub_24396FD70();
  v11 = -1 << *(_BYTE *)(v9 + 32);
  a2 = v10 & ~v11;
  if (((*(_QWORD *)(v9 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    sub_24393E124(0, &qword_2572DA0E0);
    v12 = *(id *)(*(_QWORD *)(v9 + 48) + 8 * a2);
    v13 = sub_24396FD7C();

    if ((v13 & 1) != 0)
    {
LABEL_13:
      sub_24396FFB0();
      __break(1u);
    }
    else
    {
      v14 = ~v11;
      while (1)
      {
        a2 = (a2 + 1) & v14;
        if (((*(_QWORD *)(v9 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) == 0)
          break;
        v15 = *(id *)(*(_QWORD *)(v9 + 48) + 8 * a2);
        v16 = sub_24396FD7C();

        if ((v16 & 1) != 0)
          goto LABEL_13;
      }
    }
  }
LABEL_14:
  v17 = *v3;
  *(_QWORD *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(_QWORD *)(*(_QWORD *)(v17 + 48) + 8 * a2) = a1;
  v18 = *(_QWORD *)(v17 + 16);
  v19 = __OFADD__(v18, 1);
  v20 = v18 + 1;
  if (v19)
    __break(1u);
  else
    *(_QWORD *)(v17 + 16) = v20;
}

void *sub_243966D60()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  _QWORD *v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2572DA040);
  v2 = *v0;
  v3 = sub_24396FE18();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_28:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 56);
  v6 = v2 + 56;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 56);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v20 >= v13)
      goto LABEL_28;
    v21 = *(_QWORD *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      v9 = v20 + 1;
      if (v20 + 1 >= v13)
        goto LABEL_28;
      v21 = *(_QWORD *)(v6 + 8 * v9);
      if (!v21)
      {
        v9 = v20 + 2;
        if (v20 + 2 >= v13)
          goto LABEL_28;
        v21 = *(_QWORD *)(v6 + 8 * v9);
        if (!v21)
          break;
      }
    }
LABEL_27:
    v12 = (v21 - 1) & v21;
    v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (_QWORD *)(*(_QWORD *)(v2 + 48) + v16);
    v18 = v17[1];
    v19 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v19 = *v17;
    v19[1] = v18;
    result = (void *)swift_bridgeObjectRetain();
  }
  v22 = v20 + 3;
  if (v22 >= v13)
    goto LABEL_28;
  v21 = *(_QWORD *)(v6 + 8 * v22);
  if (v21)
  {
    v9 = v22;
    goto LABEL_27;
  }
  while (1)
  {
    v9 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v9 >= v13)
      goto LABEL_28;
    v21 = *(_QWORD *)(v6 + 8 * v9);
    ++v22;
    if (v21)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

id sub_243966F10(uint64_t *a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id result;
  uint64_t v7;
  unint64_t v8;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  void *v18;
  int64_t v19;
  unint64_t v20;
  int64_t v21;

  v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(a1);
  v3 = *v1;
  v4 = sub_24396FE18();
  v5 = v4;
  if (!*(_QWORD *)(v3 + 16))
  {
LABEL_28:
    result = (id)swift_release();
    *v2 = v5;
    return result;
  }
  result = (id)(v4 + 56);
  v7 = v3 + 56;
  v8 = (unint64_t)((1 << *(_BYTE *)(v5 + 32)) + 63) >> 6;
  if (v5 != v3 || (unint64_t)result >= v3 + 56 + 8 * v8)
    result = memmove(result, (const void *)(v3 + 56), 8 * v8);
  v10 = 0;
  *(_QWORD *)(v5 + 16) = *(_QWORD *)(v3 + 16);
  v11 = 1 << *(_BYTE *)(v3 + 32);
  v12 = -1;
  if (v11 < 64)
    v12 = ~(-1 << v11);
  v13 = v12 & *(_QWORD *)(v3 + 56);
  v14 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      v16 = v15 | (v10 << 6);
      goto LABEL_12;
    }
    v19 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v19 >= v14)
      goto LABEL_28;
    v20 = *(_QWORD *)(v7 + 8 * v19);
    ++v10;
    if (!v20)
    {
      v10 = v19 + 1;
      if (v19 + 1 >= v14)
        goto LABEL_28;
      v20 = *(_QWORD *)(v7 + 8 * v10);
      if (!v20)
      {
        v10 = v19 + 2;
        if (v19 + 2 >= v14)
          goto LABEL_28;
        v20 = *(_QWORD *)(v7 + 8 * v10);
        if (!v20)
          break;
      }
    }
LABEL_27:
    v13 = (v20 - 1) & v20;
    v16 = __clz(__rbit64(v20)) + (v10 << 6);
LABEL_12:
    v17 = 8 * v16;
    v18 = *(void **)(*(_QWORD *)(v3 + 48) + v17);
    *(_QWORD *)(*(_QWORD *)(v5 + 48) + v17) = v18;
    result = v18;
  }
  v21 = v19 + 3;
  if (v21 >= v14)
    goto LABEL_28;
  v20 = *(_QWORD *)(v7 + 8 * v21);
  if (v20)
  {
    v10 = v21;
    goto LABEL_27;
  }
  while (1)
  {
    v10 = v21 + 1;
    if (__OFADD__(v21, 1))
      break;
    if (v10 >= v14)
      goto LABEL_28;
    v20 = *(_QWORD *)(v7 + 8 * v10);
    ++v21;
    if (v20)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_2439670B0()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t result;
  int64_t v11;
  unint64_t v12;
  _QWORD *v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  int64_t v29;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2572DA040);
  v3 = sub_24396FE24();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
LABEL_35:
    *v1 = v4;
    return result;
  }
  v5 = 1 << *(_BYTE *)(v2 + 32);
  v6 = v2 + 56;
  if (v5 < 64)
    v7 = ~(-1 << v5);
  else
    v7 = -1;
  v8 = v7 & *(_QWORD *)(v2 + 56);
  v29 = (unint64_t)(v5 + 63) >> 6;
  v9 = v3 + 56;
  result = swift_retain();
  v11 = 0;
  while (1)
  {
    if (v8)
    {
      v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      v15 = v14 | (v11 << 6);
      goto LABEL_24;
    }
    v16 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v29)
      goto LABEL_33;
    v17 = *(_QWORD *)(v6 + 8 * v16);
    ++v11;
    if (!v17)
    {
      v11 = v16 + 1;
      if (v16 + 1 >= v29)
        goto LABEL_33;
      v17 = *(_QWORD *)(v6 + 8 * v11);
      if (!v17)
      {
        v11 = v16 + 2;
        if (v16 + 2 >= v29)
          goto LABEL_33;
        v17 = *(_QWORD *)(v6 + 8 * v11);
        if (!v17)
          break;
      }
    }
LABEL_23:
    v8 = (v17 - 1) & v17;
    v15 = __clz(__rbit64(v17)) + (v11 << 6);
LABEL_24:
    v19 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v20 = *v19;
    v21 = v19[1];
    sub_24396FFF8();
    swift_bridgeObjectRetain();
    sub_24396FB84();
    result = sub_243970010();
    v22 = -1 << *(_BYTE *)(v4 + 32);
    v23 = result & ~v22;
    v24 = v23 >> 6;
    if (((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6))) != 0)
    {
      v12 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v25 = 0;
      v26 = (unint64_t)(63 - v22) >> 6;
      do
      {
        if (++v24 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        v27 = v24 == v26;
        if (v24 == v26)
          v24 = 0;
        v25 |= v27;
        v28 = *(_QWORD *)(v9 + 8 * v24);
      }
      while (v28 == -1);
      v12 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(_QWORD *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    v13 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 16 * v12);
    *v13 = v20;
    v13[1] = v21;
    ++*(_QWORD *)(v4 + 16);
  }
  v18 = v16 + 3;
  if (v18 >= v29)
  {
LABEL_33:
    result = swift_release_n();
    v1 = v0;
    goto LABEL_35;
  }
  v17 = *(_QWORD *)(v6 + 8 * v18);
  if (v17)
  {
    v11 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    v11 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v11 >= v29)
      goto LABEL_33;
    v17 = *(_QWORD *)(v6 + 8 * v11);
    ++v18;
    if (v17)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_24396735C(uint64_t a1, uint64_t *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  uint64_t v12;
  uint64_t result;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  id v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t *v29;

  v3 = v2;
  v4 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(a2);
  v5 = sub_24396FE24();
  v6 = v5;
  if (!*(_QWORD *)(v4 + 16))
  {
    result = swift_release();
LABEL_35:
    *v3 = v6;
    return result;
  }
  v29 = v2;
  v7 = 1 << *(_BYTE *)(v4 + 32);
  v8 = v4 + 56;
  if (v7 < 64)
    v9 = ~(-1 << v7);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v4 + 56);
  v11 = (unint64_t)(v7 + 63) >> 6;
  v12 = v5 + 56;
  result = swift_retain();
  v14 = 0;
  while (1)
  {
    if (v10)
    {
      v16 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v17 = v16 | (v14 << 6);
      goto LABEL_24;
    }
    v18 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v18 >= v11)
      goto LABEL_33;
    v19 = *(_QWORD *)(v8 + 8 * v18);
    ++v14;
    if (!v19)
    {
      v14 = v18 + 1;
      if (v18 + 1 >= v11)
        goto LABEL_33;
      v19 = *(_QWORD *)(v8 + 8 * v14);
      if (!v19)
      {
        v14 = v18 + 2;
        if (v18 + 2 >= v11)
          goto LABEL_33;
        v19 = *(_QWORD *)(v8 + 8 * v14);
        if (!v19)
          break;
      }
    }
LABEL_23:
    v10 = (v19 - 1) & v19;
    v17 = __clz(__rbit64(v19)) + (v14 << 6);
LABEL_24:
    v21 = *(id *)(*(_QWORD *)(v4 + 48) + 8 * v17);
    result = sub_24396FD70();
    v22 = -1 << *(_BYTE *)(v6 + 32);
    v23 = result & ~v22;
    v24 = v23 >> 6;
    if (((-1 << v23) & ~*(_QWORD *)(v12 + 8 * (v23 >> 6))) != 0)
    {
      v15 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v12 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v25 = 0;
      v26 = (unint64_t)(63 - v22) >> 6;
      do
      {
        if (++v24 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        v27 = v24 == v26;
        if (v24 == v26)
          v24 = 0;
        v25 |= v27;
        v28 = *(_QWORD *)(v12 + 8 * v24);
      }
      while (v28 == -1);
      v15 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(_QWORD *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
    *(_QWORD *)(*(_QWORD *)(v6 + 48) + 8 * v15) = v21;
    ++*(_QWORD *)(v6 + 16);
  }
  v20 = v18 + 3;
  if (v20 >= v11)
  {
LABEL_33:
    result = swift_release_n();
    v3 = v29;
    goto LABEL_35;
  }
  v19 = *(_QWORD *)(v8 + 8 * v20);
  if (v19)
  {
    v14 = v20;
    goto LABEL_23;
  }
  while (1)
  {
    v14 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    if (v14 >= v11)
      goto LABEL_33;
    v19 = *(_QWORD *)(v8 + 8 * v14);
    ++v20;
    if (v19)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t (*sub_2439675D0(uint64_t (**a1)(), unint64_t a2, uint64_t a3))()
{
  uint64_t (*v6)();

  v6 = (uint64_t (*)())malloc(0x28uLL);
  *a1 = v6;
  *((_QWORD *)v6 + 4) = sub_2439676A8(v6, a2, a3);
  return sub_243967624;
}

uint64_t (*sub_243967628(void (**a1)(id *a1), unint64_t a2, uint64_t a3))()
{
  void (*v6)(id *);

  v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((_QWORD *)v6 + 4) = sub_243967714(v6, a2, a3);
  return sub_243967624;
}

void sub_24396767C(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

uint64_t (*sub_2439676A8(uint64_t (*result)(), unint64_t a2, uint64_t a3))()
{
  uint64_t (*v3)();
  id v4;

  v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    v4 = (id)MEMORY[0x2494FD69C](a2, a3);
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    v4 = *(id *)(a3 + 8 * a2 + 32);
LABEL_5:
    *(_QWORD *)v3 = v4;
    return j__s25PeopleSuggesterLighthouse28SynchronizedExecutionManagerVwxx;
  }
  __break(1u);
  return result;
}

void (*sub_243967714(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  void (*v3)(id *);
  id v4;

  v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    v4 = (id)MEMORY[0x2494FD69C](a2, a3);
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    v4 = *(id *)(a3 + 8 * a2 + 32);
LABEL_5:
    *(_QWORD *)v3 = v4;
    return destroy for SynchronizedExecutionManager;
  }
  __break(1u);
  return result;
}

uint64_t sub_243967780(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = *(_QWORD *)(a1 + 16);
  result = sub_24396FCBC();
  v8 = result;
  if (v2)
  {
    v4 = (uint64_t *)(a1 + 40);
    do
    {
      v5 = *(v4 - 1);
      v6 = *v4;
      swift_bridgeObjectRetain();
      sub_243965A4C(&v7, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

uint64_t sub_243967814(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = a4 + 16 * a1 + 32;
    v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_24396FF5C();
  __break(1u);
  return result;
}

char *sub_243967904(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4;
  char *v5;
  size_t v6;
  char *v7;
  char *result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = (char *)(a4 + 4 * a1 + 32);
    v6 = 4 * v4;
    v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  result = (char *)sub_24396FF5C();
  __break(1u);
  return result;
}

uint64_t sub_2439679EC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = a4 + 32 * a1 + 32;
    v6 = a3 + 32 * v4;
    if (v5 >= v6 || v5 + 32 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_24396FF5C();
  __break(1u);
  return result;
}

uint64_t sub_243967AE0(void *a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t aBlock;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;

  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = 0;
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = sub_24393F7F0(MEMORY[0x24BEE4AF8]);
  v6 = objc_msgSend(a1, sel_publisher);
  v7 = *a2;
  v18 = sub_243968E60;
  v19 = v4;
  v8 = MEMORY[0x24BDAC760];
  aBlock = MEMORY[0x24BDAC760];
  v15 = 1107296256;
  v16 = sub_2439611F8;
  v17 = &block_descriptor_39;
  v9 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  v18 = sub_243968E68;
  v19 = v5;
  aBlock = v8;
  v15 = 1107296256;
  v16 = sub_243960CDC;
  v17 = &block_descriptor_42;
  v10 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  v11 = objc_msgSend(v6, sel_sinkWithBookmark_completion_receiveInput_, v7, v9, v10);
  _Block_release(v10);
  _Block_release(v9);

  swift_beginAccess();
  v12 = *(_QWORD *)(v5 + 16);
  swift_bridgeObjectRetain();
  swift_release();
  swift_beginAccess();
  *a2 = *(_QWORD *)(v4 + 16);
  swift_unknownObjectRetain();
  swift_release();
  swift_unknownObjectRelease();
  return v12;
}

uint64_t sub_243967CDC()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_243967D00()
{
  return swift_deallocObject();
}

uint64_t sub_243967D10(uint64_t a1, uint64_t a2)
{
  initializeWithCopy for DataHarvestingManager(a2, a1);
  return a2;
}

uint64_t sub_243967D44()
{
  uint64_t v0;

  swift_release();
  swift_release();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 384);
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(v0 + 448))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

void sub_243967E3C(uint64_t a1)
{
  uint64_t v1;

  sub_243961B3C(a1, *(_QWORD *)(v1 + 16), *(_BYTE *)(v1 + 24), *(_QWORD *)(v1 + 32), v1 + 40, v1 + 440, *(_QWORD *)(v1 + 488), *(_QWORD *)(v1 + 496));
}

uint64_t *sub_243967E58(uint64_t *a1)
{
  sub_243967E8C(*a1, a1[1]);
  return a1;
}

uint64_t sub_243967E8C(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t block_copy_helper_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_2()
{
  return swift_release();
}

uint64_t sub_243967EE0()
{
  id *v0;

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)(v0 + 45));
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

BOOL sub_243967FC4(void *a1)
{
  uint64_t v1;

  return sub_243962618(a1, (_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 416), *(_QWORD *)(v1 + 424), *(void (**)(uint64_t *))(v1 + 432), *(_QWORD *)(v1 + 440), *(_QWORD *)(v1 + 448));
}

_QWORD *initializeBufferWithCopyOfBuffer for FeaturizationConfig(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for FeaturizationConfig()
{
  return swift_bridgeObjectRelease();
}

_QWORD *assignWithCopy for FeaturizationConfig(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_QWORD *assignWithTake for FeaturizationConfig(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for FeaturizationConfig()
{
  return &type metadata for FeaturizationConfig;
}

uint64_t destroy for DataHarvestingManager(id *a1)
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)(a1 + 43));
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for DataHarvestingManager(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  void (*v27)(uint64_t, uint64_t, uint64_t);
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v4 = *(void **)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  v30 = v4;
  v31 = *(void **)(a2 + 32);
  v32 = *(void **)(a2 + 40);
  *(_QWORD *)(a1 + 32) = v31;
  *(_QWORD *)(a1 + 40) = v32;
  v33 = *(void **)(a2 + 48);
  *(_QWORD *)(a1 + 48) = v33;
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  *(_WORD *)(a1 + 57) = *(_WORD *)(a2 + 57);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_BYTE *)(a1 + 72) = *(_BYTE *)(a2 + 72);
  *(_WORD *)(a1 + 73) = *(_WORD *)(a2 + 73);
  v5 = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = v5;
  v6 = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = v6;
  v7 = *(_QWORD *)(a2 + 120);
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 120) = v7;
  v8 = *(_QWORD *)(a2 + 136);
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  *(_QWORD *)(a1 + 136) = v8;
  v9 = *(_QWORD *)(a2 + 152);
  *(_QWORD *)(a1 + 144) = *(_QWORD *)(a2 + 144);
  *(_QWORD *)(a1 + 152) = v9;
  v10 = *(_QWORD *)(a2 + 168);
  *(_QWORD *)(a1 + 160) = *(_QWORD *)(a2 + 160);
  *(_QWORD *)(a1 + 168) = v10;
  v11 = *(_QWORD *)(a2 + 184);
  *(_QWORD *)(a1 + 176) = *(_QWORD *)(a2 + 176);
  *(_QWORD *)(a1 + 184) = v11;
  v12 = *(_QWORD *)(a2 + 200);
  *(_QWORD *)(a1 + 192) = *(_QWORD *)(a2 + 192);
  *(_QWORD *)(a1 + 200) = v12;
  v13 = *(_QWORD *)(a2 + 216);
  *(_QWORD *)(a1 + 208) = *(_QWORD *)(a2 + 208);
  *(_QWORD *)(a1 + 216) = v13;
  v14 = *(_QWORD *)(a2 + 232);
  *(_QWORD *)(a1 + 224) = *(_QWORD *)(a2 + 224);
  *(_QWORD *)(a1 + 232) = v14;
  v15 = *(_QWORD *)(a2 + 248);
  *(_QWORD *)(a1 + 240) = *(_QWORD *)(a2 + 240);
  *(_QWORD *)(a1 + 248) = v15;
  v16 = *(_QWORD *)(a2 + 264);
  *(_QWORD *)(a1 + 256) = *(_QWORD *)(a2 + 256);
  *(_QWORD *)(a1 + 264) = v16;
  *(_OWORD *)(a1 + 272) = *(_OWORD *)(a2 + 272);
  v17 = *(_QWORD *)(a2 + 296);
  *(_QWORD *)(a1 + 288) = *(_QWORD *)(a2 + 288);
  *(_QWORD *)(a1 + 296) = v17;
  *(_OWORD *)(a1 + 304) = *(_OWORD *)(a2 + 304);
  v18 = *(_QWORD *)(a2 + 328);
  *(_QWORD *)(a1 + 320) = *(_QWORD *)(a2 + 320);
  *(_QWORD *)(a1 + 328) = v18;
  *(_QWORD *)(a1 + 336) = *(_QWORD *)(a2 + 336);
  v28 = a2 + 344;
  v29 = a1 + 344;
  v19 = *(_OWORD *)(a2 + 368);
  *(_OWORD *)(a1 + 368) = v19;
  v20 = v19;
  v27 = **(void (***)(uint64_t, uint64_t, uint64_t))(v19 - 8);
  swift_bridgeObjectRetain();
  v21 = v30;
  v22 = v31;
  v23 = v32;
  v24 = v33;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v27(v29, v28, v20);
  v25 = *(_QWORD *)(a2 + 392);
  *(_QWORD *)(a1 + 384) = *(_QWORD *)(a2 + 384);
  *(_QWORD *)(a1 + 392) = v25;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for DataHarvestingManager(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = *(void **)(a2 + 24);
  v5 = *(void **)(a1 + 24);
  *(_QWORD *)(a1 + 24) = v4;
  v6 = v4;

  v7 = *(void **)(a2 + 32);
  v8 = *(void **)(a1 + 32);
  *(_QWORD *)(a1 + 32) = v7;
  v9 = v7;

  v10 = *(void **)(a2 + 40);
  v11 = *(void **)(a1 + 40);
  *(_QWORD *)(a1 + 40) = v10;
  v12 = v10;

  v13 = *(void **)(a2 + 48);
  v14 = *(void **)(a1 + 48);
  *(_QWORD *)(a1 + 48) = v13;
  v15 = v13;

  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  *(_BYTE *)(a1 + 57) = *(_BYTE *)(a2 + 57);
  *(_BYTE *)(a1 + 58) = *(_BYTE *)(a2 + 58);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_BYTE *)(a1 + 72) = *(_BYTE *)(a2 + 72);
  *(_BYTE *)(a1 + 73) = *(_BYTE *)(a2 + 73);
  *(_BYTE *)(a1 + 74) = *(_BYTE *)(a2 + 74);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  *(_QWORD *)(a1 + 136) = *(_QWORD *)(a2 + 136);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 144) = *(_QWORD *)(a2 + 144);
  *(_QWORD *)(a1 + 152) = *(_QWORD *)(a2 + 152);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 160) = *(_QWORD *)(a2 + 160);
  *(_QWORD *)(a1 + 168) = *(_QWORD *)(a2 + 168);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 176) = *(_QWORD *)(a2 + 176);
  *(_QWORD *)(a1 + 184) = *(_QWORD *)(a2 + 184);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 192) = *(_QWORD *)(a2 + 192);
  *(_QWORD *)(a1 + 200) = *(_QWORD *)(a2 + 200);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 208) = *(_QWORD *)(a2 + 208);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 216) = *(_QWORD *)(a2 + 216);
  *(_QWORD *)(a1 + 224) = *(_QWORD *)(a2 + 224);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 232) = *(_QWORD *)(a2 + 232);
  *(_QWORD *)(a1 + 240) = *(_QWORD *)(a2 + 240);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 248) = *(_QWORD *)(a2 + 248);
  *(_QWORD *)(a1 + 256) = *(_QWORD *)(a2 + 256);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 264) = *(_QWORD *)(a2 + 264);
  *(_QWORD *)(a1 + 272) = *(_QWORD *)(a2 + 272);
  *(_QWORD *)(a1 + 280) = *(_QWORD *)(a2 + 280);
  *(_QWORD *)(a1 + 288) = *(_QWORD *)(a2 + 288);
  *(_QWORD *)(a1 + 296) = *(_QWORD *)(a2 + 296);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 304) = *(_QWORD *)(a2 + 304);
  *(_QWORD *)(a1 + 312) = *(_QWORD *)(a2 + 312);
  *(_QWORD *)(a1 + 320) = *(_QWORD *)(a2 + 320);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 328) = *(_QWORD *)(a2 + 328);
  *(_QWORD *)(a1 + 336) = *(_QWORD *)(a2 + 336);
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 344), (uint64_t *)(a2 + 344));
  *(_QWORD *)(a1 + 384) = *(_QWORD *)(a2 + 384);
  *(_QWORD *)(a1 + 392) = *(_QWORD *)(a2 + 392);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for DataHarvestingManager(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v4;
  swift_bridgeObjectRelease();
  v5 = *(void **)(a1 + 24);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);

  v6 = *(void **)(a1 + 32);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);

  v7 = *(void **)(a1 + 40);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);

  v8 = *(void **)(a1 + 48);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);

  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  *(_BYTE *)(a1 + 57) = *(_BYTE *)(a2 + 57);
  *(_BYTE *)(a1 + 58) = *(_BYTE *)(a2 + 58);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_BYTE *)(a1 + 72) = *(_BYTE *)(a2 + 72);
  *(_BYTE *)(a1 + 73) = *(_BYTE *)(a2 + 73);
  *(_BYTE *)(a1 + 74) = *(_BYTE *)(a2 + 74);
  v9 = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = v9;
  swift_bridgeObjectRelease();
  v10 = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = v10;
  swift_bridgeObjectRelease();
  v11 = *(_QWORD *)(a2 + 120);
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 120) = v11;
  swift_bridgeObjectRelease();
  v12 = *(_QWORD *)(a2 + 136);
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  *(_QWORD *)(a1 + 136) = v12;
  swift_bridgeObjectRelease();
  v13 = *(_QWORD *)(a2 + 152);
  *(_QWORD *)(a1 + 144) = *(_QWORD *)(a2 + 144);
  *(_QWORD *)(a1 + 152) = v13;
  swift_bridgeObjectRelease();
  v14 = *(_QWORD *)(a2 + 168);
  *(_QWORD *)(a1 + 160) = *(_QWORD *)(a2 + 160);
  *(_QWORD *)(a1 + 168) = v14;
  swift_bridgeObjectRelease();
  v15 = *(_QWORD *)(a2 + 184);
  *(_QWORD *)(a1 + 176) = *(_QWORD *)(a2 + 176);
  *(_QWORD *)(a1 + 184) = v15;
  swift_bridgeObjectRelease();
  v16 = *(_QWORD *)(a2 + 200);
  *(_QWORD *)(a1 + 192) = *(_QWORD *)(a2 + 192);
  *(_QWORD *)(a1 + 200) = v16;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 208) = *(_QWORD *)(a2 + 208);
  swift_bridgeObjectRelease();
  v17 = *(_QWORD *)(a2 + 224);
  *(_QWORD *)(a1 + 216) = *(_QWORD *)(a2 + 216);
  *(_QWORD *)(a1 + 224) = v17;
  swift_bridgeObjectRelease();
  v18 = *(_QWORD *)(a2 + 240);
  *(_QWORD *)(a1 + 232) = *(_QWORD *)(a2 + 232);
  *(_QWORD *)(a1 + 240) = v18;
  swift_bridgeObjectRelease();
  v19 = *(_QWORD *)(a2 + 256);
  *(_QWORD *)(a1 + 248) = *(_QWORD *)(a2 + 248);
  *(_QWORD *)(a1 + 256) = v19;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 264) = *(_QWORD *)(a2 + 264);
  *(_QWORD *)(a1 + 272) = *(_QWORD *)(a2 + 272);
  *(_OWORD *)(a1 + 280) = *(_OWORD *)(a2 + 280);
  *(_QWORD *)(a1 + 296) = *(_QWORD *)(a2 + 296);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 304) = *(_OWORD *)(a2 + 304);
  *(_QWORD *)(a1 + 320) = *(_QWORD *)(a2 + 320);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 328) = *(_QWORD *)(a2 + 328);
  *(_QWORD *)(a1 + 336) = *(_QWORD *)(a2 + 336);
  __swift_destroy_boxed_opaque_existential_1Tm(a1 + 344);
  v20 = *(_OWORD *)(a2 + 360);
  *(_OWORD *)(a1 + 344) = *(_OWORD *)(a2 + 344);
  *(_OWORD *)(a1 + 360) = v20;
  *(_OWORD *)(a1 + 376) = *(_OWORD *)(a2 + 376);
  *(_QWORD *)(a1 + 392) = *(_QWORD *)(a2 + 392);
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for DataHarvestingManager()
{
  return &type metadata for DataHarvestingManager;
}

id *sub_243968874(id *a1)
{
  destroy for DataHarvestingManager(a1);
  return a1;
}

uint64_t sub_2439688A0(unint64_t *a1, unint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = sub_24393E124(255, a2);
    result = MEMORY[0x2494FDCE4](MEMORY[0x24BEE5BE8], v4);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_2439688E0()
{
  unint64_t result;

  result = qword_2572DA018;
  if (!qword_2572DA018)
  {
    result = MEMORY[0x2494FDCE4](MEMORY[0x24BDCFB48], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_2572DA018);
  }
  return result;
}

uint64_t sub_243968924()
{
  return swift_deallocObject();
}

BOOL sub_243968934(void *a1)
{
  uint64_t v1;
  double v2;
  double v3;

  if (!a1)
    return 1;
  v2 = *(double *)(v1 + 16);
  objc_msgSend(a1, sel_timestamp);
  return v3 <= v2;
}

uint64_t sub_243968970()
{
  return swift_deallocObject();
}

char *sub_243968980(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4;
  char *v5;
  size_t v6;
  char *v7;
  char *result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = (char *)(a4 + 8 * a1 + 32);
    v6 = 8 * v4;
    v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  result = (char *)sub_24396FF5C();
  __break(1u);
  return result;
}

uint64_t sub_243968A68(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = a4 + 16 * a1 + 32;
    v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_24396FF5C();
  __break(1u);
  return result;
}

uint64_t sub_243968B58(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

unint64_t sub_243968B9C()
{
  unint64_t result;

  result = qword_2572DA060;
  if (!qword_2572DA060)
  {
    result = MEMORY[0x2494FDCE4](&unk_243971AC8, &type metadata for BatchFinalizationError);
    atomic_store(result, (unint64_t *)&qword_2572DA060);
  }
  return result;
}

_QWORD *sub_243968BE0(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;

  v3 = (void *)a1[3];
  v2 = (void *)a1[4];
  v5 = (void *)a1[5];
  v4 = (void *)a1[6];
  swift_bridgeObjectRetain();
  v6 = v3;
  v7 = v2;
  v8 = v5;
  v9 = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *sub_243968D04(_QWORD *a1)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v6 = (void *)a1[3];
  v4 = (void *)a1[5];
  v5 = (void *)a1[4];
  v3 = (void *)a1[6];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_243968E3C()
{
  swift_unknownObjectRelease();
  return swift_deallocObject();
}

void sub_243968E60(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_2439610F4(a1, a2, v2);
}

void sub_243968E68(void *a1)
{
  uint64_t v1;

  sub_243961268(a1, v1);
}

uint64_t getEnumTagSinglePayload for BatchFinalizationError(unsigned int *a1, int a2)
{
  int v2;
  int v3;

  if (!a2)
    return 0;
  if ((a2 + 1) >= 0x10000)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 1) < 0x100)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
    return *a1;
  if (v3 == 2)
    return *(unsigned __int16 *)a1;
  return *(unsigned __int8 *)a1;
}

uint64_t storeEnumTagSinglePayload for BatchFinalizationError(uint64_t a1, int a2, int a3)
{
  int v3;
  uint64_t v4;

  if ((a3 + 1) >= 0x10000)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) < 0x100)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3)
    v4 = v4;
  else
    v4 = 0;
  if (a2)
    return ((uint64_t (*)(void))((char *)sub_243968F04 + 4 * byte_243971920[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_243968F24 + 4 * byte_243971925[v4]))();
}

_BYTE *sub_243968F04(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_243968F24(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_243968F2C(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_243968F34(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_243968F3C(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_243968F44(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_243968F50()
{
  return 0;
}

ValueMetadata *type metadata accessor for BatchFinalizationError()
{
  return &type metadata for BatchFinalizationError;
}

uint64_t destroy for SessionLabeledFeatureSnapshot()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for SessionLabeledFeatureSnapshot(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for SessionLabeledFeatureSnapshot(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t assignWithTake for SessionLabeledFeatureSnapshot(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SessionLabeledFeatureSnapshot(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 32))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SessionLabeledFeatureSnapshot(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 32) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 32) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for SessionLabeledFeatureSnapshot()
{
  return &type metadata for SessionLabeledFeatureSnapshot;
}

uint64_t initializeBufferWithCopyOfBuffer for LabeledFeatureSnapshot(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v3 = *(void **)(a2 + 8);
  *(_QWORD *)(a1 + 8) = v3;
  v4 = v3;
  return a1;
}

void destroy for LabeledFeatureSnapshot(uint64_t a1)
{

}

uint64_t assignWithCopy for LabeledFeatureSnapshot(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  id v5;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v3 = *(void **)(a2 + 8);
  v4 = *(void **)(a1 + 8);
  *(_QWORD *)(a1 + 8) = v3;
  v5 = v3;

  return a1;
}

uint64_t assignWithTake for LabeledFeatureSnapshot(uint64_t a1, uint64_t a2)
{
  void *v3;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v3 = *(void **)(a1 + 8);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);

  return a1;
}

uint64_t _s25PeopleSuggesterLighthouse19FeaturizationConfigVwet_0(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 16))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t sub_243969228(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 16) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for LabeledFeatureSnapshot()
{
  return &type metadata for LabeledFeatureSnapshot;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for EngagementType(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFA)
    goto LABEL_17;
  if (a2 + 6 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 6) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 6;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 6;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 6;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 7;
  v8 = v6 - 7;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for EngagementType(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 6 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 6) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFA)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF9)
    return ((uint64_t (*)(void))((char *)&loc_24396935C + 4 * byte_24397192F[v4]))();
  *a1 = a2 + 6;
  return ((uint64_t (*)(void))((char *)sub_243969390 + 4 * byte_24397192A[v4]))();
}

uint64_t sub_243969390(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_243969398(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2439693A0);
  return result;
}

uint64_t sub_2439693AC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2439693B4);
  *(_BYTE *)result = a2 + 6;
  return result;
}

uint64_t sub_2439693B8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2439693C0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2439693CC(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_2439693D4(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for EngagementType()
{
  return &type metadata for EngagementType;
}

unint64_t sub_2439693F0()
{
  unint64_t result;

  result = qword_2572DA108;
  if (!qword_2572DA108)
  {
    result = MEMORY[0x2494FDCE4](&unk_243971A38, &type metadata for EngagementType);
    atomic_store(result, (unint64_t *)&qword_2572DA108);
  }
  return result;
}

unint64_t sub_243969438()
{
  unint64_t result;

  result = qword_2572DA110;
  if (!qword_2572DA110)
  {
    result = MEMORY[0x2494FDCE4](&unk_243971AA0, &type metadata for BatchFinalizationError);
    atomic_store(result, (unint64_t *)&qword_2572DA110);
  }
  return result;
}

uint64_t sub_2439694C0(uint64_t a1, char a2)
{
  uint64_t result;
  __int16 v5;
  __int16 v6;

  if (!objc_msgSend((id)objc_opt_self(), sel_isInternalDevice) || (a2 & 1) == 0 || a1 < 0xB)
    return a1;
  if (a1 <= 0x64)
    return a1 - a1 % 0xAu;
  if (a1 <= 0x3E8)
  {
    v5 = (unsigned __int16)a1 / 0x64u;
    v6 = 100;
  }
  else
  {
    result = 10000;
    if (a1 > 0x2710)
      return result;
    v5 = (unsigned __int16)a1 / 0x3E8u;
    v6 = 1000;
  }
  return a1 - (unsigned __int16)(a1 - v5 * v6);
}

uint64_t sub_243969580()
{
  uint64_t v0;

  v0 = sub_24396FAE8();
  __swift_allocate_value_buffer(v0, qword_2572DA2B0);
  __swift_project_value_buffer(v0, (uint64_t)qword_2572DA2B0);
  return sub_24396FADC();
}

uint64_t sub_2439695F0()
{
  sub_24396FFF8();
  sub_243970004();
  return sub_243970010();
}

uint64_t sub_243969634()
{
  return sub_243970004();
}

uint64_t sub_243969660()
{
  sub_24396FFF8();
  sub_243970004();
  return sub_243970010();
}

uint64_t sub_2439696A0@<X0>(unint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = sub_24396BA48(*a1);
  *a2 = result;
  return result;
}

void sub_2439696C8(_QWORD *a1@<X8>)
{
  unsigned __int8 *v1;

  *a1 = *v1 + 1;
}

uint64_t sub_2439696E0(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v3;
  uint64_t v5;

  if ((a3 & 1) != 0)
  {
    v3 = 0x72456D6F74737563;
  }
  else
  {
    sub_24396FE48();
    swift_bridgeObjectRelease();
    v3 = 0x4664696C61766E69;
  }
  v5 = v3;
  sub_24396FB90();
  sub_24396FB90();
  return v5;
}

uint64_t sub_243969798()
{
  uint64_t v0;

  return sub_2439696E0(*(_QWORD *)v0, *(_QWORD *)(v0 + 8), *(_BYTE *)(v0 + 16));
}

void sub_2439697A4()
{
  qword_2572DA2C8 = (uint64_t)&unk_25140FF20;
}

_QWORD *sub_2439697B8()
{
  uint64_t inited;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  unint64_t v6;
  unint64_t v7;
  _QWORD *v8;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2572DA240);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_243970F70;
  v1 = sub_24394B3D4();
  *(_QWORD *)(inited + 32) = v1;
  *(_QWORD *)(inited + 40) = v2;
  if (v2)
  {
    v3 = v1;
    v4 = v2;
    swift_bridgeObjectRetain();
    v5 = sub_2439647D4(0, 1, 1, MEMORY[0x24BEE4AF8]);
    v7 = v5[2];
    v6 = v5[3];
    if (v7 >= v6 >> 1)
      v5 = sub_2439647D4((_QWORD *)(v6 > 1), v7 + 1, 1, v5);
    v5[2] = v7 + 1;
    v8 = &v5[2 * v7];
    v8[4] = v3;
    v8[5] = v4;
  }
  else
  {
    v5 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  swift_release();
  return v5;
}

uint64_t sub_24396989C(void *a1)
{
  id v1;
  void *v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  _QWORD *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  _QWORD *v17;

  v1 = objc_msgSend(a1, sel_attachments);
  if (!v1)
    return MEMORY[0x24BEE4AF8];
  v2 = v1;
  sub_24396AC34();
  v3 = sub_24396FC14();

  if (!(v3 >> 62))
  {
    v4 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    if (v4)
      goto LABEL_4;
LABEL_19:
    v7 = (_QWORD *)MEMORY[0x24BEE4AF8];
LABEL_20:
    swift_bridgeObjectRelease_n();
    return (uint64_t)v7;
  }
  swift_bridgeObjectRetain();
  result = sub_24396FF20();
  v4 = result;
  if (!result)
    goto LABEL_19;
LABEL_4:
  if (v4 >= 1)
  {
    v6 = 0;
    v7 = (_QWORD *)MEMORY[0x24BEE4AF8];
    do
    {
      if ((v3 & 0xC000000000000001) != 0)
        v8 = (id)MEMORY[0x2494FD69C](v6, v3);
      else
        v8 = *(id *)(v3 + 8 * v6 + 32);
      v9 = v8;
      v10 = objc_msgSend(v8, sel_uti);
      if (v10)
      {
        v11 = v10;
        v12 = sub_24396FB60();
        v14 = v13;

        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v7 = sub_2439647D4(0, v7[2] + 1, 1, v7);
        v16 = v7[2];
        v15 = v7[3];
        if (v16 >= v15 >> 1)
          v7 = sub_2439647D4((_QWORD *)(v15 > 1), v16 + 1, 1, v7);
        v7[2] = v16 + 1;
        v17 = &v7[2 * v16];
        v17[4] = v12;
        v17[5] = v14;
      }
      else
      {

      }
      ++v6;
    }
    while (v4 != v6);
    goto LABEL_20;
  }
  __break(1u);
  return result;
}

_QWORD *sub_243969A60(void *a1)
{
  return sub_243969F98(a1, (SEL *)&selRef_targetBundleId);
}

uint64_t sub_243969A6C(void *a1)
{
  uint64_t v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t result;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2572DA030);
  v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_243970F70;
  v3 = objc_msgSend((id)objc_opt_self(), sel_currentCalendar);
  v4 = sub_24396FA58();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24396FA28();

  v8 = objc_msgSend(a1, sel_startDate);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2572D9E90);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!v8)
  {
    v19 = sub_24396FA04();
    result = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56))(v11, 1, 1, v19);
    goto LABEL_7;
  }
  v12 = sub_24396FA04();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v20 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24396F9D4();

  (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v11, v15, v12);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v11, 0, 1, v12);
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12);
  if ((_DWORD)result == 1)
  {
LABEL_7:
    __break(1u);
    return result;
  }
  v17 = sub_24396FA1C();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  (*(void (**)(char *, uint64_t))(v13 + 8))(v11, v12);
  v18 = 0x7961646B656577;
  if ((v17 & 1) != 0)
    v18 = 0x646E656B656577;
  *(_QWORD *)(v2 + 32) = v18;
  *(_QWORD *)(v2 + 40) = 0xE700000000000000;
  return v2;
}

uint64_t sub_243969CB4(uint64_t a1)
{
  return sub_24396A0B0(a1, sub_24394B7F4);
}

_QWORD *sub_243969CC0(void *a1)
{
  return sub_243969F98(a1, (SEL *)&selRef_locationUUID);
}

uint64_t sub_243969CCC(void *a1)
{
  uint64_t v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t result;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  void (*v24)(char *, uint64_t);
  uint64_t v25;
  _QWORD v26[3];
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2572DA030);
  v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_243970F70;
  v3 = objc_msgSend(a1, sel_startDate);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2572D9E90);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v3)
  {
    v7 = sub_24396FA04();
    v8 = *(_QWORD *)(v7 - 8);
    MEMORY[0x24BDAC7A8](v7);
    v10 = (char *)v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
    sub_24396F9D4();

    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v6, v10, v7);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v6, 0, 1, v7);
    result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7);
    if ((_DWORD)result != 1)
    {
      v28 = v2 + 32;
      v12 = sub_24396F980();
      v29 = v26;
      v13 = *(_QWORD *)(v12 - 8);
      v14 = MEMORY[0x24BDAC7A8](v12);
      v16 = (char *)v26 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
      v26[2] = v26;
      v17 = MEMORY[0x24BDAC7A8](v14);
      v19 = (char *)v26 - v18;
      MEMORY[0x2494FD0F0](v17);
      v20 = sub_24396F968();
      v26[1] = v26;
      v27 = v2;
      v21 = *(_QWORD *)(v20 - 8);
      MEMORY[0x24BDAC7A8](v20);
      v23 = (char *)v26 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
      sub_24396F95C();
      sub_24396F974();
      (*(void (**)(char *, uint64_t))(v21 + 8))(v23, v20);
      v24 = *(void (**)(char *, uint64_t))(v13 + 8);
      v24(v19, v12);
      sub_24396AC70();
      sub_24396F9EC();
      v24(v16, v12);
      (*(void (**)(char *, uint64_t))(v8 + 8))(v6, v7);
      return v27;
    }
  }
  else
  {
    v25 = sub_24396FA04();
    result = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 56))(v6, 1, 1, v25);
  }
  __break(1u);
  return result;
}

_QWORD *sub_243969F8C(void *a1)
{
  return sub_243969F98(a1, (SEL *)&selRef_bundleId);
}

_QWORD *sub_243969F98(void *a1, SEL *a2)
{
  uint64_t inited;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  unint64_t v11;
  unint64_t v12;
  _QWORD *v13;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2572DA240);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_243970F70;
  v5 = objc_msgSend(a1, *a2);
  if (v5)
  {
    v6 = v5;
    v7 = sub_24396FB60();
    v9 = v8;

    *(_QWORD *)(inited + 32) = v7;
    *(_QWORD *)(inited + 40) = v9;
    swift_bridgeObjectRetain();
    v10 = sub_2439647D4(0, 1, 1, MEMORY[0x24BEE4AF8]);
    v12 = v10[2];
    v11 = v10[3];
    if (v12 >= v11 >> 1)
      v10 = sub_2439647D4((_QWORD *)(v11 > 1), v12 + 1, 1, v10);
    v10[2] = v12 + 1;
    v13 = &v10[2 * v12];
    v13[4] = v7;
    v13[5] = v9;
  }
  else
  {
    *(_QWORD *)(inited + 32) = 0;
    *(_QWORD *)(inited + 40) = 0;
    v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  swift_release();
  return v10;
}

uint64_t sub_24396A0A4(uint64_t a1)
{
  return sub_24396A0B0(a1, (uint64_t (*)(void))sub_24394BA1C);
}

uint64_t sub_24396A0B0(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3;
  uint64_t v4;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2572DA030);
  v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_243970F70;
  *(_QWORD *)(v3 + 32) = a2();
  *(_QWORD *)(v3 + 40) = v4;
  return v3;
}

_QWORD *sub_24396A10C(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  unint64_t v7;
  unint64_t v8;
  _QWORD *v9;

  v1 = objc_msgSend(a1, sel_keywords);
  if (v1)
  {
    v2 = v1;
    sub_24396FC14();

  }
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2572DA250);
  sub_24396ACB8();
  sub_24396FD88();
  v3 = sub_24396FF80();
  v5 = v4;
  swift_bridgeObjectRelease();
  v6 = sub_2439647D4(0, 1, 1, MEMORY[0x24BEE4AF8]);
  v8 = v6[2];
  v7 = v6[3];
  if (v8 >= v7 >> 1)
    v6 = sub_2439647D4((_QWORD *)(v7 > 1), v8 + 1, 1, v6);
  v6[2] = v8 + 1;
  v9 = &v6[2 * v8];
  v9[4] = v3;
  v9[5] = v5;
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_24396A234(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t result;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v2 = sub_24396FA58();
  v27 = *(_QWORD *)(v2 - 8);
  v28 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24396FA34();
  v5 = sub_24396FA40();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, _QWORD, uint64_t))(v6 + 104))(v8, *MEMORY[0x24BDCF238], v5);
  v9 = objc_msgSend(a1, sel_startDate);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2572D9E90);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!v9)
  {
    v26 = sub_24396FA04();
    result = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 56))(v12, 1, 1, v26);
    goto LABEL_7;
  }
  v13 = sub_24396FA04();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v27 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24396F9D4();

  (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v12, v16, v13);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v14 + 56))(v12, 0, 1, v13);
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13);
  if ((_DWORD)result == 1)
  {
LABEL_7:
    __break(1u);
    return result;
  }
  v18 = sub_24396FA4C();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  (*(void (**)(char *, uint64_t))(v27 + 8))(v4, v28);
  (*(void (**)(char *, uint64_t))(v14 + 8))(v12, v13);
  v30 = MEMORY[0x24BEE4AF8];
  sub_24394BD3C(0, 1, 0);
  v19 = v30;
  v29 = v18;
  v20 = sub_24396FF80();
  v22 = v21;
  v24 = *(_QWORD *)(v19 + 16);
  v23 = *(_QWORD *)(v19 + 24);
  if (v24 >= v23 >> 1)
  {
    sub_24394BD3C(v23 > 1, v24 + 1, 1);
    v19 = v30;
  }
  *(_QWORD *)(v19 + 16) = v24 + 1;
  v25 = v19 + 16 * v24;
  *(_QWORD *)(v25 + 32) = v20;
  *(_QWORD *)(v25 + 40) = v22;
  return v19;
}

id sub_24396A4E8(void *a1)
{
  id v1;
  void *v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id result;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;

  v1 = objc_msgSend(a1, sel_attachments);
  if (v1)
  {
    v2 = v1;
    sub_24396AC34();
    v3 = sub_24396FC14();

    if (!(v3 >> 62))
      goto LABEL_3;
  }
  else
  {
    v3 = MEMORY[0x24BEE4AF8];
    if (!(MEMORY[0x24BEE4AF8] >> 62))
    {
LABEL_3:
      v4 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (v4)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  swift_bridgeObjectRetain();
  v4 = sub_24396FF20();
  if (v4)
  {
LABEL_4:
    v5 = 4;
    v23 = 0x800000024397AE50;
    v24 = v3 & 0xC000000000000001;
    v22 = v4;
    while (1)
    {
      result = v24 ? (id)MEMORY[0x2494FD69C](v5 - 4, v3) : *(id *)(v3 + 8 * v5);
      v7 = result;
      v8 = v5 - 3;
      if (__OFADD__(v5 - 4, 1))
        break;
      v9 = objc_msgSend(result, sel_uti);
      if (v9)
      {
        v10 = v9;
        v11 = sub_24396FB60();
        v13 = v12;

      }
      else
      {
        v11 = 0;
        v13 = 0xE000000000000000;
      }
      v27 = v11;
      v28 = v13;
      v25 = 0xD000000000000038;
      v26 = v23;
      v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2572DA260);
      MEMORY[0x24BDAC7A8](v14);
      v16 = (char *)&v21 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
      v17 = sub_24396FA10();
      v18 = 1;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v16, 1, 1, v17);
      sub_24396AD14();
      sub_24396FDAC();
      v20 = v19;
      sub_24394ADB4((uint64_t)v16, &qword_2572DA260);

      swift_bridgeObjectRelease();
      if ((v20 & 1) == 0)
        goto LABEL_15;
      ++v5;
      if (v8 == v22)
        goto LABEL_14;
    }
    __break(1u);
    return result;
  }
LABEL_14:
  v18 = 0;
LABEL_15:
  swift_bridgeObjectRelease_n();
  return (id)v18;
}

id sub_24396A744(void *a1)
{
  id v1;
  void *v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id result;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;

  v1 = objc_msgSend(a1, sel_attachments);
  if (v1)
  {
    v2 = v1;
    sub_24396AC34();
    v3 = sub_24396FC14();

    if (!(v3 >> 62))
      goto LABEL_3;
  }
  else
  {
    v3 = MEMORY[0x24BEE4AF8];
    if (!(MEMORY[0x24BEE4AF8] >> 62))
    {
LABEL_3:
      v4 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (v4)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  swift_bridgeObjectRetain();
  v4 = sub_24396FF20();
  if (v4)
  {
LABEL_4:
    v5 = 4;
    v23 = 0x800000024397AE90;
    v24 = v3 & 0xC000000000000001;
    v22 = v4;
    while (1)
    {
      result = v24 ? (id)MEMORY[0x2494FD69C](v5 - 4, v3) : *(id *)(v3 + 8 * v5);
      v7 = result;
      v8 = v5 - 3;
      if (__OFADD__(v5 - 4, 1))
        break;
      v9 = objc_msgSend(result, sel_uti);
      if (v9)
      {
        v10 = v9;
        v11 = sub_24396FB60();
        v13 = v12;

      }
      else
      {
        v11 = 0;
        v13 = 0xE000000000000000;
      }
      v27 = v11;
      v28 = v13;
      v25 = 0xD00000000000002ALL;
      v26 = v23;
      v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2572DA260);
      MEMORY[0x24BDAC7A8](v14);
      v16 = (char *)&v21 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
      v17 = sub_24396FA10();
      v18 = 1;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v16, 1, 1, v17);
      sub_24396AD14();
      sub_24396FDAC();
      v20 = v19;
      sub_24394ADB4((uint64_t)v16, &qword_2572DA260);

      swift_bridgeObjectRelease();
      if ((v20 & 1) == 0)
        goto LABEL_15;
      ++v5;
      if (v8 == v22)
        goto LABEL_14;
    }
    __break(1u);
    return result;
  }
LABEL_14:
  v18 = 0;
LABEL_15:
  swift_bridgeObjectRelease_n();
  return (id)v18;
}

id sub_24396A9A0(void *a1)
{
  id v1;
  void *v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  id result;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  unsigned int (*v20)(char *, uint64_t, uint64_t);
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t *v24;
  void *v25;

  v1 = objc_msgSend(a1, sel_attachments);
  if (v1)
  {
    v2 = v1;
    sub_24396AC34();
    v3 = sub_24396FC14();

    if (!(v3 >> 62))
      goto LABEL_3;
  }
  else
  {
    v3 = MEMORY[0x24BEE4AF8];
    if (!(MEMORY[0x24BEE4AF8] >> 62))
    {
LABEL_3:
      v4 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (v4)
        goto LABEL_4;
LABEL_16:
      v21 = 0;
LABEL_17:
      swift_bridgeObjectRelease_n();
      return (id)v21;
    }
  }
  swift_bridgeObjectRetain();
  v4 = sub_24396FF20();
  if (!v4)
    goto LABEL_16;
LABEL_4:
  v22 = v4;
  v23 = v3 & 0xC000000000000001;
  v5 = 4;
  v6 = &qword_2572D9E40;
  while (1)
  {
    result = v23 ? (id)MEMORY[0x2494FD69C](v5 - 4, v3) : *(id *)(v3 + 8 * v5);
    v9 = result;
    v10 = v5 - 3;
    if (__OFADD__(v5 - 4, 1))
      break;
    v11 = objc_msgSend(result, sel_contentURL);
    v12 = __swift_instantiateConcreteTypeFromMangledName(v6);
    MEMORY[0x24BDAC7A8](v12);
    v14 = (char *)&v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
    if (v11)
    {
      v15 = sub_24396F920();
      v24 = &v22;
      v25 = v9;
      v16 = v6;
      v17 = *(_QWORD *)(v15 - 8);
      MEMORY[0x24BDAC7A8](v15);
      v19 = (char *)&v22 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
      sub_24396F8FC();

      (*(void (**)(char *, char *, uint64_t))(v17 + 32))(v14, v19, v15);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v17 + 56))(v14, 0, 1, v15);
      v20 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48);
      v6 = v16;
      v9 = v25;
      if (v20(v14, 1, v15) != 1)
      {
        sub_24394ADB4((uint64_t)v14, &qword_2572D9E40);

        v21 = 1;
        goto LABEL_17;
      }
    }
    else
    {
      v7 = sub_24396F920();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v14, 1, 1, v7);
    }
    sub_24394ADB4((uint64_t)v14, v6);

    ++v5;
    if (v10 == v22)
      goto LABEL_16;
  }
  __break(1u);
  return result;
}

unint64_t sub_24396AC34()
{
  unint64_t result;

  result = qword_2572D9EF0;
  if (!qword_2572D9EF0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2572D9EF0);
  }
  return result;
}

unint64_t sub_24396AC70()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2572DA248;
  if (!qword_2572DA248)
  {
    v1 = sub_24396F980();
    result = MEMORY[0x2494FDCE4](MEMORY[0x24BDCE298], v1);
    atomic_store(result, (unint64_t *)&qword_2572DA248);
  }
  return result;
}

unint64_t sub_24396ACB8()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_2572DA258;
  if (!qword_2572DA258)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2572D9ED8);
    v2 = MEMORY[0x24BEE0D10];
    result = MEMORY[0x2494FDCE4](MEMORY[0x24BEE12A8], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_2572DA258);
  }
  return result;
}

unint64_t sub_24396AD14()
{
  unint64_t result;

  result = qword_2572DA268;
  if (!qword_2572DA268)
  {
    result = MEMORY[0x2494FDCE4](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_2572DA268);
  }
  return result;
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  if ((*(_DWORD *)(*(_QWORD *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t getEnumTagSinglePayload for ItemInformation(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFE)
    goto LABEL_17;
  if (a2 + 2 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 2) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 2;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 2;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 2;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 3;
  v8 = v6 - 3;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for ItemInformation(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 2 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 2) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFE)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFD)
    return ((uint64_t (*)(void))((char *)&loc_24396AE74 + 4 * byte_243971B35[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_24396AEA8 + 4 * byte_243971B30[v4]))();
}

uint64_t sub_24396AEA8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24396AEB0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x24396AEB8);
  return result;
}

uint64_t sub_24396AEC4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x24396AECCLL);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_24396AED0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24396AED8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ItemInformation()
{
  return &type metadata for ItemInformation;
}

void destroy for CommunicationBehavior(uint64_t a1)
{
  sub_24393DF0C(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(void **)(a1 + 16), *(_QWORD *)(a1 + 24), *(void **)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

uint64_t *initializeWithCopy for CommunicationBehavior(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v13;

  v3 = *a2;
  v4 = a2[1];
  v5 = (void *)a2[2];
  v6 = a2[3];
  v7 = (void *)a2[4];
  v8 = a2[5];
  v9 = a2[6];
  v10 = a2[7];
  v11 = a2[8];
  v13 = a2[9];
  sub_24396023C(*a2, v4, v5, v6, v7, v8, v9, v10, v11);
  *a1 = v3;
  a1[1] = v4;
  a1[2] = (uint64_t)v5;
  a1[3] = v6;
  a1[4] = (uint64_t)v7;
  a1[5] = v8;
  a1[6] = v9;
  a1[7] = v10;
  a1[8] = v11;
  a1[9] = v13;
  return a1;
}

uint64_t *assignWithCopy for CommunicationBehavior(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v22;

  v3 = *a2;
  v4 = a2[1];
  v5 = (void *)a2[2];
  v6 = a2[3];
  v7 = (void *)a2[4];
  v8 = a2[5];
  v9 = a2[6];
  v10 = a2[7];
  v11 = a2[8];
  v22 = a2[9];
  sub_24396023C(*a2, v4, v5, v6, v7, v8, v9, v10, v11);
  v12 = *a1;
  v13 = a1[1];
  v14 = (void *)a1[2];
  v15 = a1[3];
  v16 = (void *)a1[4];
  v17 = a1[5];
  v18 = a1[6];
  v19 = a1[7];
  v20 = a1[8];
  *a1 = v3;
  a1[1] = v4;
  a1[2] = (uint64_t)v5;
  a1[3] = v6;
  a1[4] = (uint64_t)v7;
  a1[5] = v8;
  a1[6] = v9;
  a1[7] = v10;
  a1[8] = v11;
  a1[9] = v22;
  sub_24393DF0C(v12, v13, v14, v15, v16, v17, v18, v19, v20);
  return a1;
}

__n128 __swift_memcpy80_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  result = *(__n128 *)(a2 + 16);
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(__n128 *)(a1 + 16) = result;
  *(_OWORD *)(a1 + 32) = v3;
  return result;
}

uint64_t *assignWithTake for CommunicationBehavior(uint64_t *a1, _OWORD *a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  __int128 v12;
  __int128 v13;

  v3 = *a1;
  v5 = a1[1];
  v4 = (void *)a1[2];
  v6 = a1[3];
  v7 = (void *)a1[4];
  v8 = a1[5];
  v9 = a1[6];
  v10 = a1[7];
  v11 = a1[8];
  v12 = a2[1];
  *(_OWORD *)a1 = *a2;
  *((_OWORD *)a1 + 1) = v12;
  v13 = a2[3];
  *((_OWORD *)a1 + 2) = a2[2];
  *((_OWORD *)a1 + 3) = v13;
  *((_OWORD *)a1 + 4) = a2[4];
  sub_24393DF0C(v3, v5, v4, v6, v7, v8, v9, v10, v11);
  return a1;
}

uint64_t getEnumTagSinglePayload for CommunicationBehavior(uint64_t a1, int a2)
{
  uint64_t v2;
  int v3;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 80))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 48) >> 1;
  if (v2 > 0x80000000)
    v3 = ~(_DWORD)v2;
  else
    v3 = -1;
  return (v3 + 1);
}

double storeEnumTagSinglePayload for CommunicationBehavior(uint64_t a1, int a2, int a3)
{
  double result;

  if (a2 < 0)
  {
    *(_QWORD *)(a1 + 72) = 0;
    result = 0.0;
    *(_OWORD *)(a1 + 56) = 0u;
    *(_OWORD *)(a1 + 40) = 0u;
    *(_OWORD *)(a1 + 24) = 0u;
    *(_OWORD *)(a1 + 8) = 0u;
    *(_QWORD *)a1 = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(a1 + 80) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      result = 0.0;
      *(_OWORD *)(a1 + 16) = 0u;
      *(_OWORD *)(a1 + 32) = 0u;
      *(_OWORD *)a1 = 0u;
      *(_QWORD *)(a1 + 48) = 2 * -a2;
      *(_QWORD *)(a1 + 56) = 0;
      *(_QWORD *)(a1 + 64) = 0;
      *(_QWORD *)(a1 + 72) = 0;
      return result;
    }
    *(_BYTE *)(a1 + 80) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

uint64_t sub_24396B1C0(uint64_t a1)
{
  return *(_QWORD *)(a1 + 64) >> 61;
}

uint64_t sub_24396B1CC(uint64_t result)
{
  *(_QWORD *)(result + 64) &= 0x1FFFFFFFFFFFFFFFuLL;
  return result;
}

uint64_t sub_24396B1DC(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 64) & 1 | (a2 << 61);
  *(_QWORD *)(result + 48) &= 1uLL;
  *(_QWORD *)(result + 64) = v2;
  return result;
}

ValueMetadata *type metadata accessor for CommunicationBehavior()
{
  return &type metadata for CommunicationBehavior;
}

uint64_t sub_24396B210()
{
  return swift_bridgeObjectRetain();
}

uint64_t destroy for ShareSheetLighthousePluginError()
{
  return sub_24396B228();
}

uint64_t sub_24396B228()
{
  return swift_bridgeObjectRelease();
}

uint64_t _s25PeopleSuggesterLighthouse31ShareSheetLighthousePluginErrorOwCP_0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  char v5;

  v3 = *a2;
  v4 = a2[1];
  v5 = *((_BYTE *)a2 + 16);
  sub_24396B210();
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for ShareSheetLighthousePluginError(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  char v5;

  v3 = *a2;
  v4 = a2[1];
  v5 = *((_BYTE *)a2 + 16);
  sub_24396B210();
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  sub_24396B228();
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for ShareSheetLighthousePluginError(uint64_t a1, uint64_t a2)
{
  char v3;

  v3 = *(_BYTE *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = v3;
  sub_24396B228();
  return a1;
}

uint64_t getEnumTagSinglePayload for ShareSheetLighthousePluginError(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 17))
    return (*(_DWORD *)a1 + 255);
  v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 1)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ShareSheetLighthousePluginError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 255;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
      *(_BYTE *)(result + 16) = -(char)a2;
  }
  return result;
}

uint64_t sub_24396B3B0(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t sub_24396B3B8(uint64_t result, char a2)
{
  *(_BYTE *)(result + 16) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for ShareSheetLighthousePluginError()
{
  return &type metadata for ShareSheetLighthousePluginError;
}

unint64_t sub_24396B3D8()
{
  unint64_t result;

  result = qword_2572DA270;
  if (!qword_2572DA270)
  {
    result = MEMORY[0x2494FDCE4](&unk_243971C38, &type metadata for ItemInformation);
    atomic_store(result, (unint64_t *)&qword_2572DA270);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for ContextFactor(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF8)
    goto LABEL_17;
  if (a2 + 8 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 8) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 8;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 8;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 8;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 9;
  v8 = v6 - 9;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for ContextFactor(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 8 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 8) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF8)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF7)
    return ((uint64_t (*)(void))((char *)&loc_24396B4F8 + 4 * byte_243971B49[v4]))();
  *a1 = a2 + 8;
  return ((uint64_t (*)(void))((char *)sub_24396B52C + 4 * byte_243971B44[v4]))();
}

uint64_t sub_24396B52C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24396B534(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x24396B53CLL);
  return result;
}

uint64_t sub_24396B548(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x24396B550);
  *(_BYTE *)result = a2 + 8;
  return result;
}

uint64_t sub_24396B554(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24396B55C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ContextFactor()
{
  return &type metadata for ContextFactor;
}

_QWORD *destroy for CountingMethod(_QWORD *result)
{
  if (*result >= 0xFFFFFFFFuLL)
    return (_QWORD *)swift_release();
  return result;
}

uint64_t _s25PeopleSuggesterLighthouse14CountingMethodOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  if (*(_QWORD *)a2 < 0xFFFFFFFFuLL)
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  else
  {
    v3 = *(_QWORD *)(a2 + 8);
    *(_QWORD *)a1 = *(_QWORD *)a2;
    *(_QWORD *)(a1 + 8) = v3;
    swift_retain();
  }
  return a1;
}

unint64_t *assignWithCopy for CountingMethod(unint64_t *a1, unint64_t *a2)
{
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v4 = *a2;
  if (*a1 < 0xFFFFFFFF)
  {
    if (v4 >= 0xFFFFFFFF)
    {
      v6 = a2[1];
      *a1 = v4;
      a1[1] = v6;
      swift_retain();
      return a1;
    }
LABEL_7:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  if (v4 < 0xFFFFFFFF)
  {
    swift_release();
    goto LABEL_7;
  }
  v5 = a2[1];
  *a1 = v4;
  a1[1] = v5;
  swift_retain();
  swift_release();
  return a1;
}

_QWORD *assignWithTake for CountingMethod(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;

  if (*a1 < 0xFFFFFFFFuLL)
    goto LABEL_5;
  if (*(_QWORD *)a2 < 0xFFFFFFFFuLL)
  {
    swift_release();
LABEL_5:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  v4 = *(_QWORD *)(a2 + 8);
  *a1 = *(_QWORD *)a2;
  a1[1] = v4;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for CountingMethod(uint64_t *a1, unsigned int a2)
{
  uint64_t v3;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *((_BYTE *)a1 + 16))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  if ((v3 + 1) >= 2)
    return v3;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for CountingMethod(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)result = 0;
    *(_QWORD *)(result + 8) = 0;
    *(_DWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 16) = 0;
    if (a2)
      *(_QWORD *)result = a2;
  }
  return result;
}

uint64_t sub_24396B778(uint64_t *a1)
{
  uint64_t v1;

  v1 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  return (v1 + 1);
}

_QWORD *sub_24396B790(_QWORD *result, int a2)
{
  uint64_t v2;

  if (a2 < 0)
  {
    v2 = a2 ^ 0x80000000;
    result[1] = 0;
  }
  else
  {
    if (!a2)
      return result;
    v2 = (a2 - 1);
  }
  *result = v2;
  return result;
}

ValueMetadata *type metadata accessor for CountingMethod()
{
  return &type metadata for CountingMethod;
}

uint64_t getEnumTagSinglePayload for AggregateProperty(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 9))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for AggregateProperty(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)result = 0;
    *(_BYTE *)(result + 8) = 0;
    *(_DWORD *)result = a2 - 1;
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 9) = v3;
  return result;
}

uint64_t sub_24396B810(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 8))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_24396B82C(uint64_t result, int a2)
{
  if (a2)
  {
    *(_QWORD *)result = (a2 - 1);
    *(_BYTE *)(result + 8) = 1;
  }
  else
  {
    *(_BYTE *)(result + 8) = 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for AggregateProperty()
{
  return &type metadata for AggregateProperty;
}

uint64_t getEnumTagSinglePayload for FeedbackType(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFD)
    goto LABEL_17;
  if (a2 + 3 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 3) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 3;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 3;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 3;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 4;
  v8 = v6 - 4;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for FeedbackType(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 3 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 3) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFD)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFC)
    return ((uint64_t (*)(void))((char *)&loc_24396B938 + 4 * byte_243971B53[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_24396B96C + 4 * byte_243971B4E[v4]))();
}

uint64_t sub_24396B96C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24396B974(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x24396B97CLL);
  return result;
}

uint64_t sub_24396B988(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x24396B990);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_24396B994(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24396B99C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for FeedbackType()
{
  return &type metadata for FeedbackType;
}

unint64_t sub_24396B9BC()
{
  unint64_t result;

  result = qword_2572DA278;
  if (!qword_2572DA278)
  {
    result = MEMORY[0x2494FDCE4](&unk_243971D78, &type metadata for FeedbackType);
    atomic_store(result, (unint64_t *)&qword_2572DA278);
  }
  return result;
}

unint64_t sub_24396BA04()
{
  unint64_t result;

  result = qword_2572DA280;
  if (!qword_2572DA280)
  {
    result = MEMORY[0x2494FDCE4](&unk_243971DE0, &type metadata for ContextFactor);
    atomic_store(result, (unint64_t *)&qword_2572DA280);
  }
  return result;
}

uint64_t sub_24396BA48(unint64_t a1)
{
  if (a1 >= 5)
    return 4;
  else
    return (0x302010004uLL >> (8 * a1));
}

uint64_t sub_24396BA7C(unint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void **v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;

  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v2 = sub_24396FF20();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  result = MEMORY[0x24BEE4AF8];
  if (v2)
  {
    v11 = MEMORY[0x24BEE4AF8];
    result = sub_24396FEA8();
    if (v2 < 0)
    {
      __break(1u);
    }
    else
    {
      if ((a1 & 0xC000000000000001) != 0)
      {
        v4 = 0;
        do
        {
          v5 = v4 + 1;
          v10 = (void *)MEMORY[0x2494FD69C]();
          sub_24393E124(0, &qword_2572D9D68);
          v6 = v10;
          __swift_instantiateConcreteTypeFromMangledName(&qword_2572D9EE0);
          swift_dynamicCast();
          swift_unknownObjectRelease();
          sub_24396FE90();
          sub_24396FEB4();
          sub_24396FEC0();
          sub_24396FE9C();
          v4 = v5;
        }
        while (v2 != v5);
      }
      else
      {
        v7 = (void **)(a1 + 32);
        sub_24393E124(0, &qword_2572D9D68);
        do
        {
          v8 = *v7++;
          v9 = v8;
          __swift_instantiateConcreteTypeFromMangledName(&qword_2572D9EE0);
          swift_dynamicCast();

          sub_24396FE90();
          sub_24396FEB4();
          sub_24396FEC0();
          sub_24396FE9C();
          --v2;
        }
        while (v2);
      }
      return v11;
    }
  }
  return result;
}

uint64_t sub_24396BC88(uint64_t a1)
{
  int64_t v1;
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  __int128 v8;
  uint64_t v9;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = MEMORY[0x24BEE4AF8];
  if (v1)
  {
    v9 = MEMORY[0x24BEE4AF8];
    sub_24394BD20(0, v1, 0);
    v2 = v9;
    v4 = a1 + 40;
    do
    {
      swift_bridgeObjectRetain();
      swift_dynamicCast();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_24394BD20(0, *(_QWORD *)(v2 + 16) + 1, 1);
        v2 = v9;
      }
      v6 = *(_QWORD *)(v2 + 16);
      v5 = *(_QWORD *)(v2 + 24);
      if (v6 >= v5 >> 1)
      {
        sub_24394BD20(v5 > 1, v6 + 1, 1);
        v2 = v9;
      }
      v4 += 16;
      *(_QWORD *)(v2 + 16) = v6 + 1;
      sub_243946AA0(&v8, (_OWORD *)(v2 + 32 * v6 + 32));
      --v1;
    }
    while (v1);
  }
  return v2;
}

uint64_t sub_24396BDAC(unint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t i;
  unint64_t v6;
  unint64_t v7;
  id *v8;
  id v9;
  unint64_t v10;
  unint64_t v11;
  _OWORD v12[2];
  uint64_t v13;

  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v2 = sub_24396FF20();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v3 = MEMORY[0x24BEE4AF8];
  if (!v2)
    return v3;
  v13 = MEMORY[0x24BEE4AF8];
  result = sub_24394BD20(0, v2 & ~(v2 >> 63), 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      for (i = 0; i != v2; ++i)
      {
        MEMORY[0x2494FD69C](i, a1);
        sub_24393E124(0, (unint64_t *)&qword_2572D9D38);
        swift_dynamicCast();
        v3 = v13;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_24394BD20(0, *(_QWORD *)(v3 + 16) + 1, 1);
          v3 = v13;
        }
        v7 = *(_QWORD *)(v3 + 16);
        v6 = *(_QWORD *)(v3 + 24);
        if (v7 >= v6 >> 1)
        {
          sub_24394BD20(v6 > 1, v7 + 1, 1);
          v3 = v13;
        }
        *(_QWORD *)(v3 + 16) = v7 + 1;
        sub_243946AA0(v12, (_OWORD *)(v3 + 32 * v7 + 32));
      }
    }
    else
    {
      v8 = (id *)(a1 + 32);
      sub_24393E124(0, (unint64_t *)&qword_2572D9D38);
      do
      {
        v9 = *v8;
        swift_dynamicCast();
        v3 = v13;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_24394BD20(0, *(_QWORD *)(v3 + 16) + 1, 1);
          v3 = v13;
        }
        v11 = *(_QWORD *)(v3 + 16);
        v10 = *(_QWORD *)(v3 + 24);
        if (v11 >= v10 >> 1)
        {
          sub_24394BD20(v10 > 1, v11 + 1, 1);
          v3 = v13;
        }
        *(_QWORD *)(v3 + 16) = v11 + 1;
        sub_243946AA0(v12, (_OWORD *)(v3 + 32 * v11 + 32));
        ++v8;
        --v2;
      }
      while (v2);
    }
    return v3;
  }
  __break(1u);
  return result;
}

uint64_t sub_24396C00C(id *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  void (*v20)(char *, char *, uint64_t);
  char v21;
  uint64_t v22;
  char *v23;
  uint64_t (*v24)(char *, uint64_t, uint64_t);
  uint64_t v25;
  char v26;
  void (*v27)(char *, uint64_t);
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t *v35;

  v6 = *a1;
  v7 = objc_msgSend(*a1, sel_domainIdentifier);
  if (!v7)
  {
    v26 = 0;
    return v26 & 1;
  }
  v8 = v7;
  v31 = a2;
  v32 = a3;
  v30 = sub_24396FB60();
  v34 = (uint64_t *)v9;

  v10 = sub_24396FA04();
  v35 = &v29;
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(_QWORD *)(v11 + 64);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (v12 + 15) & 0xFFFFFFFFFFFFFFF0;
  v14 = (char *)&v29 - v13;
  v15 = objc_msgSend(v6, sel_startDate);
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2572D9E90);
  v17 = MEMORY[0x24BDAC7A8](v16);
  v19 = (char *)&v29 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!v15)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56))(v19, 1, 1, v10);
    goto LABEL_8;
  }
  v33 = v3;
  MEMORY[0x24BDAC7A8](v17);
  sub_24396F9D4();

  v20 = *(void (**)(char *, char *, uint64_t))(v11 + 32);
  v20(v19, (char *)&v29 - v13, v10);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v19, 0, 1, v10);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v19, 1, v10) == 1)
  {
LABEL_8:
    swift_bridgeObjectRelease();
    sub_24394ADB4((uint64_t)v19, &qword_2572D9E90);
    v26 = 0;
    return v26 & 1;
  }
  v20(v14, v19, v10);
  v21 = sub_243960DF8(v30, (uint64_t)v34, v31);
  v22 = swift_bridgeObjectRelease();
  v34 = &v29;
  MEMORY[0x24BDAC7A8](v22);
  v23 = (char *)&v29 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v11 + 16);
  v25 = v24(v23, v32, v10);
  MEMORY[0x24BDAC7A8](v25);
  v24(v23, (uint64_t)v14, v10);
  if ((v21 & 1) != 0)
  {
    sub_24396C304();
    v26 = sub_24396FB3C() ^ 1;
  }
  else
  {
    v26 = 0;
  }
  v27 = *(void (**)(char *, uint64_t))(v11 + 8);
  v27(v23, v10);
  v27(v23, v10);
  v27(v14, v10);
  return v26 & 1;
}

unint64_t sub_24396C304()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2572D9F58;
  if (!qword_2572D9F58)
  {
    v1 = sub_24396FA04();
    result = MEMORY[0x2494FDCE4](MEMORY[0x24BDCE940], v1);
    atomic_store(result, (unint64_t *)&qword_2572D9F58);
  }
  return result;
}

uint64_t sub_24396C350@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  if ((MEMORY[0x24BEE4AF8] & 0xC000000000000000) != 0 && sub_24396FF20())
    result = sub_24396F564(MEMORY[0x24BEE4AF8]);
  else
    result = MEMORY[0x24BEE4B08];
  *a1 = result;
  return result;
}

uint64_t sub_24396C3A8(uint64_t a1)
{
  uint64_t result;
  _QWORD *v3;
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t i;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  int64_t v23;
  uint64_t v24;
  _QWORD *v25;
  _QWORD *v26;
  uint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t v30;
  int64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  int64_t v35;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2572D9D98);
  result = sub_24396FF38();
  v3 = (_QWORD *)result;
  v4 = 0;
  v33 = a1;
  v7 = *(_QWORD *)(a1 + 64);
  v6 = a1 + 64;
  v5 = v7;
  v8 = 1 << *(_BYTE *)(v6 - 32);
  v9 = -1;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  v10 = v9 & v5;
  v30 = v6;
  v31 = (unint64_t)(v8 + 63) >> 6;
  v32 = result + 64;
  if ((v9 & v5) == 0)
    goto LABEL_5;
LABEL_4:
  v11 = __clz(__rbit64(v10));
  v10 &= v10 - 1;
  v35 = v4;
  for (i = v11 | (v4 << 6); ; i = __clz(__rbit64(v14)) + (v15 << 6))
  {
    v17 = (uint64_t *)(*(_QWORD *)(v33 + 48) + 16 * i);
    v18 = *v17;
    v19 = v17[1];
    v20 = *(_QWORD *)(*(_QWORD *)(v33 + 56) + 8 * i);
    if ((v20 & 0xC000000000000001) != 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v21 = sub_24396FDF4();
      if (!v21)
        goto LABEL_26;
    }
    else
    {
      v21 = *(_QWORD *)(v20 + 16);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (!v21)
      {
LABEL_26:
        result = swift_bridgeObjectRelease();
        v22 = (_QWORD *)MEMORY[0x24BEE4AF8];
        goto LABEL_30;
      }
    }
    if (v21 <= 0)
    {
      v22 = (_QWORD *)MEMORY[0x24BEE4AF8];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_2572DA020);
      v22 = (_QWORD *)swift_allocObject();
      v23 = _swift_stdlib_malloc_size(v22);
      v24 = v23 - 32;
      if (v23 < 32)
        v24 = v23 - 25;
      v22[2] = v21;
      v22[3] = (2 * (v24 >> 3)) | 1;
    }
    swift_bridgeObjectRetain();
    v25 = sub_24396C698(&v34, v22 + 4, v21, v20);
    result = sub_243947AF0();
    if (v25 != (_QWORD *)v21)
      goto LABEL_35;
    result = swift_bridgeObjectRelease();
LABEL_30:
    *(_QWORD *)(v32 + ((i >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << i;
    v26 = (_QWORD *)(v3[6] + 16 * i);
    *v26 = v18;
    v26[1] = v19;
    *(_QWORD *)(v3[7] + 8 * i) = v22;
    v27 = v3[2];
    v28 = __OFADD__(v27, 1);
    v29 = v27 + 1;
    if (v28)
    {
      __break(1u);
LABEL_35:
      __break(1u);
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    v3[2] = v29;
    v4 = v35;
    if (v10)
      goto LABEL_4;
LABEL_5:
    v13 = v4 + 1;
    if (__OFADD__(v4, 1))
      goto LABEL_36;
    if (v13 >= v31)
      return (uint64_t)v3;
    v14 = *(_QWORD *)(v30 + 8 * v13);
    v15 = v4 + 1;
    if (!v14)
    {
      v15 = v4 + 2;
      if (v4 + 2 >= v31)
        return (uint64_t)v3;
      v14 = *(_QWORD *)(v30 + 8 * v15);
      if (!v14)
      {
        v15 = v4 + 3;
        if (v4 + 3 >= v31)
          return (uint64_t)v3;
        v14 = *(_QWORD *)(v30 + 8 * v15);
        if (!v14)
          break;
      }
    }
LABEL_18:
    v10 = (v14 - 1) & v14;
    v35 = v15;
  }
  v16 = v4 + 4;
  if (v4 + 4 >= v31)
    return (uint64_t)v3;
  v14 = *(_QWORD *)(v30 + 8 * v16);
  if (v14)
  {
    v15 = v4 + 4;
    goto LABEL_18;
  }
  while (1)
  {
    v15 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v15 >= v31)
      return (uint64_t)v3;
    v14 = *(_QWORD *)(v30 + 8 * v15);
    ++v16;
    if (v14)
      goto LABEL_18;
  }
LABEL_37:
  __break(1u);
  return result;
}

_QWORD *sub_24396C698(_QWORD *result, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  id v14;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  int64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  _QWORD *v24;
  int64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int64_t v30;
  unint64_t v31;

  v4 = a4;
  v6 = a2;
  v24 = result;
  if ((a4 & 0xC000000000000001) != 0)
  {
    sub_24396FDE8();
    sub_24393E124(0, &qword_2572DA0E0);
    sub_24393E01C(&qword_2572DA288, &qword_2572DA0E0, 0x24BE1AFB8, MEMORY[0x24BEE5BD8]);
    result = (_QWORD *)sub_24396FCC8();
    v4 = v27;
    v7 = v28;
    v8 = v29;
    v9 = v30;
    v10 = v31;
    if (v6)
      goto LABEL_3;
LABEL_36:
    v11 = 0;
    goto LABEL_38;
  }
  v9 = 0;
  v19 = -1 << *(_BYTE *)(a4 + 32);
  v7 = a4 + 56;
  v8 = ~v19;
  v20 = -v19;
  if (v20 < 64)
    v21 = ~(-1 << v20);
  else
    v21 = -1;
  v10 = v21 & *(_QWORD *)(a4 + 56);
  if (!a2)
    goto LABEL_36;
LABEL_3:
  if (!a3)
  {
    v11 = 0;
LABEL_38:
    v22 = v24;
LABEL_41:
    *v22 = v4;
    v22[1] = v7;
    v22[2] = v8;
    v22[3] = v9;
    v22[4] = v10;
    return (_QWORD *)v11;
  }
  if (a3 < 0)
    goto LABEL_48;
  v11 = 0;
  v25 = (unint64_t)(v8 + 64) >> 6;
  v23 = v8;
  while (1)
  {
    if (v4 < 0)
    {
      if (!sub_24396FE0C())
        goto LABEL_40;
      sub_24393E124(0, &qword_2572DA0E0);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      v14 = v26;
      result = (_QWORD *)swift_unknownObjectRelease();
      if (!v26)
        goto LABEL_40;
      goto LABEL_8;
    }
    if (v10)
    {
      v12 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v13 = v12 | (v9 << 6);
      goto LABEL_7;
    }
    v15 = v9 + 1;
    if (__OFADD__(v9, 1))
      break;
    if (v15 >= v25)
    {
      v10 = 0;
      goto LABEL_40;
    }
    v16 = *(_QWORD *)(v7 + 8 * v15);
    if (v16)
      goto LABEL_23;
    v17 = v9 + 2;
    if (v9 + 2 >= v25)
    {
      v10 = 0;
      ++v9;
      goto LABEL_40;
    }
    v16 = *(_QWORD *)(v7 + 8 * v17);
    if (!v16)
    {
      if (v9 + 3 >= v25)
        goto LABEL_44;
      v16 = *(_QWORD *)(v7 + 8 * (v9 + 3));
      if (v16)
      {
        v15 = v9 + 3;
        goto LABEL_23;
      }
      v17 = v9 + 4;
      if (v9 + 4 >= v25)
      {
        v10 = 0;
        v9 += 3;
        goto LABEL_40;
      }
      v16 = *(_QWORD *)(v7 + 8 * v17);
      if (!v16)
      {
        v15 = v9 + 5;
        if (v9 + 5 >= v25)
        {
LABEL_44:
          v10 = 0;
          v9 = v17;
          goto LABEL_40;
        }
        v16 = *(_QWORD *)(v7 + 8 * v15);
        if (!v16)
        {
          v18 = v9 + 6;
          while (v25 != v18)
          {
            v16 = *(_QWORD *)(v7 + 8 * v18++);
            if (v16)
            {
              v15 = v18 - 1;
              goto LABEL_23;
            }
          }
          v10 = 0;
          v9 = v25 - 1;
          goto LABEL_40;
        }
        goto LABEL_23;
      }
    }
    v15 = v17;
LABEL_23:
    v10 = (v16 - 1) & v16;
    v13 = __clz(__rbit64(v16)) + (v15 << 6);
    v9 = v15;
LABEL_7:
    result = *(id *)(*(_QWORD *)(v4 + 48) + 8 * v13);
    v14 = result;
    if (!result)
      goto LABEL_40;
LABEL_8:
    ++v11;
    *v6++ = v14;
    if (v11 == a3)
    {
      v11 = a3;
LABEL_40:
      v8 = v23;
      v22 = v24;
      goto LABEL_41;
    }
  }
  __break(1u);
LABEL_48:
  __break(1u);
  return result;
}

void sub_24396C9A8(unint64_t a1)
{
  unint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  char v18;
  uint64_t v19;
  id v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  char v33;
  uint64_t v34;
  id v35;
  char v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;

  v1 = a1;
  v2 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v5 = sub_24396FF20();
    swift_bridgeObjectRelease();
    if (v5)
    {
LABEL_3:
      __swift_instantiateConcreteTypeFromMangledName(&qword_2572DA100);
      v3 = sub_24396FE3C();
      if (!v2)
        goto LABEL_4;
LABEL_8:
      swift_bridgeObjectRetain();
      v4 = sub_24396FF20();
      swift_bridgeObjectRelease();
      if (!v4)
        return;
      goto LABEL_9;
    }
  }
  else if (*(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    goto LABEL_3;
  }
  v3 = MEMORY[0x24BEE4B08];
  if (v2)
    goto LABEL_8;
LABEL_4:
  v4 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v4)
    return;
LABEL_9:
  v6 = v3 + 56;
  v41 = v4;
  if ((v1 & 0xC000000000000001) != 0)
  {
    v7 = 0;
    v39 = v1;
    while (1)
    {
      v8 = MEMORY[0x2494FD69C](v7, v1);
      v9 = __OFADD__(v7++, 1);
      if (v9)
      {
        __break(1u);
        goto LABEL_37;
      }
      v10 = v8;
      v11 = sub_24396FD70();
      v12 = -1 << *(_BYTE *)(v3 + 32);
      v13 = v11 & ~v12;
      v14 = v13 >> 6;
      v15 = *(_QWORD *)(v6 + 8 * (v13 >> 6));
      v16 = 1 << v13;
      if (((1 << v13) & v15) != 0)
      {
        sub_24396FA88();
        v17 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v13);
        v18 = sub_24396FD7C();

        if ((v18 & 1) != 0)
        {
LABEL_11:
          swift_unknownObjectRelease();
          v1 = v39;
          goto LABEL_12;
        }
        v19 = ~v12;
        while (1)
        {
          v13 = (v13 + 1) & v19;
          v14 = v13 >> 6;
          v15 = *(_QWORD *)(v6 + 8 * (v13 >> 6));
          v16 = 1 << v13;
          if ((v15 & (1 << v13)) == 0)
            break;
          v20 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v13);
          v21 = sub_24396FD7C();

          if ((v21 & 1) != 0)
            goto LABEL_11;
        }
        v1 = v39;
      }
      *(_QWORD *)(v6 + 8 * v14) = v16 | v15;
      *(_QWORD *)(*(_QWORD *)(v3 + 48) + 8 * v13) = v10;
      v22 = *(_QWORD *)(v3 + 16);
      v9 = __OFADD__(v22, 1);
      v23 = v22 + 1;
      if (v9)
        goto LABEL_38;
      *(_QWORD *)(v3 + 16) = v23;
LABEL_12:
      if (v7 == v41)
        return;
    }
  }
  v24 = 0;
  v40 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (v24 != v40)
  {
    v25 = *(id *)(v1 + 32 + 8 * v24);
    v26 = sub_24396FD70();
    v27 = -1 << *(_BYTE *)(v3 + 32);
    v28 = v26 & ~v27;
    v29 = v28 >> 6;
    v30 = *(_QWORD *)(v6 + 8 * (v28 >> 6));
    v31 = 1 << v28;
    if (((1 << v28) & v30) != 0)
    {
      sub_24396FA88();
      v32 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v28);
      v33 = sub_24396FD7C();

      if ((v33 & 1) != 0)
        goto LABEL_24;
      v34 = ~v27;
      v28 = (v28 + 1) & v34;
      v29 = v28 >> 6;
      v30 = *(_QWORD *)(v6 + 8 * (v28 >> 6));
      v31 = 1 << v28;
      if ((v30 & (1 << v28)) != 0)
      {
        while (1)
        {
          v35 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v28);
          v36 = sub_24396FD7C();

          if ((v36 & 1) != 0)
            break;
          v28 = (v28 + 1) & v34;
          v29 = v28 >> 6;
          v30 = *(_QWORD *)(v6 + 8 * (v28 >> 6));
          v31 = 1 << v28;
          if ((v30 & (1 << v28)) == 0)
            goto LABEL_32;
        }
LABEL_24:

        v4 = v41;
        goto LABEL_25;
      }
LABEL_32:
      v4 = v41;
    }
    *(_QWORD *)(v6 + 8 * v29) = v31 | v30;
    *(_QWORD *)(*(_QWORD *)(v3 + 48) + 8 * v28) = v25;
    v37 = *(_QWORD *)(v3 + 16);
    v9 = __OFADD__(v37, 1);
    v38 = v37 + 1;
    if (v9)
      goto LABEL_39;
    *(_QWORD *)(v3 + 16) = v38;
LABEL_25:
    if (++v24 == v4)
      return;
  }
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
LABEL_39:
  __break(1u);
}

uint64_t sub_24396CD00(uint64_t a1, unint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7, uint64_t a8, id a9)
{
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  id v18;
  void *v19;
  id v20;
  uint64_t v21;
  id v22;
  void *v23;
  id v24;
  uint64_t v25;
  id v26;
  void *v27;
  id v28;
  uint64_t v29;
  id v30;
  void *v31;
  id v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  void *v36;
  id v37;
  uint64_t v38;
  id v39;
  void *v40;
  id v41;
  void *v42;
  id v43;
  uint64_t v44;
  id v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v50;
  uint64_t v51;
  unint64_t v56;

  v56 = MEMORY[0x24BEE4AF8];
  if (a1 && *(_QWORD *)(a1 + 16))
  {
    sub_24393E124(0, &qword_2572D9D30);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2572D9FF0);
    v13 = swift_allocObject();
    *(_OWORD *)(v13 + 16) = xmmword_243970F70;
    sub_24396BC88(a1);
    v14 = objc_allocWithZone(MEMORY[0x24BDBCF20]);
    v15 = (void *)sub_24396FC08();
    swift_bridgeObjectRelease();
    v16 = objc_msgSend(v14, sel_initWithArray_, v15);

    *(_QWORD *)(v13 + 56) = sub_24393E124(0, &qword_2572DA298);
    *(_QWORD *)(v13 + 64) = sub_24393E01C(&qword_2572DA2A0, &qword_2572DA298, 0x24BDBCF20, MEMORY[0x24BEE5BE8]);
    *(_QWORD *)(v13 + 32) = v16;
    sub_24396FCEC();
    MEMORY[0x2494FD42C]();
    if (*(_QWORD *)((v56 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v56 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      sub_24396FC38();
    sub_24396FC50();
    sub_24396FC2C();
  }
  if (a2)
  {
    if (a2 >> 62)
    {
      swift_bridgeObjectRetain();
      v50 = sub_24396FF20();
      swift_bridgeObjectRelease();
      if (!v50)
        goto LABEL_12;
    }
    else if (!*(_QWORD *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      goto LABEL_12;
    }
    sub_24393E124(0, &qword_2572D9D30);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2572D9FF0);
    v17 = swift_allocObject();
    *(_OWORD *)(v17 + 16) = xmmword_243970F70;
    sub_24396BDAC(a2);
    v18 = objc_allocWithZone(MEMORY[0x24BDBCF20]);
    v19 = (void *)sub_24396FC08();
    swift_bridgeObjectRelease();
    v20 = objc_msgSend(v18, sel_initWithArray_, v19);

    *(_QWORD *)(v17 + 56) = sub_24393E124(0, &qword_2572DA298);
    *(_QWORD *)(v17 + 64) = sub_24393E01C(&qword_2572DA2A0, &qword_2572DA298, 0x24BDBCF20, MEMORY[0x24BEE5BE8]);
    *(_QWORD *)(v17 + 32) = v20;
    sub_24396FCEC();
    MEMORY[0x2494FD42C]();
    if (*(_QWORD *)((v56 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v56 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      sub_24396FC38();
    sub_24396FC50();
    sub_24396FC2C();
  }
LABEL_12:
  if (a3)
  {
    if (a3 >> 62)
    {
      swift_bridgeObjectRetain();
      v51 = sub_24396FF20();
      swift_bridgeObjectRelease();
      if (v51)
        goto LABEL_15;
    }
    else if (*(_QWORD *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
LABEL_15:
      sub_24393E124(0, &qword_2572D9D30);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2572D9FF0);
      v21 = swift_allocObject();
      *(_OWORD *)(v21 + 16) = xmmword_243970F70;
      sub_24396BDAC(a3);
      v22 = objc_allocWithZone(MEMORY[0x24BDBCF20]);
      v23 = (void *)sub_24396FC08();
      swift_bridgeObjectRelease();
      v24 = objc_msgSend(v22, sel_initWithArray_, v23);

      *(_QWORD *)(v21 + 56) = sub_24393E124(0, &qword_2572DA298);
      *(_QWORD *)(v21 + 64) = sub_24393E01C(&qword_2572DA2A0, &qword_2572DA298, 0x24BDBCF20, MEMORY[0x24BEE5BE8]);
      *(_QWORD *)(v21 + 32) = v24;
      sub_24396FCEC();
      MEMORY[0x2494FD42C]();
      if (*(_QWORD *)((v56 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v56 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
        sub_24396FC38();
      sub_24396FC50();
      sub_24396FC2C();
    }
  }
  if (a4 && *(_QWORD *)(a4 + 16))
  {
    sub_24393E124(0, &qword_2572D9D30);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2572D9FF0);
    v25 = swift_allocObject();
    *(_OWORD *)(v25 + 16) = xmmword_243970F70;
    sub_24396BC88(a4);
    v26 = objc_allocWithZone(MEMORY[0x24BDBCF20]);
    v27 = (void *)sub_24396FC08();
    swift_bridgeObjectRelease();
    v28 = objc_msgSend(v26, sel_initWithArray_, v27);

    *(_QWORD *)(v25 + 56) = sub_24393E124(0, &qword_2572DA298);
    *(_QWORD *)(v25 + 64) = sub_24393E01C(&qword_2572DA2A0, &qword_2572DA298, 0x24BDBCF20, MEMORY[0x24BEE5BE8]);
    *(_QWORD *)(v25 + 32) = v28;
    sub_24396FCEC();
    MEMORY[0x2494FD42C]();
    if (*(_QWORD *)((v56 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v56 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      sub_24396FC38();
    sub_24396FC50();
    sub_24396FC2C();
  }
  if (a5 && *(_QWORD *)(a5 + 16))
  {
    sub_24393E124(0, &qword_2572D9D30);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2572D9FF0);
    v29 = swift_allocObject();
    *(_OWORD *)(v29 + 16) = xmmword_243970F70;
    sub_24396BC88(a5);
    v30 = objc_allocWithZone(MEMORY[0x24BDBCF20]);
    v31 = (void *)sub_24396FC08();
    swift_bridgeObjectRelease();
    v32 = objc_msgSend(v30, sel_initWithArray_, v31);

    *(_QWORD *)(v29 + 56) = sub_24393E124(0, &qword_2572DA298);
    *(_QWORD *)(v29 + 64) = sub_24393E01C(&qword_2572DA2A0, &qword_2572DA298, 0x24BDBCF20, MEMORY[0x24BEE5BE8]);
    *(_QWORD *)(v29 + 32) = v32;
    sub_24396FCEC();
    MEMORY[0x2494FD42C]();
    if (*(_QWORD *)((v56 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v56 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      sub_24396FC38();
    sub_24396FC50();
    sub_24396FC2C();
  }
  if ((a7 & 1) != 0)
    goto LABEL_31;
  sub_24393E124(0, &qword_2572D9D30);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2572D9FF0);
  v33 = swift_allocObject();
  *(_OWORD *)(v33 + 16) = xmmword_243970F70;
  v34 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBCE60]), sel_initWithTimeIntervalSinceNow_, COERCE_DOUBLE(a6 ^ 0x8000000000000000));
  *(_QWORD *)(v33 + 56) = sub_24393E124(0, &qword_2572D9D40);
  *(_QWORD *)(v33 + 64) = sub_24393E01C((unint64_t *)&unk_2572DA000, &qword_2572D9D40, 0x24BDBCE60, MEMORY[0x24BEE5BE8]);
  *(_QWORD *)(v33 + 32) = v34;
  sub_24396FCEC();
  MEMORY[0x2494FD42C]();
  if (*(_QWORD *)((v56 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v56 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
    goto LABEL_48;
  while (1)
  {
    sub_24396FC50();
    sub_24396FC2C();
LABEL_31:
    if (v56 >> 62)
    {
      swift_bridgeObjectRetain();
      v35 = sub_24396FF20();
      swift_bridgeObjectRelease();
      if (!v35)
      {
LABEL_41:
        swift_bridgeObjectRelease();
        sub_24393DE88();
        swift_allocError();
        *(_QWORD *)v48 = 0xD00000000000001CLL;
        *(_QWORD *)(v48 + 8) = 0x800000024397AF10;
        *(_BYTE *)(v48 + 16) = 1;
        swift_willThrow();
        return v35;
      }
    }
    else
    {
      v35 = *(_QWORD *)((v56 & 0xFFFFFFFFFFFFF8) + 0x10);
      if (!v35)
        goto LABEL_41;
    }
    sub_24393E124(0, &qword_2572D9D30);
    v36 = (void *)sub_24396FC08();
    swift_bridgeObjectRelease();
    v37 = objc_msgSend((id)objc_opt_self(), sel_andPredicateWithSubpredicates_, v36);

    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2572DA0F0);
    v38 = swift_allocObject();
    *(_OWORD *)(v38 + 16) = xmmword_243970F70;
    v39 = objc_allocWithZone(MEMORY[0x24BDD17C0]);
    v40 = (void *)sub_24396FB48();
    v41 = objc_msgSend(v39, sel_initWithKey_ascending_, v40, 0);

    *(_QWORD *)(v38 + 56) = sub_24393E124(0, &qword_2572DA290);
    *(_QWORD *)(v38 + 32) = v41;
    v42 = (void *)sub_24396FC08();
    swift_bridgeObjectRelease();
    if ((a8 & 0x8000000000000000) == 0)
      break;
    __break(1u);
LABEL_48:
    sub_24396FC38();
  }
  v43 = objc_msgSend(a9, sel_lh_queryInteractionsUsingPredicate_sortDescriptors_limit_error_, v37, v42);

  v35 = 0;
  if (v43)
  {
    v44 = sub_24396FC14();
    v45 = 0;

    v35 = sub_24394B6DC(v44);
    swift_bridgeObjectRelease();
    if (v35)
    {

      return v35;
    }
    sub_24393DE88();
    swift_allocError();
    *(_QWORD *)v47 = 0xD00000000000002ALL;
    *(_QWORD *)(v47 + 8) = 0x800000024397A3F0;
    *(_BYTE *)(v47 + 16) = 1;
  }
  else
  {
    v46 = 0;
    sub_24396F8CC();

  }
  swift_willThrow();

  return v35;
}

uint64_t sub_24396D8C4(unint64_t a1, char a2)
{
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;

  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v3 = sub_24396FF20();
    if (v3)
    {
LABEL_3:
      if ((a1 & 0xC000000000000001) != 0)
      {
        MEMORY[0x2494FD69C](0, a1);
      }
      else
      {
        if (!*(_QWORD *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
        {
          __break(1u);
          JUMPOUT(0x24396F43CLL);
        }
        v4 = *(id *)(a1 + 32);
      }
      __asm { BR              X8 }
    }
  }
  else
  {
    v3 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v3)
      goto LABEL_3;
  }
  swift_bridgeObjectRelease();
  v5 = swift_bridgeObjectRetain();
  v6 = sub_24396C3A8(v5);
  swift_bridgeObjectRelease_n();
  sub_24393DFCC(0);
  sub_24393DFCC(0);
  sub_24393DFCC(0);
  sub_24393DFCC(0);
  sub_24393DFCC(v3);
  return v6;
}

uint64_t sub_24396F564(unint64_t a1)
{
  unint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  char v18;
  uint64_t v19;
  id v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  char v34;
  uint64_t v35;
  id v36;
  char v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;

  v1 = a1;
  v2 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v5 = sub_24396FF20();
    swift_bridgeObjectRelease();
    if (v5)
    {
LABEL_3:
      __swift_instantiateConcreteTypeFromMangledName(&qword_2572DA0E8);
      v3 = sub_24396FE3C();
      if (!v2)
        goto LABEL_4;
LABEL_8:
      swift_bridgeObjectRetain();
      v4 = sub_24396FF20();
      swift_bridgeObjectRelease();
      if (!v4)
        return v3;
      goto LABEL_9;
    }
  }
  else if (*(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    goto LABEL_3;
  }
  v3 = MEMORY[0x24BEE4B08];
  if (v2)
    goto LABEL_8;
LABEL_4:
  v4 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v4)
    return v3;
LABEL_9:
  v6 = v3 + 56;
  v43 = v4;
  if ((v1 & 0xC000000000000001) != 0)
  {
    v7 = 0;
    v41 = v1;
    while (1)
    {
      while (1)
      {
        v8 = MEMORY[0x2494FD69C](v7, v1);
        v9 = __OFADD__(v7++, 1);
        if (v9)
        {
          __break(1u);
          goto LABEL_36;
        }
        v10 = v8;
        v11 = sub_24396FD70();
        v12 = -1 << *(_BYTE *)(v3 + 32);
        v13 = v11 & ~v12;
        v14 = v13 >> 6;
        v15 = *(_QWORD *)(v6 + 8 * (v13 >> 6));
        v16 = 1 << v13;
        if (((1 << v13) & v15) != 0)
          break;
LABEL_20:
        *(_QWORD *)(v6 + 8 * v14) = v16 | v15;
        *(_QWORD *)(*(_QWORD *)(v3 + 48) + 8 * v13) = v10;
        v22 = *(_QWORD *)(v3 + 16);
        v9 = __OFADD__(v22, 1);
        v23 = v22 + 1;
        if (v9)
          goto LABEL_37;
        *(_QWORD *)(v3 + 16) = v23;
        if (v7 == v4)
          return v3;
      }
      sub_24393E124(0, &qword_2572DA0E0);
      v17 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v13);
      v18 = sub_24396FD7C();

      if ((v18 & 1) == 0)
      {
        v19 = ~v12;
        while (1)
        {
          v13 = (v13 + 1) & v19;
          v14 = v13 >> 6;
          v15 = *(_QWORD *)(v6 + 8 * (v13 >> 6));
          v16 = 1 << v13;
          if ((v15 & (1 << v13)) == 0)
            break;
          v20 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v13);
          v21 = sub_24396FD7C();

          if ((v21 & 1) != 0)
            goto LABEL_11;
        }
        v1 = v41;
        v4 = v43;
        goto LABEL_20;
      }
LABEL_11:
      swift_unknownObjectRelease();
      v1 = v41;
      v4 = v43;
      if (v7 == v43)
        return v3;
    }
  }
  v25 = 0;
  v40 = v1 + 32;
  v42 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (v25 != v42)
  {
    v26 = *(id *)(v40 + 8 * v25);
    v27 = sub_24396FD70();
    v28 = -1 << *(_BYTE *)(v3 + 32);
    v29 = v27 & ~v28;
    v30 = v29 >> 6;
    v31 = *(_QWORD *)(v6 + 8 * (v29 >> 6));
    v32 = 1 << v29;
    if (((1 << v29) & v31) != 0)
    {
      sub_24393E124(0, &qword_2572DA0E0);
      v33 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v29);
      v34 = sub_24396FD7C();

      if ((v34 & 1) != 0)
      {
LABEL_24:

        goto LABEL_25;
      }
      v35 = ~v28;
      while (1)
      {
        v29 = (v29 + 1) & v35;
        v30 = v29 >> 6;
        v31 = *(_QWORD *)(v6 + 8 * (v29 >> 6));
        v32 = 1 << v29;
        if ((v31 & (1 << v29)) == 0)
          break;
        v36 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v29);
        v37 = sub_24396FD7C();

        if ((v37 & 1) != 0)
          goto LABEL_24;
      }
    }
    *(_QWORD *)(v6 + 8 * v30) = v32 | v31;
    *(_QWORD *)(*(_QWORD *)(v3 + 48) + 8 * v29) = v26;
    v38 = *(_QWORD *)(v3 + 16);
    v9 = __OFADD__(v38, 1);
    v39 = v38 + 1;
    if (v9)
      goto LABEL_38;
    *(_QWORD *)(v3 + 16) = v39;
LABEL_25:
    if (++v25 == v43)
      return v3;
  }
LABEL_36:
  __break(1u);
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
  return sub_24396F8C0();
}

uint64_t sub_24396F8C0()
{
  return MEMORY[0x24BDCB140]();
}

uint64_t sub_24396F8CC()
{
  return MEMORY[0x24BDCD300]();
}

uint64_t sub_24396F8D8()
{
  return MEMORY[0x24BDCD818]();
}

uint64_t sub_24396F8E4()
{
  return MEMORY[0x24BDCD868]();
}

uint64_t sub_24396F8F0()
{
  return MEMORY[0x24BDCD8D8]();
}

uint64_t sub_24396F8FC()
{
  return MEMORY[0x24BDCD9B8]();
}

uint64_t sub_24396F908()
{
  return MEMORY[0x24BDCD9E0]();
}

uint64_t sub_24396F914()
{
  return MEMORY[0x24BDCDA00]();
}

uint64_t sub_24396F920()
{
  return MEMORY[0x24BDCDAB8]();
}

uint64_t sub_24396F92C()
{
  return MEMORY[0x24BDCDCE8]();
}

uint64_t sub_24396F938()
{
  return MEMORY[0x24BDCDD28]();
}

uint64_t sub_24396F944()
{
  return MEMORY[0x24BDCDE80]();
}

uint64_t sub_24396F950()
{
  return MEMORY[0x24BDCDE88]();
}

uint64_t sub_24396F95C()
{
  return MEMORY[0x24BDCE1B0]();
}

uint64_t sub_24396F968()
{
  return MEMORY[0x24BDCE1D8]();
}

uint64_t sub_24396F974()
{
  return MEMORY[0x24BDCE248]();
}

uint64_t sub_24396F980()
{
  return MEMORY[0x24BDCE2A8]();
}

uint64_t sub_24396F98C()
{
  return MEMORY[0x24BDCE338]();
}

uint64_t sub_24396F998()
{
  return MEMORY[0x24BDCE470]();
}

uint64_t sub_24396F9A4()
{
  return MEMORY[0x24BDCE5D0]();
}

uint64_t sub_24396F9B0()
{
  return MEMORY[0x24BDCE5E0]();
}

uint64_t sub_24396F9BC()
{
  return MEMORY[0x24BDCE618]();
}

uint64_t sub_24396F9C8()
{
  return MEMORY[0x24BDCE620]();
}

uint64_t sub_24396F9D4()
{
  return MEMORY[0x24BDCE870]();
}

uint64_t sub_24396F9E0()
{
  return MEMORY[0x24BDCE888]();
}

uint64_t sub_24396F9EC()
{
  return MEMORY[0x24BDCE8E0]();
}

uint64_t sub_24396F9F8()
{
  return MEMORY[0x24BDCE8F0]();
}

uint64_t sub_24396FA04()
{
  return MEMORY[0x24BDCE908]();
}

uint64_t sub_24396FA10()
{
  return MEMORY[0x24BDCEEB0]();
}

uint64_t sub_24396FA1C()
{
  return MEMORY[0x24BDCF080]();
}

uint64_t sub_24396FA28()
{
  return MEMORY[0x24BDCF130]();
}

uint64_t sub_24396FA34()
{
  return MEMORY[0x24BDCF1B8]();
}

uint64_t sub_24396FA40()
{
  return MEMORY[0x24BDCF298]();
}

uint64_t sub_24396FA4C()
{
  return MEMORY[0x24BDCF2C8]();
}

uint64_t sub_24396FA58()
{
  return MEMORY[0x24BDCF2E0]();
}

uint64_t sub_24396FA64()
{
  return MEMORY[0x24BE80820]();
}

uint64_t sub_24396FA70()
{
  return MEMORY[0x24BE80828]();
}

uint64_t sub_24396FA7C()
{
  return MEMORY[0x24BE80838]();
}

uint64_t sub_24396FA88()
{
  return MEMORY[0x24BE80840]();
}

uint64_t sub_24396FA94()
{
  return MEMORY[0x24BE80850]();
}

uint64_t sub_24396FAA0()
{
  return MEMORY[0x24BE80858]();
}

uint64_t sub_24396FAAC()
{
  return MEMORY[0x24BE80860]();
}

uint64_t sub_24396FAB8()
{
  return MEMORY[0x24BE80868]();
}

uint64_t sub_24396FAC4()
{
  return MEMORY[0x24BE80878]();
}

uint64_t sub_24396FAD0()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_24396FADC()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_24396FAE8()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_24396FAF4()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_24396FB00()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_24396FB0C()
{
  return MEMORY[0x24BDCF800]();
}

uint64_t sub_24396FB18()
{
  return MEMORY[0x24BDCF838]();
}

uint64_t sub_24396FB24()
{
  return MEMORY[0x24BEE0270]();
}

uint64_t sub_24396FB30()
{
  return MEMORY[0x24BEE0290]();
}

uint64_t sub_24396FB3C()
{
  return MEMORY[0x24BEE07E0]();
}

uint64_t sub_24396FB48()
{
  return MEMORY[0x24BDCF9E8]();
}

uint64_t sub_24396FB54()
{
  return MEMORY[0x24BDCFA10]();
}

uint64_t sub_24396FB60()
{
  return MEMORY[0x24BDCFA20]();
}

uint64_t sub_24396FB6C()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_24396FB78()
{
  return MEMORY[0x24BEE0AD8]();
}

uint64_t sub_24396FB84()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_24396FB90()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_24396FB9C()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_24396FBA8()
{
  return MEMORY[0x24BEE0C18]();
}

uint64_t sub_24396FBB4()
{
  return MEMORY[0x24BEE0C30]();
}

uint64_t sub_24396FBC0()
{
  return MEMORY[0x24BEE0C38]();
}

uint64_t sub_24396FBCC()
{
  return MEMORY[0x24BEE0C40]();
}

uint64_t sub_24396FBD8()
{
  return MEMORY[0x24BEE0CA0]();
}

uint64_t sub_24396FBE4()
{
  return MEMORY[0x24BEE0DD0]();
}

uint64_t sub_24396FBF0()
{
  return MEMORY[0x24BEE0DE0]();
}

uint64_t sub_24396FBFC()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_24396FC08()
{
  return MEMORY[0x24BDCFBA0]();
}

uint64_t sub_24396FC14()
{
  return MEMORY[0x24BDCFBD0]();
}

uint64_t sub_24396FC20()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t sub_24396FC2C()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_24396FC38()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_24396FC44()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t sub_24396FC50()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_24396FC5C()
{
  return MEMORY[0x24BEE1270]();
}

uint64_t sub_24396FC68()
{
  return MEMORY[0x24BDCFC10]();
}

uint64_t _s25PeopleSuggesterLighthouse31IsTaskCancelledExecutionManagerV10shouldStopSbvg_0()
{
  return MEMORY[0x24BEE6B10]();
}

uint64_t sub_24396FC80()
{
  return MEMORY[0x24BEE6B20]();
}

uint64_t sub_24396FC8C()
{
  return MEMORY[0x24BDCFC48]();
}

uint64_t sub_24396FC98()
{
  return MEMORY[0x24BDCFC50]();
}

uint64_t sub_24396FCA4()
{
  return MEMORY[0x24BEE1370]();
}

uint64_t sub_24396FCB0()
{
  return MEMORY[0x24BDCFCE0]();
}

uint64_t sub_24396FCBC()
{
  return MEMORY[0x24BEE15D8]();
}

uint64_t sub_24396FCC8()
{
  return MEMORY[0x24BEE1678]();
}

uint64_t sub_24396FCD4()
{
  return MEMORY[0x24BEE16C8]();
}

uint64_t sub_24396FCE0()
{
  return MEMORY[0x24BDCFD20]();
}

uint64_t sub_24396FCEC()
{
  return MEMORY[0x24BDCFDD0]();
}

uint64_t sub_24396FCF8()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_24396FD04()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_24396FD10()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_24396FD1C()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t sub_24396FD28()
{
  return MEMORY[0x24BEE5688]();
}

uint64_t sub_24396FD34()
{
  return MEMORY[0x24BEE5760]();
}

uint64_t sub_24396FD40()
{
  return MEMORY[0x24BEE5780]();
}

uint64_t sub_24396FD4C()
{
  return MEMORY[0x24BEE57A0]();
}

uint64_t sub_24396FD58()
{
  return MEMORY[0x24BDD0148]();
}

uint64_t sub_24396FD64()
{
  return MEMORY[0x24BDD0200]();
}

uint64_t sub_24396FD70()
{
  return MEMORY[0x24BEE5BB8]();
}

uint64_t sub_24396FD7C()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_24396FD88()
{
  return MEMORY[0x24BEE1C88]();
}

uint64_t sub_24396FD94()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_24396FDA0()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_24396FDAC()
{
  return MEMORY[0x24BDD05F8]();
}

uint64_t sub_24396FDB8()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_24396FDC4()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_24396FDD0()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t sub_24396FDDC()
{
  return MEMORY[0x24BEE22E0]();
}

uint64_t sub_24396FDE8()
{
  return MEMORY[0x24BEE2300]();
}

uint64_t sub_24396FDF4()
{
  return MEMORY[0x24BEE2330]();
}

uint64_t sub_24396FE00()
{
  return MEMORY[0x24BEE2340]();
}

uint64_t sub_24396FE0C()
{
  return MEMORY[0x24BEE2358]();
}

uint64_t sub_24396FE18()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_24396FE24()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_24396FE30()
{
  return MEMORY[0x24BEE24C8]();
}

uint64_t sub_24396FE3C()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_24396FE48()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_24396FE54()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_24396FE60()
{
  return MEMORY[0x24BEE2648]();
}

uint64_t sub_24396FE6C()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_24396FE78()
{
  return MEMORY[0x24BEE2660]();
}

uint64_t sub_24396FE84()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_24396FE90()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t sub_24396FE9C()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_24396FEA8()
{
  return MEMORY[0x24BEE2958]();
}

uint64_t sub_24396FEB4()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t sub_24396FEC0()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t sub_24396FECC()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_24396FED8()
{
  return MEMORY[0x24BEE2E88]();
}

uint64_t sub_24396FEE4()
{
  return MEMORY[0x24BEE2EA8]();
}

uint64_t sub_24396FEF0()
{
  return MEMORY[0x24BEE2EE0]();
}

uint64_t sub_24396FEFC()
{
  return MEMORY[0x24BEE2F18]();
}

uint64_t sub_24396FF08()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_24396FF14()
{
  return MEMORY[0x24BEE2F58]();
}

uint64_t sub_24396FF20()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_24396FF2C()
{
  return MEMORY[0x24BEE3070]();
}

uint64_t sub_24396FF38()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_24396FF44()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_24396FF50()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_24396FF5C()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_24396FF68()
{
  return MEMORY[0x24BEE3540]();
}

uint64_t sub_24396FF74()
{
  return MEMORY[0x24BEE3548]();
}

uint64_t sub_24396FF80()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_24396FF8C()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_24396FF98()
{
  return MEMORY[0x24BEE3B90]();
}

uint64_t sub_24396FFA4()
{
  return MEMORY[0x24BEE3B98]();
}

uint64_t sub_24396FFB0()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_24396FFBC()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_24396FFC8()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_24396FFD4()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_24396FFE0()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_24396FFEC()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_24396FFF8()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_243970004()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_243970010()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_24397001C()
{
  return MEMORY[0x24BDD07D8]();
}

uint64_t BMMLSEDurableFeatureStorefeatureNameAsString()
{
  return MEMORY[0x24BE0C180]();
}

uint64_t BMMLSEVirtualFeatureStoreFeaturefeatureNameAsString()
{
  return MEMORY[0x24BE0C188]();
}

uint64_t BiomeLibrary()
{
  return MEMORY[0x24BE0C258]();
}

uint64_t PBDataWriterWriteBOOLField()
{
  return MEMORY[0x24BE7AF80]();
}

uint64_t PBDataWriterWriteDoubleField()
{
  return MEMORY[0x24BE7AF90]();
}

uint64_t PBDataWriterWriteInt32Field()
{
  return MEMORY[0x24BE7AFA8]();
}

uint64_t PBDataWriterWriteStringField()
{
  return MEMORY[0x24BE7AFD8]();
}

uint64_t PBDataWriterWriteSubmessage()
{
  return MEMORY[0x24BE7AFE8]();
}

uint64_t PBDataWriterWriteUint32Field()
{
  return MEMORY[0x24BE7AFF0]();
}

uint64_t PBReaderPlaceMark()
{
  return MEMORY[0x24BE7B018]();
}

uint64_t PBReaderReadString()
{
  return MEMORY[0x24BE7B030]();
}

uint64_t PBReaderRecallMark()
{
  return MEMORY[0x24BE7B038]();
}

uint64_t PBReaderSkipValueWithTag()
{
  return MEMORY[0x24BE7B048]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

uint64_t _objc_autoreleasePoolPop()
{
  return MEMORY[0x24BEDCE10]();
}

uint64_t _objc_autoreleasePoolPush()
{
  return MEMORY[0x24BEDCE18]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x24BEE4B30]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

long double fmod(long double __x, long double __y)
{
  long double result;

  MEMORY[0x24BDAE3F0](__x, __y);
  return result;
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x24BDAED08](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x24BDAED60](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t os_variant_allows_internal_security_policies()
{
  return MEMORY[0x24BDAF4B0]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x24BEE4B68]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x24BEE4B98]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x24BEE4BA0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x24BEE4BB8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x24BEE4BC8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x24BEE4BD8]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x24BEE4C40]();
}

uint64_t swift_dynamicCastMetatype()
{
  return MEMORY[0x24BEE4C50]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x24BEE4C60]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x24BEE4C98]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x24BEE4CA8]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x24BEE4DA0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x24BEE4DB8]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x24BEE4E18]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x24BEE4E48]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x24BEE4E68]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x24BEE4E90]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
}

uint64_t swift_once()
{
  return MEMORY[0x24BEE4EC8]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x24BEE4F00]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x24BEE4F10]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x24BEE4F30]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x24BEE4F38]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x24BEE4F40]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x24BEE4F88]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

