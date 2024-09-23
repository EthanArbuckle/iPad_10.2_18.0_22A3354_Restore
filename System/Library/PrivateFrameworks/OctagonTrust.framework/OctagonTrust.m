BOOL OTICDPRecordSilentContextReadFrom(uint64_t a1, uint64_t a2)
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
  OTCDPRecoveryInformation *v17;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
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
      if ((v10 >> 3) == 2)
        break;
      if ((v10 >> 3) == 1)
      {
        v17 = objc_alloc_init(OTCDPRecoveryInformation);
        objc_storeStrong((id *)(a1 + 16), v17);
        if (!PBReaderPlaceMark() || (OTCDPRecoveryInformationReadFrom((uint64_t)v17, a2) & 1) == 0)
          goto LABEL_30;
LABEL_25:
        PBReaderRecallMark();

        goto LABEL_27;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_27:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    v17 = objc_alloc_init(OTEscrowAuthenticationInformation);
    objc_storeStrong((id *)(a1 + 8), v17);
    if (!PBReaderPlaceMark() || (OTEscrowAuthenticationInformationReadFrom((uint64_t)v17, a2) & 1) == 0)
    {
LABEL_30:

      return 0;
    }
    goto LABEL_25;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t OTWalrusReadFrom(uint64_t a1, uint64_t a2)
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

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
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
      if ((v10 >> 3) == 1)
      {
        v17 = 0;
        v18 = 0;
        v19 = 0;
        *(_BYTE *)(a1 + 12) |= 1u;
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
            goto LABEL_29;
          v17 += 7;
          v14 = v18++ >= 9;
          if (v14)
          {
            v19 = 0;
            goto LABEL_31;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_29:
        if (*(_BYTE *)(a2 + *v5))
          v19 = 0;
LABEL_31:
        *(_BYTE *)(a1 + 8) = v19 != 0;
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

BOOL OTSecureElementPeerIdentityReadFrom(uint64_t a1, uint64_t a2)
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
  uint64_t v18;
  void *v19;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
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
      if ((v10 >> 3) == 2)
        break;
      if ((v10 >> 3) == 1)
      {
        PBReaderReadData();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 16;
LABEL_22:
        v19 = *(void **)(a1 + v18);
        *(_QWORD *)(a1 + v18) = v17;

        goto LABEL_24;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_24:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    PBReaderReadData();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = 8;
    goto LABEL_22;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t OTEscrowAuthenticationInformationReadFrom(uint64_t a1, uint64_t a2)
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
  uint64_t v18;
  uint64_t result;
  char v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  char v26;
  unsigned int v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  char v31;
  void *v32;
  BOOL v33;
  uint64_t v34;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
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
      switch((v10 >> 3))
      {
        case 1u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 48;
          goto LABEL_42;
        case 2u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 24;
          goto LABEL_42;
        case 3u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 8;
          goto LABEL_42;
        case 4u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 56;
          goto LABEL_42;
        case 5u:
          v20 = 0;
          v21 = 0;
          v22 = 0;
          *(_BYTE *)(a1 + 68) |= 1u;
          while (2)
          {
            v23 = *v3;
            v24 = *(_QWORD *)(a2 + v23);
            if (v24 == -1 || v24 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v25 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v24);
              *(_QWORD *)(a2 + v23) = v24 + 1;
              v22 |= (unint64_t)(v25 & 0x7F) << v20;
              if (v25 < 0)
              {
                v20 += 7;
                v14 = v21++ >= 9;
                if (v14)
                {
                  v22 = 0;
                  goto LABEL_46;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v22 = 0;
LABEL_46:
          v33 = v22 != 0;
          v34 = 64;
          goto LABEL_51;
        case 6u:
          v26 = 0;
          v27 = 0;
          v28 = 0;
          *(_BYTE *)(a1 + 68) |= 2u;
          break;
        case 7u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 16;
          goto LABEL_42;
        case 8u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 32;
          goto LABEL_42;
        case 9u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 40;
LABEL_42:
          v32 = *(void **)(a1 + v18);
          *(_QWORD *)(a1 + v18) = v17;

          continue;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v29 = *v3;
        v30 = *(_QWORD *)(a2 + v29);
        if (v30 == -1 || v30 >= *(_QWORD *)(a2 + *v4))
          break;
        v31 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v30);
        *(_QWORD *)(a2 + v29) = v30 + 1;
        v28 |= (unint64_t)(v31 & 0x7F) << v26;
        if ((v31 & 0x80) == 0)
          goto LABEL_48;
        v26 += 7;
        v14 = v27++ >= 9;
        if (v14)
        {
          v28 = 0;
          goto LABEL_50;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_48:
      if (*(_BYTE *)(a2 + *v5))
        v28 = 0;
LABEL_50:
      v33 = v28 != 0;
      v34 = 65;
LABEL_51:
      *(_BYTE *)(a1 + v34) = v33;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t OTEscrowRecordMetadataReadFrom(uint64_t a1, uint64_t a2)
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
  uint64_t v18;
  uint64_t result;
  OTEscrowRecordMetadataClientMetadata *v20;
  char v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;
  char v27;
  unsigned int v28;
  uint64_t v29;
  unint64_t v30;
  char v31;
  void *v32;
  uint64_t v33;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = (int *)MEMORY[0x1E0D82BB8];
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
        PBReaderReadData();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 24;
        goto LABEL_45;
      case 2u:
        v20 = objc_alloc_init(OTEscrowRecordMetadataClientMetadata);
        objc_storeStrong((id *)(a1 + 56), v20);
        if (!PBReaderPlaceMark()
          || (OTEscrowRecordMetadataClientMetadataReadFrom((uint64_t)v20, a2) & 1) == 0)
        {
          goto LABEL_60;
        }
        goto LABEL_48;
      case 3u:
        v21 = 0;
        v22 = 0;
        v23 = 0;
        *(_BYTE *)(a1 + 96) |= 2u;
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
                v23 = 0;
                goto LABEL_52;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v23 = 0;
LABEL_52:
        v33 = 16;
        goto LABEL_57;
      case 4u:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 32;
        goto LABEL_45;
      case 5u:
        v27 = 0;
        v28 = 0;
        v23 = 0;
        *(_BYTE *)(a1 + 96) |= 1u;
        while (2)
        {
          v29 = *v3;
          v30 = *(_QWORD *)(a2 + v29);
          if (v30 == -1 || v30 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v31 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v30);
            *(_QWORD *)(a2 + v29) = v30 + 1;
            v23 |= (unint64_t)(v31 & 0x7F) << v27;
            if (v31 < 0)
            {
              v27 += 7;
              v14 = v28++ >= 9;
              if (v14)
              {
                v23 = 0;
                goto LABEL_56;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v23 = 0;
LABEL_56:
        v33 = 8;
LABEL_57:
        *(_QWORD *)(a1 + v33) = v23;
        goto LABEL_58;
      case 6u:
        PBReaderReadData();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 64;
        goto LABEL_45;
      case 7u:
        PBReaderReadData();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 80;
        goto LABEL_45;
      case 8u:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 40;
        goto LABEL_45;
      case 9u:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 88;
        goto LABEL_45;
      case 0xAu:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 48;
LABEL_45:
        v32 = *(void **)(a1 + v18);
        *(_QWORD *)(a1 + v18) = v17;

        goto LABEL_58;
      case 0xBu:
        v20 = objc_alloc_init(OTEscrowRecordMetadataPasscodeGeneration);
        objc_storeStrong((id *)(a1 + 72), v20);
        if (PBReaderPlaceMark()
          && (OTEscrowRecordMetadataPasscodeGenerationReadFrom((uint64_t)v20, a2) & 1) != 0)
        {
LABEL_48:
          PBReaderRecallMark();

LABEL_58:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }
LABEL_60:

        return 0;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_58;
    }
  }
}

BOOL OTAccountSettingsReadFrom(uint64_t a1, uint64_t a2)
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
  OTWalrus *v17;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
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
      if ((v10 >> 3) == 2)
        break;
      if ((v10 >> 3) == 1)
      {
        v17 = objc_alloc_init(OTWalrus);
        objc_storeStrong((id *)(a1 + 8), v17);
        if (!PBReaderPlaceMark() || (OTWalrusReadFrom((uint64_t)v17, a2) & 1) == 0)
          goto LABEL_30;
LABEL_25:
        PBReaderRecallMark();

        goto LABEL_27;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_27:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    v17 = objc_alloc_init(OTWebAccess);
    objc_storeStrong((id *)(a1 + 16), v17);
    if (!PBReaderPlaceMark() || (OTWebAccessReadFrom((uint64_t)v17, a2) & 1) == 0)
    {
LABEL_30:

      return 0;
    }
    goto LABEL_25;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

id getkSecureBackupEscrowDateKey()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getkSecureBackupEscrowDateKeySymbolLoc_ptr;
  v7 = getkSecureBackupEscrowDateKeySymbolLoc_ptr;
  if (!getkSecureBackupEscrowDateKeySymbolLoc_ptr)
  {
    v1 = (void *)CloudServicesLibrary();
    v0 = (id *)dlsym(v1, "kSecureBackupEscrowDateKey");
    v5[3] = (uint64_t)v0;
    getkSecureBackupEscrowDateKeySymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    dlerror();
    v3 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

id getkSecureBackupRemainingAttemptsKey()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getkSecureBackupRemainingAttemptsKeySymbolLoc_ptr;
  v7 = getkSecureBackupRemainingAttemptsKeySymbolLoc_ptr;
  if (!getkSecureBackupRemainingAttemptsKeySymbolLoc_ptr)
  {
    v1 = (void *)CloudServicesLibrary();
    v0 = (id *)dlsym(v1, "kSecureBackupRemainingAttemptsKey");
    v5[3] = (uint64_t)v0;
    getkSecureBackupRemainingAttemptsKeySymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    dlerror();
    v3 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

id getkSecureBackupRecordLabelKey()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getkSecureBackupRecordLabelKeySymbolLoc_ptr;
  v7 = getkSecureBackupRecordLabelKeySymbolLoc_ptr;
  if (!getkSecureBackupRecordLabelKeySymbolLoc_ptr)
  {
    v1 = (void *)CloudServicesLibrary();
    v0 = (id *)dlsym(v1, "kSecureBackupRecordLabelKey");
    v5[3] = (uint64_t)v0;
    getkSecureBackupRecordLabelKeySymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    dlerror();
    v3 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

id getkSecureBackupRecordStatusKey()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getkSecureBackupRecordStatusKeySymbolLoc_ptr;
  v7 = getkSecureBackupRecordStatusKeySymbolLoc_ptr;
  if (!getkSecureBackupRecordStatusKeySymbolLoc_ptr)
  {
    v1 = (void *)CloudServicesLibrary();
    v0 = (id *)dlsym(v1, "kSecureBackupRecordStatusKey");
    v5[3] = (uint64_t)v0;
    getkSecureBackupRecordStatusKeySymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    dlerror();
    v3 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

id getkSecureBackupRecordIDKey()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getkSecureBackupRecordIDKeySymbolLoc_ptr;
  v7 = getkSecureBackupRecordIDKeySymbolLoc_ptr;
  if (!getkSecureBackupRecordIDKeySymbolLoc_ptr)
  {
    v1 = (void *)CloudServicesLibrary();
    v0 = (id *)dlsym(v1, "kSecureBackupRecordIDKey");
    v5[3] = (uint64_t)v0;
    getkSecureBackupRecordIDKeySymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    dlerror();
    v3 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

id getkSecureBackupPeerInfoSerialNumberKey()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getkSecureBackupPeerInfoSerialNumberKeySymbolLoc_ptr;
  v7 = getkSecureBackupPeerInfoSerialNumberKeySymbolLoc_ptr;
  if (!getkSecureBackupPeerInfoSerialNumberKeySymbolLoc_ptr)
  {
    v1 = (void *)CloudServicesLibrary();
    v0 = (id *)dlsym(v1, "kSecureBackupPeerInfoSerialNumberKey");
    v5[3] = (uint64_t)v0;
    getkSecureBackupPeerInfoSerialNumberKeySymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    dlerror();
    v3 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

id getkSecureBackupCoolOffEndKey()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getkSecureBackupCoolOffEndKeySymbolLoc_ptr;
  v7 = getkSecureBackupCoolOffEndKeySymbolLoc_ptr;
  if (!getkSecureBackupCoolOffEndKeySymbolLoc_ptr)
  {
    v1 = (void *)CloudServicesLibrary();
    v0 = (id *)dlsym(v1, "kSecureBackupCoolOffEndKey");
    v5[3] = (uint64_t)v0;
    getkSecureBackupCoolOffEndKeySymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    dlerror();
    v3 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

id getkSecureBackupRecoveryStatusKey()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getkSecureBackupRecoveryStatusKeySymbolLoc_ptr;
  v7 = getkSecureBackupRecoveryStatusKeySymbolLoc_ptr;
  if (!getkSecureBackupRecoveryStatusKeySymbolLoc_ptr)
  {
    v1 = (void *)CloudServicesLibrary();
    v0 = (id *)dlsym(v1, "kSecureBackupRecoveryStatusKey");
    v5[3] = (uint64_t)v0;
    getkSecureBackupRecoveryStatusKeySymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    dlerror();
    v3 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

uint64_t CloudServicesLibrary()
{
  uint64_t v0;
  void *v2;

  if (CloudServicesLibraryCore_frameworkLibrary)
    return CloudServicesLibraryCore_frameworkLibrary;
  CloudServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = CloudServicesLibraryCore_frameworkLibrary;
  if (!CloudServicesLibraryCore_frameworkLibrary)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

id getkSecureBackupClientMetadataKey()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getkSecureBackupClientMetadataKeySymbolLoc_ptr;
  v7 = getkSecureBackupClientMetadataKeySymbolLoc_ptr;
  if (!getkSecureBackupClientMetadataKeySymbolLoc_ptr)
  {
    v1 = (void *)CloudServicesLibrary();
    v0 = (id *)dlsym(v1, "kSecureBackupClientMetadataKey");
    v5[3] = (uint64_t)v0;
    getkSecureBackupClientMetadataKeySymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    dlerror();
    v3 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

id getkSecureBackupUsesMultipleiCSCKey()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getkSecureBackupUsesMultipleiCSCKeySymbolLoc_ptr;
  v7 = getkSecureBackupUsesMultipleiCSCKeySymbolLoc_ptr;
  if (!getkSecureBackupUsesMultipleiCSCKeySymbolLoc_ptr)
  {
    v1 = (void *)CloudServicesLibrary();
    v0 = (id *)dlsym(v1, "kSecureBackupUsesMultipleiCSCKey");
    v5[3] = (uint64_t)v0;
    getkSecureBackupUsesMultipleiCSCKeySymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    dlerror();
    v3 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

id getkSecureBackupBottleIDKey()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getkSecureBackupBottleIDKeySymbolLoc_ptr;
  v7 = getkSecureBackupBottleIDKeySymbolLoc_ptr;
  if (!getkSecureBackupBottleIDKeySymbolLoc_ptr)
  {
    v1 = (void *)CloudServicesLibrary();
    v0 = (id *)dlsym(v1, "kSecureBackupBottleIDKey");
    v5[3] = (uint64_t)v0;
    getkSecureBackupBottleIDKeySymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    dlerror();
    v3 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

id getkSecureBackupEscrowedSPKIKey()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getkSecureBackupEscrowedSPKIKeySymbolLoc_ptr;
  v7 = getkSecureBackupEscrowedSPKIKeySymbolLoc_ptr;
  if (!getkSecureBackupEscrowedSPKIKeySymbolLoc_ptr)
  {
    v1 = (void *)CloudServicesLibrary();
    v0 = (id *)dlsym(v1, "kSecureBackupEscrowedSPKIKey");
    v5[3] = (uint64_t)v0;
    getkSecureBackupEscrowedSPKIKeySymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    dlerror();
    v3 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

id getkSecureBackupPeerInfoDataKey()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getkSecureBackupPeerInfoDataKeySymbolLoc_ptr;
  v7 = getkSecureBackupPeerInfoDataKeySymbolLoc_ptr;
  if (!getkSecureBackupPeerInfoDataKeySymbolLoc_ptr)
  {
    v1 = (void *)CloudServicesLibrary();
    v0 = (id *)dlsym(v1, "kSecureBackupPeerInfoDataKey");
    v5[3] = (uint64_t)v0;
    getkSecureBackupPeerInfoDataKeySymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    dlerror();
    v3 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

id getkSecureBackupSerialNumberKey()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getkSecureBackupSerialNumberKeySymbolLoc_ptr;
  v7 = getkSecureBackupSerialNumberKeySymbolLoc_ptr;
  if (!getkSecureBackupSerialNumberKeySymbolLoc_ptr)
  {
    v1 = (void *)CloudServicesLibrary();
    v0 = (id *)dlsym(v1, "kSecureBackupSerialNumberKey");
    v5[3] = (uint64_t)v0;
    getkSecureBackupSerialNumberKeySymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    dlerror();
    v3 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

id getkSecureBackupBuildVersionKey()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getkSecureBackupBuildVersionKeySymbolLoc_ptr;
  v7 = getkSecureBackupBuildVersionKeySymbolLoc_ptr;
  if (!getkSecureBackupBuildVersionKeySymbolLoc_ptr)
  {
    v1 = (void *)CloudServicesLibrary();
    v0 = (id *)dlsym(v1, "kSecureBackupBuildVersionKey");
    v5[3] = (uint64_t)v0;
    getkSecureBackupBuildVersionKeySymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    dlerror();
    v3 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

id getkSecureBackupPasscodeGenerationKey()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getkSecureBackupPasscodeGenerationKeySymbolLoc_ptr;
  v7 = getkSecureBackupPasscodeGenerationKeySymbolLoc_ptr;
  if (!getkSecureBackupPasscodeGenerationKeySymbolLoc_ptr)
  {
    v1 = (void *)CloudServicesLibrary();
    v0 = (id *)dlsym(v1, "kSecureBackupPasscodeGenerationKey");
    v5[3] = (uint64_t)v0;
    getkSecureBackupPasscodeGenerationKeySymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    dlerror();
    v3 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

id getkSecureBackupNumericPassphraseLengthKey()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getkSecureBackupNumericPassphraseLengthKeySymbolLoc_ptr;
  v7 = getkSecureBackupNumericPassphraseLengthKeySymbolLoc_ptr;
  if (!getkSecureBackupNumericPassphraseLengthKeySymbolLoc_ptr)
  {
    v1 = (void *)CloudServicesLibrary();
    v0 = (id *)dlsym(v1, "kSecureBackupNumericPassphraseLengthKey");
    v5[3] = (uint64_t)v0;
    getkSecureBackupNumericPassphraseLengthKeySymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    dlerror();
    v3 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

id getkSecureBackupUsesComplexPassphraseKey()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getkSecureBackupUsesComplexPassphraseKeySymbolLoc_ptr;
  v7 = getkSecureBackupUsesComplexPassphraseKeySymbolLoc_ptr;
  if (!getkSecureBackupUsesComplexPassphraseKeySymbolLoc_ptr)
  {
    v1 = (void *)CloudServicesLibrary();
    v0 = (id *)dlsym(v1, "kSecureBackupUsesComplexPassphraseKey");
    v5[3] = (uint64_t)v0;
    getkSecureBackupUsesComplexPassphraseKeySymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    dlerror();
    v3 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

id getkSecureBackupUsesNumericPassphraseKey()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getkSecureBackupUsesNumericPassphraseKeySymbolLoc_ptr;
  v7 = getkSecureBackupUsesNumericPassphraseKeySymbolLoc_ptr;
  if (!getkSecureBackupUsesNumericPassphraseKeySymbolLoc_ptr)
  {
    v1 = (void *)CloudServicesLibrary();
    v0 = (id *)dlsym(v1, "kSecureBackupUsesNumericPassphraseKey");
    v5[3] = (uint64_t)v0;
    getkSecureBackupUsesNumericPassphraseKeySymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    dlerror();
    v3 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

id getkSecureBackupPassphraseKey()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getkSecureBackupPassphraseKeySymbolLoc_ptr;
  v7 = getkSecureBackupPassphraseKeySymbolLoc_ptr;
  if (!getkSecureBackupPassphraseKeySymbolLoc_ptr)
  {
    v1 = (void *)CloudServicesLibrary();
    v0 = (id *)dlsym(v1, "kSecureBackupPassphraseKey");
    v5[3] = (uint64_t)v0;
    getkSecureBackupPassphraseKeySymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    dlerror();
    v3 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

id getkSecureBackupUseCachedPassphraseKey()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getkSecureBackupUseCachedPassphraseKeySymbolLoc_ptr;
  v7 = getkSecureBackupUseCachedPassphraseKeySymbolLoc_ptr;
  if (!getkSecureBackupUseCachedPassphraseKeySymbolLoc_ptr)
  {
    v1 = (void *)CloudServicesLibrary();
    v0 = (id *)dlsym(v1, "kSecureBackupUseCachedPassphraseKey");
    v5[3] = (uint64_t)v0;
    getkSecureBackupUseCachedPassphraseKeySymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    dlerror();
    v3 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

id getkSecureBackupRecoveryKeyKey()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getkSecureBackupRecoveryKeyKeySymbolLoc_ptr;
  v7 = getkSecureBackupRecoveryKeyKeySymbolLoc_ptr;
  if (!getkSecureBackupRecoveryKeyKeySymbolLoc_ptr)
  {
    v1 = (void *)CloudServicesLibrary();
    v0 = (id *)dlsym(v1, "kSecureBackupRecoveryKeyKey");
    v5[3] = (uint64_t)v0;
    getkSecureBackupRecoveryKeyKeySymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    dlerror();
    v3 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

id getkSecureBackupUsesRecoveryKeyKey()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getkSecureBackupUsesRecoveryKeyKeySymbolLoc_ptr;
  v7 = getkSecureBackupUsesRecoveryKeyKeySymbolLoc_ptr;
  if (!getkSecureBackupUsesRecoveryKeyKeySymbolLoc_ptr)
  {
    v1 = (void *)CloudServicesLibrary();
    v0 = (id *)dlsym(v1, "kSecureBackupUsesRecoveryKeyKey");
    v5[3] = (uint64_t)v0;
    getkSecureBackupUsesRecoveryKeyKeySymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    dlerror();
    v3 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

id getkSecureBackupSilentRecoveryAttemptKey()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getkSecureBackupSilentRecoveryAttemptKeySymbolLoc_ptr;
  v7 = getkSecureBackupSilentRecoveryAttemptKeySymbolLoc_ptr;
  if (!getkSecureBackupSilentRecoveryAttemptKeySymbolLoc_ptr)
  {
    v1 = (void *)CloudServicesLibrary();
    v0 = (id *)dlsym(v1, "kSecureBackupSilentRecoveryAttemptKey");
    v5[3] = (uint64_t)v0;
    getkSecureBackupSilentRecoveryAttemptKeySymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    dlerror();
    v3 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

id getkSecureBackupContainsiCDPDataKey()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getkSecureBackupContainsiCDPDataKeySymbolLoc_ptr;
  v7 = getkSecureBackupContainsiCDPDataKeySymbolLoc_ptr;
  if (!getkSecureBackupContainsiCDPDataKeySymbolLoc_ptr)
  {
    v1 = (void *)CloudServicesLibrary();
    v0 = (id *)dlsym(v1, "kSecureBackupContainsiCDPDataKey");
    v5[3] = (uint64_t)v0;
    getkSecureBackupContainsiCDPDataKeySymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    dlerror();
    v3 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

id getkSecureBackupNonViableRepairKey()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getkSecureBackupNonViableRepairKeySymbolLoc_ptr;
  v7 = getkSecureBackupNonViableRepairKeySymbolLoc_ptr;
  if (!getkSecureBackupNonViableRepairKeySymbolLoc_ptr)
  {
    v1 = (void *)CloudServicesLibrary();
    v0 = (id *)dlsym(v1, "kSecureBackupNonViableRepairKey");
    v5[3] = (uint64_t)v0;
    getkSecureBackupNonViableRepairKeySymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    dlerror();
    v3 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

id getkSecureBackupAuthenticationAppleID()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getkSecureBackupAuthenticationAppleIDSymbolLoc_ptr;
  v7 = getkSecureBackupAuthenticationAppleIDSymbolLoc_ptr;
  if (!getkSecureBackupAuthenticationAppleIDSymbolLoc_ptr)
  {
    v1 = (void *)CloudServicesLibrary();
    v0 = (id *)dlsym(v1, "kSecureBackupAuthenticationAppleID");
    v5[3] = (uint64_t)v0;
    getkSecureBackupAuthenticationAppleIDSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    dlerror();
    v3 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

id getkSecureBackupAuthenticationAuthToken()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getkSecureBackupAuthenticationAuthTokenSymbolLoc_ptr;
  v7 = getkSecureBackupAuthenticationAuthTokenSymbolLoc_ptr;
  if (!getkSecureBackupAuthenticationAuthTokenSymbolLoc_ptr)
  {
    v1 = (void *)CloudServicesLibrary();
    v0 = (id *)dlsym(v1, "kSecureBackupAuthenticationAuthToken");
    v5[3] = (uint64_t)v0;
    getkSecureBackupAuthenticationAuthTokenSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    dlerror();
    v3 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

id getkSecureBackupAuthenticationDSID()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getkSecureBackupAuthenticationDSIDSymbolLoc_ptr;
  v7 = getkSecureBackupAuthenticationDSIDSymbolLoc_ptr;
  if (!getkSecureBackupAuthenticationDSIDSymbolLoc_ptr)
  {
    v1 = (void *)CloudServicesLibrary();
    v0 = (id *)dlsym(v1, "kSecureBackupAuthenticationDSID");
    v5[3] = (uint64_t)v0;
    getkSecureBackupAuthenticationDSIDSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    dlerror();
    v3 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

id getkSecureBackupAuthenticationEscrowProxyURL()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getkSecureBackupAuthenticationEscrowProxyURLSymbolLoc_ptr;
  v7 = getkSecureBackupAuthenticationEscrowProxyURLSymbolLoc_ptr;
  if (!getkSecureBackupAuthenticationEscrowProxyURLSymbolLoc_ptr)
  {
    v1 = (void *)CloudServicesLibrary();
    v0 = (id *)dlsym(v1, "kSecureBackupAuthenticationEscrowProxyURL");
    v5[3] = (uint64_t)v0;
    getkSecureBackupAuthenticationEscrowProxyURLSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    dlerror();
    v3 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

id getkSecureBackupAuthenticationiCloudEnvironment()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getkSecureBackupAuthenticationiCloudEnvironmentSymbolLoc_ptr;
  v7 = getkSecureBackupAuthenticationiCloudEnvironmentSymbolLoc_ptr;
  if (!getkSecureBackupAuthenticationiCloudEnvironmentSymbolLoc_ptr)
  {
    v1 = (void *)CloudServicesLibrary();
    v0 = (id *)dlsym(v1, "kSecureBackupAuthenticationiCloudEnvironment");
    v5[3] = (uint64_t)v0;
    getkSecureBackupAuthenticationiCloudEnvironmentSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    dlerror();
    v3 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

id getkSecureBackupAuthenticationPassword()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getkSecureBackupAuthenticationPasswordSymbolLoc_ptr;
  v7 = getkSecureBackupAuthenticationPasswordSymbolLoc_ptr;
  if (!getkSecureBackupAuthenticationPasswordSymbolLoc_ptr)
  {
    v1 = (void *)CloudServicesLibrary();
    v0 = (id *)dlsym(v1, "kSecureBackupAuthenticationPassword");
    v5[3] = (uint64_t)v0;
    getkSecureBackupAuthenticationPasswordSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    dlerror();
    v3 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

id getkSecureBackupFMiPUUIDKey()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getkSecureBackupFMiPUUIDKeySymbolLoc_ptr;
  v7 = getkSecureBackupFMiPUUIDKeySymbolLoc_ptr;
  if (!getkSecureBackupFMiPUUIDKeySymbolLoc_ptr)
  {
    v1 = (void *)CloudServicesLibrary();
    v0 = (id *)dlsym(v1, "kSecureBackupFMiPUUIDKey");
    v5[3] = (uint64_t)v0;
    getkSecureBackupFMiPUUIDKeySymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    dlerror();
    v3 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

id getkSecureBackupFMiPRecoveryKey()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getkSecureBackupFMiPRecoveryKeySymbolLoc_ptr;
  v7 = getkSecureBackupFMiPRecoveryKeySymbolLoc_ptr;
  if (!getkSecureBackupFMiPRecoveryKeySymbolLoc_ptr)
  {
    v1 = (void *)CloudServicesLibrary();
    v0 = (id *)dlsym(v1, "kSecureBackupFMiPRecoveryKey");
    v5[3] = (uint64_t)v0;
    getkSecureBackupFMiPRecoveryKeySymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    dlerror();
    v3 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

id getkSecureBackupIDMSRecoveryKey()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getkSecureBackupIDMSRecoveryKeySymbolLoc_ptr;
  v7 = getkSecureBackupIDMSRecoveryKeySymbolLoc_ptr;
  if (!getkSecureBackupIDMSRecoveryKeySymbolLoc_ptr)
  {
    v1 = (void *)CloudServicesLibrary();
    v0 = (id *)dlsym(v1, "kSecureBackupIDMSRecoveryKey");
    v5[3] = (uint64_t)v0;
    getkSecureBackupIDMSRecoveryKeySymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    dlerror();
    v3 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

uint64_t OTEscrowRecordMetadataClientMetadataReadFrom(uint64_t a1, uint64_t a2)
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
  char v24;
  unsigned int v25;
  uint64_t v26;
  unint64_t v27;
  char v28;
  char v29;
  unsigned int v30;
  uint64_t v31;
  unint64_t v32;
  char v33;
  char v34;
  unsigned int v35;
  uint64_t v36;
  unint64_t v37;
  char v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  char v42;
  unsigned int v43;
  uint64_t v44;
  unint64_t v45;
  char v46;
  uint64_t v47;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
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
      switch((v10 >> 3))
      {
        case 1u:
          v17 = 0;
          v18 = 0;
          v19 = 0;
          *(_BYTE *)(a1 + 104) |= 2u;
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
              goto LABEL_65;
            v17 += 7;
            v14 = v18++ >= 9;
            if (v14)
            {
              v19 = 0;
              goto LABEL_67;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_65:
          if (*(_BYTE *)(a2 + *v5))
            v19 = 0;
LABEL_67:
          v47 = 16;
          goto LABEL_84;
        case 2u:
          v24 = 0;
          v25 = 0;
          v19 = 0;
          *(_BYTE *)(a1 + 104) |= 4u;
          while (2)
          {
            v26 = *v3;
            v27 = *(_QWORD *)(a2 + v26);
            if (v27 == -1 || v27 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v28 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v27);
              *(_QWORD *)(a2 + v26) = v27 + 1;
              v19 |= (unint64_t)(v28 & 0x7F) << v24;
              if (v28 < 0)
              {
                v24 += 7;
                v14 = v25++ >= 9;
                if (v14)
                {
                  v19 = 0;
                  goto LABEL_71;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v19 = 0;
LABEL_71:
          v47 = 24;
          goto LABEL_84;
        case 3u:
          v29 = 0;
          v30 = 0;
          v19 = 0;
          *(_BYTE *)(a1 + 104) |= 8u;
          while (2)
          {
            v31 = *v3;
            v32 = *(_QWORD *)(a2 + v31);
            if (v32 == -1 || v32 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v33 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v32);
              *(_QWORD *)(a2 + v31) = v32 + 1;
              v19 |= (unint64_t)(v33 & 0x7F) << v29;
              if (v33 < 0)
              {
                v29 += 7;
                v14 = v30++ >= 9;
                if (v14)
                {
                  v19 = 0;
                  goto LABEL_75;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v19 = 0;
LABEL_75:
          v47 = 32;
          goto LABEL_84;
        case 4u:
          v34 = 0;
          v35 = 0;
          v19 = 0;
          *(_BYTE *)(a1 + 104) |= 0x10u;
          while (2)
          {
            v36 = *v3;
            v37 = *(_QWORD *)(a2 + v36);
            if (v37 == -1 || v37 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v38 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v37);
              *(_QWORD *)(a2 + v36) = v37 + 1;
              v19 |= (unint64_t)(v38 & 0x7F) << v34;
              if (v38 < 0)
              {
                v34 += 7;
                v14 = v35++ >= 9;
                if (v14)
                {
                  v19 = 0;
                  goto LABEL_79;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v19 = 0;
LABEL_79:
          v47 = 40;
          goto LABEL_84;
        case 5u:
          PBReaderReadString();
          v39 = objc_claimAutoreleasedReturnValue();
          v40 = 48;
          goto LABEL_56;
        case 6u:
          PBReaderReadString();
          v39 = objc_claimAutoreleasedReturnValue();
          v40 = 56;
          goto LABEL_56;
        case 7u:
          PBReaderReadString();
          v39 = objc_claimAutoreleasedReturnValue();
          v40 = 64;
          goto LABEL_56;
        case 8u:
          PBReaderReadString();
          v39 = objc_claimAutoreleasedReturnValue();
          v40 = 72;
          goto LABEL_56;
        case 9u:
          PBReaderReadString();
          v39 = objc_claimAutoreleasedReturnValue();
          v40 = 80;
          goto LABEL_56;
        case 0xAu:
          PBReaderReadString();
          v39 = objc_claimAutoreleasedReturnValue();
          v40 = 88;
          goto LABEL_56;
        case 0xBu:
          PBReaderReadString();
          v39 = objc_claimAutoreleasedReturnValue();
          v40 = 96;
LABEL_56:
          v41 = *(void **)(a1 + v40);
          *(_QWORD *)(a1 + v40) = v39;

          continue;
        case 0xCu:
          v42 = 0;
          v43 = 0;
          v19 = 0;
          *(_BYTE *)(a1 + 104) |= 1u;
          break;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v44 = *v3;
        v45 = *(_QWORD *)(a2 + v44);
        if (v45 == -1 || v45 >= *(_QWORD *)(a2 + *v4))
          break;
        v46 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v45);
        *(_QWORD *)(a2 + v44) = v45 + 1;
        v19 |= (unint64_t)(v46 & 0x7F) << v42;
        if ((v46 & 0x80) == 0)
          goto LABEL_81;
        v42 += 7;
        v14 = v43++ >= 9;
        if (v14)
        {
          v19 = 0;
          goto LABEL_83;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_81:
      if (*(_BYTE *)(a2 + *v5))
        v19 = 0;
LABEL_83:
      v47 = 8;
LABEL_84:
      *(_QWORD *)(a1 + v47) = v19;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t OTEscrowRecordMetadataPasscodeGenerationReadFrom(uint64_t a1, uint64_t a2)
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

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
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
      if ((v10 >> 3) == 1)
      {
        v17 = 0;
        v18 = 0;
        v19 = 0;
        *(_BYTE *)(a1 + 16) |= 1u;
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
            goto LABEL_29;
          v17 += 7;
          v14 = v18++ >= 9;
          if (v14)
          {
            v19 = 0;
            goto LABEL_31;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_29:
        if (*(_BYTE *)(a2 + *v5))
          v19 = 0;
LABEL_31:
        *(_QWORD *)(a1 + 8) = v19;
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

BOOL OTEscrowMoveRequestContextReadFrom(uint64_t a1, uint64_t a2)
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

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
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
        v19 = 8;
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
    v19 = 24;
    goto LABEL_24;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t OTWebAccessReadFrom(uint64_t a1, uint64_t a2)
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

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
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
      if ((v10 >> 3) == 1)
      {
        v17 = 0;
        v18 = 0;
        v19 = 0;
        *(_BYTE *)(a1 + 12) |= 1u;
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
            goto LABEL_29;
          v17 += 7;
          v14 = v18++ >= 9;
          if (v14)
          {
            v19 = 0;
            goto LABEL_31;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_29:
        if (*(_BYTE *)(a2 + *v5))
          v19 = 0;
LABEL_31:
        *(_BYTE *)(a1 + 8) = v19 != 0;
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

BOOL OTCurrentSecureElementIdentitiesReadFrom(char *a1, uint64_t a2)
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
  OTSecureElementPeerIdentity *v18;
  uint64_t v19;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
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
      if ((_DWORD)v17 != 2)
      {
        if ((_DWORD)v17 != 1)
        {
          if ((PBReaderSkipValueWithTag() & 1) == 0)
            return 0;
          goto LABEL_29;
        }
        v18 = objc_alloc_init(OTSecureElementPeerIdentity);
        v19 = 8;
        goto LABEL_23;
      }
      v18 = objc_alloc_init(OTSecureElementPeerIdentity);
      objc_msgSend(a1, "addTrustedPeerSecureElementIdentities:", v18);
LABEL_25:
      if (!PBReaderPlaceMark() || !OTSecureElementPeerIdentityReadFrom((uint64_t)v18, a2))
      {

        return 0;
      }
      PBReaderRecallMark();

LABEL_29:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    v18 = objc_alloc_init(OTSecureElementPeerIdentity);
    v19 = 16;
LABEL_23:
    objc_storeStrong((id *)&a1[v19], v18);
    goto LABEL_25;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_19A8061DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19A806490(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19A806770(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19A806A38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19A806D18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19A806FD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19A807364(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_19A807E78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

id getSecureBackupClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getSecureBackupClass_softClass;
  v7 = getSecureBackupClass_softClass;
  if (!getSecureBackupClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getSecureBackupClass_block_invoke;
    v3[3] = &unk_1E3919248;
    v3[4] = &v4;
    __getSecureBackupClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_19A808070(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getSecureBackupClass_block_invoke(uint64_t a1)
{
  Class result;

  CloudServicesLibrary_642();
  result = objc_getClass("SecureBackup");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getSecureBackupClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    abort_report_np();
    return (Class)CloudServicesLibrary_642();
  }
  return result;
}

uint64_t CloudServicesLibrary_642()
{
  uint64_t v0;
  void *v2;

  if (CloudServicesLibraryCore_frameworkLibrary_643)
    return CloudServicesLibraryCore_frameworkLibrary_643;
  CloudServicesLibraryCore_frameworkLibrary_643 = _sl_dlopen();
  v0 = CloudServicesLibraryCore_frameworkLibrary_643;
  if (!CloudServicesLibraryCore_frameworkLibrary_643)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

void sub_19A80AB7C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_19A80B678(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19A80C18C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19A80C488(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_19A80C75C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19A80D0C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19A80D43C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_19A80D908(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19A80DB88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  uint64_t v9;
  va_list va;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a8);
  va_start(va, a8);
  v9 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19A80E518(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19A80EF98(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_19A80F2FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_19A80F620(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  uint64_t v8;
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v8 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_19A80F94C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  uint64_t v9;
  va_list va;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a8);
  va_start(va, a8);
  v9 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t OTCDPRecoveryInformationReadFrom(uint64_t a1, uint64_t a2)
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
  uint64_t v18;
  uint64_t result;
  char v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  void *v26;
  char v27;
  unsigned int v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  char v32;
  char v33;
  unsigned int v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  char v38;
  char v39;
  unsigned int v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  char v44;
  char v45;
  unsigned int v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  char v50;
  char v51;
  unsigned int v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  char v56;
  BOOL v57;
  uint64_t v58;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
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
      switch((v10 >> 3))
      {
        case 1u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 16;
          goto LABEL_30;
        case 2u:
          v20 = 0;
          v21 = 0;
          v22 = 0;
          *(_BYTE *)(a1 + 32) |= 8u;
          while (2)
          {
            v23 = *v3;
            v24 = *(_QWORD *)(a2 + v23);
            if (v24 == -1 || v24 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v25 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v24);
              *(_QWORD *)(a2 + v23) = v24 + 1;
              v22 |= (unint64_t)(v25 & 0x7F) << v20;
              if (v25 < 0)
              {
                v20 += 7;
                v14 = v21++ >= 9;
                if (v14)
                {
                  v22 = 0;
                  goto LABEL_69;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v22 = 0;
LABEL_69:
          v57 = v22 != 0;
          v58 = 27;
          goto LABEL_90;
        case 3u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 8;
LABEL_30:
          v26 = *(void **)(a1 + v18);
          *(_QWORD *)(a1 + v18) = v17;

          continue;
        case 4u:
          v27 = 0;
          v28 = 0;
          v29 = 0;
          *(_BYTE *)(a1 + 32) |= 0x10u;
          while (2)
          {
            v30 = *v3;
            v31 = *(_QWORD *)(a2 + v30);
            if (v31 == -1 || v31 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v32 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v31);
              *(_QWORD *)(a2 + v30) = v31 + 1;
              v29 |= (unint64_t)(v32 & 0x7F) << v27;
              if (v32 < 0)
              {
                v27 += 7;
                v14 = v28++ >= 9;
                if (v14)
                {
                  v29 = 0;
                  goto LABEL_73;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v29 = 0;
LABEL_73:
          v57 = v29 != 0;
          v58 = 28;
          goto LABEL_90;
        case 5u:
          v33 = 0;
          v34 = 0;
          v35 = 0;
          *(_BYTE *)(a1 + 32) |= 4u;
          while (2)
          {
            v36 = *v3;
            v37 = *(_QWORD *)(a2 + v36);
            if (v37 == -1 || v37 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v38 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v37);
              *(_QWORD *)(a2 + v36) = v37 + 1;
              v35 |= (unint64_t)(v38 & 0x7F) << v33;
              if (v38 < 0)
              {
                v33 += 7;
                v14 = v34++ >= 9;
                if (v14)
                {
                  v35 = 0;
                  goto LABEL_77;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v35 = 0;
LABEL_77:
          v57 = v35 != 0;
          v58 = 26;
          goto LABEL_90;
        case 6u:
          v39 = 0;
          v40 = 0;
          v41 = 0;
          *(_BYTE *)(a1 + 32) |= 1u;
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
              v41 |= (unint64_t)(v44 & 0x7F) << v39;
              if (v44 < 0)
              {
                v39 += 7;
                v14 = v40++ >= 9;
                if (v14)
                {
                  v41 = 0;
                  goto LABEL_81;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v41 = 0;
LABEL_81:
          v57 = v41 != 0;
          v58 = 24;
          goto LABEL_90;
        case 7u:
          v45 = 0;
          v46 = 0;
          v47 = 0;
          *(_BYTE *)(a1 + 32) |= 0x20u;
          while (2)
          {
            v48 = *v3;
            v49 = *(_QWORD *)(a2 + v48);
            if (v49 == -1 || v49 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v50 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v49);
              *(_QWORD *)(a2 + v48) = v49 + 1;
              v47 |= (unint64_t)(v50 & 0x7F) << v45;
              if (v50 < 0)
              {
                v45 += 7;
                v14 = v46++ >= 9;
                if (v14)
                {
                  v47 = 0;
                  goto LABEL_85;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v47 = 0;
LABEL_85:
          v57 = v47 != 0;
          v58 = 29;
          goto LABEL_90;
        case 8u:
          v51 = 0;
          v52 = 0;
          v53 = 0;
          *(_BYTE *)(a1 + 32) |= 2u;
          break;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v54 = *v3;
        v55 = *(_QWORD *)(a2 + v54);
        if (v55 == -1 || v55 >= *(_QWORD *)(a2 + *v4))
          break;
        v56 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v55);
        *(_QWORD *)(a2 + v54) = v55 + 1;
        v53 |= (unint64_t)(v56 & 0x7F) << v51;
        if ((v56 & 0x80) == 0)
          goto LABEL_87;
        v51 += 7;
        v14 = v52++ >= 9;
        if (v14)
        {
          v53 = 0;
          goto LABEL_89;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_87:
      if (*(_BYTE *)(a2 + *v5))
        v53 = 0;
LABEL_89:
      v57 = v53 != 0;
      v58 = 25;
LABEL_90:
      *(_BYTE *)(a1 + v58) = v57;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t OTEscrowRecordReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  unint64_t v7;
  int *v8;
  unint64_t v9;
  char v10;
  unsigned int v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char v15;
  BOOL v16;
  int v17;
  char v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  char v25;
  unsigned int v26;
  uint64_t v27;
  unint64_t v28;
  char v29;
  unint64_t v30;
  unint64_t v31;
  OTEscrowRecordMetadata *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t result;
  char v36;
  unsigned int v37;
  uint64_t v38;
  unint64_t v39;
  char v40;
  char v41;
  unsigned int v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  char v46;
  char v47;
  unsigned int v48;
  uint64_t v49;
  unint64_t v50;
  char v51;
  char v52;
  unsigned int v53;
  uint64_t v54;
  unint64_t v55;
  char v56;
  char v57;
  unsigned int v58;
  uint64_t v59;
  unint64_t v60;
  char v61;
  char v62;
  unsigned int v63;
  uint64_t v64;
  unint64_t v65;
  char v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = 0x1EE3AE000uLL;
  v8 = (int *)MEMORY[0x1E0D82BB8];
  v9 = 0x1EE3AE000uLL;
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v10 = 0;
    v11 = 0;
    v12 = 0;
    while (1)
    {
      v13 = *v3;
      v14 = *(_QWORD *)(a2 + v13);
      if (v14 == -1 || v14 >= *(_QWORD *)(a2 + *v4))
        break;
      v15 = *(_BYTE *)(*(_QWORD *)(a2 + *v8) + v14);
      *(_QWORD *)(a2 + v13) = v14 + 1;
      v12 |= (unint64_t)(v15 & 0x7F) << v10;
      if ((v15 & 0x80) == 0)
        goto LABEL_12;
      v10 += 7;
      v16 = v11++ >= 9;
      if (v16)
      {
        v12 = 0;
        v17 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v17 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      v12 = 0;
LABEL_14:
    if (v17 || (v12 & 7) == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v12 >> 3))
    {
      case 1u:
        v19 = 0;
        v20 = 0;
        v21 = 0;
        *(_BYTE *)(a1 + *(int *)(v7 + 3712)) |= 2u;
        while (1)
        {
          v22 = *v3;
          v23 = *(_QWORD *)(a2 + v22);
          if (v23 == -1 || v23 >= *(_QWORD *)(a2 + *v4))
            break;
          v24 = *(_BYTE *)(*(_QWORD *)(a2 + *v8) + v23);
          *(_QWORD *)(a2 + v22) = v23 + 1;
          v21 |= (unint64_t)(v24 & 0x7F) << v19;
          if ((v24 & 0x80) == 0)
            goto LABEL_87;
          v19 += 7;
          v16 = v20++ >= 9;
          if (v16)
          {
            v21 = 0;
            goto LABEL_89;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_87:
        if (*(_BYTE *)(a2 + *v5))
          v21 = 0;
LABEL_89:
        v68 = *(int *)(v9 + 3716);
        goto LABEL_110;
      case 2u:
        v25 = 0;
        v26 = 0;
        v21 = 0;
        *(_BYTE *)(a1 + *(int *)(v7 + 3712)) |= 4u;
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
            v29 = *(_BYTE *)(*(_QWORD *)(a2 + *v8) + v28);
            *(_QWORD *)(a2 + v27) = v28 + 1;
            v21 |= (unint64_t)(v29 & 0x7F) << v25;
            if (v29 < 0)
            {
              v25 += 7;
              v16 = v26++ >= 9;
              if (v16)
              {
                v21 = 0;
                goto LABEL_93;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v21 = 0;
LABEL_93:
        v68 = 24;
        goto LABEL_110;
      case 3u:
        v30 = v7;
        v31 = v9;
        v32 = objc_alloc_init(OTEscrowRecordMetadata);
        objc_storeStrong((id *)(a1 + 40), v32);
        if (PBReaderPlaceMark() && (OTEscrowRecordMetadataReadFrom((uint64_t)v32, a2) & 1) != 0)
        {
          PBReaderRecallMark();

          v9 = v31;
          v7 = v30;
LABEL_120:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }

        return 0;
      case 4u:
        PBReaderReadString();
        v33 = objc_claimAutoreleasedReturnValue();
        v34 = 64;
        goto LABEL_85;
      case 9u:
        v36 = 0;
        v37 = 0;
        v21 = 0;
        *(_BYTE *)(a1 + *(int *)(v7 + 3712)) |= 8u;
        while (2)
        {
          v38 = *v3;
          v39 = *(_QWORD *)(a2 + v38);
          if (v39 == -1 || v39 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v40 = *(_BYTE *)(*(_QWORD *)(a2 + *v8) + v39);
            *(_QWORD *)(a2 + v38) = v39 + 1;
            v21 |= (unint64_t)(v40 & 0x7F) << v36;
            if (v40 < 0)
            {
              v36 += 7;
              v16 = v37++ >= 9;
              if (v16)
              {
                v21 = 0;
                goto LABEL_97;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v21 = 0;
LABEL_97:
        v68 = 32;
        goto LABEL_110;
      case 0xAu:
        v41 = 0;
        v42 = 0;
        v43 = 0;
        *(_BYTE *)(a1 + *(int *)(v7 + 3712)) |= 0x10u;
        while (2)
        {
          v44 = *v3;
          v45 = *(_QWORD *)(a2 + v44);
          if (v45 == -1 || v45 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v46 = *(_BYTE *)(*(_QWORD *)(a2 + *v8) + v45);
            *(_QWORD *)(a2 + v44) = v45 + 1;
            v43 |= (unint64_t)(v46 & 0x7F) << v41;
            if (v46 < 0)
            {
              v41 += 7;
              v16 = v42++ >= 9;
              if (v16)
              {
                LODWORD(v43) = 0;
                goto LABEL_101;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v43) = 0;
LABEL_101:
        v69 = 80;
        goto LABEL_119;
      case 0xBu:
        PBReaderReadString();
        v33 = objc_claimAutoreleasedReturnValue();
        v34 = 72;
        goto LABEL_85;
      case 0xCu:
        v47 = 0;
        v48 = 0;
        v43 = 0;
        *(_BYTE *)(a1 + *(int *)(v7 + 3712)) |= 0x40u;
        while (2)
        {
          v49 = *v3;
          v50 = *(_QWORD *)(a2 + v49);
          if (v50 == -1 || v50 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v51 = *(_BYTE *)(*(_QWORD *)(a2 + *v8) + v50);
            *(_QWORD *)(a2 + v49) = v50 + 1;
            v43 |= (unint64_t)(v51 & 0x7F) << v47;
            if (v51 < 0)
            {
              v47 += 7;
              v16 = v48++ >= 9;
              if (v16)
              {
                LODWORD(v43) = 0;
                goto LABEL_105;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v43) = 0;
LABEL_105:
        v69 = 88;
        goto LABEL_119;
      case 0xDu:
        v52 = 0;
        v53 = 0;
        v21 = 0;
        *(_BYTE *)(a1 + *(int *)(v7 + 3712)) |= 1u;
        while (2)
        {
          v54 = *v3;
          v55 = *(_QWORD *)(a2 + v54);
          if (v55 == -1 || v55 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v56 = *(_BYTE *)(*(_QWORD *)(a2 + *v8) + v55);
            *(_QWORD *)(a2 + v54) = v55 + 1;
            v21 |= (unint64_t)(v56 & 0x7F) << v52;
            if (v56 < 0)
            {
              v52 += 7;
              v16 = v53++ >= 9;
              if (v16)
              {
                v21 = 0;
                goto LABEL_109;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v21 = 0;
LABEL_109:
        v68 = 8;
LABEL_110:
        *(_QWORD *)(a1 + v68) = v21;
        goto LABEL_120;
      case 0xEu:
        PBReaderReadString();
        v33 = objc_claimAutoreleasedReturnValue();
        v34 = 96;
        goto LABEL_85;
      case 0xFu:
        v57 = 0;
        v58 = 0;
        v43 = 0;
        *(_BYTE *)(a1 + *(int *)(v7 + 3712)) |= 0x20u;
        while (2)
        {
          v59 = *v3;
          v60 = *(_QWORD *)(a2 + v59);
          if (v60 == -1 || v60 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v61 = *(_BYTE *)(*(_QWORD *)(a2 + *v8) + v60);
            *(_QWORD *)(a2 + v59) = v60 + 1;
            v43 |= (unint64_t)(v61 & 0x7F) << v57;
            if (v61 < 0)
            {
              v57 += 7;
              v16 = v58++ >= 9;
              if (v16)
              {
                LODWORD(v43) = 0;
                goto LABEL_114;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v43) = 0;
LABEL_114:
        v69 = 84;
        goto LABEL_119;
      case 0x10u:
        v62 = 0;
        v63 = 0;
        v43 = 0;
        *(_BYTE *)(a1 + *(int *)(v7 + 3712)) |= 0x80u;
        while (2)
        {
          v64 = *v3;
          v65 = *(_QWORD *)(a2 + v64);
          if (v65 == -1 || v65 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v66 = *(_BYTE *)(*(_QWORD *)(a2 + *v8) + v65);
            *(_QWORD *)(a2 + v64) = v65 + 1;
            v43 |= (unint64_t)(v66 & 0x7F) << v62;
            if (v66 < 0)
            {
              v62 += 7;
              v16 = v63++ >= 9;
              if (v16)
              {
                LODWORD(v43) = 0;
                goto LABEL_118;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v43) = 0;
LABEL_118:
        v69 = 104;
LABEL_119:
        *(_DWORD *)(a1 + v69) = v43;
        goto LABEL_120;
      case 0x11u:
        PBReaderReadString();
        v33 = objc_claimAutoreleasedReturnValue();
        v34 = 56;
        goto LABEL_85;
      case 0x12u:
        PBReaderReadString();
        v33 = objc_claimAutoreleasedReturnValue();
        v34 = 48;
LABEL_85:
        v67 = *(void **)(a1 + v34);
        *(_QWORD *)(a1 + v34) = v33;

        goto LABEL_120;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_120;
    }
  }
}

BOOL OTICDPRecordContextReadFrom(uint64_t a1, uint64_t a2)
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
  OTCDPRecoveryInformation *v17;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
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
      if ((v10 >> 3) == 2)
        break;
      if ((v10 >> 3) == 1)
      {
        v17 = objc_alloc_init(OTCDPRecoveryInformation);
        objc_storeStrong((id *)(a1 + 16), v17);
        if (!PBReaderPlaceMark() || (OTCDPRecoveryInformationReadFrom((uint64_t)v17, a2) & 1) == 0)
          goto LABEL_30;
LABEL_25:
        PBReaderRecallMark();

        goto LABEL_27;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_27:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    v17 = objc_alloc_init(OTEscrowAuthenticationInformation);
    objc_storeStrong((id *)(a1 + 8), v17);
    if (!PBReaderPlaceMark() || (OTEscrowAuthenticationInformationReadFrom((uint64_t)v17, a2) & 1) == 0)
    {
LABEL_30:

      return 0;
    }
    goto LABEL_25;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

uint64_t PBDataWriterWriteBOOLField()
{
  return MEMORY[0x1E0D82C10]();
}

uint64_t PBDataWriterWriteDataField()
{
  return MEMORY[0x1E0D82C28]();
}

uint64_t PBDataWriterWriteInt32Field()
{
  return MEMORY[0x1E0D82C58]();
}

uint64_t PBDataWriterWriteStringField()
{
  return MEMORY[0x1E0D82C98]();
}

uint64_t PBDataWriterWriteSubmessage()
{
  return MEMORY[0x1E0D82CB0]();
}

uint64_t PBDataWriterWriteUint64Field()
{
  return MEMORY[0x1E0D82CC0]();
}

uint64_t PBReaderPlaceMark()
{
  return MEMORY[0x1E0D82CE0]();
}

uint64_t PBReaderReadData()
{
  return MEMORY[0x1E0D82CF0]();
}

uint64_t PBReaderReadString()
{
  return MEMORY[0x1E0D82D00]();
}

uint64_t PBReaderRecallMark()
{
  return MEMORY[0x1E0D82D10]();
}

uint64_t PBReaderSkipValueWithTag()
{
  return MEMORY[0x1E0D82D28]();
}

uint64_t SOSCCCopyMyPeerInfo()
{
  return MEMORY[0x1E0CD5CB8]();
}

uint64_t SOSCCCopyMyPeerWithNewDeviceRecoverySecret()
{
  return MEMORY[0x1E0CD5CC0]();
}

uint64_t SOSCCIsSOSTrustAndSyncingEnabled()
{
  return MEMORY[0x1E0CD5CC8]();
}

uint64_t SOSCCPushResetCircle()
{
  return MEMORY[0x1E0CD5CD0]();
}

uint64_t SOSCCRegisterRecoveryPublicKey()
{
  return MEMORY[0x1E0CD5CD8]();
}

uint64_t SOSCCRequestToJoinCircleAfterRestore()
{
  return MEMORY[0x1E0CD5CF0]();
}

uint64_t SOSCCThisDeviceIsInCircle()
{
  return MEMORY[0x1E0CD5D10]();
}

uint64_t SOSPeerInfoCopyBackupKey()
{
  return MEMORY[0x1E0CD5D20]();
}

uint64_t SOSPeerInfoCopySerialNumber()
{
  return MEMORY[0x1E0CD5D28]();
}

uint64_t SOSPeerInfoCreateFromData()
{
  return MEMORY[0x1E0CD5D30]();
}

uint64_t SecPasswordGenerate()
{
  return MEMORY[0x1E0CD6438]();
}

uint64_t SecPasswordValidatePasswordFormat()
{
  return MEMORY[0x1E0CD6450]();
}

uint64_t SecRKCreateRecoveryKeyString()
{
  return MEMORY[0x1E0CD6588]();
}

uint64_t SecRKCreateRecoveryKeyWithError()
{
  return MEMORY[0x1E0CD6590]();
}

uint64_t SecRKRegisterBackupPublicKey()
{
  return MEMORY[0x1E0CD6598]();
}

int SecRandomCopyBytes(SecRandomRef rnd, size_t count, void *bytes)
{
  return MEMORY[0x1E0CD65A0](rnd, count, bytes);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

uint64_t _OctagonSignpostCreate()
{
  return MEMORY[0x1E0CD6798]();
}

uint64_t _OctagonSignpostGetNanoseconds()
{
  return MEMORY[0x1E0CD67A0]();
}

uint64_t _OctagonSignpostLogSystem()
{
  return MEMORY[0x1E0CD67A8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C810D0](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1E0C813B0]();
}

uint64_t cc_clear()
{
  return MEMORY[0x1E0C81868]();
}

uint64_t ccaes_ecb_decrypt_mode()
{
  return MEMORY[0x1E0C818A0]();
}

uint64_t ccaes_ecb_encrypt_mode()
{
  return MEMORY[0x1E0C818A8]();
}

uint64_t ccdigest()
{
  return MEMORY[0x1E0C81BD0]();
}

uint64_t ccecb_init()
{
  return MEMORY[0x1E0C81E10]();
}

uint64_t ccrng()
{
  return MEMORY[0x1E0C822A8]();
}

uint64_t ccsha256_di()
{
  return MEMORY[0x1E0C823E0]();
}

uint64_t ccwrap_auth_decrypt()
{
  return MEMORY[0x1E0C825A0]();
}

uint64_t ccwrap_auth_encrypt()
{
  return MEMORY[0x1E0C825A8]();
}

uint64_t ccwrap_unwrapped_size()
{
  return MEMORY[0x1E0C825B0]();
}

uint64_t ccwrap_wrapped_size()
{
  return MEMORY[0x1E0C825B8]();
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1E0C83038]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x1E0C84070](__s, *(_QWORD *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1E0C84078](__s1, __s2, __n);
}

errno_t memset_s(void *__s, rsize_t __smax, int __c, rsize_t __n)
{
  return MEMORY[0x1E0C840D0](__s, __smax, *(_QWORD *)&__c, __n);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1E0DE7CA8](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x1E0DE7F40](object, key, value, policy);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1E0C84920](log);
}

uint64_t secLogObjForScope()
{
  return MEMORY[0x1E0CD70F8]();
}

