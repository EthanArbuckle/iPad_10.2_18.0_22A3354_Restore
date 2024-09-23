uint64_t PREAMResponsesViewedReadFrom(uint64_t a1, uint64_t a2)
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
  char v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  uint64_t result;
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
  unint64_t v36;
  char v37;
  uint64_t v38;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    while (2)
    {
      if (!*(_BYTE *)(a2 + *v5))
      {
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
        if (!v15 && (v10 & 7) != 4)
        {
          switch((v10 >> 3))
          {
            case 0xBu:
              PBReaderReadString();
              v17 = objc_claimAutoreleasedReturnValue();
              v18 = 16;
              goto LABEL_33;
            case 0xCu:
              PBReaderReadString();
              v17 = objc_claimAutoreleasedReturnValue();
              v18 = 40;
              goto LABEL_33;
            case 0xDu:
              PBReaderReadString();
              v17 = objc_claimAutoreleasedReturnValue();
              v18 = 48;
              goto LABEL_33;
            case 0xEu:
            case 0xFu:
            case 0x10u:
            case 0x11u:
            case 0x12u:
            case 0x13u:
            case 0x14u:
            case 0x16u:
            case 0x17u:
              goto LABEL_28;
            case 0x15u:
              PBReaderReadString();
              v17 = objc_claimAutoreleasedReturnValue();
              v18 = 24;
LABEL_33:
              v26 = *(void **)(a1 + v18);
              *(_QWORD *)(a1 + v18) = v17;

              goto LABEL_61;
            case 0x18u:
              v27 = 0;
              v28 = 0;
              v29 = 0;
              *(_BYTE *)(a1 + 60) |= 4u;
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
                      goto LABEL_51;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(_BYTE *)(a2 + *v5))
                v29 = 0;
LABEL_51:
              *(_BYTE *)(a1 + 56) = v29 != 0;
              goto LABEL_61;
            case 0x19u:
              v33 = 0;
              v34 = 0;
              v21 = 0;
              *(_BYTE *)(a1 + 60) |= 1u;
              while (2)
              {
                v35 = *v3;
                v36 = *(_QWORD *)(a2 + v35);
                if (v36 == -1 || v36 >= *(_QWORD *)(a2 + *v4))
                {
                  *(_BYTE *)(a2 + *v5) = 1;
                }
                else
                {
                  v37 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v36);
                  *(_QWORD *)(a2 + v35) = v36 + 1;
                  v21 |= (unint64_t)(v37 & 0x7F) << v33;
                  if (v37 < 0)
                  {
                    v33 += 7;
                    v14 = v34++ >= 9;
                    if (v14)
                    {
                      LODWORD(v21) = 0;
                      goto LABEL_55;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(_BYTE *)(a2 + *v5))
                LODWORD(v21) = 0;
LABEL_55:
              v38 = 8;
              goto LABEL_60;
            default:
              if ((v10 >> 3) == 1)
              {
                v19 = 0;
                v20 = 0;
                v21 = 0;
                *(_BYTE *)(a1 + 60) |= 2u;
                while (1)
                {
                  v22 = *v3;
                  v23 = *(_QWORD *)(a2 + v22);
                  if (v23 == -1 || v23 >= *(_QWORD *)(a2 + *v4))
                    break;
                  v24 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v23);
                  *(_QWORD *)(a2 + v22) = v23 + 1;
                  v21 |= (unint64_t)(v24 & 0x7F) << v19;
                  if ((v24 & 0x80) == 0)
                    goto LABEL_57;
                  v19 += 7;
                  v14 = v20++ >= 9;
                  if (v14)
                  {
                    LODWORD(v21) = 0;
                    goto LABEL_59;
                  }
                }
                *(_BYTE *)(a2 + *v5) = 1;
LABEL_57:
                if (*(_BYTE *)(a2 + *v5))
                  LODWORD(v21) = 0;
LABEL_59:
                v38 = 32;
LABEL_60:
                *(_DWORD *)(a1 + v38) = v21;
              }
              else
              {
LABEL_28:
                result = PBReaderSkipValueWithTag();
                if (!(_DWORD)result)
                  return result;
              }
LABEL_61:
              if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
                return *(_BYTE *)(a2 + *v5) == 0;
              continue;
          }
        }
      }
      break;
    }
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t PREUMEngagedResponseListReadFrom(uint64_t a1, uint64_t a2)
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
  PREUMTrialExperiment *v17;
  uint64_t result;
  char v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  char v25;
  unsigned int v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  char v30;
  char v31;
  unsigned int v32;
  uint64_t v33;
  unint64_t v34;
  char v35;
  char v36;
  unsigned int v37;
  uint64_t v38;
  unint64_t v39;
  char v40;
  uint64_t v41;

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
        v17 = objc_alloc_init(PREUMTrialExperiment);
        objc_storeStrong((id *)(a1 + 24), v17);
        if (PBReaderPlaceMark() && PREUMTrialExperimentReadFrom((uint64_t)v17, a2))
          goto LABEL_29;
        goto LABEL_77;
      case 2u:
        v17 = objc_alloc_init(PREUMMessageMetadata);
        objc_storeStrong((id *)(a1 + 48), v17);
        if (!PBReaderPlaceMark() || (PREUMMessageMetadataReadFrom((uint64_t)v17, a2) & 1) == 0)
          goto LABEL_77;
        goto LABEL_29;
      case 3u:
        v17 = objc_alloc_init(PREUMResponseItem);
        objc_msgSend((id)a1, "addItems:", v17);
        if (PBReaderPlaceMark() && (PREUMResponseItemReadFrom((uint64_t)v17, a2) & 1) != 0)
        {
LABEL_29:
          PBReaderRecallMark();

LABEL_75:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }
LABEL_77:

        return 0;
      case 4u:
        v19 = 0;
        v20 = 0;
        v21 = 0;
        *(_BYTE *)(a1 + 56) |= 2u;
        while (2)
        {
          v22 = *v3;
          v23 = *(_QWORD *)(a2 + v22);
          if (v23 == -1 || v23 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v24 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v23);
            *(_QWORD *)(a2 + v22) = v23 + 1;
            v21 |= (unint64_t)(v24 & 0x7F) << v19;
            if (v24 < 0)
            {
              v19 += 7;
              v14 = v20++ >= 9;
              if (v14)
              {
                LODWORD(v21) = 0;
                goto LABEL_61;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v21) = 0;
LABEL_61:
        v41 = 16;
        goto LABEL_74;
      case 5u:
        v25 = 0;
        v26 = 0;
        v27 = 0;
        *(_BYTE *)(a1 + 56) |= 1u;
        while (2)
        {
          v28 = *v3;
          v29 = *(_QWORD *)(a2 + v28);
          if (v29 == -1 || v29 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v30 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v29);
            *(_QWORD *)(a2 + v28) = v29 + 1;
            v27 |= (unint64_t)(v30 & 0x7F) << v25;
            if (v30 < 0)
            {
              v25 += 7;
              v14 = v26++ >= 9;
              if (v14)
              {
                v27 = 0;
                goto LABEL_65;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v27 = 0;
LABEL_65:
        *(_QWORD *)(a1 + 8) = v27;
        goto LABEL_75;
      case 6u:
        v31 = 0;
        v32 = 0;
        v21 = 0;
        *(_BYTE *)(a1 + 56) |= 8u;
        while (2)
        {
          v33 = *v3;
          v34 = *(_QWORD *)(a2 + v33);
          if (v34 == -1 || v34 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v35 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v34);
            *(_QWORD *)(a2 + v33) = v34 + 1;
            v21 |= (unint64_t)(v35 & 0x7F) << v31;
            if (v35 < 0)
            {
              v31 += 7;
              v14 = v32++ >= 9;
              if (v14)
              {
                LODWORD(v21) = 0;
                goto LABEL_69;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v21) = 0;
LABEL_69:
        v41 = 36;
        goto LABEL_74;
      case 7u:
        v36 = 0;
        v37 = 0;
        v21 = 0;
        *(_BYTE *)(a1 + 56) |= 4u;
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
            v40 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v39);
            *(_QWORD *)(a2 + v38) = v39 + 1;
            v21 |= (unint64_t)(v40 & 0x7F) << v36;
            if (v40 < 0)
            {
              v36 += 7;
              v14 = v37++ >= 9;
              if (v14)
              {
                LODWORD(v21) = 0;
                goto LABEL_73;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v21) = 0;
LABEL_73:
        v41 = 32;
LABEL_74:
        *(_DWORD *)(a1 + v41) = v21;
        goto LABEL_75;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_75;
    }
  }
}

uint64_t PREAMEngagedResponseReadFrom(uint64_t a1, uint64_t a2)
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
  char v23;
  unsigned int v24;
  uint64_t v25;
  unint64_t v26;
  char v27;
  char v28;
  unsigned int v29;
  uint64_t v30;
  unint64_t v31;
  char v32;
  char v33;
  unsigned int v34;
  uint64_t v35;
  unint64_t v36;
  char v37;
  char v38;
  unsigned int v39;
  uint64_t v40;
  unint64_t v41;
  char v42;
  char v43;
  unsigned int v44;
  uint64_t v45;
  unint64_t v46;
  char v47;
  char v48;
  unsigned int v49;
  uint64_t v50;
  unint64_t v51;
  char v52;
  char v53;
  unsigned int v54;
  uint64_t v55;
  unint64_t v56;
  char v57;
  char v58;
  unsigned int v59;
  uint64_t v60;
  unint64_t v61;
  char v62;
  uint64_t result;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  char v67;
  unsigned int v68;
  uint64_t v69;
  uint64_t v70;
  unint64_t v71;
  char v72;
  char v73;
  unsigned int v74;
  uint64_t v75;
  unint64_t v76;
  char v77;
  char v78;
  unsigned int v79;
  uint64_t v80;
  uint64_t v81;
  unint64_t v82;
  char v83;
  char v84;
  unsigned int v85;
  uint64_t v86;
  uint64_t v87;
  unint64_t v88;
  char v89;
  char v90;
  unsigned int v91;
  uint64_t v92;
  uint64_t v93;
  unint64_t v94;
  char v95;
  uint64_t v96;
  BOOL v97;
  uint64_t v98;

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
          *(_WORD *)(a1 + 116) |= 8u;
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
              goto LABEL_127;
            v17 += 7;
            v14 = v18++ >= 9;
            if (v14)
            {
              LODWORD(v19) = 0;
              goto LABEL_129;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_127:
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v19) = 0;
LABEL_129:
          v96 = 64;
          goto LABEL_170;
        case 2u:
          v23 = 0;
          v24 = 0;
          v19 = 0;
          *(_WORD *)(a1 + 116) |= 0x200u;
          while (2)
          {
            v25 = *v3;
            v26 = *(_QWORD *)(a2 + v25);
            if (v26 == -1 || v26 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v27 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v26);
              *(_QWORD *)(a2 + v25) = v26 + 1;
              v19 |= (unint64_t)(v27 & 0x7F) << v23;
              if (v27 < 0)
              {
                v23 += 7;
                v14 = v24++ >= 9;
                if (v14)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_133;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v19) = 0;
LABEL_133:
          v96 = 88;
          goto LABEL_170;
        case 3u:
          v28 = 0;
          v29 = 0;
          v19 = 0;
          *(_WORD *)(a1 + 116) |= 0x100u;
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
              v19 |= (unint64_t)(v32 & 0x7F) << v28;
              if (v32 < 0)
              {
                v28 += 7;
                v14 = v29++ >= 9;
                if (v14)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_137;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v19) = 0;
LABEL_137:
          v96 = 84;
          goto LABEL_170;
        case 4u:
          v33 = 0;
          v34 = 0;
          v19 = 0;
          *(_WORD *)(a1 + 116) |= 0x80u;
          while (2)
          {
            v35 = *v3;
            v36 = *(_QWORD *)(a2 + v35);
            if (v36 == -1 || v36 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v37 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v36);
              *(_QWORD *)(a2 + v35) = v36 + 1;
              v19 |= (unint64_t)(v37 & 0x7F) << v33;
              if (v37 < 0)
              {
                v33 += 7;
                v14 = v34++ >= 9;
                if (v14)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_141;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v19) = 0;
LABEL_141:
          v96 = 80;
          goto LABEL_170;
        case 5u:
          v38 = 0;
          v39 = 0;
          v19 = 0;
          *(_WORD *)(a1 + 116) |= 4u;
          while (2)
          {
            v40 = *v3;
            v41 = *(_QWORD *)(a2 + v40);
            if (v41 == -1 || v41 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v42 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v41);
              *(_QWORD *)(a2 + v40) = v41 + 1;
              v19 |= (unint64_t)(v42 & 0x7F) << v38;
              if (v42 < 0)
              {
                v38 += 7;
                v14 = v39++ >= 9;
                if (v14)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_145;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v19) = 0;
LABEL_145:
          v96 = 40;
          goto LABEL_170;
        case 6u:
          v43 = 0;
          v44 = 0;
          v19 = 0;
          *(_WORD *)(a1 + 116) |= 2u;
          while (2)
          {
            v45 = *v3;
            v46 = *(_QWORD *)(a2 + v45);
            if (v46 == -1 || v46 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v47 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v46);
              *(_QWORD *)(a2 + v45) = v46 + 1;
              v19 |= (unint64_t)(v47 & 0x7F) << v43;
              if (v47 < 0)
              {
                v43 += 7;
                v14 = v44++ >= 9;
                if (v14)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_149;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v19) = 0;
LABEL_149:
          v96 = 24;
          goto LABEL_170;
        case 7u:
          v48 = 0;
          v49 = 0;
          v19 = 0;
          *(_WORD *)(a1 + 116) |= 0x20u;
          while (2)
          {
            v50 = *v3;
            v51 = *(_QWORD *)(a2 + v50);
            if (v51 == -1 || v51 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v52 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v51);
              *(_QWORD *)(a2 + v50) = v51 + 1;
              v19 |= (unint64_t)(v52 & 0x7F) << v48;
              if (v52 < 0)
              {
                v48 += 7;
                v14 = v49++ >= 9;
                if (v14)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_153;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v19) = 0;
LABEL_153:
          v96 = 72;
          goto LABEL_170;
        case 8u:
          v53 = 0;
          v54 = 0;
          v19 = 0;
          *(_WORD *)(a1 + 116) |= 0x10u;
          while (2)
          {
            v55 = *v3;
            v56 = *(_QWORD *)(a2 + v55);
            if (v56 == -1 || v56 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v57 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v56);
              *(_QWORD *)(a2 + v55) = v56 + 1;
              v19 |= (unint64_t)(v57 & 0x7F) << v53;
              if (v57 < 0)
              {
                v53 += 7;
                v14 = v54++ >= 9;
                if (v14)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_157;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v19) = 0;
LABEL_157:
          v96 = 68;
          goto LABEL_170;
        case 9u:
          v58 = 0;
          v59 = 0;
          v19 = 0;
          *(_WORD *)(a1 + 116) |= 0x40u;
          while (2)
          {
            v60 = *v3;
            v61 = *(_QWORD *)(a2 + v60);
            if (v61 == -1 || v61 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v62 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v61);
              *(_QWORD *)(a2 + v60) = v61 + 1;
              v19 |= (unint64_t)(v62 & 0x7F) << v58;
              if (v62 < 0)
              {
                v58 += 7;
                v14 = v59++ >= 9;
                if (v14)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_161;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v19) = 0;
LABEL_161:
          v96 = 76;
          goto LABEL_170;
        case 0xBu:
          PBReaderReadString();
          v64 = objc_claimAutoreleasedReturnValue();
          v65 = 16;
          goto LABEL_90;
        case 0xCu:
          PBReaderReadString();
          v64 = objc_claimAutoreleasedReturnValue();
          v65 = 96;
          goto LABEL_90;
        case 0xDu:
          PBReaderReadString();
          v64 = objc_claimAutoreleasedReturnValue();
          v65 = 104;
          goto LABEL_90;
        case 0x15u:
          PBReaderReadString();
          v64 = objc_claimAutoreleasedReturnValue();
          v65 = 32;
          goto LABEL_90;
        case 0x16u:
          PBReaderReadString();
          v64 = objc_claimAutoreleasedReturnValue();
          v65 = 56;
          goto LABEL_90;
        case 0x17u:
          PBReaderReadString();
          v64 = objc_claimAutoreleasedReturnValue();
          v65 = 48;
LABEL_90:
          v66 = *(void **)(a1 + v65);
          *(_QWORD *)(a1 + v65) = v64;

          continue;
        case 0x18u:
          v67 = 0;
          v68 = 0;
          v69 = 0;
          *(_WORD *)(a1 + 116) |= 0x800u;
          while (2)
          {
            v70 = *v3;
            v71 = *(_QWORD *)(a2 + v70);
            if (v71 == -1 || v71 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v72 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v71);
              *(_QWORD *)(a2 + v70) = v71 + 1;
              v69 |= (unint64_t)(v72 & 0x7F) << v67;
              if (v72 < 0)
              {
                v67 += 7;
                v14 = v68++ >= 9;
                if (v14)
                {
                  v69 = 0;
                  goto LABEL_165;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v69 = 0;
LABEL_165:
          v97 = v69 != 0;
          v98 = 113;
          goto LABEL_183;
        case 0x19u:
          v73 = 0;
          v74 = 0;
          v19 = 0;
          *(_WORD *)(a1 + 116) |= 1u;
          while (2)
          {
            v75 = *v3;
            v76 = *(_QWORD *)(a2 + v75);
            if (v76 == -1 || v76 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v77 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v76);
              *(_QWORD *)(a2 + v75) = v76 + 1;
              v19 |= (unint64_t)(v77 & 0x7F) << v73;
              if (v77 < 0)
              {
                v73 += 7;
                v14 = v74++ >= 9;
                if (v14)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_169;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v19) = 0;
LABEL_169:
          v96 = 8;
LABEL_170:
          *(_DWORD *)(a1 + v96) = v19;
          continue;
        case 0x1Au:
          v78 = 0;
          v79 = 0;
          v80 = 0;
          *(_WORD *)(a1 + 116) |= 0x400u;
          while (2)
          {
            v81 = *v3;
            v82 = *(_QWORD *)(a2 + v81);
            if (v82 == -1 || v82 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v83 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v82);
              *(_QWORD *)(a2 + v81) = v82 + 1;
              v80 |= (unint64_t)(v83 & 0x7F) << v78;
              if (v83 < 0)
              {
                v78 += 7;
                v14 = v79++ >= 9;
                if (v14)
                {
                  v80 = 0;
                  goto LABEL_174;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v80 = 0;
LABEL_174:
          v97 = v80 != 0;
          v98 = 112;
          goto LABEL_183;
        case 0x1Bu:
          v84 = 0;
          v85 = 0;
          v86 = 0;
          *(_WORD *)(a1 + 116) |= 0x1000u;
          while (2)
          {
            v87 = *v3;
            v88 = *(_QWORD *)(a2 + v87);
            if (v88 == -1 || v88 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v89 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v88);
              *(_QWORD *)(a2 + v87) = v88 + 1;
              v86 |= (unint64_t)(v89 & 0x7F) << v84;
              if (v89 < 0)
              {
                v84 += 7;
                v14 = v85++ >= 9;
                if (v14)
                {
                  v86 = 0;
                  goto LABEL_178;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v86 = 0;
LABEL_178:
          v97 = v86 != 0;
          v98 = 114;
          goto LABEL_183;
        case 0x1Cu:
          v90 = 0;
          v91 = 0;
          v92 = 0;
          *(_WORD *)(a1 + 116) |= 0x2000u;
          break;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v93 = *v3;
        v94 = *(_QWORD *)(a2 + v93);
        if (v94 == -1 || v94 >= *(_QWORD *)(a2 + *v4))
          break;
        v95 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v94);
        *(_QWORD *)(a2 + v93) = v94 + 1;
        v92 |= (unint64_t)(v95 & 0x7F) << v90;
        if ((v95 & 0x80) == 0)
          goto LABEL_180;
        v90 += 7;
        v14 = v91++ >= 9;
        if (v14)
        {
          v92 = 0;
          goto LABEL_182;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_180:
      if (*(_BYTE *)(a2 + *v5))
        v92 = 0;
LABEL_182:
      v97 = v92 != 0;
      v98 = 115;
LABEL_183:
      *(_BYTE *)(a1 + v98) = v97;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

id pre_xpc_handle()
{
  if (pre_xpc_handle__pasOnceToken0 != -1)
    dispatch_once(&pre_xpc_handle__pasOnceToken0, &__block_literal_global_369);
  return (id)pre_xpc_handle__pasExprOnceResult;
}

void __pre_xpc_handle_block_invoke()
{
  void *v0;
  os_log_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1C3BD39FC]();
  v1 = os_log_create("com.apple.private.proactive.experiments", "XPCClient");
  v2 = (void *)pre_xpc_handle__pasExprOnceResult;
  pre_xpc_handle__pasExprOnceResult = (uint64_t)v1;

  objc_autoreleasePoolPop(v0);
}

id pre_responses_handle()
{
  if (pre_responses_handle__pasOnceToken1 != -1)
    dispatch_once(&pre_responses_handle__pasOnceToken1, &__block_literal_global_3);
  return (id)pre_responses_handle__pasExprOnceResult;
}

void __pre_responses_handle_block_invoke()
{
  void *v0;
  os_log_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1C3BD39FC]();
  v1 = os_log_create("com.apple.private.proactive.experiments", "Responses");
  v2 = (void *)pre_responses_handle__pasExprOnceResult;
  pre_responses_handle__pasExprOnceResult = (uint64_t)v1;

  objc_autoreleasePoolPop(v0);
}

id pre_locale_handle()
{
  if (pre_locale_handle__pasOnceToken2 != -1)
    dispatch_once(&pre_locale_handle__pasOnceToken2, &__block_literal_global_5);
  return (id)pre_locale_handle__pasExprOnceResult;
}

void __pre_locale_handle_block_invoke()
{
  void *v0;
  os_log_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1C3BD39FC]();
  v1 = os_log_create("com.apple.private.proactive.experiments", "Locale");
  v2 = (void *)pre_locale_handle__pasExprOnceResult;
  pre_locale_handle__pasExprOnceResult = (uint64_t)v1;

  objc_autoreleasePoolPop(v0);
}

id pre_scales_handle()
{
  if (pre_scales_handle__pasOnceToken3 != -1)
    dispatch_once(&pre_scales_handle__pasOnceToken3, &__block_literal_global_7);
  return (id)pre_scales_handle__pasExprOnceResult;
}

void __pre_scales_handle_block_invoke()
{
  void *v0;
  os_log_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1C3BD39FC]();
  v1 = os_log_create("com.apple.private.proactive.experiments", "Scales");
  v2 = (void *)pre_scales_handle__pasExprOnceResult;
  pre_scales_handle__pasExprOnceResult = (uint64_t)v1;

  objc_autoreleasePoolPop(v0);
}

id pre_signpost_handle()
{
  if (pre_signpost_handle__pasOnceToken4 != -1)
    dispatch_once(&pre_signpost_handle__pasOnceToken4, &__block_literal_global_9);
  return (id)pre_signpost_handle__pasExprOnceResult;
}

void __pre_signpost_handle_block_invoke()
{
  void *v0;
  os_log_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1C3BD39FC]();
  v1 = os_log_create("com.apple.private.proactive.experiments", "Signposts");
  v2 = (void *)pre_signpost_handle__pasExprOnceResult;
  pre_signpost_handle__pasExprOnceResult = (uint64_t)v1;

  objc_autoreleasePoolPop(v0);
}

uint64_t PREUMMessageMetadataReadFrom(uint64_t a1, uint64_t a2)
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
  void *v19;
  char v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  uint64_t result;
  char v27;
  unsigned int v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  char v32;
  char v33;
  unsigned int v34;
  uint64_t v35;
  unint64_t v36;
  char v37;
  char v38;
  unsigned int v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  char v43;
  BOOL v44;
  uint64_t v45;
  uint64_t v46;

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
          goto LABEL_22;
        case 2u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 32;
          goto LABEL_22;
        case 3u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 24;
LABEL_22:
          v19 = *(void **)(a1 + v18);
          *(_QWORD *)(a1 + v18) = v17;

          continue;
        case 4u:
          v20 = 0;
          v21 = 0;
          v22 = 0;
          *(_BYTE *)(a1 + 44) |= 8u;
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
                  goto LABEL_56;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v22 = 0;
LABEL_56:
          v44 = v22 != 0;
          v45 = 41;
          goto LABEL_70;
        case 6u:
          v27 = 0;
          v28 = 0;
          v29 = 0;
          *(_BYTE *)(a1 + 44) |= 2u;
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
                  LODWORD(v29) = 0;
                  goto LABEL_60;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v29) = 0;
LABEL_60:
          v46 = 12;
          goto LABEL_65;
        case 7u:
          v33 = 0;
          v34 = 0;
          v29 = 0;
          *(_BYTE *)(a1 + 44) |= 1u;
          while (2)
          {
            v35 = *v3;
            v36 = *(_QWORD *)(a2 + v35);
            if (v36 == -1 || v36 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v37 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v36);
              *(_QWORD *)(a2 + v35) = v36 + 1;
              v29 |= (unint64_t)(v37 & 0x7F) << v33;
              if (v37 < 0)
              {
                v33 += 7;
                v14 = v34++ >= 9;
                if (v14)
                {
                  LODWORD(v29) = 0;
                  goto LABEL_64;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v29) = 0;
LABEL_64:
          v46 = 8;
LABEL_65:
          *(_DWORD *)(a1 + v46) = v29;
          continue;
        case 8u:
          v38 = 0;
          v39 = 0;
          v40 = 0;
          *(_BYTE *)(a1 + 44) |= 4u;
          break;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v41 = *v3;
        v42 = *(_QWORD *)(a2 + v41);
        if (v42 == -1 || v42 >= *(_QWORD *)(a2 + *v4))
          break;
        v43 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v42);
        *(_QWORD *)(a2 + v41) = v42 + 1;
        v40 |= (unint64_t)(v43 & 0x7F) << v38;
        if ((v43 & 0x80) == 0)
          goto LABEL_67;
        v38 += 7;
        v14 = v39++ >= 9;
        if (v14)
        {
          v40 = 0;
          goto LABEL_69;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_67:
      if (*(_BYTE *)(a2 + *v5))
        v40 = 0;
LABEL_69:
      v44 = v40 != 0;
      v45 = 40;
LABEL_70:
      *(_BYTE *)(a1 + v45) = v44;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_1C35E5730(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCKEntityClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!ChatKitLibraryCore_frameworkLibrary)
    ChatKitLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!ChatKitLibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *ChatKitLibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("PREResponsesExperimentSuggestionsRequest.m"), 15, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("CKEntity");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getCKEntityClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("PREResponsesExperimentSuggestionsRequest.m"), 16, CFSTR("Unable to find class %s"), "CKEntity");

LABEL_8:
    __break(1u);
  }
  getCKEntityClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t PREUMResponseListReadFrom(uint64_t a1, uint64_t a2)
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
  PREUMTrialExperiment *v17;
  uint64_t result;
  char v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  char v25;
  unsigned int v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  char v30;
  char v31;
  unsigned int v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  char v36;

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
        v17 = objc_alloc_init(PREUMTrialExperiment);
        objc_storeStrong((id *)(a1 + 16), v17);
        if (PBReaderPlaceMark() && PREUMTrialExperimentReadFrom((uint64_t)v17, a2))
          goto LABEL_29;
        goto LABEL_65;
      case 2u:
        v17 = objc_alloc_init(PREUMMessageMetadata);
        objc_storeStrong((id *)(a1 + 40), v17);
        if (!PBReaderPlaceMark() || (PREUMMessageMetadataReadFrom((uint64_t)v17, a2) & 1) == 0)
          goto LABEL_65;
        goto LABEL_29;
      case 3u:
        v17 = objc_alloc_init(PREUMResponseItem);
        objc_msgSend((id)a1, "addItems:", v17);
        if (PBReaderPlaceMark() && (PREUMResponseItemReadFrom((uint64_t)v17, a2) & 1) != 0)
        {
LABEL_29:
          PBReaderRecallMark();

LABEL_63:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }
LABEL_65:

        return 0;
      case 4u:
        v19 = 0;
        v20 = 0;
        v21 = 0;
        *(_BYTE *)(a1 + 52) |= 4u;
        while (2)
        {
          v22 = *v3;
          v23 = *(_QWORD *)(a2 + v22);
          if (v23 == -1 || v23 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v24 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v23);
            *(_QWORD *)(a2 + v22) = v23 + 1;
            v21 |= (unint64_t)(v24 & 0x7F) << v19;
            if (v24 < 0)
            {
              v19 += 7;
              v14 = v20++ >= 9;
              if (v14)
              {
                v21 = 0;
                goto LABEL_54;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v21 = 0;
LABEL_54:
        *(_BYTE *)(a1 + 48) = v21 != 0;
        goto LABEL_63;
      case 5u:
        v25 = 0;
        v26 = 0;
        v27 = 0;
        *(_BYTE *)(a1 + 52) |= 1u;
        while (2)
        {
          v28 = *v3;
          v29 = *(_QWORD *)(a2 + v28);
          if (v29 == -1 || v29 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v30 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v29);
            *(_QWORD *)(a2 + v28) = v29 + 1;
            v27 |= (unint64_t)(v30 & 0x7F) << v25;
            if (v30 < 0)
            {
              v25 += 7;
              v14 = v26++ >= 9;
              if (v14)
              {
                v27 = 0;
                goto LABEL_58;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v27 = 0;
LABEL_58:
        *(_QWORD *)(a1 + 8) = v27;
        goto LABEL_63;
      case 6u:
        v31 = 0;
        v32 = 0;
        v33 = 0;
        *(_BYTE *)(a1 + 52) |= 2u;
        while (2)
        {
          v34 = *v3;
          v35 = *(_QWORD *)(a2 + v34);
          if (v35 == -1 || v35 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v36 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v35);
            *(_QWORD *)(a2 + v34) = v35 + 1;
            v33 |= (unint64_t)(v36 & 0x7F) << v31;
            if (v36 < 0)
            {
              v31 += 7;
              v14 = v32++ >= 9;
              if (v14)
              {
                LODWORD(v33) = 0;
                goto LABEL_62;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v33) = 0;
LABEL_62:
        *(_DWORD *)(a1 + 24) = v33;
        goto LABEL_63;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_63;
    }
  }
}

uint64_t PREAMResponseListGeneratedReadFrom(uint64_t a1, uint64_t a2)
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
  char v23;
  unsigned int v24;
  uint64_t v25;
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
  char v39;
  unsigned int v40;
  uint64_t v41;
  unint64_t v42;
  char v43;
  uint64_t result;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  char v48;
  unsigned int v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  char v53;
  char v54;
  unsigned int v55;
  uint64_t v56;
  unint64_t v57;
  char v58;
  BOOL v59;
  uint64_t v60;
  uint64_t v61;

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
          *(_BYTE *)(a1 + 92) |= 0x40u;
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
              goto LABEL_78;
            v17 += 7;
            v14 = v18++ >= 9;
            if (v14)
            {
              v19 = 0;
              goto LABEL_80;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_78:
          if (*(_BYTE *)(a2 + *v5))
            v19 = 0;
LABEL_80:
          v59 = v19 != 0;
          v60 = 89;
          goto LABEL_101;
        case 2u:
          v23 = 0;
          v24 = 0;
          v25 = 0;
          *(_BYTE *)(a1 + 92) |= 2u;
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
              v25 |= (unint64_t)(v28 & 0x7F) << v23;
              if (v28 < 0)
              {
                v23 += 7;
                v14 = v24++ >= 9;
                if (v14)
                {
                  LODWORD(v25) = 0;
                  goto LABEL_84;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v25) = 0;
LABEL_84:
          v61 = 24;
          goto LABEL_106;
        case 3u:
          v29 = 0;
          v30 = 0;
          v25 = 0;
          *(_BYTE *)(a1 + 92) |= 8u;
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
              v25 |= (unint64_t)(v33 & 0x7F) << v29;
              if (v33 < 0)
              {
                v29 += 7;
                v14 = v30++ >= 9;
                if (v14)
                {
                  LODWORD(v25) = 0;
                  goto LABEL_88;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v25) = 0;
LABEL_88:
          v61 = 60;
          goto LABEL_106;
        case 4u:
          v34 = 0;
          v35 = 0;
          v25 = 0;
          *(_BYTE *)(a1 + 92) |= 4u;
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
              v25 |= (unint64_t)(v38 & 0x7F) << v34;
              if (v38 < 0)
              {
                v34 += 7;
                v14 = v35++ >= 9;
                if (v14)
                {
                  LODWORD(v25) = 0;
                  goto LABEL_92;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v25) = 0;
LABEL_92:
          v61 = 56;
          goto LABEL_106;
        case 5u:
          v39 = 0;
          v40 = 0;
          v25 = 0;
          *(_BYTE *)(a1 + 92) |= 0x10u;
          while (2)
          {
            v41 = *v3;
            v42 = *(_QWORD *)(a2 + v41);
            if (v42 == -1 || v42 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v43 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v42);
              *(_QWORD *)(a2 + v41) = v42 + 1;
              v25 |= (unint64_t)(v43 & 0x7F) << v39;
              if (v43 < 0)
              {
                v39 += 7;
                v14 = v40++ >= 9;
                if (v14)
                {
                  LODWORD(v25) = 0;
                  goto LABEL_96;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v25) = 0;
LABEL_96:
          v61 = 64;
          goto LABEL_106;
        case 0xBu:
          PBReaderReadString();
          v45 = objc_claimAutoreleasedReturnValue();
          v46 = 16;
          goto LABEL_62;
        case 0xCu:
          PBReaderReadString();
          v45 = objc_claimAutoreleasedReturnValue();
          v46 = 72;
          goto LABEL_62;
        case 0xDu:
          PBReaderReadString();
          v45 = objc_claimAutoreleasedReturnValue();
          v46 = 80;
          goto LABEL_62;
        case 0x15u:
          PBReaderReadString();
          v45 = objc_claimAutoreleasedReturnValue();
          v46 = 32;
          goto LABEL_62;
        case 0x16u:
          PBReaderReadString();
          v45 = objc_claimAutoreleasedReturnValue();
          v46 = 48;
          goto LABEL_62;
        case 0x17u:
          PBReaderReadString();
          v45 = objc_claimAutoreleasedReturnValue();
          v46 = 40;
LABEL_62:
          v47 = *(void **)(a1 + v46);
          *(_QWORD *)(a1 + v46) = v45;

          continue;
        case 0x18u:
          v48 = 0;
          v49 = 0;
          v50 = 0;
          *(_BYTE *)(a1 + 92) |= 0x20u;
          while (2)
          {
            v51 = *v3;
            v52 = *(_QWORD *)(a2 + v51);
            if (v52 == -1 || v52 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v53 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v52);
              *(_QWORD *)(a2 + v51) = v52 + 1;
              v50 |= (unint64_t)(v53 & 0x7F) << v48;
              if (v53 < 0)
              {
                v48 += 7;
                v14 = v49++ >= 9;
                if (v14)
                {
                  v50 = 0;
                  goto LABEL_100;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v50 = 0;
LABEL_100:
          v59 = v50 != 0;
          v60 = 88;
LABEL_101:
          *(_BYTE *)(a1 + v60) = v59;
          continue;
        case 0x19u:
          v54 = 0;
          v55 = 0;
          v25 = 0;
          *(_BYTE *)(a1 + 92) |= 1u;
          break;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v56 = *v3;
        v57 = *(_QWORD *)(a2 + v56);
        if (v57 == -1 || v57 >= *(_QWORD *)(a2 + *v4))
          break;
        v58 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v57);
        *(_QWORD *)(a2 + v56) = v57 + 1;
        v25 |= (unint64_t)(v58 & 0x7F) << v54;
        if ((v58 & 0x80) == 0)
          goto LABEL_103;
        v54 += 7;
        v14 = v55++ >= 9;
        if (v14)
        {
          LODWORD(v25) = 0;
          goto LABEL_105;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_103:
      if (*(_BYTE *)(a2 + *v5))
        LODWORD(v25) = 0;
LABEL_105:
      v61 = 8;
LABEL_106:
      *(_DWORD *)(a1 + v61) = v25;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

BOOL PREUMTrialExperimentReadFrom(uint64_t a1, uint64_t a2)
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
        v19 = 16;
        goto LABEL_24;
      }
      if ((_DWORD)v17 == 1)
      {
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 8;
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

unint64_t PREMachTimeToNanoseconds(uint64_t a1)
{
  if (PREMachTimeToNanoseconds_onceToken != -1)
    dispatch_once(&PREMachTimeToNanoseconds_onceToken, &__block_literal_global_949);
  return (unint64_t)PREMachTimeToNanoseconds_machTimebaseInfo
       * a1
       / *(unsigned int *)algn_1EDBEE1CC;
}

unint64_t PREMachTimeToMilliseconds(uint64_t a1)
{
  if (PREMachTimeToNanoseconds_onceToken != -1)
    dispatch_once(&PREMachTimeToNanoseconds_onceToken, &__block_literal_global_949);
  return (unint64_t)PREMachTimeToNanoseconds_machTimebaseInfo
       * a1
       / *(unsigned int *)algn_1EDBEE1CC
       / 0xF4240;
}

unint64_t PRERecordMeasurementState(uint64_t *a1)
{
  unint64_t v1;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  int v7;
  uint64_t v8;
  __int16 v9;
  unint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v1 = a1[2];
  if (!v1)
  {
    v3 = mach_absolute_time();
    v1 = PREMachTimeToMilliseconds(v3 - a1[1]);
    pre_scales_handle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *a1;
      v7 = 138412546;
      v8 = v5;
      v9 = 2048;
      v10 = v1;
      _os_log_impl(&dword_1C35DB000, v4, OS_LOG_TYPE_DEFAULT, "PREScales: %@ took %llu milliseconds", (uint8_t *)&v7, 0x16u);
    }

    a1[2] = v1;
  }
  return v1;
}

void sub_1C35EB7A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C35EC010(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1C35ED180(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 128));
  _Unwind_Resume(a1);
}

void sub_1C35ED4F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location, char a19)
{
  id *v19;
  uint64_t v20;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a19, 8);
  _Block_object_dispose((const void *)(v20 - 152), 8);
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

void sub_1C35ED848(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

uint64_t PREAMResponseItemReadFrom(uint64_t a1, uint64_t a2)
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
  char v23;
  unsigned int v24;
  uint64_t v25;
  unint64_t v26;
  char v27;
  char v28;
  unsigned int v29;
  uint64_t v30;
  unint64_t v31;
  char v32;
  char v33;
  unsigned int v34;
  uint64_t v35;
  unint64_t v36;
  char v37;
  uint64_t result;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  char v42;
  unsigned int v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  char v47;
  char v48;
  unsigned int v49;
  uint64_t v50;
  unint64_t v51;
  char v52;
  char v53;
  unsigned int v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  char v58;
  char v59;
  unsigned int v60;
  uint64_t v61;
  uint64_t v62;
  unint64_t v63;
  char v64;
  uint64_t v65;
  BOOL v66;
  uint64_t v67;

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
          *(_BYTE *)(a1 + 84) |= 2u;
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
              goto LABEL_85;
            v17 += 7;
            v14 = v18++ >= 9;
            if (v14)
            {
              LODWORD(v19) = 0;
              goto LABEL_87;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_85:
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v19) = 0;
LABEL_87:
          v65 = 48;
          goto LABEL_108;
        case 2u:
          v23 = 0;
          v24 = 0;
          v19 = 0;
          *(_BYTE *)(a1 + 84) |= 0x10u;
          while (2)
          {
            v25 = *v3;
            v26 = *(_QWORD *)(a2 + v25);
            if (v26 == -1 || v26 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v27 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v26);
              *(_QWORD *)(a2 + v25) = v26 + 1;
              v19 |= (unint64_t)(v27 & 0x7F) << v23;
              if (v27 < 0)
              {
                v23 += 7;
                v14 = v24++ >= 9;
                if (v14)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_91;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v19) = 0;
LABEL_91:
          v65 = 60;
          goto LABEL_108;
        case 3u:
          v28 = 0;
          v29 = 0;
          v19 = 0;
          *(_BYTE *)(a1 + 84) |= 8u;
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
              v19 |= (unint64_t)(v32 & 0x7F) << v28;
              if (v32 < 0)
              {
                v28 += 7;
                v14 = v29++ >= 9;
                if (v14)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_95;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v19) = 0;
LABEL_95:
          v65 = 56;
          goto LABEL_108;
        case 4u:
          v33 = 0;
          v34 = 0;
          v19 = 0;
          *(_BYTE *)(a1 + 84) |= 4u;
          while (2)
          {
            v35 = *v3;
            v36 = *(_QWORD *)(a2 + v35);
            if (v36 == -1 || v36 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v37 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v36);
              *(_QWORD *)(a2 + v35) = v36 + 1;
              v19 |= (unint64_t)(v37 & 0x7F) << v33;
              if (v37 < 0)
              {
                v33 += 7;
                v14 = v34++ >= 9;
                if (v14)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_99;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v19) = 0;
LABEL_99:
          v65 = 52;
          goto LABEL_108;
        case 0xBu:
          PBReaderReadString();
          v39 = objc_claimAutoreleasedReturnValue();
          v40 = 16;
          goto LABEL_55;
        case 0xCu:
          PBReaderReadString();
          v39 = objc_claimAutoreleasedReturnValue();
          v40 = 64;
          goto LABEL_55;
        case 0xDu:
          PBReaderReadString();
          v39 = objc_claimAutoreleasedReturnValue();
          v40 = 72;
          goto LABEL_55;
        case 0x15u:
          PBReaderReadString();
          v39 = objc_claimAutoreleasedReturnValue();
          v40 = 24;
          goto LABEL_55;
        case 0x16u:
          PBReaderReadString();
          v39 = objc_claimAutoreleasedReturnValue();
          v40 = 40;
          goto LABEL_55;
        case 0x17u:
          PBReaderReadString();
          v39 = objc_claimAutoreleasedReturnValue();
          v40 = 32;
LABEL_55:
          v41 = *(void **)(a1 + v40);
          *(_QWORD *)(a1 + v40) = v39;

          continue;
        case 0x18u:
          v42 = 0;
          v43 = 0;
          v44 = 0;
          *(_BYTE *)(a1 + 84) |= 0x20u;
          while (2)
          {
            v45 = *v3;
            v46 = *(_QWORD *)(a2 + v45);
            if (v46 == -1 || v46 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v47 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v46);
              *(_QWORD *)(a2 + v45) = v46 + 1;
              v44 |= (unint64_t)(v47 & 0x7F) << v42;
              if (v47 < 0)
              {
                v42 += 7;
                v14 = v43++ >= 9;
                if (v14)
                {
                  v44 = 0;
                  goto LABEL_103;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v44 = 0;
LABEL_103:
          v66 = v44 != 0;
          v67 = 80;
          goto LABEL_117;
        case 0x19u:
          v48 = 0;
          v49 = 0;
          v19 = 0;
          *(_BYTE *)(a1 + 84) |= 1u;
          while (2)
          {
            v50 = *v3;
            v51 = *(_QWORD *)(a2 + v50);
            if (v51 == -1 || v51 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v52 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v51);
              *(_QWORD *)(a2 + v50) = v51 + 1;
              v19 |= (unint64_t)(v52 & 0x7F) << v48;
              if (v52 < 0)
              {
                v48 += 7;
                v14 = v49++ >= 9;
                if (v14)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_107;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v19) = 0;
LABEL_107:
          v65 = 8;
LABEL_108:
          *(_DWORD *)(a1 + v65) = v19;
          continue;
        case 0x1Au:
          v53 = 0;
          v54 = 0;
          v55 = 0;
          *(_BYTE *)(a1 + 84) |= 0x40u;
          while (2)
          {
            v56 = *v3;
            v57 = *(_QWORD *)(a2 + v56);
            if (v57 == -1 || v57 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v58 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v57);
              *(_QWORD *)(a2 + v56) = v57 + 1;
              v55 |= (unint64_t)(v58 & 0x7F) << v53;
              if (v58 < 0)
              {
                v53 += 7;
                v14 = v54++ >= 9;
                if (v14)
                {
                  v55 = 0;
                  goto LABEL_112;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v55 = 0;
LABEL_112:
          v66 = v55 != 0;
          v67 = 81;
          goto LABEL_117;
        case 0x1Bu:
          v59 = 0;
          v60 = 0;
          v61 = 0;
          *(_BYTE *)(a1 + 84) |= 0x80u;
          break;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v62 = *v3;
        v63 = *(_QWORD *)(a2 + v62);
        if (v63 == -1 || v63 >= *(_QWORD *)(a2 + *v4))
          break;
        v64 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v63);
        *(_QWORD *)(a2 + v62) = v63 + 1;
        v61 |= (unint64_t)(v64 & 0x7F) << v59;
        if ((v64 & 0x80) == 0)
          goto LABEL_114;
        v59 += 7;
        v14 = v60++ >= 9;
        if (v14)
        {
          v61 = 0;
          goto LABEL_116;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_114:
      if (*(_BYTE *)(a2 + *v5))
        v61 = 0;
LABEL_116:
      v66 = v61 != 0;
      v67 = 82;
LABEL_117:
      *(_BYTE *)(a1 + v67) = v66;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t PREUMResponseItemReadFrom(uint64_t a1, uint64_t a2)
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
  uint64_t v37;
  unint64_t v38;
  char v39;
  char v40;
  unsigned int v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  char v45;
  uint64_t v46;
  BOOL v47;
  uint64_t v48;

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
          *(_BYTE *)(a1 + 24) |= 1u;
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
              goto LABEL_57;
            v17 += 7;
            v14 = v18++ >= 9;
            if (v14)
            {
              LODWORD(v19) = 0;
              goto LABEL_59;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_57:
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v19) = 0;
LABEL_59:
          v46 = 8;
          goto LABEL_68;
        case 2u:
          v24 = 0;
          v25 = 0;
          v19 = 0;
          *(_BYTE *)(a1 + 24) |= 4u;
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
                  LODWORD(v19) = 0;
                  goto LABEL_63;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v19) = 0;
LABEL_63:
          v46 = 16;
          goto LABEL_68;
        case 3u:
          v29 = 0;
          v30 = 0;
          v19 = 0;
          *(_BYTE *)(a1 + 24) |= 2u;
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
                  LODWORD(v19) = 0;
                  goto LABEL_67;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v19) = 0;
LABEL_67:
          v46 = 12;
LABEL_68:
          *(_DWORD *)(a1 + v46) = v19;
          continue;
        case 4u:
          v34 = 0;
          v35 = 0;
          v36 = 0;
          *(_BYTE *)(a1 + 24) |= 8u;
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
              v36 |= (unint64_t)(v39 & 0x7F) << v34;
              if (v39 < 0)
              {
                v34 += 7;
                v14 = v35++ >= 9;
                if (v14)
                {
                  v36 = 0;
                  goto LABEL_72;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v36 = 0;
LABEL_72:
          v47 = v36 != 0;
          v48 = 20;
          goto LABEL_77;
        case 5u:
          v40 = 0;
          v41 = 0;
          v42 = 0;
          *(_BYTE *)(a1 + 24) |= 0x10u;
          break;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v43 = *v3;
        v44 = *(_QWORD *)(a2 + v43);
        if (v44 == -1 || v44 >= *(_QWORD *)(a2 + *v4))
          break;
        v45 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v44);
        *(_QWORD *)(a2 + v43) = v44 + 1;
        v42 |= (unint64_t)(v45 & 0x7F) << v40;
        if ((v45 & 0x80) == 0)
          goto LABEL_74;
        v40 += 7;
        v14 = v41++ >= 9;
        if (v14)
        {
          v42 = 0;
          goto LABEL_76;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_74:
      if (*(_BYTE *)(a2 + *v5))
        v42 = 0;
LABEL_76:
      v47 = v42 != 0;
      v48 = 21;
LABEL_77:
      *(_BYTE *)(a1 + v48) = v47;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_1C35F1158(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C35F2ED8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 96));
  _Unwind_Resume(a1);
}

void sub_1C35F3630(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_list va;

  va_start(va, a14);
  PRERecordMeasurementState((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_1C35F3F80(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 208));
  _Block_object_dispose((const void *)(v2 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_1C35F460C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32)
{
  uint64_t v32;

  _Block_object_dispose(&a26, 8);
  _Block_object_dispose(&a32, 8);
  _Block_object_dispose((const void *)(v32 - 200), 8);
  _Block_object_dispose((const void *)(v32 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1C35F4F04(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 224), 8);
  _Unwind_Resume(a1);
}

void sub_1C35F555C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,id location)
{
  id *v35;
  uint64_t v36;

  objc_destroyWeak(v35);
  objc_destroyWeak(&location);
  _Block_object_dispose((const void *)(v36 - 232), 8);
  _Block_object_dispose((const void *)(v36 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_1C35F56D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C35F5C80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C35F5F00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCKEntityClass_block_invoke_1789(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!ChatKitLibraryCore_frameworkLibrary_1790)
    ChatKitLibraryCore_frameworkLibrary_1790 = _sl_dlopen();
  if (!ChatKitLibraryCore_frameworkLibrary_1790)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *ChatKitLibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("PREResponsesExperiment.m"), 44, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("CKEntity");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getCKEntityClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("PREResponsesExperiment.m"), 45, CFSTR("Unable to find class %s"), "CKEntity");

LABEL_8:
    __break(1u);
  }
  getCKEntityClass_softClass_1788 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __Block_byref_object_copy__1795(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1796(uint64_t a1)
{

}

void sub_1C35F6CE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25)
{
  id *v25;

  objc_destroyWeak(v25);
  _Block_object_dispose(&a25, 8);
  _Unwind_Resume(a1);
}

void sub_1C35F7A54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id *location)
{
  uint64_t v15;

  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v15 - 96));
  _Unwind_Resume(a1);
}

void sub_1C35F8D18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getWRCannedRepliesStoreClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!WatchRepliesLibraryCore_frameworkLibrary)
    WatchRepliesLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!WatchRepliesLibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *WatchRepliesLibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("PREResponsesExperiment.m"), 52, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("WRCannedRepliesStore");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getWRCannedRepliesStoreClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("PREResponsesExperiment.m"), 53, CFSTR("Unable to find class %s"), "WRCannedRepliesStore");

LABEL_8:
    __break(1u);
  }
  getWRCannedRepliesStoreClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t PBDataWriterWriteBOOLField()
{
  return MEMORY[0x1E0D82C10]();
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

uint64_t PBDataWriterWriteUint32Field()
{
  return MEMORY[0x1E0D82CB8]();
}

uint64_t PBDataWriterWriteUint64Field()
{
  return MEMORY[0x1E0D82CC0]();
}

uint64_t PBReaderPlaceMark()
{
  return MEMORY[0x1E0D82CE0]();
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

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81040](dso, log, type, format, buf, *(_QWORD *)&size);
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

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1E0C82C60](flags, block);
}

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1E0C82C68](flags, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority, block);
}

intptr_t dispatch_block_wait(dispatch_block_t block, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82C98](block, timeout);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1E0C82EB8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1E0C82EC8](dsema);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1E0C83C50]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1E0C83DB8](info);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

void objc_terminate(void)
{
  MEMORY[0x1E0DE7FD8]();
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1E0C84920](log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x1E0C84930](log, ptr);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E18](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x1E0C84E20](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E28](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E38](a1);
}

